module top
#(parameter param106 = (^~(((((8'h9c) ? (7'h41) : (8'hb3)) ? ((8'hb0) ? (8'h9c) : (8'ha2)) : (!(8'ha5))) != (~{(8'hbe)})) ? ((((8'ha8) ? (8'hb6) : (8'hb6)) ? ((8'hb8) ? (8'h9c) : (8'ha9)) : ((8'hbe) && (8'hb0))) <= ((-(8'hbc)) && ((7'h40) & (8'haf)))) : ((~^(~|(7'h44))) || {((8'hbd) + (8'hb4)), (-(8'hb3))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire95;
  wire [(5'h12):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire80;
  reg signed [(4'h8):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  assign y = {wire105,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire82,
                 wire80,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
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
  module5 #() modinst81 (.wire9(wire1), .wire7(wire0), .y(wire80), .clk(clk), .wire10(wire4), .wire8(wire3), .wire6(wire2));
  assign wire82 = {(8'hb7)};
  always
    @(posedge clk) begin
      if ((wire4[(4'hb):(4'hb)] >> {wire82[(1'h1):(1'h0)]}))
        begin
          reg83 <= (!$unsigned(($unsigned((~&(8'hab))) * $signed(wire80[(2'h2):(1'h0)]))));
          reg84 <= reg83;
          reg85 <= reg83;
          reg86 <= ((((!(reg83 ? wire3 : wire3)) ? (^~(^~wire4)) : reg85) ?
                  (~^($unsigned(reg85) > (wire1 * wire4))) : reg83[(4'hc):(3'h5)]) ?
              $signed((8'hbd)) : ((!(&$signed(wire0))) ?
                  (reg84[(3'h5):(1'h0)] ?
                      $signed($unsigned((8'ha4))) : wire0) : ($unsigned(reg83) >= $signed($unsigned(wire4)))));
        end
      else
        begin
          reg83 <= $unsigned(({{(wire80 ? wire0 : reg86)},
                  reg84[(1'h0):(1'h0)]} ?
              $signed(($signed((7'h42)) ~^ (reg84 >>> reg83))) : (~$signed($signed(wire0)))));
        end
      reg87 <= wire0;
      reg88 <= $signed((-(($unsigned(wire2) ? $signed((8'hb4)) : wire80) ?
          ({wire80, reg84} >> reg83[(3'h5):(2'h3)]) : (-reg84))));
      if (reg87)
        begin
          reg89 <= reg85;
          reg90 <= ((wire1[(4'hf):(4'hb)] | {$signed(wire0), wire2}) ^ (7'h43));
        end
      else
        begin
          reg89 <= {(^reg89), (+(!(|$signed(wire0))))};
          reg90 <= ((~(!(|(~wire0)))) < wire80[(1'h0):(1'h0)]);
          reg91 <= $unsigned(reg84[(3'h5):(3'h5)]);
        end
    end
  assign wire92 = ((-wire80) ?
                      (!reg84) : $signed($signed(wire3[(4'hf):(4'hb)])));
  assign wire93 = reg89;
  assign wire94 = (reg89[(1'h0):(1'h0)] ? (8'hb5) : (|wire0));
  assign wire95 = ((&({(wire0 == (8'hbb)), $signed(reg89)} >> {(wire93 ?
                              wire1 : wire3),
                          $signed(wire82)})) ?
                      wire82[(1'h1):(1'h1)] : wire82);
  always
    @(posedge clk) begin
      reg96 <= (|$signed((~$unsigned(wire4[(2'h3):(2'h2)]))));
      if ((({$signed($unsigned(wire2)), (reg84 + $unsigned(wire82))} ?
          (^~((wire92 > wire80) ?
              reg89[(3'h4):(3'h4)] : (!wire4))) : wire94[(4'ha):(3'h7)]) ^~ $unsigned($signed(((8'hbf) ?
          {reg87, reg90} : {reg84})))))
        begin
          reg97 <= ((reg87 ?
              (reg89[(2'h2):(1'h0)] ?
                  {(reg96 & reg91)} : $unsigned((wire92 >= (8'hae)))) : $unsigned(($signed(wire82) && wire3))) >>> wire94[(4'hb):(4'ha)]);
          reg98 <= ((reg84 ?
              ($unsigned(reg88) ?
                  reg96[(1'h0):(1'h0)] : (reg96[(2'h2):(2'h2)] != wire94[(3'h4):(2'h2)])) : (reg90 ?
                  wire0[(1'h0):(1'h0)] : ((!wire4) ~^ wire2[(4'hc):(1'h1)]))) || $unsigned((!($unsigned(wire0) ?
              (reg89 + wire93) : (reg96 >= (8'hb8))))));
          if ((^~(reg87 ?
              reg83[(4'h8):(1'h0)] : $signed(wire4[(4'he):(4'he)]))))
            begin
              reg99 <= $unsigned($unsigned(($unsigned($unsigned(wire0)) ?
                  $signed((|wire4)) : $unsigned((reg89 >= reg85)))));
              reg100 <= $unsigned(({$unsigned($signed(wire82))} << (7'h40)));
              reg101 <= $signed(({wire82[(1'h0):(1'h0)]} != (reg84 ?
                  ($signed((8'hb6)) ?
                      (reg91 ? reg98 : reg100) : (reg96 ?
                          reg98 : reg83)) : reg91)));
            end
          else
            begin
              reg99 <= $unsigned((~&reg83[(3'h7):(3'h5)]));
            end
          reg102 <= reg98[(3'h7):(3'h7)];
          reg103 <= ((~^$signed((^~reg90[(5'h10):(3'h4)]))) ?
              ((reg86[(4'h8):(2'h2)] >= (-reg99)) | wire2) : $unsigned({(8'hbe)}));
        end
      else
        begin
          reg97 <= (!(wire80[(1'h1):(1'h0)] < reg103[(3'h6):(3'h4)]));
          reg98 <= (($signed(((wire0 ? reg88 : reg99) & reg90[(4'h9):(3'h4)])) ?
              ($signed((reg88 && wire95)) ?
                  reg100 : (reg84[(2'h3):(1'h1)] ?
                      $unsigned(reg99) : reg96)) : (8'hbd)) ^~ $unsigned($unsigned({(reg88 | reg103),
              reg97})));
          reg99 <= $unsigned((^~($unsigned((wire0 ? reg102 : reg87)) ?
              reg85 : reg86)));
          if ($unsigned($unsigned($unsigned((-(8'ha8))))))
            begin
              reg100 <= ($signed(reg90) ?
                  wire4[(3'h7):(2'h2)] : ((reg88 ?
                          reg86[(4'h9):(1'h0)] : (^~(reg83 ?
                              (8'haf) : wire0))) ?
                      (~&((8'ha9) >>> reg101)) : $signed($unsigned((wire2 >> wire95)))));
            end
          else
            begin
              reg100 <= ((reg103[(1'h0):(1'h0)] - ($signed($signed(reg90)) ?
                  wire3[(3'h7):(3'h7)] : $unsigned((reg89 ?
                      reg98 : reg103)))) && (((|$signed(wire1)) & ((reg96 >= wire94) ?
                  $signed(reg83) : (reg90 ?
                      reg90 : reg96))) ~^ $signed({(^~wire92),
                  ((8'hb5) ? (8'hbf) : wire82)})));
            end
          reg101 <= reg96[(2'h3):(2'h2)];
        end
      reg104 <= (({(((7'h44) > (8'had)) <= reg100), wire2[(2'h3):(2'h2)]} ?
          wire92 : (($signed((7'h40)) ? reg98 : reg102) ?
              ((~&reg85) ?
                  $unsigned((8'h9f)) : {reg100,
                      reg88}) : ($signed(wire1) >= (|reg100)))) + wire94);
    end
  assign wire105 = {$unsigned($unsigned($unsigned({reg88}))), $unsigned(reg99)};
endmodule

module module5
#(parameter param79 = ({(^~{((8'h9f) ? (8'hb4) : (8'ha2)), (+(8'ha9))})} ? ({(((7'h43) ? (8'hac) : (8'ha8)) & ((8'ha8) | (8'h9e)))} == ((|((8'hbb) | (8'hbc))) ? ((|(8'hb8)) <<< (~&(7'h44))) : (~|((8'hba) <<< (8'hb2))))) : ({(((8'hb1) || (7'h43)) ? {(8'hbb), (8'hab)} : {(8'hb6), (8'ha6)})} >= (~^(((8'hbb) ? (7'h40) : (8'hb9)) ? {(8'ha1), (8'hb1)} : (-(8'ha1)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire77;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire11;
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire75,
                 wire72,
                 wire25,
                 wire24,
                 wire11,
                 reg76,
                 reg74,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = ($unsigned(wire9) ?
                      $signed($unsigned((+wire6[(4'hb):(4'h8)]))) : $unsigned((^wire7)));
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire6);
      reg13 <= wire11[(2'h3):(1'h1)];
      reg14 <= $signed($signed((wire7 ?
          reg13 : ({(8'hb2), wire10} ? (wire9 && reg13) : (-(8'ha2))))));
      if ($signed(((~^wire9) ?
          (wire10 ^~ $unsigned($unsigned(wire7))) : $unsigned((|wire7[(1'h1):(1'h0)])))))
        begin
          if ($signed($signed(wire8)))
            begin
              reg15 <= ((~|wire9[(3'h7):(2'h3)]) >>> reg13[(1'h1):(1'h0)]);
              reg16 <= $signed($unsigned($signed($unsigned((reg13 == (8'hb3))))));
              reg17 <= $signed((+{$unsigned(((8'h9c) ? wire10 : reg15)),
                  (((8'hac) ? reg14 : reg12) ?
                      $signed(reg14) : (wire6 ? (8'hb6) : reg12))}));
              reg18 <= (wire9[(4'he):(3'h6)] >>> (((wire9[(3'h5):(1'h1)] || (~&wire10)) ?
                      ((!reg13) >> $unsigned(wire7)) : (~&wire6)) ?
                  $signed($signed($signed(reg15))) : (+$signed(((7'h44) > wire9)))));
              reg19 <= {(wire10 ^~ $signed(wire6[(3'h5):(1'h1)])),
                  $signed(reg17)};
            end
          else
            begin
              reg15 <= (|(~|$unsigned(wire11[(1'h0):(1'h0)])));
              reg16 <= (^$unsigned(((wire8[(4'hc):(1'h0)] || reg12[(1'h1):(1'h1)]) ?
                  $unsigned(reg17[(3'h4):(2'h2)]) : ($unsigned(wire11) ?
                      wire8 : (wire9 ? reg12 : reg16)))));
              reg17 <= (wire8[(3'h7):(2'h3)] ?
                  ((((reg12 & reg15) - $signed(wire9)) << $signed($unsigned(reg17))) ?
                      ((^~(~wire11)) != {wire6}) : {$unsigned((reg16 ?
                              (8'hb8) : reg16))}) : $signed($unsigned($signed(wire11[(2'h3):(1'h0)]))));
              reg18 <= $signed(reg19);
              reg19 <= $signed((~^(reg12[(4'hc):(4'ha)] ?
                  (wire11[(1'h1):(1'h1)] ?
                      reg18[(3'h5):(2'h2)] : wire6) : ($unsigned(reg18) ?
                      (8'h9d) : $unsigned(reg19)))));
            end
          reg20 <= reg18;
          reg21 <= reg20;
        end
      else
        begin
          reg15 <= reg12[(3'h5):(3'h4)];
          reg16 <= wire6;
        end
    end
  always
    @(posedge clk) begin
      reg22 <= ($unsigned($signed($unsigned(reg12))) ?
          ((({reg16} >= reg14) ? (-wire9) : $signed((reg15 ~^ wire11))) ?
              $signed({reg16[(2'h2):(2'h2)],
                  $signed(reg17)}) : $signed(reg19[(1'h0):(1'h0)])) : ($signed((~&reg21[(3'h6):(1'h1)])) & (reg12 >> wire7[(1'h1):(1'h0)])));
      reg23 <= (reg17[(2'h2):(1'h1)] < $signed($signed((reg21[(5'h11):(2'h3)] || ((8'hb2) * reg19)))));
    end
  assign wire24 = wire9;
  assign wire25 = reg20[(3'h4):(1'h0)];
  module26 #() modinst73 (wire72, clk, reg22, wire10, reg13, wire6);
  always
    @(posedge clk) begin
      reg74 <= {wire11[(2'h2):(1'h1)]};
    end
  assign wire75 = (reg20[(1'h0):(1'h0)] ?
                      wire6[(2'h2):(1'h0)] : ({($unsigned(reg20) ~^ reg74[(1'h0):(1'h0)]),
                              {reg20[(4'hf):(4'ha)]}} ?
                          (!$signed((reg74 ?
                              wire6 : wire72))) : $signed(($signed(reg74) ?
                              (reg12 == reg74) : reg20))));
  always
    @(posedge clk) begin
      reg76 <= reg21;
    end
  assign wire77 = ($unsigned((&$unsigned($unsigned(wire72)))) - $signed({reg74}));
  assign wire78 = reg15[(3'h4):(1'h0)];
endmodule

module module26
#(parameter param71 = ((({((7'h42) <= (8'hb8))} + {{(8'hb8)}, ((8'hab) ? (8'h9c) : (8'had))}) + ((~^((7'h44) ? (8'hba) : (8'ha0))) ^~ (((8'hbb) ? (8'ha7) : (8'hbc)) ? (8'hba) : (~^(7'h44))))) <= {(({(7'h40), (8'h9e)} ? ((8'hbf) ^~ (8'hb6)) : (~(8'h9e))) ? (((7'h43) ? (8'hb4) : (7'h44)) | {(8'hb4)}) : {((8'ha7) * (8'hb3)), {(8'hb9), (8'ha9)}}), (({(8'hb3), (8'h9f)} ? (7'h43) : (!(8'ha4))) | ({(8'hba)} <= {(8'hae)}))}))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire30;
  input wire [(4'h9):(1'h0)] wire29;
  input wire signed [(4'hf):(1'h0)] wire28;
  input wire [(4'hd):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire46;
  wire [(4'h8):(1'h0)] wire31;
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire54,
                 wire46,
                 wire31,
                 reg67,
                 reg66,
                 reg65,
                 reg56,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
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
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire31 = (&(^$unsigned(((wire28 < wire30) > (|(8'ha2))))));
  always
    @(posedge clk) begin
      reg32 <= $signed({$unsigned(((^~wire30) ? (~|wire31) : {wire28})),
          wire28});
      reg33 <= {wire28[(3'h5):(2'h3)], wire30};
      reg34 <= wire27;
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed(reg34[(4'h8):(3'h5)])))
        begin
          reg35 <= wire29[(3'h5):(3'h4)];
          reg36 <= wire31;
          reg37 <= ($unsigned(reg33[(3'h4):(1'h0)]) > $signed(($unsigned(reg35[(2'h2):(1'h0)]) ?
              ($signed(wire30) ?
                  wire28[(4'he):(3'h7)] : reg36[(4'ha):(4'ha)]) : {$signed(wire30)})));
        end
      else
        begin
          reg35 <= $signed($signed(($signed((reg32 ? wire31 : reg35)) ?
              $signed((+reg32)) : ($signed(wire29) ?
                  (!(7'h40)) : $unsigned(reg33)))));
          reg36 <= ($unsigned($signed(reg37)) * reg32[(3'h4):(2'h2)]);
        end
      if ((!reg36[(4'hc):(1'h0)]))
        begin
          reg38 <= wire27;
          reg39 <= reg34;
          if ($unsigned({(8'hab)}))
            begin
              reg40 <= ((((-{reg39}) && (~&(wire30 ? reg38 : wire31))) ?
                      reg34[(1'h1):(1'h1)] : $signed($signed((^~(8'hbd))))) ?
                  (($signed({wire30}) ?
                      reg36 : (~|(~|reg33))) != $signed((&reg36))) : (wire31[(2'h3):(2'h3)] ?
                      reg35 : $signed(reg34)));
              reg41 <= (+reg34[(4'ha):(4'ha)]);
              reg42 <= $signed($signed(((wire30[(3'h6):(3'h5)] ?
                  wire29 : wire28) - (!reg38))));
              reg43 <= $unsigned($unsigned(reg37));
              reg44 <= $unsigned((~&(+reg38)));
            end
          else
            begin
              reg40 <= (^(|reg44));
              reg41 <= $unsigned((reg39 ?
                  ($unsigned((reg32 ? reg40 : reg34)) ?
                      {((8'hb1) ?
                              reg43 : wire29)} : (~^$unsigned(wire29))) : (wire29[(2'h2):(1'h0)] ?
                      reg33[(2'h3):(2'h2)] : (reg39 ?
                          $signed(wire27) : (wire27 ? reg38 : (8'hae))))));
              reg42 <= (wire29 <<< $signed($signed((~|$signed(reg35)))));
              reg43 <= $signed($signed($unsigned($signed($signed(reg42)))));
            end
          reg45 <= (&$signed(({{(8'hbf), wire29}, wire30} ?
              (!$unsigned(reg39)) : reg36)));
        end
      else
        begin
          reg38 <= ($unsigned(wire27[(4'hb):(3'h6)]) ?
              $unsigned($signed($signed((wire28 * reg45)))) : (8'ha2));
        end
    end
  assign wire46 = ($signed($unsigned($signed({reg41}))) ?
                      {$unsigned(((~^wire29) ?
                              (reg37 | reg33) : wire29[(4'h8):(2'h3)])),
                          $unsigned(($unsigned(reg42) >>> {(8'hac)}))} : wire31[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if (reg39[(5'h12):(4'hc)])
        begin
          reg47 <= $unsigned(reg33[(1'h0):(1'h0)]);
          reg48 <= (^reg32);
        end
      else
        begin
          reg47 <= ({(8'ha7), (^~reg40)} ?
              (wire28 ? wire30 : $signed((~$unsigned((8'ha2))))) : reg34);
          reg48 <= (+(~|$unsigned((~&reg32[(3'h4):(3'h4)]))));
          if ({reg47[(5'h12):(5'h10)],
              ({{(reg43 ? reg34 : reg40), (reg41 <= reg40)}} ?
                  ($signed(((8'hbd) ? (7'h42) : reg37)) ?
                      ({reg37, (8'hba)} ?
                          (!wire30) : wire28[(2'h3):(1'h0)]) : (reg32[(2'h3):(2'h3)] ?
                          reg44[(1'h1):(1'h1)] : $unsigned(reg40))) : ((~(wire31 - wire31)) ?
                      $unsigned((reg34 ^ reg35)) : $signed((^reg41))))})
            begin
              reg49 <= $unsigned(((+((-reg44) ?
                      reg47[(4'hf):(4'ha)] : $unsigned((8'ha4)))) ?
                  $unsigned($unsigned(wire46[(2'h2):(1'h1)])) : (((reg45 >> wire30) ?
                          (~reg33) : ((8'hb9) ? reg44 : wire46)) ?
                      ($unsigned(reg45) >> $signed((8'ha1))) : $signed($unsigned(wire46)))));
            end
          else
            begin
              reg49 <= ($signed((reg39[(5'h14):(3'h7)] ?
                      ($unsigned(reg44) ?
                          $signed(reg45) : reg49) : (~$signed(wire46)))) ?
                  $unsigned($unsigned(wire27)) : $unsigned(reg35));
            end
          reg50 <= ($unsigned(($unsigned($unsigned(reg32)) ?
              $signed($unsigned(wire27)) : $unsigned((~^(8'hb0))))) | reg41);
          reg51 <= {(reg33[(3'h4):(1'h1)] ?
                  {$signed($signed(wire30))} : ($unsigned($signed(reg33)) << $unsigned(wire46[(4'h8):(3'h7)]))),
              $unsigned($unsigned($unsigned($unsigned(wire28))))};
        end
      reg52 <= $signed(wire28[(4'hd):(1'h0)]);
      reg53 <= $signed(reg32[(4'hb):(4'ha)]);
    end
  assign wire54 = $unsigned((wire27 ?
                      $unsigned(reg43) : {((-reg44) ^~ $unsigned((8'hbb)))}));
  assign wire55 = $signed($unsigned(((8'hb6) ~^ ($signed(wire31) ?
                      ((8'ha6) ? reg41 : (8'haa)) : (|(8'ha9))))));
  always
    @(posedge clk) begin
      reg56 <= $unsigned((reg49[(4'ha):(1'h1)] && (8'hb3)));
    end
  assign wire57 = $signed($unsigned(({wire30, $signed(reg47)} ?
                      wire30[(1'h1):(1'h0)] : (&$signed((8'hab))))));
  assign wire58 = wire31;
  assign wire59 = ((^~$unsigned($unsigned({wire57,
                      reg35}))) || (wire46[(4'hc):(4'h8)] * ({{reg39, reg34},
                          (^~reg42)} ?
                      (!reg42) : {(wire46 ? reg41 : reg32)})));
  assign wire60 = $unsigned(reg52[(4'hb):(3'h7)]);
  assign wire61 = ((($signed(reg33[(3'h4):(3'h4)]) <= wire55) ?
                      $signed({wire46}) : $signed(wire46[(4'h8):(2'h2)])) <<< $unsigned(({reg35} != $signed((&(8'h9c))))));
  assign wire62 = reg40[(5'h12):(4'hc)];
  assign wire63 = $unsigned(wire62[(1'h1):(1'h1)]);
  assign wire64 = $unsigned((~(-wire59[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg65 <= $unsigned($signed((reg45[(4'ha):(1'h0)] < $signed((&wire57)))));
      if (reg36[(3'h5):(2'h3)])
        begin
          reg66 <= ((wire30 ?
              wire58 : (reg44[(2'h2):(1'h1)] && (~^wire63))) & ({$signed($signed(wire64))} ?
              $signed((wire60[(5'h12):(4'hb)] ?
                  $signed(wire60) : reg36)) : (reg50[(1'h1):(1'h1)] << (wire62 ?
                  reg45 : (~reg44)))));
        end
      else
        begin
          reg66 <= reg51[(4'hd):(2'h3)];
        end
      reg67 <= ($unsigned((({reg40, reg40} ?
          (~^wire57) : $unsigned((7'h44))) >> (-$unsigned(wire63)))) == ((~reg36) ?
          $unsigned(wire61[(1'h1):(1'h0)]) : reg43[(4'h9):(2'h3)]));
    end
  assign wire68 = ((($unsigned(reg51[(4'hc):(4'ha)]) ^ $unsigned(reg44[(3'h4):(2'h3)])) <= ($signed($signed(reg43)) > (reg65 <= (reg38 != (7'h40))))) && $signed(($signed((reg51 ?
                          reg36 : reg67)) ?
                      reg50 : ($signed((8'ha6)) ?
                          (reg47 ? reg45 : (8'haf)) : (reg47 ?
                              wire57 : reg33)))));
  assign wire69 = wire55;
  assign wire70 = $signed(reg49[(4'hb):(3'h7)]);
endmodule
