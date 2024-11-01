module top
#(parameter param112 = ((~{(~&((8'hae) >= (8'hac))), ((8'hae) ? ((8'ha8) != (8'h9c)) : (&(8'had)))}) ? ((^~(((8'ha1) ? (7'h40) : (8'hab)) ? (|(8'h9f)) : ((8'h9d) + (8'hbe)))) ~^ (^(-((8'hb9) << (8'h9f))))) : (~^(^~((^~(8'hb7)) * (-(8'hb7)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire108;
  assign y = {wire111, wire110, wire5, wire6, wire7, wire108, (1'h0)};
  assign wire5 = (8'hbf);
  assign wire6 = (|((wire5[(4'hb):(3'h5)] <= $unsigned(wire1)) ?
                     $signed(wire3) : wire2));
  assign wire7 = $signed($unsigned(wire3[(4'ha):(2'h2)]));
  module8 #() modinst109 (.y(wire108), .wire13(wire2), .wire10(wire7), .clk(clk), .wire9(wire4), .wire12(wire5), .wire11(wire0));
  assign wire110 = ((~|({((8'h9c) > wire108)} ^ (((8'ha8) <= wire5) ?
                           (wire1 ^ wire2) : (wire5 != wire1)))) ?
                       $unsigned($signed(($signed(wire6) ^ {wire0,
                           wire3}))) : wire7[(2'h3):(2'h3)]);
  assign wire111 = (|$unsigned(wire6));
endmodule

module module8  (y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h1aa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(3'h5):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire70;
  reg signed [(5'h14):(1'h0)] reg107 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire101,
                 wire99,
                 wire73,
                 wire72,
                 wire14,
                 wire32,
                 wire34,
                 wire70,
                 reg107,
                 reg104,
                 reg103,
                 reg102,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire14 = {wire11, (wire9 >= (wire11 << wire9))};
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(((wire13 ^~ wire13) ?
          $unsigned(wire12) : {wire11, wire12})) & wire9)))
        begin
          if ((!((&$signed((wire14 ?
              wire9 : wire11))) && $unsigned((!(wire12 >> wire13))))))
            begin
              reg15 <= $signed({((8'haa) | wire12)});
              reg16 <= (!$unsigned($unsigned((wire12 > ((7'h40) ?
                  wire12 : wire11)))));
              reg17 <= wire10[(3'h4):(2'h3)];
              reg18 <= $signed((wire13[(4'h8):(1'h1)] ?
                  $unsigned(wire13[(4'ha):(3'h6)]) : ({{wire13, wire10},
                          $unsigned((8'hb4))} ?
                      reg16 : {(~^(8'ha2))})));
            end
          else
            begin
              reg15 <= (wire10[(3'h6):(2'h2)] ~^ $unsigned($unsigned((~reg17))));
            end
          reg19 <= reg16;
        end
      else
        begin
          reg15 <= (((8'had) ~^ $unsigned(((8'hbd) == $signed(wire12)))) ?
              wire9 : (($unsigned(wire12[(4'hf):(1'h1)]) >= (~^wire11[(2'h3):(2'h2)])) - (^~$unsigned((^(8'hb6))))));
          reg16 <= ((~|{$signed(reg16),
              (reg16[(1'h0):(1'h0)] ?
                  reg16 : $signed(wire10))}) ^ $signed((!$signed($signed(reg15)))));
        end
    end
  module20 #() modinst33 (.wire24(reg18), .y(wire32), .wire22(reg17), .clk(clk), .wire21(wire12), .wire25(reg19), .wire23(wire14));
  assign wire34 = wire10[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      if (((($signed((reg17 ? reg19 : wire12)) >= (-(wire14 ?
                  wire14 : reg16))) ?
              wire11 : ($unsigned(reg15) * $unsigned(((8'hb8) ?
                  wire32 : wire14)))) ?
          wire11 : reg19[(1'h0):(1'h0)]))
        begin
          reg35 <= wire9;
          reg36 <= {(&wire13[(4'hc):(4'hc)])};
          reg37 <= reg19;
          reg38 <= $unsigned($signed((((wire34 == wire34) << $signed((8'hb3))) ?
              $signed(wire11[(1'h0):(1'h0)]) : reg18)));
        end
      else
        begin
          reg35 <= ((~&(~|($signed(reg19) >= (wire13 ? wire13 : (8'hab))))) ?
              wire32[(4'hd):(4'hd)] : $unsigned({wire11[(1'h1):(1'h0)]}));
          reg36 <= $signed(reg37);
          reg37 <= $signed((((~|(reg16 ? wire34 : reg37)) ?
                  (!{(8'hbd)}) : $unsigned(reg16)) ?
              $unsigned($unsigned(wire11[(2'h3):(2'h3)])) : ($signed((wire34 ?
                      reg35 : reg15)) ?
                  $unsigned((reg16 ?
                      reg16 : wire12)) : ((reg35 | wire13) >> (reg17 ?
                      wire13 : reg35)))));
          if ($unsigned(wire34[(3'h4):(3'h4)]))
            begin
              reg38 <= $unsigned(($signed((|((7'h40) ? wire10 : reg18))) ?
                  $signed({reg15}) : {wire10[(3'h5):(1'h1)],
                      reg38[(2'h3):(2'h2)]}));
              reg39 <= ((8'hb9) <<< (wire9 ?
                  wire11 : (($signed(reg17) ? wire11 : reg37[(2'h2):(1'h0)]) ?
                      ($signed(wire13) ?
                          ((8'hbe) ?
                              (8'hbb) : reg15) : $unsigned(reg35)) : ((~|reg38) & {wire9,
                          wire9}))));
              reg40 <= reg37[(2'h2):(1'h1)];
              reg41 <= ((!wire9) ?
                  (($signed({wire12, wire9}) ?
                          ($unsigned((7'h44)) ^~ $signed(wire34)) : $unsigned((reg39 - reg39))) ?
                      (!$signed(reg38[(3'h6):(2'h3)])) : wire9) : reg40);
              reg42 <= reg35[(1'h1):(1'h0)];
            end
          else
            begin
              reg38 <= $signed((7'h42));
              reg39 <= reg37[(2'h2):(2'h2)];
              reg40 <= reg42[(4'h9):(1'h1)];
              reg41 <= {reg36};
              reg42 <= (({(wire34 ? {reg41} : (wire34 ? reg38 : reg18)),
                  (wire11 ? $signed(reg35) : (~^(7'h44)))} ^ $signed(((~reg17) ?
                  $unsigned(wire12) : $signed((8'hbf))))) ^ (wire34 ?
                  reg15 : $unsigned($unsigned(reg18[(3'h4):(2'h3)]))));
            end
        end
      reg43 <= ((reg41 ?
              (({wire34, reg38} ? (8'hba) : wire32[(3'h5):(3'h4)]) ?
                  $unsigned($signed(reg16)) : ($unsigned(reg42) ?
                      (&(8'hb9)) : (reg17 < wire13))) : ((&{wire10,
                  wire11}) & {(reg17 ? (8'h9e) : (8'hbd))})) ?
          ((8'hb8) >>> (~|wire11)) : wire11);
    end
  module44 #() modinst71 (.clk(clk), .wire48(reg35), .wire46(reg18), .wire47(wire11), .y(wire70), .wire45(reg39));
  assign wire72 = ((~&(!reg39)) ?
                      (|wire9) : ($unsigned(({wire32} | wire12[(3'h7):(1'h1)])) >> (+(~reg19))));
  assign wire73 = ((^$unsigned(reg39[(4'hb):(1'h0)])) >= $unsigned(wire10));
  always
    @(posedge clk) begin
      reg74 <= ($unsigned($unsigned({$unsigned(reg17),
          (+reg41)})) <= ($unsigned((~|reg38)) ?
          (&$unsigned((reg36 ?
              (8'had) : reg42))) : ($signed($unsigned(wire34)) ?
              reg38 : $signed(reg18))));
      reg75 <= ($unsigned(reg74[(5'h10):(3'h4)]) ?
          ({wire34} ? reg37[(1'h0):(1'h0)] : wire72) : {{(8'h9c),
                  $unsigned($signed(reg74))}});
      reg76 <= reg74;
      reg77 <= (reg38 ^~ wire13);
    end
  module78 #() modinst100 (.wire81(wire34), .y(wire99), .wire80(wire73), .wire82(reg77), .wire79(reg43), .clk(clk));
  assign wire101 = {(^~({{wire32}, $signed(reg18)} < reg17[(4'h9):(3'h7)]))};
  always
    @(posedge clk) begin
      reg102 <= $unsigned($signed(((8'ha5) & ((^reg15) ?
          wire101 : (reg39 == reg74)))));
      reg103 <= wire12[(5'h10):(3'h5)];
      reg104 <= {$unsigned(reg17)};
    end
  assign wire105 = {((reg39 * {(reg37 ? wire73 : wire12)}) ?
                           reg16 : ($signed({wire10,
                               wire13}) * ($unsigned(reg37) ~^ wire12)))};
  assign wire106 = $unsigned($unsigned(($unsigned($signed(reg35)) ?
                       ((&reg75) ?
                           ((8'had) >>> (8'hac)) : (~^reg16)) : reg74[(4'ha):(4'h8)])));
  always
    @(posedge clk) begin
      reg107 <= wire9[(4'ha):(3'h6)];
    end
endmodule

module module78
#(parameter param97 = ((~((^~(+(8'hb0))) ? ({(8'ha8), (8'ha0)} ? ((8'hb9) * (8'hb0)) : ((8'ha3) ? (8'ha2) : (8'hb4))) : {(|(8'ha4))})) ? {((-((8'ha3) ? (8'hbc) : (8'hab))) ? {((8'ha6) <= (8'hbf)), (|(7'h40))} : ((|(7'h43)) ? ((8'ha9) ? (8'hb9) : (8'h9e)) : ((8'h9c) ? (8'hb2) : (8'hb7)))), (~^(((8'had) ^ (8'hb7)) ? (~^(8'hb5)) : ((8'h9e) ^ (8'h9d))))} : (({(|(8'ha4)), (|(8'hbd))} << (((8'had) ? (8'hb5) : (8'hac)) ? ((8'hab) - (8'ha1)) : {(7'h42), (8'ha5)})) <<< ({((8'ha9) ? (8'ha4) : (8'hae))} ? (((8'ha1) ? (8'hb7) : (8'had)) ? (7'h44) : (8'hb7)) : ({(8'ha6), (8'ha8)} ? {(8'ha5)} : ((8'ha1) * (7'h44)))))), 
parameter param98 = ((|param97) ~^ (((param97 ? (^param97) : param97) ? param97 : {param97, (param97 == (8'hac))}) | (-(8'h9f)))))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire82;
  input wire [(3'h7):(1'h0)] wire81;
  input wire signed [(4'hc):(1'h0)] wire80;
  input wire [(4'h8):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire [(2'h3):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire [(3'h4):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  assign y = {wire96,
                 wire95,
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
                 (1'h0)};
  assign wire83 = ($unsigned($signed($signed(((8'hab) + wire81)))) ?
                      $unsigned(((~{wire80, (8'hb9)}) ?
                          $signed($signed(wire79)) : ($signed(wire80) ?
                              $signed(wire82) : {wire80}))) : $unsigned((~$unsigned((-wire80)))));
  assign wire84 = (8'ha4);
  assign wire85 = $signed(((wire80 ?
                          wire83[(4'hf):(4'hd)] : $unsigned(wire80[(3'h4):(2'h2)])) ?
                      wire80 : (wire80[(4'h9):(3'h6)] & $signed((wire82 ^ (8'haf))))));
  assign wire86 = {wire80[(4'hc):(3'h5)], (^wire85[(2'h3):(1'h1)])};
  assign wire87 = $unsigned($unsigned((wire79[(2'h3):(2'h2)] ~^ {wire79[(4'h8):(2'h2)],
                      (wire84 ^ wire84)})));
  assign wire88 = ($unsigned(wire82) ? wire79 : wire84[(3'h5):(1'h0)]);
  assign wire89 = wire82[(1'h0):(1'h0)];
  assign wire90 = wire87;
  assign wire91 = (+wire87);
  assign wire92 = wire83[(4'h9):(2'h3)];
  assign wire93 = $signed(wire81);
  assign wire94 = wire91[(4'hd):(4'h9)];
  assign wire95 = {wire80[(4'ha):(3'h6)]};
  assign wire96 = ((~{$signed($signed(wire79)), {wire84[(2'h2):(2'h2)]}}) ?
                      $signed({$signed(wire79[(2'h2):(2'h2)])}) : (wire90[(1'h0):(1'h0)] ?
                          $unsigned(((wire87 ? wire87 : wire88) ^ (wire92 ?
                              wire89 : wire85))) : $unsigned((-wire92[(1'h0):(1'h0)]))));
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire48;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire signed [(4'he):(1'h0)] wire46;
  input wire [(3'h5):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire [(3'h4):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire49;
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg50,
                 (1'h0)};
  assign wire49 = $signed(wire47);
  always
    @(posedge clk) begin
      reg50 <= wire45[(1'h0):(1'h0)];
    end
  assign wire51 = (($unsigned($signed(wire47)) ^~ (-reg50[(4'h8):(2'h3)])) ?
                      $signed((^(~^$signed(wire49)))) : (~^(~|$unsigned((~(7'h43))))));
  assign wire52 = reg50;
  assign wire53 = reg50;
  assign wire54 = $unsigned((wire49[(3'h7):(2'h2)] < (~|{wire53, reg50})));
  always
    @(posedge clk) begin
      reg55 <= ((|$signed(wire48)) ?
          wire46 : $signed((wire52[(3'h6):(3'h4)] == (wire53[(4'hd):(4'hb)] && $unsigned((8'had))))));
      reg56 <= (!reg55[(2'h3):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg57 <= reg50;
      reg58 <= wire47[(2'h2):(1'h0)];
      reg59 <= $unsigned((8'hbe));
    end
  assign wire60 = (~^(reg57 ? $signed(reg58) : wire53[(1'h0):(1'h0)]));
  assign wire61 = ((|wire46[(4'hc):(4'h9)]) ?
                      $unsigned(($unsigned((7'h44)) ?
                          $unsigned({reg59, wire52}) : (~^(^reg59)))) : wire52);
  assign wire62 = (^~$signed((wire51[(1'h0):(1'h0)] || $unsigned({wire49,
                      reg50}))));
  assign wire63 = $signed((~wire46[(3'h5):(3'h4)]));
  assign wire64 = $signed({$unsigned($signed((wire51 * wire52)))});
  assign wire65 = wire48;
  assign wire66 = wire48;
  assign wire67 = (^(((8'hb7) ?
                      $unsigned({wire47}) : (~^wire47[(1'h1):(1'h1)])) ^ $unsigned(wire51)));
  assign wire68 = $signed(wire64);
  assign wire69 = ($signed((~$signed((wire65 ^~ (8'hb7))))) ?
                      (&$unsigned(wire52)) : wire61[(3'h5):(1'h0)]);
endmodule

module module20
#(parameter param30 = {{(((+(7'h42)) >= ((8'hbb) ? (8'hb0) : (8'hbb))) ? ((-(8'ha4)) + ((8'hbd) ^ (8'hb4))) : {((8'ha1) - (8'ha1))}), ((-(8'haa)) | {((8'hb8) ? (8'hab) : (8'ha6))})}, (-(8'ha7))}, 
parameter param31 = param30)
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(3'h7):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  assign y = {wire29, wire28, wire27, wire26, (1'h0)};
  assign wire26 = (wire23[(3'h7):(2'h3)] <= wire21);
  assign wire27 = (|wire22[(3'h6):(3'h4)]);
  assign wire28 = $unsigned((~wire26));
  assign wire29 = wire24[(3'h7):(1'h0)];
endmodule
