module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire129;
  wire signed [(4'hf):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire126;
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire39,
                 wire41,
                 wire126,
                 reg42,
                 (1'h0)};
  module5 #() modinst40 (.clk(clk), .wire7(wire4), .wire6(wire1), .wire9(wire3), .y(wire39), .wire8(wire2));
  assign wire41 = (($signed((wire0 ?
                          (~&wire39) : (wire39 ^~ wire2))) | $unsigned($unsigned(wire2[(2'h3):(1'h0)]))) ?
                      $unsigned($signed(wire39)) : wire39);
  always
    @(posedge clk) begin
      reg42 <= (wire4[(1'h1):(1'h0)] ?
          $unsigned({((&wire2) ? wire3 : (wire1 - wire41))}) : $signed(wire0));
    end
  module43 #() modinst127 (.wire48(wire3), .wire46(wire0), .wire47(wire4), .wire45(wire41), .wire44(wire1), .y(wire126), .clk(clk));
  assign wire128 = (wire41[(4'hf):(1'h1)] ?
                       (wire1[(4'he):(4'he)] ?
                           $unsigned(wire3[(5'h10):(5'h10)]) : ({(wire2 ?
                                       wire4 : wire0)} ?
                               (^(!wire4)) : wire4[(5'h12):(4'ha)])) : (((^~{wire126}) ^~ wire126) ?
                           wire126 : (8'hb3)));
  assign wire129 = (~|(wire1[(2'h2):(1'h1)] ?
                       $signed($signed({wire39})) : (~wire126[(4'hf):(4'hb)])));
  assign wire130 = $signed((($unsigned($signed(wire41)) ?
                           ($unsigned(wire129) - $unsigned((8'ha3))) : $signed(wire129)) ?
                       ({(~|wire126)} > $unsigned((wire3 != wire1))) : (((reg42 ?
                               wire39 : wire39) ?
                           wire41 : {(7'h44)}) == wire0)));
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire48;
  input wire [(5'h14):(1'h0)] wire47;
  input wire [(4'hf):(1'h0)] wire46;
  input wire signed [(5'h14):(1'h0)] wire45;
  input wire [(4'he):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire75;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire124;
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  assign y = {wire100,
                 wire75,
                 wire50,
                 wire49,
                 wire102,
                 wire103,
                 wire106,
                 wire107,
                 wire124,
                 reg105,
                 reg104,
                 (1'h0)};
  assign wire49 = $unsigned(($unsigned(({wire45} ?
                      (wire46 ^ wire47) : (wire46 ?
                          wire48 : wire47))) || $unsigned(((8'h9c) | (|(8'hbf))))));
  assign wire50 = {wire49};
  module51 #() modinst76 (.wire52(wire49), .wire53(wire46), .wire54(wire47), .y(wire75), .wire55(wire48), .clk(clk));
  module77 #() modinst101 (wire100, clk, wire44, wire48, wire46, wire45, wire50);
  assign wire102 = $unsigned({{((wire100 != wire47) ? wire100 : wire44)}});
  assign wire103 = wire102;
  always
    @(posedge clk) begin
      reg104 <= {(((~^$signed(wire44)) ?
              ((wire75 <<< wire49) ?
                  wire49[(3'h6):(1'h0)] : (~|wire47)) : (8'hab)) >>> $unsigned({(wire75 ?
                  wire100 : wire47)}))};
      reg105 <= $signed($signed(((-$unsigned(wire75)) || wire46)));
    end
  assign wire106 = wire50;
  assign wire107 = $unsigned((~^wire47[(5'h12):(4'hf)]));
  module108 #() modinst125 (wire124, clk, wire48, wire102, wire75, wire106, wire107);
endmodule

module module5
#(parameter param37 = (-((((8'hab) ? ((8'ha5) ? (8'had) : (8'hb1)) : ((8'ha2) ? (8'hbc) : (8'hbc))) > (((8'ha2) ? (8'hba) : (8'h9e)) ? (~^(8'hb6)) : ((8'h9c) ? (8'ha4) : (8'ha2)))) ? ({((8'hb1) <= (8'hbf))} ? (+(+(8'hbe))) : (!(8'hac))) : (((~|(8'hb4)) ~^ ((7'h41) << (8'h9e))) & (((8'had) - (8'hac)) + ((8'hb9) ? (8'ha5) : (8'h9e)))))), 
parameter param38 = (!(~^(^~param37))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg34,
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
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= ($unsigned($signed($signed((wire8 ?
          wire7 : (8'hab))))) << $unsigned((($unsigned(wire9) ?
              wire9 : (wire6 ? wire6 : wire8)) ?
          (&(!wire7)) : $unsigned($signed(wire8)))));
      reg11 <= $unsigned($unsigned((wire6 >> $signed(((8'hb2) ?
          (8'ha3) : wire8)))));
      reg12 <= reg10[(2'h2):(1'h1)];
    end
  assign wire13 = $signed($unsigned((($unsigned(wire8) ?
                      wire7 : (wire9 ? reg10 : wire8)) <<< (8'hb5))));
  assign wire14 = wire13;
  assign wire15 = (((!$signed((wire13 <<< reg12))) && (($signed(wire14) ?
                      $unsigned(reg12) : $unsigned(wire8)) != $unsigned((wire13 ^~ reg10)))) & (^~(wire6 ^~ (~(-reg10)))));
  assign wire16 = ((|$unsigned((-$unsigned((8'hb9))))) != wire6[(3'h6):(1'h1)]);
  assign wire17 = {((~|reg10) ?
                          wire7 : $unsigned(((wire6 ? wire9 : wire15) ?
                              wire9[(3'h5):(1'h0)] : $signed((8'hae)))))};
  assign wire18 = ($unsigned($signed((&$unsigned((8'ha4))))) >>> wire13);
  assign wire19 = reg12[(3'h4):(3'h4)];
  assign wire20 = (~|($unsigned($unsigned($signed(wire7))) || (-(&(wire7 ?
                      wire13 : wire6)))));
  always
    @(posedge clk) begin
      reg21 <= wire9;
    end
  always
    @(posedge clk) begin
      if ($signed((~^reg12[(1'h1):(1'h0)])))
        begin
          if (($unsigned($signed($unsigned((|wire14)))) ?
              ((wire14[(5'h11):(3'h5)] & $unsigned((8'ha3))) ?
                  ((~|(~|reg21)) ?
                      $unsigned($signed(wire19)) : (~|$signed(wire8))) : {((reg21 ?
                          reg21 : (8'had)) > wire6)}) : {(+($signed(wire20) ?
                      wire7 : (wire17 ^ wire18))),
                  wire7}))
            begin
              reg22 <= $unsigned($signed(wire8));
              reg23 <= wire20[(3'h7):(2'h2)];
              reg24 <= (($unsigned((wire15[(1'h0):(1'h0)] || $unsigned(wire14))) ?
                  reg10[(2'h3):(2'h3)] : wire15[(3'h5):(2'h3)]) + (($unsigned((~&wire13)) ?
                  reg10 : {$unsigned(wire19),
                      reg12[(1'h0):(1'h0)]}) ^ wire14[(4'hf):(4'h8)]));
            end
          else
            begin
              reg22 <= $unsigned($signed(wire9[(4'hd):(1'h1)]));
              reg23 <= ($signed(reg10[(4'ha):(1'h1)]) != wire16[(4'ha):(3'h5)]);
              reg24 <= reg10;
              reg25 <= $signed((&(wire20[(1'h0):(1'h0)] ?
                  ($unsigned(reg12) ?
                      reg22 : $signed(wire9)) : (wire17 <<< $signed(wire9)))));
              reg26 <= ($unsigned((~|(reg24[(2'h2):(1'h0)] > $unsigned(reg21)))) ?
                  $unsigned($signed((+(wire19 * wire8)))) : wire17);
            end
          if (((^~(~reg22[(3'h6):(2'h2)])) ^ reg10))
            begin
              reg27 <= (~&$unsigned((&wire7)));
              reg28 <= (~wire17);
              reg29 <= wire13[(4'hb):(1'h0)];
              reg30 <= {$signed(($unsigned((reg10 ? reg21 : wire13)) ?
                      wire18[(1'h0):(1'h0)] : $unsigned((wire6 ?
                          reg21 : wire20)))),
                  $unsigned($unsigned((wire7 ?
                      $signed(reg28) : $signed(reg25))))};
              reg31 <= wire6[(3'h5):(2'h3)];
            end
          else
            begin
              reg27 <= wire7[(1'h0):(1'h0)];
            end
          reg32 <= (wire17 ? (~&reg28[(4'hf):(4'h8)]) : wire17[(4'h8):(1'h1)]);
        end
      else
        begin
          if ((((-(wire20[(1'h1):(1'h0)] ~^ wire13)) - (wire15[(1'h1):(1'h0)] ?
                  reg12 : $unsigned($unsigned(reg10)))) ?
              {wire17[(3'h5):(3'h5)]} : reg25))
            begin
              reg22 <= $signed(((((wire16 == reg22) ?
                      $unsigned(wire19) : (~^reg25)) ~^ (wire17 < {reg10})) ?
                  (~wire19) : (~|reg24)));
              reg23 <= $unsigned(((^~(~^{reg21, wire15})) ?
                  $signed(($unsigned(reg21) ?
                      (wire16 ? wire13 : wire7) : (^reg25))) : (^wire19)));
              reg24 <= $unsigned(reg10[(3'h7):(2'h2)]);
            end
          else
            begin
              reg22 <= (reg24 << $unsigned($unsigned({(reg29 << wire16),
                  (wire14 ? (8'hb7) : reg31)})));
              reg23 <= wire13[(3'h6):(3'h4)];
              reg24 <= ((~^(((reg24 + reg12) ?
                      reg26[(3'h6):(3'h6)] : $signed(wire13)) || (8'ha5))) ?
                  {((((8'hb8) ^ reg11) ?
                          (wire6 ? wire13 : reg24) : (reg27 ?
                              reg24 : wire13)) - ({wire20, reg12} ?
                          $unsigned(reg32) : {wire14,
                              wire15}))} : (reg28[(2'h3):(2'h3)] * ((|(reg32 < reg30)) ^~ $unsigned((|reg25)))));
              reg25 <= {(~$unsigned($signed(wire17[(3'h5):(1'h1)]))), reg12};
            end
          reg26 <= wire14[(4'hd):(2'h2)];
          reg27 <= wire8;
          if ($signed({wire9}))
            begin
              reg28 <= reg21;
            end
          else
            begin
              reg28 <= (~&$signed(((wire8[(1'h0):(1'h0)] ?
                  {reg31,
                      wire13} : {(8'ha5)}) != $unsigned($unsigned(wire8)))));
              reg29 <= reg22[(3'h7):(1'h0)];
              reg30 <= (~($unsigned(($signed(wire20) >>> (reg11 || reg24))) ^~ (reg12[(1'h1):(1'h1)] ?
                  reg11[(3'h4):(3'h4)] : ($unsigned(reg30) ?
                      ((8'hbb) ? reg26 : reg25) : wire14))));
              reg31 <= $signed((((&((8'h9f) ? reg29 : wire13)) ?
                  {$signed(wire20),
                      $unsigned(reg31)} : ((~^reg11) != $unsigned(reg26))) + wire13));
              reg32 <= (((|wire17[(3'h7):(1'h0)]) ?
                  $unsigned(reg22) : $signed((reg25 ?
                      (reg31 ^~ reg10) : $signed(reg25)))) * $signed({reg24}));
            end
        end
      reg33 <= wire17[(4'h8):(4'h8)];
      reg34 <= wire9[(5'h10):(4'h8)];
    end
  assign wire35 = (^~wire15);
  assign wire36 = reg22[(3'h7):(3'h4)];
endmodule

module module108  (y, clk, wire113, wire112, wire111, wire110, wire109);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire113;
  input wire [(2'h3):(1'h0)] wire112;
  input wire signed [(4'hd):(1'h0)] wire111;
  input wire [(2'h2):(1'h0)] wire110;
  input wire signed [(2'h2):(1'h0)] wire109;
  wire [(5'h12):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire120;
  wire signed [(4'hc):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire116;
  wire [(3'h7):(1'h0)] wire115;
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 reg114,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg114 <= (~(-wire109[(2'h2):(2'h2)]));
    end
  assign wire115 = {$signed($unsigned($signed((wire109 ? (7'h41) : reg114)))),
                       wire111[(4'h9):(2'h2)]};
  assign wire116 = {(8'hb5), wire113[(4'hd):(1'h1)]};
  assign wire117 = wire111[(3'h7):(2'h3)];
  assign wire118 = wire111;
  assign wire119 = ((|wire115[(1'h1):(1'h0)]) ?
                       ((wire118[(4'hc):(4'ha)] | (!wire117)) || (wire117[(2'h3):(2'h2)] ?
                           {(wire110 - wire117)} : wire109)) : reg114);
  assign wire120 = $signed($unsigned($unsigned($unsigned((wire112 <= (8'hae))))));
  assign wire121 = reg114[(3'h5):(2'h2)];
  assign wire122 = (^~wire117[(4'h9):(4'h9)]);
  assign wire123 = wire119;
endmodule

module module77
#(parameter param99 = (~&(({((8'hbf) ? (7'h40) : (8'ha7)), ((8'ha8) ? (8'haa) : (8'haa))} ? ((!(8'hac)) ? {(8'hbe)} : ((7'h42) > (7'h40))) : (^(~(8'ha6)))) ? ((+{(8'hb3)}) ? (&((7'h44) ? (8'hbd) : (8'ha4))) : (7'h42)) : {(+((8'ha1) ? (8'hbd) : (8'hb0)))})))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire82;
  input wire [(2'h3):(1'h0)] wire81;
  input wire [(4'hc):(1'h0)] wire80;
  input wire signed [(3'h6):(1'h0)] wire79;
  input wire [(4'hc):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire88;
  wire [(3'h5):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
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
                 (1'h0)};
  assign wire83 = $signed((wire79 == {$unsigned(wire79)}));
  assign wire84 = $signed($signed({(!$unsigned((8'ha0)))}));
  assign wire85 = {(~(wire81 ? $unsigned((wire79 & (8'had))) : wire78)),
                      (~|wire81)};
  assign wire86 = wire80[(4'h8):(1'h0)];
  assign wire87 = (wire78[(3'h4):(3'h4)] & $unsigned((~|$signed((wire86 && wire79)))));
  assign wire88 = wire84;
  always
    @(posedge clk) begin
      if ((wire78 < $unsigned(wire84[(2'h3):(1'h0)])))
        begin
          if (wire88[(4'hb):(3'h6)])
            begin
              reg89 <= wire80[(4'hb):(3'h7)];
              reg90 <= $unsigned(reg89);
              reg91 <= $signed(wire86[(3'h7):(3'h4)]);
              reg92 <= wire81[(1'h1):(1'h1)];
              reg93 <= $unsigned(((((reg89 ? wire84 : wire81) ?
                      $signed((8'hbd)) : (|wire84)) < $signed($signed((8'ha6)))) ?
                  wire83 : (($unsigned(wire83) <<< $signed(wire82)) >> wire87[(1'h1):(1'h1)])));
            end
          else
            begin
              reg89 <= (+{(({wire86, reg90} ?
                          $unsigned(wire78) : (wire83 ? reg90 : (8'hab))) ?
                      ($signed(reg92) ?
                          $signed(reg89) : (wire84 ?
                              wire84 : (8'hbc))) : wire87[(1'h1):(1'h1)]),
                  ($unsigned((wire83 ^ wire79)) <<< (~|$signed(wire84)))});
              reg90 <= (wire78 ^ $signed(((wire85[(5'h10):(1'h0)] >>> (reg89 ?
                  (8'hbc) : wire79)) && $unsigned(wire82[(3'h4):(2'h2)]))));
              reg91 <= wire83;
            end
          reg94 <= $signed(($signed(wire80[(4'h9):(3'h6)]) ^ $unsigned($unsigned($unsigned(wire82)))));
          reg95 <= $signed($unsigned(wire84[(4'he):(3'h7)]));
          reg96 <= $signed((wire85[(5'h10):(4'h8)] * (+({wire88,
              reg95} >= (wire86 ? reg91 : (8'hbb))))));
        end
      else
        begin
          reg89 <= ($unsigned($signed(((^~reg92) + wire82[(4'h9):(3'h5)]))) ?
              (+((8'h9e) - (((8'h9c) * wire88) ^ ((8'ha1) << wire79)))) : ($signed($signed(reg96[(3'h5):(2'h2)])) * ($unsigned((wire80 ?
                      reg91 : reg90)) ?
                  (((8'had) ? wire78 : reg89) ?
                      $unsigned(wire80) : $unsigned(reg95)) : $unsigned($unsigned(wire80)))));
        end
      reg97 <= ((reg95 ?
          ({(wire82 ? wire84 : wire86), (~|reg91)} + (~^{reg96,
              (8'haf)})) : $unsigned(({reg89} ?
              $unsigned(reg89) : (wire81 & reg90)))) << (!(reg91 + ($unsigned(wire86) & (~reg93)))));
      reg98 <= (8'hbb);
    end
endmodule

module module51
#(parameter param73 = {{(~^{{(7'h43)}, {(7'h40), (8'hbf)}}), {(((7'h42) ? (8'hb5) : (8'ha2)) | ((8'hb7) && (8'ha1))), (+((8'hb3) ? (7'h43) : (8'hbe)))}}}, 
parameter param74 = {param73, ((~|(param73 ? param73 : (param73 > param73))) ? (^~(~{param73, param73})) : ((param73 != param73) <= {(param73 ? param73 : param73)}))})
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire55;
  input wire [(5'h14):(1'h0)] wire54;
  input wire [(3'h6):(1'h0)] wire53;
  input wire signed [(4'hc):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  wire signed [(5'h14):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg63 = (1'h0);
  assign y = {wire72,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 (1'h0)};
  assign wire56 = wire55[(5'h11):(4'hf)];
  assign wire57 = (($signed(((~&wire55) ^ (~|wire54))) <<< ((~|wire53[(3'h6):(3'h6)]) >= $unsigned({wire53,
                      wire54}))) >>> (~&wire52));
  assign wire58 = wire56[(3'h6):(3'h5)];
  assign wire59 = wire55[(4'h8):(1'h1)];
  assign wire60 = wire56;
  assign wire61 = {(^$signed(((wire58 & wire57) ? {wire55} : (^(8'hb8))))),
                      ((~^(8'hb5)) ?
                          wire54[(3'h6):(2'h3)] : (+(wire53[(3'h6):(2'h3)] + $signed((7'h40)))))};
  assign wire62 = (+wire58);
  always
    @(posedge clk) begin
      reg63 <= {(^~(|wire61[(4'ha):(4'ha)])),
          ((-((!wire57) * (wire52 != wire62))) == (wire54[(4'hd):(1'h0)] >> wire58[(4'hb):(3'h7)]))};
      reg64 <= {wire53};
      reg65 <= (+(({$signed(wire52)} ?
              $unsigned((wire55 != wire52)) : $signed((8'h9d))) ?
          wire60 : wire53[(1'h0):(1'h0)]));
      if ((^~wire56))
        begin
          reg66 <= $signed((&$signed({(wire61 || wire62)})));
          reg67 <= $signed(($unsigned($unsigned(wire52)) <= $signed($unsigned(wire60[(3'h4):(2'h3)]))));
        end
      else
        begin
          reg66 <= $signed(((&wire59) < wire52));
          reg67 <= (reg64 ?
              ({reg65} - {(|$unsigned(wire55)),
                  ((reg64 + wire59) ?
                      ((8'ha4) ^ wire52) : $unsigned(wire60))}) : reg67[(2'h3):(1'h0)]);
          reg68 <= ($unsigned((8'hb9)) && $signed(reg67));
          reg69 <= $unsigned(reg68[(1'h1):(1'h0)]);
          reg70 <= (^$signed(wire58[(3'h4):(2'h3)]));
        end
      reg71 <= reg69;
    end
  assign wire72 = wire60[(1'h0):(1'h0)];
endmodule
