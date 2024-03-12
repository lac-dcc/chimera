module bin_to_seg(
    input data,

    output reg [6:0]segments
);

always @(*) begin
    case (data)
        1'b0: segments = 7'b1111110;
        1'b1: segments = 7'b0110000;
    endcase
end

endmodule
