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
//File name:         UART_RX.v                                                //
// Author:           Fengzhaomao                                              //
// Date:             2015-11-20 11:07                                         //
// Version Number:   0.1.0                                                    //
// Abstract:                                                                  //
//                                                                            //
// *********************************end************************************** //

// module declaration
module    UART_RX(
    //inputs
    clk,
    rst_,
    clk26m,
    rst26m_,
    urxd_i,
    rx_bpsclk,
    st_check,
    parity,
    check,
    p_error_ack,
    st_error_ack,
    rxrst,
    rx_fifo_rinc,
    //outputs
    rx_bpsen,
    st_error,
    p_error,
    rx_fifo_rempty,
    rx_fifo_cnt,
    data_to_regif
);
input           clk;                 // ARM clock
input           rst_;                // ARM clk's rst_
input           clk26m;              // 26M function clock
input           rst26m_;             // function clk's rst_
input           urxd_i;              // UART receive data line
input           rx_bpsclk;
input           st_check;            // stop bit check control signal
input           parity;              // odd or even check control signal
input           check;               // check bit enable signal,high activity
input           p_error_ack;         // p_error's respond from reg if
input           st_error_ack;        // st_error's respond from reg if
input           rxrst;               // RX FIFO reset signal
input           rx_fifo_rinc;        // RX FIFO read enable
output          rx_bpsen;            // RX baud enable signal
output          st_error;        // the statu of receive data stop bit
output          p_error;         // the statu of receive data check bit
output          rx_fifo_rempty;      // RX FIFO read empty signal
output [4:0]    rx_fifo_cnt;         // data number in RX FIFO
output [7:0]    data_to_regif;       // data from RX FIFO to REG IF

reg             rx_fifo_winc;        // RX FIFO write enable
reg             rx_bpsen;
reg             st_error;
reg             p_error;
reg  [2:0]      state;
reg  [2:0]      nextstate;
reg  [1:0]      wdata_state;
reg  [4:0]      data_cnt;            // data number
reg  [7:0]      data_rx;             // data from RX TO RX FIFO
wire             rx_fifo_wfull;      // RX FIFO write full signal

reg             urxd_i_delay1;
reg             urxd_i_delay2;
wire            neg_urxd_i;           // the negedge of urxd_i

// synchronization signals
reg             rx_ack;              // receive data finished response signal
reg             rx_ack_delay1;
reg             rx_ack_delay2;
reg             st_error_ack_delay1;
reg             st_error_ack_delay2;
reg             p_error_ack_delay1;
reg             p_error_ack_delay2;
reg             rx_start;            // receive data request signal
reg             rx_start_delay1;
reg             rx_start_delay2;
reg             st_check_syn1;
reg             st_check_syn2;
reg             parity_syn1;
reg             parity_syn2;
reg             check_syn1;
reg             check_syn2;
reg             start_right;         // start bit right sign


// state machine
parameter      IDLE        = 3'b000;
parameter      START       = 3'b001;
parameter      RX_DATA     = 3'b011;
parameter      CHECK_DATA  = 3'b010;
parameter      STOP        = 3'b110;
parameter      SEND        = 3'b111;

// cases of RX FIFO
UART_FIFO    uart_rxfifo(
        .clk(clk),
        .rst_(rst_),
        .fifo_rst(rxrst),
        .rinc(rx_fifo_rinc),
        .winc(rx_fifo_winc),
        .data_i(data_rx),
        .wfull(rx_fifo_wfull),
        .rempty(rx_fifo_rempty),
        .data_o(data_to_regif),
        .fifo_cnt(rx_fifo_cnt)
);

// synchronization rx_ack to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        rx_ack_delay1 <= 1'b0;
        rx_ack_delay2 <= 1'b0;
    end
    else begin
        rx_ack_delay1 <= rx_ack;
        rx_ack_delay2 <= rx_ack_delay1;
    end
end

// synchronization st_error_ack to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        st_error_ack_delay1 <= 1'b0;
        st_error_ack_delay2 <= 1'b0;
    end
    else begin
        st_error_ack_delay1 <= st_error_ack;
        st_error_ack_delay2 <= st_error_ack_delay1;
    end
end

// synchronization p_error_ack to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        p_error_ack_delay1 <= 1'b0;
        p_error_ack_delay2 <= 1'b0;
    end
    else begin
        p_error_ack_delay1 <= p_error_ack;
        p_error_ack_delay2 <= p_error_ack_delay1;
    end
end

// synchronization rx_start to ARM clk
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        rx_start_delay1 <= 1'b0;
        rx_start_delay2 <= 1'b0;
    end
    else begin
        rx_start_delay1 <= rx_start;
        rx_start_delay2 <= rx_start_delay1;
    end
end

// synchronization st_check to clk26m
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        st_check_syn1 <= 1'b0;
        st_check_syn2 <= 1'b0;
    end
    else begin
        st_check_syn1 <= st_check;
        st_check_syn2 <= st_check_syn1;
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


// this state machine to send data to RX FIFO
always@(posedge clk or negedge rst_) begin
    if(!rst_) begin
        rx_ack       <= 1'b0;
        rx_fifo_winc <= 1'b0;
        wdata_state  <= 2'b0;
    end
    else begin
        case(wdata_state)
        2'b00: begin
            if(!rx_fifo_wfull && rx_start_delay2) begin
                rx_ack       <= 1'b1;
                rx_fifo_winc <= 1'b1;
                wdata_state  <= 2'b01;
            end
        end
        2'b01: begin
            rx_fifo_winc    <= 1'b0;
            if(!rx_start_delay2) begin
                rx_ack      <= 1'b0;
                wdata_state <= 2'b10;
            end
        end
        2'b10: begin
            wdata_state <= 2'b0;
        end
        endcase
    end
end


// produce urxd_i's negedge
always@(posedge clk26m or negedge rst26m_) begin
    if(!rst26m_) begin
        urxd_i_delay1 <= 1'b0;
        urxd_i_delay2 <= 1'b0;
    end
    else begin
        urxd_i_delay1 <= urxd_i;
        urxd_i_delay2 <= urxd_i_delay1;
    end
end
assign    neg_urxd_i = !urxd_i_delay1 && urxd_i_delay2;

// state to nextstate with clk in this block.
always@(posedge clk26m or negedge rst26m_)begin
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
        if(neg_urxd_i) begin
            nextstate = START;
        end
        else begin
            nextstate = IDLE;
        end
    end
    START: begin
        if(start_right) begin
            nextstate = RX_DATA;
        end
        else begin
            nextstate = START;
        end
    end
    RX_DATA: begin
        if(data_cnt < 4'd8) begin
            nextstate = RX_DATA;
        end 
        else begin
            if(rx_bpsclk) begin    // when bpsclk coming,the state change
                if(check_syn2) begin
                    nextstate = CHECK_DATA;
                end
                else begin
                    nextstate = STOP;
                end
            end
            else begin
                nextstate = RX_DATA;
            end
        end
    end
    CHECK_DATA: begin
        if(p_error_ack_delay2) begin
            nextstate = IDLE;
        end
        else begin
            if(rx_bpsclk) begin
		            // p_error:1:parity bit error,0:parity bit error
		            if(p_error) begin
		                nextstate = CHECK_DATA;
		            end
		            else begin
		                // st_check:1:check stop bit,0:don't check stop bit
		                if(st_check_syn2) begin
		                    nextstate = STOP;
		                end
		                else begin
		                    nextstate = SEND;
		                end
		            end
		        end
		        else begin
		            nextstate = CHECK_DATA;
		        end
        end
    end
    STOP: begin
        if(st_error_ack_delay2) begin
            nextstate = IDLE;
        end
        else begin
            if(rx_bpsclk) begin
		            // st_error:1:stop bit error,0:stop bit error
		            if(st_error) begin          //???
		                nextstate = STOP;
		            end
		            else begin
		                nextstate = SEND;
		            end
		        end
		        else begin
		            nextstate = STOP;
		        end
        end
    end
    SEND: begin
        if(rx_ack_delay2) begin
            nextstate = IDLE;
        end
        else begin
            nextstate = SEND;
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
        rx_bpsen <= 1'b0;
        data_rx  <= 8'd0;
        data_cnt <= 4'd0;
        p_error  <= 1'b0;
        st_error <= 1'b0;
        rx_start <= 1'b0; 
        start_right <= 1'b0;
    end
    else begin
        case(nextstate)
        IDLE: begin
            rx_bpsen <= 1'b0;
            data_cnt <= 4'd0;
            st_error <= 1'b0;
            p_error  <= 1'b0;
            rx_start <= 1'b0;
            start_right <= 1'b0;
        end
        START: begin
            rx_bpsen <= 1'b1;
            if(rx_bpsclk) begin
                if(urxd_i == 1'b0) begin
                    start_right <= 1'b1;
                end
                else begin
                    start_right <= 1'b0;
                end
            end
        end
        RX_DATA: begin
            if(rx_bpsclk) begin
                data_rx[data_cnt] <= urxd_i;
                data_cnt <= data_cnt + 1'b1;
            end
        end
        CHECK_DATA: begin
            if(rx_bpsclk) begin
                // odd check
                if(parity_syn2) begin
                    if(^data_rx == urxd_i) begin
                        p_error  <= 1'b1;
                        rx_bpsen <= 1'b0;
                    end
                end
                // even check
                else begin
                    if(^data_rx == !urxd_i) begin
                        p_error  <= 1'b1;
                        rx_bpsen <= 1'b0;
                    end
                end
            end
        end
        STOP: begin
            if(rx_bpsclk) begin
                if(urxd_i == 1'b0) begin
                    st_error <= 1'b1;
                    rx_bpsen <= 1'b0;
                end
            end
        end
        SEND: begin
            rx_start <= 1'b1;
        end
        endcase
    end
end

endmodule