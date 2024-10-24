module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire227;
  wire [(5'h15):(1'h0)] wire226;
  wire [(3'h7):(1'h0)] wire225;
  wire [(4'h8):(1'h0)] wire223;
  wire [(5'h11):(1'h0)] wire222;
  wire signed [(3'h6):(1'h0)] wire221;
  wire signed [(5'h15):(1'h0)] wire214;
  wire [(5'h12):(1'h0)] wire213;
  wire [(3'h5):(1'h0)] wire212;
  wire signed [(4'hb):(1'h0)] wire211;
  wire [(3'h6):(1'h0)] wire210;
  wire signed [(4'hc):(1'h0)] wire208;
  wire [(4'hb):(1'h0)] wire206;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg215 = (1'h0);
  reg signed [(4'he):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg217 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg218 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg219 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg220 = (1'h0);
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire223,
                 wire222,
                 wire221,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire208,
                 wire206,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg215,
                 reg216,
                 reg217,
                 reg218,
                 reg219,
                 reg220,
                 (1'h0)};
  assign wire4 = (^wire0);
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= (~|(^({$signed(wire0)} ?
          ($unsigned((8'ha8)) ? wire1 : wire1) : wire5)));
      reg7 <= wire0;
      reg8 <= wire1;
      if (((~|($signed(wire0) ?
              (!(~&wire2)) : ((wire0 ? (8'hb6) : reg6) ? reg8 : (+(8'hb3))))) ?
          $unsigned(($signed({wire5, wire5}) ?
              ($signed(wire4) ^~ (wire0 <<< (8'hbe))) : (&reg6))) : wire0[(1'h0):(1'h0)]))
        begin
          reg9 <= (+{(8'ha7), $unsigned($signed(wire0[(4'h8):(1'h0)]))});
          reg10 <= reg6;
        end
      else
        begin
          reg9 <= ($unsigned(reg8[(1'h1):(1'h0)]) ?
              (($unsigned($signed(wire0)) ^ ((+wire4) != $unsigned(reg8))) ?
                  (((reg8 ? wire0 : (8'hba)) ?
                          (wire2 ? wire4 : wire2) : wire4[(2'h3):(1'h0)]) ?
                      (^(reg6 && wire4)) : $signed(reg6[(4'hc):(1'h1)])) : (reg10 + ($signed((8'hb6)) ?
                      reg10 : $signed(wire5)))) : ($unsigned($signed($unsigned(wire2))) * {(wire5 & $unsigned(wire5))}));
        end
      reg11 <= (reg9[(3'h6):(1'h1)] ?
          (8'hb9) : $signed((reg7[(1'h0):(1'h0)] > wire0[(2'h2):(2'h2)])));
    end
  assign wire12 = (wire1 ^~ reg11[(3'h4):(3'h4)]);
  assign wire13 = (|(&((^~$signed(reg6)) ?
                      $unsigned((wire0 >> reg8)) : ((wire5 ?
                          wire1 : (8'hab)) != {wire4, reg11}))));
  assign wire14 = (|reg7);
  assign wire15 = wire5;
  module16 #() modinst207 (.wire20(wire4), .wire21(reg11), .wire19(wire5), .clk(clk), .wire18(wire12), .y(wire206), .wire17(wire1));
  module70 #() modinst209 (.wire74(wire12), .wire72(reg6), .wire73(wire0), .wire71(reg8), .y(wire208), .clk(clk));
  assign wire210 = $signed($unsigned(($unsigned($signed(wire206)) ^~ (-$signed(wire2)))));
  assign wire211 = wire0;
  assign wire212 = ((~&(~(&(7'h44)))) << (($signed($signed(reg10)) >= $unsigned({(8'ha1),
                           wire12})) ?
                       (~|(8'ha3)) : wire0[(4'h9):(3'h7)]));
  assign wire213 = reg10[(4'hb):(3'h5)];
  assign wire214 = wire3;
  always
    @(posedge clk) begin
      if ($unsigned((8'ha6)))
        begin
          reg215 <= ($signed((reg6 ?
                  ((7'h41) != wire213) : wire14[(4'h8):(3'h7)])) ?
              reg11[(4'ha):(4'ha)] : wire214[(3'h4):(2'h3)]);
          reg216 <= reg9;
          reg217 <= reg8[(1'h0):(1'h0)];
        end
      else
        begin
          reg215 <= reg7[(4'h9):(2'h3)];
          reg216 <= $signed($unsigned(wire12[(3'h4):(2'h2)]));
          if (({$unsigned((^(~^reg8))), wire0} ?
              wire0[(4'h9):(1'h1)] : (((reg10[(1'h0):(1'h0)] ?
                      (^wire2) : {reg215}) ?
                  wire206 : (|$signed(reg216))) != $signed((~|(reg217 ?
                  (8'hbf) : (8'ha1)))))))
            begin
              reg217 <= {($unsigned({(wire12 ? wire211 : (8'hb0)),
                          $signed(wire13)}) ?
                      wire13 : (wire4[(4'h9):(3'h7)] < {$signed((7'h43))}))};
            end
          else
            begin
              reg217 <= $signed(((|(~|wire1[(3'h7):(2'h3)])) ?
                  $signed({$signed(wire13)}) : $unsigned(wire15)));
              reg218 <= wire2;
            end
          reg219 <= (~(!{$signed({reg10})}));
        end
      reg220 <= wire3;
    end
  assign wire221 = reg220;
  assign wire222 = $signed((wire4 ?
                       wire212 : ($unsigned((+(8'ha6))) ?
                           (~|wire212) : (~^wire3))));
  module108 #() modinst224 (wire223, clk, wire3, wire0, wire212, reg10, wire13);
  assign wire225 = $unsigned(wire208[(3'h6):(2'h3)]);
  assign wire226 = (reg7[(5'h11):(2'h2)] ?
                       (reg220 ?
                           (!$signed((wire15 ?
                               wire214 : wire214))) : $signed(((wire5 + wire3) ?
                               $unsigned(reg219) : (8'hbf)))) : (+(wire211 << (!wire210))));
  assign wire227 = (-$unsigned({(reg8[(1'h0):(1'h0)] ? wire12 : (^(8'haa))),
                       reg219}));
endmodule

module module16
#(parameter param204 = (({(~^(!(8'ha1)))} ? ((^(^~(8'hbe))) << ((~^(8'h9c)) << {(8'ha1), (8'ha0)})) : {{((8'haa) <<< (7'h43)), ((8'hb1) <= (8'h9c))}}) != (((~|((8'h9d) | (8'hab))) ? (8'hb7) : (((8'ha3) ? (8'hb0) : (7'h43)) ? ((8'ha7) ? (8'ha5) : (8'ha0)) : (+(8'hb3)))) ? ((~^(~^(8'h9c))) ? (&{(8'h9c)}) : (((7'h43) ? (8'ha7) : (8'hbf)) & ((8'hb7) - (7'h44)))) : (^(((8'had) || (8'ha8)) ? ((8'ha0) ? (8'ha1) : (8'hb8)) : ((8'hb1) ? (8'hba) : (8'hb0)))))), 
parameter param205 = (8'hbd))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h1a5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(4'hb):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire164;
  wire signed [(4'hb):(1'h0)] wire96;
  wire [(3'h7):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(2'h2):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire167;
  wire signed [(3'h6):(1'h0)] wire171;
  wire [(3'h6):(1'h0)] wire202;
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  assign y = {wire164,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire91,
                 wire89,
                 wire69,
                 wire67,
                 wire30,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire166,
                 wire167,
                 wire171,
                 wire202,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg93,
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
                 reg168,
                 reg169,
                 reg170,
                 (1'h0)};
  assign wire22 = $signed($signed($signed({(~&(8'h9f)), $unsigned(wire21)})));
  assign wire23 = (8'h9e);
  assign wire24 = $unsigned(wire23[(2'h2):(2'h2)]);
  assign wire25 = (wire20 ?
                      ((-wire22[(2'h2):(2'h2)]) ?
                          (8'hbe) : {wire21}) : $signed(wire19[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      reg26 <= (($unsigned(({wire23, wire18} ?
          $signed(wire20) : ((8'ha7) ?
              wire17 : wire25))) >>> $signed(wire17[(1'h1):(1'h1)])) <= ((~&$signed({wire17,
          wire23})) + (~^{wire19, (-(8'ha8))})));
      reg27 <= (^~$unsigned((~wire20)));
      reg28 <= (wire20[(3'h7):(3'h6)] ~^ wire24[(2'h2):(1'h1)]);
      reg29 <= ((|(wire24[(2'h3):(1'h0)] + (8'ha8))) >> wire25);
    end
  assign wire30 = (wire19 > reg26[(2'h3):(2'h2)]);
  module31 #() modinst68 (.wire33(wire21), .y(wire67), .wire32(reg26), .clk(clk), .wire34(wire20), .wire36(wire24), .wire35(wire22));
  assign wire69 = $signed((~{$unsigned((wire22 ? (8'haf) : (8'hb0))),
                      $signed($unsigned(wire22))}));
  module70 #() modinst90 (wire89, clk, wire25, wire30, wire20, wire18);
  assign wire91 = $signed(wire22[(4'hb):(1'h1)]);
  assign wire92 = $unsigned(((((~reg29) ? wire20[(4'h9):(4'h9)] : (~wire25)) ?
                      wire21 : $signed(wire23)) < $unsigned($unsigned((wire19 < wire23)))));
  always
    @(posedge clk) begin
      reg93 <= ($unsigned($unsigned((+$unsigned(wire25)))) ?
          wire20 : reg28[(2'h3):(2'h3)]);
    end
  assign wire94 = {$unsigned((~(&wire19[(3'h6):(3'h6)]))),
                      {({(~|wire23)} ?
                              {wire22, wire69} : $unsigned($unsigned((8'hbb)))),
                          $signed(($unsigned(reg27) == $signed(reg93)))}};
  assign wire95 = $signed($signed((8'hb5)));
  assign wire96 = $unsigned(wire67[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg97 <= wire30[(1'h1):(1'h0)];
      reg98 <= $unsigned((8'ha7));
      if ((^wire94))
        begin
          reg99 <= (wire30[(1'h1):(1'h0)] ~^ (wire24[(1'h1):(1'h1)] ?
              (+{$unsigned(wire96)}) : (wire20 && wire92[(5'h13):(3'h5)])));
          reg100 <= (~&(~|(($unsigned(reg26) < (wire22 & (8'ha3))) ?
              reg26[(1'h1):(1'h1)] : (&reg26[(3'h7):(1'h1)]))));
          if (($signed(((~|wire30[(4'hb):(2'h2)]) ?
              wire25[(4'ha):(3'h7)] : (~|$unsigned(reg98)))) <<< {($unsigned(reg97[(5'h10):(4'hc)]) ?
                  $unsigned((8'hb1)) : wire69[(3'h7):(3'h5)])}))
            begin
              reg101 <= $unsigned($signed((((reg97 + reg29) > reg28) - ((+reg28) ?
                  (8'hb7) : (reg28 ? wire96 : reg26)))));
              reg102 <= $unsigned((~$unsigned($signed(wire17[(1'h1):(1'h0)]))));
              reg103 <= $unsigned(reg99);
              reg104 <= $unsigned((reg101 ?
                  $unsigned((^~$unsigned(wire24))) : ((|wire19[(1'h1):(1'h1)]) ?
                      wire94[(2'h3):(1'h0)] : (~|(reg26 ? wire92 : reg100)))));
              reg105 <= wire18;
            end
          else
            begin
              reg101 <= ($unsigned((((wire22 - reg97) ?
                          reg104 : $signed(wire22)) ?
                      (~&(wire21 ? reg97 : reg99)) : (wire19[(2'h3):(2'h2)] ?
                          {reg99, wire30} : {wire17}))) ?
                  {$unsigned({(wire23 ? wire17 : reg105),
                          reg102[(1'h1):(1'h1)]})} : $unsigned(reg29));
            end
        end
      else
        begin
          reg99 <= $unsigned((^reg104));
          if (({reg29} & {($signed((wire22 ?
                  reg103 : (8'hbe))) < ($signed(reg99) < wire91[(1'h0):(1'h0)])),
              $unsigned(wire23)}))
            begin
              reg100 <= (($signed((+((8'h9f) && reg26))) >> (($unsigned(wire21) ?
                      (-(8'haa)) : reg29) * reg93)) ?
                  ($signed(wire21) ?
                      (|reg97[(3'h7):(2'h2)]) : wire19) : ((8'ha4) != (8'h9d)));
              reg101 <= (&($signed($signed(wire19)) * wire23[(1'h1):(1'h0)]));
              reg102 <= wire96;
            end
          else
            begin
              reg100 <= $unsigned({($signed(wire89[(2'h3):(2'h2)]) < (wire22[(2'h2):(2'h2)] ?
                      wire67 : (~^reg97)))});
              reg101 <= wire18;
            end
          reg103 <= reg93[(1'h1):(1'h1)];
          reg104 <= (8'ha6);
        end
      reg106 <= ((8'ha8) ? (reg26 ? wire92 : wire95) : reg93);
      reg107 <= $unsigned($unsigned((wire21[(4'hf):(4'ha)] == ((wire67 >> wire24) ?
          $unsigned(reg98) : wire19))));
    end
  module108 #() modinst165 (.wire110(reg103), .wire113(reg29), .y(wire164), .wire111(wire94), .wire112(wire25), .wire109(wire89), .clk(clk));
  assign wire166 = $unsigned(wire94[(2'h3):(1'h1)]);
  assign wire167 = reg107[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg168 <= wire92;
      reg169 <= reg26[(1'h1):(1'h0)];
      reg170 <= $signed(({reg93} ^~ reg168[(1'h0):(1'h0)]));
    end
  assign wire171 = ($unsigned($signed((+(&wire17)))) > $signed($signed($signed(wire24[(3'h6):(3'h6)]))));
  module172 #() modinst203 (wire202, clk, wire30, wire25, reg105, wire167);
endmodule

module module172  (y, clk, wire176, wire175, wire174, wire173);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire176;
  input wire signed [(4'hc):(1'h0)] wire175;
  input wire [(5'h12):(1'h0)] wire174;
  input wire [(5'h10):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire201;
  wire signed [(4'hd):(1'h0)] wire200;
  wire [(2'h2):(1'h0)] wire196;
  wire signed [(5'h11):(1'h0)] wire195;
  wire signed [(5'h14):(1'h0)] wire194;
  wire [(4'h8):(1'h0)] wire193;
  wire [(5'h10):(1'h0)] wire192;
  wire signed [(4'h9):(1'h0)] wire191;
  wire signed [(3'h6):(1'h0)] wire190;
  wire [(4'hc):(1'h0)] wire189;
  wire signed [(4'h8):(1'h0)] wire188;
  wire signed [(5'h12):(1'h0)] wire187;
  wire [(4'hb):(1'h0)] wire186;
  wire [(4'hb):(1'h0)] wire185;
  wire signed [(5'h13):(1'h0)] wire184;
  wire [(4'hf):(1'h0)] wire183;
  wire [(4'hd):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire179;
  wire signed [(4'hb):(1'h0)] wire178;
  wire [(4'hd):(1'h0)] wire177;
  reg [(3'h5):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 reg199,
                 reg198,
                 reg197,
                 reg182,
                 (1'h0)};
  assign wire177 = wire176[(2'h3):(1'h0)];
  assign wire178 = (^wire174);
  assign wire179 = $unsigned($signed(wire175));
  assign wire180 = $unsigned($unsigned({{wire175}, wire179}));
  assign wire181 = wire176;
  always
    @(posedge clk) begin
      reg182 <= {wire177};
    end
  assign wire183 = reg182[(1'h0):(1'h0)];
  assign wire184 = wire180;
  assign wire185 = {{$unsigned($unsigned((8'ha7))), (8'hb6)}};
  assign wire186 = $unsigned((~($signed((wire180 << (7'h44))) <= ((wire178 ?
                           (7'h42) : (8'ha5)) ?
                       wire184[(2'h3):(2'h2)] : (wire181 ?
                           wire181 : wire176)))));
  assign wire187 = ((8'ha5) ? wire177 : (8'ha3));
  assign wire188 = wire176;
  assign wire189 = (wire186 < $unsigned($unsigned(wire186[(3'h7):(1'h0)])));
  assign wire190 = wire181[(4'h9):(3'h5)];
  assign wire191 = {{{(+(wire183 ? wire188 : (8'ha0))), (~^$unsigned((8'ha2)))},
                           $unsigned(($signed(wire179) & (^wire179)))},
                       {$signed($signed($signed(wire184)))}};
  assign wire192 = (~$signed(reg182[(3'h4):(1'h0)]));
  assign wire193 = wire181;
  assign wire194 = {(^(^~{$unsigned((8'ha8)), (wire191 > (8'hbb))})),
                       wire173[(4'hf):(3'h4)]};
  assign wire195 = (wire194 != (~|wire180));
  assign wire196 = wire189[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg197 <= wire178;
      reg198 <= $signed(wire187);
      reg199 <= $signed(($unsigned((+{(8'h9e)})) ?
          $unsigned(wire175) : (reg197 ?
              $signed({(8'ha7)}) : wire178[(3'h4):(3'h4)])));
    end
  assign wire200 = $signed(($unsigned($signed((wire192 ?
                       wire187 : (8'ha1)))) >>> $signed(({wire180} >>> wire190[(3'h5):(1'h0)]))));
  assign wire201 = ($signed(reg198) <<< wire179);
endmodule

module module108
#(parameter param163 = (-{((^((8'ha1) ? (8'hbf) : (7'h40))) * (!((8'haa) | (8'had))))}))
(y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire113;
  input wire signed [(4'ha):(1'h0)] wire112;
  input wire signed [(2'h3):(1'h0)] wire111;
  input wire [(5'h13):(1'h0)] wire110;
  input wire signed [(5'h11):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire162;
  wire signed [(3'h4):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire123;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire114;
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg158 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg157 = (1'h0);
  reg [(3'h6):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg [(2'h2):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(4'he):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg132 = (1'h0);
  reg [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(4'ha):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  assign y = {wire162,
                 wire127,
                 wire124,
                 wire123,
                 wire115,
                 wire114,
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
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
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
                 reg126,
                 reg125,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire114 = $signed(wire113);
  assign wire115 = {$signed((~((wire111 << wire109) > (wire109 >> wire110))))};
  always
    @(posedge clk) begin
      reg116 <= ((8'h9d) ?
          (wire110 ^ (wire111 >= ({wire111} ?
              $unsigned(wire112) : $unsigned(wire111)))) : wire109[(4'h9):(4'h8)]);
      reg117 <= wire114[(1'h1):(1'h0)];
      if (wire112)
        begin
          reg118 <= wire113[(4'hc):(4'h8)];
          if ($signed({reg117[(4'h8):(3'h6)]}))
            begin
              reg119 <= ({(|($signed(wire115) ?
                          $signed((8'hb4)) : (reg116 ? wire110 : (8'hb5)))),
                      (wire111[(1'h0):(1'h0)] <<< $signed((^wire114)))} ?
                  $signed({((8'haa) ^~ $unsigned(wire115)),
                      {reg117}}) : $signed((((|wire110) ?
                          (wire115 ? (8'h9e) : reg116) : $signed(wire111)) ?
                      ($unsigned(wire115) ^ (wire112 ?
                          wire109 : reg117)) : (~^(!reg118)))));
            end
          else
            begin
              reg119 <= ($unsigned($signed((8'hbf))) | wire110);
            end
          reg120 <= (-wire110);
        end
      else
        begin
          reg118 <= reg119[(5'h10):(3'h6)];
          reg119 <= {wire111, $signed(reg119)};
          reg120 <= wire110[(5'h12):(5'h10)];
        end
      reg121 <= wire112[(1'h1):(1'h1)];
      reg122 <= ((({(-(8'hb1)),
              wire111[(2'h2):(2'h2)]} < ($unsigned((8'ha8)) * wire111)) ?
          ((~^(8'hab)) ?
              $unsigned(wire111[(1'h0):(1'h0)]) : ((7'h44) ?
                  {reg118,
                      reg117} : (~|wire113))) : $unsigned(reg118)) != $unsigned({wire110}));
    end
  assign wire123 = ($signed((reg120 == $signed(wire115[(3'h5):(3'h4)]))) >> $signed((wire112 ~^ reg122[(3'h5):(3'h5)])));
  assign wire124 = (((!wire114) ?
                       ({$unsigned((7'h44))} >= $signed((|wire115))) : (((wire112 ?
                                   reg118 : wire113) ?
                               (wire123 ? reg118 : reg117) : $signed(wire115)) ?
                           wire109 : $signed($signed((8'hb4))))) > ((reg121[(4'ha):(1'h0)] + reg116) + (((wire109 ?
                           reg117 : (8'ha1)) ?
                       wire123[(4'he):(1'h1)] : wire114) < reg120[(3'h4):(1'h0)])));
  always
    @(posedge clk) begin
      reg125 <= (8'hb3);
      reg126 <= (+$signed({($signed(reg120) == $signed((8'hab)))}));
    end
  assign wire127 = wire115;
  always
    @(posedge clk) begin
      if (reg118[(4'hf):(1'h1)])
        begin
          reg128 <= ($unsigned($signed($unsigned((+reg125)))) ?
              reg119 : $unsigned((~&{$signed(wire109), (!reg122)})));
          reg129 <= $signed($unsigned((!(reg128[(1'h1):(1'h0)] >= (reg119 ?
              wire110 : reg117)))));
          reg130 <= {wire113};
        end
      else
        begin
          if (reg129[(1'h1):(1'h0)])
            begin
              reg128 <= (reg121[(3'h4):(2'h2)] < wire124[(2'h2):(1'h0)]);
            end
          else
            begin
              reg128 <= {$unsigned((($signed(wire114) != reg117) <<< reg116[(4'h9):(4'h8)])),
                  (reg130 && wire110)};
              reg129 <= $unsigned((-reg121));
            end
          reg130 <= reg126;
          reg131 <= reg118;
          if ($signed($unsigned(((8'haa) == (|reg121[(3'h6):(2'h3)])))))
            begin
              reg132 <= {$signed(({(wire124 + (8'ha8))} <<< (wire109[(1'h1):(1'h1)] ?
                      wire112 : wire113)))};
            end
          else
            begin
              reg132 <= $unsigned((8'hbb));
              reg133 <= $signed((8'hb2));
            end
        end
    end
  always
    @(posedge clk) begin
      reg134 <= (reg117[(4'hc):(2'h2)] ?
          $signed($unsigned((+(reg120 && reg121)))) : (($signed($unsigned(reg125)) ?
              (~&reg121[(1'h1):(1'h1)]) : ($unsigned((8'hae)) == reg117)) < reg133));
      reg135 <= $signed(($unsigned(wire111) << $signed({(!reg129), reg128})));
    end
  always
    @(posedge clk) begin
      reg136 <= {$unsigned($unsigned((~|reg134)))};
      reg137 <= (^$signed((~^({reg133} ?
          ((8'hb1) <<< reg133) : {wire127, wire110}))));
      if (({$signed({(8'ha2), wire110})} ?
          $signed({reg128[(1'h0):(1'h0)],
              reg122[(3'h4):(1'h0)]}) : (+wire123[(1'h0):(1'h0)])))
        begin
          reg138 <= $unsigned(reg130[(4'ha):(2'h3)]);
          if (reg126)
            begin
              reg139 <= (wire109[(4'he):(1'h0)] ?
                  ({$unsigned((|(8'haf))), $unsigned(((8'hb4) <<< reg120))} ?
                      wire115 : $unsigned($unsigned((-reg132)))) : (!($signed(reg132) ?
                      wire113 : reg118)));
            end
          else
            begin
              reg139 <= reg137[(3'h5):(3'h5)];
              reg140 <= $unsigned(($unsigned(wire110) ?
                  (^{$signed(reg126), wire111}) : (^reg131)));
              reg141 <= (8'h9c);
              reg142 <= reg139;
            end
          reg143 <= (!(($unsigned(reg117[(3'h6):(2'h3)]) ?
                  ((reg141 == reg122) << wire110[(1'h0):(1'h0)]) : reg117[(4'hb):(4'h9)]) ?
              (~&$signed(wire113)) : $signed((~^(wire110 ^ reg125)))));
        end
      else
        begin
          reg138 <= $signed({($unsigned(reg120[(2'h3):(2'h2)]) <= reg122)});
          reg139 <= $signed(reg138[(1'h1):(1'h0)]);
          reg140 <= (~^$signed((((wire114 << reg128) ?
              $unsigned(wire113) : ((8'h9e) != reg132)) - $signed($signed((8'h9e))))));
        end
      reg144 <= ($unsigned($signed(($unsigned((8'ha2)) ?
          wire115[(3'h4):(2'h2)] : (wire124 ?
              reg121 : wire127)))) << $unsigned($signed(((reg132 ?
              reg133 : wire127) ?
          reg125[(3'h5):(3'h4)] : (^reg139)))));
      reg145 <= (($signed($signed((reg116 && (8'hb1)))) >> ((-(reg144 || (8'hae))) ?
              reg118 : (reg139 <<< reg119))) ?
          (8'hbd) : (-reg120));
    end
  always
    @(posedge clk) begin
      reg146 <= $unsigned(reg116[(3'h5):(2'h3)]);
      if ((|$unsigned(((~reg125[(3'h4):(1'h0)]) ~^ wire115))))
        begin
          reg147 <= ((^reg119) ^ {reg118});
          reg148 <= (~$signed((~&$signed($unsigned(reg128)))));
          reg149 <= (reg117 - $signed(($unsigned(((8'hbe) == reg147)) ?
              $unsigned($unsigned(reg128)) : ($signed(reg134) ^ $unsigned(wire112)))));
          reg150 <= reg141;
          reg151 <= ((&reg117) & ((~^($signed(reg148) ?
              (+reg138) : {reg149})) >> $signed((~|reg134[(5'h11):(3'h5)]))));
        end
      else
        begin
          if (({({(^~reg131)} >> ($signed(reg149) ?
                  reg145[(1'h1):(1'h0)] : (wire112 ?
                      reg150 : reg131)))} >>> ($unsigned($unsigned(wire123)) < (($signed(reg140) << reg144) >> $signed($unsigned(reg145))))))
            begin
              reg147 <= {{(((reg134 & (8'hb5)) ^ reg141) ?
                          $unsigned((reg128 << reg148)) : (8'ha5))}};
              reg148 <= reg147;
            end
          else
            begin
              reg147 <= reg143;
              reg148 <= (^~(~^((((8'haa) ?
                      (8'h9d) : reg134) & $unsigned((8'ha4))) ?
                  $unsigned((!wire109)) : $unsigned((!(8'h9c))))));
              reg149 <= reg147;
            end
          if ($unsigned(reg134[(2'h3):(2'h2)]))
            begin
              reg150 <= $signed(reg135);
              reg151 <= reg134[(1'h0):(1'h0)];
              reg152 <= reg134[(4'ha):(1'h1)];
            end
          else
            begin
              reg150 <= reg150;
            end
          reg153 <= ((wire124 & $unsigned(reg145[(3'h5):(3'h5)])) <= {(({wire115} >>> $signed(reg119)) - {(~|reg135)})});
          reg154 <= reg136;
        end
      reg155 <= wire111;
      reg156 <= ({(reg151 || (8'ha3)),
          $signed($unsigned((|reg121)))} && reg125[(3'h6):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg157 <= reg144;
      reg158 <= $unsigned(reg129);
      reg159 <= $unsigned(wire111[(2'h3):(1'h1)]);
      reg160 <= (reg157[(1'h1):(1'h0)] ?
          (~^$unsigned((~|$unsigned(reg119)))) : ($signed($signed({reg136})) ?
              reg148 : (+wire109)));
      reg161 <= ($unsigned($signed(($unsigned(reg159) ?
              (reg119 << reg138) : reg130[(4'hb):(1'h1)]))) ?
          $signed((($unsigned(reg152) >> (~^reg132)) <= {reg157[(1'h0):(1'h0)],
              reg117[(4'ha):(3'h5)]})) : ($unsigned(((reg150 << reg145) != (|reg120))) ?
              $unsigned(reg131) : (!((reg141 ~^ reg156) <= (reg155 ?
                  wire113 : reg130)))));
    end
  assign wire162 = reg151[(2'h2):(1'h0)];
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire74;
  input wire signed [(4'he):(1'h0)] wire73;
  input wire [(5'h14):(1'h0)] wire72;
  input wire [(3'h5):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  assign y = {wire87,
                 wire85,
                 wire83,
                 wire82,
                 wire81,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg88,
                 reg86,
                 reg84,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire75 = (($signed($signed((~^wire74))) ?
                          $unsigned($signed($unsigned(wire73))) : ($signed((+wire74)) <= ($signed(wire71) + $signed(wire71)))) ?
                      (wire73 ?
                          wire72[(5'h10):(3'h5)] : (~&wire71)) : $unsigned(($signed((wire72 ?
                              wire74 : wire72)) ?
                          ((wire72 | (8'had)) ?
                              (wire73 ~^ wire72) : $signed(wire72)) : (-$unsigned(wire73)))));
  assign wire76 = $unsigned((|wire71));
  assign wire77 = (wire75[(4'hf):(1'h1)] + wire74[(4'hb):(3'h7)]);
  assign wire78 = wire71;
  always
    @(posedge clk) begin
      reg79 <= (((($unsigned(wire72) || ((8'ha7) ?
              wire78 : wire73)) != wire78[(4'hd):(4'h9)]) & (8'ha4)) ?
          wire73[(3'h5):(1'h1)] : $unsigned($unsigned(wire74[(1'h0):(1'h0)])));
      reg80 <= (({($unsigned(wire71) <<< (~^wire78))} ?
          $signed($signed((-(8'hbd)))) : $signed(({wire73} ?
              wire72[(1'h1):(1'h1)] : wire72[(3'h4):(1'h1)]))) || {wire72[(5'h11):(4'ha)]});
    end
  assign wire81 = wire77[(5'h12):(2'h3)];
  assign wire82 = ({(reg79[(3'h5):(2'h2)] >> (&(-(8'h9c))))} ?
                      ($unsigned($signed((8'hba))) ?
                          $signed(((wire74 == wire72) ^~ {wire72,
                              wire78})) : ((^~wire75) >>> ($signed(wire73) ~^ {(8'hbd)}))) : wire81);
  assign wire83 = (wire77 << {(~|reg80[(3'h5):(2'h2)]),
                      (((wire71 ?
                          wire74 : (8'hb2)) || $unsigned(wire74)) + $unsigned($signed(wire82)))});
  always
    @(posedge clk) begin
      if (wire78[(4'he):(4'hc)])
        begin
          reg84 <= (!(~|{$signed((wire82 == wire72)),
              ($signed(wire77) || {wire72, wire78})}));
        end
      else
        begin
          reg84 <= wire82[(3'h6):(3'h4)];
        end
    end
  assign wire85 = $unsigned($signed(($unsigned($signed(reg80)) ?
                      $signed($signed(wire76)) : ((-wire71) ?
                          ((8'hb9) ? wire71 : wire71) : (wire77 >= (8'hb2))))));
  always
    @(posedge clk) begin
      reg86 <= {((&$signed({(8'hba)})) ^ (~&wire82[(2'h3):(2'h2)]))};
    end
  assign wire87 = ((+(!wire83)) ?
                      {wire75,
                          (^$signed((wire71 | wire74)))} : wire71[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg88 <= wire71;
    end
endmodule

module module31
#(parameter param65 = ((^(|(+((8'hb8) ? (8'had) : (8'hbb))))) ? {((((8'hb6) >= (8'hb0)) << ((8'ha7) - (8'hbc))) ? (~{(8'h9e), (8'hb9)}) : (((8'h9d) ? (8'ha6) : (8'hb6)) ^ ((8'hac) ? (7'h43) : (8'hbf)))), ((((8'haf) ? (8'hb3) : (8'ha7)) ? (&(8'hb5)) : ((8'ha4) >> (8'hb8))) ? ({(8'ha8)} ? {(7'h41), (8'haa)} : ((8'hbd) >> (7'h41))) : (((8'haa) == (8'hb0)) ? ((8'hb8) - (8'hb5)) : ((8'hbb) > (7'h44))))} : ({(8'h9e), (((8'hac) ? (8'haa) : (7'h41)) | ((8'hbf) ? (8'hbc) : (8'ha5)))} ? ((8'hb1) ? ({(8'haa), (8'ha2)} <= ((8'ha2) >> (8'hb3))) : (((8'hbb) + (8'ha0)) & ((8'h9e) || (8'hb8)))) : (+(8'hb6)))), 
parameter param66 = (param65 | param65))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h172):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire [(5'h14):(1'h0)] wire34;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(5'h10):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg59,
                 reg58,
                 reg57,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg37 <= {(({$signed((8'ha8)), wire36[(1'h0):(1'h0)]} ?
                  wire36 : $signed({(8'h9c)})) ?
              $signed((wire34 ?
                  (wire34 ? wire33 : wire32) : (wire32 ?
                      wire35 : wire35))) : $unsigned(($unsigned(wire33) == wire36))),
          $signed($signed({((8'haa) ? wire35 : wire34), {wire34, wire36}}))};
      reg38 <= ({$signed(reg37), (^~$unsigned(wire34))} ?
          wire34[(4'hd):(1'h1)] : $unsigned($signed($unsigned((wire34 != wire34)))));
      reg39 <= wire34[(4'hf):(4'hf)];
      if (reg38[(2'h3):(2'h2)])
        begin
          reg40 <= wire34;
        end
      else
        begin
          reg40 <= (wire32 ~^ ((~&{wire33}) ?
              $signed((8'hb5)) : ((8'ha4) ?
                  ($signed(reg39) << (^~reg37)) : $unsigned(wire33[(4'h8):(1'h0)]))));
        end
    end
  assign wire41 = (wire35[(4'he):(4'h8)] ?
                      $unsigned($unsigned(reg39[(3'h5):(3'h4)])) : (8'hb5));
  assign wire42 = wire33;
  assign wire43 = wire33[(5'h12):(2'h2)];
  assign wire44 = ((8'hae) > wire32);
  always
    @(posedge clk) begin
      reg45 <= (^~wire42);
      if (($signed(($signed(wire33[(5'h12):(4'he)]) ?
          $signed(reg38) : $unsigned($signed(wire35)))) < wire34))
        begin
          reg46 <= $signed($signed(reg37));
          reg47 <= reg40[(1'h0):(1'h0)];
          if ($unsigned(({$unsigned({reg40})} ?
              $signed(((8'ha3) ^ $signed(wire42))) : (^~$unsigned($unsigned(reg46))))))
            begin
              reg48 <= (reg39[(3'h6):(3'h5)] ?
                  $signed($signed($unsigned((reg39 ? reg40 : reg39)))) : reg38);
              reg49 <= ((reg48 ?
                      ((reg39 ?
                          (reg40 == wire43) : wire34[(3'h6):(3'h5)]) && ((|(8'haa)) ?
                          $signed(reg45) : $unsigned(reg37))) : reg37[(4'h9):(1'h1)]) ?
                  reg48 : $unsigned($unsigned(((reg40 ? reg38 : reg45) ?
                      (~&wire34) : (^reg37)))));
              reg50 <= reg37[(4'h8):(4'h8)];
            end
          else
            begin
              reg48 <= ($unsigned((reg39 ?
                  wire36 : $signed((~&(8'ha3))))) && (wire33[(3'h5):(3'h4)] ?
                  $unsigned($unsigned((reg47 > reg38))) : (-(wire34[(3'h6):(2'h2)] ?
                      ((8'had) ? reg38 : reg46) : $unsigned((8'haf))))));
              reg49 <= $signed(((($signed(reg39) == $unsigned(wire41)) ?
                  ((reg39 ? reg39 : wire35) ?
                      reg46 : $signed(reg50)) : ($unsigned(wire35) ^ ((8'haa) ?
                      reg40 : (8'hb2)))) << $signed(reg40[(3'h4):(1'h0)])));
              reg50 <= $signed({{((^reg47) <= $signed(reg48)),
                      $unsigned($signed(reg46))},
                  (8'haa)});
              reg51 <= $signed((reg45[(4'hc):(4'hb)] ?
                  (((wire32 ? reg39 : reg45) ?
                      $signed((7'h42)) : (-(8'ha4))) | (((8'hae) ~^ reg37) ?
                      reg50[(1'h1):(1'h1)] : {wire44})) : (8'hb7)));
            end
        end
      else
        begin
          if ((reg38[(3'h4):(1'h0)] + wire43[(5'h11):(4'hb)]))
            begin
              reg46 <= $unsigned(wire33);
            end
          else
            begin
              reg46 <= reg40;
            end
          reg47 <= {wire35[(4'ha):(2'h2)], $unsigned($unsigned((^(!reg46))))};
          reg48 <= reg47[(4'ha):(2'h2)];
        end
    end
  assign wire52 = (~|reg39);
  assign wire53 = ((!reg38) ?
                      reg47[(2'h2):(1'h0)] : $unsigned({{(~^(8'hb3)),
                              wire36}}));
  assign wire54 = (wire36[(1'h0):(1'h0)] >= {($signed((reg37 ?
                          reg37 : wire41)) - $signed(wire42)),
                      reg46[(2'h2):(1'h0)]});
  assign wire55 = wire53;
  assign wire56 = (8'hba);
  always
    @(posedge clk) begin
      reg57 <= {$signed(wire54[(1'h1):(1'h1)]),
          ($signed(wire52[(4'h9):(3'h7)]) >= (reg50[(2'h3):(2'h3)] ?
              (wire56 && $signed(reg49)) : $signed((wire43 ~^ wire34))))};
      reg58 <= ((reg57 - reg45) ?
          wire43[(5'h11):(3'h5)] : $unsigned(({reg50[(1'h0):(1'h0)],
                  $signed(wire56)} ?
              (-$unsigned(wire52)) : (~^wire52[(4'hf):(4'h9)]))));
      reg59 <= (^{($unsigned((wire41 ? wire55 : reg51)) ?
              (^$unsigned(reg49)) : ((wire33 && reg47) ?
                  wire44[(1'h0):(1'h0)] : wire41)),
          $signed(reg38[(1'h0):(1'h0)])});
    end
  assign wire60 = {wire36[(2'h3):(2'h3)],
                      (~&{$signed(((7'h43) ? reg59 : wire44)), (8'hb9)})};
  assign wire61 = (~{(reg57[(3'h6):(3'h4)] ?
                          (wire53 ?
                              wire41[(1'h0):(1'h0)] : $signed((8'hb2))) : (~&$signed(wire44))),
                      wire56});
  assign wire62 = $signed($signed(wire60[(1'h1):(1'h1)]));
  assign wire63 = wire43;
  assign wire64 = (8'haf);
endmodule
