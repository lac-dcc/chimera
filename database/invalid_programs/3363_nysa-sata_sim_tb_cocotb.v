// This program was cloned from: https://github.com/CospanDesign/nysa-sata
// License: MIT License

`timescale 1ns/1ps

`include "sata_defines.v"

module tb_cocotb (

//Parameters
//Registers/Wires
input               rst,              //reset
input               clk,

output              linkup,           //link is finished
output              sata_ready,
output              sata_busy,

//input               write_data_stb,
//input               read_data_stb,
input       [7:0]   hard_drive_command,
input               execute_command_stb,

input               command_layer_reset,
input       [15:0]  sector_count,
input       [47:0]  sector_address,

output              d2h_interrupt,
output              d2h_notification,
output      [3:0]   d2h_port_mult,
output      [7:0]   d2h_device,
output      [47:0]  d2h_lba,
output      [15:0]  d2h_sector_count,
output      [7:0]   d2h_status,
output      [7:0]   d2h_error,

input               u2h_write_enable,
output              u2h_write_finished,
input       [23:0]  u2h_write_count,

input               h2u_read_enable,
output      [23:0]  h2u_read_total_count,
output              h2u_read_error,
output              h2u_read_busy,

output              u2h_read_error,


output              transport_layer_ready,
output              link_layer_ready,
output              phy_ready,

input               prim_scrambler_en,
input               data_scrambler_en,

//Data Interface
output              tx_set_elec_idle,
output              rx_is_elec_idle,
output              hd_ready,
input               platform_ready,

//Debug
input               hold,
input               single_rdwr
);
reg     [31:0]      test_id = 0;

wire    [31:0]      tx_dout;
wire                tx_is_k;
wire                tx_comm_reset;
wire                tx_comm_wake;
wire                tx_elec_idle;

wire    [31:0]      rx_din;
wire    [3:0]       rx_is_k;
wire                rx_elec_idle;
wire                comm_init_detect;
wire                comm_wake_detect;

reg                 r_rst;
reg                 r_write_data_stb;
reg                 r_read_data_stb;
reg                 r_command_layer_reset;
reg     [15:0]      r_sector_count;
reg     [47:0]      r_sector_address;
reg                 r_prim_scrambler_en;
reg                 r_data_scrambler_en;
reg                 r_platform_ready;
reg                 r_dout_count;
reg                 r_hold;

reg                 r_u2h_write_enable;
reg   [23:0]        r_u2h_write_count;
reg                 r_h2u_read_enable;

reg   [7:0]         r_hard_drive_command;
reg                 r_execute_command_stb;

wire                hd_read_from_host;
wire  [31:0]        hd_data_from_host;


wire                hd_write_to_host;
wire  [31:0]        hd_data_to_host;

wire  [31:0]        user_dout;
wire                user_dout_ready;
wire                user_dout_activate;
wire                user_dout_stb;
wire  [23:0]        user_dout_size;


wire  [31:0]        user_din;
wire                user_din_stb;
wire  [1:0]         user_din_ready;
wire  [1:0]         user_din_activate;
wire  [23:0]        user_din_size;

wire                dma_activate_stb;
wire                d2h_reg_stb;
wire                pio_setup_stb;
wire                d2h_data_stb;
wire                dma_setup_stb;
wire                set_device_bits_stb;
wire  [7:0]         d2h_fis;
wire                i_rx_byte_is_aligned;





//There is a bug in COCOTB when stiumlating a signal, sometimes it can be corrupted if not registered
always @ (*) r_rst                = rst;
//always @ (*) r_write_data_stb     = write_data_stb;
//always @ (*) r_read_data_stb      = read_data_stb;
always @ (*) r_command_layer_reset= command_layer_reset;
always @ (*) r_sector_count       = sector_count;
always @ (*) r_sector_address     = sector_address;
always @ (*) r_prim_scrambler_en  = prim_scrambler_en;
always @ (*) r_data_scrambler_en  = data_scrambler_en;
always @ (*) r_platform_ready     = platform_ready;
always @ (*) r_hold               = hold;

always @ (*) r_u2h_write_enable   = u2h_write_enable;
always @ (*) r_u2h_write_count    = u2h_write_count;

always @ (*) r_h2u_read_enable    = h2u_read_enable;

always @ (*) r_hard_drive_command = hard_drive_command;
always @ (*) r_execute_command_stb= execute_command_stb;

//Submodules

//User Generated Test Data
test_in user_2_hd_generator(
  .clk                   (clk                  ),
  .rst                   (rst                  ),

  .enable                (r_u2h_write_enable   ),
  .finished              (u2h_write_finished   ),
  .write_count           (r_u2h_write_count    ),

  .ready                 (user_din_ready       ),
  .activate              (user_din_activate    ),
  .fifo_data             (user_din             ),
  .fifo_size             (user_din_size        ),
  .strobe                (user_din_stb         )
);

//Module to process data from Hard Drive to User
test_out hd_2_user_reader(
  .clk                   (clk                  ),
  .rst                   (rst                  ),

  .busy                  (h2u_read_busy        ),
  .enable                (r_h2u_read_enable    ),
  .error                 (h2u_read_error       ),
  .total_count           (h2u_read_total_count ),

  .ready                 (user_dout_ready      ),
  .activate              (user_dout_activate   ),
  .size                  (user_dout_size       ),
  .data                  (user_dout            ),
  .strobe                (user_dout_stb        )
);

//hd data reader core
hd_data_reader user_2_hd_reader(
  .clk                   (clk                  ),
  .rst                   (rst                  ),
  .enable                (r_u2h_write_enable   ),
  .error                 (u2h_read_error       ),

  .hd_read_from_host     (hd_read_from_host    ),
  .hd_data_from_host     (hd_data_from_host    )
);

//hd data writer core
hd_data_writer hd_2_user_generator(
  .clk                   (clk                  ),
  .rst                   (rst                  ),
  .enable                (r_h2u_read_enable    ),
  .data                  (hd_data_to_host      ),
  .strobe                (hd_write_to_host     )
);

sata_stack ss (
  .rst                   (r_rst                ),  //reset
  .clk                   (clk                  ),  //clock used to run the stack
  .command_layer_reset   (r_command_layer_reset),

  .platform_ready        (platform_ready       ),  //the underlying physical platform is
  .platform_error        (                     ),
  .linkup                (linkup               ),  //link is finished

  .sata_ready            (sata_ready           ),
  .sata_busy             (sata_busy            ),

  .send_sync_escape      (1'b0                 ),
  .hard_drive_error      (                     ),

  .pio_data_ready        (                     ),

  //Host to Device Control
//  .write_data_stb        (r_write_data_stb     ),
//  .read_data_stb         (r_read_data_stb      ),
  .hard_drive_command    (r_hard_drive_command ),
  .execute_command_stb   (r_execute_command_stb),
  .user_features         (16'h0000             ),
  .sector_count          (r_sector_count       ),
  .sector_address        (r_sector_address     ),

  .dma_activate_stb      (dma_activate_stb     ),
  .d2h_reg_stb           (d2h_reg_stb          ),
  .pio_setup_stb         (pio_setup_stb        ),
  .d2h_data_stb          (d2h_data_stb         ),
  .dma_setup_stb         (dma_setup_stb        ),
  .set_device_bits_stb   (set_device_bits_stb  ),

  .d2h_fis                (d2h_fis             ),
  .d2h_interrupt          (d2h_interrupt       ),
  .d2h_notification       (d2h_notification    ),
  .d2h_port_mult          (d2h_port_mult       ),
  .d2h_device             (d2h_device          ),
  .d2h_lba                (d2h_lba             ),
  .d2h_sector_count       (d2h_sector_count    ),
  .d2h_status             (d2h_status          ),
  .d2h_error              (d2h_error           ),

  //Data from host to the hard drive path
  .data_in_clk           (clk                  ),
  .data_in_clk_valid     (1'b1                 ),
  .user_din              (user_din             ),   //User Data Here
  .user_din_stb          (user_din_stb         ),   //Strobe Each Data word in here
  .user_din_ready        (user_din_ready       ),   //Using PPFIFO Ready Signal
  .user_din_activate     (user_din_activate    ),   //Activate PPFIFO Channel
  .user_din_size         (user_din_size        ),   //Find the size of the data to write to the device

  //Data from hard drive to host path
  .data_out_clk          (clk                  ),
  .data_out_clk_valid    (1'b1                 ),
  .user_dout             (user_dout            ),
  .user_dout_ready       (user_dout_ready      ),
  .user_dout_activate    (user_dout_activate   ),
  .user_dout_stb         (user_dout_stb        ),
  .user_dout_size        (user_dout_size       ),

  .transport_layer_ready (transport_layer_ready),
  .link_layer_ready      (link_layer_ready     ),
  .phy_ready             (phy_ready            ),
  .phy_error             (1'b0                 ),

  .tx_dout               (tx_dout              ),
  .tx_is_k               (tx_is_k              ),
  .tx_comm_reset         (tx_comm_reset        ),
  .tx_comm_wake          (tx_comm_wake         ),
  .tx_elec_idle          (tx_elec_idle         ),
  .tx_oob_complete       (1'b1                 ),

  .rx_din                (rx_din               ),
  .rx_is_k               (rx_is_k              ),
  .rx_elec_idle          (rx_elec_idle         ),
  .rx_byte_is_aligned    (i_rx_byte_is_aligned ),
  .comm_init_detect      (comm_init_detect     ),
  .comm_wake_detect      (comm_wake_detect     ),


  //.prim_scrambler_en     (r_prim_scrambler_en  ),
  .prim_scrambler_en     (1'b1                 ),
  //.data_scrambler_en     (r_data_scrambler_en  )
  .data_scrambler_en     (1'b1                 )
);

faux_sata_hd  fshd   (
  .rst                   (r_rst                ),
  .clk                   (clk                  ),
  .tx_dout               (rx_din               ),
  .tx_is_k               (rx_is_k              ),

  .rx_din                (tx_dout              ),
  .rx_is_k               ({3'b000, tx_is_k}    ),
  .rx_is_elec_idle       (tx_elec_idle         ),
  .rx_byte_is_aligned    (i_rx_byte_is_aligned ),

  .comm_reset_detect     (tx_comm_reset        ),
  .comm_wake_detect      (tx_comm_wake         ),

  .tx_comm_reset         (comm_init_detect     ),
  .tx_comm_wake          (comm_wake_detect     ),

  .hd_ready              (hd_ready             ),
//  .phy_ready             (phy_ready            ),


  //.dbg_data_scrambler_en (r_data_scrambler_en  ),
  .dbg_data_scrambler_en (1'b1                  ),

  .dbg_hold              (r_hold               ),

  .dbg_ll_write_start    (1'b0                 ),
  .dbg_ll_write_data     (32'h0                ),
  .dbg_ll_write_size     (0                    ),
  .dbg_ll_write_hold     (1'b0                 ),
  .dbg_ll_write_abort    (1'b0                 ),

  .dbg_ll_read_ready     (1'b0                 ),
  .dbg_t_en              (1'b0                 ),

  .dbg_send_reg_stb      (1'b0                 ),
  .dbg_send_dma_act_stb  (1'b0                 ),
  .dbg_send_data_stb     (1'b0                 ),
  .dbg_send_pio_stb      (1'b0                 ),
  .dbg_send_dev_bits_stb (1'b0                 ),

  .dbg_pio_transfer_count(16'h0000             ),
  .dbg_pio_direction     (1'b0                 ),
  .dbg_pio_e_status      (8'h00                ),

  .dbg_d2h_interrupt     (1'b0                 ),
  .dbg_d2h_notification  (1'b0                 ),
  .dbg_d2h_status        (8'b0                 ),
  .dbg_d2h_error         (8'b0                 ),
  .dbg_d2h_port_mult     (4'b0000              ),
  .dbg_d2h_device        (8'h00                ),
  .dbg_d2h_lba           (48'h000000000000     ),
  .dbg_d2h_sector_count  (16'h0000             ),

  .dbg_cl_if_data        (32'b0                ),
  .dbg_cl_if_ready       (1'b0                 ),
  .dbg_cl_if_size        (24'h0                ),

  .dbg_cl_of_ready       (2'b0                 ),
  .dbg_cl_of_size        (24'h0                ),
  .hd_read_from_host     (hd_read_from_host    ),
  .hd_data_from_host     (hd_data_from_host    ),


  .hd_write_to_host      (hd_write_to_host     ),
  .hd_data_to_host       (hd_data_to_host      )


);

//Asynchronous Logic
//Synchronous Logic
//Simulation Control
initial begin
  $dumpfile ("design.vcd");
  $dumpvars(0, tb_cocotb);
end

endmodule
