// This program was cloned from: https://github.com/Naminar/tlb-v
// License: MIT License


`define TAG_RANGE [SADDR-$clog2(NSET)-SPAGE+SPCID+SADDR-SPAGE-1:SPCID+SADDR-SPAGE]
`define PCID_RANGE [SPCID+SADDR-SPAGE-1:SADDR-SPAGE]

module tlb_tb;

    reg clk;
    reg shutdown;
    reg insert;
    reg validate;
    reg [63:0] va;
    reg [63:0] pa;
    reg [11:0] pcid;
    wire [63:0] ta;
    wire TLB_hit;
    wire STLB_hit;
    wire TLB_miss;
    wire STLB_miss;
    wire [63:0] stat_hit;
    wire [63:0] stat_miss;
    wire [63:0] stat_prefetch;
    
    parameter SADDR=64; 
    parameter SPAGE=12; 
    parameter NSET=8;   
    parameter SPCID=12; 
    parameter NWAY=8;    


    // TLB tlb(clk, shutdown, insert, va, pa, pcid, o_addr, TLB_hit, TLB_miss);
    // PMU pmu(clk, TLB_hit, TLB_miss, insert, STLB_hit, STLB_miss, insert, stat_hit, stat_miss, stat_prefetch);
    // STLB stlb(clk, shutdown, insert, validate, va, pa, pcid, o_addr, STLB_hit, STLB_miss);
    
    MMU mmu(clk, shutdown, insert, insert, validate, va, pa, pcid, ta);

    initial begin
        $dumpfile("tlb_tb.vcd");
        $dumpvars(0,tlb_tb);
        // $monitor("");
        // $monitor("%t | clk = %d | pcid = %d | plru = %b | tlb hit = %b | tlb miss = %b | %d | %d | %d | %d", $time, clk, tlb.entries[3'd7][7]`PCID_RANGE, tlb.plru[3'd7], tlb.hit, tlb.miss, tlb.entries[3'd7][7]`PCID_RANGE, tlb.entries[3'd7][7]`TAG_RANGE, tlb.entries[3'd7][3]`PCID_RANGE, tlb.entries[3'd7][3]`TAG_RANGE);

        clk = 0;
        shutdown = 0;
        insert = 0;
        validate = 0;
        
        pcid = 1'b0;
        va = 64'hfffffffffffffff1;
        pa = 0;

        #20

        #1 
        assign shutdown = 1;
        #1
        assign shutdown = 0;
        #1

        assign insert = 1;
        pcid = 1'b0;
        va = 64'hfffffffffffffff1;
        pa = 0;
        #4
        assign insert = 0; 
        #1

        pcid = 1'b1;
        va = 64'hfffffffffffffff1;
        pa = 0;
        #20
        pcid = 1'b0;
        va = 64'hfffffffffffffff1;
        pa = 0;
        #20
        pcid = 1'b1;
        va = 64'hfffffffffffffff1;
        pa = 0;
        #20
        pcid = 1'b0;
        va = 64'hfffffffffffffff1;
        pa = 0;
        #20
        pcid = 1'b1;
        va = 64'hfffffffffffffff1;
        pa = 0;

        #100 $finish;
    end

    always #1 clk = ~clk;
endmodule