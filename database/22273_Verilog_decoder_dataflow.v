// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
 P1.1 3X8 DECODER DATAFLOW
 ************************************************/

 module decode_3_8_df(Y,I,En);
 	input [2:0]I;
 	input En;
 	output [7:0]Y;

 	assign Y = {En & ~I[0] & ~I[1] & ~I[2],
 				En & ~I[0] & ~I[1] & I[2],
 				En & ~I[0] & I[1] & ~I[2],
 				En & ~I[0] & I[1] & I[2],
 				En & I[0] & ~I[1] & ~I[2],
 				En & I[0] & ~I[1] & I[2],
 				En & I[0] & I[1] & ~I[2],
 				En & I[0] & I[1] & I[2]};

 endmodule