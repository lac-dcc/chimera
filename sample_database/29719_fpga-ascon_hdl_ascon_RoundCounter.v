// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module RoundCounter (
	// Inputs
    input        clk,
    input        rst,
    input        permutation_start,
    input        permutation_ready,

	// Outputs
    output [4:0] counter
);
    reg [4:0] ctr;
    always @(posedge clk) begin
        if(!rst)
            ctr <= 0;
        else begin
            if(permutation_ready || ~permutation_start)
                ctr <= 0;
            else if(permutation_start)
                ctr <= ctr + 1;
        end
    end
    assign counter = ctr;
endmodule