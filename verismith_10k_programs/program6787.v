module top
#(parameter param140 = ((((^~(!(8'hb5))) ? (!{(8'hb3), (8'hb1)}) : ((^(8'hb5)) == (~&(8'haa)))) ? (({(8'hbd)} ? (!(8'ha5)) : ((8'ha7) ? (7'h44) : (8'hb9))) ? ((~(8'hb9)) ? ((8'hb9) ? (8'ha5) : (8'hba)) : (-(8'hbf))) : (~^{(8'hb9)})) : ((~(~&(8'hba))) >> {(|(8'had)), ((8'hbc) * (8'h9d))})) ? {(~&((!(8'haa)) ? {(8'hb2), (8'hae)} : ((8'hba) | (8'hb1)))), {(+((7'h43) ? (8'ha5) : (8'hb5))), ((!(8'ha4)) || ((8'ha9) ? (8'hab) : (8'hbb)))}} : (~^((((8'h9d) ^~ (8'ha5)) >> ((8'ha5) ? (8'h9d) : (8'h9c))) > (~&((8'haa) <= (8'haa)))))), 
parameter param141 = (((((param140 < param140) ^ (^~param140)) ? param140 : (param140 >= param140)) != ((|param140) == param140)) - ((-(((8'ha9) ? param140 : param140) >>> (!param140))) ? (&(&(~^param140))) : {((8'ha8) <<< (~(8'h9d))), ((param140 ? (7'h41) : param140) >> (param140 <<< (8'hb1)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(5'h10):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire74;
  wire signed [(5'h11):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire79;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire85;
  wire signed [(3'h7):(1'h0)] wire138;
  assign y = {wire67,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire138,
                 (1'h0)};
  module5 #() modinst68 (.wire8(wire4), .clk(clk), .wire6(wire0), .wire10(wire1), .wire9(wire2), .y(wire67), .wire7(wire3));
  assign wire69 = wire67[(1'h0):(1'h0)];
  assign wire70 = $signed(($signed(((wire4 ? wire69 : wire67) >> ((8'ha3) ?
                          wire0 : (8'hae)))) ?
                      wire4[(3'h5):(3'h4)] : (($signed(wire67) ?
                              (wire1 ? wire0 : wire67) : {wire1}) ?
                          $signed(wire3) : (8'ha0))));
  assign wire71 = wire4;
  assign wire72 = wire70;
  assign wire73 = (-((wire69 ?
                          (wire67 ?
                              wire71 : (wire4 <<< wire0)) : $signed((!wire0))) ?
                      $unsigned($unsigned((wire3 >>> wire71))) : $signed(((wire69 ~^ wire2) ^~ ((8'hb0) ^ wire70)))));
  assign wire74 = $signed((~&(wire67[(4'h8):(1'h1)] ?
                      wire3[(3'h5):(1'h0)] : $unsigned({wire3}))));
  assign wire75 = (($unsigned(((wire72 >>> wire72) <<< $unsigned((8'ha7)))) | (8'h9c)) != wire2);
  assign wire76 = (8'hb4);
  assign wire77 = (!(wire4[(2'h2):(1'h1)] == $signed($unsigned((wire2 ?
                      (7'h44) : wire75)))));
  assign wire78 = $unsigned($signed((~$signed((-wire71)))));
  assign wire79 = (~^wire72[(4'ha):(4'ha)]);
  assign wire80 = wire67[(2'h3):(1'h0)];
  assign wire81 = (($signed($signed(wire73[(2'h3):(2'h2)])) << ((8'hbd) ?
                      {((8'hbc) ? (8'had) : (8'hb4)),
                          (wire77 ^~ wire0)} : $unsigned($signed((8'ha2))))) >= ($signed((wire75[(1'h0):(1'h0)] || {wire4})) ?
                      $signed((~wire72)) : $unsigned(wire78)));
  assign wire82 = wire3[(1'h1):(1'h0)];
  assign wire83 = (7'h42);
  assign wire84 = {(&$signed(wire72[(3'h7):(3'h6)]))};
  assign wire85 = (($signed($unsigned($signed(wire84))) * (wire70[(2'h3):(2'h2)] <<< wire71[(3'h4):(3'h4)])) <<< wire83);
  module86 #() modinst139 (wire138, clk, wire73, wire76, wire1, wire82, wire3);
endmodule

module module86
#(parameter param136 = ((|(!(((8'h9f) - (8'hb3)) ? (&(8'h9f)) : (~&(8'hb9))))) ? (((((8'hb7) >> (8'ha2)) == ((8'ha6) == (8'haf))) ? ({(8'hbf)} == (~&(8'hb6))) : (((8'hb6) ~^ (8'hb4)) ? (+(8'ha7)) : ((7'h42) <= (8'hb0)))) < (8'hbd)) : ((-((!(8'hbd)) << ((8'hbb) ~^ (8'ha5)))) ? (|(((8'ha4) ~^ (7'h42)) ? {(8'h9d), (8'h9c)} : ((7'h44) ? (8'ha6) : (8'haa)))) : (((^~(8'hb0)) || (~|(8'ha6))) ? (&((8'ha4) && (8'h9d))) : (((8'hb4) <<< (8'hb0)) <= ((8'haa) ? (8'ha9) : (8'hbc)))))), 
parameter param137 = param136)
(y, clk, wire91, wire90, wire89, wire88, wire87);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire91;
  input wire signed [(4'hd):(1'h0)] wire90;
  input wire [(4'hd):(1'h0)] wire89;
  input wire [(5'h14):(1'h0)] wire88;
  input wire signed [(2'h3):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire135;
  wire [(4'hc):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire133;
  wire [(5'h12):(1'h0)] wire132;
  wire [(2'h2):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire128;
  wire [(4'hf):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire128,
                 wire99,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire92 = wire88;
  assign wire93 = (wire87[(2'h3):(2'h3)] ?
                      $signed(($unsigned(wire87[(2'h3):(1'h0)]) ?
                          ($unsigned(wire90) * $unsigned(wire92)) : wire92[(2'h2):(2'h2)])) : $signed(wire87[(2'h2):(1'h1)]));
  assign wire94 = wire92;
  assign wire95 = $signed($unsigned($unsigned((wire93[(2'h2):(2'h2)] ?
                      wire89[(4'h8):(3'h4)] : $signed(wire92)))));
  assign wire96 = (~$signed(wire92));
  always
    @(posedge clk) begin
      reg97 <= wire87[(1'h1):(1'h0)];
      reg98 <= (|(&$unsigned((8'hb3))));
    end
  assign wire99 = $signed((!wire90[(1'h0):(1'h0)]));
  module100 #() modinst129 (wire128, clk, wire90, wire92, wire99, wire94);
  assign wire130 = wire87[(2'h3):(2'h3)];
  assign wire131 = wire128[(3'h5):(2'h3)];
  assign wire132 = ($signed($unsigned(($signed(wire87) - {wire90,
                       wire95}))) + $signed(reg97[(4'ha):(3'h5)]));
  assign wire133 = (^wire95);
  assign wire134 = reg98;
  assign wire135 = wire88;
endmodule

module module5
#(parameter param65 = ((~^(({(8'ha6)} >>> (!(8'hb3))) & {((8'hb6) & (8'had))})) <<< (((&{(8'ha9)}) && (((8'h9c) || (8'hb6)) ? {(8'haa), (8'hbc)} : {(8'hb8)})) ? {{((8'had) ? (8'hbd) : (8'hba))}, (~^((8'hbf) ? (8'ha9) : (8'hb6)))} : ((((8'ha2) ? (8'hb6) : (7'h42)) ? ((8'ha2) >> (8'hbe)) : (+(8'hb0))) ? (~^((8'ha5) ? (8'ha1) : (8'hbe))) : (&(+(7'h42)))))), 
parameter param66 = ((~&(({param65, param65} == param65) | (8'hb8))) ? (param65 ? {(param65 ^ (param65 ? param65 : param65))} : (~&(~&param65))) : (^param65)))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire6;
  input wire [(3'h4):(1'h0)] wire7;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire64;
  wire signed [(3'h4):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire44;
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire48,
                 wire47,
                 wire46,
                 wire11,
                 wire13,
                 wire44,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg12,
                 (1'h0)};
  assign wire11 = ($unsigned(({wire10[(1'h1):(1'h0)]} ?
                      (~(wire7 != wire7)) : ($signed(wire10) * wire7[(1'h0):(1'h0)]))) | wire7);
  always
    @(posedge clk) begin
      reg12 <= (-$signed((wire8[(2'h3):(2'h2)] & $unsigned((~&wire8)))));
    end
  assign wire13 = (wire10[(1'h1):(1'h0)] ?
                      $unsigned(($signed($unsigned(wire6)) ?
                          ((|wire6) ^ ((8'ha1) ?
                              wire10 : wire9)) : (^~wire9))) : (!$unsigned($unsigned(((8'hb6) ^ (8'ha7))))));
  module14 #() modinst45 (.wire17(wire9), .clk(clk), .wire18(wire6), .wire16(reg12), .y(wire44), .wire15(wire13));
  assign wire46 = {$signed(reg12), $signed({(&(~|wire44))})};
  assign wire47 = {(&wire44[(1'h0):(1'h0)])};
  assign wire48 = (wire10[(1'h1):(1'h1)] ?
                      $unsigned($signed($signed((^~(8'hb2))))) : wire47[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg49 <= {{wire46[(1'h1):(1'h0)]}};
      reg50 <= $signed($unsigned($unsigned($signed(wire9))));
      reg51 <= $unsigned($unsigned(wire48[(3'h7):(2'h2)]));
      if (($unsigned((wire11 > $unsigned({wire13}))) ?
          $unsigned((&(!wire46))) : {((8'hb7) >= ({wire9} ?
                  (reg12 | wire13) : wire48))}))
        begin
          reg52 <= $unsigned(($unsigned((|{wire13})) ?
              (reg50 & $unsigned($signed(wire11))) : (wire11 >= ($signed((8'h9f)) - $signed(wire10)))));
          if (wire13)
            begin
              reg53 <= reg52[(1'h0):(1'h0)];
              reg54 <= $unsigned(reg12);
              reg55 <= ((8'ha9) ?
                  wire8[(3'h6):(1'h0)] : $signed(wire44[(3'h4):(2'h2)]));
              reg56 <= (((wire8 | $signed(wire11)) ~^ ((wire7 ?
                      (~&(7'h42)) : {reg52}) ^ $signed((|(8'hae))))) ?
                  $unsigned(wire8[(1'h0):(1'h0)]) : reg49[(3'h6):(2'h2)]);
            end
          else
            begin
              reg53 <= $signed(((wire6[(2'h3):(1'h1)] ?
                  ({reg50, wire10} ?
                      {(8'hbf),
                          (8'ha9)} : (8'hbc)) : $signed(wire11[(3'h4):(2'h2)])) | wire44));
              reg54 <= (wire8 == ((+$unsigned({reg55})) || (((wire7 ?
                  wire7 : wire48) || wire11) ~^ reg52[(3'h4):(2'h3)])));
              reg55 <= (reg53[(3'h6):(3'h4)] << ((((~wire48) ?
                      {wire7} : $unsigned(wire8)) < (wire8 ?
                      $unsigned(reg12) : reg12)) ?
                  $signed(((8'hb0) != wire8[(3'h5):(3'h4)])) : (reg55[(1'h0):(1'h0)] ?
                      {reg52} : wire44)));
              reg56 <= (-(&$signed(($signed(wire10) ?
                  $signed(wire47) : wire9))));
            end
        end
      else
        begin
          reg52 <= ((-$unsigned((((8'hb3) >= wire11) <<< {wire13}))) ^~ (8'ha6));
          reg53 <= ((-$signed(wire6[(1'h1):(1'h1)])) ?
              (wire44[(1'h1):(1'h1)] ?
                  wire10 : {reg53[(5'h14):(3'h4)]}) : wire8[(4'h9):(3'h4)]);
          reg54 <= ($signed($signed((wire11 < (reg55 ^~ reg12)))) ?
              wire9 : wire48);
          reg55 <= (8'h9e);
        end
    end
  assign wire57 = (reg54[(4'he):(4'h8)] ? reg50 : wire6);
  assign wire58 = (reg12[(4'hf):(3'h6)] <= {((reg56 + {reg56, wire7}) ?
                          ({reg53} >>> ((8'hb8) || reg49)) : ((reg55 ?
                              wire47 : reg54) && $unsigned(wire7)))});
  assign wire59 = reg56;
  assign wire60 = ({((&$signed(wire9)) + reg55),
                          {$unsigned($unsigned(wire8))}} ?
                      wire46 : wire10);
  assign wire61 = reg51;
  assign wire62 = (wire44[(1'h0):(1'h0)] ? reg54[(1'h1):(1'h0)] : (8'ha5));
  assign wire63 = ($signed(($signed((~|wire46)) ?
                          ((wire61 <= wire9) * ((8'h9f) ?
                              wire46 : reg51)) : (7'h41))) ?
                      ($unsigned($signed(reg55)) & $unsigned(((reg12 ?
                          (7'h44) : (8'h9d)) ^ {wire59}))) : wire62[(4'h8):(1'h1)]);
  assign wire64 = reg56;
endmodule

module module14
#(parameter param43 = ((^(((~|(8'h9e)) || {(8'hb1), (8'hb6)}) * {((8'hbe) == (7'h41)), ((8'ha5) ? (8'h9d) : (7'h42))})) ? (+(~^(~|(!(8'ha2))))) : ((!(((8'hbb) != (8'ha3)) == ((8'hbc) & (8'ha5)))) > (({(7'h44)} ? ((7'h41) ^~ (7'h42)) : ((8'ha0) ^~ (8'ha8))) ? ((^(7'h40)) ? (^~(8'hb9)) : ((8'ha2) ? (8'hb6) : (8'hbb))) : ((~^(8'ha3)) | {(8'hae), (8'hb7)})))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire16;
  input wire [(4'hf):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire19;
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 (1'h0)};
  assign wire19 = (&$unsigned(($signed($signed(wire16)) >> {$unsigned(wire17)})));
  assign wire20 = ($unsigned($signed(({wire16,
                          wire19} <<< (wire16 >= wire16)))) ?
                      wire15[(4'hf):(1'h0)] : wire19);
  assign wire21 = (+(wire20 | wire17));
  always
    @(posedge clk) begin
      reg22 <= ($unsigned(wire21[(3'h5):(2'h3)]) < {{(^~(~wire17))}});
      if (($signed($unsigned({$signed(reg22)})) ?
          ({$unsigned(wire20)} ?
              $signed($signed(wire19)) : (reg22 > (wire17[(1'h0):(1'h0)] >> (&wire21)))) : ((($unsigned(wire18) ?
                  $unsigned(reg22) : {reg22}) ?
              ((wire21 << wire16) ?
                  (reg22 ? wire21 : (8'had)) : (wire20 ?
                      wire20 : wire17)) : $unsigned((wire15 ?
                  wire18 : wire20))) <= (wire18[(2'h3):(1'h0)] ?
              reg22[(3'h5):(1'h0)] : ((!wire21) ?
                  (wire19 ? wire16 : wire20) : {wire19, wire15})))))
        begin
          if (wire17[(2'h2):(1'h1)])
            begin
              reg23 <= ($unsigned({$signed((^~wire20))}) ?
                  (^~$unsigned($unsigned((wire18 <<< wire21)))) : wire18[(2'h2):(2'h2)]);
              reg24 <= (($unsigned((^$signed(wire20))) ?
                      $unsigned($signed(wire20)) : (~|$signed(wire17))) ?
                  (reg23[(1'h0):(1'h0)] ?
                      $unsigned($signed((&wire17))) : wire19[(3'h6):(3'h4)]) : $signed($signed(($unsigned((8'ha8)) ?
                      $signed(wire21) : (wire20 <= wire17)))));
              reg25 <= reg22[(4'ha):(3'h5)];
            end
          else
            begin
              reg23 <= wire20[(4'hf):(4'hc)];
              reg24 <= {wire15[(4'h8):(1'h0)],
                  ($signed(((|reg24) ? {reg22, reg24} : (reg25 && reg24))) ?
                      $unsigned($signed(wire16)) : {$signed((wire16 <<< wire17)),
                          (^~(~^wire19))})};
              reg25 <= wire17[(2'h2):(2'h2)];
              reg26 <= ((^~(reg23 ?
                  $unsigned((^wire15)) : (&wire21[(4'ha):(3'h5)]))) ~^ $unsigned(($unsigned(wire17[(1'h1):(1'h1)]) ?
                  (reg23 ?
                      ((8'ha4) ^ wire18) : (wire15 || reg23)) : ($unsigned(wire18) ?
                      (~^reg25) : $signed(wire19)))));
            end
          if ({{$signed($unsigned((^(7'h43)))), reg23[(4'h9):(3'h4)]}})
            begin
              reg27 <= $signed(($unsigned($unsigned($signed((8'ha7)))) - {{$unsigned(wire20)}}));
              reg28 <= reg26;
              reg29 <= ((($unsigned(reg27[(1'h0):(1'h0)]) ?
                      (~^(reg24 > (8'ha2))) : (((8'hb9) ? reg22 : wire15) ?
                          (&wire19) : $unsigned(reg28))) ?
                  wire19 : reg25) >> (wire15[(1'h0):(1'h0)] ?
                  reg25[(3'h6):(3'h5)] : (((reg22 ?
                      wire21 : reg25) || (reg26 - wire17)) ~^ ((reg24 ?
                          wire18 : wire17) ?
                      $signed(reg28) : (8'hb9)))));
            end
          else
            begin
              reg27 <= wire15;
            end
          if (($signed({(~&$unsigned(reg23))}) ? wire19 : reg28[(1'h1):(1'h0)]))
            begin
              reg30 <= (($unsigned(wire19[(3'h4):(2'h2)]) ?
                      $signed(((reg28 ?
                          reg29 : reg27) >= $unsigned(wire16))) : reg27) ?
                  (7'h42) : (+(^(~|{reg26}))));
            end
          else
            begin
              reg30 <= $unsigned($unsigned((($unsigned((8'hb3)) > $signed(reg27)) ?
                  $signed({reg24}) : wire19[(4'hd):(3'h5)])));
              reg31 <= reg27[(1'h1):(1'h0)];
            end
          reg32 <= (reg31[(1'h1):(1'h1)] >= (8'hb2));
          reg33 <= (wire17[(2'h2):(2'h2)] ^ (~|(reg22[(4'h9):(3'h7)] <= ((wire15 >= wire15) ?
              $signed(reg25) : ((8'hb2) ? reg24 : wire17)))));
        end
      else
        begin
          reg23 <= reg24;
          reg24 <= (reg26[(2'h3):(2'h3)] ?
              reg25[(4'hf):(1'h0)] : ((~|({reg33} ?
                      $unsigned(wire15) : $unsigned(wire20))) ?
                  wire21 : (^~{(wire20 >= reg28), reg22})));
          reg25 <= (reg23 == (8'hb1));
          if ((~|$signed(($unsigned((&reg32)) > wire21))))
            begin
              reg26 <= reg31[(4'hd):(3'h5)];
              reg27 <= (wire21 + $unsigned($signed($signed($unsigned((8'haa))))));
              reg28 <= $signed((((reg30 & (reg29 ?
                      (7'h41) : reg24)) && $signed(wire21)) ?
                  (wire16 || wire18) : wire19[(5'h10):(4'ha)]));
            end
          else
            begin
              reg26 <= reg31;
            end
        end
    end
  always
    @(posedge clk) begin
      if (($signed($signed($signed((reg32 >> wire19)))) <= $signed((8'h9c))))
        begin
          reg34 <= wire21[(3'h6):(1'h0)];
          reg35 <= ((reg24 & $signed(((!(8'ha4)) >> $signed((8'h9c))))) & wire16[(5'h12):(4'ha)]);
          reg36 <= (wire18[(2'h2):(1'h1)] ?
              (~^(reg24 == (reg26[(3'h4):(1'h0)] && reg31))) : reg28[(3'h4):(3'h4)]);
        end
      else
        begin
          reg34 <= (($signed(((wire21 * wire18) ? reg24 : {reg27, reg32})) ?
              $unsigned(((~|reg36) ^~ $unsigned(wire20))) : reg23[(3'h4):(1'h0)]) ^~ wire19);
          reg35 <= $unsigned(reg23);
          reg36 <= $signed((8'hab));
        end
      if ((~|reg36))
        begin
          reg37 <= ((($signed($signed(reg33)) ?
                  ((reg36 ? reg35 : reg33) ?
                      (&wire17) : $signed((8'hb8))) : ((8'hbe) ?
                      $signed(wire17) : (reg28 ? (8'haf) : reg29))) ?
              ((~|(wire17 != reg31)) ?
                  $signed((8'hbc)) : {(~&reg34)}) : (($signed((8'hbc)) ^ (-wire18)) + $unsigned({reg28}))) << $unsigned($signed($unsigned((&reg32)))));
        end
      else
        begin
          if ($unsigned({$unsigned($unsigned($unsigned((8'hbe))))}))
            begin
              reg37 <= wire16[(4'he):(4'ha)];
              reg38 <= $unsigned((+$signed(reg24[(2'h2):(2'h2)])));
              reg39 <= $signed($unsigned(($signed(reg31) ?
                  $unsigned($unsigned(reg25)) : $unsigned($signed(reg35)))));
              reg40 <= $signed(reg33);
            end
          else
            begin
              reg37 <= {$signed({$signed(reg27[(3'h4):(2'h2)]),
                      (&$unsigned(wire16))}),
                  ($signed($signed((reg39 ? (8'ha7) : (8'ha2)))) < wire18)};
              reg38 <= reg37;
              reg39 <= $signed(reg32[(3'h6):(3'h4)]);
            end
        end
      reg41 <= $unsigned(wire20[(5'h10):(3'h6)]);
      reg42 <= $signed((~$signed($unsigned($signed(wire20)))));
    end
endmodule

module module100
#(parameter param126 = ((((~&((8'hb8) ? (8'ha1) : (8'ha3))) ? (((8'hab) ? (8'h9c) : (8'ha7)) ^~ (&(8'hb9))) : ((+(8'ha2)) && ((8'hba) ? (7'h41) : (7'h44)))) ? (!(-((8'ha5) & (8'ha3)))) : ((((8'hae) ^ (7'h42)) << (~&(8'hb1))) >> (~(+(8'hb3))))) ? ((^~(8'ha8)) ? ((((8'haa) < (7'h40)) || ((8'hbc) >= (8'had))) ? ({(8'hb5), (8'h9d)} ? ((8'h9c) ? (8'had) : (8'hab)) : ((8'h9e) ? (8'ha5) : (8'hbb))) : ({(8'had)} >>> (^~(8'hae)))) : ((~(+(8'h9f))) >= (((8'hb7) << (8'hb8)) >>> {(8'haf), (8'hbc)}))) : {(~&(((8'haf) - (8'hb5)) ^ ((8'hb0) <<< (8'hbd)))), {(^~{(8'hac), (8'ha4)})}}), 
parameter param127 = (param126 ? (!((((8'hab) << param126) ? (~&param126) : (param126 <<< param126)) ? param126 : (8'hbf))) : (8'ha1)))
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire104;
  input wire signed [(4'ha):(1'h0)] wire103;
  input wire signed [(4'hf):(1'h0)] wire102;
  input wire [(3'h5):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire105;
  reg [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(4'h8):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
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
                 reg111,
                 (1'h0)};
  assign wire105 = wire102;
  assign wire106 = $signed(wire102[(4'h9):(4'h9)]);
  assign wire107 = (|wire101[(3'h4):(3'h4)]);
  assign wire108 = (wire103[(4'h9):(3'h4)] ?
                       wire102[(4'ha):(2'h3)] : {$signed(wire104[(3'h7):(3'h5)]),
                           $unsigned($unsigned($signed((8'h9f))))});
  assign wire109 = $unsigned(wire106[(1'h0):(1'h0)]);
  assign wire110 = wire102[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg111 <= {$signed($signed((wire102 ? (~|wire103) : $signed(wire105))))};
      reg112 <= {(+$signed(((^~wire102) <= {wire102, wire103}))),
          $unsigned(((+(wire107 + wire107)) ?
              ((wire110 ? wire103 : wire104) ?
                  (wire103 ?
                      wire103 : (8'hb2)) : wire109[(5'h11):(1'h0)]) : (&(wire104 != (8'hbd)))))};
      if (reg112[(2'h3):(1'h1)])
        begin
          reg113 <= ({$signed(wire103)} ?
              wire109[(4'hd):(4'hd)] : wire102[(4'hd):(4'hb)]);
          reg114 <= ((^$unsigned((^~wire103))) << {{wire102[(4'hc):(4'hc)]}});
          reg115 <= (-wire104[(4'h8):(1'h0)]);
        end
      else
        begin
          reg113 <= {wire109[(4'h9):(2'h2)], (!$signed($unsigned((~wire105))))};
          reg114 <= ($unsigned($unsigned(((^~wire110) ?
                  $signed(wire105) : (reg113 >>> (8'ha0))))) ?
              $signed($unsigned((&(reg112 ?
                  wire106 : wire102)))) : $signed({($unsigned(reg111) ?
                      ((8'hb5) ? wire109 : reg113) : $signed(reg114)),
                  (!(~&wire110))}));
          reg115 <= wire102;
          if ($signed($unsigned(reg114)))
            begin
              reg116 <= reg112;
              reg117 <= $unsigned(reg114[(4'h8):(2'h3)]);
              reg118 <= $signed($unsigned((reg113 ?
                  ({reg113} ?
                      $unsigned(wire109) : {reg117}) : $signed((|reg114)))));
              reg119 <= ($signed(({{wire110,
                          wire103}} ~^ $unsigned({reg118}))) ?
                  (reg118[(2'h3):(2'h3)] ?
                      (($unsigned((8'had)) ^ $unsigned(wire108)) & reg115[(2'h2):(1'h0)]) : $signed(($signed(wire108) ?
                          $unsigned(wire110) : {(8'ha6)}))) : (reg112[(2'h2):(1'h0)] ?
                      (8'hac) : (|$unsigned((reg117 | reg117)))));
              reg120 <= $unsigned((({(7'h44)} ^ wire104) >> (-$signed({wire106,
                  wire110}))));
            end
          else
            begin
              reg116 <= (((reg115[(1'h0):(1'h0)] <= wire101) ?
                  reg112 : (~&$signed($signed(reg117)))) * $signed(reg113));
            end
        end
      reg121 <= $unsigned(reg117[(1'h0):(1'h0)]);
    end
  assign wire122 = $unsigned(reg115);
  assign wire123 = reg113[(4'hc):(3'h6)];
  assign wire124 = $unsigned(reg113[(4'hf):(4'h9)]);
  assign wire125 = {(($unsigned($unsigned(wire122)) ?
                               wire108[(1'h0):(1'h0)] : (~&wire123[(2'h2):(1'h0)])) ?
                           (8'hb9) : ($unsigned($unsigned(wire105)) ?
                               (8'hb1) : ((reg115 * wire107) == $unsigned(reg120))))};
endmodule
