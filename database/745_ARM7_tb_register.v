// This program was cloned from: https://github.com/chsasank/ARM7
// License: MIT License

module register_test;

reg[3:0] read_address;
reg[3:0] write_address;

reg[31:0] write_data;
reg write_enable = 0;

reg[31:0] pc_update;
reg pc_write;

reg clk;

wire[31:0] out_data_1;
wire[31:0] cspr;
wire[31:0] pc;

register_file RegisterFile(	//inputs
							.in_address1(read_address),
							.in_address2(),
							.in_address3(),
							.in_address4(write_address),

							.universal_read_address(),
							
							.in_data(write_data),
							.write_enable(write_enable),
							.pc_update(pc_update), 
							.pc_write(pc_write), 
							.cspr_write(), 
							.cspr_update(),
							.clk(clk), 
							
							//outputs
							.out_data1(out_data_1),
							.out_data2(),
							.out_data3(),
							
							.universal_out_data(),
							
							.pc(pc), 
							.cspr(cspr)			
							
							);

initial begin
	#1 clk = 1;

	#2 clk = 0;

	#3 clk = 1;
	read_address = 0;
	
	#4 clk = 0;
	$display("pc- %h" , pc);

	#5 clk = 1;
	pc_update = pc+4;
	pc_write = 1;

	#6 clk = 0;
	$display("pc %h", pc);
end

endmodule