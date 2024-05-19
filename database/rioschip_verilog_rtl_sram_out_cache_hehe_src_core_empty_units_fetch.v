// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

`ifndef FETCH_V
`define FETCH_V
// `include "../params.vh"
module fetch #(
    // parameter INS_BUFFER = 64,
    parameter BTB_SIZE = 4,
    parameter BTB_WIDTH = 2, //log2(up)
    parameter GSHARE_WIDTH = 4,
    parameter PHT_LEN = 16,
    parameter INS_BUFFER_DATA = 96,
    parameter INS_BUFFER_SIZE = 8, //need to set to 8
    parameter INS_BUFFER_SIZE_WIDTH = 3 //log2 (up)

) (
    //whole fetch
    input clk,
    input reset,

    //btb from fu
    input is_req_pc, //is branch or jump instr from fu
    input [31:0] btb_req_pc, 
    input [31:0] btb_predict_target, 

    //gshare from fu
    input [31:0] prev_pc,
    input prev_branch_in,
    input prev_taken,

    //instruction buffer
    input rd_en,
    output [31:0] pc_out,
    output [31:0] next_pc_out,
    output [31:0] instruction_out,

    // from fu
    input valid_real_branch,
    input [31:0] real_branch,
    
    // from exception ctrl
    input trap,
    input mret,
    input wfi,

    // from csr
    input [31:0] trap_vector,
    input [31:0] mret_vector,

    //from icache 
    input icache_req_ready,
    input icache_resp_valid,
    input [31:0] fetch_data,
    input [31:0] icache_resp_address,
    
    // to icache
    output icache_resp_ready,
    output reg icache_req_valid,
    output [31:0] fetch_address,


    //for test
    output ins_empty,
    // output reg [31:0] pc,
    // output [31:0] ins_pc_in,
    // output [31:0] ins_next_pc_in,
    // output [31:0] instruction_in,
    // output buffer_full,
    // output is_exec_branch,
    // output reg [31:0] fetch_data,

    // exceptions
    output exception_valid_o,
    output [EXCEPTION_CODE_WIDTH - 1 : 0] ecause_o
);

reg [31:0] pc;
wire is_exec_branch;

reg rff_icache_resp; //to match misfetch signal, make sure the next response from icache after branch should be ignore

assign fetch_address = pc;
reg [31:0] next_pc;
wire judge_from_gshare;
wire btb_token;
// wire buffer_full;
wire [31:0] pc_from_btb;
assign is_exec_branch = valid_real_branch && (real_branch != pc_out);
wire flush = (is_exec_branch | trap | mret) & !ins_empty;

assign exception_valid_o = pc[1:0] != 2'b00;
assign ecause_o = (pc[1:0] != 2'b00) ? EXCEPTION_INSTR_ADDR_MISALIGNED : 0;

wire buffer_full;
reg [31:0] ins_pc_in;
wire [31:0] ins_next_pc_in;
wire [31:0] instruction_in;

reg rff_misfetch;
wire misfetch;

//next pc 
always @(*) begin
    if (trap) begin
        next_pc = trap_vector;
    end else if (mret) begin
        next_pc = mret_vector;
    end else if (is_exec_branch) begin
        next_pc = real_branch;
    end else if (btb_token && !judge_from_gshare && (icache_req_ready && icache_req_valid)) begin //need && judge_from_gshare
        next_pc = pc_from_btb;
    end else if (!wfi && !buffer_full && (icache_req_ready && icache_req_valid)) begin
        next_pc = pc + 4;
    end else begin
        next_pc = pc;
    end
end

//pc switch
always @(posedge clk) begin
    if (reset) begin
        pc <= RESET_VECTOR;
    end else begin
        pc <= next_pc;
    end
end
    
always @(posedge clk) begin
    if (wfi || buffer_full || reset) begin
        icache_req_valid <= 0;
    end else begin
        icache_req_valid <= 1;
    end
end

always @(posedge clk) begin
    if (reset) begin
        ins_pc_in <= RESET_VECTOR;
    end else if (is_exec_branch | trap | mret) begin 
        ins_pc_in <= next_pc;
    end else if(icache_req_ready & icache_req_valid) begin
        ins_pc_in <= pc; 
    end
end

/* verilator lint_off LATCH */
// always @(*) begin
//     if (is_exec_branch | trap | mret) begin
//         rff_misfetch = 1;
//     end else if (rff_icache_resp) begin
//         rff_misfetch = 0;
//     end
// end
/* verilator lint_on LATCH */

always @(posedge clk) begin
    if (reset) begin
        rff_misfetch <= 0;
    end if (is_exec_branch | trap | mret) begin
        rff_misfetch <= 1;
    end else if (icache_resp_ready & icache_resp_valid) begin
        rff_misfetch <= 0;
    end
end

assign misfetch = rff_misfetch | is_exec_branch | trap | mret;

// always @(posedge clk) begin
//     if (reset) begin
//         rff_icache_resp <= 0;
//     end else if (icache_resp_ready & icache_resp_valid) begin
//         rff_icache_resp <= 1;
//     end else begin
//         rff_icache_resp <= 0;
//     end
// end


assign ins_next_pc_in = ins_pc_in + 4;
assign instruction_in = fetch_data;

assign icache_resp_ready = !wfi && !buffer_full;
wire instr_buffer_wr_en = icache_resp_ready && icache_resp_valid && (icache_resp_address == ins_pc_in) && !rff_misfetch; // resp_address can equal both ins_next_pc_in and pc 

btb #(
    .BTB_SIZE(BTB_SIZE),
    .BTB_WIDTH(BTB_WIDTH)
) btb_u(
    .clk(clk),
    .reset(reset),
    .pc_in(pc),
    .token(btb_token),
    .next_pc_out(pc_from_btb),
    .is_req_pc(is_req_pc),
    .req_pc(btb_req_pc),
    .predict_target(btb_predict_target)
);

gshare #(
    .GSHARE_WIDTH(GSHARE_WIDTH),
    .PHT_LEN(PHT_LEN)
) gshare_u(
    .clk(clk),
    .reset(reset),
    .pc(pc),
    .prev_pc(prev_pc),
    .prev_branch_in(prev_branch_in),
    .prev_taken(prev_taken),
    .cur_pred(judge_from_gshare)
);

ins_buffer #(
    .INS_BUFFER_DATA(INS_BUFFER_DATA),
    .INS_BUFFER_SIZE(INS_BUFFER_SIZE),
    .INS_BUFFER_SIZE_WIDTH(INS_BUFFER_SIZE_WIDTH)
) buffer_u(
    .clk(clk),
    .reset(reset),
    .flush(flush),
    .pc_in(ins_pc_in),
    .next_pc_in(ins_next_pc_in),
    .instruction_in(instruction_in),
    .rd_en(rd_en),
    .wr_en(instr_buffer_wr_en),
    .pc_out(pc_out),
    .next_pc_out(next_pc_out),
    .instruction_out(instruction_out),
    .ins_full(buffer_full),
    .ins_empty(ins_empty)
);

////////////////////////////////////fake icache
//need change fifo to fifo test in instruction_buffer
// fake_icache hello(
//     .clk(clk),
//     .reset(reset),
//     .fetch_address(fetch_address),
//     .instruction(fetch_data)
// );





//////////////////////////////////////////////
endmodule

`endif // FETCH_V
