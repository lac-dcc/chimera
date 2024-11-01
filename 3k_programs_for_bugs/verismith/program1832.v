module top
#(parameter param228 = (!(((^((8'ha5) ? (8'h9e) : (8'h9e))) ? ((|(8'hbc)) ? (~|(8'hb0)) : (~&(8'hb6))) : ((~(8'ha1)) ? {(7'h44), (8'ha4)} : ((8'hb0) ? (8'hb5) : (8'hae)))) ? ({{(8'ha7), (8'ha9)}} > {((8'ha8) ? (8'hbf) : (8'ha6)), ((8'ha3) ? (8'hac) : (8'haf))}) : {(|{(8'h9c)}), {((8'hb6) ? (8'hbd) : (8'hb8)), ((8'hb3) ? (8'hb8) : (7'h44))}})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h268):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire217;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire219;
  wire signed [(5'h14):(1'h0)] wire220;
  wire signed [(5'h13):(1'h0)] wire221;
  wire signed [(5'h13):(1'h0)] wire223;
  wire signed [(5'h14):(1'h0)] wire224;
  wire [(3'h5):(1'h0)] wire225;
  wire signed [(4'he):(1'h0)] wire226;
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  assign y = {wire217,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire4,
                 wire5,
                 wire17,
                 wire219,
                 wire220,
                 wire221,
                 wire223,
                 wire224,
                 wire225,
                 wire226,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg33,
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
                 (1'h0)};
  assign wire4 = (&wire1);
  assign wire5 = (^~(((wire1[(4'hc):(3'h7)] ^~ $unsigned(wire3)) ?
                         {((7'h43) ? wire0 : (8'hb2)),
                             wire1[(4'hb):(1'h0)]} : wire4[(1'h1):(1'h0)]) ?
                     wire0[(2'h3):(2'h2)] : ((~(wire3 ? wire4 : wire3)) ?
                         (8'hb7) : $unsigned($signed(wire4)))));
  module6 #() modinst18 (wire17, clk, wire4, wire5, wire2, wire0, wire3);
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire5);
      reg20 <= (((($unsigned(wire1) ?
                  $unsigned(wire17) : (wire2 ? wire17 : wire0)) ?
              wire1[(4'hc):(4'hc)] : (8'hb5)) ?
          wire1 : {$signed(wire3[(4'hf):(4'he)])}) | $unsigned((($signed(wire2) ?
              $signed(wire5) : wire0[(2'h3):(1'h1)]) ?
          $unsigned((8'ha7)) : (^~(reg19 && wire0)))));
      reg21 <= {$signed($unsigned(wire4[(4'hb):(4'h8)]))};
      reg22 <= (^~wire3);
      if ((reg20[(3'h4):(3'h4)] - (&$unsigned(reg21[(4'ha):(4'ha)]))))
        begin
          reg23 <= (~&(^{reg19}));
          if ({($unsigned(((wire17 - reg21) ^~ (7'h40))) ?
                  {$signed($unsigned(reg22)),
                      reg22[(3'h5):(1'h1)]} : $signed((8'ha1))),
              $signed(wire0[(3'h5):(2'h3)])})
            begin
              reg24 <= reg20[(3'h4):(3'h4)];
              reg25 <= $signed(wire1[(4'h8):(4'h8)]);
              reg26 <= (reg22 <= (~^(-(~&(reg22 & (8'hba))))));
            end
          else
            begin
              reg24 <= $signed((8'h9d));
              reg25 <= $unsigned(reg25);
              reg26 <= reg19[(1'h0):(1'h0)];
              reg27 <= (8'ha2);
            end
          reg28 <= (^~(((!{reg21, reg20}) <= (|(reg26 ? wire17 : wire0))) ?
              $signed((!{wire0})) : reg21[(4'h9):(1'h1)]));
        end
      else
        begin
          reg23 <= $unsigned((wire17[(3'h4):(3'h4)] ~^ {(|$signed(wire3))}));
          if (($unsigned(wire4[(4'hb):(3'h4)]) + reg27[(3'h5):(1'h1)]))
            begin
              reg24 <= {$unsigned({reg28[(2'h3):(2'h2)]})};
              reg25 <= $unsigned(reg28[(1'h0):(1'h0)]);
              reg26 <= reg24[(5'h11):(3'h4)];
              reg27 <= wire3[(4'ha):(2'h3)];
            end
          else
            begin
              reg24 <= $unsigned(wire0);
              reg25 <= (reg24 >>> (({wire5, {reg26}} ?
                  (reg22 ?
                      $signed(reg25) : $signed(reg27)) : (~&reg20[(1'h1):(1'h0)])) << $signed(($unsigned(wire17) ?
                  reg20 : (wire2 ? reg19 : reg21)))));
              reg26 <= $signed(reg26);
              reg27 <= (((({reg28, reg21} ? wire5 : $unsigned(reg28)) ?
                          $unsigned((~|wire17)) : (8'ha0)) ?
                      $signed(wire5[(4'hf):(4'hd)]) : {(8'hab)}) ?
                  $signed(($unsigned((8'hba)) <<< $unsigned({wire17}))) : reg23[(4'h8):(3'h5)]);
              reg28 <= $signed(({(+wire5[(4'h9):(2'h2)])} || ((reg27 ?
                      $unsigned(wire1) : (8'ha8)) ?
                  ((8'haa) ?
                      ((8'hac) ?
                          wire2 : wire4) : (reg25 >= reg23)) : ($unsigned(reg26) >> $signed(wire17)))));
            end
          reg29 <= {$signed(reg22[(2'h3):(1'h0)]),
              $unsigned((wire3[(4'ha):(4'h8)] >> ({wire4} | $unsigned((8'hb3)))))};
          if ((!($signed({(wire2 ? wire4 : wire4),
              reg28[(3'h4):(1'h0)]}) != (reg21[(4'ha):(3'h5)] < (&(wire1 ?
              wire2 : reg27))))))
            begin
              reg30 <= (($unsigned((&$signed(reg19))) | (wire4[(3'h4):(1'h1)] ?
                      wire4 : reg26[(3'h5):(2'h3)])) ?
                  wire2[(1'h1):(1'h0)] : $signed((reg23 && (wire5 ?
                      $unsigned((8'hbe)) : wire3[(4'h9):(4'h9)]))));
              reg31 <= reg20;
            end
          else
            begin
              reg30 <= $unsigned($unsigned(reg31[(4'hb):(2'h2)]));
              reg31 <= (8'ha2);
              reg32 <= reg19;
            end
          reg33 <= $signed(($unsigned(wire17) ?
              (reg24 ?
                  $unsigned({reg30}) : reg24[(4'hb):(4'h8)]) : reg28[(1'h0):(1'h0)]));
        end
    end
  assign wire34 = reg25[(3'h6):(2'h3)];
  assign wire35 = wire0[(3'h5):(2'h3)];
  assign wire36 = ($unsigned(reg32[(2'h2):(2'h2)]) ?
                      $unsigned(wire0[(1'h0):(1'h0)]) : wire3[(4'hd):(2'h2)]);
  assign wire37 = reg31;
  assign wire38 = ((((|(wire35 ? reg20 : wire17)) ?
                              {((8'hb4) ? wire0 : reg27),
                                  $signed((8'ha6))} : $signed(((8'ha9) ^ (8'hb0)))) ?
                          $signed(wire17[(5'h13):(4'hd)]) : wire36[(5'h13):(5'h12)]) ?
                      $signed($signed(wire4[(4'he):(1'h1)])) : $unsigned((wire1 <= $signed((wire0 << reg33)))));
  assign wire39 = ({(^({reg24} && reg24[(2'h3):(2'h3)])),
                          reg25[(3'h4):(1'h1)]} ?
                      $unsigned((&($signed((8'ha6)) && (7'h43)))) : $unsigned($unsigned((wire37 ?
                          {wire17, wire35} : $signed(reg32)))));
  always
    @(posedge clk) begin
      reg40 <= reg19[(2'h2):(1'h1)];
      if (reg33)
        begin
          reg41 <= $signed({(+{$signed(reg26)}), $unsigned(wire0)});
          reg42 <= $signed(reg23[(4'hf):(4'hc)]);
          reg43 <= {{$unsigned((8'hbf)),
                  ($unsigned(((8'hab) == wire5)) ?
                      ($unsigned((8'hb6)) ?
                          reg40[(2'h2):(2'h2)] : $signed(wire37)) : wire37[(3'h6):(3'h6)])}};
          reg44 <= ((!reg31[(3'h5):(2'h3)]) ?
              {(|reg25), $unsigned((~&reg31))} : $unsigned(({wire17,
                      (wire36 != wire2)} ?
                  {(8'ha0)} : reg27[(2'h2):(1'h1)])));
        end
      else
        begin
          reg41 <= wire35;
          reg42 <= (wire5 ? reg21[(4'hb):(3'h6)] : (8'hbe));
          reg43 <= $signed((~wire37));
          if ($unsigned($unsigned(($unsigned((wire0 >>> wire35)) && reg33))))
            begin
              reg44 <= reg29;
            end
          else
            begin
              reg44 <= reg20[(3'h4):(2'h2)];
              reg45 <= (~^(($unsigned(((8'hbe) ?
                  (8'hb4) : (8'hb5))) & wire17[(4'hf):(3'h4)]) ^~ reg25));
              reg46 <= $unsigned(wire3[(3'h7):(1'h1)]);
            end
        end
      if ((~|$unsigned({$unsigned((~^reg23))})))
        begin
          if (($signed(reg45) ?
              $unsigned((|reg22[(3'h5):(3'h5)])) : $signed(((wire38 ?
                      $signed(wire36) : reg20) ?
                  reg31[(4'h8):(3'h4)] : ((8'had) > (wire36 < reg30))))))
            begin
              reg47 <= reg33;
            end
          else
            begin
              reg47 <= (~|$signed({((reg45 ^~ reg28) ? {(8'hbc)} : (8'hae))}));
              reg48 <= $unsigned(((8'hb8) ?
                  ($unsigned((reg42 - wire3)) ?
                      ((reg43 + reg23) ~^ (&wire2)) : (^~(wire1 && wire5))) : ($unsigned($signed((8'hb7))) ?
                      $unsigned(wire5) : $signed($unsigned(reg43)))));
              reg49 <= ($signed(((+reg28[(2'h2):(2'h2)]) ?
                  (^~wire2) : (~^(wire37 ?
                      wire35 : (8'ha7))))) ^~ reg29[(3'h6):(2'h2)]);
              reg50 <= (reg20[(1'h0):(1'h0)] ?
                  reg29 : $unsigned($signed(wire39)));
            end
        end
      else
        begin
          reg47 <= (~|(({reg41} ?
              $signed((|reg32)) : $signed($signed(reg44))) ~^ {((8'ha1) + $unsigned((8'ha2))),
              (!$unsigned((8'ha9)))}));
          reg48 <= (~^($unsigned(((~&reg26) == wire34[(2'h3):(1'h1)])) ?
              (~|wire5) : (reg33 & (reg27[(3'h6):(3'h5)] >> ((8'ha4) << reg25)))));
          reg49 <= reg42;
          reg50 <= ($signed((((~&(8'h9e)) ?
                  (reg30 ? (8'hb8) : wire37) : $signed(reg44)) ?
              wire38 : reg21[(1'h1):(1'h0)])) || (($unsigned($signed(reg49)) & $signed($unsigned(wire35))) < reg47[(2'h2):(1'h0)]));
        end
      reg51 <= $unsigned(wire38[(4'hb):(4'h8)]);
      if (reg27[(4'hb):(1'h0)])
        begin
          if (reg32)
            begin
              reg52 <= {wire2[(1'h0):(1'h0)]};
              reg53 <= {((wire39[(3'h6):(2'h3)] <= reg32[(3'h5):(3'h4)]) != $signed(reg30)),
                  reg42[(2'h3):(1'h0)]};
              reg54 <= {(^~wire0),
                  ((((8'hbf) ? reg45 : {reg23, reg25}) ?
                          reg32[(2'h3):(1'h1)] : {$signed(reg40)}) ?
                      (reg20[(1'h1):(1'h0)] | reg51) : $signed(reg53[(3'h7):(3'h6)]))};
            end
          else
            begin
              reg52 <= (^$signed($unsigned($unsigned($signed(wire36)))));
              reg53 <= reg40[(3'h4):(1'h1)];
              reg54 <= ({reg27[(2'h2):(1'h1)]} > ($unsigned($unsigned($signed(reg44))) ?
                  $unsigned({(reg44 & wire1), (~&wire34)}) : (8'ha8)));
              reg55 <= $unsigned((~reg41[(4'h9):(3'h5)]));
            end
          reg56 <= reg40;
        end
      else
        begin
          reg52 <= wire5;
        end
    end
  module57 #() modinst218 (wire217, clk, reg45, wire39, reg47, reg51);
  assign wire219 = reg33[(1'h1):(1'h0)];
  assign wire220 = $unsigned((7'h41));
  module135 #() modinst222 (.wire137(reg29), .wire138(wire220), .wire139(wire2), .y(wire221), .clk(clk), .wire136(reg30));
  assign wire223 = $signed({wire3,
                       {(wire4 * (~^reg22)), $unsigned(wire1[(3'h5):(3'h5)])}});
  assign wire224 = wire3;
  assign wire225 = {(^({wire219[(2'h2):(2'h2)],
                           ((8'hb7) || wire223)} >= (-reg19))),
                       ((reg24[(4'hd):(3'h6)] ?
                               wire220 : reg22[(3'h4):(1'h0)]) ?
                           (-wire219) : reg33)};
  module135 #() modinst227 (wire226, clk, wire36, reg26, wire3, wire220);
endmodule

module module57
#(parameter param215 = ((({((7'h44) ? (8'hb8) : (8'h9c)), {(8'haa), (8'hbc)}} * (~&((8'hb7) - (7'h41)))) >> ((^((8'ha9) ? (8'haa) : (8'h9f))) ? (!(8'hb3)) : (((8'hb5) ? (8'ha1) : (8'hac)) ? (8'hba) : ((8'hae) ? (8'h9f) : (7'h42))))) <<< (({((8'h9d) ? (8'hb7) : (8'hb3)), ((8'ha9) ? (7'h43) : (8'hab))} >>> (7'h42)) ? {(((8'ha9) ? (8'hb9) : (8'ha9)) < ((8'had) + (8'hba)))} : ({{(8'ha2)}, (8'hb7)} ? (!(+(8'hba))) : {(~&(7'h43))}))), 
parameter param216 = param215)
(y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h269):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire61;
  input wire [(5'h14):(1'h0)] wire60;
  input wire [(2'h2):(1'h0)] wire59;
  input wire [(5'h14):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire119;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire164;
  wire signed [(3'h4):(1'h0)] wire166;
  wire [(5'h11):(1'h0)] wire174;
  wire signed [(2'h2):(1'h0)] wire175;
  wire [(4'h9):(1'h0)] wire176;
  wire signed [(2'h2):(1'h0)] wire177;
  wire [(5'h11):(1'h0)] wire178;
  wire signed [(5'h11):(1'h0)] wire179;
  wire [(3'h5):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire181;
  wire signed [(3'h4):(1'h0)] wire213;
  reg [(3'h4):(1'h0)] reg188 = (1'h0);
  reg [(4'hd):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg [(4'h9):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg182 = (1'h0);
  reg [(5'h11):(1'h0)] reg173 = (1'h0);
  reg [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(3'h7):(1'h0)] reg171 = (1'h0);
  reg [(3'h7):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  assign y = {wire119,
                 wire68,
                 wire67,
                 wire63,
                 wire62,
                 wire164,
                 wire166,
                 wire174,
                 wire175,
                 wire176,
                 wire177,
                 wire178,
                 wire179,
                 wire180,
                 wire181,
                 wire213,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire62 = (8'h9c);
  assign wire63 = ($unsigned({(~^(~(8'ha5))), wire58[(1'h0):(1'h0)]}) ?
                      $unsigned((8'ha1)) : wire62[(5'h13):(4'h9)]);
  always
    @(posedge clk) begin
      reg64 <= $unsigned(((&$signed((-wire62))) + (($signed(wire60) ?
          $signed(wire58) : ((8'ha3) ?
              wire59 : wire63)) >= (^wire62[(5'h14):(1'h0)]))));
      reg65 <= {(~&wire63[(4'hc):(1'h0)])};
      reg66 <= {wire59[(1'h0):(1'h0)]};
    end
  assign wire67 = reg66;
  assign wire68 = ($unsigned(($unsigned($unsigned(wire61)) <= wire61)) ?
                      $unsigned((&(-((8'hb9) & wire67)))) : (((!$signed(reg64)) ?
                              ($signed((8'ha8)) ?
                                  wire62[(1'h0):(1'h0)] : {wire63,
                                      reg66}) : reg65[(1'h0):(1'h0)]) ?
                          ((^(wire63 ^~ wire63)) ?
                              (+{wire62}) : (~(wire61 <= wire60))) : ((^(7'h43)) <= reg64)));
  always
    @(posedge clk) begin
      if ((-$signed(wire67)))
        begin
          reg69 <= $signed((^$signed((~$unsigned(wire60)))));
          reg70 <= ((+(wire68[(2'h3):(2'h3)] ?
                  $signed(wire59[(2'h2):(1'h1)]) : wire61)) ?
              (wire58[(1'h1):(1'h0)] ?
                  ((reg66 ? wire58 : (wire67 ? wire62 : (8'ha4))) ?
                      reg65[(1'h0):(1'h0)] : {(~&wire61),
                          (reg69 ?
                              wire58 : wire61)}) : wire63[(5'h11):(4'h8)]) : wire63);
          reg71 <= $signed(reg69);
          reg72 <= $unsigned((reg71[(2'h2):(1'h1)] < (reg71 | ((wire59 - reg71) ?
              reg70[(3'h5):(2'h2)] : (wire58 ? reg71 : (7'h44))))));
          reg73 <= wire58[(1'h0):(1'h0)];
        end
      else
        begin
          reg69 <= {reg66};
          if (reg69[(3'h6):(2'h3)])
            begin
              reg70 <= $unsigned(reg66[(3'h6):(2'h2)]);
              reg71 <= wire59;
            end
          else
            begin
              reg70 <= wire63;
              reg71 <= {(~((~^(wire68 | wire63)) ?
                      (~&$unsigned(wire67)) : $unsigned(reg73)))};
              reg72 <= {wire67[(4'h8):(1'h1)], reg70[(4'hb):(3'h4)]};
              reg73 <= (8'ha8);
            end
          reg74 <= $signed(wire68);
        end
    end
  module75 #() modinst120 (wire119, clk, reg65, wire60, wire67, reg66, wire58);
  always
    @(posedge clk) begin
      reg121 <= ((wire59 ?
              {reg65[(3'h7):(1'h0)],
                  (reg64[(5'h10):(1'h0)] ?
                      $signed(reg65) : (reg69 << wire63))} : (&wire119)) ?
          (((reg66 ? (wire61 ? reg66 : (8'hb2)) : wire62) >>> (reg74 ?
              $signed(reg71) : reg73)) ~^ (8'hb6)) : {wire63[(4'hb):(1'h0)]});
      reg122 <= reg121[(1'h1):(1'h1)];
      reg123 <= $signed($signed((8'hbf)));
    end
  always
    @(posedge clk) begin
      reg124 <= {$signed(reg72[(5'h10):(4'hb)])};
      if ((|wire58[(3'h4):(2'h3)]))
        begin
          reg125 <= (~(~reg70));
        end
      else
        begin
          if ($unsigned(((|$unsigned($signed(reg64))) ?
              $unsigned($unsigned($unsigned(wire60))) : reg74)))
            begin
              reg125 <= $unsigned(($unsigned($signed((wire58 ?
                      reg64 : wire119))) ?
                  ($signed(reg123[(4'he):(2'h3)]) ?
                      wire62[(1'h1):(1'h1)] : $unsigned((~|reg71))) : $unsigned(reg124)));
              reg126 <= reg65[(2'h3):(1'h0)];
              reg127 <= {{((^~reg125[(4'ha):(3'h4)]) ?
                          wire61 : ((!reg123) || (~wire68)))}};
              reg128 <= ($signed($signed((-(~^(8'hb7))))) || reg73);
              reg129 <= $signed($unsigned($signed($signed((reg74 ?
                  reg128 : reg123)))));
            end
          else
            begin
              reg125 <= wire61[(4'ha):(4'ha)];
              reg126 <= $unsigned((!(wire67 > reg126[(4'h8):(3'h6)])));
              reg127 <= $signed((wire60[(4'hf):(3'h6)] ?
                  (($signed(wire60) >= (reg72 ? reg72 : wire61)) ?
                      (wire67 == (wire58 ?
                          wire59 : (8'h9f))) : $unsigned({(8'h9c)})) : $unsigned(((~^(7'h42)) ?
                      (reg126 ? reg66 : wire63) : (wire68 ~^ reg129)))));
              reg128 <= ($signed(reg69) ?
                  (((8'hbb) ^~ ((~reg123) ?
                      wire119 : $signed(reg74))) + $signed(((reg129 ?
                          (7'h41) : wire60) ?
                      (|(7'h40)) : ((8'hbf) && (8'hb2))))) : $signed($unsigned(wire62)));
            end
          reg130 <= $signed($unsigned(reg66));
          reg131 <= wire62;
        end
      reg132 <= (&reg128);
      reg133 <= (({((-reg131) ^ (reg130 << reg126))} ?
          {({wire61} ^ (wire61 ? wire63 : wire62)),
              reg72[(2'h3):(2'h2)]} : (8'ha8)) | $unsigned(reg72));
      reg134 <= (reg73[(4'ha):(4'ha)] && reg128[(5'h12):(4'h8)]);
    end
  module135 #() modinst165 (wire164, clk, reg129, wire58, wire67, reg65);
  assign wire166 = (|reg127);
  always
    @(posedge clk) begin
      if ((8'hb8))
        begin
          reg167 <= $signed($signed((^wire60[(4'hb):(4'h8)])));
          reg168 <= {wire58[(3'h6):(1'h1)]};
          reg169 <= (+($signed((reg133 || $signed(reg125))) <<< (&reg125)));
          reg170 <= ($signed($unsigned((reg66 ~^ (&(8'hbd))))) >>> $signed(((~|(reg130 ?
                  wire58 : wire60)) ?
              ((~&(7'h44)) ~^ reg129) : $unsigned(reg168))));
        end
      else
        begin
          reg167 <= wire61[(2'h3):(1'h0)];
          if (reg122[(1'h1):(1'h0)])
            begin
              reg168 <= {wire68[(2'h2):(2'h2)]};
              reg169 <= reg123;
              reg170 <= (!((reg129[(2'h3):(1'h1)] != reg65) ?
                  $unsigned(wire166[(2'h3):(2'h3)]) : reg130));
            end
          else
            begin
              reg168 <= $signed($signed($signed(reg167)));
              reg169 <= ($unsigned(reg127[(2'h3):(1'h1)]) ?
                  {({{reg74}, (|reg70)} ?
                          ((wire119 == reg130) != $unsigned(reg73)) : ((^reg72) << (reg64 >= reg73))),
                      (reg129[(4'hc):(3'h5)] ?
                          (^$unsigned(reg127)) : $unsigned((+wire59)))} : $signed(($unsigned($unsigned(reg70)) + $unsigned((wire62 || reg133)))));
            end
          reg171 <= $unsigned((($signed(reg69) ?
                  reg72[(4'hf):(4'hc)] : $unsigned(reg64[(2'h2):(1'h1)])) ?
              $signed($unsigned(wire164)) : $signed($unsigned($unsigned(wire67)))));
          reg172 <= $unsigned(reg72);
          reg173 <= $unsigned(reg73);
        end
    end
  assign wire174 = reg72;
  assign wire175 = $signed($signed(((8'hbf) | {(reg128 ? reg134 : reg127)})));
  assign wire176 = (wire67[(4'h8):(3'h5)] | $unsigned(reg170));
  assign wire177 = $signed($unsigned($unsigned($unsigned({reg129, reg65}))));
  assign wire178 = wire60[(4'h9):(4'h8)];
  assign wire179 = (reg128 ? $signed($signed(wire59)) : wire61);
  assign wire180 = (^{$signed((reg129[(2'h3):(2'h2)] ?
                           (reg73 ? reg69 : (8'haa)) : (&wire58))),
                       (wire58[(4'hb):(3'h5)] ?
                           $unsigned(reg64) : (|(reg69 ? reg170 : reg71)))});
  assign wire181 = $signed((reg170 >> (reg69 + {reg122})));
  always
    @(posedge clk) begin
      if (($unsigned(((reg167 ?
          reg71 : $unsigned((8'haf))) - $unsigned((reg167 ?
          wire67 : reg168)))) | ($signed($signed($unsigned(reg124))) ?
          ($signed(((8'hb6) == reg126)) < $unsigned(reg133[(2'h3):(2'h2)])) : ((reg127[(3'h6):(1'h0)] * (reg129 >>> (8'had))) ?
              (reg72[(3'h6):(1'h0)] ?
                  {reg69} : ((8'ha9) ? reg171 : reg71)) : {reg121, reg69}))))
        begin
          reg182 <= reg121;
        end
      else
        begin
          reg182 <= $unsigned(((($signed(reg167) ?
                  (reg69 ~^ (8'hb8)) : $unsigned(reg71)) && $signed($signed(wire177))) ?
              {reg122[(4'h8):(2'h2)]} : {(8'hbe),
                  $unsigned((wire119 ? reg125 : wire68))}));
          reg183 <= wire178;
          reg184 <= $unsigned((~^($signed(wire68[(3'h5):(3'h4)]) ?
              $unsigned($signed(wire178)) : ((-wire180) <<< (8'hb7)))));
        end
      if ((^~reg123))
        begin
          if ($unsigned(($unsigned($signed(wire174)) ?
              {$unsigned({(8'ha6)})} : (($unsigned(wire181) ?
                      $signed(reg172) : (wire178 ? (8'haa) : wire61)) ?
                  ((wire164 != reg167) || (wire175 ?
                      wire67 : reg131)) : reg184))))
            begin
              reg185 <= $unsigned({(8'hb0), reg173});
              reg186 <= $unsigned({reg131[(3'h6):(3'h4)], (~^$signed(reg69))});
            end
          else
            begin
              reg185 <= reg71[(3'h7):(2'h2)];
            end
          reg187 <= reg124;
          reg188 <= ($signed((((&wire176) | (|wire67)) ?
              $unsigned(reg125[(2'h3):(2'h2)]) : (!$unsigned(reg184)))) >>> ((~|reg168[(2'h3):(1'h1)]) ?
              $signed($unsigned({wire63, (8'h9d)})) : reg126[(4'hb):(4'ha)]));
        end
      else
        begin
          reg185 <= reg74[(1'h1):(1'h0)];
          reg186 <= ($signed(wire175[(1'h1):(1'h1)]) ?
              ($unsigned(((^(8'ha3)) <= reg188[(2'h3):(2'h2)])) + $signed((8'hbb))) : (((|{reg169}) <<< wire63) <= $unsigned((reg123[(4'h9):(2'h2)] ?
                  (wire67 == (8'h9f)) : ((8'h9e) ? reg124 : wire178)))));
        end
    end
  module189 #() modinst214 (wire213, clk, reg69, wire179, reg186, reg172, reg173);
endmodule

module module6
#(parameter param16 = (({({(8'haf)} > {(8'hb3), (8'hbe)}), (~&(~(7'h42)))} != {{((8'haf) ? (8'hb8) : (8'ha0))}, ((~(7'h43)) ? ((8'ha0) ? (8'hbe) : (8'hac)) : ((8'hae) * (7'h40)))}) ? (~((~^((8'hac) ^ (8'hb8))) ? (-(&(8'hb2))) : ((^~(8'hb6)) ? ((8'hb1) ? (7'h41) : (8'hbf)) : ((7'h42) * (8'h9d))))) : {(!((&(8'h9f)) ? (&(8'haa)) : ((8'ha3) & (8'hb1))))}))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  assign y = {wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = $signed((wire11[(3'h6):(3'h6)] ~^ (($signed(wire10) >>> (~^wire9)) >>> wire10)));
  assign wire13 = wire11[(3'h6):(3'h4)];
  assign wire14 = wire11;
  assign wire15 = wire7;
endmodule

module module189  (y, clk, wire194, wire193, wire192, wire191, wire190);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire194;
  input wire signed [(2'h3):(1'h0)] wire193;
  input wire [(3'h5):(1'h0)] wire192;
  input wire signed [(3'h7):(1'h0)] wire191;
  input wire [(5'h11):(1'h0)] wire190;
  wire signed [(5'h10):(1'h0)] wire212;
  wire signed [(4'hc):(1'h0)] wire210;
  wire signed [(4'he):(1'h0)] wire209;
  wire [(5'h11):(1'h0)] wire208;
  wire [(3'h7):(1'h0)] wire207;
  wire signed [(3'h4):(1'h0)] wire206;
  wire [(4'hf):(1'h0)] wire205;
  wire [(4'hc):(1'h0)] wire204;
  wire [(5'h14):(1'h0)] wire203;
  wire signed [(3'h5):(1'h0)] wire202;
  wire [(5'h12):(1'h0)] wire201;
  wire signed [(5'h15):(1'h0)] wire200;
  wire [(4'hc):(1'h0)] wire199;
  wire [(5'h14):(1'h0)] wire198;
  wire [(3'h4):(1'h0)] wire197;
  wire [(3'h4):(1'h0)] wire196;
  wire [(2'h2):(1'h0)] wire195;
  reg signed [(4'hf):(1'h0)] reg211 = (1'h0);
  assign y = {wire212,
                 wire210,
                 wire209,
                 wire208,
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
                 reg211,
                 (1'h0)};
  assign wire195 = (wire192[(2'h2):(1'h1)] << $signed(wire193));
  assign wire196 = wire191;
  assign wire197 = $unsigned(wire190[(4'he):(3'h4)]);
  assign wire198 = ($unsigned($unsigned(((wire191 & wire192) ^ (wire190 ?
                       wire192 : wire195)))) & (~&(wire190[(4'hf):(3'h7)] && (wire197 ?
                       (^~wire193) : (wire195 != wire193)))));
  assign wire199 = (wire198[(4'hb):(3'h7)] > {((wire192 | (wire192 == wire198)) ?
                           ((+wire197) ?
                               {wire197} : wire194[(2'h3):(1'h1)]) : ({wire198,
                               wire191} <<< {wire192})),
                       wire191});
  assign wire200 = (wire194 ? (&$signed((~&$signed((8'h9c))))) : wire195);
  assign wire201 = {$signed(wire190)};
  assign wire202 = (~&(~&wire198[(4'h8):(1'h0)]));
  assign wire203 = (((wire197[(2'h2):(1'h1)] + {(^~wire202),
                           (^wire193)}) & wire202[(1'h0):(1'h0)]) ?
                       (+$unsigned(((wire192 | wire192) == wire191[(3'h4):(1'h1)]))) : $unsigned((~&((wire200 ?
                               wire190 : wire193) ?
                           $unsigned(wire193) : ((8'hbf) ?
                               wire202 : wire201)))));
  assign wire204 = (!wire198[(4'hf):(4'he)]);
  assign wire205 = (-(($signed((wire204 ?
                           wire203 : wire192)) || wire192[(2'h3):(1'h1)]) ?
                       wire194[(2'h3):(1'h0)] : $unsigned(wire197[(1'h0):(1'h0)])));
  assign wire206 = wire190[(3'h5):(2'h3)];
  assign wire207 = $unsigned(wire191[(3'h6):(3'h6)]);
  assign wire208 = wire200[(5'h13):(4'hd)];
  assign wire209 = (8'h9c);
  assign wire210 = $signed((wire207 ?
                       {((~|wire209) - wire202),
                           ((wire208 ? (8'h9f) : (8'ha0)) >> ((8'hbb) ?
                               wire192 : wire195))} : $unsigned($signed(wire201[(4'he):(4'h9)]))));
  always
    @(posedge clk) begin
      reg211 <= $unsigned($unsigned((wire197[(1'h1):(1'h1)] ?
          wire190[(4'hf):(4'hc)] : wire200[(3'h5):(2'h2)])));
    end
  assign wire212 = (wire208 ^ $unsigned({$unsigned((wire208 ?
                           wire191 : wire205))}));
endmodule

module module135  (y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire139;
  input wire [(5'h14):(1'h0)] wire138;
  input wire signed [(5'h13):(1'h0)] wire137;
  input wire [(3'h7):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire163;
  wire [(5'h14):(1'h0)] wire162;
  wire [(4'hb):(1'h0)] wire161;
  wire signed [(5'h15):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire156;
  wire [(5'h10):(1'h0)] wire155;
  wire [(2'h2):(1'h0)] wire154;
  wire signed [(3'h4):(1'h0)] wire153;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  wire signed [(3'h7):(1'h0)] wire150;
  wire signed [(5'h15):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire [(4'h9):(1'h0)] wire143;
  wire [(4'hb):(1'h0)] wire142;
  wire [(4'hf):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  reg [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg146 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire140 = $signed((wire136 ?
                       ((8'ha8) - (&$unsigned(wire138))) : (((+(8'hbf)) * $signed(wire139)) ?
                           (wire136 && (wire139 || (8'had))) : wire137)));
  assign wire141 = ($unsigned((((&wire140) ?
                           (wire139 >= wire140) : $signed(wire136)) ?
                       ({wire136} ?
                           $unsigned(wire137) : (8'hbd)) : $signed((^~wire138)))) >> $unsigned($unsigned($unsigned($signed(wire139)))));
  assign wire142 = $unsigned(wire141[(4'h8):(1'h0)]);
  assign wire143 = $signed(wire136);
  assign wire144 = (|{wire140});
  assign wire145 = $signed(wire137);
  always
    @(posedge clk) begin
      reg146 <= ($unsigned(wire139) ^~ ($signed($signed((wire141 <= (8'had)))) ?
          $signed(wire145) : {$unsigned(wire145), {$signed(wire137)}}));
      reg147 <= (wire136 ?
          wire145[(2'h2):(1'h1)] : {(((wire145 ? wire145 : wire141) ?
                      ((8'h9d) ^~ wire142) : (wire143 & wire136)) ?
                  (^wire144[(3'h6):(3'h4)]) : $signed(wire141))});
      reg148 <= {{(~&(|$unsigned(wire138))),
              ({$unsigned(wire138), (wire139 << wire144)} ?
                  $signed((wire142 ? (7'h41) : (8'h9e))) : {reg147,
                      ((8'h9f) & wire140)})}};
      reg149 <= wire140[(3'h4):(1'h1)];
    end
  assign wire150 = $unsigned({wire138[(3'h6):(1'h0)],
                       $unsigned($signed((wire137 && wire141)))});
  assign wire151 = reg149[(2'h3):(1'h1)];
  assign wire152 = wire142[(3'h4):(1'h0)];
  assign wire153 = $unsigned((-(($signed(wire138) ?
                           $signed(wire151) : reg149[(4'h8):(3'h6)]) ?
                       (+$signed(wire138)) : ({wire150, wire151} ?
                           wire143[(2'h3):(1'h1)] : (8'ha0)))));
  assign wire154 = ((wire143 ? (&reg148) : $signed(wire153)) ?
                       ($signed(wire152) != {{$unsigned(wire151),
                               $signed(wire143)},
                           wire141[(4'he):(4'ha)]}) : (8'ha6));
  assign wire155 = $signed($signed($unsigned(($signed(wire136) ?
                       $signed(reg148) : $signed(wire145)))));
  assign wire156 = $unsigned(((-(-wire155[(3'h4):(2'h3)])) | (wire153 ^ ((^~wire139) >= (~|(8'ha1))))));
  assign wire157 = (!($unsigned({wire156, (~^reg149)}) >> {$signed((7'h42))}));
  assign wire158 = $signed(({reg149,
                           ((wire151 ? wire139 : wire151) ?
                               wire155[(2'h3):(2'h3)] : wire139[(3'h4):(2'h3)])} ?
                       wire154[(2'h2):(2'h2)] : (wire144[(4'hf):(2'h2)] + (~wire140))));
  assign wire159 = $signed($signed($unsigned(wire150)));
  assign wire160 = $signed(($signed(wire140[(4'h9):(4'h9)]) <<< $signed(($signed(reg146) << $unsigned(wire151)))));
  assign wire161 = wire138;
  assign wire162 = ((7'h41) && (wire155 >> reg147[(4'hd):(3'h4)]));
  assign wire163 = $unsigned((~|$signed(wire143[(4'h8):(3'h5)])));
endmodule

module module75
#(parameter param118 = (~|((^{((8'haf) ? (8'h9c) : (8'hb3))}) << ((((7'h44) ~^ (8'hb1)) | {(8'h9e), (8'hb2)}) ? {((8'ha9) ? (8'h9f) : (8'hb0))} : (~|((8'hb9) ? (8'hb3) : (7'h43)))))))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire80;
  input wire signed [(3'h4):(1'h0)] wire79;
  input wire signed [(5'h15):(1'h0)] wire78;
  input wire signed [(4'hf):(1'h0)] wire77;
  input wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(4'hb):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(5'h12):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  reg signed [(5'h10):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg104 = (1'h0);
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire100,
                 wire99,
                 wire98,
                 wire95,
                 wire94,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
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
                 reg97,
                 reg96,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire81 = $signed(wire78);
  assign wire82 = $signed($unsigned($signed((wire81 ?
                      (8'hb5) : wire80[(1'h0):(1'h0)]))));
  assign wire83 = (~|($signed($unsigned((wire80 & wire78))) ?
                      ($signed($signed(wire78)) - (~wire76)) : wire78));
  assign wire84 = {($signed((-wire81[(1'h0):(1'h0)])) ?
                          $unsigned((&(~wire80))) : ($unsigned((wire79 >= wire79)) ^~ (~&(~|wire80))))};
  assign wire85 = ((wire78 ?
                      {wire81[(2'h2):(1'h1)]} : $unsigned($signed((wire77 ?
                          wire84 : wire80)))) * (($signed((+wire76)) <= wire84) ~^ (({wire84} ?
                          $signed(wire77) : wire81) ?
                      $signed(wire84[(3'h5):(3'h4)]) : $signed(wire81))));
  assign wire86 = $unsigned($signed($signed(wire76[(1'h1):(1'h1)])));
  assign wire87 = $signed((wire78[(3'h7):(3'h4)] & $signed({wire82,
                      (wire86 << wire83)})));
  assign wire88 = (((~&$unsigned(wire83)) ?
                          (&(wire80 < ((8'h9f) <= wire86))) : wire83) ?
                      $signed($unsigned(({wire79} ?
                          $unsigned(wire84) : $unsigned((8'h9e))))) : $signed((~(~|wire81))));
  always
    @(posedge clk) begin
      reg89 <= wire88[(1'h0):(1'h0)];
      if (wire80[(3'h5):(1'h0)])
        begin
          reg90 <= wire85;
          reg91 <= (^~({wire77} - (~&$signed((~wire87)))));
          reg92 <= (|wire88[(4'h9):(2'h2)]);
          reg93 <= reg89;
        end
      else
        begin
          reg90 <= (((^{$unsigned(wire88)}) ?
              (-(&(wire76 <<< wire86))) : reg89[(3'h4):(3'h4)]) - (+(8'haf)));
          reg91 <= (&((($unsigned(wire82) ?
                      (wire78 ? wire76 : wire77) : {(8'ha7), wire80}) ?
                  (^$unsigned(wire76)) : ({wire83} > $signed(wire78))) ?
              (reg91[(3'h5):(3'h4)] ?
                  (((8'ha2) < wire79) * (wire87 ^~ (8'hbf))) : {wire86[(1'h0):(1'h0)]}) : wire84[(3'h4):(3'h4)]));
          reg92 <= $unsigned($signed($unsigned((reg93 ?
              wire88 : $unsigned(wire84)))));
        end
    end
  assign wire94 = reg90;
  assign wire95 = wire79;
  always
    @(posedge clk) begin
      reg96 <= wire84;
    end
  always
    @(posedge clk) begin
      reg97 <= wire85;
    end
  assign wire98 = (reg89 ?
                      ({reg92[(2'h3):(2'h3)]} ^ $signed({((8'h9d) != wire88),
                          $signed((8'hbf))})) : (({{(8'h9e),
                                  reg96}} > (~&$signed(wire78))) ?
                          ((reg93[(2'h3):(2'h2)] != (+reg89)) ?
                              $signed((~reg97)) : ({wire95} ?
                                  (^reg91) : (wire88 ?
                                      wire85 : wire84))) : (((~&reg89) ^~ $signed(wire85)) ?
                              (+(reg92 + wire80)) : (~wire87))));
  assign wire99 = wire80;
  assign wire100 = (($signed(wire81) << wire85[(2'h3):(1'h0)]) << (((-$signed(wire83)) ?
                       (~^wire84[(2'h3):(2'h2)]) : $unsigned((wire94 ?
                           wire83 : wire88))) && wire81));
  always
    @(posedge clk) begin
      if ($signed((&{$unsigned(reg91[(1'h1):(1'h0)])})))
        begin
          reg101 <= wire100;
          reg102 <= $signed((~^(^~reg97[(1'h0):(1'h0)])));
          reg103 <= (($signed($signed(reg96)) ?
              $signed(reg101[(2'h3):(1'h0)]) : wire84) & (+($unsigned((~|wire94)) ?
              $unsigned($unsigned(wire95)) : ({wire83, wire82} ?
                  $unsigned(wire83) : $signed((8'hbb))))));
          if (($unsigned($unsigned($unsigned((reg101 ? wire77 : (7'h43))))) ?
              {wire82} : $signed($signed(((8'hb0) ?
                  reg97[(2'h3):(2'h3)] : (reg92 ^ reg91))))))
            begin
              reg104 <= reg102[(1'h1):(1'h1)];
              reg105 <= ($signed($unsigned($unsigned($unsigned(wire78)))) - $unsigned($signed($unsigned(reg103))));
              reg106 <= $unsigned({$unsigned((~&$signed(reg105)))});
              reg107 <= ($signed({((wire99 ? reg91 : (8'had)) << (wire83 ?
                      wire79 : wire84))}) >>> $signed((^wire79)));
            end
          else
            begin
              reg104 <= (&((+reg89) ?
                  wire86 : $signed($unsigned($unsigned(wire76)))));
              reg105 <= (($signed($unsigned($unsigned(wire88))) + ($unsigned(reg92[(1'h1):(1'h1)]) >>> $signed(reg90))) >= (wire82 ?
                  $unsigned(wire76[(2'h2):(1'h1)]) : reg96));
            end
        end
      else
        begin
          reg101 <= $signed((($unsigned($unsigned(wire79)) * {reg105[(1'h0):(1'h0)]}) ?
              wire86[(2'h3):(1'h1)] : wire94[(4'h9):(3'h7)]));
          reg102 <= wire81;
          reg103 <= (+((reg90 ?
                  reg89 : ($signed(wire86) ? (wire86 ~^ wire82) : reg107)) ?
              {reg103} : (((reg102 >= wire100) ?
                      (reg97 ? reg97 : reg92) : (wire79 ? reg96 : wire81)) ?
                  {reg96[(2'h2):(1'h0)]} : wire83)));
          reg104 <= ({(wire80[(1'h1):(1'h0)] - reg106[(5'h12):(5'h11)])} ?
              (|(!(((8'ha2) ?
                  wire100 : wire87) >>> (-reg104)))) : wire100[(2'h3):(2'h3)]);
          reg105 <= $unsigned((~^((^~$unsigned(wire99)) ?
              (7'h44) : $signed((reg97 && reg103)))));
        end
      reg108 <= $signed(($unsigned(((wire87 ?
              reg105 : wire100) >= (!(8'ha5)))) ?
          ($signed((~^(8'haa))) & (wire81 ?
              reg92 : wire80)) : (($unsigned(wire78) ?
                  (reg107 ? reg96 : (8'had)) : (^~wire76)) ?
              $unsigned({wire80, (8'h9f)}) : (&(wire94 != (8'h9c))))));
      reg109 <= wire95;
      reg110 <= (~^(!(wire81[(2'h2):(1'h0)] ?
          (^(wire86 <<< wire85)) : $unsigned(wire80))));
      reg111 <= reg106[(2'h3):(2'h2)];
    end
  assign wire112 = $signed(wire88[(2'h2):(2'h2)]);
  assign wire113 = (~|(+($signed(reg110) ?
                       (~(~^reg97)) : ($signed(reg96) != $unsigned(wire85)))));
  assign wire114 = $unsigned(wire88[(4'hc):(3'h4)]);
  assign wire115 = $unsigned($signed(reg91[(4'h8):(2'h2)]));
  assign wire116 = $signed(wire112[(2'h2):(1'h1)]);
  assign wire117 = (&reg90);
endmodule
