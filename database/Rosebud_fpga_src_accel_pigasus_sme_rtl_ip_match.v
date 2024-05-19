// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

module table_00100011111011(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0010??????: match <= 1'b1;
      10'b0011??????: match <= 1'b1;
      10'b000???????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      10'b1?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_11000111110000(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0001110011: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_01101000100110(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1001110001: match <= 1'b1;
      10'b100111001?: match <= 1'b1;
      10'b100111100?: match <= 1'b1;
      10'b10011101??: match <= 1'b1;
      10'b100001????: match <= 1'b1;
      10'b100110????: match <= 1'b1;
      10'b111110????: match <= 1'b1;
      10'b10001?????: match <= 1'b1;
      10'b10010?????: match <= 1'b1;
      10'b11110?????: match <= 1'b1;
      10'b1110??????: match <= 1'b1;
      10'b101???????: match <= 1'b1;
      10'b110???????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_01101100001110(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1101010???: match <= 1'b1;
      10'b1101011???: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011111010(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1111011???: match <= 1'b1;
      10'b101010????: match <= 1'b1;
      10'b101011????: match <= 1'b1;
      10'b101100????: match <= 1'b1;
      10'b101101????: match <= 1'b1;
      10'b101110????: match <= 1'b1;
      10'b101111????: match <= 1'b1;
      10'b110000????: match <= 1'b1;
      10'b110001????: match <= 1'b1;
      10'b110010????: match <= 1'b1;
      10'b110011????: match <= 1'b1;
      10'b10100?????: match <= 1'b1;
      10'b1000??????: match <= 1'b1;
      10'b1001??????: match <= 1'b1;
      10'b1101??????: match <= 1'b1;
      10'b010???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b00????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010010010(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b00????????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      10'b1?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_10101101111111(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1101110???: match <= 1'b1;
      10'b1101111???: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010010111(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1100??????: match <= 1'b1;
      10'b1101??????: match <= 1'b1;
      10'b111???????: match <= 1'b1;
      10'b00????????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      10'b10????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010010110(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b010???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b00????????: match <= 1'b1;
      10'b1?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_11000000100111(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b10000111??: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00001000001000(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1011010010: match <= 1'b1;
      10'b1011010011: match <= 1'b1;
      10'b101101000?: match <= 1'b1;
      10'b10110101??: match <= 1'b1;
      10'b10110110??: match <= 1'b1;
      10'b10110111??: match <= 1'b1;
      10'b1111000???: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010011000(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1010000???: match <= 1'b1;
      10'b0001??????: match <= 1'b1;
      10'b1001??????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010011001(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b01000101??: match <= 1'b1;
      10'b01000110??: match <= 1'b1;
      10'b0101??????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b100???????: match <= 1'b1;
      10'b101???????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011110010(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0100101001: match <= 1'b1;
      10'b111101001?: match <= 1'b1;
      10'b11110101??: match <= 1'b1;
      10'b11110110??: match <= 1'b1;
      10'b1111101???: match <= 1'b1;
      10'b01000?????: match <= 1'b1;
      10'b0101??????: match <= 1'b1;
      10'b1110??????: match <= 1'b1;
      10'b000???????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b110???????: match <= 1'b1;
      10'b10????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011110011(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b10001?????: match <= 1'b1;
      10'b1001??????: match <= 1'b1;
      10'b1010??????: match <= 1'b1;
      10'b1011??????: match <= 1'b1;
      10'b1100??????: match <= 1'b1;
      10'b1101??????: match <= 1'b1;
      10'b1110??????: match <= 1'b1;
      10'b1111??????: match <= 1'b1;
      10'b00????????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011110111(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0000011010: match <= 1'b1;
      10'b0000011011: match <= 1'b1;
      10'b0000011111: match <= 1'b1;
      10'b0000101000: match <= 1'b1;
      10'b0000101001: match <= 1'b1;
      10'b0000101010: match <= 1'b1;
      10'b0000101011: match <= 1'b1;
      10'b0000101100: match <= 1'b1;
      10'b0000101101: match <= 1'b1;
      10'b0000101110: match <= 1'b1;
      10'b0000101111: match <= 1'b1;
      10'b000001000?: match <= 1'b1;
      10'b000001001?: match <= 1'b1;
      10'b000001100?: match <= 1'b1;
      10'b00000101??: match <= 1'b1;
      10'b00001110??: match <= 1'b1;
      10'b00001111??: match <= 1'b1;
      10'b0000100???: match <= 1'b1;
      10'b0000110???: match <= 1'b1;
      10'b000000????: match <= 1'b1;
      10'b00010?????: match <= 1'b1;
      10'b00011?????: match <= 1'b1;
      10'b0100??????: match <= 1'b1;
      10'b0101??????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b1?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011110110(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0100??????: match <= 1'b1;
      10'b0101??????: match <= 1'b1;
      10'b1110??????: match <= 1'b1;
      10'b000???????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b110???????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011111101(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0000??????: match <= 1'b1;
      10'b0001??????: match <= 1'b1;
      10'b1110??????: match <= 1'b1;
      10'b1111??????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b100???????: match <= 1'b1;
      10'b101???????: match <= 1'b1;
      10'b110???????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011111100(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1000011010: match <= 1'b1;
      10'b1000011011: match <= 1'b1;
      10'b1000011111: match <= 1'b1;
      10'b1000101000: match <= 1'b1;
      10'b1000101001: match <= 1'b1;
      10'b1000101010: match <= 1'b1;
      10'b1000101011: match <= 1'b1;
      10'b1000101100: match <= 1'b1;
      10'b1000101101: match <= 1'b1;
      10'b1000101110: match <= 1'b1;
      10'b1000101111: match <= 1'b1;
      10'b100001000?: match <= 1'b1;
      10'b100001001?: match <= 1'b1;
      10'b100001100?: match <= 1'b1;
      10'b10000101??: match <= 1'b1;
      10'b10001110??: match <= 1'b1;
      10'b10001111??: match <= 1'b1;
      10'b1000100???: match <= 1'b1;
      10'b1000110???: match <= 1'b1;
      10'b1100000???: match <= 1'b1;
      10'b1100001???: match <= 1'b1;
      10'b1100100???: match <= 1'b1;
      10'b1100101???: match <= 1'b1;
      10'b1100111???: match <= 1'b1;
      10'b100000????: match <= 1'b1;
      10'b10010?????: match <= 1'b1;
      10'b10011?????: match <= 1'b1;
      10'b0100??????: match <= 1'b1;
      10'b0101??????: match <= 1'b1;
      10'b1010??????: match <= 1'b1;
      10'b1011??????: match <= 1'b1;
      10'b1101??????: match <= 1'b1;
      10'b000???????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b111???????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00010111111110(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b111000????: match <= 1'b1;
      10'b111001????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_01101011101001(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b111010????: match <= 1'b1;
      10'b111011????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010011101(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0000000???: match <= 1'b1;
      10'b0001??????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011111000(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1110??????: match <= 1'b1;
      10'b1111??????: match <= 1'b1;
      10'b110???????: match <= 1'b1;
      10'b10????????: match <= 1'b1;
      10'b0?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011111001(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b010001????: match <= 1'b1;
      10'b101111????: match <= 1'b1;
      10'b01001?????: match <= 1'b1;
      10'b10100?????: match <= 1'b1;
      10'b10101?????: match <= 1'b1;
      10'b0101??????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b100???????: match <= 1'b1;
      10'b00????????: match <= 1'b1;
      10'b11????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011101111(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b100111????: match <= 1'b1;
      10'b101110????: match <= 1'b1;
      10'b00110?????: match <= 1'b1;
      10'b00111?????: match <= 1'b1;
      10'b01100?????: match <= 1'b1;
      10'b01101?????: match <= 1'b1;
      10'b10010?????: match <= 1'b1;
      10'b10110?????: match <= 1'b1;
      10'b0010??????: match <= 1'b1;
      10'b0100??????: match <= 1'b1;
      10'b0101??????: match <= 1'b1;
      10'b0111??????: match <= 1'b1;
      10'b1000??????: match <= 1'b1;
      10'b1010??????: match <= 1'b1;
      10'b000???????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011101110(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b011010????: match <= 1'b1;
      10'b011011????: match <= 1'b1;
      10'b101000????: match <= 1'b1;
      10'b101001????: match <= 1'b1;
      10'b111001????: match <= 1'b1;
      10'b01100?????: match <= 1'b1;
      10'b10101?????: match <= 1'b1;
      10'b11101?????: match <= 1'b1;
      10'b11110?????: match <= 1'b1;
      10'b11111?????: match <= 1'b1;
      10'b0111??????: match <= 1'b1;
      10'b1011??????: match <= 1'b1;
      10'b010???????: match <= 1'b1;
      10'b100???????: match <= 1'b1;
      10'b110???????: match <= 1'b1;
      10'b00????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_11000111110111(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1111101100: match <= 1'b1;
      10'b11111010??: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_01101011101100(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b101101????: match <= 1'b1;
      10'b101111????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00010111111011(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b000011????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010010000(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b00010000??: match <= 1'b1;
      10'b00010001??: match <= 1'b1;
      10'b00100000??: match <= 1'b1;
      10'b00100001??: match <= 1'b1;
      10'b0001001???: match <= 1'b1;
      10'b0010001???: match <= 1'b1;
      10'b000101????: match <= 1'b1;
      10'b001001????: match <= 1'b1;
      10'b00011?????: match <= 1'b1;
      10'b00101?????: match <= 1'b1;
      10'b0011??????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      10'b1?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_10100010110111(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1010110???: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_10100010110110(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b00100101??: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010010100(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0?????????: match <= 1'b1;
      10'b1?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010010101(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b1110??????: match <= 1'b1;
      10'b1111??????: match <= 1'b1;
      10'b010???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b110???????: match <= 1'b1;
      10'b00????????: match <= 1'b1;
      10'b10????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_01101000110001(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0001000001: match <= 1'b1;
      10'b000100001?: match <= 1'b1;
      10'b110100001?: match <= 1'b1;
      10'b111111001?: match <= 1'b1;
      10'b00010001??: match <= 1'b1;
      10'b11010001??: match <= 1'b1;
      10'b11111101??: match <= 1'b1;
      10'b1101001???: match <= 1'b1;
      10'b1111111???: match <= 1'b1;
      10'b100000????: match <= 1'b1;
      10'b100001????: match <= 1'b1;
      10'b100100????: match <= 1'b1;
      10'b100101????: match <= 1'b1;
      10'b100110????: match <= 1'b1;
      10'b100111????: match <= 1'b1;
      10'b110101????: match <= 1'b1;
      10'b110110????: match <= 1'b1;
      10'b110111????: match <= 1'b1;
      10'b111110????: match <= 1'b1;
      10'b00011?????: match <= 1'b1;
      10'b00110?????: match <= 1'b1;
      10'b00111?????: match <= 1'b1;
      10'b10001?????: match <= 1'b1;
      10'b11110?????: match <= 1'b1;
      10'b0000??????: match <= 1'b1;
      10'b0010??????: match <= 1'b1;
      10'b1100??????: match <= 1'b1;
      10'b1110??????: match <= 1'b1;
      10'b101???????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010011110(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b00????????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      10'b1?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010011111(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b000010100?: match <= 1'b1;
      10'b000010101?: match <= 1'b1;
      10'b000010110?: match <= 1'b1;
      10'b000010111?: match <= 1'b1;
      10'b000011000?: match <= 1'b1;
      10'b00000010??: match <= 1'b1;
      10'b00000011??: match <= 1'b1;
      10'b0000000???: match <= 1'b1;
      10'b0000010???: match <= 1'b1;
      10'b0000011???: match <= 1'b1;
      10'b0000100???: match <= 1'b1;
      10'b1001??????: match <= 1'b1;
      10'b1010??????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b01????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_10010010100101(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b000000001?: match <= 1'b1;
      10'b00000001??: match <= 1'b1;
      10'b0000001???: match <= 1'b1;
      10'b000001????: match <= 1'b1;
      10'b000110????: match <= 1'b1;
      10'b000111????: match <= 1'b1;
      10'b00001?????: match <= 1'b1;
      10'b00010?????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100010011010(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b000110100?: match <= 1'b1;
      10'b000110101?: match <= 1'b1;
      10'b000110110?: match <= 1'b1;
      10'b000110111?: match <= 1'b1;
      10'b000111000?: match <= 1'b1;
      10'b00010010??: match <= 1'b1;
      10'b00010011??: match <= 1'b1;
      10'b0001000???: match <= 1'b1;
      10'b0001010???: match <= 1'b1;
      10'b0001011???: match <= 1'b1;
      10'b0001100???: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b010???????: match <= 1'b1;
      10'b011???????: match <= 1'b1;
      10'b110???????: match <= 1'b1;
      10'b111???????: match <= 1'b1;
      10'b10????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011110001(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b111001????: match <= 1'b1;
      10'b01100?????: match <= 1'b1;
      10'b01101?????: match <= 1'b1;
      10'b11101?????: match <= 1'b1;
      10'b0111??????: match <= 1'b1;
      10'b1000??????: match <= 1'b1;
      10'b1001??????: match <= 1'b1;
      10'b1010??????: match <= 1'b1;
      10'b1011??????: match <= 1'b1;
      10'b1100??????: match <= 1'b1;
      10'b1101??????: match <= 1'b1;
      10'b010???????: match <= 1'b1;
      10'b00????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011110000(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b10010?????: match <= 1'b1;
      10'b10011?????: match <= 1'b1;
      10'b1000??????: match <= 1'b1;
      10'b101???????: match <= 1'b1;
      10'b11????????: match <= 1'b1;
      10'b0?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011110100(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b10????????: match <= 1'b1;
      10'b11????????: match <= 1'b1;
      10'b0?????????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_00100011110101(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b0110??????: match <= 1'b1;
      10'b0111??????: match <= 1'b1;
      10'b1100??????: match <= 1'b1;
      10'b1101??????: match <= 1'b1;
      10'b1110??????: match <= 1'b1;
      10'b1111??????: match <= 1'b1;
      10'b000???????: match <= 1'b1;
      10'b001???????: match <= 1'b1;
      10'b010???????: match <= 1'b1;
      10'b100???????: match <= 1'b1;
      10'b101???????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module table_10000010110100(input clk, input rst, input [9:0] addr, output reg match);
  always@(posedge clk) begin
    casex (addr)
      10'b11000001??: match <= 1'b1;
      10'b1100001???: match <= 1'b1;
      10'b110001????: match <= 1'b1;
      10'b110010????: match <= 1'b1;
      10'b110011????: match <= 1'b1;
      10'b110110????: match <= 1'b1;
      10'b110111????: match <= 1'b1;
      10'b111110????: match <= 1'b1;
      10'b111111????: match <= 1'b1;
      10'b11010?????: match <= 1'b1;
      10'b11110?????: match <= 1'b1;
      10'b1110??????: match <= 1'b1;
      default: match <= 1'b0;
    endcase

    if(rst)
      match <= 1'b0;
  end
endmodule

module ip_match(input wire clk, input wire rst, input wire [31:0] addr,
                input wire valid, output reg match, output reg done);
  reg [31:0] addr_r;
  reg        valid_r;
  reg        match_n;

  wire out_00100011111011;
  table_00100011111011 m_00100011111011 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011111011));
  wire out_11000111110000;
  table_11000111110000 m_11000111110000 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_11000111110000));
  wire out_01101000100110;
  table_01101000100110 m_01101000100110 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_01101000100110));
  wire out_01101100001110;
  table_01101100001110 m_01101100001110 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_01101100001110));
  wire out_00100011111010;
  table_00100011111010 m_00100011111010 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011111010));
  wire out_00100010010010;
  table_00100010010010 m_00100010010010 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010010010));
  wire out_10101101111111;
  table_10101101111111 m_10101101111111 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_10101101111111));
  wire out_00100010010111;
  table_00100010010111 m_00100010010111 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010010111));
  wire out_00100010010110;
  table_00100010010110 m_00100010010110 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010010110));
  wire out_11000000100111;
  table_11000000100111 m_11000000100111 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_11000000100111));
  wire out_00001000001000;
  table_00001000001000 m_00001000001000 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00001000001000));
  wire out_00100010011000;
  table_00100010011000 m_00100010011000 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010011000));
  wire out_00100010011001;
  table_00100010011001 m_00100010011001 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010011001));
  wire out_00100011110010;
  table_00100011110010 m_00100011110010 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011110010));
  wire out_00100011110011;
  table_00100011110011 m_00100011110011 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011110011));
  wire out_00100011110111;
  table_00100011110111 m_00100011110111 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011110111));
  wire out_00100011110110;
  table_00100011110110 m_00100011110110 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011110110));
  wire out_00100011111101;
  table_00100011111101 m_00100011111101 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011111101));
  wire out_00100011111100;
  table_00100011111100 m_00100011111100 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011111100));
  wire out_00010111111110;
  table_00010111111110 m_00010111111110 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00010111111110));
  wire out_01101011101001;
  table_01101011101001 m_01101011101001 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_01101011101001));
  wire out_00100010011101;
  table_00100010011101 m_00100010011101 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010011101));
  wire out_00100011111000;
  table_00100011111000 m_00100011111000 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011111000));
  wire out_00100011111001;
  table_00100011111001 m_00100011111001 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011111001));
  wire out_00100011101111;
  table_00100011101111 m_00100011101111 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011101111));
  wire out_00100011101110;
  table_00100011101110 m_00100011101110 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011101110));
  wire out_11000111110111;
  table_11000111110111 m_11000111110111 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_11000111110111));
  wire out_01101011101100;
  table_01101011101100 m_01101011101100 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_01101011101100));
  wire out_00010111111011;
  table_00010111111011 m_00010111111011 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00010111111011));
  wire out_00100010010000;
  table_00100010010000 m_00100010010000 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010010000));
  wire out_10100010110111;
  table_10100010110111 m_10100010110111 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_10100010110111));
  wire out_10100010110110;
  table_10100010110110 m_10100010110110 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_10100010110110));
  wire out_00100010010100;
  table_00100010010100 m_00100010010100 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010010100));
  wire out_00100010010101;
  table_00100010010101 m_00100010010101 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010010101));
  wire out_01101000110001;
  table_01101000110001 m_01101000110001 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_01101000110001));
  wire out_00100010011110;
  table_00100010011110 m_00100010011110 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010011110));
  wire out_00100010011111;
  table_00100010011111 m_00100010011111 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010011111));
  wire out_10010010100101;
  table_10010010100101 m_10010010100101 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_10010010100101));
  wire out_00100010011010;
  table_00100010011010 m_00100010011010 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100010011010));
  wire out_00100011110001;
  table_00100011110001 m_00100011110001 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011110001));
  wire out_00100011110000;
  table_00100011110000 m_00100011110000 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011110000));
  wire out_00100011110100;
  table_00100011110100 m_00100011110100 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011110100));
  wire out_00100011110101;
  table_00100011110101 m_00100011110101 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_00100011110101));
  wire out_10000010110100;
  table_10000010110100 m_10000010110100 (.clk(clk), .rst(rst), .addr(addr[17:8]), .match(out_10000010110100));

  always@(*)
    case (addr_r[31:18])
      14'b00100011111011: match_n = out_00100011111011;
      14'b11000111110000: match_n = out_11000111110000;
      14'b01101000100110: match_n = out_01101000100110;
      14'b01101100001110: match_n = out_01101100001110;
      14'b00100011111010: match_n = out_00100011111010;
      14'b00100010010010: match_n = out_00100010010010;
      14'b10101101111111: match_n = out_10101101111111;
      14'b00100010010111: match_n = out_00100010010111;
      14'b00100010010110: match_n = out_00100010010110;
      14'b11000000100111: match_n = out_11000000100111;
      14'b00001000001000: match_n = out_00001000001000;
      14'b00100010011000: match_n = out_00100010011000;
      14'b00100010011001: match_n = out_00100010011001;
      14'b00100011110010: match_n = out_00100011110010;
      14'b00100011110011: match_n = out_00100011110011;
      14'b00100011110111: match_n = out_00100011110111;
      14'b00100011110110: match_n = out_00100011110110;
      14'b00100011111101: match_n = out_00100011111101;
      14'b00100011111100: match_n = out_00100011111100;
      14'b00010111111110: match_n = out_00010111111110;
      14'b01101011101001: match_n = out_01101011101001;
      14'b00100010011101: match_n = out_00100010011101;
      14'b00100011111000: match_n = out_00100011111000;
      14'b00100011111001: match_n = out_00100011111001;
      14'b00100011101111: match_n = out_00100011101111;
      14'b00100011101110: match_n = out_00100011101110;
      14'b11000111110111: match_n = out_11000111110111;
      14'b01101011101100: match_n = out_01101011101100;
      14'b00010111111011: match_n = out_00010111111011;
      14'b00100010010000: match_n = out_00100010010000;
      14'b10100010110111: match_n = out_10100010110111;
      14'b10100010110110: match_n = out_10100010110110;
      14'b00100010010100: match_n = out_00100010010100;
      14'b00100010010101: match_n = out_00100010010101;
      14'b01101000110001: match_n = out_01101000110001;
      14'b00100010011110: match_n = out_00100010011110;
      14'b00100010011111: match_n = out_00100010011111;
      14'b10010010100101: match_n = out_10010010100101;
      14'b00100010011010: match_n = out_00100010011010;
      14'b00100011110001: match_n = out_00100011110001;
      14'b00100011110000: match_n = out_00100011110000;
      14'b00100011110100: match_n = out_00100011110100;
      14'b00100011110101: match_n = out_00100011110101;
      14'b10000010110100: match_n = out_10000010110100;
      14'b00100010010001: match_n = 1'b1;
      14'b00100010010011: match_n = 1'b1;
      default: match_n = 1'b0;
    endcase

  always@(posedge clk) begin
    addr_r  <= addr;
    valid_r <= valid;
    match   <= (match || match_n) && !valid;
    done    <= (done  || valid_r) && !valid;

    if(rst) begin
      match   <= 1'b0;
      done    <= 1'b0;
      valid_r <= 1'b0;
    end
  end
endmodule
