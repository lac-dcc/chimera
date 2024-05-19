// This program was cloned from: https://github.com/Cosmos-OpenSSD/Cosmos-OpenSSD
// License: GNU General Public License v3.0

`include "p_parameter.vh"

module performance_monitor_top
(
  input  wire                          Bus2IP_Clk,
  input  wire                          Bus2IP_Resetn,
  input  wire   [`SLV_DATA_WD-1:0]     Bus2IP_Addr,
  input  wire                          Bus2IP_RNW,
  input  wire   [`SLV_DATA_WD-1:0]     Bus2IP_Data,
  input  wire   [`SLV_DATA_WD/8-1 : 0] Bus2IP_BE,
  input  wire   [0:0]                  Bus2IP_RdCE,
  input  wire   [0:0]                  Bus2IP_WrCE,
  output wire   [`SLV_ADDR_WD-1:0]     IP2Bus_Data,
  output wire                          IP2Bus_RdAck,
  output wire                          IP2Bus_WrAck,
  output wire                          IP2Bus_Error,
  
  //from channel controller
  input  wire   [`WAY-1:0]             i_prog_start ,
  input  wire   [`WAY-1:0]             i_prog_end   ,
  input  wire   [`WAY-1:0]             i_read_start ,
  input  wire   [`WAY-1:0]             i_read_end   ,
  input  wire   [`WAY-1:0]             i_erase_start,
  input  wire   [`WAY-1:0]             i_erase_end  ,
  input  wire   [`WAY-1:0]             i_op_fail
);

  wire                       w_slv_read_ack;
  wire                       w_slv_write_ack;

  assign IP2Bus_WrAck = w_slv_write_ack;
  assign IP2Bus_RdAck = w_slv_read_ack;
  assign IP2Bus_Error = 0;
  
  performance_monitor_reg performance_monitor_reg0(
  .i_bus_clk      (Bus2IP_Clk)     ,
  .i_bus_rstn     (Bus2IP_Resetn)  ,
  .i_slv_data     (Bus2IP_Data)    ,
  .o_slv_data     (IP2Bus_Data)    ,
  .i_slv_addr     (Bus2IP_Addr)    ,
  .i_slv_rnw      (Bus2IP_RNW)     ,
  .o_slv_write_ack(w_slv_write_ack),
  .o_slv_read_ack (w_slv_read_ack) ,
  .i_slv_wr_ack   (|{Bus2IP_WrCE}) ,
  .i_slv_rd_ack   (|{Bus2IP_RdCE}) ,
  .i_prog_start   (i_prog_start)   ,
  .i_prog_end     (i_prog_end)     ,
  .i_read_start   (i_read_start)   ,
  .i_read_end     (i_read_end)     ,
  .i_erase_start  (i_erase_start)  ,
  .i_erase_end    (i_erase_end)    ,
  .i_op_fail      (i_op_fail)
  );

endmodule
