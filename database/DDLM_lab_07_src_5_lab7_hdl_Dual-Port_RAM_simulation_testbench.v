// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
`timescale 1ns/1ns
module testbench;
    // input and output test signals

	reg clk;
	reg rst_n;
	reg [1:0] DC;
	reg [7:0] SW;
	wire [3:0] w_we;
	wire [7:0] data_in_reg;
	wire [3:0] read_addr_reg;
	wire [3:0] write_addr_reg;
	wire [7:0] data_out;
	wire [7:0] HEX0;
	wire [7:0] HEX1;
	wire [7:0] HEX2;
	wire [7:0] HEX3;
	wire [7:0] HEX4;
	wire [7:0] HEX5;

    // creating the instance of the module we want to test
    //  lab7_5 - module name
    //  dut  - instance name ('dut' means 'device under test')
    lab7_5 dut (clk, rst_n, {DC,SW}, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5);
	
initial 
	begin
		// set inital values of signal
		clk = 1;
		DC = 2'b00;
		SW[7:0] = 8'b00001111;
		rst_n = 0;
		#10; rst_n = 1;
		
		// write data in write_addr register
		#50; 
		SW[7:0] = 8'b00000000;
		
		//write data to RAM and read-during-write
        repeat(3)
        begin
			DC = 2'b10;              //select write_addr reg
			#40;                     //write addr to write_addr reg
			DC = 2'b11;              //select RAM
			#40;                     //write data to RAM
			SW = SW+8'b00000001;	 //set new write_addr value
        end

		// read data from DP RAM
		SW[7:0] = 8'b00000000;
		DC = 2'b01;                  //select read_addr reg
		repeat(3)
        begin
			#40;                     //read data from RAM
			SW = SW+8'b00000001;	 //set new write_addr value
        end

		//read-during-write at the same addr
		SW[7:0] = 8'b10101010;
		DC = 2'b00;                  //set new data_in
		#40; 
		
		SW[7:0] = 8'b00000001; 
		DC = 2'b10;                  //set new write_addr nad read_addr
		#40; 
		DC = 2'b01;                  //set new write_addr nad read_addr
		#40; 
		
		DC = 2'b11;                  // write data in DP RAM
	end
	
	assign w_we = dut.w_we;
	assign data_in_reg = dut.data_in_reg;
	assign data_out = dut.data_out;
	assign read_addr_reg = dut.read_addr_reg;
	assign write_addr_reg = dut.write_addr_reg;

	//every 20 ns invert clk 
	always #20 clk = ~clk;

	initial 
		#760 $finish;
	
   // do at the beginning of the simulation
   // print signal values on every change
   initial 
       $monitor("clk=%b rst_n=%b DC=%b SW[7:0]=%h HEX0=%h HEX1=%h HEX2=%h HEX3=%h HEX4=%h HEX5=%h w_we=%b data_in_reg=%h read_addr_reg=%h write_addr_reg=%h data_out=%h", 
			clk, rst_n, DC, SW[7:0], HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, w_we, data_in_reg, read_addr_reg, write_addr_reg, data_out );

   // do at the beginning of the simulation
   initial 
       $dumpvars;  //iverilog dump init

endmodule
