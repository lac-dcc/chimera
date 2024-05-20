// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module ResetBootSystem #(
    parameter CYCLES = 20
) (
    input wire clk,
    output reg reset_o,
    output wire resetn_o
);

assign resetn_o = ~reset_o;

reg [1:0] state;
reg [5:0] counter;

localparam INIT = 2'b00;
localparam RESET_COUNTER = 2'b01;
localparam IDLE = 2'b10;

initial begin
    state = 2'b01;
    reset_o = 2'b0;
    counter = 6'h00;
end

always @(posedge clk ) begin
    case (state)
        INIT: begin
            reset_o <= 1'b1;
            state <= RESET_COUNTER;
            counter <= 6'h00;
        end

        RESET_COUNTER: begin
            if(reset_o == 1'b0) begin
                state <= INIT;
            end else begin
                if(counter < CYCLES) begin
                    counter <= counter + 1;
                end else if(counter == CYCLES) begin
                    counter <= 0;
                    state <= IDLE;
                end else begin
                    state <= INIT;
                end
            end
        end

        IDLE: begin
            if(counter != 0) begin
                state <= INIT;
            end else begin
                reset_o <= 1'b0;
            end
        end

        default: state <= INIT;
    endcase
end

endmodule
