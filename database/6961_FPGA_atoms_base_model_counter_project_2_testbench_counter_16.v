// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

`timescale 1ns/1ps
module testbench_counter_16(

);

parameter CLK_PERIOD = 10;

reg         clk;
reg         rst;
reg  [15:0]  pulse;
reg         en_count;
    wire      [15:0]   count1;
    wire      [15:0]   count2;
    wire      [15:0]   count3;
    wire      [15:0]   count4;
    wire      [15:0]   count5;
    wire      [15:0]   count6;
    wire      [15:0]   count7;
    wire      [15:0]   count8;
    wire      [15:0]   count9;
    wire      [15:0]   counta;
    wire      [15:0]   countb;
    wire      [15:0]   countc;
    wire      [15:0]   countd;
    wire      [15:0]   counte;
    wire      [15:0]   countf;
    wire      [15:0]   countg;

// 连接测试模块
top_counter_16 top_counter_test(
    .clk        (clk),
    .rst        (rst),
    .pulse      (pulse),
    .en_count   (en_count),
    .count1     (count1),
    .count2     (count2),
    .count3     (count3),
    .count4     (count4),
    .count5     (count5),
    .count6     (count6),
    .count7     (count7),
    .count8     (count8),
    .count9     (count9),
    .counta     (counta),
    .countb     (countb),
    .countc     (countc),
    .countd     (countd),
    .counte     (counte),
    .countf     (countf),
    .countg     (countg)
);

// 初始化复位和时钟
initial begin
    clk <= 0;
    rst <= 0;
    #1000
    rst <= 1;
end

always #(CLK_PERIOD/2) clk = ~clk;

// 产生测试激励
integer i;                      // 定义为整数类型，此类型为寄存器类型，且无不定态

initial begin
    en_count <= 0;
    pulse <= 'b0;

    @(posedge rst);

    @(posedge clk);
    #10;
    en_count <= 1;
    repeat(1000) begin
        @(posedge clk);
    end
    en_count <= 0;

    
    en_count <= 1'b1;
	for(i=0; i<50; i=i+1) begin
		#500;
		pulse <= {$random} % 65535;         // 有大括号表示产生 0-65535 随机数
                                            // num = $random%b 表示产生 -(b-1) 到 (b-1) 之间的随机数
		#300;
		pulse <= 'b0;
	end
	en_count <= 1'b0;	
	#10_000;
	
	en_count <= 1'b1;
	for(i=0; i<69; i=i+1) begin
		#500;
		pulse <= {$random} % 65535;
		#300;
		pulse <= 'b0;
	end
	en_count <= 1'b0;	
	#10_000;	
	
	en_count <= 1'b0;
	for(i=0; i<15; i=i+1) begin
		#500;
		pulse <= {$random} % 65535;
		#300;
		pulse <= 'b0;
	end
	en_count <= 1'b0;	
	
    

    #10000;

    $stop;
end



endmodule