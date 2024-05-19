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
 * Author: David McCoy
 * Description: High Speed Data Demo
 *  Demonstrate a source and sink interface for the DMA
 *
 * Changes:
 */

module hs_demo #(
  parameter BUFFER_WIDTH             = 10,
  parameter FIFO_WIDTH               = 10
)(
  input                             clk,
  input                             rst,

  output                            o_idle,

  //DEMO CODE START
  input                             i_bram_wea,
  input   [BUFFER_WIDTH - 1:0]      i_bram_addr,
  input   [31:0]                    i_bram_din,
  output  [31:0]                    o_bram_dout,
  //DEMO CODE END

  //Write Side
  input                             i_write_enable,
  input   [63:0]                    i_write_addr,
  input                             i_write_addr_inc,
  input                             i_write_addr_dec,
  output                            o_write_finished,
  input   [23:0]                    i_write_count,
  input                             i_write_flush,

  output  [1:0]                     o_write_ready,
  input   [1:0]                     i_write_activate,
  output  [23:0]                    o_write_size,
  input                             i_write_strobe,
  input   [31:0]                    i_write_data,

  //Read Side
  input                             i_read_enable,
  input   [63:0]                    i_read_addr,
  input                             i_read_addr_inc,
  input                             i_read_addr_dec,
  output                            o_read_busy,
  output                            o_read_error,
  input   [23:0]                    i_read_count,
  input                             i_read_flush,

  output                            o_read_ready,
  input                             i_read_activate,
  output  [23:0]                    o_read_size,
  output  [31:0]                    o_read_data,
  input                             i_read_strobe
);
//local parameters
localparam      IDLE              = 0;

localparam      INGRESS_DMA_EN    = 1;
localparam      INGRESS_DMA_ACT   = 2;
localparam      INGRESS_DMA_FLUSH = 3;

localparam      EGRESS_DMA_EN     = 4;
localparam      EGRESS_DMA_ACT    = 5;
localparam      EGRESS_DMA_FLUSH  = 6;

//registes/wires
reg   [23:0]          r_count;
reg   [3:0]           state;

reg                   r_ingress_rd_stb;
wire                  w_ingress_rd_rdy;
reg                   r_ingress_rd_act;
wire  [23:0]          w_ingress_rd_size;
wire  [31:0]          w_ingress_rd_data;

wire  [1:0]           w_egress_wr_rdy;
reg   [1:0]           r_egress_wr_act;
wire  [23:0]          w_egress_wr_size;
reg                   r_egress_wr_stb;
//reg   [31:0]          w_egress_wr_data;
wire  [31:0]          w_egress_wr_data;

wire                  usr_clk;
reg   [23:0]          r_transfer_size;


//Demo Application Signals

reg                         r_wea_a;
reg   [BUFFER_WIDTH - 1:0]  r_addr_a;
//reg   [31:0]                w_din_a;
wire  [31:0]                w_din_a;
wire  [31:0]                w_dout_a;

//submodules
ppfifo #(
  .DATA_WIDTH     (32                 ),
  .ADDRESS_WIDTH  (FIFO_WIDTH         )
)ingress(

  //universal input
  .reset          (rst                ),

  //write side
  .write_clock    (clk                ),
  .write_ready    (o_write_ready      ),
  .write_activate (i_write_activate   ),
  .write_fifo_size(o_write_size       ),
  .write_strobe   (i_write_strobe     ),
  .write_data     (i_write_data       ),
  .starved        (                   ),

  //read side
  .read_clock     (usr_clk            ),  //This does not have to be the same clock for write side
  .read_strobe    (r_ingress_rd_stb   ),
  .read_ready     (w_ingress_rd_rdy   ),
  .read_activate  (r_ingress_rd_act   ),
  .read_count     (w_ingress_rd_size  ),
  .read_data      (w_ingress_rd_data  ),

  .inactive       (                   )
);

ppfifo #(
  .DATA_WIDTH     (32                 ),
  .ADDRESS_WIDTH  (FIFO_WIDTH         )
) egress (

  //universal input
  .reset          (rst                ),

  //write side
  .write_clock    (usr_clk            ),  //This does not have to be the same clock for read side
  .write_ready    (w_egress_wr_rdy    ),
  .write_activate (r_egress_wr_act    ),
  .write_fifo_size(w_egress_wr_size   ),
  .write_strobe   (r_egress_wr_stb    ),
  .write_data     (w_egress_wr_data   ),
  .starved        (                   ),

  //read side
  .read_clock     (clk                ),
  .read_strobe    (i_read_strobe      ),
  .read_ready     (o_read_ready       ),
  .read_activate  (i_read_activate    ),
  .read_count     (o_read_size        ),
  .read_data      (o_read_data        ),

  .inactive       (                   )
);

/*
  DEMO Application (Local Dual Port Buffer)

  right now the dual port buffer is connected to both sides of the ping pong
  FIFOs The output of the PPFIFOs can be used to attach to any interface such
  as:

  CSI Camera Reader
    If this core were to control a CSI camera the output data would go into
    the EGRESS PPFIFO

  DSI Video Writer
    If this core were to control a DSI display, the input would come from
    the INGRESS PPFIFO
*/

//Read/Write Data to a local buffer
dpb #(
  .DATA_WIDTH     (32                 ),
  .ADDR_WIDTH     (BUFFER_WIDTH       )

) local_buffer (

  .clka           (usr_clk            ),
  .wea            (r_wea_a            ),
  .addra          (r_addr_a           ),
  .dina           (w_din_a            ),
  .douta          (w_dout_a           ),

  .clkb           (clk                ),
  .web            (i_bram_wea         ),
  .addrb          (i_bram_addr        ),
  .dinb           (i_bram_din         ),
  .doutb          (o_bram_dout        )
);

//asynchronous logic
assign  usr_clk       = clk;          //The usr_clk does not need to be the same as the system clock
assign  o_read_error  = 1'b0;
assign  w_din_a       = w_ingress_rd_data;
assign  w_egress_wr_data  = w_dout_a;

//synchronous logic
always @ (posedge clk) begin
  //De-assert Strobes
  if (rst) begin
    //State Machine
    state                 <=  IDLE;

    //PPFIFO
    r_ingress_rd_act      <=  0;

    r_egress_wr_act       <=  0;
    //w_egress_wr_data      <=  0;

    r_transfer_size       <=  0;

    //Demo Application Buffer
    /* DEMO CODE START */
    r_wea_a               <=  0;
    r_addr_a              <=  0;
    //w_din_a               <=  0;
    /* DEMO CODE END */
  end
  else begin
    r_ingress_rd_stb      <=  0;
    r_egress_wr_stb       <=  0;


    case (state)
      IDLE: begin
        r_ingress_rd_act  <=  0;

        r_egress_wr_act   <=  0;
        //w_egress_wr_data  <=  0;
        r_count           <=  0;

        /* DEMO CODE START */
        r_wea_a           <=  0;
        r_addr_a          <=  0;
        //w_din_a           <=  0;
        /* DEMO CODE END */
        //if (i_write_enable || w_ingress_rd_rdy) begin
        if (w_ingress_rd_rdy) begin
          state             <=  INGRESS_DMA_EN;
          r_addr_a          <=  i_write_addr;
          r_transfer_size   <=  i_write_count;
        end
        else if (i_read_enable) begin
          state             <=  EGRESS_DMA_EN;
          r_addr_a          <=  i_read_addr;
          r_transfer_size   <=  i_read_count;
        end
      end
      //Incomming Data
      INGRESS_DMA_EN: begin
        if (w_ingress_rd_rdy && !r_ingress_rd_act) begin
          //Activate a FIFO
          r_ingress_rd_act  <=  1;
          r_count           <=  0;
          /* DEMO CODE START */
          //r_wea_a           <=  1;
          //w_din_a           <=  0;
          /* DEMO CODE END */
          state             <=  INGRESS_DMA_ACT;
        end
        if (i_write_flush) begin
          state             <=  INGRESS_DMA_FLUSH;
        end
        //if (!i_write_enable && !w_ingress_rd_rdy) begin
        if (!w_ingress_rd_rdy) begin
          //This is the only place where we can return to IDLE state
          state             <=  IDLE;
        end
      end
      INGRESS_DMA_ACT: begin
        //Read everything from the FIFO and put it into the dual port RAM
        if (r_ingress_rd_stb) begin
          if (i_write_addr_inc) begin
            r_addr_a        <=  r_addr_a + 1;
          end
          else if (i_write_addr_dec) begin
            r_addr_a        <=  r_addr_a - 1;
          end
        end
        if (r_count < w_ingress_rd_size) begin
          //w_din_a           <=  w_ingress_rd_data;
          r_ingress_rd_stb  <=  1;
          r_wea_a           <=  1;
          r_count           <=  r_count + 1;
        end
        else begin
          r_wea_a           <=  0;
          r_ingress_rd_act  <=  0;
          state             <=  INGRESS_DMA_EN;
        end
      end
      INGRESS_DMA_FLUSH: begin
        //Flush the ingress FIFO
        if (w_ingress_rd_rdy && !r_ingress_rd_act) begin
          //If there is a buffer available activate it
          r_ingress_rd_act  <=  1;
          r_count           <=  0;
        end
        else if(r_ingress_rd_act) begin
          //Eat it all
          if (r_count < w_ingress_rd_size) begin
            r_ingress_rd_stb<=  1;
            r_count         <=  r_count + 1;
          end
          else begin
            //No more left
            r_ingress_rd_act  <=  0;
          end
        end
        else begin
          //Go back to wait for more instruction from the controller
          state             <=  INGRESS_DMA_EN;
        end
      end
      //Outgoing Data
      EGRESS_DMA_EN: begin
        //User wants to read data from the local buffer
        if (i_read_enable) begin
          if ((w_egress_wr_rdy > 0) && (r_egress_wr_act == 0)) begin
            r_count                 <=  0;
            if (w_egress_wr_rdy[0]) begin
              r_egress_wr_act[0]    <=  1;
            end
            else begin
              r_egress_wr_act[1]    <=  1;
            end
            state                   <=  EGRESS_DMA_ACT;
          end
        end
        else begin
          state                     <=  IDLE;
        end
      end
      EGRESS_DMA_ACT: begin
        if (r_egress_wr_act > 0) begin
          if (r_count < w_egress_wr_size) begin
            r_count                 <=  r_count + 1;
            r_egress_wr_stb         <=  1;
            //w_egress_wr_data        <=  w_dout_a;
            if (i_read_addr_inc) begin
              r_addr_a              <=  r_addr_a + 1;
            end
            else if (i_read_addr_dec) begin
              r_addr_a              <=  r_addr_a - 1;
            end
          end
          else begin
            r_egress_wr_act         <=  0;
          end
        end
        else begin
          state                     <=  EGRESS_DMA_EN;
        end
        if (i_read_flush) begin
          state                     <=  EGRESS_DMA_FLUSH;
        end
      end
      EGRESS_DMA_FLUSH: begin
        if (r_egress_wr_act > 0) begin
          if (r_count < w_egress_wr_size) begin
            //w_egress_wr_data        <=  32'h00000000;
            r_count                 <=  r_count + 1;
          end
          else begin
            r_egress_wr_act         <=  0;
          end
        end
        else begin
          state                     <=  EGRESS_DMA_EN;
        end
      end
      default: begin
      end
    endcase
  end
end

endmodule
