// This program was cloned from: https://github.com/stanford-ppl/spatial-lang
// License: MIT License

// ghrd_10as066n2_button_pio.v

// Generated using ACDS version 17.1 240

`timescale 1 ps / 1 ps
module ghrd_10as066n2_button_pio (
		input  wire        clk,        //                 clk.clk
		input  wire [3:0]  in_port,    // external_connection.export
		output wire        irq,        //                 irq.irq
		input  wire        reset_n,    //               reset.reset_n
		input  wire [1:0]  address,    //                  s1.address
		input  wire        write_n,    //                    .write_n
		input  wire [31:0] writedata,  //                    .writedata
		input  wire        chipselect, //                    .chipselect
		output wire [31:0] readdata    //                    .readdata
	);

	ghrd_10as066n2_button_pio_altera_avalon_pio_171_3t26uui button_pio (
		.clk        (clk),        //   input,   width = 1,                 clk.clk
		.reset_n    (reset_n),    //   input,   width = 1,               reset.reset_n
		.address    (address),    //   input,   width = 2,                  s1.address
		.write_n    (write_n),    //   input,   width = 1,                    .write_n
		.writedata  (writedata),  //   input,  width = 32,                    .writedata
		.chipselect (chipselect), //   input,   width = 1,                    .chipselect
		.readdata   (readdata),   //  output,  width = 32,                    .readdata
		.in_port    (in_port),    //   input,   width = 4, external_connection.export
		.irq        (irq)         //  output,   width = 1,                 irq.irq
	);

endmodule
