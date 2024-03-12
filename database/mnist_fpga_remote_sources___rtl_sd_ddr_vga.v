`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    sd_ddr_vga 
//////////////////////////////////////////////////////////////////////////////////
module sd_ddr_vga(
   input clk_50M,
	input reset_n,
   output [3:0] led                  //ledµ∆÷∏ æ
		
    );

wire [22:0] result1;
wire [22:0] result2;
wire [22:0] result3;
wire [22:0] result4;
wire [22:0] result5;
wire [22:0] result6;
wire [22:0] result7;
wire [22:0] result8;
wire [22:0] result9;
wire [22:0] result10;



assign led = 4'b0101;              //ÀÊ“‚¡¡

cnn_structure cnn_inst(
	.cnn_clk           (clk_50M),
	
	.result1           (result1),
	.result2           (result2),
	.result3           (result3),
	.result4           (result4),
	.result5           (result5),
	.result6           (result6),
	.result7           (result7),
	.result8           (result8),
	.result9           (result9),
	.result10          (result10)
	

);


wire [35:0]   CONTROL0;
wire [255:0]  TRIG0;
chipscope_icon icon_debug (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila ila_filter_debug (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(clk_50M),      // IN
    .TRIG0(TRIG0)      // IN BUS [255:0]
    //.TRIG_OUT(TRIG_OUT0)
);                                                  
                                                       

assign  TRIG0[22:0]=result1;
assign  TRIG0[45:23]=result2;
assign  TRIG0[68:46]=result3;
assign  TRIG0[91:69]=result4;
assign  TRIG0[114:92]=result5;  
assign  TRIG0[137:115]=result6;  
assign  TRIG0[160:138]=result7;
assign  TRIG0[183:161]=result8;
assign  TRIG0[206:184]=result9;
assign  TRIG0[229:207]=result10;
                                          


endmodule
