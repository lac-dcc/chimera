// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : convert2avl_stream_raw            //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 27.02.2018                        //
//Last revision : 30.04.2018                        //
//////////////////////////////////////////////////////
module convert2avl_stream_raw
(
	input wire             pclk_1   	    ,
	input wire             pclk_2   	    ,
	input wire             clk_sys	        ,
	input wire             reset_n	        ,
	input wire             _ready_read      ,
	input wire             _ready_read2     ,
	input wire             VSYNC_1  	    ,
	input wire             VSYNC_2  	    ,
	input wire             HREF_1   	    ,
	input wire             HREF_2   	    ,
	input wire   [7:0]     D1     	        ,
	input wire   [7:0]     D2     	        ,	                               
	output logic [7:0]     RAW_1            ,
	output logic [7:0]     RAW_2            ,
	output logic           valid_RAW        ,                                       
	output logic           start_frame2     ,
	output logic           SOF    	        ,
	output logic           EOF    	        ,
	output logic           err_ch0    	    ,
	output logic           err_ch1    	    ,
	output logic           start_frame      ,
	output logic [63:0]    data_ddr         ,
	output logic [ 7:0]    count_frame_1    ,
	output logic [ 7:0]    count_frame_2    ,
	output logic [ 9:0]    count_href_1     ,
	output logic [ 9:0]    count_href_2     ,
	output reg   [11:0]    counter_valid_raw,
    output logic           valid_data_ddr
	
);
reg reg_HREF_1_z;	
reg reg_HREF_2_z;
reg [9:0] reg_RAW_1;
reg [9:0] reg_RAW_2;
wire [13:0] rdusedw_1;
wire [13:0] rdusedw_2;
reg sh_ready_read;
reg sh_ready_read2;
reg _sh_ready_read;
wire ready_read_behind  = (rdusedw_1 >= 'd1000) & (rdusedw_2 >= 'd1000);
wire ready_read_ahead           = ready_read_behind;
wire p_ready_read = ready_read_behind & !sh_ready_read;
reg valid_read_fifo_1;
reg valid_read_fifo_2;
always @(posedge clk_sys or negedge reset_n)
	if (~reset_n )
		sh_ready_read <=1'b0;
	else 
		sh_ready_read <=ready_read_behind;

reg sh_VSYNC_1;
reg sh_VSYNC_2;
reg sh_HREF_1;		
reg sh_HREF_2;		
always @(posedge pclk_1 or negedge reset_n)
	if (~reset_n )
		sh_VSYNC_1 <=1'b0;
	else 
		sh_VSYNC_1 <=VSYNC_1;
always @(posedge pclk_1 or negedge reset_n)
	if (~reset_n )
		sh_HREF_1 <=1'b0;
	else 
		sh_HREF_1 <=HREF_1;
always @(posedge pclk_2 or negedge reset_n)
	if (~reset_n )
		sh_VSYNC_2 <=1'b0;
	else 
		sh_VSYNC_2 <=VSYNC_2;
always @(posedge pclk_2 or negedge reset_n)
	if (~reset_n )
		sh_HREF_2 <=1'b0;
	else 
		sh_HREF_2 <=HREF_2;		
	
wire p_VSYNC_2 = VSYNC_2 & ! sh_VSYNC_2;		
wire n_VSYNC_2 = !VSYNC_2 & sh_VSYNC_2;	
wire p_HREF_1  = HREF_1 & ! sh_HREF_1;
wire p_HREF_2  = HREF_2 & ! sh_HREF_2;

reg [11:0] count_data_dvp_1;
reg [11:0] count_data_dvp_sys_1;
reg [11:0] count_data_dvp_sys_2;
reg [11:0] count_data_dvp_2;
wire last_data_1 = ( count_data_dvp_1 == 12'd1279 );
wire last_data_2 = ( count_data_dvp_2 == 12'd1279 );
reg sh_last_data_1;
reg sh_last_data_2;
always @(posedge pclk_1 or negedge reset_n)
	if (~reset_n )
		reg_RAW_1 <='0;
	else if(p_HREF_1 & !reg_HREF_1_z)
		reg_RAW_1 <= {2'b01, D1};
	else if(last_data_1)
		reg_RAW_1 <= {2'b10, D1};
	else 
		reg_RAW_1 <= {2'b00, D1};

always @(posedge pclk_2 or negedge reset_n)
	if (~reset_n )
		reg_RAW_2 <='0;
	else if(p_HREF_2 & !reg_HREF_2_z)
		reg_RAW_2 <= {2'b01, D2};
	else if(last_data_2)
		reg_RAW_2 <= {2'b10, D2};
	else 
		reg_RAW_2 <= {2'b00, D2};		
		
always @(posedge pclk_1 or negedge reset_n)
	if (~reset_n )
		reg_HREF_1_z <='0;
	else if(last_data_1)
		reg_HREF_1_z <= 0;
	else if(p_HREF_1)
		reg_HREF_1_z <= 1;	
always @(posedge pclk_2 or negedge reset_n)
	if (~reset_n )
		reg_HREF_2_z <='0;
	else if(last_data_2)
		reg_HREF_2_z <= 0;
	else if(p_HREF_2)
		reg_HREF_2_z <= 1;

		
always @(posedge pclk_1 or negedge reset_n)
	if (~reset_n )
		sh_last_data_1 <='0;
	else 
		sh_last_data_1 <= last_data_1;
		
always @(posedge pclk_2 or negedge reset_n)
	if (~reset_n )
		sh_last_data_2 <='0;
	else 
		sh_last_data_2 <= last_data_2;	

		
		
	
always @(posedge pclk_1, negedge reset_n)
	if(!reset_n)
		count_data_dvp_1 <='0;
	else if(sh_last_data_1)
		count_data_dvp_1 <='0;
	else if(p_HREF_1 & !reg_HREF_1_z)
		count_data_dvp_1 <='d1;
	else if(HREF_1)
		count_data_dvp_1 <= count_data_dvp_1 + 1;	
		
always @(posedge pclk_2, negedge reset_n)
	if(!reset_n)
		count_data_dvp_2 <='0;
	else if(sh_last_data_2)
		count_data_dvp_2 <='0;
	else if(p_HREF_2  & !reg_HREF_2_z)
		count_data_dvp_2 <='d1;
	else if(HREF_2)
		count_data_dvp_2 <= count_data_dvp_2 + 1;	

		
wire last_data_sys_1 = ( count_data_dvp_sys_1 == 12'd1279 );		
wire last_data_sys_2 = ( count_data_dvp_sys_2 == 12'd1279 );		
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		count_data_dvp_sys_1 <='0;
	else if(last_data_sys_1)
		count_data_dvp_sys_1 <='0;
	else if(valid_read_fifo_1)
		count_data_dvp_sys_1 <= count_data_dvp_sys_1 + 1;	
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		count_data_dvp_sys_2 <='0;
	else if(last_data_sys_2)
		count_data_dvp_sys_2 <='0;
	else if(valid_read_fifo_2)
		count_data_dvp_sys_2 <= count_data_dvp_sys_2 + 1;		


always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		count_frame_1 <='0;
	else if(start_frame & _ready_read)
		count_frame_1 <= count_frame_1 + 1;	
		
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		count_frame_2 <='0;
	else if(start_frame2  & _ready_read2)
		count_frame_2 <= count_frame_2 + 1;	
reg [3:0] sh_href_sys;
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		sh_href_sys <='0;
	else 
		sh_href_sys <={sh_href_sys[1:0],reg_HREF_2_z,reg_HREF_1_z};
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		count_href_1 <='0;
	else if(start_frame)
		count_href_1 <='0;
	else if(sh_href_sys[0] & !sh_href_sys[2])
		count_href_1 <= count_href_1 + 1;	
		
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		count_href_2 <='0;
	else if(start_frame2)
		count_href_2 <='0;
	else if(sh_href_sys[1] & !sh_href_sys[3])
		count_href_2 <= count_href_2 + 1;	
		
reg[17:0] data_fifo1_in;
reg[17:0] data_fifo2_in;


wire          empty1;		
wire          empty2;		
wire          rdreq1 =  !empty1;		
wire          rdreq2 =  !empty2;		
wire [17:0]   data_fifo_out1;	
wire [17:0]   data_fifo_out2;	

reg [2:0] sh_reg;
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		sh_reg <='0;
	else 
		sh_reg <={sh_reg[1:0],rdreq1};

reg sh_valid_read_fifo_1;
reg sh_valid_read_fifo_2;
reg sel_frame_1_for_fifo;
reg sel_frame_2_for_fifo;
reg sel_stream_1;
reg sel_stream_2;
reg sh_sel_1;
reg sh_sel_2;
wire p_ahead_1 =sel_frame_1_for_fifo & !sh_sel_1 ;
wire p_ahead_2 = sel_frame_2_for_fifo & !sh_sel_2 ;
always @(posedge pclk_1, negedge reset_n)
	if(!reset_n)
		sh_sel_1 <='0;
	else 
		sh_sel_1 <= sel_frame_1_for_fifo;
always @(posedge pclk_2, negedge reset_n)
	if(!reset_n)
		sh_sel_2 <='0;
	else 
		sh_sel_2 <= sel_frame_2_for_fifo;
wire sel_stream = 0;// sel_stream_1;
always @(posedge pclk_1, negedge reset_n)
	if(!reset_n)
		sel_stream_1 <='0;
	else if(p_ahead_2)
		sel_stream_1 <='0;
	else if(p_ahead_1) 
		sel_stream_1 <= 1'b1;
always @(posedge pclk_2, negedge reset_n)
	if(!reset_n)
		sel_stream_2 <='0;
	else if(p_ahead_1) 
		sel_stream_2 <= 1'b0;
	else if(p_ahead_2) 
		sel_stream_2<= 1'b1;	
always @(posedge pclk_1, negedge reset_n)
	if(!reset_n)
		sel_frame_1_for_fifo <='0;
	else if(last_data_1) 
		sel_frame_1_for_fifo <= 1'b0;
	else if((p_HREF_1 & !reg_HREF_1_z) & !sel_frame_2_for_fifo)
		sel_frame_1_for_fifo <= 1'b1;

always @(posedge pclk_2, negedge reset_n)
	if(!reset_n)
		sel_frame_2_for_fifo <='0;
	else if(last_data_2) 
		sel_frame_2_for_fifo <= 1'b0;
	else if((p_HREF_2 & !reg_HREF_2_z) & !sel_frame_1_for_fifo)
		sel_frame_2_for_fifo <= 1'b1;
// behind
wire wrclk_behind =  sel_stream ? pclk_2: pclk_1;
wire [9:0] data_behind  =  sel_stream ? reg_RAW_2 : reg_RAW_1;
wire       wrreq_behind =  sel_stream ? sh_HREF_2 : sh_HREF_1;
fifo_dvp2  fifo_dvp_1
(
	.wrclk   (pclk_1    ),
	.rdclk   (clk_sys         ),
	.data    (reg_RAW_1),
	.rdreq   (valid_read_fifo_1          ),//
	.wrreq   (sh_HREF_1         ),
	.rdempty (empty1          ),
	.wrfull  (                ),
	.q       (data_fifo_out1  ),
	.rdusedw (   rdusedw_1)
);	
// 8192 ahead раньше
wire wrclk_ahead = sel_stream  ? pclk_1 : pclk_2;
wire [9:0] data_ahead  =  sel_stream  ? reg_RAW_1 : reg_RAW_2;
wire       wrreq_ahead =  sel_stream  ? sh_HREF_1 : sh_HREF_2;
fifo_dvp2  fifo_dvp_2
(
	.wrclk   (pclk_2          ),
	.rdclk   (clk_sys         ),
	.data    (reg_RAW_2),
	.rdreq   (valid_read_fifo_2          ),//
	.wrreq   (sh_HREF_2         ),
	.rdempty (empty2          ),
	.wrfull  (                ),
	.q       (data_fifo_out2  ),
	.rdusedw (  rdusedw_2              )
);	

assign valid_RAW = sh_valid_read_fifo_1;
assign RAW_1  = data_fifo_out1[7:0] ;
assign RAW_2  = data_fifo_out2[7:0] ;
assign SOF	  =  (data_fifo_out1[8] & sh_valid_read_fifo_1);	
//assign SOF_2  =  (data_fifo_out2[8] & sh_valid_read_fifo_2);		
assign EOF	  =  (data_fifo_out1[9] & sh_valid_read_fifo_1);		
//assign EOF_2  =  (data_fifo_out2[9] & sh_valid_read_fifo_2);		
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		valid_read_fifo_1 <='0;
	else if(last_data_sys_1)
		valid_read_fifo_1 <= '0;
	else if(p_ready_read)
		valid_read_fifo_1 <= 'd1;
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		valid_read_fifo_2 <='0;
	else if(last_data_sys_2)
		valid_read_fifo_2 <= '0;
	else if(p_ready_read)
		valid_read_fifo_2 <= 'd1;
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		sh_valid_read_fifo_1 <='0;
	else 
		sh_valid_read_fifo_1 <= valid_read_fifo_1;
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		sh_valid_read_fifo_2 <='0;
	else 
		sh_valid_read_fifo_2 <= valid_read_fifo_2;
reg sh_reg_start_frame;
reg sh_reg_start_frame2;
//reg_start_frame & !sh_reg_start_frame;
reg [63:0] reg_ddr;

reg [1:0] reg_vsync1_100;
reg [1:0] reg_vsync2_100;
wire reg_start_frame_t1  = reg_vsync1_100[0] & !reg_vsync1_100[1];
wire reg_start_frame_t2  = !reg_vsync1_100[0] & reg_vsync1_100[1];
wire reg_start_frame2_t1 = reg_vsync2_100[0] & !reg_vsync2_100[1];
wire reg_start_frame2_t2 = !reg_vsync2_100[0] & reg_vsync2_100[1];

always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		reg_vsync1_100 <='0;
	else 
		reg_vsync1_100 <= {reg_vsync1_100[0], VSYNC_1};
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		reg_vsync2_100 <='0;
	else 
		reg_vsync2_100 <= {reg_vsync2_100[0], VSYNC_2};
reg reg_start_frame	;
reg reg_start_frame2	;
reg running_frame	;	
reg running_frame2	;
//wire end_frame2 = (count_href_2 == 'd718) & (p_HREF_2 & !reg_HREF_2_z);	
wire end_frame2 = reg_start_frame2 & !sh_reg_start_frame2 & running_frame2 ;//& (count_href_2 =='d720);
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		reg_start_frame <='0;
	else if(reg_start_frame_t1)
		reg_start_frame <= 1;
	else if(reg_start_frame_t2)
		reg_start_frame <= 0;	
		
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		reg_start_frame2 <='0;
	else if(reg_start_frame2_t1)
		reg_start_frame2 <= 1;
	else if(reg_start_frame2_t2)
		reg_start_frame2 <= 0;			
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		sh_reg_start_frame <='0;
	else 
		sh_reg_start_frame <= reg_start_frame;	
wire end_frame1 = reg_start_frame & !sh_reg_start_frame & running_frame;		
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		sh_reg_start_frame2 <='0;
	else 
		sh_reg_start_frame2 <= reg_start_frame2;			
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		running_frame <='0;
	else if(start_frame )
		running_frame <= 1;
	else if(end_frame1)
		running_frame <= 1'b0;	
assign start_frame = !reg_start_frame & sh_reg_start_frame & !running_frame ;

always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		running_frame2 <='0;
	else if(start_frame2)
		running_frame2 <= 1;
	else if(end_frame2)
		running_frame2 <= 0;	
assign start_frame2 = !reg_start_frame2 & sh_reg_start_frame2 & !running_frame2 ;
wire compare_streaam  = count_href_1 >= count_href_2 ? 1:0;
wire not_comp1  =  count_href_1 == 'd0;
wire not_comp2  =  count_href_2 == 'd0;
wire [9:0]div_count = compare_streaam ? (count_href_1 - count_href_2) : (count_href_2 - count_href_1);
wire run_low_freq1 = compare_streaam & (div_count !='0);
wire run_low_freq2 = !compare_streaam ;
wire dop = running_frame2 & running_frame;
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		err_ch0 <='0;
	else 
		err_ch0 <= run_low_freq1  & !(not_comp1| not_comp2) & !HREF_1;
	
		
always @(posedge clk_sys, negedge reset_n)
	if(!reset_n)
		err_ch1 <='0;
	else
		err_ch1 <= run_low_freq2   & !(not_comp1 | not_comp2)& !HREF_2;

		
endmodule