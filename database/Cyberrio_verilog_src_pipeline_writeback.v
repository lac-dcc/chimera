// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module writeback (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    /* input clk, */

    // from memory
    input [31:0] pc_in,
    input [31:0] next_pc_in,
    // from memory (control WB)
    input [31:0] alu_data_in,
    input [31:0] csr_data_in,
    input [31:0] load_data_in,
    input [1:0] write_select_in,
    input [4:0] rd_address_in,
    input [11:0] csr_address_in,
    input csr_write_in,
    input mret_in,
    input wfi_in,
    // from memory
    input valid_in,
    input [3:0] ecause_in,
    input exception_in,

    // from csr
    input sip,
    input tip,
    input eip,

    // to regfile
    output [4:0] rd_address,
    output reg [31:0] rd_data,

    // to csr
    output csr_write,
    output [11:0] csr_address,
    output [31:0] csr_data,

    // to fetch and csr and hazard
    output traped,
    output mret,

    // to hazard
    output wfi,

    // to csr
    output retired,
    output [31:0] ecp,
    output reg [3:0] ecause,
    output reg interupt
);

localparam WRITE_SEL_ALU     = 2'b00;
localparam WRITE_SEL_CSR     = 2'b01;
localparam WRITE_SEL_LOAD    = 2'b10;
localparam WRITE_SEL_NEXT_PC = 2'b11;

wire exception = exception_in && valid_in;

assign traped = (sip || tip || eip || exception);
assign ecp = wfi_in ? next_pc_in : pc_in;
assign wfi = valid_in && wfi_in;

assign retired = valid_in && !traped && !wfi;

assign mret = valid_in && mret_in;

always @(*) begin
    if (eip) begin
        ecause = 11;
        interupt = 1;
    end else if (tip) begin
        ecause = 7;
        interupt = 1;
    end else if (sip) begin
        ecause = 3;
        interupt = 1;
    end else if (exception_in) begin
        ecause = ecause_in;
        interupt = 0;
    end else begin
        ecause = 0;
        interupt = 0;
    end
end

assign rd_address = (!valid_in || traped) ? 5'h0 : rd_address_in;

always @(*) begin
    case (write_select_in)
        WRITE_SEL_ALU: rd_data = alu_data_in;
        WRITE_SEL_CSR: rd_data = csr_data_in;
        WRITE_SEL_LOAD: rd_data = load_data_in;
        WRITE_SEL_NEXT_PC: rd_data = next_pc_in;
    endcase
end

assign csr_write = valid_in && !traped && csr_write_in;
assign csr_address = csr_address_in;
assign csr_data = alu_data_in;

endmodule
