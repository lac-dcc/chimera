module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire247;
  wire [(5'h12):(1'h0)] wire246;
  wire [(3'h7):(1'h0)] wire245;
  wire signed [(5'h12):(1'h0)] wire244;
  wire signed [(4'hf):(1'h0)] wire232;
  wire signed [(4'h8):(1'h0)] wire231;
  wire signed [(4'h8):(1'h0)] wire230;
  wire [(4'hf):(1'h0)] wire217;
  wire signed [(5'h13):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire221;
  wire [(5'h12):(1'h0)] wire222;
  wire signed [(3'h5):(1'h0)] wire223;
  wire [(4'h8):(1'h0)] wire224;
  wire [(4'hd):(1'h0)] wire226;
  wire [(5'h14):(1'h0)] wire227;
  wire [(4'ha):(1'h0)] wire228;
  reg signed [(3'h5):(1'h0)] reg243 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg242 = (1'h0);
  reg [(4'hd):(1'h0)] reg241 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg240 = (1'h0);
  reg [(5'h14):(1'h0)] reg239 = (1'h0);
  reg [(2'h2):(1'h0)] reg238 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg237 = (1'h0);
  reg [(3'h5):(1'h0)] reg236 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg235 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg234 = (1'h0);
  reg [(5'h12):(1'h0)] reg233 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg225 = (1'h0);
  reg [(4'h9):(1'h0)] reg220 = (1'h0);
  reg [(5'h14):(1'h0)] reg219 = (1'h0);
  assign y = {wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire232,
                 wire231,
                 wire230,
                 wire217,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire221,
                 wire222,
                 wire223,
                 wire224,
                 wire226,
                 wire227,
                 wire228,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg225,
                 reg220,
                 reg219,
                 (1'h0)};
  module5 #() modinst56 (wire55, clk, wire0, wire1, wire2, wire4);
  assign wire57 = (wire4 ?
                      $unsigned(wire0[(4'he):(4'hc)]) : (wire3 ?
                          $signed({wire2[(4'h8):(3'h7)]}) : {$unsigned(((8'ha1) ?
                                  (8'hb5) : wire3)),
                              $signed((wire1 ? wire3 : wire55))}));
  assign wire58 = (^$signed({(wire3[(4'hc):(3'h6)] ?
                          $signed(wire57) : $signed(wire3)),
                      $signed((wire1 * (8'hab)))}));
  assign wire59 = (~|wire4[(4'hd):(4'h8)]);
  assign wire60 = (|$unsigned(wire58));
  module61 #() modinst218 (.wire66(wire59), .wire63(wire4), .wire65(wire3), .y(wire217), .wire62(wire58), .wire64(wire57), .clk(clk));
  always
    @(posedge clk) begin
      reg219 <= (wire57 ?
          $unsigned($signed(((~(7'h41)) ?
              wire59 : (&(8'h9f))))) : {$signed(wire59),
              (wire60 >> {(wire217 & wire217), {(8'hbf)}})});
      reg220 <= {(((-$unsigned(wire0)) ?
                  $signed((wire1 & wire60)) : ((|wire57) ^ (^~reg219))) ?
              (($signed(wire59) << (^~wire59)) ~^ {(wire0 ~^ wire57)}) : $signed((-$signed(wire58))))};
    end
  assign wire221 = ({{{(wire58 < wire0), (^~wire2)},
                           $signed(wire55[(3'h5):(3'h5)])},
                       (|($unsigned(wire2) + $unsigned((8'ha4))))} || $unsigned(wire57[(3'h7):(3'h4)]));
  assign wire222 = $unsigned($unsigned(($unsigned($unsigned(wire57)) ?
                       $unsigned(wire55[(3'h5):(2'h3)]) : wire59)));
  assign wire223 = ((($signed(wire59) ?
                           (&(!wire0)) : $signed(reg219[(2'h3):(1'h1)])) | (~^{reg220[(4'h8):(3'h7)],
                           wire3})) ?
                       (wire57[(4'h8):(1'h1)] ?
                           $signed($signed(wire221[(4'hd):(4'hc)])) : (reg219[(3'h7):(2'h3)] ?
                               wire57[(3'h6):(3'h4)] : (wire4[(4'hc):(3'h7)] ?
                                   $signed(wire59) : wire3))) : wire4);
  assign wire224 = ((wire0[(5'h10):(2'h2)] + $signed(wire59)) ~^ wire3[(4'h8):(3'h5)]);
  always
    @(posedge clk) begin
      reg225 <= (reg220[(2'h2):(1'h1)] ?
          $unsigned((((wire1 * wire0) ~^ wire217[(4'hf):(4'he)]) << $signed(wire58))) : $signed(wire55[(3'h6):(1'h0)]));
    end
  assign wire226 = (7'h44);
  assign wire227 = $signed({wire0[(4'h8):(4'h8)], (8'ha4)});
  module147 #() modinst229 (.y(wire228), .wire150(wire3), .clk(clk), .wire148(wire2), .wire152(wire60), .wire149(wire4), .wire151(wire227));
  assign wire230 = (~^{(^(wire0 ? wire59 : reg219)), wire59});
  assign wire231 = $signed($signed($unsigned($signed((^wire3)))));
  assign wire232 = (~|(wire0[(5'h10):(4'ha)] ^~ ((~|(wire223 ?
                       wire231 : wire224)) > $signed((reg220 > wire221)))));
  always
    @(posedge clk) begin
      reg233 <= wire2[(4'ha):(4'h9)];
      if (wire59[(1'h1):(1'h1)])
        begin
          reg234 <= $signed((($signed((wire230 ? wire2 : (8'haf))) << wire55) ?
              (+{$unsigned(wire232), {wire224}}) : {wire0,
                  (+(wire222 ? wire4 : wire224))}));
          reg235 <= $unsigned(reg225[(1'h1):(1'h1)]);
          reg236 <= (!reg225[(1'h1):(1'h1)]);
        end
      else
        begin
          reg234 <= wire60;
          reg235 <= (wire232 ?
              $unsigned((8'hb3)) : $unsigned((+((8'hae) ?
                  $signed(wire4) : (wire59 >>> wire1)))));
          reg236 <= wire3;
          reg237 <= (wire232[(1'h1):(1'h1)] < (+{wire231[(3'h4):(3'h4)],
              (wire226 <<< (wire222 == wire59))}));
          reg238 <= {($signed({(wire3 ? wire0 : (8'hae))}) ?
                  $unsigned((~&reg233)) : $unsigned(((wire2 ?
                      reg225 : wire57) | $unsigned(wire0)))),
              ($unsigned(reg236[(3'h5):(1'h0)]) ?
                  reg233 : $unsigned(({wire57,
                      wire217} || (wire223 << reg225))))};
        end
      if (wire227)
        begin
          reg239 <= $signed($signed((8'hb0)));
          reg240 <= ($unsigned((wire228[(3'h4):(1'h1)] ?
                  ($signed(wire0) >= (8'hb0)) : ((wire230 ?
                      wire217 : wire55) <<< (reg237 ? (7'h44) : (8'hbd))))) ?
              ((($unsigned(reg239) ? reg237[(3'h7):(3'h7)] : (8'hbd)) ?
                  {wire1} : (&(wire4 ?
                      wire57 : wire228))) ^~ (8'ha0)) : (^(8'hb7)));
          reg241 <= {($signed(((wire226 < wire223) ?
                  (reg219 ?
                      reg240 : wire3) : $signed((8'hb4)))) > $unsigned($unsigned(wire58))),
              $unsigned((((wire231 <<< wire59) ?
                  (wire60 ? (8'hb5) : reg236) : (~|wire227)) <= reg234))};
          reg242 <= wire59;
          reg243 <= reg242[(1'h1):(1'h1)];
        end
      else
        begin
          reg239 <= $unsigned(wire57);
          reg240 <= (reg239 ?
              {(((wire227 ?
                      wire223 : reg237) | $unsigned(wire223)) >= {(wire231 < wire58),
                      ((8'hb5) ? reg219 : wire217)}),
                  wire223[(2'h2):(1'h1)]} : (^((wire231[(1'h0):(1'h0)] <<< $signed(wire223)) + wire228[(1'h1):(1'h1)])));
          reg241 <= ((~|$unsigned({(+wire0),
              (~&reg242)})) != reg238[(1'h0):(1'h0)]);
          reg242 <= $unsigned(wire226);
        end
    end
  assign wire244 = (reg241[(4'h8):(4'h8)] && ((^wire231[(3'h4):(1'h1)]) < {$unsigned(reg233[(4'hc):(3'h4)])}));
  assign wire245 = (($unsigned(wire57[(5'h11):(4'h8)]) << $unsigned(wire222[(3'h6):(3'h4)])) <= ((|($unsigned(wire221) >> {(8'hb5)})) ?
                       $unsigned(((~|(8'h9e)) ?
                           wire222[(2'h3):(1'h1)] : reg236)) : reg219[(3'h5):(1'h1)]));
  assign wire246 = wire57;
  assign wire247 = (wire1[(5'h13):(4'h9)] ? (~&wire60) : reg243);
endmodule

module module61
#(parameter param216 = (((({(8'hbd)} || (8'hb5)) ? (&((7'h41) || (8'ha3))) : (((8'hac) <= (8'ha4)) ~^ ((8'hb2) <<< (8'hb6)))) ? ((((8'ha9) >= (8'hbf)) ? ((8'ha2) & (8'hb9)) : (~|(8'hbb))) ? (~&(|(8'hbe))) : ({(8'hbe)} + {(8'hb3), (8'ha8)})) : ({{(8'ha0)}, {(8'hac), (8'ha1)}} ^ ((|(8'hb5)) - {(8'hb0), (8'hb3)}))) ? ((~^((~(8'ha9)) ? (^~(8'hb3)) : (!(8'hb0)))) ? ({((8'hbd) <<< (8'hab)), (~&(8'hb9))} ? (|((8'hb4) ? (8'hb9) : (8'ha1))) : ({(8'haf), (8'hb6)} >= (-(8'hb1)))) : (^~(+(8'ha9)))) : {{(&((8'hae) & (8'h9c)))}, (~^(!((8'ha2) ? (7'h44) : (8'hbf))))}))
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire66;
  input wire signed [(4'ha):(1'h0)] wire65;
  input wire signed [(5'h14):(1'h0)] wire64;
  input wire signed [(5'h15):(1'h0)] wire63;
  input wire signed [(5'h11):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire215;
  wire [(3'h7):(1'h0)] wire214;
  wire signed [(5'h11):(1'h0)] wire213;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire103;
  wire signed [(4'h9):(1'h0)] wire104;
  wire [(5'h11):(1'h0)] wire105;
  wire signed [(5'h14):(1'h0)] wire106;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire211;
  assign y = {wire215,
                 wire214,
                 wire213,
                 wire100,
                 wire67,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire145,
                 wire211,
                 (1'h0)};
  assign wire67 = $signed($signed(wire63));
  module68 #() modinst101 (.wire69(wire64), .wire71(wire66), .wire70(wire62), .clk(clk), .wire72(wire63), .wire73(wire65), .y(wire100));
  assign wire102 = ($unsigned($signed(wire65[(3'h6):(2'h2)])) ?
                       $unsigned(wire66) : (+$unsigned(wire100[(3'h4):(2'h2)])));
  assign wire103 = (|$unsigned($signed(wire66)));
  assign wire104 = ({wire63,
                       ((wire65 & wire63[(3'h7):(2'h2)]) ?
                           wire64[(5'h13):(4'hc)] : ((|wire67) ?
                               ((7'h44) ~^ wire100) : wire65))} >>> (~&wire65[(4'h9):(3'h4)]));
  assign wire105 = $unsigned($signed(wire104[(3'h7):(2'h2)]));
  assign wire106 = (&wire66[(4'ha):(3'h7)]);
  assign wire107 = wire65[(4'h8):(3'h6)];
  assign wire108 = {(wire102[(2'h2):(1'h1)] & ((wire100[(4'h8):(2'h2)] ^~ (wire103 ?
                           (8'h9c) : wire104)) << (^~$unsigned(wire103)))),
                       ({$unsigned($signed(wire104)),
                           wire63[(5'h11):(2'h3)]} >> {$unsigned(wire66)})};
  module109 #() modinst146 (wire145, clk, wire64, wire104, wire66, wire106);
  module147 #() modinst212 (.wire151(wire102), .wire148(wire67), .clk(clk), .wire150(wire108), .wire152(wire145), .y(wire211), .wire149(wire105));
  assign wire213 = $signed(wire211[(4'hc):(4'hc)]);
  assign wire214 = (~^wire102);
  assign wire215 = wire214;
endmodule

module module5
#(parameter param54 = (((8'ha8) ? ({((8'ha1) ~^ (8'hb5))} ^ (((8'hb7) ? (8'hb8) : (8'ha3)) + (^~(8'ha7)))) : (8'hae)) < (((((8'hae) ? (8'hb2) : (8'hbf)) ? {(8'hb5)} : ((8'hab) || (8'ha9))) ? {((8'h9f) ? (8'hb3) : (8'hb0)), ((8'hb4) ? (8'ha7) : (8'hb4))} : (((7'h42) ? (8'ha5) : (8'hb0)) ? {(8'ha5), (8'hb4)} : ((8'hbe) ? (8'haf) : (8'hb9)))) ^~ {(&((8'hb5) ? (8'hba) : (7'h40)))})))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire37;
  wire [(2'h2):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire52;
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire14,
                 wire15,
                 wire16,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire52,
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
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = {$signed(wire7), (8'h9e)};
  always
    @(posedge clk) begin
      reg11 <= $signed({wire9[(3'h5):(3'h5)], wire9});
      reg12 <= ((8'hb9) == (~^$unsigned((~&((8'hbc) ? wire7 : wire7)))));
      if ($signed((((|reg12) >= ((~wire8) ?
          (wire10 ?
              (7'h41) : (8'ha3)) : $signed(wire6))) - ({$unsigned((8'ha9))} <<< (wire6 > $signed(wire7))))))
        begin
          reg13 <= wire6[(1'h1):(1'h0)];
        end
      else
        begin
          reg13 <= (reg12 ?
              {(wire9 ~^ $unsigned(wire8[(1'h0):(1'h0)])),
                  reg13[(4'h8):(3'h7)]} : (((|$signed(reg13)) > reg13) - (((~|wire10) << ((8'hb3) * (8'ha9))) ?
                  (-(wire10 | (8'hbd))) : (&wire6))));
        end
    end
  assign wire14 = ($signed(reg12[(1'h0):(1'h0)]) ?
                      wire7 : reg11[(3'h6):(1'h1)]);
  assign wire15 = ((-{(~$signed(wire9)),
                          ($unsigned(reg13) || reg13[(3'h4):(3'h4)])}) ?
                      ($unsigned(wire9[(4'hb):(3'h4)]) ?
                          $signed((wire10 + (reg11 ?
                              wire9 : (8'hb0)))) : wire7) : wire10[(4'h8):(4'h8)]);
  assign wire16 = $unsigned((~&$unsigned($unsigned((reg12 ?
                      (8'h9f) : reg11)))));
  always
    @(posedge clk) begin
      reg17 <= reg12[(2'h3):(1'h1)];
      if ($unsigned((8'h9c)))
        begin
          reg18 <= (reg12[(1'h1):(1'h1)] <= $unsigned(wire8[(3'h5):(3'h4)]));
          if (((~$signed((~^(^~wire15)))) ? (8'hb8) : wire9))
            begin
              reg19 <= reg11[(1'h0):(1'h0)];
              reg20 <= (reg18[(4'h9):(3'h5)] ?
                  reg11[(1'h0):(1'h0)] : $signed((reg13[(4'hb):(1'h1)] <= (wire9[(3'h6):(1'h0)] ?
                      $signed(wire8) : $signed(reg19)))));
            end
          else
            begin
              reg19 <= ((+{(~^reg11),
                  $signed($signed(reg20))}) <= (reg13 - $signed((^~$unsigned((8'hb9))))));
            end
        end
      else
        begin
          reg18 <= wire8;
          reg19 <= wire10[(4'hb):(3'h4)];
          if ((wire10 + ((reg18 ?
                  (reg20[(3'h5):(2'h2)] ? $signed(wire7) : reg17) : (+{wire15,
                      reg19})) ?
              reg11 : $signed(($signed(wire10) ? reg17 : (reg11 ^ wire16))))))
            begin
              reg20 <= $signed($signed(wire15[(4'ha):(2'h3)]));
              reg21 <= reg13[(3'h4):(3'h4)];
              reg22 <= (^~reg17[(5'h11):(2'h2)]);
            end
          else
            begin
              reg20 <= ((wire14 ?
                      ($unsigned((reg22 || reg13)) & reg20) : reg18[(4'he):(4'ha)]) ?
                  $unsigned(({$signed(wire6), wire14[(4'hc):(4'hb)]} ?
                      reg20[(4'hd):(1'h0)] : ($signed(reg13) ?
                          (wire10 ?
                              reg21 : wire8) : $signed(reg17)))) : $unsigned((reg19 ?
                      ((-wire8) ? wire9 : (|wire6)) : (~^(wire7 >= (8'hb5))))));
              reg21 <= $signed(($unsigned((reg21[(4'hd):(4'h9)] ?
                  wire10[(3'h6):(3'h4)] : reg18)) & $unsigned((reg19 ^~ $signed(wire6)))));
              reg22 <= reg20[(3'h6):(2'h2)];
            end
        end
      if ((reg11[(4'h8):(3'h5)] ^ $signed(reg20[(3'h4):(3'h4)])))
        begin
          reg23 <= (+(wire7[(4'h9):(1'h0)] ?
              {$unsigned($unsigned(reg20))} : (~^{(reg21 ? reg12 : (8'hb7))})));
        end
      else
        begin
          reg23 <= {wire9,
              (({reg11[(3'h6):(2'h3)]} | $unsigned(reg11[(1'h1):(1'h0)])) ?
                  {{$signed(wire9),
                          (reg23 ?
                              reg13 : reg13)}} : $signed(($signed(reg12) || wire15)))};
          reg24 <= reg13[(3'h6):(2'h2)];
          if (reg23)
            begin
              reg25 <= $signed((8'ha8));
              reg26 <= wire16[(1'h1):(1'h1)];
              reg27 <= $signed((((^(reg21 ? (8'hbf) : wire10)) ?
                  $signed((wire6 * wire10)) : wire16) << $signed(wire15[(1'h1):(1'h1)])));
            end
          else
            begin
              reg25 <= ((^~wire9[(2'h2):(2'h2)]) ?
                  ((((~&wire6) ? reg27[(2'h3):(1'h0)] : $signed(reg13)) ?
                          wire7 : ((reg23 - wire14) ?
                              (-reg23) : $unsigned(reg13))) ?
                      ($signed(reg22) | (~&reg23[(1'h1):(1'h0)])) : {((reg21 | reg18) ?
                              wire16[(3'h7):(2'h3)] : {reg27,
                                  reg27})}) : (-wire14));
              reg26 <= $unsigned($unsigned($signed((reg27[(4'hb):(4'h9)] ?
                  reg11[(4'h8):(1'h0)] : $signed(reg21)))));
              reg27 <= {reg11, $unsigned(reg23)};
              reg28 <= reg27[(3'h7):(3'h5)];
            end
          reg29 <= $unsigned(($unsigned((reg22 & reg13)) ?
              (|(8'ha5)) : reg18[(3'h4):(2'h2)]));
        end
      reg30 <= $signed((reg23 & (((wire10 ? wire8 : wire15) ?
              (reg26 < reg18) : (~wire6)) ?
          reg18 : (&$signed(reg20)))));
      reg31 <= reg21[(3'h7):(3'h5)];
    end
  assign wire32 = $signed((~|reg28));
  assign wire33 = {($signed(($signed(reg31) ?
                          (!wire9) : (reg23 ?
                              reg27 : reg12))) << ((((7'h42) != (8'hb7)) ?
                          {(8'hb1),
                              reg21} : $unsigned((8'hae))) * reg26[(2'h3):(1'h1)]))};
  assign wire34 = {$signed(wire8[(1'h1):(1'h1)])};
  assign wire35 = {$unsigned($unsigned((reg31[(5'h10):(3'h4)] > wire33)))};
  assign wire36 = ((8'haf) ?
                      {$unsigned(($unsigned(wire8) ?
                              $signed(wire32) : $signed(reg31)))} : reg30);
  assign wire37 = $unsigned(({($signed((8'ha2)) ^ {(8'ha5)}),
                      wire33[(2'h2):(1'h0)]} && (!reg29[(1'h0):(1'h0)])));
  assign wire38 = ($signed(wire7) ?
                      {$signed({reg23, {reg21}}),
                          (wire15[(4'h9):(3'h5)] < (~|reg17[(2'h3):(2'h2)]))} : {{wire35,
                              $unsigned({(8'ha3), wire32})}});
  assign wire39 = (wire35 - $unsigned((~^$signed(wire9))));
  assign wire40 = reg31[(5'h13):(5'h13)];
  module41 #() modinst53 (.wire46(wire36), .wire45(reg18), .y(wire52), .wire42(wire10), .wire44(reg25), .clk(clk), .wire43(wire40));
endmodule

module module41
#(parameter param51 = ({(-(!((8'hb1) ~^ (8'had)))), (-((!(8'hb9)) ? ((7'h44) * (7'h43)) : {(8'ha4), (8'hbb)}))} <<< (((8'h9f) && ({(8'ha7)} == ((8'ha8) | (8'hb6)))) ? ((^(~(8'ha8))) ? (-(~^(8'hb2))) : (((8'hac) & (8'had)) > ((8'haf) ~^ (8'hb2)))) : {(((8'ha0) ^~ (7'h40)) || ((8'haa) + (8'hb6))), {((8'hbc) ? (8'ha8) : (8'hb3)), ((8'ha8) ? (8'haa) : (8'ha9))}})))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire46;
  input wire [(4'he):(1'h0)] wire45;
  input wire signed [(3'h6):(1'h0)] wire44;
  input wire [(4'hf):(1'h0)] wire43;
  input wire signed [(3'h7):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  assign y = {wire50, wire49, wire48, wire47, (1'h0)};
  assign wire47 = ({$unsigned($unsigned((wire45 <= (7'h43)))),
                          (-(wire44 || (wire42 ~^ wire45)))} ?
                      wire43[(2'h3):(2'h3)] : ((~|wire42[(2'h2):(1'h0)]) + (({wire46} ^~ wire44) >> wire44)));
  assign wire48 = wire42;
  assign wire49 = wire42;
  assign wire50 = wire48[(4'hb):(1'h0)];
endmodule

module module147
#(parameter param209 = {(((^(~&(8'hba))) << (!{(8'hab)})) || (((~&(8'h9d)) ? (!(8'haf)) : (^(8'hbb))) ? (8'hb3) : {(!(8'hae)), ((8'hac) ? (8'had) : (8'hbd))})), (8'haa)}, 
parameter param210 = ((8'ha2) ? (((~|{param209, param209}) ? (^~(param209 < param209)) : param209) >>> {param209}) : ((-(((8'hba) - param209) ~^ (param209 - param209))) ? param209 : (-(param209 ? {(8'h9d), param209} : param209)))))
(y, clk, wire152, wire151, wire150, wire149, wire148);
  output wire [(32'h2c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire152;
  input wire signed [(4'hb):(1'h0)] wire151;
  input wire [(5'h13):(1'h0)] wire150;
  input wire signed [(4'h9):(1'h0)] wire149;
  input wire signed [(4'h9):(1'h0)] wire148;
  wire [(5'h10):(1'h0)] wire208;
  wire [(4'hf):(1'h0)] wire207;
  wire [(5'h13):(1'h0)] wire205;
  wire signed [(5'h12):(1'h0)] wire180;
  wire [(4'he):(1'h0)] wire179;
  wire [(5'h11):(1'h0)] wire178;
  wire signed [(5'h12):(1'h0)] wire177;
  wire [(4'ha):(1'h0)] wire176;
  wire [(5'h14):(1'h0)] wire172;
  wire signed [(2'h3):(1'h0)] wire171;
  wire [(4'hd):(1'h0)] wire170;
  wire signed [(4'hb):(1'h0)] wire169;
  wire [(5'h12):(1'h0)] wire168;
  reg [(5'h11):(1'h0)] reg206 = (1'h0);
  reg [(3'h7):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg203 = (1'h0);
  reg [(3'h6):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg [(5'h14):(1'h0)] reg200 = (1'h0);
  reg [(2'h2):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg197 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg196 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg195 = (1'h0);
  reg [(5'h11):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg193 = (1'h0);
  reg [(4'hf):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg191 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg190 = (1'h0);
  reg [(5'h10):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg [(3'h5):(1'h0)] reg186 = (1'h0);
  reg [(3'h6):(1'h0)] reg185 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg184 = (1'h0);
  reg [(5'h14):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg [(3'h4):(1'h0)] reg174 = (1'h0);
  reg [(2'h2):(1'h0)] reg173 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg [(5'h15):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg164 = (1'h0);
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(5'h12):(1'h0)] reg162 = (1'h0);
  reg [(3'h4):(1'h0)] reg161 = (1'h0);
  reg [(4'hf):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(5'h11):(1'h0)] reg157 = (1'h0);
  reg [(5'h15):(1'h0)] reg156 = (1'h0);
  reg [(5'h11):(1'h0)] reg155 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire205,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 wire176,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 reg206,
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
                 reg175,
                 reg174,
                 reg173,
                 reg167,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(((wire149[(2'h3):(2'h3)] <= wire152) ?
          $unsigned($unsigned(wire151)) : wire150)))
        begin
          reg153 <= ({$signed((wire150[(5'h10):(1'h0)] ?
                  ((8'hb6) < wire149) : ((8'ha5) ? wire151 : (8'hb5)))),
              $unsigned(((wire148 ^ wire149) || {wire151,
                  wire148}))} != wire152[(4'ha):(3'h7)]);
          reg154 <= $unsigned($unsigned(reg153[(3'h4):(1'h1)]));
          reg155 <= wire150[(4'he):(1'h1)];
          reg156 <= {{$unsigned(($unsigned(wire148) ?
                      (8'hbb) : $unsigned(wire151))),
                  $unsigned((wire152[(2'h2):(1'h1)] >= $signed((8'haf))))},
              (~reg153)};
          if ((8'hb3))
            begin
              reg157 <= ($unsigned((8'hb0)) ?
                  reg156[(4'ha):(2'h3)] : (~^(((reg155 ?
                          wire148 : wire149) >> {reg156}) ?
                      ((reg154 ?
                          wire149 : wire152) > (wire152 << wire152)) : wire151[(1'h0):(1'h0)])));
              reg158 <= reg153[(3'h4):(1'h0)];
              reg159 <= $unsigned(wire152);
              reg160 <= (($signed((((8'hb9) ? reg156 : wire152) ?
                          reg157[(4'h8):(3'h5)] : wire152)) ?
                      ((^$signed(reg158)) * reg159[(3'h4):(1'h0)]) : (~|$unsigned({wire150,
                          (8'hac)}))) ?
                  {((~&(~&reg159)) ?
                          $unsigned(wire151) : $signed({reg159, wire150})),
                      ({reg159, reg157[(3'h6):(1'h1)]} << $signed((reg153 ?
                          reg157 : reg156)))} : $unsigned((~&($unsigned(reg155) >>> (~&reg157)))));
              reg161 <= reg156[(2'h2):(1'h0)];
            end
          else
            begin
              reg157 <= (^((~|reg161) ?
                  (wire148[(3'h4):(2'h3)] ?
                      ($unsigned((8'h9e)) ?
                          reg153 : {wire151,
                              (8'ha3)}) : reg157[(4'hc):(3'h6)]) : {reg154[(2'h2):(1'h1)]}));
              reg158 <= (wire150[(4'ha):(1'h0)] && $unsigned(($unsigned((reg157 & wire148)) << $signed((-wire148)))));
              reg159 <= reg161;
              reg160 <= (wire148 < {$signed((reg154[(1'h1):(1'h0)] >= $unsigned(reg156)))});
              reg161 <= $signed(($unsigned($unsigned((reg155 ?
                      wire150 : reg158))) ?
                  (-{$unsigned(reg154)}) : reg158[(2'h3):(1'h0)]));
            end
        end
      else
        begin
          if ($signed($signed(reg161)))
            begin
              reg153 <= (~&$unsigned(reg156[(5'h11):(3'h7)]));
              reg154 <= $signed((~&(wire150[(4'h9):(4'h8)] >= wire152[(1'h0):(1'h0)])));
            end
          else
            begin
              reg153 <= ((8'ha9) ^~ $signed($signed({(wire150 > (8'hbe))})));
            end
          reg155 <= ($unsigned({reg156[(4'hf):(4'hf)]}) ?
              ($unsigned($unsigned((~|wire151))) == ($signed((reg154 - reg155)) ?
                  ({reg156} == (reg157 ~^ (8'hb6))) : reg157[(4'hb):(4'h9)])) : (+reg157[(5'h10):(4'hd)]));
        end
      if (((wire149 ?
              reg158 : (wire150[(1'h0):(1'h0)] ?
                  ({wire152} ?
                      $signed(reg157) : $signed((8'hb1))) : ((reg153 | reg159) >>> reg156[(5'h15):(4'ha)]))) ?
          ((^~$signed(wire151)) ?
              (wire148[(3'h5):(2'h3)] ?
                  reg158 : ((wire152 ?
                      reg153 : reg155) ^~ $signed(reg158))) : ($signed((~(8'ha6))) ?
                  (&reg160[(1'h1):(1'h0)]) : (~|(reg154 >> wire148)))) : ((reg157[(1'h0):(1'h0)] ?
              ((8'ha7) ?
                  {wire152} : reg156) : $signed($unsigned(reg155))) != $signed(wire150[(1'h1):(1'h1)]))))
        begin
          reg162 <= (reg161[(3'h4):(1'h1)] ^ ((8'ha1) ?
              $signed($unsigned(reg153)) : $unsigned({(~|(7'h44))})));
          reg163 <= $unsigned(wire148);
          if ($signed((({(reg158 <= (8'hab)),
              reg153} | ((reg160 * reg157) + reg161[(3'h4):(2'h3)])) == reg154[(1'h0):(1'h0)])))
            begin
              reg164 <= (($unsigned({reg159[(5'h12):(3'h4)]}) << ((reg163[(3'h7):(2'h2)] - $unsigned(reg153)) * $unsigned(reg156))) - (wire150 ~^ (^($unsigned(wire150) ?
                  reg162 : (reg158 ? wire149 : reg153)))));
              reg165 <= ($unsigned(reg164) >> (($signed((wire148 & reg159)) <= $unsigned($unsigned(reg162))) ?
                  reg164 : wire151[(2'h2):(1'h0)]));
            end
          else
            begin
              reg164 <= $unsigned($unsigned((&($unsigned(wire149) > $signed(reg160)))));
            end
          reg166 <= (reg154 ? wire152[(2'h3):(2'h2)] : {reg158});
          reg167 <= ((8'hb3) >>> (^~(|$signed((reg161 ? (8'had) : reg154)))));
        end
      else
        begin
          reg162 <= wire152;
          reg163 <= (($signed((~^(reg153 != wire151))) ?
                  wire150[(1'h1):(1'h0)] : $signed({(reg155 ? reg162 : reg161),
                      (reg166 >>> reg157)})) ?
              (((-reg164[(1'h1):(1'h1)]) <= ((wire152 ?
                      (8'hbc) : reg161) - reg164)) ?
                  $unsigned((8'ha1)) : wire151[(4'h9):(2'h2)]) : wire151[(3'h6):(1'h1)]);
        end
    end
  assign wire168 = ((-(~^((~reg163) * ((8'hb9) ? (7'h43) : reg160)))) ?
                       (&reg158) : ($signed(((wire152 ? (8'had) : reg165) ?
                               {wire148} : (^~reg160))) ?
                           $unsigned(reg159[(5'h14):(4'h8)]) : reg158[(1'h0):(1'h0)]));
  assign wire169 = reg166[(3'h5):(3'h5)];
  assign wire170 = (^~reg155[(5'h11):(4'hf)]);
  assign wire171 = (8'hb9);
  assign wire172 = (~^$signed((((reg160 ? wire150 : reg159) && (wire170 ?
                           reg162 : reg167)) ?
                       (-reg158) : reg155[(2'h2):(1'h1)])));
  always
    @(posedge clk) begin
      reg173 <= reg154;
      reg174 <= ((reg159[(5'h11):(4'hc)] ?
              (($unsigned(wire152) ^~ {wire170, wire149}) - $unsigned((reg159 ?
                  wire169 : reg157))) : (8'hb9)) ?
          reg166[(1'h1):(1'h1)] : $unsigned((~^((!(8'h9d)) == (reg162 != (8'h9e))))));
      reg175 <= ({($unsigned((-(7'h42))) & {$unsigned(reg159),
              reg167[(4'h9):(3'h7)]})} <<< $unsigned($signed($signed((~^(8'hb4))))));
    end
  assign wire176 = {$unsigned((|reg163))};
  assign wire177 = reg157;
  assign wire178 = reg174[(1'h0):(1'h0)];
  assign wire179 = (((8'h9f) ?
                       wire177 : reg160[(3'h4):(2'h2)]) << (((^~(^~reg158)) ?
                       (wire177 >> (8'h9e)) : wire148) <<< reg159[(5'h11):(3'h4)]));
  assign wire180 = reg153[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if ((8'hb2))
        begin
          reg181 <= ({(~|wire178[(4'he):(3'h5)])} ?
              ((!{wire177,
                  reg154}) & (!wire149[(3'h4):(1'h0)])) : $signed(((^{(8'hb6)}) ?
                  (~^(reg174 >> reg154)) : ($unsigned(reg154) ?
                      reg153 : reg157))));
          reg182 <= ($unsigned(((~|(reg160 & wire172)) <= reg181[(4'ha):(2'h2)])) & reg156[(4'hf):(3'h5)]);
        end
      else
        begin
          reg181 <= $signed((wire151 ?
              $signed($unsigned(((8'hbc) ?
                  wire148 : wire169))) : $signed($unsigned($unsigned(reg163)))));
          if (($unsigned({reg162[(4'hd):(3'h4)],
                  (wire172[(4'hd):(3'h4)] ?
                      $unsigned(wire151) : $unsigned(reg161))}) ?
              ($signed(reg182) <= (-($signed(reg164) >>> (reg162 ?
                  (8'hb2) : wire152)))) : $unsigned(wire150[(4'h8):(2'h2)])))
            begin
              reg182 <= (|((&reg158) ?
                  (+$unsigned({wire177, reg157})) : $unsigned(reg173)));
              reg183 <= (8'hbd);
              reg184 <= $unsigned((&(~^reg159)));
              reg185 <= wire172[(5'h10):(4'h9)];
            end
          else
            begin
              reg182 <= {reg156[(5'h11):(3'h4)]};
              reg183 <= $unsigned(((reg154 ?
                      reg159 : (+(reg185 ? (8'ha6) : reg174))) ?
                  $signed({$signed(reg154)}) : (({wire149,
                      wire151} ^~ wire149[(3'h4):(1'h1)]) <<< ({reg156,
                          wire170} ?
                      (wire176 >>> wire176) : $signed(wire172)))));
              reg184 <= $signed((|(-({(8'hb4),
                  reg175} | (wire169 << wire180)))));
            end
        end
      reg186 <= {(((+reg157[(5'h11):(4'ha)]) <= {$signed(reg155),
              $unsigned(wire176)}) || ((reg161[(2'h2):(2'h2)] * wire179) ?
              reg157 : ($signed((8'hb5)) ?
                  $signed(wire169) : (wire151 * reg159))))};
    end
  always
    @(posedge clk) begin
      reg187 <= (~|$signed(($unsigned($unsigned(wire172)) * ($signed((8'ha5)) & $signed(wire152)))));
      if ((^~reg173))
        begin
          if ($unsigned(wire172))
            begin
              reg188 <= ($unsigned(wire177[(4'he):(4'hb)]) ?
                  (~|(!$signed($unsigned(wire177)))) : reg163[(4'hc):(1'h0)]);
              reg189 <= (wire170[(4'hb):(3'h5)] || reg155[(2'h2):(2'h2)]);
              reg190 <= ((^$unsigned(reg189)) >= reg173);
              reg191 <= reg157;
            end
          else
            begin
              reg188 <= reg163[(4'hf):(3'h7)];
            end
          if ($signed($signed(($signed((^~reg181)) * (8'hac)))))
            begin
              reg192 <= (&reg174);
              reg193 <= $signed({reg160, reg154[(1'h0):(1'h0)]});
              reg194 <= (~wire150);
              reg195 <= $signed($signed((wire150[(3'h6):(3'h5)] || (8'hae))));
            end
          else
            begin
              reg192 <= $unsigned(reg160[(4'h9):(2'h2)]);
              reg193 <= {{{$signed(reg194[(2'h3):(1'h0)])}},
                  (~|$signed((8'hbf)))};
              reg194 <= ($signed(($unsigned($unsigned(reg164)) << (&$unsigned(reg194)))) != (&($signed((wire177 ?
                  (7'h43) : wire178)) >> $signed((~&wire168)))));
              reg195 <= $unsigned(($signed(reg160) ?
                  wire168 : ($unsigned((reg195 ?
                      wire149 : (8'hbc))) <= ($signed(reg188) << ((8'h9c) ^ reg163)))));
              reg196 <= $signed(((((~|reg174) ?
                  reg158[(1'h0):(1'h0)] : (reg194 << wire171)) <= reg161) << $unsigned(({wire177} || (wire178 ?
                  wire170 : reg160)))));
            end
          if ($unsigned((reg162 << $signed({reg166}))))
            begin
              reg197 <= $signed((~$signed((^~$signed(wire150)))));
              reg198 <= ((wire171[(1'h0):(1'h0)] || $unsigned({(wire152 ?
                      reg166 : reg174)})) & reg197[(2'h3):(1'h1)]);
              reg199 <= (~|(wire170[(1'h1):(1'h1)] << $signed((~^reg161))));
              reg200 <= reg173[(1'h0):(1'h0)];
            end
          else
            begin
              reg197 <= reg196;
              reg198 <= (8'hbb);
            end
        end
      else
        begin
          reg188 <= ($unsigned((wire169 && (~^((8'hac) ?
              reg157 : (8'hae))))) & reg154);
        end
    end
  always
    @(posedge clk) begin
      if (($signed((((wire176 << wire172) | (~&reg198)) | ($unsigned(reg167) >> (reg158 * reg193)))) <= $unsigned({($unsigned(wire168) ?
              wire152 : reg162)})))
        begin
          reg201 <= wire178[(4'hd):(2'h2)];
          reg202 <= reg153[(2'h3):(2'h2)];
          reg203 <= (reg199 ? reg161[(3'h4):(3'h4)] : reg164);
          reg204 <= $signed($signed(reg199[(1'h0):(1'h0)]));
        end
      else
        begin
          if ($signed((reg181[(3'h6):(3'h4)] <= ((!(reg195 > wire149)) ?
              reg185[(1'h1):(1'h0)] : (8'ha3)))))
            begin
              reg201 <= {reg200,
                  (($signed(reg174[(1'h1):(1'h0)]) < {$signed(reg166),
                      (wire172 && reg159)}) ~^ {(8'ha8)})};
            end
          else
            begin
              reg201 <= (reg154[(1'h0):(1'h0)] ?
                  ((wire149[(3'h4):(2'h2)] ?
                      $signed((reg203 && wire178)) : wire151[(3'h5):(3'h5)]) || (-reg188)) : (~^reg182));
              reg202 <= ($unsigned(($signed(reg165) ?
                      $signed((reg191 <<< wire169)) : $unsigned($signed(reg200)))) ?
                  (reg158[(2'h2):(2'h2)] ?
                      reg158[(2'h3):(2'h3)] : $signed(reg182[(3'h7):(2'h3)])) : {reg190[(2'h3):(2'h2)]});
              reg203 <= reg204;
            end
          reg204 <= $unsigned({$signed((~^{reg164}))});
        end
    end
  assign wire205 = ($signed(reg164) ?
                       ($signed(wire177) ~^ $signed(((&reg198) ?
                           reg160[(4'hb):(2'h3)] : $signed((8'hb1))))) : reg153[(3'h4):(2'h3)]);
  always
    @(posedge clk) begin
      reg206 <= {wire178, reg202};
    end
  assign wire207 = $signed((($unsigned($signed(wire170)) <= reg161[(2'h3):(1'h0)]) ?
                       ((reg157 ?
                           (wire176 | wire148) : (reg173 ^ wire150)) & $unsigned(reg196)) : (~&((~|wire170) ?
                           (!wire149) : reg173[(1'h1):(1'h0)]))));
  assign wire208 = (|wire149);
endmodule

module module109  (y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire113;
  input wire signed [(3'h4):(1'h0)] wire112;
  input wire [(4'hc):(1'h0)] wire111;
  input wire signed [(3'h4):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire134;
  wire signed [(4'hb):(1'h0)] wire133;
  wire signed [(5'h12):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire131;
  wire signed [(4'hc):(1'h0)] wire130;
  wire signed [(4'h8):(1'h0)] wire129;
  wire [(5'h15):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire123;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire121;
  wire [(3'h6):(1'h0)] wire120;
  wire [(4'hc):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire117;
  wire [(4'he):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(3'h4):(1'h0)] wire114;
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(5'h11):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
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
                 reg124,
                 (1'h0)};
  assign wire114 = wire112[(1'h1):(1'h0)];
  assign wire115 = (((^(8'hb6)) <= $signed(((wire114 ?
                           (8'hb6) : wire114) <= wire110))) ?
                       $signed((($unsigned(wire112) != wire114[(2'h3):(1'h1)]) << ((^~wire111) ?
                           ((8'had) <= wire114) : wire112))) : $signed((wire112[(1'h1):(1'h0)] ?
                           {$signed(wire111)} : {{wire112, wire114}})));
  assign wire116 = wire114[(1'h0):(1'h0)];
  assign wire117 = (wire115[(4'h9):(4'h8)] ?
                       {$unsigned(({wire114} > (wire113 > wire110))),
                           $unsigned(wire114[(3'h4):(2'h3)])} : wire115);
  assign wire118 = (wire115 >> (~|wire115));
  assign wire119 = (^(8'ha2));
  assign wire120 = {($unsigned(wire111) == ($unsigned(wire118) || ($signed(wire117) ?
                           $unsigned(wire115) : (wire115 << wire111)))),
                       wire114[(3'h4):(2'h3)]};
  assign wire121 = wire111[(4'ha):(2'h3)];
  assign wire122 = ((wire110[(1'h0):(1'h0)] | wire110[(2'h2):(1'h0)]) ?
                       $unsigned($signed($signed((wire114 == wire118)))) : $unsigned(($signed((!(8'ha8))) ?
                           {wire112} : (~wire113[(3'h5):(2'h3)]))));
  assign wire123 = (wire110 >>> $signed(wire113[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      reg124 <= $signed($unsigned(wire115[(4'hd):(3'h6)]));
    end
  assign wire125 = (wire120 ?
                       $signed((|(^(wire116 ?
                           wire119 : wire116)))) : $unsigned(($signed(reg124) > ((wire111 ?
                           wire110 : wire122) != $unsigned((8'ha1))))));
  assign wire126 = (&(~|wire110));
  assign wire127 = (wire110[(1'h0):(1'h0)] || wire114[(2'h3):(2'h2)]);
  assign wire128 = wire114;
  assign wire129 = wire111;
  assign wire130 = $signed(($signed((~&wire116)) ?
                       (-{(reg124 | wire111)}) : $signed(wire114)));
  assign wire131 = {(&wire128), $signed($unsigned(wire127))};
  assign wire132 = ((^wire123[(2'h2):(1'h1)]) ^~ wire114);
  assign wire133 = ((~|((-$signed((8'hbe))) ? $unsigned(wire118) : wire131)) ?
                       (&{(wire113[(2'h3):(1'h0)] ? wire122 : $signed((8'hb6))),
                           ((!wire114) - {(8'hbd)})}) : $unsigned(wire110[(1'h1):(1'h0)]));
  assign wire134 = (|$unsigned(($signed((wire111 ? wire131 : wire127)) ?
                       ((wire123 < wire110) ?
                           (wire130 != wire112) : {wire130,
                               wire115}) : $signed((wire128 ?
                           wire122 : wire113)))));
  always
    @(posedge clk) begin
      reg135 <= $signed((+$unsigned(((8'ha0) ? $signed(wire118) : wire120))));
      reg136 <= (&{$unsigned($signed(wire125[(3'h5):(3'h4)]))});
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($signed($signed(reg124)))))
        begin
          if (wire134)
            begin
              reg137 <= ({wire119[(3'h4):(1'h0)],
                      (~|((~&(8'hbb)) * (wire128 ? wire110 : wire125)))} ?
                  ({wire111,
                      (~^wire117[(4'ha):(1'h1)])} | $unsigned(($unsigned(wire129) ?
                      (~^(8'ha5)) : wire121))) : ($unsigned($signed({wire111})) <<< wire126));
            end
          else
            begin
              reg137 <= $signed(reg136);
              reg138 <= (reg136[(3'h5):(3'h5)] <<< ((~wire134) - ((|wire132[(5'h10):(4'h8)]) >> $signed($unsigned(wire113)))));
              reg139 <= (+(reg138 >= (8'ha3)));
              reg140 <= (+$signed(wire119[(4'hb):(3'h7)]));
              reg141 <= (reg136 - $signed((wire130 < (!(wire125 ?
                  wire128 : wire122)))));
            end
          reg142 <= (~|$signed((~^{wire133[(3'h5):(1'h0)]})));
        end
      else
        begin
          reg137 <= (+$unsigned($unsigned($signed((|wire132)))));
          reg138 <= wire112[(2'h2):(2'h2)];
        end
      reg143 <= wire119[(1'h1):(1'h1)];
      reg144 <= (~&((8'ha7) >= wire118[(4'hd):(4'hc)]));
    end
endmodule

module module68
#(parameter param99 = (((({(8'hae), (8'hbf)} ? (|(7'h42)) : ((8'hbe) ? (8'hb2) : (8'hbb))) ? (^((8'hb1) && (8'hb7))) : (-((8'ha2) ~^ (7'h41)))) ? ((8'h9c) ? ((8'h9e) >> ((8'ha1) ? (8'haa) : (8'hb4))) : ({(8'hbf), (8'h9f)} ? {(8'ha4), (8'hbc)} : ((8'hbf) ? (8'h9d) : (8'hbe)))) : {(((7'h43) ? (8'hab) : (8'ha7)) ? (^(7'h44)) : (~(8'hbf))), (~(8'hbf))}) ? (({(~^(8'ha6))} ? (((8'hbf) ? (8'h9c) : (8'ha4)) ? (8'ha8) : ((8'h9d) ? (8'hbd) : (8'hb0))) : (-(!(8'ha9)))) ? (!({(8'hb8), (8'hbc)} + (8'hb5))) : (({(8'hb0), (8'had)} > ((8'ha3) >> (8'ha3))) ? {((8'ha1) && (8'hb8))} : (+{(8'ha1)}))) : (((8'hbc) ? (+{(8'hba)}) : {((8'hb8) > (8'ha0))}) <<< (~|{((8'had) ? (8'hb9) : (8'ha2)), (~|(8'hb4))}))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire73;
  input wire [(4'ha):(1'h0)] wire72;
  input wire signed [(3'h7):(1'h0)] wire71;
  input wire [(5'h11):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire [(3'h6):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire74;
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire74,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire74 = $signed(((7'h44) ^ (~|$unsigned($unsigned((8'h9e))))));
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed((wire74[(1'h0):(1'h0)] ?
          wire72[(3'h5):(2'h3)] : {wire69, wire72})))))
        begin
          reg75 <= ((wire72 <<< {$signed((~|wire69)),
                  ($unsigned(wire74) || wire70[(3'h6):(1'h1)])}) ?
              (|$unsigned(((wire73 >> wire73) ~^ (^wire69)))) : $unsigned({(((8'ha7) ?
                          wire70 : wire74) ?
                      wire73[(2'h3):(2'h3)] : wire69),
                  (~&(wire73 ~^ wire72))}));
          reg76 <= wire72;
        end
      else
        begin
          reg75 <= $unsigned(($unsigned(reg75[(1'h1):(1'h1)]) + ((~|$signed(wire74)) >> wire74)));
          reg76 <= {{wire72[(2'h2):(2'h2)]},
              (-$unsigned($signed((reg76 < wire72))))};
          if ((-reg75[(1'h0):(1'h0)]))
            begin
              reg77 <= (8'hba);
              reg78 <= (wire69 + wire73[(4'h9):(3'h4)]);
              reg79 <= $unsigned($signed((wire73 ?
                  wire71 : $unsigned($signed(wire69)))));
              reg80 <= ((~&((8'hb9) ?
                      $unsigned(reg76) : ({reg79, reg78} ?
                          $unsigned((7'h41)) : (wire74 ? reg77 : wire72)))) ?
                  reg75[(1'h0):(1'h0)] : ((reg75[(1'h0):(1'h0)] >= reg79[(2'h3):(1'h1)]) & (reg75[(1'h1):(1'h1)] - ($signed(wire74) > $signed(reg76)))));
              reg81 <= $signed($unsigned(wire70[(3'h6):(2'h3)]));
            end
          else
            begin
              reg77 <= $signed((&$unsigned((((8'ha4) ? (7'h40) : wire72) ?
                  $unsigned(wire74) : wire74[(2'h2):(2'h2)]))));
              reg78 <= $unsigned($unsigned((+reg81)));
            end
          reg82 <= (+(({reg78, (~|reg80)} >> (~&$signed(reg81))) ?
              $signed(wire72[(4'h9):(2'h3)]) : ((&(reg81 >= reg78)) + wire71)));
        end
    end
  assign wire83 = $signed((wire72[(1'h0):(1'h0)] ?
                      (|reg76) : reg78[(3'h4):(1'h1)]));
  assign wire84 = (^(&(&(reg79[(2'h3):(2'h2)] > (wire74 ^ reg76)))));
  assign wire85 = (~&(({wire71[(1'h0):(1'h0)]} || ((reg81 ?
                          reg78 : reg82) > (^reg82))) ?
                      ($signed((~reg82)) ?
                          $unsigned((wire70 != (8'ha5))) : $unsigned(reg76[(4'hd):(3'h6)])) : (~&$unsigned((wire69 ?
                          wire83 : (8'ha9))))));
  assign wire86 = $signed($signed($unsigned(wire83[(1'h0):(1'h0)])));
  assign wire87 = reg79;
  always
    @(posedge clk) begin
      reg88 <= (((wire87[(3'h6):(3'h4)] ?
              $unsigned((^~reg82)) : $signed((wire85 * wire85))) ?
          $signed(($unsigned(wire83) * wire73[(2'h2):(2'h2)])) : (8'ha9)) - wire85);
      reg89 <= {reg88};
      if ($unsigned($unsigned(reg82)))
        begin
          reg90 <= reg78[(3'h4):(2'h3)];
          reg91 <= ((-wire74[(1'h1):(1'h1)]) >> $signed({($unsigned(reg88) ?
                  ((8'ha7) ? wire73 : wire84) : wire83),
              ($unsigned(reg82) && reg80[(2'h2):(1'h1)])}));
          reg92 <= reg80[(2'h3):(1'h0)];
          reg93 <= $unsigned($unsigned((8'ha9)));
          reg94 <= reg92[(4'ha):(4'ha)];
        end
      else
        begin
          reg90 <= (&(|(&reg78)));
        end
      reg95 <= {$signed(reg89[(4'h9):(3'h4)]), (7'h43)};
      reg96 <= (((&(^(reg94 && wire71))) + $unsigned($unsigned({wire83,
          wire87}))) > reg81[(1'h1):(1'h0)]);
    end
  assign wire97 = $signed(($signed(($unsigned(wire69) > (^~wire70))) ?
                      reg88[(4'hd):(3'h4)] : reg95[(3'h5):(3'h4)]));
  assign wire98 = (~&($signed($unsigned((reg77 ? reg81 : reg89))) - ((wire86 ?
                      (reg89 || (8'hb9)) : $unsigned(wire84)) - (~^$signed(reg95)))));
endmodule
