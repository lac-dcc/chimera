// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0


module test();

   wire [3:0] a = 4'd0;

   wire signed [3:0] b[1:0];

   assign b[0] = $signed(a);

   initial begin
      $display("b = [%b %b]", b[1], b[0]);
   end

endmodule
