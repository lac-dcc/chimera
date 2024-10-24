module top
#(parameter param131 = {((((+(7'h43)) ? ((8'hbc) >> (8'hbf)) : ((8'hb7) ? (8'hb1) : (7'h41))) | ((8'ha2) ? (~^(8'hae)) : ((8'hab) * (8'had)))) ? (^~(8'ha4)) : (~|{((8'hb0) ? (7'h42) : (8'ha1)), ((8'ha4) < (8'hbe))})), {(((~&(7'h41)) >> (~&(8'hac))) ? {(-(8'h9d)), (^(8'hab))} : ((-(8'ha7)) ^ (^~(8'hbb))))}}, 
parameter param132 = param131)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire130;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire128;
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire130,
                 wire4,
                 wire5,
                 wire8,
                 wire11,
                 wire12,
                 wire128,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (((^$unsigned({wire1})) | (wire0 ?
                     wire2 : (wire2[(3'h4):(3'h4)] ?
                         wire4 : ((8'hac) ?
                             wire4 : wire4)))) || $unsigned({$unsigned({wire3}),
                     (-$signed((8'h9d)))}));
  always
    @(posedge clk) begin
      reg6 <= ((((|$signed(wire4)) != (~|{wire3})) >>> wire4) ?
          ($signed((^~$unsigned(wire5))) * (&wire3[(4'h9):(1'h1)])) : $signed({(wire3 ?
                  (wire4 ? wire1 : wire3) : $signed(wire0)),
              wire3}));
      reg7 <= wire5;
    end
  assign wire8 = $signed(($unsigned(((~wire3) >> $unsigned(wire1))) ?
                     wire0 : (8'hb9)));
  always
    @(posedge clk) begin
      reg9 <= $signed(({$signed($signed(reg7))} ?
          ({$signed(wire8)} != (^~$unsigned(wire2))) : wire8[(2'h3):(2'h2)]));
      reg10 <= (8'hb5);
    end
  assign wire11 = {{reg7}};
  assign wire12 = wire4[(2'h3):(1'h0)];
  module13 #() modinst129 (.clk(clk), .wire18(wire2), .wire15(wire12), .wire14(wire5), .y(wire128), .wire16(wire3), .wire17(wire8));
  assign wire130 = wire2[(4'hc):(3'h7)];
endmodule

module module13  (y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire17;
  input wire [(3'h5):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(2'h3):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire122;
  reg [(4'hb):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  assign y = {wire39,
                 wire89,
                 wire91,
                 wire92,
                 wire93,
                 wire103,
                 wire122,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed((8'hb9)))
        begin
          reg19 <= (((wire15[(2'h3):(2'h2)] * $unsigned({wire18,
                  (7'h44)})) || wire15[(3'h5):(2'h2)]) ?
              (wire16[(2'h2):(2'h2)] <= wire17) : $signed((&$signed($unsigned(wire14)))));
          reg20 <= wire18;
          reg21 <= $signed(reg20);
          reg22 <= (reg21[(2'h2):(1'h0)] > ($unsigned(reg21[(1'h0):(1'h0)]) | {$unsigned(reg21[(1'h1):(1'h0)]),
              ((8'ha3) <= (reg21 ? reg19 : (8'hb5)))}));
          reg23 <= reg19[(3'h4):(1'h1)];
        end
      else
        begin
          reg19 <= reg20[(4'hb):(2'h2)];
          reg20 <= $unsigned(reg21[(2'h3):(1'h1)]);
          reg21 <= wire15[(3'h7):(3'h7)];
        end
      if ((^(~&{{{wire18}}})))
        begin
          reg24 <= $unsigned(reg22[(2'h2):(2'h2)]);
          reg25 <= wire14[(4'he):(4'hd)];
          reg26 <= {$unsigned((+((reg24 ? reg20 : (8'had)) ?
                  ((8'ha1) ^ wire15) : reg19))),
              (8'hab)};
        end
      else
        begin
          if (reg19[(3'h4):(2'h3)])
            begin
              reg24 <= ($signed((8'h9d)) ?
                  ($unsigned($unsigned(reg24)) == ((8'haf) ?
                      ($signed(reg19) ?
                          $signed((8'hb7)) : (!reg25)) : reg21)) : (^$unsigned($unsigned($signed((8'h9f))))));
              reg25 <= $unsigned($unsigned(((reg26[(3'h7):(2'h2)] ^ $signed(wire17)) ?
                  $unsigned((reg24 ? wire17 : reg26)) : {((8'hb1) & wire15),
                      $unsigned(reg22)})));
              reg26 <= $unsigned(reg21[(1'h1):(1'h0)]);
              reg27 <= $unsigned((|(~|$signed($signed(wire15)))));
            end
          else
            begin
              reg24 <= $signed((reg22[(1'h1):(1'h1)] <<< ((!$unsigned(reg22)) ~^ ($unsigned(wire17) ?
                  (reg19 ? wire14 : wire14) : (reg20 * wire15)))));
              reg25 <= {$signed((+reg23)), (+reg23)};
              reg26 <= $unsigned({(~|$unsigned((reg22 ? reg22 : reg20)))});
              reg27 <= reg26[(5'h13):(4'h8)];
              reg28 <= (^reg20);
            end
          reg29 <= wire18[(1'h0):(1'h0)];
          if (((((8'hbe) ? reg27 : reg29) ?
                  (wire16[(1'h1):(1'h0)] | $signed((reg22 ?
                      reg20 : (8'ha6)))) : ($unsigned(wire16) ?
                      (-(reg19 | reg29)) : ((+wire14) ?
                          (reg29 ? reg27 : reg23) : reg29[(3'h7):(2'h2)]))) ?
              (reg24[(2'h2):(1'h1)] << $unsigned({$signed(wire15),
                  $signed(wire16)})) : $signed((&$unsigned($signed((8'hab)))))))
            begin
              reg30 <= (((!{reg24[(4'hb):(2'h3)], $unsigned((8'hab))}) ?
                      ($unsigned(reg24[(1'h1):(1'h1)]) ^~ $unsigned(reg24)) : {((|wire15) <= (!reg29)),
                          $unsigned((~^wire17))}) ?
                  reg25[(2'h2):(1'h1)] : ((reg25 ?
                      reg24 : (~^$signed(reg27))) + reg26));
              reg31 <= ({({$unsigned(reg21),
                          (reg22 ? reg25 : wire14)} ^~ reg23[(4'hc):(1'h0)])} ?
                  reg20 : ((8'hae) ?
                      ($unsigned($signed((7'h40))) ?
                          $signed({reg30}) : $signed((7'h41))) : (({wire15,
                                  wire15} ?
                              (reg29 != (8'hab)) : ((8'ha0) ? reg20 : reg27)) ?
                          (+(wire17 | reg27)) : $unsigned(reg26[(4'hf):(4'ha)]))));
            end
          else
            begin
              reg30 <= $signed(((8'ha3) ?
                  reg29[(3'h4):(3'h4)] : reg24[(1'h0):(1'h0)]));
              reg31 <= $signed(reg24);
              reg32 <= wire14;
              reg33 <= $unsigned(reg19);
              reg34 <= $signed($unsigned(reg26));
            end
          if ($unsigned($signed((wire14[(2'h2):(1'h0)] >= reg31))))
            begin
              reg35 <= reg28[(4'h8):(3'h7)];
              reg36 <= (reg31[(4'he):(3'h7)] != reg31);
              reg37 <= ((reg35 + (+((wire16 ? wire16 : wire18) ?
                  {reg22} : reg30[(3'h6):(3'h6)]))) << ((8'hbc) >> wire16[(1'h0):(1'h0)]));
            end
          else
            begin
              reg35 <= {reg34, (~(8'ha6))};
            end
          reg38 <= {{(reg34[(1'h1):(1'h0)] ?
                      $unsigned($unsigned((8'hb5))) : ((8'haf) < $signed(wire17)))}};
        end
    end
  assign wire39 = ((^wire18) >> $signed(reg23[(4'hd):(3'h4)]));
  module40 #() modinst90 (wire89, clk, reg35, reg28, reg21, reg31);
  assign wire91 = $unsigned(((+((~wire17) != wire39[(2'h2):(1'h1)])) & $unsigned(reg35)));
  assign wire92 = reg31;
  assign wire93 = (($unsigned((((8'hbc) >>> reg32) ?
                      (|wire14) : $signed(wire39))) ~^ reg33) ^~ reg35);
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg94 <= reg28;
        end
      else
        begin
          if ((-{({reg38[(4'hd):(4'hc)]} && (reg37[(1'h0):(1'h0)] ?
                  (^~wire18) : $signed(reg23))),
              reg27[(2'h3):(1'h0)]}))
            begin
              reg94 <= ({$signed(wire15[(2'h3):(1'h0)]),
                  wire93[(4'h9):(3'h4)]} ^~ reg94);
              reg95 <= reg20;
              reg96 <= ($signed(((~&$unsigned(wire14)) ?
                      reg21[(2'h2):(2'h2)] : $signed((reg24 ?
                          reg22 : wire14)))) ?
                  reg95 : ((^((~&wire17) ? $unsigned(wire92) : (+wire92))) ?
                      reg94 : $signed(($unsigned(reg29) ?
                          (^reg21) : (reg23 ? reg22 : reg19)))));
              reg97 <= (reg28 ?
                  {((reg26[(5'h13):(1'h0)] * $signed(reg96)) & (+(~wire92))),
                      $signed((~&(reg24 ?
                          reg30 : reg27)))} : ({reg33} ^~ ({$signed(reg94)} ?
                      ({wire89, wire91} ?
                          $unsigned(wire92) : $signed(reg28)) : (8'ha1))));
              reg98 <= (!(reg37[(2'h3):(2'h3)] - reg95));
            end
          else
            begin
              reg94 <= $signed(($signed(reg27[(3'h5):(1'h0)]) + (!reg24)));
              reg95 <= {(~(~(((8'hb9) ? reg95 : reg27) >> (wire39 ?
                      (7'h42) : (7'h41))))),
                  {($signed((~reg94)) ?
                          (8'ha4) : ($unsigned(reg31) != $unsigned(reg98)))}};
              reg96 <= $signed($unsigned($signed($signed((reg29 ?
                  reg23 : reg37)))));
              reg97 <= $signed(($unsigned(((|reg30) >>> wire18)) ?
                  reg37 : ($signed({wire14, reg21}) ?
                      $unsigned(reg21[(3'h5):(2'h2)]) : reg35[(4'hb):(4'h8)])));
            end
        end
      reg99 <= reg23;
      reg100 <= ((8'h9f) & (reg37 == ($signed(wire91[(2'h3):(2'h3)]) << $signed(reg37[(2'h3):(2'h2)]))));
      reg101 <= wire15;
    end
  always
    @(posedge clk) begin
      reg102 <= $unsigned((((reg95 != reg22[(1'h1):(1'h0)]) && ((wire39 ?
                  reg96 : wire15) ?
              (reg28 >= reg30) : {reg20})) ?
          {{reg100}, $signed($signed(reg23))} : (&{(wire17 ? reg37 : reg94),
              (-(8'h9e))})));
    end
  assign wire103 = (&{reg30, wire39[(2'h2):(1'h0)]});
  module104 #() modinst123 (.wire105(reg33), .wire106(reg101), .y(wire122), .wire108(reg97), .clk(clk), .wire107(reg23), .wire109(wire103));
  always
    @(posedge clk) begin
      reg124 <= reg99[(3'h6):(2'h2)];
      reg125 <= (-reg30[(2'h2):(1'h0)]);
      reg126 <= (^$unsigned(($signed($signed(reg22)) || wire17)));
      reg127 <= $signed({((|(^~reg25)) == $signed($unsigned(reg94)))});
    end
endmodule

module module104
#(parameter param121 = (^((|(((8'haf) ? (8'ha4) : (8'h9c)) ? ((8'hb9) ? (8'ha7) : (8'ha7)) : ((7'h41) ? (8'haa) : (8'h9f)))) ? (8'haf) : (8'hb3))))
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire109;
  input wire signed [(4'hd):(1'h0)] wire108;
  input wire signed [(4'hc):(1'h0)] wire107;
  input wire signed [(4'hc):(1'h0)] wire106;
  input wire [(5'h13):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire110 = wire109[(3'h6):(2'h2)];
  assign wire111 = $signed((wire108 ?
                       $unsigned({{wire106,
                               wire110}}) : (wire107 ~^ $signed((wire108 > wire110)))));
  assign wire112 = $signed(((|wire108) & {($signed(wire106) & (~^wire109)),
                       {((8'ha6) ? wire105 : wire111)}}));
  always
    @(posedge clk) begin
      if (wire108)
        begin
          if (wire112[(1'h1):(1'h0)])
            begin
              reg113 <= {$signed({wire106[(4'hc):(4'ha)]})};
              reg114 <= $unsigned((($signed($unsigned((7'h42))) ?
                  (wire108[(4'h8):(1'h0)] ?
                      ((8'hbd) >= reg113) : ((8'had) != wire106)) : (wire105[(5'h10):(2'h3)] ?
                      (wire108 ?
                          wire106 : wire105) : {wire109})) >>> (!$signed({wire110,
                  reg113}))));
            end
          else
            begin
              reg113 <= {(^~$unsigned(wire111[(1'h1):(1'h0)]))};
              reg114 <= $signed(wire111[(1'h1):(1'h1)]);
              reg115 <= $signed($unsigned(wire107));
            end
        end
      else
        begin
          if (wire110[(4'hb):(2'h3)])
            begin
              reg113 <= wire107;
              reg114 <= wire106[(4'h9):(1'h1)];
              reg115 <= $unsigned($unsigned($unsigned(wire105)));
              reg116 <= ($unsigned((~|$signed($signed((8'hb8))))) ^~ wire110[(4'hc):(4'h8)]);
              reg117 <= ((($signed($signed(wire111)) ?
                      wire111 : $unsigned(reg113)) ?
                  (((wire110 >>> wire106) ?
                      {wire107} : $signed((8'hb2))) < reg116[(3'h5):(2'h3)]) : $unsigned(reg116)) == (+reg114));
            end
          else
            begin
              reg113 <= wire107[(4'hb):(3'h5)];
            end
        end
      reg118 <= (wire109 ? wire111 : reg114);
      reg119 <= $unsigned(($unsigned(((~^(8'hbd)) << $signed(reg114))) ?
          wire107[(1'h1):(1'h1)] : $signed((wire109 >>> $signed(wire105)))));
    end
  always
    @(posedge clk) begin
      reg120 <= (8'hb7);
    end
endmodule

module module40  (y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire44;
  input wire signed [(5'h11):(1'h0)] wire43;
  input wire [(4'hd):(1'h0)] wire42;
  input wire [(2'h3):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  reg [(4'h9):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire51,
                 wire50,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg45 <= (wire44[(3'h5):(3'h4)] ? wire42 : wire41);
      reg46 <= ((&$unsigned($signed($signed(reg45)))) << ((~^(+(^wire41))) ^~ (8'hb5)));
      reg47 <= {$unsigned({$unsigned((!wire44)),
              (reg46 ? wire41[(1'h1):(1'h1)] : (-wire41))})};
      reg48 <= reg47[(4'hb):(2'h3)];
      reg49 <= {$signed($signed(reg45)), $unsigned(wire44)};
    end
  assign wire50 = wire42[(2'h2):(1'h1)];
  assign wire51 = $unsigned({wire43[(4'ha):(2'h3)],
                      ((~|((7'h44) != reg48)) ?
                          reg48 : ($unsigned(reg45) ? {reg49} : (8'ha6)))});
  always
    @(posedge clk) begin
      reg52 <= reg47;
      if ($signed((wire44 ?
          (wire50 <= reg49[(2'h3):(1'h0)]) : ($signed((wire51 ?
                  wire42 : wire50)) ?
              ($unsigned(wire41) != $signed(wire43)) : $signed(((8'had) ~^ wire41))))))
        begin
          reg53 <= (((^~(~|(wire41 ? reg48 : reg49))) >= wire41) ?
              (-$unsigned(reg45)) : $signed(reg52[(2'h3):(1'h0)]));
          reg54 <= (((~(~(wire51 ? reg52 : reg45))) <<< (^~((reg53 >= wire42) ?
              (~&reg53) : reg47[(4'ha):(3'h5)]))) | wire43);
          reg55 <= wire43[(4'h9):(3'h5)];
          reg56 <= (((^~($unsigned((8'hab)) <<< {wire43,
              (8'hbe)})) >= (wire50 <<< $unsigned(reg46))) < $signed(({(wire50 ?
                      (8'haa) : wire51),
                  $unsigned(wire43)} ?
              reg47[(4'h9):(1'h1)] : reg52[(2'h2):(2'h2)])));
        end
      else
        begin
          reg53 <= (~|(8'hbc));
          reg54 <= ({($unsigned(reg45[(4'he):(1'h0)]) - $signed(wire41[(1'h0):(1'h0)])),
                  (~&reg49[(1'h0):(1'h0)])} ?
              (+(8'hbc)) : ((wire41[(2'h2):(1'h0)] | ((-reg56) ?
                  reg45 : (wire51 ^ wire44))) != wire43[(5'h11):(4'h9)]));
          reg55 <= {$signed(wire41[(2'h2):(1'h1)]), reg45[(4'hd):(4'h9)]};
          reg56 <= {wire51};
        end
      if (reg47[(4'hb):(3'h7)])
        begin
          reg57 <= reg55[(1'h0):(1'h0)];
          if ((~|$unsigned(reg54[(1'h1):(1'h0)])))
            begin
              reg58 <= (|$unsigned((((~|reg53) && (reg57 ? (8'hbd) : (8'hba))) ?
                  $unsigned($signed(wire43)) : $unsigned($signed(wire51)))));
              reg59 <= $signed(reg48);
              reg60 <= $unsigned(reg52);
              reg61 <= reg58[(2'h3):(1'h1)];
              reg62 <= ({{{reg52[(1'h1):(1'h0)]}, {wire51}}} ?
                  (8'hb4) : (reg55 >= $signed(reg59[(2'h3):(2'h3)])));
            end
          else
            begin
              reg58 <= (^~{$unsigned(reg56), wire51[(4'h8):(2'h2)]});
              reg59 <= reg45;
            end
          reg63 <= reg48[(4'h9):(4'h9)];
        end
      else
        begin
          reg57 <= wire44[(4'hb):(2'h3)];
          if ({reg58[(1'h1):(1'h0)], $unsigned(reg45[(4'he):(4'ha)])})
            begin
              reg58 <= reg60;
              reg59 <= wire43;
              reg60 <= (|reg48);
            end
          else
            begin
              reg58 <= ($signed({(wire43[(4'he):(3'h4)] ?
                      reg57[(3'h4):(2'h3)] : wire42),
                  ((reg46 | reg57) ?
                      (^~reg45) : $signed(wire50))}) != (~^{(-(8'h9d)),
                  ((wire50 ? reg53 : reg54) > $unsigned((8'haa)))}));
              reg59 <= ((({(reg57 >= reg45)} == (+reg49)) & ($unsigned(reg48) > $signed((!wire41)))) > reg47[(3'h7):(3'h7)]);
              reg60 <= (~(reg49 ? wire50 : reg57[(3'h5):(3'h4)]));
              reg61 <= ((&({$signed(reg62)} ?
                  (-((8'hba) ? reg62 : reg55)) : ((!(8'ha1)) << (wire43 ?
                      reg58 : reg47)))) >= $signed((($unsigned(reg49) ?
                      $signed(reg57) : reg47[(4'h9):(3'h5)]) ?
                  reg56[(4'h8):(1'h1)] : (^~(wire43 || (7'h43))))));
              reg62 <= wire43;
            end
          if (reg54[(2'h2):(1'h0)])
            begin
              reg63 <= (8'hae);
              reg64 <= reg61;
            end
          else
            begin
              reg63 <= {(|$unsigned(((reg59 ? reg46 : (8'ha5)) ?
                      $unsigned(wire43) : (&reg57))))};
              reg64 <= (-$unsigned({reg61, reg45[(1'h0):(1'h0)]}));
              reg65 <= reg52[(3'h5):(1'h0)];
              reg66 <= reg55[(3'h5):(2'h3)];
            end
          if (reg64)
            begin
              reg67 <= $signed($unsigned((wire51 * (-reg57))));
              reg68 <= (|$unsigned((^~({reg53} != reg59[(5'h13):(4'he)]))));
              reg69 <= reg46;
              reg70 <= {reg69[(4'hb):(4'ha)]};
            end
          else
            begin
              reg67 <= {reg55[(2'h3):(1'h0)],
                  {(($signed(reg68) <<< $unsigned(reg66)) ^ (^$unsigned(reg69)))}};
              reg68 <= wire44;
              reg69 <= (($unsigned(reg67) <= $signed({$signed(reg60)})) ?
                  reg62 : wire41);
            end
        end
      reg71 <= $unsigned(($unsigned($unsigned((reg67 ? wire51 : reg65))) ?
          $unsigned(($signed(reg59) >= (reg45 ?
              reg58 : wire42))) : reg65[(4'h8):(2'h3)]));
    end
  assign wire72 = $unsigned($signed((reg71 ?
                      ((|reg71) ?
                          (&reg53) : $unsigned((8'ha4))) : (reg69[(4'hb):(2'h2)] == $unsigned(reg58)))));
  assign wire73 = wire51;
  assign wire74 = ($unsigned(reg46[(3'h6):(2'h2)]) ?
                      wire44 : reg67[(3'h6):(2'h3)]);
  assign wire75 = reg54[(3'h5):(2'h2)];
  assign wire76 = (&{({$unsigned((8'ha1))} + ($unsigned(reg59) ?
                          reg48[(2'h3):(1'h1)] : $unsigned(reg65))),
                      reg67});
  assign wire77 = (((reg53[(1'h0):(1'h0)] ~^ $unsigned((+wire76))) ?
                          (~&(~|(wire76 & reg71))) : (^(~|reg67))) ?
                      (~|wire75[(4'hf):(4'hd)]) : (!((wire75[(4'hb):(2'h2)] <<< (wire74 << reg58)) ?
                          wire76 : reg46)));
  assign wire78 = wire72;
  always
    @(posedge clk) begin
      reg79 <= (~^((({(8'ha5), reg68} ? (reg55 < reg69) : (+(8'hb4))) ?
              ((reg67 ?
                  wire41 : reg54) <= (&reg69)) : ((~reg67) ~^ $signed(reg70))) ?
          reg71[(4'h9):(4'h8)] : (~reg67[(4'hc):(3'h5)])));
      reg80 <= $unsigned((~&$signed(((~reg70) ?
          reg47[(4'ha):(4'ha)] : reg59[(4'hc):(1'h1)]))));
      if ((((((reg69 ? (8'ha1) : reg80) ? (~reg68) : reg80[(4'he):(4'ha)]) ?
                  (&reg55) : (-reg56)) ?
              reg54[(3'h5):(2'h2)] : wire42[(2'h2):(1'h0)]) ?
          wire41 : wire72[(2'h3):(1'h0)]))
        begin
          reg81 <= reg53;
          reg82 <= (reg48[(4'ha):(3'h4)] ?
              $signed((|((~reg53) ?
                  ((8'hae) ? reg47 : reg79) : wire73))) : reg71);
          reg83 <= reg61[(1'h0):(1'h0)];
        end
      else
        begin
          reg81 <= $unsigned($unsigned($signed($unsigned($signed(reg63)))));
        end
      reg84 <= ($signed($signed(wire51)) == $unsigned(($unsigned((8'ha3)) ?
          {{(8'hb4)}, $unsigned((8'ha4))} : $unsigned(wire78[(4'h8):(3'h5)]))));
    end
  assign wire85 = wire51[(4'h9):(2'h2)];
  assign wire86 = $signed((-{{$signed(wire73), (~|reg63)}, reg59}));
  assign wire87 = $signed(reg54);
  assign wire88 = wire75;
endmodule
