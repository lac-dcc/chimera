// This program was cloned from: https://github.com/bangonkali/sram
// License: MIT License

// iverilog -o tb_i2c.vvp tb_i2c.v i2c_mock_master.v i2c_slave.v && vvp tb_i2c.vvp
// gtkwave.exe tb_i2c.vcd

`timescale 1ns/1ps
`define period 10
module tb_i2c();

	reg clk;
	reg start;
	reg reset;
	reg write;
	reg [7:0] write_data;
	reg [6:0] address;
	wire error;
	wire ready;
	wire [7:0] read_data;

	wire [7:0] curr_data [3:0];
	reg [6:0] slave_addrs [3:0];
	reg [2:0] slave_sel;
	reg [7:0] saved_data;
	
	wire [6:0] rcvd_addr [3:0];
	wire rcvd_mode[3:0];
	wire [2:0] state [3:0];

	wire [7:0] curr_data1;
	wire [7:0] curr_data2;
	wire [7:0] curr_data3;
	wire [7:0] curr_data4;
		
	wire [6:0] slave_address1;
	wire [6:0] slave_address2;
	wire [6:0] slave_address3;
	wire [6:0] slave_address4;
	
	assign curr_data0 = curr_data[0];
	assign curr_data1 = curr_data[1];
	assign curr_data2 = curr_data[2];
	assign curr_data3 = curr_data[3];
	
	assign slave_address0 = slave_addrs[0];
	assign slave_address1 = slave_addrs[1];
	assign slave_address2 = slave_addrs[2];
	assign slave_address3 = slave_addrs[3];
	
	integer txn_no;

	wire scl;
	tri1 sda;

	i2c_mock_master uut_mock_master (.clock(clk), .start(start), .reset(reset), .write(write), .write_data(write_data), .read_data(read_data), .address(address), .ready(ready), .error(error), .sda(sda), .scl(scl));
	i2c_slave s0 (.sda(sda), .scl(scl), .my_addr(slave_addrs[0]), .curr_data(curr_data[0]), .rcvd_addr(rcvd_addr[0]), .rcvd_mode(rcvd_mode[0]), .state(state[0]));
	i2c_slave s1 (.sda(sda), .scl(scl), .my_addr(slave_addrs[1]), .curr_data(curr_data[1]), .rcvd_addr(rcvd_addr[1]), .rcvd_mode(rcvd_mode[1]), .state(state[1]));
	i2c_slave s2 (.sda(sda), .scl(scl), .my_addr(slave_addrs[2]), .curr_data(curr_data[2]), .rcvd_addr(rcvd_addr[2]), .rcvd_mode(rcvd_mode[2]), .state(state[2]));
	i2c_slave s3 (.sda(sda), .scl(scl), .my_addr(slave_addrs[3]), .curr_data(curr_data[3]), .rcvd_addr(rcvd_addr[3]), .rcvd_mode(rcvd_mode[3]), .state(state[3]));

	always begin
	#(`period/2)
	clk = ~clk;
	end

	initial begin
		//$vcdplusfile("tb_I2C_master_writeread_mapped.vpd");
		//$vcdpluson;
		
		$dumpfile("tb_i2c.vcd");
		$dumpvars;
			
		reset = 1;
		start = 0;
		clk = 0;
		write = 1;
		slave_sel = 0;
		txn_no = 1;
		slave_addrs[0] = 80;	//You can edit
		slave_addrs[1] = 81;	//these addresses
		slave_addrs[2] = 82;
		slave_addrs[3] = 83;//if you want.
		#(`period * 5)
		reset = 0;

		//new test
		write = 1;
		write_data =  8'h21;
		slave_sel = 0;
		address = slave_addrs[slave_sel];
		#`period
		$display("--- Transaction %0d ---", txn_no);
		txn_no = txn_no + 1;
		start = 1;
		#`period
		start = 0;
		#(`period * 100)

		//new test
		write = 1;
		write_data =  8'h56;
		slave_sel = 1;
		address = slave_addrs[slave_sel];
		#`period
		$display("--- Transaction %0d ---", txn_no);
		txn_no = txn_no + 1;
		start = 1;
		#`period
		start = 0;
		#(`period * 100)

		//new test
		write = 1;
		write_data =  8'h18;
		slave_sel = 2;
		address = slave_addrs[slave_sel];
		#`period
		$display("--- Transaction %0d ---", txn_no);
		txn_no = txn_no + 1;
		start = 1;
		#`period
		start = 0;
		#(`period * 100)

		//new test
		write = 0;
		write_data =  8'h21;
		slave_sel = 3;
		address = slave_addrs[slave_sel];
		#`period
		$display("--- Transaction %0d ---", txn_no);
		txn_no = txn_no + 1;
		start = 1;
		#`period
		start = 0;
		#(`period * 100)

		write = 0;
		write_data =  8'h21;
		slave_sel = 0;
		address = slave_addrs[slave_sel];
		#`period
		$display("--- Transaction %0d ---", txn_no);
		txn_no = txn_no + 1;
		start = 1;
		#`period
		start = 0;
		#(`period * 100)

		write = 0;
		write_data =  8'h86;
		slave_sel = 1;
		address = slave_addrs[slave_sel];
		#`period
		$display("--- Transaction %0d ---", txn_no);
		txn_no = txn_no + 1;
		start = 1;
		#`period
		start = 0;
		#(`period * 100)

		// Add more test cases here. You should
		// be able to write to all slaves.

		$finish();
	end


	// This is needed to sample the data
	// that will be read by the wrapper
	always @(negedge ready) begin 
		saved_data = curr_data[slave_sel];
	end

	always @(posedge ready) begin
		if (reset == 0) begin
			$display("--- New Transaction ---");
			if (write == 1)
				$display("Flow: write");
			else
				$display("Flow: read");
			if (error == 1) begin
				$display("Error: yes");
				$display("Reason: no ack");
			end else begin
				if (write == 1) begin
					if (write_data != curr_data[slave_sel]) begin
						$display("Error: yes");
						$display("Reason: wrong data");
					end else begin
						$display("No error.");
					end
				end else begin
					if (read_data != saved_data) begin
						$display("Error: yes");
						$display("Reason: wrong data");
					end else begin
						$display("No error.");
					end
				end
			end
		end
	end
endmodule
