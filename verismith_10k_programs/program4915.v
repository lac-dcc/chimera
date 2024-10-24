module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(4'he):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire34,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg36,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (!$unsigned(($signed(wire4) * $signed((wire4 && (8'ha4))))));
  assign wire6 = ((8'hbd) | $signed((!{(wire3 >= (7'h44))})));
  assign wire7 = ($unsigned(wire0) ^~ $unsigned(wire3));
  module8 #() modinst35 (wire34, clk, wire5, wire6, wire4, wire7);
  always
    @(posedge clk) begin
      reg36 <= wire34;
    end
  assign wire37 = {(&(wire2[(3'h5):(1'h0)] ?
                          wire4 : (wire5 >>> wire6[(5'h12):(3'h6)])))};
  assign wire38 = wire5[(1'h1):(1'h1)];
  assign wire39 = (wire7[(4'h8):(3'h4)] >>> ((8'ha2) << wire38));
  assign wire40 = $unsigned(wire3[(1'h1):(1'h0)]);
  assign wire41 = ($unsigned($unsigned($unsigned((wire5 ? wire6 : wire1)))) ?
                      {{(~|wire40), wire7},
                          $signed(wire40)} : {(wire39[(3'h6):(3'h6)] * ($unsigned(wire3) ?
                              $unsigned(wire4) : (wire38 ? wire38 : wire7)))});
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire14,
                 wire13,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg15,
                 (1'h0)};
  assign wire13 = $signed($unsigned($signed(wire12[(1'h0):(1'h0)])));
  assign wire14 = $signed($signed(wire11));
  always
    @(posedge clk) begin
      reg15 <= $signed($unsigned($signed((~^(wire12 ? wire11 : wire9)))));
    end
  assign wire16 = (($unsigned(((wire9 ?
                      (8'haf) : (8'ha5)) * ((8'hb7) <= reg15))) || (reg15 ^ (~|(8'hac)))) | wire14[(4'hf):(4'he)]);
  assign wire17 = ((((wire16[(4'h8):(3'h6)] ?
                          reg15[(2'h3):(1'h0)] : $unsigned(wire13)) ?
                      ($unsigned((8'hb2)) ?
                          (wire12 & reg15) : (~|wire13)) : $unsigned(wire12)) != $signed(wire13)) * (wire10 ^~ wire13));
  assign wire18 = $signed((wire9[(4'hf):(2'h3)] ?
                      ($signed((~|wire13)) ?
                          wire17[(4'h9):(2'h2)] : wire14) : (~(8'hb2))));
  assign wire19 = {wire18[(3'h5):(3'h4)],
                      $unsigned($unsigned($unsigned((^~wire14))))};
  assign wire20 = (|(((^~wire9) ?
                      $signed(reg15[(1'h1):(1'h0)]) : (&(wire17 ?
                          wire14 : wire13))) << {wire18[(3'h4):(1'h0)]}));
  always
    @(posedge clk) begin
      reg21 <= (-{wire18[(1'h1):(1'h0)]});
      reg22 <= wire20;
      if ($unsigned((~wire13[(3'h4):(2'h3)])))
        begin
          reg23 <= $unsigned((&($unsigned((wire16 <<< wire11)) ?
              $unsigned({wire16}) : wire12[(2'h2):(1'h1)])));
        end
      else
        begin
          reg23 <= ($unsigned(wire20) ?
              (&{(~(reg23 ? wire11 : wire9)),
                  (^{(8'hae),
                      wire19})}) : $unsigned(($unsigned($unsigned(wire19)) ?
                  wire18[(2'h2):(2'h2)] : ((~|wire11) ^~ (wire12 ?
                      wire20 : wire9)))));
          reg24 <= $unsigned(wire10);
          if ((($unsigned($unsigned((8'hbc))) != $signed($signed($unsigned(wire10)))) ?
              wire9[(4'ha):(2'h3)] : ((8'hab) ?
                  (wire9[(3'h6):(3'h5)] ?
                      ({wire18} ?
                          (reg15 > wire10) : {wire17}) : (~|((8'ha3) != reg22))) : (~$signed(wire9[(3'h5):(1'h0)])))))
            begin
              reg25 <= wire10[(3'h6):(1'h1)];
              reg26 <= $unsigned($unsigned({$unsigned((wire13 != (8'hbb))),
                  (^~(wire19 && wire16))}));
              reg27 <= {(wire16[(2'h3):(2'h3)] ?
                      $signed((((8'hbd) ?
                          wire16 : reg26) * (7'h43))) : (wire12 ?
                          ({wire13, reg24} ?
                              $signed(reg24) : $unsigned(reg26)) : $unsigned($signed(wire13))))};
              reg28 <= $unsigned(wire13);
            end
          else
            begin
              reg25 <= wire10;
              reg26 <= reg15[(3'h4):(3'h4)];
              reg27 <= ($signed((((reg15 ^~ wire10) == reg22) ?
                  {(reg21 << reg23)} : wire16)) >> reg28[(4'ha):(3'h7)]);
              reg28 <= $unsigned(reg27);
              reg29 <= wire10[(2'h3):(2'h2)];
            end
          reg30 <= $unsigned(wire20);
        end
      reg31 <= reg15;
    end
  assign wire32 = (+({reg24[(4'hc):(4'hc)]} ?
                      $unsigned(reg21) : (reg23 <<< $unsigned({(8'ha4),
                          wire19}))));
  assign wire33 = (~^(wire13 ^~ ($unsigned($signed(wire11)) ?
                      reg29[(1'h0):(1'h0)] : (-((8'ha0) ? reg31 : reg24)))));
endmodule
