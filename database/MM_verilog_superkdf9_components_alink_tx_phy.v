// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense


`include "alink_define.v"
module tx_phy(
input             clk          ,
input             rst          ,

input             reg_flush    ,
input             reg_scan     ,

input             tx_phy_start ,
input  [31:0]     tx_phy_sel   ,
output            tx_phy_done  , 

input  [31:0]     tx_dout      ,//TxFIFO data input
output            tx_rd_en     ,//TxFIFO pop

output reg        task_id_vld  ,
output reg [31:0] rx_phy_sel   ,
output reg [31:0] task_id_h    ,
output reg [31:0] task_id_l    ,
output reg [31:0] reg_tout     ,

output     [`PHY_NUM-1:0] TX_P         ,
output     [`PHY_NUM-1:0] TX_N          
);
/*
                       __
tx_phy_start     _____|  |_____________________________________
                 _____ __ _____________________________________
tx_phy_sel       _____|0 |_________________dont care___________
                                                          __
tx_phy_done      ________________________________________|  |__
                                   __
task_id_vld      _________________|  |_________________________
                 _________________ __ _________________________
[rx_phy_sel      _________________|0_|_________________________
task_id_h
task_id_l]

*/

parameter IDLE = 2'd0 ;
parameter TASK = 2'd1 ;
parameter HASH = 2'd2 ;
parameter NONCE= 2'd3 ;

//----------------------------------------------
// Alink.clock.tick
//----------------------------------------------
reg [2:0] cur_state ;
reg [2:0] nxt_state ;
reg [4:0] word_cnt ;
reg [3:0] timing_cnt ;
reg       hash_pop ;
reg [31:0] tx_buf_flg ;
reg [31:0] tx_buf ;
reg [2:0] tx_rd_en_cnt ;
reg [31:0] reg_step    ;
always @ ( posedge clk ) begin
	if( rst || cur_state == IDLE )
		tx_rd_en_cnt <= 3'b0 ;
	else if( tx_rd_en && cur_state == TASK )
		tx_rd_en_cnt <= tx_rd_en_cnt + 3'b1 ;
end
 
always @ ( posedge clk ) begin
	if( rst )
		timing_cnt <= 4'b0 ;
	else if( timing_cnt == `TX_PHY_TIMING )
		timing_cnt <= 4'b0 ;
	else if( cur_state == HASH || cur_state == NONCE )
		timing_cnt <= timing_cnt + 4'b1 ;
	else
		timing_cnt <= 4'b0 ;
end

wire tick = ( timing_cnt == `TX_PHY_TIMING ) ;
reg nonce_over_flow ;
//----------------------------------------------
// FSM
//----------------------------------------------

always @ ( posedge clk ) begin
	if( rst )
		cur_state <= IDLE ;
	else
		cur_state <= nxt_state ;
end

always @ ( * ) begin
	nxt_state = cur_state ;
	case( cur_state )
	IDLE : if( tx_phy_start ) nxt_state = TASK ;
	TASK : if( tx_rd_en_cnt == `TX_TASKID_LEN-1 ) nxt_state = HASH ;
	HASH : if( word_cnt == `TX_DATA_LEN-1 && ~|tx_buf_flg ) nxt_state = NONCE ;
	NONCE: if( nonce_over_flow&&tick ) nxt_state = IDLE ;
	endcase
end

assign tx_phy_done = (cur_state == NONCE)&&(nxt_state == IDLE) ;
//----------------------------------------------
// TASK.ID
//----------------------------------------------
always @ ( posedge clk ) begin
	if( cur_state == IDLE && nxt_state == TASK ) begin
		rx_phy_sel <= tx_phy_sel ;
	end

	if( cur_state == TASK && tx_rd_en_cnt == 2'd0 ) task_id_h <= tx_dout ;
	if( cur_state == TASK && tx_rd_en_cnt == 2'd1 ) task_id_l <= tx_dout ;
	if( cur_state == TASK && tx_rd_en_cnt == 2'd2 ) reg_step  <= tx_dout ;
	if( cur_state == TASK && tx_rd_en_cnt == 2'd3 ) reg_tout  <= tx_dout ;

	if( rst )
		task_id_vld <= 1'b0 ;
	else if( cur_state == TASK && nxt_state == HASH )
		task_id_vld <= 1'b1 ;
	else 
		task_id_vld <= 1'b0 ;
end

wire [31:0] scan_nonce = task_id_l ;
wire [7:0]  scan_no   = task_id_h[7:0] ;
reg  [7:0]  scan_cnt ;

//----------------------------------------------
// Shifter
//----------------------------------------------
always @ ( posedge clk ) begin
	if( rst || cur_state == IDLE )
		word_cnt <= 5'b0 ;
	else if( cur_state == HASH && ~|tx_buf_flg )
		word_cnt <= word_cnt + 5'b1 ;
end

assign tx_rd_en = ( cur_state == TASK ) || ( hash_pop ) ;

reg TX_Px ;
reg TX_Nx ;
always @ ( posedge clk or posedge rst ) begin
	if( rst || (cur_state == NONCE && nxt_state == IDLE) || reg_flush ) begin
		TX_Px <= 1'b1 ;
		TX_Nx <= 1'b1 ;
	end else if( cur_state == IDLE && nxt_state == TASK ) begin //START
		TX_Px <= 1'b0 ;
		TX_Nx <= 1'b0 ;
	end else if( cur_state == HASH || cur_state == NONCE ) begin
		if( ~TX_Px && ~TX_Nx && tick ) begin
			TX_Px <= tx_buf[0]?1'b1:1'b0 ;
			TX_Nx <= (~tx_buf[0])?1'b1:1'b0 ;
		end else if( tick ) begin
			TX_Px <= 1'b0 ;
			TX_Nx <= 1'b0 ;
		end
	end
end

genvar i;
generate
for(i = 0; i < `PHY_NUM; i = i + 1) begin
	assign {TX_P[i],TX_N[i]} = rx_phy_sel[i] ? {TX_Px,TX_Nx} : 2'b11 ;
end
endgenerate

reg [32:0] nonce_buf ;                        
always @ ( posedge clk or posedge rst ) begin
	if( rst ) begin
		hash_pop <= 1'b0 ;
	end else if( cur_state == IDLE && nxt_state == TASK ) begin
		hash_pop <= 1'b0 ;
	end else if( ~TX_Px && ~TX_Nx && tick ) begin
		hash_pop <= 1'b0 ;
	end else if( cur_state == TASK && nxt_state == HASH ) begin
        	hash_pop <= 1'b1 ;
	end else if( cur_state == HASH && nxt_state != NONCE && ~|tx_buf_flg ) begin
        	hash_pop <= 1'b1 ;
	end else begin
		hash_pop <= 1'b0 ;
	end
end

always @ ( posedge clk or posedge rst ) begin
	if( rst ) begin
		tx_buf <= 32'b0 ;
		nonce_over_flow <= 1'b0 ;
		nonce_buf <= 33'b0 ;
		scan_cnt <= 8'b0 ;
	end else if( cur_state == IDLE && nxt_state == TASK ) begin
		nonce_over_flow <= 1'b0 ;
		nonce_buf <= 33'b0 ;
		scan_cnt <= 8'b0 ;
	end else if( ~TX_Px && ~TX_Nx && tick ) begin
		tx_buf <= {1'b0,tx_buf[31:1]} ;
	end else if( hash_pop ) begin
		tx_buf <= tx_dout ;
	end else if( cur_state == HASH && nxt_state == NONCE ) begin
		tx_buf <= (reg_scan && (scan_no == scan_cnt)) ? scan_nonce : {32{reg_scan}} | 32'b0 ;
		nonce_buf <= nonce_buf + {1'b0,reg_step} ;
		scan_cnt <= reg_scan + scan_cnt ;
	end else if( cur_state == NONCE && ~|tx_buf_flg ) begin
		tx_buf <= (reg_scan && (scan_no == scan_cnt)) ? scan_nonce : {32{reg_scan}} | nonce_buf[31:0] ;
		nonce_buf <= nonce_buf + {1'b0,reg_step} ;
		nonce_over_flow <= ((nonce_buf)>33'hffff_ffff) ? 1'b1:1'b0 ;
		scan_cnt <= reg_scan + scan_cnt ;
	end
end

always @ ( posedge clk or posedge rst ) begin
	if( rst || cur_state == IDLE ) begin
		tx_buf_flg <= 32'hffffffff ;
	end else if( ~TX_Px && ~TX_Nx && tick ) begin
		tx_buf_flg <= {1'b0,tx_buf_flg[31:1]} ;
	end else if( (cur_state == HASH || cur_state == NONCE) && ~|tx_buf_flg ) begin
		tx_buf_flg <= 32'hffffffff ;
	end
end

endmodule
