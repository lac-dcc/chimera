// This program was cloned from: https://github.com/MiSTer-devel/NeoGeo_MiSTer
// License: GNU General Public License v2.0

// simulate registers with async clocks in the 'clock' domain
// has a delay of one clock

module register (
    input clock,
    input s,    // set
    input r,    // reset
    input c,    // write clock
    input [WIDTH-1:0] d,    // new value
    output reg [WIDTH-1:0] q    // value
);

parameter WIDTH = 1;

reg [WIDTH-1:0] val_reg;
reg c_d;
/*
always @(posedge c, posedge s, posedge r)
begin
    if (r)
        q <= 0;
    else if (s)
        q <= 1;
    else
        q <= d;
end
*/

always @(*) begin
    if (r)
        q = 0;
    else if (s)
        q = {WIDTH{1'b1}};
    else
        q = val_reg;
end

always @(posedge clock) begin
    c_d <= c;
    if  (~c_d & c & ~r & ~s)
        val_reg <= d;
    else
        val_reg <= q;
end

endmodule