`timescale 1ns / 1ps
module tcp_tx_tab_req #(
		parameter    PDWID        = 128 			,               
		parameter    PDSZ         = 4 			    	,               
		parameter    TAB_AWID     = 12 				, 		
		parameter    REQ_SZ       = 1 				, 		
		parameter    TAB_INFO_WID = 2 				, 		
		parameter    DBG_WID      = 32 				 		
) (
		input	wire				clk		 	,
		input 	wire				rst			,
		input 	wire				in_pd_vld		,
		input 	wire	[PDWID-1:0]		in_pd_dat		,
		output 	wire				in_pd_rdy 		,
		output 	reg 				tab_rreq_fifo_wen	,
		output 	reg 	[TAB_AWID-1:0]		tab_rreq_fifo_wdata	,
		input 	wire				tab_rreq_fifo_nafull	,
		output 	reg 				pd_fifo_wen		,
		output 	reg	[PDWID-1:0]		pd_fifo_wdata		,
		input 	wire				pd_fifo_nafull		,
		output 	reg				tab_info_fifo_wen	,
		output 	reg	[TAB_INFO_WID-1:0]	tab_info_fifo_wdata	,
		input 	wire				tab_info_fifo_nafull	,
		output  wire	[DBG_WID-1:0]		dbg_sig			
);
localparam VAL_FWD_TBD   		= 0;   	
localparam VAL_FWD_MAC   		= 1;	
localparam VAL_FWD_TOE   		= 2;	
localparam VAL_FWD_APP   		= 3;	
localparam VAL_FWD_DROP   		= 4;	
localparam VAL_PTYP_MAC			= 8'h15;	
localparam VAL_PTYP_PKT_MSG		= 8'h14;	
localparam VAL_PTYP_CPU_INIT		= 8'h10;	
localparam VAL_PTYP_CPU_FREE		= 8'h11;	
localparam VAL_PTYP_PKT_SYN	 	= 8'h12; 	
localparam VAL_PTYP_PKT_FIN		= 8'h13; 	
localparam VAL_PTYP_PKT_SYNACK		= 8'h17; 	
localparam VAL_PTYP_PKT_ACK		= 8'h18; 	
localparam VAL_PTYP_DROP_SEQN_ERR	= 8'h16;	
wire   			whole_pd_vld;
wire  [PDWID*PDSZ-1:0] whole_pd_dat;
cell_unf #(
	.DWID			( PDWID		),
	.FCMWID			( 1 		),
	.EOC_MSB		( 0 		),
	.EOC_LSB		( 0 		),
	.SOC_MSB		( 0 		),
	.SOC_LSB		( 0 		),
	.CELL_SZ		( PDSZ     	)
)inst_cell_unf(
	.clk     		( clk			), 
	.rst    		( rst	 		),
	.cell_vld 		( in_pd_vld		),	
	.cell_dat 		( in_pd_dat		),	
	.cell_msg 		( 1'b0			),	
    	.whole_cell_vld 	( whole_pd_vld  	), 
	.whole_cell_dat 	( whole_pd_dat  	), 
	.whole_cell_msg 	(       		) 
);
`include "pkt_des_unpack.v"
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
	    tab_info_fifo_wen 	<= 0;
	    tab_info_fifo_wdata <= 0;
	end
	else begin
	    tab_info_fifo_wen 	<= whole_pd_vld;
	    tab_info_fifo_wdata <= (pd_fwd!=VAL_FWD_MAC) ? 2'b11 : 2'b01;  
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
	    tab_rreq_fifo_wen 	<= 0;
	    tab_rreq_fifo_wdata 	<= 0;
	end
	else begin
	    tab_rreq_fifo_wen 	<= ( whole_pd_vld==1'b1 && (pd_fwd!=VAL_FWD_MAC) ) ? 1'b1 : 1'b0;
	    tab_rreq_fifo_wdata	<= {pd_tcp_fid[0+:(TAB_AWID-1)],1'b0};
	end
end
reg [1:0] cnt_pd_vld;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
	    cnt_pd_vld 	<= 0;
	end
	else begin
	    if( in_pd_vld==1'b1 && cnt_pd_vld==(PDSZ-1) ) begin
		cnt_pd_vld <= 0;
	    end
	    else if( in_pd_vld==1'b1 ) begin
		cnt_pd_vld <= cnt_pd_vld + 1'b1;
	    end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
	    pd_fifo_wen 	<= 0;
	    pd_fifo_wdata 	<= 0;
	end
	else begin
	    pd_fifo_wen 	<= in_pd_vld;
	    pd_fifo_wdata 	<= in_pd_dat;
	end
end
assign in_pd_rdy = ( tab_info_fifo_nafull==1'b1 && pd_fifo_nafull==1'b1 && tab_rreq_fifo_nafull==1'b1 ) ? 1'b1 : 1'b0;
assign dbg_sig = 32'h0;
endmodule
