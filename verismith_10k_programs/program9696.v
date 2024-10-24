module top
#(parameter param242 = ((~^{(((7'h42) ? (8'ha4) : (8'ha2)) && ((8'ha3) < (8'ha1))), (+((8'hab) ? (8'hb3) : (8'hbf)))}) ? (((((8'ha7) == (8'hb7)) ? (-(7'h40)) : (~^(8'h9f))) <= ({(8'ha0), (8'h9d)} && ((8'ha3) ? (8'had) : (8'hab)))) ? ((((8'h9d) ^~ (8'h9d)) <<< ((8'ha8) ? (8'hbb) : (8'hae))) ~^ (((8'ha6) & (8'hbc)) < ((8'ha6) - (8'hba)))) : (((8'h9c) ^ (~&(8'hac))) - ({(8'hab), (8'haa)} ~^ ((8'hba) <<< (8'hb0))))) : (^~(7'h40))), 
parameter param243 = {(^(+(|(|(7'h41)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h23a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire240;
  wire [(4'hb):(1'h0)] wire239;
  wire [(4'hc):(1'h0)] wire237;
  wire [(5'h13):(1'h0)] wire220;
  wire [(3'h6):(1'h0)] wire219;
  wire [(5'h12):(1'h0)] wire217;
  wire [(3'h7):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire30;
  reg [(4'h8):(1'h0)] reg236 = (1'h0);
  reg [(5'h13):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg234 = (1'h0);
  reg [(5'h10):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg232 = (1'h0);
  reg [(4'ha):(1'h0)] reg231 = (1'h0);
  reg [(4'ha):(1'h0)] reg230 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg228 = (1'h0);
  reg signed [(4'he):(1'h0)] reg227 = (1'h0);
  reg [(5'h15):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg224 = (1'h0);
  reg [(5'h10):(1'h0)] reg223 = (1'h0);
  reg [(2'h3):(1'h0)] reg222 = (1'h0);
  reg [(4'hf):(1'h0)] reg221 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  assign y = {wire240,
                 wire239,
                 wire237,
                 wire220,
                 wire219,
                 wire217,
                 wire52,
                 wire51,
                 wire50,
                 wire46,
                 wire45,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg49,
                 reg48,
                 reg47,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg32,
                 (1'h0)};
  module5 #() modinst31 (wire30, clk, wire3, wire4, wire2, wire0);
  always
    @(posedge clk) begin
      reg32 <= ($signed($signed((wire0[(4'hd):(3'h7)] << (wire4 ^~ wire3)))) <= $unsigned(({$signed(wire0),
          {wire2, (8'h9e)}} == (wire3 > wire4[(3'h7):(3'h7)]))));
    end
  assign wire33 = wire1[(2'h3):(1'h1)];
  assign wire34 = wire4;
  assign wire35 = $signed((^~wire33));
  always
    @(posedge clk) begin
      reg36 <= (8'hb4);
      if ($signed(reg32))
        begin
          reg37 <= (~wire0[(4'ha):(4'ha)]);
          if ($signed($signed(wire3)))
            begin
              reg38 <= ((wire34 ?
                  (wire4 <= wire30[(3'h6):(2'h3)]) : $unsigned($signed(((8'hb2) && wire1)))) & wire1[(4'ha):(3'h7)]);
            end
          else
            begin
              reg38 <= (!$signed(wire0[(3'h7):(3'h6)]));
              reg39 <= wire1;
            end
          if ((~|($unsigned(wire1) ?
              ($signed((!wire34)) ?
                  $unsigned(wire2[(3'h4):(2'h3)]) : reg39) : {({wire2} ?
                      (wire4 == reg37) : $unsigned((8'hb0))),
                  {(|wire33)}})))
            begin
              reg40 <= (wire2[(2'h2):(1'h0)] ~^ ((((wire30 ?
                          wire35 : reg32) >>> wire33) ?
                      (&(|wire35)) : ($unsigned(wire4) && (reg37 & reg39))) ?
                  reg39 : {$signed(reg39[(3'h4):(2'h3)])}));
            end
          else
            begin
              reg40 <= ($signed($unsigned($signed(wire3[(4'h9):(3'h4)]))) ?
                  $unsigned(((+(reg39 || wire34)) >> $unsigned(wire0))) : $signed($signed(wire0)));
              reg41 <= ((reg38 ?
                  (wire35 ?
                      ($signed(reg32) ?
                          (wire33 && wire2) : $unsigned(reg36)) : (~|(^~wire1))) : {reg40[(3'h5):(1'h0)]}) >= $unsigned(reg38));
              reg42 <= (((8'hbc) ? $signed(wire2) : reg39[(4'he):(3'h5)]) ?
                  $unsigned({$unsigned((wire3 >> wire4)),
                      wire4}) : ($unsigned($unsigned($signed(wire4))) ?
                      reg40[(3'h5):(2'h3)] : (wire2 ?
                          (wire34[(2'h2):(1'h0)] >> reg37) : (&$signed((8'hb3))))));
              reg43 <= ((wire30 ?
                  $signed($signed(reg36)) : ((~&$unsigned(reg41)) <= ((reg42 << (8'ha1)) ?
                      (wire34 ?
                          wire1 : reg42) : $signed((7'h42))))) ^~ ((wire34[(2'h2):(1'h0)] ?
                  reg32 : $signed($unsigned(wire35))) != wire3));
              reg44 <= reg37;
            end
        end
      else
        begin
          if (reg38)
            begin
              reg37 <= ($signed((({reg37,
                  wire30} << $signed(wire0)) <= $signed((reg41 ?
                  (8'had) : wire33)))) * (~^($unsigned((+wire4)) || $signed((reg36 ?
                  reg40 : wire30)))));
              reg38 <= wire3[(4'hb):(4'hb)];
              reg39 <= $signed((wire3[(4'hc):(3'h7)] ?
                  reg32 : (&$signed($signed(reg39)))));
              reg40 <= $unsigned($unsigned(reg38[(4'ha):(4'h8)]));
              reg41 <= {($signed((reg32 != (reg41 ? reg36 : wire30))) ?
                      reg39[(4'he):(3'h7)] : wire33)};
            end
          else
            begin
              reg37 <= (^wire2[(1'h1):(1'h0)]);
              reg38 <= reg36[(3'h4):(2'h2)];
              reg39 <= {$unsigned(wire2), reg39[(2'h2):(1'h1)]};
            end
        end
    end
  assign wire45 = (^~reg41);
  assign wire46 = ($signed($unsigned((^~(8'hb9)))) & $unsigned((reg38[(3'h4):(2'h2)] ?
                      reg43 : ((reg37 ? wire35 : wire34) < $unsigned(wire3)))));
  always
    @(posedge clk) begin
      reg47 <= $signed($unsigned((!{(reg41 ? wire34 : wire3),
          reg32[(1'h0):(1'h0)]})));
      reg48 <= reg39[(3'h6):(2'h3)];
      reg49 <= $unsigned((wire2[(2'h3):(2'h3)] > (~(-(reg44 || wire3)))));
    end
  assign wire50 = reg42;
  assign wire51 = {(&$signed((^reg32[(1'h1):(1'h0)]))), reg48};
  assign wire52 = ((((reg44 ?
                          (reg49 ?
                              wire30 : reg42) : (reg43 ^~ wire3)) | wire33) ?
                      (-((reg47 ? reg43 : reg44) ?
                          ((8'hbc) >> wire45) : (reg48 ?
                              wire51 : wire46))) : ((reg47[(4'hf):(3'h4)] >= reg48[(1'h0):(1'h0)]) ?
                          reg32[(3'h6):(2'h3)] : {wire0[(5'h10):(4'h8)]})) | wire1);
  module53 #() modinst218 (.wire57(wire50), .wire56(reg39), .wire55(wire46), .y(wire217), .wire54(reg32), .clk(clk));
  assign wire219 = wire50[(2'h3):(1'h1)];
  assign wire220 = {reg43[(4'hc):(4'h9)],
                       $unsigned(((8'hb8) ? reg49 : reg47[(4'he):(4'h9)]))};
  always
    @(posedge clk) begin
      reg221 <= ((!$signed((~|(+reg40)))) ?
          (((reg42[(3'h4):(2'h3)] <= $signed(wire52)) ?
                  ((^~(8'hb5)) ? (8'hb7) : wire220) : wire51[(3'h7):(3'h6)]) ?
              (~^{$signed(wire30)}) : {$signed((8'ha6))}) : (($signed(wire52[(2'h2):(1'h0)]) < (wire220[(3'h7):(3'h6)] < {reg47,
              wire52})) <= (reg40 ~^ (~^reg32[(2'h2):(1'h0)]))));
      reg222 <= (wire50 <<< (wire50 <<< wire30[(4'he):(2'h3)]));
      reg223 <= reg40[(3'h6):(3'h4)];
      if (($unsigned(({(wire220 | (8'had))} != (^~(wire34 ?
          reg41 : wire1)))) >> reg43[(4'ha):(1'h0)]))
        begin
          reg224 <= $signed({reg43[(4'hd):(3'h5)],
              {((wire217 == wire2) ? $unsigned(wire34) : reg42[(3'h5):(2'h2)]),
                  (8'hbc)}});
        end
      else
        begin
          if (reg42[(2'h2):(1'h0)])
            begin
              reg224 <= $signed($unsigned(((((8'haf) ?
                  wire45 : wire34) ^ $unsigned(wire34)) <= $signed(reg43))));
            end
          else
            begin
              reg224 <= wire52[(3'h5):(1'h1)];
              reg225 <= (+($unsigned((8'h9e)) ?
                  {{(wire220 ? wire2 : reg49)}} : ($unsigned((~wire50)) ?
                      $signed((wire220 ?
                          wire2 : reg224)) : ((wire220 + reg38) * (reg44 <= wire4)))));
              reg226 <= (~|{wire33});
              reg227 <= {((($signed(reg223) ^ $signed(wire2)) ?
                      reg43[(1'h1):(1'h0)] : ($unsigned(wire220) ^ $unsigned(reg39))) <<< $unsigned($signed(reg225)))};
              reg228 <= (^((^$signed(reg44)) >= wire34));
            end
          if ((^$unsigned(wire35)))
            begin
              reg229 <= ((^~reg223) << (~&reg39));
              reg230 <= (((!reg229) ^~ (&(~&reg43[(5'h13):(5'h11)]))) | $signed(($unsigned(reg224) + ($signed(wire45) ?
                  $signed(reg221) : wire4[(4'h8):(2'h3)]))));
              reg231 <= $unsigned($signed({reg47[(4'ha):(2'h3)]}));
              reg232 <= (+$signed({reg48[(1'h1):(1'h0)],
                  (|$unsigned(wire51))}));
            end
          else
            begin
              reg229 <= $signed($signed($unsigned(reg232)));
              reg230 <= $signed(reg221[(3'h5):(3'h5)]);
              reg231 <= reg223;
              reg232 <= reg49[(2'h3):(1'h1)];
              reg233 <= reg222[(2'h2):(1'h0)];
            end
          reg234 <= (+reg42);
          reg235 <= ($signed((reg224[(4'h9):(2'h3)] << wire2)) ?
              wire52 : ($unsigned(($unsigned(reg232) ?
                  (reg43 ?
                      reg223 : reg233) : {wire35})) | $unsigned({$signed(wire34),
                  reg40})));
        end
      reg236 <= {$signed(wire35)};
    end
  module5 #() modinst238 (wire237, clk, wire35, wire45, reg38, reg228);
  assign wire239 = (reg48[(1'h0):(1'h0)] & $signed(reg37[(2'h3):(1'h0)]));
  module189 #() modinst241 (wire240, clk, wire46, reg44, wire35, reg222);
endmodule

module module53
#(parameter param215 = (~^((!{((8'ha4) ? (7'h43) : (8'h9d))}) != ({((8'h9e) && (8'hbe)), {(8'hb4), (8'ha3)}} ? (((8'hba) ^~ (8'hb2)) ? ((8'hb1) - (8'hb8)) : ((7'h42) * (8'hb8))) : (~^(~&(7'h43)))))), 
parameter param216 = param215)
(y, clk, wire54, wire55, wire56, wire57);
  output wire [(32'h18c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire54;
  input wire signed [(4'h9):(1'h0)] wire55;
  input wire [(5'h13):(1'h0)] wire56;
  input wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire214;
  wire [(5'h10):(1'h0)] wire213;
  wire signed [(5'h15):(1'h0)] wire212;
  wire signed [(5'h10):(1'h0)] wire211;
  wire [(4'hd):(1'h0)] wire210;
  wire [(2'h2):(1'h0)] wire209;
  wire [(4'ha):(1'h0)] wire147;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire149;
  wire [(4'hc):(1'h0)] wire150;
  wire signed [(2'h2):(1'h0)] wire180;
  wire signed [(5'h11):(1'h0)] wire182;
  wire [(4'hf):(1'h0)] wire185;
  wire [(4'hf):(1'h0)] wire186;
  wire [(4'hd):(1'h0)] wire207;
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'ha):(1'h0)] reg160 = (1'h0);
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg158 = (1'h0);
  reg signed [(4'he):(1'h0)] reg157 = (1'h0);
  reg [(3'h6):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg153 = (1'h0);
  reg [(4'h8):(1'h0)] reg152 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg183 = (1'h0);
  reg [(5'h11):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg [(3'h4):(1'h0)] reg188 = (1'h0);
  assign y = {wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire147,
                 wire58,
                 wire59,
                 wire120,
                 wire149,
                 wire150,
                 wire180,
                 wire182,
                 wire185,
                 wire186,
                 wire207,
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
                 reg183,
                 reg184,
                 reg187,
                 reg188,
                 (1'h0)};
  assign wire58 = {wire54[(1'h1):(1'h0)]};
  assign wire59 = ((8'ha0) ? wire54 : wire58);
  module60 #() modinst121 (wire120, clk, wire57, wire54, wire58, wire56, wire59);
  module122 #() modinst148 (.wire125(wire59), .wire123(wire56), .clk(clk), .y(wire147), .wire127(wire57), .wire124(wire58), .wire126(wire120));
  assign wire149 = ((wire147[(1'h0):(1'h0)] != ((wire147[(3'h7):(1'h0)] ?
                           (-wire58) : (wire57 ? (7'h41) : wire58)) ?
                       $unsigned($signed(wire55)) : wire120[(4'h8):(1'h0)])) & ($signed($signed((8'hae))) >> ($signed(((8'h9f) ?
                       wire147 : wire58)) >= (^~wire58))));
  assign wire150 = wire120;
  always
    @(posedge clk) begin
      if (wire57[(3'h6):(2'h2)])
        begin
          if (((~&$unsigned($signed((wire55 ? wire59 : wire120)))) ?
              wire120[(3'h5):(3'h4)] : $unsigned((&{{wire55, wire150}}))))
            begin
              reg151 <= (&wire55);
              reg152 <= ({wire56[(4'hc):(1'h0)]} ?
                  ((wire59 + $signed((~^wire147))) ?
                      (wire57 ?
                          (wire56 ?
                              (8'h9f) : wire58[(3'h6):(2'h3)]) : $signed((8'ha6))) : (-wire150)) : wire150);
              reg153 <= $signed(((wire54 ^ $signed(wire149)) & reg152));
            end
          else
            begin
              reg151 <= wire58;
            end
          reg154 <= reg151[(2'h3):(1'h1)];
          if (reg153)
            begin
              reg155 <= $signed($unsigned((~^$unsigned(wire147[(3'h7):(2'h2)]))));
              reg156 <= ((wire56 ? $unsigned(wire56) : wire147) ?
                  {$unsigned(((^wire147) ?
                          wire57 : (reg155 ? (7'h41) : reg152)))} : reg152);
              reg157 <= wire59;
              reg158 <= $signed(wire54);
              reg159 <= {{{wire58}}};
            end
          else
            begin
              reg155 <= {wire150[(3'h7):(1'h1)]};
              reg156 <= ((8'haf) - reg155);
              reg157 <= {$signed((reg156[(1'h1):(1'h1)] ?
                      $signed({reg154}) : ($signed(reg157) ?
                          (wire56 ? wire147 : wire57) : $signed(wire149))))};
            end
          reg160 <= (reg159 << $unsigned(($unsigned(wire55) <<< reg159)));
          reg161 <= (8'hb3);
        end
      else
        begin
          reg151 <= ($unsigned($unsigned((&(wire120 ?
              wire54 : wire56)))) ^ $unsigned(reg151[(2'h2):(1'h1)]));
          if ({(wire58 | {((reg155 ? reg152 : reg155) ?
                      {(8'h9d), reg153} : (wire56 ? wire57 : reg159)),
                  {{reg153, wire120}}}),
              wire149[(2'h3):(1'h1)]})
            begin
              reg152 <= (~^(wire55[(3'h5):(2'h3)] < (8'hbc)));
              reg153 <= (~|wire59[(3'h6):(1'h0)]);
              reg154 <= $unsigned($signed(($signed($signed(wire55)) ?
                  $signed((|(8'haa))) : wire59[(5'h13):(4'h8)])));
              reg155 <= (wire58[(4'h8):(2'h3)] & (wire54 + ($signed({wire58,
                      (8'hbe)}) ?
                  {$unsigned((8'ha2)), (reg154 ? wire147 : wire147)} : ({reg156,
                          wire58} ?
                      (reg157 >>> (8'ha2)) : wire59[(5'h10):(2'h2)]))));
            end
          else
            begin
              reg152 <= $signed($signed(wire150[(3'h6):(3'h5)]));
              reg153 <= wire149[(2'h2):(2'h2)];
              reg154 <= (($unsigned($unsigned((wire149 << wire56))) < (|$signed((wire150 + (8'ha2))))) >= ({wire55} ?
                  $signed(($unsigned(reg154) - wire57)) : (wire59[(3'h6):(2'h2)] <<< (|(^~wire149)))));
              reg155 <= (~|reg155[(2'h3):(2'h2)]);
              reg156 <= $unsigned(((8'ha2) + $signed($unsigned($unsigned(reg154)))));
            end
          reg157 <= wire59;
          reg158 <= ({reg156[(2'h3):(2'h2)]} ? wire57[(3'h5):(3'h4)] : reg155);
          reg159 <= (&($unsigned(({wire149} ^~ $unsigned(wire59))) ?
              (($unsigned(reg160) ? (wire55 ^ wire147) : $signed(wire55)) ?
                  ((~reg151) ?
                      reg156 : $signed((8'ha3))) : reg151) : $unsigned(reg156)));
        end
      reg162 <= wire57;
      reg163 <= wire54;
      reg164 <= reg162[(3'h4):(3'h4)];
    end
  module165 #() modinst181 (wire180, clk, reg154, reg163, wire54, wire149, reg156);
  assign wire182 = $unsigned(reg162[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      if ((-{((~&(&wire56)) <= (wire54 && (wire58 ? (8'hbf) : reg161)))}))
        begin
          reg183 <= wire147[(3'h4):(2'h2)];
        end
      else
        begin
          reg183 <= $unsigned((&(|(~|(^~(8'hb4))))));
        end
      reg184 <= (($unsigned(reg161[(4'hd):(1'h0)]) ?
          ({$unsigned(wire147),
              reg156[(3'h6):(1'h1)]} < (^(wire57 - reg183))) : $unsigned((+(reg157 + wire54)))) && (+(8'h9d)));
    end
  assign wire185 = reg155;
  assign wire186 = wire185;
  always
    @(posedge clk) begin
      if ($signed(wire56))
        begin
          reg187 <= (~$unsigned((reg160 || $signed(reg158))));
        end
      else
        begin
          reg187 <= $unsigned(($signed(wire59[(3'h7):(3'h5)]) <= $signed(($unsigned(wire149) << $signed(reg157)))));
          reg188 <= $signed($signed(wire147));
        end
    end
  module189 #() modinst208 (.wire192(reg158), .clk(clk), .wire191(reg162), .wire190(wire186), .wire193(reg159), .y(wire207));
  assign wire209 = (reg155[(1'h1):(1'h0)] ? reg158 : $unsigned(wire180));
  assign wire210 = (8'hb0);
  assign wire211 = (8'haa);
  assign wire212 = ($unsigned((wire211 < reg187)) ?
                       {(8'hab), (^reg187)} : $unsigned($unsigned((!reg184))));
  assign wire213 = (~^$unsigned($signed(((wire210 || wire57) ?
                       (reg151 >= wire54) : reg187))));
  assign wire214 = $signed($unsigned(wire149[(5'h12):(3'h6)]));
endmodule

module module5
#(parameter param29 = (((^{(^~(8'hbc)), {(8'ha6)}}) ^~ {(((7'h43) < (8'ha7)) > (!(8'hb7))), (((8'h9f) ? (8'ha2) : (8'ha8)) ? ((8'ha6) ~^ (8'hb6)) : ((8'hb8) ? (8'hab) : (8'had)))}) ^ (~((~(^(8'ha3))) || (((8'ha5) ? (8'ha9) : (8'hbc)) ? ((8'hab) | (8'ha0)) : ((8'ha1) < (8'hb3)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
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
      if (wire6[(4'hd):(2'h2)])
        begin
          reg10 <= (($unsigned(((wire7 ?
                  wire6 : wire8) >= (wire9 + (8'hb5)))) != (($signed(wire8) >> (wire8 <= wire6)) + $signed({wire9,
                  wire8}))) ?
              $unsigned($signed(((wire8 ? (8'hae) : (8'hb8)) ?
                  (&(8'ha7)) : wire6[(2'h2):(2'h2)]))) : wire9);
          reg11 <= (reg10[(4'h8):(1'h0)] <<< $signed((^wire6)));
        end
      else
        begin
          reg10 <= (~|(~|wire6[(4'hc):(4'ha)]));
          reg11 <= wire7;
          if ((-$signed($unsigned(wire7))))
            begin
              reg12 <= ((~&$signed($signed((~^wire7)))) ^ ($signed(reg11[(2'h2):(2'h2)]) ?
                  $unsigned((reg11[(2'h2):(2'h2)] << $signed(wire7))) : $unsigned(($unsigned(wire8) ?
                      wire6 : $signed(reg11)))));
              reg13 <= $signed(wire7[(2'h3):(2'h2)]);
              reg14 <= reg10;
              reg15 <= ((!$unsigned($signed((reg14 ~^ (8'hb8))))) ?
                  ({($signed(reg11) ? reg10 : $signed(reg11)),
                          $unsigned((reg11 ? reg10 : (8'ha9)))} ?
                      (((wire9 ?
                          reg11 : wire6) == $signed(reg13)) != reg14[(2'h3):(2'h2)]) : {(8'hb2)}) : (($signed((wire7 & wire9)) <= $signed((reg12 ?
                          reg10 : wire9))) ?
                      {((wire6 ?
                              (8'hbf) : wire7) ~^ $unsigned(reg13))} : reg12));
            end
          else
            begin
              reg12 <= ({$unsigned($signed($unsigned(wire7)))} ^~ (((8'h9d) == $signed(((8'h9d) || reg15))) * {$signed(wire7[(1'h1):(1'h0)]),
                  (^reg15[(3'h6):(3'h5)])}));
              reg13 <= {$unsigned((+(+(~|reg15)))), reg14[(4'he):(4'ha)]};
            end
          reg16 <= reg12;
        end
      if ($signed($signed($unsigned(reg11))))
        begin
          if ((($unsigned(reg13[(1'h1):(1'h1)]) | $unsigned(reg10[(4'hf):(4'hb)])) | wire8[(1'h0):(1'h0)]))
            begin
              reg17 <= (reg14[(5'h13):(5'h10)] == (($signed({reg10, reg15}) ?
                  $unsigned({wire9}) : reg13[(2'h3):(2'h3)]) ~^ reg11));
              reg18 <= $unsigned((~|{((wire8 + reg14) << reg15[(4'hf):(4'hd)]),
                  (+$unsigned(reg16))}));
              reg19 <= (+(8'ha7));
              reg20 <= (+(~|$unsigned({wire6[(1'h0):(1'h0)]})));
              reg21 <= (8'ha9);
            end
          else
            begin
              reg17 <= reg11[(3'h5):(3'h4)];
              reg18 <= ($signed($unsigned(wire9)) ^ (~&reg10));
              reg19 <= $signed(($signed($unsigned({reg19})) ?
                  $signed(reg21) : wire7));
              reg20 <= (!$unsigned(((8'hab) ?
                  $signed($unsigned(wire6)) : reg18[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg17 <= reg12;
          if ($unsigned(reg21))
            begin
              reg18 <= (reg20[(4'ha):(3'h4)] - $signed((^(8'hbc))));
              reg19 <= reg16;
              reg20 <= reg20;
            end
          else
            begin
              reg18 <= $signed(wire8[(3'h5):(3'h5)]);
              reg19 <= $signed({{$signed((&reg14)), (~|wire7)},
                  (&(reg14 ? $unsigned(wire7) : (reg14 || reg15)))});
              reg20 <= wire9;
            end
        end
      reg22 <= reg19;
      reg23 <= (wire8 > (|(8'ha8)));
    end
  assign wire24 = $unsigned(wire7[(3'h4):(2'h3)]);
  assign wire25 = $unsigned(((~|$unsigned(reg22)) ~^ $signed((~^(reg17 ?
                      wire6 : reg19)))));
  assign wire26 = ($signed(reg21[(1'h0):(1'h0)]) ?
                      (wire8[(1'h1):(1'h0)] ?
                          ((~^(~^(8'hbe))) && $unsigned(wire24[(4'ha):(4'ha)])) : (~^$signed((~&(8'hb3))))) : (reg11[(3'h5):(1'h0)] ?
                          reg23[(1'h1):(1'h0)] : $unsigned((8'ha4))));
  assign wire27 = ($unsigned(reg14) ?
                      $signed($unsigned($unsigned({(8'hb3),
                          reg10}))) : (reg18 | $unsigned(reg15)));
  assign wire28 = (!((+reg14[(4'h8):(3'h7)]) || (reg20 ?
                      reg18 : (reg17 ? {wire26, reg12} : (reg18 >> wire24)))));
endmodule

module module189  (y, clk, wire193, wire192, wire191, wire190);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire193;
  input wire signed [(4'hf):(1'h0)] wire192;
  input wire [(2'h3):(1'h0)] wire191;
  input wire [(2'h3):(1'h0)] wire190;
  wire [(2'h2):(1'h0)] wire206;
  wire signed [(2'h2):(1'h0)] wire205;
  wire signed [(4'hc):(1'h0)] wire204;
  wire [(2'h3):(1'h0)] wire203;
  wire signed [(2'h2):(1'h0)] wire202;
  wire [(4'he):(1'h0)] wire201;
  wire signed [(4'h8):(1'h0)] wire200;
  wire signed [(3'h5):(1'h0)] wire199;
  wire signed [(4'h8):(1'h0)] wire198;
  wire [(5'h13):(1'h0)] wire197;
  wire signed [(5'h14):(1'h0)] wire196;
  wire signed [(3'h4):(1'h0)] wire195;
  wire [(3'h4):(1'h0)] wire194;
  assign y = {wire206,
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
                 wire194,
                 (1'h0)};
  assign wire194 = $signed($signed(wire192[(4'ha):(2'h3)]));
  assign wire195 = (|wire190);
  assign wire196 = wire191;
  assign wire197 = (~&((^$signed(wire193)) ~^ wire193));
  assign wire198 = {wire195};
  assign wire199 = wire191;
  assign wire200 = ((~&($unsigned($signed(wire192)) - $unsigned({wire194,
                       wire197}))) || wire197[(1'h0):(1'h0)]);
  assign wire201 = wire198[(1'h1):(1'h1)];
  assign wire202 = wire198[(2'h2):(1'h1)];
  assign wire203 = {wire192, wire197};
  assign wire204 = $unsigned($signed(wire191[(2'h3):(2'h3)]));
  assign wire205 = {wire194};
  assign wire206 = $signed({wire203[(2'h2):(1'h0)],
                       $unsigned($unsigned(((8'ha4) ? wire201 : wire204)))});
endmodule

module module165  (y, clk, wire170, wire169, wire168, wire167, wire166);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire170;
  input wire [(2'h3):(1'h0)] wire169;
  input wire signed [(3'h6):(1'h0)] wire168;
  input wire signed [(5'h12):(1'h0)] wire167;
  input wire [(2'h3):(1'h0)] wire166;
  wire signed [(2'h2):(1'h0)] wire179;
  wire [(5'h14):(1'h0)] wire178;
  wire signed [(2'h3):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire176;
  wire signed [(4'hf):(1'h0)] wire175;
  wire signed [(3'h4):(1'h0)] wire174;
  wire signed [(5'h14):(1'h0)] wire173;
  wire [(2'h2):(1'h0)] wire172;
  wire [(5'h14):(1'h0)] wire171;
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 (1'h0)};
  assign wire171 = (8'hb2);
  assign wire172 = ((~^$unsigned(wire170)) ?
                       $unsigned(wire169) : $unsigned((~^wire170)));
  assign wire173 = $unsigned((wire167 ?
                       (~|($unsigned(wire170) ?
                           wire169[(1'h1):(1'h0)] : ((8'hb9) <= wire170))) : (($unsigned(wire172) ?
                               {wire172, wire170} : (wire170 ?
                                   wire167 : wire167)) ?
                           ((-(8'hb5)) ?
                               (wire171 ? wire169 : wire169) : (wire170 ?
                                   wire169 : wire168)) : $unsigned(wire168))));
  assign wire174 = $unsigned($signed((~|wire172)));
  assign wire175 = ($unsigned((({wire168, wire167} ?
                       (wire168 > (8'h9f)) : (wire171 ?
                           wire169 : wire168)) | wire174)) != {({$signed(wire174)} <<< $unsigned($unsigned(wire167))),
                       (((+wire172) | $unsigned(wire166)) ?
                           (~&(wire173 << wire167)) : $unsigned(wire171[(4'hf):(1'h0)]))});
  assign wire176 = $unsigned(wire171);
  assign wire177 = wire169[(1'h0):(1'h0)];
  assign wire178 = wire174[(2'h2):(1'h0)];
  assign wire179 = wire173[(4'hc):(4'ha)];
endmodule

module module122  (y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire127;
  input wire [(4'he):(1'h0)] wire126;
  input wire signed [(3'h4):(1'h0)] wire125;
  input wire signed [(3'h5):(1'h0)] wire124;
  input wire [(5'h13):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire145;
  wire signed [(3'h5):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire140;
  wire [(4'hf):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire138;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire136;
  wire [(3'h7):(1'h0)] wire135;
  wire signed [(4'hb):(1'h0)] wire133;
  wire [(4'h8):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire131;
  wire [(2'h3):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire signed [(5'h12):(1'h0)] wire128;
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg143,
                 reg142,
                 reg134,
                 (1'h0)};
  assign wire128 = $signed(wire124[(1'h0):(1'h0)]);
  assign wire129 = wire127[(1'h1):(1'h1)];
  assign wire130 = $signed(wire128);
  assign wire131 = wire126[(4'hd):(1'h1)];
  assign wire132 = {$signed($signed(wire130[(1'h0):(1'h0)])), wire127};
  assign wire133 = $unsigned(wire125);
  always
    @(posedge clk) begin
      reg134 <= wire127;
    end
  assign wire135 = (+(7'h43));
  assign wire136 = ({$unsigned((wire126 ?
                               $signed(wire125) : wire132[(2'h3):(2'h3)]))} ?
                       $signed(reg134) : wire131[(4'h9):(3'h7)]);
  assign wire137 = wire135[(3'h5):(3'h4)];
  assign wire138 = $unsigned($unsigned((~^$unsigned($signed(wire130)))));
  assign wire139 = $signed(wire138);
  assign wire140 = wire131;
  assign wire141 = ({(~&($unsigned(wire137) <<< (wire123 ? wire128 : reg134))),
                       wire138[(3'h6):(3'h4)]} > (wire135[(3'h7):(2'h3)] ?
                       wire138[(1'h0):(1'h0)] : ({$signed(wire128),
                           wire129[(4'hb):(4'ha)]} || wire133)));
  always
    @(posedge clk) begin
      reg142 <= $signed($signed({wire127[(1'h0):(1'h0)]}));
      reg143 <= $signed($unsigned($signed(wire125)));
    end
  assign wire144 = wire139;
  assign wire145 = reg142[(3'h6):(3'h5)];
  assign wire146 = ($signed(wire126) <= $signed(((wire129[(4'hd):(3'h5)] ?
                           wire126[(2'h2):(1'h1)] : $unsigned(reg134)) ?
                       {(wire133 ? wire137 : wire145),
                           wire137[(4'h9):(2'h3)]} : (!((8'ha5) ?
                           wire137 : wire125)))));
endmodule

module module60  (y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h296):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire64;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire signed [(4'hc):(1'h0)] wire62;
  input wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire93;
  wire [(5'h10):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire signed [(2'h3):(1'h0)] wire83;
  wire signed [(3'h5):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire66;
  reg [(5'h15):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(5'h10):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(4'he):(1'h0)] reg109 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(5'h14):(1'h0)] reg67 = (1'h0);
  assign y = {wire117,
                 wire114,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire66,
                 reg119,
                 reg118,
                 reg116,
                 reg115,
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
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
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
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire66 = $signed(wire63);
  always
    @(posedge clk) begin
      if ($unsigned({wire62}))
        begin
          reg67 <= $unsigned(wire65[(3'h5):(1'h0)]);
          if ($signed(((((&wire63) ? (^wire65) : $signed(wire62)) ?
              wire64 : ($signed(wire61) >>> wire61)) <= wire62[(2'h2):(2'h2)])))
            begin
              reg68 <= (~&(wire64 ?
                  $unsigned(wire66) : $unsigned(wire61[(4'hc):(2'h2)])));
              reg69 <= ($unsigned(wire61[(5'h11):(4'ha)]) ?
                  {(+((wire66 ? wire61 : wire62) & $unsigned(wire62))),
                      (-wire65[(1'h1):(1'h1)])} : $signed($signed(wire65[(1'h0):(1'h0)])));
              reg70 <= (^$unsigned(($unsigned(reg68[(2'h3):(2'h3)]) ~^ ((wire65 <<< wire63) ^~ (!wire66)))));
              reg71 <= {$unsigned($signed($unsigned((wire66 * (8'hb3))))),
                  reg68};
              reg72 <= wire62[(4'h9):(2'h3)];
            end
          else
            begin
              reg68 <= (+(reg70[(4'h8):(2'h2)] > (({reg68} ?
                  (~^wire66) : wire66) >> wire62[(4'hb):(1'h1)])));
              reg69 <= ($signed((~^((reg71 && reg67) ?
                  {wire66} : reg70))) + reg68[(4'ha):(4'ha)]);
              reg70 <= $unsigned(wire64);
            end
        end
      else
        begin
          if (wire64)
            begin
              reg67 <= wire65;
              reg68 <= ((wire63 + (~^(&$signed(reg67)))) ~^ {wire62});
            end
          else
            begin
              reg67 <= (reg67[(3'h7):(1'h0)] ~^ $unsigned(wire63));
              reg68 <= ($signed(({$unsigned(wire65), (-wire66)} ?
                  wire66[(4'hd):(2'h3)] : reg67[(3'h5):(2'h3)])) * $unsigned((wire64 ?
                  $unsigned(reg69) : wire62)));
              reg69 <= reg69[(4'hc):(4'ha)];
            end
        end
      reg73 <= $unsigned(reg68[(5'h10):(4'hd)]);
      reg74 <= $unsigned((((~^$signed(wire62)) == (^~$signed(wire62))) && (~$unsigned($signed((8'hb3))))));
      if ($signed({reg67}))
        begin
          if ($signed($signed($unsigned($unsigned(wire62[(4'hb):(4'h9)])))))
            begin
              reg75 <= (-$signed(($unsigned(reg74) + ((wire63 ?
                  (8'hb6) : wire62) * (~|wire64)))));
              reg76 <= reg75[(4'hb):(2'h3)];
            end
          else
            begin
              reg75 <= wire63[(2'h3):(1'h1)];
            end
          reg77 <= reg70;
        end
      else
        begin
          reg75 <= reg69[(4'hc):(1'h1)];
          if (reg67)
            begin
              reg76 <= (~&reg72[(3'h4):(2'h2)]);
              reg77 <= reg69;
            end
          else
            begin
              reg76 <= (~((+(((8'hb4) >= wire66) ?
                  $signed(wire62) : $signed(wire62))) >> (|((reg70 & reg67) ^~ (wire64 ?
                  wire62 : reg77)))));
              reg77 <= reg77;
              reg78 <= $unsigned((($unsigned(reg77[(4'h8):(2'h3)]) >= (((8'hbf) ~^ reg77) ?
                  $unsigned(wire61) : {reg74,
                      reg76})) >= $signed({$unsigned(wire63),
                  $signed(reg73)})));
            end
        end
      reg79 <= (&wire63[(1'h1):(1'h1)]);
    end
  assign wire80 = ($signed($unsigned(wire64)) - $unsigned($unsigned(reg76[(4'hb):(3'h4)])));
  assign wire81 = $unsigned($signed($unsigned({(&wire66),
                      (wire61 >= (8'hb1))})));
  assign wire82 = reg74;
  assign wire83 = wire80;
  assign wire84 = $signed((^$unsigned((|(!reg74)))));
  assign wire85 = (^~(!reg70));
  assign wire86 = {((|reg72[(3'h4):(1'h0)]) >>> $unsigned((8'haa)))};
  assign wire87 = reg77;
  assign wire88 = $signed((wire62 ?
                      wire87[(2'h3):(2'h3)] : wire66[(5'h12):(5'h12)]));
  assign wire89 = ((~|wire83) ?
                      $unsigned($signed(wire80[(4'hf):(4'hd)])) : ($signed(((reg67 & reg75) ?
                              {reg69} : {wire81})) ?
                          $unsigned($unsigned($signed(wire81))) : ((|(8'hb6)) ?
                              $unsigned((reg69 - reg68)) : wire81[(1'h1):(1'h0)])));
  assign wire90 = reg77;
  assign wire91 = ((~{wire80[(2'h2):(2'h2)], ((~reg79) >= (reg75 | reg72))}) ?
                      reg71[(3'h5):(1'h0)] : $signed(wire84[(4'he):(1'h0)]));
  assign wire92 = (-((|reg79) <<< {wire66[(3'h7):(3'h5)]}));
  assign wire93 = $unsigned({(~&wire81[(1'h0):(1'h0)])});
  assign wire94 = ($signed({$unsigned($signed(reg75)),
                          (wire90 ? wire87 : (wire91 ? wire64 : wire87))}) ?
                      $signed((+($unsigned((8'hba)) ?
                          $signed(wire83) : (reg78 ?
                              wire89 : wire82)))) : wire64);
  always
    @(posedge clk) begin
      if (wire82)
        begin
          if (((~&$signed((~&wire82))) ?
              wire63 : $signed(((wire90[(1'h0):(1'h0)] ?
                  $unsigned(reg78) : reg71[(3'h5):(1'h0)]) <= (|(reg69 ?
                  wire86 : (8'ha2)))))))
            begin
              reg95 <= wire81[(1'h0):(1'h0)];
              reg96 <= (wire92 ?
                  ({({reg75} >>> reg78)} < reg71[(2'h2):(1'h0)]) : $unsigned((reg72[(4'hb):(2'h2)] >= wire94)));
              reg97 <= $signed(wire80[(4'he):(4'h9)]);
              reg98 <= reg70;
              reg99 <= wire80[(4'h9):(3'h6)];
            end
          else
            begin
              reg95 <= $signed((-{(wire63[(2'h2):(2'h2)] >> (reg77 < reg68))}));
              reg96 <= ($signed(wire83[(1'h1):(1'h0)]) + $unsigned($unsigned($signed(wire83[(2'h3):(2'h2)]))));
              reg97 <= $unsigned({wire87});
            end
          reg100 <= $unsigned(wire93[(2'h3):(1'h0)]);
        end
      else
        begin
          reg95 <= ($unsigned($signed($signed($signed(wire86)))) ^ $signed((-($unsigned(reg77) ?
              wire85 : $signed(wire91)))));
        end
      reg101 <= wire63;
    end
  always
    @(posedge clk) begin
      reg102 <= (wire86 ?
          (($unsigned((!reg67)) ?
              wire89[(4'hc):(4'hc)] : ($unsigned(reg96) <= (|wire63))) == (($signed(wire61) != $unsigned((8'hb8))) ?
              (~$signed(wire87)) : $unsigned((+reg99)))) : ($unsigned(wire62) ?
              (|(^~$unsigned((8'had)))) : (reg79[(3'h4):(1'h1)] & $signed(wire85[(2'h2):(2'h2)]))));
      reg103 <= (reg77 ^~ $unsigned($signed(wire86)));
      if (wire62[(2'h3):(1'h1)])
        begin
          if (reg74)
            begin
              reg104 <= reg103;
              reg105 <= (~|($unsigned((-reg75[(1'h1):(1'h1)])) || (($signed(wire91) | (wire61 ?
                      wire86 : wire66)) ?
                  {reg74} : (|wire93))));
              reg106 <= $unsigned($unsigned($signed(wire82)));
              reg107 <= reg101;
            end
          else
            begin
              reg104 <= (wire89 && $signed($signed(reg71)));
              reg105 <= {$signed((wire80 <<< ((~&reg69) && $signed(wire80)))),
                  wire86};
              reg106 <= reg73;
              reg107 <= (reg75 ? wire82 : $signed($unsigned(reg75)));
              reg108 <= $unsigned(($signed(reg98[(3'h7):(3'h5)]) ^~ reg72[(2'h3):(1'h0)]));
            end
          reg109 <= $signed(($signed(wire63) || (8'ha1)));
          reg110 <= (~^{{((reg99 ? wire90 : wire66) ?
                      reg107 : reg72[(4'hb):(1'h1)]),
                  wire86[(3'h7):(3'h5)]}});
          reg111 <= (!(((^~(wire80 ? reg95 : wire64)) ?
                  ({wire62} ?
                      (-reg101) : $unsigned(reg77)) : (~&((8'hbb) != reg74))) ?
              reg70[(2'h3):(1'h1)] : ($signed((reg100 ? (7'h40) : wire85)) ?
                  $unsigned($signed(reg102)) : ((+reg75) || (8'ha0)))));
        end
      else
        begin
          reg104 <= reg67[(4'hf):(1'h0)];
          reg105 <= {$unsigned((~$unsigned((reg103 == reg111))))};
          reg106 <= {(wire65[(3'h7):(3'h4)] ?
                  (~$signed($signed(reg74))) : $unsigned($signed(reg75[(4'hc):(3'h5)])))};
          reg107 <= ((((^~$unsigned((8'ha8))) ?
                      (!reg77[(2'h2):(1'h1)]) : $unsigned($signed((8'ha8)))) ?
                  reg76[(4'h8):(2'h2)] : {({reg96, reg69} ?
                          (reg96 >>> wire94) : $signed(reg73)),
                      wire94[(1'h0):(1'h0)]}) ?
              {(8'ha0)} : ((~|($signed(reg103) ?
                      (reg105 && wire80) : (reg100 ^ reg67))) ?
                  $signed($signed(wire82[(3'h4):(2'h3)])) : ((8'ha4) ?
                      reg71 : reg76[(4'hc):(4'h8)])));
        end
      reg112 <= reg100[(4'hf):(4'hf)];
      reg113 <= (reg106 <= (wire66 != wire65));
    end
  assign wire114 = (((^reg101[(2'h3):(1'h0)]) << reg68[(4'ha):(4'h9)]) ^~ {{(^$unsigned(wire61)),
                           $signed(reg71)},
                       ($signed(reg98[(3'h6):(3'h5)]) || ($unsigned(wire86) ?
                           reg75 : {(8'ha9)}))});
  always
    @(posedge clk) begin
      reg115 <= reg111;
      reg116 <= (-{(^($signed(reg102) | $signed(reg108))),
          (!(wire114 ? (^~wire85) : $signed(reg77)))});
    end
  assign wire117 = reg77[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      reg118 <= (^~$unsigned(wire91[(1'h0):(1'h0)]));
      reg119 <= $unsigned((wire80 >= $signed((^reg110))));
    end
endmodule
