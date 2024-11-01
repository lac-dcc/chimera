module top
#(parameter param113 = (!(({((8'ha6) | (8'hac)), (^(8'ha9))} >>> (((8'hb2) ? (7'h43) : (8'haa)) <<< (~^(8'hb9)))) ? ({((8'h9c) ? (8'h9d) : (8'hbc)), ((8'hb3) ? (8'hb8) : (8'ha3))} > (^((8'had) ? (8'hb2) : (8'ha0)))) : (((^(8'hac)) ? (8'h9e) : (~(8'hb5))) <<< {(^~(8'hac)), ((7'h40) ? (8'ha4) : (8'hb6))}))), 
parameter param114 = ((param113 & (-{(^~param113), (~&param113)})) ? (param113 >= (((~(8'hb9)) ? (param113 ? (8'h9e) : param113) : (~param113)) && param113)) : (~&param113)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire112;
  wire [(5'h12):(1'h0)] wire111;
  wire signed [(3'h4):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire108;
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire108,
                 (1'h0)};
  assign wire5 = wire4[(3'h6):(2'h2)];
  assign wire6 = (($signed($signed($signed(wire5))) ?
                     ({(wire1 - wire3), {wire3}} ?
                         wire5 : $unsigned($unsigned(wire5))) : (($unsigned(wire5) > $signed(wire0)) ?
                         (~&$signed(wire0)) : (wire2 ?
                             wire0 : wire0[(1'h0):(1'h0)]))) - (({(wire4 >= wire4),
                     (wire1 >> wire2)} >> $unsigned((8'hbf))) | ($unsigned((wire5 ?
                     (7'h42) : wire0)) - wire4[(2'h2):(1'h0)])));
  assign wire7 = (($unsigned((^((7'h42) < wire4))) ^ ((~|$signed(wire0)) ?
                         wire4 : wire0)) ?
                     wire3[(1'h0):(1'h0)] : {$signed(($unsigned(wire4) + {wire5})),
                         wire6[(4'h8):(4'h8)]});
  assign wire8 = (7'h42);
  assign wire9 = {wire7, wire4[(1'h1):(1'h1)]};
  assign wire10 = ({{(^(-wire9)),
                          wire0[(3'h4):(1'h1)]}} >> wire5[(4'h9):(4'h9)]);
  assign wire11 = {$signed(wire10), $unsigned((+(~^$signed(wire7))))};
  assign wire12 = ((~{wire1}) != $signed((~^$signed((8'hb6)))));
  module13 #() modinst109 (wire108, clk, wire7, wire8, wire11, wire9, wire5);
  assign wire110 = wire5;
  assign wire111 = {((~^wire108[(3'h4):(1'h1)]) ?
                           {{$unsigned(wire7)}} : $signed(({wire10,
                               wire5} >>> $unsigned(wire4)))),
                       wire5};
  assign wire112 = ((^{{{wire111}}, wire1}) <<< (^$signed(((wire108 > wire6) ?
                       (wire8 ? wire3 : wire108) : (8'hba)))));
endmodule

module module13
#(parameter param106 = (((8'ha8) && ((8'ha8) ? (+((8'ha1) >>> (8'hb9))) : (((8'hbb) ^~ (7'h43)) ? {(8'hbe), (8'h9e)} : (!(8'hb8))))) ? ((~&(((8'hbb) ? (8'h9e) : (8'ha5)) || ((8'hbe) ? (8'ha7) : (8'ha2)))) ~^ ({((8'hbf) * (8'hbf))} != {((8'h9c) ? (8'hb2) : (8'ha0))})) : (^({((8'hb9) ? (8'hb7) : (7'h41))} ? (((8'ha0) < (8'ha8)) <= ((8'ha3) ? (8'ha6) : (8'ha4))) : {(8'hac), (^(8'hb2))}))), 
parameter param107 = (^~(((~^(param106 ~^ param106)) <<< param106) && param106)))
(y, clk, wire14, wire15, wire16, wire17, wire18);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire104;
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  assign y = {wire19,
                 wire44,
                 wire46,
                 wire49,
                 wire50,
                 wire52,
                 wire104,
                 reg47,
                 reg48,
                 reg51,
                 (1'h0)};
  assign wire19 = wire14[(2'h2):(1'h1)];
  module20 #() modinst45 (wire44, clk, wire18, wire15, wire14, wire17);
  assign wire46 = {(((8'hb6) ?
                          $unsigned((&wire14)) : wire18[(4'hf):(4'he)]) <= wire14),
                      $signed((^~((^~wire17) * {wire16})))};
  always
    @(posedge clk) begin
      reg47 <= wire16[(3'h6):(2'h3)];
      reg48 <= $unsigned(wire44);
    end
  assign wire49 = {$unsigned({((^wire44) ?
                              (~|wire15) : (reg48 ? reg48 : reg47))}),
                      $signed(({$unsigned(wire44)} >>> {(wire44 >>> wire19)}))};
  assign wire50 = wire14[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg51 <= {($signed(wire46) < wire49[(3'h5):(2'h2)])};
    end
  assign wire52 = $signed($unsigned((wire46[(2'h2):(2'h2)] ^ $signed((wire16 ?
                      wire46 : wire49)))));
  module53 #() modinst105 (.wire57(reg48), .wire56(wire44), .y(wire104), .wire55(wire17), .wire54(wire49), .clk(clk));
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h1ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire57;
  input wire signed [(5'h11):(1'h0)] wire56;
  input wire [(4'hc):(1'h0)] wire55;
  input wire signed [(2'h3):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire58;
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg83 = (1'h0);
  reg [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  assign y = {wire103,
                 wire85,
                 wire84,
                 wire66,
                 wire65,
                 wire64,
                 wire58,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire58 = $unsigned($unsigned((((wire54 ? wire57 : wire54) ?
                          {(8'hbc), (8'hb6)} : $signed(wire54)) ?
                      $signed($unsigned(wire54)) : (8'hbc))));
  always
    @(posedge clk) begin
      reg59 <= ({wire58} < wire57[(2'h3):(1'h1)]);
      if ((-(&$signed($unsigned($signed(wire58))))))
        begin
          reg60 <= (((wire55[(4'hb):(3'h7)] ?
                      $unsigned((wire58 ? wire58 : (8'ha4))) : {wire57,
                          (~&wire58)}) ?
                  (reg59 | $unsigned(wire57[(3'h5):(3'h4)])) : $unsigned(reg59[(3'h4):(2'h3)])) ?
              $signed(reg59[(4'h8):(3'h7)]) : $unsigned(($signed(wire54[(1'h1):(1'h1)]) >> wire54[(1'h0):(1'h0)])));
          if (((wire55 ?
              $signed((((8'hae) >>> (8'ha2)) | (+wire55))) : $unsigned(wire54)) >> wire57[(3'h5):(2'h2)]))
            begin
              reg61 <= $signed({$signed(wire56[(4'he):(4'ha)])});
              reg62 <= (&($signed(reg59) + wire54));
            end
          else
            begin
              reg61 <= reg59;
              reg62 <= reg60;
            end
        end
      else
        begin
          reg60 <= ($signed(reg60[(4'h8):(1'h1)]) * reg59);
          reg61 <= ((^~wire56[(4'hc):(4'h9)]) & reg61);
        end
      reg63 <= $unsigned($unsigned({wire57}));
    end
  assign wire64 = $unsigned((((reg63[(3'h7):(2'h3)] <<< (8'ha5)) ?
                      $unsigned((~reg63)) : {(8'ha7),
                          (8'hbc)}) < ($unsigned((~|wire57)) || ($signed(reg61) ?
                      $unsigned(wire56) : (reg59 << reg61)))));
  assign wire65 = reg63[(1'h0):(1'h0)];
  assign wire66 = (($signed((reg62 >>> (^~wire57))) && ($unsigned((~&wire56)) && {$unsigned((8'hb2)),
                      {wire54, reg59}})) == ((($unsigned(wire58) ?
                              reg61[(4'hb):(1'h0)] : {wire65, wire65}) ?
                          $signed({reg62, reg60}) : (8'hb9)) ?
                      (~&$unsigned(((8'hb2) && (8'h9d)))) : $unsigned(($unsigned((7'h43)) <= reg60))));
  always
    @(posedge clk) begin
      reg67 <= $signed({{({(8'hb1), reg60} ? (^~wire55) : {wire54, wire55}),
              {(!(8'hb1)), $signed(wire54)}}});
      reg68 <= wire65;
      if (({reg63[(1'h0):(1'h0)]} * $unsigned(wire55[(4'hb):(3'h7)])))
        begin
          reg69 <= wire54[(1'h0):(1'h0)];
          if ((!$signed(reg62[(1'h1):(1'h1)])))
            begin
              reg70 <= (&$signed(wire66));
              reg71 <= (($signed($signed($unsigned(reg70))) || (($signed(reg59) ?
                      (reg60 ^~ (8'ha7)) : (wire64 ? wire56 : reg61)) ?
                  reg61 : (+$unsigned((8'hbc))))) <<< ({$signed(((8'had) ?
                          reg59 : (7'h42)))} ?
                  (~^((reg61 ? reg69 : wire57) ?
                      (~reg68) : (8'ha5))) : (((!(7'h43)) > (wire58 ?
                      wire57 : reg68)) >= $unsigned((reg70 ?
                      wire55 : reg62)))));
            end
          else
            begin
              reg70 <= (^~(~^(reg71 ~^ $signed((^~reg67)))));
              reg71 <= reg68[(1'h1):(1'h1)];
              reg72 <= (((~|$signed((wire65 ?
                  wire66 : reg63))) >> (((^wire66) < reg69) ?
                  {reg71,
                      $signed(reg69)} : $unsigned($signed(reg68)))) >>> {$unsigned({{reg68}})});
            end
          if ($signed($unsigned(((~&(reg59 | reg69)) >> reg69))))
            begin
              reg73 <= (wire65[(1'h0):(1'h0)] << reg70[(4'hc):(4'hc)]);
              reg74 <= reg68;
              reg75 <= (!(!($unsigned((reg61 || (8'hb6))) ?
                  wire64 : (~&{(7'h41), wire56}))));
              reg76 <= $unsigned((-$unsigned({(reg67 - wire66)})));
            end
          else
            begin
              reg73 <= $unsigned({$signed($unsigned($unsigned(wire55))),
                  ((~reg70) >> ((reg61 >= wire57) == (wire65 >>> reg68)))});
              reg74 <= reg68;
            end
          if ($signed($unsigned((+(~$signed(reg74))))))
            begin
              reg77 <= $signed((^~wire66));
              reg78 <= $unsigned($signed((reg76 & {((8'hb3) <<< wire64),
                  wire55})));
              reg79 <= wire57;
              reg80 <= $signed(reg59);
              reg81 <= reg71;
            end
          else
            begin
              reg77 <= $signed($unsigned($unsigned({reg63})));
              reg78 <= wire54[(2'h3):(2'h3)];
              reg79 <= wire58[(3'h4):(2'h3)];
              reg80 <= $unsigned(($signed($unsigned($signed(reg63))) ?
                  (|$unsigned((wire64 ?
                      reg60 : reg81))) : reg75[(2'h3):(1'h0)]));
              reg81 <= {wire66[(1'h0):(1'h0)],
                  ($unsigned(wire54) >= (reg62[(3'h5):(3'h5)] ?
                      $signed($signed(reg68)) : {$unsigned(wire57),
                          wire66[(2'h2):(1'h0)]}))};
            end
          reg82 <= ($signed(reg61[(4'h9):(3'h5)]) ~^ reg78);
        end
      else
        begin
          if ((-{{$unsigned(((8'h9f) ? wire54 : reg81)),
                  $unsigned(wire65[(2'h3):(2'h2)])}}))
            begin
              reg69 <= {reg76, wire56};
            end
          else
            begin
              reg69 <= reg67[(3'h4):(1'h1)];
              reg70 <= reg78;
              reg71 <= (^$unsigned(({(~&reg74),
                  $unsigned(reg72)} < reg74[(2'h3):(1'h1)])));
              reg72 <= ($signed(reg75) ? wire58 : reg59);
            end
        end
      reg83 <= ($unsigned({$unsigned($signed(wire55)),
          reg80[(3'h4):(3'h4)]}) || $unsigned($unsigned(((&reg77) ?
          {reg73, reg70} : (reg77 & (8'hbc))))));
    end
  assign wire84 = ({reg68} ~^ reg74);
  assign wire85 = reg61;
  always
    @(posedge clk) begin
      reg86 <= (+reg74[(2'h3):(2'h2)]);
      if (wire58)
        begin
          if ((wire58 ? reg71 : $unsigned($unsigned(wire84))))
            begin
              reg87 <= (((+($signed(reg69) & {reg79})) ?
                  reg67 : ($unsigned((reg81 ?
                      reg72 : wire54)) >> ($unsigned(wire65) > (reg81 ?
                      reg83 : reg69)))) - {{(~^(~wire66)), reg68},
                  $signed($signed(reg60[(4'hd):(4'ha)]))});
              reg88 <= (($unsigned($signed((&reg79))) ?
                      reg82[(2'h2):(1'h1)] : (^($signed(wire84) << $signed(reg69)))) ?
                  wire65 : $unsigned({(reg73[(4'h9):(3'h4)] && reg72[(2'h3):(2'h2)]),
                      reg69[(4'h8):(1'h0)]}));
              reg89 <= (reg67 != reg77);
            end
          else
            begin
              reg87 <= reg61;
            end
          reg90 <= $signed(wire55);
          reg91 <= {reg77};
        end
      else
        begin
          if ($unsigned((((wire84[(2'h3):(2'h2)] << (reg75 ^ wire57)) ?
                  ($signed(reg75) ?
                      $signed(reg73) : $unsigned(reg67)) : ((&reg86) < {reg82})) ?
              (reg80 != (reg71 ? (~&reg61) : {reg82})) : reg77)))
            begin
              reg87 <= reg87;
              reg88 <= $signed(reg70[(1'h0):(1'h0)]);
              reg89 <= (8'hb8);
              reg90 <= (^~(|reg71));
              reg91 <= {(reg80 ? reg82 : $unsigned(wire54)),
                  $signed(((~^reg67) ?
                      wire85[(1'h1):(1'h1)] : reg79[(1'h1):(1'h1)]))};
            end
          else
            begin
              reg87 <= wire84;
              reg88 <= (-reg59[(3'h5):(2'h3)]);
            end
          reg92 <= $unsigned($signed(((reg67[(2'h2):(1'h1)] ?
              reg91[(3'h5):(3'h5)] : reg75[(3'h6):(1'h0)]) == (!reg71))));
        end
      if ((8'ha5))
        begin
          reg93 <= $unsigned(((((~&reg70) ?
                  (reg68 ? wire58 : reg79) : reg91[(1'h0):(1'h0)]) ?
              $unsigned((^wire65)) : reg68[(1'h1):(1'h1)]) ~^ {(7'h43)}));
          if ((~&((^~{reg76}) + ((&reg80[(5'h10):(3'h5)]) ?
              $unsigned(reg80[(4'hd):(1'h0)]) : $unsigned((+reg63))))))
            begin
              reg94 <= reg63[(4'hb):(3'h5)];
              reg95 <= reg79;
            end
          else
            begin
              reg94 <= wire64[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg93 <= reg69[(3'h4):(2'h3)];
          if ((wire56[(3'h4):(3'h4)] ?
              (reg91[(3'h5):(2'h3)] ?
                  reg78[(2'h3):(2'h2)] : (((reg89 > reg78) ?
                          $signed(reg87) : wire57) ?
                      reg93 : (wire55[(3'h6):(2'h2)] ?
                          $signed((8'hae)) : reg60[(3'h4):(2'h3)]))) : wire65[(1'h1):(1'h0)]))
            begin
              reg94 <= $unsigned({reg71, reg95[(4'h9):(3'h7)]});
              reg95 <= ((~&(~|{{reg90, reg81}, (8'hbb)})) ?
                  ($unsigned($unsigned(((8'h9d) ?
                      reg83 : reg73))) != reg88) : reg89);
              reg96 <= (~&(reg59[(3'h5):(2'h3)] ?
                  ({reg76, (reg81 >>> reg75)} ?
                      ($unsigned((7'h44)) ?
                          (^reg94) : $unsigned(reg89)) : reg74) : $unsigned(reg61)));
              reg97 <= (reg68[(1'h1):(1'h0)] ?
                  ($signed(reg90[(1'h1):(1'h0)]) ?
                      $unsigned((^~$signed(reg82))) : wire55) : ((((~(8'ha5)) > ((8'hb2) ?
                          reg68 : reg69)) ?
                      (8'had) : {(reg89 ^~ (8'hb7)),
                          {(8'ha0), reg78}}) || $unsigned(reg77)));
            end
          else
            begin
              reg94 <= ((~$signed($signed((~&reg75)))) & reg80[(4'hc):(2'h2)]);
              reg95 <= reg91;
              reg96 <= $unsigned($signed(reg67[(4'ha):(3'h7)]));
              reg97 <= (&(7'h41));
              reg98 <= {{((!{reg69, reg62}) < $signed($unsigned(reg62)))}};
            end
          reg99 <= $signed(reg98[(4'ha):(4'h8)]);
          reg100 <= {reg62[(1'h0):(1'h0)], (8'hbb)};
          if (((7'h41) > {$unsigned($unsigned({reg93, reg98}))}))
            begin
              reg101 <= (reg59[(3'h5):(2'h3)] | $signed(wire64));
              reg102 <= $unsigned(((reg80 ?
                  reg90 : ($signed(reg78) ?
                      wire57 : (reg70 > reg80))) > reg62[(3'h5):(3'h5)]));
            end
          else
            begin
              reg101 <= (~|($unsigned((~&reg97[(4'h9):(1'h1)])) * reg76));
              reg102 <= $unsigned(reg74);
            end
        end
    end
  assign wire103 = reg87[(3'h5):(2'h2)];
endmodule

module module20
#(parameter param43 = ((^~{((8'ha6) && ((8'hba) < (8'h9d)))}) > ((8'hb0) > (~{((8'ha7) ~^ (8'hbd)), (~(8'ha1))}))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire24;
  input wire signed [(4'hf):(1'h0)] wire23;
  input wire [(3'h7):(1'h0)] wire22;
  input wire [(4'h9):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  assign y = {wire38,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire25 = ($signed($unsigned(((wire22 ? wire22 : wire21) ?
                      (wire24 ? wire22 : wire24) : wire22))) <<< wire24);
  assign wire26 = (8'hb2);
  assign wire27 = wire26;
  assign wire28 = wire24;
  assign wire29 = $signed((&(~|($signed(wire25) >= (wire26 ?
                      wire22 : (7'h43))))));
  assign wire30 = {({(wire24[(2'h2):(1'h1)] ? $signed((7'h43)) : wire22),
                              (~^(^(8'ha5)))} ?
                          (7'h40) : (wire26 ~^ $signed(wire26[(3'h7):(2'h2)]))),
                      wire22};
  assign wire31 = wire24[(3'h5):(3'h5)];
  assign wire32 = wire31;
  assign wire33 = ((^~wire21[(4'h8):(2'h2)]) + ((~$signed((wire27 <= wire24))) >= wire21[(3'h7):(2'h3)]));
  assign wire34 = ((((~(!wire31)) || $unsigned((wire31 * (7'h40)))) >= wire29[(2'h3):(1'h1)]) ?
                      $unsigned(wire31) : wire22);
  always
    @(posedge clk) begin
      reg35 <= wire30;
      reg36 <= wire30;
      reg37 <= $signed(({((reg35 - reg35) ?
                  (wire30 * reg36) : $signed(wire33))} ?
          wire24[(2'h2):(1'h0)] : $unsigned(((reg35 ^~ wire22) ^ (wire27 ?
              wire24 : wire29)))));
    end
  assign wire38 = $signed(((($unsigned(reg35) <= $unsigned(wire27)) ?
                      $signed($signed(wire21)) : $signed($unsigned(wire28))) < (~^(((8'hae) << wire21) ?
                      (wire21 ? wire30 : wire33) : wire32[(4'ha):(4'h8)]))));
  always
    @(posedge clk) begin
      reg39 <= ((({(wire22 ? wire23 : wire22)} ?
                  {(8'haa), (~^wire33)} : $unsigned((wire32 * (8'hbf)))) ?
              wire29 : wire23) ?
          $unsigned(wire30) : wire21[(2'h3):(2'h3)]);
      reg40 <= wire32;
      reg41 <= $unsigned((wire31[(1'h1):(1'h1)] - {(~&{wire23})}));
      reg42 <= (|(((-$unsigned((8'h9e))) ?
          $unsigned((8'h9e)) : wire23) & wire23[(3'h6):(3'h5)]));
    end
endmodule
