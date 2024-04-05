`ifdef _DEFINES_V_
`else
    `include "defines.v"
`endif


module dmext(
    input [31:0] Din,
    input [2:0] DMEXTOp,
    input [1:0] byte,
    output reg [31:0] Dout
);

    always @(*) begin
        case (DMEXTOp)
            `LB_EXT: begin
                case (byte)
                    2'b00:  Dout = {{24{Din[7]}}, Din[7:0]};
                    2'b01:  Dout = {{24{Din[15]}}, Din[15:8]};
                    2'b10:  Dout = {{24{Din[23]}}, Din[23:16]};
                    2'b11:  Dout = {{24{Din[31]}}, Din[31:24]};
                    default:Dout = 32'h0000_0000;
                endcase
            end     
            `LBU_EXT: begin
                case (byte)
                    2'b00:  Dout = {24'd0, Din[7:0]};
                    2'b01:  Dout = {24'd0, Din[15:8]};
                    2'b10:  Dout = {24'd0, Din[23:16]};
                    2'b11:  Dout = {24'd0, Din[31:24]};
                    default:Dout = 32'h0000_0000;
                endcase
            end
            `LH_EXT: begin
                case (byte[1])
                    1'b0:   Dout = {{16{Din[15]}}, Din[15:0]};
                    1'b1:   Dout = {{16{Din[31]}}, Din[31:16]};
                    default:Dout = 32'h0000_0000;
                endcase
            end
            `LHU_EXT: begin
                case (byte[1])
                    1'b0:   Dout = {16'd0, Din[15:0]};
                    1'b1:   Dout = {16'd0, Din[31:16]};
                    default:Dout = 32'h0000_0000;
                endcase
            end
            `LW_EXT:    Dout = Din;
            default:    Dout = 32'h0000_0000;
        endcase
    end

endmodule // dmext