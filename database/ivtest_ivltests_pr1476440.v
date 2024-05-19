// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`timescale 1ns/10ps

module test();
reg ck;
integer cnt;
real tval;

initial begin
ck <= 0;
cnt <= 0;
tval <= 0.0;
end


always #2 ck <= !ck;


always @(posedge ck) begin
cnt <= cnt + 1;
tval <= $realtime;
$display ("tval = %g", tval);

if (cnt >= 5) begin
$finish(0);
end
end

endmodule // test
