// ********************************Declaration******************************* //
//This Verilog file was developed by Fengzhaomao,Chongqing University of Post //
//and Telecommunications.This file contain information confidential propriet- //
//ary to Fengzhaomao,Chongqing University of Post and Telecommunications.it   //
//shall not be reproduced in whole,or in part,or transferred to other docu-   //
//ments,or disclose to third parties,or used for any purpose other than that  //
//for which it was obtained,without the prior written consent of Fengzhaomao, //
//Chongqing University of Post and Telecommunications.This notice must accom- //
//pany any copy of this file.                                                 //
//				                                                                    //
//Copyright (c) 1986--2011 Fengzhaomao,Chongqing University of Post and       //
//Telecommunications. All rights reserved.                                    //
//                                                                            //
//File name:         UART_TX.v                                                //
// Author:           Fengzhaomao                                              //
// Date:             2015-11-08 11:07                                         //
// Version Number:   0.1.0                                                    //
// Abstract:                                                                  //
//                                                                            //
// *********************************end************************************** //

// module declaration
module    UART_TX(
    //inputs
    clk,
    rst_,
    clk26m,
    rst26m_,
    tx_bpsclk,
    check,
    parity,
    stop_bit,
    uart_tx,
    two_tx_delay,
    txrst,
    tx_fifo_winc,
    //outputs
    tx_bpsen,
    utxd_o,
    tx_fifo_wfull,
    tx_fifo_cnt
);
input           clk;                 // ARM clock
input           rst_;                // ARM clock's rst_
input           clk26m;              // 26M function clock
input           rst26m_;             // function clk's rst_
input           tx_bpsclk;
input           check;               // check bit enable signal,high activity
input           parity;              // odd or even check control signal
input           stop_bit;            // stop bit control signal
input  [7:0]    uart_tx;             // data from REG IF to TX FIFO
input  [3:0]    two_tx_delay;        // delay bpsclk number between twice send
input           txrst;               // TX FIFO reset signal
input           tx_fifo_winc;        // TX FIFO write enable signal
output          tx_bpsen;            // baud enable signal
output          utxd_o;              // UART send data line
output          tx_fifo_wfull;       // TX FIFO write full signal
output [4:0]    tx_fifo_cnt;         // data number in TX FIFO 

reg             tx_bpsen;
reg             utxd_o;
reg  [2:0]      state;
reg  [2:0]      nextstate;
reg  [1:0]      rdata_state;
reg  [3:0]      data_cnt;             // data number
reg  [3:0]      baud_cnt;             // baud number
reg             tx_fifo_rinc;         // TX FIFO read enable signal
wire [7:0]      data_tx;              // data from TX FIFO to TX
wire            tx_fifo_rempty;       // TX FIFO read empty signal
// synchronization signals
reg            tx_ack;               // send data response signal
reg            tx_ack_delay1;
reg            tx_ack_delay2;
reg            tx_start;            // send data request signal
reg            tx_start_delay1;
reg            tx_start_delay2;
reg            stop_bit_syn1;
reg            stop_bit_syn2;
reg            check_syn1;
reg            check_syn2;
reg            parity_syn1;
reg            parity_syn2;
reg  [3:0]     two_tx_delay_syn1;
reg  [3:0]     two_tx_delay_syn2;

// state machine
parameter     IDLE      = 3'b000;
parameter     IRQ       = 3'b001;
parameter     START_BIT = 3'b011;
parameter     TX_DATA   = 3'b010;
parameter     CHECK_BIT = 3'b110;
parameter     STOP      = 3'b111;
parameter     DELAY     = 3'b101;

// cases of TX FIFO 
UART_FIFO    uart_txfifo(
        .clk(clk),
        .rst_(rst_),
        .fifo_rst(txrst),
        .rinc(tx_fifo_rinc),
        .winc(tx_fifo_winc),
        .data_i(uart_tx),
        .wfull(tx_fifo_wfull),
        .rempty(tx_fifo_rempty),
        .data_o(data_tx),
        .fifo_cnt(tx_fifo_cnt)
);

// synchronization tx_ack to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        tx_ack_delay1 <= 1'b0;
        tx_ack_delay2 <= 1'b0;
    end
    else begin
        tx_ack_delay1 <= tx_ack;
        tx_ack_delay2 <= tx_ack_delay1;
    end
end

// synchronization tx_start to ARM clk
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        tx_start_delay1 <= 1'b0;
        tx_start_delay2 <= 1'b0;
    end
    else begin
        tx_start_delay1 <= tx_start;
        tx_start_delay2 <= tx_start_delay1;
    end
end

// synchronization stop_bit to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        stop_bit_syn1 <= 1'b1;
        stop_bit_syn2 <= 1'b1;
    end
    else begin
        stop_bit_syn1 <= stop_bit;
        stop_bit_syn2 <= stop_bit_syn1;
    end
end

// synchronization check to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        check_syn1 <= 1'b0;
        check_syn2 <= 1'b0;
    end
    else begin
        check_syn1 <= check;
        check_syn2 <= check_syn1;
    end
end

// synchronization parity to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        parity_syn1 <= 1'b0;
        parity_syn2 <= 1'b0;
    end
    else begin
        parity_syn1 <= parity;
        parity_syn2 <= parity_syn1;
    end
end

// synchronization two_tx_delay to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        two_tx_delay_syn1 <= 4'h2;
        two_tx_delay_syn2 <= 4'h2;
    end
    else begin
        two_tx_delay_syn1 <= two_tx_delay;
        two_tx_delay_syn2 <= two_tx_delay_syn1;
    end
end

// this state machine to receive data from RX FIFO
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        tx_ack       <= 1'b0;
        tx_fifo_rinc <= 1'b0;
        rdata_state  <= 2'b0;
    end
    else begin
        case(rdata_state)
        2'b00: begin
            if(!tx_fifo_rempty && tx_start_delay2) begin
                tx_ack       <= 1'b1;
                tx_fifo_rinc <= 1'b1;
                rdata_state  <= 2'b01;
            end
        end
        2'b01: begin
            tx_fifo_rinc <= 1'b0;
            if(!tx_start_delay2) begin
                tx_ack      <= 1'b0;
                rdata_state <= 2'b10;
            end
        end
        2'b10: begin
            rdata_state <= 2'b0;
        end
        endcase
    end
end

// state to nextstate with clk in this block.
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        state <= IDLE;
    end
    else begin
        state <= nextstate;
    end
end

// nextstate transform
always@(*) begin
    case(state)
    IDLE: begin
        if(tx_ack_delay2) begin
            nextstate = IRQ;
        end
        else begin
            nextstate = IDLE;
        end
    end
    IRQ: begin
        if(tx_bpsclk) begin
            nextstate = START_BIT;
        end
        else begin
            nextstate = IRQ;
        end
    end
    START_BIT: begin
        if(tx_bpsclk) begin
            nextstate = TX_DATA;
        end
        else begin
            nextstate = START_BIT;
        end
    end
    TX_DATA: begin
        // send 8 bit data
        if(data_cnt < 4'd8) begin
            nextstate = TX_DATA;
        end
        else begin
            if(tx_bpsclk) begin
                if(check_syn2) begin
                    nextstate = CHECK_BIT;
                end
                else begin
                    nextstate = STOP;
                end
            end 
            else begin
                nextstate = TX_DATA;
            end
        end
    end
    CHECK_BIT: begin
        if(tx_bpsclk) begin
            if(stop_bit_syn2) begin
                nextstate = STOP;
            end
            else begin
                nextstate = DELAY;
            end
        end
        else begin
            nextstate = CHECK_BIT;
        end
    end
    STOP: begin
        if(tx_bpsclk) begin
            nextstate = DELAY;
        end
        else begin
            nextstate = STOP;
        end
    end
    DELAY: begin
        if(baud_cnt < two_tx_delay_syn2) begin
            nextstate = DELAY;
        end
        else begin
            nextstate = IDLE;
        end
    end
    default: begin
        nextstate = IDLE;
    end
    endcase
end

// output signal
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        tx_bpsen <= 1'b0;
        tx_start <= 1'b0;
        utxd_o   <= 1'b1;
        data_cnt <= 4'd0;
        baud_cnt <= 4'd0;
    end
    else begin
        case(nextstate)
        IDLE: begin
            tx_start   <= 1'b1;
            baud_cnt   <= 4'd0;
            data_cnt   <= 4'd0;
        end
        IRQ: begin
            tx_bpsen   <= 1'b1;
            tx_start   <= 1'b0;
        end
        START_BIT: begin
            if(tx_bpsclk) begin
                utxd_o <= 1'b0;
            end
        end
        TX_DATA: begin
            if(tx_bpsclk) begin
                utxd_o   <= data_tx[data_cnt];
                data_cnt <= data_cnt + 1'b1;
            end
        end
        CHECK_BIT: begin
            if(tx_bpsclk) begin
                // odd check
                if(parity_syn2) begin
                    utxd_o <= ^data_tx;
                end
                // even check
                else begin
                    utxd_o <= ^~data_tx;
                end
            end
        end
        STOP: begin
            if(tx_bpsclk) begin
                utxd_o <= 1'b1;
            end
        end
        DELAY: begin
            if(tx_bpsclk) begin
                baud_cnt <= baud_cnt + 1'b1;
                utxd_o   <= 1'b1;    // the delay between twice send data is 1
            end
        end
        endcase
    end
end

endmodule