`include "defines.v"

module ex(
    input  wire                      reset,
	 input  wire[`ALUOpBus]           aluop_input,
	 input  wire[`ALUSelBus]          alusel_input,
	 input  wire[`RegisterBus]        reg1_input,
	 input  wire[`RegisterBus]        reg2_input,
	 input  wire[`RegisterAddressBus] wd_input,
	 input  wire                      wreg_input,
	 output reg[`RegisterAddressBus]  wd_output,
	 output reg                       wreg_output,
	 output reg[`RegisterBus]         wdata_output
);

    reg[`RegisterBus] logic_out;
	 
	 always @ (*) begin
	     if (reset == `ResetEnable) begin
		      logic_out <= `ZeroWord;
		  end else begin
		      case (aluop_input)
				    `EXE_OR_OP: begin
					     logic_out <= reg1_input | reg2_input;
					 end
					 default: begin
					     logic_out <= `ZeroWord;
					 end
				endcase
		  end
	 end
	 
	 always @ (*) begin
	     wd_output <= wd_input;
		  wreg_output <= wreg_input;
		  case (alusel_input)
		      `EXE_RES_LOGIC: begin
				    wdata_output <= logic_out;
				end
				default: begin
				    wdata_output <= `ZeroWord;
				end
		  endcase
	 end

endmodule