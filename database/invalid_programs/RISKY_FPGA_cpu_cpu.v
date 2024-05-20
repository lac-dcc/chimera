// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../alu/alu_32.v"
`include "../regfile_controller/regfile_controller.v"
`include "../regfile/regfile.v"
`include "../pc_unit/pc_unit.v"
`include "../load_store_controller/load_store_controller.v"

module cpu (
  input [31:0] id,
  input [31:0] mrd,
  input irq,
  input clk,
  input reset,
  output [31:0] ia,
  output wr,
  output [31:0] data_out,
  output [31:0] addr_out,
  output [15:0] wr_mask
);

wire [31:0] reg_data_1_bus;
wire [31:0] reg_data_2_bus;
wire [31:0] pc_bus;
wire [31:0] data_bus;
wire [31:0] alu_data_bus;
wire [4:0] ra1_bus;
wire [4:0] ra2_bus;
wire [4:0] wa_bus;
wire werf_bus;
wire cmp_out_bus;

assign data_out = data_bus;
assign ia = pc_bus;

pc_unit pcu0 (
  .reg1_data(reg_data_1_bus),
  .inst(id),
  .ecall(),
  .cmp_in(cmp_out_bus),
  .clk(clk),
  .reset(reset),
  .pc(pc_bus),
  .pc_4()
);

regfile_controller rf_c (
  .id(id),
  .ra1(ra1_bus),
  .ra2(ra2_bus),
  .wa(wa_bus)
);

load_store_controller ls_c (
  .aluin(alu_data_bus),
  .mrdin(mrd),
  .inst(id),
  .reg1_data(reg_data_1_bus),
  .reg2_data(reg_data_2_bus),
  .pc(pc_bus),
  .w_out(data_bus),
  .addr_out(addr_out),
  .wr(wr),
  .werf(werf_bus),
  .wr_mask(wr_mask)
);

regfile rf0 (
  .clk(clk),
  .werf(werf_bus),
  .wa(wa_bus),
  .wd(data_bus),
  .ra_1(ra1_bus),
  .ra_2(ra2_bus),
  .rd_1(reg_data_1_bus),
  .rd_2(reg_data_2_bus)
);

alu_32 alu0 (
  .a(reg_data_1_bus),
  .b(reg_data_2_bus),
  .inst(id),
  .out(alu_data_bus),
  .z(),
  .v(),
  .n(),
  .cmp_out(cmp_out_bus)
);

endmodule
