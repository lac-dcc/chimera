// This program was cloned from: https://github.com/ochsnega/ECE289AdvancedBadge
// License: MIT License

module arbiter(
	input clk,
	input rst,
	input core_1_in,
	input core_2_in,
	output reg core_1_out,
	output reg core_2_out
);

// Only two states for the arbiter.
reg S;
reg NS;

// Name each state
parameter lock_1 = 1'b0,
			 lock_2 = 1'b1;
			 
// Set next state
always@(posedge clk or negedge rst)
begin
	if (rst == 1'b0)
		S = lock_1;
	else
		S = NS;
end

// Decide next state
always@(*)
begin
	case(S)
		lock_1: 
		begin
			if (core_1_in == 1'b1)
				NS = lock_1;
			else
				NS = lock_2;
		end
		lock_2:
		begin
			if (core_2_in == 1'b1)
				NS = lock_2;
			else
				NS = lock_1;		
		end
	endcase
end

// What happens in each state?
always@(*)
begin
	if (rst == 1'b0)
	begin
		core_1_out = 1'b0;
		core_2_out = 1'b0;
	end
	else
	begin
	case(S)
		lock_1: 
		begin
			core_1_out = 1'b1;
			core_2_out = 1'b0;
		end
		lock_2:
		begin
			core_1_out = 1'b0;
			core_2_out = 1'b1;
		end
	endcase
	end
end

endmodule 