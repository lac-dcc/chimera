module top
#(parameter param162 = (({({(8'hab), (8'ha1)} ? ((8'hb7) ? (7'h42) : (8'ha7)) : ((8'hb5) < (8'hbf))), (((8'h9c) ? (8'h9d) : (8'h9c)) << ((8'ha7) << (8'ha6)))} ? (&((~&(8'h9d)) ? ((8'hb1) ? (8'hab) : (8'hb5)) : ((7'h43) ? (8'ha8) : (8'hb8)))) : {(+((8'hb1) >= (8'hbf)))}) ? {(!(~&((8'haa) ? (8'had) : (8'hab)))), ((&{(8'haf), (8'ha7)}) >> (8'ha7))} : (&(-(((8'hab) << (7'h40)) ? {(8'ha0)} : ((8'hb1) ? (8'hb4) : (8'ha9)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire155;
  wire signed [(4'h8):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire153;
  wire [(5'h13):(1'h0)] wire152;
  wire [(2'h3):(1'h0)] wire151;
  wire [(4'hb):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire134;
  wire signed [(4'hd):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire158;
  wire signed [(4'hc):(1'h0)] wire159;
  wire [(5'h14):(1'h0)] wire160;
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  assign y = {wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire4,
                 wire41,
                 wire43,
                 wire45,
                 wire48,
                 wire134,
                 wire136,
                 wire148,
                 wire157,
                 wire158,
                 wire159,
                 wire160,
                 reg47,
                 reg46,
                 reg44,
                 (1'h0)};
  assign wire4 = (((|(wire1[(3'h6):(3'h4)] >>> (wire0 ?
                     wire3 : wire0))) ~^ (($unsigned(wire1) ?
                     (!wire1) : wire1[(3'h6):(1'h1)]) & (~&(wire0 ?
                     wire3 : wire0)))) * $signed($signed($signed((wire0 - wire3)))));
  module5 #() modinst42 (wire41, clk, wire0, wire2, wire1, wire3);
  assign wire43 = (+((wire0 ? wire41[(4'ha):(4'h8)] : (!{(8'hae), wire41})) ?
                      wire3 : wire4));
  always
    @(posedge clk) begin
      reg44 <= (^(^$signed((!((8'haf) > wire2)))));
    end
  assign wire45 = ((wire3 ?
                          ({wire0[(5'h10):(2'h2)]} != {wire43}) : {(&(~|(8'h9d))),
                              (8'hab)}) ?
                      {wire0[(5'h10):(4'he)],
                          $unsigned((^$unsigned(wire3)))} : wire43[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg46 <= {$unsigned(reg44)};
      reg47 <= ({((^~wire1) <<< wire2[(3'h4):(1'h1)]), reg44} == ((~wire4) ?
          $signed(($unsigned(wire1) == (wire4 ?
              reg44 : wire1))) : (((8'hbb) | {(8'hae)}) ?
              (wire1[(2'h3):(1'h0)] < $unsigned(reg44)) : wire43)));
    end
  assign wire48 = wire2[(4'ha):(4'h9)];
  module49 #() modinst135 (.clk(clk), .wire54(wire4), .wire52(wire2), .wire50(wire48), .y(wire134), .wire53(reg47), .wire51(wire43));
  assign wire136 = wire45[(2'h3):(1'h0)];
  module137 #() modinst149 (.wire141(wire0), .clk(clk), .y(wire148), .wire139(wire1), .wire140(reg47), .wire138(wire48));
  assign wire150 = {reg44[(2'h3):(2'h3)]};
  assign wire151 = wire2;
  assign wire152 = {wire2[(2'h3):(2'h3)]};
  assign wire153 = wire151;
  assign wire154 = {{reg47[(1'h1):(1'h1)]}, wire150[(3'h4):(1'h1)]};
  module60 #() modinst156 (wire155, clk, wire152, wire134, wire150, wire2, wire136);
  assign wire157 = ($unsigned($unsigned(({reg46} ^~ {wire45,
                       wire1}))) > $unsigned({((^~wire2) >> (|wire153))}));
  assign wire158 = wire148;
  assign wire159 = (+(wire136[(4'hb):(2'h2)] ^ $signed(wire48[(4'hd):(1'h0)])));
  module49 #() modinst161 (.wire53(wire152), .wire51(wire0), .wire52(wire48), .wire54(wire43), .clk(clk), .wire50(wire3), .y(wire160));
endmodule

module module137
#(parameter param146 = ((({((8'h9d) <<< (8'hb0))} ? {((8'ha5) && (8'hbe))} : (-((8'ha4) ^~ (8'ha0)))) ? (|{(~|(8'h9f))}) : (&(((8'ha2) ? (8'ha3) : (8'hb8)) - (~(8'hbe))))) | (~^(({(8'hae)} >> (-(8'h9e))) ? (|((8'ha0) ? (8'hbb) : (8'hb6))) : {((8'ha1) <= (8'ha2)), (+(8'ha1))}))), 
parameter param147 = param146)
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire141;
  input wire signed [(3'h4):(1'h0)] wire140;
  input wire signed [(5'h15):(1'h0)] wire139;
  input wire [(4'hd):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire145;
  wire signed [(4'ha):(1'h0)] wire144;
  wire signed [(5'h12):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire142;
  assign y = {wire145, wire144, wire143, wire142, (1'h0)};
  assign wire142 = ((!$unsigned((wire141[(3'h5):(1'h1)] ?
                           wire141 : wire138[(1'h1):(1'h0)]))) ?
                       (&$signed((!((8'hac) ?
                           wire139 : wire138)))) : (wire140[(1'h1):(1'h1)] != wire139));
  assign wire143 = $signed(wire139[(2'h3):(1'h1)]);
  assign wire144 = ($signed(wire141[(5'h12):(4'h8)]) ?
                       wire143[(1'h1):(1'h1)] : wire139[(5'h11):(3'h5)]);
  assign wire145 = (!((^~$signed($signed((8'hb7)))) ?
                       $signed(((wire142 ?
                           (8'hbf) : wire142) ^~ $unsigned(wire139))) : {$signed((~&wire144))}));
endmodule

module module49  (y, clk, wire50, wire51, wire52, wire53, wire54);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire50;
  input wire signed [(4'hf):(1'h0)] wire51;
  input wire signed [(4'hd):(1'h0)] wire52;
  input wire [(5'h13):(1'h0)] wire53;
  input wire [(4'he):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(4'h9):(1'h0)] wire131;
  wire [(4'hd):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire92;
  assign y = {wire133,
                 wire131,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire92,
                 (1'h0)};
  assign wire55 = $signed($signed((wire53[(5'h11):(4'ha)] + (&(!wire51)))));
  assign wire56 = $unsigned((((wire55[(1'h0):(1'h0)] <<< (wire55 ?
                          wire53 : wire53)) <<< $unsigned($unsigned((8'hb8)))) ?
                      $signed(($unsigned(wire53) ?
                          wire54[(3'h4):(2'h3)] : wire54)) : $signed(((&wire55) < (wire55 > wire55)))));
  assign wire57 = $signed($unsigned({(-wire50)}));
  assign wire58 = wire57;
  assign wire59 = wire55[(1'h1):(1'h0)];
  module60 #() modinst93 (wire92, clk, wire53, wire59, wire50, wire56, wire58);
  assign wire94 = ((~^($unsigned($unsigned((8'h9e))) ?
                      wire50[(3'h6):(2'h3)] : $unsigned($signed(wire56)))) <<< ({wire59[(1'h1):(1'h0)],
                          {((8'had) >= wire92), $signed(wire52)}} ?
                      {(wire55 && $unsigned(wire52)),
                          (wire54 > (~^wire58))} : $signed((wire51[(1'h1):(1'h0)] >>> (wire53 ?
                          wire50 : (8'ha3))))));
  assign wire95 = ((wire59[(3'h6):(1'h1)] ?
                          $unsigned({$signed(wire56)}) : wire92) ?
                      wire52[(3'h6):(1'h0)] : (|$unsigned(wire57)));
  assign wire96 = (wire95[(1'h0):(1'h0)] >= wire52);
  assign wire97 = wire94[(3'h6):(3'h5)];
  module98 #() modinst132 (wire131, clk, wire51, wire52, wire92, wire96);
  assign wire133 = wire92;
endmodule

module module5
#(parameter param39 = (({(((7'h43) ? (8'ha0) : (8'hab)) ^ (8'hbb)), ((!(7'h43)) ? ((8'hb0) ? (8'h9d) : (8'ha2)) : (^(8'hac)))} * ((((8'hb2) ? (8'hb6) : (8'ha9)) >= ((8'hbd) ? (8'hb6) : (8'ha2))) * ((!(7'h40)) ? (~&(7'h40)) : (~^(8'hb4))))) ? {(&(~&(+(8'h9e))))} : {(8'hb8), (((!(8'ha2)) >= ((7'h42) ? (8'hb3) : (8'ha4))) ? (&(!(8'hbc))) : {{(8'hae), (8'hab)}})}), 
parameter param40 = (-param39))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned($signed(wire7[(2'h3):(2'h3)])) ?
          ($signed(((wire9 || (7'h41)) ?
              $signed(wire9) : {wire8, (8'h9f)})) > (wire6 <<< ((!wire7) ?
              (!wire8) : ((7'h41) ? wire6 : wire6)))) : ((($signed(wire6) ?
                      (wire6 - (8'ha1)) : wire6) ?
                  ((&wire8) ?
                      wire6[(1'h0):(1'h0)] : (wire9 * (8'hbd))) : (+wire6[(3'h7):(3'h4)])) ?
              ({wire9, (wire7 ? wire6 : wire6)} ?
                  wire6[(3'h7):(2'h2)] : $unsigned(((8'haa) ?
                      wire7 : wire6))) : wire6[(4'hb):(3'h4)])))
        begin
          reg10 <= {wire7[(2'h3):(2'h2)]};
        end
      else
        begin
          reg10 <= $signed({$unsigned(wire6[(4'hb):(4'h8)]),
              $signed({wire6, $unsigned(wire8)})});
        end
      if (((-$signed((~reg10[(4'h9):(1'h0)]))) <<< $signed((wire9 == $signed($signed(wire8))))))
        begin
          reg11 <= (~&(^~($signed($signed(wire7)) ?
              reg10[(3'h6):(1'h0)] : (!(reg10 ? wire6 : wire6)))));
          reg12 <= wire7;
          if ({($unsigned(($signed(reg10) < (reg12 ?
                  reg12 : wire6))) + $unsigned((~|$unsigned(wire9)))),
              (reg12[(1'h1):(1'h0)] * (8'hb8))})
            begin
              reg13 <= (~|$signed($unsigned(wire7[(3'h4):(2'h2)])));
              reg14 <= $signed(reg12[(3'h5):(1'h0)]);
            end
          else
            begin
              reg13 <= ($unsigned($signed(((wire6 ? (7'h41) : reg11) ?
                      (reg14 - wire8) : reg10[(1'h1):(1'h0)]))) ?
                  (^~{$unsigned($unsigned(reg11))}) : $unsigned(wire9[(2'h2):(1'h1)]));
              reg14 <= $signed(((~|reg14) ?
                  $signed($unsigned($unsigned((8'hb1)))) : ($unsigned(reg10) ?
                      $unsigned((reg11 << reg11)) : ((|reg11) & (-reg13)))));
              reg15 <= $signed($unsigned(reg11));
            end
          if (({(~&((8'ha7) ?
                  $signed(reg15) : $signed(wire9)))} <= $signed($unsigned({reg11[(3'h4):(3'h4)]}))))
            begin
              reg16 <= ($unsigned(($unsigned(wire6[(3'h4):(2'h2)]) ?
                  (wire8 & wire8) : $signed((reg14 ?
                      reg15 : reg11)))) | (^~$signed({(reg12 ?
                      (8'hbb) : reg15)})));
              reg17 <= {(wire6[(3'h5):(1'h1)] <<< reg12),
                  $unsigned(((~&(-(8'ha3))) * (~^{reg14, wire6})))};
            end
          else
            begin
              reg16 <= ((reg10 ?
                      ((|$signed(wire8)) ?
                          (~^reg17[(3'h5):(3'h4)]) : (8'hbe)) : ({((8'haa) ?
                                  reg13 : (8'h9e)),
                              (reg17 ? (8'hb9) : reg15)} ?
                          (!(~|reg14)) : $signed($signed(reg16)))) ?
                  (~^reg16[(1'h0):(1'h0)]) : wire8[(3'h4):(1'h1)]);
              reg17 <= {reg12};
              reg18 <= reg11[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg11 <= reg11[(3'h4):(3'h4)];
          reg12 <= reg16;
          reg13 <= reg15;
          if ($signed((($signed(wire8[(2'h2):(2'h2)]) ?
                  $signed($unsigned(reg12)) : reg16) ?
              reg11 : reg13[(3'h4):(3'h4)])))
            begin
              reg14 <= $unsigned(reg18[(1'h0):(1'h0)]);
            end
          else
            begin
              reg14 <= reg14[(3'h5):(1'h1)];
              reg15 <= ((+$unsigned($unsigned(wire7[(2'h3):(2'h3)]))) ?
                  reg12 : (({$signed(wire8)} ^~ $signed($unsigned(reg10))) <= ((((7'h43) | reg12) ?
                          (+reg11) : (reg16 >= reg14)) ?
                      $signed($signed(wire6)) : (reg17[(3'h4):(3'h4)] ?
                          reg10 : wire6))));
              reg16 <= wire8[(3'h6):(2'h3)];
            end
        end
      reg19 <= (reg12[(3'h4):(2'h2)] & (&wire6));
      if (($unsigned((^reg12)) == $signed(((+{reg10,
          (8'h9c)}) | (|wire7[(1'h0):(1'h0)])))))
        begin
          if ((reg15[(4'ha):(4'h9)] ^ reg17))
            begin
              reg20 <= (({(reg14[(5'h13):(4'h9)] ?
                              $signed(wire9) : (^(8'hb3)))} ?
                      (wire8 ?
                          wire7 : $unsigned(wire7[(1'h1):(1'h1)])) : $unsigned((wire7 ?
                          (reg18 ? reg18 : reg17) : reg10[(4'hc):(4'hb)]))) ?
                  (reg14 ^ reg10) : wire9[(4'h8):(1'h1)]);
            end
          else
            begin
              reg20 <= $signed((^~(-(8'hbf))));
              reg21 <= {$unsigned(($unsigned((reg20 ?
                      reg18 : reg13)) || $signed(wire8)))};
              reg22 <= $unsigned($unsigned(reg12[(1'h0):(1'h0)]));
              reg23 <= ((~(|($unsigned(wire9) >> (-reg16)))) > $unsigned(($unsigned((8'h9d)) >>> wire6)));
            end
          reg24 <= $unsigned($unsigned($signed($signed((reg20 >>> reg20)))));
        end
      else
        begin
          if ((^~(8'ha1)))
            begin
              reg20 <= reg18;
            end
          else
            begin
              reg20 <= ($unsigned(reg12) ?
                  reg22 : $signed({{(!reg12), (&(8'ha9))}}));
              reg21 <= $signed((reg14 ^~ {$unsigned((^(8'hae)))}));
              reg22 <= $unsigned(((~(reg16[(1'h0):(1'h0)] >= reg11)) + (reg13 ?
                  (((7'h43) ? reg15 : reg11) && (reg22 ?
                      reg16 : wire9)) : (~|(|reg15)))));
              reg23 <= {(~^((((8'hb6) ^~ (8'ha5)) + reg11[(1'h0):(1'h0)]) + (~&reg19[(1'h1):(1'h1)])))};
            end
          reg24 <= (($signed($signed($unsigned(reg15))) ?
              {reg22,
                  ((reg15 <= reg21) < $signed(reg16))} : (8'hb4)) <<< (~$unsigned(reg17[(3'h4):(2'h2)])));
          if (reg17)
            begin
              reg25 <= reg18[(4'hd):(4'h8)];
            end
          else
            begin
              reg25 <= (&(-$unsigned((&reg23[(3'h4):(2'h3)]))));
              reg26 <= reg18[(3'h7):(3'h7)];
            end
        end
      if ((wire9 ?
          (+$unsigned(((wire6 ? wire9 : reg20) ?
              $unsigned(reg15) : $signed(reg21)))) : ($unsigned($unsigned($unsigned(reg12))) ?
              $unsigned({reg26}) : $unsigned(reg20[(3'h6):(3'h6)]))))
        begin
          reg27 <= reg21[(3'h7):(2'h2)];
        end
      else
        begin
          if ({{$unsigned((+(reg26 ? (8'hb1) : wire7)))}, reg17[(1'h0):(1'h0)]})
            begin
              reg27 <= reg15[(3'h7):(2'h3)];
              reg28 <= $signed((+$signed(((^wire8) << (reg25 ?
                  reg25 : reg23)))));
              reg29 <= wire8[(3'h5):(1'h0)];
              reg30 <= $signed((^~(^~wire7)));
            end
          else
            begin
              reg27 <= $unsigned($signed(reg18[(4'ha):(3'h4)]));
              reg28 <= ((reg15 <<< (+(((8'hbe) >> reg22) ?
                  $signed(reg30) : reg25[(1'h1):(1'h0)]))) == (reg19 ?
                  $unsigned($unsigned(reg24[(4'he):(4'ha)])) : $unsigned(((reg19 + reg20) | $unsigned(reg10)))));
              reg29 <= wire6[(3'h4):(1'h0)];
            end
          reg31 <= (-($signed($signed(reg27[(2'h2):(1'h1)])) ?
              $signed((~|reg16[(3'h6):(3'h6)])) : (~|(^reg27))));
          reg32 <= {reg30};
        end
    end
  assign wire33 = $signed((($signed((8'ha1)) - {reg23[(3'h5):(1'h0)]}) ?
                      reg20 : (8'hbe)));
  assign wire34 = wire6;
  assign wire35 = ((|(reg18 ?
                      (~|$signed(wire34)) : $signed($unsigned(wire8)))) | (+(^reg14)));
  assign wire36 = (-(reg25 ?
                      (~&reg24[(4'hd):(3'h4)]) : $signed(($signed((8'ha9)) & reg21))));
  assign wire37 = $signed(($unsigned({(^~reg13), $signed(wire36)}) ?
                      {(^~wire7)} : reg10));
  assign wire38 = ($signed((($unsigned((8'haf)) ?
                          wire36[(1'h0):(1'h0)] : $signed(reg15)) << {$signed(wire33),
                          (wire33 ? wire9 : reg24)})) ?
                      $signed({{(reg18 ? wire9 : wire6), reg15[(3'h5):(2'h2)]},
                          ((reg24 < wire34) || reg23)}) : reg20);
endmodule

module module98  (y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire102;
  input wire [(4'hc):(1'h0)] wire101;
  input wire signed [(2'h2):(1'h0)] wire100;
  input wire signed [(5'h10):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire130;
  wire [(4'hf):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(5'h12):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  assign y = {wire130,
                 wire110,
                 wire109,
                 wire105,
                 wire104,
                 wire103,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire103 = $unsigned(((-{(wire102 ? wire101 : wire102),
                           $unsigned(wire99)}) ?
                       (^$signed((wire99 ?
                           wire100 : wire101))) : wire102[(4'he):(4'h8)]));
  assign wire104 = $unsigned($signed(wire99));
  assign wire105 = $unsigned((~|(~&$unsigned(((7'h43) ? (8'hb7) : wire99)))));
  always
    @(posedge clk) begin
      reg106 <= wire105[(3'h6):(1'h1)];
      reg107 <= wire99;
      reg108 <= $unsigned(wire99[(4'h8):(3'h5)]);
    end
  assign wire109 = wire102;
  assign wire110 = $signed((8'hb1));
  always
    @(posedge clk) begin
      if ((8'hb8))
        begin
          reg111 <= ($signed($signed($unsigned($signed(reg107)))) - wire99[(4'hb):(3'h5)]);
          if (wire101)
            begin
              reg112 <= ((wire99[(4'h9):(3'h4)] ?
                  reg106[(2'h2):(1'h1)] : (reg107 ?
                      (|$unsigned(wire104)) : reg108[(4'h8):(4'h8)])) * (reg107 ?
                  (-(((8'h9c) != wire104) != $unsigned(wire102))) : $unsigned(({(8'hbf)} - wire101[(3'h7):(3'h4)]))));
              reg113 <= (((^~((8'hbd) ? reg111 : {wire103})) ?
                      $signed({$signed(reg108),
                          wire110}) : wire102[(4'h8):(1'h0)]) ?
                  wire101[(2'h3):(2'h3)] : reg111);
              reg114 <= wire99[(1'h1):(1'h1)];
              reg115 <= (~&reg111[(2'h3):(1'h1)]);
              reg116 <= $signed($unsigned($unsigned((&(-wire109)))));
            end
          else
            begin
              reg112 <= $signed($signed($signed(reg113)));
              reg113 <= (wire101 >> (($unsigned((wire109 ?
                  reg113 : wire101)) == ({reg114} ?
                  wire102 : ((8'hab) ?
                      reg107 : (8'hbb)))) ^~ (^~wire101[(3'h4):(2'h2)])));
              reg114 <= $signed($unsigned(wire110));
              reg115 <= wire99;
              reg116 <= $unsigned($signed($unsigned(wire105[(1'h0):(1'h0)])));
            end
          reg117 <= (((~{wire102[(2'h3):(2'h2)], (-wire109)}) ?
                  wire103 : $signed(wire110[(4'h9):(2'h2)])) ?
              (~$signed(((|reg116) != (8'hbb)))) : (^(|reg107)));
        end
      else
        begin
          reg111 <= (^~((($unsigned(reg113) ^ wire100[(2'h2):(2'h2)]) + $signed(reg116)) + {reg106[(1'h1):(1'h1)],
              ((reg116 ^~ wire101) ? (~^reg106) : wire99)}));
          reg112 <= (~|((({reg112, (8'h9c)} ^ (wire101 ? wire105 : wire101)) ?
              ((wire110 >> (8'hab)) < (~^wire103)) : ((reg114 || wire101) > $signed(wire99))) ^~ ((&(|reg107)) | $unsigned((reg113 << wire104)))));
          reg113 <= (!{(~&{$unsigned(reg106)})});
          if (reg114)
            begin
              reg114 <= {$signed((|(~&(|(7'h44)))))};
              reg115 <= (^$unsigned(((!(reg112 ?
                  wire99 : reg115)) && (wire105[(1'h0):(1'h0)] - $signed(reg111)))));
              reg116 <= (~reg115);
              reg117 <= $signed(reg115[(1'h1):(1'h1)]);
              reg118 <= ({(((~&wire105) || wire104[(5'h10):(2'h3)]) ?
                      ((wire102 ? reg106 : wire104) ?
                          (8'hbe) : reg116) : ((~(8'h9c)) ^~ reg115)),
                  $unsigned($signed($signed(reg117)))} + $unsigned((^~$signed((wire101 ?
                  reg106 : (8'hbb))))));
            end
          else
            begin
              reg114 <= wire103[(2'h2):(1'h0)];
              reg115 <= wire110[(4'hb):(4'h9)];
            end
        end
      reg119 <= (($unsigned(reg115[(1'h1):(1'h1)]) ?
          ($unsigned($unsigned(wire105)) != (~|(reg115 && wire99))) : (reg115 ?
              wire99[(2'h3):(2'h2)] : $unsigned(reg111[(3'h7):(3'h4)]))) ^~ $unsigned((reg108 ?
          $signed(wire101) : $unsigned(reg106))));
      if (((~|((~|$signed(reg111)) << reg113)) ^~ wire101[(4'h9):(4'h9)]))
        begin
          if ((wire104[(4'ha):(4'ha)] ?
              $signed(((^~reg108) >= reg113[(4'hf):(2'h2)])) : $unsigned(wire102[(3'h4):(3'h4)])))
            begin
              reg120 <= reg116;
              reg121 <= wire104[(4'hf):(1'h1)];
              reg122 <= reg117[(3'h6):(2'h2)];
              reg123 <= reg106[(3'h5):(2'h2)];
              reg124 <= (|{($signed($unsigned(reg113)) ?
                      ($unsigned(reg113) ?
                          $signed(reg123) : (reg114 ?
                              wire101 : reg120)) : (reg123 ?
                          (!wire100) : $signed(wire102)))});
            end
          else
            begin
              reg120 <= $signed(wire109[(2'h3):(1'h0)]);
              reg121 <= (|$signed((|((8'hae) ? $unsigned(reg116) : (8'haf)))));
            end
          if ($signed($unsigned($signed(reg113[(3'h4):(2'h2)]))))
            begin
              reg125 <= $unsigned(($signed(((reg107 & wire102) ?
                      (wire102 > (8'ha7)) : reg120)) ?
                  $unsigned($unsigned((reg117 ?
                      reg123 : wire109))) : $unsigned($signed($signed(wire102)))));
              reg126 <= (7'h41);
              reg127 <= reg114;
              reg128 <= $signed($signed(((+reg115[(1'h0):(1'h0)]) ?
                  $signed($signed((8'h9f))) : (wire100 ?
                      $unsigned(wire109) : $unsigned(reg111)))));
              reg129 <= reg120[(1'h1):(1'h1)];
            end
          else
            begin
              reg125 <= reg118;
              reg126 <= (reg111 ?
                  reg119[(3'h4):(1'h0)] : ($unsigned(reg117) >> (^(reg129 ?
                      (reg122 && reg114) : wire101))));
            end
        end
      else
        begin
          if (reg120)
            begin
              reg120 <= ($signed($unsigned($signed($unsigned(reg119)))) ?
                  (reg126 & ((((8'ha6) < reg111) <<< {wire99}) ?
                      ($unsigned(reg123) ~^ reg112) : $signed($unsigned(wire101)))) : ((^reg116) >> wire99));
              reg121 <= ($signed($signed($signed($signed(reg107)))) & reg115);
              reg122 <= (&{reg114, $unsigned($unsigned($unsigned(reg111)))});
              reg123 <= wire103[(1'h1):(1'h0)];
            end
          else
            begin
              reg120 <= ((^(wire100[(1'h1):(1'h0)] ?
                  $signed($unsigned(reg113)) : $signed($signed(wire105)))) == {(+$signed($unsigned(reg126)))});
              reg121 <= $unsigned($unsigned(wire110));
              reg122 <= ({reg108[(4'hb):(3'h6)], (^~(~&$unsigned(reg107)))} ?
                  (~(!$signed((reg111 & reg106)))) : ((reg122 ?
                      wire103 : $signed((&(7'h44)))) >> {reg120[(4'h8):(4'h8)],
                      $signed({wire103, reg107})}));
            end
          reg124 <= {($signed($signed((reg115 == reg113))) >= (({reg126,
                      reg127} ?
                  (8'hb8) : wire110[(4'hc):(4'h8)]) != ($signed(reg107) <<< $signed(wire102))))};
          reg125 <= (~|$unsigned((reg112 >>> {(reg118 ? wire102 : reg118)})));
        end
    end
  assign wire130 = ($signed($unsigned($unsigned($unsigned(reg118)))) >> wire109[(3'h5):(1'h0)]);
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire65;
  input wire [(2'h3):(1'h0)] wire64;
  input wire [(4'hb):(1'h0)] wire63;
  input wire [(4'hd):(1'h0)] wire62;
  input wire [(4'hd):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
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
                 (1'h0)};
  assign wire66 = $signed(($unsigned(wire63) ? wire62 : wire65));
  assign wire67 = ((^wire66) ? (!(8'ha6)) : wire61);
  assign wire68 = wire63[(4'ha):(1'h1)];
  always
    @(posedge clk) begin
      reg69 <= (wire64 >= ((((wire65 ? wire63 : wire66) < wire65) ?
          (wire61[(4'hd):(3'h7)] >= $signed(wire66)) : (~|$unsigned(wire61))) < ($unsigned((|(8'ha9))) ?
          (~wire67[(4'ha):(1'h0)]) : {$signed(wire65)})));
      if (({((8'hbe) ? (!wire67) : wire68[(4'h9):(3'h5)]),
          {wire67[(4'h9):(4'h9)]}} + wire68[(3'h4):(1'h0)]))
        begin
          reg70 <= (^wire61);
          reg71 <= $unsigned($signed($unsigned((~&(wire67 ?
              wire64 : wire63)))));
          reg72 <= $signed(wire68[(3'h5):(2'h2)]);
        end
      else
        begin
          if ($unsigned($unsigned(reg72)))
            begin
              reg70 <= ((^$signed(reg71[(4'hf):(3'h7)])) ^~ ((~|wire66) && wire68[(2'h2):(1'h0)]));
              reg71 <= wire61;
              reg72 <= $unsigned($unsigned(wire65[(4'hc):(1'h1)]));
            end
          else
            begin
              reg70 <= $unsigned($signed($unsigned((7'h40))));
              reg71 <= {(($signed((&reg70)) ?
                      wire64 : wire61[(1'h1):(1'h1)]) >>> {wire62[(4'h9):(4'h9)],
                      $signed($unsigned(wire62))}),
                  ({{$signed((8'hbc)), ((8'hac) > wire68)},
                          $signed(wire63[(2'h2):(1'h0)])} ?
                      wire63 : reg71[(3'h6):(2'h3)])};
            end
          if (({(wire68 <<< reg72[(4'h9):(3'h6)])} - $signed((wire64 | $signed((8'haa))))))
            begin
              reg73 <= (reg72 + (~&($unsigned($signed(reg69)) ?
                  wire62 : (^~$signed(wire68)))));
              reg74 <= reg73;
              reg75 <= ((+($unsigned(wire61[(3'h4):(1'h0)]) ?
                  (+(wire64 ?
                      (8'ha4) : reg69)) : {wire63[(2'h3):(2'h2)]})) && $signed((&$unsigned($signed(reg73)))));
              reg76 <= wire63[(1'h1):(1'h0)];
            end
          else
            begin
              reg73 <= (~^$unsigned((($signed(wire67) ?
                  wire66[(2'h3):(2'h2)] : (wire62 ?
                      (8'h9c) : reg73)) | wire66)));
            end
          reg77 <= wire67;
          if (wire62[(4'h8):(3'h4)])
            begin
              reg78 <= (~|($unsigned(((wire63 == wire62) ?
                  (reg70 == wire67) : (~&wire65))) && reg77));
            end
          else
            begin
              reg78 <= (~|$signed((($unsigned((8'hb5)) ~^ $signed((8'hb7))) << (~|(reg73 <<< wire63)))));
              reg79 <= (({$signed(reg78),
                      ((reg69 & wire65) && (^~reg75))} ~^ wire67) ?
                  $unsigned((reg78 << (~^(8'haa)))) : wire63[(3'h4):(1'h0)]);
              reg80 <= reg71;
              reg81 <= (~((^~reg74) | (+wire66)));
              reg82 <= ({$unsigned(($unsigned(reg77) ?
                          $signed(wire67) : (reg79 ? reg78 : (8'hb8)))),
                      ({(wire65 ~^ reg72)} ?
                          $signed({reg77}) : reg71[(4'hb):(3'h6)])} ?
                  reg80[(2'h2):(2'h2)] : reg70[(2'h3):(1'h1)]);
            end
        end
      reg83 <= reg78;
      if (((^~$unsigned(reg75)) ?
          wire63[(3'h6):(2'h3)] : {reg74[(4'hb):(4'ha)]}))
        begin
          reg84 <= $unsigned((~$signed($unsigned(wire67))));
          reg85 <= $unsigned((^~({(reg82 == reg84),
              $signed(reg73)} ^~ reg83[(1'h1):(1'h0)])));
        end
      else
        begin
          reg84 <= ((((-(~&reg83)) | (+{(8'hb4), (8'hb3)})) ?
                  reg85[(2'h3):(1'h0)] : $signed((((8'hb2) || reg83) ?
                      ((8'hb1) && reg70) : reg84))) ?
              reg73 : (wire66[(3'h5):(1'h0)] ?
                  reg80 : $unsigned($unsigned(wire64))));
          if ((~&$unsigned($signed($signed($unsigned(reg75))))))
            begin
              reg85 <= ((-(~&((-wire68) << (reg80 >>> reg75)))) ?
                  ((-((reg74 & wire62) < (reg70 ?
                      reg82 : reg71))) ^~ ($signed((!reg85)) ~^ reg83)) : {reg70[(4'hf):(4'hc)]});
              reg86 <= (wire62 <= (|($signed($signed(wire66)) ^~ ((reg76 ^ wire65) ?
                  (wire61 ? wire61 : reg74) : $signed(reg81)))));
              reg87 <= (8'hbc);
              reg88 <= $unsigned($signed(($signed(reg70) ~^ (&(reg81 << wire67)))));
              reg89 <= ($unsigned($signed($unsigned((&reg77)))) >= $unsigned(({(reg85 ?
                      reg75 : reg70),
                  (8'hb1)} >> (((8'ha2) != wire67) == (-reg87)))));
            end
          else
            begin
              reg85 <= $unsigned((!$unsigned((((8'hb7) ^ wire66) ?
                  (reg76 <<< wire63) : (8'ha4)))));
              reg86 <= reg70;
              reg87 <= reg81;
            end
          reg90 <= (reg82 ?
              $signed(((~|reg80[(1'h1):(1'h0)]) ?
                  $unsigned(((8'had) ?
                      reg76 : wire63)) : reg79[(3'h7):(1'h1)])) : reg83[(3'h5):(2'h2)]);
          reg91 <= (~|$unsigned((((wire63 >> (8'hb6)) > {reg85, (7'h43)}) ?
              ((~^reg73) ~^ reg78) : wire62[(2'h2):(1'h0)])));
        end
    end
endmodule
