
`include "parameters.v"

module MEM_1w1r(
    input  wire           clock,
    input  wire we,
    input  wire `MEM_ADDR write_addr,
    input  wire `WORD     write_data,
    input  wire `MEM_ADDR read_addr,
    output reg  `WORD     read_data
); 

reg `WORD memory `MEM;

  // DEBUG WIRES
  wire [31:0] fp = memory[0];
  wire [31:0] sp = memory[1];
  wire [31:0] r0 = memory[2];
  wire [31:0] r1 = memory[3];
  wire [31:0] r2 = memory[4];
  wire [31:0] r3 = memory[5];
  wire [31:0] r4 = memory[6];
  wire [31:0] r5 = memory[7];
  wire [31:0] r6 = memory[8];
  wire [31:0] r7 = memory[9];
  wire [31:0] r8 = memory[10];
  wire [31:0] r9 = memory[11];
  wire [31:0] r10 = memory[12];
  wire [31:0] r11 = memory[13];
  wire [31:0] r12 = memory[14];
  wire [31:0] r13 = memory[15];
  
always @(posedge clock) begin
   # 1 if (we)  
     memory[write_addr] <= write_data;
end

always @(posedge clock) begin
  read_data <= (we & (read_addr == write_addr)) ? write_data : memory[read_addr];
end

endmodule
