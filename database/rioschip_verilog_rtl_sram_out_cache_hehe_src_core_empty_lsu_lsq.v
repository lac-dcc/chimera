// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

/////////////////////////
// Author: Peichen Guo //
//    RIOS Lab work    //
//      HeHe Core      //
/////////////////////////
`ifndef LSQ_V
`define LSQ_V

`include "../params.vh"

module lsq (
    // global input 
    input clk,
    input rstn,
    input flush,
    // <> s0 
    input [VIRTUAL_ADDR_LEN - 1 : 0] address_i,
    input [ROB_INDEX_WIDTH - 1 : 0] rob_index_i,
    input [XLEN - 1 : 0] rs2_data_i,
    input opcode_i,
    input [1:0] size_i,
    input load_sign_i,
    input valid_i,
    input [PHY_REG_ADDR_WIDTH - 1 : 0] rd_addr_i,
    input [EXCEPTION_CODE_WIDTH - 1 : 0] ecause_i,
    input exception_valid_i,

    // <> rob 
    output load_data_valid_o,
    output [XLEN - 1 : 0] load_data_o,
    output [PHY_REG_ADDR_WIDTH - 1 : 0] rd_addr_o,
    output [ROB_INDEX_WIDTH - 1 : 0] rob_index_o,
    output ls_done_o,
    output lsu_ready_o,
    output exception_valid_o,
    output [EXCEPTION_CODE_WIDTH - 1 : 0] ecause_o,
    // lsu <> dcache
    input req_ready_i,
    output req_valid_o,
    output req_opcode_o, // 0 for load, 1 for store
    output req_sign_o,
    output [1:0] req_size_o, 
    output [VIRTUAL_ADDR_LEN - 1 : 0] req_addr_o,
    output [XLEN - 1 : 0] req_data_o,
    // output [ROB_INDEX_WIDTH - 1 : 0] req_rob_index_o,
    output [LSU_LSQ_SIZE_WIDTH - 1: 0] req_lsq_index_o,

    input resp_valid_i,
    input [LSU_LSQ_SIZE_WIDTH - 1: 0] resp_lsq_index_i,
    input [XLEN - 1 : 0]resp_data_i,
    output resp_ready_o
);

reg [LSU_LOAD_QUEUE_ENTRY_WIDTH - 1 : 0]  load_store_queue[LSU_LSQ_SIZE -1 : 0];
reg [XLEN - 1 : 0] store_data_queue[LSU_LSQ_SIZE -1 : 0];
reg [XLEN - 1 : 0] load_data_queue[LSU_LSQ_SIZE -1 : 0];
wire [LSU_LSQ_SIZE_WIDTH - 1 : 0] head;
wire [LSU_LSQ_SIZE_WIDTH - 1 : 0] tail;
wire [LSU_LSQ_SIZE_WIDTH - 1 : 0] req_pt;
wire rob_in_ready = ~load_store_queue[tail][0]; // tail entry can write
wire enque = rob_in_ready & valid_i;
wire resp_bypass = (resp_valid_i & (resp_lsq_index_i == head));
// FIXME: 这里时序非常差 verilator里需要半个周期来setup
wire rob_out_valid = (load_store_queue[head][0] & load_store_queue[head][1]) | // valid & done
                        resp_bypass; // correct resp
wire deque = rob_out_valid ; // done and 
wire req_valid = load_store_queue[req_pt][0] & ~load_store_queue[req_pt][2] & 
                ~load_store_queue[req_pt][3]; // valid & ~send & ~exception
wire req_send = req_valid & req_ready_i;
wire resp_ready = 1; // FIXME: 不知道啥时候不会是1 
wire resp_accept = resp_ready & resp_valid_i;
wire [LSU_LOAD_QUEUE_ENTRY_WIDTH - 1 : 0] load_entry_in;
assign load_entry_in =
//          {  51 : 20    19 : 18      17 : 12    11 : 10     9        8
            {address_i, rob_index_i, rd_addr_i, size_i, load_sign_i, opcode_i,
             //  7:4         3                2(send)            1(done)         0(valid) 
              ecause_i, exception_valid_i, exception_valid_i,  exception_valid_i, valid_i};
assign req_valid_o = req_valid;
assign req_opcode_o = load_store_queue[req_pt][8];
assign req_sign_o = load_store_queue[req_pt][9];
assign req_size_o = load_store_queue[req_pt][11:10];
// assign req_rob_index_o = load_store_queue[req_pt][20:18];
assign req_addr_o = load_store_queue[req_pt][51:20];
assign req_data_o = store_data_queue[req_pt];
assign req_lsq_index_o = req_pt;

assign resp_ready_o = resp_ready;
assign ls_done_o = rob_out_valid; // valid & done | correct_resp
assign load_data_valid_o = rob_out_valid & (load_store_queue[head][8] == 0); // valid & done & load
assign load_data_o = resp_bypass ? resp_data_i : load_data_queue[head];
assign rd_addr_o = load_store_queue[head][17:12];
assign rob_index_o = load_store_queue[head][19:18];
assign exception_valid_o = rob_out_valid &  load_store_queue[head][3];
assign ecause_o = load_store_queue[head][7 : 4];
assign lsu_ready_o = rob_in_ready;

always @(posedge clk) begin
    // $display("bypass:%x", resp_bypass);
    // $display("resp_valid_i:%x", resp_valid_i);
    if(rstn | flush) begin
        integer rst_flush_gen_i;
        for(rst_flush_gen_i = 0; rst_flush_gen_i < LSU_LSQ_SIZE; 
            rst_flush_gen_i = rst_flush_gen_i + 1) begin
                load_store_queue[rst_flush_gen_i] <= '0;
                load_data_queue[rst_flush_gen_i] <= '0;
                store_data_queue[rst_flush_gen_i] <= '0;
        end
    end 
    else begin 
        if(enque) begin 
            // $display("lsq enque,opcode: %h, tail is %h @ 0x%h", 
            //     opcode_i, tail, address_i);
            load_store_queue[tail] <= load_entry_in;
            if(opcode_i) begin // store
                store_data_queue[tail] <= rs2_data_i;
            end 
        end
        if(enque)
            store_data_queue[tail] <= rs2_data_i;

        if(req_send) begin 
            // if((load_store_queue[req_pt][52:21]  & 'h10000) == 0)
            // $display("lsq req send @ %x, req_pt is %h, opcode: %h",
            //     load_store_queue[req_pt][52:21], req_pt, load_store_queue[req_pt][8]);
            load_store_queue[req_pt][2] <= 1'b1; // send
            if(load_store_queue[req_pt][8] == 1) begin 
                load_store_queue[req_pt][1] <= 1'b1; // set store done
            end 
        end 

        if(resp_accept) begin
            // FIXME: 此时假定resp为head时不需要写入。因为假定了rob 永远ready
            // $display("lsq resp recieve @%x, lsq id is %h, data is %h", 
            //     load_store_queue[resp_lsq_index_i][52:21], resp_lsq_index_i, resp_data_i);
            if(resp_lsq_index_i != head)  begin //需要写入data寄存器
                load_store_queue[resp_lsq_index_i][1] <= 1'b1; // set done
                load_data_queue[resp_lsq_index_i] <= resp_data_i;
            end 
        end 
        
        if(deque) begin
            // $display("lsq deque, head is %h", head);
            load_store_queue[head][0] <= 0;
        end
    end
end

//head pointer
counter #(
    .CNT_SIZE(LSU_LSQ_SIZE),
    .CNT_SIZE_WIDTH(LSU_LSQ_SIZE_WIDTH)
) queue_head_cnt(
    .clk(clk),
    .reset(rstn),
    .cnt_add_flag(deque), 
    .cnt(head),
    /* verilator lint_off PINCONNECTEMPTY */
    .cnt_end()
    /* verilator lint_on PINCONNECTEMPTY */
);

//tail pointer
counter #(
    .CNT_SIZE(LSU_LSQ_SIZE),
    .CNT_SIZE_WIDTH(LSU_LSQ_SIZE_WIDTH)
) queue_tail_cnt(
    .clk(clk),
    .reset(rstn),
    .cnt_add_flag(enque),
    .cnt(tail),
    /* verilator lint_off PINCONNECTEMPTY */
    .cnt_end()
    /* verilator lint_on PINCONNECTEMPTY */
);

// req_pt emit pointer
counter #(
    .CNT_SIZE(LSU_LSQ_SIZE),
    .CNT_SIZE_WIDTH(LSU_LSQ_SIZE_WIDTH)
) queue_req_cnt(
    .clk(clk),
    .reset(rstn),
    .cnt_add_flag(req_send),
    .cnt(req_pt),
    /* verilator lint_off PINCONNECTEMPTY */
    .cnt_end()
    /* verilator lint_on PINCONNECTEMPTY */
);


endmodule
`endif //LSQ_V
