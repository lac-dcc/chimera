`timescale 1ns / 1ps
import nic_top_define::*;
module tcp_tx_tab_act #(
		parameter    PDWID        = 128 			,       
		parameter    PDSZ         = 4 			    ,       
		parameter    REQ_WID      = 12 				, 		
		parameter    REQ_SZ       = 1 				, 		
		parameter    RSLT_SZ	  = 2    			, 		
		parameter    UPDATE_WID   = 256 			, 		
		parameter    UPDATE_SZ	  = 2    			, 		
		parameter    TAB_INFO_WID = 2   			, 		
		parameter    TAB_AWID     = 8 			    ,       
		parameter    TAB_DWID     = 128			    ,       
		parameter    DBG_WID      = 32			    
) (
		input	wire				clk		 		,
		input 	wire				rst				,
		input 	wire [1-1:0] 			sync_info_vld			,           
		output 	wire [1-1:0] 			sync_info_rdy			,           
		input 	wire [TAB_INFO_WID-1:0] 	sync_info_dat			,           
		input 	wire [1-1:0] 			sync_rslt_vld			,           
		output 	wire [1-1:0] 			sync_rslt_rdy			,           
		input 	wire [TAB_DWID-1:0] 		sync_rslt_dat			,           
		input 	wire [1-1:0] 			sync_pd_vld			,           
		output 	wire [1-1:0] 			sync_pd_rdy			,           
		input 	wire [PDWID-1:0] 		sync_pd_dat			,           
		output 	reg  [1-1:0] 			out_pd_vld			,           
		input 	wire [1-1:0] 			out_pd_rdy			,           
		output 	reg  [PDWID-1:0] 		out_pd_dat			,           
		output 	wire [1-1:0] 			tab_wreq_fifo_wen 		,           
		input 	wire [1-1:0] 			tab_wreq_fifo_nafull 		,           
		output 	wire [TAB_AWID-1:0] 		tab_wreq_fifo_wdata 		,           
		output 	wire [1-1:0] 			tab_wdat_fifo_wen 		,           
		input 	wire [1-1:0] 			tab_wdat_fifo_nafull 		,           
		output 	wire [TAB_DWID-1:0] 		tab_wdat_fifo_wdata 		,           
		input 	wire [47:0] 			cfg_sys_mac0 			,           
		input 	wire [47:0] 			cfg_sys_mac1 			,           
		input 	wire [31:0] 			cfg_sys_ip0 			,           
		input 	wire [31:0] 			cfg_sys_ip1 			,           
		input 	wire [15:0] 			cfg_toe_port0 			,           
		input 	wire [15:0] 			cfg_toe_port1 			,           
		input 	wire [31:0] 			cfg_sys_win 			,           
	  input 	wire [31:0] 			cfg_moe_bd_th    		,           
    input   wire [15:0]         cnt_write_bd_num    ,
    input   wire [15:0]         cnt_read_bd_num     ,
	  if_cfg_reg_toe.sink  u_if_cfg_reg_toe ,
	  if_dbg_reg_toe       u_if_dbg_reg_toe ,
		output 	wire [DBG_WID-1:0] 		dbg_sig 			      	
);
wire  [15:0]  cfg_write_bd_th;
wire  [15:0]  cfg_read_bd_th;
assign  cfg_write_bd_th  = cfg_moe_bd_th[31:16];
assign  cfg_read_bd_th   = cfg_moe_bd_th[15:00];
`include "common_define_value.v"
wire  [1-1:0] 		whole_pd_vld;
wire  [1-1:0] 		whole_pd_vld_pre;
wire  [PDWID*PDSZ-1:0] 	whole_pd_dat;
fix_cell_unf #(
	.DWID			( PDWID		),
	.CELL_SZ		( PDSZ     	),
	.CELL_GAP		( PDSZ     	)
)inst_pd_unf(
	.clk     		( clk			), 
	.rst    		( rst	 		),
	.cell_vld 		( sync_pd_vld		),	
	.cell_dat 		( sync_pd_dat		),	
  .whole_cell_vld_pre ( whole_pd_vld_pre  	), 
  .whole_cell_vld ( whole_pd_vld  	), 
	.whole_cell_dat ( whole_pd_dat  	)
);
`include "pkt_des_unpack.v"
wire [TAB_DWID*RSLT_SZ-1:0] whole_rslt_dat;
fix_cell_unf #(
	.DWID			( TAB_DWID	),
	.CELL_SZ		( RSLT_SZ   ),
	.CELL_GAP		( PDSZ     	)
)inst_rslt_unf(
	.clk     		( clk			), 
	.rst    		( rst	 		),
	.cell_vld 		( sync_rslt_vld		),	
	.cell_dat 		( sync_rslt_dat		),	
    .whole_cell_vld ( whole_rslt_vld  	), 
	.whole_cell_dat ( whole_rslt_dat  	)
);
wire  [001 -1:000] tcpr_tbl_vld						;
wire  [001 -1:000] tcpr_tbl_syn						;
wire  [001 -1:000] tcpr_tbl_synack				;
wire  [001 -1:000] tcpr_tbl_ack						;
wire  [001 -1:000] tcpr_tbl_fin						;
wire  [001 -1:000] tcpr_tbl_rst						;
wire  [004 -1:000] tcpr_tbl_win_scale						;
wire  [024 -1:000] tcpr_tbl_rx_pkt_hittm	;
wire  [032 -1:000] tcpr_tbl_key_sip					;
wire  [016 -1:000] tcpr_tbl_key_sp					;
wire  [048 -1:000] tcpr_tbl_key_smac		  	;
wire  [032 -1:000] tcpr_tbl_ini_remote_seqn		;
wire  [032 -1:000] tcpr_tbl_exp_remote_seqn		;
wire  [032 -1:000] tcpr_tbl_rcv_local_ackn		;
wire  [016 -1:000] tcpr_tbl_rcv_remote_win		;
wire  [008 -1:000] tcpr_tbl_rcv_dup_ack_cnt		; 
wire  [008 -1:000] tcpr_tbl_local_win   	;
assign tcpr_tbl_vld					         = whole_rslt_dat[ TAB_DWID*1+127 +: 001 ];
assign tcpr_tbl_ack					         = whole_rslt_dat[ TAB_DWID*1+126 +: 001 ];
assign tcpr_tbl_fin					         = whole_rslt_dat[ TAB_DWID*1+125 +: 001 ];
assign tcpr_tbl_rst					         = whole_rslt_dat[ TAB_DWID*1+124 +: 001 ];
assign tcpr_tbl_win_scale					   = whole_rslt_dat[ TAB_DWID*1+120 +: 004 ];
assign tcpr_tbl_rx_pkt_hittm	        = whole_rslt_dat[ TAB_DWID*1+096 +: 024 ];
assign tcpr_tbl_key_sip				        = whole_rslt_dat[ TAB_DWID*1+064 +: 032 ];
assign tcpr_tbl_key_sp				        = whole_rslt_dat[ TAB_DWID*1+048 +: 016 ];
assign tcpr_tbl_key_smac			        = whole_rslt_dat[ TAB_DWID*1+000 +: 048 ];
assign tcpr_tbl_ini_remote_seqn				= whole_rslt_dat[ TAB_DWID*0+096 +: 032 ];
assign tcpr_tbl_exp_remote_seqn				= whole_rslt_dat[ TAB_DWID*0+064 +: 032 ];
assign tcpr_tbl_rcv_local_ackn				= whole_rslt_dat[ TAB_DWID*0+032 +: 032 ];   
assign tcpr_tbl_rcv_remote_win				= whole_rslt_dat[ TAB_DWID*0+016 +: 016 ];   
assign tcpr_tbl_rcv_dup_ack_cnt				= whole_rslt_dat[ TAB_DWID*0+008 +: 008 ];   
assign tcpr_tbl_local_win    			= whole_rslt_dat[ TAB_DWID*0+000 +: 008 ];    
wire [TAB_INFO_WID-1:0] whole_info_dat	;
wire	info_rslt_vld 			;
wire	info_pd_vld 			;
fix_cell_unf #(
	.DWID			( TAB_INFO_WID	),
	.CELL_SZ		( 1         ),
	.CELL_GAP		( PDSZ     	)
)inst_info_unf(
	.clk     		( clk			), 
	.rst    		( rst	 		),
	.cell_vld 		( sync_info_vld		),	
	.cell_dat 		( sync_info_dat		),	
    	.whole_cell_vld ( whole_info_vld  	), 
	.whole_cell_dat ( whole_info_dat  	)
);
assign	info_rslt_vld 	= whole_info_dat[1];
assign	info_pd_vld 	= whole_info_dat[0];
reg  [47:0] 			nic_mac 		;           
reg  [31:0] 			nic_ip 			;           
reg  [15:0] 			nic_port 		;           
always @ ( * ) begin
	if( pd_tcp_fid[15:14]==0 ) begin
		nic_mac  = cfg_sys_mac0  ;
		nic_ip   = cfg_sys_ip0   ;
		nic_port = cfg_toe_port0 ;
	end
	else if(  pd_tcp_fid[15:14]==1 ) begin
		nic_mac  = cfg_sys_mac1  ;
		nic_ip   = cfg_sys_ip1   ;
		nic_port = cfg_toe_port1 ;
	end
	else begin
		nic_mac  = cfg_sys_mac0  ;
		nic_ip   = cfg_sys_ip0   ;
		nic_port = cfg_toe_port0 ;
	end
end
reg  	[003  :000]  	new_pd_fwd 	    	;
reg  	[007  :000]  	new_pd_ptyp 		;
reg  	[003  :000]  	new_pd_rsv0 		;
reg  	[015  :000]  	new_pd_tcp_fid 		;
reg  	[001  :000]  	new_pd_l5typ 		;
reg  	[001  :000]  	new_pd_credit 		;
reg  	[011  :000]  	new_pd_pptr 		;
reg  	[015  :000]  	new_pd_plen 		;
reg  	[003  :000]  	new_pd_chn_id 		;
reg  	[007  :000]  	new_pd_hdr_len 		;
reg  	[007  :000]  	new_pd_tail_len 	;
reg  	[015  :000]  	new_pd_tmp_cks  	;
reg  	[003  :000]  	new_pd_out_id  		;
reg  	[007  :000]  	new_pd_frag_fid  	;
reg     [004-1:000] 	new_pd_ip_ver  		;
reg     [004-1:000] 	new_pd_ip_ihl  		;
reg     [008-1:000] 	new_pd_ip_tos  		;
reg     [016-1:000] 	new_pd_ip_len  		;
reg     [016-1:000] 	new_pd_ip_id   		;
reg     [001-1:000] 	new_pd_ip_rsv0  	;
reg     [001-1:000] 	new_pd_ip_df   		;
reg     [001-1:000] 	new_pd_ip_mf   		;
reg     [013-1:000] 	new_pd_ip_fo   		;
reg     [008-1:000] 	new_pd_ip_ttl  		;
reg     [008-1:000] 	new_pd_ip_prtl 		;
reg     [016-1:000] 	new_pd_ip_cks  		;
reg     [032-1:000] 	new_pd_ip_sip  		;
reg     [032-1:000] 	new_pd_ip_dip  		;
reg     [016-1:000] 	new_pd_tcp_sp  		;
reg     [016-1:000] 	new_pd_tcp_dp  		;
reg     [032-1:000] 	new_pd_tcp_seqn 	;
reg     [032-1:000] 	new_pd_tcp_ackn 	;
reg     [004-1:000] 	new_pd_tcp_do 		;
reg     [006-1:000] 	new_pd_tcp_rsv0 	;
reg     [001-1:000] 	new_pd_tcp_urg 		;
reg     [001-1:000] 	new_pd_tcp_ack 		;
reg     [001-1:000] 	new_pd_tcp_psh 		;
reg     [001-1:000] 	new_pd_tcp_rst 		;
reg     [001-1:000] 	new_pd_tcp_syn 		;
reg     [001-1:000] 	new_pd_tcp_fin 		;
reg     [016-1:000] 	new_pd_tcp_win 		;
reg     [016-1:000] 	new_pd_tcp_cks 		;
reg     [016-1:000] 	new_pd_tcp_uptr 	;
reg     [032-1:000] 	new_pd_tcp_opt  		;
reg     [032-1:000] 	new_pd_tcp_opt1 		;
reg     [032-1:000] 	new_pd_tcp_opt2 		;
reg     [032-1:000] 	new_pd_tcp_opt3 		;
reg     [032-1:000] 	new_pd_tcp_opt4 		;
reg     [016-1:000] 	new_pd_tcp_opt_cks 		;
reg     [048-1:000] 	new_pd_smac 		;
wire 	[3:0] 	pd_act		;
reg  	[3:0] 	pd_act_reg	;
reg [15:0] sys_ip_id;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		sys_ip_id <= 16'h1000;
	end
	else begin
		if( whole_pd_vld==1'b1 && pd_fwd!=VAL_FWD_MAC ) begin
			sys_ip_id <= sys_ip_id + 1'b1;
		end
	end
end
wire 	[15:0]		ip_cks_tmp1		;
wire 	[15:0]		ip_cks_tmp2		;
wire 	[15:0]		ip_cks_tmp3		;
wire 	[15:0]		tcp_cks_tmp1		;
wire 	[15:0]		tcp_cks_tmp2		;
wire 	[15:0]		tcp_cks_tmp3		;
reg [19-1:0] ip_cks_step1_d1;
reg [19-1:0] ip_cks_step1_d2;
reg [19-1:0] ip_cks_step1_d3;
reg [19-1:0] ip_cks_step1_d4;
reg [19-1:0] ip_cks_step2_d1;
reg [19-1:0] ip_cks_step3_d1;
reg [16-1:0] ip_cks_step4_d1;
reg [19-1:0] ip_cks_step1_d1_reg;
reg [19-1:0] ip_cks_step1_d2_reg;
reg [19-1:0] ip_cks_step1_d3_reg;
reg [19-1:0] ip_cks_step1_d4_reg;
reg [19-1:0] ip_cks_step2_d1_reg;
reg [19-1:0] ip_cks_step3_d1_reg;
always @ ( * ) begin
	ip_cks_step1_d1 = new_pd_ip_len ;
	ip_cks_step1_d2 = nic_ip[31:16] + nic_ip[15:00];
	ip_cks_step1_d3 = tcpr_tbl_key_sip[31:16] + tcpr_tbl_key_sip[15:00];
	ip_cks_step1_d4 = sys_ip_id + {4'h4, 4'h5, 8'h0} + {8'h80, 8'h06} + 16'h0; 
	ip_cks_step2_d1 = ip_cks_step1_d1_reg + ip_cks_step1_d2_reg + ip_cks_step1_d3_reg + ip_cks_step1_d4_reg;
	ip_cks_step3_d1 = ip_cks_step2_d1_reg[15:0] + ip_cks_step2_d1_reg[18:16];
	ip_cks_step4_d1 = ~(ip_cks_step3_d1_reg[15:0] + ip_cks_step3_d1_reg[18:16]);
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		ip_cks_step1_d1_reg <= 0 ;
		ip_cks_step1_d2_reg <= 0 ;
		ip_cks_step1_d3_reg <= 0 ;
		ip_cks_step1_d4_reg <= 0 ;
		ip_cks_step2_d1_reg <= 0 ;
		ip_cks_step3_d1_reg <= 0 ;
	end
	else begin
		ip_cks_step1_d1_reg <= ip_cks_step1_d1 ;
		ip_cks_step1_d2_reg <= ip_cks_step1_d2 ;
		ip_cks_step1_d3_reg <= ip_cks_step1_d3 ;
		ip_cks_step1_d4_reg <= ip_cks_step1_d4 ;
		ip_cks_step2_d1_reg <= ip_cks_step2_d1 ;
		ip_cks_step3_d1_reg <= ip_cks_step3_d1 ;
	end
end
reg [20-1:0] tcp_cks_step1_d1;
reg [20-1:0] tcp_cks_step1_d2;
reg [20-1:0] tcp_cks_step1_d3;
reg [20-1:0] tcp_cks_step1_d4;
reg [20-1:0] tcp_cks_step2_d1;
reg [17-1:0] tcp_cks_step3_d1;
reg [16-1:0] tcp_cks_step4_d1;
reg [20-1:0] tcp_cks_step1_d1_reg;
reg [20-1:0] tcp_cks_step1_d2_reg;
reg [20-1:0] tcp_cks_step1_d3_reg;
reg [20-1:0] tcp_cks_step1_d4_reg;
reg [20-1:0] tcp_cks_step2_d1_reg;
reg [17-1:0] tcp_cks_step3_d1_reg;
reg [15:0] tcp_len;
reg [15:0] tcp_flags;
reg [15:0] tcp_payload_cks;
always @ ( * ) begin
        tcp_flags        = {new_pd_tcp_do[3:0], new_pd_tcp_rsv0[5:0], new_pd_tcp_urg[0], new_pd_tcp_ack[0], new_pd_tcp_psh[0], new_pd_tcp_rst[0], new_pd_tcp_syn[0], new_pd_tcp_fin[0]};
	tcp_len          = (pd_fwd==VAL_FWD_TOE && pd_ptyp==VAL_PTYP_PKT_SYNACK) ? 16'd28 : (pd_fwd==VAL_FWD_TOE) ? 16'd20 : (16'd20+pd_plen); 
	tcp_payload_cks  = (pd_fwd==VAL_FWD_TOE && pd_ptyp==VAL_PTYP_PKT_SYNACK) ? (new_pd_tcp_opt_cks[15:0]) : (pd_fwd==VAL_FWD_TOE) ? 16'h00 : new_pd_tmp_cks[15:0];
	tcp_cks_step1_d1 = {4'h0, tcp_len[15:0]} + 20'h0006 + {4'h0, tcp_flags[15:0]} + {4'h0, tcp_payload_cks[15:0]};
	tcp_cks_step1_d2 = {4'h0,nic_ip[31:16]} + {4'h0,nic_ip[15:00]} + {4'h0,tcpr_tbl_key_sip[31:16]} + {4'h0,tcpr_tbl_key_sip[15:00]}; 
	tcp_cks_step1_d3 = {4'h0,pd_tcp_seqn[31:16]} + {4'h0,pd_tcp_seqn[15:00]} + {4'h0,new_pd_tcp_ackn[31:16]} + {4'h0,new_pd_tcp_ackn[15:00]}; 
	tcp_cks_step1_d4 = {4'h0,new_pd_tcp_sp[15:0]} + {4'h0,new_pd_tcp_dp[15:0]} + {4'h0,new_pd_tcp_win[15:0]};
	tcp_cks_step2_d1 = tcp_cks_step1_d1_reg + tcp_cks_step1_d2_reg + tcp_cks_step1_d3_reg + tcp_cks_step1_d4_reg;
	tcp_cks_step3_d1 = tcp_cks_step2_d1_reg[15:0] + tcp_cks_step2_d1_reg[19:16];
	tcp_cks_step4_d1 = ~(tcp_cks_step3_d1_reg[15:0] + tcp_cks_step3_d1_reg[16]);
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		tcp_cks_step1_d1_reg <= 0 ;
		tcp_cks_step1_d2_reg <= 0 ;
		tcp_cks_step1_d3_reg <= 0 ;
		tcp_cks_step1_d4_reg <= 0 ;
		tcp_cks_step2_d1_reg <= 0 ;
		tcp_cks_step3_d1_reg <= 0 ;
	end
	else begin
		tcp_cks_step1_d1_reg <= tcp_cks_step1_d1 ;
		tcp_cks_step1_d2_reg <= tcp_cks_step1_d2 ;
		tcp_cks_step1_d3_reg <= tcp_cks_step1_d3 ;
		tcp_cks_step1_d4_reg <= tcp_cks_step1_d4 ;
		tcp_cks_step2_d1_reg <= tcp_cks_step2_d1 ;
		tcp_cks_step3_d1_reg <= tcp_cks_step3_d1 ;
	end
end
reg flag_bd_bp;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		flag_bd_bp <= 1'b0;
	end
	else begin
					if( whole_pd_vld_pre==1'b1 ) begin
									flag_bd_bp <= (cnt_write_bd_num<(u_if_cfg_reg_toe.cfg_write_bd_low_th) || cnt_read_bd_num<(u_if_cfg_reg_toe.cfg_read_bd_low_th)) ? 1'b1 : 1'b0;
					end
	end
end
always @ ( * ) begin
		new_pd_fwd	    	=   ( (tcpr_tbl_vld==1'b0&&(pd_out_id==4'h0||pd_out_id==4'h1)&&pd_tcp_fid>=16'ha) || (pd_ptyp>=VAL_PTYP_DROP_MAC_ERR && pd_ptyp<VAL_PTYP_READ) ) ? VAL_FWD_DROP : pd_fwd;	
		new_pd_ptyp     	=   pd_ptyp     		;
		new_pd_tcp_fid  	=   pd_tcp_fid  		;
		new_pd_l5typ    	=   pd_l5typ    		;
		new_pd_credit   	=   pd_credit   		;
		new_pd_pptr     	=   pd_pptr     		;
		new_pd_plen     	=   pd_plen     		;
		new_pd_chn_id    	=   pd_chn_id       ; 
		new_pd_hdr_len  	=   pd_hdr_len  		;
		new_pd_tail_len 	=   pd_tail_len 		;
		new_pd_tmp_cks  	=   pd_tmp_cks			;
		new_pd_out_id    	=   pd_out_id       ;
		new_pd_frag_fid 	=   pd_frag_fid 		;
		new_pd_ip_ver  		=   4'h4			;
		new_pd_ip_ihl  		=   4'h5			;
		new_pd_ip_tos  		=   8'h0			;
		new_pd_ip_len  		=   (pd_fwd==VAL_FWD_APP) ? (16'd40 + pd_plen) : 
						( pd_fwd==VAL_FWD_TOE && pd_ptyp==VAL_PTYP_PKT_SYNACK ) ? 16'd48 : 16'd40;  
		new_pd_ip_id   		=   sys_ip_id	;
		new_pd_ip_rsv0  	=   1'b0			;
		new_pd_ip_df   		=   1'b0			;
		new_pd_ip_mf   		=   1'b0			;
		new_pd_ip_fo   		=   13'h0			;
		new_pd_ip_ttl  		=   8'h80			;
		new_pd_ip_prtl 		=   8'h06			;
		new_pd_ip_cks  		=   ip_cks_step4_d1		;
		new_pd_ip_sip  		=   nic_ip			;
		new_pd_ip_dip  		=   tcpr_tbl_key_sip 		;
		new_pd_tcp_sp  		=   {nic_port[15:14], pd_tcp_fid[13:0]} ;
		new_pd_tcp_dp  		=   (pd_tcp_fid[15:14]==2'b11) ? pd_tcp_fid[15:0] : tcpr_tbl_key_sp ;
		new_pd_tcp_seqn 	=   pd_tcp_seqn 		;
    new_pd_tcp_ackn 	=   pd_tcp_ackn ;
		new_pd_tcp_do 		=   (pd_ptyp==VAL_PTYP_PKT_SYN || pd_ptyp==VAL_PTYP_PKT_SYNACK) ? 4'h7 : 4'h5;
		new_pd_tcp_rsv0 	=   6'h0			;
		new_pd_tcp_urg 		=   1'b0			;
		new_pd_tcp_ack 		=   (pd_ptyp!=VAL_PTYP_PKT_SYN) ? 1'b1 : 1'b0;
		new_pd_tcp_psh 		=   1'b0			;
		new_pd_tcp_rst 		=   (pd_ptyp==VAL_PTYP_PKT_RST||pd_ptyp==VAL_PTYP_POL_RST) ? 1'b1 : 1'b0 ;
		new_pd_tcp_syn 		=   (pd_ptyp==VAL_PTYP_PKT_SYN || pd_ptyp==VAL_PTYP_PKT_SYNACK) ? 1'b1 : 1'b0 ;
		new_pd_tcp_fin 		=   (pd_ptyp==VAL_PTYP_PKT_FIN) ? 1'b1 : 1'b0 ;
		new_pd_tcp_win 		=   (cfg_sys_win[15:0]!=16'h0) ? cfg_sys_win[15:0] : 
						              {tcpr_tbl_local_win[7:0],8'h00}; 
		new_pd_tcp_cks 		=   tcp_cks_step4_d1[15:0]	;
		new_pd_tcp_uptr 	=   16'h0			;
		new_pd_tcp_opt1 	=   32'h020405b4		; 	
		new_pd_tcp_opt2 	=   32'h01030301		; 	
		new_pd_tcp_opt3 	=   32'h01010101		; 	
		new_pd_tcp_opt4 	=   32'h01030305		; 	
    new_pd_smac        = tcpr_tbl_key_smac  ;
    new_pd_tcp_opt_cks = (u_if_cfg_reg_toe.cfg_toe_mode[5]==1'b1 && tcpr_tbl_win_scale!=4'h0) ? 16'h0bc0 : (u_if_cfg_reg_toe.cfg_toe_mode[4]==1'b1 && tcpr_tbl_win_scale!=4'h0) ? 16'h0bbc : 16'h09ba  ; 
		new_pd_tcp_opt     = (u_if_cfg_reg_toe.cfg_toe_mode[5]==1'b1 && tcpr_tbl_win_scale!=4'h0) ? 32'h2 : (u_if_cfg_reg_toe.cfg_toe_mode[4]==1'b1 && tcpr_tbl_win_scale!=4'h0) ? 32'h1 : 32'h0 ; 
end
reg  [PDWID*PDSZ-1:0] new_whole_pd_dat;
reg  [PDWID*PDSZ-1:0] new_whole_pd_dat_reg;
always @ ( * ) begin
	new_whole_pd_dat[128*3+124 +: 004]	= new_pd_fwd	    	;	
	new_whole_pd_dat[128*3+116 +: 008]	= new_pd_ptyp     	;
	new_whole_pd_dat[128*3+113 +: 003]	= 3'h0           	  ;
	new_whole_pd_dat[128*3+112 +: 001]	= 1'h1           	  ; 
	new_whole_pd_dat[128*3+096 +: 016]	= new_pd_tcp_fid  	;
	new_whole_pd_dat[128*3+094 +: 002]	= new_pd_l5typ    	;
	new_whole_pd_dat[128*3+092 +: 002]	= new_pd_credit   	;
	new_whole_pd_dat[128*3+080 +: 012]	= new_pd_pptr     	;
	new_whole_pd_dat[128*3+064 +: 016]	= new_pd_plen     	;
	new_whole_pd_dat[128*3+060 +: 004]	= new_pd_chn_id    	;
	new_whole_pd_dat[128*3+052 +: 008]	= new_pd_hdr_len  	;
	new_whole_pd_dat[128*3+044 +: 008]	= new_pd_tail_len 	;
	new_whole_pd_dat[128*3+028 +: 016]	= new_pd_tmp_cks  	;
	new_whole_pd_dat[128*3+024 +: 004]	= new_pd_out_id   	; 
	new_whole_pd_dat[128*3+016 +: 008]	= new_pd_frag_fid 	;
	new_whole_pd_dat[128*3+012 +: 004]	= new_pd_ip_ver  	;
	new_whole_pd_dat[128*3+008 +: 004]	= new_pd_ip_ihl  	;
	new_whole_pd_dat[128*3+000 +: 008]	= new_pd_ip_tos  	;
	new_whole_pd_dat[128*2+112 +: 016]	= new_pd_ip_len  	;
	new_whole_pd_dat[128*2+096 +: 016]	= new_pd_ip_id   	;
	new_whole_pd_dat[128*2+095 +: 001]	= new_pd_ip_rsv0  	;
	new_whole_pd_dat[128*2+094 +: 001]	= new_pd_ip_df   	;
	new_whole_pd_dat[128*2+093 +: 001]	= new_pd_ip_mf   	;
	new_whole_pd_dat[128*2+080 +: 013]	= new_pd_ip_fo   	;
	new_whole_pd_dat[128*2+072 +: 008]	= new_pd_ip_ttl  	;
	new_whole_pd_dat[128*2+064 +: 008]	= new_pd_ip_prtl 	;
	new_whole_pd_dat[128*2+048 +: 016]	= new_pd_ip_cks  	;
	new_whole_pd_dat[128*2+016 +: 032]	= new_pd_ip_sip  	;
	new_whole_pd_dat[128*2+000 +: 016]	= new_pd_ip_dip[31:16] 	;
	new_whole_pd_dat[128*1+112 +: 016]	= new_pd_ip_dip[15:0]  	;
	new_whole_pd_dat[128*1+096 +: 016]	= new_pd_tcp_sp  	;
	new_whole_pd_dat[128*1+080 +: 016]	= new_pd_tcp_dp  	;
	new_whole_pd_dat[128*1+048 +: 032]	= new_pd_tcp_seqn 	;
	new_whole_pd_dat[128*1+016 +: 032]	= new_pd_tcp_ackn 	;
	new_whole_pd_dat[128*1+012 +: 004]	= new_pd_tcp_do 	;
	new_whole_pd_dat[128*1+006 +: 006]	= new_pd_tcp_rsv0 	;
	new_whole_pd_dat[128*1+005 +: 001]	= new_pd_tcp_urg 	;
	new_whole_pd_dat[128*1+004 +: 001]	= new_pd_tcp_ack 	;
	new_whole_pd_dat[128*1+003 +: 001]	= new_pd_tcp_psh 	;
	new_whole_pd_dat[128*1+002 +: 001]	= new_pd_tcp_rst 	;
	new_whole_pd_dat[128*1+001 +: 001]	= new_pd_tcp_syn 	;
	new_whole_pd_dat[128*1+000 +: 001]	= new_pd_tcp_fin 	;
	new_whole_pd_dat[128*0+112 +: 016]	= new_pd_tcp_win 	;
	new_whole_pd_dat[128*0+096 +: 016]	= new_pd_tcp_cks 	;
	new_whole_pd_dat[128*0+080 +: 016]	= new_pd_tcp_uptr 	;
	new_whole_pd_dat[128*0+048 +: 032]	= new_pd_tcp_opt 	;
	new_whole_pd_dat[128*0+000 +: 048]	= new_pd_smac 		;
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		new_whole_pd_dat_reg <= 0;
	end
	else begin
		if( flag_step[3]==1'b1 ) begin
			new_whole_pd_dat_reg <= new_whole_pd_dat;
		end
	end
end
reg [PDWID-1:0] new_pd_dat;
always @ ( * ) begin
	if( flag_out_step[0]==1'b1 ) begin
		new_pd_dat             = new_whole_pd_dat_reg[128*3+0 +: 128];
	end
	else if( flag_out_step[1]==1'b1 ) begin
		new_pd_dat             = new_whole_pd_dat_reg[128*2+0 +: 128];
	end
	else if( flag_out_step[2]==1'b1 ) begin
		new_pd_dat             = new_whole_pd_dat_reg[128*1+0 +: 128];
	end
	else begin 
		new_pd_dat             = new_whole_pd_dat_reg[128*0+0 +: 128];
	end
end
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		out_pd_vld <= 0;
		out_pd_dat <= 0;
	end
	else begin
		out_pd_vld <= |flag_out_step[3:0];
		out_pd_dat <= new_pd_dat;
	end
end
assign tab_wreq_fifo_wen 		= 0;           
assign tab_wreq_fifo_wdata 		= 0;           
assign tab_wdat_fifo_wen 		= 0;           
assign tab_wdat_fifo_wdata 		= 0;           
assign sync_info_rdy = out_pd_rdy & tab_wreq_fifo_nafull & tab_wdat_fifo_nafull;  
assign sync_rslt_rdy = out_pd_rdy & tab_wreq_fifo_nafull & tab_wdat_fifo_nafull; 
assign sync_pd_rdy   = out_pd_rdy & tab_wreq_fifo_nafull & tab_wdat_fifo_nafull; 
wire [3:0] pd_cnt;
wire [31:0] in_pd_cnt;
wire [31:0] drop_pd_cnt;
wire [31:0] mac_pd_cnt;
wire [31:0] toe_pd_cnt;
wire [31:0] app_pd_cnt;
wire [31:0] out_syn_cnt;
wire [31:0] out_fin_cnt;
wire [31:0] out_rst_cnt;
wire [31:0] loop_rst_cnt;
reg  [032 -1:000] max_tcpr_tbl_exp_remote_seqn		;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
       max_tcpr_tbl_exp_remote_seqn	<= 0;
	end
	else if( flag_step[3]==1'b1 && max_tcpr_tbl_exp_remote_seqn<tcpr_tbl_exp_remote_seqn )begin
       max_tcpr_tbl_exp_remote_seqn <= tcpr_tbl_exp_remote_seqn;
	end
end
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_in_pd_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( whole_pd_vld==1'b1 ),                                      .dbg_cnt( in_pd_cnt    ) );
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_drop_pd_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( flag_step[3]==1'b1&&new_pd_fwd==VAL_FWD_DROP ),                                      .dbg_cnt( drop_pd_cnt    ) );
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_mac_pd_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( flag_step[3]==1'b1&&new_pd_fwd==VAL_FWD_MAC ),                                      .dbg_cnt( mac_pd_cnt    ) );
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_toe_pd_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( flag_step[3]==1'b1&&new_pd_fwd==VAL_FWD_TOE ),                                      .dbg_cnt( toe_pd_cnt    ) );
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_app_pd_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( flag_step[3]==1'b1&&new_pd_fwd==VAL_FWD_APP ),                                      .dbg_cnt( app_pd_cnt    ) );
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_out_syn_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( flag_step[3]==1'b1&&new_pd_ptyp==VAL_PTYP_PKT_SYNACK ),                               .dbg_cnt( out_syn_cnt   ) );
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_out_fin_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( flag_step[3]==1'b1&&new_pd_ptyp==VAL_PTYP_PKT_FIN ),                               .dbg_cnt( out_fin_cnt   ) );
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_out_rst_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( flag_step[3]==1'b1&&new_pd_ptyp==VAL_PTYP_PKT_RST ),                               .dbg_cnt( out_rst_cnt   ) );
dbg_cnt #( .DWID(32), .LEVEL_EDGE(1) ) u_dbg_loop_rst_cnt   ( .clk(clk), .rst(rst), .clr_cnt(u_if_cfg_reg_toe.cfg_clr_cnt ), .add_cnt( flag_step[3]==1'b1&&new_pd_ptyp==VAL_PTYP_PKT_RST && pd_tcp_fid[15:14]==2'h3 ),          .dbg_cnt( loop_rst_cnt   ) );
dbg_cnt u_dbg_pd_cnt( .clk(clk), .rst(rst), .clr_cnt(1'b0), .add_cnt( whole_pd_vld ), .dbg_cnt( pd_cnt ) );
assign dbg_sig = { pd_tcp_fid[15:0], new_pd_fwd[3:0], new_pd_ptyp[7:0], pd_cnt[3:0] };
assign u_if_dbg_reg_toe.tcpt_in_pd_cnt    = in_pd_cnt    ;
assign u_if_dbg_reg_toe.tcpt_drop_pd_cnt  = drop_pd_cnt  ;
assign u_if_dbg_reg_toe.tcpt_mac_pd_cnt   = mac_pd_cnt   ;
assign u_if_dbg_reg_toe.tcpt_toe_pd_cnt   = toe_pd_cnt   ;
assign u_if_dbg_reg_toe.tcpt_app_pd_cnt   = app_pd_cnt   ;
assign u_if_dbg_reg_toe.tcpt_out_syn_cnt  = out_syn_cnt  ;
assign u_if_dbg_reg_toe.tcpt_out_fin_cnt  = out_fin_cnt  ;
assign u_if_dbg_reg_toe.tcpt_out_rst_cnt  = out_rst_cnt  ;
assign u_if_dbg_reg_toe.tcpt_loop_rst_cnt = loop_rst_cnt ;
endmodule
