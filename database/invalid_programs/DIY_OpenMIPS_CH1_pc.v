`include "defines.v"

module pc_reg(
    input  wire          clock,
	 input  wire          reset,
	 output reg[`DataBus] pc,
	 output reg           ce
);

    always @ (posedge clock) begin
	     if (reset == `ResetEnable) begin
		      ce <= `ChipDisable;
		  end else begin
		      ce <= `ChipEnable;
		  end
	 end
	 
	 always @ (posedge clock) begin
	     if (ce == `ChipDisable) begin
		      pc <= 32'h00000000;
        end else begin
		      pc <= pc + 4'h4;
		  end
	 end

endmodule