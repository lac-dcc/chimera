// This program was cloned from: https://github.com/tioluwanimofe/cpu_verilog
// License: MIT License

module inst_rom (PC_addr, instruction);
input [7:0] PC_addr;
output [31:0] instruction;


reg [31:0] rom_array [0:31];



initial
begin
  rom_array[0] = 32'h00000000;
  rom_array[1] = 32'h00010001;
  rom_array[2] = 32'h02000001;
  rom_array[3] = 32'h02010001;
  rom_array[4] = 32'h02000001;
  rom_array[5] = 32'h02010001;
  rom_array[6] = 32'h02000001;
  rom_array[7] = 32'h02010001;
  rom_array[8] = 32'h02000001;
  rom_array[9] = 32'h02010001;
  rom_array[10] = 32'h02000001;
  rom_array[11] = 32'h02010001;
  rom_array[12] = 32'h02000001;
  rom_array[13] = 32'h02010001;
  rom_array[14] = 32'h02000001;
  rom_array[15] = 32'h02010001;
  rom_array[16] = 32'h02000001;
  rom_array[17] = 32'h02010001;
  rom_array[18] = 32'h02000001;
  rom_array[19] = 32'h02010001;
  rom_array[20] = 32'h02000001;
  rom_array[21] = 32'h02010001;
  rom_array[22] = 32'h02000001;
  rom_array[23] = 32'h02010001;
  rom_array[24] = 32'h02000001;
  rom_array[25] = 32'h02010001;
  rom_array[26] = 32'h02000001;
  rom_array[27] = 32'h02010001;
  rom_array[28] = 32'h081C0001;
  rom_array[29] = 32'h00000000;
  rom_array[30] = 32'h00000000;
  rom_array[31] = 32'h00000000;
end

assign instruction = rom_array[PC_addr[4:0]];
endmodule
