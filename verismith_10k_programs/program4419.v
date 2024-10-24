module top
#(parameter param216 = (+((~|(((8'ha7) ? (8'had) : (8'ha5)) != {(8'ha7)})) ? ((^{(7'h44)}) ? ({(8'hae)} ? (~&(8'hbf)) : ((8'ha0) ? (8'h9f) : (8'hb6))) : ((|(8'h9e)) ? ((8'hb2) > (8'hb1)) : (~(8'hb8)))) : (((~|(7'h42)) || ((8'ha4) | (8'hb4))) ^~ (((8'ha9) ? (7'h41) : (8'ha5)) ? {(8'haa)} : (8'hb7))))), 
parameter param217 = (({((param216 ^~ param216) <= ((8'hb0) & param216)), param216} << ((~^(param216 ? param216 : param216)) ? {{(8'haf), param216}} : ((param216 >= (8'hb6)) ? param216 : (&(8'h9c))))) ? {(param216 ? param216 : param216), ((~|(~param216)) <<< ((param216 ? (8'hb0) : param216) >>> param216))} : ((((^~(8'haa)) ? (param216 ? param216 : param216) : (param216 ? param216 : param216)) ? ((param216 ? param216 : param216) <= (~^param216)) : param216) ? (((param216 >= param216) ? (8'hb7) : ((8'ha9) ? (7'h43) : param216)) << ((param216 ^ param216) ? (!param216) : param216)) : (((param216 <<< param216) ~^ (^~param216)) ? ((+(8'ha2)) ? {param216, param216} : {param216, param216}) : param216))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire215;
  wire [(4'hf):(1'h0)] wire210;
  wire [(4'hc):(1'h0)] wire209;
  wire [(5'h15):(1'h0)] wire208;
  wire signed [(3'h7):(1'h0)] wire207;
  wire [(3'h7):(1'h0)] wire206;
  wire [(5'h12):(1'h0)] wire204;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire212;
  wire [(2'h2):(1'h0)] wire213;
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire215,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 wire204,
                 wire39,
                 wire38,
                 wire4,
                 wire5,
                 wire7,
                 wire8,
                 wire36,
                 wire212,
                 wire213,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg6,
                 (1'h0)};
  assign wire4 = ($unsigned((|(^~(wire1 ? wire2 : wire2)))) ?
                     wire1[(4'h9):(3'h4)] : wire0);
  assign wire5 = wire1[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg6 <= $unsigned(wire4);
    end
  assign wire7 = wire2;
  assign wire8 = {wire7};
  always
    @(posedge clk) begin
      reg9 <= (^{(~&$signed($unsigned(wire0)))});
      reg10 <= ((wire7[(4'h9):(1'h0)] <<< ($signed((wire7 ?
              wire4 : wire3)) ~^ wire4[(1'h0):(1'h0)])) ?
          ($unsigned(wire3[(1'h0):(1'h0)]) >> {((wire3 ? wire5 : wire5) ?
                  {reg6, wire5} : $signed((8'had))),
              (^~reg9)}) : ($signed(wire3) ?
              wire0 : (wire8 ? wire5 : (+$signed(reg6)))));
      reg11 <= reg9;
      reg12 <= (|wire4);
      reg13 <= $unsigned((^~(~|wire4[(2'h2):(2'h2)])));
    end
  module14 #() modinst37 (wire36, clk, reg11, wire7, reg9, reg6, reg10);
  assign wire38 = (wire4[(1'h0):(1'h0)] ?
                      $signed(({{wire1}, wire2[(2'h3):(1'h1)]} ?
                          wire2[(1'h0):(1'h0)] : (^~reg10[(1'h1):(1'h0)]))) : ((8'hb4) > (8'ha9)));
  assign wire39 = wire36;
  module40 #() modinst205 (.wire43(wire2), .wire44(reg6), .y(wire204), .wire45(wire7), .clk(clk), .wire41(wire4), .wire42(wire36));
  assign wire206 = (+({((|wire38) ?
                               (reg13 ? wire39 : wire36) : $unsigned(wire36)),
                           wire0[(3'h7):(3'h6)]} ?
                       $signed(wire8[(2'h3):(2'h2)]) : (wire39 << (~|wire8[(4'hf):(3'h4)]))));
  assign wire207 = $signed($signed((wire4[(4'hf):(3'h5)] - ({wire4,
                       reg9} < wire3))));
  assign wire208 = wire1;
  assign wire209 = $signed($unsigned(wire208[(3'h4):(1'h1)]));
  module40 #() modinst211 (.wire42(wire3), .wire41(wire5), .wire45(reg13), .wire43(reg6), .clk(clk), .wire44(wire204), .y(wire210));
  assign wire212 = {({(~|((8'hab) != wire1))} <= wire7[(1'h1):(1'h0)]),
                       $signed(wire8[(3'h6):(1'h1)])};
  module139 #() modinst214 (wire213, clk, wire1, wire209, wire4, reg6);
  assign wire215 = (~&wire209);
endmodule

module module40  (y, clk, wire45, wire44, wire43, wire42, wire41);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire45;
  input wire signed [(5'h12):(1'h0)] wire44;
  input wire signed [(4'he):(1'h0)] wire43;
  input wire signed [(4'hd):(1'h0)] wire42;
  input wire signed [(5'h12):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire203;
  wire signed [(3'h4):(1'h0)] wire202;
  wire [(4'ha):(1'h0)] wire201;
  wire signed [(2'h2):(1'h0)] wire200;
  wire [(2'h2):(1'h0)] wire199;
  wire signed [(5'h14):(1'h0)] wire198;
  wire signed [(4'h8):(1'h0)] wire197;
  wire signed [(5'h15):(1'h0)] wire196;
  wire signed [(4'hd):(1'h0)] wire195;
  wire signed [(5'h10):(1'h0)] wire189;
  wire [(5'h15):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire134;
  wire signed [(5'h11):(1'h0)] wire133;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire117;
  reg signed [(4'ha):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg191 = (1'h0);
  reg [(5'h12):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg131 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(4'hf):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(4'h9):(1'h0)] reg126 = (1'h0);
  reg [(4'h9):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire189,
                 wire135,
                 wire134,
                 wire133,
                 wire119,
                 wire59,
                 wire46,
                 wire117,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg138,
                 reg137,
                 reg136,
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
                 reg120,
                 (1'h0)};
  assign wire46 = $unsigned($signed({(~&$signed((8'hb3))), (8'hb6)}));
  module47 #() modinst60 (.wire51(wire45), .wire49(wire42), .y(wire59), .clk(clk), .wire50(wire41), .wire52(wire46), .wire48(wire44));
  module61 #() modinst118 (.y(wire117), .clk(clk), .wire63(wire42), .wire64(wire43), .wire66(wire46), .wire65(wire45), .wire62(wire59));
  assign wire119 = $unsigned(wire41[(5'h10):(4'hd)]);
  always
    @(posedge clk) begin
      reg120 <= wire43;
      if ({$signed($signed($unsigned((wire59 >>> wire43)))),
          (((~$signed(wire44)) == (wire44 ? $signed(wire45) : {reg120})) ?
              ((!(wire45 ? wire46 : wire59)) ?
                  ((wire46 == wire117) + $signed(wire46)) : ($unsigned(wire44) ?
                      (wire44 ?
                          wire117 : reg120) : $signed(wire42))) : (wire42[(4'h8):(1'h1)] < ($unsigned(wire45) ?
                  ((8'hbb) == wire46) : (wire45 ? wire45 : wire117))))})
        begin
          reg121 <= ((~^({$unsigned(wire43)} ?
                  (&wire44[(3'h6):(3'h5)]) : $signed((^~wire59)))) ?
              (wire117[(4'ha):(1'h0)] > (8'hb3)) : (-$unsigned(((~^wire59) ?
                  (wire46 ? wire43 : wire41) : (wire45 ? wire117 : reg120)))));
          reg122 <= $signed(($signed((&(wire45 << wire43))) ?
              (~^{reg121[(4'hc):(4'hc)],
                  (wire42 - wire42)}) : $signed((+reg121))));
          if ($unsigned(((~&{(wire43 ? (8'h9e) : wire42)}) ?
              (((wire117 ? wire44 : wire59) ?
                  reg121[(3'h5):(3'h4)] : wire41) - ((8'ha8) > $signed(wire46))) : wire59[(3'h4):(1'h0)])))
            begin
              reg123 <= ((^~$unsigned(($unsigned(reg122) ?
                  (~wire44) : wire119[(4'h8):(3'h4)]))) == reg122[(2'h2):(2'h2)]);
              reg124 <= wire42;
              reg125 <= (wire41[(3'h6):(1'h0)] ^ wire59[(5'h11):(4'ha)]);
              reg126 <= (~($unsigned($unsigned(wire117[(3'h6):(2'h3)])) || {($signed((8'hb8)) ^ (reg121 + wire117))}));
            end
          else
            begin
              reg123 <= wire42;
              reg124 <= $signed(((wire43[(3'h6):(1'h1)] ?
                  reg125 : (~&(reg120 ~^ wire42))) == (($signed(wire117) & wire59) ~^ (8'hab))));
            end
          if ((7'h40))
            begin
              reg127 <= $unsigned(reg126[(1'h1):(1'h0)]);
              reg128 <= reg124;
              reg129 <= (wire119 ?
                  (!$unsigned({(wire46 ? (8'hae) : wire42)})) : reg124);
              reg130 <= wire117;
            end
          else
            begin
              reg127 <= reg127;
              reg128 <= $unsigned({($unsigned((wire44 + (8'h9e))) ?
                      (((8'hb4) ? reg130 : wire46) ?
                          reg121 : reg128) : $unsigned({reg130}))});
              reg129 <= (($unsigned(wire41[(4'h9):(3'h6)]) + ((wire41[(1'h0):(1'h0)] ?
                          $unsigned(wire44) : $unsigned(reg123)) ?
                      ($signed((8'hab)) - reg124[(2'h2):(1'h0)]) : $signed((wire119 ?
                          reg120 : reg121)))) ?
                  $unsigned(wire45[(3'h4):(3'h4)]) : (reg126[(2'h2):(1'h1)] ?
                      reg123 : {($signed(wire43) ?
                              wire45 : ((8'ha8) ? wire119 : wire59)),
                          $signed(wire46[(4'hf):(4'hc)])}));
            end
          reg131 <= ((~(~((wire45 | reg124) ?
              ((8'hb6) ?
                  reg129 : (8'hae)) : (^~reg128)))) <= $unsigned(((^~wire117) == reg123)));
        end
      else
        begin
          reg121 <= (+wire119[(3'h6):(2'h2)]);
          if (reg121[(3'h5):(1'h0)])
            begin
              reg122 <= $signed((+reg120[(2'h3):(2'h3)]));
              reg123 <= (+$unsigned((&reg127[(3'h4):(2'h2)])));
              reg124 <= {reg121};
              reg125 <= (wire45 >> $unsigned({{(wire59 ? reg120 : wire41)}}));
            end
          else
            begin
              reg122 <= $unsigned({reg126, wire43[(4'ha):(3'h5)]});
              reg123 <= (reg128[(5'h14):(2'h2)] ^ ({reg122[(3'h4):(3'h4)],
                      (|(wire42 || reg129))} ?
                  $unsigned($unsigned(reg130[(3'h4):(1'h0)])) : (~^$unsigned((reg125 >>> wire46)))));
              reg124 <= ((~($signed({reg121}) ?
                  reg129 : wire46[(3'h4):(3'h4)])) != $unsigned((^~wire45[(4'h9):(2'h2)])));
            end
          reg126 <= $signed($signed((wire44[(3'h5):(2'h2)] << wire119)));
          if (({(wire59 ?
                  ($unsigned(wire44) < $unsigned(reg130)) : $signed((wire46 ?
                      reg120 : wire44))),
              $unsigned((wire44[(4'h8):(4'h8)] <<< reg124))} >>> (wire45[(1'h0):(1'h0)] | (-reg127))))
            begin
              reg127 <= ($unsigned({(wire117[(4'h9):(3'h7)] <= $unsigned(reg124)),
                  $unsigned(wire44)}) >>> reg129[(4'hd):(2'h3)]);
              reg128 <= ((wire45 * {$signed((~|reg127)),
                  $signed(reg120)}) * $unsigned((wire46[(4'he):(4'hc)] * reg127)));
              reg129 <= $unsigned((8'ha9));
              reg130 <= (({reg131, {(|reg131)}} ?
                      $unsigned((reg129[(4'h8):(3'h7)] << wire42)) : reg126[(1'h1):(1'h0)]) ?
                  $signed((~|reg130[(1'h0):(1'h0)])) : $signed({$signed((wire41 * reg130))}));
              reg131 <= ((~|{((wire42 ?
                          (8'h9e) : wire117) + ((7'h44) << wire117)),
                      $unsigned($unsigned(wire119))}) ?
                  reg122[(3'h4):(2'h2)] : (8'hb9));
            end
          else
            begin
              reg127 <= $unsigned(($signed(reg123) ?
                  $signed($unsigned(((8'hb0) | reg130))) : {(+(^~reg120)),
                      {(reg131 | wire46)}}));
            end
        end
      reg132 <= reg126;
    end
  assign wire133 = $signed($unsigned(wire46[(3'h4):(2'h3)]));
  assign wire134 = wire133[(4'h9):(3'h7)];
  assign wire135 = $signed((+($signed((reg130 + reg125)) << $unsigned($unsigned(reg130)))));
  always
    @(posedge clk) begin
      reg136 <= $unsigned($signed($unsigned(wire133)));
      reg137 <= wire59;
      reg138 <= {$unsigned(reg131), (!wire44[(5'h12):(5'h11)])};
    end
  module139 #() modinst190 (.wire141(reg128), .wire140(reg122), .y(wire189), .wire142(reg137), .wire143(reg129), .clk(clk));
  always
    @(posedge clk) begin
      reg191 <= wire44[(3'h7):(3'h6)];
      reg192 <= (8'hb1);
      reg193 <= $signed((reg127 ?
          $signed((wire59[(4'hb):(3'h4)] ~^ (wire43 || reg131))) : wire42[(4'hc):(2'h2)]));
      reg194 <= reg120;
    end
  assign wire195 = $signed({reg194[(3'h5):(2'h2)]});
  assign wire196 = $unsigned(($signed($signed($unsigned(wire44))) ?
                       reg121[(4'hb):(1'h1)] : (((^~reg192) ?
                               (wire189 >> wire46) : $unsigned(wire135)) ?
                           reg131[(4'ha):(1'h1)] : $unsigned(wire195))));
  assign wire197 = ((^~((^(8'ha8)) ?
                       wire119[(1'h0):(1'h0)] : wire189[(2'h2):(2'h2)])) == ((|(wire195[(1'h0):(1'h0)] ?
                       wire59[(3'h6):(3'h5)] : (^wire117))) >= ($unsigned($signed((8'ha9))) - {(-reg194),
                       (wire41 > wire196)})));
  assign wire198 = reg130;
  assign wire199 = wire189[(4'hc):(4'h8)];
  assign wire200 = $unsigned(wire45);
  assign wire201 = (+$signed($unsigned(reg131)));
  assign wire202 = ($unsigned(reg128) ?
                       reg131[(3'h6):(2'h2)] : {wire43,
                           $unsigned((wire196[(4'hf):(4'hc)] ?
                               $signed(reg193) : wire117))});
  assign wire203 = (8'hba);
endmodule

module module14
#(parameter param34 = {(~&(~((!(8'ha5)) ? (-(8'hae)) : (~(8'hb6))))), (((((8'hbf) ? (8'ha9) : (8'ha5)) ? ((8'hbe) ? (8'hb6) : (8'h9e)) : (^(8'ha5))) | {(&(8'hab)), ((8'hb7) ? (8'ha5) : (8'hbc))}) << ((-(!(8'haf))) ? (8'hb1) : (+{(8'haf)})))}, 
parameter param35 = {(~&(param34 ? ((param34 ? param34 : param34) != {param34}) : ((param34 ? param34 : (7'h41)) >>> ((8'hb8) < param34)))), (+param34)})
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(4'hc):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire [(5'h12):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire [(5'h11):(1'h0)] wire29;
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  assign y = {wire33,
                 wire32,
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
      reg20 <= ($unsigned((^wire18[(1'h1):(1'h1)])) >= (8'hbc));
      reg21 <= (|((wire18[(3'h4):(1'h0)] ?
              (-wire16[(4'hb):(3'h7)]) : (~(wire19 ? wire17 : wire15))) ?
          ($unsigned((~&wire19)) ?
              wire19[(4'h8):(3'h6)] : (^(~&(7'h40)))) : ((((8'hb5) ?
                      (7'h42) : wire17) ?
                  (wire18 ? wire15 : wire16) : (8'hb7)) ?
              $signed((8'hbd)) : ((!wire18) & wire15))));
      reg22 <= {(^~wire19), $unsigned(reg21[(1'h1):(1'h1)])};
      reg23 <= $signed(reg20);
    end
  always
    @(posedge clk) begin
      reg24 <= (wire16[(4'hb):(3'h6)] > reg22[(5'h10):(3'h7)]);
      reg25 <= $unsigned((~&{(wire17[(1'h1):(1'h1)] ?
              wire16[(3'h5):(2'h2)] : $unsigned(reg21)),
          $signed((^wire19))}));
    end
  always
    @(posedge clk) begin
      reg26 <= (((+{wire19[(4'hb):(2'h3)]}) ?
          (($unsigned(reg25) << $unsigned(reg24)) <= {$signed((8'hb9)),
              $signed(wire19)}) : wire17) ^~ {(((wire19 == reg24) ?
              $unsigned(wire16) : wire17) + ((reg21 & wire16) ?
              $signed(wire17) : (reg22 ? (8'hbf) : reg23)))});
      reg27 <= (reg24[(1'h1):(1'h1)] ?
          $unsigned(wire15[(1'h0):(1'h0)]) : ($signed({$signed(reg21)}) ^ $signed(wire16)));
      reg28 <= wire19;
    end
  assign wire29 = (^reg21);
  assign wire30 = wire16[(5'h11):(4'hb)];
  assign wire31 = reg21[(2'h3):(2'h3)];
  assign wire32 = wire29;
  assign wire33 = (~(reg28 && {($signed(wire30) - (!wire15))}));
endmodule

module module139
#(parameter param187 = {(({{(7'h41), (8'ha0)}, ((8'hb0) ? (8'ha5) : (7'h40))} ? (+{(8'ha5)}) : {((8'hab) && (8'ha0)), ((8'hb1) ? (7'h42) : (8'ha4))}) != {(~&((8'hbb) ? (8'h9f) : (8'hab)))})}, 
parameter param188 = ((((^~(~^(8'hb7))) - ({param187} != (~|(8'hb9)))) ? (&(~|(param187 ? (8'h9d) : (8'hb7)))) : (~(!((8'hb2) ? (8'ha5) : param187)))) ? {{param187, param187}} : ((~&(((8'hb9) <= param187) ? param187 : ((8'haf) > param187))) ? {(~&(param187 ? param187 : param187))} : ({{param187}} * ((&param187) ? param187 : (param187 ? param187 : param187))))))
(y, clk, wire143, wire142, wire141, wire140);
  output wire [(32'h1e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire143;
  input wire signed [(3'h5):(1'h0)] wire142;
  input wire signed [(2'h3):(1'h0)] wire141;
  input wire [(3'h4):(1'h0)] wire140;
  wire [(4'hf):(1'h0)] wire186;
  wire [(2'h3):(1'h0)] wire166;
  wire signed [(5'h14):(1'h0)] wire165;
  wire signed [(2'h3):(1'h0)] wire147;
  wire [(3'h7):(1'h0)] wire146;
  wire signed [(4'hf):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  reg [(3'h4):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(4'hc):(1'h0)] reg183 = (1'h0);
  reg [(4'he):(1'h0)] reg182 = (1'h0);
  reg [(4'h9):(1'h0)] reg181 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg180 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg178 = (1'h0);
  reg [(5'h10):(1'h0)] reg177 = (1'h0);
  reg [(5'h12):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg175 = (1'h0);
  reg [(3'h4):(1'h0)] reg174 = (1'h0);
  reg [(4'he):(1'h0)] reg173 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg [(5'h13):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(3'h7):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  assign y = {wire186,
                 wire166,
                 wire165,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
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
                 reg148,
                 (1'h0)};
  assign wire144 = (-{$unsigned((~|(~wire142)))});
  assign wire145 = wire144[(2'h2):(2'h2)];
  assign wire146 = wire144[(2'h3):(2'h3)];
  assign wire147 = wire141;
  always
    @(posedge clk) begin
      reg148 <= $signed((($unsigned(wire146) ?
              ((wire146 + wire140) ?
                  (wire146 | (8'hbb)) : $signed((8'hbc))) : $unsigned(wire142[(3'h5):(1'h0)])) ?
          wire144[(3'h4):(2'h2)] : (|wire140[(2'h2):(1'h1)])));
    end
  always
    @(posedge clk) begin
      if ((~^wire147[(1'h1):(1'h0)]))
        begin
          reg149 <= $unsigned({{$signed((!wire144)),
                  ({wire142} != wire143[(4'h9):(1'h1)])},
              $signed($signed((wire140 ? wire141 : wire144)))});
          if (wire147)
            begin
              reg150 <= $unsigned(((wire142 - ($unsigned(wire143) ^~ ((8'ha5) + wire147))) ?
                  $signed((reg148[(4'hd):(3'h5)] ?
                      {(8'haa), wire147} : (-reg149))) : $unsigned(reg149)));
              reg151 <= $signed((^((~&$signed(wire143)) ?
                  $unsigned((7'h44)) : (+$signed(reg149)))));
            end
          else
            begin
              reg150 <= ((reg151 ?
                  wire141[(1'h0):(1'h0)] : (&wire142)) | wire145[(3'h5):(2'h3)]);
              reg151 <= (|(reg151 + (($unsigned(wire141) - (~reg148)) ~^ ((wire140 ?
                  (8'hba) : wire144) == (reg151 ? reg149 : reg151)))));
              reg152 <= reg148[(3'h6):(1'h1)];
              reg153 <= {(wire142[(1'h1):(1'h1)] ?
                      ($unsigned($unsigned(wire142)) <= wire144) : (&reg152[(1'h1):(1'h1)])),
                  $unsigned((wire142[(1'h0):(1'h0)] ?
                      $signed($signed(reg149)) : (+$unsigned(reg152))))};
              reg154 <= wire144[(1'h1):(1'h0)];
            end
          reg155 <= $unsigned($signed(((|wire144) ?
              $unsigned($signed((8'h9e))) : ($unsigned(reg150) <= (reg153 ?
                  (8'hbd) : reg149)))));
          reg156 <= reg151[(1'h1):(1'h1)];
          reg157 <= wire147[(2'h3):(1'h0)];
        end
      else
        begin
          reg149 <= ($signed((&$unsigned($unsigned(wire146)))) ?
              (reg150 || (((reg149 ? reg149 : reg151) - $signed((8'had))) ?
                  $signed({reg148}) : ((reg153 ?
                      reg148 : (8'ha4)) < (^~wire147)))) : $unsigned(reg152[(4'hf):(4'hd)]));
          reg150 <= (wire141[(2'h2):(2'h2)] ?
              wire144[(2'h3):(1'h0)] : ((reg148[(4'ha):(3'h4)] ?
                      ((7'h44) ?
                          ((7'h43) ?
                              reg153 : wire142) : $signed((8'hb6))) : ({wire140,
                          reg154} || reg148)) ?
                  ((~&$signed(reg157)) < wire140[(2'h2):(1'h0)]) : (wire141 ?
                      (|wire145[(4'hd):(4'hb)]) : reg150)));
          if ((~^($unsigned(reg153[(5'h10):(3'h4)]) * {$signed($unsigned(wire147)),
              $signed($signed(reg157))})))
            begin
              reg151 <= $signed(((+{reg153[(1'h0):(1'h0)],
                  $unsigned(reg148)}) >>> ((~^reg154) && wire142[(3'h4):(3'h4)])));
              reg152 <= ($signed(reg151[(1'h1):(1'h0)]) + ($signed(((reg154 ?
                  reg154 : reg153) << {wire140,
                  reg151})) <<< wire142[(1'h1):(1'h0)]));
              reg153 <= (-(!(reg149[(5'h10):(4'ha)] | reg150[(1'h0):(1'h0)])));
              reg154 <= (8'ha3);
              reg155 <= reg151;
            end
          else
            begin
              reg151 <= (~^(((-(reg153 ? wire143 : reg156)) ?
                      (^~$signed(wire140)) : wire142) ?
                  wire146 : (~reg153[(4'hb):(4'ha)])));
              reg152 <= reg157[(1'h1):(1'h1)];
              reg153 <= $signed((reg156[(3'h5):(1'h1)] * (~&(~reg148))));
              reg154 <= $unsigned(reg155[(1'h0):(1'h0)]);
            end
        end
      reg158 <= $unsigned(wire142[(2'h2):(1'h1)]);
      reg159 <= (-((reg154[(2'h2):(1'h0)] <<< (|(reg149 ?
          wire146 : reg154))) >>> $unsigned($unsigned($signed(wire146)))));
      if (reg154[(4'hb):(3'h5)])
        begin
          reg160 <= reg159;
          reg161 <= (^$signed($unsigned(($signed(reg154) << wire143))));
        end
      else
        begin
          reg160 <= ((wire143[(3'h4):(1'h0)] ?
              wire146[(3'h5):(2'h3)] : $signed(({reg159} ?
                  (!wire144) : (wire141 ?
                      reg154 : wire146)))) << $unsigned(wire145[(1'h1):(1'h0)]));
          reg161 <= ((8'ha6) <= (8'hab));
        end
    end
  always
    @(posedge clk) begin
      reg162 <= $signed($unsigned($signed(reg151)));
      reg163 <= reg158;
      reg164 <= (($signed(((reg158 * (8'hac)) << (!reg148))) >>> ({wire147[(2'h3):(1'h1)]} <= reg159)) < reg150);
    end
  assign wire165 = (~{(~|reg154[(5'h10):(4'h8)]),
                       (wire142[(3'h5):(2'h3)] || $unsigned($unsigned(reg156)))});
  assign wire166 = $signed($unsigned($unsigned($unsigned(((7'h43) ?
                       reg150 : (8'hbd))))));
  always
    @(posedge clk) begin
      reg167 <= $unsigned($signed(reg164[(3'h6):(3'h5)]));
      reg168 <= ($signed($signed((!$signed(reg167)))) ?
          (wire165 && ($unsigned($signed(reg163)) | $signed((~reg161)))) : $signed(reg156));
      if ({$unsigned($unsigned(({reg162} ? reg162 : wire141[(1'h0):(1'h0)]))),
          reg168[(3'h5):(1'h1)]})
        begin
          if ($unsigned(reg150))
            begin
              reg169 <= {((&{(reg164 ? reg154 : reg167),
                      (wire143 * reg153)}) & {((8'ha8) ? wire141 : reg158),
                      $signed((reg164 ? (8'hab) : wire145))}),
                  reg149};
              reg170 <= wire146[(1'h0):(1'h0)];
              reg171 <= (~^$signed($unsigned((^(reg168 ^ (7'h42))))));
              reg172 <= $signed($unsigned($unsigned(($signed(reg159) ?
                  (|wire141) : (!reg149)))));
              reg173 <= (|(($signed((^~reg154)) ?
                  wire141 : {wire141[(2'h2):(1'h0)]}) != reg162[(3'h4):(1'h0)]));
            end
          else
            begin
              reg169 <= reg156[(4'hd):(1'h0)];
              reg170 <= (reg153[(3'h5):(3'h4)] >= (~wire140));
              reg171 <= wire141;
              reg172 <= wire144;
            end
          if ((|(!$unsigned(reg173[(4'he):(3'h4)]))))
            begin
              reg174 <= ($signed(reg151[(4'h8):(2'h2)]) ?
                  ((reg163[(3'h5):(3'h5)] >> ($unsigned((8'ha6)) <<< (8'ha5))) == (reg159 ?
                      (reg161 ^~ reg161[(3'h7):(3'h6)]) : $signed(((8'ha6) ?
                          reg149 : reg155)))) : (-$signed(reg151)));
            end
          else
            begin
              reg174 <= $signed(reg162);
            end
        end
      else
        begin
          reg169 <= reg170;
        end
      if (wire147[(2'h2):(1'h0)])
        begin
          if ({(+reg174)})
            begin
              reg175 <= $unsigned((($unsigned((~^reg168)) ^~ $unsigned(((8'hb7) ?
                      (8'hbe) : (8'hbc)))) ?
                  {$unsigned(reg161[(1'h1):(1'h1)]),
                      reg152[(1'h0):(1'h0)]} : ((((8'hb6) < wire144) ?
                      (!reg174) : (reg171 ?
                          reg163 : reg148)) + (reg154 ~^ (~^reg153)))));
              reg176 <= $signed({((!reg167) >> reg170[(5'h12):(5'h11)])});
              reg177 <= (~^$signed((((~&reg158) ?
                  (reg149 ~^ reg175) : reg163) | wire165)));
            end
          else
            begin
              reg175 <= reg153[(5'h13):(4'ha)];
              reg176 <= reg171[(2'h3):(2'h3)];
            end
          reg178 <= (reg158 ?
              $unsigned(((reg164 + (reg159 ? reg174 : reg157)) ?
                  ((wire140 ? (8'hb1) : reg148) ?
                      (~&(8'hb8)) : (reg177 ?
                          reg162 : reg150)) : ($signed(reg164) ?
                      reg171[(4'h8):(3'h5)] : reg170))) : (+($signed($unsigned(wire140)) ?
                  $unsigned({reg163}) : $unsigned(reg158[(2'h3):(1'h0)]))));
          reg179 <= reg172[(1'h1):(1'h1)];
          reg180 <= reg179[(3'h7):(1'h1)];
        end
      else
        begin
          reg175 <= $signed((wire165[(5'h12):(4'h8)] ^ {$signed($signed(reg179))}));
          if (reg153[(3'h5):(3'h4)])
            begin
              reg176 <= $signed(wire142);
              reg177 <= $signed(reg164[(4'h9):(3'h5)]);
            end
          else
            begin
              reg176 <= $signed(((7'h41) ?
                  {(reg177[(3'h6):(1'h0)] || reg179)} : (wire147 ?
                      $signed((&wire141)) : wire165)));
              reg177 <= {(^($signed(reg176[(5'h10):(4'he)]) ?
                      $signed((-reg176)) : reg164[(4'h9):(3'h4)]))};
              reg178 <= wire141;
              reg179 <= (|$signed($signed(reg174[(1'h0):(1'h0)])));
            end
          reg180 <= wire147[(2'h2):(1'h1)];
          reg181 <= {(($signed((!reg151)) ?
                  (((8'hb8) ? reg171 : wire142) ?
                      (+(8'ha5)) : {wire140}) : {(8'h9e)}) <= (~&reg176[(5'h12):(1'h0)]))};
          if ((8'haa))
            begin
              reg182 <= (reg177[(4'h9):(3'h6)] ? $signed(reg174) : reg167);
              reg183 <= ($unsigned($unsigned(reg164)) ?
                  {(($unsigned(wire141) < reg153[(1'h0):(1'h0)]) ?
                          ($unsigned(reg167) ?
                              {reg174} : (wire144 <= wire140)) : ($signed((8'h9c)) ?
                              (~^reg160) : ((8'h9d) ?
                                  reg156 : wire141)))} : (~|((reg161 ?
                      (-reg148) : (~|reg156)) <<< reg155)));
              reg184 <= {reg164};
              reg185 <= (reg153 > $unsigned((7'h41)));
            end
          else
            begin
              reg182 <= (&(^~((~^wire147) <= ((reg159 ? reg171 : reg176) ?
                  reg159[(3'h6):(2'h2)] : (~|wire144)))));
              reg183 <= ({$unsigned((-reg171[(4'h8):(2'h2)])), wire142} ?
                  ($unsigned($unsigned((~|reg180))) << reg156) : $signed((8'hae)));
              reg184 <= $unsigned(reg180);
              reg185 <= (&($unsigned(((reg181 * reg172) ?
                      $signed(reg160) : (wire144 || (8'hbc)))) ?
                  reg158[(1'h0):(1'h0)] : $unsigned(((reg161 >>> reg181) ?
                      (!wire166) : (reg181 * wire144)))));
            end
        end
    end
  assign wire186 = reg183[(1'h0):(1'h0)];
endmodule

module module61
#(parameter param116 = ((((^{(8'ha6)}) <<< {((8'hab) ^ (8'h9c)), (~^(7'h43))}) ^ (((^(8'had)) << (~(8'hb3))) ~^ (&(|(8'had))))) & (8'ha5)))
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h227):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire66;
  input wire signed [(4'h9):(1'h0)] wire65;
  input wire [(4'he):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire63;
  input wire signed [(4'hb):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(3'h7):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire73;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  wire [(3'h7):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire88,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 (1'h0)};
  assign wire67 = wire62[(1'h1):(1'h1)];
  assign wire68 = ((^~wire64) + $unsigned(($unsigned($signed(wire66)) || wire66)));
  assign wire69 = wire65[(2'h2):(1'h0)];
  assign wire70 = $unsigned((((wire65[(2'h3):(2'h3)] != (wire69 ?
                          wire69 : wire62)) + ((wire66 ^ wire68) ?
                          (wire65 && wire66) : wire68[(1'h1):(1'h0)])) ?
                      ($unsigned($signed(wire67)) * (&(wire68 - wire66))) : (8'ha4)));
  assign wire71 = {$signed((&((wire69 >> wire63) ?
                          wire62 : $unsigned(wire67)))),
                      ((|wire70) ?
                          $signed(((~|(8'hba)) ?
                              $unsigned((7'h43)) : $unsigned(wire66))) : wire68[(3'h5):(1'h0)])};
  assign wire72 = $signed($signed((&wire64)));
  assign wire73 = (~|wire70);
  assign wire74 = ($signed(wire65[(2'h2):(2'h2)]) ?
                      wire64 : $unsigned({wire68}));
  always
    @(posedge clk) begin
      if ((wire71[(1'h0):(1'h0)] ?
          $signed($signed(wire66[(4'h8):(1'h0)])) : ($signed($unsigned({(8'ha4),
              wire62})) <<< ($signed((^~wire71)) >>> (&$signed(wire62))))))
        begin
          reg75 <= (($unsigned(wire62) ?
                  ((!(+(8'hb0))) | $signed($signed(wire66))) : $signed($signed($unsigned(wire72)))) ?
              (wire70[(2'h3):(2'h2)] ?
                  wire72 : (~$unsigned($unsigned(wire74)))) : $signed((!($signed(wire69) <<< wire62))));
          reg76 <= (reg75[(3'h5):(3'h5)] ? wire62[(4'h9):(2'h2)] : wire69);
        end
      else
        begin
          reg75 <= wire64;
          if ((wire68 || (~^$unsigned((wire63 ?
              {wire69, (8'ha5)} : $signed(wire62))))))
            begin
              reg76 <= $signed(wire63);
              reg77 <= (|wire63[(3'h7):(3'h7)]);
              reg78 <= $unsigned($unsigned($unsigned($unsigned(wire70))));
              reg79 <= (|wire67);
            end
          else
            begin
              reg76 <= $signed($signed(((wire68[(2'h3):(1'h1)] <<< (~&(8'hb4))) + ($unsigned(reg76) < wire68[(3'h5):(1'h0)]))));
              reg77 <= (~&(wire68 ?
                  (wire63[(1'h0):(1'h0)] ?
                      (~&wire71) : $unsigned($signed(wire69))) : $unsigned($unsigned($unsigned((8'hbd))))));
              reg78 <= ((~wire66) ?
                  (|(((wire71 == (8'hb7)) ? {wire73, reg79} : reg77) ?
                      wire68 : wire74)) : (8'hb6));
              reg79 <= (wire69[(4'h9):(3'h7)] ?
                  $signed(reg77[(3'h6):(1'h1)]) : ($unsigned((8'hb8)) ?
                      $unsigned(wire64[(1'h1):(1'h1)]) : ((|$unsigned(wire69)) < $unsigned((wire66 ?
                          reg75 : wire62)))));
              reg80 <= $signed(wire67[(4'h9):(3'h4)]);
            end
          reg81 <= {(~^$unsigned($unsigned(wire64[(4'hc):(4'h9)])))};
          if ($unsigned((8'hbc)))
            begin
              reg82 <= ($signed($unsigned(reg75)) <<< (~^(~(wire73[(1'h1):(1'h0)] ~^ $signed(reg79)))));
              reg83 <= $signed((($signed(wire68[(1'h0):(1'h0)]) != ({wire67,
                      wire65} ?
                  reg78 : {wire74})) ^~ wire67));
            end
          else
            begin
              reg82 <= wire67;
              reg83 <= {$signed((8'ha8)), reg82};
              reg84 <= $unsigned(reg75);
            end
        end
      reg85 <= (((reg80[(3'h6):(1'h1)] != $signed(reg78)) ?
              wire70[(3'h5):(2'h2)] : (~^((&wire68) ?
                  (reg80 ? wire70 : wire63) : $signed(wire69)))) ?
          $signed(reg82) : ($unsigned({$signed(wire67),
              reg83[(2'h2):(2'h2)]}) << (^wire63[(3'h7):(3'h7)])));
      reg86 <= reg83[(3'h6):(3'h5)];
      reg87 <= wire72[(4'h8):(3'h5)];
    end
  assign wire88 = wire73[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg89 <= wire72;
      if (wire70[(3'h5):(2'h2)])
        begin
          reg90 <= wire66;
          reg91 <= $signed((~&wire68));
          reg92 <= wire63;
          reg93 <= $signed((wire74[(2'h2):(1'h0)] ?
              ((+(wire72 ? reg90 : reg82)) >= ((^reg87) ?
                  $signed(reg79) : (reg77 ^ wire69))) : $signed($signed(reg75))));
          reg94 <= (-(-({wire63[(3'h7):(2'h3)],
              $unsigned((8'ha2))} >>> $unsigned($signed(reg79)))));
        end
      else
        begin
          reg90 <= $unsigned(reg94);
        end
      reg95 <= wire69;
      if (reg89)
        begin
          if ($unsigned(({(wire74[(1'h0):(1'h0)] ?
                  wire63[(2'h3):(2'h3)] : (reg89 ^~ reg78))} + $signed((^~wire62)))))
            begin
              reg96 <= {reg81[(4'h9):(3'h4)]};
              reg97 <= {$signed($signed(((~|reg93) ? wire74 : $signed(reg78)))),
                  ({$unsigned((8'h9e)),
                      ((wire88 ? reg96 : reg77) ?
                          $signed(wire69) : (reg81 - wire73))} || {$unsigned($unsigned((8'ha2)))})};
            end
          else
            begin
              reg96 <= (~&($unsigned((~&$signed((8'hb3)))) < (&reg82)));
              reg97 <= ($unsigned({((reg91 ~^ wire74) ?
                          $unsigned(wire64) : (reg83 && wire73))}) ?
                  wire88 : (wire66 ~^ (reg91 ? wire88 : (^~(reg82 < wire64)))));
              reg98 <= $unsigned((|$unsigned($unsigned($unsigned(reg87)))));
              reg99 <= {{$signed(wire62),
                      (wire64 ?
                          ((reg91 == wire65) ?
                              (^~(8'ha6)) : wire68[(2'h2):(2'h2)]) : (&$signed(wire65)))},
                  (reg81[(3'h7):(2'h3)] ?
                      (-$unsigned($unsigned(reg77))) : $unsigned($signed((~&reg86))))};
              reg100 <= {reg83[(1'h0):(1'h0)]};
            end
          if ((reg89[(4'hd):(2'h3)] << $unsigned($signed((reg89[(5'h11):(1'h1)] ?
              (~&reg99) : wire65)))))
            begin
              reg101 <= (|(^~$unsigned((reg90 ?
                  $signed(wire67) : $unsigned(reg99)))));
              reg102 <= wire72[(2'h2):(1'h1)];
              reg103 <= (wire66 != $unsigned((((reg87 ^~ reg91) | wire65) || $unsigned((|(8'hb1))))));
              reg104 <= reg100;
              reg105 <= $unsigned((($unsigned((~^reg87)) ?
                  $signed({wire88, wire67}) : ($unsigned(reg75) && (wire68 ?
                      wire67 : reg96))) >= (($signed(wire69) ?
                      reg98 : $unsigned(wire71)) ?
                  (~^$unsigned(reg89)) : (8'hba))));
            end
          else
            begin
              reg101 <= reg100[(3'h6):(2'h3)];
              reg102 <= $unsigned(((8'ha7) && {(~|(wire63 >> reg85)),
                  $unsigned($signed(reg76))}));
            end
        end
      else
        begin
          reg96 <= $unsigned((reg94 <= $signed((~{reg86}))));
          reg97 <= ($unsigned((((reg97 != wire65) && reg75[(4'ha):(1'h1)]) ^~ $signed($signed((8'hbe))))) - {(reg76 ?
                  ((wire88 ~^ wire69) ?
                      (^~reg95) : {reg100, reg90}) : (~|$unsigned(reg103)))});
          if (wire67[(1'h0):(1'h0)])
            begin
              reg98 <= (!wire63[(1'h0):(1'h0)]);
              reg99 <= ((^$unsigned(reg82[(2'h3):(2'h2)])) ?
                  $signed((|reg75[(1'h1):(1'h0)])) : ((~^$signed((reg81 ?
                          wire71 : reg90))) ?
                      reg97[(3'h5):(2'h3)] : $signed($signed((reg105 << reg96)))));
              reg100 <= (reg102 + ($signed((~$unsigned(reg101))) ?
                  $signed((reg93 ?
                      $signed(wire66) : (reg95 != wire70))) : {$unsigned((reg82 ?
                          (8'hba) : reg98)),
                      $signed(wire62[(4'hb):(2'h2)])}));
              reg101 <= (+reg81);
            end
          else
            begin
              reg98 <= $signed(($signed($signed((reg103 ? wire68 : (8'hab)))) ?
                  (((reg84 ? reg99 : wire67) ?
                      $signed(reg83) : (8'ha3)) ^~ (|$unsigned(reg104))) : {(7'h44),
                      (^(wire67 >= reg85))}));
              reg99 <= (~($signed(((reg82 ? reg87 : reg101) ?
                      $unsigned(wire70) : (reg98 != reg82))) ?
                  $unsigned(($signed((8'hb1)) ^ wire88)) : (reg96 ?
                      wire66 : (^~wire68))));
              reg100 <= reg92[(3'h4):(3'h4)];
              reg101 <= $unsigned($unsigned($signed(($unsigned(reg95) <<< $unsigned(reg104)))));
              reg102 <= ((wire71 ?
                  wire88[(3'h7):(2'h3)] : ((8'ha7) + (&(-reg80)))) >>> {$unsigned((^~reg77[(2'h2):(2'h2)]))});
            end
        end
    end
  assign wire106 = (reg89 ?
                       ((^(-$unsigned(reg87))) == ($unsigned(((8'ha0) > reg83)) ?
                           (((8'ha9) ? reg76 : wire71) ?
                               (~|reg92) : reg80) : $unsigned((wire64 ?
                               (8'hb5) : wire73)))) : {wire74[(3'h4):(3'h4)]});
  assign wire107 = reg97;
  assign wire108 = (($signed(reg76) ?
                           ($signed((wire73 > (8'ha3))) || wire66) : wire107[(1'h1):(1'h0)]) ?
                       reg94 : ((8'ha0) ?
                           $signed(reg95[(2'h3):(2'h3)]) : (((~^wire70) ?
                                   (reg102 ? reg100 : (8'h9f)) : {wire72,
                                       (8'ha3)}) ?
                               ((reg78 > reg83) ?
                                   (|reg84) : $unsigned(wire107)) : {((7'h40) ?
                                       reg94 : (8'hbc)),
                                   (reg76 ? (8'hbe) : (8'hb9))})));
  assign wire109 = ((^$unsigned($signed(reg96))) ?
                       $unsigned(wire72) : $signed(wire108[(5'h11):(4'h9)]));
  assign wire110 = (~^reg92[(3'h5):(1'h0)]);
  assign wire111 = $signed((~^$signed(((^reg91) ^ $unsigned(reg78)))));
  assign wire112 = reg79[(2'h3):(2'h2)];
  assign wire113 = (8'hb6);
  assign wire114 = reg75;
  assign wire115 = ((wire74 != (((8'hb5) | reg91) ^ (((8'h9d) ?
                               (7'h40) : wire65) ?
                           wire113[(2'h2):(2'h2)] : wire62[(4'h8):(1'h1)]))) ?
                       reg81[(1'h1):(1'h0)] : (+(reg105 & $signed(reg98[(4'hb):(4'h9)]))));
endmodule

module module47  (y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire52;
  input wire signed [(4'ha):(1'h0)] wire51;
  input wire [(5'h12):(1'h0)] wire50;
  input wire signed [(4'hb):(1'h0)] wire49;
  input wire [(5'h12):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire57;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  assign y = {wire58, wire57, wire56, wire55, wire54, wire53, (1'h0)};
  assign wire53 = (~^wire50[(4'he):(4'ha)]);
  assign wire54 = ({(($unsigned(wire51) ~^ wire52[(4'hb):(1'h0)]) ?
                          ((wire50 ? wire49 : wire51) ?
                              $unsigned(wire50) : (wire49 ^ wire50)) : (8'ha7))} ~^ $unsigned(((8'hae) ?
                      ($unsigned(wire48) ^ {wire52, (8'hbe)}) : wire49)));
  assign wire55 = $unsigned({wire52,
                      ((8'hb8) ?
                          (wire51 ? $unsigned(wire48) : {wire49}) : ({wire54,
                              (8'haa)} > wire51[(2'h2):(2'h2)]))});
  assign wire56 = $unsigned(wire53);
  assign wire57 = (-($unsigned((wire56[(3'h5):(3'h5)] ?
                      $unsigned(wire50) : $signed(wire51))) | $signed((&wire54[(5'h10):(4'h9)]))));
  assign wire58 = $unsigned((+($signed((wire56 << wire57)) ?
                      wire56[(3'h4):(1'h0)] : (wire56 || (wire48 > wire48)))));
endmodule
