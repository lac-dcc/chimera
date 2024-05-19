// This program was cloned from: https://github.com/sh-vlad/FPGA_rtime_HDR_video
// License: Apache License 2.0

//////////////////////////////////////////////////////
//Name File     : read_data_ddr                     //
//Author        : Andrey Papushin                   //
//Email         : andrey.papushin@gmail.com         //
//Standart      : IEEE 1800—2009(SystemVerilog-2009)//
//Start design  : 02.04.2018                        //
//Last revision : 30.04.2018                        //
//////////////////////////////////////////////////////
module read_data_ddr
(
	input  wire  						    clk_100         ,    
	input  wire 						    reset_b         ,
	input  wire                             line_request	,
	input  wire                             enable_hist 	,
	input  wire                             done_write_frame	,
	output  reg                             frame_buffer_ready	,
	output reg  [7:0]                       r_data          ,
	output reg  [7:0]                       g_data          ,
	output reg  [7:0]                       b_data          ,
	output reg                              valid_rgb       ,
	input  wire [29:0]                      addr_read_ddr1   ,
	input  wire [29:0]                      addr_read_ddr2   ,
	input  wire [29:0]                      addr_read_ddr3   ,
	output reg  [7:0]                       count_read_frame ,
	sdram_ifc.sdram_read_master_port        f2h_sdram         // avalon interface sdram <-> read_data_ddr
);

localparam ADDR_HIST_2 = 16'HC800;
reg reg_enable_hist;

reg [9:0] count_line;
enum reg [1:0]
{
	s_idle			   = 2'd0,
	s_normal_read_line = 2'd1,
	s_hist_read_line   = 2'd2,
	s_wait			   = 2'd3
}ns,cs;	




reg ready_new_frame;
reg ctrl_buff;
reg last_burst;
reg ready_start;
reg [13:0] count_burst;
reg start_read;
reg sh_start_read;
reg read_frame;
reg [7:0] count_unit_burst;
reg [3:0] count_burst_in_line;
wire [7:0]length_burst = (f2h_sdram.burstcount  -1);
wire last_unit_burst  = ( count_unit_burst == length_burst) ; 
wire end_frame        = last_unit_burst  & last_burst;
wire [3:0]num_burst_line  = 'd9;// (cs == s_normal_read_line) ? 'd15 : 'd9;
wire end_line         = (count_burst_in_line == num_burst_line) &  last_unit_burst;

wire start_hist_1    = (count_burst_in_line == 'd7)  &  last_unit_burst & reg_enable_hist;
wire start_hist_2    = (count_burst_in_line == 'd8)  &  last_unit_burst & reg_enable_hist;
wire end_hist_line   = (count_burst_in_line == 'd9)  &  last_unit_burst & reg_enable_hist;
wire start_hist      = start_hist_1 & (count_line =='d519);
wire hist_line = (count_line >'d519) & reg_enable_hist;
wire hist_line2 = (count_line >='d519);
wire start_hist_next =  start_hist_1 & hist_line2;


always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		reg_enable_hist <= 1'd0;	
	else if(start_read) 
		reg_enable_hist <= enable_hist;
		
always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		{b_data, g_data, r_data} <= 24'd0;	
	else if(f2h_sdram.readdatavalid) 
		{b_data, g_data, r_data} <= f2h_sdram.readdata[23:0];

always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		valid_rgb <= 1'd0;	
	else
		valid_rgb <= f2h_sdram.readdatavalid;
reg sh_ready_new_frame;		
	
always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		ready_new_frame <= 1'd0;
	else if(line_request & ready_new_frame & !read_frame )
		ready_new_frame <= 0;
	else if(done_write_frame)
		ready_new_frame <= 1;
		
always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		sh_ready_new_frame <= 1'd0;
	else 
		sh_ready_new_frame <= ready_new_frame ;		
wire n_frame_buffer_ready = !ready_new_frame & sh_ready_new_frame	;
always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		read_frame <= 1'd0;	
	else if(end_frame)
		read_frame <= 0;	
	else if(sh_start_read)
		read_frame <= 1;	
always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		frame_buffer_ready <= 1'd0;	
	else if(done_write_frame)
		frame_buffer_ready <= 1;
always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		ready_start <= 1'd0;
	else if(start_read)
		ready_start <= 0;
	else if(frame_buffer_ready & line_request)
		ready_start <= 1;
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		ctrl_buff <= 1'd0;
	else if(n_frame_buffer_ready)
		ctrl_buff <= ~ctrl_buff;	
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		start_read  <= 1'd0;
	else if(ready_start & !start_read & !f2h_sdram.waitrequest )
		start_read  <= 1'd1;
	else 
		start_read  <= 1'd0;
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		count_unit_burst  <= 8'd0;
	else if(last_unit_burst)
		count_unit_burst  <= 8'd0;
	else if(f2h_sdram.readdatavalid & !f2h_sdram.waitrequest)
		count_unit_burst  <= count_unit_burst + 8'd1;
		
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		count_read_frame  <= 8'd0;
	else if(n_frame_buffer_ready)
		count_read_frame  <= count_read_frame + 8'd1;
		
		
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		count_burst <= 14'd0;
	else if(end_frame)
		count_burst <= 14'd0;
	else if(last_unit_burst & !end_frame)
		count_burst <= count_burst + 14'd1;		
		
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		count_burst_in_line <= 14'd0;
	else if(end_line)
		count_burst_in_line <= 14'd0;
	else if(last_unit_burst )
		count_burst_in_line <= count_burst_in_line + 14'd1;
		
		
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		last_burst <= 1'b0;
	else if(sh_start_read)
		last_burst <= 1'b0;	
	else if(count_burst == 'd7199)
		last_burst <= 1'b1;			
reg [1:0] reg_last_unit_burst;		
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		reg_last_unit_burst <= 2'b00;
	else if(!f2h_sdram.waitrequest & reg_last_unit_burst[0])
		reg_last_unit_burst <= 2'b10;	
	else if((last_unit_burst & !end_frame & !end_line))
		reg_last_unit_burst <= 2'b01;
	else if(reg_last_unit_burst[1] )
		reg_last_unit_burst <= 2'b00;
		
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
		sh_start_read  <= 1'd0;
	else if(start_read )
		sh_start_read  <= 1'd1; // next line
	else
		sh_start_read  <= 1'd0;
		
always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b ) 
		count_line <= '0;	
	else if(end_frame)
		count_line <= '0;	
	else if(end_line)
		count_line <=  count_line + 1;	 
		
reg        read      ;  
reg        read_2      ;  
reg [29:0] address   ;		
reg [29:0] address_2   ;		
reg [ 7:0] burstcount;		
reg        reg_read      ;  
reg [29:0] reg_address   ;		
reg [ 7:0] reg_burstcount;			
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
	begin
		read        <= 1'd0;
		address     <= 'd0; 
		burstcount  <= 8'd128; //8'd80; 
	end
	else if(ns == s_normal_read_line)
		if(sh_start_read & !read_frame & ctrl_buff)
		begin
			read        <= 1'd1;
			address     <= addr_read_ddr1;
		end
		else if(sh_start_read & !read_frame & !ctrl_buff)
		begin
			read        <= 1'd1;
			address     <= addr_read_ddr2;
		end
		else if( read_frame & sh_start_read & hist_line)
		begin
			read        <= 1'd1;
			address     <= address + 'd384; 
		end
		else if(reg_last_unit_burst[1] || (read_frame & sh_start_read))
		begin
			read        <= 1'd1;
			address     <= address + 'd128; 
		end
		else 
			read        <= 1'd0;
			
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
	begin
		read_2        <= 1'd0;
		address_2     <= 'd0; 
	end
	else if(ns == s_hist_read_line)
		if(start_hist)
		begin
			read_2        <= 1'd1;
			address_2     <= addr_read_ddr3;
		end
		else if(start_hist_2 | start_hist_next)
		begin
			read_2        <= 1'd1;
			address_2     <= address_2 + 'd128; 
		end
		else 
			read_2        <= 1'd0;
always_ff @(posedge clk_100  or negedge reset_b)
	if (~reset_b)
	begin
		reg_read        <= 1'd0;
		reg_address     <= 'd0; 
		reg_burstcount  <= 8'd0; 
	end
	else if(ns == s_hist_read_line)
	begin
		reg_read        <=  read_2       ;
		reg_address     <=  address_2     ;		
	end
	else
	begin
		reg_read        <=  read       ;
		reg_address     <=  address     ;		
	end
always @( posedge clk_100 or negedge reset_b )
	if ( !reset_b )
		cs <= s_idle;
	else	
		cs <= ns;

always_comb
begin
	ns = cs;
	case(cs)
		s_idle:			     if ( reset_b )			ns = s_wait;
		s_wait:			    if ( line_request )		ns = s_normal_read_line;
		s_normal_read_line:	if ( start_hist_next ) ns = s_hist_read_line;
		s_hist_read_line:	begin if ( end_frame)			ns = s_wait; 
						       else if(end_hist_line)  ns = s_normal_read_line;
									end
		default:                                  ns = s_idle;
	endcase
end	
	
	
	
	
assign f2h_sdram.read       =  reg_read      ;   
assign f2h_sdram.address   	=  reg_address    ;
assign f2h_sdram.burstcount	= 8'd128;// (cs == s_hist_read_line) ? 8'd128 : 8'd80;


endmodule
