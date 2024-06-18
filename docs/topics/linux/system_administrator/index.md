# 系统管理员

## gcc编译

### 编译单一程序

```shell
# 编译c语言源码
gcc hello.c

# 向生成hello.o目标文件，再生成hello可执行文件
gcc -c hello.c
gcc -o hello hello.o
```

### 主、子程序链接

假设主程序和子程序如下：

```c title="thanks.c"
#include <stdio.h>
int main(void)
{
        printf("Hello World\n");
        thanks_2();
}
```

```c title="thanks_2.c"
#include <stdio.h>
void thanks_2(void)
{
        printf("Thank you!\n");
}
```

编译过程如下：

```shell
# 第一步：先生成thanks.o和thanks_2.o目标文件
gcc -c thanks.c thanks_2.c
# 第二步：以链接制作可执行文件thanks
gcc -o thanks thanks.o thanks_2.o
```

### 调用外部函数库

```shell
# -lm：l表示链接库，m是库的名字（libm.so,其中lib和so都省略调了）
# -L/lib -L/lib64表示在指定位置查找库，因为/lib和/lib64是默认库路径，因此可以省略配置
# -I后面跟头文件搜索路径
gcc sin.c -lm -L/lib -L/lib64 -I/usr/include
```
