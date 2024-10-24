module top
#(parameter param126 = {(^~(((~|(8'ha0)) <= {(8'hac), (8'haf)}) ? (^((7'h43) >= (8'hbc))) : (|((8'hbf) == (7'h40)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h16b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire88;
  wire [(4'hb):(1'h0)] wire87;
  wire [(5'h11):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(4'ha):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  assign y = {wire125,
                 wire123,
                 wire88,
                 wire87,
                 wire77,
                 wire75,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 wire4,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg6,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire4;
  always
    @(posedge clk) begin
      if ((^~$unsigned({(|(&wire1))})))
        begin
          reg6 <= (($unsigned(wire1[(1'h1):(1'h1)]) >>> wire4[(3'h5):(2'h3)]) ?
              ((($signed(wire1) ~^ wire2[(3'h4):(2'h2)]) ?
                      ((wire2 ? (8'hb7) : wire2) ?
                          (~wire5) : wire1) : $signed(((8'ha0) ?
                          wire3 : wire4))) ?
                  {$unsigned((&wire0)),
                      wire5} : (+wire0)) : $signed($signed($unsigned({wire2,
                  wire0}))));
        end
      else
        begin
          reg6 <= (+(wire5 ? wire1[(1'h1):(1'h1)] : (!wire4)));
        end
    end
  assign wire7 = (|$signed($unsigned($signed((8'hb3)))));
  assign wire8 = wire3[(3'h6):(3'h5)];
  assign wire9 = ({$unsigned(wire8[(4'h9):(1'h0)]),
                     wire1[(1'h1):(1'h0)]} || ($signed(wire1[(3'h5):(1'h1)]) ?
                     (^~($unsigned(wire1) ? (^(8'hb2)) : wire8)) : (8'hb0)));
  assign wire10 = ((~|wire2) ? wire2[(2'h3):(2'h3)] : wire0);
  always
    @(posedge clk) begin
      reg11 <= wire9[(4'h8):(2'h3)];
      if ($signed($signed(wire4)))
        begin
          reg12 <= $unsigned($unsigned(($unsigned($unsigned(wire8)) ?
              wire8 : (reg11 ? (wire1 & (8'hac)) : (wire5 < wire4)))));
          reg13 <= $signed($unsigned(reg11));
        end
      else
        begin
          reg12 <= wire5;
          reg13 <= reg6[(1'h0):(1'h0)];
          reg14 <= wire1[(1'h0):(1'h0)];
        end
      reg15 <= (~&(8'ha4));
      reg16 <= {$signed(wire8[(4'h9):(4'h9)])};
      reg17 <= reg16[(3'h5):(3'h5)];
    end
  module18 #() modinst76 (.wire20(wire7), .wire23(reg15), .clk(clk), .wire21(wire0), .wire19(wire1), .wire22(wire5), .y(wire75));
  assign wire77 = wire9;
  always
    @(posedge clk) begin
      reg78 <= wire75;
      if ((-$signed($unsigned((~(reg11 & wire5))))))
        begin
          reg79 <= (({wire10} ?
              $unsigned({reg78[(2'h3):(2'h2)]}) : (^~{(reg78 + wire5)})) * $unsigned(((~|(~^(8'had))) != wire10[(3'h6):(3'h5)])));
          reg80 <= {((~^(^(^~(8'hb6)))) ?
                  (wire2[(2'h3):(1'h0)] || ((reg14 ?
                      (8'hb4) : wire9) ~^ reg6[(3'h5):(2'h3)])) : ({wire7} ?
                      ($signed(wire8) << (^~wire5)) : ($unsigned(reg13) ?
                          (~|reg15) : (wire5 != wire77))))};
          reg81 <= (reg14[(4'hf):(3'h4)] ?
              $signed(wire7[(2'h2):(1'h0)]) : {($unsigned(wire2[(1'h0):(1'h0)]) ?
                      wire3 : ($signed(wire3) ?
                          reg6[(3'h4):(2'h3)] : $signed(wire4)))});
          reg82 <= {$unsigned((!$signed((wire5 ? (7'h40) : wire3))))};
          reg83 <= wire9;
        end
      else
        begin
          if ($signed(reg80[(3'h4):(3'h4)]))
            begin
              reg79 <= wire7;
            end
          else
            begin
              reg79 <= $signed(((wire7 || wire8) - (^~(wire9[(1'h1):(1'h0)] ~^ $unsigned((8'h9f))))));
              reg80 <= (8'ha1);
              reg81 <= ((($unsigned(wire9[(3'h4):(1'h0)]) ?
                          $unsigned((wire3 ?
                              reg11 : wire4)) : reg82[(1'h1):(1'h0)]) ?
                      {{{wire3, reg80}, $signed(reg79)},
                          ({(8'ha9),
                              reg78} & (reg13 & reg82))} : reg81[(4'h8):(1'h1)]) ?
                  $signed(({(wire10 ^ (8'hbd)), (wire5 << wire9)} ?
                      reg11[(5'h10):(1'h0)] : reg81[(2'h3):(2'h3)])) : ((((wire0 >= wire5) ?
                          (wire3 ? wire0 : reg81) : wire0[(3'h4):(3'h4)]) ?
                      wire5 : ($unsigned(reg78) + $unsigned((7'h42)))) >>> (wire3[(3'h4):(1'h0)] ?
                      $unsigned({reg79, reg12}) : reg13)));
              reg82 <= $signed(((wire75 ?
                  {(^reg83)} : (~{reg17})) < (~^reg14[(3'h4):(3'h4)])));
            end
          reg83 <= ((~&$unsigned((8'h9f))) | (|$unsigned((reg16[(1'h0):(1'h0)] ?
              (|wire5) : reg79[(4'hb):(3'h4)]))));
          reg84 <= $unsigned((&($signed(reg79) ? wire4 : (-(&wire7)))));
        end
      reg85 <= {(|reg11[(4'h9):(2'h3)]),
          ($unsigned(reg14[(2'h3):(1'h0)]) ?
              (reg80 * $signed(wire0)) : (((wire1 || wire7) >>> (reg79 ?
                      reg16 : (8'hbc))) ?
                  (^~$unsigned(reg79)) : (8'hbc)))};
      reg86 <= reg82[(2'h2):(1'h0)];
    end
  assign wire87 = {{(~$unsigned((~^reg81)))}, wire1[(4'h8):(4'h8)]};
  assign wire88 = {(reg86[(4'hc):(3'h5)] ?
                          (~^(&((8'hb5) ?
                              reg85 : wire9))) : (|$unsigned({wire1})))};
  module89 #() modinst124 (.wire92(wire3), .wire91(wire77), .wire90(reg83), .wire93(reg13), .y(wire123), .clk(clk));
  assign wire125 = ($unsigned(reg80[(1'h1):(1'h1)]) < (8'hb6));
endmodule

module module89
#(parameter param122 = (((({(8'ha9), (8'had)} ? (!(8'hb7)) : ((8'haa) * (8'hb6))) << (8'h9d)) ? (({(8'h9d)} ? {(8'hb9), (8'h9e)} : (^(8'hb1))) ? (((8'had) ? (8'haa) : (8'hb0)) ? ((8'ha9) == (8'hb8)) : (7'h42)) : ((~(8'haf)) << ((7'h44) ? (8'hbd) : (8'haf)))) : (((8'ha8) - ((8'hb0) ? (7'h40) : (8'hac))) ^~ {(^~(8'ha9)), ((8'ha3) ? (8'h9e) : (8'hb7))})) ? (7'h44) : (~&(8'had))))
(y, clk, wire90, wire91, wire92, wire93);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire90;
  input wire signed [(5'h10):(1'h0)] wire91;
  input wire [(5'h14):(1'h0)] wire92;
  input wire signed [(4'hc):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire117;
  wire [(5'h15):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(5'h15):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire111;
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire94,
                 wire95,
                 wire96,
                 wire111,
                 (1'h0)};
  assign wire94 = wire91[(4'ha):(1'h0)];
  assign wire95 = $unsigned(wire92);
  assign wire96 = (~&(((((7'h44) > wire93) ? (wire94 >> wire90) : wire94) ?
                      wire95[(1'h0):(1'h0)] : $unsigned(wire90)) | (~$unsigned($unsigned(wire94)))));
  module97 #() modinst112 (wire111, clk, wire96, wire93, wire92, wire90, wire94);
  assign wire113 = {$signed($signed(wire92)),
                       $signed(($unsigned(wire111[(4'ha):(3'h4)]) <<< ((wire94 ?
                               (8'hb0) : wire111) ?
                           ((7'h42) ?
                               wire92 : wire92) : wire96[(4'hd):(4'hb)])))};
  assign wire114 = (wire91 < (|wire92[(5'h10):(3'h6)]));
  assign wire115 = wire90;
  assign wire116 = $signed(((wire114 ?
                       $unsigned(wire111[(2'h3):(1'h1)]) : (((8'hba) <= wire114) ^~ (wire93 ?
                           wire91 : wire92))) << (wire92[(3'h5):(1'h0)] < {(wire91 != wire95),
                       $unsigned(wire90)})));
  assign wire117 = $signed((((&wire114[(1'h0):(1'h0)]) ?
                       ($signed(wire115) ?
                           (^wire113) : $signed(wire116)) : wire95[(2'h2):(1'h0)]) ^~ ((-(wire96 ?
                       wire91 : (8'hb2))) <= $signed($unsigned(wire93)))));
  assign wire118 = $signed($unsigned(($unsigned(wire111[(4'hb):(3'h6)]) ?
                       wire90[(2'h3):(1'h1)] : wire91[(1'h0):(1'h0)])));
  assign wire119 = $unsigned((wire115 >>> (wire91[(1'h0):(1'h0)] ^~ (wire96 ?
                       (wire95 ^ (8'hb6)) : (wire92 * wire116)))));
  assign wire120 = wire117;
  assign wire121 = (^~(wire116 ?
                       ((^~$unsigned(wire120)) ?
                           (^~((8'ha1) <<< (8'hb7))) : $signed(wire114)) : (!wire116)));
endmodule

module module18
#(parameter param74 = {(^~({((8'hb6) ? (8'hbb) : (8'hb8)), {(8'ha4), (8'h9e)}} < ({(8'hae)} ? {(8'hae)} : ((8'hb8) - (8'hb2))))), (({{(7'h42), (8'hbb)}} ~^ (^{(8'ha0)})) + {(~&((8'ha6) >>> (7'h44)))})})
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire signed [(4'h9):(1'h0)] wire21;
  input wire [(2'h2):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire72;
  wire [(3'h5):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire72,
                 wire35,
                 wire34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= $signed(wire20[(1'h1):(1'h0)]);
      reg25 <= {((+$unsigned($signed(wire22))) ~^ $signed((reg24[(4'h9):(4'h9)] ?
              (+wire21) : reg24[(4'ha):(4'h9)]))),
          $unsigned(wire21)};
      if ((wire21[(1'h1):(1'h1)] ?
          wire22 : {$signed(({(7'h42), wire21} ?
                  $unsigned((8'h9e)) : (~|wire19))),
              ((-wire23[(1'h1):(1'h0)]) ? wire23 : {wire20})}))
        begin
          reg26 <= $signed((wire20 ?
              ((~|((8'hb3) | (8'ha0))) ?
                  {(|wire23)} : (8'hac)) : reg25[(3'h7):(3'h4)]));
          reg27 <= (&($unsigned((~&reg25[(1'h1):(1'h1)])) ?
              (~&($unsigned(wire22) || (wire19 & reg25))) : (wire20[(1'h0):(1'h0)] < ((&reg24) ?
                  {reg24} : {wire19}))));
          reg28 <= $unsigned((wire19[(2'h3):(1'h1)] > $signed(reg27)));
        end
      else
        begin
          if (reg28[(3'h4):(1'h1)])
            begin
              reg26 <= (reg25[(3'h5):(2'h2)] ?
                  {(^(!{reg24}))} : {(&(wire22[(2'h2):(2'h2)] <= $signed(reg27))),
                      wire20});
              reg27 <= $signed($signed((reg28[(2'h3):(1'h0)] ?
                  $unsigned((~|wire23)) : $signed($signed(reg25)))));
              reg28 <= (~$unsigned($unsigned((reg26 >= (wire21 ?
                  wire21 : wire19)))));
            end
          else
            begin
              reg26 <= (+wire20);
              reg27 <= $unsigned(({reg27[(4'he):(4'ha)]} ^~ ($unsigned((wire21 - reg25)) ?
                  (reg24 - {reg27}) : (~|$unsigned(wire19)))));
              reg28 <= (^reg25[(4'he):(3'h7)]);
              reg29 <= $signed(wire22[(1'h1):(1'h1)]);
              reg30 <= (+(8'hbb));
            end
          reg31 <= $unsigned((wire22[(2'h3):(1'h1)] - $signed(reg24[(5'h11):(4'ha)])));
          reg32 <= wire19;
          reg33 <= (|(+(8'ha7)));
        end
    end
  assign wire34 = wire23[(3'h6):(3'h4)];
  assign wire35 = $unsigned($unsigned(wire23));
  module36 #() modinst73 (.clk(clk), .y(wire72), .wire39(reg30), .wire37(reg29), .wire40(wire19), .wire38(wire22));
endmodule

module module36
#(parameter param71 = {(!{(~(^~(8'h9c)))})})
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire40;
  input wire [(4'ha):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire41;
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire55,
                 wire54,
                 wire49,
                 wire48,
                 wire41,
                 reg57,
                 reg56,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire41 = (8'ha4);
  always
    @(posedge clk) begin
      reg42 <= ($signed({wire39, $unsigned((+wire37))}) ?
          {wire41[(3'h6):(1'h0)],
              (({wire40} ?
                  $signed(wire37) : (wire41 & wire40)) > $signed(wire38[(4'hb):(1'h1)]))} : $unsigned({{wire40}}));
      reg43 <= $signed(((~((^wire41) ~^ (reg42 ? (8'hb5) : wire39))) ?
          $signed({$unsigned(reg42)}) : ($unsigned((~wire37)) ?
              wire39 : ((reg42 ? wire38 : reg42) ?
                  $signed(wire37) : wire40[(1'h1):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg44 <= {$unsigned((!wire40))};
      if (((^wire40[(1'h0):(1'h0)]) ?
          (^~(|$unsigned({wire38, reg43}))) : reg44[(3'h7):(3'h4)]))
        begin
          if (wire39[(3'h7):(3'h4)])
            begin
              reg45 <= wire40[(1'h1):(1'h1)];
              reg46 <= {wire40, wire40};
            end
          else
            begin
              reg45 <= $signed(wire40);
            end
        end
      else
        begin
          reg45 <= wire37;
          reg46 <= ($unsigned(wire41[(1'h1):(1'h0)]) ?
              $unsigned((+$unsigned({reg42}))) : $unsigned({(!$signed(reg43))}));
          reg47 <= (reg44[(2'h2):(2'h2)] & $unsigned((8'ha5)));
        end
    end
  assign wire48 = (reg42[(4'hc):(3'h5)] > $signed($unsigned({wire40})));
  assign wire49 = ((^~wire39) ?
                      (|$unsigned(wire40[(3'h4):(3'h4)])) : {$unsigned(((&(8'hb6)) << (~|reg43)))});
  always
    @(posedge clk) begin
      reg50 <= ($unsigned((wire49 + ((reg45 ? reg45 : wire39) ?
              $unsigned(reg46) : $signed(reg47)))) ?
          (8'ha5) : {reg43, reg42});
      reg51 <= {{$unsigned($signed({wire38})), ($unsigned((8'ha5)) != wire49)},
          reg45[(3'h5):(3'h5)]};
      reg52 <= (~|(reg46[(4'hb):(3'h4)] ?
          wire38[(2'h3):(1'h1)] : wire38[(3'h6):(3'h5)]));
      reg53 <= (+$signed((($signed(reg46) | wire38[(3'h4):(3'h4)]) ^~ reg45[(5'h14):(5'h14)])));
    end
  assign wire54 = $unsigned((($unsigned($unsigned((8'hb6))) ?
                          (~^(reg42 ?
                              reg53 : reg52)) : (^reg44[(2'h3):(1'h1)])) ?
                      (wire41[(2'h3):(1'h1)] + $signed($signed(reg51))) : {{reg53[(3'h4):(2'h3)],
                              {reg51}},
                          {((8'haa) <<< reg50)}}));
  assign wire55 = (^~reg43[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg56 <= $signed($unsigned(wire40));
      reg57 <= $unsigned((($signed($unsigned(reg50)) == reg50[(2'h3):(2'h2)]) ?
          reg45[(5'h11):(2'h3)] : (-(^~((8'hbf) ? reg46 : wire41)))));
    end
  assign wire58 = reg57[(1'h1):(1'h0)];
  assign wire59 = (+(8'ha7));
  assign wire60 = $unsigned((~^$unsigned(wire37)));
  assign wire61 = reg43;
  assign wire62 = (-reg56);
  assign wire63 = (~wire62);
  assign wire64 = (^(8'hbc));
  assign wire65 = (8'ha1);
  assign wire66 = wire58[(4'h8):(3'h7)];
  assign wire67 = ({$signed($unsigned((wire49 ? wire40 : wire40))),
                          (((&wire63) | (wire64 ^~ reg52)) ?
                              wire55 : wire41[(2'h2):(1'h1)])} ?
                      (reg52[(2'h3):(1'h1)] ?
                          (8'hb9) : (wire63[(1'h1):(1'h1)] ^~ (wire38 >= {wire38,
                              wire55}))) : wire63[(3'h4):(1'h1)]);
  assign wire68 = $unsigned($signed(reg45[(2'h2):(2'h2)]));
  assign wire69 = wire59[(3'h4):(1'h1)];
  assign wire70 = wire65[(2'h2):(1'h1)];
endmodule

module module97
#(parameter param109 = ((((((8'hbf) ? (8'ha8) : (8'hb0)) ? (^~(8'hb5)) : ((8'h9d) - (8'haa))) ? {((7'h44) | (8'hb9)), (&(7'h40))} : (~^(~&(8'hb9)))) ? ({((8'hb0) ? (8'ha3) : (8'hbb)), ((8'ha0) | (8'ha6))} ? (|((7'h41) ? (8'ha1) : (8'hb2))) : (~|(+(7'h41)))) : {(((7'h40) > (8'hb0)) >>> ((7'h40) << (8'hac))), ({(8'hb2), (8'h9c)} ? ((8'ha8) ? (8'hab) : (8'ha7)) : (~|(8'hbb)))}) - ({({(8'hbb)} <= ((7'h42) ? (7'h40) : (8'hbd)))} <<< (8'hb6))), 
parameter param110 = {(~&{param109, (param109 ^ (~param109))})})
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire102;
  input wire signed [(3'h4):(1'h0)] wire101;
  input wire [(5'h14):(1'h0)] wire100;
  input wire signed [(5'h11):(1'h0)] wire99;
  input wire [(5'h11):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire103;
  assign y = {wire108, wire107, wire106, wire105, wire104, wire103, (1'h0)};
  assign wire103 = ($signed(wire101[(3'h4):(1'h1)]) ?
                       wire99 : ((-(^~$unsigned(wire100))) ?
                           $unsigned(wire102[(2'h2):(1'h1)]) : $unsigned((wire102 ?
                               {(8'hae)} : $unsigned((8'hb0))))));
  assign wire104 = ($unsigned($signed($signed($unsigned(wire103)))) ?
                       (({$signed(wire101), (wire99 ^ wire98)} ?
                               wire103 : wire102) ?
                           (~&$unsigned({(7'h44)})) : (({(8'hb2),
                                   wire98} >> wire101) ?
                               (|$signed(wire100)) : ((8'hb6) ?
                                   $unsigned(wire101) : (^wire103)))) : (wire99[(5'h10):(4'hd)] ?
                           $unsigned((wire100 ^~ (wire103 ^ wire101))) : wire100));
  assign wire105 = wire98;
  assign wire106 = ({$signed((&wire100[(4'h8):(3'h6)]))} ?
                       wire102 : $unsigned(((8'ha3) ?
                           $unsigned((|wire98)) : {$signed(wire103),
                               $signed((7'h40))})));
  assign wire107 = $signed(wire104);
  assign wire108 = $unsigned(($unsigned($unsigned($signed(wire98))) ^ $signed(wire102)));
endmodule
