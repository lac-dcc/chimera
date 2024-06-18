// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

// Creating a scaleable adder

module adder_4(cout, sum, a, b, cin);
output cout;
output [3:0] sum; 	 // sum uses the size parameter
input cin;
input [3:0] a, b;  // 'a' and 'b' use the size parameter

assign {cout, sum} = a + b + cin;

endmodule









