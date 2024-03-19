//
// bit vectors to 7 segment display
//

module seg(data, hex);

input [3:0] data;
output reg [6:0] hex;

always @(*) begin
    case (data)
        4'h0: hex = 7'b1000000;
        4'h1: hex = 7'b1111001;
        4'h2: hex = 7'b0100100;
        4'h3: hex = 7'b0110000;
        4'h4: hex = 7'b0011001;
        4'h5: hex = 7'b0010010;
        4'h6: hex = 7'b0000010;
        4'h7: hex = 7'b1111000;
        4'h8: hex = 7'b0000000;
        4'h9: hex = 7'b0011000;
        4'ha: hex = 7'b0001000;
        4'hb: hex = 7'b0000011;
        4'hc: hex = 7'b1000110;
        4'hd: hex = 7'b0100001;
        4'he: hex = 7'b0000110;
        4'hf: hex = 7'b0001110;
    endcase
end

endmodule



module seg16(data, hexs);

input [15:0] data;
output [27:0] hexs;

seg h0(data[15:12], hexs[27:21]);
seg h1(data[11:8], hexs[20:14]);
seg h2(data[7:4], hexs[13:7]);
seg h3(data[3:0], hexs[6:0]);

endmodule
