// This program was cloned from: https://github.com/Canaan-Creative/MM
// License: The Unlicense

`timescale 1ps/1ps
`include "alink_define.v"

module alink(
    // system clock and reset
    input          CLK_I       ,
    input          RST_I       ,
    
    // wishbone interface signals
    input          ALINK_CYC_I ,//NC
    input          ALINK_STB_I ,
    input          ALINK_WE_I  ,
    input          ALINK_LOCK_I,//NC
    input  [2:0]   ALINK_CTI_I ,//NC
    input  [1:0]   ALINK_BTE_I ,//NC
    input  [5:0]   ALINK_ADR_I ,
    input  [31:0]  ALINK_DAT_I ,
    input  [3:0]   ALINK_SEL_I ,
    output         ALINK_ACK_O ,
    output         ALINK_ERR_O ,//const 0
    output         ALINK_RTY_O ,//const 0
    output [31:0]  ALINK_DAT_O ,

    //TX.PHY
    output [`PHY_NUM-1:0]  TX_P        ,
    output [`PHY_NUM-1:0]  TX_N        ,
    //RX.PHY
    input  [`PHY_NUM-1:0]  RX_P        ,
    input  [`PHY_NUM-1:0]  RX_N        ,

    output [4:0]   ALINK_led 

);

//-------------------------------------------------
// WBBUS
//-------------------------------------------------
assign ALINK_ERR_O = 1'b0 ;
assign ALINK_RTY_O = 1'b0 ;

wire [31:0]           reg_tout    ;

wire                  txfifo_push ;
wire [31:0]           txfifo_din  ;

wire [3:0]            rxcnt       ;
wire                  rxempty     ;
wire [3:0]            txcnt       ;
wire                  reg_flush   ;
wire                  txfull      ;

wire [31:0]           reg_mask    ;
wire                  reg_scan    ;
wire [31:0]           busy        ;

assign ALINK_led[0] = ~reg_mask[0] ;
assign ALINK_led[1] = ~reg_mask[1] ;
assign ALINK_led[2] = ~reg_mask[2] ;
assign ALINK_led[3] = ~reg_mask[3] ;
assign ALINK_led[4] = ~reg_mask[4] ;

wire                  rxfifo_pop  ;
wire [31:0]           rxfifo_dout ; 

wire [31 : 0] tx_din        ;
wire          tx_wr_en      ;
wire          tx_rd_en      ;
wire [31 : 0] tx_dout       ;
wire [10 : 0] tx_data_count ;

wire [31 : 0] rx_din        ;
wire          rx_wr_en      ;
wire [9 : 0]  rx_data_count ;

wire                   tx_phy_start ;
wire [`PHY_NUM-1:0]    tx_phy_sel   ;
wire                   tx_phy_done  ;
wire [1:0]             cur_state    ;
wire [1:0]             nxt_state    ;
wire [32*`PHY_NUM-1:0] timer_cnt    ;//to slave

wire        task_id_vld  ;
wire [31:0] rx_phy_sel   ;
wire [31:0] task_id_h    ;
wire [31:0] task_id_l    ;


//-------------------------------------------------
// Slave
//-------------------------------------------------
alink_slave alink_slave(
// system clock and reset
/*input                       */ .clk         (CLK_I         ) ,
/*input                       */ .rst         (RST_I         ) ,
                                                             
// wishbone interface signals                                
/*input                       */ .ALINK_CYC_I (ALINK_CYC_I   ) ,//NC
/*input                       */ .ALINK_STB_I (ALINK_STB_I   ) ,
/*input                       */ .ALINK_WE_I  (ALINK_WE_I    ) ,
/*input                       */ .ALINK_LOCK_I(ALINK_LOCK_I  ) ,//NC
/*input  [2:0]                */ .ALINK_CTI_I (ALINK_CTI_I   ) ,//NC
/*input  [1:0]                */ .ALINK_BTE_I (ALINK_BTE_I   ) ,//NC
/*input  [5:0]                */ .ALINK_ADR_I (ALINK_ADR_I   ) ,
/*input  [31:0]               */ .ALINK_DAT_I (ALINK_DAT_I   ) ,
/*input  [3:0]                */ .ALINK_SEL_I (ALINK_SEL_I   ) ,
/*output reg                  */ .ALINK_ACK_O (ALINK_ACK_O   ) ,
/*output                      */ .ALINK_ERR_O (ALINK_ERR_O   ) ,//const 0
/*output                      */ .ALINK_RTY_O (ALINK_RTY_O   ) ,//const 0
/*output reg [31:0]           */ .ALINK_DAT_O (ALINK_DAT_O   ) ,
                                                             
/*output reg                  */ .txfifo_push (tx_wr_en      ) ,
/*output reg [31:0]           */ .txfifo_din  (tx_din        ) ,
                                                           
/*input  [9:0]                */ .rxcnt       (rx_data_count ) ,
/*input                       */ .rxempty     (rxempty       ) ,
/*input  [10:0]               */ .txcnt       (tx_data_count ) ,
/*output reg                  */ .reg_flush   (reg_flush     ) ,
/*input                       */ .txfull      (txfull        ) ,
                                                             
/*output reg [31:0]           */ .reg_mask    (reg_mask      ) ,
/*output reg                  */ .reg_scan    (reg_scan      ) ,
/*input  [31:0]               */ .busy        (busy          ) ,
                                                             
/*output                      */ .rxfifo_pop  (rxfifo_pop    ) ,
/*input  [31:0]               */ .rxfifo_dout (rxfifo_dout   )   
);

//-------------------------------------------------
// TX.FIFO
//-------------------------------------------------
assign txfull = ~((tx_data_count+`TX_DATA_LEN+`TX_TASKID_LEN) < `TX_FIFO_DEPTH) ;//tx fifo almost full
wire tx_task_vld = tx_data_count >= (`TX_DATA_LEN+`TX_TASKID_LEN) ;//at list ONE task in tx_fifo
tx_fifo tx_fifo(
/*input          */ .clk       (CLK_I           ),
/*input          */ .srst      (RST_I|reg_flush ),
/*input  [31 : 0]*/ .din       (tx_din          ),
/*input          */ .wr_en     (tx_wr_en        ),
/*input          */ .rd_en     (tx_rd_en        ),
/*output [31 : 0]*/ .dout      (tx_dout         ),
/*output         */ .full      (                ),
/*output         */ .empty     (                ),
/*output [10 : 0]*/ .data_count(tx_data_count   ) 
) ;

//-------------------------------------------------
// RX.FIFO
//-------------------------------------------------
assign rxempty = rx_data_count < `RX_DATA_LEN ;
wire rx_almost_full = (rx_data_count + `RX_DATA_LEN*2) > `RX_FIFO_DEPTH ; //at list ONE report can be pull into rx_fifo
`ifdef SIM
	always @ ( posedge rx_almost_full ) begin
		#200 ;
		$display("[WAR] rx fifo full:%d",rx_data_count);
	end
`endif
rx_fifo rx_fifo(
/*input          */ .clk       (CLK_I           ),
/*input          */ .srst      (RST_I|reg_flush ),
/*input  [31 : 0]*/ .din       (rx_din          ),
/*input          */ .wr_en     (rx_wr_en        ),
/*input          */ .rd_en     (rxfifo_pop      ),
/*output [31 : 0]*/ .dout      (rxfifo_dout     ),
/*output         */ .full      (rx_full         ),
/*output         */ .empty     (                ),
/*output [9 : 0] */ .data_count(rx_data_count   ) 
);


//-------------------------------------------------
// TX.arbiter
//-------------------------------------------------
txc txc(
/*input                    */ .clk         (CLK_I           ) ,
/*input                    */ .rst         (RST_I|reg_flush ) ,

/*input                    */ .reg_flush   (reg_flush       ) ,
/*input  [`PHY_NUM-1:0]    */ .reg_mask    (reg_mask        ) ,
/*input                    */ .task_id_vld (task_id_vld     ) ,
/*input  [31:0]            */ .reg_tout    (reg_tout        ) ,
/*input                    */ .tx_task_vld (tx_task_vld     ) ,//tx fifo not empty

/*output reg               */ .tx_phy_start(tx_phy_start    ) ,
/*output reg [`PHY_NUM-1:0]*/ .tx_phy_sel  (tx_phy_sel      ) ,
/*input                    */ .tx_phy_done (tx_phy_done     ) ,

/*output reg [1:0]         */ .cur_state   (cur_state       ) ,
/*output reg [1:0]         */ .nxt_state   (nxt_state       ) ,
/*output [32*`PHY_NUM-1:0] */ .timer_cnt   (timer_cnt       ) ,//to slave
/*output [`PHY_NUM-1:0]    */ .reg_busy    (busy            )  
);


//-------------------------------------------------
// TX.PHY
//-------------------------------------------------
tx_phy tx_phy(
/*input            */ .clk         (CLK_I           ) ,
/*input            */ .rst         (RST_I|reg_flush ) ,
                                                
/*input            */ .reg_flush   (reg_flush       ) ,
/*input            */ .reg_scan    (reg_scan        ) ,
                                            
/*input            */ .tx_phy_start(tx_phy_start    ) ,
/*input  [31:0]    */ .tx_phy_sel  (tx_phy_sel      ) ,
/*output           */ .tx_phy_done (tx_phy_done     ) , 
                                                    
/*input  [31:0]    */ .tx_dout     (tx_dout         ) ,
/*output           */ .tx_rd_en    (tx_rd_en        ) ,

/*output reg       */ .task_id_vld (task_id_vld     ) ,
/*output reg [31:0]*/ .rx_phy_sel  (rx_phy_sel      ) ,
/*output reg [31:0]*/ .task_id_h   (task_id_h       ) ,
/*output reg [31:0]*/ .task_id_l   (task_id_l       ) ,
/*output reg [31:0]*/ .reg_tout    (reg_tout        ) ,

/*output [31:0]    */ .TX_P        (TX_P            ) ,
/*output [31:0]    */ .TX_N        (TX_N            )  
);
/*
// VIO/ILA and ICON {{{
wire [35:0] icon_ctrl_0;
wire [255:0] trig0 = {
	4'ha                 ,//94:91
	tx_data_count[10:0],//90:80
	rx_data_count[9:0],//79:70
	tx_dout[31:0],//69:38
	tx_rd_en,//37
	TX_P[1] ,//36
	TX_N[1] ,//35
	RX_P[1] ,//34
	RX_N[1] ,//33
	rx_wr_en  ,//32
	rx_din[31:0]//31:0
} ;
icon icon_test(.CONTROL0(icon_ctrl_0));
ila ila_test(.CONTROL(icon_ctrl_0), .CLK(CLK_I), .TRIG0(trig0)
);
*/
//-------------------------------------------------
// RX.PHY
//-------------------------------------------------
rxc rxc(
/*input        */ .clk            (CLK_I          ) ,
/*input        */ .rst            (RST_I|reg_flush          ) ,
                                                  
/*input        */ .reg_flush      (reg_flush      ) ,
/*input  [31:0]*/ .reg_mask       (reg_mask       ) ,
/*input  [31:0]*/ .reg_busy       (busy           ) ,
/*input        */ .rx_almost_full (rx_almost_full ) , 
                                                  
/*input        */ .tx_phy_start   (tx_phy_start   ) ,
/*input  [31:0]*/ .tx_phy_sel     (tx_phy_sel     ) ,
/*input        */ .task_id_vld    (task_id_vld    ) ,
/*input  [31:0]*/ .rx_phy_sel     (rx_phy_sel     ) ,
/*input  [31:0]*/ .task_id_h      (task_id_h      ) ,
/*input  [31:0]*/ .task_id_l      (task_id_l      ) ,
/*input  [32*`PHY_NUM-1:0]*/ .timer_cnt      (timer_cnt      ) ,
                                                  
/*output       */ .rx_vld         (rx_wr_en       ) ,
/*output [31:0]*/ .rx_dat         (rx_din         ) ,
                                                  
/*input  [31:0]*/ .RX_P           (RX_P           ) ,
/*input  [31:0]*/ .RX_N           (RX_N           )  
);

endmodule
