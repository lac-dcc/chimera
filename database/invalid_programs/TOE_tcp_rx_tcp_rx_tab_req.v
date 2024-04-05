`timescale 1ns / 1ps
module tcp_rx_tab_req #(
		parameter    PDWID        = 128 			,               
		parameter    PDSZ         = 4 			    ,               
		parameter    TAB_AWID     = 12 				, 		
		parameter    REQ_SZ       = 1 				, 		
		parameter    TAB_INFO_WID = 16 				, 		
		parameter    DBG_WID      = 32 				 		
) (
		input	wire				        clk		 	            ,
		input 	wire				        rst			            ,
		input 	wire				        in_pd_vld		        ,
		input 	wire	[PDWID-1:0]		    in_pd_dat		        ,
		output 	wire				        in_pd_rdy 		        ,
		output 	reg 				        tab_rreq_fifo_wen	    ,
		output 	reg 	[TAB_AWID-1:0]		tab_rreq_fifo_wdata	    ,
		input 	wire				        tab_rreq_fifo_nafull	,
		output 	reg 				        pd_fifo_wen		        ,
		output 	reg	[PDWID-1:0]		        pd_fifo_wdata		    ,
		input 	wire				        pd_fifo_nafull		    ,
		output 	reg				            tab_msg_fifo_wen	    ,
		output 	reg	[TAB_INFO_WID-1:0]	    tab_msg_fifo_wdata	    ,
		input 	wire				        tab_msg_fifo_nafull	,
		output  wire	[DBG_WID-1:0]		dbg_sig			
);
localparam VAL_FWD_TBD   = 0;
localparam VAL_FWD_TOCPU = 1;
localparam VAL_FWD_TOAPP = 2;
localparam VAL_FWD_TOMAC = 3;
wire  [1-1:0] total_pd_vld;
wire  [PDWID*PDSZ-1:0] total_pd_dat;
cpkt_unf #(
	.DWID			( PDWID		),
	.FCMWID			( 1 		),
	.SOC_MSB		( 0 		),
	.SOC_LSB		( 0 		),
	.EOC_MSB		( 0 		),
	.EOC_LSB		( 0 		),
	.CELL_SZ		( PDSZ     	)
)inst_cpkt_unf(
	.clk     		( clk			), 
	.rst    		( rst	 		),
	.cell_vld 		( in_pd_vld		),	
	.cell_dat 		( in_pd_dat		),	
	.cell_msg 		( 1'b0			),	
    .total_cpkt_vld 	( total_pd_vld  	), 
	.total_cpkt_dat 	( total_pd_dat  	), 
	.total_cpkt_msg 	(       		) 
);
`include "pkt_des_unpack.v"
wire 	[16-1:0]		fid_tmp;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
	    tab_msg_fifo_wen 	<= 0;
	    tab_msg_fifo_wdata <= 0;
	end
	else begin
	    tab_msg_fifo_wen 	<= total_pd_vld;
	    tab_msg_fifo_wdata <= (pd_fwd==VAL_FWD_TBD) ? {fid_tmp[13:0], 2'b11} : {fid_tmp[13:0], 2'b01};  
	end
end
reg [15:0] pol_fid;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
	    pol_fid 	<= 0;
	end
	else begin
	  	if( total_pd_vld==1'b1 && pd_chn_id==2 && pd_tcp_fid[13:0]==9 ) begin  
	        pol_fid 	<= pol_fid + 1'b1;
			end
	end
end
assign   fid_tmp = ( total_pd_vld==1'b1 && pd_chn_id==2 && pd_tcp_fid[13:0]==9 ) ? pol_fid : pd_tcp_fid ;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
	    tab_rreq_fifo_wen 	<= 0;
	    tab_rreq_fifo_wdata 	<= 0;
	end
	else begin
	    tab_rreq_fifo_wen 	<= ( total_pd_vld==1'b1 && (pd_fwd==VAL_FWD_TBD) ) ? 1'b1 : 1'b0;
	    tab_rreq_fifo_wdata <= {fid_tmp[0+:(TAB_AWID-1)],1'b0} ;
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
reg [15:0] cnt_bp;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		cnt_bp <= 0;
	end
	else begin
		if( cnt_bp==127 )begin
			cnt_bp <= 0;
		end
		else begin
			cnt_bp <= cnt_bp+1'b1;
		end
	end
end
assign in_pd_rdy = ( tab_msg_fifo_nafull==1'b1 && pd_fifo_nafull==1'b1 && tab_rreq_fifo_nafull==1'b1 ) ? 1'b1 : 1'b0;
assign dbg_sig = 32'h0;
endmodule
