// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : convert2avl_stream                //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 27.02.2018                        //
//Last revision : 06.03.2018                        //
//////////////////////////////////////////////////////
module convert2avl_stream
(
	input wire         pclk   ,
	input wire         clk_sys,
	input wire         reset_n,
	input wire         VSYNC  ,
	input wire         HREF   ,
	input wire [7:0]   D1     ,
	input wire [7:0]   D2     ,
	
	output logic [7:0] Y1     ,
	output logic [7:0] CbCr1  ,
	output logic [7:0] Y2     ,
	output logic [7:0] CbCr2  ,
	output logic       validY ,
	output logic       validCb,
	output logic       validCr,
	output logic       SOF    ,
	output logic       EOF
);
reg [9:0] reg_Y1;
reg [9:0] reg_Y2;
reg [7:0] reg_Cb1;
reg [7:0] reg_Cb2;
reg [7:0] reg_Cr1;
reg [7:0] reg_Cr2;
reg sh_VSYNC;
reg sh_HREF;		
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		sh_VSYNC <=1'b0;
	else 
		sh_VSYNC <=VSYNC;
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		sh_HREF <=1'b0;
	else 
		sh_HREF <=HREF;
		
wire p_VSYNC = VSYNC & ! sh_VSYNC;		
wire p_HREF  = HREF & ! sh_HREF;
reg [1:0] counter_comp;
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		counter_comp <='0;
	else if(HREF)
		counter_comp <= counter_comp +1;
wire valid_Y;
reg valid_Cb;
wire valid_Cr;
reg [11:0] count_data_dvp;
wire last_data = ( count_data_dvp == 12'd2558 );
reg sh_last_data;
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		reg_Y1 <='0;
	else if(p_HREF)
		reg_Y1 <= {2'b01, D1};
	else if(last_data)
		reg_Y1 <= {2'b10, D1};
	else if(!counter_comp[0])
		reg_Y1 <= {2'b00, D1};

always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		reg_Y2 <='0;
	else if(p_HREF)
		reg_Y2 <= {2'b01, D2};
	else if(last_data)
		reg_Y2 <= {2'b10, D2};
	else if(!counter_comp[0])
		reg_Y2 <= {2'b00, D2};
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		reg_Cb1 <='0;
	else if(counter_comp == 2'd1)
		reg_Cb1 <= D1;	

always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		reg_Cb2 <='0;
	else if(counter_comp == 2'd1)
		reg_Cb2 <= D2;	
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		reg_Cr1 <='0;
	else if(counter_comp == 2'd3)
		reg_Cr1 <= D1;	
		
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		reg_Cr2 <='0;
	else if(counter_comp == 2'd3)
		reg_Cr2 <= D2;	
		
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		sh_last_data <='0;
	else 
		sh_last_data <= last_data;	
//assign EOF	 = counter_pixels;	

always @(posedge pclk, negedge reset_n)
	if(!reset_n)
		count_data_dvp <='0;
	else if(sh_last_data)
		count_data_dvp <='0;
	else if(HREF)
		count_data_dvp <= count_data_dvp + 1;		
reg div_pclk;
reg sh_div_pclk;
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		div_pclk <='0;
	else if(p_HREF)
		div_pclk <= 0;
	else if(HREF)
		div_pclk <= ~div_pclk;
	else
		div_pclk <=0;
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		sh_div_pclk <='0;
	else
		sh_div_pclk <= div_pclk;		
reg[17:0] data_fifo1_in;
reg[17:0] data_fifo2_in;
reg [1:0] sh_counter_comp;

always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		sh_counter_comp <='0;
	else
		sh_counter_comp <= counter_comp;
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		data_fifo1_in <='0;
	else if(sh_counter_comp == 2'd1)
		data_fifo1_in <= {reg_Cb1, reg_Y1};
	else if(sh_counter_comp == 2'd3)
		data_fifo1_in <= {reg_Cr1, reg_Y1};
always @(posedge pclk or negedge reset_n)
	if (~reset_n )
		data_fifo2_in <='0;
	else if(sh_counter_comp == 2'd1)
		data_fifo2_in <= {reg_Cb2, reg_Y2};
	else if(sh_counter_comp == 2'd3)
		data_fifo2_in <= {reg_Cr2, reg_Y2};		

wire empty1;		
wire empty2;		
wire rdreq1 =  !empty1;		
wire rdreq2 =  !empty2;		
wire [17:0]data_fifo_out1;	
wire [17:0]data_fifo_out2;	

reg [2:0] sh_reg;
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		sh_reg <='0;
	else 
		sh_reg <={sh_reg[1:0],rdreq1};
fifo_dvp  fifo_dvp_image1 
(
	.wrclk   (pclk           ),
	.rdclk   (clk_sys        ),
	.data    (data_fifo1_in   ),
	.rdreq   (rdreq1         ),//
	.wrreq   (sh_div_pclk       ),
	.rdempty (empty1          ),
	.wrfull  (           ),
	.q       (data_fifo_out1 ),
	.rdusedw (          )
);	

fifo_dvp  fifo_dvp_image2
(
	.wrclk   (pclk           ),
	.rdclk   (clk_sys        ),
	.data    (data_fifo2_in   ),
	.rdreq   (rdreq2         ),//
	.wrreq   (sh_div_pclk       ),
	.rdempty (empty2          ),
	.wrfull  (           ),
	.q       (data_fifo_out2 ),
	.rdusedw (          )
);	

assign validY = sh_reg[0];
assign Y1    = data_fifo_out1[7:0];
assign Y2    = data_fifo_out2[7:0];
assign CbCr1 = data_fifo_out1[17:10];
assign CbCr2 = data_fifo_out2[17:10];

assign SOF	 = data_fifo_out1[8] & sh_reg[0];	
assign EOF	 = data_fifo_out1[9] & sh_reg[0];	
reg reg_validC;
assign validCb = SOF  | (validY & !reg_validC);
assign validCr = EOF  | (validY & reg_validC);
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		reg_validC <='0;
	else if(SOF)
		reg_validC <=1;
	else if(validY)
		reg_validC <=~reg_validC;

endmodule