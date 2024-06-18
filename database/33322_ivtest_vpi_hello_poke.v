// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   reg [5*8-1 : 0] hello;

   initial begin
      hello = "XXXXX";

      if (hello !== "XXXXX") begin
	 $display("FAILED -- X = %h", hello);
	 $finish;
      end

      $hello_poke(hello);

      if (hello !== "Hello") begin
	 $display("FAILED -- Hello = %h", hello);
	 $finish;
      end

      $display("PASSED");
   end // initial begin

endmodule // main
