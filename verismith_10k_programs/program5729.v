module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire4;
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg5,
                 (1'h0)};
  assign wire4 = ({(!($unsigned(wire2) || $signed(wire0))),
                         $unsigned($signed({wire3}))} ?
                     wire0[(3'h7):(3'h5)] : (~&wire3));
  always
    @(posedge clk) begin
      reg5 <= (!((!wire2[(3'h6):(1'h0)]) ?
          ($signed(wire4) << (7'h43)) : $signed(wire2)));
    end
  assign wire6 = $unsigned((^~($unsigned(reg5) ?
                     wire2[(1'h1):(1'h1)] : (&wire0))));
  assign wire7 = wire6[(5'h13):(5'h10)];
  assign wire8 = wire7;
  assign wire9 = (wire6[(1'h0):(1'h0)] | ((~(8'ha1)) >> wire3));
  assign wire10 = $signed((wire2 ?
                      wire3[(3'h4):(1'h0)] : ((wire7[(3'h5):(3'h4)] ?
                              (wire8 > wire3) : wire0[(4'hd):(3'h6)]) ?
                          (wire9 ?
                              $unsigned(wire9) : wire1) : $signed((wire4 && wire9)))));
  assign wire11 = $signed(((8'hae) ? (~^wire6) : $signed(wire8)));
  assign wire12 = (~&($unsigned(((~wire2) ? $unsigned(wire2) : wire8)) ?
                      wire4[(1'h0):(1'h0)] : wire2[(4'hf):(2'h2)]));
  assign wire13 = wire6;
  always
    @(posedge clk) begin
      reg14 <= $unsigned(($unsigned($unsigned($signed(wire2))) ?
          wire6[(4'he):(4'hb)] : $signed(($unsigned(wire12) << (|wire12)))));
      reg15 <= wire6;
      reg16 <= (($signed(($unsigned(wire1) & {wire3,
              reg14})) | $unsigned(({(8'hac)} >= (wire13 ^~ wire3)))) ?
          $signed((({(8'h9f)} < $signed(wire12)) < ({wire3} ~^ wire1[(1'h1):(1'h0)]))) : wire9[(2'h3):(1'h0)]);
      reg17 <= $signed((wire1[(3'h7):(3'h6)] | {(wire9[(2'h3):(1'h0)] ?
              reg5 : wire11),
          ($signed(wire2) >= (~reg15))}));
      if ($unsigned(reg16))
        begin
          reg18 <= wire2;
          reg19 <= ($signed(({(wire3 ? (7'h44) : wire3),
                  (wire11 | wire4)} * ((reg16 & wire12) >= $signed((8'hb9))))) ?
              wire2 : ($unsigned((~&(wire2 << wire0))) <= $signed($unsigned(wire12))));
        end
      else
        begin
          if ({(~(!wire0)), reg19})
            begin
              reg18 <= (|reg17[(1'h0):(1'h0)]);
              reg19 <= (^~$unsigned((8'h9d)));
            end
          else
            begin
              reg18 <= $signed($signed(((wire7 ?
                  ((8'hb4) ?
                      wire10 : reg19) : $signed(reg14)) + wire11[(1'h1):(1'h0)])));
              reg19 <= wire0;
              reg20 <= reg17[(4'h8):(3'h4)];
            end
          reg21 <= (((~$unsigned((reg16 ? reg16 : wire9))) ?
              $signed($unsigned(wire9[(3'h4):(2'h2)])) : wire11[(1'h1):(1'h0)]) <= {wire0[(3'h7):(3'h7)]});
          reg22 <= $unsigned(($signed(($signed(wire2) + (reg20 << wire9))) ?
              reg17[(3'h5):(3'h4)] : ((~^(!wire11)) ?
                  (8'hb8) : ((wire12 ? wire13 : reg5) <= reg21))));
        end
    end
  always
    @(posedge clk) begin
      reg23 <= ({reg22} + (!(8'ha1)));
      reg24 <= $signed((|$unsigned($unsigned((wire8 ? wire7 : (8'hbd))))));
      reg25 <= reg14[(5'h11):(1'h0)];
      reg26 <= $signed((~|(~^$unsigned((^wire9)))));
      reg27 <= reg25[(3'h4):(2'h2)];
    end
  assign wire28 = {((wire0[(4'hb):(3'h7)] ?
                              reg24[(2'h3):(2'h2)] : $unsigned($signed((8'hbb)))) ?
                          (wire9[(2'h2):(2'h2)] ?
                              $signed(((8'had) - wire10)) : wire3) : (|($signed(wire6) ?
                              (reg20 ? (8'had) : wire6) : (8'hbd))))};
  assign wire29 = wire10;
endmodule
