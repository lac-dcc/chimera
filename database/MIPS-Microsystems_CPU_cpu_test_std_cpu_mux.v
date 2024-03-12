`define _MUX_V_

module mux2_1(
    input [dataWidth-1:0] port0,
    input [dataWidth-1:0] port1,
    input Sel,
    output [dataWidth-1:0] out
);

    parameter dataWidth = 32;
    assign out = (Sel) ? port1 : port0;

endmodule // mux2_1

module mux4_1(
    input [dataWidth-1:0] port0,
    input [dataWidth-1:0] port1,
    input [dataWidth-1:0] port2,
    input [dataWidth-1:0] port3,
    input [1:0] Sel,
    output reg [dataWidth-1:0] out
);

    parameter dataWidth = 32;

    always @(*) begin
        case(Sel)
            2'b00:      out <= port0;
            2'b01:      out <= port1;
            2'b10:      out <= port2;
            2'b11:      out <= port3;
            default:    out <= {dataWidth{1'bx}};
        endcase
    end

endmodule // mux4_1