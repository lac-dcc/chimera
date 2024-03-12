module rom (
    input [2:0]addr,
    input clk,
    output reg [7:0]q
);

always @(posedge clk) begin
    case (addr)
    3'b000: q = 8'b01011011; // [
    3'b001: q = 8'b01000110; // F
    3'b010: q = 8'b01010000; // P
    3'b011: q = 8'b01000111; // G
    3'b100: q = 8'b01000001; // A
    3'b101: q = 8'b01011101; // ]
    3'b110: q = 8'b00001101; // \r
    3'b111: q = 8'b00001010; // \n
    endcase
end

endmodule
