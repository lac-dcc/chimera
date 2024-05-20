// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

`timescale 1ns / 1ns

module PermutationTB();

	reg				clock = 0;
	reg 			resetn;
	reg				permutation_start;
	wire			permutation_ready;
	wire 	[4:0] 	ctr;
	reg 	[4:0]	rounds;
	reg 	[319:0]	S_in;
	wire	[319:0]	S_out;
    integer 		check_time;

	Permutation p(
		.clk(clock),
		.rst(resetn),
		.ctr(ctr),
		.S(S_in),
		.rounds(rounds),
		.start(permutation_start),
		.out(S_out),
		.done(permutation_ready)
	);

	RoundCounter rc(
		clock,
		resetn,
		permutation_start,
		permutation_ready,
		ctr
	);

	// Generate clock signal
	initial begin
		clock = 1;
		forever #5 clock <= ~clock;
	end

	initial begin
		$dumpfile("test_permutation.vcd");
		$dumpvars;
    	$display("Start!");
		resetn = 0;
		#10 
		resetn = 1;
		#10 
		resetn = 1;
		S_in = 'hb1052995b8707739d6d42cbb78bb010af1c1629ec1ff700bda64243d428eb536db31c36d4de2971e;
		rounds = 12;
		$display("Permutation Input:\t%h", S_in);
		$display("Number of rounds:\t%d", rounds);
		permutation_start = 1;
        check_time = $time;
	end

	always @(*) begin
		$monitor("Current permutation round:\t%d, Time:\t%0t", ctr, $time);
        if(permutation_ready) begin
            check_time = $time - check_time;
            $display("Permutation done! It took%d clock cycles", check_time);
            $display("Permutation Output:\t%h", S_out);
			$display("Is permutation ready:", permutation_ready);
            $finish;
        end
    end
endmodule
