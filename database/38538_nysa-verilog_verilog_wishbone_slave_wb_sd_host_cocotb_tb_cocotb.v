// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`timescale 1ns/1ps


module tb_cocotb (

//Virtual Host Interface Signals
input             cocotb_clk,
input             in_clk,
input             rst,
output            master_ready,

input             in_ready,
input   [31:0]    in_command,
input   [31:0]    in_address,
input   [31:0]    in_data,
input   [27:0]    in_data_count,

input             out_ready,
output            out_en,
output  [31:0]    out_status,
output  [31:0]    out_address,
output  [31:0]    out_data,
output  [27:0]    out_data_count,
input   [31:0]    test_id,

input             ih_reset,

input             request_read_wait,
input             request_interrupt,
output            device_interrupt
);

//Parameters
//Registers/Wires

reg               r_rst;
reg               r_in_ready;
reg   [31:0]      r_in_command;
reg   [31:0]      r_in_address;
reg   [31:0]      r_in_data;
reg   [27:0]      r_in_data_count;
reg               r_out_ready;
reg               r_ih_reset;
reg               clk;
reg               r_request_read_wait;
reg               r_request_interrupt;
wire              request_read_wait = 0;

wire              dev_sd_clk;

//There is a bug in COCOTB when stiumlating a signal, sometimes it can be corrupted if not registered
always @ (*) r_rst           = rst;
always @ (*) r_in_ready      = in_ready;
always @ (*) r_in_command    = in_command;
always @ (*) r_in_address    = in_address;
always @ (*) r_in_data       = in_data;
always @ (*) r_in_data_count = in_data_count;
always @ (*) r_out_ready     = out_ready;
always @ (*) r_ih_reset      = ih_reset;
always @ (*) clk             = in_clk;
always @ (*) r_request_read_wait    =   request_read_wait;
always @ (*) r_request_interrupt    =   request_interrupt;


wire              phy_sd_cmd;
tri1    [3:0]     phy_sd_data;

wire              dev_pll_locked;

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

wire              w_wbs2_we;
wire              w_wbs2_cyc;
wire              w_wbs2_stb;
wire  [3:0]       w_wbs2_sel;
wire              w_wbs2_ack;
wire  [31:0]      w_wbs2_dat_i;
wire  [31:0]      w_wbs2_dat_o;
wire  [31:0]      w_wbs2_adr;
wire              w_wbs2_int;

wire              w_wbs3_we;
wire              w_wbs3_cyc;
wire              w_wbs3_stb;
wire  [3:0]       w_wbs3_sel;
wire              w_wbs3_ack;
wire  [31:0]      w_wbs3_dat_i;
wire  [31:0]      w_wbs3_dat_o;
wire  [31:0]      w_wbs3_adr;
wire              w_wbs3_int;

wire              w_wbs4_we;
wire              w_wbs4_cyc;
wire              w_wbs4_stb;
wire  [3:0]       w_wbs4_sel;
wire              w_wbs4_ack;
wire  [31:0]      w_wbs4_dat_i;
wire  [31:0]      w_wbs4_dat_o;
wire  [31:0]      w_wbs4_adr;
wire              w_wbs4_int;



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

wire              sd_clk;

//Submodules
wishbone_master wm (
  .clk            (clk              ),
  .rst            (r_rst || !dev_pll_locked  ),

  .i_ih_rst       (r_ih_reset       ),

  .i_ready        (r_in_ready       ),
  .i_command      (r_in_command     ),
  .i_address      (r_in_address     ),
  .i_data         (r_in_data        ),
  .i_data_count   (r_in_data_count  ),
  .o_master_ready (master_ready     ),

  .i_out_ready    (r_out_ready      ),
  .o_en           (out_en           ),
  .o_status       (out_status       ),
  .o_address      (out_address      ),
  .o_data         (out_data         ),
  .o_data_count   (out_data_count   ),

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
  .rst        (r_rst                ),

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
  .rst        (r_rst                ),

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
  .rst        (r_rst                ),

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
  .i_s1_int   (w_wbs1_int           ),

  .o_s2_we    (w_wbs2_we            ),
  .o_s2_cyc   (w_wbs2_cyc           ),
  .o_s2_stb   (w_wbs2_stb           ),
  .i_s2_ack   (w_wbs2_ack           ),
  .o_s2_dat   (w_wbs2_dat_i         ),
  .i_s2_dat   (w_wbs2_dat_o         ),
  .o_s2_adr   (w_wbs2_adr           ),
  .i_s2_int   (w_wbs2_int           ),

  .o_s3_we    (w_wbs3_we            ),
  .o_s3_cyc   (w_wbs3_cyc           ),
  .o_s3_stb   (w_wbs3_stb           ),
  .i_s3_ack   (w_wbs3_ack           ),
  .o_s3_dat   (w_wbs3_dat_i         ),
  .i_s3_dat   (w_wbs3_dat_o         ),
  .o_s3_adr   (w_wbs3_adr           ),
  .i_s3_int   (w_wbs3_int           ),

  .o_s4_we    (w_wbs4_we            ),
  .o_s4_cyc   (w_wbs4_cyc           ),
  .o_s4_stb   (w_wbs4_stb           ),
  .i_s4_ack   (w_wbs4_ack           ),
  .o_s4_dat   (w_wbs4_dat_i         ),
  .i_s4_dat   (w_wbs4_dat_o         ),
  .o_s4_adr   (w_wbs4_adr           ),
  .i_s4_int   (w_wbs4_int           )

);


arbiter_2_masters arb0 (
  .clk        (clk                  ),
  .rst        (r_rst                ),

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
  .i_m0_cyc   (w_sm0_i_wbs_cyc    || r_request_read_wait             ), //Artificially block
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
  .rst        (r_rst                ),

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



wb_sdio_device  s2(
  .clk                 (clk                 ),
  .rst                 (r_rst               ),
  .i_wbs_cyc           (w_wbs2_cyc          ),
  .i_wbs_dat           (w_wbs2_dat_i        ),
  .i_wbs_we            (w_wbs2_we           ),
  .i_wbs_stb           (w_wbs2_stb          ),
  .i_wbs_sel           (w_wbs2_sel          ),
  .i_wbs_adr           (w_wbs2_adr          ),
  .o_wbs_int           (w_wbs2_int          ),
  .o_wbs_dat           (w_wbs2_dat_o        ),
  .o_wbs_ack           (w_wbs2_ack          ),

  .i_phy_sd_clk        (sd_clk              ),
  .io_phy_sd_cmd       (phy_sd_cmd          ),
  .io_phy_sd_data      (phy_sd_data[3:0]    )
);



/*
sd_dev_platform_cocotb sdio_dev_plat(
  .clk            (clk              ),
  .rst            (r_rst            ),

  .o_locked       (dev_pll_locked   ),

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

//TODO ADAPT sdio_device to use the platform based phy_sd_cmd and phy_sd_data

sdio_device_stack sdio_device (
  .sdio_clk             (sd_clk               ),
  .rst                  (r_rst || !dev_pll_locked),

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
  .sdio_clk             (sd_clk              ),
  .rst                  (r_rst || !dev_pll_locked),

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

//Submodules
//Asynchronous Logic
assign  device_interrupt        = w_wbp_int;
assign  w_wbs0_int              = 0;
assign  w_wbs0_ack              = 0;
assign  w_wbs0_dat_o            = 0;
assign  function_ready          = {6'b000000, demo_func_ready,          1'b0};
assign  function_exec_status    = {6'b000000, demo_func_exec_sts,       1'b0};
assign  function_ready_for_data = {6'b000000, demo_func_ready_for_data, 1'b0};
assign  function_interrupt      = {6'b000000, demo_func_interrupt,      1'b0};
*/

assign  w_wbs3_int              = 0;
assign  w_wbs3_ack              = 0;
assign  w_wbs3_dat_o            = 0;

assign  w_wbs4_int              = 0;
assign  w_wbs4_ack              = 0;
assign  w_wbs4_dat_o            = 0;


//Synchronous Logic
//Simulation Control
initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end

endmodule
