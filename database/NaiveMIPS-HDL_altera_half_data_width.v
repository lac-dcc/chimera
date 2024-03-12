// half_data_width.v

// This file was auto-generated as a prototype implementation of a module
// created in component editor.  It ties off all outputs to ground and
// ignores all inputs.  It needs to be edited to make it do something
// useful.
// 
// This file will not be automatically regenerated.  You should check it in
// to your version control system if you want to keep it.

`timescale 1 ps / 1 ps
module half_data_width (
		input  wire        clk,                         //    clock_sink.clk
		input  wire        reset_n,                     //    reset_sink.reset_n
		input  wire [24:0] avalon_slave_address,        //  avalon_slave.address
		input  wire [1:0]  avalon_slave_burstcount,     //              .burstcount
		input  wire [1:0]  avalon_slave_byteenable,     //              .byteenable
		input  wire        avalon_slave_read,           //              .read
		input  wire        avalon_slave_write,          //              .write
		output wire [15:0] avalon_slave_readdata,       //              .readdata
		input  wire [15:0] avalon_slave_writedata,      //              .writedata
		output wire        avalon_slave_readdatavalid,  //              .readdatavalid
		output wire        avalon_slave_waitrequest,    //              .waitrequest
		output wire [25:0] avalon_master_address,       // avalon_master.address
		output wire [1:0]  avalon_master_burstcount,    //              .burstcount
		output wire [1:0]  avalon_master_byteenable,    //              .byteenable
		output wire        avalon_master_read,          //              .read
		output wire        avalon_master_write,         //              .write
		input  wire        avalon_master_waitrequest,   //              .waitrequest
		input  wire [15:0] avalon_master_readdata,      //              .readdata
		output wire [15:0] avalon_master_writedata,     //              .writedata
		input  wire        avalon_master_readdatavalid  //              .readdatavalid
	);


	assign avalon_slave_readdata = avalon_master_readdata;

	assign avalon_slave_waitrequest = avalon_master_waitrequest;

	assign avalon_slave_readdatavalid = avalon_master_readdatavalid;

	assign avalon_master_address = {avalon_slave_address,1'b0};

	assign avalon_master_byteenable = avalon_slave_byteenable;

	assign avalon_master_read = avalon_slave_read;

	assign avalon_master_write = avalon_slave_write;

	assign avalon_master_writedata = avalon_slave_writedata;

	assign avalon_master_burstcount = avalon_slave_burstcount;

endmodule
