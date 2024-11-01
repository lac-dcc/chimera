module top
#(parameter param218 = (((&(&{(8'hb4), (8'ha1)})) ? (8'ha7) : (~&(((8'hbb) ? (8'ha7) : (8'hbd)) ? {(8'ha2)} : (&(8'ha7))))) ? ((8'ha8) ^~ ((((7'h40) ? (8'hb4) : (8'hb2)) * {(8'hb5), (8'haa)}) >>> (((8'hac) ? (8'hb0) : (8'hb1)) | ((8'h9f) ? (8'hac) : (8'ha2))))) : ((+((!(8'haf)) ? (~&(8'ha7)) : (~&(8'hb0)))) ? (~(((8'ha2) && (8'hb1)) == {(8'hb1), (7'h44)})) : (~^(^((8'hb4) >= (8'hb5)))))), 
parameter param219 = param218)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h223):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire216;
  wire [(5'h10):(1'h0)] wire179;
  wire signed [(5'h13):(1'h0)] wire178;
  wire signed [(5'h10):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire119;
  wire [(5'h15):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire176;
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg135 = (1'h0);
  assign y = {wire216,
                 wire179,
                 wire178,
                 wire117,
                 wire20,
                 wire19,
                 wire119,
                 wire120,
                 wire136,
                 wire137,
                 wire138,
                 wire176,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg135,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (wire2 ? $signed(wire3[(2'h3):(1'h1)]) : wire3[(2'h2):(2'h2)]);
      if (wire0[(3'h7):(3'h7)])
        begin
          reg6 <= (reg5 <<< wire0[(5'h13):(3'h7)]);
          reg7 <= wire0[(3'h6):(2'h2)];
          reg8 <= $signed(wire1);
          reg9 <= $unsigned((($unsigned((wire2 > reg8)) ?
                  $unsigned(((7'h41) >>> wire1)) : ((^~reg6) ?
                      $signed(wire0) : (reg6 >> reg7))) ?
              $unsigned($signed(wire1[(3'h4):(2'h3)])) : wire3[(3'h5):(2'h3)]));
          if ({(wire0 ? wire1[(3'h5):(3'h5)] : reg9)})
            begin
              reg10 <= (^~$signed(((+wire3) ~^ ($unsigned(reg6) || wire3))));
              reg11 <= $signed($signed(reg10));
              reg12 <= {(($signed(((8'ha2) ? reg6 : reg10)) <<< ($signed(reg5) ?
                          $signed(reg7) : wire0[(3'h4):(2'h2)])) ?
                      $signed(reg11) : $signed({reg7}))};
              reg13 <= $signed($signed((^~((|reg8) ?
                  (reg7 | (8'hab)) : reg8[(3'h4):(1'h0)]))));
              reg14 <= wire0;
            end
          else
            begin
              reg10 <= ((&reg14) << wire3);
              reg11 <= wire0;
              reg12 <= ((wire1 | ((7'h40) <= $unsigned(wire4[(1'h1):(1'h1)]))) >= (($signed((reg8 ?
                      wire2 : reg6)) ~^ (wire1 | reg12[(3'h7):(1'h1)])) ?
                  $signed($signed((~|(8'had)))) : wire3[(1'h1):(1'h0)]));
              reg13 <= (reg6[(3'h7):(3'h4)] ?
                  (7'h40) : $signed($signed($unsigned((reg13 == reg7)))));
            end
        end
      else
        begin
          reg6 <= $unsigned((~(8'hbc)));
          reg7 <= ((|$signed(((~|reg14) ?
              $unsigned(reg12) : reg11[(3'h5):(3'h5)]))) | reg13[(2'h2):(2'h2)]);
          if ((~&wire0))
            begin
              reg8 <= ((~&wire0) ?
                  (wire4[(1'h0):(1'h0)] ?
                      (reg12 ?
                          ($unsigned(wire3) << reg8[(3'h6):(1'h0)]) : wire3[(3'h5):(2'h2)]) : (~((wire0 ?
                          (7'h43) : wire4) >> reg6[(5'h11):(5'h10)]))) : (~|wire0));
              reg9 <= reg9;
            end
          else
            begin
              reg8 <= $signed($signed((reg14 ?
                  wire2[(1'h1):(1'h1)] : (wire3 ~^ {reg10, wire2}))));
              reg9 <= $signed(((8'ha7) ?
                  reg14 : {$unsigned($unsigned(wire3)), $signed((!reg11))}));
              reg10 <= {$unsigned((+$unsigned((reg10 >>> reg5)))),
                  (reg8[(3'h4):(2'h2)] ?
                      ((wire2[(1'h1):(1'h1)] * $signed((8'ha2))) > wire1[(4'h8):(2'h3)]) : ($signed((reg9 ?
                          reg6 : wire2)) ~^ $unsigned($signed(reg6))))};
              reg11 <= wire3[(2'h2):(1'h1)];
            end
          if (($unsigned($unsigned($unsigned(wire1[(1'h0):(1'h0)]))) ?
              reg9[(3'h4):(3'h4)] : wire2[(4'ha):(1'h0)]))
            begin
              reg12 <= ($signed($signed(reg5[(2'h3):(2'h3)])) ?
                  (|{$signed(reg5[(2'h3):(2'h2)])}) : (wire3 ~^ (reg9[(3'h5):(3'h4)] & (reg13 ?
                      ((8'hb2) >= wire0) : $signed(wire1)))));
              reg13 <= {{$signed(($unsigned(wire1) ?
                          reg7 : reg14[(1'h0):(1'h0)])),
                      reg6[(4'ha):(3'h6)]}};
              reg14 <= (reg10 ?
                  $signed(($unsigned($signed(reg12)) + (wire4[(1'h0):(1'h0)] >>> {(8'hbf)}))) : reg5);
              reg15 <= (~$signed($signed((reg10[(3'h5):(2'h3)] ?
                  ((8'h9f) >> wire3) : $signed((8'hab))))));
            end
          else
            begin
              reg12 <= ((-$signed(reg5)) * $signed((wire4[(2'h2):(1'h1)] ?
                  ($unsigned(reg6) < {wire2}) : $unsigned((&reg10)))));
              reg13 <= wire1[(3'h6):(1'h1)];
              reg14 <= (-(~&(^~reg14)));
              reg15 <= (~(reg5[(2'h3):(2'h3)] ?
                  ((^{reg12}) <<< $unsigned({(8'ha2)})) : (reg11[(1'h0):(1'h0)] ?
                      $unsigned(reg8[(2'h2):(1'h0)]) : $signed((~^wire2)))));
            end
          reg16 <= reg9;
        end
      reg17 <= (reg9[(1'h1):(1'h0)] ? {$signed((8'hbe)), (-(8'ha6))} : wire0);
      reg18 <= ({(~&reg17[(3'h6):(1'h0)]), $unsigned(reg8)} ?
          (^~reg7) : ({reg10[(1'h1):(1'h0)]} ?
              ((reg14 != reg5) ?
                  (|$unsigned(wire4)) : ((^~reg7) - (reg10 ?
                      reg16 : wire4))) : reg13[(1'h1):(1'h1)]));
    end
  assign wire19 = (-({reg15} ~^ (|($unsigned((8'h9e)) * (wire4 ?
                      reg10 : reg10)))));
  assign wire20 = $unsigned(reg13);
  module21 #() modinst118 (.wire25(reg18), .wire26(reg13), .clk(clk), .y(wire117), .wire22(reg17), .wire24(wire19), .wire23(reg14));
  assign wire119 = ($unsigned($signed(($unsigned((8'h9c)) ?
                           (+reg11) : (reg9 ? (8'ha8) : wire20)))) ?
                       (~|$signed((!(^~(8'ha5))))) : reg15);
  assign wire120 = $signed(($signed(reg7[(4'hf):(3'h7)]) ?
                       wire3 : wire117[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      if (((-(wire119 ~^ $unsigned(reg16))) >= $signed($unsigned((&$signed(reg17))))))
        begin
          reg121 <= (((^~((reg17 > (8'hb5)) ?
                  reg8[(3'h6):(3'h4)] : (wire1 ? reg10 : reg7))) ?
              {(~&reg11[(3'h4):(2'h2)])} : $signed(((!wire2) ?
                  (reg6 ?
                      reg6 : (8'hbf)) : reg18))) & (!((8'hbe) & ($signed(wire4) & reg13))));
          reg122 <= ((~&{$signed((&reg14)),
              {(wire1 * wire3), (!reg16)}}) <<< $unsigned({($signed(reg13) ?
                  ((8'ha5) ? reg14 : reg18) : wire119[(3'h7):(3'h4)])}));
          reg123 <= (~reg7[(4'hb):(3'h7)]);
          reg124 <= ((({(reg123 * wire120)} >= ((-reg122) ?
                  (~&reg12) : {reg6, reg6})) || reg17) ?
              {wire119[(4'h9):(3'h6)], reg10} : reg15[(4'h9):(2'h2)]);
          reg125 <= (reg121[(5'h11):(1'h1)] <<< (&$unsigned(reg12[(2'h2):(1'h1)])));
        end
      else
        begin
          reg121 <= (~|reg6);
        end
      reg126 <= ($unsigned($unsigned({reg6,
          {wire0, (8'ha3)}})) < (^$signed($signed($signed(reg18)))));
      reg127 <= {(&reg14[(4'h9):(2'h2)]), {((~^$unsigned(wire120)) == wire4)}};
      if ($signed(wire0[(4'ha):(4'h8)]))
        begin
          reg128 <= ({(+reg6)} ?
              (!reg13) : ((({reg125,
                  wire120} == reg7) > reg8[(3'h4):(2'h3)]) ^~ {reg16[(2'h3):(2'h3)],
                  (-reg14)}));
          reg129 <= ((^$unsigned(reg11[(1'h0):(1'h0)])) <<< $signed($signed(reg12)));
          reg130 <= wire19[(4'he):(3'h7)];
        end
      else
        begin
          reg128 <= (reg11 ?
              (^$signed(((~|wire19) ?
                  reg125[(2'h2):(1'h0)] : (wire0 ?
                      reg125 : reg8)))) : (~^{{(&wire19), reg121}, reg128}));
        end
      if (reg11)
        begin
          reg131 <= (wire1[(2'h3):(1'h0)] ?
              {$unsigned((~|$signed((8'ha9))))} : (reg8[(3'h6):(1'h0)] | (($unsigned(reg130) ?
                  {wire4} : $unsigned(reg126)) < wire19)));
          if ($unsigned(((((wire0 ?
                  reg128 : reg17) != reg127[(3'h6):(2'h2)]) >> (+$unsigned(reg129))) ?
              $signed({wire19}) : $unsigned((|{reg11})))))
            begin
              reg132 <= (~^reg127[(3'h4):(2'h3)]);
              reg133 <= ($unsigned($unsigned(wire2)) <= reg132[(1'h0):(1'h0)]);
              reg134 <= {($signed($signed({wire117})) ? (8'hb3) : reg11),
                  $signed($signed($unsigned((reg12 > wire1))))};
              reg135 <= $unsigned({($signed($signed(reg124)) ?
                      ({wire3, wire0} ?
                          (reg13 >= (8'hab)) : $unsigned(reg130)) : (~^{wire117})),
                  ($unsigned((~reg121)) + $unsigned(((8'hbe) < wire117)))});
            end
          else
            begin
              reg132 <= $signed(reg12[(4'h8):(3'h6)]);
              reg133 <= ($unsigned($signed(reg6[(4'hb):(1'h0)])) != $unsigned(reg125));
              reg134 <= $signed(($signed($signed((reg6 << reg127))) ?
                  wire119 : $signed($unsigned($unsigned(reg129)))));
              reg135 <= (+$unsigned((8'hab)));
            end
        end
      else
        begin
          reg131 <= ($unsigned($unsigned($signed(reg135[(3'h6):(3'h4)]))) ?
              ((+$signed($unsigned(reg123))) ?
                  (^~((reg125 > wire117) <= $signed(reg131))) : reg9[(2'h3):(2'h2)]) : $unsigned(reg7));
          reg132 <= reg132[(2'h2):(2'h2)];
        end
    end
  assign wire136 = $unsigned((8'ha4));
  assign wire137 = $unsigned({(((reg132 ?
                               (8'hae) : reg122) != (reg122 <= wire4)) ?
                           (^~(reg12 ? reg130 : wire3)) : $signed({reg131}))});
  assign wire138 = $signed((($unsigned($unsigned(reg130)) && (-$signed((7'h41)))) >>> (({wire119,
                           reg7} >= (8'hbe)) ?
                       wire20[(3'h5):(3'h4)] : $unsigned(wire19[(4'ha):(1'h0)]))));
  module139 #() modinst177 (.wire141(reg127), .wire142(reg15), .clk(clk), .y(wire176), .wire140(reg17), .wire144(reg10), .wire143(wire4));
  assign wire178 = (reg8[(2'h2):(2'h2)] ?
                       ($unsigned({wire117[(2'h2):(2'h2)]}) | (~((reg121 ?
                               reg134 : wire117) ?
                           $signed(reg9) : {reg134,
                               wire138}))) : ((^$signed((~|reg6))) ?
                           (((^reg8) << $signed(wire1)) ?
                               reg17 : {reg6[(3'h4):(2'h3)]}) : ((reg135[(3'h7):(2'h2)] != (wire137 << wire136)) << ($unsigned(wire2) ?
                               ((7'h44) ^~ (8'hae)) : $unsigned(wire4)))));
  assign wire179 = {$signed((($unsigned(wire20) < (wire178 * reg10)) ?
                           wire4 : wire20[(1'h1):(1'h1)])),
                       wire137[(5'h10):(4'h8)]};
  module180 #() modinst217 (wire216, clk, wire176, wire137, wire117, reg134, wire4);
endmodule

module module180  (y, clk, wire185, wire184, wire183, wire182, wire181);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire185;
  input wire signed [(5'h11):(1'h0)] wire184;
  input wire signed [(5'h10):(1'h0)] wire183;
  input wire signed [(4'ha):(1'h0)] wire182;
  input wire [(4'h8):(1'h0)] wire181;
  wire [(3'h7):(1'h0)] wire215;
  wire signed [(4'he):(1'h0)] wire214;
  wire signed [(3'h5):(1'h0)] wire213;
  wire [(4'hc):(1'h0)] wire212;
  wire signed [(4'he):(1'h0)] wire211;
  wire signed [(5'h11):(1'h0)] wire209;
  wire [(4'he):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire188;
  wire [(4'hf):(1'h0)] wire187;
  wire signed [(5'h15):(1'h0)] wire186;
  assign y = {wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire209,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 (1'h0)};
  assign wire186 = wire181[(3'h7):(2'h2)];
  assign wire187 = $unsigned((wire186[(4'h9):(4'h8)] & (wire185 ?
                       $signed($unsigned(wire181)) : {wire186[(1'h1):(1'h0)]})));
  assign wire188 = $signed(((~$unsigned(wire181[(4'h8):(3'h4)])) & {((^~wire186) ?
                           $signed((8'hb8)) : wire187)}));
  assign wire189 = wire188[(2'h2):(1'h1)];
  module190 #() modinst210 (.clk(clk), .wire192(wire185), .y(wire209), .wire194(wire188), .wire193(wire182), .wire191(wire183));
  assign wire211 = (~$unsigned((~&wire189)));
  assign wire212 = ((~|wire209[(1'h1):(1'h0)]) >= $unsigned($unsigned(wire183[(2'h3):(1'h1)])));
  assign wire213 = $signed($unsigned($signed(wire211)));
  assign wire214 = (~{$signed($signed((wire209 ? wire182 : wire187)))});
  assign wire215 = $unsigned((~&$signed({wire182, $signed(wire183)})));
endmodule

module module139
#(parameter param175 = {(~(((~|(8'ha4)) ? {(8'hb8), (8'hbc)} : ((8'ha1) ? (8'haa) : (8'ha1))) ? (((8'hab) ? (7'h40) : (8'ha8)) ? ((8'ha4) || (8'hbb)) : ((8'hb4) ? (8'hbf) : (8'hbb))) : (((8'hb7) | (8'hb4)) & ((8'h9c) ? (8'hbe) : (7'h42))))), (((((7'h43) ~^ (8'ha8)) ? ((7'h42) ? (8'h9e) : (8'hb6)) : (!(7'h40))) & ({(8'haf), (7'h44)} ? ((8'ha8) ? (8'ha4) : (8'hb7)) : {(8'ha0)})) ? (~&(((8'hbf) | (8'hbd)) ? (|(8'h9c)) : ((8'hb5) ^~ (8'ha6)))) : (~|{((7'h40) >= (8'hae))}))})
(y, clk, wire144, wire143, wire142, wire141, wire140);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire144;
  input wire signed [(2'h3):(1'h0)] wire143;
  input wire signed [(5'h14):(1'h0)] wire142;
  input wire signed [(3'h6):(1'h0)] wire141;
  input wire [(4'ha):(1'h0)] wire140;
  wire signed [(3'h6):(1'h0)] wire174;
  wire signed [(3'h5):(1'h0)] wire173;
  wire signed [(3'h6):(1'h0)] wire172;
  wire [(5'h15):(1'h0)] wire171;
  wire signed [(4'hd):(1'h0)] wire169;
  wire [(3'h6):(1'h0)] wire145;
  assign y = {wire174, wire173, wire172, wire171, wire169, wire145, (1'h0)};
  assign wire145 = {$unsigned(wire140),
                       ((^wire141[(1'h1):(1'h1)]) | {wire142, wire140})};
  module146 #() modinst170 (wire169, clk, wire141, wire145, wire142, wire143);
  assign wire171 = (8'hb7);
  assign wire172 = wire144;
  assign wire173 = (wire169 != (7'h42));
  assign wire174 = $unsigned((({wire173, {wire172}} + ((~^(8'ha4)) ?
                           $signed((7'h40)) : {(8'h9e), wire171})) ?
                       $unsigned(($signed(wire140) <= wire144[(2'h2):(2'h2)])) : $unsigned(wire169[(4'hc):(3'h5)])));
endmodule

module module21  (y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'h217):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire22;
  input wire signed [(4'h9):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire113;
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire46,
                 wire47,
                 wire51,
                 wire52,
                 wire53,
                 wire113,
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
                 reg50,
                 reg49,
                 reg48,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg27 <= wire25;
      if ((!$unsigned($unsigned(wire22))))
        begin
          if ($signed((wire26 | wire23[(3'h4):(3'h4)])))
            begin
              reg28 <= wire25[(3'h4):(1'h1)];
            end
          else
            begin
              reg28 <= $signed(wire26);
              reg29 <= wire26;
              reg30 <= $unsigned({($signed((wire26 << reg28)) ?
                      reg29[(3'h7):(3'h7)] : $unsigned($unsigned(reg27))),
                  $unsigned(reg27)});
            end
        end
      else
        begin
          if ({$signed((((reg29 & wire26) ?
                  (reg30 <<< wire26) : $unsigned(reg29)) || $unsigned(reg30[(4'he):(4'h8)]))),
              ($unsigned(wire23[(3'h5):(3'h4)]) != $unsigned(((wire23 ^~ wire25) ?
                  $unsigned(wire22) : reg30[(3'h4):(2'h3)])))})
            begin
              reg28 <= reg28;
              reg29 <= wire23;
              reg30 <= reg27[(3'h5):(1'h0)];
              reg31 <= ((^wire26) ? wire26[(4'ha):(3'h5)] : reg30);
            end
          else
            begin
              reg28 <= (wire23[(3'h6):(2'h3)] != {$signed((!$unsigned(reg29)))});
              reg29 <= {(~{wire25[(3'h4):(2'h3)], (8'ha6)})};
              reg30 <= {$signed((~^wire23))};
              reg31 <= {$signed({wire22[(3'h4):(3'h4)]})};
            end
          reg32 <= wire24;
          reg33 <= $signed((wire24[(4'hd):(4'hb)] ?
              $signed((-$signed(reg32))) : {(~|reg29),
                  $unsigned($unsigned(wire24))}));
          if (reg28[(4'hc):(4'hc)])
            begin
              reg34 <= ($unsigned(($unsigned(reg28[(2'h2):(2'h2)]) ?
                  {(^~reg32),
                      (~wire22)} : reg31[(3'h7):(1'h1)])) != (wire25[(4'h8):(2'h2)] * $unsigned((-(!wire26)))));
              reg35 <= ((wire22[(5'h13):(4'hc)] ?
                      reg30 : (+$unsigned(reg31[(2'h3):(2'h3)]))) ?
                  reg32 : (wire24[(1'h0):(1'h0)] - $signed(wire24)));
              reg36 <= (!{((reg35[(4'he):(3'h4)] || (wire24 ?
                      reg35 : reg33)) <<< $signed($signed((8'hba)))),
                  (({(8'had), wire25} ?
                      (!reg29) : (8'hb2)) + ({reg32} | {wire23}))});
              reg37 <= $unsigned(wire25[(4'h8):(1'h1)]);
            end
          else
            begin
              reg34 <= (^(~|$unsigned(((wire25 != reg31) ^ $unsigned(wire26)))));
              reg35 <= (((reg27[(4'hc):(3'h4)] ^~ $unsigned(wire24[(4'hc):(2'h3)])) ?
                  ((&{reg34, reg27}) + $unsigned(((8'haa) ?
                      reg28 : reg28))) : $signed($unsigned($signed(wire25)))) >>> ({((reg36 ?
                              wire25 : reg27) ?
                          $unsigned((8'hbd)) : (wire22 ? reg35 : (8'hb9))),
                      wire26[(3'h5):(2'h2)]} ?
                  $unsigned($signed((!reg27))) : wire25[(5'h10):(5'h10)]));
              reg36 <= wire26[(4'hd):(1'h1)];
            end
        end
      if ((&((+$signed(reg35[(4'hb):(2'h3)])) ^~ $signed((+{reg34, wire25})))))
        begin
          reg38 <= ({((^~$signed(reg35)) & (~(reg30 || reg29)))} > reg29[(2'h2):(2'h2)]);
          reg39 <= reg31;
          reg40 <= (wire24[(4'he):(2'h3)] * {$signed({(~(8'h9e))}),
              {$unsigned((reg31 - reg38))}});
          reg41 <= (|reg36);
        end
      else
        begin
          if ($signed(((reg33 << ($unsigned(reg29) ?
                  (~&wire22) : $signed(reg38))) ?
              $signed(reg41) : $signed(reg41[(3'h6):(1'h0)]))))
            begin
              reg38 <= (((+wire23[(4'h8):(1'h1)]) ~^ reg40) ?
                  $signed(wire24[(1'h1):(1'h1)]) : ((reg36 << (reg27 ?
                          (&reg27) : $unsigned((8'haf)))) ?
                      ({wire22[(4'hc):(3'h4)]} ?
                          (((8'hb4) ?
                              (8'hb2) : reg31) * $signed(reg38)) : (^~{(8'ha8)})) : (($signed(reg40) | (wire23 ?
                              reg31 : reg39)) ?
                          reg36 : {(~^wire23)})));
              reg39 <= ((|reg31) ?
                  ((wire23 > (((8'hbd) >>> reg36) ?
                          $unsigned(reg27) : $unsigned(reg33))) ?
                      {$signed((reg31 ?
                              wire24 : reg35))} : ((wire23[(4'h8):(1'h1)] ?
                          {reg28} : {reg27,
                              reg38}) != (reg41 + (~reg36)))) : (wire25 - wire25));
              reg40 <= $signed({$signed(reg39[(1'h0):(1'h0)])});
            end
          else
            begin
              reg38 <= (+reg38);
              reg39 <= $signed($unsigned((((|reg36) - reg41) ?
                  wire24 : ($signed(reg29) < (~&wire26)))));
              reg40 <= {reg32[(2'h3):(1'h1)], $signed((8'hbe))};
              reg41 <= $signed((reg35 ? reg39[(3'h7):(1'h0)] : (8'hae)));
              reg42 <= (reg27[(1'h1):(1'h0)] <<< ($signed((reg31 ?
                      $signed(reg34) : {wire25, wire26})) ?
                  $signed(($unsigned(reg38) ?
                      $unsigned(reg27) : reg31[(3'h4):(2'h2)])) : {(~{reg40})}));
            end
          reg43 <= ({reg31} ?
              {reg27} : (($unsigned((-reg28)) != wire23[(1'h1):(1'h0)]) ?
                  $unsigned($unsigned(reg42)) : reg37[(1'h1):(1'h0)]));
          reg44 <= reg32;
          reg45 <= wire24[(4'hd):(3'h5)];
        end
    end
  assign wire46 = ((~(~reg39[(2'h3):(1'h1)])) ?
                      reg39[(3'h4):(2'h3)] : (reg32 < (~^$signed(reg41[(4'h8):(2'h2)]))));
  assign wire47 = $signed((reg39 ?
                      ($signed((wire22 << wire22)) ?
                          $unsigned($unsigned((8'hbf))) : $signed(reg42)) : reg43));
  always
    @(posedge clk) begin
      reg48 <= (~&reg38[(4'hd):(1'h1)]);
      reg49 <= reg37;
      reg50 <= $signed(wire24);
    end
  assign wire51 = $unsigned($unsigned(reg31));
  assign wire52 = reg33;
  assign wire53 = reg30;
  always
    @(posedge clk) begin
      reg54 <= reg40;
      if ((+(wire22 || $signed($unsigned((wire24 ? wire52 : reg39))))))
        begin
          reg55 <= reg40[(1'h1):(1'h0)];
          reg56 <= {$unsigned((-$unsigned($signed(reg32)))),
              reg32[(1'h0):(1'h0)]};
          reg57 <= $unsigned(wire26);
          if ((({(reg42[(1'h0):(1'h0)] ?
                  wire22[(3'h7):(3'h4)] : (reg44 & (8'ha0)))} <<< $unsigned($unsigned($unsigned(reg57)))) - {$unsigned($signed($signed(reg29))),
              $signed((+wire46[(3'h6):(2'h2)]))}))
            begin
              reg58 <= $signed((~^reg40[(2'h3):(1'h1)]));
            end
          else
            begin
              reg58 <= (^($signed(reg27) ~^ wire22[(3'h4):(2'h2)]));
            end
          reg59 <= {{{{$unsigned(wire23)}, reg36[(3'h7):(3'h7)]}},
              ({$signed((+reg31))} ^ reg48[(3'h7):(3'h5)])};
        end
      else
        begin
          if ((~{$signed(($unsigned(reg48) != $signed(reg56)))}))
            begin
              reg55 <= {(~wire26), (!(~^$unsigned($unsigned(wire25))))};
              reg56 <= $signed(((&$unsigned((|reg39))) ?
                  reg49[(4'hf):(3'h7)] : {((reg57 ~^ reg36) ~^ (-(8'hb3)))}));
              reg57 <= $signed((!$signed((((8'had) ?
                  reg41 : wire23) - $signed(wire47)))));
            end
          else
            begin
              reg55 <= reg41;
              reg56 <= $unsigned((reg30 ?
                  (wire46[(1'h1):(1'h0)] >>> wire24) : ((|(reg41 ?
                      wire52 : reg48)) < (~(reg30 ~^ reg27)))));
              reg57 <= $unsigned(reg43);
            end
          reg58 <= {reg57[(4'h9):(2'h2)],
              (((-{(8'hb8)}) ? reg57 : (~|$unsigned(reg57))) ?
                  $unsigned($signed(reg41[(5'h11):(4'h9)])) : (~|$unsigned($unsigned((7'h44)))))};
          reg59 <= (reg37[(3'h7):(1'h0)] ^ (^reg39));
          reg60 <= {wire51};
          reg61 <= wire23[(4'h9):(3'h6)];
        end
      reg62 <= $signed(($signed(wire22[(3'h7):(3'h4)]) ?
          $unsigned($unsigned((reg60 ^ reg40))) : reg35));
      reg63 <= $unsigned((^reg41));
      reg64 <= $signed(((~^$unsigned((-wire53))) | reg54[(4'ha):(2'h2)]));
    end
  module65 #() modinst114 (wire113, clk, wire25, reg50, reg30, reg43, reg38);
  assign wire115 = ((((!reg40[(2'h2):(1'h1)]) ?
                       ($signed(wire53) ?
                           $unsigned(reg35) : (^~(8'hb8))) : ((reg60 == reg62) || (~^wire23))) || (reg58 ?
                       $signed($unsigned(wire113)) : ($unsigned(reg58) ?
                           reg55[(2'h3):(1'h1)] : ((8'had) & (8'hba))))) ^~ {$signed({$signed((8'hb9))})});
  assign wire116 = $unsigned(((((reg48 - reg58) ?
                           (reg41 ? reg41 : reg37) : (reg55 ?
                               (8'hbd) : (8'ha4))) ?
                       ({reg35,
                           wire53} || (8'hb5)) : $signed($signed((7'h42)))) && $signed({((8'ha2) + (8'ha2)),
                       $unsigned((8'hb4))})));
endmodule

module module65
#(parameter param111 = (-((7'h41) ? ((((8'hb4) >= (8'hb1)) + ((8'ha2) ^~ (8'hbf))) < ((8'hb3) ~^ ((7'h44) ? (8'hb1) : (8'haf)))) : (((~^(8'had)) ? (8'hb4) : ((8'hbc) != (8'h9c))) ? (((8'hb0) << (8'ha5)) ? {(8'hbb), (8'hb1)} : (~^(8'ha3))) : ((^(8'ha0)) ? ((8'haf) ? (8'hbd) : (8'ha8)) : ((8'hb5) != (8'ha0)))))), 
parameter param112 = (^~{(-(+param111)), (-param111)}))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  input wire signed [(4'hf):(1'h0)] wire68;
  input wire signed [(4'h8):(1'h0)] wire67;
  input wire signed [(3'h6):(1'h0)] wire66;
  wire [(3'h7):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(2'h2):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(5'h15):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
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
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire71 = $unsigned($signed((wire68 ?
                      {$signed(wire69)} : ((wire68 < wire70) | {wire67,
                          (8'ha3)}))));
  assign wire72 = ((^(wire67 ? (-$signed(wire69)) : (~^wire70))) ?
                      (($signed($unsigned(wire69)) <= $unsigned(wire66[(3'h5):(3'h5)])) ?
                          {$unsigned($unsigned(wire71))} : (wire66[(2'h3):(1'h1)] < wire70)) : (+$unsigned($signed($unsigned(wire69)))));
  assign wire73 = $unsigned($unsigned($unsigned(($unsigned(wire70) ^ (+wire66)))));
  assign wire74 = $signed({wire73[(3'h4):(3'h4)], wire66[(3'h4):(2'h3)]});
  assign wire75 = wire73;
  assign wire76 = {($signed((-(wire74 <<< (8'ha4)))) ?
                          $signed(wire70[(4'ha):(1'h1)]) : (wire72 <<< {wire67}))};
  always
    @(posedge clk) begin
      reg77 <= (7'h41);
      if ($signed(($unsigned(((wire75 > (8'hbd)) + wire67[(3'h7):(1'h1)])) ?
          wire75[(5'h10):(3'h7)] : wire67[(3'h5):(3'h5)])))
        begin
          if (wire74[(4'h9):(2'h3)])
            begin
              reg78 <= {$signed(wire67)};
              reg79 <= wire69;
              reg80 <= $signed($signed(reg78));
              reg81 <= reg77;
              reg82 <= (8'ha9);
            end
          else
            begin
              reg78 <= reg78[(4'h8):(3'h5)];
              reg79 <= (^~(|(8'hae)));
              reg80 <= wire70;
            end
          reg83 <= $signed($unsigned(wire68));
          reg84 <= (+(~&$unsigned((~&{(8'hbb)}))));
          reg85 <= {$unsigned(wire75)};
        end
      else
        begin
          if (reg85)
            begin
              reg78 <= (8'haf);
              reg79 <= {(8'had), (-wire72)};
              reg80 <= reg83[(5'h11):(3'h7)];
              reg81 <= ((!$unsigned((wire68[(4'he):(1'h1)] ?
                      (wire71 ? wire74 : wire70) : reg82))) ?
                  ({$unsigned((^wire69)),
                      (wire75[(4'h8):(1'h0)] ?
                          (wire73 ? reg79 : reg84) : {wire71,
                              wire73})} - wire76[(1'h1):(1'h0)]) : wire67[(1'h1):(1'h0)]);
            end
          else
            begin
              reg78 <= ($unsigned((^$signed(wire75))) ?
                  {{$unsigned($unsigned((7'h42))), wire71[(1'h0):(1'h0)]},
                      $unsigned((~&(reg84 ?
                          reg83 : (8'hb6))))} : ({$signed({(8'hb5), wire72}),
                          {{wire68}, $unsigned((8'ha1))}} ?
                      $unsigned((^wire71)) : (+{(~^wire67), (~|reg84)})));
              reg79 <= ($signed(wire76[(1'h0):(1'h0)]) <= $unsigned((wire70 | $unsigned((^wire67)))));
              reg80 <= (wire66 ^ (^~wire71));
            end
          reg82 <= $signed(((~&reg82[(3'h7):(3'h5)]) > $unsigned($signed((&wire68)))));
          reg83 <= reg80;
        end
      if ((&(~&($unsigned({(8'hb0), reg82}) << $unsigned(reg83)))))
        begin
          reg86 <= {$signed(reg82[(4'h9):(1'h0)])};
          reg87 <= wire76[(2'h2):(1'h0)];
          reg88 <= reg78[(2'h3):(1'h0)];
          if ($signed((reg85[(3'h7):(3'h7)] ^~ $unsigned((!(wire73 ?
              wire73 : reg85))))))
            begin
              reg89 <= wire73[(1'h0):(1'h0)];
            end
          else
            begin
              reg89 <= ($unsigned((~|$unsigned((!wire69)))) ?
                  (|wire68) : reg89[(2'h3):(2'h2)]);
              reg90 <= reg86;
              reg91 <= wire74[(4'h9):(4'h9)];
            end
          reg92 <= $signed(($unsigned(wire67[(3'h6):(2'h2)]) ?
              $unsigned(((~wire70) ? reg83 : $unsigned(reg89))) : wire73));
        end
      else
        begin
          if (reg89[(3'h4):(1'h0)])
            begin
              reg86 <= {$signed(reg82[(5'h11):(1'h0)])};
              reg87 <= (&$unsigned(({$signed(wire68)} ^ reg89)));
              reg88 <= ($signed((reg92 == wire67[(4'h8):(3'h4)])) ?
                  {({$unsigned(wire72)} <<< $signed(reg89[(2'h2):(1'h0)]))} : reg78[(4'h8):(3'h5)]);
              reg89 <= $signed($signed(($unsigned(reg82) ?
                  {{wire68},
                      $unsigned(reg79)} : $unsigned((reg77 << (8'hac))))));
              reg90 <= wire66[(3'h6):(3'h4)];
            end
          else
            begin
              reg86 <= (reg83 * $signed(reg90[(3'h4):(1'h1)]));
              reg87 <= ($unsigned(reg90) << (+(((reg83 & reg92) ?
                  (^~wire67) : (wire72 ~^ (8'hb5))) ^~ $signed((wire71 ?
                  reg78 : wire71)))));
              reg88 <= (|(~|($unsigned($unsigned((7'h44))) ~^ wire69)));
              reg89 <= (&$unsigned(wire75));
              reg90 <= reg92;
            end
          if ((|(~^$signed($unsigned({reg85, wire71})))))
            begin
              reg91 <= ((($unsigned({(8'h9f)}) ?
                          reg84 : {$signed((8'hb0)), reg83[(5'h11):(4'ha)]}) ?
                      reg81 : reg77[(1'h1):(1'h1)]) ?
                  ((&(~|$signed((8'ha3)))) && $signed(((reg82 << reg87) ?
                      (reg81 ? reg78 : wire67) : wire76))) : wire75);
              reg92 <= wire75[(2'h2):(1'h1)];
            end
          else
            begin
              reg91 <= $unsigned(($unsigned(reg81[(1'h0):(1'h0)]) ?
                  $signed(((wire69 ? reg89 : wire69) ?
                      $signed(reg77) : (reg80 == reg90))) : (^(~&reg92))));
              reg92 <= (((~|$unsigned($unsigned(wire74))) && (^$signed((reg89 ?
                  wire66 : (8'hb8))))) - $signed({({reg92, wire71} ?
                      {wire76} : (~&reg78)),
                  reg87}));
            end
        end
      reg93 <= ($unsigned((8'hb3)) ?
          (!{wire74}) : (reg82[(4'hd):(4'ha)] ~^ (8'ha9)));
    end
  assign wire94 = wire67;
  assign wire95 = reg80[(1'h0):(1'h0)];
  assign wire96 = reg82[(4'ha):(2'h2)];
  assign wire97 = ((($signed($signed(reg84)) ?
                              {(reg89 ? reg78 : wire73)} : (wire72 ?
                                  {wire96} : (~|reg77))) ?
                          {$signed((reg83 ? wire69 : reg83)),
                              (8'hbf)} : $signed(reg78[(2'h2):(2'h2)])) ?
                      ((&$unsigned(wire95)) ?
                          wire94[(2'h2):(1'h1)] : (~((~^reg92) ?
                              (reg82 == reg81) : (reg86 ^~ wire76)))) : $signed($unsigned(($unsigned((8'hba)) ?
                          (|wire94) : $signed(reg81)))));
  assign wire98 = wire76;
  assign wire99 = $signed(reg86[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (reg88)
        begin
          reg100 <= reg92;
          reg101 <= (^~($unsigned($unsigned((wire96 >>> reg83))) ?
              wire68 : $signed(($unsigned(reg84) ?
                  wire71[(1'h0):(1'h0)] : wire68))));
          reg102 <= wire69[(1'h0):(1'h0)];
          reg103 <= (wire74[(1'h0):(1'h0)] <= (^(~&((reg89 * wire69) == (reg86 ?
              reg102 : reg90)))));
          if ($unsigned(($signed(wire74) != $signed({reg78[(1'h1):(1'h1)]}))))
            begin
              reg104 <= reg85[(4'hc):(1'h0)];
            end
          else
            begin
              reg104 <= wire74[(1'h0):(1'h0)];
              reg105 <= $signed(wire94[(3'h7):(3'h7)]);
              reg106 <= wire74[(2'h2):(1'h0)];
            end
        end
      else
        begin
          if ((7'h41))
            begin
              reg100 <= reg87;
              reg101 <= $unsigned(wire70);
              reg102 <= ($signed((+(wire73 ?
                  $unsigned(wire75) : reg81))) ^ reg93);
              reg103 <= reg88[(3'h7):(3'h5)];
            end
          else
            begin
              reg100 <= $unsigned((-$signed(reg82[(2'h3):(1'h1)])));
              reg101 <= (reg84[(3'h5):(1'h1)] + reg106);
            end
          reg104 <= (-(~&wire70));
          reg105 <= (($signed({$unsigned((8'hbd)),
                  (wire72 ? reg93 : reg93)}) ^~ $unsigned((|(wire70 ?
                  reg91 : reg102)))) ?
              wire74[(2'h3):(2'h2)] : (~^($signed(reg89) ?
                  ({(8'h9f)} > $unsigned(wire96)) : ($unsigned(reg92) ?
                      reg85[(4'he):(4'h9)] : (reg84 ? (8'haa) : reg88)))));
          reg106 <= ({(($signed((7'h42)) - $unsigned(reg106)) ?
                      $unsigned($unsigned(reg91)) : ($signed(reg80) <<< (reg88 ?
                          wire66 : reg82)))} ?
              wire94 : wire99[(4'h8):(1'h0)]);
        end
      reg107 <= {(+$signed(reg84[(3'h5):(1'h1)]))};
      reg108 <= ((8'hae) ?
          {$signed({reg91[(4'h9):(1'h1)], (reg103 ? reg107 : reg107)}),
              (reg77 >> ($signed(reg81) ?
                  reg84[(1'h1):(1'h1)] : $unsigned(wire99)))} : $signed(wire97));
    end
  assign wire109 = (&$signed(($unsigned((reg86 ?
                       reg89 : reg87)) - $unsigned(reg80))));
  assign wire110 = $unsigned((reg108[(2'h2):(2'h2)] || {reg86[(4'h9):(3'h6)],
                       wire97}));
endmodule

module module146
#(parameter param167 = ((&((+(-(8'hb0))) >>> ((-(8'h9e)) ? (+(8'hb9)) : ((8'ha5) ? (8'hbf) : (8'hb7))))) ? (!((!((8'ha9) && (8'ha1))) ? {((8'ha9) >>> (8'h9f))} : (~&((8'ha4) <<< (8'ha5))))) : (^(|{((8'hbe) ^ (8'ha6)), (^(8'hb0))}))), 
parameter param168 = (({((-param167) ? param167 : {(8'hac), param167}), (~^(^~(8'hb0)))} < ((^~(~|param167)) ? param167 : ((~|param167) ? ((8'hb9) ? (8'hbc) : param167) : (^param167)))) >>> {{(~(~|(8'hb2))), ((~param167) ? (8'hb1) : param167)}, ((~|(~&param167)) ? (~|(&param167)) : (((8'hb6) ? param167 : (7'h40)) ? {param167} : (&(8'h9f))))}))
(y, clk, wire150, wire149, wire148, wire147);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire150;
  input wire signed [(3'h6):(1'h0)] wire149;
  input wire [(5'h14):(1'h0)] wire148;
  input wire signed [(2'h3):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire166;
  wire signed [(5'h13):(1'h0)] wire165;
  wire [(3'h4):(1'h0)] wire164;
  wire signed [(3'h5):(1'h0)] wire163;
  wire signed [(4'hc):(1'h0)] wire162;
  wire [(5'h14):(1'h0)] wire161;
  wire signed [(5'h11):(1'h0)] wire160;
  wire signed [(4'hd):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg155 = (1'h0);
  reg [(5'h15):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg152 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg151 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({(~&$signed((^wire148[(4'ha):(3'h4)])))})
        begin
          if ((~^wire149[(3'h6):(1'h1)]))
            begin
              reg151 <= ($unsigned($signed((&wire150[(2'h2):(1'h0)]))) ?
                  (((~&wire147) ? wire148[(4'he):(4'h8)] : $signed({wire149})) ?
                      $unsigned(wire150[(2'h2):(1'h0)]) : $unsigned($unsigned(wire150[(2'h2):(1'h0)]))) : ((~^$unsigned((wire150 ^~ wire149))) ?
                      ($signed((wire148 ? (8'hb0) : wire149)) << ((+(8'ha6)) ?
                          {wire150} : $unsigned(wire147))) : $unsigned($unsigned(wire150))));
            end
          else
            begin
              reg151 <= (~&{(8'ha8)});
            end
          reg152 <= wire147[(2'h3):(2'h2)];
          if ((~|$signed((wire149[(3'h4):(1'h0)] ?
              $unsigned((8'ha3)) : wire148))))
            begin
              reg153 <= $unsigned(reg151[(2'h3):(1'h1)]);
              reg154 <= $signed((~^$signed(((wire149 >= reg151) & $signed(reg152)))));
              reg155 <= (^{wire149, wire148});
              reg156 <= reg152;
              reg157 <= (&$unsigned((reg155[(3'h6):(2'h3)] >>> (8'haa))));
            end
          else
            begin
              reg153 <= {($signed(reg156[(1'h0):(1'h0)]) ?
                      (!(8'ha6)) : $unsigned(reg152[(3'h4):(3'h4)]))};
              reg154 <= (+($signed(reg157[(3'h4):(2'h3)]) ?
                  wire150[(1'h0):(1'h0)] : {((!reg154) <= $unsigned(wire149))}));
              reg155 <= reg155;
              reg156 <= (~|(~|($unsigned(reg156) << $signed($unsigned(reg156)))));
              reg157 <= ((+wire148) ?
                  $signed((~((~&wire148) ^~ wire150))) : $signed($signed($unsigned({wire147}))));
            end
        end
      else
        begin
          reg151 <= wire147;
          if ($signed(reg156))
            begin
              reg152 <= {wire150[(1'h1):(1'h1)]};
              reg153 <= $signed(({(~(7'h43)),
                      ((^~wire147) + $unsigned(wire147))} ?
                  reg156[(2'h3):(2'h3)] : reg153));
              reg154 <= (8'hae);
            end
          else
            begin
              reg152 <= $signed((~^wire148));
              reg153 <= $unsigned(reg155);
              reg154 <= ($unsigned(wire150) ?
                  (~&($unsigned(wire150[(1'h0):(1'h0)]) | $signed((reg156 ?
                      (8'hae) : reg157)))) : (^wire149[(3'h6):(1'h0)]));
              reg155 <= (^~reg154);
              reg156 <= {(~&$signed(($signed(reg155) ?
                      reg154[(4'h8):(3'h6)] : $signed(reg155))))};
            end
        end
    end
  assign wire158 = (+$unsigned(($unsigned((reg152 ?
                       reg151 : reg151)) - $signed({(8'haf), (8'had)}))));
  assign wire159 = reg152;
  assign wire160 = $signed($signed({reg152[(1'h0):(1'h0)],
                       (~|$unsigned(reg154))}));
  assign wire161 = reg156[(3'h4):(2'h3)];
  assign wire162 = ((((wire159 ?
                                   wire161[(5'h13):(3'h7)] : (wire159 ?
                                       reg157 : reg157)) ?
                               reg151[(2'h3):(2'h3)] : {wire148}) ?
                           $unsigned(reg152[(3'h7):(3'h5)]) : $unsigned((+((8'hb5) ?
                               wire150 : reg153)))) ?
                       $unsigned(($unsigned($unsigned(reg157)) ?
                           $signed({wire147,
                               reg157}) : $signed(reg152))) : wire160);
  assign wire163 = $signed($signed((~$unsigned(reg157[(2'h2):(2'h2)]))));
  assign wire164 = reg151[(1'h0):(1'h0)];
  assign wire165 = wire147[(1'h1):(1'h1)];
  assign wire166 = (((|((wire158 > wire163) - (wire164 ? (8'hb6) : (8'ha4)))) ?
                       (~|(~(wire149 ?
                           (8'hb1) : wire163))) : reg157) == (8'ha1));
endmodule

module module190  (y, clk, wire194, wire193, wire192, wire191);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire194;
  input wire signed [(4'ha):(1'h0)] wire193;
  input wire [(4'h8):(1'h0)] wire192;
  input wire signed [(5'h10):(1'h0)] wire191;
  wire signed [(3'h4):(1'h0)] wire208;
  wire [(3'h4):(1'h0)] wire207;
  wire signed [(4'hf):(1'h0)] wire206;
  wire signed [(5'h11):(1'h0)] wire205;
  wire signed [(3'h7):(1'h0)] wire204;
  wire [(5'h15):(1'h0)] wire203;
  wire [(5'h14):(1'h0)] wire202;
  wire signed [(4'ha):(1'h0)] wire201;
  wire signed [(3'h4):(1'h0)] wire200;
  wire [(4'ha):(1'h0)] wire199;
  wire signed [(5'h11):(1'h0)] wire198;
  wire [(4'hd):(1'h0)] wire197;
  wire [(2'h3):(1'h0)] wire196;
  wire [(4'he):(1'h0)] wire195;
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 (1'h0)};
  assign wire195 = $signed(wire193[(1'h1):(1'h0)]);
  assign wire196 = $signed($unsigned($signed($signed({wire193}))));
  assign wire197 = $unsigned(({(8'hb4)} << $unsigned(wire191[(1'h1):(1'h1)])));
  assign wire198 = ($signed($signed(wire196)) ?
                       wire191[(4'h8):(1'h1)] : $unsigned((({wire196} != (^wire193)) - (^$signed((8'hac))))));
  assign wire199 = ($unsigned((+$unsigned((!wire195)))) ?
                       (wire195[(4'h8):(3'h4)] ?
                           wire196 : $signed(((wire196 ? wire197 : wire195) ?
                               (~^wire197) : (|(8'hb0))))) : wire191[(4'hb):(1'h1)]);
  assign wire200 = (!wire196[(2'h3):(1'h1)]);
  assign wire201 = wire194[(3'h4):(2'h3)];
  assign wire202 = $unsigned($signed(wire192[(1'h0):(1'h0)]));
  assign wire203 = (^~wire194[(1'h1):(1'h0)]);
  assign wire204 = (wire201 ?
                       $signed($unsigned((+wire199[(1'h1):(1'h1)]))) : (wire191 - wire201[(4'h9):(4'h9)]));
  assign wire205 = $unsigned($unsigned((((~&wire201) & {wire197,
                       wire193}) * wire192[(2'h3):(1'h0)])));
  assign wire206 = {(~{wire203}), wire195[(3'h4):(1'h0)]};
  assign wire207 = wire202;
  assign wire208 = wire194[(1'h1):(1'h1)];
endmodule
