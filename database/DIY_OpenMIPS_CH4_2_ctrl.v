`include "defines.v"

module ctrl(
    input  wire             reset,
    input  wire             stop_all_req_from_id,
    input  wire             stop_all_req_from_ex,
    output reg[`StopAllBus] stop_all
);

    always @(*) begin
        if (reset == `ResetEnable) begin
            stop_all <= 6'b000000;
        end else if (stop_all_req_from_id == `Stop) begin
            stop_all <= 6'b000111;
        end else if (stop_all_req_from_ex == `Stop) begin
            stop_all <= 6'b001111;
        end else begin
            stop_all <= 6'b000000;
        end
    end

endmodule