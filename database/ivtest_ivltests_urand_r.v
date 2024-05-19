// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`begin_keywords "1364-2005"
module top;
  reg [31:0] var;

  initial begin
    $monitor(var);
    var = 0;
    repeat (60) begin
       #1 var = $urandom_range(16,0);
//       #1 var = $urandom_range(4294967295,0);
//       #1 var = $urandom_range(-1,0);
    end
  end
endmodule
`end_keywords
