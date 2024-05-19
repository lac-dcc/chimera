// This program was cloned from: https://github.com/CospanDesign/nysa-sata
// License: MIT License

//sata_command_layer.v
/*
Distributed under the MIT license.
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

`include "sata_defines.v"

`define RESET_TIMEOUT 32'h00000002

module sata_command_layer (

  input               rst,            //reset
  input               linkup,
  input               clk,
  input               data_in_clk,
  input               data_in_clk_valid,
  input               data_out_clk,
  input               data_out_clk_valid,

//User Interface
  output              command_layer_ready,
  output  reg         sata_busy,
  input               send_sync_escape,
  input       [15:0]  user_features,

//XXX: New Stb
//  input               write_data_stb,
//  input               read_data_stb,
  output              hard_drive_error,

  input               execute_command_stb,
  input               command_layer_reset,

  output  reg         pio_data_ready,
  input       [7:0]   hard_drive_command,

  input       [15:0]  sector_count,
  input       [47:0]  sector_address,

  input       [31:0]  user_din,
  input               user_din_stb,
  output      [1:0]   user_din_ready,
  input       [1:0]   user_din_activate,
  output      [23:0]  user_din_size,
  output              user_din_empty,

  output      [31:0]  user_dout,
  output              user_dout_ready,
  input               user_dout_activate,
  input               user_dout_stb,
  output      [23:0]  user_dout_size,


 //Transfer Layer Interface
  input               transport_layer_ready,
  output  reg         sync_escape,

  output              t_send_command_stb,
  output  reg         t_send_control_stb,
  output              t_send_data_stb,

  input               t_dma_activate_stb,
  input               t_d2h_reg_stb,
  input               t_pio_setup_stb,
  input               t_d2h_data_stb,
  input               t_dma_setup_stb,
  input               t_set_device_bits_stb,

  input               t_remote_abort,
  input               t_xmit_error,
  input               t_read_crc_error,


//PIO
  input               t_pio_response,
  input               t_pio_direction,
  input       [15:0]  t_pio_transfer_count,
  input       [7:0]   t_pio_e_status,

//Host to Device Register Values
  output      [7:0]   h2d_command,
  output  reg [15:0]  h2d_features,
  output      [7:0]   h2d_control,
  output      [3:0]   h2d_port_mult,
  output      [7:0]   h2d_device,
  output      [47:0]  h2d_lba,
  output      [15:0]  h2d_sector_count,

//Device to Host Register Values
  input               d2h_interrupt,
  input               d2h_notification,
  input       [3:0]   d2h_port_mult,
  input       [7:0]   d2h_device,
  input       [47:0]  d2h_lba,
  input       [15:0]  d2h_sector_count,
  input       [7:0]   d2h_status,
  input       [7:0]   d2h_error,

  output              d2h_error_bbk,    //Bad Block
  output              d2h_error_unc,    //Uncorrectable Error
  output              d2h_error_mc,     //Removable Media Error
  output              d2h_error_idnf,   //request sector's ID Field could not be found
  output              d2h_error_mcr,    //Removable Media Error
  output              d2h_error_abrt,   //Abort (from invalid command, drive not ready, write fault)
  output              d2h_error_tk0nf,  //Track 0 not found
  output              d2h_error_amnf,   //Data Address Mark is not found after finding correct ID

  output              d2h_status_bsy,   //Set to 1 when drive has access to command block, no other bits are valid when 1
                                        //  Set after reset
                                        //  Set after soft reset (srst)
                                        //  Set immediately after host writes to command register
  output              d2h_status_drdy,  //Drive is ready to accept command
  output              d2h_status_dwf,   //Drive Write Fault
  output              d2h_status_dsc,   //Drive Seek Complete
  output              d2h_status_drq,   //Data Request, Drive is ready to send data to the host
  output              d2h_status_corr,  //Correctable Data bit (an error that was encountered but was corrected)
  output              d2h_status_idx,   //once per disc revolution this bit is set to one then back to zero
  output              d2h_status_err,   //error bit, if this bit is high check the error flags

//command layer data interface
  input               t_if_strobe,
  output      [31:0]  t_if_data,
  output              t_if_ready,
  input               t_if_activate,
  output      [23:0]  t_if_size,

  input               t_of_strobe,
  input       [31:0]  t_of_data,
  output      [1:0]   t_of_ready,
  input       [1:0]   t_of_activate,
  output      [23:0]  t_of_size,


//Debug
  output      [3:0]   cl_c_state,
  output      [3:0]   cl_w_state

);


//Parameters
parameter IDLE                = 4'h0;
parameter PIO_WAIT_FOR_DATA   = 4'h1;
parameter PIO_WRITE_DATA      = 4'h2;

parameter WAIT_FOR_DMA_ACT    = 4'h1;
parameter WAIT_FOR_WRITE_DATA = 4'h2;
parameter SEND_DATA           = 4'h3;

//Registers/Wires
reg         [3:0]   cntrl_state;
reg                 srst;
reg         [7:0]   status;
wire                idle;
reg                 cntrl_send_data_stb;
reg                 send_command_stb;

wire                dev_busy;
wire                dev_data_req;

//Write State Machine
reg         [3:0]   write_state;

reg                 dma_send_data_stb;
reg                 dma_act_detected_en;

reg                 enable_tl_data_ready;

//Ping Pong FIFOs
wire        [1:0]   if_write_ready;
wire        [1:0]   if_write_activate;
wire        [23:0]  if_write_size;
wire                if_write_strobe;
wire        [31:0]  if_write_data;

wire                if_read_strobe;
wire                if_read_ready;
wire                if_read_activate;
wire        [23:0]  if_read_size;
wire        [31:0]  if_read_data;

wire                if_reset;

wire        [31:0]  of_write_data;
wire        [1:0]   of_write_ready;
wire        [1:0]   of_write_activate;
wire        [23:0]  of_read_size;
wire                of_write_strobe;
wire                out_fifo_starved;

wire                of_read_ready;
wire        [31:0]  of_read_data;
wire                of_read_activate;
wire        [23:0]  of_write_size;
wire                of_read_strobe;

wire                of_reset;

//ping pong FIFO
//Input FIFO
ppfifo # (
  .DATA_WIDTH           (`DATA_SIZE               ),
  .ADDRESS_WIDTH        (`FIFO_ADDRESS_WIDTH      )
) fifo_in (
  .reset                (if_reset                 ),  //XXX: Veify that new PPFIFO doesn't need an external reset

  //write side
//XXX: This can be different clocks
  .write_clock          (data_in_clk              ),
  .write_data           (if_write_data            ),
  .write_ready          (if_write_ready           ),
  .write_activate       (if_write_activate        ),
  .write_fifo_size      (if_write_size            ),
  .write_strobe         (if_write_strobe          ),
  //.starved              (if_starved               ),
  .starved              (user_din_empty           ),

  //read side
//XXX: This can be different clocks
  .read_clock           (clk                      ),
  .read_strobe          (if_read_strobe           ),
  .read_ready           (if_read_ready            ),
  .read_activate        (if_read_activate         ),
  .read_count           (if_read_size             ),
  .read_data            (if_read_data             ),
  .inactive             (                         )
);


//Output FIFO
ppfifo # (
  .DATA_WIDTH           (`DATA_SIZE               ),
  .ADDRESS_WIDTH        (`FIFO_ADDRESS_WIDTH      )
) fifo_out (
  .reset                (of_reset                 ),
  //.reset                (0),

  //write side
//XXX: This can be different clocks
  .write_clock          (clk                      ),
  .write_data           (of_write_data            ),
  .write_ready          (of_write_ready           ),
  .write_activate       (of_write_activate        ),
  .write_fifo_size      (of_write_size            ),
  .write_strobe         (of_write_strobe          ),
  //.starved              (out_fifo_starved         ),
  .starved              (                         ),

  //read side
//XXX: This can be different clocks
  .read_clock           (data_out_clk             ),
  .read_strobe          (of_read_strobe           ),
  .read_ready           (of_read_ready            ),
  .read_activate        (of_read_activate         ),
  .read_count           (of_read_size             ),
  .read_data            (of_read_data             ),
  .inactive             (                         )
);


//Asynchronous Logic
//Attach output of Input FIFO to TL
assign  t_if_ready            = if_read_ready && enable_tl_data_ready;
assign  t_if_size             = if_read_size;
assign  t_if_data             = if_read_data;

assign  if_read_activate      = t_if_activate;
assign  if_read_strobe        = t_if_strobe;

//Attach input of output FIFO to TL
assign  t_of_ready            = of_write_ready;
//assign  t_of_size             = of_write_size;
assign  t_of_size             = 24'h00800;
assign  of_write_data         = t_of_data;

assign  of_write_activate     = t_of_activate;
assign  of_write_strobe       = t_of_strobe;

assign  of_reset              = (rst && data_out_clk_valid);
assign  if_reset              = (rst && data_in_clk_valid);



assign  if_write_data         = user_din;
assign  if_write_strobe       = user_din_stb;
assign  user_din_ready        = if_write_ready;
assign  if_write_activate     = user_din_activate;
assign  user_din_size         = if_write_size;

assign  user_dout             = of_read_data;
assign  user_dout_ready       = of_read_ready;
assign  of_read_activate      = user_dout_activate;
assign  user_dout_size        = of_read_size;
assign  of_read_strobe        = user_dout_stb;

assign  d2h_status_bsy        = d2h_status[7];
assign  d2h_status_drdy       = d2h_status[6];
assign  d2h_status_dwf        = d2h_status[5];
assign  d2h_status_dsc        = d2h_status[4];
assign  d2h_status_drq        = d2h_status[3];
assign  d2h_status_corr       = d2h_status[2];
assign  d2h_status_idx        = d2h_status[1];
assign  d2h_status_err        = d2h_status[0];

assign  d2h_error_bbk         = d2h_error[7];
assign  d2h_error_unc         = d2h_error[6];
assign  d2h_error_mc          = d2h_error[5];
assign  d2h_error_idnf        = d2h_error[4];
assign  d2h_error_mcr         = d2h_error[3];
assign  d2h_error_abrt        = d2h_error[2];
assign  d2h_error_tk0nf       = d2h_error[1];
assign  d2h_error_amnf        = d2h_error[0];

//Strobes
//assign  t_send_command_stb    = read_data_stb ||  write_data_stb  || execute_command_stb;
assign  t_send_command_stb    = execute_command_stb;
assign  t_send_data_stb       = dma_send_data_stb ||cntrl_send_data_stb;

//IDLE
assign  idle                  = (cntrl_state  == IDLE) &&
                                (write_state  == IDLE) &&
                                transport_layer_ready;

assign  command_layer_ready   = idle;

assign  h2d_command           = hard_drive_command;
assign  h2d_sector_count      = sector_count;
assign  h2d_lba               = sector_address;

//XXX: The individual bits should be controlled directly
assign  h2d_control           = {5'h00, srst, 2'b00};
//XXX: This should be controlled from a higher level
assign  h2d_port_mult         = 4'h0;
//XXX: This should be controlled from a higher level
assign  h2d_device            = `D2H_REG_DEVICE;

assign  dev_busy              = status[`STATUS_BUSY_BIT];
assign  dev_data_req          = status[`STATUS_DRQ_BIT];
assign  hard_drive_error      = status[`STATUS_ERR_BIT];

assign  cl_c_state            = cntrl_state;
assign  cl_w_state            = write_state;

//Synchronous Logic

//Control State Machine
always @ (posedge clk) begin
  if (rst || (!linkup)) begin
    cntrl_state                   <=  IDLE;

    h2d_features                  <=  `D2H_REG_FEATURES;
    srst                          <=  0;

    //Strobes
    t_send_control_stb            <=  0;
    cntrl_send_data_stb           <=  0;
    pio_data_ready                <=  0;
    status                        <=  0;

    sata_busy                     <=  0;
    sync_escape                   <=  0;
  end
  else begin
    t_send_control_stb            <=  0;
    cntrl_send_data_stb           <=  0;
    pio_data_ready                <=  0;
    //Reset Count

    if (t_d2h_reg_stb) begin
      //Receiving a register strobe from the device
      sata_busy                   <=  0;
      h2d_features                <=  `D2H_REG_FEATURES;
    end
    /*
    if (t_send_command_stb || t_send_control_stb) begin
      sata_busy                   <=  1;
    end
    */
    if (execute_command_stb) begin
      h2d_features                <=  user_features;
      sata_busy                   <=  1;
    end

    case (cntrl_state)
      IDLE: begin

        //Soft Reset will break out of any flow
        if (command_layer_reset && !srst) begin
          srst                  <=  1;
          t_send_control_stb    <=  1;
        end

        if (idle) begin
          //The only way to transition to another state is if CL is IDLE

          //User Initiated commands
          if (!command_layer_reset && srst) begin
            srst                  <=  0;
            t_send_control_stb    <=  1;
          end
       end

        //Device Initiated Transfers
        if(t_pio_setup_stb) begin
          if (t_pio_direction) begin
            //Read from device
            cntrl_state           <=  PIO_WAIT_FOR_DATA;
          end
          else begin
            //Write to device
            cntrl_state           <=  PIO_WRITE_DATA;
          end
        end
        if (t_set_device_bits_stb) begin
          status                  <=  d2h_status;
          //status register was updated
        end
        if (t_d2h_reg_stb) begin
          status                  <=  d2h_status;
        end
      end
      PIO_WAIT_FOR_DATA: begin
        if (t_d2h_data_stb) begin
          //the next peice of data is related to the PIO
          pio_data_ready          <=  1;
          cntrl_state             <=  IDLE;
          status                  <=  t_pio_e_status;
        end
      end
      PIO_WRITE_DATA: begin
        if (if_read_activate) begin
          cntrl_send_data_stb     <=  0;
          cntrl_state             <=  IDLE;
          status                  <=  t_pio_e_status;
        end
      end

      default: begin
        cntrl_state               <=  IDLE;
      end
    endcase

    if (send_sync_escape) begin
      cntrl_state                 <=  IDLE;
      sync_escape                 <=  1;
      sata_busy                   <=  0;
    end
  end
end

//Write State Machine
always @ (posedge clk) begin
  if (rst || !linkup) begin
    write_state                   <=  IDLE;
    dma_send_data_stb             <=  0;
    enable_tl_data_ready          <=  0;
    dma_act_detected_en           <=  0;
  end
  else begin
    dma_send_data_stb             <=  0;

    if (t_dma_activate_stb) begin
      //Set an enable signal instead of a strobe so that there is no chance of missing this signal
      dma_act_detected_en         <=  1;
    end

    case (write_state)
      IDLE: begin
        enable_tl_data_ready      <=  0;
        if (idle) begin
          //The only way to transition to another state is if CL is IDLE
          //if (write_data_stb) begin
          if (dma_act_detected_en) begin
            //send a request to write data
            write_state           <= WAIT_FOR_DMA_ACT;
          end
        end
      end
      WAIT_FOR_DMA_ACT: begin
        if (dma_act_detected_en) begin
          dma_act_detected_en     <=  0;
          enable_tl_data_ready    <=  1;
          write_state             <=  WAIT_FOR_WRITE_DATA;
        end
      end
      WAIT_FOR_WRITE_DATA: begin
        if (if_read_activate) begin
          enable_tl_data_ready    <=  0;
          write_state             <=  SEND_DATA;
        end
      end
      SEND_DATA: begin
        if (transport_layer_ready) begin
          //Send the Data FIS
          dma_send_data_stb       <=  1;
          dma_act_detected_en     <=  0;
          write_state             <=  IDLE;
        end
      end
      default: begin
        write_state               <=  IDLE;
      end
    endcase


    //if (command_layer_reset || !reset_timeout) begin
    if (command_layer_reset) begin
      //Break out of the normal flow and return to IDLE
      write_state                 <=  IDLE;
    end
    if (t_d2h_reg_stb) begin
      //Whenever I read a register transfer from the device I need to go back to IDLE
      write_state                 <=  IDLE;
    end
    if (send_sync_escape) begin
      write_state                 <=  IDLE;
    end
  end
end

endmodule

