module top
#(parameter param122 = (&{((((8'hbb) - (8'h9c)) ? {(8'haa)} : ((7'h43) ? (8'ha2) : (8'ha1))) + (((8'hb8) - (8'h9c)) ? ((8'hb3) != (8'h9d)) : {(8'hbc)}))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire120;
  wire [(5'h10):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(4'hd):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(2'h3):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire96;
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg111 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(5'h13):(1'h0)] reg106 = (1'h0);
  reg [(2'h3):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(5'h10):(1'h0)] reg99 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire101,
                 wire98,
                 wire96,
                 reg113,
                 reg112,
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
                 reg100,
                 reg99,
                 (1'h0)};
  module4 #() modinst97 (.wire5(wire1), .wire9((8'ha9)), .wire8(wire0), .wire6(wire3), .clk(clk), .y(wire96), .wire7(wire2));
  assign wire98 = {(($unsigned(wire2[(3'h6):(2'h3)]) ?
                              ((wire96 + wire96) >= (wire96 >>> wire96)) : (wire2[(3'h5):(3'h4)] > (wire0 ^ wire2))) ?
                          wire3[(1'h1):(1'h0)] : (|$unsigned((!wire2))))};
  always
    @(posedge clk) begin
      reg99 <= wire98;
      reg100 <= $signed(wire98);
    end
  assign wire101 = ((!$signed((~^{wire1,
                       wire98}))) >> (({{wire3}} ^~ ($signed(wire96) * wire1[(4'hf):(2'h3)])) ?
                       wire0[(3'h7):(3'h4)] : reg99[(3'h6):(2'h3)]));
  always
    @(posedge clk) begin
      if (wire101[(1'h1):(1'h1)])
        begin
          reg102 <= (wire101 ^~ (|reg99[(4'he):(4'hd)]));
          reg103 <= {wire1};
          if ((~^(^~$unsigned(((8'hb1) >> wire3)))))
            begin
              reg104 <= $signed({((7'h42) ?
                      ((|wire96) | reg100) : {((8'hbf) << wire1), (~(8'hb0))}),
                  ((wire3[(2'h3):(2'h2)] ?
                          wire101[(1'h0):(1'h0)] : (reg103 ? wire2 : (8'hb1))) ?
                      (^(wire3 >>> wire96)) : {wire1, $unsigned(reg102)})});
              reg105 <= reg102;
              reg106 <= (($signed(({wire2} << wire2[(4'h9):(2'h3)])) ?
                      wire98[(3'h6):(1'h1)] : (8'hbe)) ?
                  $unsigned(wire1) : (~wire101));
              reg107 <= (($unsigned((wire2 ? reg104 : reg103[(4'hb):(3'h7)])) ?
                      wire98[(4'he):(1'h0)] : reg104) ?
                  $signed($signed((~^$signed(wire98)))) : $signed($unsigned($signed($unsigned(reg103)))));
            end
          else
            begin
              reg104 <= $signed(($signed($signed((~&wire1))) ?
                  ({(+(8'hb2)), wire1} | {$signed(wire101),
                      wire0[(4'hc):(2'h3)]}) : ((8'h9f) - (+$signed(wire0)))));
              reg105 <= reg102[(2'h3):(2'h2)];
            end
          if ((~&wire3))
            begin
              reg108 <= {((8'ha4) ?
                      ($unsigned(((8'haa) ?
                          wire2 : reg100)) && wire1[(5'h10):(1'h1)]) : (-reg105[(1'h0):(1'h0)])),
                  reg106};
              reg109 <= wire2;
              reg110 <= reg100[(4'h8):(3'h6)];
              reg111 <= reg108;
              reg112 <= reg109;
            end
          else
            begin
              reg108 <= wire1;
              reg109 <= {(|$signed(({reg110} ? {wire1} : $unsigned(wire2))))};
              reg110 <= $unsigned((^~(wire0[(4'ha):(2'h3)] ?
                  $signed(((8'hb1) == reg100)) : $signed((reg108 == reg103)))));
            end
          reg113 <= $unsigned(reg112[(4'h9):(3'h7)]);
        end
      else
        begin
          reg102 <= {{((!$unsigned(reg110)) ?
                      $unsigned((reg99 < (8'haa))) : (reg111 < $unsigned(reg110)))},
              (((((8'hbd) ? reg111 : wire1) ?
                      {reg99, reg104} : reg108[(3'h4):(2'h2)]) ?
                  (reg113[(5'h10):(4'hc)] ?
                      wire1 : $signed(reg113)) : {reg113[(3'h5):(3'h5)],
                      (8'h9e)}) ^ wire101[(1'h0):(1'h0)])};
        end
    end
  assign wire114 = (^$unsigned(wire101));
  assign wire115 = (&reg105[(1'h1):(1'h0)]);
  assign wire116 = (~|(wire101[(1'h0):(1'h0)] | (reg110[(1'h0):(1'h0)] >>> wire2[(3'h6):(3'h5)])));
  assign wire117 = $unsigned(((~$unsigned($unsigned(wire96))) >>> ((wire101 ^ $signed(wire115)) ?
                       $signed($unsigned(wire0)) : (reg111 ?
                           (reg109 ^ reg102) : $unsigned((8'hbd))))));
  assign wire118 = wire2;
  assign wire119 = {$unsigned((8'haf))};
  assign wire120 = (reg106[(4'hd):(4'h8)] ?
                       (($unsigned($signed(reg108)) ?
                           reg109[(1'h1):(1'h1)] : reg104[(3'h5):(2'h3)]) - $unsigned(wire117)) : wire115);
  assign wire121 = (wire115[(4'hb):(4'ha)] ^~ (~^$unsigned(reg110)));
endmodule

module module4
#(parameter param95 = (~{(^(&((8'ha1) ? (8'hb1) : (8'hb7)))), ((8'hb0) <<< (!(^(8'hb9))))}))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire5;
  input wire signed [(4'h8):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(4'h9):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire44;
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire91,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire22,
                 wire23,
                 wire24,
                 wire44,
                 reg52,
                 reg10,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= ((+wire7[(4'he):(4'he)]) ?
          (^(($signed((8'haf)) < (wire8 | wire7)) ?
              $signed(wire8[(1'h1):(1'h0)]) : $signed(wire6[(3'h5):(2'h2)]))) : wire7);
      reg11 <= (wire5 || $signed((^((reg10 == wire8) == $unsigned(wire8)))));
      if ($signed(($signed(((wire7 ? wire8 : reg10) ?
              $unsigned(wire7) : ((8'ha3) ^ wire8))) ?
          {$signed((~|(7'h41)))} : (!wire5[(4'hc):(1'h1)]))))
        begin
          if ((^((wire5[(4'ha):(4'ha)] >> ((wire8 != wire7) ?
                  $signed(wire7) : ((8'h9e) >>> wire7))) ?
              $unsigned((+$unsigned(wire8))) : $unsigned(wire9[(4'hf):(2'h3)]))))
            begin
              reg12 <= wire8;
            end
          else
            begin
              reg12 <= ((+{$unsigned(reg10[(3'h6):(2'h2)])}) ?
                  $unsigned({{$signed((8'ha3))},
                      ($unsigned(reg12) ?
                          (~|(7'h42)) : $unsigned(reg12))}) : $unsigned(wire9));
              reg13 <= ($signed({{wire8, (+(8'ha5))}}) ?
                  wire8 : (+$signed(((^wire7) ?
                      (wire9 ^~ (8'hab)) : reg10[(4'h8):(2'h2)]))));
              reg14 <= (!{$signed({wire5, (reg11 <<< wire6)}),
                  (&(^(+(8'ha7))))});
            end
          if (($signed($signed(($signed((8'ha5)) ^ {wire5, reg11}))) ?
              ((8'hbe) ^~ $unsigned((~{reg10, reg12}))) : $signed(reg13)))
            begin
              reg15 <= wire5;
              reg16 <= ((+reg11[(3'h7):(1'h0)]) * $unsigned((($signed(wire8) ?
                      (reg11 < reg12) : (!(8'ha0))) ?
                  ({(8'hb3)} == $unsigned(wire5)) : wire7)));
              reg17 <= {(reg11 ~^ ($unsigned(wire6) > wire5)),
                  $unsigned($signed(((reg16 || reg16) ?
                      $unsigned(reg15) : $signed(reg16))))};
              reg18 <= $unsigned(reg16);
            end
          else
            begin
              reg15 <= (wire9 ?
                  ($signed((~^$unsigned((8'hbb)))) ?
                      wire7 : (wire5[(3'h7):(3'h4)] + (wire6 ?
                          (reg17 ?
                              reg13 : reg18) : ((8'ha6) << wire9)))) : $signed((&$signed($signed((8'ha5))))));
              reg16 <= (wire8[(2'h3):(1'h1)] ?
                  ({wire8, $signed(reg15)} <<< (^~(|(reg11 ?
                      wire7 : wire8)))) : $signed($signed((!((8'ha4) ?
                      reg14 : reg11)))));
              reg17 <= (8'had);
              reg18 <= $unsigned((~^$unsigned($unsigned((reg15 - wire5)))));
              reg19 <= wire5[(4'h9):(2'h3)];
            end
          reg20 <= $signed($unsigned(wire8[(1'h1):(1'h0)]));
        end
      else
        begin
          reg12 <= $signed(reg14);
          reg13 <= $signed((^~($signed((wire6 ? (8'ha3) : reg12)) * reg18)));
        end
      reg21 <= ((8'hb6) > $signed((^~$unsigned(reg18))));
    end
  assign wire22 = $unsigned(reg20[(1'h1):(1'h1)]);
  assign wire23 = (($signed($unsigned(wire5)) ?
                      wire9[(4'hb):(1'h1)] : (8'hb5)) != $unsigned((!(wire8[(3'h6):(2'h2)] ?
                      (reg18 ? reg15 : reg20) : {reg21}))));
  assign wire24 = ({(|reg13)} ?
                      (8'ha2) : $signed(({reg13[(3'h4):(2'h2)],
                          wire23} || wire5)));
  module25 #() modinst45 (.wire28(reg17), .clk(clk), .y(wire44), .wire27(wire9), .wire26(reg21), .wire29(reg18));
  assign wire46 = (($signed((-wire22)) ~^ reg18[(3'h4):(3'h4)]) && $unsigned((|wire5[(3'h5):(1'h1)])));
  assign wire47 = $signed((wire46 <<< reg19));
  assign wire48 = {$signed(($unsigned(wire24[(4'he):(1'h0)]) << (~&$signed(wire5))))};
  assign wire49 = $unsigned(reg20[(2'h3):(2'h2)]);
  assign wire50 = $unsigned({((8'hbd) ?
                          wire22[(3'h6):(2'h3)] : {(reg13 >>> wire49)}),
                      {$signed($unsigned(reg11)), $unsigned($signed(reg14))}});
  assign wire51 = reg13[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg52 <= reg13[(4'hc):(1'h1)];
    end
  assign wire53 = wire46[(3'h7):(3'h6)];
  assign wire54 = (^~$signed(((&(wire48 | wire46)) >> {$signed((7'h41)),
                      (+(7'h40))})));
  assign wire55 = {{reg15, $signed(wire47)},
                      {($signed($unsigned(wire50)) ?
                              (~&(&reg17)) : {$signed(wire54), (7'h41)})}};
  module56 #() modinst92 (.wire60(wire5), .wire59(wire22), .clk(clk), .wire57(wire7), .wire58(wire54), .y(wire91));
  assign wire93 = $unsigned(($unsigned(((reg10 ?
                      (8'hb3) : (8'hb6)) - wire8[(3'h5):(2'h2)])) && wire46[(2'h2):(2'h2)]));
  assign wire94 = $signed((($unsigned((reg16 ? reg52 : wire23)) ?
                      ((&wire22) ~^ reg12) : (~&{wire47,
                          (7'h41)})) <= (^wire93)));
endmodule

module module56
#(parameter param89 = ((((((8'hab) - (8'ha7)) ? ((8'hb4) ? (8'hb0) : (8'hac)) : ((8'hbb) == (8'hb7))) < (((8'hbd) & (8'hab)) ? ((8'hb4) << (8'hbb)) : (~(8'h9c)))) ? ({((7'h43) - (8'ha7))} ? {(+(8'hb8))} : (~&{(7'h43), (8'hb6)})) : ({{(8'hb0)}} >>> (((8'ha7) ? (8'hb5) : (8'hb4)) <<< (~(8'hbe))))) <<< (7'h40)), 
parameter param90 = param89)
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire60;
  input wire signed [(4'hf):(1'h0)] wire59;
  input wire signed [(3'h4):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(5'h10):(1'h0)] wire81;
  wire [(4'hd):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  reg [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  assign y = {wire88,
                 wire84,
                 wire83,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg87,
                 reg86,
                 reg85,
                 reg82,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg61 <= $unsigned(($signed(($unsigned(wire57) ?
              wire60[(1'h0):(1'h0)] : $signed(wire58))) ?
          wire59 : wire59));
      reg62 <= wire60[(2'h3):(2'h3)];
      if (((wire59[(1'h1):(1'h1)] * $unsigned((wire58 ?
              $unsigned((7'h40)) : $signed(reg61)))) ?
          {((wire59 != (wire58 < reg61)) != $unsigned((wire57 | reg62))),
              (+((~&(7'h43)) ?
                  wire59[(1'h0):(1'h0)] : (wire60 ?
                      (8'hb8) : wire58)))} : wire59))
        begin
          reg63 <= ($signed((!$unsigned((wire59 + reg61)))) >>> $unsigned($unsigned(((+wire58) ^~ reg62[(4'ha):(1'h1)]))));
          if ((^$signed($unsigned($signed($unsigned(wire60))))))
            begin
              reg64 <= wire59[(4'h9):(1'h1)];
              reg65 <= $signed(reg62[(4'h9):(3'h6)]);
              reg66 <= wire59[(2'h2):(1'h0)];
            end
          else
            begin
              reg64 <= ((((^(reg63 ? reg63 : reg65)) ?
                      $unsigned((reg61 <<< reg61)) : wire58) ?
                  ((8'haf) == reg62) : (($signed(wire58) ?
                          reg62[(3'h7):(3'h4)] : {reg66}) ?
                      ((reg65 << reg62) ?
                          (-wire59) : wire57) : $unsigned((wire58 ?
                          reg64 : (8'hb9))))) <<< $signed(wire57[(4'he):(4'hd)]));
              reg65 <= (($unsigned(reg63[(5'h14):(4'hf)]) <= (&((wire58 ?
                      reg66 : reg64) || {wire58, reg61}))) ?
                  $signed(reg63) : $unsigned(($unsigned(wire60[(1'h1):(1'h1)]) >> reg63)));
              reg66 <= {$unsigned($unsigned((reg66 < (reg66 ?
                      wire58 : wire57))))};
              reg67 <= ($unsigned($unsigned(((wire60 ? reg62 : (7'h41)) ?
                  $unsigned((8'hb0)) : $signed(wire59)))) <<< (~^reg62[(4'ha):(3'h5)]));
            end
          reg68 <= (7'h44);
        end
      else
        begin
          reg63 <= reg66;
          reg64 <= (reg65 ? $signed(wire58[(2'h2):(2'h2)]) : (8'ha9));
        end
      reg69 <= (~&$signed($signed((!(reg61 ? reg68 : wire59)))));
      reg70 <= reg62[(4'hb):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg71 <= reg69;
      reg72 <= $unsigned((reg69 ? reg71 : $unsigned(reg71[(3'h6):(3'h6)])));
      reg73 <= wire60;
    end
  assign wire74 = reg61;
  assign wire75 = $unsigned(((((reg67 ? reg63 : reg65) ?
                          ((8'hb6) ? reg68 : reg72) : (reg73 ?
                              wire60 : reg63)) <= $unsigned($unsigned(reg63))) ?
                      $unsigned(((&wire74) >> reg61[(2'h3):(1'h1)])) : ($unsigned($signed((8'hb9))) ^~ $signed(wire74))));
  assign wire76 = {{$signed(((-reg67) ? (reg61 | reg73) : (~^reg72))),
                          (+(~&reg67))},
                      ($signed($unsigned((reg69 ? wire59 : reg68))) ?
                          ((!reg63) >> $signed((&reg65))) : reg72[(3'h4):(1'h0)])};
  assign wire77 = (($signed($unsigned((~wire76))) ?
                          wire60[(2'h3):(1'h1)] : ((~^(wire57 | reg67)) ?
                              $unsigned((wire76 << reg67)) : ({reg69,
                                  reg71} <= (reg71 ? wire60 : wire58)))) ?
                      (|((reg67 >> $signed(reg69)) ?
                          $signed((reg66 << reg69)) : (^$unsigned(reg67)))) : (~&($signed($unsigned(reg68)) <<< wire60[(1'h0):(1'h0)])));
  assign wire78 = $signed($unsigned((reg71[(2'h3):(1'h1)] & {$unsigned(reg72),
                      reg63})));
  assign wire79 = (reg65 ^~ reg66[(4'ha):(3'h7)]);
  assign wire80 = (~(~^({reg66[(5'h12):(4'ha)]} ?
                      $unsigned($unsigned(wire60)) : ((!wire58) ?
                          wire58 : $signed((8'hbd))))));
  assign wire81 = wire74;
  always
    @(posedge clk) begin
      reg82 <= $signed({($signed(reg72) ?
              ($signed((8'hbc)) ?
                  reg68 : {wire80,
                      reg63}) : $unsigned(wire81[(5'h10):(4'hc)]))});
    end
  assign wire83 = wire77;
  assign wire84 = $signed((!$signed((wire59[(3'h6):(3'h5)] ?
                      {reg63} : wire79[(3'h5):(1'h1)]))));
  always
    @(posedge clk) begin
      reg85 <= wire84[(1'h1):(1'h1)];
      reg86 <= (($signed(reg67[(4'hf):(3'h7)]) ?
              (~&{(reg63 ? reg62 : reg67), wire58}) : $signed(reg65)) ?
          (reg61[(3'h5):(2'h2)] ?
              $unsigned((wire80[(3'h6):(3'h6)] ?
                  $unsigned(reg63) : wire57[(4'he):(4'hb)])) : wire60[(1'h1):(1'h1)]) : $signed((^~wire83[(1'h0):(1'h0)])));
      reg87 <= ((((&(~^wire58)) ?
                  reg68[(1'h1):(1'h0)] : {(wire78 ? wire84 : reg64)}) ?
              $unsigned($signed({reg85,
                  wire58})) : ($signed(wire79[(1'h1):(1'h0)]) >>> ((&reg72) ?
                  reg67[(3'h6):(3'h4)] : reg72))) ?
          ($signed(reg73) ?
              reg68[(3'h6):(3'h4)] : wire58) : {wire83[(1'h0):(1'h0)],
              (8'hae)});
    end
  assign wire88 = $signed(((^($signed(reg69) >= ((8'ha6) == wire79))) ?
                      reg67 : {(((7'h40) ^~ wire75) | (wire83 ?
                              reg62 : wire76))}));
endmodule

module module25
#(parameter param42 = ({(!((~|(8'hb3)) ? (~^(8'hbb)) : (~|(8'ha3)))), (~((|(8'ha5)) ? ((8'haa) > (7'h44)) : ((8'hbc) + (8'hb3))))} & (~&{(~&((8'hb7) ^~ (8'hb0))), (!((8'hb6) ^~ (8'hb5)))})), 
parameter param43 = (~((param42 << {(param42 ? param42 : (8'ha8))}) ? param42 : (param42 ? param42 : (8'ha0)))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire29;
  input wire signed [(3'h4):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 (1'h0)};
  assign wire30 = wire28[(2'h2):(1'h1)];
  assign wire31 = $signed({wire27[(3'h5):(1'h0)], wire26});
  assign wire32 = (wire30 < wire31[(3'h4):(1'h1)]);
  assign wire33 = $unsigned((8'hb1));
  assign wire34 = $unsigned((~&(&((wire30 << wire28) >>> (wire33 ?
                      wire31 : wire33)))));
  assign wire35 = (-((^(~|(wire27 <= wire34))) ?
                      $unsigned(((&(8'ha6)) ?
                          wire32[(2'h2):(1'h1)] : $unsigned(wire33))) : (8'hb0)));
  assign wire36 = $unsigned((((^~wire35[(3'h4):(1'h0)]) - wire33) & $signed(((wire30 ?
                      wire30 : (8'hb4)) != wire35[(1'h1):(1'h0)]))));
  assign wire37 = (&wire30[(4'hc):(3'h6)]);
  assign wire38 = $unsigned(wire31[(5'h11):(2'h2)]);
  assign wire39 = wire26;
  assign wire40 = ((wire33[(5'h13):(2'h3)] ?
                      $unsigned(((!wire34) - $signed(wire34))) : (8'hb2)) != (~^$unsigned(wire37)));
  assign wire41 = (^~((!wire36[(3'h4):(3'h4)]) ^~ wire27));
endmodule
