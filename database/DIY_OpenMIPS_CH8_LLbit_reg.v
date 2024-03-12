`include "defines.v"

module LLbit_reg(
    input  wire  clock,
    input  wire  reset,
    input  wire  flush,
    input  wire  LLbit_input,
    input  wire  write_enable,
    
    output reg   LLbit_output
);

    always @ (posedge clock) begin
        if (reset == `ResetEnable) begin
            LLbit_output <= 1'b0;
        end else if ((flush == 1'b1)) begin
            LLbit_output <= 1'b0;
        end else if ((write_enable == `WriteEnable))begin
            LLbit_output <= LLbit_input;
        end
    end

endmodule