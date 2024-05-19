// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wishbone master interconnect testbench
/*
Distributed under the MIT licesnse.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

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

/* Log
  04/16/2013
    -implement naming convention
  08/30/2012
    -Major overhall of the testbench
    -modfied the way reads and writes happen, now each write requires the
    number of 32-bit data packets even if the user sends only 1
    -there is no more streaming as the data_count will implicity declare
    that a read/write is streaming
    -added the ih_reset which has not been formally defined within the
    system, but will more than likely reset the entire statemachine
  11/12/2011
    -overhauled the design to behave more similar to a real I/O handler
    -changed the timeout to 40 seconds to allow the wishbone master to catch
    nacks
  11/08/2011
    -added interrupt support
*/

`timescale 1 ns/1 ps

`define TIMEOUT_COUNT 40
`define INPUT_FILE "sim/master_input_test_data.txt"
`define OUTPUT_FILE "sim/master_output_test_data.txt"


`define CLK_HALF_PERIOD 10
`define CLK_PERIOD (2 * `CLK_HALF_PERIOD)

`define SLEEP_HALF_CLK #(`CLK_HALF_PERIOD)
`define SLEEP_FULL_CLK #(`CLK_PERIOD)

//Sleep a number of clock cycles
`define SLEEP_CLK(x)  #(x * `CLK_PERIOD)
//`define VERBOSE

module wishbone_master_tb (
);

//Virtual Host Interface Signals
reg               clk             = 0;
reg               rst             = 0;
wire              w_master_ready;
reg               r_in_ready      = 0;
reg   [31:0]      r_in_command    = 32'h00000000;
reg   [31:0]      r_in_address    = 32'h00000000;
reg   [31:0]      r_in_data       = 32'h00000000;
reg   [27:0]      r_in_data_count = 0;
reg               r_out_ready     = 0;
wire              w_out_en;
wire  [31:0]      w_out_status;
wire  [31:0]      w_out_address;
wire  [31:0]      w_out_data;
wire  [27:0]      w_out_data_count;
reg               r_ih_reset      = 0;

//wishbone signals
wire              w_wbm_we;
wire              w_wbm_cyc;
wire              w_wbm_stb;
wire [3:0]        w_wbm_sel;
wire [31:0]       w_wbm_adr;
wire [31:0]       w_wbm_dat_o;
wire [31:0]       w_wbm_dat_i;
wire              w_wbm_ack;
wire              w_wbm_int;



//Wishbone Slave 0 (SDB) signals
wire              w_wbs0_we;
wire              w_wbs0_cyc;
wire  [31:0]      w_wbs0_dat_o;
wire              w_wbs0_stb;
wire  [3:0]       w_wbs0_sel;
wire              w_wbs0_ack;
wire  [31:0]      w_wbs0_dat_i;
wire  [31:0]      w_wbs0_adr;
wire              w_wbs0_int;


//wishbone slave 1 (Unit Under Test) signals
wire              w_wbs1_we;
wire              w_wbs1_cyc;
wire              w_wbs1_stb;
wire  [3:0]       w_wbs1_sel;
wire              w_wbs1_ack;
wire  [31:0]      w_wbs1_dat_i;
wire  [31:0]      w_wbs1_dat_o;
wire  [31:0]      w_wbs1_adr;
wire              w_wbs1_int;

//Local Parameters
localparam        WAIT_FOR_SDRAM      = 8'h00;
localparam        IDLE                = 8'h01;
localparam        SEND_COMMAND        = 8'h02;
localparam        MASTER_READ_COMMAND = 8'h03;
localparam        RESET               = 8'h04;
localparam        PING_RESPONSE       = 8'h05;
localparam        WRITE_DATA          = 8'h06;
localparam        WRITE_RESPONSE      = 8'h07;
localparam        GET_WRITE_DATA      = 8'h08;
localparam        READ_RESPONSE       = 8'h09;
localparam        READ_MORE_DATA      = 8'h0A;
localparam        FINISHED            = 8'h0B;

//Registers/Wires/Simulation Integers
integer           fd_in;
integer           fd_out;
integer           read_count;
integer           timeout_count;
integer           ch;

integer           data_count;

reg [3:0]         state           =   IDLE;
reg               prev_int        = 0;


reg               execute_command;
reg               command_finished;
reg               request_more_data;
reg               request_more_data_ack;
reg     [27:0]    data_write_count;
reg     [27:0]    data_read_count;

wire              write_enable    [3:0];
wire    [63:0]    write_addr      [3:0];
wire              write_addr_inc  [3:0];
wire              write_addr_dec  [3:0];
wire              write_finished  [3:0];
wire    [23:0]    write_data_count     [3:0];

wire    [1:0]     write_ready     [3:0];
wire    [1:0]     write_activate  [3:0];
wire    [23:0]    write_size      [3:0];
wire              write_strobe    [3:0];
wire    [31:0]    write_data      [3:0];


wire              read_enable     [3:0];
wire    [63:0]    read_addr       [3:0];
wire              read_addr_inc   [3:0];
wire              read_addr_dec   [3:0];
wire              read_busy       [3:0];
wire              read_error      [3:0];
wire    [23:0]    read_data_count [3:0];

wire              read_ready      [3:0];
wire              read_activate   [3:0];
wire    [23:0]    read_size       [3:0];
wire    [31:0]    read_data       [3:0];
wire              read_strobe     [3:0];



//Submodules
wishbone_master wm (
  .clk            (clk              ),
  .rst            (rst              ),

  .i_ih_rst       (r_ih_reset       ),
  .i_ready        (r_in_ready       ),
  .i_command      (r_in_command     ),
  .i_address      (r_in_address     ),
  .i_data         (r_in_data        ),
  .i_data_count   (r_in_data_count  ),
  .i_out_ready    (r_out_ready      ),
  .o_en           (w_out_en         ),
  .o_status       (w_out_status     ),
  .o_address      (w_out_address    ),
  .o_data         (w_out_data       ),
  .o_data_count   (w_out_data_count ),
  .o_master_ready (w_master_ready   ),

  .o_per_we        (w_wbm_we        ),
  .o_per_adr       (w_wbm_adr       ),
  .o_per_dat       (w_wbm_dat_i     ),
  .i_per_dat       (w_wbm_dat_o     ),
  .o_per_stb       (w_wbm_stb       ),
  .o_per_cyc       (w_wbm_cyc       ),
  .o_per_msk       (w_wbm_msk       ),
  .o_per_sel       (w_wbm_sel       ),
  .i_per_ack       (w_wbm_ack       ),
  .i_per_int       (w_wbm_int       )
);

//slave 1
wb_dma s1 (

  .clk                    (clk                 ),
  .rst                    (rst                 ),

  .i_wbs_we               (w_wbs1_we           ),
  .i_wbs_cyc              (w_wbs1_cyc          ),
  .i_wbs_dat              (w_wbs1_dat_i        ),
  .i_wbs_stb              (w_wbs1_stb          ),
  .o_wbs_ack              (w_wbs1_ack          ),
  .o_wbs_dat              (w_wbs1_dat_o        ),
  .i_wbs_adr              (w_wbs1_adr          ),
  .o_wbs_int              (w_wbs1_int          ),

  //Source 0
  .o_src0_enable          (read_enable[0]      ),
  .o_src0_address         (read_addr[0]        ),
  .o_src0_count           (read_data_count[0]  ),
  .o_src0_addr_inc        (read_addr_inc[0]    ),
  .o_src0_addr_dec        (read_addr_dec[0]    ),

  .o_src0_if_strobe       (read_strobe[0]      ),
  .i_src0_if_data         (read_data[0]        ),
  .i_src0_if_ready        (read_ready[0]       ),
  .o_src0_if_activate     (read_activate[0]    ),
  .i_src0_if_size         (read_size[0]        ),

  //Source 1
  .o_src1_enable          (read_enable[1]      ),
  .o_src1_address         (read_addr[1]        ),
  .o_src1_count           (read_data_count[1]  ),
  .o_src1_addr_inc        (read_addr_inc[1]    ),
  .o_src1_addr_dec        (read_addr_dec[1]    ),

  .o_src1_if_strobe       (read_strobe[1]      ),
  .i_src1_if_data         (read_data[1]        ),
  .i_src1_if_ready        (read_ready[1]       ),
  .o_src1_if_activate     (read_activate[1]    ),
  .i_src1_if_size         (read_size[1]        ),

  //Source 2
  .o_src2_enable          (read_enable[2]      ),
  .o_src2_address         (read_addr[2]        ),
  .o_src2_count           (read_data_count[2]  ),
  .o_src2_addr_inc        (read_addr_inc[2]    ),
  .o_src2_addr_dec        (read_addr_dec[2]    ),

  .o_src2_if_strobe       (read_strobe[2]      ),
  .i_src2_if_data         (read_data[2]        ),
  .i_src2_if_ready        (read_ready[2]       ),
  .o_src2_if_activate     (read_activate[2]    ),
  .i_src2_if_size         (read_size[2]        ),

  //Source 3
  .o_src3_enable          (read_enable[3]      ),
  .o_src3_address         (read_addr[3]        ),
  .o_src3_count           (read_data_count[3]  ),
  .o_src3_addr_inc        (read_addr_inc[3]    ),
  .o_src3_addr_dec        (read_addr_dec[3]    ),

  .o_src3_if_strobe       (read_strobe[3]      ),
  .i_src3_if_data         (read_data[3]        ),
  .i_src3_if_ready        (read_ready[3]       ),
  .o_src3_if_activate     (read_activate[3]    ),
  .i_src3_if_size         (read_size[3]        ),

  //Sink 0
  .o_snk0_write_enable    (write_enable[0]     ),
  .o_snk0_write_addr      (write_addr[0]       ),
  .o_snk0_write_addr_inc  (write_addr_inc[0]   ),
  .o_snk0_write_addr_dec  (write_addr_dec[0]   ),
  .o_snk0_write_count     (write_data_count[0] ),

  .o_snk0_strobe          (write_strobe[0]     ),
  .i_snk0_ready           (write_ready[0]      ),
  .o_snk0_activate        (write_activate[0]   ),
  .i_snk0_size            (write_size[0]       ),
  .o_snk0_data            (write_data[0]       ),

  //Sink 1
  .o_snk1_write_enable    (write_enable[1]     ),
  .o_snk1_write_addr      (write_addr[1]       ),
  .o_snk1_write_addr_inc  (write_addr_inc[1]   ),
  .o_snk1_write_addr_dec  (write_addr_dec[1]   ),
  .o_snk1_write_count     (write_data_count[1] ),

  .o_snk1_strobe          (write_strobe[1]     ),
  .i_snk1_ready           (write_ready[1]      ),
  .o_snk1_activate        (write_activate[1]   ),
  .i_snk1_size            (write_size[1]       ),
  .o_snk1_data            (write_data[1]       ),

  //Sink 2
  .o_snk2_write_enable    (write_enable[2]     ),
  .o_snk2_write_addr      (write_addr[2]       ),
  .o_snk2_write_addr_inc  (write_addr_inc[2]   ),
  .o_snk2_write_addr_dec  (write_addr_dec[2]   ),
  .o_snk2_write_count     (write_data_count[2] ),

  .o_snk2_strobe          (write_strobe[2]     ),
  .i_snk2_ready           (write_ready[2]      ),
  .o_snk2_activate        (write_activate[2]   ),
  .i_snk2_size            (write_size[2]       ),
  .o_snk2_data            (write_data[2]       ),

  //Sink 3
  .o_snk3_write_enable    (write_enable[3]     ),
  .o_snk3_write_addr      (write_addr[3]       ),
  .o_snk3_write_addr_inc  (write_addr_inc[3]   ),
  .o_snk3_write_addr_dec  (write_addr_dec[3]   ),
  .o_snk3_write_count     (write_data_count[3] ),

  .o_snk3_strobe          (write_strobe[3]     ),
  .i_snk3_ready           (write_ready[3]      ),
  .o_snk3_activate        (write_activate[3]   ),
  .i_snk3_size            (write_size[3]       ),
  .o_snk3_data            (write_data[3]       )
);

wishbone_interconnect wi (
  .clk        (clk                  ),
  .rst        (rst                  ),

  .i_m_we     (w_wbm_we             ),
  .i_m_cyc    (w_wbm_cyc            ),
  .i_m_stb    (w_wbm_stb            ),
  .o_m_ack    (w_wbm_ack            ),
  .i_m_dat    (w_wbm_dat_i          ),
  .o_m_dat    (w_wbm_dat_o          ),
  .i_m_adr    (w_wbm_adr            ),
  .o_m_int    (w_wbm_int            ),

  .o_s0_we    (w_wbs0_we            ),
  .o_s0_cyc   (w_wbs0_cyc           ),
  .o_s0_stb   (w_wbs0_stb           ),
  .i_s0_ack   (w_wbs0_ack           ),
  .o_s0_dat   (w_wbs0_dat_i         ),
  .i_s0_dat   (w_wbs0_dat_o         ),
  .o_s0_adr   (w_wbs0_adr           ),
  .i_s0_int   (w_wbs0_int           ),

  .o_s1_we    (w_wbs1_we            ),
  .o_s1_cyc   (w_wbs1_cyc           ),
  .o_s1_stb   (w_wbs1_stb           ),
  .i_s1_ack   (w_wbs1_ack           ),
  .o_s1_dat   (w_wbs1_dat_i         ),
  .i_s1_dat   (w_wbs1_dat_o         ),
  .o_s1_adr   (w_wbs1_adr           ),
  .i_s1_int   (w_wbs1_int           )
);

localparam AWIDTH0 = 10;
localparam AWIDTH1 = 10;
localparam AWIDTH2 = 10;
localparam AWIDTH3 = 10;

//1st Device
test_mem_dev #(
  .READ_FIFO_SIZE     (                 3  ),
  .WRITE_FIFO_SIZE    (                 5  ),
  .ADDRESS_WIDTH      (           AWIDTH0  )
)tdm0(
  .clk                (clk                 ),
  .rst                (rst                 ),


  .write_enable       (write_enable[0]     ),
  .write_addr         (write_addr[0]       ),
  .write_addr_inc     (write_addr_inc[0]   ),
  .write_addr_dec     (write_addr_dec[0]   ),
  .write_finished     (write_finished[0]   ),
  .write_count        (write_data_count[0] ),
  .write_flush        (write_flush[0]      ),

  .write_ready        (write_ready[0]      ),
  .write_activate     (write_activate[0]   ),
  .write_size         (write_size[0]       ),
  .write_strobe       (write_strobe[0]     ),
  .write_data         (write_data[0]       ),


  .read_enable        (read_enable[0]      ),
  .read_addr          (read_addr[0]        ),
  .read_addr_inc      (read_addr_inc[0]    ),
  .read_addr_dec      (read_addr_dec[0]    ),
  .read_busy          (read_busy[0]        ),
  .read_error         (read_error[0]       ),
  .read_count         (read_data_count[0]  ),
  .read_flush         (read_flush[0]       ),

  .read_ready         (read_ready[0]       ),
  .read_activate      (read_activate[0]    ),
  .read_size          (read_size[0]        ),
  .read_data          (read_data[0]        ),
  .read_strobe        (read_strobe[0]      )
);

//2nd Device
test_mem_dev #(
    .READ_FIFO_SIZE   (                 5  ),
    .WRITE_FIFO_SIZE  (                10  ),
    .ADDRESS_WIDTH    (           AWIDTH1  )
)tdm1(
  .clk                (clk                 ),
  .rst                (rst                 ),


  .write_enable       (write_enable[1]     ),
  .write_addr         (write_addr[1]       ),
  .write_addr_inc     (write_addr_inc[1]   ),
  .write_addr_dec     (write_addr_dec[1]   ),
  .write_finished     (write_finished[1]   ),
  .write_count        (write_data_count[1] ),
  .write_flush        (write_flush[1]      ),

  .write_ready        (write_ready[1]      ),
  .write_activate     (write_activate[1]   ),
  .write_size         (write_size[1]       ),
  .write_strobe       (write_strobe[1]     ),
  .write_data         (write_data[1]       ),


  .read_enable        (read_enable[1]      ),
  .read_addr          (read_addr[1]        ),
  .read_addr_inc      (read_addr_inc[1]    ),
  .read_addr_dec      (read_addr_dec[1]    ),
  .read_busy          (read_busy[1]        ),
  .read_error         (read_error[1]       ),
  .read_count         (read_data_count[1]  ),
  .read_flush         (read_flush[1]       ),

  .read_ready         (read_ready[1]       ),
  .read_activate      (read_activate[1]    ),
  .read_size          (read_size[1]        ),
  .read_data          (read_data[1]        ),
  .read_strobe        (read_strobe[1]      )
);

//3rd Device
test_mem_dev #(
    .READ_FIFO_SIZE   (                 8  ),
    .WRITE_FIFO_SIZE  (                 8  ),
    .ADDRESS_WIDTH    (           AWIDTH2  )
)tdm2(
  .clk                (clk                 ),
  .rst                (rst                 ),


  .write_enable       (write_enable[2]     ),
  .write_addr         (write_addr[2]       ),
  .write_addr_inc     (write_addr_inc[2]   ),
  .write_addr_dec     (write_addr_dec[2]   ),
  .write_finished     (write_finished[2]   ),
  .write_count        (write_data_count[2] ),
  .write_flush        (write_flush[2]      ),

  .write_ready        (write_ready[2]      ),
  .write_activate     (write_activate[2]   ),
  .write_size         (write_size[2]       ),
  .write_strobe       (write_strobe[2]     ),
  .write_data         (write_data[2]       ),


  .read_enable        (read_enable[2]      ),
  .read_addr          (read_addr[2]        ),
  .read_addr_inc      (read_addr_inc[2]    ),
  .read_addr_dec      (read_addr_dec[2]    ),
  .read_busy          (read_busy[2]        ),
  .read_error         (read_error[2]       ),
  .read_count         (read_data_count[2]  ),
  .read_flush         (read_flush [2]      ),

  .read_ready         (read_ready[2]       ),
  .read_activate      (read_activate[2]    ),
  .read_size          (read_size[2]        ),
  .read_data          (read_data[2]        ),
  .read_strobe        (read_strobe[2]      )
);

//4th Device
test_mem_dev #(
    .READ_FIFO_SIZE   (                 8  ),
    .WRITE_FIFO_SIZE  (                 8  ),
    .ADDRESS_WIDTH    (           AWIDTH3  )
)tdm3(
  .clk                (clk                 ),
  .rst                (rst                 ),


  .write_enable       (write_enable[3]     ),
  .write_addr         (write_addr[3]       ),
  .write_addr_inc     (write_addr_inc[3]   ),
  .write_addr_dec     (write_addr_dec[3]   ),
  .write_finished     (write_finished[3]   ),
  .write_count        (write_data_count[3] ),
  .write_flush        (write_flush[3]      ),

  .write_ready        (write_ready[3]      ),
  .write_activate     (write_activate[3]   ),
  .write_size         (write_size[3]       ),
  .write_strobe       (write_strobe[3]     ),
  .write_data         (write_data[3]       ),


  .read_enable        (read_enable[3]      ),
  .read_addr          (read_addr[3]        ),
  .read_addr_inc      (read_addr_inc[3]    ),
  .read_addr_dec      (read_addr_dec[3]    ),
  .read_busy          (read_busy[3]        ),
  .read_error         (read_error[3]       ),
  .read_count         (read_data_count[3]  ),
  .read_flush         (read_flush [3]      ),

  .read_ready         (read_ready[3]       ),
  .read_activate      (read_activate[3]    ),
  .read_size          (read_size[3]        ),
  .read_data          (read_data[3]        ),
  .read_strobe        (read_strobe[3]      )
);


assign  w_wbs0_ack              = 0;
assign  w_wbs0_dat_o            = 0;
assign  start                   = 1;

always #`CLK_HALF_PERIOD        clk = ~clk;

initial begin
  fd_out                        = 0;
  read_count                    = 0;
  data_count                    = 0;
  timeout_count                 = 0;
  request_more_data_ack         <=  0;
  execute_command               <=  0;

  $dumpfile ("design.vcd");
  $dumpvars (0, wishbone_master_tb);
  fd_in                         = $fopen(`INPUT_FILE, "r");
  fd_out                        = $fopen(`OUTPUT_FILE, "w");
  `SLEEP_HALF_CLK;

  rst                           <= 0;
  `SLEEP_CLK(100);
  rst                           <= 1;

  //clear the handler signals
  r_in_ready                    <= 0;
  r_in_command                  <= 0;
  r_in_address                  <= 32'h0;
  r_in_data                     <= 32'h0;
  r_in_data_count               <= 0;
  r_out_ready                   <= 0;
  //clear wishbone signals
  `SLEEP_CLK(10);
  rst                           <= 0;
  r_out_ready                   <= 1;

  if (fd_in == 0) begin
    $display ("TB: input stimulus file was not found");
  end
  else begin
    //while there is still data to be read from the file
    while (!$feof(fd_in)) begin
      //read in a command
      read_count = $fscanf (fd_in, "%h:%h:%h:%h\n",
                                  r_in_data_count,
                                  r_in_command,
                                  r_in_address,
                                  r_in_data);

      //Handle Frindge commands/comments
      if (read_count != 4) begin
        if (read_count == 0) begin
          ch = $fgetc(fd_in);
          if (ch == "\#") begin
            //$display ("Eat a comment");
            //Eat the line
            while (ch != "\n") begin
              ch = $fgetc(fd_in);
            end
            `ifdef VERBOSE $display (""); `endif
          end
          else begin
            `ifdef VERBOSE $display ("Error unrecognized line: %h" % ch); `endif
            //Eat the line
            while (ch != "\n") begin
              ch = $fgetc(fd_in);
            end
          end
        end
        else if (read_count == 1) begin
          `ifdef VERBOSE $display ("Sleep for %h Clock cycles", r_in_data_count); `endif
          `SLEEP_CLK(r_in_data_count);
          `ifdef VERBOSE $display ("Sleep Finished"); `endif
        end
        else begin
          `ifdef VERBOSE $display ("Error: read_count = %h != 4", read_count); `endif
          `ifdef VERBOSE $display ("Character: %h", ch); `endif
        end
      end
      else begin
        `ifdef VERBOSE
        case (r_in_command)
          0: $display ("TB: Executing PING commad");
          1: $display ("TB: Executing WRITE command");
          2: $display ("TB: Executing READ command");
          3: $display ("TB: Executing RESET command");
        endcase
        `endif
        `ifdef VERBOSE $display ("Execute Command"); `endif
        execute_command                 <= 1;
        `SLEEP_CLK(1);
        while (~command_finished) begin
          request_more_data_ack         <= 0;

          if ((r_in_command & 32'h0000FFFF) == 1) begin
            if (request_more_data && ~request_more_data_ack) begin
              read_count      = $fscanf(fd_in, "%h\n", r_in_data);
              `ifdef VERBOSE $display ("TB: reading a new double word: %h", r_in_data); `endif
              request_more_data_ack     <= 1;
            end
          end

          //so time porgresses wait a tick
          `SLEEP_CLK(1);
          //this doesn't need to be here, but there is a weird behavior in iverilog
          //that wont allow me to put a delay in right before an 'end' statement
          //execute_command <= 1;
        end //while command is not finished
        execute_command <= 0;

        while (command_finished) begin
          `ifdef VERBOSE $display ("Command Finished"); `endif
          `SLEEP_CLK(1);
          execute_command <= 0;
        end
        `SLEEP_CLK(50);
        `ifdef VERBOSE $display ("TB: finished command"); `endif
      end //end read_count == 4
    end //end while ! eof
  end //end not reset
  `SLEEP_CLK(50);
  $fclose (fd_in);
  $fclose (fd_out);
  $finish();
end
//initial begin
//    $monitor("%t, state: %h", $time, state);
//end

//initial begin
//    $monitor("%t, data: %h, state: %h, execute command: %h", $time, w_wbm_dat_o, state, execute_command);
//end
//initial begin
    //$monitor("%t, state: %h, execute: %h, cmd_fin: %h", $time, state, execute_command, command_finished);
    //$monitor("%t, state: %h, write_size: %d, write_count: %d, execute: %h", $time, state, r_in_data_count, data_write_count, execute_command);
//end



always @ (posedge clk) begin
  if (rst) begin
    state                     <= WAIT_FOR_SDRAM;
    request_more_data         <= 0;
    timeout_count             <= 0;
    prev_int                  <= 0;
    r_ih_reset                <= 0;
    data_write_count          <= 0;
    data_read_count           <= 1;

    command_finished          <= 0;
  end
  else begin
    r_ih_reset                <= 0;
    r_in_ready                <= 0;
    r_out_ready               <= 1;
    command_finished          <= 0;

    //Countdown the NACK timeout
    if (execute_command && timeout_count < `TIMEOUT_COUNT) begin
      timeout_count           <= timeout_count + 1;
    end

    if (execute_command && timeout_count >= `TIMEOUT_COUNT) begin
      `ifdef VERBOSE
      case (r_in_command)
        0: $display ("TB: Master timed out while executing PING commad");
        1: $display ("TB: Master timed out while executing WRITE command");
        2: $display ("TB: Master timed out while executing READ command");
        3: $display ("TB: Master timed out while executing RESET command");
      endcase
      `endif

      command_finished        <= 1;
      state                   <= IDLE;
      timeout_count           <= 0;
    end //end reached the end of a timeout

    case (state)
      WAIT_FOR_SDRAM: begin
        timeout_count         <= 0;
        r_in_ready            <= 0;
        //Uncomment 'start' conditional to wait for SDRAM  to finish starting
        //up
        if (start) begin
          `ifdef VERBOSE $display            ("TB: sdram is ready"); `endif
          state                 <=  IDLE;
        end
      end
      IDLE: begin
        timeout_count         <= 0;
        command_finished      <= 0;
        data_write_count      <= 1;
        if (execute_command && !command_finished) begin
          state               <=  SEND_COMMAND;
        end
        data_read_count       <= 1;
      end
      SEND_COMMAND: begin
        timeout_count         <= 0;
        if (w_master_ready) begin
          r_in_ready          <=  1;
          state               <=  MASTER_READ_COMMAND;
        end
      end
      MASTER_READ_COMMAND: begin
        r_in_ready            <=  1;
        if (!w_master_ready) begin
          r_in_ready          <=  0;
          case (r_in_command & 32'h0000FFFF)
            0: begin
              state             <=  PING_RESPONSE;
            end
            1: begin
              if (r_in_data_count > 1) begin
                `ifdef VERBOSE $display ("TB:\tWrote Double Word %d: %h", data_write_count, r_in_data); `endif
                if (data_write_count < r_in_data_count) begin
                  state           <=  WRITE_DATA;
                  timeout_count   <=  0;
                  data_write_count<=  data_write_count + 1;
                end
                else begin
                  `ifdef VERBOSE $display ("TB: Finished Writing: %d 32bit words of %d size", r_in_data_count, data_write_count); `endif
                  state           <=  WRITE_RESPONSE;
                end
              end
              else begin
                `ifdef VERBOSE $display ("TB:\tWrote Double Word %d: %h", data_write_count, r_in_data); `endif
                `ifdef VERBOSE $display ("TB: Finished Writing: %d 32bit words of %d size", r_in_data_count, data_write_count); `endif
                state           <=  WRITE_RESPONSE;
              end
            end
            2: begin
              state             <=  READ_RESPONSE;
            end
            3: begin
              state             <=  RESET;
            end
          endcase
        end
      end
      RESET: begin
        r_ih_reset            <=  1;
        state                 <=  RESET;
      end
      PING_RESPONSE: begin
        if (w_out_en) begin
          if (w_out_status[7:0] == 8'hFF) begin
            `ifdef VERBOSE $display ("TB: Ping Response Good"); `endif
          end
          else begin
            `ifdef VERBOSE $display ("TB: Ping Response Bad (Malformed response: %h)", w_out_status); `endif
          end
          `ifdef VERBOSE $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data); `endif
          state               <=  FINISHED;
        end
      end
      WRITE_DATA: begin
        if (!r_in_ready && w_master_ready) begin
          state               <=  GET_WRITE_DATA;
          request_more_data   <=  1;
        end
      end
      WRITE_RESPONSE: begin
        `ifdef VERBOSE $display ("In Write Response"); `endif
        if (w_out_en) begin
          if (w_out_status[7:0] == (~(8'h01))) begin
            `ifdef VERBOSE $display ("TB: Write Response Good"); `endif
          end
          else begin
            `ifdef VERBOSE $display ("TB: Write Response Bad (Malformed response: %h)", w_out_status); `endif
          end
          `ifdef VERBOSE $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data); `endif
          state               <=  FINISHED;
        end
      end
      GET_WRITE_DATA: begin
        if (request_more_data_ack) begin
          request_more_data   <=  0;
          r_in_ready          <=  1;
          state               <=  SEND_COMMAND;
        end
      end
      READ_RESPONSE: begin
        if (w_out_en) begin
          if (w_out_status[7:0] == (~(8'h02))) begin
            `ifdef VERBOSE $display ("TB: Read Response Good"); `endif
            if (w_out_data_count > 0) begin
              if (data_read_count < w_out_data_count) begin
                state           <=  READ_MORE_DATA;
                timeout_count   <=  0;
                data_read_count <=  data_read_count + 1;
              end
              else begin
                state           <=  FINISHED;
              end
            end
          end
          else begin
            `ifdef VERBOSE $display ("TB: Read Response Bad (Malformed response: %h)", w_out_status); `endif
            state               <=  FINISHED;
          end
          `ifdef VERBOSE $display ("TB: \tS:A:D = %h:%h:%h\n", w_out_status, w_out_address, w_out_data); `endif
        end
      end
      READ_MORE_DATA: begin
        if (w_out_en) begin
          timeout_count         <=  0;
          r_out_ready           <=  0;
          `ifdef VERBOSE $display ("TB: Read a 32bit data packet"); `endif
          `ifdef VERBOSE $display ("TB: \tRead Data: %h", w_out_data); `endif
          data_read_count       <=  data_read_count + 1;
        end
        if (data_read_count >= r_in_data_count) begin
          state                 <=  FINISHED;
        end
      end
      FINISHED: begin
        command_finished        <=  1;
        if (!execute_command) begin
          `ifdef VERBOSE $display ("Execute Command is low"); `endif
          command_finished      <=  0;
          state                 <=  IDLE;
        end
      end
    endcase
    if (w_out_en && w_out_status == `PERIPH_INTERRUPT) begin
      `ifdef VERBOSE $display("TB: Output Handler Recieved interrupt"); `endif
      `ifdef VERBOSE $display("TB:\tcommand: %h", w_out_status); `endif
      `ifdef VERBOSE $display("TB:\taddress: %h", w_out_address); `endif
      `ifdef VERBOSE $display("TB:\tdata: %h", w_out_data); `endif
    end
  end//not reset
end

endmodule
