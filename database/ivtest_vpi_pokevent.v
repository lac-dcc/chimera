// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;

    event e_Peek;
    event e_Poke;

    initial begin
	// $dumpvars;
	#0;
	->e_Poke;
	#51 $finish(0);
    end

    always @(e_Poke) begin
	$display("e_Poke received @ %0t", $time);
	#10;
	$display("e_Peek asserted @ %0t", $time);
	->e_Peek;
    end

endmodule
