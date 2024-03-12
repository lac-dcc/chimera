/*
   iCEstick Glitcher (cmd_processor.v)
 
  by Matthias Deeg (@matthiasdeeg, matthias.deeg@syss.de)

  Simple voltage glitcher for a Lattice iCEstick Evaluation Kit

  This glitcher is based on and inspired by glitcher implementations
  by Dmitry Nedospasov (@nedos) from Toothless Consulting and
  Grazfather (@Grazfather)

  References:
    http://www.latticesemi.com/icestick
    https://github.com/toothlessco/arty-glitcher
    https://toothless.co/blog/bootloader-bypass-part1/
    https://toothless.co/blog/bootloader-bypass-part2/
    https://toothless.co/blog/bootloader-bypass-part3/
    https://github.com/Grazfather/glitcher
    http://grazfather.github.io/re/pwn/electronics/fpga/2019/12/08/Glitcher.html

  Copyright (C) 2020, Matthias Deeg, SySS GmbH

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:

  1. Redistributions of source code must retain the above copyright notice,
     this list of conditions and the following disclaimer.

  2. Redistributions in binary form must reproduce the above copyright notice,
     this list of conditions and the following disclaimer in the documentation
     and/or other materials provided with the distribution.

  3. Neither the name of the copyright holder nor the names of its contributors
     may be used to endorse or promote products derived from this software
     without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
  POSSIBILITY OF SUCH DAMAGE.
*/

module command_processor(
    input wire clk,
    input wire rst,
    input wire din,
    output wire dout,
    output reg target_reset,
    output reg [7:0] data_out,
    output reg [31:0] duration = 32'd0,
    output reg [31:0] offset = 32'd0,
    output reg start_offset_counter
);

    wire [7:0] uart_rx_data;
    wire [7:0] uart_tx_data;
    wire uart_valid;
    wire uart_tx_ready;
    wire fifo_empty;
    reg fifo_write_enable;
    reg [7:0] fifo_data_in;
    reg glitch_trigger = 1'b0;

    // UART receiver
    uart_rx rxi(
        .clk(clk),
        .rst(rst),
        .din(din),
        .data_out(uart_rx_data),
        .valid(uart_valid)
    );

    // UART transmitter
    uart_tx txi (
        .clk(clk),
        .rst(rst),
        .dout(dout),
        .data_in(uart_tx_data),
        .en(!fifo_empty),
        .rdy(uart_tx_ready)
    );

    // UART FIFO
    fifo fifo_uart (
        .clk(clk),
        .rst(rst),
        .data_in(fifo_data_in),
        .wen(fifo_write_enable),
        .ren(uart_tx_ready),
        .empty(fifo_empty),
        .data_out(uart_tx_data)
    );

    // implemented commands
    parameter[7:0] PASSTHROUGH  = 8'h00;
    parameter[7:0] RESET        = 8'h01;
    parameter[7:0] SET_DURATION = 8'h02;
    parameter[7:0] SET_OFFSET   = 8'h03;
    parameter[7:0] START_GLITCH = 8'h04;

    // number of UART command bytes
    reg[7:0] num_bytes = 8'd0;

    // state machine
    parameter[4:0] STATE_IDLE          = 4'd0;
    parameter[4:0] STATE_PASSTHROUGH   = 4'd1;
    parameter[4:0] STATE_PIPE          = 4'd2;
    parameter[4:0] STATE_SET_DURATION  = 4'd4;
    parameter[4:0] STATE_SET_OFFSET    = 4'd5;
    parameter[4:0] STATE_START_GLITCH  = 4'd6;
    parameter[4:0] STATE_STOP_GLITCH   = 4'd7;

    reg[4:0] state = STATE_IDLE;

    always @(posedge clk)
    begin
        // default assignments
        state <= state;
        num_bytes <= num_bytes;
        fifo_data_in <= fifo_data_in;
        fifo_write_enable <= 1'b0;
        target_reset <= 1'b0;
        start_offset_counter <= 1'b0;
        duration <= duration;
        offset <= offset;
        glitch_trigger <= glitch_trigger;

        case (state)
            // WAITING
            STATE_IDLE:
            begin
                if (uart_valid)
                begin
                    // check received UART data
                    case (uart_rx_data)
                        // PASSTHROUGH command
                        PASSTHROUGH:
                        begin
                            state <= STATE_PASSTHROUGH;                    
                        end
                        
                        // RESET command
                        RESET:
                        begin
                            target_reset <= 1'b1;
                            
                            if (glitch_trigger)
                            begin
                                // start offset counter to start glitching process
                                start_offset_counter <= 1'b1;
                                glitch_trigger <= 1'b0;
                            end

                        end
                            
                        // SET DURATION command
                        SET_DURATION:
                        begin
                            // expect four bytes (32 bit value) of duration data
                            num_bytes <= 8'd4;
                            state <= STATE_SET_DURATION;
                        end
                            
                        // SET OFFSET command
                        SET_OFFSET:
                        begin
                            // expect four bytes (32 bit value) of offset data
                            num_bytes <= 8'd4;
                            state <= STATE_SET_OFFSET;
                        end
                        
                        // START GLITCH command
                        START_GLITCH:
                        begin
                            state <= STATE_START_GLITCH;
                            glitch_trigger <= 1'b1;
                        end                
                    endcase
                end
            end
            
            // PASSTHROUGH
            STATE_PASSTHROUGH:
            begin
                if (uart_valid)
                begin
                    // read number of following bytes
                    num_bytes <= uart_rx_data;
            
                    state <= STATE_PIPE;

                    if (glitch_trigger)
                    begin
                        // start offset counter to start glitching process
                        start_offset_counter <= 1'b1;
                        glitch_trigger <= 1'b0;
                    end

                end
            end
                
            // PIPE
            STATE_PIPE:
            begin
                if (uart_valid)
                begin
                    // write received bytes to FIFO
                    num_bytes <= num_bytes - 1'b1;
                    fifo_data_in <= uart_rx_data;
                    fifo_write_enable <= 1'b1;
                    
                    // if all bytes were received, change state to IDLE
                    if (num_bytes == 1)
                    begin
                        state <= STATE_IDLE;
                    end
                end
            end
            
            // SET DURATION
            STATE_SET_DURATION:
            begin
                if (uart_valid)
                begin
                    // receive duration data (little endian byte order)
                    num_bytes <= num_bytes - 1'b1;
                    duration <= {uart_rx_data, duration[31:8]};
                    
                    if (num_bytes == 8'd1)
                    begin
                        state <= STATE_IDLE;
                    end    
                end
            end
                
            // SET OFFSET
            STATE_SET_OFFSET:
            begin
                if (uart_valid)
                begin
                    // receive offset data (little endian byte order)
                    num_bytes <= num_bytes - 1'b1;
                    offset <= {uart_rx_data, offset[31:8]};
                    
                    if (num_bytes == 1)
                    begin
                        state <= STATE_IDLE;
                    end    
                end
            end
        
            // START GLITCH
            STATE_START_GLITCH:
            begin
                // set glitch trigger
                glitch_trigger <= 1'b1;
                
                state <= STATE_IDLE; 
            end
    
        endcase
    end
        
endmodule
