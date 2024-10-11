// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

/*-----------------------------------------------\
 --         
Used to select whether the output address is a PC (program count) address 
or a data/port address. 

The first four clock cycles of each instruction cycle are used to 
read instructions from the ROM species and the output is the PC address; 
the last four clock cycles are used to read or write to RAM or the port.

The address multiplexer and the data controller perform very similar functions.

The fetch signal is used to control the address output, 
high level output pc_addr ,low level output ir_addr ;pc_addr instruction address.
pc_addr Instruction address;
ir_addr ram or port address          --
\-----------------------------------------------*/

module adr (
    	input fetch , // enable
    	input [12:0] ir_addr ,
    	input [12:0] pc_addr ,

    	output wire [12:0] addr
    	
    );

	assign addr = fetch ? pc_addr : ir_addr ;
    
endmodule    