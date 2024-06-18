// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//
// 用自然二进制前一项与该项异或产生格雷码该位的方法实现格雷码，验证平台代码
//

`timescale 1ns/1ps
module testbench_gray(

);

parameter CLK_PERIOD = 10;
parameter GRAY_MSB = 4;

reg                 clk;
reg                 rst;
reg                 i_en;
reg  [GRAY_MSB-1:0] i_data;
wire                o_valid;
wire [GRAY_MSB-1:0] o_data;

// 连接测试模块
gray #(
    .MSB        (GRAY_MSB)
)
gray_test(
    .clk        (clk),
    .rst        (rst),
    .i_en       (i_en),
    .i_data     (i_data),
    .o_valid    (o_valid),
    .o_data     (o_data)
);

// 初始化信号和时钟
initial begin
    rst <= 0;
    clk <= 0;
    i_en <= 0;
    i_data <= 'b0;
    # 1000;
    rst <= 1;

    #10000;
    $fclose(wfile);
    $stop;
end
always #(CLK_PERIOD/2) clk=~clk;

// 添加测试激励
integer i;
initial begin
    @(posedge rst);

    // 使能信号
    #300;
    i_en <= 1;
    /*
    for(i=0;i<=5;i=i+1) begin
        //#500;
        i_en <= 1;
        #1000;
        i_en <= 0;
        #300;
    end
    */
end
initial begin
    @(posedge rst);
    #500;
    @(posedge clk);
    
    /*
    // 数据信号
    repeat(2**(GRAY_MSB+1)-1) begin
		@(posedge clk);
		i_data <= i_data + 1'b1;
	end
*/
    
    for(i=0;i<=50;i=i+1) begin
        @(posedge clk);
        #(CLK_PERIOD*8);
        i_data <= i_data + 1'b1;
        @(posedge clk);
        $monitor("bin is %b, gray is %b, time is %d.",i_data,o_data,$time);
    end
    
end


/*
always @(posedge clk) begin
	if(o_valid) $display("%b",o_data);
	else ;
end
*/

integer wfile;
initial begin
    wfile = $fopen("C:/Users/YiMon/source/repos/MyVerilogLearning/solution_1/RTL/output_file/testbench_gray_data.txt","w");
end

always@(posedge clk) begin
    if(o_valid) $fwrite(wfile,"%b\n",o_data);
end

endmodule
