// This program was cloned from: https://github.com/Men1scus/Principles_of_Computer_Organization
// License: MIT License

`timescale 1ns / 1ps
//*************************************************************************
//   > 文件名: multiply.v
//   > 描述  ：乘法器模块，低效率的迭代乘法算法，使用两个乘数绝对值参与运算
//   > 作者  : LOONGSON
//   > 日期  : 2016-04-14
//*************************************************************************
module multiply(              // 乘法器
    input         clk,        // 时钟
    input         mult_begin, // 乘法开始信号
    input  [31:0] mult_op1,   // 乘法源操作数1
    input  [31:0] mult_op2,   // 乘法源操作数2
    output [63:0] product,    // 乘积
    output        mult_end    // 乘法结束信号 为0时product才是最终乘积，判断是否正确的乘积是mult_end为1的乘积
);

    //乘法正在运算信号和结束信号
    reg mult_valid;
    assign mult_end = mult_valid & ~(|multiplier); //乘法结束信号：乘数全0
  	// |或缩减运算符，只有multiplier是全0的时候整体才是0
    always @(posedge clk)
    begin
      if (!mult_begin || mult_end)  //判断是在过程内还是过程外
        begin
            mult_valid <= 1'b0;
        end
        else
        begin
            mult_valid <= 1'b1;
        end
    end

    //两个源操作取绝对值，正数的绝对值为其本身，负数的绝对值为取反加1
    wire        op1_sign;      //操作数1的符号位
    wire        op2_sign;      //操作数2的符号位
    wire [31:0] op1_absolute;  //操作数1的绝对值
    wire [31:0] op2_absolute;  //操作数2的绝对值
    assign op1_sign = mult_op1[31];
    assign op2_sign = mult_op2[31];
  	assign op1_absolute = op1_sign ? (~mult_op1+1) : mult_op1; // 是1就按位取反
    assign op2_absolute = op2_sign ? (~mult_op2+1) : mult_op2;

    // //加载被乘数，运算时每次左移一位
    // reg  [63:0] multiplicand;
    // always @ (posedge clk)
    // begin
    //     if (mult_valid)
    //     begin    // 如果正在进行乘法，则被乘数每时钟左移一位
    //         multiplicand <= {multiplicand[62:0],1'b0}; // 拼接，补零
    //     end
    //     else if (mult_begin) 
    //     begin   // 乘法开始，加载被乘数，为乘数1的绝对值
    //         multiplicand <= {32'd0,op1_absolute};
    //     end
    // end

     //加载被乘数，运算时每次左移2位
    reg  [63:0] multiplicand;
    always @ (posedge clk)
    begin
        if (mult_valid)
        begin    // 如果正在进行乘法，则被乘数每时钟左移2位
            multiplicand <= {multiplicand[61:0], 2'b00}; // 拼接，补零
        end
        else if (mult_begin) 
        begin   // 乘法开始，加载被乘数，为乘数1的绝对值
            multiplicand <= {32'd0, op1_absolute};
        end
    end

    // //加载乘数，运算时每次右移一位
    // reg  [31:0] multiplier;
    // always @ (posedge clk)
    // begin
    //     if (mult_valid)
    //     begin   // 如果正在进行乘法，则乘数每时钟右移一位
    //         multiplier <= {1'b0,multiplier[31:1]}; 
    //     end
    //     else if (mult_begin)
    //     begin   // 乘法开始，加载乘数，为乘数2的绝对值
    //         multiplier <= op2_absolute; 
    //     end
    // end

    //加载乘数，运算时每次右移2位
    reg  [31:0] multiplier;
    always @ (posedge clk)
    begin
        if (mult_valid)
        begin   // 如果正在进行乘法，则乘数每时钟右移2位
            multiplier <= {2'b00,multiplier[31:2]}; 
        end
        else if (mult_begin)
        begin   // 乘法开始，加载乘数，为乘数2的绝对值
            multiplier <= op2_absolute; 
        end
    end
    
    // 部分积：乘数末位为1，由被乘数左移得到；乘数末位为0，部分积为0
    wire [63:0] partial_product;
    wire [63:0] partial_product2;

    assign partial_product = multiplier[0] ? multiplicand : 64'd0;
    assign partial_product2 = multiplier[1] ? (multiplicand << 1) : 64'd0;

    //累加器
    reg [63:0] product_temp;
    always @ (posedge clk)
    begin
        if (mult_valid)
        begin
            // product_temp <= product_temp + partial_product;
            product_temp <= product_temp + partial_product + partial_product2;
        end
        else if (mult_begin) 
        begin
            product_temp <= 64'd0;  // 乘法开始，乘积清零 
        end
    end 
     
    //乘法结果的符号位和乘法结果
    reg product_sign;
    always @ (posedge clk)  // 乘积
    begin
        if (mult_valid)
        begin
              product_sign <= op1_sign ^ op2_sign;
        end
    end 
    //若乘法结果为负数，则需要对结果取反+1
    assign product = product_sign ? (~product_temp+1) : product_temp;
endmodule