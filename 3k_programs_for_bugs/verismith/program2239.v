module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire181;
  wire signed [(5'h15):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire signed [(3'h7):(1'h0)] wire178;
  wire signed [(4'hf):(1'h0)] wire168;
  wire [(4'h9):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire166;
  wire signed [(4'hd):(1'h0)] wire148;
  wire signed [(4'hf):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire172;
  wire signed [(4'h9):(1'h0)] wire176;
  reg [(2'h3):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg164 = (1'h0);
  reg [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg162 = (1'h0);
  reg [(2'h2):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg157 = (1'h0);
  reg [(4'he):(1'h0)] reg156 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg [(4'hc):(1'h0)] reg153 = (1'h0);
  reg [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(3'h5):(1'h0)] reg174 = (1'h0);
  reg [(5'h12):(1'h0)] reg175 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire168,
                 wire167,
                 wire166,
                 wire148,
                 wire89,
                 wire170,
                 wire172,
                 wire176,
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
                 reg173,
                 reg174,
                 reg175,
                 (1'h0)};
  module5 #() modinst90 (.clk(clk), .y(wire89), .wire9(wire4), .wire8(wire2), .wire6(wire1), .wire7(wire0));
  module91 #() modinst149 (wire148, clk, wire0, wire89, wire3, wire2);
  always
    @(posedge clk) begin
      if ((((wire148 <= wire0[(4'h9):(3'h7)]) ?
          (($unsigned(wire148) & (wire148 <<< wire3)) ?
              (wire89[(2'h3):(1'h1)] * (^~wire2)) : $signed((+wire2))) : $unsigned({(wire3 & wire0),
              (wire4 > wire1)})) || ({wire89,
          ((wire4 - wire89) ?
              $signed(wire2) : wire0)} >>> ($unsigned((-wire2)) ?
          (~wire4) : ($signed(wire2) >= {wire0})))))
        begin
          if ($unsigned($signed(($unsigned(wire0) ?
              wire89[(2'h2):(1'h1)] : wire2[(4'hb):(1'h0)]))))
            begin
              reg150 <= (wire3 ?
                  ($signed((&(wire89 ? wire0 : wire1))) ?
                      $unsigned($unsigned(wire0)) : $unsigned(wire148[(3'h4):(1'h0)])) : ((((wire3 ?
                          (8'ha8) : wire0) || $signed(wire4)) ^ wire0[(5'h12):(4'hf)]) ?
                      $signed((&wire89[(4'h8):(3'h6)])) : (8'hbc)));
              reg151 <= $unsigned(wire1);
              reg152 <= $unsigned((((^{wire148}) ?
                  ({reg150} >>> (!wire3)) : reg150) ^~ $signed({(-(8'ha9)),
                  wire2[(4'hc):(4'h8)]})));
            end
          else
            begin
              reg150 <= $unsigned({$unsigned(reg152[(4'hd):(2'h3)])});
              reg151 <= {$unsigned(($signed($unsigned(reg150)) ~^ {{wire148}})),
                  $unsigned($signed(($signed((8'hb6)) || $signed((8'hae)))))};
              reg152 <= (wire148 << $signed($signed(reg152[(4'h8):(3'h6)])));
              reg153 <= (reg151 ?
                  (wire4 ?
                      $signed((reg152 ?
                          ((8'hb9) == reg150) : $signed((8'hb5)))) : $signed($signed((8'ha4)))) : ((((wire2 ?
                              wire0 : wire89) && (^~(8'hb3))) ?
                          $signed($unsigned((8'hb7))) : reg152) ?
                      reg152 : reg151[(4'hd):(4'ha)]));
              reg154 <= (($unsigned(((~|reg153) ?
                      $unsigned(wire1) : {(8'ha7)})) ?
                  $signed($signed((wire2 ?
                      wire4 : reg151))) : ($unsigned((|wire4)) ^~ $unsigned($signed(reg152)))) ~^ (($unsigned({reg151,
                  reg152}) <<< (~(^~(8'hb9)))) && (((wire0 & wire2) + reg152[(2'h2):(1'h0)]) ?
                  ((~&reg151) ?
                      wire0 : (8'hb2)) : $unsigned($unsigned(wire0)))));
            end
          reg155 <= wire2[(4'hd):(3'h7)];
          if ($unsigned({({(wire3 || (8'hb4))} >> (wire3[(2'h2):(1'h1)] ?
                  ((8'hb9) ? wire89 : (8'ha8)) : (wire2 != reg152))),
              (((reg154 != wire2) ?
                  (reg155 >>> wire2) : (reg151 ?
                      reg155 : wire4)) >> (wire1[(4'he):(4'he)] + (wire89 ?
                  reg154 : reg152)))}))
            begin
              reg156 <= reg152;
            end
          else
            begin
              reg156 <= wire89[(3'h5):(2'h2)];
              reg157 <= (+wire148);
              reg158 <= (reg156[(4'hd):(4'hb)] ?
                  (wire148 || $signed((+((8'ha9) <= reg151)))) : $unsigned((|$signed((-reg157)))));
              reg159 <= (8'hb2);
              reg160 <= $signed((((wire3[(2'h2):(2'h2)] && (reg156 == (8'hbd))) ?
                  ({reg153, reg156} == $signed(wire1)) : $signed({reg155,
                      wire4})) - $unsigned((8'hb7))));
            end
          if ((((reg154[(4'hb):(2'h2)] ?
                  (reg158 << (reg159 ~^ reg155)) : reg150) ?
              (-wire3) : (reg160[(5'h12):(4'hf)] ?
                  $unsigned(((8'h9c) ?
                      (8'hb9) : reg158)) : ((wire0 ~^ (7'h43)) << $unsigned(wire4)))) - $signed((~reg156))))
            begin
              reg161 <= reg160;
              reg162 <= (^wire89);
            end
          else
            begin
              reg161 <= (8'hbb);
              reg162 <= wire4[(1'h0):(1'h0)];
              reg163 <= (reg161 ? $unsigned($signed(reg162)) : (8'ha0));
            end
          reg164 <= (|wire3);
        end
      else
        begin
          reg150 <= {($unsigned($unsigned(reg159[(2'h2):(1'h1)])) >>> $signed((+(wire89 ?
                  wire4 : (8'hae))))),
              $unsigned({(!(8'ha5)),
                  ((reg151 ? reg155 : (8'hbc)) ?
                      (reg152 ? reg155 : (8'hab)) : $unsigned(reg159))})};
          reg151 <= reg151;
          if ($unsigned({((~|reg152) - $signed($signed(wire0))),
              $unsigned($unsigned(wire4[(1'h0):(1'h0)]))}))
            begin
              reg152 <= ((!$unsigned(({(8'ha6),
                  reg163} != reg156[(3'h6):(3'h4)]))) ^ $signed(wire148));
              reg153 <= $signed(wire148[(4'h9):(3'h5)]);
              reg154 <= reg163;
              reg155 <= reg156;
            end
          else
            begin
              reg152 <= reg152[(3'h7):(2'h2)];
              reg153 <= reg150;
              reg154 <= (({(|wire0)} == reg151) ?
                  (+(8'hb9)) : reg150[(3'h7):(3'h5)]);
              reg155 <= $signed({reg160});
              reg156 <= reg158[(2'h3):(2'h2)];
            end
        end
      reg165 <= $signed(reg161[(1'h1):(1'h1)]);
    end
  assign wire166 = (reg157 && reg156[(4'hb):(1'h1)]);
  assign wire167 = (8'hac);
  module91 #() modinst169 (wire168, clk, reg155, wire4, wire0, wire166);
  module5 #() modinst171 (wire170, clk, wire3, wire167, wire168, wire2);
  assign wire172 = reg150[(4'h8):(1'h1)];
  always
    @(posedge clk) begin
      if ({$unsigned((((wire148 << reg154) == $signed(reg163)) ?
              (reg155 ?
                  (~|wire170) : $unsigned((8'ha9))) : $signed(((8'had) >>> wire4))))})
        begin
          reg173 <= {$signed((~^wire167)), wire166};
        end
      else
        begin
          reg173 <= reg151[(4'hc):(4'hb)];
          reg174 <= (reg150 >>> ({(~(^reg173))} ?
              $unsigned((~&{(8'hac), wire168})) : ({$signed(wire4)} ?
                  $signed(reg150[(1'h0):(1'h0)]) : reg165)));
        end
      reg175 <= (|(!reg151[(4'hb):(4'h8)]));
    end
  module91 #() modinst177 (.wire93(reg160), .wire95(wire89), .clk(clk), .wire92(wire168), .wire94(wire2), .y(wire176));
  assign wire178 = $unsigned((|$unsigned(reg151)));
  assign wire179 = $unsigned({$signed(($signed(wire0) != (wire148 == wire89))),
                       ($signed(reg156[(4'hb):(3'h4)]) ?
                           ($unsigned(wire178) ?
                               $signed((8'hb0)) : reg152) : ($unsigned(reg151) ?
                               (~|wire172) : (!wire176)))});
  assign wire180 = (~|(($unsigned(wire168) ?
                           (~^(~|wire168)) : ((reg157 <<< wire172) ?
                               reg155[(2'h2):(1'h1)] : (wire179 ?
                                   wire179 : wire172))) ?
                       {$signed(reg162), {$unsigned(wire179)}} : reg163));
  assign wire181 = (7'h41);
endmodule

module module91  (y, clk, wire92, wire93, wire94, wire95);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire92;
  input wire [(3'h4):(1'h0)] wire93;
  input wire [(4'ha):(1'h0)] wire94;
  input wire signed [(4'hf):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire98;
  wire signed [(4'hc):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire100;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire102;
  wire signed [(5'h15):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire145;
  assign y = {wire147,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire145,
                 (1'h0)};
  assign wire96 = wire95;
  assign wire97 = ($signed($signed(($signed(wire96) ?
                      {wire93} : (~&(8'haf))))) || wire94[(3'h7):(2'h2)]);
  assign wire98 = wire93[(1'h0):(1'h0)];
  assign wire99 = ($signed((wire93[(2'h2):(2'h2)] >> ($unsigned(wire94) ?
                      (wire98 ?
                          wire92 : wire95) : $unsigned(wire97)))) * wire95);
  assign wire100 = $signed($unsigned({(|(7'h42)), $signed($unsigned(wire93))}));
  assign wire101 = $signed($signed((&$unsigned((wire100 ? (7'h44) : wire97)))));
  assign wire102 = wire99;
  assign wire103 = ((-$unsigned(wire99)) == $unsigned($signed($signed((~|wire93)))));
  module104 #() modinst146 (wire145, clk, wire96, wire100, wire102, wire103, wire98);
  assign wire147 = $signed((($unsigned($unsigned(wire99)) ?
                           $unsigned((wire94 >> wire102)) : $unsigned((8'had))) ?
                       $signed(wire96[(5'h13):(4'h9)]) : $unsigned((^(wire100 != wire102)))));
endmodule

module module5
#(parameter param87 = {((&((-(8'h9c)) ? (~&(8'ha2)) : ((8'h9e) ? (8'hb1) : (8'ha2)))) + (((&(8'hb1)) ~^ ((8'hb7) ^~ (8'ha1))) ? (~&((8'h9f) & (8'hae))) : ({(7'h42), (7'h40)} == (^(8'h9d)))))}, 
parameter param88 = ((^(((-param87) ? (param87 ? param87 : param87) : param87) ? {(7'h42), param87} : {param87, {(8'hb0), param87}})) + (({{param87, param87}} <<< (!(param87 && param87))) ? (param87 >= param87) : param87)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire10;
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire85,
                 wire55,
                 wire25,
                 wire10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 (1'h0)};
  assign wire10 = wire6[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg11 <= ((~^(8'hac)) ?
          (!wire10[(1'h0):(1'h0)]) : $unsigned(($signed((wire9 ?
              wire10 : wire8)) || wire9)));
      reg12 <= ({$unsigned($unsigned({wire10}))} <<< $unsigned(reg11[(2'h3):(1'h1)]));
      reg13 <= (wire10 || (wire8[(2'h3):(1'h1)] ?
          ((~(wire8 + wire9)) ?
              wire9[(3'h5):(2'h3)] : ((reg12 ?
                  wire9 : wire7) << ((8'ha2) | reg12))) : ($unsigned(wire10) && wire6[(1'h1):(1'h1)])));
      reg14 <= (8'hae);
      if (($unsigned(($unsigned((reg14 ?
          wire7 : (8'had))) ~^ reg14[(4'hc):(3'h6)])) << $signed((reg11[(2'h3):(2'h3)] < wire8[(1'h0):(1'h0)]))))
        begin
          if ((+((wire8[(2'h2):(1'h1)] < (^~$unsigned(wire9))) ?
              {(wire9 ^~ $unsigned((8'h9f)))} : $signed(wire8))))
            begin
              reg15 <= {$signed(wire6)};
              reg16 <= reg11;
              reg17 <= (^~wire8[(2'h3):(2'h2)]);
              reg18 <= {($unsigned((reg13 ?
                      (~^wire6) : $signed(reg13))) == (7'h41)),
                  (+{$signed((wire9 <<< reg11)), wire10})};
              reg19 <= (~|(-$unsigned($unsigned(reg17))));
            end
          else
            begin
              reg15 <= $signed(({$signed(wire9),
                  ((reg11 << wire8) > wire10)} && $unsigned((wire7[(2'h2):(2'h2)] ?
                  reg12[(4'hf):(4'hd)] : reg18))));
            end
          if (((((reg13[(2'h2):(1'h0)] ?
                  wire7[(1'h0):(1'h0)] : {reg11,
                      (8'hb8)}) < {reg17[(3'h7):(3'h7)],
                  (reg15 - reg14)}) ^~ wire9[(3'h7):(2'h2)]) ?
              wire9[(4'h8):(1'h0)] : wire7))
            begin
              reg20 <= ($signed($signed($signed($unsigned((8'ha5))))) != (-$signed($unsigned({reg19}))));
              reg21 <= $signed({reg19[(4'he):(4'h9)]});
              reg22 <= (reg17 ?
                  ((7'h42) <= ($signed((reg18 >= (8'hb0))) ?
                      {((8'h9c) & (8'hb7))} : {$unsigned((8'hb4)),
                          $unsigned(wire10)})) : $signed(reg20));
            end
          else
            begin
              reg20 <= ($signed({($unsigned(reg12) & $unsigned((7'h41)))}) ?
                  ((7'h41) >= $unsigned(wire10[(1'h0):(1'h0)])) : $signed($unsigned($unsigned(reg15))));
              reg21 <= ((reg14[(2'h3):(2'h3)] * $signed(($signed(reg14) ?
                  $signed(reg12) : (~&wire7)))) || (-((((8'had) & (8'ha3)) ?
                  $signed(reg13) : (reg21 ?
                      (8'h9e) : reg18)) ~^ $unsigned({(7'h40)}))));
              reg22 <= {$unsigned(($signed(reg15) ?
                      ((reg21 ? reg17 : reg21) >> (wire6 - wire9)) : reg12)),
                  $unsigned(wire9)};
            end
          reg23 <= $unsigned($signed($unsigned($signed((reg16 && (8'hbb))))));
          reg24 <= reg17;
        end
      else
        begin
          reg15 <= wire8;
          reg16 <= reg11;
          reg17 <= $signed($unsigned((reg17 ?
              (wire7[(3'h4):(1'h1)] ?
                  (wire8 || (7'h44)) : {reg22}) : $unsigned((~&reg12)))));
        end
    end
  assign wire25 = reg11;
  module26 #() modinst56 (.wire29(reg17), .clk(clk), .wire28(reg21), .wire30(reg20), .y(wire55), .wire27(reg23));
  module57 #() modinst86 (wire85, clk, wire7, reg16, wire8, reg20, reg21);
endmodule

module module57
#(parameter param83 = {(^(~|((~|(8'haa)) ? ((8'hb9) ^ (8'ha4)) : (&(8'hb9))))), {((+((7'h42) ? (8'hb5) : (8'haa))) <<< (!((8'hb4) ? (7'h42) : (8'hb6))))}}, 
parameter param84 = (~(~^((|param83) ^~ (~|(param83 ? param83 : (8'hb3)))))))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire62;
  input wire signed [(4'he):(1'h0)] wire61;
  input wire [(4'h8):(1'h0)] wire60;
  input wire [(4'hd):(1'h0)] wire59;
  input wire signed [(4'he):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'ha):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  assign y = {wire82,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire72,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 reg81,
                 reg80,
                 reg74,
                 reg73,
                 reg71,
                 (1'h0)};
  assign wire63 = $signed(wire61);
  assign wire64 = $signed((wire60[(2'h2):(1'h0)] ?
                      wire59 : {wire63[(4'he):(3'h7)]}));
  assign wire65 = wire61;
  assign wire66 = $unsigned($unsigned(({wire64[(1'h0):(1'h0)]} ?
                      {$unsigned((8'hbe))} : {wire58, $signed((7'h40))})));
  assign wire67 = $unsigned(wire64);
  assign wire68 = wire66;
  assign wire69 = wire64[(3'h7):(2'h2)];
  assign wire70 = $unsigned($signed((wire64 ? wire68[(2'h3):(2'h2)] : wire60)));
  always
    @(posedge clk) begin
      reg71 <= wire68;
    end
  assign wire72 = wire62[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg73 <= (8'hae);
      reg74 <= ($signed({($signed(wire69) ? wire65 : {(8'h9e)}),
              ($signed(wire63) - {wire66})}) ?
          (~wire58) : wire63[(4'hf):(4'hb)]);
    end
  assign wire75 = (|{$signed(((|(8'had)) >> (wire72 ~^ wire59)))});
  assign wire76 = ($signed(wire59[(1'h1):(1'h0)]) ?
                      (&{(~^(~&reg73))}) : reg74[(2'h2):(1'h0)]);
  assign wire77 = {{$unsigned(wire70[(4'h9):(1'h1)]),
                          ((^reg73[(4'h8):(1'h1)]) ?
                              {$unsigned((8'hb1)),
                                  (wire67 ~^ wire58)} : ($unsigned(wire67) ?
                                  wire75[(2'h3):(1'h0)] : $signed(wire65)))},
                      wire69};
  assign wire78 = wire62;
  assign wire79 = (|$unsigned((((wire67 - wire75) >>> (~wire63)) - wire60[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg80 <= $unsigned(($signed(($unsigned((8'hb5)) > wire77[(4'hc):(2'h2)])) ?
          {$unsigned(wire58[(4'hb):(1'h0)]),
              ($unsigned(wire68) ?
                  (wire66 ~^ wire70) : (wire70 & reg73))} : {wire79[(3'h5):(1'h1)]}));
      reg81 <= $unsigned((((-$unsigned(wire64)) ?
          wire75[(2'h2):(2'h2)] : (wire64 ?
              (~wire79) : (wire70 > wire65))) ~^ $signed({wire76,
          (wire65 ? wire64 : (8'h9c))})));
    end
  assign wire82 = $unsigned(wire66[(3'h4):(3'h4)]);
endmodule

module module26
#(parameter param54 = (((-(~((8'hab) ? (8'hb3) : (7'h41)))) >= ((~(~|(8'hbd))) + ({(8'h9e), (8'hbe)} ? (-(7'h44)) : ((8'ha1) - (8'hb0))))) || (!((((8'h9e) || (8'ha0)) ^ (~&(8'haa))) ? {(!(8'h9e))} : (((8'hb5) ? (8'hb4) : (8'ha7)) ? ((8'h9f) || (8'hbc)) : ((8'hb8) ? (8'hb7) : (8'ha8)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire30;
  input wire signed [(3'h6):(1'h0)] wire29;
  input wire [(4'ha):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire31;
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire31,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire31 = $signed((!$signed(($signed(wire30) > (^~wire27)))));
  always
    @(posedge clk) begin
      reg32 <= (($unsigned($signed(wire30)) ?
          $unsigned(wire28) : ((^(wire31 != wire28)) | ((wire31 <<< wire30) == (wire27 + wire28)))) >> (~&$unsigned($signed(wire31))));
      if ((wire27 && wire27[(3'h6):(2'h2)]))
        begin
          reg33 <= (wire31[(2'h2):(2'h2)] | (($unsigned(reg32[(2'h3):(1'h1)]) ?
              $signed(wire27) : $unsigned({wire29, wire27})) & wire28));
          reg34 <= ($signed(((&(~wire30)) ?
              {(~&reg32)} : $unsigned(reg33))) ^ {{(wire30 - $unsigned(wire27))}});
          reg35 <= (((((wire28 + wire28) >> (wire29 ? reg32 : wire30)) ?
                  ((wire30 >> wire27) ?
                      $signed((8'hb9)) : $signed(wire27)) : {((8'hb3) || wire30),
                      wire29[(3'h4):(3'h4)]}) >> $signed((~^(reg32 * wire30)))) ?
              ((((wire28 - wire31) ? {reg32, wire28} : $unsigned(wire27)) ?
                  ({wire31, reg33} ?
                      $signed(wire31) : (~wire30)) : wire31) < $signed((reg33[(5'h12):(2'h3)] ?
                  $signed(wire28) : (-reg33)))) : ($signed(((^(8'ha3)) ?
                  (~&wire28) : $unsigned(wire30))) ^ (~|(reg33 << (|reg34)))));
          reg36 <= $unsigned((8'hbe));
        end
      else
        begin
          if ($unsigned(({wire30} << (reg34 ?
              (reg34[(4'hd):(4'hd)] ?
                  $signed((8'ha1)) : reg33) : ($signed(wire29) ?
                  wire27 : (^~wire27))))))
            begin
              reg33 <= reg33[(4'ha):(3'h7)];
              reg34 <= $unsigned({(8'ha2)});
              reg35 <= wire27[(3'h7):(1'h0)];
              reg36 <= reg33;
              reg37 <= (8'ha3);
            end
          else
            begin
              reg33 <= $signed(((reg33 ?
                      (reg35 >> (reg34 >= reg35)) : $unsigned((~^reg35))) ?
                  ($unsigned((reg37 ?
                      reg32 : reg37)) && {$signed(wire31)}) : ($unsigned({wire31,
                      reg33}) || $unsigned(reg33[(5'h10):(3'h4)]))));
              reg34 <= ($signed($unsigned((8'hb2))) ?
                  (~^reg33) : $unsigned($signed(wire29)));
            end
        end
      reg38 <= reg36;
      reg39 <= {$unsigned(wire29)};
    end
  assign wire40 = $unsigned(reg34);
  assign wire41 = wire40[(5'h15):(5'h15)];
  assign wire42 = wire41;
  assign wire43 = {$signed(wire41), reg35[(2'h2):(1'h1)]};
  always
    @(posedge clk) begin
      reg44 <= (($signed($signed((wire40 ? (8'ha0) : wire27))) ?
          wire40 : (-reg33)) > reg34[(4'ha):(3'h4)]);
      if ($unsigned(($signed(wire40) ?
          (8'h9e) : (~^($unsigned((8'ha2)) ? $signed(wire30) : reg39)))))
        begin
          reg45 <= ($unsigned(({(wire40 ?
                  wire42 : reg34)} | $signed(wire27[(3'h7):(3'h6)]))) ^ (wire41 <= reg44[(2'h2):(1'h1)]));
          reg46 <= $unsigned($unsigned($signed({reg35,
              ((8'hba) ? reg36 : reg34)})));
          reg47 <= $signed(wire41[(4'hb):(3'h6)]);
          reg48 <= $unsigned(($signed($signed($signed(reg36))) == ({(wire41 >>> reg34),
                  ((8'ha8) < reg46)} ?
              wire28[(3'h6):(3'h6)] : $signed(reg45))));
          reg49 <= $signed(reg38);
        end
      else
        begin
          reg45 <= reg38[(4'hb):(3'h5)];
        end
      reg50 <= ($signed((!reg32[(1'h0):(1'h0)])) ?
          $unsigned($unsigned((reg46 <= $signed(reg44)))) : {$signed($unsigned({reg47}))});
    end
  assign wire51 = ($signed(($unsigned((~|reg50)) ?
                      reg48 : wire28[(3'h4):(2'h2)])) <<< reg35);
  assign wire52 = (7'h41);
  assign wire53 = wire41;
endmodule

module module104
#(parameter param143 = ((((((8'ha2) && (8'haa)) < ((8'hb3) < (8'ha8))) ? (((8'hae) - (8'hbb)) >= ((8'hae) ? (7'h41) : (8'ha7))) : (((8'hb2) ? (8'ha3) : (8'hbe)) ? {(8'ha6)} : ((8'hb8) - (8'hbf)))) ? (!(!(^~(8'ha2)))) : {(-((8'hbc) ? (7'h44) : (8'ha8))), (&((8'ha2) ? (8'h9e) : (8'hb9)))}) ? (({((8'hb7) ? (8'ha1) : (8'hbc))} ? (~^((8'hb3) ? (7'h44) : (8'hb5))) : (((8'hb0) ^~ (7'h40)) * ((8'ha5) ? (8'haf) : (8'haa)))) ? (((8'hbc) & ((8'ha8) <= (7'h40))) + ((&(7'h40)) ? ((8'h9e) > (8'hb8)) : ((7'h40) ? (8'hb9) : (8'h9c)))) : {((~|(8'hb0)) || ((8'hba) ^ (8'hbd))), (^~((8'ha5) ? (8'ha5) : (8'ha7)))}) : (|(^{((7'h44) ? (8'hb9) : (8'hb1)), ((8'hb8) << (8'ha5))}))), 
parameter param144 = param143)
(y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire109;
  input wire [(3'h7):(1'h0)] wire108;
  input wire signed [(3'h5):(1'h0)] wire107;
  input wire signed [(5'h15):(1'h0)] wire106;
  input wire [(4'hb):(1'h0)] wire105;
  wire [(4'hb):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(4'hd):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire112;
  wire signed [(4'h8):(1'h0)] wire111;
  wire [(2'h2):(1'h0)] wire110;
  reg [(5'h11):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg131 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  assign y = {wire142,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
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
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire110 = $signed(wire106[(4'hb):(4'hb)]);
  assign wire111 = (~(&wire110));
  assign wire112 = wire108[(3'h6):(3'h6)];
  assign wire113 = $signed(wire107);
  assign wire114 = (($unsigned(((wire110 - wire112) ?
                           (~&wire111) : $unsigned(wire107))) ?
                       ((~(wire106 ? wire108 : wire105)) ?
                           $signed((wire112 >>> wire112)) : (~^$unsigned(wire113))) : {{(wire105 >>> wire113)}}) ~^ (wire111 == wire113));
  assign wire115 = $unsigned(wire109[(3'h4):(2'h2)]);
  assign wire116 = $unsigned((~^wire114[(2'h3):(1'h1)]));
  assign wire117 = $signed($signed(wire112[(4'hd):(4'ha)]));
  always
    @(posedge clk) begin
      if (wire106[(3'h7):(3'h4)])
        begin
          reg118 <= (wire113 + ((wire109 ?
              wire106 : $signed({wire107})) <<< (&(&$unsigned(wire105)))));
        end
      else
        begin
          reg118 <= wire117[(3'h5):(3'h5)];
          if ((+wire112[(4'hc):(4'hc)]))
            begin
              reg119 <= ((&{wire105[(3'h4):(2'h2)],
                  (^~(reg118 & wire114))}) == wire108[(1'h0):(1'h0)]);
              reg120 <= (($unsigned(({wire111} <= (wire117 ?
                      wire115 : wire111))) ?
                  $unsigned((wire114[(3'h5):(1'h1)] != $unsigned(wire114))) : {$unsigned((-wire114)),
                      (|(~&wire116))}) | wire108[(2'h3):(1'h1)]);
              reg121 <= wire108[(3'h6):(2'h3)];
              reg122 <= $unsigned(wire113[(1'h0):(1'h0)]);
            end
          else
            begin
              reg119 <= $signed($signed((((8'ha2) >> wire108[(3'h4):(2'h2)]) & $signed(wire109))));
              reg120 <= $signed(wire110);
              reg121 <= (~&(wire107[(3'h4):(2'h3)] * $signed((|(wire112 ?
                  wire111 : reg120)))));
              reg122 <= (wire111 ?
                  $unsigned((&{(|wire115),
                      $signed((8'hba))})) : wire114[(2'h2):(1'h1)]);
              reg123 <= $unsigned($signed($signed(({wire113,
                  wire107} >>> (wire111 ? reg121 : wire111)))));
            end
        end
      if (((^($unsigned((wire107 - wire117)) ?
              $unsigned({wire107, wire116}) : wire116[(2'h2):(1'h0)])) ?
          ((((7'h44) <<< (wire108 == wire108)) ?
                  (wire110[(1'h1):(1'h1)] & $signed(wire107)) : (8'ha4)) ?
              (!$unsigned((wire115 ?
                  wire112 : (8'ha1)))) : $signed(wire107)) : reg123[(1'h1):(1'h0)]))
        begin
          if ((reg118[(1'h0):(1'h0)] ^~ (&$unsigned(((reg123 ?
                  wire109 : wire108) ?
              $signed(reg121) : (8'hb6))))))
            begin
              reg124 <= (~&(~&wire112[(3'h7):(2'h2)]));
              reg125 <= ({wire110[(1'h1):(1'h0)]} ?
                  $signed((-$unsigned((&reg124)))) : {(($signed(reg118) ?
                          (wire107 ?
                              (8'hbd) : wire116) : {wire115}) || ((wire108 ?
                              wire108 : reg119) ?
                          $unsigned(reg122) : $signed(wire117)))});
            end
          else
            begin
              reg124 <= $unsigned({$signed(((+wire110) == (reg122 ?
                      wire114 : reg118))),
                  $unsigned(($unsigned(wire114) ? reg121 : $signed(wire111)))});
              reg125 <= $signed(reg123);
              reg126 <= (wire113 << (|$signed(reg118)));
            end
        end
      else
        begin
          reg124 <= (wire116 ?
              ((($unsigned(reg121) ~^ $unsigned(reg119)) & wire113) > (wire115 ?
                  (wire107[(3'h5):(3'h4)] ?
                      (reg125 << reg125) : $unsigned((8'haa))) : reg126)) : (reg122[(2'h2):(2'h2)] > reg121[(4'hb):(4'ha)]));
          if ($unsigned((|$unsigned(wire107[(1'h0):(1'h0)]))))
            begin
              reg125 <= reg118;
              reg126 <= ((+wire112[(5'h10):(2'h3)]) ?
                  $unsigned((^reg125)) : ((|{reg123[(2'h2):(2'h2)]}) & {($unsigned(wire111) & ((8'hbf) ?
                          wire114 : wire113))}));
              reg127 <= reg120;
              reg128 <= reg126;
              reg129 <= $unsigned(wire107[(2'h3):(2'h3)]);
            end
          else
            begin
              reg125 <= $signed((!{reg126}));
              reg126 <= wire114;
              reg127 <= $unsigned((((7'h41) ?
                  {(wire114 ?
                          wire111 : reg125)} : reg128[(3'h4):(1'h1)]) | $unsigned({wire110[(2'h2):(1'h0)]})));
            end
          reg130 <= (8'h9c);
          reg131 <= $unsigned(reg124);
          reg132 <= (wire117 * (7'h42));
        end
    end
  assign wire133 = reg122[(2'h2):(2'h2)];
  assign wire134 = wire106[(5'h12):(3'h5)];
  assign wire135 = {(~^(^($signed(wire117) - $signed(wire112)))),
                       $unsigned((~|((reg121 >= reg132) ?
                           {reg124} : {(8'hab)})))};
  assign wire136 = $signed($unsigned(($unsigned((reg122 ? reg123 : (8'h9e))) ?
                       (+reg118) : (!reg129[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg137 <= $signed({{$unsigned((reg132 ? wire107 : (7'h43)))}});
      reg138 <= reg124[(1'h1):(1'h0)];
      reg139 <= wire107;
      reg140 <= ($unsigned($signed($unsigned($unsigned((8'h9f))))) ?
          {reg122[(2'h3):(2'h3)]} : $unsigned(wire109[(4'hc):(4'h8)]));
      reg141 <= $unsigned(reg128[(3'h5):(1'h1)]);
    end
  assign wire142 = wire112[(3'h4):(1'h0)];
endmodule
