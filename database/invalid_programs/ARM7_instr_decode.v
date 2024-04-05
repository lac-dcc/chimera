`define multiply			0
`define multiplyLong		1
`define branchAndExchange	2
`define SingleDataSwap		3
`define HalfwordDataTransferR	4
`define HalfwordDataTransferI	5
`define signedDataTransfer	6
`define dataProcessing		7
`define loadStoreUnsigned			8
`define undefined			9
`define blockDataTransfer	10
`define branch				11
`define coprocessor			12

module inst_decode(ir, type);
input wire [31:0] ir;
output reg[3:0] type;

initial begin
	type = `undefined;
end

//decoding tree done by Bhanu _/\_
always@* begin
	if(ir[27] == 1 && ir[26] ==1) type = `coprocessor;
	
	if(ir[27] == 1 && ir[26] == 0) begin
		if(ir[25] == 0) type = `blockDataTransfer;
		else if(ir[25] == 1) type = `branch;
	end
	
	if(ir[27] == 0 && ir[26] == 1) begin
		if(ir[25] == 0) type = `loadStoreUnsigned;
		else begin
			if(ir[4] == 1) type = `undefined;
			if(ir[4] == 0) type = `loadStoreUnsigned;
		end
	end
	
	if(ir[27] == 0 && ir[26] == 0) begin
		if(ir[25] == 1) type = `dataProcessing;
		
		else begin
			if(ir[11:8] == 4'b1111 && ir[7:4] == 4'b0001) type = `branchAndExchange;
			
			else if( (( ir[7] ==1) && (ir[4] == 1)) == 0) type = `dataProcessing;
			
			else if( ir[6] == 1) type = `signedDataTransfer;
			
			else if( ir[6] == 0 && ir[5] == 1 && ir[22] == 1) type = `HalfwordDataTransferI;
		
			else if( ir[6] == 0 && ir[5] == 1 && ir[22] == 1) type = `HalfwordDataTransferR;
	
			else if( ir[6] == 0 && ir[5] == 0 && ir[24] == 1) type = `SingleDataSwap;
	
			else if( ir[6] == 0 && ir[5] == 0 && ir[24] == 0 && ir[23] ==1) type = `multiplyLong;
			
			else if( ir[6] == 0 && ir[5] == 0 && ir[24] == 0 && ir[23] ==0) type = `multiply;
		end
	end


end
endmodule