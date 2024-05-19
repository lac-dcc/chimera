// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
// Copy right belongs to SCSE of BUAA, 2011
// Author:          Gao Xiaopeng
// Design Name: 	Mini UART
// Module Name:     MiniUART
// Description:     MiniUART support 9600/19200/38400/57600/115200 BAUD, 8-bits,
//                  1 stop-bit. MiniUART also support send and receive with 
//                  interrupt mode. 
// Notes      :     1. tx_unit and divisior must use the same clock
//////////////////////////////////////////////////////////////////////////////////

`include    "head_uart.v"

module  MiniUART( ADD_I, DAT_I, DAT_O, STB_I, WE_I, CLK_I, RST_I, ACK_O, IRQ, RxD, TxD ) ;
    // WISHBONE slave interface
    input                       CLK_I ;         // clock
    input   [31:0]              DAT_I ;         // input data
    output  [31:0]              DAT_O ;         // output data
    input                       RST_I ;         // reset
    input   [4:2]               ADD_I ;         // address
    input                       STB_I ;         // strobe
    input                       WE_I ;          // write enable
    output                      ACK_O ;         // acknowledge
    output                      IRQ;            // interrupt request

    // Serial interface
    input                       RxD ;
    output                      TxD ;

    // UART registers/wires
    reg     [7:0]               tx_data ;       // send data buffer
    wire    [7:0]               rx_data ;       // 
    reg     [2:0]               ier ;           // interrupt enable register
    reg     [2:0]               iir ;           // interrupt identifier register
    reg     [6:0]               lcr ;           // line control register
    reg     [15:0]              divr ;          // RxD baud divisor register
    wire    [5:0]               lsr ;           // line status register
    reg     [15:0]              divt ;          // TxD baud divisor register
    //                  
    reg                         load ;          // indicate tx_unit to load data
    wire                        en_tx ;         // 
    wire                        en_rx ;         // 
    wire                        read_over ;     // flag : read register over

    // receive unit
    rx_unit     U_RX_UNIT( RxD, en_rx, rx_data, rs, read_over, CLK_I, RST_I ) ;
    // send unit
    tx_unit     U_TX_UNIT( tx_data, load, en_tx, TxD, ts, CLK_I, RST_I ) ;
    // clock generator
    divisor     U_DIVISOR( divr, divt, en_rx, en_tx, CLK_I, RST_I ) ;
                defparam U_DIVISOR.size_cnt_rx = 16 ;
                defparam U_DIVISOR.size_cnt_tx = 16 ;
    
    // WISHBONE interface
    assign  ACK_O = STB_I ;
    assign  DAT_O = (ADD_I==`OFF_UART_DATA) ? {24'b0, rx_data} :
                    (ADD_I==`OFF_UART_LSR)  ? {26'b0, lsr}  :
                    (ADD_I==`OFF_UART_DIVR) ? {23'b0, divr} :
                    (ADD_I==`OFF_UART_DIVT) ? {20'b0, divt} :
                                              32'b0 ;
    assign IRQ=rs;
    
    //
    always  @( posedge CLK_I or posedge RST_I )
        if ( RST_I )
            begin
                tx_data <= 0 ;
                divr    <= `BAUD_RCV_9600 ;
                divt    <= `BAUD_SND_9600 ;
            end
        else if ( STB_I & WE_I )
            case ( ADD_I )
                `OFF_UART_DATA  :   tx_data <= DAT_I[7:0] ;
                `OFF_UART_DIVR  :   divr    <= DAT_I[15:0] ;
                `OFF_UART_DIVT  :   divt    <= DAT_I[15:0] ;
            endcase

    // 
    assign  read_over = STB_I && WE_I ;             // 
    
    //
    assign  lsr = {ts, 4'b0, rs} ;
    
    //
    always  @( posedge CLK_I or posedge RST_I )
        if ( RST_I )
            load <= 0 ;
        else
            load <= !load & STB_I & WE_I & (ADD_I==`OFF_UART_DATA) ;

endmodule