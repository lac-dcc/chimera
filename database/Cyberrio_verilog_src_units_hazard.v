// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module hazard (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    input reset,

    // from decode
    input valid_decode,
    input [4:0] rs1_address_decode,
    input [4:0] rs2_address_decode,
    input uses_rs1,
    input uses_rs2,
    input uses_csr,

    // from execute
    input valid_execute,
    input [4:0] rd_address_execute,
    input csr_write_execute,
        
    // from memory
    input valid_memory,
    input [4:0] rd_address_memory,
    input csr_write_memory,
    input branch_taken,
    input mret_memory,
    input load_store,
    input bypass_memory,

    // from writeback
    input valid_writeback,
    input csr_write_writeback,
    input mret_writeback,
    input wfi,
    input traped,

    // from busio
    input fetch_ready,
    input mem_ready,

    // to fetch
    output stall_fetch,
    output invalidate_fetch,

    // to decode
    output stall_decode,
    output invalidate_decode,

    // to execute
    output stall_execute,
    output invalidate_execute,

    // to memory
    output stall_memory,
    output invalidate_memory
);

assign stall_fetch = stall_decode || data_hazard;
assign stall_decode = stall_execute;
assign stall_execute = stall_memory
    || (!mem_ready && load_store)
    || (valid_memory && mret_memory);
assign stall_memory = wfi;

wire trap_invalidate = mret_writeback || traped;
wire branch_invalidate = branch_taken || trap_invalidate;

wire data_hazard = valid_decode && (
    (valid_execute && rd_address_execute != 0 && (
        uses_rs1 && rs1_address_decode == rd_address_execute
        || uses_rs2 && rs2_address_decode == rd_address_execute
    ))
    || (valid_memory && rd_address_memory != 0 && !bypass_memory && (
        uses_rs1 && rs1_address_decode == rd_address_memory
        || uses_rs2 && rs2_address_decode == rd_address_memory
    ))
    || uses_csr && (
        csr_write_execute && valid_execute
        || csr_write_memory && valid_memory
        || csr_write_writeback && valid_writeback
    ));

assign invalidate_fetch = reset || branch_invalidate || (!fetch_ready && !data_hazard);
assign invalidate_decode = reset || branch_invalidate || data_hazard;
assign invalidate_execute = reset || branch_invalidate;
assign invalidate_memory = reset || trap_invalidate || (!mem_ready && load_store);

endmodule
