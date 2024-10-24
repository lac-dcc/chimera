module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire49;
  reg [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(5'h14):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire78,
                 wire76,
                 wire62,
                 wire49,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 (1'h0)};
  module4 #() modinst50 (wire49, clk, wire1, wire3, wire0, wire2, (7'h43));
  always
    @(posedge clk) begin
      reg51 <= wire2[(2'h2):(1'h0)];
      if (($signed(wire0) ^~ wire2[(1'h1):(1'h0)]))
        begin
          reg52 <= $signed(wire3[(4'h9):(2'h3)]);
          reg53 <= $unsigned((|wire2));
          reg54 <= reg51[(4'ha):(2'h3)];
          reg55 <= (reg53[(1'h0):(1'h0)] ?
              $unsigned((8'hb4)) : ((~&((reg51 ~^ (8'ha3)) | (7'h41))) ?
                  $unsigned(((wire3 != wire0) ?
                      reg53 : (reg52 ? wire1 : reg53))) : {(^{wire0, wire1}),
                      (^wire0)}));
        end
      else
        begin
          if (reg53)
            begin
              reg52 <= $signed(wire2[(3'h6):(2'h3)]);
              reg53 <= {{reg51[(4'ha):(1'h1)]}};
              reg54 <= {$signed(((~(+reg51)) ?
                      wire1[(4'he):(4'hc)] : $signed($signed(wire49)))),
                  wire1};
            end
          else
            begin
              reg52 <= reg53[(3'h4):(3'h4)];
              reg53 <= (({$unsigned($unsigned(wire2))} ?
                      wire49[(1'h0):(1'h0)] : wire2) ?
                  wire2 : reg54[(5'h11):(4'h9)]);
            end
          reg55 <= ((^~{reg52[(2'h2):(2'h2)]}) ?
              wire0[(3'h4):(2'h3)] : $signed(reg55));
          reg56 <= (-((!(8'hb6)) ?
              $unsigned((|(wire1 || (8'hb8)))) : (~^$signed((wire3 ^ reg51)))));
          if ($unsigned(wire0[(5'h13):(4'h9)]))
            begin
              reg57 <= reg51;
              reg58 <= {$signed(wire0)};
            end
          else
            begin
              reg57 <= ((~^($unsigned($signed(wire2)) ?
                      ($unsigned(reg53) ?
                          (~^wire0) : (reg56 - wire1)) : $signed($signed(reg54)))) ?
                  (!reg52[(2'h2):(1'h0)]) : {$unsigned(wire1)});
              reg58 <= $signed(($unsigned(reg55) ?
                  reg55 : $signed($signed(((8'h9c) ? wire49 : reg53)))));
              reg59 <= $signed((reg53[(3'h4):(1'h0)] ?
                  wire49[(3'h5):(3'h4)] : (^~(^$signed(reg54)))));
              reg60 <= $signed((7'h42));
              reg61 <= wire49[(1'h0):(1'h0)];
            end
        end
    end
  assign wire62 = ($signed(reg58) ?
                      ((|(~^{reg58})) ?
                          $signed(wire1) : ((~(reg56 < reg61)) <<< wire0[(3'h5):(2'h3)])) : $signed($unsigned((!$signed(reg58)))));
  module63 #() modinst77 (.wire66(wire2), .wire65(reg57), .wire68(wire1), .clk(clk), .y(wire76), .wire64(reg55), .wire67(reg51));
  assign wire78 = {reg54[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      if ({((reg58 <= wire1) - (|((wire62 ? reg61 : (8'hab)) ?
              $unsigned(reg55) : $unsigned(reg55))))})
        begin
          reg79 <= (~^$signed((($unsigned(reg58) << (wire49 >= reg57)) ?
              ($signed(wire2) ? reg52[(3'h6):(3'h6)] : (|(8'had))) : ((^reg55) ?
                  (wire3 ? (8'hb9) : reg54) : wire62[(2'h2):(1'h1)]))));
        end
      else
        begin
          if (((|reg51[(1'h0):(1'h0)]) ?
              $signed((((reg53 || reg58) ?
                      wire0[(4'h9):(3'h7)] : (wire62 ? reg55 : wire76)) ?
                  $signed((~&reg51)) : $unsigned((reg55 ?
                      wire3 : wire76)))) : (8'ha5)))
            begin
              reg79 <= $signed(reg56[(3'h7):(3'h7)]);
              reg80 <= reg60[(2'h3):(1'h1)];
              reg81 <= wire49[(2'h2):(1'h1)];
              reg82 <= ($unsigned($signed((reg81[(3'h7):(3'h5)] ?
                      (reg80 ? reg79 : reg51) : (reg79 ? wire1 : wire3)))) ?
                  (($unsigned((wire76 * reg54)) || reg53[(2'h2):(2'h2)]) >= reg59[(4'ha):(3'h6)]) : {({{reg57}} & wire2)});
              reg83 <= $unsigned($unsigned((({wire3} << wire76[(3'h6):(1'h0)]) ?
                  reg54[(3'h7):(2'h3)] : $signed((reg60 ? reg82 : wire62)))));
            end
          else
            begin
              reg79 <= (7'h41);
              reg80 <= $signed((({{wire2, (8'hb4)}, reg83[(4'he):(2'h3)]} ?
                  (7'h41) : (reg54[(2'h3):(1'h0)] ?
                      (!reg58) : {reg59})) << reg54));
            end
          reg84 <= wire2[(4'hb):(4'h8)];
          reg85 <= {((reg82 * $unsigned({wire62, (8'hb4)})) ?
                  (8'ha5) : wire2[(3'h6):(1'h0)]),
              (8'hb7)};
        end
      reg86 <= wire76[(3'h4):(2'h2)];
      reg87 <= (~reg79);
    end
  always
    @(posedge clk) begin
      if ((!(($signed($unsigned(reg80)) ?
          reg86[(1'h0):(1'h0)] : reg84) | (^~(-{wire0})))))
        begin
          if ((reg54 + $signed((8'ha3))))
            begin
              reg88 <= (-($unsigned($signed(reg52[(1'h1):(1'h0)])) ^~ reg82));
              reg89 <= wire49[(3'h7):(3'h5)];
              reg90 <= $unsigned(reg51[(3'h7):(3'h4)]);
              reg91 <= reg85[(1'h0):(1'h0)];
              reg92 <= $signed(reg87);
            end
          else
            begin
              reg88 <= reg57[(2'h3):(1'h0)];
              reg89 <= ((($signed(((8'hba) ?
                          reg88 : reg61)) >= $signed((~reg58))) ?
                      ((^reg80[(4'h9):(2'h3)]) ^ $signed(((8'hac) ?
                          reg54 : wire0))) : ((-((8'hb4) < reg90)) <<< {((8'hb8) >>> wire78)})) ?
                  $unsigned(((8'hbd) < reg54)) : ($signed(reg84) && (reg57 >> (~&(reg87 ~^ wire3)))));
              reg90 <= {(^~(8'hb9))};
              reg91 <= reg57;
            end
          reg93 <= (~&(reg91 & ({$signed(wire49)} ^~ (reg81 ?
              (~&wire3) : {reg56, reg90}))));
        end
      else
        begin
          reg88 <= $unsigned(wire76);
          reg89 <= ((reg57[(1'h0):(1'h0)] ?
              {reg55} : reg82[(3'h6):(3'h4)]) || ($unsigned((-$signed(wire78))) ?
              {((reg85 ? reg86 : reg57) ?
                      (&reg93) : (~|(8'hb2)))} : $signed(reg51)));
        end
      reg94 <= wire49[(3'h4):(1'h0)];
      reg95 <= $signed($signed(reg52[(2'h3):(2'h3)]));
      reg96 <= (~reg57);
    end
  assign wire97 = $signed($unsigned($unsigned(((^reg58) | reg81[(2'h3):(1'h1)]))));
  assign wire98 = (|reg58[(4'hb):(3'h6)]);
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire68;
  input wire signed [(4'h8):(1'h0)] wire67;
  input wire [(4'hc):(1'h0)] wire66;
  input wire signed [(3'h6):(1'h0)] wire65;
  input wire [(3'h6):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  assign y = {wire75, wire74, wire73, wire72, wire71, wire70, wire69, (1'h0)};
  assign wire69 = $signed(((|(wire68[(1'h1):(1'h0)] > wire67)) == $signed(wire65[(1'h0):(1'h0)])));
  assign wire70 = ({$unsigned($signed((wire66 < wire67)))} <<< (wire67[(1'h1):(1'h1)] ?
                      wire66 : wire64));
  assign wire71 = ((wire64[(3'h5):(1'h1)] ?
                      (8'h9c) : ($unsigned($unsigned(wire65)) <= (8'ha2))) < {$unsigned((8'h9d))});
  assign wire72 = wire71;
  assign wire73 = $signed(($unsigned($signed(wire67)) ?
                      (~$unsigned({wire64, wire71})) : wire69[(3'h6):(1'h1)]));
  assign wire74 = (7'h41);
  assign wire75 = {($unsigned(wire64[(2'h2):(2'h2)]) ?
                          wire66[(3'h4):(1'h1)] : wire72[(1'h1):(1'h1)]),
                      (wire69[(1'h1):(1'h0)] ?
                          $signed(({(7'h43),
                              wire67} * (wire68 << wire67))) : {wire73})};
endmodule

module module4
#(parameter param48 = {((((~&(8'ha5)) == ((8'hb9) ? (7'h41) : (8'hac))) ? (((8'hba) ? (8'hbc) : (8'hb5)) - (8'ha5)) : ((~&(8'ha9)) ? ((8'ha2) <<< (8'h9c)) : {(8'hb4)})) - {(^((8'hb8) >> (8'hb9))), {(!(8'ha0)), ((8'hb6) ? (8'ha0) : (8'hb5))}})})
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire5;
  input wire signed [(5'h12):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire24;
  wire [(4'he):(1'h0)] wire39;
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire17,
                 wire18,
                 wire19,
                 wire24,
                 wire39,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire10 = wire6[(4'hc):(4'hc)];
  assign wire11 = ($unsigned(wire9[(2'h2):(1'h1)]) ^ ($signed((|(wire6 ?
                          (8'hbb) : wire8))) ?
                      (7'h43) : wire5));
  assign wire12 = wire5;
  assign wire13 = wire5;
  always
    @(posedge clk) begin
      reg14 <= ((^~$unsigned((wire12 ?
          (^~wire10) : (wire11 ? wire10 : wire6)))) <<< ((|($unsigned(wire13) ?
              wire12 : wire9)) ?
          wire13 : (!$unsigned($unsigned(wire6)))));
      reg15 <= $unsigned($signed(wire9));
      reg16 <= $unsigned(($unsigned(wire12[(4'hf):(2'h2)]) ?
          ((!$signed(reg15)) << $signed((wire12 - wire12))) : (8'hb2)));
    end
  assign wire17 = $unsigned(wire7[(3'h7):(1'h0)]);
  assign wire18 = (wire17 ^~ $unsigned((~|$unsigned((reg14 ?
                      (7'h44) : wire12)))));
  assign wire19 = $signed(((~|(wire18[(1'h1):(1'h0)] <<< (8'hb6))) ^~ {(wire8 ^~ $unsigned(wire7)),
                      $signed($unsigned(wire7))}));
  always
    @(posedge clk) begin
      reg20 <= $unsigned((((8'hb7) ?
              wire9 : ((wire6 | wire9) ? (~&wire17) : {wire9, (8'hbf)})) ?
          wire13 : ((~&$unsigned(wire11)) ?
              $signed(wire9) : $unsigned(wire19))));
      reg21 <= (|((reg20[(4'h9):(4'h9)] ?
              {(reg15 - wire11),
                  (wire9 > reg15)} : $unsigned((reg16 ~^ reg14))) ?
          $signed((~&(wire7 ? reg14 : wire7))) : $signed(reg20)));
      reg22 <= wire5;
      reg23 <= ($signed($unsigned(((wire19 >> wire11) & (wire17 ?
          wire8 : wire7)))) & (&wire9[(1'h0):(1'h0)]));
    end
  assign wire24 = wire8[(4'h8):(1'h1)];
  module25 #() modinst40 (wire39, clk, wire10, reg23, wire9, reg15, wire7);
  always
    @(posedge clk) begin
      reg41 <= (7'h43);
      reg42 <= (~^($unsigned($signed({wire24})) ?
          wire10[(3'h5):(2'h3)] : (-$unsigned(reg16))));
      reg43 <= reg42[(3'h6):(2'h3)];
      reg44 <= (-wire19);
      reg45 <= $signed(reg21[(3'h5):(3'h4)]);
    end
  assign wire46 = wire24;
  assign wire47 = (($signed((~^(reg22 >>> wire24))) ?
                      (~&(-$signed(wire13))) : (^($signed(reg41) <<< $signed(reg44)))) || (!(((wire10 < reg20) >> reg15) * wire19)));
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire29;
  input wire signed [(3'h6):(1'h0)] wire28;
  input wire [(5'h10):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire31;
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 reg32,
                 (1'h0)};
  assign wire31 = (~(((^~(&wire29)) <= wire29) ?
                      wire27[(3'h5):(2'h2)] : {wire30}));
  always
    @(posedge clk) begin
      reg32 <= wire26[(3'h6):(1'h1)];
    end
  assign wire33 = wire28[(3'h6):(3'h6)];
  assign wire34 = wire28;
  assign wire35 = {{$unsigned($signed((!wire33))),
                          $signed($unsigned($unsigned(wire31)))}};
  assign wire36 = (!{(((&(8'hbb)) + $signed(wire31)) >>> $unsigned((-wire33))),
                      wire31});
  assign wire37 = wire35[(3'h7):(3'h5)];
  assign wire38 = {($signed(($signed((8'ha7)) ?
                              wire34 : (wire36 ? wire36 : wire30))) ?
                          (~&wire30) : (wire35[(4'hf):(4'hc)] >= $unsigned(wire33[(1'h1):(1'h1)])))};
endmodule
