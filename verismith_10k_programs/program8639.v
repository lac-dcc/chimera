module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire211;
  wire signed [(5'h15):(1'h0)] wire210;
  wire [(5'h15):(1'h0)] wire209;
  wire signed [(4'hb):(1'h0)] wire208;
  wire signed [(4'he):(1'h0)] wire207;
  wire signed [(4'hb):(1'h0)] wire206;
  wire signed [(4'h8):(1'h0)] wire205;
  wire signed [(4'hf):(1'h0)] wire202;
  wire [(3'h5):(1'h0)] wire201;
  wire signed [(4'h9):(1'h0)] wire199;
  wire signed [(4'ha):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire81;
  wire [(4'hb):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  assign y = {wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire202,
                 wire201,
                 wire199,
                 wire84,
                 wire83,
                 wire81,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg204,
                 reg203,
                 reg85,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = {(wire4 * (~^({wire4, wire1} ?
                         ((8'hbd) ? wire3 : wire1) : (|(8'haf))))),
                     ((wire3[(3'h4):(1'h1)] ? wire3 : wire5) ?
                         (~|wire4[(1'h1):(1'h0)]) : ((~wire4[(1'h0):(1'h0)]) ?
                             $unsigned((&wire2)) : ((&wire1) ?
                                 wire1[(3'h6):(1'h0)] : ((8'ha2) ~^ wire5))))};
  assign wire7 = (wire5 ?
                     wire3[(3'h4):(1'h1)] : $unsigned($signed(($unsigned(wire6) ?
                         $unsigned((7'h42)) : wire3[(2'h3):(1'h1)]))));
  assign wire8 = wire5;
  assign wire9 = $unsigned($unsigned(wire8));
  module10 #() modinst82 (wire81, clk, wire8, wire0, wire6, wire5);
  assign wire83 = $unsigned((~^$unsigned({wire6[(3'h7):(2'h3)]})));
  assign wire84 = (8'hba);
  always
    @(posedge clk) begin
      reg85 <= $signed($signed((wire1[(4'h9):(3'h6)] >> ((wire3 ?
          wire4 : wire9) + wire0[(4'ha):(4'h8)]))));
    end
  module86 #() modinst200 (wire199, clk, wire2, wire1, wire4, wire5);
  assign wire201 = (~&(~(wire0 ?
                       reg85[(1'h0):(1'h0)] : (~&$unsigned(wire84)))));
  assign wire202 = wire2;
  always
    @(posedge clk) begin
      reg203 <= wire201;
      reg204 <= wire84;
    end
  assign wire205 = wire0;
  assign wire206 = (({$unsigned((wire1 ?
                               wire84 : (7'h40)))} | {(^~$unsigned(reg203)),
                           {wire1, (!wire81)}}) ?
                       $unsigned(($unsigned($signed((8'ha2))) > ($signed(wire9) ?
                           wire201 : (wire8 ? wire205 : wire2)))) : (wire9 ?
                           ((~|(+(8'hb9))) - {(reg85 ?
                                   wire4 : wire7)}) : wire6));
  assign wire207 = ((8'ha2) ?
                       {{(8'ha7),
                               $unsigned($signed(wire5))}} : wire2[(4'h9):(2'h3)]);
  assign wire208 = wire1[(2'h3):(1'h0)];
  assign wire209 = $signed(wire83[(4'hb):(1'h1)]);
  assign wire210 = ($unsigned($signed((wire83 ?
                       wire202[(4'ha):(2'h3)] : (~^(8'hba))))) ^ {(!(wire5[(3'h5):(1'h0)] ?
                           (8'hb9) : $signed(wire6)))});
  assign wire211 = wire207;
endmodule

module module86  (y, clk, wire87, wire88, wire89, wire90);
  output wire [(32'h26b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire87;
  input wire signed [(5'h12):(1'h0)] wire88;
  input wire signed [(5'h10):(1'h0)] wire89;
  input wire [(4'hf):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire195;
  wire signed [(5'h10):(1'h0)] wire194;
  wire signed [(4'h9):(1'h0)] wire193;
  wire signed [(5'h10):(1'h0)] wire192;
  wire signed [(5'h13):(1'h0)] wire191;
  wire signed [(4'he):(1'h0)] wire183;
  wire signed [(4'h8):(1'h0)] wire181;
  wire [(2'h2):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire154;
  wire [(3'h4):(1'h0)] wire137;
  wire signed [(4'hb):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire135;
  reg [(3'h4):(1'h0)] reg198 = (1'h0);
  reg [(4'hf):(1'h0)] reg196 = (1'h0);
  reg [(5'h13):(1'h0)] reg190 = (1'h0);
  reg [(3'h4):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg188 = (1'h0);
  reg [(4'hf):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg186 = (1'h0);
  reg [(4'h8):(1'h0)] reg185 = (1'h0);
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg157 = (1'h0);
  reg [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(4'ha):(1'h0)] reg167 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg169 = (1'h0);
  assign y = {wire197,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire183,
                 wire181,
                 wire156,
                 wire154,
                 wire137,
                 wire91,
                 wire92,
                 wire104,
                 wire135,
                 reg198,
                 reg196,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg105,
                 reg106,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 (1'h0)};
  assign wire91 = ($signed({(-{wire90}), wire87[(4'h9):(2'h3)]}) ?
                      wire89[(2'h2):(2'h2)] : wire89);
  assign wire92 = ((-wire89[(3'h5):(1'h1)]) & wire87);
  always
    @(posedge clk) begin
      reg93 <= wire88;
      if (wire92)
        begin
          if ($signed($signed((^~(~^$unsigned(wire91))))))
            begin
              reg94 <= (($signed(((&wire87) ?
                  ((8'hac) ^ wire89) : (!wire91))) + (~^$unsigned((reg93 + wire90)))) >>> ((~wire87[(2'h3):(2'h2)]) - ({wire87} >= reg93)));
              reg95 <= (|((wire89 ?
                  (~&(wire91 < (7'h42))) : $signed((reg94 ?
                      reg93 : reg93))) & $unsigned((wire92 || (reg93 + reg93)))));
              reg96 <= (wire87 - wire91[(4'hb):(1'h0)]);
            end
          else
            begin
              reg94 <= $unsigned((wire89[(3'h5):(1'h0)] >= ($signed((reg93 ?
                      reg94 : wire91)) ?
                  reg94[(3'h7):(2'h3)] : {reg95[(2'h3):(1'h0)], (-reg94)})));
              reg95 <= (wire88[(4'he):(1'h1)] <= (&reg93));
              reg96 <= ({$unsigned(((~^wire87) ^~ $signed(wire90)))} ~^ ((reg93[(4'hc):(1'h1)] ?
                      wire88[(2'h2):(1'h1)] : (~(^~wire89))) ?
                  (~&{reg94, {wire89}}) : $signed((wire92 ~^ (reg94 ?
                      wire91 : wire91)))));
              reg97 <= {(!{wire91[(4'hb):(1'h1)], $unsigned($signed(wire91))}),
                  $unsigned(($signed($signed(wire92)) ?
                      $signed(wire88) : $signed((!reg95))))};
            end
          reg98 <= $unsigned($unsigned(($unsigned($unsigned(reg94)) || {(8'ha9)})));
        end
      else
        begin
          if ($signed((($unsigned(wire90) ?
                  $unsigned(wire90) : $signed((~wire91))) ?
              wire89[(4'hd):(4'h8)] : ({$signed(reg94)} ?
                  (|(|(8'haa))) : wire90))))
            begin
              reg94 <= reg95;
            end
          else
            begin
              reg94 <= (($signed(wire88[(5'h10):(4'hd)]) ~^ reg97) == $unsigned(wire91));
              reg95 <= (wire88 >= ((+reg95) ?
                  $signed(wire90) : $unsigned(wire91[(1'h1):(1'h1)])));
              reg96 <= (&$unsigned($signed(($signed(wire91) ?
                  (reg95 ? reg93 : reg98) : (+reg97)))));
              reg97 <= $unsigned(reg96);
              reg98 <= (+$signed(((reg93 ?
                  ((7'h40) ? wire92 : wire87) : $signed(reg97)) || wire90)));
            end
        end
      if ($signed((~((~^(|wire92)) ^ reg95))))
        begin
          reg99 <= $signed(({wire89} >= (wire89[(5'h10):(1'h0)] | (^~reg95))));
          reg100 <= ((^~$unsigned(((8'hb6) ?
              (reg98 << (7'h44)) : {wire87,
                  reg97}))) ^ ($signed({reg99[(4'hd):(4'h8)],
              reg94}) << (~^reg94[(4'h8):(3'h7)])));
          reg101 <= $signed((^((((7'h43) ? wire90 : reg98) ?
              $unsigned(reg93) : reg97) > ($signed((8'hae)) && (8'haf)))));
          if (wire87)
            begin
              reg102 <= reg101[(2'h3):(1'h0)];
            end
          else
            begin
              reg102 <= (^(!((8'hb8) != wire88[(4'h8):(2'h2)])));
            end
        end
      else
        begin
          reg99 <= (((wire91[(2'h2):(2'h2)] >> $signed(reg99)) ?
              ($unsigned(reg98[(1'h1):(1'h0)]) ?
                  ($unsigned(wire88) ?
                      reg94[(4'ha):(3'h7)] : (~reg93)) : ((reg101 ?
                      reg93 : wire92) ^~ (~|wire89))) : (+reg100)) >= $unsigned(($unsigned({reg97,
                  reg98}) ?
              ((^~reg93) ?
                  $unsigned(wire92) : (~^(7'h41))) : reg102[(4'ha):(3'h7)])));
          if ({$unsigned({reg96, (reg93[(1'h1):(1'h1)] & (+reg99))})})
            begin
              reg100 <= $unsigned((((reg97 ?
                      $signed(wire87) : $signed(reg98)) != $unsigned(reg98[(4'h9):(3'h6)])) ?
                  (^~wire88[(4'ha):(1'h1)]) : wire91[(4'h8):(3'h6)]));
            end
          else
            begin
              reg100 <= $signed(wire92);
              reg101 <= ((((reg102 ?
                      (reg98 ? wire89 : reg93) : (wire89 & reg95)) ?
                  $unsigned($signed(reg102)) : (^reg94)) ^~ ($unsigned(reg99[(3'h4):(3'h4)]) ?
                  ((reg94 && wire90) ?
                      $signed(reg94) : (~^wire88)) : (reg99[(5'h14):(4'hb)] ^~ (reg100 + wire90)))) || $signed((~^reg98)));
            end
        end
      reg103 <= {(8'hba)};
    end
  assign wire104 = (($unsigned(wire91) << reg96) ?
                       (~^reg97[(3'h5):(2'h2)]) : (^{reg99[(1'h0):(1'h0)],
                           (-(reg100 <= (8'ha2)))}));
  always
    @(posedge clk) begin
      reg105 <= $signed((($unsigned((~(7'h44))) ?
          reg98[(4'h9):(3'h5)] : reg101) - (($signed(reg102) ?
              (~|reg95) : $signed(wire90)) ?
          $signed(reg94[(1'h0):(1'h0)]) : {$signed(wire88)})));
      reg106 <= ($signed(((^~(wire92 ? wire87 : wire89)) ?
              ((reg93 << reg99) ?
                  {wire92} : $unsigned(reg101)) : {(~&(8'ha0))})) ?
          (reg103[(4'h9):(1'h0)] ?
              (((reg105 ? wire87 : reg100) ?
                  reg98 : $unsigned(reg101)) << (wire88[(3'h6):(1'h0)] != $signed(wire92))) : ($signed(((8'hb3) >= reg105)) ?
                  $unsigned((&reg100)) : wire91[(3'h7):(3'h5)])) : (reg100[(3'h6):(2'h3)] ?
              reg97[(3'h6):(2'h2)] : (~^reg96[(5'h12):(5'h12)])));
    end
  module107 #() modinst136 (wire135, clk, wire88, reg105, wire87, reg106, wire89);
  assign wire137 = ($signed((reg106[(2'h3):(2'h3)] * reg99[(3'h6):(1'h0)])) && (wire87[(2'h3):(2'h2)] ?
                       (~&$unsigned(((8'ha4) == reg96))) : (($unsigned(reg103) >>> wire104[(3'h6):(3'h5)]) ?
                           (~|reg94[(3'h6):(3'h6)]) : $signed((reg99 ?
                               wire104 : reg105)))));
  module138 #() modinst155 (wire154, clk, reg102, reg97, wire90, wire89);
  assign wire156 = reg102[(4'he):(1'h0)];
  always
    @(posedge clk) begin
      reg157 <= (~&reg93[(4'ha):(4'h8)]);
      if (((|wire137) ?
          ((^($unsigned(reg101) ?
              $signed(reg106) : wire87[(4'hc):(2'h2)])) ^ wire90) : $unsigned(reg100)))
        begin
          reg158 <= ($signed($unsigned(reg98)) <= reg100);
          if ($signed($unsigned(wire154[(3'h4):(1'h1)])))
            begin
              reg159 <= ($signed(({{reg96, wire154}} & (8'ha6))) ?
                  wire154[(2'h3):(1'h1)] : ({{(reg102 ^ reg106), (~wire156)},
                      ((~|wire88) >> $unsigned((7'h40)))} <= (7'h42)));
              reg160 <= {{wire154[(2'h3):(2'h3)]}};
              reg161 <= reg102[(3'h7):(3'h5)];
              reg162 <= (^$signed(reg102[(5'h15):(3'h5)]));
              reg163 <= (^~$unsigned({reg157[(1'h0):(1'h0)]}));
            end
          else
            begin
              reg159 <= ((~^($unsigned($signed(wire104)) >= $signed((wire154 & (8'hb4))))) <<< ({{((8'ha9) ?
                          wire104 : reg159)}} >= reg106[(2'h2):(1'h0)]));
              reg160 <= (($signed(({wire137} ?
                  wire92[(2'h3):(2'h2)] : (reg97 ?
                      (8'haf) : reg97))) >>> (($unsigned(reg99) ?
                  (^wire91) : wire135) <= reg97)) | $unsigned((!((~reg100) ~^ reg100))));
            end
          reg164 <= (&reg96);
          if ($signed($unsigned($unsigned((+reg164)))))
            begin
              reg165 <= $unsigned(({{wire88, (reg162 ? wire87 : reg93)},
                      $signed(wire154)} ?
                  $unsigned(reg105[(3'h6):(3'h6)]) : $signed(reg158[(3'h4):(3'h4)])));
            end
          else
            begin
              reg165 <= reg163;
              reg166 <= $signed($signed($unsigned($signed((reg99 + reg102)))));
              reg167 <= (wire156 ?
                  ({$signed((~&reg99))} ?
                      ($unsigned(reg103[(3'h7):(3'h6)]) ?
                          (+reg100) : $signed((~&wire91))) : (({(8'hb2),
                              (8'hbc)} ?
                          reg106[(2'h3):(2'h3)] : (reg164 ?
                              wire135 : reg98)) < {(reg96 ? reg163 : wire91),
                          {reg96, reg164}})) : (wire156 ~^ wire87));
            end
          reg168 <= $signed(reg165);
        end
      else
        begin
          reg158 <= $unsigned((^~$signed(wire89)));
          reg159 <= reg164[(1'h0):(1'h0)];
          if (reg97[(4'h8):(3'h4)])
            begin
              reg160 <= $signed($signed(reg95));
              reg161 <= $signed((-reg98));
              reg162 <= $unsigned(((+((&reg168) ?
                      reg101[(3'h6):(3'h4)] : ((8'haf) ? reg105 : reg103))) ?
                  wire87[(4'hb):(3'h5)] : (reg163[(1'h1):(1'h1)] | (^~$signed(reg168)))));
              reg163 <= reg106;
              reg164 <= reg157[(1'h0):(1'h0)];
            end
          else
            begin
              reg160 <= (reg162 && (reg158[(3'h4):(2'h3)] == {reg165}));
              reg161 <= wire87;
            end
          reg165 <= ($unsigned((~|($signed(reg102) >>> (~|wire156)))) ?
              $unsigned(reg162) : ($unsigned(((reg102 <= reg95) ?
                  wire88[(2'h2):(2'h2)] : (~&wire104))) >>> $signed((reg101[(3'h5):(2'h3)] ^~ $unsigned(reg163)))));
          reg166 <= reg94[(1'h0):(1'h0)];
        end
      reg169 <= reg157;
    end
  module170 #() modinst182 (.wire171(wire104), .wire174(reg157), .wire173(reg99), .wire175(reg103), .y(wire181), .wire172(wire89), .clk(clk));
  assign wire183 = $signed($signed(wire135));
  always
    @(posedge clk) begin
      reg184 <= (!reg105[(3'h7):(1'h1)]);
      if ({(|$unsigned({$unsigned(reg184)}))})
        begin
          if (wire183)
            begin
              reg185 <= ($signed(((reg165[(4'h8):(2'h2)] ?
                      reg162 : (wire156 >>> (7'h42))) ?
                  (reg169 ? wire137 : $signed(wire91)) : reg102)) * wire89);
              reg186 <= $signed((~|{reg162[(1'h1):(1'h0)]}));
            end
          else
            begin
              reg185 <= wire135[(3'h4):(2'h3)];
              reg186 <= {$unsigned(reg184[(2'h2):(1'h0)])};
              reg187 <= $signed(((reg100[(1'h1):(1'h1)] ?
                      $signed((reg159 ? reg100 : reg101)) : reg163) ?
                  $unsigned((^(wire104 | reg168))) : $signed(($unsigned(reg166) && (wire91 ^ (8'hbc))))));
              reg188 <= $signed($unsigned(reg164[(4'hb):(1'h1)]));
              reg189 <= (-$signed(((!reg102[(1'h1):(1'h1)]) != ((reg157 >> wire156) ?
                  {wire137} : (~wire137)))));
            end
          reg190 <= (wire156 ?
              wire104 : (|{(reg186 ? wire156 : (reg93 ? (8'hb0) : (8'ha7))),
                  $unsigned((|(7'h42)))}));
        end
      else
        begin
          reg185 <= $unsigned(wire135);
          reg186 <= wire104;
        end
    end
  assign wire191 = $unsigned({(8'hbd)});
  assign wire192 = $unsigned(reg98);
  assign wire193 = (-reg93[(1'h0):(1'h0)]);
  assign wire194 = $unsigned(reg99);
  assign wire195 = ((wire191[(4'hb):(4'ha)] ?
                           (8'ha8) : {$signed($unsigned(reg163))}) ?
                       {$unsigned((8'h9c))} : (~&$signed(($signed((8'ha8)) <<< (wire193 ~^ reg162)))));
  always
    @(posedge clk) begin
      reg196 <= $unsigned($unsigned({wire88}));
    end
  assign wire197 = $unsigned({reg196[(3'h5):(2'h3)]});
  always
    @(posedge clk) begin
      reg198 <= $signed($signed((+((reg103 ? reg165 : wire193) ?
          $signed(wire193) : wire90[(4'hc):(3'h5)]))));
    end
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire signed [(4'he):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(4'ha):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire35;
  assign y = {wire80,
                 wire79,
                 wire77,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 (1'h0)};
  module15 #() modinst36 (.wire18(wire12), .wire19(wire13), .wire17(wire14), .y(wire35), .clk(clk), .wire16(wire11));
  assign wire37 = wire12[(3'h7):(1'h0)];
  assign wire38 = (|wire14);
  assign wire39 = wire11[(4'h9):(2'h2)];
  assign wire40 = (&$signed({(wire12[(1'h1):(1'h0)] ^~ $signed(wire13))}));
  assign wire41 = {(~wire12)};
  assign wire42 = (wire41 ?
                      $unsigned((wire37 ?
                          (-$unsigned(wire12)) : wire35[(5'h10):(1'h0)])) : ((+((wire38 ?
                          wire11 : (8'hb3)) && $unsigned((8'hbf)))) <<< $unsigned(($signed((8'ha1)) > $unsigned(wire37)))));
  module43 #() modinst78 (.wire45(wire42), .wire46(wire41), .wire44(wire37), .wire47(wire13), .clk(clk), .y(wire77));
  assign wire79 = $signed((!(((wire40 >>> wire11) ?
                          wire11 : $unsigned(wire35)) ?
                      wire35[(4'hd):(3'h4)] : wire37)));
  assign wire80 = $unsigned(wire41);
endmodule

module module43
#(parameter param76 = {(((((8'h9d) - (8'ha2)) ? (^(8'ha3)) : ((8'hb0) ? (8'ha6) : (8'hac))) ? {{(8'hbd)}} : ((^~(8'hba)) - {(8'hae)})) ? ((~|((8'hac) ^ (8'hb8))) <= ((~(8'hba)) == {(8'hbd)})) : ((~|(~|(8'hbd))) & (((8'hb3) ^~ (8'hb8)) ? ((8'ha7) ? (8'ha5) : (8'ha7)) : ((8'ha9) ? (8'hb9) : (8'ha4)))))})
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire47;
  input wire [(3'h6):(1'h0)] wire46;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(3'h5):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  wire [(2'h3):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(3'h4):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  assign y = {wire75,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg74,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= (wire47 < $signed((+(wire47 <= {wire46, wire47}))));
      reg49 <= wire47;
      reg50 <= wire45;
    end
  always
    @(posedge clk) begin
      reg51 <= (wire45[(2'h3):(1'h1)] ?
          wire45[(1'h1):(1'h0)] : wire45[(1'h1):(1'h1)]);
      reg52 <= wire44[(2'h2):(2'h2)];
      reg53 <= {{((-(wire45 <<< wire46)) + ((reg52 ^ wire45) ?
                  (wire47 ? (8'hb8) : (8'haf)) : ((8'ha1) ? reg49 : reg51))),
              $unsigned(reg50[(3'h4):(2'h3)])}};
      reg54 <= $signed($signed((^~$unsigned($signed(reg48)))));
      reg55 <= (+{$unsigned(reg50[(1'h0):(1'h0)])});
    end
  assign wire56 = (^~(({reg48[(4'h8):(3'h5)],
                      (wire44 ? wire47 : reg48)} * (~&(reg52 ?
                      wire45 : reg51))) >> {{$unsigned(reg53), {reg48}}}));
  assign wire57 = reg50;
  assign wire58 = wire46[(1'h1):(1'h0)];
  assign wire59 = $signed($unsigned($unsigned(reg48)));
  assign wire60 = (reg48 != $signed((^~$signed((wire59 && reg51)))));
  assign wire61 = $unsigned(wire59);
  assign wire62 = $unsigned((^$signed(wire46[(2'h3):(2'h2)])));
  assign wire63 = wire61[(1'h1):(1'h1)];
  assign wire64 = wire56[(3'h4):(1'h0)];
  assign wire65 = wire47;
  assign wire66 = $signed(((reg54 ? $signed(reg55) : wire65[(5'h12):(4'hd)]) ?
                      ($signed({reg54}) ?
                          $signed({reg54}) : {$signed(wire46),
                              wire65[(4'hf):(4'hb)]}) : $signed(wire58[(1'h1):(1'h0)])));
  assign wire67 = reg55;
  assign wire68 = ($unsigned(wire60) ?
                      (&(wire67[(3'h4):(1'h0)] ?
                          ($unsigned(wire58) ?
                              (~|(8'h9e)) : $signed(wire62)) : $signed((~^(8'hb9))))) : (reg53 ?
                          (wire63[(2'h2):(1'h0)] >> (((8'ha8) ?
                              wire56 : wire65) ~^ reg52)) : ($unsigned({reg51}) ?
                              $unsigned({wire63}) : (^~wire57))));
  assign wire69 = reg51;
  assign wire70 = $unsigned(((~^(~(~^reg48))) >>> ({(8'ha3),
                      $unsigned(wire56)} << $signed($signed(wire57)))));
  assign wire71 = wire60[(3'h7):(3'h6)];
  assign wire72 = wire44;
  assign wire73 = (^~wire45);
  always
    @(posedge clk) begin
      reg74 <= (wire56 > (|(|$unsigned(wire71[(2'h2):(2'h2)]))));
    end
  assign wire75 = (wire70[(3'h4):(2'h2)] ?
                      wire70 : $signed(({wire57, $signed(wire69)} ?
                          (((8'hbe) & (8'hb3)) ?
                              (wire57 >>> wire72) : wire71) : (^wire61))));
endmodule

module module15
#(parameter param33 = ((~|(8'hb9)) >> ((8'hb0) > (((8'h9e) ? ((8'hbc) >>> (8'ha1)) : ((8'h9c) ? (8'hb8) : (7'h43))) ? (+((8'ha0) ? (8'hb2) : (8'hb1))) : (~^(~^(8'hb1)))))), 
parameter param34 = (param33 ? (((7'h41) ? param33 : param33) ? param33 : {(~^{param33, param33})}) : ((~{(param33 ^ param33), param33}) ? (((param33 && param33) >> param33) ? ((~&param33) ? (param33 ? param33 : param33) : (param33 ? param33 : param33)) : param33) : (((param33 > param33) ? (param33 ~^ param33) : (param33 ? param33 : param33)) >> (&(param33 ? param33 : param33))))))
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(4'hd):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire16 > wire18[(1'h0):(1'h0)]))
        begin
          if ((wire16 < {((~^wire17[(5'h10):(4'ha)]) ?
                  (!{(8'hba), (8'hb0)}) : wire19[(1'h0):(1'h0)]),
              ($unsigned((wire16 | wire19)) << (((8'hb2) ?
                  wire16 : wire17) != (8'hb9)))}))
            begin
              reg20 <= {(-wire19),
                  (($signed((wire17 ?
                      wire19 : wire18)) >> $signed(((7'h43) <<< wire18))) * (8'ha3))};
              reg21 <= $unsigned(wire17);
            end
          else
            begin
              reg20 <= ($unsigned($signed($unsigned($unsigned(reg21)))) ?
                  (^~{reg21[(1'h1):(1'h0)],
                      $signed((reg21 ?
                          wire17 : reg20))}) : ($unsigned($signed((8'ha3))) * $unsigned(reg20)));
              reg21 <= (7'h42);
              reg22 <= ({wire18} >>> $unsigned({reg20[(4'h9):(2'h2)]}));
              reg23 <= (&{{((^~wire18) > (&wire19))}});
              reg24 <= reg20[(3'h6):(1'h0)];
            end
          reg25 <= $unsigned((wire18 ?
              reg22 : $unsigned((wire19 ~^ {wire18, reg22}))));
          reg26 <= reg25[(4'h9):(3'h7)];
          reg27 <= (~&reg21[(2'h2):(2'h2)]);
          reg28 <= $unsigned((~|(~&(+(reg26 ? reg26 : reg23)))));
        end
      else
        begin
          reg20 <= reg22[(4'h9):(4'h8)];
        end
    end
  assign wire29 = reg28;
  assign wire30 = (|$unsigned(reg28[(1'h0):(1'h0)]));
  assign wire31 = {(~&(($unsigned(reg23) << $unsigned(reg22)) ?
                          wire30 : $signed((8'hb1))))};
  assign wire32 = ($signed(reg23) ?
                      $signed($signed(reg26[(4'hd):(3'h4)])) : reg28[(2'h3):(2'h3)]);
endmodule

module module170
#(parameter param180 = (^((((~|(8'hae)) <= (^(8'hb4))) || {((8'hba) << (8'ha1)), ((8'ha7) <<< (8'hb0))}) & ((!(!(8'ha0))) ? ({(8'ha3)} ? {(8'hbf)} : ((8'hb8) <= (7'h40))) : ((+(8'hb0)) ? (~^(7'h42)) : (~^(8'ha5)))))))
(y, clk, wire175, wire174, wire173, wire172, wire171);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire175;
  input wire [(4'hd):(1'h0)] wire174;
  input wire signed [(5'h14):(1'h0)] wire173;
  input wire signed [(4'hc):(1'h0)] wire172;
  input wire signed [(5'h12):(1'h0)] wire171;
  wire [(5'h12):(1'h0)] wire179;
  wire [(4'hb):(1'h0)] wire178;
  wire [(4'h9):(1'h0)] wire177;
  wire signed [(4'hd):(1'h0)] wire176;
  assign y = {wire179, wire178, wire177, wire176, (1'h0)};
  assign wire176 = {(^~(-$signed((~^wire175)))),
                       $signed(wire172[(1'h0):(1'h0)])};
  assign wire177 = wire176[(2'h2):(2'h2)];
  assign wire178 = ($unsigned($signed(wire174[(3'h6):(1'h1)])) ?
                       $unsigned($signed((&(+wire172)))) : $unsigned($unsigned((wire173[(5'h13):(1'h0)] ?
                           (wire174 ?
                               wire171 : wire176) : $unsigned(wire171)))));
  assign wire179 = $signed(({(~|(~^wire171))} <= $signed(((^wire175) ?
                       $signed(wire177) : wire175))));
endmodule

module module138  (y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire142;
  input wire signed [(5'h10):(1'h0)] wire141;
  input wire [(4'h9):(1'h0)] wire140;
  input wire signed [(3'h6):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire153;
  wire signed [(4'h8):(1'h0)] wire152;
  wire [(5'h11):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire150;
  wire signed [(2'h2):(1'h0)] wire149;
  wire [(4'ha):(1'h0)] wire148;
  wire [(4'hf):(1'h0)] wire147;
  wire [(5'h11):(1'h0)] wire146;
  wire [(5'h10):(1'h0)] wire145;
  wire [(4'ha):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire143;
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 (1'h0)};
  assign wire143 = $unsigned(($signed(wire140[(3'h5):(2'h3)]) >>> $unsigned(wire140)));
  assign wire144 = wire140[(4'h8):(2'h2)];
  assign wire145 = wire139;
  assign wire146 = {(~&(^((wire142 < wire143) - wire141)))};
  assign wire147 = (&(wire145 ?
                       (wire143 ?
                           (!(^(7'h40))) : $signed((wire143 ?
                               wire146 : (7'h42)))) : {wire146[(4'h9):(3'h4)],
                           ((wire142 == wire143) ?
                               wire139 : wire146[(3'h7):(3'h7)])}));
  assign wire148 = (($signed($signed({wire147, wire142})) ?
                       ((wire145 || (&wire141)) | (wire144[(4'h9):(2'h3)] <<< $unsigned(wire139))) : ((-(wire142 | wire145)) != wire145[(4'he):(4'hb)])) <<< (wire142 <<< wire141));
  assign wire149 = (~^{$unsigned({(!wire141), (8'hac)})});
  assign wire150 = $unsigned(wire147[(4'hc):(2'h2)]);
  assign wire151 = $unsigned(((-$unsigned(wire149[(2'h2):(2'h2)])) ?
                       (((wire146 ? wire145 : wire140) > wire147) >>> (wire144 ?
                           $unsigned(wire148) : $unsigned(wire149))) : $unsigned((wire147 & $signed(wire147)))));
  assign wire152 = ((8'hba) ?
                       {$signed(wire142[(3'h5):(1'h1)])} : (~|(wire145 ?
                           (((8'hab) || wire149) ?
                               (wire148 && (8'ha5)) : (wire146 ?
                                   wire139 : wire144)) : (!$unsigned(wire149)))));
  assign wire153 = wire144;
endmodule

module module107
#(parameter param134 = ((({((8'hbb) ? (8'haa) : (8'had)), (^(8'hba))} + (((8'hb2) ? (8'ha4) : (7'h42)) ? ((8'hb1) == (8'ha1)) : (!(8'ha6)))) ? (-(((8'ha8) || (8'h9f)) ^~ ((8'ha4) <<< (8'haa)))) : (((-(8'hbe)) ? (!(8'hbc)) : ((8'ha8) >= (8'hb5))) ? ({(8'hbe), (8'h9c)} ? ((8'ha0) ? (8'hba) : (8'ha8)) : ((8'ha5) ^~ (8'hb3))) : ((+(8'ha7)) | (8'ha0)))) >= (~&((((7'h43) && (8'hae)) ? (~(8'hab)) : ((8'hae) ? (7'h43) : (8'hbf))) ? (((8'haa) >= (8'hb7)) ? ((8'ha5) >= (7'h41)) : ((8'hb8) ^ (8'hb3))) : (((8'h9e) || (8'hbc)) ? ((8'ha8) != (8'ha0)) : {(8'hab), (8'hbb)})))))
(y, clk, wire112, wire111, wire110, wire109, wire108);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire112;
  input wire signed [(4'h8):(1'h0)] wire111;
  input wire signed [(4'hc):(1'h0)] wire110;
  input wire [(2'h3):(1'h0)] wire109;
  input wire [(4'hc):(1'h0)] wire108;
  wire [(5'h13):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire132;
  wire [(4'hb):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(5'h14):(1'h0)] wire114;
  reg [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg113 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire127,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg126,
                 reg125,
                 reg124,
                 reg113,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg113 <= wire109;
    end
  assign wire114 = (reg113[(1'h0):(1'h0)] ?
                       ((^~wire111) ?
                           {$unsigned(wire110),
                               ($unsigned(wire112) ?
                                   $signed((7'h43)) : (~|wire111))} : wire111[(1'h0):(1'h0)]) : wire108[(2'h2):(1'h1)]);
  assign wire115 = $unsigned($signed((wire109 ?
                       wire111 : wire109[(1'h1):(1'h0)])));
  assign wire116 = $unsigned(($unsigned(wire115) & $signed($unsigned((~reg113)))));
  assign wire117 = $signed((~($unsigned($signed(wire108)) ?
                       wire108[(4'h9):(1'h0)] : ((&wire112) && $unsigned(wire116)))));
  assign wire118 = {wire112, {reg113[(2'h2):(1'h1)]}};
  assign wire119 = wire109;
  assign wire120 = wire115;
  assign wire121 = wire109[(1'h1):(1'h0)];
  assign wire122 = $signed($unsigned($unsigned(wire121[(3'h6):(1'h0)])));
  assign wire123 = wire116;
  always
    @(posedge clk) begin
      reg124 <= wire111;
      reg125 <= (~(8'ha2));
      reg126 <= wire120;
    end
  assign wire127 = ((reg124 ?
                       (~|($signed(wire123) ?
                           (^wire117) : $unsigned(wire109))) : (8'hb4)) ^ {reg124[(3'h7):(3'h6)],
                       wire111[(3'h6):(2'h2)]});
  always
    @(posedge clk) begin
      reg128 <= wire122[(3'h7):(2'h3)];
      reg129 <= (7'h40);
      reg130 <= (~&($unsigned(wire123) ?
          $signed(wire108) : {$signed((~|wire120))}));
      reg131 <= $signed($signed({({reg130} == $unsigned(reg128))}));
    end
  assign wire132 = reg130[(2'h3):(2'h3)];
  assign wire133 = $signed($signed(wire122[(4'hc):(3'h4)]));
endmodule
