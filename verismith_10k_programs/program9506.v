module top
#(parameter param123 = (((~^((-(8'ha5)) != ((8'hba) ? (8'hb5) : (8'hb5)))) - ((((8'hbb) ? (8'had) : (8'hb0)) <= ((8'hb4) - (7'h42))) ? (((8'hb6) ? (8'h9f) : (8'hbd)) ? (~|(8'ha1)) : ((7'h42) <<< (8'hae))) : (((8'hb0) > (8'hb8)) >= ((8'hbd) <= (8'h9e))))) ? ({((&(8'ha0)) & (8'ha8))} != (~&(((8'hbb) << (7'h42)) > ((8'hb7) ? (7'h42) : (8'haf))))) : {({((8'h9f) >> (7'h43))} ? (-((8'ha3) ? (8'hb9) : (8'ha7))) : {(~|(8'h9e))}), ((((8'haa) == (8'ha4)) == (!(8'h9f))) ? {((8'hb4) ? (8'hab) : (7'h40))} : (((8'ha1) ? (8'hbf) : (7'h44)) ? ((8'hb9) >> (8'hab)) : ((7'h43) & (8'haa))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire120;
  assign y = {wire122, wire19, wire5, wire120, (1'h0)};
  assign wire5 = $signed((wire2[(2'h2):(1'h1)] >> wire4));
  module6 #() modinst20 (.wire11(wire3), .y(wire19), .wire10(wire5), .clk(clk), .wire8(wire1), .wire9(wire2), .wire7(wire0));
  module21 #() modinst121 (.wire24(wire3), .wire25(wire2), .wire23(wire4), .wire22(wire19), .y(wire120), .clk(clk), .wire26(wire5));
  assign wire122 = $unsigned(wire5);
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire25;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire119;
  wire [(4'h8):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire59;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire signed [(4'hf):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire70;
  wire [(3'h4):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire116;
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire59,
                 wire46,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire61,
                 wire70,
                 wire71,
                 wire72,
                 wire88,
                 wire116,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= $signed(wire24);
    end
  assign wire28 = wire24;
  assign wire29 = wire25[(4'hb):(1'h1)];
  assign wire30 = (^(^~wire26[(2'h2):(2'h2)]));
  assign wire31 = $signed((($unsigned(reg27) == ((wire29 ?
                      (8'h9c) : wire24) <= (&wire28))) > $signed($signed(reg27[(4'hc):(2'h3)]))));
  assign wire32 = $unsigned({wire29});
  assign wire33 = wire31;
  module34 #() modinst47 (.clk(clk), .wire36(wire32), .wire37(wire26), .wire39(reg27), .wire38(wire30), .wire35(wire25), .y(wire46));
  module48 #() modinst60 (.wire49(wire22), .wire50(reg27), .wire51(wire31), .wire52(wire32), .clk(clk), .y(wire59));
  assign wire61 = $signed(wire31);
  always
    @(posedge clk) begin
      if (wire25)
        begin
          reg62 <= {$signed(($signed((wire26 + wire61)) ?
                  $unsigned($signed(wire31)) : reg27))};
        end
      else
        begin
          reg62 <= wire33;
        end
      reg63 <= $unsigned($unsigned($unsigned($unsigned(wire31))));
      reg64 <= wire32;
    end
  always
    @(posedge clk) begin
      reg65 <= $signed($unsigned((!((wire29 == (8'hb7)) * (wire23 >>> wire25)))));
      reg66 <= (~|reg64[(3'h4):(2'h3)]);
      reg67 <= $signed(wire46);
      reg68 <= $unsigned((~|{(|$unsigned(reg67))}));
      reg69 <= ($signed((7'h40)) != wire31[(1'h0):(1'h0)]);
    end
  assign wire70 = wire22;
  assign wire71 = {$unsigned($unsigned($unsigned((^~(8'ha9))))),
                      ($unsigned((8'hbe)) ?
                          {wire70[(3'h7):(3'h6)],
                              wire23[(1'h0):(1'h0)]} : (&$signed(wire46[(2'h2):(1'h0)])))};
  assign wire72 = (+($unsigned((&$signed(reg27))) >= {(wire30[(4'hb):(3'h4)] ?
                          (~wire61) : (~^reg63)),
                      {reg68, $signed(wire24)}}));
  always
    @(posedge clk) begin
      reg73 <= (((wire72 ?
          ($unsigned(wire22) ?
              wire28[(3'h7):(3'h4)] : $unsigned(reg27)) : wire26[(2'h3):(2'h2)]) & $unsigned($unsigned((|wire25)))) & reg68);
      reg74 <= $unsigned({(reg68[(3'h6):(2'h3)] == $unsigned($signed(reg63))),
          reg68});
      if ($signed($unsigned(($unsigned($unsigned((7'h44))) + wire72[(2'h2):(1'h0)]))))
        begin
          reg75 <= ($unsigned(wire26) ?
              (~|(|$unsigned({reg74,
                  reg73}))) : ((~|$unsigned(wire61[(2'h2):(1'h0)])) > (-(wire31 ?
                  (wire23 ? (8'haa) : reg68) : $unsigned(wire22)))));
          reg76 <= (~|($unsigned((~&reg67)) ~^ reg67[(1'h0):(1'h0)]));
          reg77 <= (!(^wire22));
          if ({($unsigned((8'h9c)) <<< ($unsigned((wire61 > wire29)) ?
                  ($signed(wire32) ?
                      wire29[(4'hf):(2'h3)] : $unsigned(reg69)) : $unsigned((+reg63)))),
              reg74[(2'h2):(1'h1)]})
            begin
              reg78 <= (8'hb9);
              reg79 <= $unsigned(((^(~&wire31[(2'h3):(1'h1)])) || $signed((reg66 && $signed(reg67)))));
              reg80 <= ($signed($signed(((-reg62) ?
                      wire26[(3'h6):(2'h2)] : $unsigned(reg75)))) ?
                  $unsigned(((^~$unsigned(wire61)) ^ wire24[(5'h10):(4'ha)])) : {wire72});
              reg81 <= reg62;
            end
          else
            begin
              reg78 <= (wire61 <<< $unsigned($signed(((reg63 ?
                  wire30 : wire22) < reg81[(1'h1):(1'h0)]))));
              reg79 <= ((-((~(wire31 ? wire70 : wire61)) ?
                      wire61 : (^~wire24[(3'h6):(3'h6)]))) ?
                  (~^{$unsigned($unsigned((8'ha7)))}) : reg68);
              reg80 <= {reg79};
              reg81 <= {(-(reg67 | (|(reg68 > wire30))))};
            end
          if (((wire23[(2'h2):(2'h2)] & (({wire72} ?
                  wire59[(3'h4):(2'h3)] : (wire61 - (8'ha2))) ?
              $signed((wire24 ?
                  (8'hbd) : reg63)) : (~|$signed(wire46)))) != (({$signed(reg68),
              $signed(reg74)} & reg76[(4'he):(4'he)]) * wire61)))
            begin
              reg82 <= wire71;
            end
          else
            begin
              reg82 <= ((^reg82) ~^ reg82[(3'h5):(3'h4)]);
              reg83 <= (reg74 >> $unsigned(reg68));
              reg84 <= wire26;
              reg85 <= reg80[(3'h7):(3'h4)];
            end
        end
      else
        begin
          reg75 <= $unsigned(({wire31} >= (^~(~|reg76[(3'h4):(2'h2)]))));
          reg76 <= (reg68 ?
              $signed($signed({reg73})) : ({((reg64 >>> reg27) ?
                          (|wire31) : (reg69 | reg69))} ?
                  $unsigned(({(8'hae), reg73} ?
                      (&wire23) : $unsigned(reg62))) : {$unsigned({reg81,
                          (8'ha1)})}));
          reg77 <= $unsigned($signed((^wire26[(2'h2):(2'h2)])));
          reg78 <= wire46;
        end
      reg86 <= (~&(|(wire71[(1'h1):(1'h0)] ?
          {{reg83, wire29}} : ((~^wire24) & (~wire24)))));
      reg87 <= $unsigned($unsigned(reg62[(4'hd):(1'h0)]));
    end
  assign wire88 = {$unsigned(reg80[(4'hb):(4'ha)])};
  module89 #() modinst117 (.wire91(reg69), .wire93(reg80), .wire92(reg87), .wire90(wire70), .clk(clk), .y(wire116), .wire94(reg79));
  assign wire118 = {reg84[(1'h0):(1'h0)],
                       {(+({reg84} ?
                               ((7'h40) ? reg87 : reg74) : $signed(reg67)))}};
  assign wire119 = reg86[(1'h1):(1'h0)];
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire12;
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  assign y = {wire18, wire15, wire14, wire13, wire12, reg17, reg16, (1'h0)};
  assign wire12 = ({$signed((~(wire11 ? wire8 : wire10))),
                      wire7[(2'h3):(1'h1)]} + ($signed(($signed(wire9) ?
                          $unsigned(wire8) : (+(8'hb9)))) ?
                      wire10 : (&$unsigned((wire9 > wire7)))));
  assign wire13 = $unsigned((wire10[(3'h5):(2'h3)] + wire11));
  assign wire14 = wire7[(1'h1):(1'h0)];
  assign wire15 = (($unsigned((~|(wire7 - wire7))) ^ ($unsigned(((8'hbe) ?
                          wire10 : wire13)) || (|wire13))) ?
                      wire11 : ($unsigned({wire7[(2'h3):(1'h1)]}) ?
                          (~&$signed($unsigned(wire8))) : $unsigned($unsigned((~^wire11)))));
  always
    @(posedge clk) begin
      reg16 <= $unsigned(($unsigned((!(wire9 ?
          (8'ha6) : wire10))) & $unsigned(wire14)));
      reg17 <= wire10[(1'h0):(1'h0)];
    end
  assign wire18 = (8'h9c);
endmodule

module module89
#(parameter param114 = ({(({(8'ha6)} < (~(8'haa))) <= (((8'hb0) == (8'ha5)) ? (&(8'ha4)) : ((8'h9d) ^ (8'hb4)))), ({((8'ha7) ^~ (8'hb0)), (~(8'haf))} << (((7'h40) ? (8'ha5) : (7'h42)) - (8'hbe)))} ? (+((+((8'hb4) ? (8'hb2) : (8'ha9))) ? (&((8'hb1) ? (8'h9e) : (8'ha7))) : (8'haf))) : ({(((8'hb7) - (8'ha8)) ? ((8'ha1) ? (8'hbb) : (8'hb3)) : ((8'ha3) & (8'h9d)))} ? (+(((8'hbc) ? (8'hb2) : (7'h41)) >> ((8'ha9) < (8'hac)))) : (~|({(8'hb7)} - (~^(8'hba)))))), 
parameter param115 = (~|param114))
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire94;
  input wire signed [(3'h4):(1'h0)] wire93;
  input wire signed [(4'hb):(1'h0)] wire92;
  input wire signed [(4'h9):(1'h0)] wire91;
  input wire [(4'hd):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire95;
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg [(5'h11):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'hc):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg96 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire95,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 (1'h0)};
  assign wire95 = (~&(~^$signed($unsigned($signed(wire90)))));
  always
    @(posedge clk) begin
      reg96 <= wire93;
      if ((wire92 ? $signed($signed($signed({wire94}))) : wire95))
        begin
          reg97 <= {({$unsigned(((8'hb5) | (8'hb0))),
                  ((wire95 && wire95) ?
                      {(8'haa)} : wire92[(4'h9):(3'h5)])} != $unsigned($signed({wire92,
                  wire91}))),
              wire95[(3'h6):(3'h5)]};
          if ($signed((~|reg97)))
            begin
              reg98 <= (-(~((7'h40) ?
                  wire91[(4'h8):(4'h8)] : ((8'hb4) ? (^wire92) : reg96))));
              reg99 <= ((8'haa) ^~ (~|wire91[(3'h6):(3'h5)]));
              reg100 <= $signed(((8'h9f) > (!reg96)));
            end
          else
            begin
              reg98 <= $unsigned($unsigned(reg96[(2'h3):(2'h2)]));
              reg99 <= reg98;
              reg100 <= ((~^$unsigned(reg98)) ?
                  (~&$unsigned({(~wire95)})) : (!((8'hb2) || $signed((wire90 ?
                      reg99 : wire94)))));
              reg101 <= $signed({reg98, (~|$unsigned(wire92[(4'ha):(4'h9)]))});
            end
        end
      else
        begin
          reg97 <= $unsigned((wire94[(3'h6):(1'h1)] ?
              (|wire90) : (($signed(reg98) ?
                  reg98 : (reg97 ? wire90 : wire93)) < (8'hbb))));
          reg98 <= ((^~$signed(reg99[(5'h15):(5'h14)])) ?
              (((reg98[(2'h3):(1'h1)] ^ wire91[(2'h3):(1'h1)]) >>> (wire92[(2'h2):(1'h1)] >= (reg100 <= wire92))) ?
                  (&((reg97 || reg99) << $unsigned(wire94))) : ($unsigned(reg98[(2'h3):(1'h1)]) ?
                      {(reg100 && (8'had))} : ($signed(reg96) ?
                          reg100 : {reg101}))) : (!($unsigned((wire93 ?
                      reg98 : wire93)) ?
                  {wire93} : {$signed(wire95), (wire92 ? wire94 : reg96)})));
          reg99 <= reg97;
          reg100 <= $unsigned(reg97);
        end
      if ($signed({reg97[(2'h2):(1'h0)], $unsigned(reg97[(2'h3):(1'h0)])}))
        begin
          reg102 <= ($signed(wire93) ?
              (|reg100[(1'h1):(1'h1)]) : reg100[(1'h0):(1'h0)]);
          reg103 <= {(((reg101[(3'h7):(3'h5)] ~^ reg101) ?
                  {(wire94 ? reg96 : reg99),
                      $signed((8'hba))} : ((reg98 >> (8'hb8)) ^ (wire92 ?
                      reg101 : reg98))) + wire90[(1'h0):(1'h0)]),
              ((($unsigned((8'ha4)) ?
                      (reg101 && wire94) : wire90[(1'h1):(1'h1)]) >= $unsigned({reg98,
                      wire91})) ?
                  $signed($signed($signed(wire91))) : (-$unsigned((wire95 ?
                      reg100 : wire90))))};
          reg104 <= $unsigned((({(wire95 ^~ reg98)} < $unsigned(reg103[(2'h3):(1'h1)])) < reg101));
        end
      else
        begin
          if (reg102)
            begin
              reg102 <= $unsigned($signed(reg98[(1'h0):(1'h0)]));
              reg103 <= $signed((&(wire90 ?
                  (((8'hb5) ?
                      (8'ha4) : (8'hbe)) || (reg103 <<< reg97)) : ($signed(wire92) ?
                      $signed(reg96) : $signed(wire95)))));
              reg104 <= $unsigned(reg96[(1'h1):(1'h0)]);
              reg105 <= wire95[(4'ha):(4'h8)];
            end
          else
            begin
              reg102 <= reg96[(3'h4):(2'h3)];
              reg103 <= $unsigned(($signed((reg96[(2'h3):(2'h2)] ~^ (reg98 * (8'hbe)))) ^~ (~&$unsigned(reg101[(3'h7):(1'h1)]))));
              reg104 <= ((8'ha8) ?
                  (reg96[(1'h0):(1'h0)] && reg98[(1'h1):(1'h1)]) : {$signed($unsigned($unsigned(wire93)))});
            end
          reg106 <= (8'hb4);
        end
      reg107 <= $unsigned((({(reg101 ? reg106 : reg98)} ?
          (|wire90) : reg98) ~^ (((^~reg96) ?
          (~&reg97) : $signed(reg98)) - {(^~(8'hbd))})));
      reg108 <= {(wire91 >> $signed($signed(((8'hb0) ? (8'haa) : reg100))))};
    end
  always
    @(posedge clk) begin
      reg109 <= $signed($signed($signed(wire91)));
      reg110 <= reg98[(2'h2):(2'h2)];
    end
  assign wire111 = $unsigned((reg98[(2'h3):(1'h1)] >= {$signed($signed(reg98)),
                       reg99[(3'h5):(3'h4)]}));
  assign wire112 = ((^((~|(wire94 << reg99)) ?
                           reg104[(3'h4):(1'h0)] : {(~^reg106),
                               $unsigned(wire95)})) ?
                       wire94[(1'h0):(1'h0)] : ($signed($unsigned(wire93[(2'h2):(2'h2)])) ?
                           ((&wire111[(2'h2):(1'h1)]) == (^$signed(wire95))) : $unsigned($signed((~|wire95)))));
  assign wire113 = {{{($unsigned(reg101) && $unsigned(reg101))}}};
endmodule

module module48
#(parameter param58 = ((7'h43) < {(((~^(8'ha7)) ? ((7'h42) ? (8'h9d) : (7'h40)) : {(8'hb1), (8'ha8)}) ? ((^(8'hb5)) & (~|(8'ha6))) : {((8'hbf) ? (8'hb4) : (8'ha0)), (+(8'ha6))})}))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire52;
  input wire [(2'h2):(1'h0)] wire51;
  input wire [(2'h2):(1'h0)] wire50;
  input wire [(4'hc):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  assign y = {wire57, wire56, wire55, wire54, wire53, (1'h0)};
  assign wire53 = wire50;
  assign wire54 = $signed(wire50[(1'h0):(1'h0)]);
  assign wire55 = (+((wire51[(1'h0):(1'h0)] ?
                      wire51 : wire54) | (wire53[(1'h0):(1'h0)] == wire52)));
  assign wire56 = $signed((!wire53[(1'h1):(1'h1)]));
  assign wire57 = $signed({(wire54 ?
                          $signed(((7'h43) ^ (8'ha5))) : {((8'h9c) ?
                                  wire55 : wire56),
                              wire55}),
                      (wire51 << $unsigned(((8'hac) ? (8'haa) : (8'hba))))});
endmodule

module module34  (y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire39;
  input wire signed [(4'hf):(1'h0)] wire38;
  input wire signed [(3'h7):(1'h0)] wire37;
  input wire signed [(5'h14):(1'h0)] wire36;
  input wire [(5'h10):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  assign y = {wire45, wire44, wire43, wire42, wire41, wire40, (1'h0)};
  assign wire40 = ((8'ha9) >>> ($signed($unsigned((wire36 <= (8'h9e)))) >>> (wire37 * (-wire35))));
  assign wire41 = wire37[(1'h0):(1'h0)];
  assign wire42 = (~&$unsigned(wire41));
  assign wire43 = wire37[(3'h6):(3'h5)];
  assign wire44 = wire43[(1'h1):(1'h1)];
  assign wire45 = ($signed($unsigned($unsigned($signed(wire42)))) ?
                      $signed(((wire39[(4'ha):(3'h7)] * $signed(wire38)) <= $unsigned($unsigned((8'hb7))))) : (wire41[(1'h1):(1'h1)] ~^ wire39[(2'h2):(1'h0)]));
endmodule
