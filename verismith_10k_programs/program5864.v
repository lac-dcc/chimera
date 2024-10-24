module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire175;
  wire signed [(4'h8):(1'h0)] wire174;
  wire signed [(4'h8):(1'h0)] wire173;
  wire signed [(4'ha):(1'h0)] wire171;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire [(3'h6):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire171,
                 wire60,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire5,
                 wire4,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire0[(3'h5):(2'h2)];
  module6 #() modinst49 (.wire9(wire1), .y(wire48), .clk(clk), .wire7(wire3), .wire10(wire0), .wire8(wire2));
  assign wire50 = (((({wire4} ? (wire0 ? wire4 : wire48) : (&wire4)) ?
                              ($unsigned(wire0) ?
                                  (wire48 - wire1) : (wire3 ~^ wire48)) : ((wire5 - wire48) < (^wire3))) ?
                          (|$unsigned($signed(wire0))) : $signed((((8'h9c) >= wire2) <= (wire5 ?
                              wire48 : wire5)))) ?
                      wire48[(1'h1):(1'h0)] : ((^wire4) ?
                          {(!(wire4 && wire4)),
                              (wire2[(5'h11):(4'hf)] << (wire48 < wire0))} : (8'h9e)));
  assign wire51 = (^wire1);
  assign wire52 = wire48;
  assign wire53 = ((^~(((~wire3) ?
                          wire1[(4'hf):(2'h3)] : (wire48 >>> (8'hbe))) <<< ((wire4 < wire2) >>> (wire4 ?
                          wire2 : wire4)))) ?
                      wire50 : $unsigned(wire3[(2'h2):(1'h0)]));
  assign wire54 = ((!$signed($unsigned(wire4))) ?
                      $signed((!($unsigned(wire51) ^~ wire0))) : wire52);
  always
    @(posedge clk) begin
      reg55 <= wire50;
      reg56 <= $unsigned(wire3);
      reg57 <= wire54;
      reg58 <= (&reg57[(4'hb):(3'h6)]);
      reg59 <= (wire5[(1'h0):(1'h0)] ?
          wire3 : $unsigned((wire48[(1'h1):(1'h1)] ^~ wire48[(2'h2):(1'h0)])));
    end
  assign wire60 = {wire2[(3'h5):(2'h3)], $unsigned(wire0[(4'hb):(3'h5)])};
  always
    @(posedge clk) begin
      if (((wire54[(3'h5):(2'h2)] * ($unsigned((reg57 ? reg58 : reg55)) ?
              wire51 : ((-(8'hbe)) ? (-reg59) : $unsigned(wire60)))) ?
          $signed($signed(wire60)) : ((-wire5) ?
              (reg59 != wire3) : $unsigned(reg56))))
        begin
          reg61 <= (~&(~&(|$unsigned((wire54 + reg57)))));
        end
      else
        begin
          if ((wire52[(3'h6):(2'h3)] >= reg59))
            begin
              reg61 <= ({(&wire60)} <<< ($signed((reg59[(4'ha):(4'ha)] ^ (reg61 ?
                  wire54 : wire5))) | {(wire1 <<< (reg58 ? wire52 : (7'h42))),
                  ($signed(wire3) ?
                      $unsigned(wire52) : wire60[(3'h5):(3'h5)])}));
              reg62 <= ((&$signed(wire50)) ?
                  ($signed($signed((wire53 < reg61))) + (^{wire0,
                      $unsigned(wire50)})) : (^~((~|wire51) ?
                      ($signed(wire4) | $unsigned(reg55)) : ((reg61 ~^ reg56) ?
                          $signed(wire3) : (wire50 << wire2)))));
              reg63 <= $signed((8'hb4));
            end
          else
            begin
              reg61 <= (($unsigned(reg57[(4'h8):(2'h2)]) + wire48) * {(-$signed((8'hbc))),
                  wire52});
              reg62 <= wire48;
            end
        end
      reg64 <= (~wire52);
      if (wire0)
        begin
          reg65 <= ($unsigned(reg59[(4'hb):(4'h9)]) >> ($unsigned({(reg61 ?
                  reg62 : (8'hb7))}) * (~^(~&((8'hae) ? reg64 : reg64)))));
          reg66 <= ((wire60[(4'hf):(4'h9)] || $signed($signed($signed(reg61)))) ?
              wire5[(1'h1):(1'h1)] : (~&(wire52 * wire54[(1'h1):(1'h1)])));
        end
      else
        begin
          reg65 <= reg63;
          reg66 <= ((|wire50) & reg56);
        end
      reg67 <= $unsigned((!reg62[(2'h2):(1'h1)]));
    end
  module68 #() modinst172 (.wire72(wire3), .wire69(wire1), .wire71(wire5), .clk(clk), .wire70(wire54), .y(wire171));
  assign wire173 = $signed(wire54);
  assign wire174 = wire1[(3'h7):(3'h4)];
  assign wire175 = wire174[(1'h1):(1'h1)];
endmodule

module module68  (y, clk, wire69, wire70, wire71, wire72);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire69;
  input wire signed [(5'h12):(1'h0)] wire70;
  input wire [(4'h8):(1'h0)] wire71;
  input wire [(5'h10):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  wire signed [(4'hc):(1'h0)] wire168;
  wire [(3'h6):(1'h0)] wire167;
  wire signed [(5'h14):(1'h0)] wire166;
  wire [(5'h15):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(3'h6):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire109;
  wire signed [(4'hb):(1'h0)] wire164;
  assign y = {wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire73,
                 wire74,
                 wire107,
                 wire109,
                 wire164,
                 (1'h0)};
  assign wire73 = $unsigned(((wire69 || $unsigned(wire72)) ^ wire71));
  assign wire74 = wire73[(4'hb):(4'h9)];
  module75 #() modinst108 (wire107, clk, wire71, wire72, wire73, wire74);
  assign wire109 = (wire72 ?
                       (8'hbb) : ((wire107 - wire71[(3'h4):(1'h0)]) - $unsigned($unsigned({wire107,
                           wire71}))));
  module110 #() modinst165 (.wire113(wire71), .wire112(wire73), .wire114(wire70), .y(wire164), .wire115(wire74), .wire111(wire72), .clk(clk));
  assign wire166 = wire109[(1'h0):(1'h0)];
  assign wire167 = (!((~|wire70) ~^ wire107[(3'h4):(1'h1)]));
  assign wire168 = (!$signed((-wire70)));
  assign wire169 = ((-$signed((^~(wire74 << wire73)))) ?
                       wire71[(1'h1):(1'h0)] : {(($signed(wire166) ?
                                   $unsigned((8'haa)) : (7'h42)) ?
                               ($unsigned(wire166) != (8'had)) : wire73),
                           ($signed((^wire69)) >>> $unsigned((wire74 ?
                               wire74 : (8'h9e))))});
  assign wire170 = $unsigned($unsigned((((~|wire71) >>> (!wire71)) > (7'h40))));
endmodule

module module6
#(parameter param47 = {{(+(&((8'haf) ^ (8'haf)))), ((((8'hb0) ? (8'h9d) : (8'h9c)) ^ {(8'ha7), (8'hbe)}) == {(+(7'h43))})}, (((((8'hbd) || (8'haa)) ? (~^(8'hbe)) : (~^(7'h44))) ? (((8'ha0) - (8'hae)) || ((8'hb4) ? (8'haa) : (8'h9f))) : ((+(8'ha4)) ? (^(8'hb4)) : ((8'h9f) ? (8'ha7) : (8'ha7)))) ? {(|(8'hbb))} : ((8'ha7) ? {((8'hbe) ? (8'ha5) : (8'ha9)), {(8'h9d), (8'hac)}} : {(+(8'hba)), ((7'h44) ? (8'hbe) : (8'hbb))}))})
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire23;
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire11,
                 wire12,
                 wire23,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire11 = ($signed((8'h9c)) ?
                      $unsigned(wire7[(3'h4):(1'h1)]) : $unsigned((7'h42)));
  assign wire12 = wire10;
  module13 #() modinst24 (wire23, clk, wire12, wire7, wire10, wire8, wire11);
  assign wire25 = ((((~wire23) ?
                      $signed(((8'hac) - wire11)) : $unsigned(wire7[(4'h9):(3'h6)])) >= $unsigned(wire9)) != (({(wire7 ?
                                  wire11 : wire7),
                              $signed(wire12)} ?
                          (&$signed(wire9)) : ($signed(wire12) ?
                              (!wire7) : wire11[(4'h9):(3'h6)])) ?
                      (({wire23} ? wire12 : $unsigned(wire10)) ?
                          $unsigned((~&wire7)) : {(wire23 | wire11)}) : (wire7[(3'h7):(3'h7)] <<< wire9)));
  assign wire26 = (~|$signed($signed($signed($unsigned(wire7)))));
  assign wire27 = ($unsigned($unsigned((~^(+wire11)))) ?
                      $unsigned({$unsigned(wire7[(3'h5):(2'h2)])}) : wire26);
  assign wire28 = {((|(((8'haa) ? (8'hb4) : wire8) + (wire7 ?
                              wire8 : (8'ha1)))) ?
                          ($signed((wire9 ? wire26 : wire23)) ?
                              (8'h9d) : ((|wire26) ^~ (wire10 <<< wire9))) : ($unsigned((wire9 >= wire23)) ?
                              $signed((8'ha3)) : ((&wire9) ?
                                  {wire26} : wire25))),
                      $unsigned($unsigned(wire8))};
  assign wire29 = (((^wire25) ?
                          wire28[(1'h0):(1'h0)] : (wire26 ?
                              (^wire8[(3'h4):(2'h3)]) : wire23[(3'h4):(1'h1)])) ?
                      $unsigned(((wire23[(3'h4):(3'h4)] ?
                          wire12[(4'hf):(3'h7)] : $unsigned(wire12)) * ($signed(wire10) >>> wire7[(3'h7):(3'h5)]))) : $signed($signed($signed((wire10 ?
                          wire25 : wire9)))));
  assign wire30 = {$signed((&((-wire28) ^~ wire8[(2'h3):(2'h2)]))),
                      $signed(wire28)};
  assign wire31 = wire7[(2'h3):(1'h1)];
  assign wire32 = {wire10[(4'h8):(2'h3)],
                      (~|(+(wire28 ^~ $unsigned((8'ha7)))))};
  assign wire33 = (8'h9d);
  always
    @(posedge clk) begin
      reg34 <= {wire31, {($signed(wire32) == (!wire7[(3'h5):(2'h2)])), wire29}};
      reg35 <= $signed($signed((((reg34 ? reg34 : wire33) < (wire9 ?
              wire9 : reg34)) ?
          ($unsigned((8'ha8)) ? wire25 : reg34[(3'h5):(1'h1)]) : wire26)));
      if (wire11[(2'h3):(1'h1)])
        begin
          reg36 <= wire32;
          reg37 <= wire29;
          reg38 <= wire11[(3'h5):(2'h2)];
          if (reg37)
            begin
              reg39 <= $unsigned($signed(reg35));
              reg40 <= $unsigned($signed(wire11[(2'h3):(2'h3)]));
              reg41 <= $unsigned(((~^reg39[(4'h8):(3'h4)]) ?
                  (($unsigned((8'hbc)) & wire12) != wire26[(3'h4):(3'h4)]) : ((wire23 <<< wire33[(2'h2):(1'h1)]) ?
                      (wire8[(4'hd):(3'h4)] * ((8'h9d) ?
                          wire25 : wire9)) : $unsigned(wire29))));
            end
          else
            begin
              reg39 <= wire28;
              reg40 <= (~|(^$signed($unsigned(reg39))));
              reg41 <= wire25[(3'h5):(2'h2)];
              reg42 <= ((wire26 && $signed(($signed((8'hb0)) == $unsigned((8'ha2))))) ?
                  (wire28 >= $signed($signed($signed((8'ha5))))) : (($unsigned($unsigned(wire9)) ?
                      reg35[(3'h5):(2'h3)] : $unsigned($unsigned(wire30))) << $signed($signed(wire8))));
            end
        end
      else
        begin
          reg36 <= wire30[(2'h2):(1'h1)];
          reg37 <= $unsigned(wire9[(3'h7):(3'h4)]);
          reg38 <= (^wire33);
          reg39 <= wire28[(1'h1):(1'h1)];
        end
      reg43 <= wire32;
    end
  assign wire44 = wire12;
  assign wire45 = wire10[(4'hb):(3'h7)];
  assign wire46 = reg43[(3'h6):(2'h2)];
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  assign y = {wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = wire14[(3'h6):(3'h6)];
  assign wire20 = ($unsigned((~|$signed((wire15 ? wire14 : wire16)))) ?
                      wire19[(5'h10):(4'h8)] : wire18[(4'hb):(3'h4)]);
  assign wire21 = (^~$unsigned({(~|$signed(wire20)), (-$signed(wire18))}));
  assign wire22 = $unsigned({($signed((wire14 & wire19)) ?
                          $signed((&wire18)) : $signed($signed(wire14))),
                      (^$unsigned((8'had)))});
endmodule

module module110
#(parameter param163 = ((!({((8'hb2) ? (8'hb1) : (8'hba)), ((8'hac) ? (8'hb4) : (8'hbd))} && (((7'h40) & (8'ha3)) ? {(8'hb5)} : {(8'hbd)}))) ? (~^((~((8'ha8) << (8'hb1))) ? ((|(7'h40)) ? (~&(8'ha5)) : (~|(8'ha5))) : {((8'hb7) < (8'ha6))})) : ((|(^{(8'hac)})) <<< (^~(~|((8'hb9) << (8'hb0)))))))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h230):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire115;
  input wire [(3'h6):(1'h0)] wire114;
  input wire signed [(4'h8):(1'h0)] wire113;
  input wire signed [(5'h15):(1'h0)] wire112;
  input wire [(3'h7):(1'h0)] wire111;
  wire signed [(5'h13):(1'h0)] wire162;
  wire signed [(3'h6):(1'h0)] wire161;
  wire [(3'h5):(1'h0)] wire160;
  wire [(4'h8):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire144;
  wire [(3'h5):(1'h0)] wire143;
  wire [(4'hf):(1'h0)] wire142;
  wire [(2'h3):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire signed [(4'h8):(1'h0)] wire136;
  wire signed [(2'h3):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire134;
  wire [(2'h2):(1'h0)] wire133;
  wire [(4'hd):(1'h0)] wire132;
  wire [(4'ha):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire116;
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  reg [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg [(3'h7):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(4'hf):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire118,
                 wire117,
                 wire116,
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
                 reg139,
                 reg138,
                 reg137,
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
                 (1'h0)};
  assign wire116 = {$unsigned($signed($unsigned((+wire111)))),
                       ($unsigned(wire113[(3'h5):(3'h4)]) ?
                           (~^$unsigned($signed(wire111))) : {((wire113 ?
                                   wire112 : wire114) >>> wire112),
                               wire114})};
  assign wire117 = (wire116[(3'h5):(3'h5)] ^~ wire115);
  assign wire118 = (wire117 > wire111[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg119 <= (-{wire116});
      if (wire116[(2'h2):(1'h1)])
        begin
          if ((wire117 ?
              (~|(+$unsigned($unsigned(wire115)))) : $signed($signed(reg119[(3'h6):(2'h2)]))))
            begin
              reg120 <= $signed((~|$signed($unsigned((8'hb3)))));
            end
          else
            begin
              reg120 <= $signed(wire113[(3'h7):(3'h5)]);
              reg121 <= wire111;
            end
          if (wire117[(3'h4):(2'h2)])
            begin
              reg122 <= {wire111};
              reg123 <= (^$signed($signed($signed($unsigned(wire111)))));
              reg124 <= reg123;
              reg125 <= (8'hbb);
            end
          else
            begin
              reg122 <= (((~|$signed($unsigned(wire115))) ?
                      wire118 : (((wire111 ? wire117 : wire112) ?
                          (wire113 ?
                              wire114 : reg120) : $signed(wire111)) ^ ((reg121 >= reg124) > (wire115 || wire111)))) ?
                  (wire112[(5'h12):(2'h2)] ?
                      (^~$unsigned((-wire116))) : reg125[(4'h8):(3'h6)]) : reg122[(3'h7):(1'h1)]);
              reg123 <= $signed(((reg120 | reg122[(2'h3):(2'h2)]) && $unsigned(reg119)));
              reg124 <= $signed(reg125);
              reg125 <= (~((^~reg123) ?
                  {$unsigned(reg122)} : (((reg121 ? wire113 : reg120) ?
                          (wire111 - wire112) : $signed(reg121)) ?
                      ((reg125 ? wire114 : (8'hab)) ?
                          $signed(reg120) : {reg124,
                              wire115}) : wire112[(5'h12):(4'hd)])));
            end
          if (reg121[(2'h2):(1'h0)])
            begin
              reg126 <= (reg122[(1'h1):(1'h1)] ?
                  $signed($unsigned({$signed(reg123),
                      reg122[(3'h5):(2'h3)]})) : wire114);
            end
          else
            begin
              reg126 <= (8'hb9);
            end
        end
      else
        begin
          reg120 <= (^~$signed((^~wire116[(1'h0):(1'h0)])));
          if ((~|wire118[(2'h2):(2'h2)]))
            begin
              reg121 <= wire116;
              reg122 <= {{$signed((-$signed(wire114)))}};
              reg123 <= ((-{$signed((reg120 ? wire111 : (8'ha5))),
                      $signed((reg123 ? (8'ha5) : wire111))}) ?
                  ((($signed((8'ha1)) ?
                              (wire112 ?
                                  wire116 : wire114) : (wire116 >>> reg120)) ?
                          $unsigned($signed(reg120)) : (-$unsigned(wire114))) ?
                      wire114[(3'h4):(2'h2)] : $unsigned((+(reg120 >>> reg125)))) : (wire112 ?
                      (((~wire113) ?
                          {(8'hb7),
                              wire111} : $signed(wire114)) == reg120) : $unsigned((8'hbb))));
              reg124 <= ((((-(!(8'haa))) ?
                      (&$signed(wire115)) : (|$signed(wire117))) || $signed(($unsigned(reg124) ?
                      $signed(wire114) : (~|wire113)))) ?
                  wire116 : wire115);
              reg125 <= (|$signed(({{wire118},
                  wire113[(4'h8):(1'h1)]} && ({wire115, wire115} >= (wire111 ?
                  (8'hb0) : wire117)))));
            end
          else
            begin
              reg121 <= wire116;
              reg122 <= reg121;
              reg123 <= ((^~$signed($unsigned((reg124 ? reg122 : reg121)))) ?
                  $signed(reg125[(2'h2):(1'h1)]) : (reg121[(4'h8):(2'h3)] ?
                      reg124[(5'h10):(4'hc)] : $unsigned(reg126)));
              reg124 <= wire115[(2'h2):(1'h0)];
            end
          reg126 <= wire118;
          reg127 <= $unsigned(($unsigned((reg122 >>> $signed(wire115))) ?
              {reg126, (~^$signed(wire118))} : reg126));
        end
      reg128 <= $unsigned(wire114[(3'h6):(3'h6)]);
      reg129 <= (+(((((8'h9c) & (8'haf)) + $unsigned((8'hb2))) ?
          reg123 : $signed($signed((8'hb3)))) << (|$unsigned(reg127))));
      reg130 <= wire112[(5'h10):(3'h7)];
    end
  assign wire131 = $signed($signed((8'h9d)));
  assign wire132 = {reg129[(1'h0):(1'h0)]};
  assign wire133 = wire117;
  assign wire134 = (~&$unsigned((&({wire117} ?
                       (+wire113) : (wire116 ? (8'hb8) : reg130)))));
  assign wire135 = $signed($signed(((^~wire111[(2'h3):(2'h3)]) ?
                       {$signed(wire112),
                           (wire113 ?
                               (7'h44) : (7'h41))} : wire111[(2'h2):(1'h0)])));
  assign wire136 = $unsigned((&$signed((^~(reg123 < reg120)))));
  always
    @(posedge clk) begin
      reg137 <= reg126;
      reg138 <= wire136[(4'h8):(3'h6)];
      reg139 <= $signed((^~($unsigned(wire117) - $unsigned({reg126, reg124}))));
    end
  assign wire140 = $unsigned(wire114);
  assign wire141 = (reg123[(1'h1):(1'h1)] < (&$unsigned((8'ha8))));
  assign wire142 = wire134[(5'h10):(4'ha)];
  assign wire143 = $unsigned((~^(^~(^~{wire141}))));
  assign wire144 = (^$unsigned((~$signed((&(8'hae))))));
  assign wire145 = (~^$unsigned($signed(({reg137, reg121} ?
                       {wire115, wire117} : (8'ha1)))));
  always
    @(posedge clk) begin
      reg146 <= {($unsigned($unsigned((+wire136))) ?
              ({$unsigned(reg121)} | $signed((wire144 ?
                  wire145 : reg128))) : (-reg121[(1'h1):(1'h1)])),
          (($signed((&(8'haf))) < ((wire115 ?
                  reg124 : reg124) != $signed(wire134))) ?
              ((~&(~|wire116)) >> $unsigned($signed((8'ha8)))) : $unsigned($unsigned(reg138)))};
      if ((+(|(reg124[(4'hd):(3'h4)] <= wire140))))
        begin
          reg147 <= $signed(reg128);
          if ($unsigned(((~(^~(wire132 ? (8'hb6) : (8'hbc)))) ?
              ((~&$unsigned(wire116)) ?
                  wire134 : (~(reg123 ? wire134 : reg129))) : (({reg128,
                      reg137} ?
                  {wire115} : reg122[(2'h2):(1'h0)]) + $signed($signed(wire132))))))
            begin
              reg148 <= (((^~wire132) < wire113[(2'h2):(2'h2)]) ?
                  $signed(wire113) : $signed({(8'hb0), reg119[(1'h1):(1'h0)]}));
            end
          else
            begin
              reg148 <= $unsigned({reg124,
                  ($unsigned(reg121[(3'h5):(2'h2)]) ?
                      $unsigned($unsigned(wire140)) : (((8'hbd) ?
                              wire112 : reg120) ?
                          $unsigned(reg147) : {wire140, wire145}))});
              reg149 <= $unsigned(($signed(wire141[(2'h3):(1'h1)]) ?
                  reg125[(4'h8):(3'h4)] : $signed($unsigned((~^(7'h43))))));
              reg150 <= (+wire133);
              reg151 <= wire131[(3'h5):(3'h5)];
            end
          if ({{(~|(wire113 > reg146[(1'h1):(1'h1)]))}})
            begin
              reg152 <= wire111;
              reg153 <= reg123[(3'h4):(2'h2)];
            end
          else
            begin
              reg152 <= $signed((~^(|wire116[(2'h2):(2'h2)])));
              reg153 <= reg149;
              reg154 <= $unsigned(reg128[(2'h2):(1'h0)]);
              reg155 <= ($signed($unsigned((7'h40))) ?
                  reg146 : (wire131 - ($unsigned(reg137[(3'h7):(3'h7)]) != (wire113[(1'h0):(1'h0)] ?
                      (~&reg151) : (wire132 ? reg153 : reg127)))));
              reg156 <= $signed(((7'h44) ^ (+$unsigned((wire114 >> (8'ha1))))));
            end
        end
      else
        begin
          reg147 <= (wire111[(1'h1):(1'h0)] ?
              (~|($unsigned($signed(reg139)) ?
                  $unsigned((wire133 ?
                      reg123 : reg121)) : $unsigned((reg146 || reg127)))) : $unsigned({($unsigned(wire112) ?
                      ((8'ha0) ^~ reg125) : $unsigned(wire135))}));
        end
      reg157 <= (|$signed(reg152));
      reg158 <= ((($unsigned((reg139 + reg157)) ?
                  (reg153 ? $signed(reg127) : $signed(wire141)) : wire142) ?
              (wire136 || $signed((wire143 - wire115))) : {$unsigned(((8'h9c) < reg147))}) ?
          $signed(reg127) : $signed((~|(+wire115[(4'hb):(3'h7)]))));
    end
  assign wire159 = {$signed($unsigned($unsigned($signed(reg158))))};
  assign wire160 = (8'hac);
  assign wire161 = {((|$unsigned((reg121 ? reg122 : wire115))) ?
                           (~|(8'hba)) : ({(!(8'hb4)),
                               reg157[(5'h12):(5'h10)]} ^ ($unsigned(wire143) >> $signed(reg129)))),
                       ($unsigned(reg158) || reg150)};
  assign wire162 = $signed((((((8'hb8) ?
                           wire131 : (8'had)) != $unsigned((8'ha0))) == $unsigned($unsigned(wire135))) ?
                       ($unsigned((~|reg139)) ?
                           wire144 : {{wire131},
                               {wire131, reg153}}) : ($unsigned((+reg126)) ?
                           wire134 : reg122)));
endmodule

module module75
#(parameter param106 = (((|((~^(8'hb4)) ? ((7'h42) ? (8'hb2) : (8'hbf)) : ((8'hb9) ? (8'ha6) : (7'h44)))) ? (~&(((8'hbc) ? (8'ha0) : (8'hbf)) ? (~(8'hba)) : ((8'hb1) ? (8'hb4) : (8'ha2)))) : ((^(~^(7'h40))) ? {((8'hbc) ? (8'hb3) : (8'hbf))} : {{(8'hbf)}, (|(8'hb4))})) <<< {((((8'hb4) * (8'hbb)) ? {(7'h44), (8'hb5)} : (~(8'hab))) ? (((8'hb6) && (8'hb8)) ? ((8'hab) ? (8'hbf) : (8'hbe)) : (8'ha2)) : (+{(8'ha0), (8'ha0)})), ((8'hb1) ? (((8'hab) ? (8'h9f) : (8'hbb)) >= ((8'hb5) ? (8'had) : (8'hbb))) : (8'ha5))}))
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire79;
  input wire [(4'h8):(1'h0)] wire78;
  input wire [(2'h2):(1'h0)] wire77;
  input wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire104;
  wire signed [(5'h11):(1'h0)] wire103;
  wire signed [(5'h14):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire [(4'hd):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  reg signed [(5'h14):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire82,
                 wire81,
                 wire80,
                 reg102,
                 reg101,
                 reg100,
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
  assign wire80 = (-($unsigned($signed(wire78)) >>> wire79));
  assign wire81 = wire78[(4'h8):(1'h1)];
  assign wire82 = (((~((wire80 ?
                          (8'h9d) : wire81) && $signed(wire77))) == wire81) ?
                      ((8'hb0) ?
                          $unsigned(wire77) : $signed(wire78)) : $unsigned($unsigned($unsigned($unsigned(wire81)))));
  always
    @(posedge clk) begin
      if (($unsigned((wire77 ?
              ($signed(wire76) ~^ wire81[(4'h9):(3'h5)]) : wire80[(3'h7):(1'h0)])) ?
          wire78[(3'h4):(2'h3)] : wire77[(1'h0):(1'h0)]))
        begin
          reg83 <= $signed($signed(wire80[(2'h2):(1'h0)]));
          if ((wire80 ?
              wire82 : ((((wire79 + (8'hba)) & (reg83 & wire76)) ?
                      ((reg83 & wire79) ~^ wire77[(2'h2):(1'h0)]) : wire81) ?
                  wire81[(4'ha):(1'h1)] : {$signed((wire80 | wire78))})))
            begin
              reg84 <= (($unsigned(wire77) ?
                      wire76 : $signed($unsigned(wire78))) ?
                  ({(~|$signed(wire80))} * $unsigned(wire77[(1'h1):(1'h1)])) : ((~&wire80) ?
                      (+(8'hb2)) : ($unsigned((wire78 ?
                          (8'hb4) : wire82)) >= ((wire77 == wire77) ?
                          (wire76 ^ wire78) : (8'h9d)))));
              reg85 <= ($signed($signed(({wire77} >>> wire82))) < $unsigned({(~wire79)}));
              reg86 <= wire80[(4'h8):(4'h8)];
              reg87 <= $signed({(|reg83), reg85[(3'h6):(2'h3)]});
            end
          else
            begin
              reg84 <= $unsigned($signed({($unsigned(wire76) != $signed(reg87))}));
              reg85 <= {$unsigned($signed(wire76)), reg84};
              reg86 <= ({(reg85 + (reg83 > $unsigned(wire81)))} >>> $unsigned(reg83));
              reg87 <= $signed(((!(~|wire82[(4'hb):(4'ha)])) ?
                  $signed({{wire82}, wire81[(3'h5):(1'h1)]}) : wire77));
              reg88 <= $unsigned(wire80[(4'hf):(3'h5)]);
            end
          reg89 <= ((-(&$unsigned((!reg84)))) >= (+$unsigned($signed((reg87 + reg84)))));
        end
      else
        begin
          if (((^~$unsigned(((wire79 ~^ wire77) ?
                  {wire82, reg86} : (reg87 ? wire78 : wire77)))) ?
              reg87 : ((~(!reg86[(4'h9):(3'h4)])) ?
                  (~((reg87 | reg84) - (reg86 >= (8'ha7)))) : ({(reg85 && wire78)} ?
                      $unsigned((reg84 ?
                          wire79 : wire80)) : wire77[(1'h0):(1'h0)]))))
            begin
              reg83 <= {wire77[(1'h0):(1'h0)], {$unsigned((!wire79))}};
              reg84 <= $unsigned(reg88[(1'h0):(1'h0)]);
              reg85 <= wire79;
            end
          else
            begin
              reg83 <= wire82;
              reg84 <= ((8'ha1) * (8'hb1));
              reg85 <= wire78;
              reg86 <= (reg83[(2'h2):(1'h0)] ?
                  (|reg88[(1'h1):(1'h0)]) : (~^(((wire76 ~^ reg83) ?
                          (wire82 ? wire76 : (8'h9f)) : (wire80 ?
                              wire78 : wire81)) ?
                      $unsigned($signed(reg83)) : $signed($signed(wire78)))));
              reg87 <= (^~(wire79[(1'h1):(1'h0)] ?
                  ($signed($signed(wire80)) ?
                      wire79 : $unsigned((wire76 ?
                          (8'haa) : reg87))) : $unsigned((wire79 * (&wire79)))));
            end
          reg88 <= ((^~(~&$signed(wire76))) ?
              reg84 : ($unsigned(reg83) || ((8'ha9) ?
                  {{wire79, wire80}, (wire80 ? wire82 : wire78)} : wire77)));
          reg89 <= wire81[(4'hb):(3'h4)];
          if ({($signed((reg85 ?
                  (^~reg87) : $unsigned((8'hb2)))) && $signed(((reg85 ?
                      wire77 : reg88) ?
                  (reg89 != reg85) : ((8'hb6) ? wire78 : (8'hb2))))),
              reg84})
            begin
              reg90 <= wire82[(4'hb):(4'ha)];
              reg91 <= ($unsigned(({$signed((8'hbd))} * reg88[(4'ha):(1'h1)])) ?
                  (+(~^wire82[(1'h1):(1'h0)])) : (+(((8'ha3) ?
                          reg88[(1'h1):(1'h1)] : $signed((8'ha0))) ?
                      (reg86 >> (wire80 ? wire78 : reg83)) : wire78)));
            end
          else
            begin
              reg90 <= $signed({(reg88 ?
                      $signed((wire77 ?
                          (8'haf) : wire81)) : (reg88[(4'hb):(3'h4)] ?
                          wire81 : {(8'hb8), wire81})),
                  $unsigned($signed($unsigned(reg85)))});
              reg91 <= $signed((|$unsigned($signed(wire79))));
              reg92 <= {wire79};
              reg93 <= (+(-({reg92[(5'h12):(3'h5)]} + $unsigned(reg87))));
              reg94 <= $unsigned((^~wire79[(1'h1):(1'h1)]));
            end
        end
    end
  assign wire95 = {(&reg84[(4'h9):(1'h0)]), reg91};
  assign wire96 = {reg83, $unsigned((!{reg86[(3'h4):(2'h2)]}))};
  assign wire97 = reg84[(2'h2):(1'h0)];
  assign wire98 = (~|wire97);
  assign wire99 = ($signed(wire77[(1'h1):(1'h0)]) > (reg92[(4'he):(2'h3)] << wire76));
  always
    @(posedge clk) begin
      reg100 <= (($signed($unsigned({(8'hbc), wire79})) ?
              $signed(($unsigned(wire81) + wire96[(1'h0):(1'h0)])) : $signed((~|$unsigned(wire96)))) ?
          ((wire76 >= $unsigned(reg89)) >> ($unsigned((wire79 ?
                  wire76 : (8'ha0))) ?
              ($signed(reg93) ?
                  (~^(8'h9d)) : $unsigned(reg89)) : wire79[(1'h0):(1'h0)])) : wire80[(3'h6):(3'h6)]);
      reg101 <= $unsigned((reg85[(3'h4):(2'h3)] || (8'hb0)));
      reg102 <= $unsigned(((^wire96[(3'h4):(2'h2)]) ?
          reg85[(4'hb):(1'h0)] : (reg88 ?
              reg88[(4'hc):(3'h7)] : $signed({(8'ha9)}))));
    end
  assign wire103 = ({{reg87, (|$signed(reg94))}, wire81[(3'h4):(2'h3)]} ?
                       {((wire82 ? reg86 : (reg102 ? (8'hb2) : wire76)) ?
                               ({reg94, (8'ha3)} ?
                                   {reg83} : (8'ha0)) : ($signed(wire82) ^ (reg102 ~^ reg89)))} : reg93[(4'hc):(3'h5)]);
  assign wire104 = (({wire95} ~^ (8'hb6)) <= reg90[(3'h5):(2'h2)]);
  assign wire105 = {(reg92[(4'h8):(1'h1)] ?
                           (($unsigned(wire97) >= wire99[(5'h12):(4'hf)]) == (~|((8'h9f) ?
                               reg84 : wire103))) : $signed($unsigned({reg88,
                               wire80}))),
                       wire78};
endmodule
