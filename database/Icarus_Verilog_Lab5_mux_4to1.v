`ifndef MUX_4to1
`define MUX_4to1
    module mux_4to1(
        output [31:0] regData,
        input [31:0] q0,
        input [31:0] q1,
        input [31:0] q2,
        input [31:0] q3,
        input [1:0] regNo);

        reg regData;

        always @(regNo) begin
            case (regNo)
                2'b00: 
                    regData = q0;
                2'b01: 
                    regData = q1;
                2'b10: 
                    regData = q2;
                2'b11: 
                    regData = q3;
            endcase
        end
    endmodule
`endif
