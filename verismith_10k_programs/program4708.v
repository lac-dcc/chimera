module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire164;
  wire signed [(4'h9):(1'h0)] wire163;
  wire [(2'h2):(1'h0)] wire162;
  wire signed [(4'hb):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire153;
  wire signed [(4'ha):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire156;
  reg [(5'h15):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg107 = (1'h0);
  reg [(3'h7):(1'h0)] reg108 = (1'h0);
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire93,
                 wire95,
                 wire96,
                 wire153,
                 wire155,
                 wire156,
                 reg160,
                 reg159,
                 reg158,
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
                 (1'h0)};
  assign wire4 = ((^~$unsigned(wire2)) & $unsigned(wire0));
  assign wire5 = ((wire0 ?
                         (|$unsigned((wire0 ?
                             wire0 : wire2))) : $unsigned(wire1)) ?
                     (~&(~|(+wire1[(4'h8):(2'h2)]))) : $signed(wire1));
  assign wire6 = $signed(({wire2[(3'h6):(3'h6)], $unsigned((8'ha5))} ?
                     wire0 : $unsigned({(wire1 != (8'hbc))})));
  assign wire7 = $signed(wire5);
  module8 #() modinst94 (.wire12(wire1), .y(wire93), .clk(clk), .wire11(wire4), .wire10(wire5), .wire9(wire3));
  assign wire95 = wire3;
  assign wire96 = (-wire1);
  always
    @(posedge clk) begin
      if (($unsigned((|wire95)) ? (8'ha5) : $signed(wire96)))
        begin
          if ((~&{$unsigned(wire96[(1'h0):(1'h0)]), (-({wire3} + wire2))}))
            begin
              reg97 <= $unsigned(wire93);
              reg98 <= reg97;
              reg99 <= ((-{{((8'had) ? wire0 : wire3),
                          (wire7 ? wire5 : wire95)},
                      wire93}) ?
                  $unsigned((|($signed(wire0) ?
                      wire96 : (wire96 ? (8'had) : wire2)))) : ($signed(wire6) ?
                      (^~wire1) : ($unsigned($unsigned(wire96)) ?
                          (reg97 ?
                              (wire4 - wire4) : (reg97 <<< reg98)) : {(~|wire0),
                              wire2[(3'h5):(1'h0)]})));
            end
          else
            begin
              reg97 <= $signed($signed($unsigned((-(~|wire1)))));
              reg98 <= $signed(((|($signed(wire5) <= wire96[(3'h5):(3'h4)])) ?
                  $signed((+(wire1 ^ (8'hb1)))) : $unsigned((|$unsigned(wire2)))));
              reg99 <= $unsigned(wire93[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg97 <= $signed((((8'haa) ?
                  (-$unsigned((8'hb4))) : (~|$signed((8'ha6)))) ?
              {$signed($unsigned(reg97))} : reg98[(1'h0):(1'h0)]));
        end
      reg100 <= $unsigned((reg98[(2'h2):(2'h2)] >= reg99));
      reg101 <= $unsigned((wire1[(2'h3):(2'h2)] >= ($unsigned($unsigned(wire3)) ?
          $unsigned($unsigned(reg99)) : $signed((wire2 ? wire6 : wire3)))));
    end
  always
    @(posedge clk) begin
      if ($unsigned((^~(-($signed(reg99) < wire3[(2'h2):(2'h2)])))))
        begin
          reg102 <= $signed((~{(wire5[(5'h12):(5'h12)] + wire4[(1'h0):(1'h0)])}));
          if (reg99[(4'ha):(4'h8)])
            begin
              reg103 <= $unsigned(wire96);
            end
          else
            begin
              reg103 <= $unsigned($unsigned($signed($signed(reg103[(3'h6):(1'h0)]))));
              reg104 <= $signed(reg101);
              reg105 <= wire5[(3'h6):(1'h1)];
              reg106 <= wire5[(2'h3):(2'h2)];
            end
          reg107 <= reg104;
        end
      else
        begin
          if ($signed(wire7))
            begin
              reg102 <= (~$unsigned((wire1[(3'h5):(1'h1)] ?
                  reg97 : ((reg103 ? (8'hb6) : wire0) + wire0))));
              reg103 <= $unsigned({$signed(((|reg103) <= (^wire3)))});
              reg104 <= ($unsigned($unsigned(($signed((8'hb9)) ?
                      (wire7 & reg102) : (8'hb9)))) ?
                  $signed(((!$signed(wire7)) ?
                      (~(wire4 ^ reg102)) : {(8'hb4)})) : $signed(((reg104 ?
                          {wire2, wire96} : wire3) ?
                      reg102 : ($signed(wire1) >= wire4))));
            end
          else
            begin
              reg102 <= wire0[(3'h4):(1'h1)];
            end
          if ((~^$signed(wire2)))
            begin
              reg105 <= ($unsigned($unsigned({(~&reg105), $signed((8'h9c))})) ?
                  reg99 : ({reg97[(4'h8):(2'h3)], ($signed(wire6) * (8'hbe))} ?
                      ($unsigned(reg103[(1'h0):(1'h0)]) ?
                          {$signed(reg104)} : $unsigned((7'h44))) : $unsigned($signed($signed(reg101)))));
              reg106 <= $signed($signed($unsigned({$unsigned(reg104)})));
            end
          else
            begin
              reg105 <= $signed(reg106[(3'h7):(2'h3)]);
            end
          reg107 <= (~&$signed(($unsigned(reg101[(4'h8):(3'h4)]) ?
              (((8'h9f) ? reg101 : (8'h9e)) ?
                  $unsigned((8'hbe)) : (wire95 >>> reg104)) : ((reg97 ?
                      wire1 : reg101) ?
                  reg101 : (wire95 ? reg98 : wire95)))));
          reg108 <= wire1[(3'h6):(2'h3)];
        end
    end
  module109 #() modinst154 (.y(wire153), .wire112(wire0), .wire110(wire6), .clk(clk), .wire114(wire7), .wire111(wire4), .wire113(reg102));
  assign wire155 = $signed((~^wire153[(4'h8):(1'h1)]));
  module109 #() modinst157 (.wire114(wire6), .clk(clk), .wire111(wire93), .wire113(wire1), .wire112(wire155), .y(wire156), .wire110(wire0));
  always
    @(posedge clk) begin
      reg158 <= wire95;
      reg159 <= (((~(reg108[(3'h7):(2'h3)] ?
              (^reg104) : $signed(wire7))) == $signed((wire155[(1'h1):(1'h0)] ?
              ((8'hbc) <= reg99) : (8'hb2)))) ?
          wire2 : $signed(({(reg100 >>> wire95)} ?
              (wire7[(4'h8):(3'h6)] ?
                  reg99 : (reg107 || reg103)) : $signed(wire96))));
      reg160 <= reg108[(3'h7):(3'h7)];
    end
  assign wire161 = (((reg97[(1'h0):(1'h0)] ?
                           reg105 : $signed($signed((8'hbf)))) ?
                       (wire2[(3'h7):(3'h4)] ?
                           wire6 : ($signed(reg97) ?
                               (^wire95) : (reg102 > (8'ha6)))) : $signed(((8'hb4) ?
                           $signed(reg101) : (^wire95)))) + (^(wire2[(3'h6):(3'h6)] ?
                       wire0[(1'h1):(1'h1)] : ($unsigned(wire1) ?
                           (~|wire96) : (reg158 ? reg97 : reg103)))));
  assign wire162 = (^reg108);
  assign wire163 = {($unsigned((~|reg159[(3'h7):(1'h1)])) >>> (reg107 ?
                           {(wire0 ^ reg99)} : reg104[(4'ha):(3'h6)]))};
  assign wire164 = ((({(!wire156)} << (8'ha8)) ?
                           reg101[(2'h3):(1'h1)] : (((wire162 & reg158) <<< {reg103}) ?
                               $unsigned((~reg99)) : reg106)) ?
                       ((~^$unsigned($unsigned(wire2))) ?
                           $signed(($signed(wire93) ?
                               ((7'h42) ?
                                   (8'hbb) : reg102) : $signed(wire156))) : $signed(($unsigned(wire162) ?
                               (~|wire5) : {wire7}))) : wire0);
endmodule

module module109
#(parameter param152 = {{(((~(8'hbf)) & ((7'h44) ? (8'hbe) : (7'h42))) || (!((8'hbc) ? (8'ha6) : (8'hb9))))}, (^{(((8'ha0) ? (8'hb1) : (7'h40)) ? ((8'hb8) ? (8'h9c) : (8'hbf)) : (8'haf)), {((8'hbe) ? (7'h44) : (8'ha2))}})})
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire114;
  input wire signed [(5'h14):(1'h0)] wire113;
  input wire signed [(4'ha):(1'h0)] wire112;
  input wire signed [(5'h15):(1'h0)] wire111;
  input wire signed [(4'ha):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire150;
  wire signed [(5'h10):(1'h0)] wire149;
  wire [(4'he):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire signed [(4'he):(1'h0)] wire146;
  wire [(4'h8):(1'h0)] wire145;
  wire [(5'h10):(1'h0)] wire143;
  wire [(5'h13):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  reg signed [(5'h10):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire143,
                 wire119,
                 wire117,
                 wire116,
                 wire115,
                 reg118,
                 reg120,
                 (1'h0)};
  assign wire115 = ((({wire111} ? wire113[(4'he):(4'hb)] : $unsigned(wire111)) ?
                           (((wire110 ?
                               wire114 : wire112) >= $unsigned(wire111)) == ($unsigned((8'ha0)) ?
                               $unsigned(wire113) : wire110)) : $unsigned((+((8'hbd) ^ wire110)))) ?
                       $signed((wire114 ?
                           ((~&(8'hbb)) - wire113[(4'h9):(2'h3)]) : (7'h42))) : wire113);
  assign wire116 = $signed($unsigned(wire110));
  assign wire117 = (((8'ha8) ?
                       $signed((+(!wire115))) : (^~$signed((wire115 >> wire113)))) + wire116[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg118 <= ((8'ha6) ?
          $signed($unsigned(wire113[(5'h12):(4'h8)])) : (!$signed({$signed(wire115),
              wire110})));
    end
  assign wire119 = wire115[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg120 <= wire113[(1'h1):(1'h1)];
    end
  module121 #() modinst144 (.wire126(wire117), .y(wire143), .wire122(wire110), .wire124(wire115), .wire125(wire112), .wire123(reg118), .clk(clk));
  assign wire145 = (~|{wire117[(3'h5):(3'h4)]});
  assign wire146 = ({(~|wire145)} ?
                       (wire117[(3'h6):(1'h1)] >> ((wire111[(4'hb):(1'h1)] || wire145[(2'h3):(1'h0)]) & (wire115[(4'hf):(4'hc)] ?
                           $unsigned((8'hb9)) : reg120[(4'h8):(2'h3)]))) : (((~|$unsigned(wire110)) ?
                           $unsigned($unsigned(wire115)) : $unsigned((wire119 <<< (8'hbd)))) > (+$unsigned($unsigned(wire119)))));
  assign wire147 = (wire116 << reg118);
  assign wire148 = ($signed((~^$signed(wire119[(3'h4):(1'h1)]))) ?
                       ($unsigned((&$signed(wire114))) == (~&((~|(8'haf)) ?
                           (wire147 - wire112) : $unsigned(wire112)))) : (&($signed($signed(wire111)) << $unsigned($signed(wire146)))));
  assign wire149 = $unsigned(((((wire113 >>> wire146) ?
                       $signed(wire146) : $unsigned(wire119)) << (7'h40)) + wire146[(1'h0):(1'h0)]));
  assign wire150 = {$signed($signed(wire143))};
  assign wire151 = $signed((wire143[(4'h8):(2'h3)] ?
                       wire146 : $signed((8'ha6))));
endmodule

module module8
#(parameter param92 = (~^(-(((^(8'ha8)) > ((8'hbd) ^ (8'ha6))) >> ((~^(7'h42)) ? ((8'hbc) ? (7'h43) : (7'h40)) : ((8'ha5) <<< (8'hbb)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire81,
                 wire64,
                 wire62,
                 wire43,
                 wire42,
                 wire15,
                 wire14,
                 wire13,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire13 = wire12[(1'h1):(1'h0)];
  assign wire14 = $signed((!wire12));
  assign wire15 = wire9[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      if ((8'h9e))
        begin
          if ((~&(~&((^~(~wire15)) >>> wire15[(3'h4):(3'h4)]))))
            begin
              reg16 <= (wire14[(1'h1):(1'h0)] ?
                  $unsigned({wire13}) : (^~(wire9[(2'h3):(1'h1)] <= (((8'ha5) == wire15) && $unsigned(wire13)))));
              reg17 <= wire13;
              reg18 <= reg16;
              reg19 <= (|reg16);
            end
          else
            begin
              reg16 <= wire9[(1'h0):(1'h0)];
              reg17 <= ((reg19[(5'h10):(4'h9)] * $signed(wire12)) ?
                  reg17 : $signed(reg17[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          if (reg18[(5'h10):(3'h7)])
            begin
              reg16 <= ((8'hb9) < (wire14 == reg17[(1'h1):(1'h1)]));
            end
          else
            begin
              reg16 <= ({$signed({wire9})} | (&((wire14[(3'h6):(1'h1)] < wire9) + reg17)));
              reg17 <= ($unsigned(reg16) ?
                  $unsigned(wire15) : $unsigned(reg17[(1'h0):(1'h0)]));
              reg18 <= (^~$unsigned($signed(wire12[(1'h1):(1'h1)])));
              reg19 <= $unsigned(wire11[(3'h4):(3'h4)]);
              reg20 <= ($signed(($signed({wire12, reg18}) ?
                  reg17[(2'h2):(1'h1)] : ((!reg18) ?
                      $unsigned((8'hbf)) : wire11))) >> reg18[(1'h1):(1'h0)]);
            end
          if (((8'ha0) ?
              reg18 : (wire10[(4'hf):(3'h6)] * (wire13[(4'hd):(4'h9)] ?
                  $unsigned({wire12}) : $unsigned(((8'hb4) ?
                      reg19 : (8'ha4)))))))
            begin
              reg21 <= wire11;
              reg22 <= wire10[(4'hd):(4'h8)];
              reg23 <= $unsigned($signed((reg17[(2'h2):(1'h1)] >>> wire10[(3'h5):(2'h2)])));
            end
          else
            begin
              reg21 <= $unsigned(wire12);
              reg22 <= $unsigned((wire12 != $signed(($unsigned(reg19) ?
                  wire9 : wire10[(4'ha):(1'h1)]))));
              reg23 <= (&$signed({$signed((reg16 == reg21)),
                  {reg16[(4'h9):(3'h5)]}}));
              reg24 <= {(reg18[(1'h0):(1'h0)] ^~ ({reg17,
                      {reg16, reg20}} - ({(8'ha5)} ?
                      $unsigned(reg16) : reg22[(1'h1):(1'h1)])))};
              reg25 <= (!$signed($unsigned(wire14)));
            end
          reg26 <= ($unsigned({$signed((&wire11)),
                  ($signed((8'had)) ^ wire9)}) ?
              reg19 : wire14[(2'h3):(2'h2)]);
          if ({$unsigned(reg17),
              ({(&reg22), ($unsigned((8'hb4)) >> ((8'hb2) - (8'ha7)))} ?
                  (!(^{reg26})) : $signed(($unsigned((8'hbd)) >= reg19[(1'h0):(1'h0)])))})
            begin
              reg27 <= (~({wire9} != reg23));
              reg28 <= $signed({$signed($unsigned((reg21 != reg20)))});
              reg29 <= (~|$unsigned(reg24));
              reg30 <= {(8'hb7)};
              reg31 <= wire11;
            end
          else
            begin
              reg27 <= $signed({reg30});
              reg28 <= $unsigned($signed($unsigned($unsigned((~^wire11)))));
            end
          if (reg29[(2'h2):(1'h0)])
            begin
              reg32 <= (~(reg16[(2'h2):(1'h1)] ?
                  $signed(((wire10 ^~ reg22) << (wire10 ?
                      (7'h43) : (8'ha6)))) : $unsigned(($signed(wire12) ?
                      (reg28 ? wire15 : reg30) : $signed(wire14)))));
              reg33 <= (wire13[(4'hd):(3'h5)] <<< reg19[(2'h2):(1'h1)]);
              reg34 <= $signed(wire14);
              reg35 <= (~{($unsigned((~|reg25)) ?
                      ((8'ha9) ? reg22 : (reg29 ? reg27 : reg31)) : reg24)});
              reg36 <= $unsigned((~(((wire9 ?
                      wire12 : reg33) <<< (reg29 >>> reg20)) ?
                  {{reg18}, (wire11 || wire13)} : (wire9[(1'h1):(1'h0)] ?
                      ((8'h9f) <<< reg34) : (~^wire12)))));
            end
          else
            begin
              reg32 <= reg30;
              reg33 <= (reg30 > wire15);
              reg34 <= reg30;
              reg35 <= $unsigned(reg35[(4'h9):(3'h7)]);
            end
        end
      reg37 <= (~&(~$unsigned($unsigned($unsigned(wire14)))));
      reg38 <= ((~|(~|reg34)) << $signed((~^reg30)));
    end
  always
    @(posedge clk) begin
      reg39 <= reg34;
      reg40 <= (({{reg20, (~&reg30)}} - (^wire13[(4'hf):(4'hf)])) << (8'ha9));
      reg41 <= reg20;
    end
  assign wire42 = (8'hb8);
  assign wire43 = {$signed(reg23[(2'h3):(2'h3)]), wire11[(5'h10):(2'h2)]};
  module44 #() modinst63 (wire62, clk, reg27, reg21, reg19, reg38);
  assign wire64 = ((reg38 ?
                      reg25[(3'h4):(1'h0)] : $unsigned(wire9)) & reg41[(1'h1):(1'h0)]);
  module65 #() modinst82 (wire81, clk, wire14, reg38, reg41, wire11, reg20);
  assign wire83 = (reg40 ?
                      {reg25,
                          wire9[(4'h9):(3'h4)]} : (~$unsigned($unsigned(reg25))));
  assign wire84 = $unsigned((reg28 ?
                      (((!(8'ha7)) ?
                          reg36[(1'h0):(1'h0)] : $signed(wire42)) ~^ {$unsigned(reg21)}) : (|(-(~&(8'haf))))));
  assign wire85 = ($unsigned((reg18[(5'h10):(4'h9)] ?
                      wire83 : ($signed(reg23) ?
                          wire62[(4'h8):(3'h6)] : (reg28 * wire84)))) > wire12);
  always
    @(posedge clk) begin
      reg86 <= ((($signed((reg35 ? reg19 : reg28)) ?
              ((|(8'hb3)) ?
                  $unsigned((8'hb6)) : $signed(wire83)) : ($unsigned(reg26) ?
                  {reg40, reg17} : (wire12 == reg39))) ?
          reg19 : (reg25[(4'ha):(2'h3)] < {(wire83 ? reg38 : reg32),
              $unsigned(wire62)})) << reg17[(1'h0):(1'h0)]);
      if ($signed(wire85[(3'h6):(2'h2)]))
        begin
          reg87 <= (((^~$signed(((8'ha9) > reg19))) >= $signed((((8'ha4) ~^ reg30) ?
              reg34 : (8'ha5)))) <<< reg27);
          reg88 <= $unsigned((reg28[(4'hb):(2'h2)] >>> $unsigned((-(+reg18)))));
          reg89 <= (wire12[(1'h0):(1'h0)] ?
              $unsigned((reg23[(4'h9):(1'h1)] ?
                  ({wire11} << (reg22 <= reg31)) : reg26[(1'h0):(1'h0)])) : $unsigned(wire9[(3'h4):(2'h3)]));
        end
      else
        begin
          reg87 <= ((^~(((reg41 && reg36) ?
                      $unsigned((8'ha2)) : (reg38 <= reg88)) ?
                  wire10 : {(8'hbf), $signed(wire62)})) ?
              $signed((reg33[(1'h1):(1'h0)] ~^ reg39[(4'hc):(3'h6)])) : (8'h9f));
        end
      reg90 <= $unsigned(reg34);
      reg91 <= wire14[(3'h4):(3'h4)];
    end
endmodule

module module65
#(parameter param79 = ({((((8'hbf) ? (8'ha2) : (8'hbd)) & {(7'h40)}) ? {((8'hb6) * (8'h9f))} : (^~((8'hb0) && (8'hb0)))), (!(~^((8'hb4) ? (8'hbf) : (8'hb5))))} | (^~(((+(8'hbb)) & ((8'had) ? (8'ha7) : (8'ha8))) != ((8'hbd) + ((8'h9e) ? (7'h41) : (8'ha6)))))), 
parameter param80 = (|((param79 ? {(~|param79), (^param79)} : param79) >= (~|(param79 >= (&param79))))))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire70;
  input wire [(3'h7):(1'h0)] wire69;
  input wire signed [(3'h7):(1'h0)] wire68;
  input wire signed [(5'h11):(1'h0)] wire67;
  input wire [(4'h9):(1'h0)] wire66;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(3'h7):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 (1'h0)};
  assign wire71 = wire67;
  assign wire72 = ((wire69 ?
                          $signed($signed(wire68)) : $signed((wire69 ?
                              wire71 : wire70))) ?
                      (^~(((~&wire68) ?
                          (~&wire68) : (8'h9c)) + $unsigned($signed(wire71)))) : wire70);
  assign wire73 = wire71[(2'h3):(1'h1)];
  assign wire74 = ((~|(wire71 ?
                      wire68[(1'h1):(1'h1)] : $unsigned(wire69[(3'h7):(1'h1)]))) || {wire71[(3'h6):(3'h5)],
                      ((~(~&wire67)) + {(wire68 > wire68)})});
  assign wire75 = wire66[(4'h8):(1'h0)];
  assign wire76 = $unsigned(wire69[(3'h5):(3'h4)]);
  assign wire77 = $signed(wire66[(4'h8):(2'h2)]);
  assign wire78 = wire77;
endmodule

module module44
#(parameter param60 = {((8'h9c) ? ((-{(7'h42)}) >>> ({(8'hb8), (8'hb1)} > (~(8'hbb)))) : (!({(8'ha4)} << ((8'ha2) != (8'hbd)))))}, 
parameter param61 = {((param60 == ((|param60) ? {param60} : (param60 ? param60 : param60))) ? (+({param60} - (param60 ? param60 : (8'hb2)))) : ({param60} >>> (param60 < (~|param60))))})
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire48;
  input wire [(3'h5):(1'h0)] wire47;
  input wire [(3'h5):(1'h0)] wire46;
  input wire [(4'hf):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire49;
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  assign y = {wire59,
                 wire50,
                 wire49,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire49 = (({$unsigned({wire46, wire46})} ?
                          wire47[(2'h2):(2'h2)] : (~(~(8'ha8)))) ?
                      ($signed(wire47) ?
                          (~(+$unsigned(wire48))) : $signed((~wire46[(2'h2):(2'h2)]))) : wire48);
  assign wire50 = {(~&$signed(wire48))};
  always
    @(posedge clk) begin
      if ((~|$signed(wire46[(2'h3):(1'h1)])))
        begin
          reg51 <= $unsigned({$signed($unsigned($unsigned(wire50))),
              $signed($signed((wire47 ? wire45 : wire50)))});
          reg52 <= (^~(!$signed($signed($unsigned(wire50)))));
          if ((~^($unsigned(wire50[(2'h3):(1'h0)]) <<< ($unsigned((wire49 | wire47)) ~^ $signed(reg51)))))
            begin
              reg53 <= $signed((wire46 && $signed(reg52[(2'h2):(1'h1)])));
              reg54 <= ($signed((8'hb7)) != (!$unsigned((&(~|wire49)))));
              reg55 <= $signed($unsigned((($signed(reg54) < $unsigned(wire49)) ?
                  (8'haa) : (wire50 ? $signed(reg54) : reg53[(1'h1):(1'h1)]))));
              reg56 <= $unsigned(wire48);
              reg57 <= wire48;
            end
          else
            begin
              reg53 <= (-wire48);
            end
          reg58 <= wire49;
        end
      else
        begin
          reg51 <= $unsigned($signed({{(wire45 ? (8'hb5) : (8'haf)),
                  $signed(reg57)}}));
          reg52 <= $unsigned($signed((~^(8'h9d))));
          reg53 <= {((($signed(wire49) >>> (8'h9f)) ^~ $signed((wire47 + (8'haa)))) || reg58),
              reg54[(5'h12):(4'hc)]};
          if ($signed($signed((&(8'ha2)))))
            begin
              reg54 <= $signed($signed(($unsigned(reg57) ?
                  (reg54 && $signed((8'ha2))) : (+reg52[(3'h7):(3'h6)]))));
              reg55 <= (reg55 ?
                  reg57[(2'h2):(2'h2)] : ($unsigned((+wire46[(1'h0):(1'h0)])) >> (^reg53)));
              reg56 <= reg54[(1'h0):(1'h0)];
              reg57 <= $signed(reg58[(3'h4):(1'h0)]);
            end
          else
            begin
              reg54 <= (($signed({(^~reg54)}) - (|reg58)) ?
                  ($unsigned($signed(reg56)) + (^~((reg56 ? wire46 : reg51) ?
                      reg57[(1'h0):(1'h0)] : ((7'h40) == reg51)))) : (^reg53[(1'h0):(1'h0)]));
              reg55 <= $signed((~|(~$signed((wire46 ^ wire47)))));
              reg56 <= (reg52 ?
                  wire49[(1'h1):(1'h0)] : ((wire45 ?
                      ((reg56 << reg51) ?
                          $signed(reg54) : $signed(wire45)) : $signed((wire46 ?
                          wire50 : reg58))) - {reg57,
                      ((wire49 ? wire50 : wire48) ?
                          wire49[(3'h4):(3'h4)] : wire50)}));
              reg57 <= {(^(!$unsigned((reg53 & reg51)))),
                  (($unsigned((|reg57)) ?
                      (8'h9d) : $unsigned($signed(wire50))) < ($signed((reg52 ?
                      reg55 : (8'hb2))) <<< (!(~|wire45))))};
            end
        end
    end
  assign wire59 = $signed($unsigned(reg53[(2'h2):(1'h0)]));
endmodule

module module121  (y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire126;
  input wire signed [(4'h8):(1'h0)] wire125;
  input wire [(5'h10):(1'h0)] wire124;
  input wire [(5'h10):(1'h0)] wire123;
  input wire signed [(3'h4):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire142;
  wire signed [(4'hd):(1'h0)] wire141;
  wire [(4'hf):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(3'h6):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(5'h11):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire128,
                 wire127,
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
                 (1'h0)};
  assign wire127 = wire125[(2'h2):(1'h1)];
  assign wire128 = (wire125 ?
                       ((&(^~{wire123})) ?
                           (8'ha1) : wire126) : ((wire125 | wire123) >>> (~^(8'hb7))));
  always
    @(posedge clk) begin
      reg129 <= $signed(wire125[(4'h8):(4'h8)]);
      reg130 <= (wire126 && {(wire125 - wire126[(1'h0):(1'h0)])});
      reg131 <= $signed({wire124});
      reg132 <= wire127[(3'h4):(3'h4)];
      if (wire124[(4'hd):(4'ha)])
        begin
          reg133 <= ({(^$signed($signed(wire124))),
              reg131} ~^ $signed($unsigned((wire124 << wire125[(1'h1):(1'h1)]))));
          reg134 <= (~^($unsigned((~&(-wire128))) != (!((wire124 >= reg130) ?
              $unsigned(reg129) : $signed(reg130)))));
          reg135 <= (-$signed($signed({(reg132 - wire127),
              $unsigned(wire128)})));
        end
      else
        begin
          if ($unsigned($signed(reg129[(2'h2):(2'h2)])))
            begin
              reg133 <= {$signed($signed((&(!(8'hba))))), wire127};
              reg134 <= wire126[(2'h3):(2'h2)];
            end
          else
            begin
              reg133 <= $signed($unsigned((~wire128)));
              reg134 <= (~$unsigned((-(wire124[(4'hd):(4'ha)] >= (~wire128)))));
              reg135 <= (reg134 <<< (wire127[(4'h8):(3'h6)] ?
                  $signed(reg135[(1'h1):(1'h0)]) : (reg133[(2'h2):(2'h2)] ?
                      ($unsigned(wire127) <= (reg133 - wire128)) : ($signed((8'ha3)) >= reg132))));
              reg136 <= {{$signed(reg134)}};
            end
          reg137 <= (reg133 ?
              $signed(((wire122[(3'h4):(3'h4)] * reg133[(2'h2):(1'h0)]) ?
                  ($signed(reg132) << reg130) : ($signed(reg135) || reg136))) : (^~(~^reg132[(4'h9):(3'h7)])));
          reg138 <= (+{$signed($signed($signed(wire123)))});
          reg139 <= $signed($signed(($unsigned($unsigned(wire128)) && ({wire122,
                  (8'h9f)} ?
              $signed((8'ha9)) : $unsigned(wire128)))));
          reg140 <= reg131[(2'h3):(1'h1)];
        end
    end
  assign wire141 = reg139[(1'h1):(1'h0)];
  assign wire142 = ($unsigned($unsigned(((reg131 ? reg137 : wire124) ?
                       reg137[(1'h1):(1'h1)] : {reg140,
                           reg135}))) == reg137[(3'h6):(2'h3)]);
endmodule
