// ********************************Declaration******************************* //
//This Verilog file was developed by Fengzhaomao,Chongqing University of Post //
//and Telecommunications.This file contain information confidential propriet- //
//ary to Fengzhaomao,Chongqing University of Post and Telecommunications.it   //
//shall not be reproduced in whole,or in part,or transferred to other docu-   //
//ments,or disclose to third parties,or used for any purpose other than that  //
//for which it was obtained,without the prior written consent of Fengzhaomao, //
//Chongqing University of Post and Telecommunications.This notice must accom- //
//pany any copy of this file.                                                 //
//																	                                          //
//Copyright (c) 1986--2011 Fengzhaomao,Chongqing University of Post and       //
//Telecommunications. All rights reserved.                                    //
//                                                                            //
//File name:         UART_TOP.v                                               //
// Author:           Fengzhaomao                                              //
// Date:             2015-11-24 08:51                                         //
// Version Number:   0.1.0                                                    //
// Abstract:                                                                  //
//                                                                            //
// *********************************end************************************** //

// module declaration
`timescale 1ns/1ps

module    UART_TOP(
    //inputs
    clk,
    clk26m,
    rst_,
    rst26m_,
    paddr_i,
    pwdata_i,
    psel_i,
    penable_i,
    pwrite_i,
    urxd_i,
    //outputs
    prdata_o,
    utxd_o,
    uart_int_o
);

input           clk;                 //	ARM clk
input           clk26m;              //	function clk
input           rst_;                // ARM clk's rst_
input           rst26m_;             //	function clk's rst_
input  [3:0]    paddr_i;             // APB address bus
input  [31:0]   pwdata_i;            // APB write data bus
input           psel_i;              //	APB module select signal,high active
input           penable_i;           // APB module enable signal,high cative
input           pwrite_i;            // APB write or read signal.1:write,0:read
input           urxd_i;              // UART receive data line

output          utxd_o;              // UART send data line
output          uart_int_o;          // UART interrupt signal.active high
output [31:0]   prdata_o;            // APB read data bus

// signals in RX
wire            rx_bpsclk;
wire            st_check;
wire            parity;
wire            check;
wire            p_error_ack;
wire            st_error_ack;
wire            rxrst;
wire            rx_fifo_rinc;
wire            rx_bpsen;
wire            st_error;
wire            p_error;
wire            rx_fifo_rempty;
wire  [4:0]     rx_fifo_cnt;
wire  [7:0]     rdata_to_regif;

// signals in TX
wire            tx_bpsclk;
wire            stop_bit;
wire  [7:0]     data_to_tx;
wire  [3:0]     two_tx_delay;
wire            txrst;
wire            tx_fifo_winc;
wire            tx_bpsen;
wire            tx_fifo_wfull;
wire  [4:0]     tx_fifo_cnt;

// signals in BAUD
wire  [9:0]     baud_div;

// cases of UART_RX
UART_RX    uart_rx(
        .clk(clk),
        .rst_(rst_),
        .clk26m(clk26m),
        .rst26m_(rst26m_),
        .urxd_i(urxd_i),
        .rx_bpsclk(rx_bpsclk),
        .st_check(st_check),
        .parity(parity),
        .check(check),
        .p_error_ack(p_error_ack),
        .st_error_ack(st_error_ack),
        .rxrst(rxrst),
        .rx_fifo_rinc(rx_fifo_rinc),
        .rx_bpsen(rx_bpsen),
        .st_error(st_error),
        .p_error(p_error),
        .rx_fifo_rempty(rx_fifo_rempty),
        .rx_fifo_cnt(rx_fifo_cnt),
        .data_to_regif(rdata_to_regif)
);

// cases of UART_TX
UART_TX    uart_tx(
        .clk(clk),
        .rst_(rst_),
        .clk26m(clk26m),
        .rst26m_(rst26m_),
        .check(check),
        .parity(parity),
        .tx_bpsclk(tx_bpsclk),
        .stop_bit(stop_bit),
        .uart_tx(data_to_tx),
        .two_tx_delay(two_tx_delay),
        .txrst(txrst),
        .tx_fifo_winc(tx_fifo_winc),
        .tx_bpsen(tx_bpsen),
        .utxd_o(utxd_o),
        .tx_fifo_wfull(tx_fifo_wfull),
        .tx_fifo_cnt(tx_fifo_cnt)
);

// cases of UART_BAUD
UART_BAUD    uart_baud(
        .clk26m(clk26m),
        .rst26m_(rst26m_),
        .tx_bps_en(tx_bpsen),
        .rx_bps_en(rx_bpsen),
        .baud_div(baud_div),
        .rx_bpsclk(rx_bpsclk),
        .tx_bpsclk(tx_bpsclk)
);

// cases of UART_REG_IF
UART_REG_IF    uart_reg_if(
        .clk(clk),
        .rst_(rst_),
        .paddr_i(paddr_i),
        .pwdata_i(pwdata_i),
        .psel_i(psel_i),
        .penable_i(penable_i),
        .pwrite_i(pwrite_i),
        .st_error(st_error),
        .p_error(p_error),
        .rx_fifo_rempty(rx_fifo_rempty),
        .rx_fifo_cnt(rx_fifo_cnt),
        .rx_data(rdata_to_regif),
        .tx_fifo_wfull(tx_fifo_wfull),
        .tx_fifo_cnt(tx_fifo_cnt),
        .uart_int_o(uart_int_o),
        .prdata_o(prdata_o),
        .st_check(st_check),
        .p_error_ack(p_error_ack),
        .st_error_ack(st_error_ack),
        .rxrst(rxrst),
        .stop_bit(stop_bit),
        .two_tx_delay(two_tx_delay),
        .tx_data(data_to_tx),
        .txrst(txrst),
        .check(check),
        .parity(parity),
        .rx_fifo_rinc(rx_fifo_rinc),
        .tx_fifo_winc(tx_fifo_winc),
        .baud_div(baud_div)
);

endmodule