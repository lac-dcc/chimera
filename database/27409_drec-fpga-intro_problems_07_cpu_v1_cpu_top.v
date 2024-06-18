// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module cpu_top(
    input clk
);

wire [31:0]instr_addr;
wire [31:0]instr_data;
rom rom(.clk(clk), .addr(/* Problem 5 */), .q(/* Problem 5 */));

core core(
    .clk(clk),
    .instr_data(/* Problem 5 */), .last_pc(32'h7),
    .instr_addr(/* Problem 5 */)
);

endmodule
// This program was cloned from: https://github.com/alexpaniman/drec-fpga-intro
// License: GNU General Public License v2.0

module cpu_top(
    input clk
);

wire [31:0]instr_addr;
wire [31:0]instr_data;
rom rom(.clk(clk), .addr(instr_addr), .q(instr_data));

core core(
    .clk(clk),
    .instr_data(instr_data), .last_pc(32'h7),
    .instr_addr(instr_addr)
);

endmodule
