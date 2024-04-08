// instantiation of lpm_ram_dq, 16-bit data, 256 address location

module mem_z 
	#(parameter WIDTH = 32, ADDR_WIDTH = 7)
	(addr, clk, dataout);

// port instantiation
input   [ADDR_WIDTH - 1 : 0] addr;
input   clk;

output  [WIDTH - 1 : 0] dataout;

// initialize some zero values. 
wire [WIDTH - 1 : 0] datain;
assign datain = 0;
	
wire we;		// 	write not enable
assign we = 0;

// instantiating lpm_ram_dq
lpm_ram_dq ram (.data(datain), .address(addr), .we(we), .inclock(clk), 
                .outclock(clk), .q(dataout));

// passing the parameter values

defparam ram.lpm_width = WIDTH;
defparam ram.lpm_widthad = ADDR_WIDTH;
defparam ram.lpm_indata = "REGISTERED";
defparam ram.lpm_outdata = "REGISTERED";
defparam ram.lpm_file = "mem_z.mif";

endmodule