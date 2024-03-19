/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.

 ****************** Original test module. Do not Modify! ******************
 
 */

module inst_mem(

	input	wire		ce,    // chip select signal
	input	wire[31:0]	addr,  // instruction address
	output 	reg [31:0]	inst   // instruction
	
);

	reg[31:0]  inst_memory[0:1000];

	initial $readmemb ("./TestCode/machinecode.txt", inst_memory);	// read test assembly code file

always @ (*) begin
	if (!ce) 
		inst <= 32'b0;
	else
		inst <= inst_memory[addr[31:2]];
end

endmodule