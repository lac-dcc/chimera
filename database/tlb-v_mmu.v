// This program was cloned from: https://github.com/Naminar/tlb-v
// License: MIT License

module MMU
(
    input clk,
    input shutdown,
    input ex_tlb_insert,
    input ex_stlb_insert,
    input validate,
    input [63:0] va, 
    input [63:0] ex_pa,
    input [11:0] pcid,
    output [63:0] ta
);
    wire TLB_hit;
    wire STLB_hit;
    wire TLB_miss;
    wire STLB_miss;
    wire [63:0] stat_hit;
    wire [63:0] stat_miss;
    wire [63:0] stat_prefetch;

    reg tlb_insert;
    reg stlb_insert;
    reg [63:0] pa;
    reg ctrl = 1'b0;

    TLB tlb(clk, shutdown, tlb_insert, va, pa, pcid, ta, TLB_hit, TLB_miss);
    PMU pmu(clk, TLB_hit, TLB_miss, tlb_insert, STLB_hit, STLB_miss, stlb_insert, stat_hit, stat_miss, stat_prefetch);
    STLB stlb(clk, TLB_miss, shutdown, stlb_insert, validate, va, pa, pcid, ta, STLB_hit, STLB_miss);

// fancy inclusion policy
    always @(posedge clk) begin
        tlb_insert  <= ex_tlb_insert;
        stlb_insert <= ex_stlb_insert;
        pa <= ex_pa;
        if (TLB_miss)
            ctrl <= 1'b1;
        if (ctrl && STLB_hit) begin
            tlb_insert <= 1'b1;
            ctrl <= 1'b0;
            pa <= ta; // for tlb insertion: pa is a source
        end else if (ctrl && STLB_miss) begin
            tlb_insert <= 1'b1;
            ctrl <= 1'b0;
        end
    end

endmodule