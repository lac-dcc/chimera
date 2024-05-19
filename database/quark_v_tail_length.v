// This program was cloned from: https://github.com/drom/quark
// License: MIT License


/*
module tail_length (clk, reset_n);
input           clk;
input           reset_n;

// declarations
always @(l0, l1)
begin
l0
l1
end

*/
module tail_length (ir, len);

input [3:0] ir;
output [3:0] len;

reg [3:0] len;
reg ir32;

/*
      ..00  ..01  ..10  ..11
00..  1     0     0     0
01..  1     ?     ?     0
10..  1     1     0     0
11..  1     1     0     0
len[0] = (ir[3] & !ir[1]) | (!ir[1] & !ir[0]);

      ..00  ..01  ..10  ..11
00..  0     1     0     0
01..  0     ?     ?     0
10..  0     0     0     0
11..  0     0     0     0
len[1] = !ir[3] & !ir[2] & !ir[1] & ir[0];

      ..00  ..01  ..10  ..11
00..  0     0     1     0
01..  0     ?     ?     0
10..  0     0     0     0
11..  0     0     0     0
len[2] = !ir[3] & !ir[2] & ir[1] & !ir[0];

      ..00  ..01  ..10  ..11
00..  0     0     0     1
01..  0     ?     ?     0
10..  0     0     0     0
11..  0     0     0     0
len[3] = !ir[3] & !ir[2] & ir[1] & ir[0];

    ..00  ..01  ..10  ..11
00..  1     2     4     8
01..  1     ?     ?     0
10..  1     1     0     0
11..  1     1     0     0
*/

always @ (ir)
begin
    len = {
        (ir == 4'b0011),
        (ir == 4'b0010),
        (ir == 4'b0001),
        ((ir | 4'b0101) == 4'b1101) | ((ir | 4'b1100) == 4'b1100)
    };
end

// 107.89 / 121.08
// always @ (ir)
// begin
//     ir32 = |ir[3:2];
//     len = {
//         (!ir32 &  ir[1] &  ir[0]),
//         (!ir32 &  ir[1] & !ir[0]),
//         (!ir32 & !ir[1] &  ir[0]),
//         ((ir[3] & !ir[1]) | (!ir[1] & !ir[0]))
//     };
// end

// always @ (ir)
//     casez (ir)
//     4'b??00: len = 1;
//     4'b1?0?: len = 1;
//     4'b0001: len = 2;
//     4'b0010: len = 4;
//     4'b0011: len = 8;
//     default  len = 0;
//     endcase

endmodule
