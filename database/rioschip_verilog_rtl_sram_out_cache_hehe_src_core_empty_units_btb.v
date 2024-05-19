// This program was cloned from: https://github.com/b224hisl/rioschip
// License: Apache License 2.0

module btb #(
    parameter BTB_SIZE = 4,
    parameter BTB_SIZE_1 = 3,
    parameter BTB_WIDTH = 2
)(
    input clk,
    input reset,

    //from fetch
    input [31:0] pc_in,

    //to fetch
    output token,
    output reg [31:0] next_pc_out,

    // for test
    // output gotten,
    // output reg [BTB_WIDTH-1:0] counter,


    //from execute
    input is_req_pc,
    input [31:0] req_pc,
    input [31:0] predict_target
);
integer      i;
reg [31:0] btb_pc   [BTB_SIZE-1:0];
reg [31:0] btb_ppc  [BTB_SIZE-1:0];
wire [BTB_SIZE-1:0] fetch_hit;
wire [BTB_SIZE-1:0] gshare_hit;
wire gotten;
reg [BTB_WIDTH-1:0] counter;

generate
    genvar j;
    for(j = 0; j < BTB_SIZE; j = j + 1) begin
        assign fetch_hit[j] = pc_in == btb_pc[j];
    end
endgenerate


generate
    for(j = 0; j < BTB_SIZE; j = j + 1) begin
        assign gshare_hit[j] = req_pc == btb_pc[j];
    end
endgenerate

assign token = (|fetch_hit);
assign gotten = (|gshare_hit);
// wire [31:0] temp;

/* verilator lint_off LATCH */
always @(*) begin
    if(token) begin
        for (i=0; i < BTB_SIZE; i=i+1) begin
            if(fetch_hit[i]) begin
                next_pc_out = btb_ppc[i];
            end 
        end 
    end else begin
        next_pc_out = pc_in;
    end
end
/* verilator lint_on LATCH */

wire add_const = !gotten & is_req_pc;
wire end_const = add_const && counter == BTB_SIZE_1; //need to update to the real btb size but why cannot use parameter
wire [BTB_WIDTH-1:0]  ccounter = counter;
//reset counter
always @(posedge clk) begin
    if (reset) begin
        counter <= 0;
    end else if(add_const) begin
        if(end_const) begin
            counter <= 0;
        end
        else begin
            counter <= counter + 1;
        end
    end
end


//exe stage
always @(posedge clk) begin
    if (reset) begin
        for (i = 0; i < BTB_SIZE; i = i + 1) begin
            btb_pc[i] <= 0;
            btb_ppc[i] <= 0;
        end
    end
    else if (gotten && is_req_pc) begin
        for (i=0; i < BTB_SIZE; i=i+1) begin
            if (gshare_hit[i]) begin
                btb_ppc[i] <= predict_target;
            end
        end
    end
    else if (!gotten && is_req_pc) begin
        btb_pc[ccounter] <= req_pc;
        btb_ppc[ccounter] <= predict_target;
    end
end
endmodule
