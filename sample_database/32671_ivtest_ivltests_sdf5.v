// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module DFF (input D, input C, output reg Q);

   always @(posedge C)
     Q <= D;

   specify
      (posedge C => (Q +: D)) = (1,1);
   endspecify

endmodule

`endcelldefine

module tb;

   reg clk, d;
   wire q;
   DFF dut(.D(d), .C(clk), .Q(q));

   initial begin
      clk = 0;
      d = 0;
      $monitor($time,, "D=%b, Q=%b, clk=%b", d, q, clk);
      $sdf_annotate("ivltests/sdf5.sdf");

      #10 clk = 1;
      #10 clk = 0;
      d = 1;
      #10 clk = 1;
      #10 clk = 0;
      #10 $finish(0);
   end

endmodule // tb
