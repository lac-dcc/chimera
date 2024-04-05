// ================================================================
// NVDLA Open Source Project
//
// Copyright(c) 2016 - 2017 NVIDIA Corporation. Licensed under the
// NVDLA Open Hardware License; Check "LICENSE" which comes with
// this distribution for more information.
// ================================================================
// File Name: NV_NVDLA_DMAIF_rdreq.v
`include "simulate_x_tick.vh"
module NV_NVDLA_DMAIF_rdreq (
   nvdla_core_clk
  ,nvdla_core_rstn
  ,reg2dp_src_ram_type
  ,cvif_rd_req_pd
  ,cvif_rd_req_valid
  ,cvif_rd_req_ready
  ,mcif_rd_req_pd
  ,mcif_rd_req_valid
  ,mcif_rd_req_ready
  ,dmaif_rd_req_pd
  ,dmaif_rd_req_vld
  ,dmaif_rd_req_rdy
);
//////////////////////////////////////////////
input nvdla_core_clk;
input nvdla_core_rstn;
input reg2dp_src_ram_type;
output [64 +14:0] cvif_rd_req_pd;
output cvif_rd_req_valid;
input cvif_rd_req_ready;
output [64 +14:0] mcif_rd_req_pd;
output mcif_rd_req_valid;
input mcif_rd_req_ready;
input [64 +14:0] dmaif_rd_req_pd;
input dmaif_rd_req_vld;
output dmaif_rd_req_rdy;
//////////////////////////////////////////////
wire mc_dma_rd_req_vld;
wire mc_dma_rd_req_rdy;
wire mc_rd_req_rdyi;
wire dma_rd_req_ram_type;
wire rd_req_rdyi;
//////////////////////////////////////////////
assign dma_rd_req_ram_type = reg2dp_src_ram_type;
assign mc_dma_rd_req_vld = dmaif_rd_req_vld & (dma_rd_req_ram_type == 1'b1);
assign mc_rd_req_rdyi = mc_dma_rd_req_rdy & (dma_rd_req_ram_type == 1'b1);
assign dmaif_rd_req_rdy= rd_req_rdyi;
//: my $dmabw = ( 64 + 15 );
//: &eperl::pipe(" -wid $dmabw -is -do mcif_rd_req_pd -vo mcif_rd_req_valid -ri mcif_rd_req_ready -di dmaif_rd_req_pd -vi mc_dma_rd_req_vld -ro mc_dma_rd_req_rdy_f  ");
//| eperl: generated_beg (DO NOT EDIT BELOW)
// Reg
reg mc_dma_rd_req_rdy_f;
reg skid_flop_mc_dma_rd_req_rdy_f;
reg skid_flop_mc_dma_rd_req_vld;
reg [79-1:0] skid_flop_dmaif_rd_req_pd;
reg pipe_skid_mc_dma_rd_req_vld;
reg [79-1:0] pipe_skid_dmaif_rd_req_pd;
// Wire
wire skid_mc_dma_rd_req_vld;
wire [79-1:0] skid_dmaif_rd_req_pd;
wire skid_mc_dma_rd_req_rdy_f;
wire pipe_skid_mc_dma_rd_req_rdy_f;
wire mcif_rd_req_valid;
wire [79-1:0] mcif_rd_req_pd;
// Code
// SKID READY
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       mc_dma_rd_req_rdy_f <= 1'b1;
       skid_flop_mc_dma_rd_req_rdy_f <= 1'b1;
   end else begin
       mc_dma_rd_req_rdy_f <= skid_mc_dma_rd_req_rdy_f;
       skid_flop_mc_dma_rd_req_rdy_f <= skid_mc_dma_rd_req_rdy_f;
   end
end

// SKID VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        skid_flop_mc_dma_rd_req_vld <= 1'b0;
    end else begin
        if (skid_flop_mc_dma_rd_req_rdy_f) begin
            skid_flop_mc_dma_rd_req_vld <= mc_dma_rd_req_vld;
        end
   end
end
assign skid_mc_dma_rd_req_vld = (skid_flop_mc_dma_rd_req_rdy_f) ? mc_dma_rd_req_vld : skid_flop_mc_dma_rd_req_vld;

// SKID DATA
always @(posedge nvdla_core_clk) begin
    if (skid_flop_mc_dma_rd_req_rdy_f & mc_dma_rd_req_vld) begin
        skid_flop_dmaif_rd_req_pd[79-1:0] <= dmaif_rd_req_pd[79-1:0];
    end
end
assign skid_dmaif_rd_req_pd[79-1:0] = (skid_flop_mc_dma_rd_req_rdy_f) ? dmaif_rd_req_pd[79-1:0] : skid_flop_dmaif_rd_req_pd[79-1:0];


// PIPE READY
assign skid_mc_dma_rd_req_rdy_f = pipe_skid_mc_dma_rd_req_rdy_f || !pipe_skid_mc_dma_rd_req_vld;

// PIPE VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        pipe_skid_mc_dma_rd_req_vld <= 1'b0;
    end else begin
        if (skid_mc_dma_rd_req_rdy_f) begin
            pipe_skid_mc_dma_rd_req_vld <= skid_mc_dma_rd_req_vld;
        end
    end
end

// PIPE DATA
always @(posedge nvdla_core_clk) begin
    if (skid_mc_dma_rd_req_rdy_f && skid_mc_dma_rd_req_vld) begin
        pipe_skid_dmaif_rd_req_pd[79-1:0] <= skid_dmaif_rd_req_pd[79-1:0];
    end
end


// PIPE OUTPUT
assign pipe_skid_mc_dma_rd_req_rdy_f = mcif_rd_req_ready;
assign mcif_rd_req_valid = pipe_skid_mc_dma_rd_req_vld;
assign mcif_rd_req_pd = pipe_skid_dmaif_rd_req_pd;

//| eperl: generated_end (DO NOT EDIT ABOVE)
assign mc_dma_rd_req_rdy = mc_dma_rd_req_rdy_f;
wire cv_dma_rd_req_vld;
wire cv_rd_req_rdyi;
wire cv_dma_rd_req_rdy;
assign cv_dma_rd_req_vld = dmaif_rd_req_vld & (dma_rd_req_ram_type == 1'b0);
assign cv_rd_req_rdyi = cv_dma_rd_req_rdy & (dma_rd_req_ram_type == 1'b0);
assign rd_req_rdyi = mc_rd_req_rdyi | cv_rd_req_rdyi;
//: my $dmabw = ( 64 + 15 );
//: print "wire [${dmabw}-1:0] cv_dma_rd_req_pd; \n";
//: print "assign cv_dma_rd_req_pd = dmaif_rd_req_pd; \n";
//: &eperl::pipe(" -wid $dmabw -is -do cvif_rd_req_pd -vo cvif_rd_req_valid -ri cvif_rd_req_ready -di cv_dma_rd_req_pd -vi cv_dma_rd_req_vld -ro cv_dma_rd_req_rdy_f  ");
//| eperl: generated_beg (DO NOT EDIT BELOW)
wire [79-1:0] cv_dma_rd_req_pd; 
assign cv_dma_rd_req_pd = dmaif_rd_req_pd; 
// Reg
reg cv_dma_rd_req_rdy_f;
reg skid_flop_cv_dma_rd_req_rdy_f;
reg skid_flop_cv_dma_rd_req_vld;
reg [79-1:0] skid_flop_cv_dma_rd_req_pd;
reg pipe_skid_cv_dma_rd_req_vld;
reg [79-1:0] pipe_skid_cv_dma_rd_req_pd;
// Wire
wire skid_cv_dma_rd_req_vld;
wire [79-1:0] skid_cv_dma_rd_req_pd;
wire skid_cv_dma_rd_req_rdy_f;
wire pipe_skid_cv_dma_rd_req_rdy_f;
wire cvif_rd_req_valid;
wire [79-1:0] cvif_rd_req_pd;
// Code
// SKID READY
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
   if (!nvdla_core_rstn) begin
       cv_dma_rd_req_rdy_f <= 1'b1;
       skid_flop_cv_dma_rd_req_rdy_f <= 1'b1;
   end else begin
       cv_dma_rd_req_rdy_f <= skid_cv_dma_rd_req_rdy_f;
       skid_flop_cv_dma_rd_req_rdy_f <= skid_cv_dma_rd_req_rdy_f;
   end
end

// SKID VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        skid_flop_cv_dma_rd_req_vld <= 1'b0;
    end else begin
        if (skid_flop_cv_dma_rd_req_rdy_f) begin
            skid_flop_cv_dma_rd_req_vld <= cv_dma_rd_req_vld;
        end
   end
end
assign skid_cv_dma_rd_req_vld = (skid_flop_cv_dma_rd_req_rdy_f) ? cv_dma_rd_req_vld : skid_flop_cv_dma_rd_req_vld;

// SKID DATA
always @(posedge nvdla_core_clk) begin
    if (skid_flop_cv_dma_rd_req_rdy_f & cv_dma_rd_req_vld) begin
        skid_flop_cv_dma_rd_req_pd[79-1:0] <= cv_dma_rd_req_pd[79-1:0];
    end
end
assign skid_cv_dma_rd_req_pd[79-1:0] = (skid_flop_cv_dma_rd_req_rdy_f) ? cv_dma_rd_req_pd[79-1:0] : skid_flop_cv_dma_rd_req_pd[79-1:0];


// PIPE READY
assign skid_cv_dma_rd_req_rdy_f = pipe_skid_cv_dma_rd_req_rdy_f || !pipe_skid_cv_dma_rd_req_vld;

// PIPE VALID
always @(posedge nvdla_core_clk or negedge nvdla_core_rstn) begin
    if (!nvdla_core_rstn) begin
        pipe_skid_cv_dma_rd_req_vld <= 1'b0;
    end else begin
        if (skid_cv_dma_rd_req_rdy_f) begin
            pipe_skid_cv_dma_rd_req_vld <= skid_cv_dma_rd_req_vld;
        end
    end
end

// PIPE DATA
always @(posedge nvdla_core_clk) begin
    if (skid_cv_dma_rd_req_rdy_f && skid_cv_dma_rd_req_vld) begin
        pipe_skid_cv_dma_rd_req_pd[79-1:0] <= skid_cv_dma_rd_req_pd[79-1:0];
    end
end


// PIPE OUTPUT
assign pipe_skid_cv_dma_rd_req_rdy_f = cvif_rd_req_ready;
assign cvif_rd_req_valid = pipe_skid_cv_dma_rd_req_vld;
assign cvif_rd_req_pd = pipe_skid_cv_dma_rd_req_pd;

//| eperl: generated_end (DO NOT EDIT ABOVE)
assign cv_dma_rd_req_rdy = cv_dma_rd_req_rdy_f;
endmodule
