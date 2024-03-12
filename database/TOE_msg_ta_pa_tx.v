`timescale 1ns / 1ps
module pa_tx #(
        parameter    DWID         = 256 			,                               
        parameter    MSG_WID      = 76   			,                               
        parameter    FCMWID       = 50     			,				
        parameter    PDWID        = 128 			,                               
        parameter    CELL_SZ      = 4 				                           	
) (
        input	wire			clk  					,
        input 	wire			rst						,
        input 	wire [1-1:0] 		fst_cell_vld		,                       
        output 	wire [1-1:0] 		fst_cell_rdy		,                       
        input 	wire [DWID-1:0] 	fst_cell_dat		,                       
        input 	wire [FCMWID-1:0] 	fst_cell_msg		,                       
        output  reg  [1-1:0]            out_pd_vld 		,			
        input   wire [1-1:0]            out_pd_rdy 		, 			
        output  reg  [PDWID-1:0]        out_pd_dat 					
);
`include "bd_descriptor_value.v"
wire [32-1:00]  info_ackn 	; 
wire [32-1:00]  info_seqn 	; 
wire [16-1:00]  info_fid 	; 
wire [01-1:00]  info_eoc 	; 
wire [01-1:00]  info_soc     	; 
wire [04-1:00]  info_chn_id  	; 
wire [01-1:00]  info_err     	; 
wire [16-1:00]  info_cks     	; 
wire [16-1:00]  info_plen    	; 
wire [12-1:00]  info_pptr    	; 
assign  info_eoc    = fst_cell_msg[002 +: 001]; 
assign  info_soc    = fst_cell_msg[003 +: 001]; 
assign  info_err    = fst_cell_msg[011 +: 001]; 
assign  info_chn_id = fst_cell_msg[012 +: 004]; 
assign  info_fid    = fst_cell_msg[MSG_WID-80 +: 016]; 
assign  info_seqn   = fst_cell_msg[MSG_WID-64 +: 032]; 
assign  info_ackn   = fst_cell_msg[MSG_WID-32 +: 032]; 
assign  info_cks    = fst_cell_msg[MSG_WID    +: 016]; 
assign  info_plen   = fst_cell_msg[MSG_WID+16 +: 016]; 
assign  info_pptr   = fst_cell_msg[MSG_WID+32 +: 012]; 
wire [7:0]  pkt_ptyp         ;
wire [15:0] pkt_tcp_fid      ;
wire [31:0] pkt_tcp_ackn     ;
reg  [31:0] pkt_tcp_ackn_reg ;
assign  pkt_ptyp 	= ( fst_cell_dat[ DWID-8 +: 8 ]==VAL_PTYP_PKT_SYN ) ? VAL_PTYP_PKT_SYNACK : fst_cell_dat[ DWID-8 +: 8 ]; 
assign  pkt_tcp_fid  	= fst_cell_dat[ DWID-24 +:16 ]; 
assign  pkt_tcp_ackn 	= fst_cell_dat[ DWID-56 +:32 ]; 
wire [127:000]  pd_dat0			;
reg  [127:000]  pd_dat2			;
wire [003:000]  pd_fwd 	    		;
wire [007:000]  pd_ptyp 		;
wire [003:000]  pd_rsv0	    		;
wire [015:000]  pd_tcp_fid 		;
wire [001:000]  pd_l5typ 		;
wire [001:000]  pd_credit 		;
wire [011:000]  pd_pptr 		;
wire [015:000]  pd_plen 		;
wire [003:000]  pd_chn_id 		;
wire [007:000]  pd_hdr_len 		;
wire [007:000]  pd_tail_len 		;
wire [015:000]  pd_tmp_cks  		;
wire [003:000]  pd_oport_id  		;
wire [007:000]  pd_frag_fid  		;
wire [32-1:00]  pd_tcp_seqn 		; 
wire [32-1:00]  pd_tcp_ackn 		; 
wire [075:000]  new_key_dat_tmp  	;
assign  pd_fwd = (info_err==1'b1) ? VAL_FWD_DROP :
(( info_fid==0 || info_fid==1 || info_fid==2 ) && (info_plen<=16'd32)) ? VAL_FWD_DROP :
( info_fid==0 || info_fid==1 || info_fid==2 ) ? VAL_FWD_MAC :
( info_fid==3 ) ? VAL_FWD_DROP :
( info_fid==8 ) ? VAL_FWD_TOE : VAL_FWD_APP;
assign  pd_ptyp = (info_err==1'b1) ? VAL_PTYP_DROP_TOE_TX_ERR :
(( info_fid==0 || info_fid==1 || info_fid==2 ) && (info_plen<=16'd32)) ? VAL_PTYP_DROP_SHORT_PKT :
( info_fid==3 ) ? VAL_PTYP_DROP_CPU_LOOP :
(pd_fwd==VAL_FWD_MAC) ? VAL_PTYP_MAC :
(pd_fwd==VAL_FWD_APP) ? VAL_PTYP_PKT_MSG :
(pd_fwd==VAL_FWD_TOE) ? pkt_ptyp : VAL_PTYP_RSV;
assign  pd_rsv0 = 4'h0;
assign  pd_tcp_fid = (pd_fwd==VAL_FWD_MAC) ? info_fid :
(pd_fwd==VAL_FWD_APP) ? info_fid : 
pkt_tcp_fid ;  
assign  pd_credit = 0;
assign  pd_l5typ = 0;
assign  pd_pptr = info_pptr;
assign  pd_plen = info_plen;
assign  pd_chn_id = 0;
assign  pd_hdr_len = 0;
assign  pd_tail_len = 0;
assign  pd_tmp_cks = (pd_fwd==VAL_FWD_APP) ? info_cks : 16'h0;
assign  pd_oport_id = (pd_fwd==VAL_FWD_MAC) ? info_fid[3:0] : {2'b0, pd_tcp_fid[15:14]};
assign  pd_frag_fid = 0;
assign  pd_tcp_seqn = info_seqn;
assign  pd_tcp_ackn = info_ackn;
assign pd_dat0 = { pd_fwd[3:0], pd_ptyp[7:0], 
        pd_rsv0[3:0], pd_tcp_fid[15:0], 
        pd_l5typ[1:0], pd_credit[1:0], pd_pptr[11:0],  pd_plen[15:0], 
        pd_chn_id[3:0], pd_hdr_len[7:0], pd_tail_len[7:0], 
        pd_tmp_cks[15:0], pd_oport_id[3:0], pd_frag_fid[7:0], 
16'h0};
always @ ( posedge clk or posedge rst ) begin
        if( rst==1'b1 )begin
                pkt_tcp_ackn_reg <= 0;
        end
        else begin
                if( fst_cell_vld==1'b1 && info_soc==1'b1 ) begin
                        pkt_tcp_ackn_reg <= pkt_tcp_ackn;
                end
        end
end
always @ ( * ) begin
        pd_dat2 = pd_dat0                  ;
        pd_dat2[48+:32] = pd_tcp_seqn      ; 
        pd_dat2[16+:32] = pd_tcp_ackn      ; 
end
reg[1:0] cnt_pd;
always @ ( posedge clk or posedge rst ) begin
        if( rst==1'b1 )begin
                cnt_pd <= 0;
        end
        else begin
                if( cnt_pd==3 ) begin
                        cnt_pd <= 0;
                end
                else if( cnt_pd!=0 ) begin
                        cnt_pd <= cnt_pd + 1'b1;
                end
                else if( fst_cell_vld==1'b1 && info_soc==1'b1 ) begin
                        cnt_pd <= 1;
                end
        end
end
always @ ( posedge clk or posedge rst ) begin
        if( rst==1'b1 )begin
                out_pd_vld <= 0;
                out_pd_dat <= 0;
        end
        else begin
                if( cnt_pd!=0 ) begin
                        out_pd_vld <= 1'b1;
                        out_pd_dat <= pd_dat2; 
                end
                else if( fst_cell_vld==1'b1 && info_soc==1'b1 ) begin
                        out_pd_vld <= 1'b1;
                        out_pd_dat <= pd_dat0;
                end
                else begin
                        out_pd_vld <= 1'b0;
                        out_pd_dat <= pd_dat0;
                end
        end
end
assign fst_cell_rdy = out_pd_rdy;
endmodule
