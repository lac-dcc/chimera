// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

`include "alink_define.v"
module alink_slave(
    // system clock and reset
    input                        clk         ,
    input                        rst         ,
    
    // wishbone interface signals
    input                        ALINK_CYC_I ,//NC
    input                        ALINK_STB_I ,
    input                        ALINK_WE_I  ,
    input                        ALINK_LOCK_I,//NC
    input  [2:0]                 ALINK_CTI_I ,//NC
    input  [1:0]                 ALINK_BTE_I ,//NC
    input  [5:0]                 ALINK_ADR_I ,
    input  [31:0]                ALINK_DAT_I ,
    input  [3:0]                 ALINK_SEL_I ,//NC
    output reg                   ALINK_ACK_O ,
    output                       ALINK_ERR_O ,//const 0
    output                       ALINK_RTY_O ,//const 0
    output reg [31:0]            ALINK_DAT_O ,

    output reg                   txfifo_push ,
    output reg [31:0]            txfifo_din  ,

    input  [9:0]                 rxcnt       ,
    input                        rxempty     ,
    input  [10:0]                txcnt       ,
    output                       reg_flush   ,
    input                        txfull      ,

    output reg [31:0]            reg_mask    ,
    output reg                   reg_scan    ,
    input  [31:0]                busy        ,

    output                       rxfifo_pop  ,
    input  [31:0]                rxfifo_dout   
);

parameter ALINK_TXFIFO  = 6'h00 ;
parameter ALINK_STATE   = 6'h04 ;
parameter ALINK_MASK    = 6'h08 ;
parameter ALINK_BUSY    = 6'h0c ;
parameter ALINK_RXFIFO  = 6'h10 ;

//-----------------------------------------------------
// WB bus ACK
//-----------------------------------------------------
always @ ( posedge clk or posedge rst ) begin
        if( rst )
                ALINK_ACK_O <= 1'b0 ;
        else if( ALINK_STB_I && (~ALINK_ACK_O) )
                ALINK_ACK_O <= 1'b1 ;
        else 
                ALINK_ACK_O <= 1'b0 ;
end


//-----------------------------------------------------
// ADDR MUX
//-----------------------------------------------------

wire alink_txfifo_wr_en = ALINK_STB_I & ALINK_WE_I  & ( ALINK_ADR_I == ALINK_TXFIFO ) & ~ALINK_ACK_O ;
wire alink_txfifo_rd_en = ALINK_STB_I & ~ALINK_WE_I & ( ALINK_ADR_I == ALINK_TXFIFO ) & ~ALINK_ACK_O ;

wire alink_state_wr_en = ALINK_STB_I & ALINK_WE_I  & ( ALINK_ADR_I == ALINK_STATE ) & ~ALINK_ACK_O ;
wire alink_state_rd_en = ALINK_STB_I & ~ALINK_WE_I & ( ALINK_ADR_I == ALINK_STATE ) & ~ALINK_ACK_O ;

wire alink_mask_wr_en = ALINK_STB_I & ALINK_WE_I  & ( ALINK_ADR_I == ALINK_MASK ) & ~ALINK_ACK_O ;
wire alink_mask_rd_en = ALINK_STB_I & ~ALINK_WE_I & ( ALINK_ADR_I == ALINK_MASK ) & ~ALINK_ACK_O ;

wire alink_busy_wr_en = ALINK_STB_I & ALINK_WE_I  & ( ALINK_ADR_I == ALINK_BUSY ) & ~ALINK_ACK_O ;
wire alink_busy_rd_en = ALINK_STB_I & ~ALINK_WE_I & ( ALINK_ADR_I == ALINK_BUSY ) & ~ALINK_ACK_O ;

wire alink_rxfifo_wr_en = ALINK_STB_I & ALINK_WE_I  & ( ALINK_ADR_I == ALINK_RXFIFO ) & ~ALINK_ACK_O ;
wire alink_rxfifo_rd_en = ALINK_STB_I & ~ALINK_WE_I & ( ALINK_ADR_I == ALINK_RXFIFO ) & ~ALINK_ACK_O ;


//-----------------------------------------------------
// Register.txfifo
//-----------------------------------------------------
always @ ( posedge clk ) begin
	txfifo_push <= alink_txfifo_wr_en ;
	txfifo_din  <= ALINK_DAT_I ;
end

//-----------------------------------------------------
// Register.state
//-----------------------------------------------------
reg [3:0] reg_flush_r ;
wire [31:0] rd_state = {reg_scan,1'b0,rxcnt[9:0],3'b0,rxempty,
			1'b0,txcnt[10:0],2'b0,reg_flush,txfull} ;

always @ ( posedge clk ) begin
	if( alink_state_wr_en )
		reg_flush_r <= {3'b0,ALINK_DAT_I[1]} ;
	else
		reg_flush_r <= reg_flush_r << 1 ;
end

always @ ( posedge clk ) begin
	if( rst )
		reg_scan <= 1'b0 ;
	else if( alink_state_wr_en )
		reg_scan <= ALINK_DAT_I[31] ;
end

assign reg_flush = |reg_flush_r ;

//-----------------------------------------------------
// Register.mask
//-----------------------------------------------------
always @ ( posedge clk ) begin
	if( alink_mask_wr_en )
		reg_mask <= ALINK_DAT_I ;
end

//-----------------------------------------------------
// Register.busy
//-----------------------------------------------------
wire [31:0] rd_busy = busy[31:0] ;

//-----------------------------------------------------
// Register.rxfifo
//-----------------------------------------------------
wire [31:0] rd_rxfifo = rxfifo_dout[31:0] ;

//-----------------------------------------------------
// WB read
//-----------------------------------------------------
assign rxfifo_pop = alink_rxfifo_rd_en ;

always @ ( posedge clk ) begin
	case( 1'b1 )
		alink_state_rd_en  : ALINK_DAT_O <= rd_state  ;
		alink_busy_rd_en   : ALINK_DAT_O <= rd_busy   ;
		alink_rxfifo_rd_en : ALINK_DAT_O <= rd_rxfifo ;
		default: ALINK_DAT_O <= 32'hdeaddead ; 
	endcase
end


endmodule

