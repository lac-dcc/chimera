`include "defines.v"

module ctrl(
    input  wire               reset,
    input  wire               stop_all_req_from_id,
    input  wire               stop_all_req_from_ex,

    input  wire[31:0]         exception_type_input,
    input  wire[`RegisterBus] cp0_epc_input,
    
    output reg[`StopAllBus]   stop_all,

    output reg[`RegisterBus]  new_program_counter,
    output reg                flush
);

    always @(*) begin
        if (reset == `ResetEnable) begin
            stop_all <= 6'b000000;
            flush <= 1'b0;
            new_program_counter <= `ZeroWord;
        end else if (exception_type_input != `ZeroWord) begin
            flush <= 1'b1;
            stop_all <= 6'b000000;
            case (exception_type_input)
                32'h00000001: begin
                    new_program_counter <= 32'h00000020;
                end
                32'h00000008: begin
                    new_program_counter <= 32'h00000040;
                end
                32'h0000000a: begin
                    new_program_counter <= 32'h00000040;
                end
                32'h0000000d: begin
                    new_program_counter <= 32'h00000040;
                end
                32'h0000000c: begin
                    new_program_counter <= 32'h00000040;
                end
                32'h0000000e: begin
                    new_program_counter <= cp0_epc_input;
                end
                default: begin
                end
            endcase
        end else if (stop_all_req_from_id == `Stop) begin
            stop_all <= 6'b000111;
            flush <= 1'b0;
        end else if (stop_all_req_from_ex == `Stop) begin
            stop_all <= 6'b001111;
            flush <= 1'b0;
        end else begin
            stop_all <= 6'b000000;
            flush <= 1'b0;
            new_program_counter <= `ZeroWord;
        end
    end

endmodule