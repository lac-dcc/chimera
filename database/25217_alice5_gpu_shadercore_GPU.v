// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

module GPU
    #(parameter WORD_WIDTH=32, ADDRESS_WIDTH=16, SDRAM_ADDRESS_WIDTH=24)
(
    output wire reset_n,
    input wire clock,
    output wire run,

    output wire halted,
    output wire exception,
    output wire [23:0] exception_data,

    // 32-bit interface.
    input wire [31:0] h2f_value,
    output wire [31:0] f2h_value,

    // SDRAM interface
    output wire [SDRAM_ADDRESS_WIDTH-1:0] sdram_address /* verilator public */,
    input wire sdram_waitrequest /* verilator public */,
    input wire [WORD_WIDTH-1:0] sdram_readdata /* verilator public */,
    input wire sdram_readdatavalid /* verilator public */,
    output wire sdram_read /* verilator public */,
    output wire [WORD_WIDTH-1:0] sdram_writedata /* verilator public */,
    output wire sdram_write /* verilator public */,

    output wire mem_request,
    input wire mem_authorized
);

    // Instruction RAM write control
    wire [ADDRESS_WIDTH-1:0] inst_ram_address /* verilator public */;
    wire [WORD_WIDTH-1:0] inst_ram_write_data /* verilator public */;
    wire inst_ram_write /* verilator public */;

    // Inst RAM read out
    wire [WORD_WIDTH-1:0] inst_ram_out_data /* verilator public */;

    // Data RAM write control
    wire [ADDRESS_WIDTH-1:0] data_ram_address /* verilator public */;
    wire [WORD_WIDTH-1:0] data_ram_write_data /* verilator public */;
    wire data_ram_write /* verilator public */;

    // Data RAM read out
    wire [WORD_WIDTH-1:0] data_ram_out_data /* verilator public */;

    // Max 32K of INST RAM
    localparam INST_ADDRESS_WIDTH = 15;
    localparam INST_ADDRESS_ZERO_PAD = ADDRESS_WIDTH - INST_ADDRESS_WIDTH;
    BlockRam #(.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(INST_ADDRESS_WIDTH))
        instRam(
            .clock(clock),
            .write_address({{INST_ADDRESS_ZERO_PAD{1'b0}}, inst_ram_address[INST_ADDRESS_WIDTH-1:2]}),
            .write(inst_ram_write),
            .write_data(inst_ram_write_data),
            .read_address({{INST_ADDRESS_ZERO_PAD{1'b0}}, inst_ram_address[INST_ADDRESS_WIDTH-1:2]}),
            .read_data(inst_ram_out_data));

    // Max 8K of INST RAM
    localparam DATA_ADDRESS_WIDTH = 13;
    localparam DATA_ADDRESS_ZERO_PAD = ADDRESS_WIDTH - DATA_ADDRESS_WIDTH;
    BlockRam #(.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(DATA_ADDRESS_WIDTH))
        dataRam(
            .clock(clock),
            .write_address({{DATA_ADDRESS_ZERO_PAD{1'b0}}, data_ram_address[DATA_ADDRESS_WIDTH-1:2]}),
            .write(data_ram_write),
            .write_data(data_ram_write_data),
            .read_address({{DATA_ADDRESS_ZERO_PAD{1'b0}}, data_ram_address[DATA_ADDRESS_WIDTH-1:2]}),
            .read_data(data_ram_out_data));

    wire [ADDRESS_WIDTH-1:0] shadercore_inst_ram_address;
    wire [ADDRESS_WIDTH-1:0] shadercore_data_ram_address;
    wire [WORD_WIDTH-1:0] shadercore_data_ram_write_data;
    wire shadercore_enable_write_data_ram;

    wire enable_write_inst_ram;
    wire enable_write_data_ram;
    wire enable_read_inst_ram;
    wire enable_read_data_ram;
    wire enable_read_register;
    wire enable_read_floatreg;
    wire enable_read_special;

    wire [ADDRESS_WIDTH-1:0] rw_address;
    wire [WORD_WIDTH-1:0] write_data;

    wire [WORD_WIDTH-1:0] read_data =
        enable_read_inst_ram ? inst_ram_out_data :
        enable_read_data_ram ? data_ram_out_data :
        // XXX TODO register interface
        enable_read_register ? 32'hdeadbee1 :
        enable_read_floatreg ? 32'hdeadbee2 :
        /* enable_read_special ? */ 32'hdeadbee3;

    GPU32BitInterface #(.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(ADDRESS_WIDTH))
        gpu_if(
            .clock(clock),

            .h2f_value(h2f_value),
            .f2h_value(f2h_value),

            .reset_n(reset_n),
            .run(run),

            .halted(halted),
            .exception(exception),
            .exception_data(exception_data),

            .enable_write_inst_ram(enable_write_inst_ram),
            .enable_write_data_ram(enable_write_data_ram),
            .enable_read_inst_ram(enable_read_inst_ram),
            .enable_read_data_ram(enable_read_data_ram),
            .enable_read_register(enable_read_register),
            .enable_read_floatreg(enable_read_floatreg),
            .enable_read_special(enable_read_special),

            .rw_address(rw_address),
            .write_data(write_data),
            .read_data(read_data)
        );

    ShaderCore #(.WORD_WIDTH(WORD_WIDTH), .ADDRESS_WIDTH(ADDRESS_WIDTH), .SDRAM_ADDRESS_WIDTH(SDRAM_ADDRESS_WIDTH))
        shaderCore(
            .clock(clock),
            .reset_n(reset_n),
            .run(run),
            .halted(halted),
            .exception(exception),
            .inst_ram_address(shadercore_inst_ram_address),
            .data_ram_address(shadercore_data_ram_address),
            .data_ram_write_data(shadercore_data_ram_write_data),
            .data_ram_write(shadercore_enable_write_data_ram),
            .inst_ram_read_result(inst_ram_out_data),
            .data_ram_read_result(data_ram_out_data),
            .sdram_address(sdram_address),
            .sdram_waitrequest(sdram_waitrequest),
            .sdram_readdata(sdram_readdata),
            .sdram_readdatavalid(sdram_readdatavalid),
            .sdram_read(sdram_read),
            .sdram_writedata(sdram_writedata),
            .sdram_write(sdram_write),
            .mem_request(mem_request),
            .mem_authorized(mem_authorized)
            // XXX TODO register interface
            );

    assign inst_ram_write = !run ? enable_write_inst_ram : 1'b0;
    assign inst_ram_write_data = !run ? write_data : 32'b0;
    assign inst_ram_address = !run ? rw_address : shadercore_inst_ram_address;

    assign data_ram_write = !run ? enable_write_data_ram : shadercore_enable_write_data_ram;
    assign data_ram_write_data = !run ? write_data : shadercore_data_ram_write_data;
    assign data_ram_address = !run ? rw_address : shadercore_data_ram_address;

    assign exception_data = 0;

endmodule
