// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

module test(
    input                 rst, 
    input                 clk,
    input                 a0,
    input                 wr_n,
    input          [ 7:0] din,
    output signed  [15:0] xleft,
    output signed  [15:0] xright,
    output                sample,
    output         [ 7:0] dout
);

wire      wr_n, cen_fm, cen_fm2;
wire      a0;
wire [7:0] din, dout;

jtframe_cen3p57 u_cen(
    .clk        ( clk       ),       // 48 MHz
    .cen_3p57   ( cen_fm    ),
    .cen_1p78   ( cen_fm2   )
);

wire    ct1, ct2, irq_n;

 jt51 uut(
    .rst        (  rst      ),    // reset
    .clk        (  clk      ),    // main clock
    .cen        (  cen_fm   ),    // clock enable
    .cen_p1     (  cen_fm2  ), // clock enable at half the speed
    .cs_n       (  1'b0     ),   // chip select
    .wr_n       (  wr_n     ),   // write
    .a0         (  a0       ),
    .din        (  din      ), // data in
    .dout       (  dout     ), // data out
    // peripheral control
    .ct1        ( ct1       ),
    .ct2        ( ct2       ),
    .irq_n      ( irq_n     ),  // I do not synchronize this signal
    // Low resolution output (same as real chip)
    .sample     ( sample    ), // marks new output sample
    .left       (           ),
    .right      (           ),
    // Full resolution output
    .xleft      ( xleft     ),
    .xright     ( xright    )
);

endmodule


module jtframe_cen3p57(
    input      clk,       // 48 MHz
    output reg cen_3p57,
    output reg cen_1p78
);

wire [10:0] step=11'd105;
wire [10:0] lim =11'd1408;
wire [10:0] absmax = lim+step;

reg  [10:0] cencnt=11'd0;
reg  [10:0] next;
reg  [10:0] next2;

always @(*) begin
    next  = cencnt+11'd105;
    next2 = next-lim;
end

reg alt=1'b0;

always @(posedge clk) begin
    cen_3p57 <= 1'b0;
    cen_1p78 <= 1'b0;
    if( cencnt >= absmax ) begin
        // something went wrong: restart
        cencnt <= 11'd0;
        alt    <= 1'b0;
    end else
    if( next >= lim ) begin
        cencnt <= next2;
        cen_3p57 <= 1'b1;
        alt    <= ~alt;
        if( alt ) cen_1p78 <= 1'b1;
    end else begin
        cencnt <= next;
    end
end
endmodule
