// This program was cloned from: https://github.com/mbattyani/sub-25-ns-nasdaq-itch-fpga-parser
// License: GNU General Public License v3.0

  reg clock;
  reg nreset;
  reg enable;
  reg command_out_tready;
  reg ethernet_input_tvalid;
  reg ethernet_input_tlast;
  reg [3:0] ethernet_input_tkeep;
  reg [31:0] ethernet_input_tdata;
  reg [31:0] fpga_time;
  wire command_out_tvalid;
  wire [296:0] command_out_tdata;
  wire ethernet_input_tready;
  reg [2:0] config_registers_wr_addr;
  reg config_registers_wr_en;
  reg [31:0] config_registers_wr_data;
  reg [2:0] config_registers_rd_addr;
  reg [31:0] config_registers_rd_data;

nasdaq_itch_parser nasdaq_itch_parser (
     .clock(clock),
     .nreset(nreset),
     .enable(enable),
     .command_out_tready(command_out_tready),
     .ethernet_input_tvalid(ethernet_input_tvalid),
     .ethernet_input_tlast(ethernet_input_tlast),
     .ethernet_input_tkeep(ethernet_input_tkeep),
     .ethernet_input_tdata(ethernet_input_tdata),
     .fpga_time(fpga_time),
     .command_out_tvalid(command_out_tvalid),
     .command_out_tdata(command_out_tdata),
     .ethernet_input_tready(ethernet_input_tready),
     .config_registers_wr_addr(config_registers_wr_addr),
     .config_registers_wr_en(config_registers_wr_en),
     .config_registers_wr_data(config_registers_wr_data),
     .config_registers_rd_addr(config_registers_rd_addr),
     .config_registers_rd_data(config_registers_rd_data));
