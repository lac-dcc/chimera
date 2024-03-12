`include "defines.v"

module ctrl(

	input wire										rst,
	
	input wire							stallreq_from_if,
	input wire							stallreq_from_mem,

	input wire                   stallreq_from_id,

  //来自执行阶段的暂停请求
	input wire                   stallreq_from_ex,
	
	input wire[31:0]					excepttype_i,
	input wire[`RegBus]				csr_mepc_i,
	input wire[`RegBus]				csr_mtvec_i,
	
	output reg[5:0]              stall,
	
	output reg[`RegBus]				new_pc,
	output reg							flush
	
);


	always @ (*) begin
		if(rst == `RstEnable) begin
			stall = 6'b000000;
			flush = 1'b0;
			new_pc = `ZeroWord;
		end else if(excepttype_i != `ZeroWord) begin
			flush = 1'b1;
			stall = 6'b000000;
			
			if(excepttype_i == 32'h0000000a) begin						//Mret
				new_pc = csr_mepc_i;
			end else begin
				new_pc = csr_mtvec_i;
			end
		end else if(stallreq_from_mem == `Stop) begin
			stall = 6'b011111;
			flush = 1'b0;
		end else if(stallreq_from_ex == `Stop) begin
			stall = 6'b001111;
			flush = 1'b0;
		end else if(stallreq_from_id == `Stop) begin
			stall = 6'b000111;		
			flush = 1'b0;
		end else if(stallreq_from_if == `Stop) begin
			stall = 6'b000011;										//忽略延迟槽
			flush = 1'b0;
		end else begin
			stall = 6'b000000;
			flush = 1'b0;
			new_pc = `ZeroWord;
		end    //if
	end      //always
			

endmodule