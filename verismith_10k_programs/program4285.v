module top
#(parameter param160 = (-{((~{(8'hbc), (8'h9d)}) ? (((8'hb8) ^~ (8'hab)) ? {(8'h9d)} : (~&(8'hb3))) : ((7'h44) + (|(8'hb2))))}), 
parameter param161 = param160)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire46;
  reg signed [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire158,
                 wire49,
                 wire48,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire46,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed(wire0[(2'h2):(1'h0)]);
    end
  assign wire5 = {{{(7'h42)}}, $unsigned((~^($signed(wire2) >>> (~|reg4))))};
  assign wire6 = wire5;
  assign wire7 = {$unsigned($unsigned($unsigned(wire3[(3'h5):(3'h5)]))),
                     ($unsigned((-wire2)) ?
                         $signed(($signed(wire1) ^~ (8'h9c))) : wire2)};
  assign wire8 = ($signed($signed((((8'hb5) ? wire6 : wire6) ?
                     {wire6} : wire2))) + ((^~wire2[(3'h7):(2'h2)]) ?
                     wire6 : $unsigned(wire2)));
  module9 #() modinst47 (wire46, clk, wire5, wire3, wire1, wire8, wire0);
  assign wire48 = wire8;
  assign wire49 = (((wire0[(1'h0):(1'h0)] * (~|{wire0,
                          wire5})) ~^ $unsigned($signed((wire46 - reg4)))) ?
                      $signed({(7'h41),
                          $signed(wire48)}) : ((8'haf) == (8'ha3)));
  module50 #() modinst159 (wire158, clk, wire48, wire46, wire7, wire49);
endmodule

module module50
#(parameter param157 = (((+({(8'hab)} >= (~&(8'hbe)))) > {{(~&(8'hb5)), ((8'hb4) < (8'ha9))}, (((8'ha0) << (8'hb4)) ? ((8'hb8) ? (8'hbc) : (8'hb4)) : (~(8'ha1)))}) ? ((~|((~&(8'ha5)) ? ((8'ha4) ? (8'ha2) : (8'ha2)) : {(8'hb7)})) & ((((8'hb2) ? (7'h41) : (7'h43)) ^ (~|(8'haa))) >>> {((8'ha8) || (8'ha3))})) : (~((^(+(8'h9c))) ~^ ({(8'hbd), (8'h9e)} <= ((7'h40) ^~ (7'h43)))))))
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h275):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire54;
  input wire [(3'h6):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire52;
  input wire signed [(3'h6):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire155;
  wire signed [(5'h15):(1'h0)] wire154;
  wire [(3'h5):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire96;
  wire [(5'h10):(1'h0)] wire150;
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  assign y = {wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire89,
                 wire74,
                 wire73,
                 wire64,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire96,
                 wire150,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg55 <= {$signed(wire51[(3'h5):(3'h4)]), (8'hbd)};
      if (reg55[(4'he):(1'h0)])
        begin
          if ($unsigned((((reg55 ? wire51 : $unsigned(reg55)) ?
                  (8'haa) : {(wire51 == (8'hb7))}) ?
              wire51[(1'h0):(1'h0)] : ((8'ha9) >> $unsigned($signed(wire51))))))
            begin
              reg56 <= wire52[(3'h5):(1'h1)];
            end
          else
            begin
              reg56 <= $signed((^~((&(wire52 ?
                  reg55 : wire52)) >>> ($unsigned(wire53) <= (~|wire53)))));
              reg57 <= ({$unsigned(((wire54 * reg56) * {reg56, wire53}))} ?
                  (wire51[(1'h0):(1'h0)] ?
                      $unsigned(wire51[(1'h1):(1'h1)]) : wire52) : (($unsigned((^~reg56)) + reg56) ?
                      (~&((~|(8'ha1)) > wire52[(3'h5):(3'h4)])) : wire54));
              reg58 <= reg56[(1'h0):(1'h0)];
              reg59 <= reg58[(3'h6):(3'h6)];
              reg60 <= (({{(reg59 <<< wire51),
                          $unsigned(wire51)}} && wire54[(2'h3):(2'h3)]) ?
                  (~^((~&((8'hb3) ?
                      wire53 : (8'ha2))) - ((wire53 >= reg56) >= (^reg55)))) : {reg57});
            end
          reg61 <= reg55;
          reg62 <= wire51[(3'h5):(3'h4)];
          reg63 <= $unsigned(($signed($unsigned((!reg60))) + $signed(reg56[(1'h1):(1'h1)])));
        end
      else
        begin
          if ((+(~&reg56[(3'h7):(2'h2)])))
            begin
              reg56 <= wire53[(3'h4):(1'h1)];
              reg57 <= ((($unsigned($unsigned(reg62)) ?
                          (!$signed(reg58)) : reg60[(3'h5):(1'h0)]) ?
                      (!wire53[(2'h2):(1'h1)]) : reg57[(2'h2):(2'h2)]) ?
                  {$unsigned((reg63 ?
                          $signed((8'haa)) : reg61[(1'h0):(1'h0)]))} : ({{reg60,
                              wire51}} ?
                      $signed(({(8'hb3),
                          (8'ha2)} && reg60[(3'h4):(1'h0)])) : wire51[(3'h4):(2'h3)]));
              reg58 <= ($unsigned(reg61) && reg56[(1'h0):(1'h0)]);
              reg59 <= ($unsigned($unsigned(($signed(wire51) == (reg58 ?
                      reg55 : wire53)))) ?
                  {((^(wire54 ? wire52 : (8'h9d))) > (reg57 ?
                          $unsigned((8'hb5)) : $signed((8'hac)))),
                      reg62[(3'h6):(3'h4)]} : $signed({{$signed(reg60),
                          (-reg57)},
                      reg56[(1'h1):(1'h0)]}));
            end
          else
            begin
              reg56 <= (reg56 ?
                  ($signed($signed((wire52 <= reg63))) * (reg61[(1'h0):(1'h0)] ?
                      (wire53 || (wire53 ? (8'ha1) : wire54)) : ((8'ha4) ?
                          ((8'h9c) || reg60) : (-reg55)))) : ({($signed((7'h44)) <<< wire51[(2'h2):(1'h1)])} * $unsigned(((reg61 ?
                          reg55 : reg60) ?
                      $signed(reg61) : $unsigned(reg60)))));
              reg57 <= $signed($unsigned(({$unsigned(reg57)} ?
                  (((7'h44) & reg60) + reg61[(2'h2):(1'h0)]) : ((~|reg60) && (wire51 ?
                      reg55 : (7'h41))))));
              reg58 <= ((((((8'ha6) ? reg56 : reg62) ?
                          reg61[(1'h0):(1'h0)] : $signed(reg61)) >>> ((reg63 ?
                          (8'haa) : reg58) || $signed(wire51))) ?
                      reg61 : wire51) ?
                  $unsigned(reg56[(3'h6):(1'h0)]) : $signed($signed({reg62,
                      (reg62 ? reg57 : (8'ha0))})));
              reg59 <= ((~|((reg63 || reg62[(2'h3):(2'h3)]) * reg58[(3'h7):(2'h3)])) + reg60);
            end
          reg60 <= (((reg57 ~^ $signed({wire54,
              wire52})) + reg56) ~^ (~($unsigned($signed(reg61)) - wire54[(2'h3):(1'h0)])));
          if ($unsigned((~wire52)))
            begin
              reg61 <= ($signed($signed(reg58)) > (~(($unsigned(reg60) <<< ((8'hb3) - reg58)) ^ $signed((+(8'ha3))))));
            end
          else
            begin
              reg61 <= (^~{$signed((wire53[(2'h2):(2'h2)] - reg55[(4'ha):(3'h7)]))});
            end
          reg62 <= $unsigned($unsigned($signed(((reg55 ?
              reg63 : wire54) * $signed(reg55)))));
        end
    end
  assign wire64 = $signed((reg57[(4'h8):(1'h1)] == $signed((reg61 ?
                      {(8'hb5)} : reg56[(3'h4):(2'h2)]))));
  always
    @(posedge clk) begin
      reg65 <= {(^~(($signed(reg55) ?
              reg62[(2'h3):(1'h1)] : wire54) < reg57[(1'h1):(1'h0)])),
          reg57};
      if (reg59)
        begin
          reg66 <= (~&(8'ha8));
          reg67 <= ((wire52 >> wire52) != $signed(wire64[(3'h7):(3'h5)]));
          reg68 <= {$unsigned((^(7'h43))),
              $signed($unsigned((reg62[(1'h1):(1'h1)] << wire51)))};
        end
      else
        begin
          if (reg65[(4'ha):(4'h8)])
            begin
              reg66 <= (~reg61[(2'h2):(1'h1)]);
              reg67 <= $unsigned($signed(((^(8'haa)) && $signed(wire54))));
              reg68 <= (|((((reg67 != wire53) ?
                  $unsigned(reg58) : (+(8'h9f))) > ((^~wire52) ?
                  $unsigned(reg62) : $unsigned(wire53))) - reg68));
              reg69 <= (8'hb7);
            end
          else
            begin
              reg66 <= (~&$signed(reg65[(3'h4):(2'h2)]));
              reg67 <= $unsigned($signed(((^~$signed(reg60)) + $signed((wire64 ?
                  reg62 : reg58)))));
            end
        end
      reg70 <= ((~((-$signed(reg56)) ^~ (^~reg60))) ?
          $unsigned(wire51) : reg58[(3'h5):(2'h3)]);
      reg71 <= wire53;
      reg72 <= $signed((~((~&(-(8'hb7))) != ($signed((8'ha2)) == ((8'hbd) ?
          wire52 : wire53)))));
    end
  assign wire73 = $signed(reg66[(5'h10):(1'h1)]);
  assign wire74 = (~reg58[(3'h5):(2'h2)]);
  module75 #() modinst90 (.wire76(reg72), .clk(clk), .wire79(wire73), .wire77(reg57), .wire80(reg60), .wire78(reg55), .y(wire89));
  assign wire91 = $unsigned(((8'h9e) || (!(reg65 | wire54))));
  assign wire92 = (wire54[(2'h2):(1'h1)] - $unsigned({(reg55 ?
                          (&wire51) : reg68[(2'h3):(2'h2)]),
                      wire51}));
  assign wire93 = $signed((^~(-{(8'ha9), ((8'h9d) && reg56)})));
  assign wire94 = reg58;
  assign wire95 = $signed(($signed($unsigned($signed(reg63))) ?
                      reg62 : ((~&$unsigned(reg63)) ?
                          $signed((wire92 ?
                              reg70 : reg70)) : $signed(wire64[(1'h0):(1'h0)]))));
  assign wire96 = $signed(($signed($unsigned((~^reg71))) && ({(wire74 ^ reg61)} ?
                      ((reg68 ~^ reg60) >= (~|reg66)) : (&$signed(reg68)))));
  always
    @(posedge clk) begin
      reg97 <= wire96[(4'hb):(3'h5)];
      reg98 <= reg60[(5'h15):(4'hb)];
      reg99 <= wire74[(4'h8):(3'h5)];
      if ((reg99 ^~ $unsigned(reg99[(4'hb):(3'h4)])))
        begin
          if (wire93)
            begin
              reg100 <= (((8'ha1) & reg72) > ((^($signed(reg69) > $unsigned(wire51))) ?
                  ((&reg69) | wire94) : (((&reg59) ?
                          (wire95 ? (8'hac) : (7'h41)) : $signed(wire93)) ?
                      (reg66 * (reg58 < reg58)) : wire54[(2'h3):(2'h3)])));
              reg101 <= ({($signed((8'hb5)) ?
                      ({reg97, wire53} ^ reg63) : {$signed(reg62)}),
                  $signed((-(reg62 | reg68)))} ^ $signed(wire54[(1'h0):(1'h0)]));
              reg102 <= wire89[(3'h5):(3'h4)];
            end
          else
            begin
              reg100 <= ($signed(($signed(wire53) <<< $signed((reg65 ?
                  reg57 : reg70)))) | {$unsigned($unsigned({reg98}))});
            end
          reg103 <= reg67[(1'h1):(1'h0)];
          reg104 <= ($unsigned(reg100) ?
              reg58 : (~&$unsigned((|reg55[(3'h4):(2'h3)]))));
        end
      else
        begin
          if (reg69)
            begin
              reg100 <= (8'haa);
              reg101 <= ((^~(wire73[(4'h8):(3'h7)] * $unsigned($signed(wire64)))) ?
                  ($unsigned(($unsigned(reg104) ?
                      {reg100, wire51} : (reg104 ?
                          reg61 : reg55))) << $signed($signed({wire64}))) : reg71[(3'h6):(3'h4)]);
            end
          else
            begin
              reg100 <= {((({(8'ha6)} >>> (reg67 | reg98)) ?
                      (reg66 == {wire93}) : ($signed((8'ha6)) ?
                          reg71 : $signed(reg104))) > (&$unsigned((~^wire91))))};
              reg101 <= ($unsigned(reg63) <<< $unsigned(reg99));
            end
          reg102 <= reg99[(3'h4):(3'h4)];
          if ((((reg100[(3'h7):(1'h1)] ?
                      ($signed((8'ha6)) ? reg65 : (^(8'h9e))) : ((reg62 ?
                          reg102 : wire89) << (reg67 ? reg68 : reg103))) ?
                  $unsigned(wire51) : reg60[(1'h0):(1'h0)]) ?
              $signed($signed(($signed(wire96) ?
                  (wire93 ? reg55 : reg97) : (reg57 ?
                      (8'had) : (8'hae))))) : reg101[(3'h6):(2'h2)]))
            begin
              reg103 <= $signed(($signed((8'ha8)) ?
                  ((^~(8'ha7)) ?
                      ($unsigned(wire52) ^~ (wire54 ?
                          reg65 : reg61)) : $unsigned($unsigned(wire92))) : (~|(+(wire64 * wire52)))));
              reg104 <= {$signed((~((~|reg59) | ((8'ha9) >= wire52))))};
            end
          else
            begin
              reg103 <= $unsigned((~|$signed($unsigned(wire51[(3'h5):(2'h2)]))));
              reg104 <= wire92;
              reg105 <= wire96;
              reg106 <= reg67[(3'h5):(2'h3)];
            end
          if (reg101[(4'hc):(3'h6)])
            begin
              reg107 <= ({reg65[(3'h5):(3'h5)],
                  (8'hbc)} ^ (~&$signed((wire73[(5'h12):(1'h0)] ?
                  (!wire96) : reg102))));
              reg108 <= $signed({$signed(((|wire94) <= {reg97, reg55}))});
              reg109 <= ($signed((^reg97[(3'h7):(3'h4)])) ?
                  ((^~(|{wire73})) ?
                      wire54[(1'h0):(1'h0)] : reg106[(1'h1):(1'h1)]) : $unsigned(reg104));
              reg110 <= {(reg98[(4'hd):(2'h2)] ?
                      reg99[(4'h8):(3'h7)] : reg101[(1'h1):(1'h0)]),
                  $signed(wire91[(1'h0):(1'h0)])};
            end
          else
            begin
              reg107 <= $unsigned({$unsigned($signed({reg61, (8'hbe)}))});
            end
          if (reg100)
            begin
              reg111 <= (!reg56[(1'h1):(1'h1)]);
              reg112 <= $unsigned(reg102[(4'h8):(4'h8)]);
            end
          else
            begin
              reg111 <= $unsigned((($signed((|reg61)) << {$unsigned(reg101)}) - (({reg106} ?
                      $signed(reg104) : $signed(reg72)) ?
                  reg55 : ((!reg65) ? (reg70 & reg67) : (^~wire91)))));
              reg112 <= $unsigned($signed(reg57));
              reg113 <= wire51;
              reg114 <= (($signed(((wire94 ? (8'hae) : reg99) ?
                      (wire54 ?
                          reg59 : wire94) : reg59[(3'h6):(3'h4)])) | (~reg100[(1'h1):(1'h0)])) ?
                  wire64 : $unsigned({$unsigned($signed(reg112)),
                      (+(reg107 ^~ wire96))}));
              reg115 <= {$signed((+$signed((wire89 ? reg100 : reg58))))};
            end
        end
    end
  module116 #() modinst151 (wire150, clk, reg67, reg65, reg108, wire94);
  assign wire152 = (8'ha2);
  assign wire153 = reg59[(3'h7):(3'h7)];
  assign wire154 = wire73;
  assign wire155 = ((|((reg102[(1'h1):(1'h1)] ?
                           (~|wire150) : ((8'ha2) && (8'hb6))) < $signed(reg101[(4'hc):(1'h0)]))) ?
                       wire154 : reg67);
  assign wire156 = ((|(($unsigned(reg111) >= $signed(reg68)) ?
                           $signed(reg56[(1'h1):(1'h0)]) : $signed($unsigned(reg72)))) ?
                       wire153 : wire64[(2'h2):(1'h0)]);
endmodule

module module9
#(parameter param44 = ((((&((8'ha1) ? (8'ha6) : (8'hbc))) ? (((8'hbf) ? (8'hb2) : (8'hac)) ? {(7'h44), (7'h43)} : ((8'ha6) ^ (8'haf))) : (|((8'h9e) ? (8'hbb) : (8'ha5)))) < (+((~^(8'hba)) * ((8'h9d) * (8'hbe))))) ? ((~|{(^~(8'ha6)), ((8'ha8) ? (8'hb6) : (8'hbe))}) | ((((8'hbf) ? (7'h41) : (8'ha8)) ^~ {(7'h43), (8'had)}) >> {{(8'ha9), (8'hbb)}})) : ((~^((&(8'hb3)) ? ((7'h40) > (8'h9e)) : ((8'ha0) ? (8'hbf) : (8'ha4)))) ? (((~(8'ha7)) ? ((8'ha8) ? (8'hbf) : (8'had)) : ((8'hbb) * (8'hb2))) ? (|((8'hb3) - (8'had))) : {((8'h9d) ? (8'ha7) : (8'ha6))}) : (!(((8'haf) ? (8'hb7) : (8'h9d)) > (^(8'hb3)))))), 
parameter param45 = {({{{param44, param44}}, (param44 >>> (param44 ? (8'hbf) : param44))} || ((~(-param44)) && param44))})
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  assign y = {wire38,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
  assign wire15 = wire13[(3'h5):(2'h2)];
  assign wire16 = (wire15 ?
                      $unsigned((($unsigned(wire13) ?
                          ((8'hba) & wire15) : wire10[(2'h2):(1'h0)]) | $signed($unsigned(wire10)))) : wire12);
  assign wire17 = wire11[(4'hc):(4'ha)];
  assign wire18 = ($signed({wire16[(3'h4):(3'h4)]}) ?
                      $signed($signed((wire16[(1'h1):(1'h0)] & wire12[(1'h0):(1'h0)]))) : ((wire14 ?
                          ((~wire12) || (wire14 ?
                              wire15 : (7'h43))) : wire13[(3'h4):(2'h3)]) > ($unsigned((wire10 ?
                              wire14 : (8'hbf))) ?
                          ($signed((8'ha7)) ^ $signed(wire13)) : ({(8'ha6)} | (~|wire11)))));
  always
    @(posedge clk) begin
      if (wire14[(2'h2):(1'h0)])
        begin
          reg19 <= (~(~^wire16[(4'h9):(3'h7)]));
          reg20 <= wire18[(3'h5):(2'h3)];
          if ({wire17, (+wire10[(1'h1):(1'h1)])})
            begin
              reg21 <= (^$unsigned({(wire16 ?
                      (wire15 ? wire16 : wire17) : $unsigned(wire12)),
                  $unsigned($signed((8'hb9)))}));
              reg22 <= (+((8'h9d) ?
                  (wire10[(3'h6):(3'h4)] || wire12) : wire14));
              reg23 <= $unsigned(wire14[(1'h1):(1'h1)]);
              reg24 <= (8'h9d);
            end
          else
            begin
              reg21 <= $unsigned((^reg20));
              reg22 <= (8'hb6);
              reg23 <= {wire10[(3'h4):(2'h2)],
                  $unsigned($unsigned((-(reg22 >>> reg24))))};
              reg24 <= reg19[(3'h7):(1'h1)];
            end
          reg25 <= (($signed((~reg21[(1'h0):(1'h0)])) >> $unsigned((~&reg24[(2'h3):(2'h3)]))) ~^ reg19);
        end
      else
        begin
          reg19 <= $signed(((|wire15) <<< (~&{wire14})));
          reg20 <= $unsigned($unsigned(($unsigned($unsigned(wire18)) - wire13)));
          if (($signed({(~&wire12), reg24[(2'h3):(2'h2)]}) ?
              (8'had) : (($unsigned(wire11) ?
                  ($unsigned(reg21) - $signed(wire15)) : $unsigned((^~reg22))) > (~reg25[(2'h3):(1'h1)]))))
            begin
              reg21 <= ($signed(wire14[(1'h1):(1'h1)]) - wire18[(4'h9):(3'h7)]);
              reg22 <= reg25[(2'h2):(1'h0)];
            end
          else
            begin
              reg21 <= wire15[(2'h2):(1'h1)];
              reg22 <= $signed({((!wire16) >= reg21),
                  $unsigned(wire10[(3'h4):(2'h2)])});
            end
        end
      reg26 <= ({(($signed(wire14) ?
                  (reg25 >>> (8'ha4)) : reg21) >>> (~((8'h9d) <= wire12)))} ?
          reg19 : ((wire16[(4'h9):(3'h6)] & (^(reg21 && wire18))) >= wire12));
      reg27 <= (-(|(wire13[(2'h3):(2'h3)] ^~ wire14)));
    end
  always
    @(posedge clk) begin
      reg28 <= ((8'ha0) ?
          $unsigned($signed($signed(((8'ha2) != wire13)))) : (^(wire17 ?
              (7'h40) : ((reg26 << wire14) ^~ $unsigned(wire15)))));
    end
  always
    @(posedge clk) begin
      if ((~(((~&(wire18 * (7'h42))) >> reg28[(3'h5):(1'h0)]) ?
          ((8'hb4) <= $signed((wire13 ?
              wire17 : wire13))) : $signed($unsigned((wire16 == (8'hb7)))))))
        begin
          if ($signed($unsigned($signed(wire12[(1'h1):(1'h1)]))))
            begin
              reg29 <= {wire12, {(8'hbc)}};
              reg30 <= {wire16[(3'h7):(3'h7)]};
            end
          else
            begin
              reg29 <= (wire17 != ((~&{(reg26 ? wire10 : (8'hbe)),
                      ((8'ha0) ? reg22 : wire15)}) ?
                  $signed(reg21[(4'ha):(1'h1)]) : wire18[(3'h4):(2'h3)]));
              reg30 <= (8'haf);
            end
        end
      else
        begin
          if ($signed($signed((-{$signed(reg30), (|reg19)}))))
            begin
              reg29 <= ((~&$signed((wire12[(2'h3):(1'h0)] ^~ (-reg30)))) ?
                  $unsigned(($unsigned($unsigned(wire13)) ?
                      wire11[(4'h8):(3'h4)] : ($signed(wire11) < $unsigned((8'hb8))))) : reg27);
            end
          else
            begin
              reg29 <= reg23;
            end
          reg30 <= $unsigned((wire18[(3'h5):(1'h0)] ?
              reg29 : {{reg26, (~(8'hb3))}}));
        end
      if (wire17[(3'h6):(2'h3)])
        begin
          reg31 <= (8'hb3);
          reg32 <= $signed($unsigned(reg26));
          reg33 <= $signed($signed({reg25[(5'h11):(4'hb)], {reg19}}));
          reg34 <= $signed(($signed({$unsigned((8'hb1))}) >= $signed((wire10 * (wire12 ^~ wire18)))));
          reg35 <= (!$unsigned($unsigned(($unsigned(reg28) ~^ ((7'h42) && wire18)))));
        end
      else
        begin
          reg31 <= (-(8'hb6));
          if ((($signed($unsigned($signed((8'h9f)))) ?
              wire15[(3'h4):(1'h0)] : (+($unsigned((8'hb8)) ^~ $unsigned(wire18)))) > (reg31[(4'ha):(1'h0)] | $unsigned(((wire17 ^ wire11) || (reg21 - reg33))))))
            begin
              reg32 <= $signed(reg31);
            end
          else
            begin
              reg32 <= (((reg28 ^ reg30[(3'h7):(2'h2)]) ?
                  $unsigned({$signed(reg30), (+reg20)}) : (^~(+{reg26,
                      reg22}))) & reg35[(2'h2):(1'h1)]);
              reg33 <= wire16[(1'h0):(1'h0)];
              reg34 <= $unsigned(wire10);
            end
          reg35 <= ($unsigned(($unsigned(reg23) || ({reg21} ?
              wire18 : (~wire18)))) < reg26);
        end
      reg36 <= wire11[(1'h0):(1'h0)];
      reg37 <= (|reg21[(5'h14):(4'hc)]);
    end
  assign wire38 = wire14;
  always
    @(posedge clk) begin
      reg39 <= {$unsigned((((reg28 ? reg32 : wire18) | (reg35 ?
                  (8'hba) : wire10)) ?
              (^~reg31[(4'hb):(4'ha)]) : $signed({reg26, wire15}))),
          wire38};
      reg40 <= $signed({($signed((reg33 ?
              wire16 : reg22)) >>> wire13[(4'hd):(4'hb)]),
          {(!(reg23 | reg37))}});
      reg41 <= $signed($signed((8'ha0)));
      reg42 <= $signed({reg41,
          $unsigned($unsigned(((8'ha9) ? reg34 : wire11)))});
      reg43 <= ((!$unsigned($signed($signed(reg24)))) ?
          (({$signed((7'h42))} ?
              (+wire17[(3'h6):(3'h5)]) : (&((8'haf) - reg21))) <= ($unsigned(reg37[(3'h5):(2'h2)]) ?
              $unsigned($unsigned(wire18)) : $unsigned(wire14))) : (wire12 < reg20));
    end
endmodule

module module116
#(parameter param148 = (~|(^~((((7'h40) < (8'hb0)) ? ((8'hbc) != (8'hb2)) : (!(7'h44))) ? (8'hb2) : ((^(8'hb2)) ? ((8'ha7) ? (8'ha0) : (8'ha6)) : ((8'hae) ? (8'hbe) : (8'hab)))))), 
parameter param149 = ((+{({param148} & (^param148)), param148}) ? {(^(~|((8'h9f) > param148)))} : (+param148)))
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire120;
  input wire signed [(2'h3):(1'h0)] wire119;
  input wire signed [(5'h11):(1'h0)] wire118;
  input wire [(4'ha):(1'h0)] wire117;
  wire signed [(4'hf):(1'h0)] wire147;
  wire [(3'h4):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  wire signed [(4'h9):(1'h0)] wire143;
  wire [(5'h12):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire141;
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg136 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(4'h9):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg121 <= $unsigned((8'hab));
      if ((wire120[(3'h4):(2'h2)] ? wire118 : wire119))
        begin
          reg122 <= reg121;
          reg123 <= ((~|reg122[(4'h9):(4'h8)]) + wire120);
          if ((^~wire117[(3'h4):(2'h3)]))
            begin
              reg124 <= ((wire118[(1'h1):(1'h1)] > reg121[(4'h9):(1'h1)]) ?
                  (&($signed((wire119 ? wire117 : (7'h43))) ?
                      ((reg123 ? wire118 : wire118) || (reg121 ?
                          reg122 : reg123)) : ($signed(reg123) < (wire120 ?
                          wire120 : wire120)))) : wire117);
              reg125 <= $unsigned(wire117[(3'h6):(3'h5)]);
              reg126 <= $signed($unsigned((~&reg121[(4'h9):(4'h9)])));
              reg127 <= reg124[(1'h0):(1'h0)];
              reg128 <= (wire117 ? $unsigned(reg122) : wire119[(1'h0):(1'h0)]);
            end
          else
            begin
              reg124 <= (~^(reg128[(4'h9):(2'h2)] ?
                  (^~wire119[(1'h1):(1'h0)]) : {($unsigned((8'h9d)) ?
                          (reg122 || (7'h43)) : reg127)}));
              reg125 <= reg123;
              reg126 <= (wire120[(4'hf):(1'h1)] ?
                  {reg125[(3'h6):(1'h1)],
                      ($signed({reg121}) ?
                          $unsigned((~&reg124)) : $unsigned((wire118 <= reg128)))} : ((~^(|(wire117 ?
                      wire119 : wire119))) && ($signed((reg124 ^~ wire117)) | $signed(((8'h9c) * wire119)))));
              reg127 <= (+({$unsigned((~^reg125)),
                      ($unsigned(wire119) ~^ $signed(reg123))} ?
                  wire120[(4'ha):(3'h5)] : {$signed((reg128 ?
                          reg122 : reg125))}));
              reg128 <= ((~|reg127[(2'h2):(2'h2)]) ?
                  reg127[(5'h11):(4'h9)] : $unsigned(({reg126[(3'h5):(3'h5)]} ?
                      ($signed(wire119) ?
                          $unsigned(wire119) : $signed(wire119)) : $unsigned(reg125[(4'h9):(2'h3)]))));
            end
        end
      else
        begin
          if ($signed(reg121))
            begin
              reg122 <= $unsigned((reg126[(4'hf):(4'hb)] >>> ($signed((-(8'hb0))) ?
                  $unsigned($signed((8'hba))) : ($signed((8'hbd)) ?
                      (!wire120) : (!wire119)))));
              reg123 <= (~((+reg127[(2'h2):(1'h0)]) >= wire119));
              reg124 <= $unsigned($unsigned($signed((-$unsigned(reg128)))));
            end
          else
            begin
              reg122 <= reg127;
              reg123 <= $unsigned(reg124[(4'ha):(1'h1)]);
              reg124 <= $signed({reg127[(3'h6):(2'h2)],
                  (^~reg125[(4'hc):(4'h8)])});
              reg125 <= ((+wire118[(1'h0):(1'h0)]) - (&((wire119[(2'h2):(2'h2)] ?
                  wire118[(5'h10):(2'h2)] : {reg127}) != (wire117 ~^ wire119))));
            end
          reg126 <= reg126;
          reg127 <= (({((~&reg124) ^ reg121), (8'hb6)} ?
                  ($unsigned({reg126, wire117}) ?
                      reg128 : $signed(((8'hbd) == reg127))) : ($unsigned((~^wire119)) ?
                      (wire120[(4'hf):(4'hb)] ^ (reg126 + wire117)) : wire118[(4'ha):(4'h8)])) ?
              (~(-(^~reg124))) : reg122[(4'h8):(3'h4)]);
        end
      reg129 <= $signed((7'h44));
      if (($unsigned(reg125[(4'h8):(4'h8)]) >>> (~(8'ha3))))
        begin
          reg130 <= (^~($signed({$signed(wire120),
              (wire118 >= reg127)}) > (((~^reg126) ?
                  $signed(wire117) : ((8'h9d) ? wire117 : reg125)) ?
              (!(~&wire119)) : $unsigned((^wire119)))));
        end
      else
        begin
          if (wire120)
            begin
              reg130 <= wire117[(1'h1):(1'h1)];
              reg131 <= (-$unsigned((+reg128[(3'h5):(3'h5)])));
              reg132 <= reg131;
            end
          else
            begin
              reg130 <= wire117[(3'h6):(3'h6)];
              reg131 <= $signed($unsigned((7'h44)));
              reg132 <= $unsigned(($unsigned({reg130}) & reg123));
              reg133 <= $unsigned($signed({($signed(wire118) ?
                      wire120 : (reg129 >= reg132))}));
              reg134 <= wire120[(1'h1):(1'h0)];
            end
          reg135 <= reg121[(4'h8):(4'h8)];
          reg136 <= reg124;
          if (reg127)
            begin
              reg137 <= (reg124 ?
                  $signed({(!$unsigned(reg129)),
                      $signed(reg129)}) : reg121[(2'h3):(1'h0)]);
              reg138 <= $signed({$unsigned(($signed(wire119) ?
                      wire118[(5'h11):(1'h1)] : $signed((8'hb1))))});
              reg139 <= reg125[(4'ha):(1'h0)];
              reg140 <= ((8'hbd) >>> reg138[(3'h5):(2'h2)]);
            end
          else
            begin
              reg137 <= (reg135 ?
                  reg124 : {(wire120[(4'h8):(3'h4)] & (~reg130[(3'h5):(2'h3)]))});
              reg138 <= $signed(reg136[(2'h2):(1'h1)]);
              reg139 <= $signed($unsigned((reg135 >>> {wire117[(3'h5):(1'h1)]})));
            end
        end
    end
  assign wire141 = {reg124};
  assign wire142 = $unsigned((((~$unsigned(reg130)) | {(reg126 ?
                               (8'hb1) : reg140),
                           $unsigned(wire141)}) ?
                       {$signed((~^reg135)), (8'ha9)} : reg129[(3'h6):(1'h0)]));
  assign wire143 = reg131[(4'hb):(3'h6)];
  assign wire144 = reg135;
  assign wire145 = (8'ha6);
  assign wire146 = reg129[(1'h0):(1'h0)];
  assign wire147 = reg140[(2'h2):(2'h2)];
endmodule

module module75  (y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire80;
  input wire [(5'h13):(1'h0)] wire79;
  input wire [(3'h6):(1'h0)] wire78;
  input wire [(4'h8):(1'h0)] wire77;
  input wire [(5'h14):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire87;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 (1'h0)};
  assign wire81 = ((&wire79[(5'h12):(5'h12)]) ?
                      $signed(($unsigned($unsigned(wire78)) ?
                          wire79 : wire78[(1'h1):(1'h0)])) : wire80);
  assign wire82 = wire79;
  assign wire83 = $signed($unsigned(wire82[(4'ha):(3'h6)]));
  assign wire84 = $signed((($unsigned(wire78) && (+(wire82 <= wire78))) ?
                      wire78 : $signed((wire82[(5'h12):(4'hc)] ?
                          (|wire83) : (wire79 ? wire82 : (8'ha2))))));
  assign wire85 = ({wire82[(3'h6):(2'h3)],
                      {{(wire78 ? wire84 : wire82)}}} != wire82);
  assign wire86 = ((+$unsigned($signed(wire76))) << ((+wire84[(3'h6):(3'h6)]) <= $unsigned(wire81)));
  assign wire87 = (~^((~wire84[(2'h3):(1'h0)]) ~^ {((~wire85) ?
                          {(8'ha4)} : (wire86 > wire84))}));
  assign wire88 = {({(+$unsigned(wire87)),
                          {{wire80,
                                  (8'hbf)}}} <= $unsigned(($signed(wire76) * $unsigned(wire83))))};
endmodule
