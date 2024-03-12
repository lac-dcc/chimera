`timescale 1ns / 1ps
module rx_edit #(
		parameter    DAT_TYP      = "ETH"     		,
		parameter    ECMWID       = 16'd92     		,		
		parameter    DWID         = 16'd256 		,               
		parameter    MSG_WID      = 80        		,               
		parameter    EOP_POS      = 1        		,               
		parameter    OMSG_WID     = MSG_WID+60    		                
) (
		input	wire				clk      			,
		input 	wire				rst  				,
		input 	wire [1-1:0] 			pkt_fifo_naempty 	,           
		input 	wire [1-1:0] 			pkt_fifo_nempty 	,           
		output 	reg  [1-1:0] 			pkt_fifo_ren		,           
		input 	wire [DWID-1:0] 		pkt_fifo_rdata		,           
		input 	wire [MSG_WID-1:0] 		pkt_fifo_rmsg		,           
		input 	wire [1-1:0] 			ec_msg_fifo_nempty	,           
		output 	wire [1-1:0] 			ec_msg_fifo_ren   	,           
		input 	wire [ECMWID-1:0] 		ec_msg_fifo_rdata 	,           
		input 	wire [1-1:0] 			ec_dat_fifo_nempty	,           
		output 	reg  [1-1:0] 			ec_dat_fifo_ren   	,           
		input 	wire [DWID-1:0] 		ec_dat_fifo_rdata 	,           
		output 	reg  [1-1:0] 			out_pkt_vld		,           
		input 	wire [1-1:0] 			out_pkt_rdy		,           
		output 	reg  [DWID-1:0] 		out_pkt_dat		,           
		output 	reg  [OMSG_WID-1:0] 	out_pkt_msg		,            
		output 	wire [32-1:0] 			dbg_sig 			            
);
localparam 	VAL_EC_CMD_RM_HDR 	= 1	;
localparam 	VAL_EC_CMD_ADD_HDR 	= 2	;
localparam 	VAL_EC_CMD_TT 		= 3	; 
localparam 	VAL_EC_CMD_NEW_PKT      = 0     ;
localparam 	VAL_EC_CMD_DROP_PKT  	= 4	;
wire  out_pkt_sop_tmp;
wire  out_pkt_eop_tmp;
reg   [00:0]    	proc_pkt_flag		; 
wire  [10:0]    	proc_pkt_len		; 
reg   [15:0]    	proc_pkt_len_tmp	; 
reg   [10:0]    	proc_pkt_cnt		; 
reg 			proc_pkt_add		;
assign ec_msg_fifo_ren = ( pkt_fifo_nempty==1'b1 && ec_msg_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && proc_pkt_flag==1'b0 ) ? 1'b1 : 1'b0;
reg [ECMWID-1:0] 		ec_msg_dat_lat	;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		ec_msg_dat_lat <= 0;
	end
	else begin
		if( ec_msg_fifo_ren==1'b1 )begin
			ec_msg_dat_lat <= ec_msg_fifo_rdata;
		end
	end
end
wire  [3:0]		ec_cmd			; 
wire  [7:0]		ec_hdr_len		; 
wire  [15:0]    	pd_plen			; 
reg   [15:0]    	out_pkt_len		; 
wire  [15:0]    	pkt_fid			; 
wire  [31:0]    	pd_tcp_seqn		; 
wire  [7:0]		pd_tail_len		; 
wire  [3:0]		pd_chn_id		; 
wire  [3:0]   		pd_out_id		;
wire  [3:0]		ec_cmd_tmp		; 
wire  [7:0]		ec_hdr_len_tmp		; 
wire  [15:0]    	pd_plen_tmp		; 
wire  [15:0]    	pkt_fid_tmp		; 
wire  [31:0]    	pd_tcp_seqn_tmp		; 
wire  [7:0]		pd_tail_len_tmp		; 
wire  [3:0]		pd_chn_id_tmp		; 
wire  [3:0]   		pd_out_id_tmp		;
assign { ec_cmd[3:0], ec_hdr_len[7:0], pd_plen[15:0], pkt_fid[15:0], pd_tcp_seqn[31:0], pd_tail_len[7:0], pd_chn_id[3:0], pd_out_id[3:0] } = ec_msg_dat_lat;
assign { ec_cmd_tmp[3:0], ec_hdr_len_tmp[7:0], pd_plen_tmp[15:0], pkt_fid_tmp[15:0], 
			pd_tcp_seqn_tmp[31:0], pd_tail_len_tmp[7:0], pd_chn_id_tmp[3:0], pd_out_id_tmp[3:0] } = ec_msg_fifo_rdata;
reg   flag_more_cycle;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		flag_more_cycle <= 1'b0;
	end
	else begin
		if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd54 && (pd_plen[4:0]>5'd22||pd_plen[4:0]==5'd0) && proc_pkt_cnt==(proc_pkt_len-11'd2) && proc_pkt_add==1'b1 )begin    
			flag_more_cycle <= 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd8 && (pd_plen[4:0]>5'd8||pd_plen[4:0]==5'd0) && proc_pkt_cnt==(proc_pkt_len-11'd2) && proc_pkt_add==1'b1 )begin    
			flag_more_cycle <= 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd8 && (pd_plen[4:0]>5'd24||pd_plen[4:0]==5'd0) && proc_pkt_cnt==(proc_pkt_len-11'd2) && proc_pkt_add==1'b1 )begin 
			flag_more_cycle <= 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd54 && (pd_plen[4:0]>5'd10||pd_plen[4:0]==5'd0) && proc_pkt_cnt==(proc_pkt_len-11'd2) && proc_pkt_add==1'b1 )begin 
			flag_more_cycle <= 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd62 && (pd_plen[4:0]>5'd6||pd_plen[4:0]==5'd0) && proc_pkt_cnt==(proc_pkt_len-11'd2) && proc_pkt_add==1'b1 )begin 
			flag_more_cycle <= 1'b1;
		end
		else begin  
			flag_more_cycle <= 1'b0;
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		proc_pkt_flag <= 1'b0;
	end
	else begin
		if( ec_msg_fifo_ren==1'b1 ) begin
			proc_pkt_flag <= 1'b1;
                end
		else if( proc_pkt_cnt==(proc_pkt_len-1) && proc_pkt_add==1'b1 )begin
			proc_pkt_flag <= 1'b0;
                end
        end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		proc_pkt_len_tmp <= 0;
	end
	else begin
		if( ec_msg_fifo_ren==1'b1 ) begin
			if( ec_cmd_tmp==VAL_EC_CMD_TT )begin    
				proc_pkt_len_tmp <= pd_plen_tmp + 31;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_NEW_PKT )begin    
				proc_pkt_len_tmp <= pd_plen_tmp + 31;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_RM_HDR && ec_hdr_len_tmp[7:0]==8'd54 )begin    
				proc_pkt_len_tmp <= pd_plen_tmp + 10 + 31;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_RM_HDR && ec_hdr_len_tmp[7:0]==8'd8 )begin    
				proc_pkt_len_tmp <= pd_plen_tmp + 24 + 31;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_ADD_HDR && ec_hdr_len_tmp[7:0]==8 )begin 
				proc_pkt_len_tmp <= pd_plen_tmp + 8 + 31;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_ADD_HDR && ec_hdr_len_tmp[7:0]==8'd54 )begin 
				proc_pkt_len_tmp <= pd_plen_tmp + 54 + 31;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_ADD_HDR && ec_hdr_len_tmp[7:0]==8'd62 )begin 
				proc_pkt_len_tmp <= pd_plen_tmp + 62 + 31;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_DROP_PKT )begin    
				proc_pkt_len_tmp <= pd_plen_tmp + 31;
			end
			else begin  
				proc_pkt_len_tmp <= pd_plen_tmp + 31;
			end
		end
	end
end
assign proc_pkt_len = proc_pkt_len_tmp[15:5];
always @ ( * ) begin
	if( proc_pkt_flag==1'b1 ) begin
		if( ec_cmd==VAL_EC_CMD_TT && pkt_fifo_ren==1'b1 )begin    
			proc_pkt_add = 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_NEW_PKT && pkt_fifo_ren==1'b1 )begin    
			proc_pkt_add = 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd54 && (pkt_fifo_ren==1'b1||flag_more_cycle==1'b1) )begin    
			proc_pkt_add = 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd8 && (pkt_fifo_ren==1'b1||flag_more_cycle==1'b1) )begin    
			proc_pkt_add = 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8 && (pkt_fifo_ren==1'b1||flag_more_cycle==1'b1) )begin 
			proc_pkt_add = 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd54 && (pkt_fifo_ren==1'b1 || ec_dat_fifo_ren==1'b1 || flag_more_cycle==1'b1) )begin 
			proc_pkt_add = 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd62 && (pkt_fifo_ren==1'b1 || ec_dat_fifo_ren==1'b1 || flag_more_cycle==1'b1) ) begin 
			proc_pkt_add = 1'b1;
		end
		else if( ec_cmd==VAL_EC_CMD_DROP_PKT && pkt_fifo_ren==1'b1 )begin    
			proc_pkt_add = 1'b1;
		end
		else begin
			proc_pkt_add = 1'b0;
		end
	end
	else begin
		proc_pkt_add = 1'b0;
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		proc_pkt_cnt <= 0;
	end
	else begin
		if( proc_pkt_cnt==(proc_pkt_len-1) && proc_pkt_add==1'b1 )begin
			proc_pkt_cnt <= 0;
		end
		else if( proc_pkt_add==1'b1 )begin
			proc_pkt_cnt <= proc_pkt_cnt + 1'b1;
		end
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		out_pkt_len <= 0;
	end
	else begin
		if( ec_msg_fifo_ren==1'b1 ) begin
			if( ec_cmd_tmp==VAL_EC_CMD_TT )begin    
				out_pkt_len <= pd_plen_tmp;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_NEW_PKT )begin    
				out_pkt_len <= ec_hdr_len_tmp[7:0];
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_RM_HDR && ec_hdr_len_tmp[7:0]==8'd54 )begin    
				out_pkt_len <= pd_plen_tmp - 54 - pd_tail_len_tmp;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_RM_HDR && ec_hdr_len_tmp[7:0]==8'd8 )begin    
				out_pkt_len <= pd_plen_tmp - 8;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_ADD_HDR && ec_hdr_len_tmp[7:0]==8 )begin 
				out_pkt_len <= pd_plen_tmp + 8; 
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_ADD_HDR && ec_hdr_len_tmp[7:0]==8'd54 )begin 
				out_pkt_len <= pd_plen_tmp + 54;
			end
			else if( ec_cmd_tmp==VAL_EC_CMD_ADD_HDR && ec_hdr_len_tmp[7:0]==8'd62 )begin 
				out_pkt_len <= pd_plen_tmp + 62;
			end
			else begin  
				out_pkt_len <= pd_plen_tmp;
			end
		end
	end
end
always @ ( * ) begin
	if( proc_pkt_flag==1'b1 ) begin
	   	if( ec_cmd==VAL_EC_CMD_TT && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 )begin    
	   		pkt_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_NEW_PKT && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 )begin    
	   		pkt_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd54 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 )begin    
	   		pkt_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd8 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 )begin    
	   		pkt_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 )begin 
	   		pkt_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd54 && proc_pkt_cnt>16'h0 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 )begin 
	   		pkt_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd62 && proc_pkt_cnt>16'h0 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0  )begin 
	   		pkt_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_DROP_PKT && pkt_fifo_nempty==1'b1  )begin 
	   		pkt_fifo_ren = 1'b1;
	   	end
		else begin
	   		pkt_fifo_ren = 1'b0;
	   	end
	end
	else begin
		pkt_fifo_ren = 1'b0;
	end
end
wire  		ec_dat_fifo_ren_d1	;
wire      first_ec_dat_fifo_ren;
reg       first_ec_dat_fifo_ren_d1;
reg       first_ec_dat_fifo_ren_d2;
always@( posedge clk or posedge rst ) begin
				if( rst==1'b1 ) begin
								first_ec_dat_fifo_ren_d1 <= 1'b0;
								first_ec_dat_fifo_ren_d2 <= 1'b0;
				end
				else begin
								if( ec_msg_fifo_ren==1 )begin
												first_ec_dat_fifo_ren_d1 <= 1'b1;
								end
								else begin
												first_ec_dat_fifo_ren_d1 <= 1'b0;
								end
								first_ec_dat_fifo_ren_d2 <= first_ec_dat_fifo_ren_d1;
				end
end
always @ ( * ) begin
	if( proc_pkt_flag==1'b1 ) begin
	   	if( ec_cmd==VAL_EC_CMD_TT && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && proc_pkt_cnt<2 )begin    
	   		ec_dat_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_NEW_PKT && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && proc_pkt_cnt<2 )begin    
	   		ec_dat_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd54 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 && proc_pkt_cnt<2 )begin    
	   		ec_dat_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd8 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 && proc_pkt_cnt<2 )begin    
	   		ec_dat_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 && proc_pkt_cnt<2 )begin 
	   		ec_dat_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd54 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 && proc_pkt_cnt<2 )begin 
	   		ec_dat_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd62 && pkt_fifo_nempty==1'b1 && out_pkt_rdy==1'b1 && flag_more_cycle==1'b0 && proc_pkt_cnt<2 )begin 
	   		ec_dat_fifo_ren = 1'b1;
	   	end
	   	else if( ec_cmd==VAL_EC_CMD_DROP_PKT && pkt_fifo_nempty==1'b1 && proc_pkt_cnt<2 )begin    
	   		ec_dat_fifo_ren = 1'b1;
	   	end
		else begin
	   		ec_dat_fifo_ren = 1'b0;
	   	end
	end
	else if( ec_cmd==VAL_EC_CMD_DROP_PKT && first_ec_dat_fifo_ren_d2==1'b1 )begin
	   		ec_dat_fifo_ren = 1'b1;
	end
	else begin
	   	ec_dat_fifo_ren = 1'b0;
	end
end
reg	     out_pkt_vld_tmp    ;
reg [15:0]   cnt_out_pkt	;
reg [15:0]   cnt_out_pkt_d1	;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		cnt_out_pkt <= 16'h0;
		cnt_out_pkt_d1 <= 16'h0;
	end
	else begin
		cnt_out_pkt_d1 <= cnt_out_pkt;
		if( ec_msg_fifo_ren==1'b1 ) begin
			cnt_out_pkt <= 0;
		end
		else if( out_pkt_vld_tmp==1'b1 ) begin
			cnt_out_pkt <= cnt_out_pkt + 32;
		end
	end
end
reg [15:0]   cnt_in_pkt	;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		cnt_in_pkt <= 16'h0;
	end
	else begin
		if( pkt_fifo_ren==1'b1 && cnt_in_pkt+32>pd_plen ) begin
			cnt_in_pkt <= 0;
		end
		else if( pkt_fifo_ren==1'b1 ) begin
			cnt_in_pkt <= cnt_in_pkt + 32;
		end
	end
end
always @ ( * ) begin
	if( ec_cmd==VAL_EC_CMD_TT && pkt_fifo_ren==1'b1 )begin 
		out_pkt_vld_tmp = 1'b1;
	end
	else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len==54 && proc_pkt_add==1'b1 && proc_pkt_cnt>1 && cnt_out_pkt<out_pkt_len )begin 
		out_pkt_vld_tmp = 1'b1;
	end
	else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len==8 && proc_pkt_add==1'b1 && proc_pkt_cnt>0 && cnt_out_pkt<out_pkt_len )begin 
		out_pkt_vld_tmp = 1'b1;
	end
	else if( ec_cmd==VAL_EC_CMD_NEW_PKT && proc_pkt_add==1'b1 && cnt_out_pkt<out_pkt_len )begin 
		out_pkt_vld_tmp = 1'b1;
	end
	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && proc_pkt_add==1'b1 && cnt_out_pkt<out_pkt_len )begin 
		out_pkt_vld_tmp = 1'b1;
	end
	else if( ec_cmd==VAL_EC_CMD_DROP_PKT )begin  
		out_pkt_vld_tmp = 1'b0;
	end
	else begin
		out_pkt_vld_tmp = 1'b0;
	end
end
assign out_pkt_sop_tmp = ( out_pkt_vld_tmp==1'b1 && cnt_out_pkt==0 ) ? 1'b1 : 1'b0;
assign out_pkt_eop_tmp = ( out_pkt_vld_tmp==1'b1 && (cnt_out_pkt+32)>=out_pkt_len ) ? 1'b1 : 1'b0;
reg 	[DWID-1:0] 		out_pkt_dat_tmp			;
reg     [DWID-1:0]		pkt_fifo_rdata_1dly		;
always @ ( * ) begin
	if( ec_cmd==VAL_EC_CMD_TT )begin    
		out_pkt_dat_tmp = pkt_fifo_rdata;
	end
	else if( ec_cmd==VAL_EC_CMD_NEW_PKT && DAT_TYP=="ETH" )begin    
		out_pkt_dat_tmp = ec_dat_fifo_rdata;
	end
	else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd54 && DAT_TYP=="APP" )begin    
		out_pkt_dat_tmp = {pkt_fifo_rdata_1dly[0 +: 10*8], pkt_fifo_rdata[256-22*8 +: 22*8]};
	end
	else if( ec_cmd==VAL_EC_CMD_RM_HDR && ec_hdr_len[7:0]==8'd8 )begin    
		out_pkt_dat_tmp = {pkt_fifo_rdata_1dly[0 +: 24*8], pkt_fifo_rdata[256-8*8 +: 8*8]};
	end
	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8 && cnt_out_pkt_d1==0 && DAT_TYP=="APP" )begin 
		out_pkt_dat_tmp = {ec_dat_fifo_rdata[256-8*8 +: 8*8], pkt_fifo_rdata[256-24*8 +: 24*8]};
	end
	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8 && cnt_out_pkt_d1!=0 && DAT_TYP=="APP" )begin 
		out_pkt_dat_tmp = {pkt_fifo_rdata_1dly[0 +: 8*8], pkt_fifo_rdata[256-24*8 +: 24*8]};
	end
	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd54 && cnt_out_pkt_d1==0 && DAT_TYP=="ETH" )begin 
		out_pkt_dat_tmp = {ec_dat_fifo_rdata[0 +: 256]};
	end
	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd54 && cnt_out_pkt_d1==32 && DAT_TYP=="ETH" )begin 
		out_pkt_dat_tmp = { ec_dat_fifo_rdata[256-22*8 +: 22*8], pkt_fifo_rdata[256-10*8 +: 10*8] };
	end
	else if( ec_cmd==VAL_EC_CMD_ADD_HDR && ec_hdr_len[7:0]==8'd54 && DAT_TYP=="ETH" )begin 
		out_pkt_dat_tmp = { pkt_fifo_rdata_1dly[0 +: 22*8], pkt_fifo_rdata[256-10*8 +: 10*8] };
	end
	else begin  
		out_pkt_dat_tmp = pkt_fifo_rdata;
	end
end
reg out_pkt_vld_tmp_d1 ;
reg out_pkt_sop_tmp_d1 ;
reg out_pkt_eop_tmp_d1 ;
reg pkt_fifo_ren_1dly  ;
wire [4:0]	out_pkt_mty	;
reg  [4:0]	out_pkt_mty_d1	;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		pkt_fifo_ren_1dly   <= 0;
		pkt_fifo_rdata_1dly <= 0;
		out_pkt_vld_tmp_d1  <= 0;
		out_pkt_sop_tmp_d1  <= 0;
		out_pkt_eop_tmp_d1  <= 0;
		out_pkt_mty_d1      <= 0;
	end
	else begin
		pkt_fifo_ren_1dly <= pkt_fifo_ren;
		if( pkt_fifo_ren_1dly==1'b1 ) begin
			pkt_fifo_rdata_1dly <= pkt_fifo_rdata ;
		end
		out_pkt_vld_tmp_d1  <= out_pkt_vld_tmp;
		out_pkt_sop_tmp_d1  <= out_pkt_sop_tmp;
		out_pkt_eop_tmp_d1  <= out_pkt_eop_tmp;
		out_pkt_mty_d1      <= out_pkt_mty    ;
	end
end
wire [15:0]	out_pkt_len_tmp2;
wire [15:0]	out_pkt_len_tmp1;
wire [11:0]	out_pkt_cnt	;
wire [0:0]	flag_err	;
assign out_pkt_len_tmp2 = out_pkt_len + 12'd31;
assign out_pkt_cnt = {1'b0, out_pkt_len_tmp2[15:5]};
assign out_pkt_len_tmp1 = out_pkt_len - 1'b1;
assign out_pkt_mty = (out_pkt_eop_tmp==1'b1) ? ~out_pkt_len_tmp1[4:0] : 0;
assign flag_err = 1'b0;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		out_pkt_vld <= 0;
		out_pkt_dat <= 0;
		out_pkt_msg <= 0;
	end
	else begin
		out_pkt_vld <= out_pkt_vld_tmp_d1;
		out_pkt_dat <= out_pkt_dat_tmp;
		if( out_pkt_vld_tmp_d1==1'b1 ) begin
			if( DAT_TYP=="APP" ) begin
				out_pkt_msg <= { pd_tcp_seqn[31:0], pkt_fid[15:0], out_pkt_cnt[11:0], pd_chn_id[3:0], flag_err, 2'b0, out_pkt_mty_d1[4:0], 2'b0, out_pkt_sop_tmp_d1, out_pkt_eop_tmp_d1 }; 
			end
			else begin	
				out_pkt_msg <= { 4'h0, pd_out_id[3:0], flag_err, 2'b0, out_pkt_mty_d1[4:0], 2'b0, out_pkt_sop_tmp_d1, out_pkt_eop_tmp_d1 }; 
			end
		end
	end
end
wire  		pkt_fifo_ren_d1		;
wire  [31:0] 	cnt_pkt_sop		;
wire  [31:0] 	cnt_pkt_eop		;
wire  [31:0] 	cnt_ec_msg		;
wire  [31:0] 	cnt_ec_dat		;
wire  [31:0]    dbg_sig0		;
wire  [31:0]    dbg_sig1		;
wire  [31:0]    dbg_sig2		;
wire  [31:0]    dbg_sig3		;
wire  [31:0] 	cnt_out_nrdy		;
ctrl_dly #(.DWID(1), .DLY_NUM(1)) u_ctrl_pipe_pkt_ren ( .clk(clk), .rst(rst), .din( pkt_fifo_ren ), .dout( pkt_fifo_ren_d1 ) );
ctrl_dly #(.DWID(1), .DLY_NUM(1)) u_ctrl_pipe_ec_dat_ren ( .clk(clk), .rst(rst), .din( ec_dat_fifo_ren ), .dout( ec_dat_fifo_ren_d1 ) );
//dbg_cnt   #(.DWID(32))   u_dbg_pkt_sop_cnt   ( .clk(clk), .rst(rst), .clr_cnt(1'b0), .add_cnt(pkt_fifo_ren_d1&pkt_fifo_rmsg[1]), .dbg_cnt( cnt_pkt_sop ) );
//dbg_cnt   #(.DWID(32))   u_dbg_pkt_eop_cnt   ( .clk(clk), .rst(rst), .clr_cnt(1'b0), .add_cnt(pkt_fifo_ren_d1&pkt_fifo_rmsg[0]), .dbg_cnt( cnt_pkt_eop ) );
//dbg_cnt   #(.DWID(32))   u_dbg_ec_msg_cnt   ( .clk(clk), .rst(rst), .clr_cnt(1'b0), .add_cnt(ec_msg_fifo_ren), .dbg_cnt( cnt_ec_msg ) );
//dbg_cnt   #(.DWID(32))   u_dbg_ec_dat_cnt   ( .clk(clk), .rst(rst), .clr_cnt(1'b0), .add_cnt(ec_dat_fifo_ren), .dbg_cnt( cnt_ec_dat ) );
//dbg_cnt   #(.DWID(32))   u_dbg_out_nrdy_cnt   ( .clk(clk), .rst(rst), .clr_cnt(1'b0), .add_cnt(~out_pkt_rdy), .dbg_cnt( cnt_out_nrdy ) );
assign    dbg_sig0		= cnt_pkt_sop  ;
assign    dbg_sig1		= cnt_pkt_eop  ;
assign    dbg_sig2		= cnt_ec_msg   ;
assign    dbg_sig3		= cnt_ec_dat   ;
assign    dbg_sig		= { 16'h0, cnt_out_nrdy[7:0], cnt_pkt_sop[3:0], cnt_pkt_eop[3:0] };
endmodule
