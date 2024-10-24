module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire292;
  wire [(5'h10):(1'h0)] wire291;
  wire [(4'hf):(1'h0)] wire290;
  wire [(5'h15):(1'h0)] wire287;
  wire signed [(4'hb):(1'h0)] wire286;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire284;
  reg signed [(5'h13):(1'h0)] reg303 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg302 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg301 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg300 = (1'h0);
  reg [(5'h15):(1'h0)] reg299 = (1'h0);
  reg [(5'h13):(1'h0)] reg298 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg297 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg296 = (1'h0);
  reg [(5'h12):(1'h0)] reg295 = (1'h0);
  reg [(3'h6):(1'h0)] reg294 = (1'h0);
  reg [(4'hf):(1'h0)] reg293 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg289 = (1'h0);
  assign y = {wire292,
                 wire291,
                 wire290,
                 wire287,
                 wire286,
                 wire5,
                 wire63,
                 wire284,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg289,
                 (1'h0)};
  assign wire5 = (~^wire4[(3'h7):(2'h2)]);
  module6 #() modinst64 (wire63, clk, wire0, wire5, wire4, wire2);
  module65 #() modinst285 (wire284, clk, wire3, wire4, wire5, wire1, wire0);
  assign wire286 = wire1;
  module73 #() modinst288 (.wire77(wire4), .y(wire287), .wire75(wire284), .wire76(wire286), .clk(clk), .wire74(wire1));
  always
    @(posedge clk) begin
      reg289 <= {((-wire0) & wire1[(1'h1):(1'h0)]), wire1[(3'h5):(2'h3)]};
    end
  assign wire290 = (((reg289 >> (8'hb3)) <<< wire2[(4'h9):(3'h7)]) ?
                       {((wire287[(5'h14):(4'hc)] <<< $signed(wire4)) | (^(wire1 && wire286)))} : (^$unsigned((reg289 >>> ((8'hab) ^ (8'hb1))))));
  assign wire291 = wire0[(2'h2):(1'h0)];
  assign wire292 = $signed((!(&$signed(reg289))));
  always
    @(posedge clk) begin
      reg293 <= $unsigned((wire4[(1'h1):(1'h1)] ^ $signed($signed((wire0 ?
          wire284 : reg289)))));
      reg294 <= (((-reg289) | wire63) ~^ $unsigned((((wire286 ?
          wire0 : wire291) >>> $unsigned(wire286)) | wire291[(3'h4):(2'h2)])));
      reg295 <= (~&(~^reg289));
      if (reg289)
        begin
          reg296 <= {reg294[(1'h1):(1'h0)],
              (wire0 ? reg295[(4'h9):(3'h5)] : wire63[(4'hd):(4'hc)])};
          reg297 <= $unsigned(reg289);
          reg298 <= (!{$unsigned(wire63[(3'h7):(2'h2)]),
              ((reg297 ? $unsigned(wire286) : (~^reg293)) <= wire63)});
        end
      else
        begin
          reg296 <= wire291[(4'he):(3'h4)];
          reg297 <= {wire284};
          reg298 <= wire291;
          reg299 <= wire290;
          if ($unsigned(wire4))
            begin
              reg300 <= reg294[(1'h1):(1'h1)];
              reg301 <= wire2[(1'h1):(1'h1)];
              reg302 <= (reg296[(1'h1):(1'h1)] ?
                  ((reg299[(1'h1):(1'h1)] - reg301) ?
                      ($signed((wire287 <= wire2)) ?
                          reg301[(4'h8):(2'h2)] : $unsigned((reg295 ?
                              reg296 : (8'ha4)))) : $unsigned($unsigned(reg296[(2'h2):(1'h0)]))) : wire290);
              reg303 <= (reg298 & {reg301});
            end
          else
            begin
              reg300 <= (~^(wire2[(2'h2):(2'h2)] ?
                  $unsigned((~&(reg296 + wire63))) : ($signed((~&wire284)) ?
                      {$signed(reg293),
                          reg289[(3'h4):(1'h1)]} : wire290[(4'h8):(1'h1)])));
              reg301 <= (reg289 * ((+($signed(reg298) ? wire286 : (8'hb5))) ?
                  $unsigned({wire5,
                      $signed(wire290)}) : $signed(($unsigned(wire2) ?
                      $signed(wire290) : ((8'ha0) ? wire63 : wire291)))));
            end
        end
    end
endmodule

module module65  (y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire70;
  input wire [(5'h13):(1'h0)] wire69;
  input wire [(5'h13):(1'h0)] wire68;
  input wire [(5'h13):(1'h0)] wire67;
  input wire signed [(5'h12):(1'h0)] wire66;
  wire [(4'h9):(1'h0)] wire283;
  wire signed [(5'h13):(1'h0)] wire282;
  wire [(4'ha):(1'h0)] wire281;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire231;
  wire signed [(5'h10):(1'h0)] wire233;
  wire [(4'h8):(1'h0)] wire234;
  wire [(2'h3):(1'h0)] wire235;
  wire signed [(4'hf):(1'h0)] wire236;
  wire [(5'h11):(1'h0)] wire237;
  wire [(3'h5):(1'h0)] wire279;
  assign y = {wire283,
                 wire282,
                 wire281,
                 wire152,
                 wire105,
                 wire103,
                 wire72,
                 wire71,
                 wire231,
                 wire233,
                 wire234,
                 wire235,
                 wire236,
                 wire237,
                 wire279,
                 (1'h0)};
  assign wire71 = $signed(((((~&wire69) || wire70) ?
                      {(wire70 != wire68),
                          wire67[(5'h13):(3'h5)]} : $unsigned($unsigned(wire70))) + $signed(wire69[(4'hb):(3'h7)])));
  assign wire72 = ({wire66, wire66} ?
                      $signed((wire71 ^ ((wire71 ? wire70 : (8'hba)) ?
                          $signed(wire69) : ((8'hb2) | wire67)))) : $signed($signed($unsigned($unsigned(wire70)))));
  module73 #() modinst104 (wire103, clk, wire69, wire66, wire71, wire68);
  assign wire105 = ((~^wire71) ?
                       ((&wire71) ?
                           $signed((~|{wire72})) : (~&wire67[(5'h11):(4'ha)])) : $unsigned((wire67 ?
                           {(wire67 ? wire66 : wire69)} : wire66)));
  module106 #() modinst153 (wire152, clk, wire66, wire68, wire72, wire105, wire69);
  module154 #() modinst232 (wire231, clk, wire105, wire70, wire69, wire68);
  assign wire233 = $signed((8'ha8));
  assign wire234 = $signed($unsigned($signed(wire103[(2'h2):(1'h1)])));
  assign wire235 = $signed(($signed((^{(8'ha1)})) ?
                       $unsigned(((wire66 & wire68) ^ $signed(wire66))) : $unsigned(wire72[(2'h3):(1'h1)])));
  assign wire236 = (wire103[(3'h6):(2'h3)] * ($unsigned($signed({wire71,
                           wire67})) ?
                       (wire105[(2'h2):(1'h1)] ?
                           wire69 : $signed(((8'hbb) ?
                               (8'ha5) : wire71))) : (wire71 && $signed(wire69[(4'hd):(4'hd)]))));
  assign wire237 = ({{((wire69 > wire152) || $unsigned(wire69))},
                           (~(&wire234[(3'h7):(3'h5)]))} ?
                       {wire66, wire105} : wire231);
  module238 #() modinst280 (.wire242(wire105), .wire243(wire69), .wire239(wire103), .wire240(wire68), .wire241(wire67), .clk(clk), .y(wire279));
  assign wire281 = $unsigned(wire69[(3'h7):(2'h2)]);
  assign wire282 = (wire152 > wire103);
  assign wire283 = (^($unsigned(($signed((8'hbd)) ?
                       ((8'hbe) ?
                           wire237 : (8'h9e)) : $signed(wire281))) <= {wire69,
                       ({wire282, wire233} - wire281[(4'h8):(1'h0)])}));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  wire signed [(4'hd):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire52;
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  assign y = {wire62,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire38,
                 wire52,
                 reg61,
                 reg60,
                 (1'h0)};
  module11 #() modinst39 (wire38, clk, wire9, wire7, wire8, wire10, (7'h44));
  module40 #() modinst53 (.wire44(wire9), .clk(clk), .wire43(wire38), .wire41(wire8), .y(wire52), .wire45(wire7), .wire42(wire10));
  assign wire54 = {$unsigned(($signed({wire38, wire7}) ?
                          (~(!wire38)) : (!(wire38 ~^ wire10))))};
  assign wire55 = $unsigned(wire10[(1'h1):(1'h0)]);
  assign wire56 = wire9;
  assign wire57 = wire56[(2'h3):(1'h0)];
  assign wire58 = wire9[(3'h7):(3'h5)];
  assign wire59 = (!{$unsigned((wire52[(5'h10):(4'hf)] > wire58[(1'h0):(1'h0)]))});
  always
    @(posedge clk) begin
      reg60 <= (8'ha4);
      reg61 <= $signed(wire9[(3'h6):(1'h1)]);
    end
  assign wire62 = ($unsigned({(~|(wire7 ? wire38 : wire9)), wire8}) ?
                      ($unsigned(wire10[(4'hc):(1'h1)]) ?
                          {((^~wire59) ?
                                  (~^wire55) : (wire54 != wire56))} : $unsigned($signed(wire54))) : (wire54 << wire9));
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire45;
  input wire signed [(5'h14):(1'h0)] wire44;
  input wire [(3'h7):(1'h0)] wire43;
  input wire signed [(3'h7):(1'h0)] wire42;
  input wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  assign y = {wire51, wire50, wire49, wire48, wire47, wire46, (1'h0)};
  assign wire46 = wire41[(1'h0):(1'h0)];
  assign wire47 = wire43;
  assign wire48 = ((~|((~(wire47 ?
                          wire41 : wire44)) <<< ($unsigned(wire47) + (+wire45)))) ?
                      (-(wire43[(3'h4):(2'h2)] || ((wire45 <<< wire43) & $signed(wire46)))) : $signed((($unsigned(wire42) || wire46[(2'h2):(1'h0)]) ?
                          (~^wire44[(3'h7):(1'h1)]) : wire44[(4'ha):(3'h4)])));
  assign wire49 = ($signed(wire45[(2'h2):(2'h2)]) ?
                      (!wire47[(2'h3):(2'h3)]) : (wire47[(2'h2):(1'h1)] ?
                          wire41 : {(wire45 && {wire42, (8'hae)})}));
  assign wire50 = (~^wire43);
  assign wire51 = (($signed(wire50) & (~&({wire47} & $signed(wire46)))) ?
                      (wire50 ?
                          wire47 : wire46[(1'h0):(1'h0)]) : {wire43[(3'h7):(3'h6)],
                          $signed(((wire42 << wire41) >= wire41))});
endmodule

module module11
#(parameter param36 = ((((&(~(8'ha2))) ? (|{(8'ha8)}) : (((8'h9d) + (8'h9d)) ? (~(8'hb4)) : {(8'ha1)})) ? ({((8'ha5) <= (8'hba)), (&(8'hb3))} ? (((8'hb7) - (8'hb5)) - ((7'h41) || (8'hbc))) : {(~|(8'hac))}) : (8'hb2)) ^~ (&(^({(8'hab)} ? {(8'hba)} : ((8'hbc) | (8'ha0)))))), 
parameter param37 = param36)
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire16;
  input wire [(2'h3):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg31,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= wire15;
      if (((($signed(wire12) ? reg17[(3'h4):(3'h4)] : wire13[(3'h7):(3'h6)]) ?
              ((wire13 ?
                  (reg17 ?
                      wire13 : wire13) : (~^wire13)) ~^ (-(wire16 < wire15))) : (wire13 ~^ {wire12,
                  $unsigned(wire16)})) ?
          wire12 : {wire15[(1'h1):(1'h0)], $unsigned($signed(wire12))}))
        begin
          reg18 <= (8'h9e);
        end
      else
        begin
          reg18 <= $signed(((7'h42) <= reg17[(4'ha):(2'h3)]));
          if (($unsigned((|{{wire13}})) ?
              $unsigned($signed((+(reg17 ?
                  reg17 : wire13)))) : ((8'ha1) >> (~wire13[(3'h6):(3'h5)]))))
            begin
              reg19 <= (8'hb6);
              reg20 <= wire15;
              reg21 <= $signed(((wire15 > (wire12[(3'h4):(2'h3)] << $signed(wire16))) ?
                  (~reg20[(3'h6):(3'h4)]) : wire14));
              reg22 <= ($unsigned((8'ha6)) >= (^~(reg18 ?
                  reg19[(3'h6):(3'h4)] : ((wire13 ?
                      (8'ha1) : wire12) & $unsigned(wire12)))));
              reg23 <= $unsigned(wire14[(2'h2):(2'h2)]);
            end
          else
            begin
              reg19 <= ($signed($unsigned(reg22[(4'hc):(3'h6)])) <<< $unsigned(($signed(reg18[(2'h2):(1'h1)]) && {$signed(reg21)})));
              reg20 <= reg20[(3'h7):(3'h7)];
            end
          reg24 <= $unsigned((~|{reg22[(3'h5):(3'h5)]}));
        end
    end
  assign wire25 = (($unsigned(reg23) ?
                          $signed((!((8'hb1) ?
                              wire12 : reg24))) : reg21[(4'hf):(4'hc)]) ?
                      reg20[(3'h4):(1'h1)] : ($unsigned($unsigned($signed(wire15))) && ((~&reg22[(1'h1):(1'h0)]) ?
                          $unsigned((^~wire15)) : $signed($unsigned(reg20)))));
  assign wire26 = $unsigned($unsigned($signed($signed((reg22 & reg19)))));
  assign wire27 = reg24[(4'h9):(2'h2)];
  assign wire28 = (((wire12[(1'h1):(1'h0)] <= $signed(reg21[(5'h10):(4'h9)])) >> ($signed((reg24 >= (8'hb0))) ?
                      (~$unsigned((8'had))) : $signed((reg19 ?
                          wire25 : (8'ha0))))) > ({$unsigned(reg24[(3'h7):(3'h6)]),
                      ((wire14 ?
                          reg19 : reg21) >> reg21[(4'h8):(1'h1)])} <<< reg24[(3'h6):(3'h5)]));
  assign wire29 = $signed({wire14[(4'h8):(2'h2)]});
  assign wire30 = wire13[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      if (((($signed(((8'haf) ? (8'ha5) : (8'haa))) != $unsigned((wire14 ?
          wire30 : wire25))) < $unsigned(wire14[(2'h3):(2'h2)])) ~^ (!(8'hae))))
        begin
          reg31 <= ($signed((~^$unsigned((reg18 ?
              reg22 : wire28)))) >= (~&$unsigned(wire30)));
        end
      else
        begin
          reg31 <= $signed({$signed((reg23[(1'h0):(1'h0)] ?
                  wire13[(2'h3):(1'h0)] : $unsigned(wire13))),
              (~|$unsigned($unsigned(reg21)))});
        end
    end
  assign wire32 = wire16[(2'h2):(1'h1)];
  assign wire33 = wire28;
  assign wire34 = $signed($unsigned($signed(wire25)));
  assign wire35 = $unsigned($signed({(|(wire27 ? wire27 : wire14))}));
endmodule

module module238
#(parameter param278 = (((~|{(^(8'hb9)), (!(8'ha4))}) ? (^~(-((8'ha1) ? (8'haf) : (8'ha6)))) : ((((8'hae) ? (7'h40) : (8'ha7)) <= ((8'hb9) >= (8'hbe))) ? (~((8'ha9) ? (8'hb8) : (7'h42))) : (((8'ha0) ? (8'ha1) : (8'hae)) ? ((8'h9f) ? (7'h43) : (7'h40)) : ((7'h40) ? (8'hbb) : (8'ha8))))) || {((8'h9c) - {(-(8'ha8)), (-(8'hb5))})}))
(y, clk, wire243, wire242, wire241, wire240, wire239);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire243;
  input wire signed [(4'he):(1'h0)] wire242;
  input wire [(4'ha):(1'h0)] wire241;
  input wire signed [(4'hf):(1'h0)] wire240;
  input wire [(5'h12):(1'h0)] wire239;
  wire signed [(2'h2):(1'h0)] wire277;
  wire [(5'h12):(1'h0)] wire276;
  wire signed [(3'h4):(1'h0)] wire275;
  wire [(4'hd):(1'h0)] wire274;
  wire [(4'h8):(1'h0)] wire273;
  wire [(3'h6):(1'h0)] wire272;
  wire [(4'hd):(1'h0)] wire271;
  wire signed [(3'h7):(1'h0)] wire270;
  wire [(5'h15):(1'h0)] wire266;
  wire signed [(4'hc):(1'h0)] wire263;
  wire signed [(5'h10):(1'h0)] wire262;
  wire [(4'hc):(1'h0)] wire261;
  wire [(5'h11):(1'h0)] wire260;
  wire [(5'h15):(1'h0)] wire255;
  wire [(5'h11):(1'h0)] wire247;
  wire [(4'hf):(1'h0)] wire246;
  wire [(3'h6):(1'h0)] wire245;
  wire signed [(2'h3):(1'h0)] wire244;
  reg [(3'h5):(1'h0)] reg269 = (1'h0);
  reg [(3'h6):(1'h0)] reg268 = (1'h0);
  reg [(4'ha):(1'h0)] reg267 = (1'h0);
  reg [(4'h8):(1'h0)] reg265 = (1'h0);
  reg [(2'h2):(1'h0)] reg264 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg259 = (1'h0);
  reg [(5'h15):(1'h0)] reg258 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg257 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg254 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg253 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg252 = (1'h0);
  reg signed [(4'he):(1'h0)] reg251 = (1'h0);
  reg [(3'h7):(1'h0)] reg250 = (1'h0);
  reg [(3'h5):(1'h0)] reg249 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg248 = (1'h0);
  assign y = {wire277,
                 wire276,
                 wire275,
                 wire274,
                 wire273,
                 wire272,
                 wire271,
                 wire270,
                 wire266,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire255,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 reg269,
                 reg268,
                 reg267,
                 reg265,
                 reg264,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 (1'h0)};
  assign wire244 = $unsigned($signed(((!wire241) ?
                       (~&(wire239 != wire240)) : $unsigned(wire243[(5'h11):(4'hd)]))));
  assign wire245 = $unsigned((-$unsigned({$signed(wire243),
                       $unsigned(wire241)})));
  assign wire246 = (&$signed(wire240[(3'h6):(2'h2)]));
  assign wire247 = (~&(wire245[(2'h2):(2'h2)] <<< $unsigned((&(wire241 ^ wire242)))));
  always
    @(posedge clk) begin
      if ((~^wire247[(5'h10):(4'ha)]))
        begin
          reg248 <= wire242[(4'hb):(3'h4)];
          reg249 <= (&(~({(wire241 ? (8'haf) : wire239)} ?
              $signed($unsigned(wire243)) : ((wire241 > (7'h43)) > wire241))));
        end
      else
        begin
          if (((|$unsigned(wire244[(1'h1):(1'h0)])) ?
              (((8'ha1) ?
                  ((&wire246) << $unsigned((8'haa))) : wire241[(1'h1):(1'h1)]) <<< $unsigned(((wire242 >= wire244) ^ (reg249 < reg248)))) : (wire240[(1'h0):(1'h0)] << (!(8'hb5)))))
            begin
              reg248 <= wire241;
            end
          else
            begin
              reg248 <= wire247;
            end
          reg249 <= (|(8'hb7));
          if ($signed(($unsigned((!(|reg248))) || {(~$signed(wire245)),
              wire247})))
            begin
              reg250 <= wire245[(2'h3):(1'h0)];
            end
          else
            begin
              reg250 <= ((($signed($unsigned(wire241)) <= {wire246[(2'h2):(2'h2)]}) ?
                      (&reg249[(1'h1):(1'h0)]) : wire247[(4'he):(1'h1)]) ?
                  (^~((wire245 ?
                      (~wire239) : (!wire246)) - ($unsigned(wire242) <<< $unsigned(wire239)))) : {wire239});
              reg251 <= {reg248[(4'he):(3'h7)]};
              reg252 <= $unsigned(($unsigned(wire247) || reg248));
            end
          reg253 <= reg248[(5'h13):(4'he)];
          reg254 <= ($signed((~((wire245 ? wire244 : reg250) ?
                  wire241 : (wire241 * reg248)))) ?
              reg251[(3'h6):(3'h4)] : wire246[(4'hb):(3'h5)]);
        end
    end
  assign wire255 = (8'hb7);
  always
    @(posedge clk) begin
      reg256 <= reg250[(1'h1):(1'h0)];
      reg257 <= (reg250 ? wire255[(4'hc):(4'h8)] : (~&(|{$unsigned(wire247)})));
      reg258 <= $unsigned(($unsigned($signed($unsigned(wire245))) < reg251[(4'h8):(1'h1)]));
      reg259 <= ((~^(~^$signed($unsigned((8'hb2))))) != wire244);
    end
  assign wire260 = {($signed((reg259[(3'h5):(2'h2)] ?
                           $signed(wire255) : (!(7'h40)))) == reg250),
                       (^~$signed({(|wire240), wire247[(4'hc):(4'hc)]}))};
  assign wire261 = {$signed(reg254[(3'h6):(2'h2)]), wire242};
  assign wire262 = $signed((~|(8'hb4)));
  assign wire263 = wire242[(4'hc):(4'hb)];
  always
    @(posedge clk) begin
      reg264 <= $unsigned({(~$unsigned($unsigned((8'hb6)))), wire255});
      reg265 <= ($signed({{(^~wire261)},
          (wire246[(3'h7):(3'h5)] ^~ (+reg249))}) >>> $signed(wire255[(3'h6):(3'h5)]));
    end
  assign wire266 = reg265;
  always
    @(posedge clk) begin
      reg267 <= (~^reg259);
      reg268 <= ((~&(($unsigned(reg250) ? ((8'ha0) >> reg248) : (|wire263)) ?
          {$unsigned((8'ha8)),
              reg249[(3'h5):(1'h0)]} : $signed((wire260 > wire266)))) | {$unsigned(reg248)});
      reg269 <= wire244;
    end
  assign wire270 = (((((~&wire239) ?
                               (reg251 ^ wire247) : $signed((8'ha2))) + $unsigned($unsigned(reg259))) ?
                           $signed((~|reg268[(2'h2):(2'h2)])) : reg257) ?
                       reg252 : ((8'hb8) < reg265[(2'h3):(1'h0)]));
  assign wire271 = reg268[(2'h3):(1'h1)];
  assign wire272 = ((|($signed((reg251 ? reg254 : wire246)) ?
                           (^(8'haa)) : ($signed(wire261) & wire255[(3'h7):(2'h2)]))) ?
                       (reg264[(1'h0):(1'h0)] > (^~({reg248} >> (reg257 >> wire246)))) : wire242);
  assign wire273 = {reg250, wire246};
  assign wire274 = (&wire266);
  assign wire275 = (($unsigned($unsigned((^reg248))) - ((^~(wire270 * wire239)) ?
                       reg253 : (reg264[(1'h0):(1'h0)] <<< reg248))) >>> {(&reg251)});
  assign wire276 = {wire274[(4'hd):(3'h4)],
                       ($signed(reg268[(2'h3):(1'h1)]) ^ wire270)};
  assign wire277 = reg258[(5'h10):(4'hb)];
endmodule

module module154  (y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'h327):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire158;
  input wire signed [(5'h15):(1'h0)] wire157;
  input wire [(4'ha):(1'h0)] wire156;
  input wire signed [(4'h9):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire223;
  wire [(3'h4):(1'h0)] wire199;
  wire [(4'he):(1'h0)] wire198;
  wire [(4'hf):(1'h0)] wire161;
  wire [(5'h13):(1'h0)] wire160;
  wire signed [(2'h2):(1'h0)] wire159;
  reg [(3'h7):(1'h0)] reg230 = (1'h0);
  reg [(2'h3):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg228 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg225 = (1'h0);
  reg [(2'h2):(1'h0)] reg224 = (1'h0);
  reg [(3'h6):(1'h0)] reg222 = (1'h0);
  reg [(3'h7):(1'h0)] reg221 = (1'h0);
  reg signed [(4'he):(1'h0)] reg220 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg219 = (1'h0);
  reg [(5'h10):(1'h0)] reg218 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg217 = (1'h0);
  reg [(4'h9):(1'h0)] reg216 = (1'h0);
  reg [(5'h12):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg214 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg213 = (1'h0);
  reg [(2'h2):(1'h0)] reg212 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg210 = (1'h0);
  reg [(4'hd):(1'h0)] reg209 = (1'h0);
  reg [(5'h11):(1'h0)] reg208 = (1'h0);
  reg [(4'hf):(1'h0)] reg207 = (1'h0);
  reg [(3'h5):(1'h0)] reg206 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg205 = (1'h0);
  reg [(2'h3):(1'h0)] reg204 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg203 = (1'h0);
  reg signed [(4'he):(1'h0)] reg202 = (1'h0);
  reg [(5'h13):(1'h0)] reg201 = (1'h0);
  reg [(4'h8):(1'h0)] reg200 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg197 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg196 = (1'h0);
  reg [(4'hf):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg194 = (1'h0);
  reg [(5'h12):(1'h0)] reg193 = (1'h0);
  reg [(2'h2):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg190 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg189 = (1'h0);
  reg [(3'h6):(1'h0)] reg188 = (1'h0);
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  reg [(4'ha):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg185 = (1'h0);
  reg [(2'h3):(1'h0)] reg184 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg183 = (1'h0);
  reg [(4'h9):(1'h0)] reg182 = (1'h0);
  reg [(4'ha):(1'h0)] reg181 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg180 = (1'h0);
  reg [(4'ha):(1'h0)] reg179 = (1'h0);
  reg [(4'hd):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg177 = (1'h0);
  reg [(4'hc):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(5'h14):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(4'hd):(1'h0)] reg167 = (1'h0);
  reg signed [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(3'h6):(1'h0)] reg162 = (1'h0);
  assign y = {wire223,
                 wire199,
                 wire198,
                 wire161,
                 wire160,
                 wire159,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
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
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire159 = $unsigned(wire155[(2'h3):(1'h1)]);
  assign wire160 = {$signed(($unsigned((wire155 ?
                           wire159 : wire158)) + wire158[(4'h8):(1'h1)]))};
  assign wire161 = $unsigned((wire155 ?
                       {(wire158 & (wire155 + wire159)),
                           ((|wire157) ?
                               (wire159 ?
                                   wire155 : wire158) : $unsigned(wire156))} : wire158[(4'h8):(2'h3)]));
  always
    @(posedge clk) begin
      if (wire161)
        begin
          reg162 <= ({{{$signed(wire158), wire156[(3'h4):(1'h0)]},
                  (~(wire156 && wire155))},
              $signed($unsigned($signed(wire157)))} >= $signed((-$unsigned(((8'hbc) ?
              wire161 : wire157)))));
        end
      else
        begin
          if ($unsigned($signed((-wire157))))
            begin
              reg162 <= ({(wire161[(4'hb):(3'h5)] + wire158),
                  ({(wire159 || wire157), $unsigned(reg162)} ?
                      ((wire155 ? wire157 : reg162) ?
                          (wire161 & wire160) : wire160) : {$signed(wire158)})} - wire156[(3'h5):(1'h1)]);
              reg163 <= wire156[(1'h1):(1'h1)];
              reg164 <= ({({{wire157}, (wire161 != wire161)} ?
                      $unsigned((~&wire160)) : $unsigned(wire158)),
                  $signed((~&reg163))} * $signed((($signed((8'hb8)) ?
                      $unsigned(wire159) : reg163) ?
                  ($signed(wire159) ?
                      {reg162} : $unsigned(wire157)) : wire156[(4'ha):(3'h5)])));
            end
          else
            begin
              reg162 <= {(~{$unsigned($unsigned(wire158)),
                      ($signed(reg162) ?
                          wire157[(4'ha):(4'h9)] : wire160[(3'h7):(3'h4)])})};
              reg163 <= {(-wire158), $signed(wire160[(4'hf):(3'h4)])};
              reg164 <= reg162;
              reg165 <= {wire158};
            end
          reg166 <= $signed((+wire159));
          reg167 <= $unsigned(reg162);
          if ((8'h9c))
            begin
              reg168 <= (((((^reg164) ^ {wire161,
                  wire157}) ^ $signed(wire157)) <<< $unsigned((+$unsigned(reg162)))) <<< {$unsigned($unsigned(((8'ha6) & wire155))),
                  $unsigned((-wire158[(4'hc):(3'h6)]))});
              reg169 <= (8'h9f);
            end
          else
            begin
              reg168 <= {$signed((8'hb5))};
              reg169 <= wire161;
              reg170 <= $signed($unsigned($unsigned({(reg163 ?
                      reg162 : reg168)})));
              reg171 <= ((8'hae) != wire161);
              reg172 <= ($signed((wire158[(4'hd):(4'h9)] ?
                      $unsigned(((8'hb1) ?
                          reg166 : reg170)) : (&reg167[(2'h3):(1'h1)]))) ?
                  reg169[(4'hf):(4'hb)] : ($unsigned((wire160[(1'h0):(1'h0)] ?
                          reg170[(4'h8):(3'h7)] : $signed(reg170))) ?
                      (~&((wire160 ? wire159 : reg163) ?
                          (wire158 ?
                              reg163 : reg164) : ((8'haf) << (7'h44)))) : (^wire156[(2'h3):(2'h3)])));
            end
          if ($signed((($unsigned($signed(reg162)) << $unsigned($signed(reg166))) ?
              (8'ha3) : ($unsigned(wire158) ~^ reg167))))
            begin
              reg173 <= $signed(reg165);
            end
          else
            begin
              reg173 <= {(wire155 ?
                      (!$signed($unsigned(reg169))) : $unsigned({((8'hbb) ?
                              wire159 : wire158),
                          (!reg166)}))};
              reg174 <= (wire160 && $unsigned((reg166[(3'h5):(2'h2)] ?
                  ((~^(8'h9f)) && (-reg166)) : $signed((wire155 & reg169)))));
            end
        end
      reg175 <= $signed(reg168);
    end
  always
    @(posedge clk) begin
      reg176 <= $signed(($unsigned({(reg173 > reg169), reg168[(2'h3):(2'h2)]}) ?
          {{$unsigned(reg163)}} : (!(~&$unsigned(wire160)))));
      if (reg167)
        begin
          reg177 <= $signed(((!((reg169 ?
              (8'haf) : reg165) * (reg166 != wire156))) ^ reg174));
          reg178 <= ($signed(reg164) ?
              ({{reg164},
                  $unsigned((reg163 ?
                      reg172 : reg170))} - reg174[(2'h3):(1'h0)]) : (|(8'ha2)));
          if (reg173[(4'h9):(3'h6)])
            begin
              reg179 <= reg171[(4'hf):(3'h4)];
              reg180 <= reg172;
              reg181 <= ((~^($unsigned(wire161[(4'h8):(3'h6)]) ?
                  $signed(reg177[(4'h8):(2'h2)]) : reg175[(3'h6):(3'h6)])) == (+($unsigned((8'ha1)) == reg176[(4'h8):(2'h2)])));
            end
          else
            begin
              reg179 <= reg174;
              reg180 <= $unsigned((reg172 ?
                  ($signed((reg169 ? wire158 : reg180)) ?
                      $signed(wire161[(4'h8):(3'h5)]) : $unsigned(reg180)) : reg174));
            end
        end
      else
        begin
          reg177 <= ((7'h41) ? reg181 : (8'hb2));
          reg178 <= $unsigned((($unsigned(reg164[(3'h6):(3'h4)]) ?
                  reg162 : reg181[(3'h5):(2'h2)]) ?
              reg176[(4'ha):(4'ha)] : (((wire158 ^~ (8'hbb)) == wire155) * ((wire161 ^~ reg178) ?
                  $unsigned(wire156) : (reg181 == reg168)))));
          reg179 <= $signed($unsigned($unsigned((((8'ha8) ? reg178 : wire155) ?
              reg177[(1'h0):(1'h0)] : $unsigned(reg169)))));
        end
      if ($unsigned(reg176[(4'h9):(1'h0)]))
        begin
          reg182 <= reg168[(1'h0):(1'h0)];
          reg183 <= ((!reg178) <<< $signed(((|reg177[(4'he):(2'h3)]) == ($signed((8'ha0)) >= (7'h43)))));
          if ((((({reg182} <= $unsigned(wire157)) ^ (^reg177)) < $unsigned(reg169)) ?
              reg163[(3'h4):(1'h1)] : (~$signed((~^wire160[(2'h3):(1'h1)])))))
            begin
              reg184 <= ((reg171 ?
                  (~wire161) : (($unsigned(wire156) ?
                          (reg169 ? reg163 : reg163) : (reg176 || (8'ha5))) ?
                      ((~^(8'hac)) ?
                          (!reg166) : reg181) : (reg166[(4'he):(3'h5)] ^~ reg164))) * {($unsigned(wire159) ?
                      $unsigned((&wire156)) : $unsigned($unsigned(wire155))),
                  reg182[(3'h4):(2'h2)]});
              reg185 <= reg183;
              reg186 <= wire161;
              reg187 <= ((~$unsigned(reg163[(2'h3):(1'h1)])) >= (|reg176));
              reg188 <= reg178[(4'hc):(3'h6)];
            end
          else
            begin
              reg184 <= ($unsigned(reg180[(4'h9):(4'h8)]) ?
                  {(reg164 ?
                          (~|(reg167 && reg174)) : ({(7'h44),
                              (8'hb5)} + reg178[(3'h7):(3'h7)])),
                      (&reg162[(1'h1):(1'h0)])} : wire156);
            end
        end
      else
        begin
          if ((-(($unsigned((|wire155)) ?
              (7'h44) : $signed(wire158[(2'h3):(1'h0)])) > {(reg180 ?
                  $signed(reg177) : $unsigned(reg164)),
              reg180})))
            begin
              reg182 <= $signed($unsigned(($unsigned((&reg185)) ?
                  reg176 : reg185[(4'he):(3'h6)])));
              reg183 <= $signed($unsigned((8'ha4)));
              reg184 <= ((-reg187[(1'h0):(1'h0)]) && reg184[(2'h2):(1'h1)]);
              reg185 <= {wire156[(2'h3):(2'h3)]};
              reg186 <= reg170[(4'hd):(4'hd)];
            end
          else
            begin
              reg182 <= wire161;
              reg183 <= ($unsigned({reg177[(3'h4):(1'h0)],
                      (~^$unsigned(reg164))}) ?
                  ((|wire160) ~^ (8'had)) : reg177[(4'hc):(3'h4)]);
            end
          if ((+(8'ha0)))
            begin
              reg187 <= reg185;
            end
          else
            begin
              reg187 <= wire155;
              reg188 <= wire161[(3'h4):(1'h0)];
              reg189 <= reg174;
              reg190 <= (reg167 ?
                  reg188[(3'h6):(2'h3)] : (($signed((reg170 ?
                      reg183 : reg181)) >>> reg167) <= $signed((&(!(8'hbb))))));
              reg191 <= (^~$signed(((~^(+reg177)) >= $signed(wire156))));
            end
          if (((reg176[(4'h9):(3'h7)] ?
                  $signed(((reg163 == reg181) || reg169[(1'h0):(1'h0)])) : (+$unsigned((~&reg176)))) ?
              reg166[(4'h8):(3'h7)] : (reg187[(2'h2):(2'h2)] ^ $signed($signed($unsigned(reg175))))))
            begin
              reg192 <= wire155;
              reg193 <= reg180[(3'h6):(1'h0)];
            end
          else
            begin
              reg192 <= $unsigned($unsigned({wire157[(5'h10):(4'hc)],
                  (reg162[(3'h4):(2'h3)] ~^ $unsigned(wire160))}));
              reg193 <= reg185;
              reg194 <= $unsigned((^(reg172[(4'h8):(3'h5)] ?
                  $signed((reg168 ? reg172 : reg180)) : (&(&reg190)))));
              reg195 <= $signed($unsigned((~(|wire159[(1'h1):(1'h1)]))));
            end
        end
      reg196 <= reg189;
      reg197 <= $signed($signed(($signed({reg170, reg179}) ?
          $signed($signed(wire159)) : reg184[(1'h0):(1'h0)])));
    end
  assign wire198 = $unsigned((~|(&($unsigned((8'ha9)) ?
                       {reg163} : wire160[(5'h12):(4'ha)]))));
  assign wire199 = ((((reg186 >= $signed(reg194)) ^~ reg180) ?
                           (reg179[(3'h7):(2'h3)] || (8'h9f)) : $unsigned((wire155[(1'h1):(1'h1)] >>> reg195))) ?
                       (reg188[(3'h6):(3'h4)] ?
                           reg176 : (-$signed((reg186 ?
                               reg181 : reg185)))) : {reg167[(2'h3):(2'h3)],
                           ($signed((reg185 ? (8'haa) : reg165)) ?
                               $unsigned((8'ha8)) : wire156)});
  always
    @(posedge clk) begin
      reg200 <= wire160[(4'he):(2'h2)];
      reg201 <= reg181;
      if ($signed(((!((reg189 ? (8'ha0) : wire157) ~^ reg171)) ~^ reg163)))
        begin
          if ((&reg175[(2'h2):(1'h0)]))
            begin
              reg202 <= reg183[(5'h12):(1'h1)];
              reg203 <= (!reg193[(5'h11):(4'he)]);
              reg204 <= reg170[(4'h8):(4'h8)];
              reg205 <= $signed({wire161[(3'h7):(3'h4)],
                  reg185[(5'h11):(3'h6)]});
            end
          else
            begin
              reg202 <= ((8'hb2) >= reg189);
              reg203 <= $unsigned(({reg169[(1'h1):(1'h1)],
                      (reg177[(2'h3):(1'h1)] ^ $signed(reg190))} ?
                  reg188[(3'h5):(1'h1)] : $unsigned($unsigned({(8'hb4),
                      reg201}))));
              reg204 <= $signed((~^{reg189[(1'h0):(1'h0)]}));
              reg205 <= reg180[(4'h9):(4'h8)];
            end
          reg206 <= $unsigned($signed($unsigned(($unsigned(reg172) - reg193))));
          reg207 <= ((&$signed(((^~reg206) != (reg203 ? reg197 : reg166)))) ?
              ({reg162[(1'h0):(1'h0)], ($signed(reg179) == reg183)} ?
                  reg179[(3'h4):(1'h1)] : $unsigned($unsigned(reg179))) : ((reg204 != (+((8'hb7) | reg179))) ?
                  reg164 : $signed(reg206)));
          reg208 <= {($unsigned(reg189) ? (^reg178[(4'h8):(4'h8)]) : reg186)};
        end
      else
        begin
          reg202 <= ($unsigned(({reg192, wire199} ?
              reg205 : $signed($signed(reg182)))) < reg172);
          reg203 <= $unsigned($signed(wire161));
          reg204 <= (~|($unsigned(reg182[(2'h3):(2'h3)]) ?
              $signed($unsigned((reg166 ?
                  (8'hbc) : reg194))) : ((|reg173[(1'h0):(1'h0)]) ?
                  (reg196[(3'h4):(3'h4)] | reg171[(4'ha):(3'h5)]) : (8'hbf))));
          if (((-reg176) ?
              ($signed(wire160) ?
                  $unsigned(reg180) : reg170[(5'h13):(4'ha)]) : $unsigned(reg173[(1'h0):(1'h0)])))
            begin
              reg205 <= ((reg168 ?
                      $unsigned(($unsigned(reg180) ?
                          (reg175 ?
                              reg172 : (8'hb4)) : reg178[(3'h6):(2'h2)])) : $signed((~(wire157 ?
                          wire198 : reg179)))) ?
                  reg167 : reg204[(2'h2):(2'h2)]);
              reg206 <= $unsigned($unsigned($unsigned(reg191)));
              reg207 <= (~|(~|($signed(((7'h40) & (7'h40))) ?
                  ((~^reg195) - (wire159 <<< reg202)) : $signed($unsigned(reg206)))));
              reg208 <= $unsigned((((+reg172[(4'h9):(2'h3)]) ?
                  $signed($unsigned(reg184)) : reg168[(1'h0):(1'h0)]) - ($unsigned({reg203,
                      reg170}) ?
                  reg171[(4'he):(2'h3)] : $signed($signed(reg170)))));
              reg209 <= {$signed((reg183[(3'h4):(2'h2)] ^ {(~reg190)})),
                  (^~reg186[(2'h2):(1'h1)])};
            end
          else
            begin
              reg205 <= reg164;
              reg206 <= reg203;
              reg207 <= reg201;
              reg208 <= ($signed(((reg166[(2'h3):(2'h3)] <<< $unsigned(reg191)) ?
                  (wire156 & (reg188 * reg180)) : ((reg205 | reg191) - reg204[(2'h3):(2'h3)]))) + $signed(($signed((reg173 ?
                  reg197 : reg200)) >= $unsigned({(8'h9c)}))));
            end
        end
      reg210 <= reg179;
      reg211 <= $unsigned((({$unsigned(reg195)} ?
          reg180[(3'h6):(1'h1)] : reg193) >= reg162[(2'h2):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg212 <= wire155;
      if ((^($signed($unsigned(reg171[(4'h9):(4'h9)])) ?
          (reg177 == $unsigned((reg202 ^~ reg162))) : (&reg180[(4'h8):(1'h1)]))))
        begin
          reg213 <= ((|$signed($signed(reg180[(3'h4):(3'h4)]))) ^ (|wire156));
          reg214 <= (+reg178);
        end
      else
        begin
          reg213 <= reg182;
          if ($unsigned($unsigned(wire199[(3'h4):(3'h4)])))
            begin
              reg214 <= (8'h9c);
              reg215 <= $signed($unsigned(({$unsigned(reg208),
                  wire158} + $unsigned($signed(reg185)))));
              reg216 <= (~$signed(reg191[(4'h8):(1'h1)]));
              reg217 <= (|$signed(wire161[(3'h6):(3'h6)]));
            end
          else
            begin
              reg214 <= {(8'ha2),
                  ((reg207 >> (wire161 == $unsigned(reg214))) & reg205)};
              reg215 <= (wire157 >>> reg200[(2'h2):(1'h1)]);
              reg216 <= $unsigned(reg206[(3'h4):(2'h2)]);
              reg217 <= (~^reg190[(3'h6):(3'h6)]);
              reg218 <= (($unsigned($signed((~&(8'hb1)))) ?
                      (&$signed((~&reg172))) : (~reg194[(5'h10):(1'h0)])) ?
                  {(-(~|{reg174, (8'haf)})),
                      (~(!$unsigned(reg165)))} : reg215[(4'h8):(1'h0)]);
            end
          reg219 <= ($unsigned($signed(((^reg187) ? (+reg202) : (8'hbc)))) ?
              $unsigned($signed((reg216 > reg203[(4'ha):(3'h5)]))) : $unsigned(reg166[(2'h3):(2'h2)]));
          reg220 <= reg190[(4'h8):(2'h3)];
        end
      reg221 <= {{$signed((-{wire158})), $signed(reg172[(5'h10):(1'h1)])},
          $unsigned({wire198,
              ((reg210 ? reg183 : (8'hb8)) < wire160[(4'hc):(1'h0)])})};
      reg222 <= reg204;
    end
  assign wire223 = wire199[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ((&wire157))
        begin
          reg224 <= $unsigned(reg177[(1'h0):(1'h0)]);
        end
      else
        begin
          if (reg169[(4'h9):(4'h8)])
            begin
              reg224 <= (8'hba);
            end
          else
            begin
              reg224 <= (({$unsigned((!reg219)),
                  (~^reg196)} <<< $signed($unsigned((reg164 ?
                  reg204 : (8'h9f))))) ~^ (reg213 ?
                  ((^~(wire198 ? reg195 : (8'ha9))) ^~ ({reg195} ?
                      (&reg186) : $unsigned(reg219))) : $unsigned(reg182[(3'h6):(2'h3)])));
              reg225 <= reg216[(2'h3):(2'h2)];
              reg226 <= {reg179, (~^(~reg184))};
              reg227 <= $signed($unsigned((^~(~^(reg206 ? reg176 : wire158)))));
            end
        end
      reg228 <= ((reg163[(4'h8):(3'h7)] ?
              ((|(!(8'h9f))) ? reg168 : $unsigned($signed(reg206))) : reg174) ?
          (reg224 >= $signed(reg214)) : $signed($signed(reg172)));
      reg229 <= reg187[(1'h1):(1'h0)];
      reg230 <= (&wire223);
    end
endmodule

module module106
#(parameter param150 = ((~(~(!{(8'hb8), (8'hbb)}))) + (&((~|((8'hb9) ? (8'hbc) : (8'hb1))) ? (((7'h43) ? (8'hba) : (8'hb6)) ^~ {(8'hb7)}) : (~|((8'hbf) != (8'haf)))))), 
parameter param151 = param150)
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire111;
  input wire signed [(5'h13):(1'h0)] wire110;
  input wire signed [(3'h7):(1'h0)] wire109;
  input wire [(3'h6):(1'h0)] wire108;
  input wire [(2'h2):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire149;
  wire [(5'h15):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire146;
  wire [(5'h10):(1'h0)] wire143;
  wire signed [(5'h11):(1'h0)] wire142;
  wire [(5'h13):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire127;
  wire [(3'h4):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(4'ha):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg136 = (1'h0);
  reg [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg [(5'h14):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(5'h10):(1'h0)] reg118 = (1'h0);
  reg [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(4'h9):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire143,
                 wire142,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 reg145,
                 reg144,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({wire108, wire107})
        begin
          reg112 <= {(^wire110), $unsigned((!$signed(wire109)))};
          reg113 <= ((wire110[(4'hb):(3'h6)] ?
              wire111[(4'he):(4'hd)] : ((8'h9f) ?
                  $signed((~wire109)) : $signed(reg112))) * ((wire110[(4'ha):(2'h3)] ?
                  (wire107[(2'h2):(2'h2)] | (~|wire110)) : (!wire110[(3'h4):(2'h3)])) ?
              (!(!reg112)) : ($unsigned({wire109,
                  wire109}) ~^ (wire109[(2'h3):(1'h0)] ^~ {(8'haf)}))));
          reg114 <= $unsigned($signed((($signed(reg113) ^~ (8'had)) || $signed($signed(reg112)))));
          reg115 <= $signed((~^(wire111 + ($signed(wire110) > $signed(wire107)))));
          if (((+wire108[(3'h6):(3'h6)]) * {(reg113 == ((~&wire108) ?
                  (wire109 >> wire109) : (-reg114))),
              $signed((reg114 ? {(8'ha7), (8'hbd)} : $signed((8'ha2))))}))
            begin
              reg116 <= ({$unsigned(($unsigned(wire108) ?
                          (|reg112) : $unsigned((8'haf)))),
                      $signed($unsigned(reg115))} ?
                  reg112[(1'h1):(1'h0)] : (((((8'ha7) ?
                              wire109 : reg113) ^ (wire109 == wire107)) ?
                          $unsigned((reg113 != reg115)) : (reg112[(1'h0):(1'h0)] ^ wire108)) ?
                      ($signed((reg113 ?
                          wire110 : (8'ha9))) != $signed((wire110 & reg115))) : wire107[(2'h2):(1'h1)]));
              reg117 <= $unsigned(reg116);
              reg118 <= (((wire111 ?
                      wire110[(4'he):(3'h6)] : $unsigned((reg112 ?
                          (7'h41) : wire108))) + reg115[(2'h2):(1'h0)]) ?
                  wire110[(5'h13):(2'h2)] : ((((reg112 ?
                          (8'ha8) : (8'hb6)) + ((8'hb8) >= reg117)) ?
                      $unsigned($unsigned(reg114)) : (~(wire110 - (8'hb1)))) != wire108[(2'h3):(1'h0)]));
            end
          else
            begin
              reg116 <= $signed((^$unsigned(wire109[(3'h5):(1'h0)])));
              reg117 <= (8'ha9);
              reg118 <= ($unsigned($unsigned(reg118[(4'h8):(3'h4)])) ?
                  reg114[(3'h5):(3'h5)] : $signed(($unsigned($signed(wire107)) ?
                      {(~^reg116),
                          (reg114 <= reg115)} : ({wire110} < (wire107 + (7'h42))))));
              reg119 <= ($unsigned(reg114[(1'h0):(1'h0)]) | reg117);
            end
        end
      else
        begin
          reg112 <= wire107[(2'h2):(2'h2)];
          reg113 <= ($unsigned((~|{{wire111}})) ?
              reg114[(1'h1):(1'h0)] : ($signed($signed((|(7'h40)))) ?
                  (&wire109[(2'h2):(1'h0)]) : $unsigned(((wire109 ?
                          wire107 : reg114) ?
                      (!reg118) : (wire107 | (8'ha4))))));
          reg114 <= reg116[(3'h4):(1'h1)];
        end
      reg120 <= reg115[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg121 <= (reg112 ?
          ((~&{reg119}) ?
              {($unsigned(reg116) ?
                      (reg116 ?
                          reg112 : (8'had)) : $unsigned(reg112))} : $signed($unsigned(reg114))) : (reg117[(2'h2):(1'h1)] ?
              $signed($unsigned((8'hab))) : {$unsigned(wire107)}));
      reg122 <= ((&$signed(reg121[(2'h2):(1'h0)])) ?
          (wire111[(4'hb):(4'ha)] ?
              (!$signed(reg121)) : reg113) : reg113[(1'h0):(1'h0)]);
      reg123 <= reg122[(4'h8):(1'h1)];
      reg124 <= (^$signed((+$signed((wire108 - reg120)))));
    end
  assign wire125 = (wire110 ?
                       $signed($unsigned($signed(wire108[(1'h1):(1'h1)]))) : (^(reg115 ?
                           {(^~reg116), $signed(reg116)} : ((wire108 ?
                                   reg114 : reg118) ?
                               (!reg118) : (^wire109)))));
  assign wire126 = $unsigned((($signed($unsigned(reg114)) ?
                       reg123 : ($unsigned(reg119) << {(7'h43)})) * (8'hab)));
  assign wire127 = wire126;
  assign wire128 = reg112[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg129 <= reg112[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg130 <= (($signed((!{reg113})) >> wire108[(2'h2):(1'h0)]) >> reg116);
      if ($unsigned((~&$signed($signed(reg114)))))
        begin
          reg131 <= reg129;
          reg132 <= (|((reg113[(2'h3):(1'h0)] & $signed($unsigned(wire109))) ?
              reg131 : wire109));
          reg133 <= ({wire109[(3'h6):(3'h4)],
              wire127[(2'h2):(2'h2)]} <= (!$unsigned(((wire109 ?
              (7'h41) : (8'hb6)) << (|wire125)))));
        end
      else
        begin
          reg131 <= (reg118 > reg122);
          reg132 <= $signed((~$signed(reg115[(1'h1):(1'h1)])));
          reg133 <= wire128;
        end
      if ((wire128 ? (7'h43) : wire126[(1'h1):(1'h0)]))
        begin
          if ($signed((((8'hb8) ?
              (reg117 ^~ (&reg132)) : {(wire109 ?
                      (8'ha8) : reg118)}) >>> (^~wire111[(3'h6):(2'h2)]))))
            begin
              reg134 <= reg124;
              reg135 <= reg122;
              reg136 <= wire108;
            end
          else
            begin
              reg134 <= reg120;
              reg135 <= wire125;
              reg136 <= reg114;
              reg137 <= {wire107, $unsigned((~^$signed($signed(reg113))))};
              reg138 <= $signed((({(reg129 ? reg122 : wire110)} ?
                  ((+(8'ha7)) << $unsigned(reg119)) : ($unsigned(wire107) ?
                      reg137 : (reg123 > reg130))) || ((~$signed(reg112)) < (^reg134))));
            end
        end
      else
        begin
          reg134 <= ({$signed(reg138)} && ($unsigned({$signed(reg117)}) ?
              ((8'ha1) ?
                  $signed((reg118 ^~ wire127)) : {reg135[(4'h8):(3'h7)],
                      (-wire107)}) : ((~|reg122[(3'h6):(2'h2)]) && wire109[(3'h6):(1'h0)])));
          reg135 <= reg122[(4'h9):(4'h9)];
          if ($signed((wire127[(1'h0):(1'h0)] ?
              wire108[(2'h2):(1'h1)] : ({(reg118 ? reg113 : (8'hbb)),
                      $unsigned(wire111)} ?
                  $signed((7'h41)) : reg138[(4'h8):(2'h2)]))))
            begin
              reg136 <= ($unsigned(wire127[(3'h4):(3'h4)]) ?
                  reg137 : reg133[(2'h2):(1'h0)]);
            end
          else
            begin
              reg136 <= wire109[(3'h7):(3'h6)];
              reg137 <= $unsigned((7'h43));
              reg138 <= (wire109 && reg124);
              reg139 <= (!$unsigned(reg135));
              reg140 <= (reg131 ?
                  $signed(({(reg129 && wire108)} ?
                      (&reg114[(2'h3):(1'h0)]) : reg135)) : (!reg133[(1'h1):(1'h1)]));
            end
        end
      reg141 <= (^wire107[(1'h1):(1'h0)]);
    end
  assign wire142 = $unsigned($unsigned($unsigned(((reg129 >>> wire107) ?
                       $signed(reg116) : wire126))));
  assign wire143 = (reg123[(2'h3):(2'h2)] ?
                       $signed($unsigned((8'ha6))) : $signed((reg118[(4'hb):(3'h7)] ?
                           ($unsigned(wire126) ?
                               $unsigned(reg115) : $signed(reg124)) : $unsigned({(8'hba),
                               reg115}))));
  always
    @(posedge clk) begin
      reg144 <= (((~|($signed(reg115) > {reg121})) ?
              wire125 : (~($unsigned(wire107) ^ (reg120 + reg131)))) ?
          (7'h40) : ({(~|(|reg112))} - (({reg119} ^~ (~&reg131)) >= $signed((reg132 >> reg131)))));
      reg145 <= ($signed($unsigned(($unsigned(wire142) | (-reg117)))) >= (~^(reg122 && $signed($unsigned(reg113)))));
    end
  assign wire146 = $unsigned((reg124 && (({reg133, wire128} ?
                           (wire107 ? reg116 : (8'hb5)) : {wire107, wire110}) ?
                       (8'h9d) : (~&reg123[(1'h1):(1'h1)]))));
  assign wire147 = ((!((reg133[(2'h2):(1'h1)] ? wire111 : $signed((8'hb9))) ?
                       ($signed(wire127) && (~&wire107)) : (wire126 ?
                           (8'hb6) : (reg139 ^~ reg131)))) | $signed($signed($signed($unsigned(reg129)))));
  assign wire148 = wire143;
  assign wire149 = wire109;
endmodule

module module73
#(parameter param102 = (7'h44))
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire77;
  input wire signed [(4'h9):(1'h0)] wire76;
  input wire signed [(3'h4):(1'h0)] wire75;
  input wire [(5'h13):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire99;
  wire [(5'h15):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire78;
  reg signed [(5'h10):(1'h0)] reg98 = (1'h0);
  reg [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(2'h2):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 (1'h0)};
  assign wire78 = {(({$signed(wire75), ((8'hbd) ? wire74 : wire75)} ?
                          (^~$unsigned((8'ha0))) : wire76[(2'h2):(1'h1)]) <<< wire76)};
  assign wire79 = (wire75 || (^wire74));
  assign wire80 = {$unsigned((wire78 ? wire75 : wire79))};
  assign wire81 = ((|wire79[(2'h3):(1'h1)]) ?
                      (^wire75[(1'h1):(1'h0)]) : $unsigned(wire75[(1'h0):(1'h0)]));
  assign wire82 = ($signed($unsigned({(8'hbd)})) > ($unsigned(wire78) ?
                      (-$unsigned(wire77[(1'h1):(1'h0)])) : $signed(wire74)));
  always
    @(posedge clk) begin
      reg83 <= $signed(($unsigned(wire77) ?
          $unsigned(wire76) : (wire77[(2'h2):(2'h2)] ?
              {wire79} : ($signed(wire79) ?
                  (wire75 <= wire76) : $signed(wire75)))));
      if ($unsigned($unsigned((^~(-$unsigned(wire81))))))
        begin
          reg84 <= (wire77 ?
              wire81 : $signed((((wire74 <<< wire81) ?
                      ((8'haf) <<< (7'h41)) : reg83[(4'ha):(3'h6)]) ?
                  $signed((~(8'hb6))) : (wire78[(4'h9):(2'h2)] ?
                      wire82[(5'h15):(5'h10)] : wire76))));
        end
      else
        begin
          if ($unsigned((~|((~&wire74[(3'h5):(3'h5)]) ?
              $signed($signed(wire76)) : reg83))))
            begin
              reg84 <= (^~$unsigned(wire79));
            end
          else
            begin
              reg84 <= {(({(wire82 ? wire78 : wire77),
                      $unsigned(wire76)} - $signed(wire77[(1'h0):(1'h0)])) < (wire82 <<< $unsigned(reg83[(3'h6):(3'h6)])))};
              reg85 <= $signed((8'ha4));
              reg86 <= $signed($unsigned((wire78[(5'h12):(4'hd)] ?
                  $unsigned($signed(reg83)) : $signed($unsigned(wire78)))));
              reg87 <= $unsigned((8'ha7));
              reg88 <= ($unsigned(wire80) ?
                  $signed(wire79[(2'h2):(1'h0)]) : {{reg83[(3'h7):(1'h0)]}});
            end
          if (((reg85[(3'h5):(1'h0)] ?
              ($unsigned(wire77[(1'h1):(1'h0)]) ~^ (^reg88)) : (!wire79[(1'h0):(1'h0)])) + reg84))
            begin
              reg89 <= $unsigned(wire74);
              reg90 <= $unsigned(((&((wire82 ?
                  reg88 : wire82) < reg87[(4'h9):(4'h8)])) <= (+$unsigned((~wire82)))));
              reg91 <= {{(&$unsigned((~wire77))),
                      (((wire79 ? wire76 : wire77) ?
                          wire77[(2'h2):(1'h0)] : reg87) ^ (&reg84[(4'hc):(2'h2)]))},
                  $unsigned({(8'hbe),
                      {(reg90 ^~ (8'hbf)), (wire78 <<< reg89)}})};
              reg92 <= (reg91[(3'h6):(1'h1)] >= ({{$signed(wire75)}} >>> {$signed((wire75 ?
                      reg83 : (8'hb1))),
                  $signed(wire78[(4'hb):(4'ha)])}));
              reg93 <= wire76;
            end
          else
            begin
              reg89 <= {($unsigned(((|reg88) ^ $unsigned(reg87))) <<< wire79[(1'h0):(1'h0)]),
                  wire76[(3'h7):(3'h4)]};
              reg90 <= ($signed(reg89) ?
                  $unsigned($signed(($unsigned(reg89) ?
                      (-wire76) : $unsigned(reg87)))) : wire79[(1'h1):(1'h1)]);
            end
          reg94 <= ($signed((wire74 ?
              (reg86 > wire79) : ((reg91 * reg83) && wire77))) * $signed($signed(wire75[(1'h0):(1'h0)])));
          reg95 <= (~|(!(-(~wire80))));
          reg96 <= reg90;
        end
      reg97 <= (^~wire79);
      reg98 <= (^(~(~^wire81)));
    end
  assign wire99 = $unsigned(({($signed(reg86) >> (~&reg95))} | reg86[(2'h3):(2'h2)]));
  assign wire100 = $unsigned((((8'hb9) + $signed(reg95)) >> $unsigned(((reg93 ?
                           reg93 : (8'ha8)) ?
                       reg92 : wire99[(4'h9):(4'h9)]))));
  assign wire101 = ((~&{wire99[(2'h3):(1'h0)],
                       $signed(wire74)}) + (~&((~|{wire79,
                       wire77}) << wire77)));
endmodule
