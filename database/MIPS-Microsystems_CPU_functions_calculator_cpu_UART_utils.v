//--------------------------------------------------------------------------------------------------
//
// Title       : utils
// Design      : my_uart
// Author      : 0
// Company     : 0
//
//-------------------------------------------------------------------------------------------------
//
// File        : utils.v
// Generated   : Tue Aug 20 14:49:40 2002
// From        : interface description file
// By          : Itf2Vhdl ver. 1.20
//
//-------------------------------------------------------------------------------------------------
//
// Description : 
//
//-------------------------------------------------------------------------------------------------
// Min baud = clk / (2^8 * 16)
module divisor ( div_rx, div_tx, en_rx, en_tx, clk, rst ) ;
    parameter   size_cnt_rx = 8 ;
    parameter   size_cnt_tx = 8 ;
    input   [15:0]                  div_rx ;
    input   [15:0]                  div_tx ;
    output                          en_rx ;     // RX
    output                          en_tx ;     // TX
    input                           clk ;       // UART clock
    input                           rst ;       // reset
    
    //  RX
    counter     U_CNT_RX( div_rx[size_cnt_rx-1:0], en_rx, clk, rst ) ;
                defparam U_CNT_RX.size_cnt = size_cnt_rx ;
    //  TX
    counter     U_CNT_TX( div_tx[size_cnt_tx-1:0], en_tx, clk, rst ) ;
                defparam U_CNT_TX.size_cnt = size_cnt_tx ;
endmodule

// counter
module  counter( max, q, clk, rst ) ;
    parameter   size_cnt = 8 ;
    input   [size_cnt-1:0]          max ;
    output                          q ;
    input                           clk ;
    input                           rst ;
    reg                             q ;

    reg     [size_cnt-1:0]          cnt ;
    
    //  counter ( down )
    always  @( posedge clk or posedge rst )
        if ( rst )
            cnt <= 0 ;
        else
            if ( cnt == 0 )
                cnt <= max ;                        // load again
            else
                cnt <= cnt - 1 ;

    //  q be set when counter downto 0
    always  @( posedge clk )
        if ( cnt == 1 )
            q <= 'b1 ;
        else
            q <= 'b0 ;
endmodule