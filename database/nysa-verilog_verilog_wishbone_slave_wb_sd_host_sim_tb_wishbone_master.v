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
wire              sd_clk;
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


wire              phy_sd_cmd;
wire    [3:0]     phy_sd_data;

wire              pll_locked;

wire              dev_sd_cmd_dir;
wire              dev_sd_cmd_in;
wire              dev_sd_cmd_out;

wire              dev_sd_data_dir;
wire    [7:0]     dev_sd_data_in;
wire    [7:0]     dev_sd_data_out;


// Function Interface From CIA
wire              fbr1_csa_en;
wire    [3:0]     fbr1_pwr_mode;
wire    [15:0]    fbr1_block_size;

wire              fbr2_csa_en;
wire    [3:0]     fbr2_pwr_mode;
wire    [15:0]    fbr2_block_size;

wire              fbr3_csa_en;
wire    [3:0]     fbr3_pwr_mode;
wire    [15:0]    fbr3_block_size;

wire              fbr4_csa_en;
wire    [3:0]     fbr4_pwr_mode;
wire    [15:0]    fbr4_block_size;

wire              fbr5_csa_en;
wire    [3:0]     fbr5_pwr_mode;
wire    [15:0]    fbr5_block_size;

wire              fbr6_csa_en;
wire    [3:0]     fbr6_pwr_mode;
wire    [15:0]    fbr6_block_size;

wire              fbr7_csa_en;
wire    [3:0]     fbr7_pwr_mode;
wire    [15:0]    fbr7_block_size;



wire    [7:0]     function_enable;
wire    [7:0]     function_ready;
wire    [2:0]     function_abort_stb;
wire    [7:0]     function_exec_status;
wire    [7:0]     function_ready_for_data;

wire              function_inc_addr;
wire              function_bock_mode;

wire              func_wr_stb   [0:8];
wire    [7:0]     func_wr_data  [0:8];
wire              func_rd_stb   [0:8];
wire    [7:0]     func_rd_data  [0:8];
wire              func_hst_rdy  [0:8];
wire              func_com_rdy  [0:8];
wire              func_activate [0:8];

wire    [7:0]     function_interrupt;
wire              func_inc_addr;
wire    [3:0]     func_num;
wire              func_write_flag;
wire              func_rd_after_wr;
wire    [17:0]    func_addr;
wire    [12:0]    func_data_count;
wire              func_block_mode;


wire              i_func_num;
wire              o_read_wait;
wire              o_interrupt;

wire              demo_func_ready;
wire              demo_func_int_pend;
wire              demo_func_busy;
wire              demo_func_exec_sts;

//wishbone signals
wire              w_wbp_we;
wire              w_wbp_cyc;
wire              w_wbp_stb;
wire [3:0]        w_wbp_sel;
wire [31:0]       w_wbp_adr;
wire [31:0]       w_wbp_dat_o;
wire [31:0]       w_wbp_dat_i;
wire              w_wbp_ack;
wire              w_wbp_int;

//mem slave 0
wire              w_sm0_i_wbs_we;
wire              w_sm0_i_wbs_cyc;
wire  [31:0]      w_sm0_i_wbs_dat;
wire  [31:0]      w_sm0_o_wbs_dat;
wire  [31:0]      w_sm0_i_wbs_adr;
wire              w_sm0_i_wbs_stb;
wire  [3:0]       w_sm0_i_wbs_sel;
wire              w_sm0_o_wbs_ack;
wire              w_sm0_o_wbs_int;


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

//Memory Interface
wire              w_mem_we_o;
wire              w_mem_cyc_o;
wire              w_mem_stb_o;
wire  [3:0]       w_mem_sel_o;
wire  [31:0]      w_mem_adr_o;
wire  [31:0]      w_mem_dat_i;
wire  [31:0]      w_mem_dat_o;
wire              w_mem_ack_i;
wire              w_mem_int_i;

wire              w_arb0_i_wbs_stb;
wire              w_arb0_i_wbs_cyc;
wire              w_arb0_i_wbs_we;
wire  [3:0]       w_arb0_i_wbs_sel;
wire  [31:0]      w_arb0_i_wbs_dat;
wire  [31:0]      w_arb0_o_wbs_dat;
wire  [31:0]      w_arb0_i_wbs_adr;
wire              w_arb0_o_wbs_ack;
wire              w_arb0_o_wbs_int;


wire              mem_o_we;
wire              mem_o_stb;
wire              mem_o_cyc;
wire  [3:0]       mem_o_sel;
wire  [31:0]      mem_o_adr;
wire  [31:0]      mem_o_dat;
wire  [31:0]      mem_i_dat;
wire              mem_i_ack;
wire              mem_i_int;


assign  device_interrupt  = w_wbm_int;
assign  w_wbs0_int        = 1'b0;



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


wire              start;
reg               execute_command;
reg               command_finished;
reg               request_more_data;
reg               request_more_data_ack;
reg     [27:0]    data_write_count;
reg     [27:0]    data_read_count;


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

  .o_per_we       (w_wbp_we         ),
  .o_per_adr      (w_wbp_adr        ),
  .o_per_dat      (w_wbp_dat_i      ),
  .i_per_dat      (w_wbp_dat_o      ),
  .o_per_stb      (w_wbp_stb        ),
  .o_per_cyc      (w_wbp_cyc        ),
  .o_per_msk      (w_wbp_msk        ),
  .o_per_sel      (w_wbp_sel        ),
  .i_per_ack      (w_wbp_ack        ),
  .i_per_int      (w_wbp_int        ),

  //memory interconnect signals
  .o_mem_we       (w_mem_we_o       ),
  .o_mem_adr      (w_mem_adr_o      ),
  .o_mem_dat      (w_mem_dat_o      ),
  .i_mem_dat      (w_mem_dat_i      ),
  .o_mem_stb      (w_mem_stb_o      ),
  .o_mem_cyc      (w_mem_cyc_o      ),
  .o_mem_sel      (w_mem_sel_o      ),
  .i_mem_ack      (w_mem_ack_i      ),
  .i_mem_int      (w_mem_int_i      )

);

wishbone_mem_interconnect wmi (
  .clk        (clk                  ),
  .rst        (rst                ),

  //master
  .i_m_we     (w_mem_we_o           ),
  .i_m_cyc    (w_mem_cyc_o          ),
  .i_m_stb    (w_mem_stb_o          ),
  .i_m_sel    (w_mem_sel_o          ),
  .o_m_ack    (w_mem_ack_i          ),
  .i_m_dat    (w_mem_dat_o          ),
  .o_m_dat    (w_mem_dat_i          ),
  .i_m_adr    (w_mem_adr_o          ),
  .o_m_int    (w_mem_int_i          ),

  //slave 0
  .o_s0_we    (w_sm0_i_wbs_we       ),
  .o_s0_cyc   (w_sm0_i_wbs_cyc      ),
  .o_s0_stb   (w_sm0_i_wbs_stb      ),
  .o_s0_sel   (w_sm0_i_wbs_sel      ),
  .i_s0_ack   (w_sm0_o_wbs_ack      ),
  .o_s0_dat   (w_sm0_i_wbs_dat      ),
  .i_s0_dat   (w_sm0_o_wbs_dat      ),
  .o_s0_adr   (w_sm0_i_wbs_adr      ),
  .i_s0_int   (w_sm0_o_wbs_int      )
);

//slave 1
wb_sd_host s1 (

  .clk        (clk                  ),
  .rst        (rst                  ),

  .i_wbs_we   (w_wbs1_we            ),
  .i_wbs_sel  (4'b1111              ),
  .i_wbs_cyc  (w_wbs1_cyc           ),
  .i_wbs_dat  (w_wbs1_dat_i         ),
  .i_wbs_stb  (w_wbs1_stb           ),
  .o_wbs_ack  (w_wbs1_ack           ),
  .o_wbs_dat  (w_wbs1_dat_o         ),
  .i_wbs_adr  (w_wbs1_adr           ),
  .o_wbs_int  (w_wbs1_int           ),

  .mem_o_we   (mem_o_we             ),
  .mem_o_stb  (mem_o_stb            ),
  .mem_o_cyc  (mem_o_cyc            ),
  .mem_o_sel  (mem_o_sel            ),
  .mem_o_adr  (mem_o_adr            ),
  .mem_o_dat  (mem_o_dat            ),
  .mem_i_dat  (mem_i_dat            ),
  .mem_i_ack  (mem_i_ack            ),
  .mem_i_int  (mem_i_int            ),

  .o_sd_clk   (sd_clk               ),
  .io_sd_cmd  (phy_sd_cmd           ),
  .io_sd_data (phy_sd_data          )

);

wishbone_interconnect wi (
  .clk        (clk                  ),
  .rst        (rst                ),

  .i_m_we     (w_wbp_we             ),
  .i_m_cyc    (w_wbp_cyc            ),
  .i_m_stb    (w_wbp_stb            ),
  .o_m_ack    (w_wbp_ack            ),
  .i_m_dat    (w_wbp_dat_i          ),
  .o_m_dat    (w_wbp_dat_o          ),
  .i_m_adr    (w_wbp_adr            ),
  .o_m_int    (w_wbp_int            ),

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



arbiter_2_masters arb0 (
  .clk        (clk                  ),
  .rst        (rst                  ),

  //masters
  .i_m1_we    (mem_o_we             ),
  .i_m1_stb   (mem_o_stb            ),
  .i_m1_cyc   (mem_o_cyc            ),
  .i_m1_sel   (mem_o_sel            ),
  .i_m1_dat   (mem_o_dat            ),
  .i_m1_adr   (mem_o_adr            ),
  .o_m1_dat   (mem_i_dat            ),
  .o_m1_ack   (mem_i_ack            ),
  .o_m1_int   (mem_i_int            ),


  .i_m0_we    (w_sm0_i_wbs_we       ),
  .i_m0_stb   (w_sm0_i_wbs_stb      ),
  .i_m0_cyc   (w_sm0_i_wbs_cyc      ), //Artificially block
  .i_m0_sel   (w_sm0_i_wbs_sel      ),
  .i_m0_dat   (w_sm0_i_wbs_dat      ),
  .i_m0_adr   (w_sm0_i_wbs_adr      ),
  .o_m0_dat   (w_sm0_o_wbs_dat      ),
  .o_m0_ack   (w_sm0_o_wbs_ack      ),
  .o_m0_int   (w_sm0_o_wbs_int      ),

  //slave
  .o_s_we     (w_arb0_i_wbs_we      ),
  .o_s_stb    (w_arb0_i_wbs_stb     ),
  .o_s_cyc    (w_arb0_i_wbs_cyc     ),
  .o_s_sel    (w_arb0_i_wbs_sel     ),
  .o_s_dat    (w_arb0_i_wbs_dat     ),
  .o_s_adr    (w_arb0_i_wbs_adr     ),
  .i_s_dat    (w_arb0_o_wbs_dat     ),
  .i_s_ack    (w_arb0_o_wbs_ack     ),
  .i_s_int    (w_arb0_o_wbs_int     )
);

wb_bram #(
  .DATA_WIDTH (32                   ),
  .ADDR_WIDTH (10                   )
)bram(
  .clk        (clk                  ),
  .rst        (rst                  ),

  .i_wbs_we   (w_arb0_i_wbs_we      ),
  .i_wbs_sel  (w_arb0_i_wbs_sel     ),
  .i_wbs_cyc  (w_arb0_i_wbs_cyc     ),
  .i_wbs_dat  (w_arb0_i_wbs_dat     ),
  .i_wbs_stb  (w_arb0_i_wbs_stb     ),
  .i_wbs_adr  (w_arb0_i_wbs_adr     ),
  .o_wbs_dat  (w_arb0_o_wbs_dat     ),
  .o_wbs_ack  (w_arb0_o_wbs_ack     ),
  .o_wbs_int  (w_arb0_o_wbs_int     )
);

sd_dev_platform_spartan6 #(
  .OUTPUT_DELAY   (0                ),
  .INPUT_DELAY    (0                )
)sdio_dev_plat (
  .clk            (clk              ),
  .rst            (rst              ),

  .o_locked       (pll_locked       ),

  .o_sd_clk       (dev_sd_clk       ),

  .i_sd_cmd_dir   (dev_sd_cmd_dir   ),
  .o_sd_cmd_in    (dev_sd_cmd_in    ),
  .i_sd_cmd_out   (dev_sd_cmd_out   ),

  .i_sd_data_dir  (dev_sd_data_dir  ),
  .o_sd_data_in   (dev_sd_data_in   ),
  .i_sd_data_out  (dev_sd_data_out  ),

  .i_phy_clk      (sd_clk           ),
  .io_phy_sd_cmd  (phy_sd_cmd       ),
  .io_phy_sd_data (phy_sd_data      )
);

pullup (phy_sd_cmd    );

pullup (phy_sd_data[0]);
pullup (phy_sd_data[1]);
pullup (phy_sd_data[2]);
pullup (phy_sd_data[3]);

//TODO ADAPT sdio_device to use the platform based phy_sd_cmd and phy_sd_data
sdio_device_stack sdio_device (
  .sdio_clk             (dev_sd_clk           ),
  .rst                  (rst   || !pll_locked ),

  // Function Interfacee From CIA
  .o_fbr1_csa_en        (fbr1_csa_en          ),
  .o_fbr1_pwr_mode      (fbr1_pwr_mode        ),
  .o_fbr1_block_size    (fbr1_block_size      ),

  .o_fbr2_csa_en        (fbr2_csa_en          ),
  .o_fbr2_pwr_mode      (fbr2_pwr_mode        ),
  .o_fbr2_block_size    (fbr2_block_size      ),

  .o_fbr3_csa_en        (fbr3_csa_en          ),
  .o_fbr3_pwr_mode      (fbr3_pwr_mode        ),
  .o_fbr3_block_size    (fbr3_block_size      ),

  .o_fbr4_csa_en        (fbr4_csa_en          ),
  .o_fbr4_pwr_mode      (fbr4_pwr_mode        ),
  .o_fbr4_block_size    (fbr4_block_size      ),

  .o_fbr5_csa_en        (fbr5_csa_en          ),
  .o_fbr5_pwr_mode      (fbr5_pwr_mode        ),
  .o_fbr5_block_size    (fbr5_block_size      ),

  .o_fbr6_csa_en        (fbr6_csa_en          ),
  .o_fbr6_pwr_mode      (fbr6_pwr_mode        ),
  .o_fbr6_block_size    (fbr6_block_size      ),

  .o_fbr7_csa_en        (fbr7_csa_en          ),
  .o_fbr7_pwr_mode      (fbr7_pwr_mode        ),
  .o_fbr7_block_size    (fbr7_block_size      ),

  //Data Interface

  //Function 1 Interface
  .o_func1_wr_stb       (func_wr_stb[1]       ),
  .o_func1_wr_data      (func_wr_data[1]      ),
  .i_func1_rd_stb       (func_rd_stb[1]       ),
  .i_func1_rd_data      (func_rd_data[1]      ),
  .o_func1_hst_rdy      (func_hst_rdy[1]      ),
  .i_func1_com_rdy      (func_com_rdy[1]      ),
  .o_func1_activate     (func_activate[1]     ),

  //Function 2 Interface
  .o_func2_wr_stb       (func_wr_stb[2]       ),
  .o_func2_wr_data      (func_wr_data[2]      ),
  .i_func2_rd_stb       (func_rd_stb[2]       ),
  .i_func2_rd_data      (func_rd_data[2]      ),
  .o_func2_hst_rdy      (func_hst_rdy[2]      ),
  .i_func2_com_rdy      (func_com_rdy[2]      ),
  .o_func2_activate     (func_activate[2]     ),

  //Function 3 Interface
  .o_func3_wr_stb       (func_wr_stb[3]       ),
  .o_func3_wr_data      (func_wr_data[3]      ),
  .i_func3_rd_stb       (func_rd_stb[3]       ),
  .i_func3_rd_data      (func_rd_data[3]      ),
  .o_func3_hst_rdy      (func_hst_rdy[3]      ),
  .i_func3_com_rdy      (func_com_rdy[3]      ),
  .o_func3_activate     (func_activate[3]     ),

  //Function 4 Interface
  .o_func4_wr_stb       (func_wr_stb[4]       ),
  .o_func4_wr_data      (func_wr_data[4]      ),
  .i_func4_rd_stb       (func_rd_stb[4]       ),
  .i_func4_rd_data      (func_rd_data[4]      ),
  .o_func4_hst_rdy      (func_hst_rdy[4]      ),
  .i_func4_com_rdy      (func_com_rdy[4]      ),
  .o_func4_activate     (func_activate[4]     ),

  //Function 5 Interface
  .o_func5_wr_stb       (func_wr_stb[5]       ),
  .o_func5_wr_data      (func_wr_data[5]      ),
  .i_func5_rd_stb       (func_rd_stb[5]       ),
  .i_func5_rd_data      (func_rd_data[5]      ),
  .o_func5_hst_rdy      (func_hst_rdy[5]      ),
  .i_func5_com_rdy      (func_com_rdy[5]      ),
  .o_func5_activate     (func_activate[5]     ),

  //Function 6 Interface
  .o_func6_wr_stb       (func_wr_stb[6]       ),
  .o_func6_wr_data      (func_wr_data[6]      ),
  .i_func6_rd_stb       (func_rd_stb[6]       ),
  .i_func6_rd_data      (func_rd_data[6]      ),
  .o_func6_hst_rdy      (func_hst_rdy[6]      ),
  .i_func6_com_rdy      (func_com_rdy[6]      ),
  .o_func6_activate     (func_activate[6]     ),

  //Function 7 Interface
  .o_func7_wr_stb       (func_wr_stb[7]       ),
  .o_func7_wr_data      (func_wr_data[7]      ),
  .i_func7_rd_stb       (func_rd_stb[7]       ),
  .i_func7_rd_data      (func_rd_data[7]      ),
  .o_func7_hst_rdy      (func_hst_rdy[7]      ),
  .i_func7_com_rdy      (func_com_rdy[7]      ),
  .o_func7_activate     (func_activate[7]     ),

  //Memory Interface
  .o_mem_wr_stb         (func_wr_stb[8]       ),
  .o_mem_wr_data        (func_wr_data[8]      ),
  .i_mem_rd_stb         (func_rd_stb[8]       ),
  .i_mem_rd_data        (func_rd_data[8]      ),
  .o_mem_hst_rdy        (func_hst_rdy[8]      ),
  .i_mem_com_rdy        (func_com_rdy[8]      ),
  .o_mem_activate       (func_activate[8]     ),


  .o_func_enable        (function_enable      ),
  .i_func_ready         (function_ready       ),
  .o_func_abort_stb     (function_abort_stb   ),
  .i_func_exec_status   (function_exec_status ),
  .i_func_ready_for_data(function_ready_for_data  ),

  .o_func_inc_addr      (func_inc_addr        ),
  .o_func_block_mode    (func_block_mode      ),
  .o_func_write_flag    (func_write_flag      ),
  .o_func_num           (func_num             ),
  .o_func_rd_after_wr   (func_rd_after_wr     ),
  .o_func_addr          (func_addr            ),
  .o_func_data_count    (func_data_count      ),

  .i_interrupt          (function_interrupt   ),

  .o_sd_cmd_dir         (dev_sd_cmd_dir       ),
  .i_sd_cmd_in          (dev_sd_cmd_in        ),
  .o_sd_cmd_out         (dev_sd_cmd_out       ),

  .o_sd_data_dir        (dev_sd_data_dir      ),
  .o_sd_data_out        (dev_sd_data_out      ),
  .i_sd_data_in         (dev_sd_data_in       )

);

demo_function demo (
  .clk                  (clk                 ),
  .sdio_clk             (dev_sd_clk          ),
  .rst                  (rst   || !pll_locked),

  .i_csa_en             (fbr1_csa_en         ),
  .i_pwr_mode           (fbr1_pwr_mode       ),
  .i_block_size         (fbr1_block_size     ),
  .i_enable             (function_enable[1]  ),
  .o_ready              (demo_func_ready     ),
  .i_abort              (function_abort_stb[1]),
  .o_busy               (demo_func_busy      ),
  .o_execution_status   (demo_func_exec_sts  ),
  .o_ready_for_data     (demo_func_ready_for_data),

  .i_activate           (func_activate[1]    ),
  .o_finished           (demo_func_finished  ),
  .i_inc_addr           (func_inc_addr       ),
  .i_block_mode         (func_block_mode     ),

  .i_write_flag         (func_write_flag     ),
  .i_rd_after_wr        (func_rd_after_wr    ),
  .i_addr               (func_addr           ),
  .i_write_data         (func_wr_data[1]     ),
  .o_read_data          (func_rd_data[1]     ),
  .o_data_rdy           (func_com_rdy[1]     ),
  .i_data_stb           (func_wr_stb[1]      ),
  .i_host_rdy           (func_hst_rdy[1]     ),
  .i_data_count         (func_data_count     ),
  .o_data_stb           (func_rd_stb[1]      ),

//  .o_read_wait          (demo_func_read_wait ),
  .o_interrupt          (demo_func_interrupt ),

//  .i_request_read_wait  (r_request_read_wait ),
  .i_request_interrupt  (r_request_interrupt )

);

assign  w_wbs0_ack              = 0;
assign  w_wbs0_dat_o            = 0;
assign  start                   = 1;
assign  function_ready          = {6'b000000, demo_func_ready,          1'b0};
assign  function_exec_status    = {6'b000000, demo_func_exec_sts,       1'b0};
assign  function_ready_for_data = {6'b000000, demo_func_ready_for_data, 1'b0};
assign  function_interrupt      = {6'b000000, demo_func_interrupt,      1'b0};




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
