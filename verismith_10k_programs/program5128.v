module top
#(parameter param70 = (((~&((-(8'h9c)) ^ (~&(8'haa)))) == ((((8'hb3) ? (8'hb6) : (8'hba)) ? ((8'h9f) == (8'hab)) : (&(8'hb5))) - (((8'ha7) ? (8'ha8) : (8'h9f)) ? ((8'ha5) | (8'hb4)) : ((8'hbf) || (8'ha7))))) <= (8'hb8)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire61;
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 (1'h0)};
  module4 #() modinst62 (.clk(clk), .wire7(wire1), .wire6(wire3), .wire5(wire2), .y(wire61), .wire8(wire0), .wire9((8'hac)));
  assign wire63 = wire61[(5'h10):(4'hd)];
  assign wire64 = wire3;
  assign wire65 = wire61[(2'h3):(1'h0)];
  assign wire66 = $signed((~|(^wire63[(3'h4):(1'h0)])));
  assign wire67 = wire3;
  assign wire68 = ({((-wire67[(2'h2):(2'h2)]) ^ wire67[(1'h1):(1'h0)])} ?
                      $signed($unsigned(wire63)) : (~|wire61));
  assign wire69 = $unsigned(wire66);
endmodule

module module4
#(parameter param60 = ((((((8'hb2) ? (8'haa) : (8'hbb)) ~^ (^(8'ha2))) >>> ((&(8'ha0)) != (^(7'h43)))) ? (((!(8'h9f)) >>> (~^(7'h42))) & ((~|(7'h44)) ? ((8'hb7) & (7'h40)) : (~(8'h9d)))) : ((!{(8'hb8), (8'ha4)}) ? ((~&(8'ha3)) ? (~&(8'ha4)) : (^(8'hba))) : (~^(8'hb3)))) ? (8'hb1) : ({(8'ha2)} ? (-(((7'h41) - (8'hb7)) >> ((8'haa) != (8'hbb)))) : {{((7'h42) <= (8'hb0))}})))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire5;
  input wire [(4'hd):(1'h0)] wire6;
  input wire [(3'h6):(1'h0)] wire7;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(3'h7):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire43;
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire43,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire10 = ($unsigned(wire7) ?
                      {$unsigned(wire9)} : (wire9[(4'hc):(3'h7)] ^~ $unsigned(($signed(wire5) << (wire7 & wire6)))));
  assign wire11 = $signed($signed(wire5));
  assign wire12 = wire9[(2'h3):(2'h2)];
  assign wire13 = ({wire11[(4'h8):(1'h1)]} ?
                      $unsigned($unsigned(((!wire8) ?
                          (wire12 <= wire5) : wire5))) : $unsigned($unsigned($signed((wire6 == wire6)))));
  assign wire14 = wire11;
  assign wire15 = {(^~(8'ha3)), wire6};
  assign wire16 = $signed((~((8'hb0) + (!$unsigned(wire8)))));
  assign wire17 = (8'hb1);
  assign wire18 = $signed((-($signed((~&(8'hb1))) ?
                      (~|wire8) : $unsigned((wire12 ? wire17 : (7'h40))))));
  assign wire19 = (((&$unsigned(wire12[(1'h0):(1'h0)])) ?
                          (~|(wire14[(3'h6):(3'h5)] ?
                              $unsigned(wire14) : (~&(8'hb9)))) : $unsigned(((wire16 ?
                              wire8 : wire17) + $unsigned(wire9)))) ?
                      {$unsigned(wire9),
                          $unsigned((^~((7'h40) ?
                              (8'hae) : wire11)))} : (&wire15[(4'hc):(4'hb)]));
  assign wire20 = $unsigned(wire11[(2'h3):(2'h2)]);
  assign wire21 = $unsigned($signed($signed((((7'h40) ? wire10 : wire12) ?
                      (+wire11) : ((8'ha3) * wire12)))));
  always
    @(posedge clk) begin
      reg22 <= wire15;
      reg23 <= (7'h43);
      reg24 <= (~^wire18[(1'h0):(1'h0)]);
      reg25 <= {(~^$unsigned($signed((reg24 != wire17)))),
          ($unsigned($unsigned($unsigned(reg24))) != $unsigned((8'hbe)))};
      reg26 <= $unsigned((({(|wire21), {wire15}} ~^ {(wire20 ? wire7 : reg22),
              $unsigned((7'h42))}) ?
          (((reg25 ? wire12 : (8'ha1)) && {wire19,
              (8'ha4)}) >> wire13) : $unsigned($unsigned($signed(wire6)))));
    end
  module27 #() modinst44 (wire43, clk, wire7, reg23, wire21, wire13);
  assign wire45 = wire16[(3'h6):(3'h4)];
  assign wire46 = $unsigned(((8'hb8) ?
                      ($signed($unsigned(wire12)) == $signed((wire15 ?
                          wire45 : (8'hb7)))) : wire20[(3'h6):(2'h3)]));
  assign wire47 = ((~|($unsigned((!wire13)) ~^ $unsigned(wire11))) ?
                      ({$signed(wire46[(3'h5):(3'h4)]),
                          ({wire7} ?
                              (|(8'hba)) : (wire9 && wire19))} != ((~|wire6) <= (8'hae))) : wire7[(2'h3):(1'h0)]);
  assign wire48 = wire7[(1'h0):(1'h0)];
  assign wire49 = (^wire17);
  always
    @(posedge clk) begin
      reg50 <= ((|(~^wire45)) ? (8'hb9) : ({(~|$signed((8'hae)))} & wire45));
      reg51 <= wire17[(4'hc):(3'h7)];
      reg52 <= wire49;
      if (reg22)
        begin
          reg53 <= wire47[(3'h4):(2'h2)];
          reg54 <= $unsigned((7'h41));
          reg55 <= $signed(wire20);
        end
      else
        begin
          if ((((^~$signed((wire8 + wire10))) ?
              $unsigned(wire5) : $signed($signed(reg23[(4'h8):(2'h2)]))) >= ({$unsigned((8'h9f))} && ((((8'haf) ^~ wire21) >> $signed(wire47)) ~^ ({wire45} ?
              (wire7 <= reg55) : wire16[(3'h5):(2'h3)])))))
            begin
              reg53 <= ($signed((^reg54)) - ({(^~((8'hbe) ?
                      (8'ha7) : reg50))} != ($signed((8'hbb)) < (wire7[(2'h2):(2'h2)] ?
                  (8'ha6) : reg52[(3'h4):(1'h0)]))));
              reg54 <= {((wire14 ?
                          {(wire45 ? reg55 : reg50),
                              $unsigned(reg53)} : (reg23[(5'h11):(3'h5)] != $signed(reg52))) ?
                      (~^($signed(wire5) + $unsigned((8'hb9)))) : {((~^wire13) + ((8'ha5) >= reg55)),
                          (^~reg54)})};
              reg55 <= $unsigned($signed((wire11[(2'h2):(1'h0)] & (((8'hbe) >> wire7) ?
                  reg50 : $signed(wire10)))));
              reg56 <= $unsigned(reg52[(3'h5):(3'h5)]);
              reg57 <= reg56;
            end
          else
            begin
              reg53 <= wire19[(2'h2):(1'h1)];
              reg54 <= ((($signed((~&wire16)) ?
                          {wire20[(4'h9):(4'h8)]} : $signed({(8'hb5), reg55})) ?
                      wire49[(4'hc):(4'hb)] : (&{$unsigned(wire21)})) ?
                  (wire47 ? wire13 : (+((|wire21) + (8'hab)))) : (8'hbf));
            end
        end
    end
  assign wire58 = $signed((~|(|{$unsigned(wire45), wire14[(5'h10):(3'h4)]})));
  assign wire59 = (~&((($unsigned(reg23) == {wire12,
                          (8'h9f)}) >>> reg25[(4'hc):(3'h5)]) ?
                      (^~(~&{wire7})) : (wire13[(4'he):(1'h1)] ?
                          ($unsigned(wire43) ?
                              (~wire21) : (~^wire7)) : $signed(wire20))));
endmodule

module module27
#(parameter param42 = ((&((((8'hb8) ? (8'ha3) : (8'hbb)) * ((8'hb4) ? (8'ha9) : (8'hb7))) ? ((-(8'h9e)) ? ((8'ha0) ~^ (8'ha6)) : ((7'h42) ^ (8'hb2))) : (+((8'h9f) ? (8'hb1) : (8'ha4))))) >>> ((!(((8'h9c) ? (8'ha6) : (8'hb3)) ~^ (8'ha3))) ? {(((8'hb0) ? (8'hb7) : (8'hb2)) ? ((8'ha2) << (8'hba)) : (^(8'hb0))), (-((7'h44) - (8'hb9)))} : ({{(8'ha6)}} ? {{(8'had), (7'h41)}} : ((|(8'h9d)) ? ((8'h9d) ? (8'hb7) : (8'ha1)) : ((7'h41) ? (8'hb8) : (8'haa)))))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire [(4'hc):(1'h0)] wire30;
  input wire [(4'hf):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire33,
                 wire32,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire32 = $signed($signed((^$unsigned((wire30 < wire31)))));
  assign wire33 = (wire30[(4'ha):(3'h5)] >> (-wire31));
  always
    @(posedge clk) begin
      reg34 <= $signed(wire31);
      reg35 <= (wire30 ?
          wire31[(3'h6):(2'h3)] : ((~$unsigned(wire33)) >>> ($unsigned((8'h9c)) != wire32[(3'h4):(1'h0)])));
    end
  assign wire36 = (^~(((!(~(8'hb3))) ?
                      ((wire33 ? (8'ha6) : wire29) ^~ {wire32,
                          wire28}) : wire33) <<< wire28));
  assign wire37 = ((wire29[(4'hf):(2'h2)] ?
                      (8'ha1) : ((wire28 ?
                          {(7'h40)} : reg34[(4'hc):(1'h0)]) && wire29[(3'h4):(1'h1)])) ^ $unsigned(({(+wire36),
                      (wire36 ? wire31 : wire28)} << wire30[(1'h1):(1'h1)])));
  assign wire38 = $signed((($signed((wire36 * wire28)) ?
                          (^(wire30 || wire30)) : ({wire36, reg34} | wire37)) ?
                      (reg34[(1'h0):(1'h0)] && $signed((wire29 && reg34))) : ($signed($signed(wire37)) ?
                          $unsigned({wire37}) : $signed((!(8'ha4))))));
  assign wire39 = wire31[(2'h3):(1'h1)];
  assign wire40 = $signed(wire39);
  assign wire41 = ($unsigned((~$unsigned($unsigned(wire39)))) < (({wire31} ~^ wire40) <<< ((!$signed(reg34)) ?
                      $signed({(8'ha2)}) : ($unsigned(reg34) ?
                          (wire38 | wire33) : wire33))));
endmodule
