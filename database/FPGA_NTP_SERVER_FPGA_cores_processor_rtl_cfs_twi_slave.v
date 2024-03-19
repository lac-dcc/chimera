`timescale 1 ps / 1 ps

`default_nettype none

module cfs_twi_slave #
  (
   parameter ADDR_WIDTH = 4,
   parameter DATA_WIDTH = 32
   )
  (
   input  wire                          clk_i,
   input  wire                          rstn_i,

   // host bus
   input  wire                          wren_i,
   input  wire                          rden_i,
   input  wire [ADDR_WIDTH-1:0]         addr_i,
   input  wire [DATA_WIDTH-1:0]         data_i,
   output wire [DATA_WIDTH-1:0]         data_o,
   output wire                          ack_o,

   // TWI bus
   input  wire                          twi_scl_i,
   input  wire                          twi_sda_i,
   output wire                          twi_scl_o,
   output wire                          twi_sda_o
   );

  // I2C Wishboe bus
  wire                  wb_reset;
  wire                  wb_cyc;
  wire                  wb_stb;
  wire                  wb_we;
  wire [32-1:0]         wb_addr;
  wire [32-1:0]         wb_data_w;
  wire [32/8-1:0]       wb_sel;
  wire                  wb_stall;
  wire                  wb_ack;
  wire [32-1:0]         wb_data_r;
  wire                  wb_err;

  reg sync_rstn, sync_rstn_fff;

  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i)
      { sync_rstn, sync_rstn_fff } = 2'b00;
    else
      { sync_rstn, sync_rstn_fff } = { sync_rstn_fff, 1'b1 };
  end

  i2c_slave_wbm #
    (
     .WB_DATA_WIDTH(32),
     .WB_ADDR_WIDTH(32)
     )
  i2c_slave_wbm_inst
    (
     .clk                       (clk_i),
     .rst                       (!sync_rstn),
     
     .enable                    (1),
     .device_address            (7'h43),
    
     .i2c_scl_i                 (twi_scl_i),
     .i2c_scl_o                 (twi_scl_o),
     .i2c_sda_i                 (twi_sda_i),
     .i2c_sda_o                 (twi_sda_o),
    
     // Wishbone bus
     .wb_cyc_o                  (wb_cyc),
     .wb_stb_o                  (wb_stb),
     .wb_we_o                   (wb_we),
     .wb_adr_o                  (wb_addr),
     .wb_dat_o                  (wb_data_w),
     .wb_sel_o                  (wb_sel),
     .wb_ack_i                  (wb_ack),
     .wb_dat_i                  (wb_data_r),
     .wb_err_i                  (wb_err)
     );

  mirror_wb_slave mirror_wb_slave_inst
    (
     .clk_i     (clk_i),
     .rstn_i    (sync_rstn),

     .wren_i    (wren_i),
     .rden_i    (rden_i),
     .addr_i    (addr_i),
     .data_i    (data_i),
     .data_o    (data_o),
     .ack_o     (ack_o),

     .wb_cyc_i  (wb_cyc),
     .wb_stb_i  (wb_stb),
     .wb_we_i   (wb_we),
     .wb_adr_i  (wb_addr),
     .wb_dat_i  (wb_data_w),
     .wb_sel_i  (wb_sel),
     .wb_dat_o  (wb_data_r),
     .wb_ack_o  (wb_ack),
     .wb_err_o  (wb_err)
     );

endmodule // cfs_twi_slave

`default_nettype wire
