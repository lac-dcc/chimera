// This program was cloned from: https://github.com/bangonkali/sram
// License: MIT License

`define period 10
module i2c_sram (sda, scl, ce);
	inout sda;
	input scl;
	input ce;

	integer count;
	
	parameter slave_addrs = 1;
	wire current_data;
	
	// i2c_mock_master uut_mock_master (.clock(clk), .start(start), .reset(reset), .write(write), .write_data(write_data), .read_data(read_data), .address(address), .ready(ready), .error(error), .sda(sda), .scl(scl));
	i2c_slave u_slave (
		.sda(sda), 
		.scl(scl), 
		.my_addr(slave_addrs),
		.curr_data(current_data),
		.rcvd_addr(rcvd_addr),
		.state(state),
		.rcvd_mode(rcvd_mode)
	);
	
	sram u_sram(
		.address(address),
		.data(data),
		.chip_enable(chip_enable), 
		.write_enable(write_enable), 
		.output_enable(output_enable),
		.reset(reset)
	);
	
	always @(posedge scl) begin
		
	end


	
endmodule