`ifdef _DEFINES_V_
`else
    `include "defines.v"
`endif

module multdiv(
    input clk, 
    input reset,
    input flush,
    input [31:0] A,
    input [31:0] B,
    input [3:0] HiLoOp,
    output [31:0] C,
    output state,
    output reg busy
);

    reg [31:0] HI = 0, LO = 0;
    reg [63:0] temp = 0;
    reg [7:0] counter = 0;

    assign C    =   (HiLoOp == `MFHI_OP)    ?   HI  :
                    (HiLoOp == `MFLO_OP)    ?   LO  :
                                                32'd0;

    assign state = (HiLoOp==`MULT_OP||HiLoOp==`MULTU_OP||HiLoOp==`DIV_OP||HiLoOp==`DIVU_OP) && !flush ? 1'b1 : 1'b0;

    always @(posedge clk) begin
        if(reset) begin
            HI <= 32'd0;
            LO <= 32'd0;
            counter <= 8'd0;
            busy <= 1'b0;
        end
        else if(flush == 1'b1) begin
            counter <= 1'b0;
            busy <= 1'b0;
        end
        else if(state == 1'b1) begin
            busy <= 1'b1;
            case (HiLoOp)
                `MULT_OP: begin
                    counter <= 8'd4;
                    temp <= $signed(A) * $signed(B);
                end
                `MULTU_OP: begin
                    counter <= 8'd4;
                    temp <= {1'b0, A} * {1'b0, B};
                end
                `DIV_OP: begin
                    counter <= 8'd9;
                    temp[31:0] <= $signed(A) / $signed(B);
                    temp[63:32] <= $signed(A) % $signed(B);
                end
                `DIVU_OP: begin
                    counter <= 8'd9;
                    temp[31:0] <= {1'b0, A} / {1'b0, B};
                    temp[63:32] <= {1'b0, A} % {1'b0, B};
                end
                default: begin
                    ;
                end
            endcase
        end
        else if(counter != 8'd0 && busy == 1'b1) begin
            counter <= counter - 8'd1;
        end
        else if(counter == 8'd0 && busy == 1'b1) begin
            busy <= 1'b0;
            {HI, LO} <= temp;
        end
        else if(counter == 8'd0 && state == 1'b0 && busy == 1'b0) begin
            case (HiLoOp)
                `MTHI_OP:   HI <= A;
                `MTLO_OP:   LO <= A;
                default:    ;
            endcase
        end
        else begin
            ;
        end
    end

endmodule // multdiv