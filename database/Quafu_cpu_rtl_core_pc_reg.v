`include "defines.v"

module pc_reg(

	input	wire										clk,
	input wire										rst,
	input wire[5:0]								stall,
	
	input wire										branch_flag_i,
	input wire[`RegBus]							branch_target_address_i,
	
	input wire 										flush,
	input wire[`RegBus]							new_pc,
	
	output reg[`InstAddrBus]					pc,
	output reg                    			ce,
	output wire										branch_flush
	
);

	reg[`RegBus] hold_branch_target_address;
	reg get_branch_target_address;
	reg need_branch;
	
	assign branch_flush = need_branch;

	always @ (*) begin
		if(rst == `RstEnable) begin
			hold_branch_target_address = `ZeroWord;
			need_branch = 1'b0;
		end else if(branch_flag_i == `Branch) begin
			hold_branch_target_address = branch_target_address_i;
			need_branch = 1'b1;
		end
		
		if(get_branch_target_address == 1'b1) begin
			need_branch = 1'b0;
		end
	end

	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			get_branch_target_address <= 1'b0;
			pc <= 32'h00000000;
		end else if (ce == `ChipDisable) begin
			pc <= 32'h00000000;					//SDRAM挂载在总线地址0x30000000-0x3fffffff
		end else if(flush == 1'b1) begin
			pc <= new_pc;
		end else if(stall[0] == `NoStop) begin
			if(need_branch == 1'b1) begin
				pc <= hold_branch_target_address;
				get_branch_target_address <= 1'b1;
			end else if(branch_flag_i != `Branch) begin
				pc <= pc + 4'h4;
				get_branch_target_address <= 1'b0;
		end
	end
end
	
	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			ce <= `ChipDisable;
		end else begin
			ce <= `ChipEnable;
		end
	end

endmodule
