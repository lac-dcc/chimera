// This program was cloned from: https://github.com/Naminar/tlb-v
// License: MIT License

/********************************************************************
                            PLRU tree
*********************************************************************

      0b  
    /    \
  1b      2b
 /  \    /  \
3b   4b 5b   6b

if nb is 1 it direct to the right, else(0) to the left. 

In memory representation:
|0b|1b|2b|3b|4b|5b|6b|

To go to the next bit in tree representation use ind*2 + 1 or 2, 1 - to the left
and 2 - to the right.

For each hit or new insertion in cache there's a need to rebuild plru-tree. 
*/ 

module WAY 
#(  parameter SADDR=64, // size of address
    parameter SPAGE=12, // size of page
    parameter NSET=8,   // set number
    parameter SPCID=12, // size of pcid
    parameter NWAY=8    // way number
)  ();

    reg [SADDR-$clog2(NWAY)-1:0]    tag  [NSET-1:0];
    reg [SPCID-1:0]                 pcid [NSET-1:0];
    reg [SADDR-SPAGE-1:0]           pa   [NSET-1:0];

    integer i;
    initial begin
        for (i = 0; i < NSET; i = i + 1) begin
            pa[i]   = 0;        
            pcid[i] = 0;
            tag[i]  = 0;
        end        
    end
endmodule

/********************************************************************
                            (MRU+1)%3 PLRU-4
*********************************************************************

      0b  
    /    \
  1b      2b
 /  \    /  \
3b   4b 5b   6b

if nb is 1 it direct to the right, else(0) to the left. 

In memory representation:
|0b|1b|2b|3b|4b|5b|6b|

To go to the next bit in tree representation use ind*2 + 1 or 2, 1 - to the left
and 2 - to the right.

For each hit or new insertion in cache there's a need to rebuild plru-tree. 
*/ 

module STLB_WAY 
#(  parameter SADDR=64, // size of address
    parameter SPAGE=12, // size of page
    parameter NSET=100,   // set number
    parameter SPCID=12, // size of pcid
    parameter NWAY=12    // way number
)  
(
    input shutdown, 
    input validate, 
    input [SPAGE-1:0] va,
    input [SPCID-1:0] pcid_va
);

    reg [SADDR-$clog2(NWAY)-1:0]    tag  [NSET-1:0];
    reg [SPCID-1:0]                 pcid [NSET-1:0];
    reg [SADDR-SPAGE-1:0]           pa   [NSET-1:0];
    reg                             valid[NSET-1:0]; // valid bit

    integer i;
    initial begin
        for (i = 0; i < NSET; i = i + 1) begin
            pa[i]   = 0;        
            pcid[i] = 0;
            tag[i]  = 0;
            valid[i]    = 0;
        end        
    end

    always @(posedge shutdown) begin: shutdown_stlb
        integer  s_ind;
        for (s_ind = 0; s_ind < NSET; s_ind = s_ind + 1) begin
            tag[s_ind]  <= 0;
            pcid[s_ind] <= 0;
            pa[s_ind]   <= 0;
            valid[s_ind]<= 0; 
        end
    end
endmodule