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
//File name:         UART_REG_IF.v                                            //
// Author:           Fengzhaomao                                              //
// Date:             2015-11-21 00:22                                         //
// Version Number:   0.1.0                                                    //
// Abstract:                                                                  //
//                                                                            //
// *********************************end************************************** //

// module declaration
module    UART_REG_IF(
    clk,
    rst_,
    // inputs from APB
    paddr_i,
    pwdata_i,
    psel_i,
    penable_i,
    pwrite_i,
    // inputs from RX
    st_error,
    p_error,
    rx_fifo_rempty,
    rx_fifo_cnt,
    rx_data,
    // inputs from TX
    tx_fifo_wfull,
    tx_fifo_cnt,
    //output to CPU
    uart_int_o,
    // output to APB
    prdata_o,
    // outputs to RX
    st_check,
    p_error_ack,
    st_error_ack,
    rxrst,
    // outputs to TX
    stop_bit,
    two_tx_delay,
    tx_data,
    txrst,
    // outputs to RX and TX
    check,
    parity,
    rx_fifo_rinc,
    tx_fifo_winc,
    baud_div
);
input           clk;                // ARM clock
input           rst_;               // ARM clock's rst_
input  [3:0]    paddr_i;            // APB address bus
input  [31:0]   pwdata_i;           // APB write address bus
input           psel_i;             // APB chose signal,active high
input           penable_i;          // APB enable signal,active hign
input           pwrite_i;           // APB read or write,1:write,0;read
input           st_error;       // the statu of receive data stop bit
input           p_error;        // the statu of receive data check bit
input           rx_fifo_rempty;     // RX FIFO read empty signal
input  [4:0]    rx_fifo_cnt;        // RX FIFO data number
input  [7:0]    rx_data;            // data from RX FIFO to REG IF
input           tx_fifo_wfull;      // TX FIFO write full signal
input  [4:0]    tx_fifo_cnt;        // TX FIFO data number

output          uart_int_o;          // UART interrupt signal,active high
output [31:0]   prdata_o;            // APB read data bus
output          st_check;            // stop bit check control signal
output          p_error_ack;         // p_error's respond signal
output          st_error_ack;        // st_error's respond signal
output          rxrst;               // RX FIFO reset signal
output          stop_bit;            // stop bit control signal
output [3:0]    two_tx_delay;        // delay bpsclk number between twice send
output [7:0]    tx_data;             // data from REG IF to TX FIFO
output          txrst;               // TX FIFO reset signal
output          check;               // check bit enable signal,active high
output          parity;              // odd or even check control signal
output          rx_fifo_rinc;        // RX FIFO read enable signal
output          tx_fifo_winc;        // TX FIFO write enable signal
output [9:0]    baud_div;            // baud frequency divide factor


reg             uart_int_o;
reg  [31:0]     prdata_o;
reg             st_check;
reg             p_error_ack;
reg             st_error_ack;
reg             rxrst;
reg             stop_bit;
reg  [3:0]      two_tx_delay;
reg  [7:0]      tx_data;
reg             txrst;
reg             check;
reg             parity;
reg  [9:0]      baud_div;
reg             rx_fifo_rinc;        // RX FIFO read enable signal
reg             tx_fifo_winc;        // TX FIFO write enable signal
reg  [31:0]     uart_tx;             // UART send data register
reg  [31:0]     uart_rx;             // UART receive data register
reg  [31:0]     uart_baud;           // baud frequency division register
reg  [31:0]     uart_conf;           // UART configuration register
reg  [31:0]     uart_rxtrig;         // RX_FIFO trigger register
reg  [31:0]     uart_txtrig;         // TX_FIFO trigger register
reg  [31:0]     uart_delay;          // UART delay register
reg  [31:0]     uart_status;         // UART statu register
reg  [31:0]     uart_rxfifo_stat;    // RX_FIFO statu register
reg  [31:0]     uart_txfifo_stat;    // TX_FIFO statu register
reg             state;               // RX FIFO enable control state
reg  [1:0]      state_en;            // TX FIFO enable control state
reg             rx_state;            // RX FIFO interrupt produce state
reg             tx_state;            // TX FIFO interrupt produce state

reg             uart_status3_delay1;
reg             uart_status3_delay2;
wire             neg_uart_status3;

reg             uart_status2_delay1;
reg             uart_status2_delay2;
wire             neg_uart_status2;

reg             st_error_syn1;
reg             st_error_syn2;
reg             st_error_syn3;
wire            st_error_syn;

reg             p_error_syn1;
reg             p_error_syn2;
reg             p_error_syn3;
wire            p_error_syn;

// produce uart_status[3]'s negedge
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        uart_status3_delay1 <= 1'b0;
        uart_status3_delay2 <= 1'b0;
    end
    else begin
        uart_status3_delay1 <= uart_status[3];
        uart_status3_delay2 <= uart_status3_delay1;
    end
end
assign  neg_uart_status3 = (!uart_status3_delay1) && uart_status3_delay2;

// produce uart_status[2]'s negedge 
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        uart_status2_delay1 <= 1'b0;
        uart_status2_delay2 <= 1'b0;
    end
    else begin
        uart_status2_delay1 <= uart_status[2];
        uart_status2_delay2 <= uart_status2_delay1;
    end
end
assign  neg_uart_status2 = (!uart_status2_delay1) && uart_status2_delay2;

// synchronization p_error to ARM clk
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        p_error_syn1 <= 1'b0;
        p_error_syn2 <= 1'b0;
        p_error_syn3 <= 1'b0;
    end
    else begin
        p_error_syn1 <= p_error;
        p_error_syn2 <= p_error_syn1;
        p_error_syn3 <= p_error_syn2;
    end
end
assign  p_error_syn = p_error_syn2 && (!p_error_syn3);

// synchronization st_error to ARM clk
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        st_error_syn1 <= 1'b0;
        st_error_syn2 <= 1'b0;
        st_error_syn3 <= 1'b0;
    end
    else begin
        st_error_syn1 <= st_error;
        st_error_syn2 <= st_error_syn1;
        st_error_syn3 <= st_error_syn2;
    end
end
assign  st_error_syn = st_error_syn2 && (!st_error_syn3);

//write reg's value
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        uart_tx     <= 32'h0;
        uart_baud   <= 32'hf152;
        uart_conf   <= 32'h34;
        uart_rxtrig <= 32'h1;
        uart_txtrig <= 32'h0;
        uart_delay  <= 32'h2;
    end
    else begin
        // APB write
        if(psel_i && penable_i && pwrite_i) begin
            case(paddr_i)
            4'h0:
                uart_tx     <= pwdata_i;
            4'h2:
                uart_baud   <= pwdata_i;
            4'h3:
                uart_conf   <= pwdata_i;
            4'h4:
                uart_rxtrig <= pwdata_i;
            4'h5:
                uart_txtrig <= pwdata_i;
            4'h6:
                uart_delay  <= pwdata_i;
            endcase
        end
    end
end

//read reg's value
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        prdata_o <= 32'h0;
    end
    else begin
        // APB read
        if(psel_i && (!penable_i) && (!pwrite_i)) begin
            case(paddr_i)
            4'h0:
                prdata_o <= uart_tx;
            4'h1:
                prdata_o <= uart_rx;
            4'h2:
                prdata_o <= uart_baud;
            4'h3:
                prdata_o <= uart_conf;
            4'h4:
                prdata_o <= uart_rxtrig;
            4'h5:
                prdata_o <= uart_txtrig;
            4'h6:
                prdata_o <= uart_delay;
            4'h7:
                prdata_o <= uart_status;
            4'h8:
                prdata_o <= uart_rxfifo_stat;
            4'h9:
                prdata_o <= uart_txfifo_stat;
            endcase
        end
    end
end


// write statu register's value
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        uart_rxfifo_stat <= 32'h0;
        uart_txfifo_stat <= 32'h0;
    end
    else begin
        uart_rxfifo_stat <= {27'b0,rx_fifo_cnt};
        uart_txfifo_stat <= {27'b0,tx_fifo_cnt};
    end
end

// FIFO enable control
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        rx_fifo_rinc <= 1'b0;
        state        <= 1'b0;
    end
    else begin
        case(state)
        1'b0: begin
            // when ARM read uart_status, judge interrupt bit ,if rx_int is
            // active, or ARM read uart_rx ,rx_fifo_rinc enable 1 clk
            if(psel_i && (!penable_i)&&(!pwrite_i)&&(paddr_i==4'h7)) begin
                if(uart_status[1] && !rx_fifo_rempty) begin
                    rx_fifo_rinc <= 1'b1;
                    state        <= 1'b1;
                end
            end
            if(psel_i &&(!penable_i)&&(!pwrite_i)&&(paddr_i==4'h1)) begin
                rx_fifo_rinc <= 1'b1;
                state        <= 1'b1;
            end
        end
        1'b1: begin
            rx_fifo_rinc <= 1'b0;
            state        <= 1'b0;
        end
        endcase
    end
end

always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        tx_fifo_winc <= 1'b0;
        state_en     <= 2'b0;
    end
    else begin
        case(state_en)
        2'b0: begin
            // ARM write uart_tx,tx_fifo_winc enable 1 clk after 1 clk
            if(psel_i && penable_i && pwrite_i && (paddr_i==4'h0)) begin
                state_en <= 2'b01;
            end
        end
        2'b01: begin
            state_en     <= 2'b10;
            tx_fifo_winc <= 1'b1;
        end
        2'b10: begin
            tx_fifo_winc <= 1'b0;
            state_en     <= 2'b0;
        end
        endcase
    end
end

// uart_status register operat
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        p_error_ack  <= 1'b0;
        st_error_ack <= 1'b0;
        uart_status  <= 32'h0;
        rx_state     <= 1'b0;
        tx_state     <= 1'b0;
    end
    else begin
        if(st_error_syn) begin
            uart_status[3]   <= 1'b1;
        end
        else begin
            if(neg_uart_status3) begin
                st_error_ack <= 1'b1;
            end
            else begin
                if(!st_error_syn2) begin
                    st_error_ack <= 1'b0;
                end
            end
        end
        if(p_error_syn) begin
            uart_status[2]   <= 1'b1;
        end
        else begin
            if(neg_uart_status2) begin
                p_error_ack  <= 1'b1;
            end
            else begin
                if(!p_error_syn2) begin
                    p_error_ack  <= 1'b0;
                end
            end
        end
        // when rx_fifo_cnt from less than to equal the rxtrig,
        // rx_int is active
        case(rx_state)
        1'b0: begin
            if(rx_fifo_cnt == (uart_rxtrig[3:0] - 1'b1)) begin
                rx_state      <= 1'b1;
            end
            else begin
                rx_state      <= 1'b0;
            end
        end
        1'b1: begin
            if(rx_fifo_cnt == uart_rxtrig[3:0]) begin
                uart_status[1] <= 1'b1;
                rx_state       <= 1'b0;
            end
            else begin
                rx_state       <= 1'b1;
            end
        end
        endcase
        // when tx_fifo_cnt from greater than to equal the txtrig,
        // tx_int is active
        case(tx_state)
        1'b0: begin
            if(tx_fifo_cnt == (uart_txtrig[3:0] + 1'b1)) begin
                tx_state       <= 1'b1;
            end
            else begin
                tx_state       <= 1'b0;
            end
        end
        1'b1: begin
            if(tx_fifo_cnt == uart_txtrig[3:0]) begin
                uart_status[0] <= 1'b1;
                tx_state       <= 1'b0;
            end
            else begin
                tx_state       <= 1'b1;
            end
        end
        endcase
        // ARM write 1 clean 0  uart_status
        if(psel_i && penable_i && pwrite_i && (paddr_i==4'h7)) begin
            uart_status <= uart_status & (~pwdata_i);
        end
    end
end

// produce interrupt to CPU
always @(posedge clk or negedge rst_) begin
    if(!rst_) begin
	      uart_int_o <= 1'b0;
		end
	  else begin
	      if(|uart_status[3:0]) begin
            uart_int_o <= 1'b1;
        end
		    else begin
            uart_int_o <= 1'b0;
        end
		end
end

// read data from RX FIFO to uart_rx
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        uart_rx <= 8'h0;
    end
    else begin
        uart_rx <= {24'b0,rx_data};
    end
end


// outputs register
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        tx_data   <= 8'h0;
        baud_div  <= 10'h152;
        rxrst     <= 1'b0;
        txrst     <= 1'b0;
        st_check  <= 1'b0;
        stop_bit  <= 1'b0;
        parity    <= 1'b0;
        check     <= 1'b0;
        two_tx_delay <= 4'h2;
    end
    else begin
        tx_data   <= uart_tx[7:0];
        baud_div  <= uart_baud[9:0];
        rxrst     <= uart_conf[15];
        txrst     <= uart_conf[14];
        st_check  <= uart_conf[3];
        stop_bit  <= uart_conf[2];
        parity    <= uart_conf[1];
        check     <= uart_conf[0];
        two_tx_delay <= uart_delay[3:0];
    end
end

endmodule

