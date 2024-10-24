module top
#(parameter param161 = (({(^~((8'hb2) ? (7'h44) : (8'hac))), (~^(~&(8'h9f)))} ? ((^~((8'ha6) ? (8'had) : (8'hbf))) ? ((8'hbd) ? ((8'hb2) ? (7'h43) : (8'h9c)) : ((8'ha6) < (8'hab))) : (((8'ha1) <<< (8'ha3)) ? ((8'hb3) * (8'h9c)) : {(8'ha9)})) : {(8'haa)}) & (!({(~&(8'hb7)), (~^(8'hae))} >= {{(7'h42), (8'ha7)}, ((8'haa) <<< (8'hba))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire159;
  wire signed [(3'h7):(1'h0)] wire158;
  wire [(2'h3):(1'h0)] wire157;
  wire signed [(4'hf):(1'h0)] wire156;
  wire signed [(5'h15):(1'h0)] wire155;
  wire [(5'h12):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire153;
  wire signed [(5'h10):(1'h0)] wire152;
  wire [(5'h13):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire149;
  wire [(5'h13):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire146;
  wire [(5'h11):(1'h0)] wire145;
  wire [(5'h15):(1'h0)] wire143;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  assign y = {wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire143,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (~(+wire1));
  assign wire6 = (-wire4);
  assign wire7 = (|((({wire6} < {wire5, wire2}) >> ((~&wire3) ?
                     (~^wire5) : (7'h41))) + wire2));
  assign wire8 = $signed((wire3 ? $unsigned(wire0) : $unsigned(wire5)));
  assign wire9 = $unsigned({$unsigned(wire5[(2'h2):(1'h1)])});
  assign wire10 = $signed((|((wire2 >>> $unsigned(wire9)) ?
                      wire9[(1'h1):(1'h0)] : $signed(wire3))));
  module11 #() modinst144 (.wire12(wire4), .wire14(wire2), .clk(clk), .wire13(wire5), .wire15(wire7), .y(wire143));
  assign wire145 = $unsigned(wire2[(2'h2):(1'h0)]);
  assign wire146 = (~^$signed((^~(^(~&wire5)))));
  assign wire147 = {wire143};
  assign wire148 = (~^($unsigned(($signed(wire10) ?
                       (-(8'hb5)) : wire6[(1'h0):(1'h0)])) >> ($signed($unsigned(wire146)) + wire3)));
  assign wire149 = (~$signed(wire146));
  assign wire150 = wire10;
  assign wire151 = (^((-(8'hb1)) ? {$signed((~wire2))} : {wire10}));
  assign wire152 = {((wire7 >>> (wire6[(3'h6):(3'h4)] ?
                               $signed(wire9) : (~&wire146))) ?
                           wire9[(3'h6):(2'h3)] : {$signed((8'h9c)), wire150})};
  assign wire153 = $signed($unsigned($unsigned($signed($signed(wire8)))));
  assign wire154 = ({$unsigned((-wire10[(4'h8):(2'h3)])),
                       wire152[(4'hc):(3'h7)]} ^~ $signed($unsigned(wire8)));
  assign wire155 = (wire149[(2'h3):(2'h3)] || $unsigned({{(|wire9),
                           $signed((8'hb3))}}));
  assign wire156 = ((((wire2 ?
                           ((8'ha6) ?
                               wire152 : wire145) : {wire146}) << (8'ha0)) & wire2[(3'h4):(1'h1)]) ?
                       wire4[(2'h2):(2'h2)] : (((&wire155) && $unsigned((wire5 * wire9))) >>> wire152));
  assign wire157 = {($unsigned($unsigned($signed(wire145))) && wire154)};
  assign wire158 = wire2;
  module11 #() modinst160 (wire159, clk, wire4, wire145, wire7, wire150);
endmodule

module module11
#(parameter param141 = ({(!(&(~^(8'ha4))))} ? ({{((8'haa) > (8'ha0))}, (((8'had) ? (8'hab) : (8'hbf)) && ((8'hb0) <<< (8'ha9)))} ? ({(8'hb6)} <= (+{(8'hb4)})) : (((^~(8'ha5)) ? (7'h41) : ((8'ha8) ? (8'hbf) : (8'ha3))) != (((8'hbc) + (8'hb9)) < ((8'hb9) ? (8'hb6) : (8'ha1))))) : (~|(((~^(8'hbd)) * ((8'ha0) && (8'hb6))) << (|((8'ha5) ? (8'hb5) : (8'ha0)))))), 
parameter param142 = (&((((param141 * param141) + param141) >>> (param141 ? {param141, param141} : (~&param141))) || {(^~param141), ((^(8'hb4)) ? (&param141) : param141)})))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire140;
  wire signed [(4'ha):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire137;
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire102,
                 wire89,
                 wire87,
                 wire61,
                 wire59,
                 wire40,
                 wire39,
                 wire38,
                 wire137,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= {$signed({(wire15 >= $unsigned(wire15)),
              (~&$unsigned((8'hb8)))}),
          wire14[(3'h5):(3'h4)]};
      if ($unsigned((&$signed(wire12))))
        begin
          if (wire13[(4'hb):(3'h7)])
            begin
              reg17 <= {$signed(reg16[(4'ha):(4'h8)]), wire14[(3'h5):(1'h0)]};
              reg18 <= {(~^$unsigned(((reg17 ? reg17 : wire14) | (-(8'hb2))))),
                  (wire12[(3'h6):(2'h3)] ? wire14 : reg16[(3'h7):(3'h5)])};
            end
          else
            begin
              reg17 <= $signed((7'h44));
            end
          reg19 <= ((^~$signed(reg16[(4'hf):(4'hc)])) & wire13[(2'h3):(2'h2)]);
        end
      else
        begin
          reg17 <= ($signed((-($signed(reg18) ?
              $unsigned((7'h40)) : $signed((8'hbc))))) ~^ ((~|{{reg18}}) <<< (|{(^wire12),
              (&wire12)})));
        end
      reg20 <= wire14[(3'h5):(3'h4)];
      reg21 <= $signed($signed((8'h9d)));
    end
  always
    @(posedge clk) begin
      if (reg18[(4'hd):(2'h2)])
        begin
          reg22 <= wire13[(4'ha):(1'h1)];
          reg23 <= (+reg21[(1'h1):(1'h1)]);
          reg24 <= (~^(~&$unsigned(reg19)));
          reg25 <= (reg20 ?
              wire13 : ({$signed($unsigned(reg16))} ?
                  {($signed(wire12) >= $signed(reg22))} : (reg22[(3'h7):(3'h6)] ?
                      reg19 : {(8'h9d)})));
        end
      else
        begin
          reg22 <= {$signed((&(~&reg18[(2'h3):(1'h1)]))),
              $signed((((reg25 * reg20) + wire12[(4'h8):(3'h4)]) ?
                  $unsigned(((8'h9c) ?
                      wire12 : reg25)) : ($unsigned(wire15) & (reg25 ?
                      reg18 : (8'ha4)))))};
        end
      if ($signed({$unsigned($signed(wire13)),
          ((~^$signed(reg17)) ? reg20[(4'hd):(4'h8)] : reg24)}))
        begin
          if ((~$unsigned((-reg21))))
            begin
              reg26 <= reg20;
              reg27 <= ($unsigned(reg21) ?
                  ((^~$unsigned((7'h44))) ?
                      reg20[(2'h3):(2'h3)] : reg21) : wire14[(3'h4):(1'h1)]);
            end
          else
            begin
              reg26 <= $unsigned((reg20 ?
                  (^(!wire15[(1'h1):(1'h0)])) : {reg25[(4'he):(2'h2)]}));
              reg27 <= ({($unsigned({wire12, reg17}) ?
                          ($unsigned(reg16) <<< reg26[(1'h1):(1'h0)]) : (reg27 ?
                              (wire14 ? reg22 : reg19) : $signed(reg24))),
                      ((reg16[(3'h7):(1'h1)] ?
                              $unsigned(reg17) : $unsigned(reg19)) ?
                          reg22 : {(^wire12)})} ?
                  $signed($unsigned((((8'hab) <<< (8'hb4)) ?
                      (|reg25) : $signed(reg25)))) : ((~|{$unsigned(reg25)}) << $unsigned(((~^(8'h9d)) >> (reg21 ?
                      reg19 : wire14)))));
              reg28 <= (~^{(!$unsigned((reg26 || (8'hb6))))});
            end
          reg29 <= wire14[(2'h2):(1'h0)];
          if ($unsigned(reg21[(3'h6):(1'h1)]))
            begin
              reg30 <= $signed(reg28[(4'h9):(4'h8)]);
            end
          else
            begin
              reg30 <= reg20;
              reg31 <= reg24[(4'h9):(1'h0)];
              reg32 <= {(^~(reg16 ?
                      reg31[(1'h0):(1'h0)] : ((reg30 >= reg22) & reg25)))};
              reg33 <= $signed(($unsigned($unsigned(reg31[(4'he):(4'hd)])) >= {reg29,
                  {reg22}}));
            end
          reg34 <= $signed(wire13[(4'hf):(4'hd)]);
          reg35 <= (($unsigned(wire12) ?
                  reg18 : {(&((8'ha6) ? wire14 : reg28))}) ?
              reg34[(1'h1):(1'h1)] : ((&$signed(reg17[(4'hb):(3'h6)])) ^ reg30));
        end
      else
        begin
          reg26 <= $unsigned((-$unsigned((reg22[(1'h0):(1'h0)] >= $signed(reg27)))));
          reg27 <= {reg23, reg24};
          reg28 <= reg34[(3'h4):(2'h3)];
        end
      reg36 <= (8'ha9);
      reg37 <= {reg19[(3'h4):(2'h3)]};
    end
  assign wire38 = (reg27 ? (!reg36) : (^$signed($signed((wire13 + (8'hab))))));
  assign wire39 = wire38[(4'hc):(3'h4)];
  assign wire40 = (reg24 ?
                      ($signed(reg21) >> ((^~$unsigned(reg30)) ?
                          reg25[(1'h1):(1'h1)] : (&$unsigned(reg36)))) : (~^{wire13}));
  module41 #() modinst60 (.wire44(reg19), .wire45(reg24), .wire43(wire14), .clk(clk), .wire42(wire13), .y(wire59));
  assign wire61 = (reg29 >>> (^(~^($unsigned(reg25) ?
                      (7'h43) : (reg21 ? (8'hbd) : reg27)))));
  module62 #() modinst88 (wire87, clk, wire12, reg32, reg28, wire13);
  assign wire89 = reg33[(4'hb):(4'h9)];
  module90 #() modinst103 (.wire92(reg36), .wire94(reg34), .wire91(wire89), .wire93(reg20), .y(wire102), .clk(clk));
  module104 #() modinst138 (.wire106(wire89), .wire108(reg30), .wire109(wire14), .wire107(wire13), .y(wire137), .wire105(reg18), .clk(clk));
  assign wire139 = reg35;
  assign wire140 = $signed((+(&(reg21 ?
                       $signed(wire139) : (wire15 ? (8'ha9) : (8'hab))))));
endmodule

module module104  (y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire109;
  input wire signed [(3'h6):(1'h0)] wire108;
  input wire [(2'h2):(1'h0)] wire107;
  input wire [(4'hc):(1'h0)] wire106;
  input wire signed [(4'ha):(1'h0)] wire105;
  wire [(2'h3):(1'h0)] wire136;
  wire [(4'hd):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire134;
  wire [(4'hf):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire124;
  wire signed [(5'h13):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire signed [(5'h14):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire110;
  reg [(4'hf):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg signed [(4'he):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg [(4'hf):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg117 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire124,
                 wire123,
                 wire122,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 (1'h0)};
  assign wire110 = {($unsigned((!wire107[(1'h1):(1'h0)])) ?
                           $signed(wire107[(2'h2):(1'h0)]) : $signed({{wire107}}))};
  assign wire111 = wire107[(1'h0):(1'h0)];
  assign wire112 = (({{{wire111, wire110}, (wire108 ? wire105 : wire111)},
                           (wire106[(3'h7):(2'h3)] ?
                               $signed(wire105) : $unsigned(wire106))} ?
                       wire111[(4'he):(1'h0)] : (|(wire107[(1'h0):(1'h0)] ?
                           wire108 : $unsigned(wire105)))) | wire106[(4'ha):(1'h0)]);
  assign wire113 = $unsigned($signed(wire108));
  assign wire114 = $unsigned({(+($signed(wire107) ?
                           (^wire107) : (wire112 ^ wire110))),
                       $signed(((~^wire108) ? $unsigned(wire110) : wire110))});
  assign wire115 = (wire108[(1'h1):(1'h1)] | wire109[(4'hb):(3'h6)]);
  assign wire116 = ($signed($signed(((&wire105) - $signed(wire115)))) ?
                       wire112 : wire106[(4'ha):(4'h9)]);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((|(wire108[(2'h2):(2'h2)] ?
          $unsigned(wire105) : $signed(wire115))))))
        begin
          reg117 <= $signed(wire106);
        end
      else
        begin
          reg117 <= wire109;
          reg118 <= wire105[(4'ha):(3'h4)];
          reg119 <= $signed($unsigned(($unsigned($unsigned(wire107)) > reg117[(4'h9):(2'h3)])));
        end
      reg120 <= $unsigned($signed($unsigned($unsigned(wire110))));
    end
  always
    @(posedge clk) begin
      reg121 <= $unsigned(reg120);
    end
  assign wire122 = ($signed(wire106[(2'h2):(1'h0)]) ?
                       wire110 : ($signed(((wire107 << (8'hba)) ?
                               $unsigned(wire110) : {reg120})) ?
                           reg119[(1'h0):(1'h0)] : (reg119[(3'h6):(3'h4)] ?
                               ((+reg119) ?
                                   ((8'ha4) ?
                                       wire114 : wire110) : $unsigned(wire116)) : {(-wire112),
                                   wire106})));
  assign wire123 = ((^((^~wire112[(4'h9):(4'h9)]) >> wire110)) ?
                       reg118[(3'h5):(2'h3)] : wire110);
  assign wire124 = {$signed((+wire115)), wire115};
  always
    @(posedge clk) begin
      reg125 <= $signed($unsigned((8'hbb)));
      reg126 <= $signed((((^~$signed(wire110)) && $signed($unsigned(wire107))) && wire122[(1'h1):(1'h1)]));
      if (reg118[(5'h11):(5'h10)])
        begin
          reg127 <= {wire107[(2'h2):(2'h2)],
              ((((wire109 || wire112) - (^wire116)) & (~wire109)) ?
                  ((((8'ha0) ? wire107 : wire124) ?
                          $signed(wire123) : (!wire123)) ?
                      $unsigned((^~wire111)) : (wire111 ?
                          {wire113} : (wire122 >> reg125))) : $unsigned(((reg117 ?
                          reg121 : reg126) ?
                      {wire105} : reg120[(4'hc):(2'h3)])))};
          reg128 <= (reg120 ?
              $signed((((~|reg126) && wire124) || reg125[(2'h2):(1'h0)])) : $signed(wire123[(2'h3):(1'h1)]));
          reg129 <= ((8'hbe) ^~ $unsigned(((wire106[(3'h6):(1'h0)] & wire116[(5'h15):(4'ha)]) ~^ $unsigned((~&wire110)))));
        end
      else
        begin
          if ($signed($unsigned(wire110[(2'h3):(1'h0)])))
            begin
              reg127 <= ({$signed(((~|wire112) > (wire108 < (8'ha7))))} >>> (^wire114[(2'h3):(2'h2)]));
              reg128 <= $signed(wire109[(5'h10):(3'h6)]);
              reg129 <= $signed((-wire111[(1'h0):(1'h0)]));
            end
          else
            begin
              reg127 <= $signed(reg117);
              reg128 <= $signed($unsigned(({(~&reg129),
                  $unsigned(reg125)} != $signed(wire124[(3'h7):(1'h0)]))));
              reg129 <= reg120;
              reg130 <= {reg120[(3'h7):(2'h3)], (8'hb4)};
            end
          reg131 <= wire108;
        end
      reg132 <= (($signed($unsigned((-(8'h9c)))) & {((~reg131) >>> $unsigned(wire105)),
          ((reg126 == wire114) > wire115[(2'h2):(1'h1)])}) ^ (^~reg120[(4'ha):(3'h6)]));
    end
  assign wire133 = ((8'hb5) < (|$unsigned(({reg129} ?
                       $signed(wire123) : $signed((8'hbf))))));
  assign wire134 = wire110;
  assign wire135 = (($signed((8'hb5)) ?
                           $signed(reg126) : ((&(~^reg132)) ?
                               $signed($signed(wire105)) : (^wire133))) ?
                       (^$unsigned(($unsigned(reg125) <= $unsigned(reg128)))) : (!$unsigned((!(wire107 ?
                           (8'hb8) : reg127)))));
  assign wire136 = $signed(wire135[(2'h3):(1'h0)]);
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire94;
  input wire signed [(4'hc):(1'h0)] wire93;
  input wire [(4'ha):(1'h0)] wire92;
  input wire signed [(5'h12):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  assign y = {wire101, wire100, wire99, wire98, wire97, wire96, wire95, (1'h0)};
  assign wire95 = $unsigned(wire92[(4'ha):(1'h1)]);
  assign wire96 = $unsigned(wire91);
  assign wire97 = (wire91[(5'h10):(4'h9)] << ($unsigned(($unsigned(wire95) ?
                      $signed(wire93) : (^wire96))) <<< (+(-$unsigned(wire91)))));
  assign wire98 = $unsigned($unsigned(wire94[(3'h5):(3'h4)]));
  assign wire99 = wire91;
  assign wire100 = $signed((~&(-(((8'hba) | wire97) ?
                       $signed(wire91) : (wire94 != wire93)))));
  assign wire101 = $unsigned($unsigned((~|wire96[(4'hc):(2'h3)])));
endmodule

module module62
#(parameter param85 = (|((+((^(8'hbe)) ~^ (8'hbe))) ? ((((8'had) ^ (8'ha0)) ? (-(7'h41)) : {(8'hb7), (8'hb4)}) ? (((8'hba) ? (8'ha3) : (8'ha9)) > (~^(8'ha6))) : (7'h44)) : {((!(7'h43)) < (!(8'ha5)))})), 
parameter param86 = ((param85 ~^ (^{(param85 << param85), {(7'h42)}})) ? param85 : (+((~{param85}) >>> (param85 ? (~^param85) : param85)))))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'hd7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire66;
  input wire [(3'h7):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  input wire [(5'h14):(1'h0)] wire63;
  wire [(4'h9):(1'h0)] wire84;
  wire [(3'h5):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
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
                 (1'h0)};
  assign wire67 = wire65[(3'h5):(1'h0)];
  assign wire68 = {wire65,
                      ($signed($unsigned({wire67,
                          wire67})) && (^$signed(wire67[(4'h8):(1'h1)])))};
  assign wire69 = wire63[(4'hb):(3'h6)];
  assign wire70 = wire67[(1'h1):(1'h0)];
  assign wire71 = wire64[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg72 <= wire69[(4'hc):(4'h9)];
      if ($signed((wire64[(3'h6):(3'h5)] ?
          $unsigned((wire70 ?
              (~&(8'ha7)) : $unsigned(wire69))) : $signed((~^$signed(wire63))))))
        begin
          if (((wire67 ? (~|wire66[(1'h0):(1'h0)]) : $signed(reg72)) ?
              ($signed(wire71[(4'ha):(1'h1)]) >> $unsigned((^~$signed(wire69)))) : (&((~&$unsigned((8'hb8))) << $unsigned($signed(wire65))))))
            begin
              reg73 <= ((|(wire70[(1'h0):(1'h0)] ?
                  $signed(reg72[(1'h0):(1'h0)]) : wire67)) >>> (&{(+(wire67 <= (8'ha0))),
                  ($unsigned(wire68) ? $signed(wire66) : wire64)}));
              reg74 <= $signed(wire67[(1'h1):(1'h0)]);
            end
          else
            begin
              reg73 <= reg72[(2'h2):(1'h1)];
              reg74 <= $signed({$unsigned((|(-(8'haa)))),
                  $unsigned(((-reg73) ? (wire68 ? wire66 : wire65) : wire71))});
              reg75 <= $unsigned((reg72[(2'h3):(2'h2)] ?
                  $unsigned($unsigned($signed(wire71))) : $signed(($signed(wire69) << wire66[(3'h7):(3'h4)]))));
              reg76 <= wire71;
            end
          if (((wire64 <<< ((^((8'ha4) <= (8'hbd))) ?
                  ({wire68} ? reg75 : wire67) : wire67)) ?
              $signed({wire63[(2'h3):(1'h1)]}) : ((~^wire66[(5'h10):(4'hf)]) && (($signed(reg73) * (reg75 < wire69)) > reg75))))
            begin
              reg77 <= (wire63 >> ((8'haa) ?
                  (^~wire66[(2'h2):(1'h1)]) : (~^({wire68} >= $unsigned(wire64)))));
              reg78 <= ((reg75[(3'h4):(3'h4)] ?
                      wire66 : (reg75 & ((^wire67) != (reg73 ?
                          reg76 : (8'ha0))))) ?
                  reg73[(2'h2):(1'h0)] : wire68);
              reg79 <= ($unsigned(($unsigned(wire70) ?
                  $unsigned(reg78[(5'h12):(2'h2)]) : $unsigned({reg76,
                      reg74}))) ^~ (+$unsigned($signed(wire69[(2'h2):(2'h2)]))));
              reg80 <= (~^$unsigned((wire67 ? reg72 : $unsigned({wire65}))));
              reg81 <= wire71;
            end
          else
            begin
              reg77 <= $unsigned(wire67[(4'h8):(3'h5)]);
              reg78 <= $unsigned((~&$signed((reg75[(4'hd):(4'hc)] == reg81[(2'h3):(1'h1)]))));
              reg79 <= wire64;
              reg80 <= reg73[(2'h2):(1'h0)];
              reg81 <= reg77;
            end
        end
      else
        begin
          reg73 <= (^~(^~$unsigned(({(8'haf), reg76} ? (^~reg80) : wire64))));
          if (((^$signed(($unsigned(reg73) ^~ wire67[(3'h7):(1'h1)]))) >>> (~^$unsigned(reg73))))
            begin
              reg74 <= (|{$unsigned($unsigned({reg76, reg78}))});
              reg75 <= (!{($signed((|wire65)) ?
                      reg78 : $unsigned($unsigned((8'h9c))))});
              reg76 <= {{(($signed(reg75) ?
                          (reg73 || reg73) : (~|(8'haf))) || wire67[(2'h3):(2'h3)]),
                      $signed(wire68[(4'hd):(3'h5)])},
                  ($signed(((~wire71) >>> wire70[(4'h8):(3'h7)])) == reg72)};
            end
          else
            begin
              reg74 <= wire65[(3'h6):(3'h5)];
            end
        end
      reg82 <= $signed((~|(|($signed(wire65) ?
          ((8'hba) ? reg74 : (7'h44)) : $unsigned(reg76)))));
    end
  assign wire83 = {reg79};
  assign wire84 = wire64[(3'h6):(2'h2)];
endmodule

module module41
#(parameter param57 = (8'haa), 
parameter param58 = (8'ha7))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire45;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire signed [(4'hd):(1'h0)] wire43;
  input wire [(4'hd):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire46 = $unsigned((~|{wire42[(2'h2):(1'h0)],
                      $signed((wire42 == wire44))}));
  assign wire47 = wire43[(4'h9):(3'h4)];
  assign wire48 = {(wire43[(1'h0):(1'h0)] | wire46),
                      {($signed((wire45 <= wire46)) >> $signed((~&(8'ha5)))),
                          (wire44[(1'h0):(1'h0)] < wire42)}};
  assign wire49 = wire43[(2'h3):(2'h3)];
  assign wire50 = (wire42[(4'hc):(2'h3)] ?
                      ($unsigned((^wire42[(3'h6):(3'h4)])) & ((^(wire43 <<< wire47)) ?
                          ($signed(wire48) ?
                              (-wire44) : $signed(wire49)) : $unsigned(((8'hae) * wire43)))) : $signed((wire42[(4'hc):(3'h6)] ?
                          (wire44 ?
                              $unsigned(wire47) : $signed(wire48)) : $signed(wire49[(4'hd):(2'h2)]))));
  assign wire51 = (&$unsigned((^~$unsigned((wire48 ^ wire45)))));
  always
    @(posedge clk) begin
      reg52 <= $unsigned({(~($unsigned(wire46) ?
              (wire46 >= wire49) : {wire50, wire47})),
          ((^(wire50 ?
              wire44 : (8'ha7))) ~^ ((~|wire47) >> wire49[(3'h7):(2'h3)]))});
      reg53 <= $signed((((^~wire42[(3'h6):(3'h4)]) ?
          wire49[(4'hf):(1'h1)] : (8'hb8)) && wire44[(2'h2):(2'h2)]));
      reg54 <= ({wire50, wire46[(1'h0):(1'h0)]} ~^ wire42[(3'h7):(3'h6)]);
      reg55 <= {wire46[(4'h8):(3'h7)]};
      reg56 <= $signed(wire42[(4'hd):(3'h4)]);
    end
endmodule
