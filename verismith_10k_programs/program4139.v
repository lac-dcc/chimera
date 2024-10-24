module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire18,
                 wire12,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 (1'h0)};
  assign wire5 = ({$signed(wire2)} ? (~$signed(wire0)) : wire1[(2'h3):(1'h0)]);
  assign wire6 = ((8'hbb) ?
                     (!(8'hab)) : (^($unsigned((wire1 == wire0)) << ({wire2} ?
                         wire2 : {wire1}))));
  assign wire7 = (^~wire2[(4'hb):(2'h2)]);
  assign wire8 = {(!wire6),
                     ($signed((~|(~^wire7))) ?
                         $signed(((wire0 || wire1) ?
                             $signed(wire7) : wire4[(1'h1):(1'h1)])) : $unsigned((+wire2[(3'h7):(1'h0)])))};
  assign wire9 = $unsigned(wire4);
  assign wire10 = ((!(wire7[(4'he):(3'h4)] < ($unsigned(wire7) > $signed(wire7)))) >> wire6);
  always
    @(posedge clk) begin
      reg11 <= (8'haa);
    end
  assign wire12 = ((((^~(~|wire3)) ?
                      wire10 : (~(-reg11))) - wire7) << (wire1[(2'h2):(2'h2)] >> wire4[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg13 <= $unsigned($unsigned($signed($unsigned(wire1[(1'h0):(1'h0)]))));
      reg14 <= ((!(!($unsigned(wire2) >= (wire3 ?
          wire1 : reg11)))) + $unsigned(wire9[(4'hf):(3'h5)]));
      reg15 <= (&(^~$signed(((~&wire8) >>> reg13[(2'h3):(1'h1)]))));
      reg16 <= $signed((!wire8[(2'h2):(1'h1)]));
      reg17 <= $signed(((|$signed(wire7)) ~^ (~^((~^wire0) <= $unsigned(wire6)))));
    end
  assign wire18 = $signed(reg11[(3'h4):(3'h4)]);
endmodule
