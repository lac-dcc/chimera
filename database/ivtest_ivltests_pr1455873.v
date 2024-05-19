// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   reg [6:0] bar;
   wire [31:0] foo = {{25{1'b0}}, bar};

   initial begin
      bar = 7'b1111111;
      #1 if (foo !== 32'h00_00_00_7f) begin
	 $display("FAILED -- foo=%h", foo);
	 $finish;
      end

      $display("PASSED");
   end

endmodule // main
