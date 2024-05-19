// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_sata.v
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
  Set the Vendor ID (Hexidecimal 64-bit Number)
  SDB_VENDOR_ID:0x800000000000C594

  Set the Device ID (Hexcidecimal 32-bit Number)
  SDB_DEVICE_ID:0x00000010

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: 19 UNICODE characters
  SDB_NAME:sata

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x14

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0x01

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.cospandesign.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/05/27

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE: 0x1000
*/

`timescale 1 ns/1 ps
`include "wb_sata_defines.v"

module wb_sata (
  input               clk,
  input               rst,

  input               sata_75mhz_clk,
  input               i_platform_ready,

  //Add signals to control your device here
  //Wishbone Bus Signals
  input               i_wbs_we,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_dat,
  input               i_wbs_stb,
  output  reg         o_wbs_ack,
  output  reg [31:0]  o_wbs_dat,
  input       [31:0]  i_wbs_adr,

  //This interrupt can be controlled from this module or a submodule
  output  reg         o_wbs_int,

  output      [31:0]  o_tx_dout,
  output              o_tx_is_k,
  output              o_tx_comm_reset,
  output              o_tx_comm_wake,
  output              o_tx_elec_idle,
  input               i_tx_oob_complete,

  input       [31:0]  i_rx_din,
  input       [3:0]   i_rx_is_k,
  input               i_rx_elec_idle,
  input               i_comm_init_detect,
  input               i_comm_wake_detect,
  input               i_rx_byte_is_aligned,

  input               i_phy_error,

  //DMA Interface

  //Write Side
  input               i_write_enable,
  input       [63:0]  i_write_addr,
  input               i_write_addr_inc,
  input               i_write_addr_dec,
  output              o_write_finished,
  input       [23:0]  i_write_count,
  input               i_write_flush,

  output      [1:0]   o_write_ready,
  input       [1:0]   i_write_activate,
  output      [23:0]  o_write_size,
  input               i_write_strobe,
  input       [31:0]  i_write_data,

  //Read Side
  input               i_read_enable,
  input       [63:0]  i_read_addr,
  input               i_read_addr_inc,
  input               i_read_addr_dec,
  output              o_read_busy,
  output              o_read_error,
  input       [23:0]  i_read_count,
  input               i_read_flush,

  output              o_read_ready,
  input               i_read_activate,
  output      [23:0]  o_read_size,
  output      [31:0]  o_read_data,
  input               i_read_strobe

);

//Local Parameters
localparam      CONTROL                 = 32'h00000000;
localparam      STATUS                  = 32'h00000001;

localparam      HARD_DRIVE_STATUS       = 32'h00000002;
localparam      HARD_DRIVE_SECTOR_COUNT = 32'h00000003;
localparam      HARD_DRIVE_ADDRESS_HIGH = 32'h00000004;
localparam      HARD_DRIVE_ADDRESS_LOW  = 32'h00000005;
localparam      DEBUG_STATUS            = 32'h00000006;
localparam      DEBUG_LINKUP_DATA       = 32'h00000007;
localparam      HARD_DRIVE_COMMAND      = 32'h00000008;
localparam      HARD_DRIVE_FEATURES     = 32'h00000009;
localparam      LOCAL_BUFFER_WRITE_SIZE = 32'h0000000A;
localparam      DEBUG_HD_COUNTS         = 32'h0000000B;

localparam      PLATFORM_RESET_TIMEOUT  = 8'hFF;

localparam      IDLE                    = 4'h0;
localparam      WRITE_SETUP             = 4'h1;
localparam      WRITE                   = 4'h2;


//Local Registers/Wires
reg   [31:0]    control;
wire  [31:0]    status;
wire  [3:0]     oob_state;


//wire  [23:0]  slw_in_data_addra;
//wire  [12:0]  slw_d_count;
//wire  [12:0]  slw_write_count;
//wire  [3:0]   slw_buffer_pos;

reg           data_in_clk_valid;
reg           data_out_clk_valid;

wire          platform_error;

reg           sata_reset;
wire          sata_stack_reset;
wire          linkup;
wire          sata_ready;
wire          sata_busy;

reg   [15:0]  user_features;

wire          hard_drive_error;

reg           send_sync_escape;

reg           execute_command_stb;
wire          sata_execute_command_stb;
reg           command_layer_reset;
reg   [7:0]   hard_drive_command;

wire          pio_data_ready;
wire          transport_layer_ready;
wire          link_layer_ready;
wire          phy_ready;
reg   [31:0]  debug_rx_data;

reg   [15:0]  sector_count;
reg   [47:0]  sector_address;

wire          dma_activate_stb;
wire          d2h_reg_stb;
wire          pio_setup_stb;
wire          d2h_data_stb;
wire          dma_setup_stb;
wire          set_device_bits_stb;

wire  [7:0]   d2h_fis;
wire          d2h_interrupt;
wire          d2h_notification;
wire  [3:0]   d2h_port_mult;
wire  [7:0]   d2h_device;
wire  [47:0]  d2h_lba;
wire  [15:0]  d2h_sector_count;
wire  [7:0]   d2h_status;
wire  [7:0]   d2h_error;


wire  [31:0]  user_din;
wire          user_din_stb;
wire  [1:0]   user_din_ready;
wire  [1:0]   user_din_activate;
wire  [23:0]  user_din_size;
wire          user_din_empty;

wire  [31:0]  user_dout;
wire          user_dout_ready;
wire          user_dout_activate;
wire          user_dout_stb;
wire  [23:0]  user_dout_size;

reg   [15:0]  platform_reset_timer;


reg           en_int_hd_interrupt;
reg           prev_d2h_interrupt;
reg           pos_edge_d2h_interrupt;

reg           en_int_dma_activate_stb;
reg           prev_dma_activate_stb;
reg           pos_edge_dma_activate_stb;

reg           en_int_d2h_reg_stb;
reg           prev_d2h_reg_stb;
reg           pos_edge_d2h_reg_stb;

reg           en_int_pio_setup_stb;
reg           prev_pio_setup_stb;
reg           pos_edge_pio_setup_stb;

reg           en_int_d2h_data_stb;
reg           prev_d2h_data_stb;
reg           pos_edge_d2h_data_stb;

reg           en_int_dma_setup_stb;
reg           prev_dma_setup_stb;
reg           pos_edge_dma_setup_stb;

reg           en_int_set_device_bits_stb;
reg           prev_set_device_bits_stb;
reg           pos_edge_set_device_bits_stb;

reg           enable_dma_control;
reg           stb_load_local_buffer;

wire          local_buffer_en;
reg           local_buffer_wea;
wire  [10:0]  local_buffer_addr;
wire  [31:0]  local_buffer_douta;
reg   [31:0]  local_buffer_dina;

reg   [13:0]  local_buffer_write_size;



reg           lcl_user_din_stb;
reg   [1:0]   lcl_user_din_activate;
reg   [31:0]  lcl_user_din;

reg           lcl_user_dout_stb;
reg           lcl_user_dout_activate;

reg           sata_lcl_web;
reg   [10:0]  sata_lcl_addrb;
reg   [31:0]  sata_lcl_dinb;
wire  [31:0]  sata_lcl_doutb;

reg           usr_stb_write_data;
reg           usr_stb_read_data;

//wire          stb_write_data;
//wire          stb_read_data;

//wire          sata_write_data_stb;
//wire          sata_read_data_stb;

reg   [3:0]   lcl_wr_state;
reg   [13:0]  buffer_write_count;
reg   [23:0]  wr_count;
reg   [23:0]  rd_count;

wire  [3:0]   command_write_state;
wire  [3:0]   transport_state;
wire  [3:0]   ll_write_state;

wire          dbg_detect_r_ok;
reg   [7:0]   detect_r_ok_count;
wire          dbg_detect_r_err;
reg   [7:0]   detect_r_err_count;
reg   [7:0]   dma_activate_count;
reg   [3:0]   prev_write_state;


wire  [7:0]   dma_command;
wire          dma_execute_command_stb;
wire  [47:0]  dma_lba;
wire  [15:0]  dma_sector_count;

wire          enable_write_ready;

wire  [7:0]   sata_command;
wire  [47:0]  sata_lba;
wire  [15:0]  sata_sector_count;



//Submodules
sata_stack sata(
  .clk                    (sata_75mhz_clk         ),  //clock used to run the stack (this is probably 4X slower than the gigabit clock)
  .rst                    (sata_stack_reset       ),  //reset
  .command_layer_reset    (command_layer_reset    ),  //Reset the command layer and send a software reset to the hard drive

  .platform_ready         (i_platform_ready       ),  //the underlying physical platform is ready
  .platform_error         (platform_error         ),  //some bad thing happend at the transceiver level
  .linkup                 (linkup                 ),  //link is finished

  .sata_ready             (sata_ready             ),  //Hard drive is ready for commands
  .sata_busy              (sata_busy              ),  //Hard drive is busy executing commands

  .send_sync_escape       (send_sync_escape       ),  //This is a way to escape from a running transaction
  .hard_drive_error       (hard_drive_error       ),

  .pio_data_ready         (pio_data_ready         ),  //Peripheral IO has some data ready

  //Host to Device Control
  .hard_drive_command     (sata_command           ),  //Hard Drive commands EX: DMA Read 0x25, DMA Write 0x35
  .execute_command_stb    (sata_execute_command_stb),
  .user_features          (user_features          ),
  .sector_count           (sata_sector_count      ),
  .sector_address         (sata_lba               ),

  .dma_activate_stb       (dma_activate_stb       ),
  .d2h_reg_stb            (d2h_reg_stb            ),
  .pio_setup_stb          (pio_setup_stb          ),
  .d2h_data_stb           (d2h_data_stb           ),
  .dma_setup_stb          (dma_setup_stb          ),
  .set_device_bits_stb    (set_device_bits_stb    ),

  .d2h_fis                (d2h_fis                ),
  .d2h_interrupt          (d2h_interrupt          ),
  .d2h_notification       (d2h_notification       ),
  .d2h_port_mult          (d2h_port_mult          ),
  .d2h_device             (d2h_device             ),
  .d2h_lba                (d2h_lba                ),
  .d2h_sector_count       (d2h_sector_count       ),
  .d2h_status             (d2h_status             ),
  .d2h_error              (d2h_error              ),

  //Data from host to the hard drive path
  .data_in_clk            (clk                    ),  //Any clock to send data to the hard drive
  .data_in_clk_valid      (data_in_clk_valid      ),  //the data in clock is valid
  .user_din               (user_din               ),  //32-bit data to clock into FIFO
  .user_din_stb           (user_din_stb           ),  //Strobe to clock data into FIFO
  .user_din_ready         (user_din_ready         ),  //If one of the 2 in FIFOs are ready
  .user_din_activate      (user_din_activate      ),  //Activate one of the 2 FIFOs
  .user_din_size          (user_din_size          ),  //Number of available spots within the FIFO
  .user_din_empty         (user_din_empty         ),

  //Data from hard drive to host path
  .data_out_clk           (clk                    ),
  .data_out_clk_valid     (data_out_clk_valid     ),  //the data out clock is valid
  .user_dout              (user_dout              ),  //Actual data the comes from FIFO
  .user_dout_ready        (user_dout_ready        ),  //The output FIFO is ready (see below for how to use)
  .user_dout_activate     (user_dout_activate     ),  //Activate a FIFO (See below for an example on how to use)
  .user_dout_stb          (user_dout_stb          ),  //Strobe the data out of the FIFO (first word is available before strobe)
  .user_dout_size         (user_dout_size         ),  //Number of 32-bit words available

  .transport_layer_ready  (transport_layer_ready  ),
  .link_layer_ready       (link_layer_ready       ),
  .phy_ready              (phy_ready              ),  //sata phy layer has linked up and communication simple comm started
  .phy_error              (i_phy_error            ),  //an error on the transcievers has occured

  //Interface to the gigabit transcievers
  .tx_dout                (o_tx_dout              ),
  .tx_is_k                (o_tx_is_k              ),
  .tx_comm_reset          (o_tx_comm_reset        ),
  .tx_comm_wake           (o_tx_comm_wake         ),
  .tx_elec_idle           (o_tx_elec_idle         ),
  .tx_oob_complete        (i_tx_oob_complete      ),

  .rx_din                 (i_rx_din               ),
  .rx_is_k                (i_rx_is_k              ),
  .rx_elec_idle           (i_rx_elec_idle         ),
  .rx_byte_is_aligned     (i_rx_byte_is_aligned   ),
  .comm_init_detect       (i_comm_init_detect     ),
  .comm_wake_detect       (i_comm_wake_detect     ),

  //These should be set to 1 for normal operations, while debugging you can set to 0 to help debug things
  .prim_scrambler_en      (1'b1                   ),
  .data_scrambler_en      (1'b1                   ),

  .dbg_cc_lax_state       (                       ),
  .dbg_cw_lax_state       (command_write_state    ),

  .dbg_t_lax_state        (transport_state        ),

  .dbg_li_lax_state       (                       ),
  .dbg_lr_lax_state       (                       ),
  .dbg_lw_lax_state       (ll_write_state         ),
  .dbg_lw_lax_fstate      (                       ),


  .dbg_ll_write_ready     (                       ),
  .dbg_ll_paw             (                       ),
  .dbg_ll_send_crc        (                       ),

  .oob_state              (oob_state              ),

  .dbg_detect_sync        (                       ),
  .dbg_detect_r_rdy       (                       ),
  .dbg_detect_r_ip        (                       ),
  .dbg_detect_r_ok        (dbg_detect_r_ok        ),
  .dbg_detect_r_err       (dbg_detect_r_err       ),
  .dbg_detect_x_rdy       (                       ),
  .dbg_detect_sof         (                       ),
  .dbg_detect_eof         (                       ),
  .dbg_detect_wtrm        (                       ),
  .dbg_detect_cont        (                       ),
  .dbg_detect_hold        (                       ),
  .dbg_detect_holda       (                       ),
  .dbg_detect_align       (                       ),
  .dbg_detect_preq_s      (                       ),
  .dbg_detect_preq_p      (                       ),
  .dbg_detect_xrdy_xrdy   (                       ),

  .dbg_send_holda         (                       ),

//  .slw_in_data_addra      (slw_in_data_addra      ),
//  .slw_d_count            (slw_d_count            ),
//  .slw_write_count        (slw_write_count        ),
//  .slw_buffer_pos         (slw_buffer_pos         )

  .slw_in_data_addra      (                       ),
  .slw_d_count            (                       ),
  .slw_write_count        (                       ),
  .slw_buffer_pos         (                       )

);

sata_dma_interface dma(
  .rst                      (rst || !i_platform_ready ),
  .clk                      (clk                      ),

  .enable                   (enable_dma_control       ),

  //SATA Controller Interface
  .sata_command             (dma_command              ),
  .sata_execute_command_stb (dma_execute_command_stb  ), //Execute Command Strobe
  .sata_lba                 (dma_lba                  ), //SATA Sector Address
  .sata_sector_count        (dma_sector_count         ), //512 Increment

  .sata_busy                (sata_busy                ),

  //Write Side
  .write_enable             (i_write_enable           ),
  .write_addr               (i_write_addr             ),
  .write_finished           (o_write_finished         ),
  .write_count              (i_write_count            ),
  .write_flush              (i_write_flush            ),

  .write_activate           (user_din_activate        ),
  .write_strobe             (user_din_stb             ),
  .write_empty              (user_din_empty           ),

  .enable_write_ready       (enable_write_ready       ),

  //Read Side
  .read_enable              (i_read_enable            ),
  .read_addr                (i_read_addr              ),
  .read_busy                (o_read_busy              ),
  .read_error               (o_read_error             ),
  .read_count               (i_read_count             ),
  .read_flush               (i_read_flush             ),

  .read_activate            (user_dout_activate       ),
  .read_strobe              (user_dout_stb            )

);

cross_clock_strobe cmd_stb (
  .rst                    (rst || !i_platform_ready ),
  .in_clk                 (clk                      ),
  .in_stb                 (execute_command_stb || dma_execute_command_stb      ),

  .out_clk                (sata_75mhz_clk           ),
  .out_stb                (sata_execute_command_stb )
);


//Read/Write Data to a local buffer
dpb #(
  .DATA_WIDTH     (32                   ),
  .ADDR_WIDTH     (`SATA_BUFFER_WIDTH   )

) local_buffer (

  .clka           (clk                  ),
  .wea            (local_buffer_wea     ),
  .addra          (local_buffer_addr    ),
  .douta          (local_buffer_douta   ),
  .dina           (local_buffer_dina    ),

  .clkb           (clk                  ),
  .web            (sata_lcl_web         ),
  .addrb          (sata_lcl_addrb       ),
  //.dinb           (sata_lcl_dinb        ),
  .dinb           (user_dout            ),
  .doutb          (sata_lcl_doutb       )
);



//Asynchronous Logic

//Assigns are only for debugging

//XXX: These are place holders for when the DMA Controller is implemented
assign  user_din_stb             = enable_dma_control ? i_write_strobe    : lcl_user_din_stb;
assign  user_din_activate        = enable_dma_control ? i_write_activate  : lcl_user_din_activate;
assign  user_din                 = enable_dma_control ? i_write_data      : sata_lcl_doutb;

assign  user_dout_stb            = enable_dma_control ? i_read_strobe     : lcl_user_dout_stb;
assign  user_dout_activate       = enable_dma_control ? i_read_activate   : lcl_user_dout_activate;

assign  o_write_ready            = enable_write_ready ? user_din_ready    : 2'b00;
assign  o_write_size             = enable_dma_control ? user_din_size     : 24'h000000;

assign  o_read_ready             = enable_dma_control ? user_dout_ready   : 1'b0;
assign  o_read_size              = enable_dma_control ? user_dout_size    : 24'h000000;
assign  o_read_data              = enable_dma_control ? user_dout         : 32'h00000000;


assign  sata_command             = enable_dma_control ? dma_command       : hard_drive_command;
assign  sata_lba                 = enable_dma_control ? dma_lba           : sector_address;
assign  sata_sector_count        = enable_dma_control ? dma_sector_count  : sector_count;

//Synchronous Logic
assign  local_buffer_en          = ((i_wbs_adr >= `SATA_BUFFER_OFFSET) &&
                                    (i_wbs_adr < (`SATA_BUFFER_OFFSET + `SATA_BUFFER_SIZE)));

assign  local_buffer_addr        = local_buffer_en ? (i_wbs_adr - `SATA_BUFFER_OFFSET) : 10'h000;

assign  sata_stack_reset         = sata_reset || !i_platform_ready;

always @ (posedge sata_75mhz_clk) begin
  if (rst) begin
    debug_rx_data               <=  0;
    detect_r_ok_count           <=  0;
    detect_r_err_count          <=  0;
    dma_activate_count          <=  0;
    prev_write_state            <=  0;
  end
  else begin
    if (!i_wbs_cyc && !i_rx_elec_idle) begin
      debug_rx_data             <= i_rx_din;
    end
    if (dbg_detect_r_ok) begin
        detect_r_ok_count       <=  detect_r_ok_count + 1;
    end
    if (dbg_detect_r_err) begin
        detect_r_err_count      <=  detect_r_err_count + 1;
    end
    if ((prev_write_state == 1) && (command_write_state == 2)) begin
        dma_activate_count      <=  dma_activate_count + 1;
    end
    prev_write_state            <=  command_write_state;
  end
end

always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat                    <= 32'h0;
    o_wbs_ack                    <= 0;
    o_wbs_int                    <= 0;

    sata_reset                   <= 1;

    data_in_clk_valid            <= 0;
    data_out_clk_valid           <= 0;

    command_layer_reset          <= 0;
    execute_command_stb          <= 0;
    hard_drive_command           <= 0;

    sector_count                 <= 0;
    sector_address               <= 0;

    send_sync_escape             <= 0;
    user_features                <= 0;


    en_int_hd_interrupt          <= 0;
    prev_d2h_interrupt           <= 0;
    pos_edge_d2h_interrupt       <= 0;

    en_int_dma_activate_stb      <= 0;
    prev_dma_activate_stb        <= 0;
    pos_edge_dma_activate_stb    <= 0;

    en_int_d2h_reg_stb           <= 0;
    prev_d2h_reg_stb             <= 0;
    pos_edge_d2h_reg_stb         <= 0;

    en_int_pio_setup_stb         <= 0;
    prev_pio_setup_stb           <= 0;
    pos_edge_pio_setup_stb       <= 0;

    en_int_d2h_data_stb          <= 0;
    prev_d2h_data_stb            <= 0;
    pos_edge_d2h_data_stb        <= 0;

    en_int_dma_setup_stb         <= 0;
    prev_dma_setup_stb           <= 0;
    pos_edge_dma_setup_stb       <= 0;

    en_int_set_device_bits_stb   <= 0;
    prev_set_device_bits_stb     <= 0;
    pos_edge_set_device_bits_stb <= 0;

    local_buffer_wea             <= 0;
    local_buffer_dina            <= 0;
    enable_dma_control           <= 0;
    stb_load_local_buffer        <= 0;

    local_buffer_write_size      <= `SATA_BUFFER_SIZE;

    usr_stb_write_data           <= 0;
    usr_stb_read_data            <= 0;

  end
  else begin
    execute_command_stb          <= 0;
    local_buffer_wea             <= 0;
    data_in_clk_valid            <= 1;
    data_out_clk_valid           <= 1;
    stb_load_local_buffer        <= 0;
    usr_stb_write_data           <= 0;
    usr_stb_read_data            <= 0;
    send_sync_escape             <= 0;

    //Deassert Strobes
    if (!prev_d2h_interrupt && d2h_interrupt) begin
      pos_edge_d2h_interrupt        <=  1;
    end
    if (!prev_dma_activate_stb && dma_activate_stb) begin
      pos_edge_dma_activate_stb     <=  1;
    end
    if (!prev_d2h_reg_stb && d2h_reg_stb) begin
      pos_edge_d2h_reg_stb          <=  1;
    end
    if (!prev_pio_setup_stb && pio_setup_stb) begin
      pos_edge_pio_setup_stb        <=  1;
    end
    if (!prev_d2h_data_stb && d2h_data_stb) begin
      pos_edge_d2h_data_stb         <=  1;
    end
    if (!prev_dma_setup_stb && dma_setup_stb) begin
      pos_edge_dma_setup_stb        <=  1;
    end
    if (!prev_set_device_bits_stb && set_device_bits_stb) begin
      pos_edge_set_device_bits_stb  <=  1;
    end

    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      if (local_buffer_en) begin
        //Local buffer data out needs an extra clock cycle to clock out the data
        o_wbs_dat                       <= local_buffer_douta;
      end
      o_wbs_ack <= 0;
    end

    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      if (!o_wbs_ack) begin
        if (i_wbs_we) begin
          //write request
          case (i_wbs_adr)
            CONTROL: begin
              en_int_hd_interrupt        <= i_wbs_dat[`BIT_EN_INT_HD_INTERRUPT                ];
              en_int_dma_activate_stb    <= i_wbs_dat[`BIT_EN_INT_DMA_ACTIVATE_STB            ];
              en_int_d2h_reg_stb         <= i_wbs_dat[`BIT_EN_INT_D2H_REG_STB                 ];
              en_int_pio_setup_stb       <= i_wbs_dat[`BIT_EN_INT_PIO_SETUP_STB               ];
              en_int_d2h_data_stb        <= i_wbs_dat[`BIT_EN_INT_D2H_DATA_STB                ];
              en_int_dma_setup_stb       <= i_wbs_dat[`BIT_EN_INT_DMA_SETUP_STB               ];
              en_int_set_device_bits_stb <= i_wbs_dat[`BIT_EN_INT_SET_DEVICE_BITS_STB         ];
              command_layer_reset        <= i_wbs_dat[`BIT_HD_COMMAND_RESET                   ];
              sata_reset                 <= i_wbs_dat[`BIT_HD_RESET                           ];
              enable_dma_control         <= i_wbs_dat[`BIT_EN_DMA_CONTROL                     ];
              stb_load_local_buffer      <= i_wbs_dat[`BIT_STB_WRITE_LOCAL_BUFFER             ];
              usr_stb_write_data         <= i_wbs_dat[`BIT_STB_WRITE                          ];
              usr_stb_read_data          <= i_wbs_dat[`BIT_STB_READ                           ];
              send_sync_escape           <= i_wbs_dat[`BIT_STB_SYNC_ESCAPE                    ];
            end
            HARD_DRIVE_COMMAND: begin
              hard_drive_command         <= i_wbs_dat[7:0];
              execute_command_stb        <= 1;
            end
            HARD_DRIVE_FEATURES: begin
              user_features              <= i_wbs_dat[7:0];
            end
            LOCAL_BUFFER_WRITE_SIZE: begin
              local_buffer_write_size    <= i_wbs_dat[13:0];
            end
            HARD_DRIVE_ADDRESS_LOW: begin
              sector_address[31:0]       <= i_wbs_dat;
            end
            HARD_DRIVE_ADDRESS_HIGH: begin
              sector_address[47:32]      <= i_wbs_dat[15:0];
            end
            HARD_DRIVE_SECTOR_COUNT: begin
              sector_count               <= i_wbs_dat[15:0];
            end
            default: begin
              if (local_buffer_en) begin
                local_buffer_wea         <= 1;
                local_buffer_dina        <= i_wbs_dat;
              end
            end
          endcase
        end
        else begin
          //read request
          case (i_wbs_adr)
            CONTROL: begin
              o_wbs_dat <= 0;
              o_wbs_dat[`BIT_EN_INT_HD_INTERRUPT                ] <= en_int_hd_interrupt;
              o_wbs_dat[`BIT_EN_INT_DMA_ACTIVATE_STB            ] <= en_int_dma_activate_stb;
              o_wbs_dat[`BIT_EN_INT_D2H_REG_STB                 ] <= en_int_d2h_reg_stb;
              o_wbs_dat[`BIT_EN_INT_PIO_SETUP_STB               ] <= en_int_pio_setup_stb;
              o_wbs_dat[`BIT_EN_INT_D2H_DATA_STB                ] <= en_int_d2h_data_stb;
              o_wbs_dat[`BIT_EN_INT_DMA_SETUP_STB               ] <= en_int_dma_setup_stb;
              o_wbs_dat[`BIT_EN_INT_SET_DEVICE_BITS_STB         ] <= en_int_set_device_bits_stb;

              o_wbs_dat[`BIT_HD_COMMAND_RESET                   ] <= command_layer_reset;
              o_wbs_dat[`BIT_HD_RESET                           ] <= sata_reset;
            end
            STATUS: begin
              o_wbs_dat <= 0;

              o_wbs_dat[`BIT_PLATFORM_READY                     ] <= i_platform_ready;
              o_wbs_dat[`BIT_PLATFORM_ERROR                     ] <= platform_error;
              o_wbs_dat[`BIT_LINKUP                             ] <= linkup;
              o_wbs_dat[`BIT_COMMAND_LAYER_READY                ] <= sata_ready;
              o_wbs_dat[`BIT_SATA_BUSY                          ] <= sata_busy;
              o_wbs_dat[`BIT_PHY_READY                          ] <= phy_ready;
              o_wbs_dat[`BIT_LINK_LAYER_READY                   ] <= link_layer_ready;
              o_wbs_dat[`BIT_TRANSPORT_LAYER_READY              ] <= transport_layer_ready;
              o_wbs_dat[`BIT_HARD_DRIVE_ERROR                   ] <= hard_drive_error;
              o_wbs_dat[`BIT_PIO_DATA_READY                     ] <= pio_data_ready;
              o_wbs_dat[`BIT_RESET_ACTIVE                       ] <= sata_stack_reset;

              o_wbs_dat[`BIT_RX_COMM_INIT_DETECT                ] <= i_comm_init_detect;
              o_wbs_dat[`BIT_RX_COMM_WAKE_DETECT                ] <= i_comm_wake_detect;
              o_wbs_dat[`BIT_TX_COMM_RESET                      ] <= o_tx_comm_reset;
              o_wbs_dat[`BIT_TX_COMM_WAKE                       ] <= o_tx_comm_wake;
              o_wbs_dat[`BIT_TX_OOB_COMPLETE                    ] <= i_tx_oob_complete;
              o_wbs_dat[`BIT_DIN_FIFO_READY0                    ] <= user_din_ready[0];
              o_wbs_dat[`BIT_DIN_FIFO_READY1                    ] <= user_din_ready[1];

              o_wbs_int                                           <= 1'b0;
            end
            HARD_DRIVE_STATUS: begin
              o_wbs_dat[`BIT_D2H_INTERRUPT                      ] <= d2h_interrupt;
              o_wbs_dat[`BIT_D2H_NOTIFICATION                   ] <= d2h_notification;
              o_wbs_dat[`BIT_D2H_PMULT_HIGH:`BIT_D2H_PMULT_LOW  ] <= d2h_port_mult;
              o_wbs_dat[`BIT_D2H_STATUS_HIGH:`BIT_D2H_STATUS_LOW] <= d2h_status;
              o_wbs_dat[`BIT_D2H_ERROR_HIGH:`BIT_D2H_ERROR_LOW  ] <= d2h_error;
              o_wbs_dat[`BIT_D2H_FIS_HIGH:`BIT_D2H_FIS_LOW      ] <= d2h_fis;
            end
            HARD_DRIVE_SECTOR_COUNT: begin
              o_wbs_dat[31:16]                                    <= 16'h0000;
              o_wbs_dat[15:0]                                     <= d2h_sector_count;
            end
            HARD_DRIVE_ADDRESS_LOW: begin
              o_wbs_dat[31:0]                                     <= d2h_lba[31:0];
            end
            HARD_DRIVE_ADDRESS_HIGH: begin
              o_wbs_dat[31:16]                                    <= 16'h0;
              o_wbs_dat[15:0]                                     <= d2h_lba[47:32];
            end
            DEBUG_STATUS: begin
              o_wbs_dat                                             <= 32'h0;
              o_wbs_dat[`BIT_OOB_STATE_HIGH:`BIT_OOB_STATE_LOW]     <= oob_state;
              o_wbs_dat[`BIT_RESET_COUNT_HIGH:`BIT_RESET_COUNT_LOW] <= platform_reset_timer;
              o_wbs_dat[`BIT_D2H_INTERRUPT_EN]                      <= pos_edge_d2h_interrupt;
              o_wbs_dat[`BIT_DMA_ACTIVATE_EN]                       <= pos_edge_dma_activate_stb;
              o_wbs_dat[`BIT_D2H_PIO_SETUP_EN]                      <= pos_edge_pio_setup_stb;
              o_wbs_dat[`BIT_D2H_DATA_EN]                           <= pos_edge_d2h_data_stb;
              o_wbs_dat[`BIT_DMA_SETUP_EN]                          <= pos_edge_dma_setup_stb;
              o_wbs_dat[`BIT_LLW_ST_HIGH:`BIT_LLW_ST_LOW]           <= ll_write_state;
              o_wbs_dat[`BIT_CMD_WR_ST_HIGH:`BIT_CMD_WR_ST_LOW]     <= command_write_state;
              o_wbs_dat[`BIT_TRSPRT_HIGH:`BIT_TRSPRT_LOW]           <= transport_state;
            end
            DEBUG_LINKUP_DATA: begin
              o_wbs_dat                                           <= debug_rx_data;
            end
            HARD_DRIVE_COMMAND: begin
              o_wbs_dat                                           <= {24'h000, hard_drive_command};
            end
            HARD_DRIVE_FEATURES: begin
              o_wbs_dat                                           <= {24'h000, user_features};
            end
            LOCAL_BUFFER_WRITE_SIZE: begin
              o_wbs_dat                                          <= {18'h00, local_buffer_write_size};
            end
            DEBUG_HD_COUNTS: begin
              o_wbs_dat                                          <= {8'h00,
                                                                     dma_activate_count,
                                                                     detect_r_ok_count,
                                                                     detect_r_err_count};
            end
            default: begin
              if (local_buffer_en) begin
                o_wbs_dat                                         <= local_buffer_douta;
              end
            end
          endcase
        end
        o_wbs_ack <= 1;
      end
    end
    if (en_int_hd_interrupt && pos_edge_d2h_interrupt) begin
      o_wbs_int                 <=  1'b1;
      pos_edge_d2h_interrupt    <=  1'b0;
    end

    if (en_int_dma_activate_stb && pos_edge_dma_activate_stb) begin
      o_wbs_int                 <=  1'b1;
      pos_edge_dma_activate_stb <=  1'b0;
    end

    if (en_int_pio_setup_stb && pos_edge_pio_setup_stb) begin
      o_wbs_int                 <=  1'b1;
      pos_edge_pio_setup_stb    <=  1'b0;
    end

    if (en_int_d2h_data_stb && pos_edge_d2h_data_stb) begin
      o_wbs_int                 <=  1'b1;
      pos_edge_d2h_data_stb     <=  1'b0;
    end

    if (en_int_dma_setup_stb && pos_edge_dma_setup_stb) begin
      o_wbs_int                 <=  1'b1;
      pos_edge_dma_setup_stb    <=  1'b0;
    end

    if (en_int_set_device_bits_stb && pos_edge_set_device_bits_stb) begin
      o_wbs_int                 <=  1'b1;
      pos_edge_set_device_bits_stb  <=  1'b0;
    end


    if (usr_stb_write_data) begin
        hard_drive_command    <=    `WRITE_DMA_EXT;
        execute_command_stb   <=    1;
    end
    else if (usr_stb_read_data) begin
        hard_drive_command    <=    `READ_DMA_EXT;
        execute_command_stb   <=    1;
    end


    prev_d2h_interrupt        <=  d2h_interrupt;
    prev_dma_activate_stb     <=  dma_activate_stb;
    prev_pio_setup_stb        <=  pio_setup_stb;
    prev_d2h_reg_stb          <=  d2h_reg_stb;
    prev_d2h_data_stb         <=  d2h_data_stb;
    prev_dma_setup_stb        <=  dma_setup_stb;
    prev_set_device_bits_stb  <=  set_device_bits_stb;
  end
end


always @ (posedge clk) begin
  if (rst || !i_platform_ready) begin
    lcl_user_din_stb          <=  0;
    lcl_user_din_activate     <=  0;

    lcl_user_dout_stb         <=  0;
    lcl_user_dout_activate    <=  0;

    lcl_wr_state              <=  IDLE;

    sata_lcl_web              <=  0;
    sata_lcl_addrb            <=  0;

    buffer_write_count        <=  0;
    wr_count                  <=  0;
    rd_count                  <=  0;

  end
  else begin
    lcl_user_din_stb          <=  0;
    lcl_user_dout_stb         <=  0;
    sata_lcl_web              <=  0;
    if (!enable_dma_control) begin
      //Handle Writes
      case (lcl_wr_state)
        IDLE: begin
          if (stb_load_local_buffer) begin
            lcl_wr_state                  <=  WRITE_SETUP;
          end
          lcl_user_din_activate           <= 2'b0;
          if (!lcl_user_dout_activate) begin
            sata_lcl_addrb                <= 0;
          end
          buffer_write_count              <= 0;
        end
        WRITE_SETUP: begin
          if (buffer_write_count < local_buffer_write_size) begin
            //Attempt to get one of the local ping pong FIFO buffer
            if ((user_din_ready > 0) && (lcl_user_din_activate == 0)) begin
              wr_count                    <=  0;
              if (user_din_ready[0]) begin
                lcl_user_din_activate[0]  <=  1;
              end
              else begin
                lcl_user_din_activate[1]  <=  1;
              end
              lcl_wr_state                <= WRITE;
              sata_lcl_addrb              <= 0;
            end
          end
          else begin
            lcl_wr_state                  <=  IDLE;
            wr_count                      <= 0;
            lcl_user_din_activate         <= 0;
          end
        end
        WRITE: begin
          if (buffer_write_count < local_buffer_write_size) begin
            if (wr_count < user_din_size) begin
              sata_lcl_addrb              <= sata_lcl_addrb + 1;
              lcl_user_din_stb            <= 1;
              buffer_write_count          <= buffer_write_count + 1;
              wr_count                    <= wr_count + 1;
            end
            else begin
              lcl_user_din_activate       <= 0;
              wr_count                    <= 0;
              lcl_wr_state                <= WRITE_SETUP;
            end
          end
          else begin
            wr_count                      <= 0;
            lcl_user_din_activate         <= 0;
            lcl_wr_state                  <= IDLE;
            sata_lcl_addrb                <= 0;
          end
        end
        default: begin
        end
      endcase


      //Handle Reads from SATA and put them into local buffer
      if (user_dout_ready && !lcl_user_dout_activate) begin
        rd_count                          <= 0;
        lcl_user_dout_activate            <= 1'b1;
        sata_lcl_addrb                    <= 0;
      end
      else if (lcl_user_dout_activate) begin
        if (sata_lcl_web) begin
          if (rd_count < user_dout_size) begin
            lcl_user_dout_stb             <= 1;
            //sata_lcl_dinb                 <= user_dout;
            rd_count                      <= rd_count + 1;
            //sata_lcl_addrb                <= sata_lcl_addrb + 1;
          end
          else begin
            lcl_user_dout_activate        <= 0;
          end
        end
        sata_lcl_web                      <= 1;
        if (lcl_user_dout_stb) begin
          sata_lcl_addrb                <= sata_lcl_addrb + 1;
        end
      end
    end
    /*
    if (lcl_user_dout_stb) begin
      sata_lcl_addrb                      <= sata_lcl_addrb + 11'h01;
    end
    */
  end
end

endmodule
