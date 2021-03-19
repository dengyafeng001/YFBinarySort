//
//  YFMakeOrderFile.m
//  Pods
//
//  Created by dyf on 2021/3/19.
//

#import "YFMakeOrderFile.h"

#if __x86_64__
#include <sanitizer/coverage_interface.h>
#import <dlfcn.h>
#import <libkern/OSAtomic.h>
#endif

@implementation YFMakeOrderFile

#if __x86_64__
//定义原子队列
static OSQueueHead symbolList = OS_ATOMIC_QUEUE_INIT;
static BOOL isOver = NO;
//定义符号结构体
typedef struct{
    void *pc;
    void *next;
} SYNode;
#endif

void __sanitizer_cov_trace_pc_guard_init(uint32_t *start, uint32_t *stop) {
#if __x86_64__
  static uint32_t N;  // Counter for the guards.
  if (start == stop || *start) return;  // Initialize only once.
  printf("INIT: %p %p\n", start, stop);
  for (uint32_t *x = start; x < stop; x++)
    *x = ++N;
#endif
}

void __sanitizer_cov_trace_pc_guard(uint32_t *guard) {
#if __x86_64__
    if (isOver) return;
    //获取当前函数返回到上一个调用的地址!!
    void *PC = __builtin_return_address(0);
    //创建结构体!
    SYNode * node = malloc(sizeof(SYNode));
    *node = (SYNode){PC,NULL};
    //加入结构!
    OSAtomicEnqueue(&symbolList, node, offsetof(SYNode, next));
#endif
}

//生成符号文件
+ (void)getOrderFile {
#if __x86_64__
    isOver = YES;
    NSMutableArray<NSString *> * symbolNames = [NSMutableArray array];
    while (YES) {
       SYNode * node = OSAtomicDequeue(&symbolList, offsetof(SYNode, next));
        if (node == NULL) {
            break;
        }
        Dl_info info = {0};
        dladdr(node->pc, &info);
        NSString * name = @(info.dli_sname);
        free(node);

        BOOL isObjc = [name hasPrefix:@"+["]||[name hasPrefix:@"-["];
        NSString * symbolName = isObjc ? name : [@"_" stringByAppendingString:name];
        [symbolNames addObject:symbolName];
    }
    //反向数组
    NSEnumerator * enumerator = [symbolNames reverseObjectEnumerator];
    //创建一个新数组
    NSMutableArray * funcs = [NSMutableArray arrayWithCapacity:symbolNames.count];
    NSString *name;
    while (name = [enumerator nextObject]) {
        if (![funcs containsObject:name]) {//数组中不包含name
            [funcs addObject:name];
        }
    }
    //移除最后一个方法，因为是调用getOrderFile
    [funcs removeLastObject];
    //数组转成字符串
    NSString * funcStr = [funcs componentsJoinedByString:@"\n"];
    //字符串写入文件
    NSString * filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"ret.order"];
    //文件内容
    NSData * fileContents = [funcStr dataUsingEncoding:NSUTF8StringEncoding];
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:fileContents attributes:nil];
    NSLog(@"文件生成路径：%@", filePath);
#endif
}

@end
