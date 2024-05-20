// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module ( input [1:0] A, input [1:0] B, output z ); 
    always @(*) begin
    if(A == B)
        z = 1;
    else
        z = 0;
    end
endmodule