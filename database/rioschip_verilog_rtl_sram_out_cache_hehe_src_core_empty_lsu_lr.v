// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

/////////////////////////
// Author: Peichen Guo //
//    RIOS Lab work    //
//      HeHe Core      //
/////////////////////////
// lsu router
`ifndef LR_V
`define LR_V
`include "params.vh"
// dcache piority weights less than bus 
module lr(
    input clk, 
    input rstn, 
    input flush,
    // <> lsq
    output lsq_req_ready_o,
    input lsq_req_valid_i,
    input lsq_req_opcode_i, // 0 for load, 1 for store
    input lsq_req_sign_i,
    input [1:0] lsq_req_size_i, 
    input [VIRTUAL_ADDR_LEN - 1 : 0] lsq_req_addr_i,
    input [XLEN - 1 : 0] lsq_req_data_i,
    input [LSU_LSQ_SIZE_WIDTH - 1: 0] lsq_req_lsq_index_i,

    output lsq_resp_valid_o,
    output [LSU_LSQ_SIZE_WIDTH - 1: 0] lsq_resp_lsq_index_o,
    output [XLEN - 1 : 0]lsq_resp_data_o,
    input lsq_resp_ready_i,
    // <> dcache
    input dcache_req_ready_i,
    output dcache_req_valid_o,
    output dcache_req_opcode_o, // 0 for load, 1 for store
    output dcache_req_sign_o,
    output [1:0] dcache_req_size_o, 
    output [VIRTUAL_ADDR_LEN - 1 : 0] dcache_req_addr_o,
    output [XLEN - 1 : 0] dcache_req_data_o,
    output [LSU_LSQ_SIZE_WIDTH - 1: 0] dcache_req_lsq_index_o,

    input dcache_resp_valid_i,
    input [LSU_LSQ_SIZE_WIDTH - 1: 0] dcache_resp_lsq_index_i,
    input [XLEN - 1 : 0] dcache_resp_data_i,
    output dcache_resp_ready_o,


    // <> bus
    output wb_cyc_o,
    output wb_stb_o,
    output wb_we_o,
    output [VIRTUAL_ADDR_LEN - 1 : 0] wb_adr_o,
    output [WB_DATA_LEN-1:0] wb_dat_o,
    output [WB_DATA_LEN/8-1:0] wb_sel_o,
    input  wb_ack_i,
    input  [WB_DATA_LEN -1:0] wb_dat_i

);    

wire map_to_bus = (BUS_MAP_ADDR_LOWER <= lsq_req_addr_i && lsq_req_addr_i < BUS_MAP_ADDR_UPPER);
// wire map_to_bus = 0;

assign lsq_req_ready_o = map_to_bus? ~bus_lock : dcache_req_ready_i;

assign dcache_req_valid_o = ~map_to_bus & lsq_req_valid_i;
assign dcache_req_opcode_o = lsq_req_opcode_i;
assign dcache_req_sign_o = lsq_req_sign_i;
assign dcache_req_size_o = lsq_req_size_i;
assign dcache_req_addr_o = lsq_req_addr_i;
assign dcache_req_data_o = lsq_req_data_i;
assign dcache_req_lsq_index_o = lsq_req_lsq_index_i;

assign wb_cyc_o = map_to_bus & lsq_req_valid_i | bus_lock;
assign wb_stb_o = wb_cyc_o; // FIXME: risky assign 
assign wb_we_o = bus_lock ? wb_opcode_save : lsq_req_opcode_i;
assign wb_adr_o = bus_lock ? wb_addr_save : lsq_req_addr_i;
assign wb_dat_o = bus_lock ? wb_data_save : lsq_req_data_i[WB_DATA_LEN -1:0];
assign wb_sel_o = bus_lock ? wb_mask_save : wb_mask32;

wire[WB_DATA_LEN/8-1:0] wb_mask32 = lsq_req_size_i == 0 ? (4'h1 << lsq_req_addr_i[1:0]) :
                 lsq_req_size_i == 1 ? (4'h3 << lsq_req_addr_i[1:0]) :
                 lsq_req_size_i == 2 ? (4'hf << lsq_req_addr_i[1:0]) :
                 4'b0; // wb mask is 32 bit, so size_i < 3
wire wb_resp_valid = wb_ack_i & ~wb_opcode_save; // load and ack

assign lsq_resp_valid_o = wb_resp_valid | dcache_resp_valid_i;
assign lsq_resp_lsq_index_o = wb_resp_valid ? wb_lsq_index_save : dcache_resp_lsq_index_i;
assign lsq_resp_data_o = wb_resp_valid ? {32'b0, wb_dat_i} : dcache_resp_data_i;

assign dcache_resp_ready_o = ~wb_resp_valid & lsq_resp_ready_i;

reg bus_lock;
reg [LSU_LSQ_SIZE_WIDTH - 1: 0] wb_lsq_index_save;
reg [VIRTUAL_ADDR_LEN - 1 : 0] wb_addr_save;
reg [WB_DATA_LEN-1:0] wb_data_save;
reg [WB_DATA_LEN/8-1:0] wb_mask_save;
reg wb_opcode_save;

always @(posedge clk) begin
    if(rstn | flush) begin
        bus_lock <= '0;
        wb_lsq_index_save <= '0;
        wb_addr_save <= '0;
        wb_data_save <= '0;
        wb_mask_save <= '0;
        wb_opcode_save <= '0;
    end
    else begin
        if(map_to_bus) begin
            bus_lock <= '1;
            wb_lsq_index_save <= lsq_req_lsq_index_i;
            wb_addr_save <= lsq_req_addr_i;
            wb_data_save <= lsq_req_data_i[WB_DATA_LEN -1:0];
            wb_mask_save <= wb_mask32;
            wb_opcode_save <= lsq_req_opcode_i;
        end 

        if(wb_ack_i) begin
            bus_lock <= '0;
        end 
        // TODO: unlock bus
    end
end

endmodule

`endif // LR_V
