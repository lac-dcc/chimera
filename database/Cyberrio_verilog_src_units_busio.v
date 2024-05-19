// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module busio (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    /* input clk, */
    
    // External interface
    output ext_valid,
    output ext_instruction,
    input ext_ready,
    output [31:0] ext_address,
    output [31:0] ext_write_data,
    output reg [3:0] ext_write_strobe,
    input [31:0] ext_read_data,

    // Internal interface
    input [31:0] fetch_address,
    output [31:0] fetch_data,
    output fetch_ready,

    output reg [31:0] mem_load_data,
    output mem_ready,
    input [31:0] mem_address,
    input [31:0] mem_store_data,
    input [1:0] mem_size,
    input mem_signed,
    input mem_load,
    input mem_store
);



// Compute ext_valid
assign ext_valid = 1;

// Compute ext_instruction
assign ext_instruction = mem_load || mem_store ? 0 : 1;
// Compute ext_address using a continuous assignment

assign ext_address = (mem_load || mem_store) ? (mem_address & 32'hffff_fffc) : (fetch_address & 32'hffff_fffc);

// Compute ext_write_data using a continuous assignment
assign ext_write_data = mem_store ? (mem_store_data << (8 * mem_address[1:0])) : 0;

always @(*) begin
    if (!mem_store)
        ext_write_strobe = 4'b0000;
    else if (mem_size == 2'b00)
        ext_write_strobe = 4'b0001 << mem_address[1:0];
    else if (mem_size == 2'b01)
        ext_write_strobe = 4'b0011 << mem_address[1:0];
    else if (mem_size == 2'b10)
        ext_write_strobe = 4'b1111;
    else
        ext_write_strobe = 4'b0000;
end
// Fetch and memory interface ready signals
assign fetch_ready = ext_ready && ext_instruction;
assign mem_ready = ext_ready && !ext_instruction;

// Fetch data
assign fetch_data = ext_read_data;

// Compute mem_load_data
wire [31:0] tmp_load_data = ext_read_data >> (8 * mem_address[1:0]);

always @(*) begin
    if (mem_size == 2'b00) 
        mem_load_data = mem_signed && tmp_load_data[7] ? {{24{tmp_load_data[7]}}, tmp_load_data[7:0]} : {24'b0, tmp_load_data[7:0]};
    else if (mem_size == 2'b01) 
        mem_load_data = mem_signed && tmp_load_data[15] ? {{16{tmp_load_data[15]}}, tmp_load_data[15:0]} : {16'b0, tmp_load_data[15:0]};
    else if (mem_size == 2'b10)
        mem_load_data = tmp_load_data;
    else
        mem_load_data = 32'b0;
end

endmodule
