/*-------------------------------------------------------------------------
// Module:  branch prediction
// File:    bp.v
// Author:  shawn Liu
// E-mail:  shawn110285@gmail.com
// Description: branch prediction(bht/btb/ras)
--------------------------------------------------------------------------*/

// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//-----------------------------------------------------------------

`include "defines.v"

module branch_prediction #( parameter NUM_RAS_ENTRIES  = 8,
                            parameter NUM_BTB_ENTRIES  = 64,
                            parameter NUM_BHT_ENTRIES  = 64)
(
    input wire                 clk_i,
    input wire                 n_rst_i,
    // input signals from execution unit
    input wire[`InstAddrBus]   branch_source_i,   // the pc caused the branch
    input wire                 branch_request_i,
    input wire                 branch_is_taken_i,
    input wire                 branch_is_call_i,
    input wire                 branch_is_ret_i,
    input wire                 branch_is_jmp_i,
    input wire[`InstAddrBus]   branch_target_i,   // the branch target pc
    input wire                 branch_mispredict_i,

    //input signals from fetch unit
    input wire[`InstAddrBus]   pc_i,    // the current PC from fetch unit

    //input signals from ctrl
    input wire                 stall_i, // to avoid one ret/call instruction to cause multiple ras push or pop operation

    // output signals to fetch unit
    output reg[`InstAddrBus]   next_pc_o,    // next pc predicted by this module
    output reg                 next_taken_o  // next pc is a branch take or not, forward to execute via fetch module
);

    localparam BHT_ENTRIES_WIDTH = $clog2(NUM_BHT_ENTRIES);
    localparam BTB_ENTRIES_WIDTH = $clog2(NUM_BTB_ENTRIES);
    localparam RAS_ENTRIES_WIDTH = $clog2(NUM_RAS_ENTRIES);

    //-----------------------------------------------------------------
    // Branch history table, consist of several bi-modal predictor
    //-----------------------------------------------------------------
    reg [1:0] bht_bim_list[NUM_BHT_ENTRIES-1:0];

    // ------update the bht, indexed by the bits[2+BHT_ENTRIES_WIDTH-1:2] --------
    wire[BHT_ENTRIES_WIDTH-1:0] bht_write_entry = branch_source_i[2+BHT_ENTRIES_WIDTH-1:2];

    integer i4;
    always @ (posedge clk_i or negedge  n_rst_i) begin
        if (n_rst_i == `RstEnable) begin
            // initialize the bht
            for (i4 = 0; i4 < NUM_BHT_ENTRIES; i4 = i4 + 1) begin
                bht_bim_list[i4] <= 2'b11;   //strongly taken (11), weakly taken(10), weakly not taken(01), strongly not taken(00)
            end
        end else begin
            if ( branch_request_i ) begin
                /* $display("branch: pc=%h, take=%d, index=%h, sat=%d",
                          branch_source_i, branch_is_taken_i, bht_write_entry, bht_bim_list[bht_write_entry]); */
                if( (branch_is_taken_i == 1'b1) && (bht_bim_list[bht_write_entry] < 2'd3) ) begin
                    bht_bim_list[bht_write_entry] <= bht_bim_list[bht_write_entry] + 2'd1;  //update the counter
                    /* $display("increase sat: pc=%h, index=%h, sat=%d",
                            branch_source_i, bht_write_entry, bht_bim_list[bht_write_entry]); */
                end else if ( (branch_is_taken_i  == 1'b0) && (bht_bim_list[bht_write_entry] > 2'd0) ) begin
                    bht_bim_list[bht_write_entry] <= bht_bim_list[bht_write_entry] - 2'd1;
                    /* $display("decrease sat: pc=%h, index=%h, sat=%d",
                          branch_source_i, bht_write_entry, bht_bim_list[bht_write_entry]);  */
                end // if( (branch_is_taken_i == 1'b1) && (bht_bim_list[bht_write_entry] < 2'd3) ) begin
            end //if ( branch_request_i ) begin
        end //if (n_rst_i == `RstEnable) begin
    end

    // ------lookup the bht, indexed by the bits[2+BHT_ENTRIES_WIDTH-1:2] --------
    wire[BHT_ENTRIES_WIDTH-1:0] bht_read_entry = pc_i[2+BHT_ENTRIES_WIDTH-1:2];
    wire bht_predict_taken = (bht_bim_list[bht_read_entry] >= 2'd2);       // is the bht predicted as a taken?

    //-----------------------------------------------------------------
    // BTB (valid, source_pc, call, ret, jmp, target_pc)
    //  (1) if the entry is a "call" or a "jmp",  select the target_pc as the next_pc
    //  (2) if the entry is a "ret",  select the RAS as the next_pc
    //  (3) otherwise, resort to the BHT(BIM) to select target_pc or pc_i+4 as the next_pc
    //-----------------------------------------------------------------
    reg                 btb_is_valid_list[NUM_BTB_ENTRIES-1:0];
    reg [`InstAddrBus]  btb_source_pc_list[NUM_BTB_ENTRIES-1:0];
    reg                 btb_is_call_list[NUM_BTB_ENTRIES-1:0];
    reg                 btb_is_ret_list[NUM_BTB_ENTRIES-1:0];
    reg                 btb_is_jmp_list[NUM_BTB_ENTRIES-1:0];
    reg [`InstAddrBus]  btb_target_pc_list[NUM_BTB_ENTRIES-1:0];

    // ------------ process of looking up the btb based on pc ----------------
    reg                 btb_is_matched;
    reg                 btb_is_call;
    reg                 btb_is_ret;
    reg                 btb_is_jmp;
    reg [`InstAddrBus]  btb_target_pc;

    reg[BTB_ENTRIES_WIDTH-1:0] btb_rd_entry;
    integer i0;

    always @ ( * ) begin
        btb_is_matched = 1'b0;
        btb_is_call = 1'b0;
        btb_is_ret = 1'b0;
        btb_is_jmp = 1'b0;
        btb_target_pc = pc_i + 32'd4;  //if no btb matched, used btb_target_pc as the default value
        btb_rd_entry = {BTB_ENTRIES_WIDTH{1'b0}};  //not matched

        for (i0 = 0; i0 < NUM_BTB_ENTRIES; i0 = i0 + 1) begin
            if ( btb_source_pc_list[i0] == pc_i && btb_is_valid_list[i0] ) begin    //matched pc
                btb_is_matched   = 1'b1;
                btb_is_call = btb_is_call_list[i0];
                btb_is_ret  = btb_is_ret_list[i0];
                btb_is_jmp  = btb_is_jmp_list[i0];
                btb_target_pc = btb_target_pc_list[i0];
                /* verilator lint_off WIDTH */
                btb_rd_entry   = i0;
                /* verilator lint_on WIDTH */

            /* $display("got btb: matched index=%d, pc=%h, target=%h, ret=%d, call=%d, jmp=%d, next_taken=%h",
                         btb_rd_entry, pc_i, btb_target_pc,
                         btb_is_ret, btb_is_call, btb_is_jmp, bht_predict_taken);  */

            end  //if (btb_source_pc_list[i0] == pc_i) begin
        end  //  for (i0 = 0; i0 < NUM_BTB_ENTRIES; i0 = i0 + 1) begin
    end // always @ ( * ) begin

    // further check ras matched or not, if yes, get the next pc from the RAS
    wire  ras_call_matched =  (btb_is_matched & btb_is_call);
    wire  ras_ret_matched  =  (btb_is_matched & btb_is_ret);

    // --------------------  process of updating the btb ----------------------------
    reg[BTB_ENTRIES_WIDTH-1:0]  btb_write_entry;  // the btb entry to be updated
    wire[BTB_ENTRIES_WIDTH-1:0] btb_alloc_entry;  // allocate a new entry to store the branch target

    reg  btb_hit;
    reg  btb_alloc_req;
    integer  i1;

    always @ ( * ) begin
        btb_write_entry = {BTB_ENTRIES_WIDTH{1'b0}};
        btb_hit = 1'b0;
        btb_alloc_req  = 1'b0;

        // Misprediction - learn / update branch details
        if (branch_request_i && branch_is_taken_i) begin
            for (i1 = 0; i1 < NUM_BTB_ENTRIES; i1 = i1 + 1) begin
                if ( btb_source_pc_list[i1] == branch_source_i && btb_is_valid_list[i1] ) begin
                    btb_hit      = 1'b1;
                    /* verilator lint_off WIDTH */
                    btb_write_entry = i1;
                    /* verilator lint_on WIDTH */
                end  // if (btb_source_pc_list[i1] == branch_source_i) begin
            end  // for (i1 = 0; i1 < NUM_BTB_ENTRIES; i1 = i1 + 1) begin
            btb_alloc_req = ~btb_hit;
        end  //if (branch_request_i) begin
    end //always @ ( * ) begin

    integer i2;
    always @ (posedge clk_i or negedge  n_rst_i) begin
        if (n_rst_i == `RstEnable) begin
            for (i2 = 0; i2 < NUM_BTB_ENTRIES; i2 = i2 + 1) begin
                /// init the btb
                btb_is_valid_list[i2] <= 1'b0;
                btb_source_pc_list[i2] <= 32'b0;
                btb_target_pc_list[i2] <= 32'b0;
                btb_is_call_list[i2] <= 1'b0;
                btb_is_ret_list[i2] <= 1'b0;
                btb_is_jmp_list[i2] <= 1'b0;
            end // for (i2 = 0; i2 < NUM_BTB_ENTRIES; i2 = i2 + 1) begin
        end else begin
            if (branch_request_i && branch_is_taken_i) begin
                if(btb_hit == 1'b1) begin
                    /*
                    $display("update btb: matched index=%d, pc=%h, target=%h, ret=%d, call=%d, jmp=%d",
                              btb_write_entry, branch_source_i, branch_target_i,
                              branch_is_ret_i, branch_is_call_i, branch_is_jmp_i); */
                    btb_source_pc_list[btb_write_entry] <= branch_source_i;
                    btb_target_pc_list[btb_write_entry] <= branch_target_i;
                    btb_is_call_list[btb_write_entry] <= branch_is_call_i;
                    btb_is_ret_list[btb_write_entry] <= branch_is_ret_i;
                    btb_is_jmp_list[btb_write_entry] <= branch_is_jmp_i;
                end else begin  // Miss - allocate entry
                    /*
                    $display("update btb: allocated index=%d, pc=%h, target=%h, ret=%d, call=%d, jmp=%d",
                              btb_alloc_entry, branch_source_i, branch_target_i,
                              branch_is_ret_i, branch_is_call_i, branch_is_jmp_i); */

                    btb_is_valid_list[btb_alloc_entry] <= 1'b1;
                    btb_source_pc_list[btb_alloc_entry] <= branch_source_i;
                    btb_target_pc_list[btb_alloc_entry] <= branch_target_i;
                    btb_is_call_list[btb_alloc_entry]<= branch_is_call_i;
                    btb_is_ret_list[btb_alloc_entry] <= branch_is_ret_i;
                    btb_is_jmp_list[btb_alloc_entry] <= branch_is_jmp_i;
                end // if(btb_hit == 1'b1) begin
            end // if (branch_request_i) begin
        end // if (n_rst_i == `RstEnable) begin
    end  //always @ (posedge clk_i or negedge  n_rst_i) begin


    //-----------------------------------------------------------------
    // Return Address Stack
    // four scenarios:
    //  (1) call predicted failed, ret predicted failed as well
    //      exu updates the ras queue(push the call index and pop the ret index)
    //  (2) call predicted succeed, but ret predicted failed
    //      bp itself pushes the call index, but the exu pops the ret index
    //  (3) call predicted failed, but ret predicted succeed
    //      exu pushes the call index, but bp itself pops the ret index
    //  (4) call predicted succeed, ret predicted succeed as well
    //      bp itself updates the ras queue(push the call index and pop the ret index)
    //-----------------------------------------------------------------

    reg[31:0] ras_list[NUM_RAS_ENTRIES-1:0];  // the RAS stack

    //--------------------------------------------------------------------------------
    // the authenticated Return Address Stack which is updated according to the exu
    //--------------------------------------------------------------------------------
    reg [RAS_ENTRIES_WIDTH-1:0] ras_proven_curr_index;
    reg [RAS_ENTRIES_WIDTH-1:0] ras_proven_next_index;

    always @ ( * ) begin
        ras_proven_next_index = ras_proven_curr_index;

        if (branch_request_i & branch_is_call_i)
            ras_proven_next_index = ras_proven_curr_index + 1;
        else if (branch_request_i & branch_is_ret_i)
            ras_proven_next_index = ras_proven_curr_index - 1;
    end

    always @ (posedge clk_i) begin  //or negedge n_rst_i
        if (n_rst_i == `RstEnable)
            ras_proven_curr_index <= {RAS_ENTRIES_WIDTH{1'b0}};
        else
            ras_proven_curr_index <= ras_proven_next_index;
    end


    //-----------------------------------------------------------------
    // the speculative Return Address Stack
    //-----------------------------------------------------------------
    reg[RAS_ENTRIES_WIDTH-1:0] ras_speculative_curr_index;
    reg[RAS_ENTRIES_WIDTH-1:0] ras_speculative_next_index;

    // the predicted pc based on the ras
    wire [31:0] ras_pred_pc = ras_list[ras_speculative_curr_index];

    always @ ( * ) begin
        ras_speculative_next_index = ras_speculative_curr_index;
        // Mispredict - sync with authentical ras index
        if (branch_mispredict_i & branch_request_i & branch_is_call_i) begin
            ras_speculative_next_index = ras_proven_curr_index + 1;
            // $display("ras[call]: copy from authenticated ras, next_index=%d, src_pc=%h", ras_speculative_next_index, branch_source_i);
        end else if (branch_mispredict_i & branch_request_i & branch_is_ret_i) begin
            ras_speculative_next_index = ras_proven_curr_index - 1;
            // $display("ras[ret]: copy from authenticated ras, next_index=%d, target_pc=%h", ras_speculative_next_index, branch_target_i);
        // Speculative call / returns
        end else if (ras_call_matched && stall_i == 1'b0) begin
            ras_speculative_next_index = ras_speculative_curr_index + 1;
            // $display("ras: bpu push, next_index=%d, pc=%h", ras_speculative_next_index, pc_i);
        end else if (ras_ret_matched && stall_i == 1'b0) begin
            ras_speculative_next_index = ras_speculative_curr_index - 1;
            // $display("ras: bpu pop, curr_index=%d, pc=%h, target=%h", ras_speculative_curr_index, pc_i, ras_pred_pc);
        end
    end


    integer i3;
    always @ (posedge clk_i) begin   // or negedge n_rst_i
        if (n_rst_i == `RstEnable) begin
            for (i3 = 0; i3 < NUM_RAS_ENTRIES; i3 = i3 + 1) begin
                ras_list[i3] <= 32'h0;
            end
            ras_speculative_curr_index <= {RAS_ENTRIES_WIDTH{1'b0}};
        end else begin
            if (branch_mispredict_i & branch_request_i & branch_is_call_i) begin
                ras_list[ras_speculative_next_index] <= branch_source_i + 4;
                ras_speculative_curr_index <= ras_speculative_next_index;
                // $display("ras: exu push, curr_index=%d, target_pc=%h", ras_speculative_next_index, branch_source_i + 4);
            end else if (ras_call_matched && stall_i == 1'b0) begin
                ras_list[ras_speculative_next_index] <= pc_i + 4;
                ras_speculative_curr_index <= ras_speculative_next_index;
                // $display("ras: bpu push, curr_index=%d, target_pc=%h", ras_speculative_next_index, pc_i + 4);
            end else if(branch_mispredict_i & branch_request_i & branch_is_ret_i) begin
                ras_speculative_curr_index <= ras_speculative_next_index;
            end else if (ras_ret_matched && stall_i == 1'b0) begin
                ras_speculative_curr_index <= ras_speculative_next_index;
            end
        end //if (n_rst_i) begin
    end

    //-----------------------------------------------------------------
    // Replacement Selection
    //-----------------------------------------------------------------
    bp_allocate_entry
    #(
        .DEPTH(NUM_BTB_ENTRIES)
    )
    u_lru
    (
        .clk_i(clk_i),
        .n_rst_i(n_rst_i),
        .alloc_i(btb_alloc_req),
        .alloc_entry_o(btb_alloc_entry)
    );


    //-----------------------------------------------------------------
    // Outputs
    //-----------------------------------------------------------------

    // the next_pc predicted as below:
    assign next_pc_o = ras_ret_matched ? ras_pred_pc : ( btb_is_matched & (bht_predict_taken | btb_is_jmp | btb_is_call) ) ? btb_target_pc : pc_i + 4;
    // taken or not_taken was predicted as below:
    assign next_taken_o = (btb_is_matched & (btb_is_call | btb_is_ret | bht_predict_taken | btb_is_jmp)) ? 1'b1 : 1'b0;

endmodule




module bp_allocate_entry #( parameter DEPTH = 32 )
(
    input                     clk_i,
    input                     n_rst_i,
    input                     alloc_i,
    output[$clog2(DEPTH)-1:0] alloc_entry_o
);
    localparam ADDR_W = $clog2(DEPTH);

    reg [ADDR_W-1:0] lfsr_q;

    always @ (posedge clk_i or negedge  n_rst_i) begin
        if (n_rst_i == `RstEnable)
            lfsr_q <= {ADDR_W{1'b0}};
        else if (alloc_i) begin
            if (lfsr_q == {ADDR_W{1'b1}}) begin
                lfsr_q <= {ADDR_W{1'b0}};
            end else begin
                lfsr_q <= lfsr_q + 1;
            end  //if (lfsr_q == {ADDR_W{1'b1}}) begin
        end  //if (n_rst_i == `RstEnable)
    end //always @ (posedge clk_i or negedge  n_rst_i) begin

    assign alloc_entry_o = lfsr_q[ADDR_W-1:0];

endmodule
