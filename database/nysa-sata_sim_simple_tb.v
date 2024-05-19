// This program was cloned from: https://github.com/CospanDesign/nysa-sata
// License: MIT License

`timescale 1ns/1ps

`define SCLK_HALF_PERIOD 3
`define DCLK_HALF_PERIOD 3
//`define DCLK_HALF_PERIOD 2  //Change to any frequency you want

`define SCLK_PERIOD (2 * `SCLK_HALF_PERIOD)
`define DCLK_PERIOD (2 * `DCLK_HALF_PERIOD)

`define STARTUP_TIMEOUT   32'h00000100
`define ERROR_TIMEOUT     32'h00000100
`define TXRX_TIMEOUT      32'h00001000

`include "sata_defines.v"

module simple_tb ();

//Parameters
//Registers/Wires
reg                 rst           = 0;            //reset
reg                 clk           = 0;
reg                 sata_clk      = 0;
reg                 data_clk      = 0;

wire                command_layer_reset;

wire                linkup;           //link is finished
wire                sata_ready;
wire                sata_busy;

wire                send_sync_escape;
wire                hard_drive_error;
wire                pio_data_ready;

reg                 soft_reset_en   = 0;
reg         [15:0]  sector_count    = 8;
reg         [47:0]  sector_address  = 0;

reg         [31:0]  user_din;
reg                 user_din_stb;
wire        [1:0]   user_din_ready;
reg         [1:0]   user_din_activate;
wire        [23:0]  user_din_size;

wire        [31:0]  user_dout;
wire                user_dout_ready;
reg                 user_dout_activate;
reg                 user_dout_stb;
wire        [23:0]  user_dout_size;


wire                transport_layer_ready;
wire                link_layer_ready;
wire                phy_ready;

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

wire                rx_byte_is_aligned;

wire                prim_scrambler_en;
wire                data_scrambler_en;

//Data Interface
wire                tx_set_elec_idle;
wire                rx_is_elec_idle;
wire                hd_ready;
wire                platform_ready;
wire                platform_error;

//Debug
wire        [31:0]  hd_data_to_host;

reg         [23:0]  din_count;
reg         [23:0]  dout_count;
reg                 hold = 0;

reg                 single_rdwr = 0;
reg         [7:0]   sata_command = 0;
reg         [15:0]  user_features = 0;


wire                dma_activate_stb;
wire                d2h_reg_stb;
wire                pio_setup_stb;
wire                d2h_data_stb;
wire                dma_setup_stb;
wire                set_device_bits_stb;

wire        [7:0]   d2h_fis;
wire                d2h_interrupt;
wire                d2h_notification;
wire        [3:0]   d2h_port_mult;
wire        [7:0]   d2h_device;
wire        [47:0]  d2h_lba;
wire        [15:0]  d2h_sector_count;
wire        [7:0]   d2h_status;
wire        [7:0]   d2h_error;


reg                 r_u2h_write_enable = 0;
reg                 r_h2u_read_enable = 0;

reg                 sata_execute_command_stb = 0;
wire        [31:0]  hd_data_from_host;
wire                hd_read_from_host;
wire                hd_write_to_host;

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

//Submodules
sata_stack ss (
  .clk                    (sata_clk               ),  //clock used to run the stack
  .rst                    (rst                    ),  //reset

  .command_layer_reset    (command_layer_reset    ),  //Reset the command layer and send a software reset to the hard drive

  .platform_ready         (platform_ready         ),  //the underlying physical platform is ready
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
  .sector_count           (sector_count           ),
  .sector_address         (sector_address         ),

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
  .data_in_clk            (data_clk               ),  //Any clock to send data to the hard drive
  .data_in_clk_valid      (1'b1                   ),  //the data in clock is valid
  .user_din               (user_din               ),  //32-bit data to clock into FIFO
  .user_din_stb           (user_din_stb           ),  //Strobe to clock data into FIFO
  .user_din_ready         (user_din_ready         ),  //If one of the 2 in FIFOs are ready
  .user_din_activate      (user_din_activate      ),  //Activate one of the 2 FIFOs
  .user_din_size          (user_din_size          ),  //Number of available spots within the FIFO
  .user_din_empty         (user_din_empty         ),

  //Data from hard drive to host path
  .data_out_clk           (data_clk               ),
  .data_out_clk_valid     (1'b1                   ),  //the data out clock is valid
  .user_dout              (user_dout              ),  //Actual data the comes from FIFO
  .user_dout_ready        (user_dout_ready        ),  //The output FIFO is ready (see below for how to use)
  .user_dout_activate     (user_dout_activate     ),  //Activate a FIFO (See below for an example on how to use)
  .user_dout_stb          (user_dout_stb          ),  //Strobe the data out of the FIFO (first word is available before strobe)
  .user_dout_size         (user_dout_size         ),  //Number of 32-bit words available

  .transport_layer_ready  (transport_layer_ready  ),
  .link_layer_ready       (link_layer_ready       ),
  .phy_ready              (phy_ready              ),  //sata phy layer has linked up and communication simple comm started
  .phy_error              (1'b0                   ),  //an error on the transcievers has occured

  //Interface to the gigabit transcievers
  .tx_dout                (tx_dout              ),
  .tx_is_k                (tx_is_k              ),
  .tx_comm_reset          (tx_comm_reset        ),
  .tx_comm_wake           (tx_comm_wake         ),
  .tx_elec_idle           (tx_elec_idle         ),
  .tx_oob_complete        (1'b1                 ),

  .rx_din                 (rx_din               ),
  .rx_is_k                (rx_is_k              ),
  .rx_elec_idle           (1'b0                 ),
  .rx_byte_is_aligned     (rx_byte_is_aligned   ),
  .comm_init_detect       (comm_init_detect     ),
  .comm_wake_detect       (comm_wake_detect     ),

  //These should be set to 1 for normal operations, while debugging you can set to 0 to help debug things
  .prim_scrambler_en      (prim_scrambler_en      ),
  .data_scrambler_en      (data_scrambler_en      ),

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

faux_sata_hd  fshd   (
  .rst                   (rst                     ),
  .clk                   (sata_clk                ),
  .tx_dout               (rx_din                  ),
  .tx_is_k               (rx_is_k                 ),

  .rx_din                (tx_dout                 ),
  .rx_is_k               ({3'b000, tx_is_k}       ),
  .rx_is_elec_idle       (tx_elec_idle            ),
  .rx_byte_is_aligned    (rx_byte_is_aligned      ),

  .comm_reset_detect     (tx_comm_reset           ),
  .comm_wake_detect      (tx_comm_wake            ),

  .tx_comm_reset         (comm_init_detect        ),
  .tx_comm_wake          (comm_wake_detect        ),

  .hd_ready              (hd_ready                ),
//  .phy_ready             (phy_ready              ),


  .dbg_data_scrambler_en (data_scrambler_en       ),

  .dbg_hold              (hold                    ),

  .dbg_ll_write_start    (0                       ),
  .dbg_ll_write_data     (0                       ),
  .dbg_ll_write_size     (0                       ),
  .dbg_ll_write_hold     (0                       ),
  .dbg_ll_write_abort    (0                       ),

  .dbg_ll_read_ready     (0                       ),
  .dbg_t_en              (0                       ),

  .dbg_send_reg_stb      (0                       ),
  .dbg_send_dma_act_stb  (0                       ),
  .dbg_send_data_stb     (0                       ),
  .dbg_send_pio_stb      (0                       ),
  .dbg_send_dev_bits_stb (0                       ),

  .dbg_pio_transfer_count(0                       ),
  .dbg_pio_direction     (0                       ),
  .dbg_pio_e_status      (0                       ),

  .dbg_d2h_interrupt     (0                       ),
  .dbg_d2h_notification  (0                       ),
  .dbg_d2h_status        (0                       ),
  .dbg_d2h_error         (0                       ),
  .dbg_d2h_port_mult     (0                       ),
  .dbg_d2h_device        (0                       ),
  .dbg_d2h_lba           (0                       ),
  .dbg_d2h_sector_count  (0                       ),

  .dbg_cl_if_data        (0                       ),
  .dbg_cl_if_ready       (0                       ),
  .dbg_cl_if_size        (0                       ),
  .dbg_cl_of_ready       (0                       ),
  .dbg_cl_of_size        (0                       ),

  .hd_read_from_host     (hd_read_from_host       ),
  .hd_data_from_host     (hd_data_from_host       ),

  .hd_write_to_host      (hd_write_to_host        ),
  .hd_data_to_host       (hd_data_to_host         )

);



//Asynchronous Logic
assign  prim_scrambler_en             = 1;
assign  data_scrambler_en             = 1;
assign  platform_ready                = 1;
//assign  hd_data_to_host               = 32'h01234567;
assign  send_sync_escape              = 1'b0;
assign command_layer_reset            = 1'b0;


//Synchronous Logic
always #`SCLK_HALF_PERIOD sata_clk    = ~sata_clk;
always #`DCLK_HALF_PERIOD data_clk    = ~data_clk;
always #1 clk                         = ~clk;

//Simulation Control
initial begin
  rst <=  1;
  //$dumpfile ("design.vcd");
  //$dumpvars(0, simple_tb);
  #(20 * `SCLK_PERIOD);
  rst <=  0;
  //#(20 * `SCLK_PERIOD);
  //$finish();
end


//Simulation Conditions
initial begin
  sector_address                    <=  0;
  sector_count                      <=  8;
  single_rdwr                       <=  0;

  sata_command                      <=  0;
  user_features                     <=  0;

  r_u2h_write_enable                <=  0;
  r_h2u_read_enable                 <=  0;
  sata_execute_command_stb          <=  0;

  #(20 * `SCLK_PERIOD);
  while (!linkup) begin
    #(1 * `SCLK_PERIOD);
  end
  while (!sata_ready) begin
    #(1 * `SCLK_PERIOD);
  end
  //Send a command
//  #(700 * `SCLK_PERIOD);
  //#(563 * `SCLK_PERIOD);
  #(100 * `SCLK_PERIOD);
  sata_command                      <=  8'h35;  //Write
  sector_count                      <=  1;
  #(1 * `SCLK_PERIOD);
  sata_execute_command_stb          <=  1;
  #(1 * `SCLK_PERIOD);
  sata_execute_command_stb          <=  0;
  r_u2h_write_enable                <=  1;      //Read Data on the Hard Drive Side


  #(1000 * `SCLK_PERIOD);
  while (sata_busy) begin
  #(1 * `SCLK_PERIOD);
  end
  #(100 * `SCLK_PERIOD);
  r_u2h_write_enable                <=  0;




  //Put some data in the virtual hard drive
  r_h2u_read_enable                 <=  1;
  #(1000 * `SCLK_PERIOD);
  sector_count                      <=  2;
  sata_command                      <=  8'h25;  //Read
  #(1 * `SCLK_PERIOD);
  sata_execute_command_stb          <=  1;
  #(1 * `SCLK_PERIOD);
  sata_execute_command_stb          <=  0;


  #(1000 * `SCLK_PERIOD);
  #(20 * `SCLK_PERIOD);
  while (sata_busy) begin
    #1;
  end
  r_h2u_read_enable                 <=  0;
  
  //$finish();
end

/*
initial begin
  hold                              <=  0;
  #(20 * `SCLK_PERIOD);
  while (!sata_busy) begin
    #1;
 end
  #(800* `SCLK_PERIOD);
  hold                              <=  1;
  #(100 * `SCLK_PERIOD);
  hold                              <=  0;
end
*/
/*
//inject a hold
initial begin
  hold                              <=  0;
  #(20 * `SCLK_PERIOD);
  while (!write_data_en) begin
    #1;
  end
  #(682 * `SCLK_PERIOD);
  hold                              <=  1;
  #(1 * `SCLK_PERIOD);
  hold                              <=  0;
end
*/


/*
initial begin
  sector_address                    <=  0;
  sector_count                      <=  0;

  #(20 * `SCLK_PERIOD);
  while (!linkup) begin
    #1;
  end
  while (busy) begin
    #1;
  end
  //Send a command
  #(824 * `SCLK_PERIOD);
  write_data_en                     <=  1;
  #(20 * `SCLK_PERIOD);
  while (!busy) begin
    #1;
  end
  write_data_en                     <=  0;
end
*/










//Buffer Fill/Drain
always @ (posedge data_clk) begin
  if (rst) begin
    user_din                        <=  0;
    user_din_stb                    <=  0;
    user_din_activate               <=  0;
    din_count                       <=  0;

    user_dout_activate              <=  0;
    user_dout_stb                   <=  0;
    dout_count                      <=  0;
  end
  else begin
    user_din_stb                    <=  0;
    user_dout_stb                   <=  0;

    if ((user_din_ready > 0) && (user_din_activate == 0)) begin
      din_count                     <=  0;
      if (user_din_ready[0]) begin
        user_din_activate[0]        <=  1;
      end
      else begin
        user_din_activate[1]        <=  1;
      end
    end

    if (din_count >= user_din_size) begin
      user_din_activate            <=  0;
    end
    else if (user_din_activate > 0) begin
      user_din_stb                  <=  1;
      user_din                      <=  din_count;
      din_count                     <=  din_count + 1;
    end

    if (user_dout_ready && !user_dout_activate) begin
      dout_count                    <=  0;
      user_dout_activate            <=  1;
    end

    if (dout_count >= user_dout_size) begin
      user_dout_activate             <=  0;
    end
    else if (user_dout_activate) begin
      user_dout_stb                 <=  1;
    end
  end
end


endmodule
