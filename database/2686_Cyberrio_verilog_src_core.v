// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module core #(
    parameter RESET_VECTOR = 32'h8000_0000
) (

`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    input clk,
    input reset,

    input meip,

    // Memory interface
    output ext_valid,
    output ext_instruction,
    input ext_ready,
    output [31:0] ext_address,
    output [31:0] ext_write_data,
    output [3:0] ext_write_strobe,
    input [31:0] ext_read_data
);

pipeline #(
    .RESET_VECTOR(RESET_VECTOR)
) core_pipeline (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),
    .reset(reset),

    .meip(meip),

    .fetch_data(fetch_data),
    .mem_load_data(mem_load_data),
    .fetch_ready(fetch_ready),
    .mem_ready(mem_ready),

    .fetch_address(fetch_address),
    .mem_address(mem_address),
    .mem_store_data(mem_store_data),
    .mem_size(mem_size),
    .mem_signed(mem_signed),
    .mem_load(mem_load),
    .mem_store(mem_store)
);

wire [31:0] fetch_data;
wire [31:0] fetch_address;
wire fetch_ready;

wire [31:0] mem_load_data;
wire [31:0] mem_address;
wire [31:0] mem_store_data;
wire [1:0] mem_size;
wire mem_signed;
wire mem_load;
wire mem_store;
wire mem_ready;

busio core_busio (
    /* .clk(clk), */
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .ext_valid(ext_valid),
    .ext_instruction(ext_instruction),
    .ext_ready(ext_ready),
    .ext_address(ext_address),
    .ext_write_data(ext_write_data),
    .ext_write_strobe(ext_write_strobe),
    .ext_read_data(ext_read_data),

    .fetch_address(fetch_address),
    .fetch_data(fetch_data),
    .fetch_ready(fetch_ready),

    .mem_load_data(mem_load_data),
    .mem_ready(mem_ready),
    .mem_address(mem_address),
    .mem_store_data(mem_store_data),
    .mem_size(mem_size),
    .mem_signed(mem_signed),
    .mem_load(mem_load),
    .mem_store(mem_store)
);

endmodule
