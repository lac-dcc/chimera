// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module regfile #(
  parameter DATAWIDTH = 32,
  parameter REGISTERS = 32,
  parameter INDEX = $clog2(REGISTERS)
) (
  input clk,
  input werf,
  input [INDEX-1:0] wa,
  input [DATAWIDTH-1:0] wd,
  input [INDEX-1:0] ra_1,
  input [INDEX-1:0] ra_2,
  output [DATAWIDTH-1:0] rd_1,
  output [DATAWIDTH-1:0] rd_2
);

reg [DATAWIDTH-1:0] regs [REGISTERS-1:0];

initial regs[0] = 0;

always @(posedge clk) begin
  if (werf) begin
    if (wa == 0) regs[wa] <= 0;
    else regs[wa] <= wd;
  end
end

assign rd_1 = regs[ra_1];
assign rd_2 = regs[ra_2];

endmodule
