// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = a ^ b ^ cin;
    assign cout = a & b | a & cin | b & cin;

endmodule