module top
#(parameter param168 = ((~((-((8'hba) ? (8'hac) : (8'ha3))) || (-(~&(8'hb0))))) ? ({({(8'hab), (8'h9e)} ? (~(8'ha6)) : (~^(8'hb1)))} ? (((8'ha9) < (!(8'h9d))) ? ((~|(8'haa)) - ((8'hb3) ? (8'hb6) : (8'h9e))) : ((^~(8'ha4)) || ((7'h40) ? (8'hac) : (8'hbc)))) : ((((8'ha8) ? (8'ha4) : (8'hb3)) ? ((8'hb2) != (8'hbb)) : ((8'haa) ? (8'ha1) : (8'h9f))) ? (~^{(8'ha2), (7'h42)}) : (~|{(8'hb4), (8'haf)}))) : (((((8'hb7) ? (8'hba) : (7'h43)) - {(8'ha8)}) ? (-(|(8'hbd))) : (((8'ha0) ? (8'ha7) : (8'ha6)) | ((7'h40) >>> (8'ha7)))) ? (({(8'hb0)} ? (^(8'hb1)) : ((8'ha6) ? (8'h9f) : (8'h9e))) ^ {(!(8'hbc))}) : (7'h43))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire166;
  wire [(5'h13):(1'h0)] wire165;
  wire [(4'hd):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire162;
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(5'h14):(1'h0)] reg157 = (1'h0);
  reg [(4'hb):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg160 = (1'h0);
  reg [(4'ha):(1'h0)] reg161 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire94,
                 wire22,
                 wire6,
                 wire5,
                 wire152,
                 wire154,
                 wire155,
                 wire162,
                 reg167,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 (1'h0)};
  assign wire5 = $unsigned($signed((|wire0)));
  assign wire6 = $unsigned((^~wire4));
  module7 #() modinst23 (.clk(clk), .wire8(wire1), .wire11(wire0), .y(wire22), .wire10(wire2), .wire9(wire6));
  module24 #() modinst95 (.wire25(wire5), .wire26(wire22), .wire29(wire1), .wire27(wire0), .clk(clk), .wire28(wire3), .y(wire94));
  module96 #() modinst153 (.wire100(wire3), .y(wire152), .clk(clk), .wire99(wire5), .wire97(wire22), .wire98(wire6));
  assign wire154 = $unsigned(wire152);
  assign wire155 = (|($unsigned(($unsigned(wire6) + (wire94 ?
                       wire94 : wire94))) * wire3[(4'hc):(1'h0)]));
  always
    @(posedge clk) begin
      reg156 <= $signed((+$signed(({wire22, wire6} << $signed(wire152)))));
      reg157 <= $unsigned(wire5[(4'ha):(3'h7)]);
      if (($unsigned($signed($signed(wire4[(4'ha):(1'h1)]))) ?
          $signed((~reg156[(3'h4):(1'h0)])) : (($unsigned($signed(wire94)) ?
              wire6 : reg157[(1'h1):(1'h1)]) >>> wire4[(4'hd):(1'h0)])))
        begin
          reg158 <= wire154;
          reg159 <= $signed(wire1[(4'hd):(2'h2)]);
        end
      else
        begin
          if (((~$unsigned(((wire6 ? (8'hb8) : wire3) ^ (reg158 ?
                  (8'ha6) : wire1)))) ?
              ((~|($signed(wire94) ? (wire152 + wire2) : wire155)) ?
                  wire22[(1'h0):(1'h0)] : $signed(reg156)) : {wire155[(3'h6):(3'h6)],
                  wire152}))
            begin
              reg158 <= wire152[(1'h0):(1'h0)];
              reg159 <= reg159;
              reg160 <= $signed((((wire2 ? (wire154 && reg159) : (7'h41)) ?
                  ($unsigned(wire22) < wire4) : reg159) && $unsigned((8'had))));
              reg161 <= {((~|$unsigned($signed(reg156))) ^~ $signed(reg158[(3'h5):(2'h2)])),
                  $unsigned(wire5[(4'hf):(3'h7)])};
            end
          else
            begin
              reg158 <= {$unsigned((7'h41))};
              reg159 <= wire2;
              reg160 <= wire5[(5'h11):(4'hf)];
              reg161 <= $unsigned(wire3);
            end
        end
    end
  module54 #() modinst163 (.wire57(wire94), .y(wire162), .wire58(wire155), .clk(clk), .wire56(wire0), .wire55(reg157));
  assign wire164 = wire3;
  assign wire165 = wire2[(3'h7):(2'h3)];
  assign wire166 = reg160;
  always
    @(posedge clk) begin
      reg167 <= reg157[(4'hc):(1'h1)];
    end
endmodule

module module96  (y, clk, wire97, wire98, wire99, wire100);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire97;
  input wire signed [(3'h7):(1'h0)] wire98;
  input wire [(5'h13):(1'h0)] wire99;
  input wire signed [(5'h11):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire150;
  wire signed [(3'h4):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire134;
  wire signed [(4'ha):(1'h0)] wire133;
  wire signed [(4'h9):(1'h0)] wire132;
  wire signed [(5'h12):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire127;
  assign y = {wire150,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire101,
                 wire102,
                 wire127,
                 (1'h0)};
  assign wire101 = ({wire100[(3'h4):(3'h4)]} && $signed($signed(wire98[(1'h1):(1'h1)])));
  assign wire102 = wire98[(2'h3):(1'h0)];
  module103 #() modinst128 (.wire106(wire101), .wire105(wire99), .clk(clk), .y(wire127), .wire108(wire98), .wire104(wire97), .wire107(wire102));
  assign wire129 = ((wire97 >>> (~|(+(~^wire127)))) <= wire97[(4'h8):(3'h4)]);
  assign wire130 = $signed(wire100[(4'hd):(3'h5)]);
  assign wire131 = wire130;
  assign wire132 = ($unsigned({(|(wire102 ? (8'ha6) : wire127))}) ?
                       (!$signed($signed(wire102[(4'hd):(1'h0)]))) : ((|$unsigned($unsigned(wire97))) ?
                           wire99 : (wire102 <= {(wire129 ? wire102 : wire97),
                               wire129})));
  assign wire133 = (wire131 > $signed($unsigned((+(wire102 > wire131)))));
  assign wire134 = ($signed(((8'hb5) ?
                       (wire127[(4'h9):(3'h6)] ?
                           (&wire129) : (wire97 + wire127)) : $signed((^wire102)))) <<< (wire98 ?
                       $signed(((7'h43) || $signed(wire133))) : (((~^wire129) ?
                               $unsigned(wire101) : $signed(wire97)) ?
                           $signed(wire99[(5'h10):(4'hf)]) : wire102)));
  assign wire135 = (({$signed(((8'ha2) ? wire127 : wire129))} >= wire130) ?
                       $unsigned($signed({(wire98 <= (8'hbc))})) : ((-(wire102[(4'he):(4'hd)] ?
                               (8'hb7) : wire99[(4'hd):(2'h3)])) ?
                           wire133 : (wire133[(1'h0):(1'h0)] ?
                               wire129[(4'h9):(3'h6)] : ($signed(wire134) < wire98[(3'h5):(1'h1)]))));
  module136 #() modinst151 (.wire140(wire127), .wire137(wire133), .y(wire150), .wire138(wire129), .wire139(wire132), .clk(clk));
endmodule

module module24  (y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(5'h14):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire52;
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  assign y = {wire92,
                 wire30,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire52,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  assign wire30 = (+{(&(^~$signed((8'h9c))))});
  always
    @(posedge clk) begin
      reg31 <= $unsigned($signed(((wire28 < wire29) || (^{wire27, wire26}))));
      reg32 <= (~^$unsigned(((wire27 && (wire26 ?
          (8'h9f) : wire28)) <= (~|(wire28 ? (8'hb2) : wire29)))));
      reg33 <= {(wire27 ?
              ($signed(wire30) ?
                  $unsigned($signed(reg32)) : reg32) : ({((8'hb1) << wire27)} == (~&$unsigned(wire28))))};
    end
  assign wire34 = reg31;
  assign wire35 = wire27[(1'h1):(1'h1)];
  assign wire36 = ((~($signed($signed((7'h42))) > ((wire28 ? (8'haa) : reg32) ?
                          (~(8'ha7)) : $signed(wire28)))) ?
                      $unsigned($unsigned(wire28[(2'h2):(2'h2)])) : $signed({$unsigned($unsigned(wire35)),
                          ((reg33 << reg33) ?
                              $signed(wire27) : (reg33 > wire27))}));
  assign wire37 = $signed(wire25);
  assign wire38 = (8'ha4);
  assign wire39 = (wire25 >> (((!(reg32 ? wire30 : wire38)) ?
                      ($signed(wire25) ?
                          (!wire28) : $unsigned(wire29)) : ((reg31 << wire28) < (|(8'ha4)))) - wire35));
  assign wire40 = ({$signed((~&(wire34 ?
                          wire37 : wire25)))} & $unsigned($unsigned($unsigned($unsigned(wire26)))));
  assign wire41 = wire25[(1'h1):(1'h0)];
  assign wire42 = $unsigned(wire39);
  module43 #() modinst53 (wire52, clk, reg31, wire41, wire42, wire26);
  module54 #() modinst93 (wire92, clk, wire42, wire25, wire40, wire52);
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire17,
                 wire16,
                 wire15,
                 wire13,
                 wire12,
                 reg18,
                 reg14,
                 (1'h0)};
  assign wire12 = $unsigned($signed((!(~&(wire11 - wire11)))));
  assign wire13 = $unsigned(wire8);
  always
    @(posedge clk) begin
      reg14 <= ({(((wire8 ? wire13 : (8'had)) ? (~wire10) : $unsigned(wire11)) ?
                  wire10[(5'h13):(3'h4)] : $signed(wire10[(3'h6):(2'h2)])),
              wire13} ?
          ((&$signed($unsigned(wire12))) > ($unsigned((wire10 ^ wire9)) != ($signed(wire9) >> wire9))) : {(8'ha6)});
    end
  assign wire15 = (-(~$unsigned($signed($unsigned(wire13)))));
  assign wire16 = (^($unsigned((wire15 ?
                      (wire13 ? wire10 : wire9) : (wire13 ?
                          wire15 : wire9))) && wire15[(1'h1):(1'h0)]));
  assign wire17 = (8'hbf);
  always
    @(posedge clk) begin
      reg18 <= ((~^$signed(wire8)) ?
          wire11 : ($unsigned(wire15) * ((wire12[(1'h0):(1'h0)] ?
              {wire13} : (reg14 >> wire10)) & $signed((wire10 ?
              wire9 : wire9)))));
    end
  assign wire19 = wire11[(4'ha):(1'h1)];
  assign wire20 = $unsigned(({{(wire16 == wire10)}, (wire16 << (+wire9))} ?
                      ($unsigned($unsigned(wire19)) <= $signed((wire13 && (8'haf)))) : (((reg18 ?
                              (8'hb1) : (8'ha5)) < {wire13}) ?
                          ($unsigned(wire13) - {reg18}) : ((8'hbc) ?
                              (|wire12) : wire10[(2'h2):(1'h1)]))));
  assign wire21 = wire13;
endmodule

module module54
#(parameter param90 = ((~|(~|(((8'h9e) ? (8'had) : (8'ha1)) <<< (~&(8'hb5))))) ? ((+{(~&(8'h9f))}) == ({((8'had) ? (8'hbb) : (8'had)), (|(8'hbe))} ? {(^~(8'h9f)), ((8'hbf) <<< (8'hb9))} : (~|((8'ha0) ? (8'hbb) : (8'had))))) : (((+{(8'ha5)}) | (((8'ha2) ? (8'hb5) : (7'h42)) <= (!(8'hb5)))) < (!((~(8'haf)) ? ((8'hbc) ? (8'ha1) : (8'h9c)) : (7'h42))))), 
parameter param91 = (^~(((+param90) ? ((~&param90) ~^ {param90, param90}) : param90) << ((param90 ? (-(8'h9d)) : param90) << ({param90, param90} ? (param90 ? param90 : param90) : param90)))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire57;
  input wire signed [(3'h5):(1'h0)] wire56;
  input wire signed [(5'h14):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire79;
  wire [(4'he):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(4'h8):(1'h0)] wire63;
  wire signed [(5'h12):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
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
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire59 = $unsigned($unsigned(((wire58 ?
                      (wire58 ~^ wire56) : wire58) <= (~&((8'haf) ?
                      wire56 : wire55)))));
  assign wire60 = $signed($unsigned(wire55));
  assign wire61 = (7'h41);
  assign wire62 = $signed($signed(wire57));
  assign wire63 = $unsigned(wire57[(1'h1):(1'h1)]);
  assign wire64 = $signed(($unsigned({$unsigned(wire61),
                      {wire55, wire56}}) && (+$signed(wire57))));
  always
    @(posedge clk) begin
      reg65 <= (((wire55[(1'h0):(1'h0)] ^ ($unsigned(wire56) | (-wire64))) ?
              $signed((~|(wire60 * wire55))) : (~|wire59)) ?
          wire63[(2'h3):(1'h1)] : wire58);
      if (reg65)
        begin
          reg66 <= ($unsigned(wire56) ? (8'hb8) : wire57[(4'hc):(4'hb)]);
        end
      else
        begin
          reg66 <= {{((~|$unsigned((8'hab))) != $signed((7'h42)))}};
          reg67 <= reg66[(4'hd):(3'h5)];
          reg68 <= $unsigned((-($signed(reg66) - $unsigned((8'hb8)))));
        end
    end
  assign wire69 = $signed(($signed({$signed((8'ha7)),
                      wire60}) && (^$signed($signed(wire58)))));
  assign wire70 = {(((~&wire69) ^~ $unsigned(wire64[(4'h9):(1'h0)])) * (!wire55))};
  assign wire71 = wire61[(2'h2):(1'h1)];
  assign wire72 = (~|($signed((~(wire63 | wire60))) == $signed(reg65)));
  assign wire73 = ((8'hb2) ? $signed((8'haa)) : wire69[(1'h0):(1'h0)]);
  assign wire74 = ($signed($signed(wire71)) == $signed(($signed($signed(wire71)) != ((wire70 ?
                      wire55 : (8'hbd)) && (wire62 || reg65)))));
  assign wire75 = wire56[(3'h5):(1'h1)];
  assign wire76 = reg65[(3'h7):(3'h4)];
  assign wire77 = (($signed(wire60[(4'h9):(3'h7)]) ?
                          (wire64[(1'h1):(1'h0)] ?
                              {$unsigned((8'hb1))} : wire76[(1'h0):(1'h0)]) : (8'ha8)) ?
                      ($unsigned({(wire64 ? (8'hac) : reg66),
                              $unsigned(wire76)}) ?
                          (|$unsigned($unsigned(reg67))) : $signed(((7'h42) >> {wire72}))) : $signed(($unsigned((wire59 ?
                              wire74 : wire74)) ?
                          (&(reg66 >>> reg65)) : $unsigned((reg66 * (8'ha9))))));
  assign wire78 = (wire71[(2'h3):(1'h1)] ? wire74[(3'h4):(3'h4)] : wire59);
  assign wire79 = {(&{wire56})};
  always
    @(posedge clk) begin
      reg80 <= ({$signed((8'ha7))} ?
          ($signed(((wire69 ? wire55 : reg68) - (^~wire79))) ?
              reg68 : $signed((+wire69[(3'h4):(1'h1)]))) : $unsigned(wire62));
    end
  always
    @(posedge clk) begin
      reg81 <= (reg80 * $signed((-(|$signed(wire73)))));
      reg82 <= reg67[(3'h7):(2'h3)];
      reg83 <= (~(~^wire71[(3'h4):(1'h0)]));
      reg84 <= ($signed((-reg68)) >> ((^(!$signed(wire57))) ?
          wire62 : (7'h40)));
      reg85 <= $unsigned($signed($signed({(reg81 ? wire79 : reg68)})));
    end
  always
    @(posedge clk) begin
      reg86 <= ((~$unsigned(((wire63 ~^ wire59) + $unsigned(wire64)))) ^ wire77[(4'hf):(4'ha)]);
      reg87 <= $signed((wire73 ^ wire77));
      reg88 <= (-((~|wire79[(3'h7):(2'h2)]) ?
          $signed($signed({(8'ha1)})) : ((~$unsigned(reg83)) < ((^~wire61) != {reg87,
              wire72}))));
      reg89 <= $signed((~(8'ha6)));
    end
endmodule

module module43  (y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire signed [(3'h7):(1'h0)] wire46;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(4'hb):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  assign y = {wire51, wire50, wire49, wire48, (1'h0)};
  assign wire48 = wire46[(2'h3):(2'h2)];
  assign wire49 = (($unsigned((((8'h9c) ?
                          (8'hb3) : (8'hbe)) << wire47)) <= wire44) ?
                      (wire45 ?
                          (~&(8'hb9)) : (wire46 == wire48)) : $unsigned(wire47[(4'he):(2'h3)]));
  assign wire50 = (+$unsigned($unsigned(((~^wire46) ?
                      $unsigned(wire44) : $signed(wire49)))));
  assign wire51 = (($signed({(wire50 <<< wire44), (+wire49)}) ?
                      wire45[(2'h2):(1'h1)] : $signed(wire46)) >>> $unsigned(wire44[(4'h9):(1'h0)]));
endmodule

module module136
#(parameter param149 = ((7'h44) & ({(((8'hab) ? (7'h41) : (7'h41)) ? ((8'hba) < (7'h43)) : {(8'hb4)})} != ({(~&(7'h40))} ^ (-((8'hb8) ? (8'hb8) : (7'h41)))))))
(y, clk, wire140, wire139, wire138, wire137);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire140;
  input wire [(4'h9):(1'h0)] wire139;
  input wire [(3'h4):(1'h0)] wire138;
  input wire signed [(2'h3):(1'h0)] wire137;
  wire signed [(3'h4):(1'h0)] wire148;
  wire signed [(5'h11):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire145;
  wire [(5'h11):(1'h0)] wire144;
  wire signed [(4'h8):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire142;
  wire signed [(4'he):(1'h0)] wire141;
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 (1'h0)};
  assign wire141 = wire140;
  assign wire142 = {wire141[(3'h4):(2'h3)], $signed($signed((|(8'h9c))))};
  assign wire143 = (!({{wire138[(3'h4):(2'h3)]},
                           $unsigned($unsigned(wire139))} ?
                       wire141[(4'hc):(4'h9)] : (($unsigned(wire138) <<< (&wire137)) >= wire142)));
  assign wire144 = $unsigned(($unsigned(wire137) ^ wire140));
  assign wire145 = wire137;
  assign wire146 = wire145[(4'h9):(4'h9)];
  assign wire147 = (8'hab);
  assign wire148 = wire142[(2'h2):(1'h0)];
endmodule

module module103  (y, clk, wire108, wire107, wire106, wire105, wire104);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire108;
  input wire [(5'h14):(1'h0)] wire107;
  input wire [(4'he):(1'h0)] wire106;
  input wire [(5'h13):(1'h0)] wire105;
  input wire signed [(4'h8):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire126;
  wire [(4'hd):(1'h0)] wire125;
  wire signed [(5'h12):(1'h0)] wire124;
  wire signed [(4'hb):(1'h0)] wire123;
  wire signed [(5'h15):(1'h0)] wire122;
  wire signed [(4'hb):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  wire signed [(5'h12):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(3'h4):(1'h0)] wire116;
  wire [(2'h2):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire114;
  wire [(3'h7):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire111;
  wire signed [(4'he):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire109;
  assign y = {wire126,
                 wire125,
                 wire124,
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
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 (1'h0)};
  assign wire109 = wire104[(3'h7):(2'h3)];
  assign wire110 = ((&$signed((wire106[(1'h1):(1'h1)] ?
                       wire104[(1'h1):(1'h1)] : (wire108 ^~ (8'hb0))))) - {(({wire106} ?
                           $unsigned(wire106) : (wire107 ^~ wire104)) <= (|wire109[(4'hd):(2'h2)]))});
  assign wire111 = (!($signed(wire108[(2'h2):(2'h2)]) & $signed($signed((wire104 * wire107)))));
  assign wire112 = wire105[(3'h5):(3'h4)];
  assign wire113 = $unsigned($unsigned((($signed(wire107) > (wire110 ?
                       wire110 : wire105)) > ((+wire112) | (wire112 & wire106)))));
  assign wire114 = (($unsigned(({wire113} != (wire107 ? wire111 : wire111))) ?
                           (8'hbc) : wire110[(4'h8):(3'h7)]) ?
                       (~&((|wire107) <<< wire109[(3'h5):(3'h5)])) : (&$signed(((^wire108) == $signed(wire111)))));
  assign wire115 = wire108[(3'h5):(3'h5)];
  assign wire116 = (~&((8'h9e) ^~ wire110[(2'h2):(1'h0)]));
  assign wire117 = (~$signed($signed((8'hbc))));
  assign wire118 = (wire113[(1'h0):(1'h0)] <<< wire117[(3'h5):(3'h5)]);
  assign wire119 = (^$unsigned((wire109[(3'h4):(1'h0)] - ((wire111 < (8'hbf)) ?
                       wire104 : wire111))));
  assign wire120 = {($unsigned($unsigned($unsigned(wire110))) ?
                           {wire112[(4'he):(1'h0)],
                               wire113} : wire118[(3'h6):(1'h1)]),
                       $unsigned($signed((wire111 * {wire114, wire117})))};
  assign wire121 = wire108;
  assign wire122 = wire118[(1'h0):(1'h0)];
  assign wire123 = $unsigned($signed(((^$unsigned(wire107)) | $unsigned(wire104[(1'h1):(1'h1)]))));
  assign wire124 = wire105;
  assign wire125 = $signed(($unsigned($signed((wire119 ^~ wire117))) > wire116));
  assign wire126 = $signed($signed($signed((~(^~wire105)))));
endmodule
