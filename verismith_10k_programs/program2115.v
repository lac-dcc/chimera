module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  assign y = {wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = wire4;
  assign wire7 = wire3[(3'h6):(2'h2)];
  assign wire8 = wire6;
  assign wire9 = (wire1[(4'hf):(3'h7)] ? wire0 : wire5);
  always
    @(posedge clk) begin
      if (wire9)
        begin
          reg10 <= wire5;
        end
      else
        begin
          reg10 <= ((+($unsigned((wire0 ^ wire2)) * $signed((wire0 - wire8)))) >> $unsigned($signed((^~$signed((8'ha0))))));
          reg11 <= wire9[(2'h2):(1'h0)];
          reg12 <= $unsigned($signed(wire0));
          if (wire7[(3'h4):(1'h1)])
            begin
              reg13 <= $signed(((+wire9[(1'h0):(1'h0)]) ?
                  wire1[(5'h11):(4'he)] : (|(^$unsigned(wire9)))));
              reg14 <= {(|{$unsigned(reg12), (^~{wire4})})};
            end
          else
            begin
              reg13 <= $signed(reg11[(4'he):(4'hb)]);
              reg14 <= {(8'hb2)};
              reg15 <= ($unsigned($signed($unsigned((reg11 || reg12)))) || wire6[(4'h8):(3'h6)]);
              reg16 <= {wire1[(1'h1):(1'h1)]};
              reg17 <= ((!((wire0 | wire8[(2'h2):(2'h2)]) * $unsigned(reg16))) ~^ wire7[(1'h1):(1'h1)]);
            end
        end
    end
endmodule
