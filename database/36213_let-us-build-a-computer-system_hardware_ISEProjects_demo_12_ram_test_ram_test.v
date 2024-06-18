// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
module ram_test(
			input clk,		          //50MHz时钟
			input rst_n	             //复位信号，低电平有效	
		);

//-----------------------------------------------------------
reg[8:0]  w_addr;	   //RAM写地址
reg[15:0] w_data;	   //RAM写数据
reg       wea;	      //RAM PORTA 使能
reg[8:0]  r_addr;	   //RAM读地址
wire[15:0] r_data;	//RAM读数据

//产生RAM地址读取数据测试
always @(posedge clk or negedge rst_n)
  if(rst_n==1'b0) 
	   r_addr <= 9'd0;
  else 
      r_addr <= r_addr+1'b1;


///产生RAM写入的数据
always@(posedge clk or negedge rst_n)
begin	
  if(rst_n==1'b0) begin
  	  wea <= 1'b0;
     w_addr <= 9'd0;
	  w_data <= 16'd0;
  end
  else begin
     if(w_addr==511) begin    //ram写入完毕
        wea <= 1'b0;                 
     end
     else begin                    
        wea<=1'b1;              //ram写使能
		  w_addr <= w_addr + 1'b1;
		  w_data <= w_data + 1'b1;
	  end
  end 
end 

//-----------------------------------------------------------
//实例化RAM	
ram_ip ram_ip_inst (
  .clka      (clk          ),     // input clka
  .wea       (wea          ),     // input [0 : 0] wea
  .addra     (w_addr       ),     // input [8 : 0] addra
  .dina      (w_data       ),     // input [15 : 0] dina
  .clkb      (clk          ),     // input clkb
  .addrb     (r_addr       ),     // input [8 : 0] addrb
  .doutb     (r_data       )      // output [15 : 0] doutb
);


wire [35:0]   CONTROL0;
wire [255:0]  TRIG0;
chipscope_icon icon_debug (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila ila_filter_debug (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
    .CLK(clk),          // IN
    .TRIG0(TRIG0)      // IN BUS [255:0]
);                                                     

assign  TRIG0[15:0]=r_data;  
assign  TRIG0[24:16]=r_addr;  	
	
endmodule


