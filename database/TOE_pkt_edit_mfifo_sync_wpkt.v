`timescale 1ns / 1ps
module mfifo_sync_wpkt #(
		parameter 		PKT_CHN_NUM 	= 2	    						, 
		parameter 		PDWID       	= {16'd128, 16'd256}			, 
		parameter 		PMWID       	= {16'd32,  16'd64 }			, 
		parameter 		EOP_POS       	= {16'd1,   16'd1  }			, 
		parameter 		CELL_CHN_NUM	= 2 							, 
		parameter 		CDWID       	= {16'd128, 16'd256}			, 
		parameter 		CELLSZ      	= {16'd4,   16'd8  }			, 
		parameter 		PDWID_SUM       = wid_sum(PDWID, PKT_CHN_NUM)	, 
		parameter 		PMWID_SUM       = wid_sum(PMWID, PKT_CHN_NUM)	, 
		parameter 		CDWID_SUM       = wid_sum(CDWID, CELL_CHN_NUM)	  
) (
		input	wire				clk 		,
		input 	wire				rst		,
		input   wire    [PKT_CHN_NUM-1 	  :0]  	in_pkt_vld	,
		input   wire    [PDWID_SUM-1	  :0]  	in_pkt_dat	,
		input   wire    [PMWID_SUM-1	  :0]  	in_pkt_msg	,
		output  wire    [PKT_CHN_NUM-1    :0]  	in_pkt_rdy	,
		input   wire    [CELL_CHN_NUM-1   :0]  	in_cell_vld     ,
		input   wire    [CDWID_SUM-1      :0]  	in_cell_dat     ,
		output  wire    [CELL_CHN_NUM-1   :0]  	in_cell_rdy     ,
		output  wire    [PKT_CHN_NUM-1 	  :0]  	out_pkt_vld     ,     
		output  wire    [PDWID_SUM-1      :0]  	out_pkt_dat     ,
		output  wire    [PMWID_SUM-1      :0]  	out_pkt_msg     ,
		input   wire    [PKT_CHN_NUM-1 	  :0]  	out_pkt_rdy     ,
		output  wire    [CELL_CHN_NUM-1   :0]  	out_cell_vld    ,
		output  wire    [CDWID_SUM-1      :0]  	out_cell_dat    ,
		input   wire    [CELL_CHN_NUM-1   :0]  	out_cell_rdy     
);
wire 				flag_start		;  
reg    				flag_idle	    	;  
wire [PKT_CHN_NUM-1   :0]  	flag_pkt_end		;  
wire [CELL_CHN_NUM-1  :0]  	flag_cell_end		;  
reg  [PKT_CHN_NUM-1   :0]  	flag_pkt_end_reg	;  
reg  [CELL_CHN_NUM-1  :0]  	flag_cell_end_reg	;  
wire      			flag_end	    	;  
wire [PKT_CHN_NUM-1  :0] 	in_pkt_end			;  
wire [CELL_CHN_NUM-1 :0]  	in_cell_end			;  
reg  [PKT_CHN_NUM-1  :0] 	in_pkt_sending		;
reg  [CELL_CHN_NUM-1 :0]  	in_cell_sending		;
genvar 						i					;  
assign  flag_start = ( &out_pkt_rdy ) & ( &out_cell_rdy ) & ( &in_pkt_vld ) & ( &in_cell_vld ) & flag_idle;   
assign flag_end = (&(in_pkt_end | ~in_pkt_sending)) & (&(in_cell_end | ~in_cell_sending));
always@(posedge clk or posedge rst) begin
	if( rst==1'b1 ) begin
		flag_idle <= 1'b1;
	end
	else begin
		if( flag_end==1'b1 )begin
			flag_idle <= 1'b1;
		end
		else if( flag_start==1'b1 )begin
			flag_idle <= 1'b0;
		end
	end
end
assign in_pkt_rdy = out_pkt_rdy;
reg [4*CELL_CHN_NUM-1:0] in_cell_cnt;
generate
for( i=0; i<CELL_CHN_NUM; i=i+1) begin : in_cell_end_proc1
	assign in_cell_end[i] = ( in_cell_vld[i] & in_cell_cnt[4*i+:4]==(CELLSZ[16*i+:16]-1) ) ? 1'b1 : 1'b0;
	assign in_cell_rdy[i] = ( (flag_start==1'b1 || in_cell_sending[i]==1'b1) && out_cell_rdy[i]==1'b1 ) ? 1'b1 : 1'b0;
end
endgenerate
generate
for( i=0; i<CELL_CHN_NUM; i=i+1 ) begin : in_cell_cnt_proc
	always@(posedge clk or posedge rst) begin
		if( rst==1'b1 ) begin
			in_cell_cnt[4*i+:4] <= 0;
		end
		else begin
			if( in_cell_end[i]==1'b1 )begin
				in_cell_cnt[4*i+:4] <= 0;
			end
			else if( in_cell_vld[i] )begin
				in_cell_cnt[4*i+:4] <= in_cell_cnt[4*i+:4] + 1'b1;
			end
		end
	end
end
endgenerate
generate
for( i=0; i<CELL_CHN_NUM; i=i+1) begin : in_cell_sending_proc
	always@(posedge clk or posedge rst) begin
		if( rst==1'b1 ) begin
			in_cell_sending[i] <= 1'b0;
		end
		else begin
			if( in_cell_end[i]==1'b1 )begin
				in_cell_sending[i] <= 1'b0;
			end
			else if( flag_start==1'b1 )begin
				in_cell_sending[i] <= 1'b1;
			end
		end
	end
end
endgenerate
generate
for( i=0; i<PKT_CHN_NUM; i=i+1) begin : in_pkt_sending_proc
	always@(posedge clk or posedge rst) begin
		if( rst==1'b1 ) begin
			in_pkt_sending[i] <= 1'b0;
		end
		else begin
			if( in_pkt_end[i]==1'b1 )begin
				in_pkt_sending[i] <= 1'b0;
			end
			else if( flag_start==1'b1 )begin
				in_pkt_sending[i] <= 1'b1;
			end
		end
	end
end
endgenerate
assign  	out_pkt_vld     = in_pkt_vld & in_pkt_rdy   	;     
assign  	out_pkt_dat     = in_pkt_dat     		;
assign  	out_pkt_msg     = in_pkt_msg     		;
assign  	out_cell_vld    = in_cell_vld & in_cell_rdy	;
assign  	out_cell_dat    = in_cell_dat    		;
function integer wid_sum;
  input [16*8-1:0] wid;
  input num;
  integer i;
  begin
  	wid_sum = 0;
  	for ( i=0; i<num; i=i+1 ) begin
  	    wid_sum = wid_sum + wid[i*16 +: 16];
  	end
  end
endfunction
endmodule
