module SpiSlave #(
	parameter BufferSize = 8
)(  
  input wire sck,
  input wire ss,
  input wire mosi,  
  output reg [BufferSize - 1:0] mosiBuffer,
  input wire [BufferSize - 1:0] misoBuffer,
  output reg miso,  
  output reg shiftComplete  
);

reg [15:0] bitNumber;

always @(posedge sck)
	begin
		if (!ss)
			begin		
				mosiBuffer <= { mosiBuffer[BufferSize - 2:0], mosi };
				
				if (bitNumber != BufferSize - 1)
					begin
						shiftComplete <= 0;
						bitNumber <= bitNumber + 1;
					end
				else
					begin
						shiftComplete <= 1;
						bitNumber <= 0;
					end
					
			end
		else
			begin
				bitNumber <= 0;
				mosiBuffer <= 0;
				shiftComplete <= 0;
			end
	end
 
 
always @(negedge sck) 
	miso <= ~ss ? misoBuffer[BufferSize - 1 - bitNumber] : 0;	
  
endmodule
