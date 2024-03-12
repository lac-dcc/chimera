wire 	[003  :000]  	pd_fwd 	    		;
wire 	[007  :000]  	pd_ptyp 		;
wire 	[003  :000]  	pd_win_scale 		;
wire 	[000  :000]  	pd_rls_flag   ;
wire 	[015  :000]  	pd_tcp_fid 		;
wire 	[000  :000]  	pd_l5typ 		;
wire 	[001  :000]  	pd_credit 		;
wire 	[011  :000]  	pd_pptr 		;
wire 	[015  :000]  	pd_plen 		;
wire 	[003  :000]  	pd_chn_id 		;
wire 	[007  :000]  	pd_hdr_len 		;
wire 	[007  :000]  	pd_tail_len 		;
wire 	[015  :000]  	pd_tmp_cks  		;
wire 	[003  :000]  	pd_out_id  		;
wire 	[007  :000]  	pd_frag_fid  		;
wire    [004-1:000] 	pd_ip_ver  		;
wire    [004-1:000] 	pd_ip_ihl  		;
wire    [008-1:000] 	pd_ip_tos  		;
wire    [016-1:000] 	pd_ip_len  		;
wire    [016-1:000] 	pd_ip_id   		;
wire    [001-1:000] 	pd_ip_rsv0  		;
wire    [001-1:000] 	pd_ip_df   		;
wire    [001-1:000] 	pd_ip_mf   		;
wire    [013-1:000] 	pd_ip_fo   		;
wire    [008-1:000] 	pd_ip_ttl  		;
wire    [008-1:000] 	pd_ip_prtl 		;
wire    [016-1:000] 	pd_ip_cks  		;
wire    [032-1:000] 	pd_ip_sip  		;
wire    [032-1:000] 	pd_ip_dip  		;
wire    [016-1:000] 	pd_tcp_sp  		;
wire    [016-1:000] 	pd_tcp_dp  		;
wire    [032-1:000] 	pd_tcp_seqn 		;
wire    [032-1:000] 	pd_tcp_ackn 		;
wire    [004-1:000] 	pd_tcp_do 		;
wire    [006-1:000] 	pd_tcp_rsv0 		;
wire    [001-1:000] 	pd_tcp_urg 		;
wire    [001-1:000] 	pd_tcp_ack 		;
wire    [001-1:000] 	pd_tcp_psh 		;
wire    [001-1:000] 	pd_tcp_rst 		;
wire    [001-1:000] 	pd_tcp_syn 		;
wire    [001-1:000] 	pd_tcp_fin 		;
wire    [016-1:000] 	pd_tcp_win 		;
wire    [016-1:000] 	pd_tcp_cks 		;
wire    [016-1:000] 	pd_tcp_uptr 		;
wire    [032-1:000] 	pd_tcp_opt 		;
wire    [048-1:000] 	pd_smac 		;
assign  pd_fwd	          = total_pd_dat[128*3+124 +: 004];	
assign  pd_ptyp           = total_pd_dat[128*3+116 +: 008];
assign  pd_win_scale[2:0] = total_pd_dat[128*3+113 +: 003];
assign  pd_rls_flag       = total_pd_dat[128*3+112 +: 001];
assign  pd_tcp_fid        = total_pd_dat[128*3+096 +: 016];
assign  pd_win_scale[3]   = total_pd_dat[128*3+095 +: 001];
assign  pd_l5typ    = total_pd_dat[128*3+094 +: 001];
assign  pd_credit   = total_pd_dat[128*3+092 +: 002];
assign  pd_pptr     = total_pd_dat[128*3+080 +: 012];
assign  pd_plen     = total_pd_dat[128*3+064 +: 016];
assign  pd_chn_id   = total_pd_dat[128*3+060 +: 004];
assign  pd_hdr_len  = total_pd_dat[128*3+052 +: 008];
assign  pd_tail_len = total_pd_dat[128*3+044 +: 008];
assign  pd_tmp_cks  = total_pd_dat[128*3+028 +: 016];
assign  pd_out_id   = total_pd_dat[128*3+024 +: 004]; 
assign  pd_frag_fid = total_pd_dat[128*3+016 +: 008];
assign  pd_ip_ver  	= total_pd_dat[128*3+012 +: 004];
assign  pd_ip_ihl  	= total_pd_dat[128*3+008 +: 004];
assign  pd_ip_tos  	= total_pd_dat[128*3+000 +: 008];
assign  pd_ip_len  	= total_pd_dat[128*2+112 +: 016];
assign  pd_ip_id   	= total_pd_dat[128*2+096 +: 016];
assign  pd_ip_rsv0  	= total_pd_dat[128*2+095 +: 001];
assign  pd_ip_df   	= total_pd_dat[128*2+094 +: 001];
assign  pd_ip_mf   	= total_pd_dat[128*2+093 +: 001];
assign  pd_ip_fo   	= total_pd_dat[128*2+080 +: 013];
assign  pd_ip_ttl  	= total_pd_dat[128*2+072 +: 008];
assign  pd_ip_prtl 	= total_pd_dat[128*2+064 +: 008];
assign  pd_ip_cks  	= total_pd_dat[128*2+048 +: 016];
assign  pd_ip_sip  	= total_pd_dat[128*2+016 +: 032];
assign  pd_ip_dip  	={total_pd_dat[128*2+000 +: 016], 
						  total_pd_dat[128*1+112 +: 016] };
assign  pd_tcp_sp  	= total_pd_dat[128*1+096 +: 016];
assign  pd_tcp_dp  	= total_pd_dat[128*1+080 +: 016];
assign  pd_tcp_seqn 	= total_pd_dat[128*1+048 +: 032];
assign  pd_tcp_ackn 	= total_pd_dat[128*1+016 +: 032];
assign  pd_tcp_do 	= total_pd_dat[128*1+012 +: 004];
assign  pd_tcp_rsv0 	= total_pd_dat[128*1+006 +: 006];
assign  pd_tcp_urg 	= total_pd_dat[128*1+005 +: 001];
assign  pd_tcp_ack 	= total_pd_dat[128*1+004 +: 001];
assign  pd_tcp_psh 	= total_pd_dat[128*1+003 +: 001];
assign  pd_tcp_rst 	= total_pd_dat[128*1+002 +: 001];
assign  pd_tcp_syn 	= total_pd_dat[128*1+001 +: 001];
assign  pd_tcp_fin 	= total_pd_dat[128*1+000 +: 001];
assign  pd_tcp_win 	= total_pd_dat[128*0+112 +: 016];
assign  pd_tcp_cks 	= total_pd_dat[128*0+096 +: 016];
assign  pd_tcp_uptr 	= total_pd_dat[128*0+080 +: 016];
assign  pd_tcp_opt 	= total_pd_dat[128*0+048 +: 032];
assign  pd_smac 	= total_pd_dat[128*0+000 +: 048];
reg [PDSZ-1:0] flag_step;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		flag_step <= 0;
	end
	else begin
		flag_step <= { flag_step[PDSZ-2:0], total_pd_vld };
	end
end
reg [PDSZ-1:0] flag_out_step;
always @ ( posedge clk or posedge rst ) begin
	if( rst==1'b1 )begin
		flag_out_step <= 0;
	end
	else begin
		flag_out_step <= { flag_out_step[PDSZ-2:0], flag_step[PDSZ-1] };
	end
end
