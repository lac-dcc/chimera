// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug;

   reg [31:0] a;
   integer    i;

   initial
     begin
	i=4;
	a=0;
	a[i*4+:2] = 2'b11;

	$display("%h",a);
	if (a !== 32'h00030000) begin
	   $display("FAILED");
	   $finish;
	end

	$display("PASSED");
     end
endmodule
