
`include "parameters.v"

module LVT_2w4r(
    input  wire            clock,

    input wire 	we0,
    input wire 	we1,
		
    input  wire `MEM_ADDR  write_addr_0,
    input  wire `MEM_ADDR  write_addr_1,

    input  wire `MEM_ADDR  read_addr_0,
    output reg  `LVT_ENTRY read_0,
    input  wire `MEM_ADDR  read_addr_1,
    output reg  `LVT_ENTRY read_1,
    input  wire `MEM_ADDR  read_addr_2,
    output reg  `LVT_ENTRY read_2,
    input  wire `MEM_ADDR  read_addr_3,
    output reg  `LVT_ENTRY read_3

);

reg `LVT_ENTRY live_value_table `LVT;

// No write conflict resolution, but this is where it would be added.
always @(posedge clock) begin
    if (we0)
      live_value_table[write_addr_0] <= `BANK_0;
    if (we1)
      live_value_table[write_addr_1] <= `BANK_1;
end

always @(posedge clock) begin
    read_0 <= live_value_table[read_addr_0];
    read_1 <= live_value_table[read_addr_1];
    read_2 <= live_value_table[read_addr_2];
    read_3 <= live_value_table[read_addr_3];
end

endmodule
