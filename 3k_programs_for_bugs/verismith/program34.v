module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1e0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire107;
  wire signed [(3'h7):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire70;
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire107,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire72,
                 wire5,
                 wire8,
                 wire10,
                 wire70,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg6,
                 reg7,
                 reg9,
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
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 (1'h0)};
  assign wire5 = ((wire4 < (+$unsigned(wire3))) ?
                     $unsigned(wire1[(1'h0):(1'h0)]) : $unsigned(((&(wire1 ?
                         wire0 : wire3)) & {$signed(wire4)})));
  always
    @(posedge clk) begin
      reg6 <= $signed((|wire2));
    end
  always
    @(posedge clk) begin
      reg7 <= (8'h9d);
    end
  assign wire8 = ($unsigned(wire5[(3'h5):(2'h2)]) <<< wire4);
  always
    @(posedge clk) begin
      reg9 <= {$signed(reg7)};
    end
  assign wire10 = wire3[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg11 <= $unsigned((~$signed((^(^wire2)))));
      reg12 <= (|reg6);
      reg13 <= wire2[(1'h0):(1'h0)];
      reg14 <= ($signed(reg13[(3'h7):(3'h7)]) >>> reg11);
      if (((((^(+wire10)) == ($signed(reg13) ?
                  (reg11 ? wire1 : wire3) : $unsigned((8'ha7)))) ?
              (+(~^reg14)) : wire2[(3'h5):(1'h0)]) ?
          (^~(^~reg13)) : reg11[(4'hd):(3'h4)]))
        begin
          if ($unsigned($unsigned($signed(($unsigned(wire5) ?
              wire4 : wire10)))))
            begin
              reg15 <= $signed(wire0);
              reg16 <= reg15[(4'hd):(4'h9)];
              reg17 <= $signed(reg13[(1'h0):(1'h0)]);
              reg18 <= $unsigned({(~|$signed(wire4))});
              reg19 <= ((~&(reg16[(1'h0):(1'h0)] >>> reg14)) ?
                  (reg18[(2'h2):(2'h2)] != ({$unsigned(wire0),
                          (wire8 ? (8'hb2) : reg9)} ?
                      ((~wire10) ^~ $unsigned(reg11)) : wire3[(5'h15):(5'h11)])) : ((^~(wire3[(4'hc):(3'h5)] || $unsigned(reg6))) ?
                      ((|reg13[(1'h1):(1'h1)]) ?
                          (reg13[(4'h8):(3'h4)] ?
                              ((8'h9d) ?
                                  reg6 : reg17) : $signed(wire3)) : ($signed(reg15) ?
                              (wire2 ?
                                  wire4 : reg9) : (~wire0))) : wire4[(4'h9):(3'h6)]));
            end
          else
            begin
              reg15 <= (!wire10);
              reg16 <= {$unsigned((!((wire0 ^~ (8'ha9)) ^ wire8[(3'h4):(2'h2)])))};
              reg17 <= $unsigned(($unsigned($signed((^~wire1))) ?
                  (8'ha5) : $signed($unsigned($unsigned(wire8)))));
            end
          if ((($signed(reg15) >>> reg19) ?
              ($unsigned($unsigned((reg11 < wire3))) ?
                  reg7[(5'h10):(3'h7)] : {{((8'hb2) ? wire10 : (8'had))},
                      $signed(reg15[(2'h2):(1'h0)])}) : reg11[(5'h11):(5'h11)]))
            begin
              reg20 <= reg14[(1'h0):(1'h0)];
              reg21 <= ((wire10 ^ wire1[(4'h9):(3'h4)]) ?
                  {((8'hbd) ? {(reg17 ? wire8 : wire3)} : (^{wire10})),
                      ((|(8'hbe)) ?
                          $signed({reg9}) : $unsigned($signed(reg19)))} : {((~^(reg6 ?
                              wire3 : reg18)) ?
                          (|(reg9 < wire5)) : ((~&reg14) ~^ wire4[(2'h3):(1'h1)]))});
              reg22 <= reg16;
            end
          else
            begin
              reg20 <= $signed((&(8'hb7)));
              reg21 <= reg9[(1'h1):(1'h0)];
            end
          reg23 <= (8'hb0);
        end
      else
        begin
          if ((reg21[(4'h8):(3'h4)] >= $signed((reg15 ?
              (reg22 ?
                  ((8'ha6) <<< (8'hbe)) : $unsigned(reg11)) : $unsigned((8'ha2))))))
            begin
              reg15 <= wire3[(4'h9):(4'h8)];
              reg16 <= (!($signed((wire8 + reg13[(1'h0):(1'h0)])) >>> reg18[(2'h2):(1'h0)]));
              reg17 <= ($unsigned(((wire0 ?
                  reg16 : reg19) + $unsigned(reg17))) && $signed((((reg12 ?
                      reg20 : reg15) >= reg6[(3'h7):(2'h3)]) ?
                  ((+wire5) >>> ((7'h41) ? (8'hb9) : reg20)) : ((reg11 ?
                          reg18 : wire5) ?
                      wire10[(2'h3):(2'h3)] : $unsigned(wire3)))));
              reg18 <= $signed(reg13);
            end
          else
            begin
              reg15 <= reg11;
              reg16 <= wire10[(2'h2):(1'h0)];
              reg17 <= (~^reg16[(4'hb):(1'h1)]);
              reg18 <= ((wire2[(2'h3):(1'h0)] ?
                      (((wire10 ~^ reg23) >>> wire1[(5'h12):(4'hf)]) ?
                          wire8[(2'h3):(2'h2)] : reg14[(1'h1):(1'h1)]) : {(~{reg23,
                              reg12}),
                          $signed((reg22 || wire8))}) ?
                  (-(($signed(reg18) && reg15) >= (^(reg15 ?
                      wire0 : wire5)))) : $unsigned(((wire8[(3'h7):(3'h4)] ?
                      wire3 : (8'h9c)) * (((8'ha8) << reg9) ?
                      wire0[(3'h4):(2'h3)] : $signed(reg7)))));
              reg19 <= reg19;
            end
          reg20 <= ((^~((~reg23[(2'h2):(1'h0)]) ?
                  $signed($signed((8'h9e))) : $unsigned($signed(reg18)))) ?
              (wire10 > $unsigned(($unsigned(wire10) ?
                  (reg11 ? reg19 : wire4) : reg13))) : ({reg17[(3'h7):(3'h6)],
                  ((wire3 ? (7'h44) : wire3) ?
                      $signed(reg7) : (wire4 - reg11))} && $signed(reg17[(3'h5):(3'h5)])));
          reg21 <= reg20;
        end
    end
  module24 #() modinst71 (.y(wire70), .wire27(wire8), .wire28(reg6), .clk(clk), .wire29(reg18), .wire26(wire2), .wire25(wire1));
  assign wire72 = reg19[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg73 <= ($signed($signed({(reg19 ? reg16 : (8'hb6))})) ?
          $unsigned($signed((~&reg15))) : $unsigned($unsigned({$signed(reg23)})));
      reg74 <= $signed($unsigned($signed(((reg17 ?
          reg14 : reg6) & $signed(reg19)))));
      reg75 <= (&(^~reg17));
      reg76 <= $signed((($unsigned((reg20 ?
          reg23 : reg73)) <= $signed(wire8)) ^ reg20[(3'h7):(3'h4)]));
    end
  assign wire77 = ($unsigned($signed(reg22)) < wire4);
  assign wire78 = reg74;
  assign wire79 = $signed($signed(reg73));
  assign wire80 = (+reg18[(4'h9):(3'h7)]);
  assign wire81 = reg15;
  module82 #() modinst108 (wire107, clk, wire79, reg13, reg17, wire3, reg6);
  always
    @(posedge clk) begin
      reg109 <= ($unsigned((wire72 ?
          $signed($signed(reg23)) : (|$signed(reg21)))) != ((wire78[(1'h0):(1'h0)] ?
          (~$unsigned(reg21)) : $signed({(7'h41)})) ~^ (wire81 ?
          ($signed(reg20) ? $unsigned(reg14) : (reg74 - reg17)) : ((+wire4) ?
              (^reg73) : (wire2 <= wire77)))));
      reg110 <= reg18[(5'h11):(1'h1)];
      if ($signed((~(((8'hb9) & reg13[(5'h10):(3'h5)]) * {((8'ha1) && (8'ha4)),
          {reg76}}))))
        begin
          reg111 <= {(8'hb8)};
          reg112 <= ((|wire81[(3'h4):(2'h3)]) || ($signed((~|wire2)) ?
              (wire1 + {wire0[(1'h0):(1'h0)],
                  wire4[(3'h6):(3'h5)]}) : (8'hab)));
        end
      else
        begin
          reg111 <= (^(($unsigned((~^reg16)) + (~^reg112)) + ($unsigned(wire1[(3'h5):(1'h1)]) ?
              ((~reg21) ^ $signed(reg111)) : wire107[(4'hc):(1'h0)])));
          reg112 <= reg19;
        end
    end
  assign wire113 = reg73[(1'h0):(1'h0)];
  assign wire114 = $signed(((&($unsigned(reg19) >>> (wire4 ?
                           wire70 : wire10))) ?
                       (7'h42) : ((8'hbe) ?
                           ((reg110 ? reg112 : (8'hac)) ?
                               (reg22 ? reg16 : wire81) : wire3) : (7'h44))));
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire87;
  input wire signed [(2'h2):(1'h0)] wire86;
  input wire signed [(4'h9):(1'h0)] wire85;
  input wire [(5'h12):(1'h0)] wire84;
  input wire signed [(3'h6):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire88;
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg97 = (1'h0);
  reg [(4'h9):(1'h0)] reg96 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 reg106,
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
                 reg89,
                 (1'h0)};
  assign wire88 = $unsigned((~&$unsigned((|$signed(wire84)))));
  always
    @(posedge clk) begin
      reg89 <= ((($signed({wire88, (8'h9e)}) + (((7'h42) ? wire83 : wire83) ?
              $signed(wire83) : wire87)) < ((8'ha3) ?
              ((wire87 ? wire83 : wire84) ?
                  (wire86 ?
                      wire83 : wire85) : $signed(wire87)) : $unsigned((wire83 ?
                  wire84 : wire85)))) ?
          wire88 : $unsigned({((wire85 ? (7'h42) : wire87) | wire83),
              (wire83 ? (&wire85) : $signed(wire85))}));
    end
  assign wire90 = (~^($signed($signed((!wire87))) | (~^(((8'hb7) && wire85) ?
                      wire86 : (wire87 ? wire84 : (8'hb5))))));
  assign wire91 = (wire90[(2'h3):(2'h2)] ?
                      wire87[(4'h8):(1'h0)] : $unsigned(wire83[(1'h1):(1'h1)]));
  assign wire92 = wire85;
  assign wire93 = ((8'ha9) > wire88[(2'h2):(1'h0)]);
  assign wire94 = {(^$signed($unsigned((wire90 ? reg89 : wire85)))),
                      wire90[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      if (wire84[(4'hb):(4'ha)])
        begin
          reg95 <= ((|wire92) & ((~^$unsigned({wire85, wire92})) ?
              wire91 : (wire83 ?
                  $unsigned(wire83[(2'h3):(2'h2)]) : (wire90 * wire88[(2'h2):(1'h0)]))));
        end
      else
        begin
          reg95 <= (!((8'hb9) || wire87));
          if (wire86[(1'h0):(1'h0)])
            begin
              reg96 <= $unsigned({$unsigned(wire88)});
              reg97 <= $unsigned($signed(wire86[(2'h2):(1'h0)]));
            end
          else
            begin
              reg96 <= $unsigned((~^wire91[(1'h0):(1'h0)]));
            end
          reg98 <= ((8'ha0) > $unsigned(wire84));
          reg99 <= $unsigned((~^$signed(($unsigned(wire94) ?
              $unsigned(reg97) : {reg96, wire92}))));
          if (reg89)
            begin
              reg100 <= ($signed((reg89[(4'he):(3'h4)] ?
                      $signed({wire88,
                          reg96}) : (wire92[(4'hd):(4'hc)] ^~ (^wire86)))) ?
                  $signed((wire92[(4'hb):(4'hb)] & $signed($signed(reg95)))) : (^~wire86));
              reg101 <= ($unsigned(reg96[(4'h8):(3'h7)]) ^~ wire93[(3'h4):(2'h2)]);
              reg102 <= (^~($signed($signed($unsigned(wire91))) ?
                  (!$signed((|wire84))) : wire91[(2'h2):(2'h2)]));
              reg103 <= wire94[(1'h0):(1'h0)];
            end
          else
            begin
              reg100 <= (wire84[(1'h1):(1'h1)] ?
                  $unsigned(wire92) : $unsigned(({$signed(reg99)} ?
                      reg100 : reg99[(1'h1):(1'h0)])));
              reg101 <= $signed($unsigned(wire91[(2'h2):(1'h1)]));
              reg102 <= (wire85[(3'h4):(3'h4)] << reg98);
              reg103 <= ($unsigned(wire94[(1'h1):(1'h0)]) ?
                  reg100[(1'h1):(1'h0)] : wire87[(4'hf):(3'h4)]);
              reg104 <= $signed($unsigned((^{(-wire86)})));
            end
        end
      reg105 <= reg102;
      reg106 <= reg104[(4'h9):(1'h1)];
    end
endmodule

module module24  (y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire signed [(2'h3):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire [(3'h4):(1'h0)] wire28;
  input wire [(5'h12):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire62;
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire65,
                 wire64,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire62,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire30 = $signed(($signed((((8'hb7) & wire27) ^~ wire28)) ?
                      wire26 : wire29[(1'h0):(1'h0)]));
  assign wire31 = (~^wire25[(1'h0):(1'h0)]);
  assign wire32 = $signed($signed(wire25[(1'h1):(1'h0)]));
  assign wire33 = wire29[(5'h11):(4'hd)];
  module34 #() modinst63 (wire62, clk, wire25, wire32, wire33, wire31, wire29);
  assign wire64 = (~$signed((wire28 - (((8'ha3) & wire33) ? wire25 : wire32))));
  assign wire65 = $unsigned(wire28[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg66 <= wire65[(2'h2):(1'h1)];
      reg67 <= wire29[(4'h9):(2'h2)];
    end
  assign wire68 = {(~((^~$unsigned(wire65)) ?
                          (8'haf) : ($unsigned(reg66) ?
                              wire28[(2'h3):(1'h0)] : wire28[(1'h0):(1'h0)]))),
                      ($signed($unsigned(wire26)) || ($unsigned((wire32 ?
                              wire29 : wire62)) ?
                          ({(8'hbd),
                              wire28} <= $unsigned((8'h9c))) : $signed((reg67 ?
                              reg66 : wire33))))};
  assign wire69 = ((&($unsigned((+wire64)) != $unsigned($unsigned((8'hb1))))) ^ wire64);
endmodule

module module34
#(parameter param60 = (^(~&(|((|(8'hb0)) ~^ (~&(8'ha6)))))), 
parameter param61 = ((^param60) + (((param60 ? (param60 >>> (8'ha4)) : {param60, param60}) ? param60 : ({param60} | param60)) >>> {(8'ha4), (param60 ? (param60 <<< (8'hbd)) : (param60 ? param60 : param60))})))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire39;
  input wire signed [(2'h3):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  input wire [(4'hc):(1'h0)] wire36;
  input wire [(3'h7):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire [(5'h15):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire40;
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire44,
                 wire41,
                 wire40,
                 reg46,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = {wire35,
                      ($unsigned(wire35[(3'h4):(3'h4)]) != ({wire38[(1'h0):(1'h0)],
                          $signed(wire38)} <= wire38[(1'h0):(1'h0)]))};
  assign wire41 = wire38[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg42 <= {$unsigned(wire39), (|(|(8'hba)))};
      reg43 <= $signed(($signed($signed(wire36[(1'h1):(1'h1)])) | ((&wire40[(2'h3):(1'h1)]) && ($signed(wire40) ?
          wire38 : (wire35 ? wire41 : wire41)))));
    end
  assign wire44 = $signed(wire39[(3'h4):(1'h0)]);
  assign wire45 = (|{wire44,
                      $signed(((wire35 ? wire44 : wire40) ?
                          wire36[(1'h1):(1'h0)] : $unsigned(wire39)))});
  always
    @(posedge clk) begin
      reg46 <= {(~^{(~&$unsigned((8'h9e)))})};
    end
  assign wire47 = wire37;
  assign wire48 = (|(~&(wire41 ^~ $unsigned((wire40 ^~ wire38)))));
  assign wire49 = $signed(wire48);
  assign wire50 = wire35[(3'h4):(2'h3)];
  assign wire51 = {wire45[(1'h0):(1'h0)]};
  assign wire52 = (-$unsigned({reg42[(1'h0):(1'h0)]}));
  assign wire53 = ((!(8'ha3)) ? (wire38[(1'h1):(1'h1)] == (~(8'had))) : reg46);
  assign wire54 = ({$unsigned(reg42), (^wire41)} < ($unsigned(({wire47} ?
                          $signed(wire44) : reg42[(2'h2):(2'h2)])) ?
                      (((~reg46) ? wire41[(3'h5):(2'h2)] : (wire38 * wire38)) ?
                          (!(~reg43)) : $unsigned($signed(wire36))) : $signed($unsigned(((8'h9f) ?
                          reg43 : wire47)))));
  assign wire55 = $unsigned(wire36[(2'h3):(1'h0)]);
  assign wire56 = ($unsigned(((^(^~reg46)) ?
                      $signed(wire37[(4'ha):(4'h9)]) : $signed(wire36))) ^~ ($signed($unsigned((!wire47))) ?
                      (^{wire45}) : wire54));
  assign wire57 = wire39;
  assign wire58 = $signed($unsigned($unsigned($signed((|wire54)))));
  assign wire59 = $signed($unsigned(wire41[(1'h1):(1'h1)]));
endmodule
