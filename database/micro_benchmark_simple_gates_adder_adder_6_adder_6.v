// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

// Creating a scaleable adder

module adder_6(cout, sum, a, b, cin);
output cout;
output [5:0] sum; 	 // sum uses the size parameter
input cin;
input [5:0] a, b;  // 'a' and 'b' use the size parameter

assign {cout, sum} = a + b + cin;

endmodule









