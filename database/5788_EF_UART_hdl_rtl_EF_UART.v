// This program was cloned from: https://github.com/efabless/EF_UART
// License: Apache License 2.0

/*
	Copyright 2020 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

/*
    A Universal Asynchronous Receiver/Transmitter (UART) 
    - Programmable frame format
        - Data: 5-9 bits
        - Parity: None, Odd, Even, or Sticky at 0/1
    - TX and RX FIFOs with programmable thresholds
    - 16-bit prescaler (PR) for programable baud rate generation
    - Baudrate = CLK/((PR+1)*NUM_SAMPLES)
    - RX synchronizer
    - RX Glich Filter
    - Interrupt Sources:
        + TX fifo not full
        + RX fifo not empty
        + RX fifo level exceeded the threshold
        + TX fifo level is below the threshold
        + Framing Error
        + Parity Error
        + Break is observed
        + Timeout: Nothing received for the time of 4 frames!
        + Overrun
        + Receiving a specific frame
*/

`timescale			1ns/1ps
`default_nettype		none


module EF_UART #(parameter  MDW = 9,        // Max data size/width
                                FAW = 4,        // FIFO Address width; Depth=2^AW
                                SC = 8,         // Number of samples per bit/baud
                                GFLEN = 8       // Length (number of stages) of the glitch filter
) (
    input   wire            clk,
    input   wire            rst_n,
    
    input   wire [15:0]     prescaler,
    input   wire            en,
    input   wire            tx_en,
    input   wire            rx_en,
    input   wire            rd,
    input   wire            wr,
    input   wire [MDW-1:0]  wdata,
    input   wire [3:0]      data_size,          // 5 - 9
    input   wire            stop_bits_count,    // 0: 1, 1: 2
    input   wire [2:0]      parity_type,        // 000: None, 001: odd, 010: even, 100: Sticky 0, 101: Sticky 1
    input   wire [3:0]      txfifotr,
    input   wire [3:0]      rxfifotr,
    input   wire [MDW-1:0]  match_data,
    input   wire [5:0]      timeout_bits,
    input   wire            loopback_en,
    input   wire            glitch_filter_en,
    input   wire            tx_fifo_flush,
    input   wire            rx_fifo_flush,
            
    output  wire            tx_empty,
    output  wire            tx_full,
    output  wire [FAW-1:0]  tx_level,
    output  wire            tx_level_below,
    output  wire [MDW-1:0]  rdata,
    output  wire            rx_empty,
    output  wire            rx_full,
    output  wire [FAW-1:0]  rx_level,
    output  wire            rx_level_above,

    output  wire            break_flag,
    output  wire            match_flag,
    output  wire            frame_error_flag,
    output  wire            parity_error_flag,
    output  wire            overrun_flag,
    output  wire            timeout_flag,

    input   wire            rx,
    output  wire            tx
);

    (* keep *) wire        tx_done;
    (* keep *) wire        rx_done;

    wire        b_tick;

    wire [MDW-1:0]  tx_data;
    wire [MDW-1:0]  rx_data;
    
    parameter FIFO_DW = MDW;

    wire        rx_synched;
    wire        rx_filtered;
    wire        rx_in;

    aucohl_sync rx_sync (
        .clk(clk),
        .in(rx),
        .out(rx_synched)
    );

    aucohl_glitch_filter #(.N(GFLEN)) rx_glitch_filter (
        .clk(clk),
        .rst_n(rst_n),
        .en(glitch_filter_en),
        .in(rx_synched),
        .out(rx_filtered)
    );

    assign rx_in =  loopback_en         ? tx            : 
                    glitch_filter_en    ? rx_filtered   : 
                    rx_synched;

    BAUDGEN buad_gen (
        .clk(clk),
        .rst_n(rst_n),
        .prescale(prescaler),
        .en(en),
        .baudtick(b_tick)
    );
  
    aucohl_fifo #(.DW(FIFO_DW), .AW(FAW)) fifo_tx (
        .clk(clk),
        .rst_n(rst_n),
        .rd(tx_done),
        .wr(wr),
        .wdata(wdata),
        .empty(tx_empty),
        .full(tx_full),
        .rdata(tx_data),
        .level(tx_level),
        .flush(tx_fifo_flush)
    );

    UART_TX #(.MDW(MDW), .NUM_SAMPLES(SC)) uart_tx (
        .clk(clk),
        .resetn(rst_n),
        .tx_start(~tx_empty),
        .b_tick(b_tick & tx_en),
        .data_size(data_size),
        .parity_type(parity_type),
        .stop_bits_count(stop_bits_count),
        .d_in(tx_data),
        .tx_done(tx_done),
        .tx(tx)
    );

    aucohl_fifo #(.DW(FIFO_DW), .AW(FAW)) fifo_rx (
        .clk(clk),
        .rst_n(rst_n),
        .rd(rd),
        .wr(rx_done),
        .wdata(rx_data),
        .empty(rx_empty),
        .full(rx_full),
        .rdata(rdata),
        .level(rx_level),
        .flush(rx_fifo_flush)
    );

    UART_RX #(.MDW(MDW), .NUM_SAMPLES(SC)) uart_rx (
        .clk(clk),
        .resetn(rst_n),
        .b_tick(b_tick & rx_en),
        .data_size(data_size),
        .parity_type(parity_type),
        .stop_bits_count(stop_bits_count),
        .match_data(match_data),
        .rx(rx_in),
        .break_flag(break_flag),
        .match_flag(match_flag),
        .parity_error(parity_error_flag),
        .frame_error(frame_error_flag),
        .rx_done(rx_done),
        .dout(rx_data)
    );

    reg [5:0]   bits_count;
    reg [4:0]   samples_count;
    always @ (posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            bits_count <= 0;
            samples_count <= 0;
        end
        else if(b_tick)
            if(rx_done) bits_count <= 0;
            else if(samples_count == (SC - 1)) begin
                samples_count <= 0;
                if(timeout_flag)
                    bits_count <= 0;
                else
                    bits_count <= bits_count + 1;
            end else
                samples_count <= samples_count + 1'b1;
    end

    assign tx_level_below = (tx_level < txfifotr) & ~tx_full;
    assign rx_level_above = (rx_level > rxfifotr) | rx_full;
    assign overrun_flag = rx_full & rx_done;
    assign timeout_flag = (bits_count == timeout_bits);

endmodule


module BAUDGEN
(
    input   wire        clk,
    input   wire        rst_n,
    input   wire [15:0] prescale, 
    input   wire        en,
    output  wire        baudtick
);

    reg [15:0]  count_reg;
    wire [15:0] count_next;

    //Counter
    always @ (posedge clk, negedge rst_n) begin
        if(!rst_n)
            count_reg <= 0;
        else if(en)
            count_reg <= count_next;
    end

    assign count_next = ((count_reg == prescale) ? 0 : count_reg + 1'b1);
    assign baudtick = ((count_reg == prescale) ? 1'b1 : 1'b0);

endmodule

/*
    UART Receiver
*/
module UART_RX #(parameter NUM_SAMPLES = 16, MDW = 8)(
    input   wire            clk,
    input   wire            resetn,
    input   wire            b_tick,             // Baud generator tick
    input   wire [3:0]      data_size,          // 5 - 9
    input   wire            stop_bits_count,    // 0: 1, 1: 2
    input   wire [2:0]      parity_type,        // 000: None, 001: odd, 010: even, 
                                                // 100: Sticky 0, 101: Sticky 1
    input   wire            rx,                 // RS-232 data port
    input   wire [MDW-1:0]  match_data,
    output  reg             rx_done,            // Transfer completed
    output  wire            parity_error,       // Parity Error
    output  wire            frame_error,        // Framing Error
    output  wire            break_flag,         // Break flag
    output  wire            match_flag,
    output  wire [MDW-1:0]  dout                // Received data
);
    //STATE DEFINES  
    localparam [2:0] idle_st    = 3'b000;
    localparam [2:0] start_st   = 3'b001;
    localparam [2:0] data_st    = 3'b010;
    localparam [2:0] parity_st  = 3'b011;
    localparam [2:0] stop0_st   = 3'b100;
    localparam [2:0] stop1_st   = 3'b101;

    //Internal Signals  
    reg [2:0]   current_state;
    reg [2:0]   next_state;
    reg [3:0]   b_reg;            //baud-rate/over sampling counter
    reg [3:0]   b_next;
    reg [3:0]   count_reg;        //data-bit counter
    reg [3:0]   count_next;
    reg [8:0]   data_reg;         //data register
    reg [8:0]   data_next;
    reg         p_error_reg;
    reg         p_error_next;
    reg         f_error_reg;
    reg         f_error_next;

    //State Machine  
    always @ (posedge clk, negedge resetn) begin
        if(!resetn) begin
            current_state <= idle_st;
            b_reg <= 0;
            count_reg <= 0;
            data_reg <= 0;
            p_error_reg <= 0;
        end else begin
            current_state <= next_state;
            b_reg <= b_next;
            count_reg <= count_next;
            data_reg <= data_next;
            if(current_state == idle_st) 
                p_error_reg <= 0;
            else 
                if(p_error_next) 
                    p_error_reg <= p_error_next;
            if(current_state == idle_st) 
                    f_error_reg <= 0;
                else 
                    if(f_error_next) 
                        f_error_reg <= f_error_next;
        end
    end

    //Next State Logic 
    always @* begin
        next_state = current_state;
        b_next = b_reg;
        count_next = count_reg;
        data_next = data_reg;
        rx_done = 1'b0;
        p_error_next = 1'b0;
        f_error_next = 1'b0;
            
        case(current_state)
            idle_st:
                if(~rx & b_tick)
                begin
                    next_state = start_st;
                    b_next = 0;
                end
                
            start_st:
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES/2 - 1)) begin
                        next_state = data_st;
                        b_next = 0;
                        count_next = 0;
                    end else
                        b_next = b_reg + 1'b1;
                    
            data_st:
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES - 1)) begin
                        b_next = 0;
                        data_next = {rx, data_reg [(MDW-1):1]};
                        if(count_next == (data_size - 1)) 
                            if(parity_type == 3'b000)         
                                next_state = stop0_st;
                            else
                                next_state = parity_st;
                        else
                            count_next = count_reg + 1'b1;
                    end else
                        b_next = b_reg + 1;
            
            parity_st:
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES - 1)) begin
                        b_next = 0;
                        next_state = stop0_st;
                        case (parity_type)
                            3'b001 : //Odd parity
                                if(~^dout != rx) p_error_next = 1;
                            3'b010 : //Even parity
                                if(^dout != rx) p_error_next = 1;
                            3'b100 : //Sticky 0 parity
                                if(1'b0 != rx) p_error_next = 1;
                            3'b101 : //Sticky 1 parity
                                if(1'b1 != rx) p_error_next = 1;
                        endcase
                    end else
                        b_next = b_reg + 1;  
            stop0_st:
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES - 1)) begin 
                        b_next = 0;
                        if(!rx) f_error_next = 1;
                        if(stop_bits_count)         //Two stop bits
                            next_state = stop1_st;
                        else begin                  //One stop bit 
                            next_state = idle_st;
                            rx_done = 1'b1;
                        end
                    end else
                        b_next = b_reg + 1;
            stop1_st:
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES - 1)) begin //Two stop bits
                        b_next = 0;
                        next_state = idle_st;
                        rx_done = 1'b1;
                        if(!rx) f_error_next = 1;
                    end else
                        b_next = b_reg + 1;
        endcase
    end
  
    // Break Detector
    reg [11:0] brk;
    always @ (posedge clk, negedge resetn) begin
        if(!resetn) 
            brk <= 12'hFFF;
        else if(b_tick)
            if(b_reg == (NUM_SAMPLES - 1)) begin
                if(current_state == idle_st)
                    brk <= 12'hFFF;
                else
                    brk <= {brk[10:0], rx};
            end
    end

    assign      dout            =   data_reg >> (9-data_size);
    assign      parity_error    =   p_error_reg & rx_done;
    assign      frame_error     =   f_error_reg & rx_done;
    assign      break_flag      =   (brk == 0);
    assign      match_flag      =   (match_data == dout) & rx_done;

endmodule

/*
    UART Transmitter
*/
module UART_TX #(parameter NUM_SAMPLES = 16, MDW = 8)(
    input   wire                clk,
    input   wire                resetn,
    input   wire                tx_start,        
    input   wire                b_tick,             //baud rate tick
    input   wire [3:0]          data_size,          // 5 - 9
    input   wire                stop_bits_count,    // 0: 1, 1: 2
    input   wire [2:0]          parity_type,        // 000: None, 001: odd, 010: even, 
                                                    // 100: Sticky 0, 101: Sticky 1
    input   wire [MDW-1:0]      d_in,               // input data to transmit
    output  reg                 tx_done,            // Transfer finished
    output  wire                tx                  // output data to RS-232
);
  
    //STATE DEFINES  
    localparam [2:0] idle_st    = 3'b000;
    localparam [2:0] start_st   = 3'b001;
    localparam [2:0] data_st    = 3'b010;
    localparam [2:0] parity_st  = 3'b011;
    localparam [2:0] stop0_st   = 3'b100;
    localparam [2:0] stop1_st   = 3'b101;
/*
    //STATE DEFINES  
    localparam [1:0] idle_st = 2'b00;
    localparam [1:0] start_st = 2'b01;
    localparam [1:0] data_st = 2'b11;
    localparam [1:0] stop_st = 2'b10;
*/
    //Internal Signals  
    reg [2:0]   current_state;
    reg [2:0]   next_state;
    reg [3:0]   b_reg;          // baud tick counter
    reg [3:0]   b_next;
    reg [3:0]   count_reg;      // data bit counter
    reg [3:0]   count_next;
    reg [8:0]   data_reg;       // data register
    reg [8:0]   data_next;
    reg         tx_reg;         // output data reg
    reg         tx_next;

    // prepare the data to claculate the parity by removing any extra bits entered
	// by the user by error
    wire [MDW-1:0] pdata = (d_in) & ~({MDW{1'b1}} << data_size);

    //State Machine  
    always @(posedge clk, negedge resetn) begin
        if(!resetn) begin
            current_state   <= idle_st;
            b_reg           <= 0;
            count_reg       <= 0;
            data_reg        <= 0;
            tx_reg          <= 1'b1;
        end else begin
            current_state   <= next_state;
            b_reg           <= b_next;
            count_reg       <= count_next;
            data_reg        <= data_next;
            tx_reg          <= tx_next;
        end
    end

    //Next State Logic  
    always @* begin
        next_state  =   current_state;
        tx_done     =   1'b0;
        b_next      =   b_reg;
        count_next  =   count_reg;
        data_next   =   data_reg;
        tx_next     =   tx_reg;
        
        case(current_state)
            idle_st: begin
                tx_next = 1'b1;
                if(tx_start) begin
                    next_state = start_st;
                    b_next = 0;
                    data_next = d_in;
                end
            end
            
            start_st: begin //send start bit
                tx_next = 1'b0;
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES)) begin
                        next_state = data_st;
                        b_next = 0;
                        count_next = 0;
                    end
                    else
                        b_next = b_reg + 1;
            end
            
            data_st: begin //send data serially
                tx_next = data_reg[0];
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES - 1)) begin
                        b_next = 0;
                        data_next = data_reg >> 1;
                        if(count_next == (data_size - 1)) 
                            if(parity_type == 3'b000)         
                                next_state = stop0_st;
                            else
                                next_state = parity_st;
                        else
                            count_next = count_reg + 1;
                    end
                    else
                        b_next = b_reg + 1;
            end
            
            parity_st: begin
                tx_next = 1'b0;
                case (parity_type)
                    3'b001 : // Odd parity
                        tx_next = ~^pdata;
                    3'b010 : // Even parity
                        tx_next = ^pdata;
                    3'b100 : // Sticky 0 parity
                        tx_next = 0;
                    3'b101 : // Sticky 1 parity
                        tx_next = 1;
                endcase
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES - 1)) begin
                        b_next = 0;
                        next_state = stop0_st;
                    end else
                        b_next = b_reg + 1;
            end

            stop0_st: begin //send stop bit
                tx_next = 1'b1;
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES - 1)) begin
                        b_next = 0;
                        if(stop_bits_count)         //Two stop bits
                                next_state = stop1_st;
                        else begin                  //One stop bit 
                            next_state = idle_st;
                            tx_done = 1'b1;
                        end        
                    end
                    else
                        b_next = b_reg + 1;
            end

            stop1_st: begin
                tx_next = 1'b1;
                if(b_tick)
                    if(b_reg == (NUM_SAMPLES - 1)) begin //Two stop bits
                        b_next = 0;
                        next_state = idle_st;
                        tx_done = 1'b1;
                    end else
                        b_next = b_reg + 1;
            end
        endcase
    end
  
    assign tx = tx_reg;
  
endmodule
