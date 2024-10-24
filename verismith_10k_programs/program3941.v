module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire219;
  wire signed [(5'h11):(1'h0)] wire218;
  wire signed [(4'hf):(1'h0)] wire217;
  wire [(2'h2):(1'h0)] wire216;
  wire signed [(4'h8):(1'h0)] wire215;
  wire signed [(5'h11):(1'h0)] wire214;
  wire signed [(4'hb):(1'h0)] wire213;
  wire signed [(5'h12):(1'h0)] wire210;
  wire signed [(4'h9):(1'h0)] wire209;
  wire signed [(4'hd):(1'h0)] wire207;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg211 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire210,
                 wire209,
                 wire207,
                 wire4,
                 reg212,
                 reg211,
                 (1'h0)};
  assign wire4 = ((($signed($unsigned(wire0)) - (+(wire3 ? wire3 : (7'h41)))) ?
                         wire3 : $signed(({wire3, wire0} > $signed(wire0)))) ?
                     $unsigned($unsigned(wire2[(2'h2):(2'h2)])) : {$signed(wire1)});
  module5 #() modinst208 (wire207, clk, wire4, wire0, wire1, wire3);
  assign wire209 = wire2;
  assign wire210 = (wire207 ?
                       ($signed(wire207) ?
                           wire2[(1'h0):(1'h0)] : $unsigned({(wire209 ?
                                   wire1 : wire2)})) : {(wire209[(2'h3):(2'h2)] ?
                               wire207[(1'h0):(1'h0)] : $signed((wire207 ?
                                   (8'ha4) : (8'haa))))});
  always
    @(posedge clk) begin
      reg211 <= wire209[(3'h4):(3'h4)];
      reg212 <= wire1[(2'h2):(2'h2)];
    end
  assign wire213 = $unsigned(((wire4[(5'h10):(3'h7)] >> ($unsigned(reg212) ?
                       reg212[(3'h5):(1'h1)] : (wire1 | reg211))) <<< $signed(((reg212 & wire1) || wire209))));
  assign wire214 = wire0;
  assign wire215 = (wire3[(3'h5):(3'h4)] ~^ $unsigned($signed((~|(reg212 ?
                       wire210 : wire3)))));
  assign wire216 = wire4;
  assign wire217 = (wire215[(3'h7):(2'h3)] & wire207[(4'ha):(3'h5)]);
  assign wire218 = wire207;
  assign wire219 = $signed((^((wire2[(1'h0):(1'h0)] << $unsigned(wire210)) ?
                       $unsigned($signed(wire2)) : $unsigned($unsigned(wire207)))));
endmodule

module module5
#(parameter param205 = ({((-(|(8'ha9))) * ((-(8'ha2)) != (8'hb3)))} ? (8'ha6) : (8'hb4)), 
parameter param206 = {(&{(^~(&param205)), ((~param205) ? (^param205) : (-param205))})})
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h1e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire204;
  wire signed [(5'h15):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire119;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire202;
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  assign y = {wire204,
                 wire174,
                 wire122,
                 wire121,
                 wire119,
                 wire10,
                 wire11,
                 wire14,
                 wire15,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire61,
                 wire202,
                 reg12,
                 reg13,
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
                 (1'h0)};
  assign wire10 = wire9[(4'he):(4'hb)];
  assign wire11 = (&wire9[(4'hf):(3'h6)]);
  always
    @(posedge clk) begin
      reg12 <= (wire6[(4'he):(1'h1)] ?
          (!(^~wire10[(4'h9):(3'h6)])) : $signed((($signed((8'hba)) ?
                  wire10[(3'h6):(1'h1)] : {wire7, wire7}) ?
              {wire7} : wire8)));
      reg13 <= (^~$unsigned(reg12));
    end
  assign wire14 = (reg12 ^~ wire11[(4'h8):(3'h4)]);
  assign wire15 = $signed(wire8);
  always
    @(posedge clk) begin
      if (wire8[(2'h2):(2'h2)])
        begin
          reg16 <= wire14;
          reg17 <= (^wire8[(1'h1):(1'h1)]);
          if ($unsigned(((&wire8) ?
              reg17 : {wire14, ({(8'hb1)} >> (wire15 ? wire6 : reg16))})))
            begin
              reg18 <= $unsigned(wire10[(4'hc):(1'h1)]);
              reg19 <= ((|$signed((|reg12[(4'h9):(2'h3)]))) ?
                  (wire14 ^~ (-reg12[(2'h3):(2'h3)])) : {(~^({reg18} ?
                          (wire14 ^~ reg13) : $unsigned(wire8))),
                      reg18[(2'h2):(1'h1)]});
              reg20 <= {(!{((^wire6) < $unsigned(reg18))}), {(8'h9f), reg19}};
              reg21 <= wire9;
              reg22 <= $unsigned((~|(($signed((8'hab)) ?
                      wire11[(3'h6):(1'h0)] : wire11[(3'h7):(3'h7)]) ?
                  $signed(reg18[(5'h13):(4'he)]) : $unsigned((8'haa)))));
            end
          else
            begin
              reg18 <= reg13;
            end
          if (($signed(({{(8'hae), wire15},
                  (~&wire7)} << ((+reg19) <<< (wire7 - wire9)))) ?
              wire8[(2'h2):(2'h2)] : ((((reg19 ? wire7 : reg21) <= (reg21 ?
                  reg12 : reg13)) * $signed($signed(reg17))) >> (^reg21))))
            begin
              reg23 <= (((reg12[(2'h2):(1'h0)] || {wire14}) ^ $unsigned($unsigned((~^(8'hb3))))) ?
                  reg20 : $signed((reg12[(3'h7):(3'h4)] ?
                      (|$signed(reg19)) : reg17[(4'hb):(4'h9)])));
            end
          else
            begin
              reg23 <= (^(($signed(reg16[(4'ha):(3'h7)]) ?
                  wire11 : ({wire7} ?
                      ((8'hba) <<< wire6) : reg22[(4'h8):(4'h8)])) * reg12[(1'h1):(1'h0)]));
              reg24 <= $unsigned($unsigned(reg16));
              reg25 <= reg17[(3'h6):(3'h5)];
            end
        end
      else
        begin
          reg16 <= (~&$unsigned($unsigned(({(7'h40)} ?
              (wire14 > reg23) : (~reg22)))));
          if ((reg20 ?
              (($unsigned($unsigned(reg22)) ~^ (reg21[(3'h4):(3'h4)] ~^ $signed(wire6))) <<< $unsigned(((reg13 ?
                      reg17 : (8'hb7)) ?
                  $unsigned((8'haa)) : (reg22 >= reg19)))) : (reg22 ?
                  reg24 : reg12[(3'h6):(2'h2)])))
            begin
              reg17 <= wire6[(4'h8):(3'h7)];
            end
          else
            begin
              reg17 <= (($unsigned(($signed(reg13) ? wire6 : $signed(reg23))) ?
                  (({reg18} >> (reg18 || reg21)) >= ($signed(reg16) ^ (wire11 <= wire10))) : $signed(reg16)) <<< reg25[(1'h1):(1'h1)]);
              reg18 <= reg22[(3'h5):(3'h4)];
            end
          reg19 <= ({reg22} ^~ reg20);
        end
      reg26 <= ($signed((reg17 ?
          reg25 : {(wire14 > wire6)})) == ($unsigned((~|$unsigned((8'haf)))) ?
          reg25 : wire7[(3'h4):(2'h3)]));
      reg27 <= reg25[(3'h6):(1'h1)];
      reg28 <= $unsigned(reg19);
      if (wire10)
        begin
          reg29 <= reg27[(3'h4):(2'h3)];
          reg30 <= {$unsigned($signed((+(-wire8))))};
        end
      else
        begin
          reg29 <= {{{reg28},
                  (wire8[(1'h0):(1'h0)] ?
                      $unsigned(reg20[(2'h3):(1'h0)]) : (reg16 >> $unsigned(reg19)))},
              (~&$unsigned((reg20[(4'h9):(3'h7)] || (~|reg30))))};
          reg30 <= ($signed($signed($unsigned($unsigned(reg12)))) ?
              $signed($unsigned((-(8'had)))) : (($unsigned(reg17[(4'h9):(2'h2)]) ?
                      (8'h9c) : $signed({(8'hb2), (8'haf)})) ?
                  $unsigned(reg30[(3'h4):(2'h3)]) : (8'ha4)));
          reg31 <= $signed($unsigned((reg21[(2'h3):(1'h0)] ?
              $unsigned((wire8 ? (8'hbe) : wire15)) : (^~(^~wire10)))));
        end
    end
  assign wire32 = $unsigned(($unsigned($unsigned($unsigned(reg30))) + (~^$unsigned((^(8'hbe))))));
  assign wire33 = {reg29,
                      ((^reg26[(3'h5):(3'h4)]) ~^ ((-$signed((8'hb4))) ?
                          (reg17 ? (8'hae) : $unsigned(wire10)) : ({reg20,
                                  reg30} ?
                              $unsigned(reg17) : {reg19})))};
  assign wire34 = $unsigned((reg30[(4'h9):(1'h0)] ?
                      ((8'hb5) << $unsigned(reg28[(4'hd):(3'h5)])) : ($signed((wire33 ^ reg29)) + $unsigned(reg26))));
  assign wire35 = (($signed(($signed(wire32) ? reg16 : wire6)) ?
                      ((|$signed(reg21)) ?
                          reg25[(3'h4):(3'h4)] : reg21[(3'h5):(3'h5)]) : reg25) + reg17[(4'hd):(1'h1)]);
  assign wire36 = {(reg28[(4'ha):(3'h4)] * $signed((^(|reg28))))};
  assign wire37 = wire33;
  module38 #() modinst62 (.y(wire61), .wire42(reg23), .wire39(reg24), .wire40(wire6), .wire43(reg27), .clk(clk), .wire41(reg31));
  module63 #() modinst120 (.wire67(reg25), .wire66(reg13), .clk(clk), .wire65(reg18), .wire64(reg22), .y(wire119));
  assign wire121 = wire37;
  assign wire122 = {wire35, $signed((!{wire119}))};
  module123 #() modinst175 (wire174, clk, wire7, wire34, reg18, wire35);
  module176 #() modinst203 (.wire181(wire6), .wire178(reg28), .clk(clk), .wire177(reg29), .y(wire202), .wire179(reg20), .wire180(reg12));
  assign wire204 = reg28[(1'h1):(1'h1)];
endmodule

module module176
#(parameter param200 = (^((!((~|(8'hba)) ? ((8'h9c) ? (8'hbb) : (8'ha6)) : (!(8'hb7)))) ? ((~&((7'h42) ? (7'h41) : (8'hba))) >> (8'h9d)) : (({(8'ha4), (8'hb2)} ? {(8'hb1), (8'hbb)} : (+(8'ha5))) ? (((8'hae) ? (8'hac) : (8'hab)) ? {(8'hb5), (8'ha0)} : ((8'hb1) ? (8'hb1) : (8'hb5))) : (((8'hb6) ? (8'hb1) : (8'hb4)) * (8'h9c))))), 
parameter param201 = (^~(param200 ? (param200 > {{param200, param200}}) : param200)))
(y, clk, wire181, wire180, wire179, wire178, wire177);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire181;
  input wire signed [(4'hf):(1'h0)] wire180;
  input wire [(5'h12):(1'h0)] wire179;
  input wire signed [(5'h14):(1'h0)] wire178;
  input wire [(3'h7):(1'h0)] wire177;
  wire signed [(5'h14):(1'h0)] wire199;
  wire [(5'h15):(1'h0)] wire198;
  wire signed [(4'h9):(1'h0)] wire197;
  wire signed [(4'h9):(1'h0)] wire196;
  wire signed [(5'h14):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire194;
  wire signed [(4'hf):(1'h0)] wire193;
  wire [(3'h7):(1'h0)] wire192;
  wire [(4'ha):(1'h0)] wire191;
  wire signed [(4'hf):(1'h0)] wire190;
  wire signed [(5'h14):(1'h0)] wire185;
  wire [(2'h3):(1'h0)] wire184;
  wire [(4'h8):(1'h0)] wire183;
  wire signed [(4'h8):(1'h0)] wire182;
  reg [(2'h2):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg188 = (1'h0);
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  assign y = {wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 (1'h0)};
  assign wire182 = wire177[(3'h7):(1'h1)];
  assign wire183 = $signed($signed((^({wire180, wire182} ?
                       wire182[(3'h5):(2'h2)] : $unsigned(wire180)))));
  assign wire184 = $signed({(&(&{wire181, wire182})),
                       (~|((|wire178) * (-wire183)))});
  assign wire185 = ($unsigned($unsigned(wire184)) ~^ wire180);
  always
    @(posedge clk) begin
      reg186 <= (|wire181[(3'h6):(1'h0)]);
      reg187 <= ((wire179 >>> (~(wire183[(3'h5):(3'h5)] == ((8'hb0) >= wire181)))) & wire181[(1'h1):(1'h0)]);
      reg188 <= (wire184[(2'h2):(1'h0)] > $signed(wire177[(3'h5):(2'h2)]));
      reg189 <= reg187;
    end
  assign wire190 = ({{(wire182 ? wire178[(4'ha):(1'h0)] : (wire185 || (8'hae))),
                               $signed(wire185)},
                           ((wire180 != $unsigned(reg187)) ?
                               ((wire180 ? wire179 : wire179) ?
                                   (-reg186) : (reg188 | wire184)) : ({reg188,
                                   reg189} << $signed(wire185)))} ?
                       (($unsigned((reg186 ? (8'h9c) : wire179)) ?
                               $unsigned(reg186[(4'h8):(1'h0)]) : (~&(reg186 < reg186))) ?
                           $unsigned((wire178 ^~ (&reg189))) : wire182[(3'h7):(3'h5)]) : ((+(~&(^~wire180))) ?
                           $signed(({reg188} ?
                               $signed(reg186) : $signed(wire180))) : reg186));
  assign wire191 = ((8'h9d) ^~ ($unsigned(wire180) ?
                       (+$signed($signed(wire182))) : (&{(wire184 ?
                               wire190 : wire181),
                           (+reg187)})));
  assign wire192 = ($unsigned($unsigned({(wire180 & wire183), {wire183}})) ?
                       {wire185[(2'h3):(2'h2)]} : $unsigned((!{wire191,
                           wire177})));
  assign wire193 = wire177;
  assign wire194 = $signed(({$unsigned(wire185),
                           (wire183[(1'h1):(1'h0)] >= $unsigned(wire191))} ?
                       reg188[(2'h2):(2'h2)] : {(8'haf),
                           (^{wire183, wire181})}));
  assign wire195 = wire193;
  assign wire196 = $unsigned((8'hb7));
  assign wire197 = $unsigned($signed((8'h9e)));
  assign wire198 = wire180[(4'hc):(1'h0)];
  assign wire199 = wire191[(4'h8):(4'h8)];
endmodule

module module123
#(parameter param173 = (+(|(~|(-{(8'ha8), (8'ha7)})))))
(y, clk, wire127, wire126, wire125, wire124);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire127;
  input wire signed [(4'hc):(1'h0)] wire126;
  input wire [(4'hb):(1'h0)] wire125;
  input wire signed [(2'h2):(1'h0)] wire124;
  wire [(3'h6):(1'h0)] wire172;
  wire signed [(3'h5):(1'h0)] wire171;
  wire [(3'h7):(1'h0)] wire170;
  wire signed [(3'h7):(1'h0)] wire169;
  wire signed [(4'h9):(1'h0)] wire168;
  wire signed [(3'h4):(1'h0)] wire167;
  wire signed [(3'h4):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire142;
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(2'h3):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg [(4'hb):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(4'he):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg138 = (1'h0);
  reg [(3'h5):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg135 = (1'h0);
  reg [(5'h11):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  assign y = {wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire158,
                 wire157,
                 wire142,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg141,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg128 <= $unsigned($signed(((((8'hbd) ?
              wire126 : wire126) * $signed((8'ha3))) ?
          wire127 : wire127)));
      reg129 <= (~|((|({reg128} ^~ (reg128 ? wire124 : wire126))) <<< reg128));
      if ((~&reg128[(4'hb):(4'ha)]))
        begin
          reg130 <= wire125[(4'h9):(3'h4)];
          reg131 <= (~&$unsigned((+((~^wire127) ?
              (reg130 ? wire124 : (8'hae)) : (reg128 >> reg129)))));
          reg132 <= $signed($unsigned(reg130));
          reg133 <= {($signed((reg128 >= (wire124 >= reg132))) * wire124[(1'h0):(1'h0)])};
          reg134 <= (wire127 ?
              reg132 : (($unsigned($signed(reg130)) ~^ reg128[(4'hc):(4'ha)]) && $unsigned($unsigned((~&reg130)))));
        end
      else
        begin
          reg130 <= wire124[(1'h1):(1'h0)];
          reg131 <= (+($signed($signed((^~reg131))) ?
              ({wire125[(3'h4):(1'h1)]} + $unsigned(wire124[(1'h0):(1'h0)])) : wire124[(1'h1):(1'h0)]));
          reg132 <= ($unsigned($signed(reg133[(2'h3):(1'h1)])) && reg128);
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned((((~&(8'hae)) > ($unsigned(wire126) << (reg131 || reg130))) & (8'ha2))))
        begin
          if (((reg130[(2'h3):(2'h2)] ?
                  ((reg131 ?
                      (reg131 ?
                          reg128 : wire125) : reg132) > ($signed(wire125) | {reg130,
                      (8'hb2)})) : wire125[(3'h4):(2'h2)]) ?
              ($unsigned((((8'ha5) - reg132) <= (reg129 == reg133))) || reg133[(3'h6):(3'h6)]) : $unsigned($signed($signed((|(8'ha4)))))))
            begin
              reg135 <= wire124;
              reg136 <= (&reg133[(3'h6):(3'h4)]);
              reg137 <= $signed((8'ha4));
              reg138 <= $unsigned(reg136[(3'h7):(3'h6)]);
              reg139 <= (((((reg135 ^ reg134) ?
                  reg134 : $signed(reg130)) < $unsigned($signed(reg130))) || (~|(!(wire124 ^~ wire127)))) <<< (wire125[(2'h3):(2'h2)] * reg128));
            end
          else
            begin
              reg135 <= reg137;
              reg136 <= (8'hac);
            end
        end
      else
        begin
          reg135 <= $unsigned(reg129);
          reg136 <= (~&(($signed(reg139) >>> (reg132[(3'h4):(2'h2)] ?
                  (reg130 | (8'ha4)) : $signed((8'hab)))) ?
              {(^(reg138 >> reg138)),
                  $signed(reg139)} : reg138[(4'h9):(2'h3)]));
        end
      reg140 <= $signed($signed(reg139[(3'h6):(3'h6)]));
      reg141 <= ($unsigned(reg137) ?
          (wire124 ?
              $signed($signed((reg139 * reg133))) : (($unsigned(reg140) ?
                      $signed(reg134) : $signed(wire125)) ?
                  $unsigned((~wire127)) : ($unsigned(reg140) * wire124))) : wire125);
    end
  assign wire142 = ($signed(($signed((wire127 ?
                       reg132 : reg140)) | ((8'hbb) - (reg133 & (8'ha0))))) + ($signed(wire125[(1'h1):(1'h0)]) ?
                       wire127 : reg135[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if ($unsigned($signed(reg130)))
        begin
          reg143 <= $signed(reg132[(3'h4):(2'h2)]);
          reg144 <= {((reg140 ?
                      (wire127[(3'h7):(1'h0)] && (8'hb7)) : ($signed(reg135) ?
                          {wire125} : (reg132 ? wire124 : reg137))) ?
                  ($signed(((8'hb1) >>> reg140)) >= (!reg129[(4'h9):(1'h0)])) : reg128)};
          reg145 <= $signed(reg137);
          reg146 <= (^($signed($unsigned((wire142 ? wire127 : wire125))) ?
              ((((8'ha2) | wire125) ? reg137 : wire125[(4'h8):(2'h3)]) ?
                  (~$unsigned(reg140)) : (reg138 && reg137)) : $signed($signed(reg135))));
          reg147 <= $unsigned($signed(({reg130[(1'h1):(1'h0)]} | wire127[(1'h0):(1'h0)])));
        end
      else
        begin
          reg143 <= reg134;
          reg144 <= $signed(reg136);
        end
      reg148 <= (wire126 < wire126[(2'h2):(1'h1)]);
      reg149 <= ($unsigned(reg134) ?
          $signed((((wire127 ? reg139 : reg136) ?
              (reg146 >= (8'hb2)) : (-reg137)) && ($unsigned(reg130) > {wire124}))) : ((^~($unsigned((8'ha0)) <= reg141)) < (8'h9f)));
      if ((wire124 ? reg141 : (8'hb3)))
        begin
          reg150 <= (reg143 ?
              $signed(reg143[(3'h6):(1'h0)]) : $signed((+((reg137 >>> (8'h9c)) ?
                  (reg129 * reg131) : $unsigned(reg141)))));
          if ((~{(^reg144[(3'h5):(2'h2)])}))
            begin
              reg151 <= (~|$signed((^~reg146[(1'h1):(1'h1)])));
              reg152 <= reg148;
              reg153 <= reg150[(5'h14):(3'h6)];
              reg154 <= (reg132 ? (|{{(reg147 ? reg150 : (8'ha7))}}) : reg143);
            end
          else
            begin
              reg151 <= (^~$unsigned(($signed((reg152 ^~ reg145)) ?
                  {(reg151 - reg145)} : reg137)));
            end
          reg155 <= $signed(wire124);
        end
      else
        begin
          reg150 <= $signed(reg148[(3'h6):(2'h3)]);
          reg151 <= $signed((~|(-($signed(reg145) ?
              (reg133 ? reg154 : wire125) : ((8'hb3) ? reg133 : reg141)))));
          reg152 <= reg129;
        end
      reg156 <= wire127;
    end
  assign wire157 = $unsigned($signed(reg148));
  assign wire158 = (reg141 ?
                       ((-($signed(reg141) | $unsigned(reg156))) & wire142) : reg140);
  always
    @(posedge clk) begin
      if ($unsigned((reg137 << $signed(($signed(reg133) ?
          (8'ha7) : (^reg132))))))
        begin
          reg159 <= (((~|(8'h9f)) ?
              $unsigned(((|(8'h9c)) >= reg134)) : $unsigned($unsigned($signed(reg147)))) == $unsigned($signed((reg131[(2'h3):(2'h2)] ?
              (reg130 <<< reg131) : ((8'hbe) <= (8'hb0))))));
          if ((&$unsigned($signed($unsigned(wire158[(1'h0):(1'h0)])))))
            begin
              reg160 <= $signed((~$unsigned(($unsigned(reg147) - {reg146}))));
              reg161 <= (-$unsigned($signed(($unsigned((8'hab)) ?
                  (reg147 <= (8'hb5)) : $unsigned(reg129)))));
            end
          else
            begin
              reg160 <= ($signed((reg144[(3'h7):(1'h1)] ?
                  wire127[(2'h3):(1'h1)] : ((reg151 ?
                      reg129 : reg148) >> (reg133 || wire125)))) <<< (~$unsigned(reg159[(2'h2):(1'h1)])));
              reg161 <= (reg129[(5'h10):(3'h7)] ?
                  (-reg152[(4'hb):(4'h8)]) : $unsigned(({reg132} ?
                      $unsigned({reg153}) : (reg161[(2'h2):(2'h2)] ?
                          $unsigned(wire142) : (^~reg144)))));
              reg162 <= reg151;
              reg163 <= (8'ha0);
            end
          reg164 <= (wire157 ?
              ($unsigned($unsigned(reg146)) ?
                  $unsigned(wire126[(3'h6):(1'h1)]) : $unsigned(reg163)) : ($unsigned(($signed(reg146) & {(8'hbc),
                      reg161})) ?
                  reg137 : (((-(8'hbf)) ~^ (reg148 ? reg150 : reg154)) ?
                      reg128 : (wire125[(3'h4):(2'h3)] ?
                          $signed(reg131) : ((8'hb2) ? (8'ha6) : reg132)))));
          reg165 <= reg147;
        end
      else
        begin
          reg159 <= reg144[(4'hb):(1'h1)];
        end
      reg166 <= ((&{(+((8'ha0) & reg159))}) ?
          ($signed(reg134[(4'hd):(3'h4)]) ?
              wire142 : ($unsigned(reg153[(2'h2):(1'h1)]) - ({reg151} << (8'ha7)))) : (reg143 <= (reg152[(2'h3):(2'h3)] ?
              $signed($unsigned(reg160)) : (reg136 * $signed(reg147)))));
    end
  assign wire167 = reg160;
  assign wire168 = reg147[(2'h2):(2'h2)];
  assign wire169 = (^$unsigned($unsigned({reg132, {wire127, reg146}})));
  assign wire170 = reg129[(5'h13):(3'h6)];
  assign wire171 = (&{(8'haf)});
  assign wire172 = $signed({{wire127[(4'h9):(3'h6)]}});
endmodule

module module63  (y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h245):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire67;
  input wire [(4'hc):(1'h0)] wire66;
  input wire [(5'h10):(1'h0)] wire65;
  input wire signed [(4'hd):(1'h0)] wire64;
  wire [(5'h11):(1'h0)] wire118;
  wire [(3'h4):(1'h0)] wire117;
  wire [(3'h7):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire [(5'h11):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(3'h5):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  reg signed [(4'hc):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg97,
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
                 (1'h0)};
  assign wire68 = (~$signed($signed((wire65[(4'he):(3'h7)] || (&wire65)))));
  assign wire69 = $signed((($unsigned($unsigned(wire65)) ?
                      (wire67 || $signed(wire68)) : {(wire66 && wire64)}) ~^ wire64[(4'hb):(4'ha)]));
  assign wire70 = $unsigned((wire69 ~^ (($unsigned(wire68) ?
                          $signed(wire64) : (~(8'hb2))) ?
                      (wire68[(4'hc):(4'ha)] ?
                          (^~wire65) : wire64) : wire65[(1'h0):(1'h0)])));
  assign wire71 = ((~|$signed(wire68[(5'h11):(4'hd)])) ?
                      wire64 : $signed($signed(wire68)));
  assign wire72 = {((((wire64 < wire64) ? {wire66} : {wire65, (8'hb9)}) ?
                              wire66[(3'h5):(1'h0)] : (((7'h41) ?
                                  wire64 : wire71) >= wire69)) ?
                          (wire64 ?
                              (-$unsigned(wire69)) : (~&wire69)) : $unsigned((wire66[(3'h5):(3'h5)] >= $unsigned(wire67))))};
  assign wire73 = $unsigned(wire64);
  always
    @(posedge clk) begin
      if ((^~$unsigned({(!$unsigned(wire73))})))
        begin
          reg74 <= wire66;
          reg75 <= (($unsigned(($signed(wire73) ~^ (wire68 ?
                  (8'hb0) : wire70))) == (~|$unsigned((wire68 == wire71)))) ?
              $unsigned(wire69) : (|$unsigned({$signed(wire72), (~&wire66)})));
          if (({{{{wire70}}, $signed({reg75, wire73})},
              wire72} - (|(|(+wire69[(3'h4):(1'h1)])))))
            begin
              reg76 <= $unsigned(({(8'haa)} ?
                  (wire66[(2'h3):(1'h0)] ?
                      wire65[(1'h0):(1'h0)] : ($signed(wire67) ?
                          (reg74 < wire72) : $signed(reg75))) : (8'ha1)));
              reg77 <= wire66[(3'h4):(1'h0)];
              reg78 <= wire73[(2'h2):(1'h0)];
            end
          else
            begin
              reg76 <= $unsigned($unsigned(wire71[(5'h13):(3'h7)]));
              reg77 <= reg76;
              reg78 <= {{wire67},
                  ($unsigned((7'h41)) ?
                      reg78[(2'h3):(2'h3)] : wire71[(1'h1):(1'h0)])};
              reg79 <= $signed(reg77[(3'h6):(2'h3)]);
              reg80 <= wire71;
            end
          if ($unsigned(wire65))
            begin
              reg81 <= reg79[(4'ha):(4'ha)];
              reg82 <= wire66;
            end
          else
            begin
              reg81 <= reg76[(2'h3):(2'h3)];
            end
        end
      else
        begin
          reg74 <= ((~|$unsigned(((-wire73) ?
              (~|(8'ha3)) : (reg75 ? (7'h41) : wire66)))) - (8'hbd));
          reg75 <= reg81[(4'he):(4'hb)];
        end
    end
  always
    @(posedge clk) begin
      if (reg75)
        begin
          reg83 <= $unsigned((~^((reg78 ?
                  $unsigned(wire67) : wire64[(3'h6):(3'h4)]) ?
              $unsigned(wire65) : ($signed(reg82) <<< $unsigned(wire68)))));
          if (($unsigned(wire70[(4'h8):(3'h7)]) ?
              wire71[(3'h5):(3'h5)] : {reg79[(4'hb):(4'ha)], reg77}))
            begin
              reg84 <= (wire70 == {$signed($signed($unsigned(reg75)))});
              reg85 <= (|$unsigned({$signed((|reg84))}));
              reg86 <= $unsigned((~|({$unsigned((8'ha6)),
                      (wire70 ? reg75 : (8'hb3))} ?
                  {reg76[(2'h2):(2'h2)]} : reg84[(3'h4):(2'h3)])));
              reg87 <= ($unsigned((~^((8'haf) ? wire71 : (wire66 || reg86)))) ?
                  $signed(wire70[(2'h3):(2'h3)]) : wire64);
            end
          else
            begin
              reg84 <= wire68;
              reg85 <= ((wire69[(3'h4):(1'h0)] ?
                  ($signed((reg74 ?
                      wire73 : reg77)) && wire69[(3'h4):(3'h4)]) : reg87) != $unsigned(((&$unsigned(reg85)) >> (reg79 >= {(8'ha8),
                  reg83}))));
              reg86 <= (^((((8'hbe) > $unsigned(reg85)) && $unsigned((+wire70))) ?
                  wire71 : (((reg83 ?
                          wire71 : wire64) && reg87[(4'h8):(2'h2)]) ?
                      $signed($signed((8'hb2))) : $signed(reg74))));
            end
          reg88 <= reg78[(1'h0):(1'h0)];
          reg89 <= ((~($signed({reg82}) << ({reg87, reg75} ~^ (~wire67)))) ?
              $signed($unsigned($unsigned((7'h40)))) : (8'hb3));
        end
      else
        begin
          reg83 <= $signed(wire64[(2'h2):(1'h1)]);
          reg84 <= ((reg88 & $signed((|$unsigned(wire71)))) ?
              $unsigned(((reg74 * wire70[(1'h1):(1'h1)]) && ((~&reg75) ?
                  (~|(8'ha4)) : $unsigned(reg83)))) : reg74);
          reg85 <= reg85;
          reg86 <= (+reg76[(3'h7):(1'h0)]);
        end
      reg90 <= $signed((reg89 ~^ $signed(reg79)));
      reg91 <= (~^$unsigned((|(reg77[(3'h7):(2'h3)] <<< $unsigned(wire64)))));
    end
  assign wire92 = (($unsigned(reg84[(2'h3):(2'h3)]) ?
                      ((reg80 ^~ $signed(reg90)) ?
                          (+(|wire65)) : ((wire73 & wire68) & (wire66 & wire66))) : reg88[(1'h0):(1'h0)]) == (reg82 ?
                      $signed(wire71) : (8'ha3)));
  assign wire93 = reg75;
  assign wire94 = $signed(wire68[(3'h6):(3'h4)]);
  assign wire95 = ((~|(~^wire69[(3'h5):(2'h2)])) ?
                      (~reg76[(3'h4):(2'h3)]) : reg75[(4'h8):(3'h4)]);
  assign wire96 = $unsigned((reg84 ? reg82[(3'h4):(3'h4)] : reg75));
  always
    @(posedge clk) begin
      reg97 <= $unsigned(($unsigned((!reg76[(3'h7):(3'h6)])) ?
          reg79[(3'h5):(2'h2)] : reg74));
    end
  assign wire98 = (~^(!wire73));
  assign wire99 = ($unsigned(({$unsigned(wire92), reg97} ?
                      ((^~reg84) << wire64[(3'h4):(3'h4)]) : $unsigned(wire69))) && wire64[(4'hc):(4'h9)]);
  assign wire100 = (({$unsigned(wire92)} ?
                       (-{((8'ha4) ?
                               wire92 : reg97)}) : $unsigned((~&wire72[(2'h2):(1'h0)]))) && reg79[(3'h6):(3'h5)]);
  assign wire101 = (~|wire98[(2'h2):(2'h2)]);
  assign wire102 = (((8'h9f) ?
                           (($signed(reg91) | $unsigned(reg86)) ?
                               {(|(8'ha3))} : $signed($signed(wire98))) : ((reg87[(3'h7):(2'h3)] ^~ $signed(wire66)) ?
                               {(~&reg85),
                                   (wire66 ?
                                       reg77 : (8'haf))} : $unsigned(wire64))) ?
                       wire93[(4'he):(3'h7)] : (($unsigned($signed(wire68)) != $signed((reg79 ?
                               wire70 : wire68))) ?
                           wire69[(1'h0):(1'h0)] : wire99));
  always
    @(posedge clk) begin
      reg103 <= {wire98[(3'h5):(2'h3)], wire67};
      reg104 <= $signed({((^(~(8'ha5))) >>> ((^~wire73) < (~|reg77))),
          ((8'hb5) || {wire100[(4'hd):(4'h8)]})});
      if ($unsigned($unsigned(reg103[(3'h6):(2'h3)])))
        begin
          reg105 <= ((reg88[(1'h0):(1'h0)] ?
              $unsigned(((reg97 & reg80) ~^ $signed(reg80))) : ({(reg103 | reg82),
                      wire100[(4'h8):(3'h5)]} ?
                  reg88 : wire94)) + $unsigned((8'hb8)));
          reg106 <= ({(^$signed((8'hab)))} ?
              wire100[(3'h7):(3'h5)] : ($unsigned($unsigned(((8'hb2) & wire96))) >= (8'hba)));
          if ((^~($unsigned(wire72) ^ (reg74[(2'h3):(2'h2)] ^~ wire65))))
            begin
              reg107 <= {(reg86[(4'h8):(1'h0)] == {(-{reg86}),
                      (reg103[(2'h3):(1'h1)] ?
                          reg74[(4'h8):(3'h7)] : (reg87 * reg79))})};
              reg108 <= $unsigned(($unsigned(((reg83 ? wire69 : reg76) ?
                      (^wire67) : (wire73 ? reg91 : reg75))) ?
                  $unsigned($unsigned((~^reg78))) : reg104));
            end
          else
            begin
              reg107 <= $unsigned(reg75[(5'h15):(2'h2)]);
              reg108 <= ($unsigned({wire94,
                  (((8'hba) ?
                      wire70 : reg85) ^~ $unsigned(wire95))}) << (wire100 ?
                  ((8'hbb) << ({(8'had),
                      reg78} || (~reg74))) : $unsigned($unsigned(wire73[(3'h4):(2'h3)]))));
              reg109 <= (~|{(wire99[(3'h5):(1'h1)] ? wire98 : (7'h43))});
              reg110 <= ($signed(reg81) != $signed((&wire71)));
            end
          reg111 <= wire94[(4'ha):(2'h2)];
        end
      else
        begin
          reg105 <= reg87;
          if ($unsigned(reg111))
            begin
              reg106 <= reg103[(3'h4):(2'h2)];
              reg107 <= $signed($signed(($signed((wire64 ?
                  reg110 : (8'haa))) <<< reg87)));
              reg108 <= $signed(wire92);
              reg109 <= (reg111[(1'h0):(1'h0)] ?
                  (-(reg76 ?
                      $signed($unsigned(wire99)) : wire73[(1'h0):(1'h0)])) : wire99[(3'h7):(3'h5)]);
            end
          else
            begin
              reg106 <= {(&reg103)};
              reg107 <= $signed((-(!$signed(reg110[(3'h7):(2'h2)]))));
              reg108 <= ($signed(($unsigned($unsigned(reg82)) ?
                  ((reg83 ? (8'hb1) : reg79) ?
                      (reg109 ~^ (8'h9e)) : {wire73}) : wire99)) ^~ (^(((^~wire67) ?
                  reg74 : (reg78 ? (8'hbd) : reg104)) << ({reg110, reg76} ?
                  {reg97, wire66} : (reg89 || reg79)))));
              reg109 <= (8'h9d);
              reg110 <= $signed((&{reg90}));
            end
          reg111 <= (($unsigned((~&(wire67 ?
              reg87 : wire73))) >= (^~(reg80 ^ reg97[(1'h1):(1'h1)]))) * reg87[(3'h7):(3'h6)]);
          reg112 <= {((reg109[(5'h12):(5'h10)] >> $signed((reg85 ?
                      reg103 : wire72))) ?
                  (!$signed((8'hbb))) : reg103),
              (~&reg78)};
          reg113 <= $signed($signed((+wire68)));
        end
      reg114 <= wire72;
      reg115 <= (((-{$signed((8'hb0)),
          reg87[(4'h9):(3'h6)]}) >= (reg111[(3'h4):(2'h2)] ?
          $unsigned(((8'had) ?
              reg111 : (8'hb7))) : {(^reg84)})) | $signed(((wire93 != reg81) ?
          ({wire64,
              wire64} || (|wire71)) : (wire72[(1'h1):(1'h0)] >> $unsigned(reg114)))));
    end
  assign wire116 = ($signed({reg84}) + (reg97[(1'h1):(1'h1)] ?
                       $signed($signed((^wire69))) : $unsigned($signed($signed(reg106)))));
  assign wire117 = wire65;
  assign wire118 = (7'h40);
endmodule

module module38
#(parameter param59 = ({(8'ha2)} * (-((-((8'hbc) ? (8'hb0) : (8'hba))) ~^ ((8'had) >>> (^~(8'hb9)))))), 
parameter param60 = (~|((8'ha4) ? (param59 ? (~param59) : (((7'h42) ? param59 : param59) - (param59 ? param59 : param59))) : param59)))
(y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire43;
  input wire [(5'h12):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  input wire [(2'h2):(1'h0)] wire40;
  input wire [(3'h4):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire signed [(5'h11):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 (1'h0)};
  assign wire44 = {(+((~(wire39 ?
                          wire42 : wire40)) >>> ($signed(wire42) - (wire39 * wire40))))};
  assign wire45 = $unsigned($signed((8'h9f)));
  assign wire46 = (((wire44 << wire41[(5'h10):(1'h0)]) ? wire45 : wire40) ?
                      (~&$signed($signed($signed(wire45)))) : ((wire44[(4'hb):(1'h0)] ?
                              wire42 : wire43) ?
                          {((wire43 >= wire43) ?
                                  (wire39 ?
                                      wire43 : wire44) : $unsigned(wire44))} : $signed(({(8'ha7),
                              wire40} - $signed(wire40)))));
  assign wire47 = $unsigned(wire44[(4'hc):(1'h0)]);
  assign wire48 = ($signed(wire40) && wire41[(3'h7):(1'h1)]);
  assign wire49 = (-(wire42 ?
                      {$unsigned($signed(wire41)),
                          $unsigned((wire43 ?
                              (8'ha1) : (8'ha5)))} : (($unsigned(wire41) - (wire47 ?
                          wire45 : wire44)) < wire48[(2'h3):(2'h3)])));
  assign wire50 = $signed(($signed(((~wire44) ?
                      $signed(wire48) : (wire45 <= wire43))) <<< (wire48[(1'h0):(1'h0)] & (wire46 || $signed(wire40)))));
  assign wire51 = ({{(8'ha3)}} < $unsigned((~(8'ha7))));
  assign wire52 = ($unsigned(((+$unsigned(wire45)) >>> wire48)) ?
                      wire39[(3'h4):(1'h0)] : ($unsigned(({wire47} ?
                          (wire50 <= wire40) : wire46)) ~^ wire50[(1'h0):(1'h0)]));
  assign wire53 = $unsigned(wire43);
  assign wire54 = (($signed($signed($signed(wire45))) ?
                          (-(wire42[(3'h6):(3'h5)] + $unsigned(wire48))) : wire40) ?
                      $unsigned((!({(8'hb4), wire47} ?
                          wire50 : (|wire48)))) : wire48[(2'h3):(1'h1)]);
  assign wire55 = wire51[(1'h1):(1'h0)];
  assign wire56 = wire46;
  assign wire57 = {((wire52 ?
                          (~^(wire41 * wire50)) : $signed((wire41 > wire47))) >= (wire56 || wire52[(2'h3):(1'h0)]))};
  assign wire58 = wire57;
endmodule
