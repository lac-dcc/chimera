//****************************************Copyright (c)***********************************//                            
//----------------------------------------------------------------------------------------
// File name:          seg_led
// Last modified Date:  2021/6/10 11:28:58
// Last Version:        V1.0
// Descriptions:        sobel
//----------------------------------------------------------------------------------------
// Created by:          emb_hh
// Created date:        2021/6/10 11:28:58
// Version:             V1.0
// Descriptions:        数码管动态显示模块
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//


module seg_led(
    input                   clk    ,        // 时钟信号
    input                   rst_n  ,        // 复位信号

    input         [19:0]    data   ,        // 6位数码管要显示的数值
    input         [5:0]     point  ,        // 小数点具体显示的位置,从高到低,高电平有效
    input                   en     ,        // 数码管使能信号
    input                   sign   ,        // 符号位（高电平显示“-”号）

    output   reg  [5:0]     seg_sel,        // 数码管位选，最左侧数码管为最高位
    output   reg  [7:0]     seg_led         // 数码管段选
    );

//parameter define
localparam  CLK_DIVIDE = 4'd10     ;        // 时钟分频系数
localparam  MAX_NUM    = 13'd5000  ;        // 对数码管驱动时钟(5MHz)计数1ms所需的计数值

//reg define
reg    [ 3:0]             clk_cnt  ;        // 时钟分频计数器
reg                       dri_clk  ;        // 数码管的驱动时钟,5MHz
reg    [23:0]             num      ;        // 24位bcd码寄存器
reg    [12:0]             cnt0     ;        // 数码管驱动时钟计数器
reg                       flag     ;        // 标志信号（标志着cnt0计数达1ms）
reg    [2:0]              cnt_sel  ;        // 数码管位选计数器
reg    [3:0]              num_disp ;        // 当前数码管显示的数据
reg                       dot_disp ;        // 当前数码管显示的小数点

//wire define
wire   [3:0]              data0    ;        // 个位数
wire   [3:0]              data1    ;        // 十位数
wire   [3:0]              data2    ;        // 百位数
wire   [3:0]              data3    ;        // 千位数
wire   [3:0]              data4    ;        // 万位数
wire   [3:0]              data5    ;        // 十万位数

//*****************************************************
//**                    main code
//*****************************************************

//提取显示数值所对应的十进制数的各个位
assign  data0 = data % 4'd10;               // 个位数
assign  data1 = data / 4'd10 % 4'd10   ;    // 十位数
assign  data2 = data / 7'd100 % 4'd10  ;    // 百位数
assign  data3 = data / 10'd1000 % 4'd10 ;   // 千位数
assign  data4 = data / 14'd10000 % 4'd10;   // 万位数
assign  data5 = data / 17'd100000;          // 十万位数

//对系统时钟10分频，得到的频率为5MHz的数码管驱动时钟dri_clk
always @(posedge clk or negedge rst_n) begin
   if(!rst_n) begin
       clk_cnt <= 4'd0;
       dri_clk <= 1'b1;
   end
   else if(clk_cnt == CLK_DIVIDE/2 - 1'd1) begin
       clk_cnt <= 4'd0;
       dri_clk <= ~dri_clk;
   end
   else begin
       clk_cnt <= clk_cnt + 1'b1;
       dri_clk <= dri_clk;
   end
end

//将20位2进制数转换为8421bcd码(即使用4位二进制数表示1位十进制数）
always @ (posedge dri_clk or negedge rst_n) begin
    if (!rst_n)
        num <= 24'b0;
    else begin
        if (data5 || point[5]) begin     //如果显示数据为6位十进制数，
            num[23:20] <= data5;         //则依次给6位数码管赋值
            num[19:16] <= data4;
            num[15:12] <= data3;
            num[11:8]  <= data2;
            num[ 7:4]  <= data1;
            num[ 3:0]  <= data0;
        end
        else begin                         
            if (data4 || point[4]) begin //如果显示数据为5位十进制数，则给低5位数码管赋值
                num[19:0] <= {data4,data3,data2,data1,data0};
                if(sign)                    
                    num[23:20] <= 4'd11; //如果需要显示负号，则最高位（第6位）为符号位
                else
                    num[23:20] <= 4'd10; //不需要显示负号时，则第6位不显示任何字符
            end
            else begin                   //如果显示数据为4位十进制数，则给低4位数码管赋值
                if (data3 || point[3]) begin
                    num[15: 0] <= {data3,data2,data1,data0};
                    num[23:20] <= 4'd10; //第6位不显示任何字符
                    if(sign)             //如果需要显示负号，则最高位（第5位）为符号位
                        num[19:16] <= 4'd11;
                    else                 //不需要显示负号时，则第5位不显示任何字符
                        num[19:16] <= 4'd10;
                end
                else begin               //如果显示数据为3位十进制数，则给低3位数码管赋值
                    if (data2 || point[2]) begin
                        num[11: 0] <= {data2,data1,data0};
                                         //第6、5位不显示任何字符
                        num[23:16] <= {2{4'd10}};
                        if(sign)         //如果需要显示负号，则最高位（第4位）为符号位
                            num[15:12] <= 4'd11;
                        else             //不需要显示负号时，则第4位不显示任何字符
                            num[15:12] <= 4'd10;
                    end
                    else begin           //如果显示数据为2位十进制数，则给低2位数码管赋值
                        if (data1 || point[1]) begin
                            num[ 7: 0] <= {data1,data0};
                                         //第6、5、4位不显示任何字符
                            num[23:12] <= {3{4'd10}};
                            if(sign)     //如果需要显示负号，则最高位（第3位）为符号位
                                num[11:8]  <= 4'd11;
                            else         //不需要显示负号时，则第3位不显示任何字符
                                num[11:8] <=  4'd10;
                        end
                        else begin       //如果显示数据为1位十进制数，则给最低位数码管赋值
                            num[3:0] <= data0;
                                         //第6、5位不显示任何字符
                            num[23:8] <= {4{4'd10}};
                            if(sign)     //如果需要显示负号，则最高位（第2位）为符号位
                                num[7:4] <= 4'd11;
                            else         //不需要显示负号时，则第2位不显示任何字符
                                num[7:4] <= 4'd10;
                        end
                    end
                end
            end
        end
    end
end

//每当计数器对数码管驱动时钟计数时间达1ms，输出一个时钟周期的脉冲信号
always @ (posedge dri_clk or negedge rst_n) begin
    if (rst_n == 1'b0) begin
        cnt0 <= 13'b0;
        flag <= 1'b0;
     end
    else if (cnt0 < MAX_NUM - 1'b1) begin
        cnt0 <= cnt0 + 1'b1;
        flag <= 1'b0;
     end
    else begin
        cnt0 <= 13'b0;
        flag <= 1'b1;
     end
end

//cnt_sel从0计数到5，用于选择当前处于显示状态的数码管
always @ (posedge dri_clk or negedge rst_n) begin
    if (rst_n == 1'b0)
        cnt_sel <= 3'b0;
    else if(flag) begin
        if(cnt_sel < 3'd5)
            cnt_sel <= cnt_sel + 1'b1;
        else
            cnt_sel <= 3'b0;
    end
    else
        cnt_sel <= cnt_sel;
end

//控制数码管位选信号，使6位数码管轮流显示
always @ (posedge dri_clk or negedge rst_n) begin
    if(!rst_n) begin
        seg_sel  <= 6'b111111;              //位选信号低电平有效
        num_disp <= 4'b0;           
        dot_disp <= 1'b1;                   //共阳极数码管，低电平导通
    end
    else begin
        if(en) begin
            case (cnt_sel)
                3'd0 :begin
                    seg_sel  <= 6'b111110;  //显示数码管最低位
                    num_disp <= num[3:0] ;  //显示的数据
                    dot_disp <= ~point[0];  //显示的小数点
                end
                3'd1 :begin
                    seg_sel  <= 6'b111101;  //显示数码管第1位
                    num_disp <= num[7:4] ;
                    dot_disp <= ~point[1];
                end
                3'd2 :begin
                    seg_sel  <= 6'b111011;  //显示数码管第2位
                    num_disp <= num[11:8];
                    dot_disp <= ~point[2];
                end
                3'd3 :begin
                    seg_sel  <= 6'b110111;  //显示数码管第3位
                    num_disp <= num[15:12];
                    dot_disp <= ~point[3];
                end
                3'd4 :begin
                    seg_sel  <= 6'b101111;  //显示数码管第4位
                    num_disp <= num[19:16];
                    dot_disp <= ~point[4];
                end
                3'd5 :begin
                    seg_sel  <= 6'b011111;  //显示数码管最高位
                    num_disp <= num[23:20];
                    dot_disp <= ~point[5];
                end
                default :begin
                    seg_sel  <= 6'b111111;
                    num_disp <= 4'b0;
                    dot_disp <= 1'b1;
                end
            endcase
        end
        else begin
            seg_sel  <= 6'b111111;          //使能信号为0时，所有数码管均不显示
            num_disp <= 4'b0;
            dot_disp <= 1'b1;
        end
    end
end

//控制数码管段选信号，显示字符
always @ (posedge dri_clk or negedge rst_n) begin
    if (!rst_n)
        seg_led <= 8'hc0;
    else begin
        case (num_disp)
            4'd0 : seg_led <= {dot_disp,7'b1000000}; //显示数字 0
            4'd1 : seg_led <= {dot_disp,7'b1111001}; //显示数字 1
            4'd2 : seg_led <= {dot_disp,7'b0100100}; //显示数字 2
            4'd3 : seg_led <= {dot_disp,7'b0110000}; //显示数字 3
            4'd4 : seg_led <= {dot_disp,7'b0011001}; //显示数字 4
            4'd5 : seg_led <= {dot_disp,7'b0010010}; //显示数字 5
            4'd6 : seg_led <= {dot_disp,7'b0000010}; //显示数字 6
            4'd7 : seg_led <= {dot_disp,7'b1111000}; //显示数字 7
            4'd8 : seg_led <= {dot_disp,7'b0000000}; //显示数字 8
            4'd9 : seg_led <= {dot_disp,7'b0010000}; //显示数字 9
            4'd10: seg_led <= 8'b11111111;           //不显示任何字符
            4'd11: seg_led <= 8'b10111111;           //显示负号(-)
            default: 
                   seg_led <= {dot_disp,7'b1000000};
        endcase
    end
end

endmodule 