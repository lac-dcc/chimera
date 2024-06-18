// This program was cloned from: https://github.com/MiSTer-devel/MiSTerLaggy_MiSTer
// License: GNU General Public License v2.0

///////////////////////////////////////////////////////////////////////////
// Fractional clock enable signal
// W refers to the number of divided down cen signals available
// each one is divided by 2

module jtframe_frac_cen #(parameter W=2)(
    input         clk,
    input         cen_in,

    input   [9:0] n,         // numerator
    input   [9:0] m,         // denominator
    output reg [W-1:0] cen,
    output reg [W-1:0] cenb // 180 shifted
);

wire [10:0] step={1'b0,n};
wire [10:0] lim ={1'b0,m};
wire [10:0] absmax = lim+step;

reg  [10:0] cencnt=11'd0;
reg  [10:0] next;
reg  [10:0] next2;

always @(*) begin
    next  = cencnt+step;
    next2 = next-lim;
end

reg  half    = 1'b0;
wire over    = next>=lim;
wire halfway = next >= (lim>>1)  && !half;

reg  [W-1:0] edgecnt = {W{1'b0}};
wire [W-1:0] next_edgecnt = edgecnt + 1'b1;
wire [W-1:0] toggle = next_edgecnt & ~edgecnt;

always @(posedge clk) begin
    cen  <= {W{1'b0}};
    cenb <= {W{1'b0}};

    if (cen_in) begin
        if( cencnt >= absmax ) begin
            // something went wrong: restart
            cencnt <= 11'd0;
        end else
        if( halfway ) begin
            half <= 1'b1;
            cenb[0] <= 1'b1;
        end
        if( over ) begin
            cencnt <= next2;
            half <= 1'b0;
            edgecnt <= next_edgecnt;
            cen <= { toggle[W-2:0], 1'b1 };
        end else begin
            cencnt <= next;
        end
    end
end


endmodule