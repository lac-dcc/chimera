// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module alu_32_tb();

localparam WIDTH = 32;
localparam DURATION = 100000;

reg [WIDTH-1:0] reg1;
reg [WIDTH-1:0] reg2;
reg [WIDTH-1:0] inst;
reg [WIDTH-1:0] ans;

wire z_out;
wire v_out;
wire n_out;
wire cmp_out;
wire [WIDTH-1:0] result;

alu_32 #(.WIDTH(32)) alu0 (
  .a(reg1),
  .b(reg2),
  .inst(inst),
  .out(result),
  .z(z_out),
  .v(v_out),
  .n(n_out),
  .cmp_out(cmp_out)
);

initial begin
  // check branch
  // BEQ
  inst = 32'b0100_0000_0000_0000_0000_0000_0110_0011;
  // BEQ True
  reg1 = 'h0101_FFFF;
  reg2 = 'h0101_FFFF;
  ans = reg1 == reg2;
  #10
  // BEQ False
  reg1 = 'h0A32_FFFF;
  reg2 = 'h0476_FFFF;
  ans = reg1 == reg2;
  #10
  // BNE
  inst = 32'b0100_0000_0000_0000_0001_0000_0110_0011;
  // BNE True
  reg1 = 'h0A32_FFFF;
  reg2 = 'h0476_FFFF;
  ans = reg1 != reg2;
  #10
  // BNE False
  reg1 = 'h0101_FFFF;
  reg2 = 'h0101_FFFF;
  ans = reg1 != reg2;
  #10
  // BLT
  inst = 32'b0100_0000_0000_0000_0100_0000_0110_0011;
  // BLT True
  reg1 = 'h0000_0001;
  reg2 = 'h0000_0002;
  ans = reg1 < reg2;
  #10
  // BLT False
  reg2 = 'h0000_0001;
  reg1 = 'h0000_0002;
  ans = reg1 < reg2;
  #10
  // BGE
  inst = 32'b0100_0000_0000_0000_0101_0000_0110_0011;
  // BGE True
  reg2 = 'h0000_0001;
  reg1 = 'h0000_0002;
  ans = reg1 > reg2;
  #10
  // BGE False
  reg1 = 'h0000_0001;
  reg2 = 'h0000_0002;
  ans = reg1 > reg2;
  #10
  // BLTU
  inst = 32'b0100_0000_0000_0000_0110_0000_0110_0011;
  // BLTU True
  reg1 = 'hFFFF_FFF0;
  reg2 = 'hFFFF_FFF1;
  ans = reg1 < reg2;
  #10
  // BLTU False
  reg1 = 'hFFFF_FFF1;
  reg2 = 'hFFFF_FFF0;
  ans = reg1 < reg2;
  #10
  // BGEU
  inst = 32'b0100_0000_0000_0000_0111_0000_0110_0011;
  // BGEU True
  reg1 = 'hFFFF_FFF1;
  reg2 = 'hFFFF_FFF0;
  ans = reg1 > reg2;
  #10
  // BGEU False
  reg1 = 'hFFFF_FFF0;
  reg2 = 'hFFFF_FFF1;
  ans = reg1 > reg2;
  #10
  // add checks
  inst = 32'b0000_0000_0000_0000_0000_0000_0011_0011;
  // two positive numbers
  reg1 = 'h0101_FFFF; 
  reg2 = 'h0011_FFFF;
  ans = reg1 + reg2;
  #10;
  // zero addition
  reg1 = 0; 
  reg2 = 'h7FFF_FFFF;
  ans = reg1 + reg2;
  #10;
  reg1 = 'h7FFF_FFFF;
  reg2 = 0;
  ans = reg1 + reg2;
  #10;
  // boundary values
  reg1 = 'h7FFF_FFFF; 
  reg2 = 'h7FFF_FFFF;
  ans = reg1 + reg2;
  #10;
  // Check SUB 0x01
  inst = 32'b0100_0000_0000_0000_0000_0000_0011_0011;
  // zero subtraction
  reg1 = 0; 
  reg2 = 'h0101_FFFF;
  ans = reg1 - reg2;
  #10;
  reg1 = 'h0101_FFFF;
  reg2 = 0;
  ans = reg1 - reg2;
  #10;
  // underflow check
  reg1 = 'h7FFF_FFFF; 
  reg2 = 'h0A32_FFFF;
  ans = reg1 - reg2;
  #10;
  // boundary values
  reg1 = 0; 
  reg2 = 'h7FFF_FFFF;
  ans = reg1 - reg2;
  #10;
  // Check multiplication
  inst = 32'b0000_0010_0000_0000_0000_0000_0011_0011;
  // mult by zero
  reg1 = 0; 
  reg2 = 0;
  ans = reg1 * reg2;
  #10;
  // mult by 1
  reg1 = 1;
  reg2 = 'h3321_FFFF;
  ans = reg1 * reg2;
  #10;
  reg1 = 'h3321_FFFF;
  reg2 = 'h0476_FFFF;
  ans = reg1 * reg2;
  #10;
  // check mulhu
  inst = 32'b0000_0010_0000_0000_0011_0000_0011_0011;
  reg1 = 'h3321_FFFF;
  reg2 = 'h0476_FFFF;
  #10;
  // Check AND
  inst = 32'b0000_0000_0000_0000_0111_0000_0011_0011;
  // zeroes and ones
  reg1 = 'h1234_FFFF;
  reg2 = 0;
  ans = reg1 & reg2;
  #10;
  reg1 = 'h1234_FFFF;
  reg2 = 'hFFFF_FFFF;
  ans = reg1 & reg2;
  #10;
  // Identity check
  reg1 = 'h1234_FFFF;
  reg2 = 'h1234_FFFF;
  ans = reg1 & reg2;
  #10;
  // Complmeent check
  reg1 = 'h1234_FFFF;
  reg2 = ~reg1;
  ans = reg1 & reg2;
  #10;
  // Check OR
  inst = 32'b0000_0000_0000_0000_0110_0000_0011_0011;
  // zeroes and ones
  reg1 = 'h1234_FFFF;
  reg2 = 0;
  ans = reg1 | reg2;
  #10;
  reg1 = 'h1234_FFFF;
  reg2 = 'hFFFF_FFFF;
  ans = reg1 | reg2;
  #10;
  // identity check
  reg1 = 'h1234_FFFF;
  reg2 = 'h1234_FFFF;
  ans = reg1 | reg2;
  #10;
  // Check XOR
  inst = 32'b0000_0000_0000_0000_0100_0000_0011_0011;
  // identity check
  reg1 = 'hABCD_4321;
  reg2 = 0;
  ans = reg1 ^ reg2;
  #10;
  reg1 = 'hABCD_4321;
  reg2 = 'hABCD_4321;
  ans = reg1 ^ reg2;
  #10;
  // check SLL
  inst = 32'b0000_0000_0000_0000_0001_0000_0011_0011;
  // shift by zero
  reg1 = 'h0871_abcd;
  reg2 = 0;
  ans = reg1 << reg2;
  #10;
  // max shift
  reg1 = 'h0871_abcd;
  reg2 = 'h0000_000F;
  ans = reg1 << reg2;
  #10;
  // boundary case
  reg1 = 'hFFFF_FFFF;
  reg2 = 'h0000_000A;
  ans = reg1 << reg2;
  #10;
  // check SRL
  inst = 32'b0000_0000_0000_0000_0101_0000_0011_0011;
  // max shift
  reg1 = 'h0871_abcd;
  reg2 = 'h0000_000F;
  ans = reg1 >> reg2;
  #10;
  // boundary case
  reg1 = 'hFFFF_FFFF;
  reg2 = 'h0000_000A;
  ans = reg1 >> reg2;
  #10;
  // Check SRA
  inst = 32'b0100_0000_0000_0000_0101_0000_0011_0011;
  reg1 = 'hFFFF_FFFF;
  reg2 = 'h0000_000A;
  #10;
  // check SLT
  inst = 32'b0000_0000_0000_0000_0010_0000_0011_0011;
  // less than is true
  reg1 = 'h0871_abcd;
  reg2 = 'h0A71_abcd;
  ans = reg1 < reg2;
  #10;
  // less that is false;
  reg1 = 'h0A71_abcd;
  reg2 = 'h0871_abcd;
  ans = reg1 < reg2;
  #50;
  // immediate checks
  // ADDI check
  inst = 32'b0001_0010_1000_0000_0000_0000_0001_0011;
  // two positive numbers
  reg1 = 'h0101_FFFF; 
  reg2 = 'h0011_FFFF;
  ans = reg1 + 12'b0001_0010_1000;
  #10;
  // check SLTI
  inst = 32'b0010_0010_0100_0000_0010_0000_0001_0011;
  // less than is true
  reg1 = 'h0871_abcd;
  reg2 = 'h0A71_abcd;
  ans = reg1 < 12'b0010_0010_0100;
  #10;
  // check XORI
  inst = 32'b0100_0100_1100_0000_0100_0000_0001_0011;
  reg1 = 'hABCD_4321;
  reg2 = 'hABCD_4321;
  ans = reg1 ^ 12'b0100_0100_1100;
  #10;
  // Check ORI
  inst = 32'b0100_0100_1100_0000_0110_0000_0001_0011;
  reg1 = 'h1234_FFFF;
  reg2 = 'hFFFF_FFFF;
  ans = reg1 | 12'b0100_0100_1100;
  // Check ANDI
  inst = 32'b0100_0100_1100_0000_0111_0000_0001_0011;
  reg1 = 'h1234_FFFF;
  reg2 = 'hFFFF_FFFF;
  ans = reg1 & 12'b0100_0100_1100;
  #10;
  // Check SLLI
  inst = 32'b0000_0000_0011_0000_0001_0000_0001_0011;
  reg1 = 'h0871_abcd;
  reg2 = 0;
  ans = reg1 << 12'b0000_0000_0011;
  // Check SRLI
  inst = 32'b0000_0000_0011_0000_0101_0000_0001_0011;
  reg1 = 'h0871_abcd;
  reg2 = 0;
  ans = reg1 >> 12'b0000_0000_0011;
  // Check SRAI
  inst = 32'b0100_0000_0011_0000_0101_0000_0001_0011;
  reg1 = 'hF871_abcd;
  reg2 = 0;
  ans = reg1 >> 12'b0000_0000_0011;

end

initial begin
  $dumpfile("alu_32_tb.vcd");
  $dumpvars(0, alu_32_tb);
  // Wait for given amount of time for simulation to complete
  #(DURATION)
  // Notify and end simulation
  $display("Finished!");
  $finish;
end

endmodule
