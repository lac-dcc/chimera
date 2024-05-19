// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License


`include "dma_defines.v"

module dma (

  input               clk,
  input               rst,
  input               enable,

  input       [31:0]  i_src0_control,
  input       [31:0]  i_src1_control,
  input       [31:0]  i_src2_control,
  input       [31:0]  i_src3_control,

  output      [31:0]  o_src0_status,
  output      [31:0]  o_src1_status,
  output      [31:0]  o_src2_status,
  output      [31:0]  o_src3_status,

  input       [31:0]  i_snk0_control,
  input       [31:0]  i_snk1_control,
  input       [31:0]  i_snk2_control,
  input       [31:0]  i_snk3_control,

  output      [31:0]  o_snk0_status,
  output      [31:0]  o_snk1_status,
  output      [31:0]  o_snk2_status,
  output      [31:0]  o_snk3_status,

  //Source 0
  output              o_src0_enable,
  output      [63:0]  o_src0_address,
  output      [23:0]  o_src0_count,
  output              o_src0_addr_inc,
  output              o_src0_addr_dec,
  output              o_src0_flush,

  output              o_src0_strobe,
  input       [31:0]  i_src0_data,
  input               i_src0_ready,
  output              o_src0_activate,
  input       [23:0]  i_src0_size,

  //Source 1
  output              o_src1_enable,
  output      [63:0]  o_src1_address,
  output      [23:0]  o_src1_count,
  output              o_src1_addr_inc,
  output              o_src1_addr_dec,
  output              o_src1_flush,

  output              o_src1_strobe,
  input       [31:0]  i_src1_data,
  input               i_src1_ready,
  output              o_src1_activate,
  input       [23:0]  i_src1_size,

  //Source 2
  output              o_src2_enable,
  output      [63:0]  o_src2_address,
  output      [23:0]  o_src2_count,
  output              o_src2_addr_inc,
  output              o_src2_addr_dec,
  output              o_src2_flush,

  output              o_src2_strobe,
  input       [31:0]  i_src2_data,
  input               i_src2_ready,
  output              o_src2_activate,
  input       [23:0]  i_src2_size,

  //Source 3
  output              o_src3_enable,
  output      [63:0]  o_src3_address,
  output      [23:0]  o_src3_count,
  output              o_src3_addr_inc,
  output              o_src3_addr_dec,
  output              o_src3_flush,

  output              o_src3_strobe,
  input       [31:0]  i_src3_data,
  input               i_src3_ready,
  output              o_src3_activate,
  input       [23:0]  i_src3_size,

  //Sink 0
  output              o_snk0_write_enable,
  input               i_snk0_write_finished,
  output      [63:0]  o_snk0_write_addr,
  output              o_snk0_write_addr_inc,
  output              o_snk0_write_addr_dec,
  output              o_snk0_write_busy,
  output      [23:0]  o_snk0_write_count,
  output              o_snk0_flush,

  output              o_snk0_strobe,
  input       [1:0]   i_snk0_ready,
  output      [1:0]   o_snk0_activate,
  input       [23:0]  i_snk0_size,
  output      [31:0]  o_snk0_data,

  //Sink 1
  output              o_snk1_write_enable,
  input               i_snk1_write_finished,
  output      [63:0]  o_snk1_write_addr,
  output              o_snk1_write_addr_inc,
  output              o_snk1_write_addr_dec,
  output              o_snk1_write_busy,
  output      [23:0]  o_snk1_write_count,
  output              o_snk1_flush,

  output              o_snk1_strobe,
  input       [1:0]   i_snk1_ready,
  output      [1:0]   o_snk1_activate,
  input       [23:0]  i_snk1_size,
  output      [31:0]  o_snk1_data,

  //Sink 2
  output              o_snk2_write_enable,
  input               i_snk2_write_finished,
  output      [63:0]  o_snk2_write_addr,
  output              o_snk2_write_addr_inc,
  output              o_snk2_write_addr_dec,
  output              o_snk2_write_busy,
  output      [23:0]  o_snk2_write_count,
  output              o_snk2_flush,

  output              o_snk2_strobe,
  input       [1:0]   i_snk2_ready,
  output      [1:0]   o_snk2_activate,
  input       [23:0]  i_snk2_size,
  output      [31:0]  o_snk2_data,

  //Sink 3
  output              o_snk3_write_enable,
  input               i_snk3_write_finished,
  output      [63:0]  o_snk3_write_addr,
  output              o_snk3_write_addr_inc,
  output              o_snk3_write_addr_dec,
  output              o_snk3_write_busy,
  output      [23:0]  o_snk3_write_count,
  output              o_snk3_flush,

  output              o_snk3_strobe,
  input       [1:0]   i_snk3_ready,
  output      [1:0]   o_snk3_activate,
  input       [23:0]  i_snk3_size,
  output      [31:0]  o_snk3_data,

  input       [63:0]  cmd_src_address0,
  input       [63:0]  cmd_dest_address0,
  input       [31:0]  cmd_count0,
  input       [15:0]  cmd_flags0,
  input       [2:0]   cmd_next0,
  input       [3:0]   cmd_bond_ingress0,
  input       [3:0]   cmd_bond_egress0,

  input       [63:0]  cmd_src_address1,
  input       [63:0]  cmd_dest_address1,
  input       [31:0]  cmd_count1,
  input       [15:0]  cmd_flags1,
  input       [2:0]   cmd_next1,
  input       [3:0]   cmd_bond_ingress1,
  input       [3:0]   cmd_bond_egress1,

  input       [63:0]  cmd_src_address2,
  input       [63:0]  cmd_dest_address2,
  input       [31:0]  cmd_count2,
  input       [15:0]  cmd_flags2,
  input       [2:0]   cmd_next2,
  input       [3:0]   cmd_bond_ingress2,
  input       [3:0]   cmd_bond_egress2,

  input       [63:0]  cmd_src_address3,
  input       [63:0]  cmd_dest_address3,
  input       [31:0]  cmd_count3,
  input       [15:0]  cmd_flags3,
  input       [2:0]   cmd_next3,
  input       [3:0]   cmd_bond_ingress3,
  input       [3:0]   cmd_bond_egress3,

  input       [63:0]  cmd_src_address4,
  input       [63:0]  cmd_dest_address4,
  input       [31:0]  cmd_count4,
  input       [15:0]  cmd_flags4,
  input       [2:0]   cmd_next4,
  input       [3:0]   cmd_bond_ingress4,
  input       [3:0]   cmd_bond_egress4,

  input       [63:0]  cmd_src_address5,
  input       [63:0]  cmd_dest_address5,
  input       [31:0]  cmd_count5,
  input       [15:0]  cmd_flags5,
  input       [2:0]   cmd_next5,
  input       [3:0]   cmd_bond_ingress5,
  input       [3:0]   cmd_bond_egress5,

  input       [63:0]  cmd_src_address6,
  input       [63:0]  cmd_dest_address6,
  input       [31:0]  cmd_count6,
  input       [15:0]  cmd_flags6,
  input       [2:0]   cmd_next6,
  input       [3:0]   cmd_bond_ingress6,
  input       [3:0]   cmd_bond_egress6,

  input       [63:0]  cmd_src_address7,
  input       [63:0]  cmd_dest_address7,
  input       [31:0]  cmd_count7,
  input       [15:0]  cmd_flags7,
  input       [2:0]   cmd_next7,
  input       [3:0]   cmd_bond_ingress7,
  input       [3:0]   cmd_bond_egress7,

  output              interrupt
);

//Local Parameters
localparam          IDLE                  = 4'h0;
localparam          SETUP_CHANNEL         = 4'h1;
localparam          SETUP_COMMAND         = 4'h2;
localparam          EGRESS_WAIT           = 4'h3;
localparam          INGRESS_WAIT          = 4'h4;
localparam          ACTIVE                = 4'h5;
localparam          END_COMMAND           = 4'h6;
localparam          FLUSH                 = 4'h7;
localparam          FINISHED              = 4'h8;

//Registers/Wires
wire        [31:0]  src_control         [3:0];

reg                 inst_ingress_ready  [`INST_COUNT - 1:0];
wire                inst_ingress_ready0;
wire                inst_ingress_ready1;
wire                inst_ingress_ready2;
wire                inst_ingress_ready3;
wire                inst_ingress_ready4;
wire                inst_ingress_ready5;
wire                inst_ingress_ready6;
wire                inst_ingress_ready7;

reg                 inst_egress_ready   [`INST_COUNT - 1:0];
wire                inst_egress_ready0;
wire                inst_egress_ready1;
wire                inst_egress_ready2;
wire                inst_egress_ready3;
wire                inst_egress_ready4;
wire                inst_egress_ready5;
wire                inst_egress_ready6;
wire                inst_egress_ready7;

reg                 inst_busy           [`INST_COUNT - 1:0];
reg                 inst_wait           [`INST_COUNT - 1:0];

wire        [31:0]  snk_control         [3:0];
wire        [31:0]  snk_status          [3:0];

reg         [3:0]   state               [3:0];
wire        [3:0]   state0;
wire        [3:0]   state1;
wire        [3:0]   state2;
wire        [3:0]   state3;

reg                 src_enable          [3:0];
reg         [63:0]  src_address         [3:0];
wire                src_addr_dec        [3:0];
reg                 src_flush           [3:0];

reg         [23:0]  src_count           [3:0];
wire                src_start           [3:0];

reg                 src_dma_finished    [3:0];
reg                 src_err_conflict_sink[3:0];
wire                src_busy            [3:0];

reg                 src_strobe          [3:0];
wire        [31:0]  src_data            [3:0];
wire                src_ready           [3:0];
reg                 src_activate        [3:0];
wire        [23:0]  src_size            [3:0];

//Sink Control Values
wire                snk_finished        [3:0];
reg         [63:0]  snk_address         [3:0];
reg                 snk_write_busy      [3:0];

reg                 snk_enable          [3:0];
reg                 snk_busy            [3:0];
reg         [23:0]  snk_data_count      [3:0];
reg                 snk_flush           [3:0];

//Sink FIFO Command
reg                 snk_strobe          [3:0];
wire        [1:0]   snk_ready           [3:0];
reg         [1:0]   snk_activate        [3:0];
wire        [23:0]  snk_size            [3:0];
reg         [31:0]  snk_data            [3:0];
reg         [23:0]  snk_count           [3:0];

wire        [32:0]  snk_count0;
wire        [32:0]  snk_count1;
wire        [32:0]  snk_count2;
wire        [32:0]  snk_count3;

//Channel Specific Controls
wire                dma_enable          [3:0];
wire                src_dma_busy        [3:0];
wire        [3:0]   src_snk_addr        [3:0];
wire                snk_dma_busy        [3:0];

//Transfer Command ROM
wire        [63:0]  cmd_src_address     [7:0];
wire        [63:0]  cmd_dest_address    [7:0];
wire        [31:0]  cmd_count           [7:0];
wire        [15:0]  cmd_flags           [7:0];
wire        [2:0]   cmd_next            [7:0];
wire        [2:0]   bond_src_addr       [7:0];
wire        [2:0]   bond_dest_addr      [7:0];

//Instruction Pointer into the ROM
reg         [2:0]   ip [3:0];
wire        [2:0]   ip0;
wire        [2:0]   ip1;
wire        [2:0]   ip2;
wire        [2:0]   ip3;

//Dynamic Command Values
reg         [63:0]  curr_src_address    [3:0];
reg         [63:0]  curr_dest_address   [3:0];
reg         [31:0]  curr_count          [3:0];
wire        [31:0]  curr_count0;
wire        [31:0]  curr_count1;
wire        [31:0]  curr_count2;
wire        [31:0]  curr_count3;

reg         [31:0]  channel_count       [3:0];
wire        [31:0]  channel_count0;
wire        [31:0]  channel_count1;
wire        [31:0]  channel_count2;
wire        [31:0]  channel_count3;

reg         [1:0]   snka                [3:0];
wire        [1:0]   snka0;
wire        [1:0]   snka1;
wire        [1:0]   snka2;
wire        [1:0]   snka3;

reg                 snk_in_use          [3:0];
wire                snk_in_use0;
wire                snk_in_use1;
wire                snk_in_use2;
wire                snk_in_use3;

wire        [1:0]   channel_sink        [3:0];

reg         [31:0]  data_out;

wire                flag_src_addr_inc               [`SOURCE_COUNT - 1: 0];
wire                flag_src_addr_dec               [`SOURCE_COUNT - 1: 0];

wire                flag_dest_data_quantum          [`SINK_COUNT - 1: 0];
wire                flag_dest_addr_inc              [`SINK_COUNT - 1: 0];
wire                flag_dest_addr_dec              [`SINK_COUNT - 1: 0];

wire                flag_dest_addr_rst_on_cmd       [`INST_COUNT - 1: 0];
wire                flag_src_addr_rst_on_cmd        [`INST_COUNT - 1: 0];
wire                flag_egress_bond                [`INST_COUNT - 1: 0];
wire                flag_ingress_bond               [`INST_COUNT - 1: 0];
wire                flag_instruction_continue       [`INST_COUNT - 1: 0];
wire        [3:0]   ingress_bond_ip                 [`INST_COUNT - 1: 0];
wire        [3:0]   egress_bond_ip                  [`INST_COUNT - 1: 0];

wire                flag_channel_enable0;
wire                flag_channel_enable1;
wire                flag_channel_enable2;
wire                flag_channel_enable3;

wire                flag_dest_data_quantum0;
wire                flag_dest_data_quantum1;
wire                flag_dest_data_quantum2;
wire                flag_dest_data_quantum3;


wire                flag_instruction_continue0;
wire                flag_instruction_continue1;
wire                flag_instruction_continue2;
wire                flag_instruction_continue3;
wire                flag_instruction_continue4;
wire                flag_instruction_continue5;
wire                flag_instruction_continue6;
wire                flag_instruction_continue7;
wire                flag_instruction_continue8;

//Submodules
//Asynchronous Logic

//Matrixize the inputs and outptus
assign src_control[0]                      = i_src0_control;
assign src_control[1]                      = i_src1_control;
assign src_control[2]                      = i_src2_control;
assign src_control[3]                      = i_src3_control;

assign snk_control[0]                      = i_snk0_control;
assign snk_control[1]                      = i_snk1_control;
assign snk_control[2]                      = i_snk2_control;
assign snk_control[3]                      = i_snk3_control;

assign o_snk0_status                       = snk_status[0];
assign o_snk1_status                       = snk_status[1];
assign o_snk2_status                       = snk_status[2];
assign o_snk3_status                       = snk_status[3];

assign o_src0_finished                     = src_dma_finished[0];
assign o_src1_finished                     = src_dma_finished[1];
assign o_src2_finished                     = src_dma_finished[2];
assign o_src3_finished                     = src_dma_finished[3];

assign o_src0_strobe                       = src_strobe[0];
assign o_src1_strobe                       = src_strobe[1];
assign o_src2_strobe                       = src_strobe[2];
assign o_src3_strobe                       = src_strobe[3];

assign o_src0_address                      = src_address[0];
assign o_src1_address                      = src_address[1];
assign o_src2_address                      = src_address[2];
assign o_src3_address                      = src_address[3];

assign o_src0_enable                       = src_enable[0];
assign o_src1_enable                       = src_enable[1];
assign o_src2_enable                       = src_enable[2];
assign o_src3_enable                       = src_enable[3];

assign o_src0_addr_inc                     = flag_src_addr_inc[0];
assign o_src1_addr_inc                     = flag_src_addr_inc[1];
assign o_src2_addr_inc                     = flag_src_addr_inc[2];
assign o_src3_addr_inc                     = flag_src_addr_inc[3];

assign o_src0_addr_dec                     = flag_src_addr_dec[0];
assign o_src1_addr_dec                     = flag_src_addr_dec[1];
assign o_src2_addr_dec                     = flag_src_addr_dec[2];
assign o_src3_addr_dec                     = flag_src_addr_dec[3];

assign o_src0_flush                        = src_flush[0];
assign o_src1_flush                        = src_flush[1];
assign o_src2_flush                        = src_flush[2];
assign o_src3_flush                        = src_flush[3];

assign o_src0_count                        = cmd_count[ip[0]][23:0];
assign o_src1_count                        = cmd_count[ip[1]][23:0];
assign o_src2_count                        = cmd_count[ip[2]][23:0];
assign o_src3_count                        = cmd_count[ip[3]][23:0];

assign src_data[0]                         = i_src0_data;
assign src_data[1]                         = i_src1_data;
assign src_data[2]                         = i_src2_data;
assign src_data[3]                         = i_src3_data;

assign src_ready[0]                        = i_src0_ready;
assign src_ready[1]                        = i_src1_ready;
assign src_ready[2]                        = i_src2_ready;
assign src_ready[3]                        = i_src3_ready;

assign o_src0_activate                     = src_activate[0];
assign o_src1_activate                     = src_activate[1];
assign o_src2_activate                     = src_activate[2];
assign o_src3_activate                     = src_activate[3];

assign src_size[0]                         =  i_src0_size;
assign src_size[1]                         =  i_src1_size;
assign src_size[2]                         =  i_src2_size;
assign src_size[3]                         =  i_src3_size;

assign o_snk0_strobe                       = snk_strobe[0];
assign o_snk1_strobe                       = snk_strobe[1];
assign o_snk2_strobe                       = snk_strobe[2];
assign o_snk3_strobe                       = snk_strobe[3];

assign snk_ready[0]                        = i_snk0_ready;
assign snk_ready[1]                        = i_snk1_ready;
assign snk_ready[2]                        = i_snk2_ready;
assign snk_ready[3]                        = i_snk3_ready;

assign o_snk0_activate                     = snk_activate[0];
assign o_snk1_activate                     = snk_activate[1];
assign o_snk2_activate                     = snk_activate[2];
assign o_snk3_activate                     = snk_activate[3];

assign snk_size[0]                         = i_snk0_size;
assign snk_size[1]                         = i_snk1_size;
assign snk_size[2]                         = i_snk2_size;
assign snk_size[3]                         = i_snk3_size;

assign o_snk0_data                         = snk_data[0];
assign o_snk1_data                         = snk_data[1];
assign o_snk2_data                         = snk_data[2];
assign o_snk3_data                         = snk_data[3];

//assign dma_enable[0]                       = i_src0_control[`BIT_CFG_DMA_ENABLE];
//assign dma_enable[1]                       = i_src1_control[`BIT_CFG_DMA_ENABLE];
//assign dma_enable[2]                       = i_src2_control[`BIT_CFG_DMA_ENABLE];
//assign dma_enable[3]                       = i_src3_control[`BIT_CFG_DMA_ENABLE];

//SINK IS Different than SOURCE the indirection is more complicated
assign o_snk0_write_enable                  = snk_enable[0];
assign o_snk1_write_enable                  = snk_enable[1];
assign o_snk2_write_enable                  = snk_enable[2];
assign o_snk3_write_enable                  = snk_enable[3];

assign snk_finished[0]                      = i_snk0_write_finished;
assign snk_finished[1]                      = i_snk1_write_finished;
assign snk_finished[2]                      = i_snk2_write_finished;
assign snk_finished[3]                      = i_snk3_write_finished;

assign o_snk0_write_addr                    = snk_address[0];
assign o_snk1_write_addr                    = snk_address[1];
assign o_snk2_write_addr                    = snk_address[2];
assign o_snk3_write_addr                    = snk_address[3];

assign o_snk0_write_addr_inc                = flag_dest_addr_inc[0];
assign o_snk1_write_addr_inc                = flag_dest_addr_inc[1];
assign o_snk2_write_addr_inc                = flag_dest_addr_inc[2];
assign o_snk3_write_addr_inc                = flag_dest_addr_inc[3];

assign o_snk0_write_addr_dec                = flag_dest_addr_dec[0];
assign o_snk1_write_addr_dec                = flag_dest_addr_dec[1];
assign o_snk2_write_addr_dec                = flag_dest_addr_dec[2];
assign o_snk3_write_addr_dec                = flag_dest_addr_dec[3];

assign o_snk0_write_busy                    = snk_busy[0];
assign o_snk1_write_busy                    = snk_busy[1];
assign o_snk2_write_busy                    = snk_busy[2];
assign o_snk3_write_busy                    = snk_busy[3];

assign o_snk0_write_count                   = snk_data_count[0];
assign o_snk1_write_count                   = snk_data_count[1];
assign o_snk2_write_count                   = snk_data_count[2];
assign o_snk3_write_count                   = snk_data_count[3];

assign o_snk0_flush                         = snk_flush[0];
assign o_snk1_flush                         = snk_flush[1];
assign o_snk2_flush                         = snk_flush[2];
assign o_snk3_flush                         = snk_flush[3];

//Status Output
assign o_src0_status[`BIT_CFG_DMA_ENABLE]                     = dma_enable[0];
assign o_src1_status[`BIT_CFG_DMA_ENABLE]                     = dma_enable[1];
assign o_src2_status[`BIT_CFG_DMA_ENABLE]                     = dma_enable[2];
assign o_src3_status[`BIT_CFG_DMA_ENABLE]                     = dma_enable[3];

assign o_src0_status[`BIT_STS_BUSY]                           = src_dma_busy[0];
assign o_src1_status[`BIT_STS_BUSY]                           = src_dma_busy[1];
assign o_src2_status[`BIT_STS_BUSY]                           = src_dma_busy[2];
assign o_src3_status[`BIT_STS_BUSY]                           = src_dma_busy[3];

assign o_src0_status[`BIT_STS_FIN]                            = src_dma_finished[0];
assign o_src1_status[`BIT_STS_FIN]                            = src_dma_finished[1];
assign o_src2_status[`BIT_STS_FIN]                            = src_dma_finished[2];
assign o_src3_status[`BIT_STS_FIN]                            = src_dma_finished[3];

assign o_src0_status[`BIT_STS_ERR_CONFLICT_SINK]              = src_err_conflict_sink[0];
assign o_src1_status[`BIT_STS_ERR_CONFLICT_SINK]              = src_err_conflict_sink[1];
assign o_src2_status[`BIT_STS_ERR_CONFLICT_SINK]              = src_err_conflict_sink[2];
assign o_src3_status[`BIT_STS_ERR_CONFLICT_SINK]              = src_err_conflict_sink[3];

assign o_src0_status[`BIT_STS_SNK_ACTIVATE_LOW]               = snk_activate[snka[0]][0];
assign o_src1_status[`BIT_STS_SNK_ACTIVATE_LOW]               = snk_activate[snka[1]][0];
assign o_src2_status[`BIT_STS_SNK_ACTIVATE_LOW]               = snk_activate[snka[2]][0];
assign o_src3_status[`BIT_STS_SNK_ACTIVATE_LOW]               = snk_activate[snka[3]][0];

assign o_src0_status[`BIT_STS_SNK_ACTIVATE_HIGH]              = snk_activate[snka[0]][1];
assign o_src1_status[`BIT_STS_SNK_ACTIVATE_HIGH]              = snk_activate[snka[1]][1];
assign o_src2_status[`BIT_STS_SNK_ACTIVATE_HIGH]              = snk_activate[snka[2]][1];
assign o_src3_status[`BIT_STS_SNK_ACTIVATE_HIGH]              = snk_activate[snka[3]][1];

assign o_src0_status[`BIT_STS_SNK_READY_LOW]                  = snk_ready[snka[0]][0];
assign o_src1_status[`BIT_STS_SNK_READY_LOW]                  = snk_ready[snka[1]][0];
assign o_src2_status[`BIT_STS_SNK_READY_LOW]                  = snk_ready[snka[2]][0];
assign o_src3_status[`BIT_STS_SNK_READY_LOW]                  = snk_ready[snka[3]][0];

assign o_src0_status[`BIT_STS_SNK_READY_HIGH]                 = snk_ready[snka[0]][1];
assign o_src1_status[`BIT_STS_SNK_READY_HIGH]                 = snk_ready[snka[1]][1];
assign o_src2_status[`BIT_STS_SNK_READY_HIGH]                 = snk_ready[snka[2]][1];
assign o_src3_status[`BIT_STS_SNK_READY_HIGH]                 = snk_ready[snka[3]][1];

assign o_src0_status[`BIT_STS_SRC_ACTIVATE]                   = src_activate[0];
assign o_src1_status[`BIT_STS_SRC_ACTIVATE]                   = src_activate[1];
assign o_src2_status[`BIT_STS_SRC_ACTIVATE]                   = src_activate[2];
assign o_src3_status[`BIT_STS_SRC_ACTIVATE]                   = src_activate[3];

assign o_src0_status[`BIT_STS_SRC_READY]                      = src_ready[0];
assign o_src1_status[`BIT_STS_SRC_READY]                      = src_ready[1];
assign o_src2_status[`BIT_STS_SRC_READY]                      = src_ready[2];
assign o_src3_status[`BIT_STS_SRC_READY]                      = src_ready[3];

assign o_src0_status[`BIT_STS_SRC_STATE3:`BIT_STS_SRC_STATE0] = state[0];
assign o_src1_status[`BIT_STS_SRC_STATE3:`BIT_STS_SRC_STATE0] = state[1];
assign o_src2_status[`BIT_STS_SRC_STATE3:`BIT_STS_SRC_STATE0] = state[2];
assign o_src3_status[`BIT_STS_SRC_STATE3:`BIT_STS_SRC_STATE0] = state[3];


//Put the rest to zero
assign o_src0_status[31:`BIT_STS_SRC_STATE3 + 1] = 0;
assign o_src1_status[31:`BIT_STS_SRC_STATE3 + 1] = 0;
assign o_src2_status[31:`BIT_STS_SRC_STATE3 + 1] = 0;
assign o_src3_status[31:`BIT_STS_SRC_STATE3 + 1] = 0;

//Put all the commands into the program memory block
assign cmd_src_address[0]     = cmd_src_address0;
assign cmd_dest_address[0]    = cmd_dest_address0;
assign cmd_count[0]           = cmd_count0;
assign cmd_flags[0]           = cmd_flags0;
assign cmd_next[0]            = cmd_next0;

assign cmd_src_address[1]     = cmd_src_address1;
assign cmd_dest_address[1]    = cmd_dest_address1;
assign cmd_count[1]           = cmd_count1;
assign cmd_flags[1]           = cmd_flags1;
assign cmd_next[1]            = cmd_next1;

assign cmd_src_address[2]     = cmd_src_address2;
assign cmd_dest_address[2]    = cmd_dest_address2;
assign cmd_count[2]           = cmd_count2;
assign cmd_flags[2]           = cmd_flags2;
assign cmd_next[2]            = cmd_next2;

assign cmd_src_address[3]     = cmd_src_address3;
assign cmd_dest_address[3]    = cmd_dest_address3;
assign cmd_count[3]           = cmd_count3;
assign cmd_flags[3]           = cmd_flags3;
assign cmd_next[3]            = cmd_next3;

assign cmd_src_address[4]     = cmd_src_address4;
assign cmd_dest_address[4]    = cmd_dest_address4;
assign cmd_count[4]           = cmd_count4;
assign cmd_flags[4]           = cmd_flags4;
assign cmd_next[4]            = cmd_next4;

assign cmd_src_address[5]     = cmd_src_address5;
assign cmd_dest_address[5]    = cmd_dest_address5;
assign cmd_count[5]           = cmd_count5;
assign cmd_flags[5]           = cmd_flags5;
assign cmd_next[5]            = cmd_next5;

assign cmd_src_address[6]     = cmd_src_address6;
assign cmd_dest_address[6]    = cmd_dest_address6;
assign cmd_count[6]           = cmd_count6;
assign cmd_flags[6]           = cmd_flags6;
assign cmd_next[6]            = cmd_next6;

assign cmd_src_address[7]     = cmd_src_address7;
assign cmd_dest_address[7]    = cmd_dest_address7;
assign cmd_count[7]           = cmd_count7;
assign cmd_flags[7]           = cmd_flags7;
assign cmd_next[7]            = cmd_next7;

assign ingress_bond_ip[0]     = cmd_bond_ingress0;
assign ingress_bond_ip[1]     = cmd_bond_ingress1;
assign ingress_bond_ip[2]     = cmd_bond_ingress2;
assign ingress_bond_ip[3]     = cmd_bond_ingress3;
assign ingress_bond_ip[4]     = cmd_bond_ingress4;
assign ingress_bond_ip[5]     = cmd_bond_ingress5;
assign ingress_bond_ip[6]     = cmd_bond_ingress6;
assign ingress_bond_ip[7]     = cmd_bond_ingress7;

assign egress_bond_ip[0]      = cmd_bond_egress0;
assign egress_bond_ip[1]      = cmd_bond_egress1;
assign egress_bond_ip[2]      = cmd_bond_egress2;
assign egress_bond_ip[3]      = cmd_bond_egress3;
assign egress_bond_ip[4]      = cmd_bond_egress4;
assign egress_bond_ip[5]      = cmd_bond_egress5;
assign egress_bond_ip[6]      = cmd_bond_egress6;
assign egress_bond_ip[7]      = cmd_bond_egress7;

//Stuff for debug (GTKWave Connot view arrays)
assign state0                 = state[0];
assign state1                 = state[1];
assign state2                 = state[2];
assign state3                 = state[3];

assign snk_count0             = snk_count[0];
assign snk_count1             = snk_count[1];
assign snk_count2             = snk_count[2];
assign snk_count3             = snk_count[3];

assign ip0                    = ip[0];
assign ip1                    = ip[1];
assign ip2                    = ip[2];
assign ip3                    = ip[3];

assign snka0                  = snka[0];
assign snka1                  = snka[1];
assign snka2                  = snka[2];
assign snka3                  = snka[3];

assign channel_count0         = channel_count[0];
assign channel_count1         = channel_count[1];
assign channel_count2         = channel_count[2];
assign channel_count3         = channel_count[3];

assign flag_channel_enable0   = dma_enable[0];
assign flag_channel_enable1   = dma_enable[1];
assign flag_channel_enable2   = dma_enable[2];
assign flag_channel_enable3   = dma_enable[3];

assign curr_count0            = curr_count[0];
assign curr_count1            = curr_count[1];
assign curr_count2            = curr_count[2];
assign curr_count3            = curr_count[3];

assign snk_in_use0            = snk_in_use[0];
assign snk_in_use1            = snk_in_use[1];
assign snk_in_use2            = snk_in_use[2];
assign snk_in_use3            = snk_in_use[3];

assign flag_dest_data_quantum0= flag_dest_data_quantum[0];
assign flag_dest_data_quantum1= flag_dest_data_quantum[1];
assign flag_dest_data_quantum2= flag_dest_data_quantum[2];
assign flag_dest_data_quantum3= flag_dest_data_quantum[3];

assign inst_ingress_ready0    = inst_ingress_ready[0];
assign inst_ingress_ready1    = inst_ingress_ready[1];
assign inst_ingress_ready2    = inst_ingress_ready[2];
assign inst_ingress_ready3    = inst_ingress_ready[3];
assign inst_ingress_ready4    = inst_ingress_ready[4];
assign inst_ingress_ready5    = inst_ingress_ready[5];
assign inst_ingress_ready6    = inst_ingress_ready[6];
assign inst_ingress_ready7    = inst_ingress_ready[7];

assign inst_egress_ready0     = inst_egress_ready[0];
assign inst_egress_ready1     = inst_egress_ready[1];
assign inst_egress_ready2     = inst_egress_ready[2];
assign inst_egress_ready3     = inst_egress_ready[3];
assign inst_egress_ready4     = inst_egress_ready[4];
assign inst_egress_ready5     = inst_egress_ready[5];
assign inst_egress_ready6     = inst_egress_ready[6];
assign inst_egress_ready7     = inst_egress_ready[7];

assign flag_instruction_continue0 = flag_instruction_continue[0];
assign flag_instruction_continue1 = flag_instruction_continue[1];
assign flag_instruction_continue2 = flag_instruction_continue[2];
assign flag_instruction_continue3 = flag_instruction_continue[3];
assign flag_instruction_continue4 = flag_instruction_continue[4];
assign flag_instruction_continue5 = flag_instruction_continue[5];
assign flag_instruction_continue6 = flag_instruction_continue[6];
assign flag_instruction_continue7 = flag_instruction_continue[7];



genvar g;
generate
for (g = 0; g < `SOURCE_COUNT; g = g + 1) begin: src_cntl_for
  assign  src_dma_busy[g]               = (state[g] != IDLE);
  assign  flag_src_addr_inc[g]          = src_control[g][`BIT_CFG_SRC_ADDR_INC];
  assign  flag_src_addr_dec[g]          = src_control[g][`BIT_CFG_SRC_ADDR_DEC];
  assign  dma_enable[g]                 = src_control[g][`BIT_CFG_DMA_ENABLE];
end
endgenerate

genvar h;
generate
for (h = 0; h < `INST_COUNT; h = h + 1) begin: cmd_flg_for
  assign  flag_egress_bond[h]          = cmd_flags[h][`BIT_CMD_EGRESS_BOND];
  assign  flag_ingress_bond[h]         = cmd_flags[h][`BIT_CMD_INGRESS_BOND];
  assign  flag_dest_addr_rst_on_cmd[h] = cmd_flags[h][`BIT_CMD_DEST_ADDR_RST_ON_CMD];
  assign  flag_src_addr_rst_on_cmd[h]  = cmd_flags[h][`BIT_CMD_SRC_ADDR_RST_ON_CMD];
  assign  flag_instruction_continue[h] = cmd_flags[h][`BIT_CMD_CONTINUE];
end
endgenerate

genvar j;
generate
for (j = 0; j < `SINK_COUNT; j = j + 1) begin: snk_cntl_for
  assign  flag_dest_data_quantum[j]     = snk_control[j][`BIT_CFG_DEST_DATA_QUANTUM];
  assign  flag_dest_addr_inc[j]         = snk_control[j][`BIT_CFG_DEST_ADDR_INC];
  assign  flag_dest_addr_dec[j]         = snk_control[j][`BIT_CFG_DEST_ADDR_DEC];
end
endgenerate

//Synchronous Logic
integer i;

//Source Controllers
always @ (posedge clk) begin
  if (rst) begin
    for (i = 0; i < `INST_COUNT; i = i + 1) begin
      inst_ingress_ready[i]                  <=  0;
      inst_egress_ready[i]                   <=  0;
      inst_wait[i]                           <=  0;
      inst_busy[i]                           <=  0;
    end
    for (i = 0; i < `SOURCE_COUNT; i = i + 1) begin
      state[i]                               <=  IDLE;
      src_enable[i]                          <=  0;
      src_address[i]                         <=  0;
      src_dma_finished[i]                    <=  0;
      src_err_conflict_sink[i]               <=  0;
      src_count[i]                           <=  0;
      src_strobe[i]                          <=  0;
      src_activate[i]                        <=  0;
      ip[i]                                  <=  0;
      snka[i]                                <=  0;
      curr_count[i]                          <=  0;
      channel_count[i]                       <=  0;
      src_flush[i]                           <=  0;

    end
    for (i = 0; i < `SINK_COUNT; i = i + 1) begin
      snk_address[i]                         <=  0;
      snk_strobe[i]                          <=  0;
      snk_busy[i]                            <=  0;
      snk_count[i]                           <=  0;
      snk_activate[i]                        <=  0;
      snk_in_use[i]                          <=  0;
      snk_enable[i]                          <=  0;
      snk_flush[i]                           <=  0;
      snk_data[i]                            <=  0;
    end
  end
  else begin
    for (i = 0; i < `SOURCE_COUNT; i = i + 1) begin
      src_enable[i]                          <=  0;
      src_strobe[i]                          <=  0;
      src_flush[i]                           <=  0;
      src_dma_finished[i]                    <=  0;

      if (dma_enable[i] && snk_in_use[snka[i]]) begin
        snk_strobe[snka[i]]                  <=  0;
        snk_flush[snka[i]]                   <=  0;
      end
      //snk_in_use[snka[i]]                    <=  dma_enable[i];

      case (state[i])
        IDLE: begin
          if (dma_enable[i]) begin
            state[i]                         <= SETUP_CHANNEL;
            ip[i]                            <= src_control[i][`BIT_CFG_IP_ADDR_TOP:`BIT_CFG_IP_ADDR_BOT];
            snka[i]                          <= src_control[i][`BIT_CFG_SRC_SINK_ADDR_TOP:`BIT_CFG_SRC_SINK_ADDR_BOT];
          end
          //Rlush Anything within the source FIFOs
          if (src_ready[i] && !src_activate[i]) begin
            src_count[i]                     <= 0;
            src_activate[i]                  <= 1;
          end
          else begin
            if (src_count[i] < src_size[i]) begin
                src_strobe[i]                <= 1;
            end
            else begin
                src_activate[i]              <= 0;
            end
          end
          //Flush Anything within the sink FIFO
          if (!snk_in_use[i]) begin
            snk_strobe[i]                     <= 0;
            snk_enable[i]                     <= 0;
            snk_data_count[i]                 <= 0;
            if (snk_activate[i] && (snk_count[i] < snk_size[i])) begin
              snk_strobe[i]                   <= 1;
              snk_count[i]                    <= snk_count[i] + 1;
              //snk_enable[i]                   <= 0;
              //snk_address[i]                  <= 0;
              snk_busy[i]                     <= 1;
            end
            else begin
              snk_activate[i]                 <= 0;
              snk_busy[i]                     <= 0;
            end
          end
        end
        SETUP_CHANNEL: begin
          //Setup only one time
          curr_src_address[i]                 <= cmd_src_address[ip[i]];   //  Mutable, Copy to channel specific value
          src_address[i]                      <= cmd_src_address[ip[i]];
          curr_dest_address[i]                <= cmd_dest_address[ip[i]];  //  Mutable, Copy to channel specific value
          snk_address[snka[i]]                <= cmd_dest_address[ip[i]];
          snk_in_use[snka[i]]                 <= 1;
          channel_count[i]                    <= 0;

          //Initial Flag Configuration
          inst_ingress_ready[ip[i]]           <= 1;
          inst_egress_ready[ip[i]]            <= 0;

          state[i]                            <= SETUP_COMMAND;
          //$display("cmd_src_address: %h", cmd_src_address[ip[i]]);
          //$display("cmd_dest_address: %h", cmd_dest_address[ip[i]]);
        end
        SETUP_COMMAND: begin
          //The command from the memory should be set from the 'instruction pointer' now we can make a decision
          if (flag_dest_addr_rst_on_cmd[ip[i]]) begin
            //Reset the address when processing a new command
            curr_dest_address[i]              <= cmd_dest_address[ip[i]];
            snk_address[snka[i]]              <= cmd_dest_address[ip[i]];
          end
          if (flag_src_addr_rst_on_cmd[ip[i]]) begin
            curr_src_address[i]               <= cmd_src_address[ip[i]];
            src_address[i]                    <= cmd_src_address[ip[i]];
          end
          curr_count[i]                       <= cmd_count[ip[i]];
          snk_data_count[snka[i]]             <= cmd_count[ip[i]];

          inst_busy[ip[i]]                    <= 0;
          //Bonded to another Instruction/Channel
          if (flag_egress_bond[ip[i]]) begin
            inst_wait[ip[i]]                  <= 1;
            state[i]                          <= EGRESS_WAIT;
          end
          else if (flag_ingress_bond[ip[i]]) begin
            inst_wait[ip[i]]                  <= 1;
            state[i]                          <= INGRESS_WAIT;
          end
          else begin
            inst_wait[ip[i]]                  <= 0;
            state[i]                          <= ACTIVE;
          end
        end

        EGRESS_WAIT: begin
          inst_wait[ip[i]]                    <= 1;
          //Egress waits for the remote channel to be full
          if (inst_egress_ready[egress_bond_ip[ip[i]]]) begin
            //Reset the other full so we don't make a decision from of it later on
            inst_egress_ready[egress_bond_ip[ip[i]]] <= 0;
            state[i]                          <= ACTIVE;
          end
        end
        INGRESS_WAIT: begin
          inst_wait[ip[i]]                    <= 1;
          //Ingress waits for the remote channel to be empty
          if (inst_ingress_ready[ingress_bond_ip[ip[i]]]) begin
            //Reset the other empty so we don't make a decision from of it later on
            inst_ingress_ready[ingress_bond_ip[ip[i]]]  <= 0;
            state[i]                          <= ACTIVE;
          end
        end
        ACTIVE: begin
          //src_address[i]                      <= curr_src_address[ip[i]];
          src_enable[i]                       <= 1;
          snk_enable[snka[i]]                 <= 1;
          inst_wait[ip[i]]                    <= 0;
          inst_busy[ip[i]]                    <= 0;
          inst_egress_ready[ip[i]]            <= 0;
          inst_ingress_ready[ip[i]]           <= 0;
          if (dma_enable[i]) begin
            //Activate the source FIFO
            if (!src_activate[i] && src_ready[i]) begin
              src_count[i]                    <= 0;
              src_activate[i]                 <= 1;
              //$display("Source Activate!");
            end
            //Activate the sink FIFO
            if ((snk_activate[snka[i]] == 0) && (snk_ready[snka[i]] > 0)) begin
              //$display("Sink Activate!");
              snk_count[snka[i]]              <= 0;
              if (snk_ready[snka[i]][0]) begin
                snk_activate[snka[i]][0]      <= 1;
              end
              else begin
                snk_activate[snka[i]][1]      <= 1;
              end
            end
            if (src_strobe[i]) begin
              snk_strobe[snka[i]]             <= 1;
              channel_count[i]                <= channel_count[i] + 1;
              snk_data[snka[i]]               <= src_data[i];

              if (flag_dest_addr_inc[snka[i]]) begin
                curr_dest_address[i]          <= curr_dest_address[i] + 1;
              end
              else if (flag_dest_addr_dec[snka[i]]) begin
                curr_dest_address[i]          <= curr_dest_address[i] - 1;
              end
            end

            //Both the Source and Sink FIFOs are ready
            if ((src_activate[i] && (snk_activate[snka[i]] > 0)) &&
                (snk_count[snka[i]] < snk_size[snka[i]]) &&
                (src_count[i] < src_size[i]))begin

              src_strobe[i]                   <= 1;
              src_count[i]                    <= src_count[i] + 1;
              snk_count[snka[i]]              <= snk_count[snka[i]] + 1;

              //Increment or decrement the addresses
              if (flag_src_addr_inc[i]) begin
                curr_src_address[i]           <= curr_src_address[i] + 1;
              end
              else if (flag_src_addr_dec[i]) begin
                curr_src_address[i]           <= curr_src_address[i] - 1;
              end
            end
            else begin
              if (src_activate[i] && (src_count[i] >= src_size[i])) begin
                src_activate[i]               <= 0;
                src_address[i]                <= curr_src_address[i];
              end
              if (snk_activate[snka[i]] && (snk_count[snka[i]] >= snk_size[snka[i]]) && !snk_strobe[snka[i]]) begin
                snk_activate[snka[i]]         <= 0;
                snk_address[snka[i]]          <= curr_dest_address[i];
              end
            end
            //Reached the end of an instruction

//XXX: Fix End Command
            if (channel_count[i] >= curr_count[i] && !snk_strobe[snka[i]]) begin
            //if (snk_finished[snka[i]]) begin
              state[i]                        <= END_COMMAND;
            end
          end
          else begin
            state[i]                          <= FLUSH;
          end
        end
        END_COMMAND: begin
          snk_enable[snka[i]]                 <= 0;
          if (dma_enable[i]) begin
            if (!flag_dest_data_quantum[snka[i]] && (snk_count[snka[i]] > 0)) begin
              snk_activate[snka[i]]             <= 0;
              snk_address[snka[i]]              <= curr_dest_address[i];
            end
            if (!flag_dest_data_quantum[snka[i]] && snk_finished[snka[i]]) begin
              inst_busy[ip[i]]                  <= 0;
              inst_ingress_ready[ip[i]]         <= 1;
              inst_egress_ready[ip[i]]          <= 1;

              if (flag_instruction_continue[ip[i]]) begin
                ip[i]                                 <= cmd_next[ip[i]];
                inst_ingress_ready[cmd_next[ip[i]]]   <= 1;
                inst_egress_ready[cmd_next[ip[i]]]    <= 0;
                channel_count[i]                      <= 0;
                state[i]                              <= SETUP_COMMAND;
              end
              else begin
                state[i]                          <= FLUSH;
              end
            end
            else if (flag_dest_data_quantum[snka[i]])begin
              inst_busy[ip[i]]                  <= 0;
              inst_ingress_ready[ip[i]]         <= 1;
              inst_egress_ready[ip[i]]          <= 1;

              if (flag_instruction_continue[ip[i]]) begin
                ip[i]                                 <= cmd_next[ip[i]];
                inst_ingress_ready[cmd_next[ip[i]]]   <= 1;
                inst_egress_ready[cmd_next[ip[i]]]    <= 0;
                channel_count[i]                      <= 0;
                state[i]                              <= SETUP_COMMAND;
              end
              else begin
                state[i]                          <= FLUSH;
              end
            end
          end
          else begin
            state[i]                              <= FLUSH;
          end
        end
        FLUSH: begin
          src_flush[i]                        <= 1;
          snk_flush[snka[i]]                  <= 1;
          if (src_activate[i])begin
            if (src_count[i] < src_size[i]) begin
              src_strobe[i]                   <= 1;
              src_count[i]                    <= src_count[i] + 1;
            end
            else begin
              src_activate[i]                 <=  0;
            end
          end
          if (!flag_dest_data_quantum[snka[i]]) begin
            snk_activate[snka[i]]             <= 0;
          end
          else if (snk_activate[snka[i]]) begin
            if (snk_count[snka[i]] < snk_size[snka[i]]) begin
              snk_strobe[snka[i]]             <= 1;
              snk_data[snka[i]]               <= 0;
              snk_count[snka[i]]              <= snk_count[snka[i]] + 1;
            end
            else begin
              snk_activate[snka[i]]           <= 0;
            end
          end
          if (!snk_activate[snka[i]] && !src_activate[i]) begin
            snk_enable[snka[i]]               <=  0;
            state[i]                          <=  FINISHED;
          end
        end
        FINISHED: begin
          //This is a type of finish that we need to wait for the user to de-assert enable
          inst_wait[ip[i]]                    <=  0;
          inst_busy[ip[i]]                    <=  0;
          inst_ingress_ready[ip[i]]           <=  0;
          inst_egress_ready[ip[i]]            <=  0;
          src_dma_finished[i]                 <=  1;
          if (!dma_enable[i]) begin
            snk_address[snka[i]]              <=  0;
            snk_in_use[snka[i]]               <=  0;
            state[i]                          <=  IDLE;
          end
        end
      endcase
    end
  end
end

endmodule
