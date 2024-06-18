// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

/*
Distributed under the MIT license.
Copyright (c) 2015 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
 * Author: dave.mccoy@cospandesign.com
 * Description: PPFIFO -> BRAM and BRM -> PPFIFO
 *  Attaches two PPFIFO to a block RAM.
 *
 *  How to use:
 *
 *  PPFIFO (Read to the BRAM) Interface Attached to read_*
 *  PPFIFO (Write from the BRAM) Interface Attached to write_*
 *
 * Changes:
 */

`define MEM_WAIT  2

module adapter_dpb_ppfifo #(
  parameter                           MEM_DEPTH   = 9,
  parameter                           DATA_WIDTH  = 32
)(
  input                               clk,
  input                               rst,
  input                               i_ppfifo_2_mem_en,
  input                               i_mem_2_ppfifo_stb,
  input                               i_cancel_write_stb,
  output  reg     [31:0]              o_num_reads,
  output                              o_idle,

  //User Memory Interface
  input                               i_bram_we,
  input           [MEM_DEPTH  - 1: 0] i_bram_addr,
  input           [DATA_WIDTH - 1: 0] i_bram_din,
  output          [DATA_WIDTH - 1: 0] o_bram_dout,
  output                              o_bram_valid,

  //Ping Pong FIFO Interface
  input                               ppfifo_clk,

  input           [1:0]               i_write_ready,
  output  reg     [1:0]               o_write_activate,
  input           [23:0]              i_write_size,
  output  reg                         o_write_stb,
  output          [DATA_WIDTH - 1:0]  o_write_data,

  input                               i_read_ready,
  output  reg                         o_read_activate,
  input           [23:0]              i_read_size,
  input           [DATA_WIDTH - 1:0]  i_read_data,
  output  reg                         o_read_stb

);
//local parameters
localparam        MEM_SIZE    = (2 ** MEM_DEPTH);

//States
localparam        IDLE        = 0;
localparam        WRITE_SETUP = 1;
localparam        WRITE       = 2;
localparam        READ        = 3;

//registes/wires
wire                                  w_pf_rd_en;
wire                                  w_pf_wr_stb;
wire                                  w_pf_cancel_stb;
reg   [3:0]                           state;
reg   [23:0]                          count;

reg                                   r_we;
reg   [MEM_DEPTH - 1: 0]              r_addr;
reg   [3:0]                           mem_wait_count;
reg   [23:0]                          prev_mem_addr;


//submodules
cross_clock_enable p_en_r (
  .rst            (rst                  ),
  .in_en          (i_ppfifo_2_mem_en    ),

  .out_clk        (ppfifo_clk           ),
  .out_en         (w_pf_rd_en           )
);

cross_clock_strobe p_stb_w (
  .rst            (rst                  ),
  .in_clk         (clk                  ),
  .in_stb         (i_mem_2_ppfifo_stb   ),

  .out_clk        (ppfifo_clk           ),
  .out_stb        (w_pf_wr_stb          )
);

cross_clock_strobe p_stb_cncl_w (
  .rst            (rst                  ),
  .in_clk         (clk                  ),
  .in_stb         (i_cancel_write_stb   ),

  .out_clk        (ppfifo_clk           ),
  .out_stb        (w_pf_cancel_stb      )
);

//Read/Write Data to a local buffer
dpb #(
  .DATA_WIDTH     (DATA_WIDTH           ),
  .ADDR_WIDTH     (MEM_DEPTH            )

) local_buffer (

  .clka           (clk                  ),
  .wea            (i_bram_we            ),
  .addra          (i_bram_addr          ),
  .douta          (o_bram_dout          ),
  .dina           (i_bram_din           ),

  .clkb           (ppfifo_clk           ),
  .web            (r_we                 ),
  .addrb          (r_addr               ),
  .dinb           (i_read_data          ),
  .doutb          (o_write_data         )
);

//assign  o_write_data      = 32'h01234567;
//asynchronous logic
assign  o_idle            = (state == IDLE);
//synchronous logic
assign  o_bram_valid      = ((prev_mem_addr == i_bram_addr) && (mem_wait_count == `MEM_WAIT));

always @ (posedge clk) begin
  if (rst) begin
    mem_wait_count        <=  `MEM_WAIT;
    prev_mem_addr         <=  0;
  end
  else begin
    if (prev_mem_addr != i_bram_addr) begin
      mem_wait_count      <=  0;
      prev_mem_addr       <=  i_bram_addr;
    end
    else begin
      if (mem_wait_count < `MEM_WAIT) begin
        mem_wait_count      <=  mem_wait_count + 1;
      end
    end
  end
end


always @ (posedge ppfifo_clk) begin
  o_read_stb                      <=  0;
  o_write_stb                     <=  0;
  r_we                            <=  0;
  if (rst || w_pf_cancel_stb) begin
    o_write_activate              <=  0;
    o_read_activate               <=  0;
    o_num_reads                   <=  0;
    count                         <=  0;
    r_addr                        <=  0;

    state                         <=  IDLE;
  end
  else begin
    case (state)
      IDLE: begin
        o_read_activate           <=  0;
        o_write_activate          <=  0;
        r_addr                    <=  0;

        count                     <=  0;
        if (w_pf_wr_stb) begin
          //Load the memory data into the PPFIFO
          state                   <=  WRITE_SETUP;
        end
        else if (w_pf_rd_en) begin
          if (i_read_ready) begin
            o_read_activate       <=  1;
            state                 <=  READ;
          end
        end
      end
      WRITE_SETUP: begin
        if ((i_write_ready > 0) && (o_write_activate == 0)) begin
          if (i_write_ready[0]) begin
            o_write_activate[0]   <=  1;
          end
          else begin
            o_write_activate[1]   <=  1;
          end
          state                   <=  WRITE;
        end
      end
      WRITE: begin
        if (count < i_write_size) begin
          r_addr                  <=  r_addr + 1;
          o_write_stb             <=  1;
          count                   <=  count + 1;
        end
        else begin
          o_write_activate        <=  0;
          state                   <=  IDLE;
        end
      end
      READ: begin
        //Memory Interface
        r_we                      <=  1;
        if (r_we) begin
          if (count < i_read_size) begin
            o_read_stb            <=  1;
            count                 <=  count + 1;
            o_num_reads           <=  o_num_reads + 1;
          end
          else begin
            //Done Reading
            o_read_activate       <=  0;
            state                 <=  IDLE;
            r_we                  <=  0;
          end
        end
        if (o_read_stb) begin
          //Delay incrementing the address
          r_addr                  <=  r_addr + 1;
        end
      end
      default: begin
        //Shouldn't get here
        state                     <= IDLE;
      end
    endcase
  end
end

endmodule
