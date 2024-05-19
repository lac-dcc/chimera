// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense


`include "alink_define.v"
module txc(
input                    clk         ,
input                    rst         ,

input                    reg_flush   ,
input  [`PHY_NUM-1:0]    reg_mask    ,
input                    task_id_vld ,
input  [31:0]            reg_tout    ,
input                    tx_task_vld ,//tx fifo not empty

output                   tx_phy_start,
output reg [`PHY_NUM-1:0]tx_phy_sel  ,
input                    tx_phy_done ,

output reg [1:0]         cur_state   ,
output reg [1:0]         nxt_state   ,
output [32*`PHY_NUM-1:0] timer_cnt   ,//to slave
output [`PHY_NUM-1:0]    reg_busy     
);

parameter IDLE = 2'b00 ;
parameter REQ  = 2'b01 ;
parameter SENT = 2'b10 ;

wire [`PHY_NUM-1:0] timer_start ;
wire [`PHY_NUM-1:0] timer_busy ;
assign tx_phy_start = cur_state == REQ && nxt_state == SENT ;

//----------------------------------------------
// Timer
//----------------------------------------------
genvar i ;
generate
	for( i=0 ; i < `PHY_NUM ; i = i + 1 ) begin : G
		assign timer_start[i] = task_id_vld & tx_phy_sel[i] ;

		tx_timer tx_timer(
		/*input            */ .clk          (clk                       ) ,
		/*input            */ .rst          (rst                       ) ,
		/*input            */ .reg_flush    (reg_flush                 ) ,
		/*input  [31:0]    */ .reg_tout     (reg_tout                  ) ,
		/*input            */ .timer_start  (timer_start[i]            ) ,
		/*output           */ .timer_busy   (timer_busy[i]             ) ,
		/*output reg [31:0]*/ .timer_cnt    (timer_cnt[i*32+32-1:i*32] )     
		);
		assign reg_busy[i] =  timer_start[i] | timer_busy[i] ;

	end
endgenerate

//----------------------------------------------
// State Machine
//----------------------------------------------

always @ ( posedge clk ) begin
	if( rst || reg_flush )
		cur_state <= IDLE ;
	else
		cur_state <= nxt_state ;
end

always @ ( * ) begin
	nxt_state = cur_state ;
	case( cur_state )
	IDLE: if( |tx_phy_sel ) nxt_state = REQ  ;
	REQ : if( tx_task_vld ) nxt_state = SENT ;
	SENT: if( tx_phy_done ) nxt_state = IDLE ;
	default : nxt_state = IDLE ;
	endcase
end

//----------------------------------------------
// Arbiter
//----------------------------------------------
always @ ( posedge clk ) begin
if( rst || reg_flush || (cur_state == SENT && nxt_state == IDLE)) 
	tx_phy_sel <= 32'b0 ;
else if( cur_state == IDLE ) begin
	if( ~reg_busy[0 ]&&reg_mask[0 ] ) tx_phy_sel <= 32'b1<<0  ;
	else if( ~reg_busy[1 ]&&reg_mask[1 ] ) tx_phy_sel <= 32'b1<<1  ;
	else if( ~reg_busy[2 ]&&reg_mask[2 ] ) tx_phy_sel <= 32'b1<<2  ;
	else if( ~reg_busy[3 ]&&reg_mask[3 ] ) tx_phy_sel <= 32'b1<<3  ;
	else if( ~reg_busy[4 ]&&reg_mask[4 ] ) tx_phy_sel <= 32'b1<<4  ;
`ifdef PHY_10
	else if( ~reg_busy[5 ]&&reg_mask[5 ] ) tx_phy_sel <= 32'b1<<5  ;
	else if( ~reg_busy[6 ]&&reg_mask[6 ] ) tx_phy_sel <= 32'b1<<6  ;
	else if( ~reg_busy[7 ]&&reg_mask[7 ] ) tx_phy_sel <= 32'b1<<7  ;
	else if( ~reg_busy[8 ]&&reg_mask[8 ] ) tx_phy_sel <= 32'b1<<8  ;
	else if( ~reg_busy[9 ]&&reg_mask[9 ] ) tx_phy_sel <= 32'b1<<9  ;
	else if( ~reg_busy[10]&&reg_mask[10] ) tx_phy_sel <= 32'b1<<10 ;
	else if( ~reg_busy[11]&&reg_mask[11] ) tx_phy_sel <= 32'b1<<11 ;
	else if( ~reg_busy[12]&&reg_mask[12] ) tx_phy_sel <= 32'b1<<12 ;
	else if( ~reg_busy[13]&&reg_mask[13] ) tx_phy_sel <= 32'b1<<13 ;
	else if( ~reg_busy[14]&&reg_mask[14] ) tx_phy_sel <= 32'b1<<14 ;
	else if( ~reg_busy[15]&&reg_mask[15] ) tx_phy_sel <= 32'b1<<15 ;
	else if( ~reg_busy[16]&&reg_mask[16] ) tx_phy_sel <= 32'b1<<16 ;
	else if( ~reg_busy[17]&&reg_mask[17] ) tx_phy_sel <= 32'b1<<17 ;
	else if( ~reg_busy[18]&&reg_mask[18] ) tx_phy_sel <= 32'b1<<18 ;
	else if( ~reg_busy[19]&&reg_mask[19] ) tx_phy_sel <= 32'b1<<19 ;
	else if( ~reg_busy[20]&&reg_mask[20] ) tx_phy_sel <= 32'b1<<20 ;
	else if( ~reg_busy[21]&&reg_mask[21] ) tx_phy_sel <= 32'b1<<21 ;
	else if( ~reg_busy[22]&&reg_mask[22] ) tx_phy_sel <= 32'b1<<22 ;
	else if( ~reg_busy[23]&&reg_mask[23] ) tx_phy_sel <= 32'b1<<23 ;
	else if( ~reg_busy[24]&&reg_mask[24] ) tx_phy_sel <= 32'b1<<24 ;
	else if( ~reg_busy[25]&&reg_mask[25] ) tx_phy_sel <= 32'b1<<25 ;
	else if( ~reg_busy[26]&&reg_mask[26] ) tx_phy_sel <= 32'b1<<26 ;
	else if( ~reg_busy[27]&&reg_mask[27] ) tx_phy_sel <= 32'b1<<27 ;
	else if( ~reg_busy[28]&&reg_mask[28] ) tx_phy_sel <= 32'b1<<28 ;
	else if( ~reg_busy[29]&&reg_mask[29] ) tx_phy_sel <= 32'b1<<29 ;
	else if( ~reg_busy[30]&&reg_mask[30] ) tx_phy_sel <= 32'b1<<30 ;
	else if( ~reg_busy[31]&&reg_mask[31] ) tx_phy_sel <= 32'b1<<31 ;
`endif
	else tx_phy_sel <= 32'b0 ;
end
end
endmodule
