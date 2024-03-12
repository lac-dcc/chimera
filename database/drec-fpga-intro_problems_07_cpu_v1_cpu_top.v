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
