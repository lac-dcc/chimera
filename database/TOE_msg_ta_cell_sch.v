`timescale 1ns / 1ps
module cell_sch #(
		parameter    CHN_NUM      = 6	,  
		parameter    DWID         = 256 ,  
		parameter    MSG_WID        = 13  ,  
		parameter    PIMWID       = 48  ,  		
		parameter    FCMWID       = MSG_WID+44     	
) (
    input				clk          	    	,   
    input				rst          	    	,
    output	reg			info_fifo_ren       	,   
    input	[PIMWID-1:0]		info_fifo_rdata     	,   
    input				info_fifo_nempty    	,   
    output	reg [1*CHN_NUM-1:0]	cell_fifo_mq_ren	   	,	
    input	[DWID+MSG_WID-1:0]  	cell_fifo_mq_rdata	   	,
    input	[1*CHN_NUM-1:0]		cell_fifo_mq_nempty	   	,
    output	reg			fst_cell_vld   	   		,
    input				fst_cell_rdy   	   		,
    output	[DWID-1:0]		fst_cell_dat   	   		,
    output	[FCMWID-1:0]		fst_cell_msg	   		 
);
localparam    CID_LSB       = 45		;  
localparam    CID_MSB       = 47		;  
localparam    PLEN_LSB      = 12		;  
localparam    PLEN_MSB      = 12+16-1	;  
localparam    SOC_LSB       = 2		 	;  
localparam    SOC_MSB       = 2		 	;  
localparam    EOC_LSB       = 3		 	;  
localparam    EOC_MSB       = 3		 	;  
localparam    CID_WID       = 4 	 	;  
localparam    PLEN_WID      = 16	 	;  
localparam    CSZ_WID       = 3	 		;  
localparam    CELL_SZ       = 8	 		;  
integer   		  				i				    ;
wire     [CID_WID-1:0] 			info_cid			;  
wire     [PLEN_WID-1:0] 		info_plen			;  
wire     [PLEN_WID-1:0] 		temp_info_plen		;  
wire     [CSZ_WID:0] 			info_csz			;  
reg      [CID_WID-1:0] 			info_cid_reg		;  
reg      [CSZ_WID-1:0] 			info_csz_reg		;  
reg 							info_fifo_ren_reg	;  
wire 							real_cell_ren	    ;  
reg      [CSZ_WID:0] 			real_cell_ren_cnt   ;
reg      [CSZ_WID:0] 			cell_ren_cnt   ;
reg     [PIMWID-1:0] 			info_rdata_lat      ;  
reg     [PIMWID-1:0] 			info_rdata_lat_1dly ;  
wire    [DWID-1:0] 			cell_data			;
wire    [MSG_WID-1:0] 			cell_msg			;
assign info_cid   = info_fifo_rdata[0 +: 4];
assign info_plen  = info_fifo_rdata[20 +: 16];
assign info_csz   = ( info_plen[15:8]!=0 ) ? 4'h8 : ( |info_plen[4:0] ) ? (info_plen[8:5]+1'b1) : info_plen[8:5] ;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		info_fifo_ren <= 1'b0;
	end
  else if( info_fifo_nempty==1'b1 && fst_cell_rdy==1'b1 && cell_fifo_mq_nempty!={CHN_NUM{1'b0}} && info_fifo_ren==1'b0 && (cell_ren_cnt==0||cell_ren_cnt==1) ) begin
		info_fifo_ren <= 1'b1;
	end
	else begin
		info_fifo_ren <= 1'b0;
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		cell_fifo_mq_ren <= 0;
	end
	else if( info_fifo_ren==1'b1 ) begin
		for( i=0; i<CHN_NUM; i=i+1 ) begin
			cell_fifo_mq_ren[i] <= (info_cid==i) ? 1'b1 : 1'b0;
		end
	end
	else if( real_cell_ren_cnt==1 ) begin
		cell_fifo_mq_ren <= 0;
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		real_cell_ren_cnt <= 0;
	end
	else begin
		if( info_fifo_ren==1'b1 )begin
			real_cell_ren_cnt <= info_csz;
		end
		else if( real_cell_ren_cnt!=0 )begin
			real_cell_ren_cnt <= real_cell_ren_cnt - 1'b1;
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		cell_ren_cnt <= 0;
	end
	else begin
		if( info_fifo_ren==1'b1 )begin
			cell_ren_cnt <= CELL_SZ;
		end
		else if( cell_ren_cnt!=0 )begin
			cell_ren_cnt <= cell_ren_cnt - 1'b1;
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		info_rdata_lat_1dly <= 0;
	end
	else if( info_fifo_ren==1'b1 ) begin
		info_rdata_lat_1dly <= info_fifo_rdata;
	end
end
assign real_cell_ren = (real_cell_ren_cnt!=0) ? 1'b1 : 1'b0;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		fst_cell_vld <= 0;
	end
	else begin
		fst_cell_vld <= real_cell_ren;
	end
end
assign cell_data = cell_fifo_mq_rdata[DWID-1:0];
assign cell_msg  = cell_fifo_mq_rdata[DWID+MSG_WID-1:DWID];
assign fst_cell_dat = cell_data;
assign fst_cell_msg = { info_rdata_lat_1dly[47:4], cell_msg[MSG_WID-1:0] } ;
endmodule
