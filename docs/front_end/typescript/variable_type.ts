// 声明一个数值类型的变量
let num: number;
num = 10; //可以给num赋值10
//num = "hello"; //❌报错：TS2322: Type string is not assignable to type number

// 声明并赋值一个字符串类型的变量
let str: string;
str = "hello";

// 声明并赋值布尔值类型
let bool = true; // 如果不指明类型，则以第一次赋值的类型为准

/*
* 声明一个函数
* 两个参数类型规定为数值型
* 返回值也规定为数值型
* */
function add(a: number, b: number): number {
    return a + b;
}
