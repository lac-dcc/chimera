// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module rom_test(
			input clk,		          //50MHz时钟
			input rst_n  	          //复位信号，低电平有效	
		);

//-----------------------------------------------------------
reg[4:0] rom_addr;	//ROM输入地址
wire[7:0] rom_data;	//ROM的数据

//产生ROM地址读取数据测试
always @(posedge clk or negedge rst_n)
	if(rst_n==1'b0)
	     rom_addr <= 10'd0;
	else 
	     rom_addr <= rom_addr+1'b1;


//-----------------------------------------------------------
//实例化ROM	

rom_ip  	rom_ip_inst
(
	.clka     (clk         ), // input clka
	.addra    (rom_addr    ), // input [4 : 0] addra
	.douta    (rom_data    ) // output [7 : 0] douta
);
	

wire [35:0]   CONTROL0;
wire [255:0]  TRIG0;
chipscope_icon icon_debug (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila ila_filter_debug (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(clk),      // IN
    .TRIG0(TRIG0)      // IN BUS [255:0]
);                                                     

assign  TRIG0[7:0]=rom_data;  
assign  TRIG0[12:8]=rom_addr;  	
	
endmodule


