module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire219;
  wire [(4'hf):(1'h0)] wire209;
  wire signed [(5'h13):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire211;
  wire [(4'hc):(1'h0)] wire212;
  wire signed [(5'h14):(1'h0)] wire213;
  wire [(4'hf):(1'h0)] wire217;
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg214 = (1'h0);
  reg [(4'hb):(1'h0)] reg215 = (1'h0);
  reg [(3'h4):(1'h0)] reg216 = (1'h0);
  assign y = {wire219,
                 wire209,
                 wire121,
                 wire119,
                 wire84,
                 wire4,
                 wire5,
                 wire6,
                 wire9,
                 wire10,
                 wire11,
                 wire17,
                 wire18,
                 wire19,
                 wire80,
                 wire211,
                 wire212,
                 wire213,
                 wire217,
                 reg7,
                 reg8,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg82,
                 reg83,
                 reg214,
                 reg215,
                 reg216,
                 (1'h0)};
  assign wire4 = {$signed($unsigned(wire3[(2'h3):(2'h2)]))};
  assign wire5 = ((|($unsigned((wire1 ?
                     wire2 : wire2)) & $unsigned(wire1[(1'h1):(1'h0)]))) >>> $unsigned(wire1));
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= wire2;
      reg8 <= (~(wire1[(3'h6):(2'h3)] ?
          $unsigned($signed(wire5)) : wire1[(3'h6):(1'h0)]));
    end
  assign wire9 = $unsigned(reg8);
  assign wire10 = $signed(reg8[(4'ha):(2'h3)]);
  assign wire11 = reg8[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg12 <= wire3[(2'h3):(1'h1)];
      reg13 <= (~{{(8'hb8)},
          ((wire4[(4'ha):(4'ha)] > $unsigned(wire9)) <= ({wire2} ?
              (~reg12) : $unsigned(wire4)))});
      reg14 <= (8'hb4);
      reg15 <= wire5;
      reg16 <= ((($unsigned({wire9}) ?
              (~&wire10[(1'h0):(1'h0)]) : $unsigned((reg14 ?
                  (8'hb3) : reg12))) ?
          $signed(wire1) : wire10) > (+((~^$signed(wire5)) >>> ($unsigned(reg15) ?
          $unsigned(wire3) : (reg15 >>> reg8)))));
    end
  assign wire17 = $unsigned(($unsigned(reg13) ?
                      ($unsigned(wire1) ? $signed((~|reg14)) : reg8) : wire0));
  assign wire18 = (|$signed($unsigned((&$signed(wire3)))));
  assign wire19 = $unsigned(wire6[(3'h4):(3'h4)]);
  module20 #() modinst81 (.wire24(wire6), .wire23(reg8), .wire21(reg13), .clk(clk), .wire25(wire11), .y(wire80), .wire22(wire17));
  always
    @(posedge clk) begin
      reg82 <= ((^{wire1,
          (((7'h40) ^ wire2) ?
              (wire19 << wire6) : reg14[(1'h1):(1'h1)])}) ^ ({$unsigned(reg7[(3'h6):(2'h3)])} - (~|(~$unsigned((8'hb7))))));
      reg83 <= $unsigned({$unsigned($signed({reg13})),
          $unsigned(($unsigned(wire1) ?
              wire80[(1'h0):(1'h0)] : wire2[(4'ha):(1'h0)]))});
    end
  assign wire84 = (wire5[(1'h1):(1'h1)] ?
                      (wire17[(3'h5):(1'h1)] != wire0) : ($signed(($unsigned(reg83) ?
                              $signed(reg13) : $unsigned(wire1))) ?
                          (($unsigned(wire3) & (~|wire0)) > wire2) : $unsigned((reg8 ?
                              (reg16 <= (8'hb5)) : $unsigned(wire19)))));
  module85 #() modinst120 (.wire87(wire4), .wire88(wire2), .wire90(wire18), .wire86(wire11), .y(wire119), .clk(clk), .wire89(reg13));
  assign wire121 = $signed(reg14[(1'h1):(1'h1)]);
  module122 #() modinst210 (.y(wire209), .wire124(wire0), .clk(clk), .wire123(wire6), .wire125(wire2), .wire126(reg16));
  assign wire211 = (|wire2);
  assign wire212 = (&wire121[(5'h13):(3'h4)]);
  assign wire213 = wire10;
  always
    @(posedge clk) begin
      reg214 <= $unsigned($unsigned($unsigned($signed(wire9[(1'h1):(1'h1)]))));
      reg215 <= (((8'ha4) ? reg7 : wire1) ?
          $signed(((~$signed(wire11)) ?
              $unsigned($unsigned(reg15)) : reg214[(1'h0):(1'h0)])) : $signed($unsigned(wire5[(2'h3):(2'h3)])));
      reg216 <= ($signed(wire1) & reg12);
    end
  module122 #() modinst218 (wire217, clk, reg13, wire212, wire0, wire4);
  assign wire219 = $signed(wire17[(3'h6):(3'h5)]);
endmodule

module module122
#(parameter param208 = (((~|(~&{(8'hab), (8'ha6)})) << ((~^((8'ha6) < (8'hae))) ? ((&(8'hab)) ? {(8'hbc), (8'ha6)} : (8'hb5)) : (((7'h44) ? (8'haa) : (8'hb2)) ? ((8'hb8) >> (7'h41)) : ((8'hac) ? (8'hae) : (8'h9e))))) <<< (((~|(-(8'ha2))) ? (8'haa) : ({(8'ha6)} >>> ((8'ha1) ? (8'hbe) : (8'hb1)))) && ((^((8'hab) > (8'hb6))) ? (((7'h44) ? (8'hab) : (7'h40)) ? {(8'haa), (8'ha6)} : (8'hb5)) : (~((8'hbd) <= (8'hb7)))))))
(y, clk, wire123, wire124, wire125, wire126);
  output wire [(32'h221):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire123;
  input wire [(4'h8):(1'h0)] wire124;
  input wire [(5'h12):(1'h0)] wire125;
  input wire [(5'h15):(1'h0)] wire126;
  wire [(3'h7):(1'h0)] wire180;
  wire [(5'h15):(1'h0)] wire179;
  wire signed [(5'h11):(1'h0)] wire177;
  wire [(4'hf):(1'h0)] wire176;
  wire signed [(4'h9):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire134;
  wire [(2'h2):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire174;
  reg signed [(4'ha):(1'h0)] reg207 = (1'h0);
  reg [(5'h13):(1'h0)] reg206 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg203 = (1'h0);
  reg [(2'h3):(1'h0)] reg202 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg200 = (1'h0);
  reg signed [(4'he):(1'h0)] reg199 = (1'h0);
  reg [(5'h13):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg195 = (1'h0);
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg191 = (1'h0);
  reg [(4'hd):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg189 = (1'h0);
  reg [(4'h9):(1'h0)] reg188 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(4'hf):(1'h0)] reg185 = (1'h0);
  reg [(4'h8):(1'h0)] reg184 = (1'h0);
  reg [(4'h9):(1'h0)] reg183 = (1'h0);
  reg [(3'h5):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(5'h14):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire177,
                 wire176,
                 wire131,
                 wire134,
                 wire135,
                 wire174,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg178,
                 reg137,
                 reg136,
                 reg133,
                 reg132,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg127 <= $signed((&$signed(wire124[(1'h0):(1'h0)])));
      reg128 <= {{(($unsigned(wire125) ?
                  reg127 : $unsigned(wire125)) & $unsigned((wire124 ~^ wire124)))}};
      reg129 <= {(&$signed(reg128))};
      reg130 <= $signed(((((reg128 <<< wire126) ^~ (wire126 - (8'hb1))) - $signed($signed(wire124))) - (!$unsigned($signed(reg127)))));
    end
  assign wire131 = wire123;
  always
    @(posedge clk) begin
      reg132 <= {($signed((^((8'h9c) ? reg129 : (8'hac)))) & {wire126}),
          (wire123 != (8'hb7))};
      reg133 <= $unsigned(reg128);
    end
  assign wire134 = (~^$signed(wire131[(1'h0):(1'h0)]));
  assign wire135 = $signed(wire126);
  always
    @(posedge clk) begin
      reg136 <= reg132;
      reg137 <= {(wire131 ? (^wire124) : ((8'hb1) < (~&{(8'hbe), wire123}))),
          ((wire126[(1'h0):(1'h0)] || ((reg129 & reg136) ?
                  {reg127} : $signed(wire126))) ?
              (~((wire125 ? reg130 : wire131) ?
                  reg130 : $unsigned(wire125))) : wire126)};
    end
  module138 #() modinst175 (.wire142(reg129), .y(wire174), .clk(clk), .wire139(reg136), .wire140(wire126), .wire143(reg130), .wire141(reg133));
  assign wire176 = reg127;
  assign wire177 = $unsigned({(~|(8'h9f))});
  always
    @(posedge clk) begin
      reg178 <= wire131;
    end
  assign wire179 = (reg130[(4'h8):(3'h7)] ~^ wire174);
  assign wire180 = ({$signed(reg136)} >>> $signed(((-$signed(reg132)) >>> $unsigned(wire124[(3'h7):(2'h3)]))));
  always
    @(posedge clk) begin
      reg181 <= ($signed(((8'hbf) > wire135)) != {$signed($unsigned((!wire135)))});
      if ($signed($signed(((~&(7'h44)) - (wire124[(1'h1):(1'h0)] ?
          $signed(wire125) : (wire126 ? wire126 : wire177))))))
        begin
          reg182 <= $signed(reg181);
          reg183 <= wire131[(3'h4):(1'h1)];
          reg184 <= $unsigned((($signed($signed(wire123)) ?
                  $unsigned({wire135, wire180}) : wire180[(3'h6):(3'h6)]) ?
              (((reg133 >> reg137) || (|(7'h44))) < $signed((reg182 || wire131))) : wire124));
          reg185 <= $unsigned(reg130);
        end
      else
        begin
          reg182 <= $signed(reg182);
          reg183 <= (($signed($signed(((8'h9f) > wire177))) >= reg182) >>> (reg178 ?
              $signed((^~(reg127 ? reg136 : reg133))) : wire176));
          if ($signed((({$unsigned(wire135)} ?
                  (~&$signed(wire174)) : ($unsigned(reg181) ?
                      $signed((8'hb5)) : reg183)) ?
              (+((8'h9e) * {reg137})) : reg182)))
            begin
              reg184 <= ($signed($unsigned(($unsigned((8'h9c)) ?
                      (8'ha1) : {wire135, reg178}))) ?
                  (^reg137[(4'ha):(3'h5)]) : ({$unsigned((reg182 != reg129)),
                          (wire174 | reg127[(4'ha):(3'h4)])} ?
                      ((~^wire125[(4'hc):(4'hb)]) ?
                          reg183 : (~|$signed(wire179))) : reg184[(3'h5):(3'h4)]));
              reg185 <= ($unsigned(($unsigned($signed(reg132)) ?
                  $unsigned(reg181) : {(^~wire174)})) >> wire123);
              reg186 <= (~&(((~&reg136[(5'h10):(4'h8)]) & {{reg130},
                  reg137[(3'h5):(3'h4)]}) ^ ((+(|(8'ha8))) ?
                  ({(8'ha9),
                      wire135} <<< $signed((8'hb1))) : $unsigned({(7'h40)}))));
              reg187 <= reg184[(3'h6):(1'h0)];
            end
          else
            begin
              reg184 <= $signed(reg129[(1'h1):(1'h0)]);
            end
          reg188 <= (!wire124);
        end
      if (({reg181, $signed((|(|reg137)))} ? $unsigned(wire134) : wire176))
        begin
          reg189 <= wire176[(4'hb):(4'h9)];
          if (reg129)
            begin
              reg190 <= (+reg132);
            end
          else
            begin
              reg190 <= (wire179[(5'h11):(1'h1)] >> (reg181[(1'h0):(1'h0)] * (~&wire124)));
              reg191 <= reg182;
            end
        end
      else
        begin
          reg189 <= (wire131[(2'h2):(2'h2)] ?
              $signed($unsigned(wire125[(5'h12):(1'h1)])) : $signed(wire131));
        end
      if ((8'hb6))
        begin
          reg192 <= ($signed(($signed($unsigned((8'ha1))) << $signed(reg178))) & $unsigned(reg130));
          reg193 <= reg186;
          reg194 <= reg129[(1'h0):(1'h0)];
        end
      else
        begin
          if (wire123)
            begin
              reg192 <= $unsigned($unsigned((&$signed((wire125 - reg183)))));
            end
          else
            begin
              reg192 <= (reg183[(1'h0):(1'h0)] >>> (+($signed($signed(wire174)) ?
                  reg181[(1'h0):(1'h0)] : ((&reg127) <<< $unsigned(reg132)))));
              reg193 <= $unsigned(reg191);
              reg194 <= reg192[(2'h3):(2'h2)];
            end
          reg195 <= (~|(wire135 <<< ((7'h43) && (reg132[(3'h4):(2'h3)] >> (reg130 ?
              wire176 : wire179)))));
          reg196 <= reg136;
          reg197 <= {(^{{reg191[(3'h5):(2'h3)]}}), (8'h9e)};
          if (reg190)
            begin
              reg198 <= reg128[(2'h3):(2'h3)];
              reg199 <= (+$signed($unsigned(((reg195 ? (8'ha3) : wire125) ?
                  (reg186 ? reg187 : wire126) : (wire123 ?
                      reg137 : wire125)))));
              reg200 <= (reg137 ?
                  (+(((reg191 ^ reg178) ? $signed((8'hb9)) : {wire176}) ?
                      ((wire179 ?
                          wire124 : wire174) <= $signed(wire126)) : ((reg178 ?
                          reg129 : reg187) << $unsigned((8'ha5))))) : ({(wire176 >= (~wire179)),
                      reg189} >> $signed(((~^wire177) ? wire177 : reg182))));
              reg201 <= reg132[(1'h1):(1'h0)];
              reg202 <= (|reg198);
            end
          else
            begin
              reg198 <= (^~((8'hb4) * (($unsigned(reg202) < (reg193 ?
                  reg187 : (8'hba))) != $signed({reg182, (8'hb3)}))));
            end
        end
      if ({reg129, (~$unsigned($signed({wire123})))})
        begin
          reg203 <= $unsigned((-{((wire124 ?
                  reg189 : (8'h9e)) || (reg193 >>> reg193))}));
          if ($unsigned(reg127))
            begin
              reg204 <= reg201;
              reg205 <= $unsigned(((($signed(reg197) ?
                          (~|reg178) : (~&reg133)) ?
                      reg182[(3'h4):(3'h4)] : $signed($signed(reg186))) ?
                  {(reg132 ? reg184 : reg202[(1'h1):(1'h1)]),
                      (~$unsigned((8'h9f)))} : wire131));
              reg206 <= (8'hbe);
              reg207 <= (^~$unsigned((8'hbf)));
            end
          else
            begin
              reg204 <= $signed(reg206);
            end
        end
      else
        begin
          reg203 <= $unsigned(reg127);
          reg204 <= (8'haf);
        end
    end
endmodule

module module85
#(parameter param117 = {(({((8'ha4) | (8'hb9)), (^~(7'h41))} ^~ {{(8'ha1), (8'ha1)}}) & ((((8'ha2) ^ (8'hbc)) ^~ ((8'ha2) <= (8'h9e))) >>> {{(8'haa), (8'hb0)}, ((8'h9d) ? (8'hbd) : (8'ha9))})), (8'hb3)}, 
parameter param118 = {param117})
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire90;
  input wire [(4'h8):(1'h0)] wire89;
  input wire signed [(4'hb):(1'h0)] wire88;
  input wire signed [(3'h6):(1'h0)] wire87;
  input wire signed [(4'h9):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire116;
  wire [(3'h6):(1'h0)] wire114;
  wire [(5'h15):(1'h0)] wire93;
  wire [(3'h4):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  assign y = {wire116,
                 wire114,
                 wire93,
                 wire92,
                 wire91,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire91 = (+$unsigned((7'h44)));
  assign wire92 = $signed((wire87[(1'h0):(1'h0)] < wire87[(1'h0):(1'h0)]));
  assign wire93 = (+$signed(($unsigned((&wire92)) >> ($unsigned(wire88) ?
                      {wire89, wire88} : (&(8'hb5))))));
  always
    @(posedge clk) begin
      if (($unsigned($signed(((wire91 ? wire87 : wire91) ?
              $unsigned(wire89) : $unsigned(wire87)))) ?
          $unsigned({$unsigned((wire91 ? wire91 : wire91)),
              $signed(wire93[(4'h9):(3'h5)])}) : (wire91[(1'h0):(1'h0)] - {wire90})))
        begin
          reg94 <= wire91;
          if ((((wire86[(3'h7):(1'h1)] ?
                  wire92[(1'h0):(1'h0)] : wire90) - {$unsigned($unsigned(wire93))}) ?
              wire90[(3'h4):(2'h2)] : {$unsigned(((wire86 ?
                      reg94 : wire92) ~^ $unsigned(reg94)))}))
            begin
              reg95 <= ((((+(|reg94)) ?
                      {(-wire89),
                          (&wire88)} : wire92) > $unsigned($unsigned((wire87 || (8'hae))))) ?
                  ((+wire87[(1'h0):(1'h0)]) >>> ((wire89[(2'h3):(1'h0)] != wire86[(2'h2):(1'h0)]) ?
                      $signed((|reg94)) : $signed({wire87}))) : $signed((~^$signed($signed(wire88)))));
              reg96 <= wire87;
              reg97 <= $unsigned(((8'hb9) ?
                  $unsigned(($signed((8'hbd)) >>> (wire91 ?
                      reg95 : wire93))) : (wire91 - $unsigned(((8'ha2) ?
                      wire88 : reg94)))));
              reg98 <= $signed($unsigned(reg97[(1'h1):(1'h1)]));
              reg99 <= {(+{($signed((8'hb8)) ?
                          $signed((8'hb0)) : (reg94 ? wire92 : reg96)),
                      $signed(wire91)}),
                  {(&((reg94 <<< reg94) == $signed(wire87))), (8'ha2)}};
            end
          else
            begin
              reg95 <= $unsigned(wire86);
              reg96 <= wire93;
            end
          reg100 <= ($signed(wire86) != {wire90[(2'h2):(1'h0)]});
        end
      else
        begin
          reg94 <= $signed((!($unsigned(reg97) > (reg95 ?
              wire86[(3'h6):(1'h1)] : reg99))));
          reg95 <= wire88[(1'h0):(1'h0)];
        end
      reg101 <= (|(&wire87));
      reg102 <= {($unsigned((8'hb9)) ?
              wire86[(3'h4):(1'h1)] : $unsigned({(~&wire93),
                  (wire91 ^~ reg95)})),
          $unsigned(({reg99[(3'h5):(1'h1)]} ?
              (8'hb4) : $signed((reg98 ? reg97 : reg97))))};
    end
  module103 #() modinst115 (wire114, clk, reg102, reg101, reg95, reg94);
  assign wire116 = $unsigned({wire89[(1'h0):(1'h0)],
                       (wire93[(5'h11):(4'he)] + (wire91[(3'h7):(3'h6)] ?
                           (wire91 == reg101) : $unsigned(wire91)))});
endmodule

module module20
#(parameter param79 = (((+((^~(8'hbd)) ? {(8'had)} : {(8'ha4), (8'h9f)})) ? {(~|((8'ha2) ? (8'hb8) : (8'ha5))), (((8'hbd) ? (8'hbd) : (8'hb3)) ? ((8'hb7) ? (8'ha5) : (7'h41)) : ((8'h9e) == (8'had)))} : ((-((8'hab) > (8'ha2))) || (^~(!(8'hbf))))) ? ((^{((8'hac) ? (8'hb4) : (8'ha0)), ((7'h44) ? (8'h9e) : (8'ha4))}) ? ((|(-(8'hb8))) ? ({(7'h41), (8'ha4)} ? ((8'h9f) * (8'hab)) : (8'h9f)) : (((8'hb1) >= (8'ha4)) == (-(8'hb7)))) : {(((7'h42) < (8'hb1)) ? ((8'ha2) ? (8'h9d) : (8'ha8)) : (~(8'h9f)))}) : (|(~|(|((8'hae) ^ (8'hb5)))))))
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire23;
  input wire [(3'h7):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire70;
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  assign y = {wire78,
                 wire73,
                 wire72,
                 wire70,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  module26 #() modinst71 (.wire29(wire24), .wire28(wire23), .wire30(wire25), .wire31(wire22), .wire27(wire21), .y(wire70), .clk(clk));
  assign wire72 = (^~wire21);
  assign wire73 = $unsigned((($unsigned($signed(wire21)) > (wire22 >= $unsigned((8'had)))) << {{{wire22},
                          (8'h9f)},
                      ($unsigned((8'hae)) != $signed(wire23))}));
  always
    @(posedge clk) begin
      reg74 <= $unsigned({wire23[(4'hd):(2'h2)]});
      reg75 <= wire21;
      if (($unsigned($signed(wire73)) == $signed($signed($unsigned(((8'ha4) != wire25))))))
        begin
          reg76 <= (({(8'ha0)} ? wire24 : $unsigned(reg74)) + wire73);
        end
      else
        begin
          reg76 <= $unsigned((($unsigned($signed(wire24)) ?
              reg75[(1'h1):(1'h0)] : wire21) > ((~^(+reg74)) ?
              $signed(reg75) : (wire70 ?
                  (reg76 ? (8'hb8) : wire73) : wire24))));
          reg77 <= (&(((~&(-wire22)) ?
              $signed($signed((8'ha0))) : $signed((wire25 ?
                  wire70 : wire25))) ^~ ((&wire23) ?
              ($signed(wire24) <= {wire24}) : ((wire21 ? reg76 : (8'ha4)) ?
                  $signed(wire73) : $signed(wire25)))));
        end
    end
  assign wire78 = $signed($unsigned($unsigned(({reg77,
                      reg77} >> (reg75 > (8'ha6))))));
endmodule

module module26
#(parameter param68 = ((((((8'haa) ? (8'hac) : (8'ha2)) == ((8'haf) ? (8'hae) : (8'hbc))) ^~ (-{(7'h41)})) * {((~^(8'ha6)) * (8'hab))}) ? (+(~&(8'had))) : (+((((8'ha8) << (8'ha4)) ? (~&(8'haf)) : (&(7'h43))) ? ({(7'h40)} ? ((8'ha7) ? (8'ha6) : (8'hab)) : {(8'ha5), (8'hbc)}) : (((8'h9c) >> (8'hbc)) & (-(8'ha6)))))), 
parameter param69 = param68)
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire31;
  input wire [(5'h10):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire29;
  input wire [(4'h8):(1'h0)] wire28;
  input wire [(4'he):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire32;
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg33 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire54,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire32,
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
                 reg53,
                 reg52,
                 reg51,
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
                 (1'h0)};
  assign wire32 = $unsigned((({(&wire31)} ~^ wire30[(2'h3):(2'h3)]) ?
                      (wire30[(3'h7):(2'h3)] ?
                          wire30 : wire28[(3'h5):(3'h4)]) : wire31[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg33 <= $signed(wire30[(1'h1):(1'h0)]);
      reg34 <= ($signed(wire30) ? wire27[(4'h8):(4'h8)] : wire27);
      reg35 <= $signed(wire29);
      reg36 <= reg34[(3'h4):(1'h0)];
      reg37 <= wire27;
    end
  always
    @(posedge clk) begin
      if (($unsigned(((|reg35) ?
          reg37 : wire28[(3'h7):(3'h5)])) >= $unsigned($signed(({(8'hbe)} >= reg35)))))
        begin
          if ((reg33[(4'ha):(4'h8)] == wire31[(4'hc):(2'h2)]))
            begin
              reg38 <= $signed(wire28);
              reg39 <= wire27[(4'hd):(3'h7)];
              reg40 <= ($signed(wire32) ?
                  wire31[(3'h5):(2'h3)] : ($unsigned((8'h9e)) ?
                      (((!wire31) ?
                          reg37 : reg35) ^ wire28[(1'h0):(1'h0)]) : {$signed(wire32),
                          (((8'hac) ? wire32 : reg34) ?
                              $signed((8'ha9)) : wire28[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg38 <= {wire32,
                  ($signed(wire32[(2'h3):(1'h1)]) >> (wire32[(2'h3):(2'h3)] > reg34[(2'h2):(1'h1)]))};
              reg39 <= ((+(|(reg39[(3'h7):(2'h2)] != (reg40 & wire28)))) >>> (((^~(~|wire29)) << wire29[(1'h0):(1'h0)]) >> (((wire31 ?
                      reg35 : (8'had)) | $signed((8'hbb))) ?
                  $unsigned({reg33, reg39}) : $signed($signed((8'hbe))))));
              reg40 <= wire27[(4'ha):(2'h2)];
              reg41 <= (8'ha0);
              reg42 <= $unsigned(wire31);
            end
          reg43 <= $signed((^(^$unsigned((~wire27)))));
        end
      else
        begin
          if ($unsigned($signed(($unsigned((^wire30)) > ((reg37 ?
                  reg43 : reg41) ?
              (wire28 > wire27) : wire31)))))
            begin
              reg38 <= (~|((reg35 ? wire27 : (~|reg37[(4'hf):(3'h6)])) ?
                  wire32 : wire28));
              reg39 <= (~|(^~(($signed((7'h42)) <= (~^wire27)) ?
                  $signed((reg38 >>> (8'hb9))) : ($signed(wire28) ?
                      $signed(reg39) : $signed(reg33)))));
              reg40 <= ((wire31 >>> (-(wire32 == $signed(wire27)))) ?
                  reg34[(3'h5):(1'h0)] : $unsigned(wire32));
            end
          else
            begin
              reg38 <= wire32;
              reg39 <= reg33;
            end
          reg41 <= reg39;
          reg42 <= $signed($unsigned($unsigned({(wire28 != reg35)})));
          reg43 <= $signed($signed((|$signed(wire30))));
          reg44 <= wire27;
        end
      reg45 <= {reg38[(4'h8):(2'h3)]};
    end
  assign wire46 = ((^~$signed((^(wire30 ? wire27 : reg34)))) < reg37);
  assign wire47 = (-(($signed((reg35 ? wire28 : wire27)) ?
                          (!reg39[(2'h3):(1'h1)]) : reg38[(1'h0):(1'h0)]) ?
                      (!($signed(reg38) ^~ (8'hba))) : $unsigned((&(^~wire29)))));
  assign wire48 = $signed((~&(^~reg39)));
  assign wire49 = ((reg42 ?
                          reg41[(2'h2):(1'h1)] : $signed($unsigned($unsigned((8'ha1))))) ?
                      wire47 : ((+reg43[(4'h9):(2'h2)]) ?
                          ((((8'hb5) != reg37) != (reg45 < wire46)) - ($signed(reg38) ?
                              (~^(8'hb0)) : ((8'h9c) == reg33))) : wire31));
  assign wire50 = reg37[(4'hf):(4'he)];
  always
    @(posedge clk) begin
      reg51 <= reg45;
      reg52 <= reg43;
      reg53 <= reg41[(3'h5):(3'h4)];
    end
  assign wire54 = wire32[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg55 <= $signed($unsigned($unsigned(($signed(reg34) ?
          reg43[(5'h14):(3'h7)] : (wire30 ? reg36 : reg53)))));
      if (wire30)
        begin
          reg56 <= $signed((wire29[(3'h4):(1'h1)] + (~|reg55[(1'h0):(1'h0)])));
          reg57 <= reg45;
        end
      else
        begin
          reg56 <= (reg57 + wire46);
          reg57 <= {(|(!(8'hae))), (8'hbd)};
          reg58 <= (8'hbe);
        end
      reg59 <= $signed($unsigned($signed(reg58[(5'h11):(4'hc)])));
      reg60 <= wire48[(4'he):(1'h1)];
      reg61 <= reg51;
    end
  always
    @(posedge clk) begin
      reg62 <= $signed(reg33);
      reg63 <= (^((&(reg40 > (reg52 ? wire46 : reg43))) ^ $signed(((!wire54) ?
          (reg45 | reg57) : wire30))));
      reg64 <= ($unsigned((wire48 + (8'hbd))) != $signed((-((reg34 ?
              reg52 : wire31) ?
          (wire46 == wire50) : (^reg43)))));
    end
  assign wire65 = reg36;
  assign wire66 = reg51;
  assign wire67 = {((reg58[(1'h1):(1'h1)] <<< $unsigned(reg60[(3'h7):(3'h5)])) ?
                          ($signed(reg43) >>> $signed((!(8'hb9)))) : (^~reg33)),
                      {$signed(reg33[(2'h3):(1'h0)])}};
endmodule

module module103  (y, clk, wire107, wire106, wire105, wire104);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire107;
  input wire [(4'hd):(1'h0)] wire106;
  input wire signed [(3'h4):(1'h0)] wire105;
  input wire [(4'hb):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire [(4'h8):(1'h0)] wire108;
  assign y = {wire113, wire112, wire111, wire110, wire109, wire108, (1'h0)};
  assign wire108 = ($signed(wire104) ?
                       wire105 : {(wire106 > {(wire107 ? wire106 : wire106)})});
  assign wire109 = $signed((~&$signed($unsigned((8'hb2)))));
  assign wire110 = wire108[(1'h1):(1'h1)];
  assign wire111 = $signed((wire109[(3'h7):(1'h1)] && wire110));
  assign wire112 = wire108;
  assign wire113 = wire107;
endmodule

module module138  (y, clk, wire143, wire142, wire141, wire140, wire139);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire143;
  input wire [(2'h3):(1'h0)] wire142;
  input wire [(4'h8):(1'h0)] wire141;
  input wire [(4'ha):(1'h0)] wire140;
  input wire [(3'h4):(1'h0)] wire139;
  wire [(5'h13):(1'h0)] wire173;
  wire signed [(4'h8):(1'h0)] wire167;
  wire [(4'hc):(1'h0)] wire148;
  wire [(2'h2):(1'h0)] wire147;
  wire [(3'h5):(1'h0)] wire146;
  wire [(5'h14):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  reg [(3'h5):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  assign y = {wire173,
                 wire167,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 (1'h0)};
  assign wire144 = ($unsigned({wire140[(4'h8):(3'h4)],
                       $unsigned($unsigned(wire140))}) + wire139);
  assign wire145 = wire143[(5'h14):(4'he)];
  assign wire146 = ((^~wire140[(3'h6):(3'h5)]) * $unsigned(({wire144[(1'h1):(1'h1)],
                           wire145} ?
                       $signed((wire141 > wire142)) : ($unsigned((8'haa)) ?
                           wire145 : (~^wire141)))));
  assign wire147 = {$unsigned((!$unsigned($signed(wire142))))};
  assign wire148 = ($unsigned((~&$unsigned(wire143[(5'h11):(4'hd)]))) >> (~|(8'h9d)));
  always
    @(posedge clk) begin
      reg149 <= wire144[(1'h0):(1'h0)];
      if ((!(&((wire147[(2'h2):(1'h1)] > (wire139 <= wire144)) != $unsigned((reg149 ?
          reg149 : (7'h43)))))))
        begin
          reg150 <= ((~|wire147[(1'h0):(1'h0)]) << $unsigned((~$signed($signed(wire141)))));
          if (reg150)
            begin
              reg151 <= $signed((reg150 ?
                  wire144[(2'h3):(1'h1)] : $signed($unsigned(wire143[(3'h4):(1'h0)]))));
              reg152 <= (^reg149[(3'h6):(3'h4)]);
              reg153 <= {wire148,
                  $unsigned((reg151[(3'h6):(1'h0)] >>> (wire148[(3'h7):(2'h3)] == (reg151 ?
                      wire146 : wire140))))};
              reg154 <= ((reg152 >>> ((reg150 ?
                          ((8'hb4) ? wire141 : (8'hbe)) : (~|wire147)) ?
                      ((7'h43) == (|(8'ha7))) : reg151[(1'h1):(1'h1)])) ?
                  ({$unsigned($signed((8'h9d))),
                          ((~wire140) & $unsigned(wire140))} ?
                      wire144 : wire148[(3'h6):(3'h5)]) : $unsigned({reg150}));
            end
          else
            begin
              reg151 <= reg150;
              reg152 <= reg152[(4'h9):(3'h4)];
            end
          reg155 <= (!(&$signed({$unsigned(wire142), (wire146 | wire142)})));
          if (((8'hae) ?
              (!reg151[(3'h5):(1'h0)]) : {(8'hba), wire143[(5'h11):(3'h6)]}))
            begin
              reg156 <= $unsigned({(($unsigned(reg150) ?
                      (wire142 ?
                          (8'ha4) : reg150) : wire143[(2'h3):(1'h0)]) ^ ($unsigned(reg149) ?
                      wire146 : reg150)),
                  $unsigned((8'hbd))});
              reg157 <= wire140[(3'h7):(2'h2)];
              reg158 <= reg149[(2'h3):(1'h0)];
              reg159 <= $signed(((((reg156 ? reg158 : wire144) >>> {reg151}) ?
                      $unsigned((reg157 ?
                          (8'ha8) : wire142)) : reg156[(4'h9):(2'h2)]) ?
                  reg153[(3'h5):(1'h0)] : reg153));
              reg160 <= (&(($unsigned((~|wire141)) >> ((reg158 < wire139) ?
                      $signed(reg149) : wire145)) ?
                  (|wire142) : $signed(reg152)));
            end
          else
            begin
              reg156 <= reg155;
            end
        end
      else
        begin
          reg150 <= $unsigned(reg151[(2'h3):(2'h3)]);
          reg151 <= {(|{$signed($signed(wire145)),
                  ((wire145 ? wire141 : wire139) <<< reg158)})};
          if (wire146[(3'h4):(1'h1)])
            begin
              reg152 <= {(~^reg155)};
              reg153 <= ($unsigned(($signed((~|wire141)) <<< (~reg160))) >>> $signed((+reg151[(2'h3):(1'h1)])));
              reg154 <= $signed((!reg150[(2'h2):(1'h1)]));
              reg155 <= reg150;
              reg156 <= $unsigned(wire146);
            end
          else
            begin
              reg152 <= {reg152};
              reg153 <= ($unsigned((reg150 ?
                  ({wire144,
                      (8'hbc)} | $unsigned(reg158)) : (wire144 != (reg156 ?
                      wire143 : (8'ha5))))) == ($unsigned(($signed(wire141) ?
                  wire144 : (+reg159))) << {reg160,
                  ($unsigned(reg156) >= wire148[(4'ha):(2'h2)])}));
            end
          reg157 <= ((reg160[(3'h5):(3'h5)] ^ reg153[(2'h2):(1'h0)]) << $unsigned((~$signed((reg155 + (8'had))))));
        end
      reg161 <= (&$signed($unsigned($signed(reg157))));
      reg162 <= ($unsigned((~^$unsigned((&reg156)))) ?
          $unsigned(wire142) : reg154);
    end
  always
    @(posedge clk) begin
      reg163 <= $signed($unsigned((((^~(8'h9e)) ?
          (wire140 ?
              reg155 : reg161) : wire142) == $unsigned(reg149[(4'hb):(2'h2)]))));
      reg164 <= (|(reg158[(2'h3):(2'h2)] >> $signed(((~&reg162) * $unsigned(reg151)))));
      reg165 <= (+(reg161[(3'h4):(1'h1)] ?
          (-(wire147[(1'h0):(1'h0)] ?
              (reg156 & wire143) : $unsigned(reg153))) : {wire147,
              reg157[(4'ha):(1'h1)]}));
      reg166 <= ($unsigned(reg152[(4'h8):(3'h4)]) ~^ reg149);
    end
  assign wire167 = $signed(($signed(reg151[(1'h0):(1'h0)]) ?
                       $unsigned({reg157}) : {(~|$signed(wire139)), reg158}));
  always
    @(posedge clk) begin
      reg168 <= wire143[(5'h12):(2'h2)];
      reg169 <= reg150;
      reg170 <= reg168;
      reg171 <= (wire142[(2'h2):(2'h2)] ?
          reg169[(1'h1):(1'h0)] : {(!$unsigned((wire140 < reg169))), wire140});
      reg172 <= reg164;
    end
  assign wire173 = (((8'hab) ^~ {{(reg169 ? reg168 : (8'ha7))}, (8'hb8)}) ?
                       wire144 : ($signed(reg160) ?
                           (reg152 ?
                               $signed((wire146 < reg156)) : reg161) : ($signed((~^wire142)) ?
                               reg158 : reg163)));
endmodule
