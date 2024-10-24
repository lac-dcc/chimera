module top
#(parameter param137 = ({(((&(8'ha8)) >> ((8'h9c) & (8'hac))) > (((8'h9e) ? (8'hb3) : (8'h9d)) ? {(8'ha7), (8'hb7)} : (8'hbc))), (&((^(8'had)) ? (8'hb5) : ((8'ha0) <= (8'ha1))))} ? (((^~((8'hb0) + (8'ha3))) ? (~{(8'hba)}) : (((8'hbc) ? (8'haf) : (8'hbd)) <<< ((8'ha4) ? (8'h9e) : (8'hb1)))) ? (((~^(8'ha1)) && {(8'hb8), (8'ha1)}) ? {((8'ha8) && (8'hb5)), ((8'ha6) ? (8'hb2) : (8'hba))} : {((8'hb6) << (8'hb7)), ((8'hb5) ? (8'hbb) : (8'haf))}) : (^{(-(8'hbf)), (+(8'hbb))})) : (&(+{(8'hb4), ((8'hb0) ? (8'ha7) : (8'hbb))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire135;
  wire [(4'h9):(1'h0)] wire133;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire133,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg10,
                 (1'h0)};
  assign wire5 = ((wire3 ?
                         (^~$signed((wire3 ?
                             wire0 : wire1))) : ($signed((wire1 ^ wire2)) ?
                             (wire3[(3'h4):(2'h3)] ?
                                 $unsigned(wire0) : wire4[(3'h5):(1'h1)]) : wire1)) ?
                     wire1 : {wire3});
  assign wire6 = (|(($unsigned((^~wire5)) ?
                         wire0 : ((wire4 + wire0) ?
                             $unsigned(wire3) : (wire0 - (8'hab)))) ?
                     (^~((&(8'had)) != $signed(wire1))) : wire3));
  assign wire7 = ((wire0[(1'h1):(1'h1)] != $unsigned(wire5[(1'h1):(1'h0)])) != (^wire1));
  assign wire8 = $unsigned((({(wire4 | wire0)} ?
                         (|wire6) : (+(wire1 << wire1))) ?
                     wire3[(2'h3):(1'h1)] : $unsigned($unsigned($unsigned(wire1)))));
  assign wire9 = (^wire5[(4'h9):(1'h1)]);
  always
    @(posedge clk) begin
      reg10 <= $unsigned(wire8[(1'h1):(1'h0)]);
    end
  module11 #() modinst62 (wire61, clk, wire7, wire3, wire2, wire9);
  assign wire63 = $signed(wire9);
  assign wire64 = wire7;
  assign wire65 = wire1[(2'h3):(2'h2)];
  assign wire66 = wire1;
  assign wire67 = (wire7 ^~ (wire2[(5'h10):(4'hc)] * wire9[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg68 <= $unsigned((wire9 ? $signed((!$signed(wire67))) : wire64));
      reg69 <= ($unsigned(wire65[(1'h1):(1'h0)]) ?
          wire61 : $signed(((wire6 ? $unsigned(wire1) : (~(8'ha9))) + ({wire1,
                  (8'hb9)} ?
              wire67 : wire2))));
      reg70 <= $signed(($signed($unsigned((+(8'hb7)))) == ($signed(wire6) ~^ ($unsigned((8'hbd)) <= {reg10}))));
      reg71 <= wire2[(4'he):(3'h4)];
    end
  module72 #() modinst134 (wire133, clk, reg69, wire2, reg68, wire64);
  assign wire135 = (((wire61[(2'h3):(2'h2)] ? (8'hb5) : $signed(wire133)) ?
                           $unsigned(reg71[(1'h1):(1'h0)]) : $signed(reg10)) ?
                       wire9 : wire8);
  assign wire136 = wire6;
endmodule

module module72
#(parameter param131 = (((8'ha6) != (((|(8'ha9)) ? ((8'ha6) ? (8'hae) : (8'h9e)) : ((8'hb3) ~^ (8'hb3))) + {((7'h40) ? (7'h43) : (8'ha9))})) ? (-((((8'ha1) ? (8'hbf) : (7'h43)) ? ((8'ha7) ? (7'h43) : (7'h41)) : (~^(8'ha4))) ? (((8'hbc) ? (8'hb7) : (8'haa)) > ((8'ha6) ? (8'haf) : (8'haf))) : {(^~(8'hac))})) : ((|(((8'hb1) >>> (8'hb5)) ? (-(8'hb9)) : ((8'hb9) ? (8'hb8) : (8'hb5)))) ^~ (((!(8'hba)) ? {(8'hb7), (8'hbd)} : ((8'hb1) ? (8'h9d) : (8'had))) ? (((8'hb7) ? (8'hac) : (8'hbe)) ? ((8'haa) ? (8'hab) : (8'ha7)) : ((8'hbb) * (8'hb8))) : (((8'hb8) >>> (7'h44)) ? ((7'h44) ? (8'ha5) : (8'hbd)) : ((8'h9d) ? (8'ha9) : (8'ha5)))))), 
parameter param132 = ((param131 ? (^~((param131 > param131) + (~param131))) : param131) <= {param131}))
(y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire76;
  input wire [(4'hf):(1'h0)] wire75;
  input wire signed [(4'hf):(1'h0)] wire74;
  input wire signed [(5'h10):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire130;
  wire [(5'h15):(1'h0)] wire129;
  wire [(4'hd):(1'h0)] wire128;
  wire [(4'h8):(1'h0)] wire127;
  wire signed [(4'he):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(3'h4):(1'h0)] wire115;
  wire signed [(3'h4):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire110;
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  module77 #() modinst111 (wire110, clk, wire76, wire75, wire74, wire73, (8'haa));
  assign wire112 = (wire75 ?
                       wire110 : $signed((((^wire110) != {wire74}) && $unsigned($signed((8'h9f))))));
  assign wire113 = (((wire112 & $signed((wire76 ?
                           wire76 : wire110))) != (8'ha6)) ?
                       {$unsigned((^$unsigned(wire76))),
                           (wire110[(2'h2):(1'h0)] ?
                               $signed(wire112) : $signed($signed(wire74)))} : ((wire110 ~^ (~|((8'hb0) ?
                           wire76 : wire73))) + ((8'hb8) ?
                           ((wire73 ?
                               wire76 : wire75) != (+wire110)) : {(~^wire74)})));
  assign wire114 = $unsigned(wire74);
  assign wire115 = $unsigned((8'had));
  assign wire116 = $unsigned($signed(((wire113[(4'h8):(3'h6)] ?
                       wire114[(3'h4):(2'h3)] : wire112) == wire73[(5'h10):(4'h9)])));
  assign wire117 = $unsigned(($signed(wire110[(1'h0):(1'h0)]) > (wire76 ^~ (wire76 != $signed(wire112)))));
  always
    @(posedge clk) begin
      if ((!wire112[(3'h5):(2'h2)]))
        begin
          reg118 <= (8'ha4);
          if ($signed(wire110))
            begin
              reg119 <= wire115[(2'h2):(2'h2)];
              reg120 <= reg119;
            end
          else
            begin
              reg119 <= {{{((~&wire74) ? $signed(wire74) : (~|wire110)),
                          ((wire73 ? wire116 : reg118) ?
                              wire110 : {wire116})}}};
              reg120 <= wire76[(3'h6):(1'h1)];
            end
          reg121 <= (+$unsigned($unsigned(reg120)));
        end
      else
        begin
          reg118 <= (~&$signed((~((wire113 ?
              wire75 : wire76) & $signed(wire76)))));
          reg119 <= $signed({$signed($unsigned($unsigned(wire116)))});
          if (wire110[(3'h5):(1'h1)])
            begin
              reg120 <= wire116;
            end
          else
            begin
              reg120 <= wire75;
            end
        end
      reg122 <= $signed($unsigned(($unsigned(wire114[(2'h2):(2'h2)]) & wire113[(4'h8):(3'h6)])));
      reg123 <= wire75;
      reg124 <= wire75[(4'hc):(2'h2)];
    end
  assign wire125 = $signed(wire76);
  assign wire126 = (wire74 ?
                       wire125[(4'h9):(3'h7)] : ((wire74 ?
                               ((reg119 + (8'haf)) ?
                                   $unsigned(reg124) : $unsigned((8'hae))) : ($signed(reg119) == ((8'ha7) ?
                                   wire114 : wire115))) ?
                           ((~|((8'ha6) ? wire76 : reg120)) ?
                               (wire114[(3'h4):(2'h2)] ?
                                   reg119[(1'h0):(1'h0)] : $signed(wire117)) : wire73) : {$unsigned($unsigned(reg121)),
                               ($signed(wire112) <= (reg119 ?
                                   wire114 : (7'h41)))}));
  assign wire127 = $signed(($unsigned({$unsigned(wire74), $signed(reg124)}) ?
                       {((~^reg119) + (reg120 ? wire112 : wire113)),
                           (~^wire73)} : $signed((wire110[(2'h2):(2'h2)] * (reg121 ^~ wire113)))));
  assign wire128 = wire125;
  assign wire129 = $signed((($signed($unsigned(reg118)) ?
                       ((~wire115) ?
                           $signed(wire75) : wire126) : $unsigned($unsigned(wire73))) != $unsigned(reg124[(2'h2):(1'h1)])));
  assign wire130 = $unsigned($unsigned((~|(wire76[(1'h0):(1'h0)] >>> (+wire75)))));
endmodule

module module11
#(parameter param60 = (&{{(^(8'ha6))}}))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire31;
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 reg59,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  module16 #() modinst32 (wire31, clk, wire13, wire14, wire12, wire15);
  assign wire33 = (~&wire12);
  assign wire34 = wire33[(3'h4):(2'h3)];
  assign wire35 = ((^((~^wire34[(3'h4):(1'h0)]) * (8'hb5))) ?
                      $signed((!$unsigned((wire15 ?
                          wire12 : wire12)))) : {wire34[(3'h5):(1'h1)]});
  assign wire36 = ($unsigned($signed((&$signed(wire34)))) ?
                      (~^$signed((&(wire33 ?
                          wire33 : wire12)))) : (+{$signed($unsigned(wire12)),
                          $signed($unsigned((8'hbe)))}));
  always
    @(posedge clk) begin
      if ((wire14[(3'h6):(2'h3)] + wire14[(1'h1):(1'h0)]))
        begin
          reg37 <= $unsigned(wire33);
          reg38 <= (((wire33 ?
                      ((~wire12) >>> wire35) : (wire14 == (wire15 ?
                          wire34 : (8'had)))) ?
                  wire34 : ({$signed(wire33),
                      (wire13 * wire12)} == $signed((wire12 ?
                      wire13 : wire12)))) ?
              (((~$unsigned((8'hbd))) - $signed(wire34)) ?
                  (!wire36[(4'h9):(3'h5)]) : ($signed((wire15 < wire34)) < wire35)) : (+$signed(wire12)));
          reg39 <= wire36;
          reg40 <= $signed(wire35);
        end
      else
        begin
          reg37 <= $unsigned($signed(reg38));
          reg38 <= (reg38[(1'h1):(1'h1)] ?
              (wire14 < ((&wire15[(4'hc):(3'h5)]) < reg40)) : $unsigned(reg39[(5'h11):(2'h2)]));
          if ((($signed($unsigned($unsigned((8'hb9)))) - (7'h43)) <= $signed($signed((^~{wire13})))))
            begin
              reg39 <= $unsigned($signed((|(&$signed(wire13)))));
              reg40 <= {(!($signed((-reg37)) & wire35[(2'h2):(2'h2)])),
                  $unsigned(wire34[(1'h1):(1'h0)])};
            end
          else
            begin
              reg39 <= $unsigned((&((~&(wire36 ? wire36 : wire35)) ?
                  (&$signed(wire35)) : (reg38 ?
                      (!wire36) : $unsigned(wire35)))));
              reg40 <= (wire13[(2'h2):(1'h0)] > (!wire33));
              reg41 <= $signed({wire14[(3'h5):(1'h1)]});
            end
        end
      if ((-wire12))
        begin
          reg42 <= wire34[(2'h2):(2'h2)];
        end
      else
        begin
          reg42 <= (wire33[(1'h0):(1'h0)] + (8'ha0));
          if ({$signed(wire14),
              $signed((($unsigned(wire34) < (^reg40)) * {$signed(reg42),
                  (wire33 ? wire36 : reg38)}))})
            begin
              reg43 <= (({(~((8'haf) ? reg40 : reg40)),
                      ($unsigned((8'ha2)) ? wire13 : {reg42})} ?
                  wire35 : reg40) ^ ($unsigned((wire12 ?
                      (wire36 ? wire31 : (8'hb8)) : reg37)) ?
                  {((wire33 ? wire34 : reg42) ? (wire15 > wire36) : reg42),
                      ($unsigned(wire14) ?
                          (-wire31) : (^~(8'hbb)))} : $unsigned($unsigned($unsigned(reg37)))));
              reg44 <= ((($signed($unsigned(wire14)) ?
                      ((wire35 ? reg40 : wire13) >> {wire33,
                          wire33}) : $signed((wire13 <<< wire33))) - (8'ha7)) ?
                  (^{wire14, $unsigned($signed(reg40))}) : $signed(reg42));
            end
          else
            begin
              reg43 <= $unsigned($unsigned($unsigned($signed($unsigned(wire33)))));
              reg44 <= $signed(((^reg41) + reg41));
              reg45 <= reg41;
              reg46 <= $unsigned((&wire31));
            end
          reg47 <= (($signed((~|wire31[(4'hd):(4'ha)])) ?
                  $unsigned(((reg37 ?
                      wire36 : reg43) < reg39[(5'h10):(3'h7)])) : (((reg44 << reg42) ?
                          (wire34 ? wire14 : reg44) : (wire36 >= (7'h43))) ?
                      $unsigned($signed(reg41)) : $unsigned(wire13[(1'h0):(1'h0)]))) ?
              wire36[(3'h5):(2'h3)] : (-$unsigned($unsigned($unsigned(wire15)))));
        end
      if (wire33)
        begin
          if (($signed($unsigned((~^(wire35 && reg47)))) ?
              $signed(((~wire12[(3'h6):(3'h6)]) ~^ (wire14 >= (~reg46)))) : $unsigned({((reg43 >= reg43) != (reg37 ?
                      reg38 : reg41))})))
            begin
              reg48 <= reg47[(3'h7):(1'h1)];
              reg49 <= $signed(((^wire31[(4'hf):(4'h8)]) ?
                  ($unsigned((reg46 != reg45)) ?
                      ($unsigned(reg40) == (+wire12)) : wire15) : (reg48[(4'hd):(3'h4)] ?
                      ((reg41 <= reg37) != $signed(wire12)) : (^~wire15))));
              reg50 <= reg40[(4'hc):(3'h6)];
              reg51 <= reg49[(2'h2):(1'h1)];
            end
          else
            begin
              reg48 <= ((reg39 + $signed($signed(wire15))) ?
                  $unsigned($signed($unsigned((reg46 ?
                      reg51 : (8'hb0))))) : wire35);
            end
        end
      else
        begin
          reg48 <= reg50;
        end
    end
  assign wire52 = reg48[(2'h2):(1'h0)];
  assign wire53 = $unsigned({(+wire52),
                      $signed(((wire15 ?
                          wire31 : (8'hbc)) >>> (reg50 ~^ wire52)))});
  assign wire54 = ({(wire14 ?
                          (wire53[(2'h3):(2'h3)] && $unsigned(reg46)) : wire36[(3'h5):(2'h3)]),
                      (~|$unsigned((7'h41)))} << ({{wire13, wire13},
                          ($signed(reg50) ?
                              ((8'hbe) >= wire31) : $unsigned(wire14))} ?
                      $signed(reg47) : $unsigned({(reg38 ? reg43 : reg42),
                          wire34})));
  assign wire55 = ((8'ha6) ?
                      (~&$signed((wire52 ~^ (reg47 | wire33)))) : (^~(((|wire35) == reg39[(4'hd):(4'hb)]) ?
                          $unsigned((!(8'hbc))) : (^~{wire52, wire33}))));
  assign wire56 = (reg48[(1'h1):(1'h0)] <<< (reg47[(2'h2):(2'h2)] ?
                      wire54[(1'h1):(1'h0)] : wire14));
  assign wire57 = ($unsigned(wire33[(1'h0):(1'h0)]) + $unsigned(reg43[(2'h3):(2'h2)]));
  assign wire58 = {wire53[(5'h12):(4'hd)], wire53[(5'h11):(4'hd)]};
  always
    @(posedge clk) begin
      reg59 <= wire53;
    end
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 (1'h0)};
  assign wire21 = $signed(wire20[(4'ha):(2'h3)]);
  assign wire22 = wire21;
  assign wire23 = ((^wire22) ?
                      {((wire21 ?
                              wire19 : wire19) - ($signed((8'hb3)) >>> {wire20,
                              wire21})),
                          (~&{wire20,
                              $unsigned(wire21)})} : ({$signed(wire22)} ?
                          (~wire19) : $unsigned({(~&wire17),
                              $unsigned(wire19)})));
  assign wire24 = (wire20 >> wire19);
  assign wire25 = wire24[(3'h6):(1'h1)];
  assign wire26 = wire19;
  assign wire27 = (({(~^(wire26 > wire23)), {wire23, $signed((8'had))}} ?
                          wire26[(1'h1):(1'h0)] : $signed(wire22)) ?
                      wire17[(5'h14):(4'hf)] : (~|$signed(wire19)));
  assign wire28 = {wire19[(3'h5):(3'h5)],
                      $unsigned(($unsigned(((7'h42) ~^ (8'ha3))) ?
                          wire24 : wire17[(1'h0):(1'h0)]))};
  assign wire29 = wire18[(2'h3):(1'h1)];
  assign wire30 = (-((!(7'h41)) ?
                      (wire25 ?
                          wire17[(1'h1):(1'h1)] : (~&(+(8'hbe)))) : (&$signed(wire17))));
endmodule

module module77
#(parameter param108 = (~(~(8'ha5))), 
parameter param109 = param108)
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire82;
  input wire [(4'hf):(1'h0)] wire81;
  input wire [(4'hf):(1'h0)] wire80;
  input wire signed [(4'hb):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  wire signed [(4'he):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire104;
  wire signed [(4'ha):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire83;
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire93,
                 wire92,
                 wire91,
                 wire83,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire83 = $signed((|$signed($signed((!wire80)))));
  always
    @(posedge clk) begin
      reg84 <= $unsigned($unsigned(wire79));
      reg85 <= wire80[(4'he):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg86 <= (&((8'haa) ?
          $signed(((+wire83) ~^ $unsigned(wire81))) : (wire81 ?
              (wire79[(2'h2):(1'h0)] ?
                  wire79[(1'h0):(1'h0)] : $signed(wire80)) : wire83[(1'h1):(1'h1)])));
      reg87 <= (+(wire79 + (-(~^$signed(wire81)))));
      reg88 <= $unsigned(((((reg87 | wire80) ?
          (^~(8'ha5)) : wire81) <= reg85) >>> $signed($unsigned((wire83 ?
          reg84 : wire81)))));
      reg89 <= wire79;
      reg90 <= $unsigned(reg89[(3'h7):(2'h3)]);
    end
  assign wire91 = $signed(wire80[(1'h1):(1'h1)]);
  assign wire92 = (~reg87);
  assign wire93 = wire91[(5'h12):(5'h12)];
  always
    @(posedge clk) begin
      if (((~^$signed(reg89[(4'ha):(1'h0)])) ?
          (reg85 <= $unsigned($signed({wire82, wire79}))) : (reg88 & reg90)))
        begin
          reg94 <= reg90[(4'h9):(1'h1)];
          reg95 <= $signed(wire92);
          if ($unsigned(wire78[(4'h8):(2'h2)]))
            begin
              reg96 <= (~^$signed(($signed((reg90 ?
                  wire83 : reg84)) || reg94[(1'h1):(1'h1)])));
            end
          else
            begin
              reg96 <= wire80[(2'h3):(1'h1)];
              reg97 <= (~^(wire83[(4'hf):(4'h8)] || ($unsigned({(8'hac),
                      (8'ha2)}) ?
                  ((reg87 > reg85) - wire81[(4'h9):(1'h0)]) : $signed((wire91 + (8'hb6))))));
              reg98 <= reg85;
              reg99 <= ((!wire83) >> {($signed((+wire80)) <= ({wire79} ?
                      reg95[(4'ha):(3'h5)] : $unsigned(wire83))),
                  ($unsigned($signed((8'hbb))) && wire78)});
              reg100 <= $unsigned($signed(($signed((reg89 ?
                  (7'h40) : (8'h9d))) << (((7'h42) ~^ reg88) ?
                  ((8'hb1) ? wire92 : wire91) : (^~reg90)))));
            end
        end
      else
        begin
          if (wire78)
            begin
              reg94 <= {reg95};
              reg95 <= wire82;
            end
          else
            begin
              reg94 <= wire81[(4'ha):(4'ha)];
              reg95 <= reg100;
              reg96 <= $unsigned(reg95[(4'h9):(1'h1)]);
            end
          reg97 <= ({$signed($signed((8'hb0)))} ?
              ((+wire82) ?
                  $unsigned(reg100[(4'h9):(2'h2)]) : $signed(reg84)) : reg87);
          if ($unsigned(wire78))
            begin
              reg98 <= $signed(reg100);
              reg99 <= $signed(($unsigned((~|(~|wire79))) < (wire79 ?
                  wire83[(2'h2):(1'h1)] : ((~|wire81) ?
                      reg89 : (reg98 <= reg84)))));
              reg100 <= (((7'h43) ?
                  $unsigned((|(^reg99))) : {reg89[(3'h7):(2'h2)]}) | (reg85[(3'h7):(3'h6)] || wire91[(5'h12):(3'h4)]));
            end
          else
            begin
              reg98 <= $signed((8'h9c));
              reg99 <= ((&$signed($signed((~reg87)))) <= reg90[(2'h2):(1'h1)]);
              reg100 <= ($signed(reg90) <<< $unsigned((~^(reg90[(5'h13):(4'hf)] ?
                  $signed((8'hbd)) : $signed(reg87)))));
              reg101 <= $signed($unsigned($unsigned(wire78)));
            end
          reg102 <= wire81;
        end
      reg103 <= {(reg89[(4'hb):(2'h2)] ?
              (((reg94 ? reg89 : wire82) ?
                      $unsigned((8'hbd)) : reg98[(1'h1):(1'h0)]) ?
                  reg102 : (((8'hbc) ^ (8'hbe)) ?
                      $signed(wire82) : wire82[(1'h0):(1'h0)])) : reg100)};
    end
  assign wire104 = {(&$unsigned(reg85[(4'h8):(3'h5)]))};
  assign wire105 = (~reg86[(3'h5):(1'h0)]);
  assign wire106 = $signed((+{reg100}));
  assign wire107 = (reg98 != $signed($unsigned({{reg87, wire83}})));
endmodule
