// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0


module Main(
    input wire clock,
    input wire reset_n,

    input [31:0] h2f_value [0:CORE_COUNT-1],
    output [31:0] f2h_value [0:CORE_COUNT-1],

    output wire [29:0] sdram_address,
    input wire sdram_waitrequest,
    input wire [WORD_WIDTH-1:0] sdram_readdata,
    input wire sdram_readdatavalid,
    output wire sdram_read,
    output reg [WORD_WIDTH-1:0] sdram_writedata,
    output wire sdram_write
);

    localparam WORD_WIDTH = 32;
    localparam ADDRESS_WIDTH = 16;
    localparam SDRAM_ADDRESS_WIDTH = 24;
    localparam CORE_COUNT /* verilator public */ = 4;

    // wire cpu_reset_n;
    // wire run;
    // wire halted;
    // wire exception;
    // wire [23:0] exception_data;

    // Add offset and adjust for byte vs. word addressing.
    assign sdram_address = (sdram_gpu_address + 30'h3E000000) >> 2;
    reg [SDRAM_ADDRESS_WIDTH-1:0] sdram_gpu_address;

    generate
        genvar core;

        for (core = 0; core < CORE_COUNT; core++) begin
            GPU #(.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(ADDRESS_WIDTH))
                gpu(
                    .clock(clock),

                    // .reset_n(cpu_reset_n[core]),
                    // .run(run[core]),
                    // .halted(halted[core]),
                    // .exception(exception[core]),
                    // .exception_data(exception_data[core]),

                    .h2f_value(h2f_value[core]),
                    .f2h_value(f2h_value[core]),

                    .sdram_address(core_sdram_gpu_address[core]),
                    .sdram_waitrequest(sdram_waitrequest),
                    .sdram_readdata(sdram_readdata),
                    .sdram_readdatavalid(sdram_readdatavalid),
                    .sdram_read(core_sdram_read[core]),
                    .sdram_writedata(core_sdram_writedata[core]),
                    .sdram_write(core_sdram_write[core]),

                    .mem_request(mem_request[core]),
                    .mem_authorized(mem_authorized[core])
                    );
        end
    endgenerate

    // Wire-or the SDRAM outputs of the core.
    wire [SDRAM_ADDRESS_WIDTH-1:0] core_sdram_gpu_address [0:CORE_COUNT-1];
    wire [CORE_COUNT-1:0] core_sdram_read;
    wire [CORE_COUNT-1:0] core_sdram_write;
    wire [WORD_WIDTH-1:0] core_sdram_writedata [0:CORE_COUNT-1];

    assign sdram_read = |core_sdram_read;
    assign sdram_write = |core_sdram_write;

    always @(*) begin
        sdram_writedata = {WORD_WIDTH{1'b0}};
        sdram_gpu_address = {SDRAM_ADDRESS_WIDTH{1'b0}};

        for (core = 0; core < CORE_COUNT; core++) begin
            sdram_writedata = sdram_writedata | core_sdram_writedata[core];
            sdram_gpu_address = sdram_gpu_address | core_sdram_gpu_address[core];
        end
    end

    // Memory arbiter.
    wire [CORE_COUNT-1:0] mem_request;
    wire [CORE_COUNT-1:0] mem_authorized;
    MemArb #(.COUNT(CORE_COUNT)) memArb(
        .clock(clock),
        .reset_n(reset_n),
        .request(mem_request),
        .authorized(mem_authorized));

endmodule
