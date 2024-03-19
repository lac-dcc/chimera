module riscvProcDpathBTB
(
  input clk,
  input reset,

  input  [31:0] current_pc4,
  output        btb_hit,
  output [31:0] btb_target,

  input         wen,
  input  [31:0] correct_pc4,
  input  [31:0] correct_target
);

  wire val;
  wire [27:0] tag;
  wire [29:0] target;

  vcRAM_rst_1w1r_pf#(.DATA_SZ(1),.ENTRIES(4),.ADDR_SZ(2),.RESET_VALUE(0)) valid
  (
    .clk(clk),
    .reset_p(reset),
    .raddr(current_pc4[3:2]),
    .rdata(val),
    .wen_p(wen),
    .waddr_p(correct_pc4[3:2]),
    .wdata_p(1'b1)
  );

  vcRAM_1w1r_pf#(.DATA_SZ(28+30),.ENTRIES(4),.ADDR_SZ(2)) data
  (
    .clk(clk),
    .raddr(current_pc4[3:2]),
    .rdata({tag, target}),
    .wen_p(wen),
    .waddr_p(correct_pc4[3:2]),
    .wdata_p({correct_pc4[31:4], correct_target[31:2]})
  );

  assign btb_hit = val & (tag == current_pc4[31:4]);
  assign btb_target = {target, 2'd0};

endmodule
