////////////////////////////////////////////////////////////////////////////////
// Author: lsilvest
//
// Create Date:   02/03/2008
//
// Module Name:    sdram_rw
//
// Target Devices: Altera DE2
//
// Tool versions:  Quartus II 7.2 Web Edition
//
//
// Description: This module provides a simple test bench for the SDRAM
//              controller.  It sequentially writes all positions in
//              memory, pauses for a while and then reads back all
//              positions comparing them to the written value. The
//              green LEDG1 indicates the test passed. The red LEDR0
//              indicates at least one of the readbacks failed
//
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2008 Authors
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
////////////////////////////////////////////////////////////////////////////////
module sdram_rw
  (
   input clk_i,
   input rst_i,
   output [21:0] addr_i,
   output [31:0] dat_i,
   input [31:0] dat_o,
   output we_i,
   input ack_o,
   output stb_i,
   output cyc_i,
   output [0:0] green_led,
   output [0:0] red_led
   );

  parameter START_WRITE_ST        = 4'b0000,
              WRITE_ST           = 4'b0001,
              WAIT_WRITE_ACK_ST  = 4'b0010,
              READ_ST            = 4'b0011,
              WAIT_READ_ACK_ST   = 4'b0100,
              WRITE_WAIT_ST      = 4'b0101,
              START_READ_ST      = 4'b0110,
              READ_WAIT_ST       = 4'b0111,
              DONE_ST            = 4'b1000;
  
  parameter MAX_RW = 24'd200000; // 200000 is the full 8 Mbytes of memory
  parameter R_TO_W_WAIT_TIME  = 24'd12500000;
  parameter INITIAL_MEM_VALUE = 32'd12345678;
  
  reg [21:0] addr_i_r;
  reg [31:0] dat_i_r;
  reg        we_i_r;
  reg        stb_i_r;
  reg        cyc_i_r;

  reg [23:0] rw_cntr;  
  reg [23:0] cntr;
  reg [31:0] number;
  reg [31:0] mem_value;
  reg [3:0]  state;   

  reg [0:0]       red_led_r;
  reg [0:0]       green_led_r;
  

  assign dat_i = dat_i_r;
  assign addr_i = addr_i_r;
  assign we_i = we_i_r;
  assign stb_i = stb_i_r;
  assign cyc_i = cyc_i_r;
  assign red_led = red_led_r;
  assign green_led = green_led_r;


  initial begin
    mem_value <= INITIAL_MEM_VALUE;
    cntr <= 24'b0;
    rw_cntr <= 24'b0;
    state <= START_WRITE_ST;
    we_i_r <= 1'b0;
    addr_i_r <= 22'b0;
    stb_i_r <= 1'b0;
    cyc_i_r <= 1'b0;
    red_led_r <= 1'b0;
    green_led_r <= 1'b0;
  end
  
  
  always@ (posedge clk_i) begin
    if (rst_i) begin
      state <= START_WRITE_ST;
      red_led_r <= 1'b0;
    end else begin
      case (state) 
        START_WRITE_ST:
          begin
            state <= WRITE_ST;
            addr_i_r <= 22'b0;
            rw_cntr <= 24'b0;
            mem_value <= INITIAL_MEM_VALUE;
          end
        
        WRITE_ST:
          begin
            stb_i_r <= 1'b1;
            cyc_i_r <= 1'b1;
            dat_i_r <= mem_value;
            we_i_r <= 1'b1;
            state <= WAIT_WRITE_ACK_ST;
          end

        WAIT_WRITE_ACK_ST:
          if (ack_o) begin
            state <= WRITE_WAIT_ST;
            stb_i_r <= 1'b0;
            cyc_i_r <= 1'b0;
          end
        
        WRITE_WAIT_ST:
          begin
            mem_value <= mem_value + 32'h00000001;
            if (rw_cntr < MAX_RW - 1) begin
              addr_i_r <= addr_i_r + 22'd2;
              rw_cntr <= rw_cntr + 24'b1;
              state <= WRITE_ST;
            end else begin
              state <= START_READ_ST;
            end
          end

        START_READ_ST:
          if (!cntr) begin // wait for R_TO_W_WAIT_TIME
            state <= READ_ST;
            addr_i_r <= 22'b0;
            rw_cntr <= 24'b0;
            mem_value <= INITIAL_MEM_VALUE;
          end else begin
	    state <= START_READ_ST;
	  end
        
        READ_ST:
          begin
            stb_i_r <= 1'b1;
            cyc_i_r <= 1'b1;
            we_i_r <= 1'b0;
            state <= WAIT_READ_ACK_ST;
          end
        
        WAIT_READ_ACK_ST:
          if (ack_o) begin
            state <= READ_WAIT_ST;
            number <= dat_o;
            stb_i_r <= 1'b0;
            cyc_i_r <= 1'b0;
          end

        READ_WAIT_ST:
          begin
            if (rw_cntr < MAX_RW - 1) begin
              if (mem_value != number) begin
                red_led_r[0] <= 1'b1;
              end
              mem_value <= mem_value + 1'b1;
              rw_cntr <= rw_cntr + 24'b1;
              state <= READ_ST;
              // increment address:
              addr_i_r <= addr_i_r + 22'd2;
            end else begin // if (rw_cntr < MAX_RW - 1)
              //state <= START_WRITE_ST;
              state <= DONE_ST;
            end
          end // case: READ_WAIT_ST

        DONE_ST:
          begin
            state <= DONE_ST;
            if (!red_led_r[0])
              green_led_r[0] <= 1'b1;
          end
            
      endcase // case (state)
    end // else: !if(rst_i)
  end // always@ (posedge clk_i)


  always@ (posedge clk_i) begin
    if (rst_i) begin
      cntr <= 24'b0;
    end else if (state == WRITE_WAIT_ST) begin
      cntr <= R_TO_W_WAIT_TIME;
    end else
      cntr <= cntr - 24'b1;
  end

  
  
endmodule

