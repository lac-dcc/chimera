// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module seg_sel_decoder(
    input        [2:0]  bit_disp,
    output  reg  [5:0]  seg_sel
);

always@(bit_disp)begin
    case(bit_disp)
        3'b000 : seg_sel = 6'b011111;
        3'b001 : seg_sel = 6'b101111;
        3'b010 : seg_sel = 6'b110111;
        3'b011 : seg_sel = 6'b111011;
        3'b100 : seg_sel = 6'b111101;
        3'b101 : seg_sel = 6'b111110;     
        default : seg_sel = 6'b111111;
    endcase
end

endmodule