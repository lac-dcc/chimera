`include "defines.v"

module regfile(
    input  wire                      clock,
	input  wire                      reset,

	input  wire                      write_enable,
	input  wire[`RegisterAddressBus] write_address,
	input  wire[`RegisterBus]        write_data,

	input  wire                      read_enable1,
	input  wire[`RegisterAddressBus] read_address1,
	output reg[`RegisterBus]         read_data1,
	
	input  wire                      read_enable2,
	input  wire[`RegisterAddressBus] read_address2,
	output reg[`RegisterBus]         read_data2
);

    reg[`RegisterBus]  regs[0:`RegisterNum - 1];

    always @ (posedge clock) begin
	     if (reset == `ResetDisable) begin
		      if ((write_enable == `WriteEnable) &&
			  		(write_address != `RegisterNumLog2'h0)) begin
				    regs[write_address] <= write_data;
				end
		  end
	 end

	 always @ (*) begin
	     if (reset == `ResetEnable) begin
		      read_data1 <= `ZeroWord;
		  end else if (read_address1 == `RegisterNumLog2'h0) begin
		      read_data1 <= `ZeroWord;
		  end else if ((read_address1 == write_address) &&
		              (write_enable == `WriteEnable) &&
						  (read_enable1 == `ReadEnable)) begin
		      read_data1 <= write_data;		  
		  end else if (read_enable1 == `ReadEnable) begin
		      read_data1 <= regs[read_address1];
		  end else begin
		      read_data1 <= `ZeroWord;
		  end
	 end
	 
	 always @ (*) begin
	     if (reset == `ResetEnable) begin
		      read_data2 <= `ZeroWord;
		  end else if (read_address2 == `RegisterNumLog2'h0) begin
		      read_data2 <= `ZeroWord;
		  end else if ((read_address2 == write_address) &&
		              (write_enable == `WriteEnable) &&
						  (read_enable2 == `ReadEnable)) begin
		      read_data2 <= write_data;		  
		  end else if (read_enable2 == `ReadEnable) begin
		      read_data2 <= regs[read_address2];
		  end else begin
		      read_data2 <= `ZeroWord;
		  end
	 end
	 
endmodule