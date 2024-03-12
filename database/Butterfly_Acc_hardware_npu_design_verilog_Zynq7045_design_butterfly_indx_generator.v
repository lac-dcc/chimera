`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: butterfly_indx_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module butterfly_indx_generator
# (
  // The data width of input data
  parameter data_width = 16,
  // The data width utilized for accumulated results
  parameter bu_parallelism = 8
)
(
  input  wire                        clk,
  input  wire                        rst_n,
  input  wire                        start,
  input  wire  [32-1:0]              length,
  output wire                        butterfly_indx_finish,
  output wire                        butterfly_vld,
  output wire  [32*bu_parallelism-1:0]      butterfly_indx
);

localparam generating = 1'b1;
localparam idle = 1'b0;
localparam max_length = 4096;

/////////////////////Timing//////////////////////////
reg  [16-1:0]                          length_r;
always @(posedge clk)
begin
    length_r <= length;
end

/////////////////////Timing//////////////////////////

genvar i;

reg                       state;
reg  [32-1:0]             cycle_counter;
reg  [$clog2(max_length)-1:0]             jump_counter;
reg  [32-1:0]             stage;
reg  [$clog2(max_length)-1:0]             stride;
reg  [32-1:0]             base_indx;
reg  [32-1:0]      butterfly_indxs_r[bu_parallelism-1:0];
reg                       butterfly_vld_r;
reg                       butterfly_indx_finish_r;

assign butterfly_vld = butterfly_vld_r;
assign butterfly_indx_finish = butterfly_indx_finish_r;

generate
for(i=0 ; i<bu_parallelism/2 ; i=i+1)
begin : GENERATE_BUTTERFLY_DAT
    assign butterfly_indx[( 2*32*i + 2*32-1) : (2*32*i)] = {butterfly_indxs_r[i+4], butterfly_indxs_r[i]};
end
endgenerate

// =========================================================================== //
// Generate indx when stage > 1
// =========================================================================== //

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    state <= idle;
    stage <= -1;
    cycle_counter <= 0;
    stride <= 0;
    base_indx <= 0;
    butterfly_indx_finish_r <= 1'b0;
    jump_counter <= 0;
end
else if (state == generating) begin
    if (cycle_counter == 0) begin
        base_indx <= 0;
        if (stage == 0) begin
            state <= idle;
            butterfly_indx_finish_r <= 1'b1;
            stage <= -1;
        end
        else begin
            stage <= stage - 1;
            cycle_counter <= length_r - bu_parallelism;
            jump_counter <= 0; 
            stride <= stride >> 1;
        end
    end
    else begin
        cycle_counter <= cycle_counter - bu_parallelism; 
        if (stage > 2) begin // control the base indx.  In stage 2, 1 and 0, the address is continous, so we don't need indx controller
            jump_counter <= jump_counter + bu_parallelism/2;
            // if (((cycle_counter >> 1) % stride) == 0) begin // Jump
            if (jump_counter == stride - bu_parallelism/2) begin // Jump
                jump_counter <= 0;
                base_indx <= length_r - cycle_counter;
            end
            else begin
                if (base_indx[0] == 1) base_indx <= base_indx -1 + bu_parallelism;
                else base_indx <= base_indx + 1;
            end
        end
        else begin // case of stage 2, 1 and 0
            base_indx <= base_indx + bu_parallelism;
        end
    end
end
else if (state == idle) begin
    jump_counter <= 0;
    base_indx <= 0;
    butterfly_indx_finish_r <= 1'b0;
    if (start) begin
        state <= generating;
        stride <= length_r >> 1;
        cycle_counter <= length_r- bu_parallelism;
        // Get num stage required
        if (length_r == 4096) stage <= 12-1;
        else if (length_r == 2048) stage <= 11-1;
        else if (length_r == 1024) stage <= 10-1;
        else if (length_r == 512) stage <= 9-1;
        else if (length_r == 256) stage <= 8-1;
        else if (length_r == 128) stage <= 7-1;
        else if (length_r == 64) stage <= 6-1;
        else if (length_r == 32) stage <= 5-1;
    end
    else begin
        state <= idle;
        stage <= -1;
        cycle_counter <= 0;
        stride <= 0;
    end
end



generate
for(i=0 ; i<bu_parallelism/2 ; i=i+1)
begin : GENERATE_BUTTERFLY_INDX_FIRST_HALF
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        butterfly_indxs_r[i] <= 0;
    end
    else begin
        if (stage > 2) begin
            butterfly_indxs_r[i] <= base_indx + 2*i;
        end
        else if (stage == 2) begin
            butterfly_indxs_r[i] <= base_indx + i;
        end
        else if (stage == 1) begin
            if (i<2) butterfly_indxs_r[i] <= base_indx + i;
            else butterfly_indxs_r[i] <= base_indx + i + 2;
        end
        else if (stage == 0) begin
            butterfly_indxs_r[i] <= base_indx + 2*i;
        end
        else if (stage == -1) begin
            butterfly_indxs_r[i] <= 0;
        end
    end
end
endgenerate


generate
for(i=bu_parallelism/2 ; i<bu_parallelism ; i=i+1)
begin : GENERATE_BUTTERFLY_INDX_SECOND_HALF
    always @(posedge clk or negedge rst_n)
    if(!rst_n) begin
        butterfly_indxs_r[i] <= 0;
    end
    else begin
        if (stage > 2) begin
            butterfly_indxs_r[i] <= base_indx + 2*(i-bu_parallelism/2) + stride;
        end
        else if (stage == 2) begin
            butterfly_indxs_r[i] <= base_indx + (i-bu_parallelism/2) + stride;
        end
        else if (stage == 1) begin
            if (i-bu_parallelism/2<2) butterfly_indxs_r[i] <= base_indx + (i-bu_parallelism/2)+stride;
            else butterfly_indxs_r[i] <= base_indx + (i-bu_parallelism/2) + 2 + stride;
        end
        else if (stage == 0) begin
            butterfly_indxs_r[i] <= base_indx + 2*(i-bu_parallelism/2) + stride;
        end
        else if (stage == -1) begin
            butterfly_indxs_r[i] <= 0;
        end
    end
end
endgenerate

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    butterfly_vld_r <= 1'b0;
end
else begin
    if (stage[31] == 0) begin // positive
        butterfly_vld_r <= 1'b1;
    end
    else begin
        butterfly_vld_r <= 1'b0;
    end
end

endmodule

