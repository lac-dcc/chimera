module top
#(parameter param107 = {(~^{(~((8'hbb) ? (8'hb0) : (8'hbf)))})})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire0;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire37;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire104;
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire106,
                 wire14,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire104,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ((!(((+wire1) + $signed(wire4)) ?
              (!(wire2 + wire3)) : $signed(wire1))) ?
          wire0[(2'h3):(1'h0)] : $unsigned($unsigned(((wire0 << wire2) << $unsigned(wire2)))));
      reg6 <= (^~wire1[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if (($signed(reg5) ?
          wire2 : ({{(~&reg5)}, ((wire2 >>> reg5) ^ (wire1 == wire4))} ?
              wire1 : $signed({reg5, wire4[(1'h0):(1'h0)]}))))
        begin
          reg7 <= ((|$unsigned($unsigned((wire2 + wire0)))) > $unsigned((8'hb7)));
        end
      else
        begin
          if (($unsigned((|({reg7} ?
              (wire3 ?
                  wire4 : wire3) : $signed(reg6)))) << $unsigned(reg6[(4'hc):(1'h0)])))
            begin
              reg7 <= ((!wire1[(1'h1):(1'h1)]) ?
                  (reg6 ?
                      (((reg7 ? wire4 : reg5) >>> $unsigned(wire2)) ?
                          $signed($signed((8'hb5))) : $unsigned(reg7[(5'h13):(5'h10)])) : {wire4[(3'h4):(1'h1)],
                          reg5}) : wire4);
              reg8 <= wire2;
              reg9 <= ({{(8'hae)}, wire3} ?
                  reg8 : $unsigned(($unsigned((reg6 >>> wire2)) || ($unsigned(reg7) != $unsigned(reg6)))));
              reg10 <= {reg7, wire2};
              reg11 <= (~^reg5);
            end
          else
            begin
              reg7 <= ($signed(reg11[(4'hb):(1'h1)]) ?
                  $unsigned(reg5[(1'h1):(1'h1)]) : (((~|(reg6 ?
                          reg6 : reg5)) & (8'ha8)) ?
                      $signed(reg8) : (-(8'h9d))));
              reg8 <= wire2[(4'h8):(2'h2)];
              reg9 <= wire2;
            end
        end
      reg12 <= wire4;
      reg13 <= ($signed((8'hb1)) ^ reg10);
    end
  assign wire14 = {((~&$unsigned($unsigned((8'ha3)))) ?
                          (^~reg13) : (({wire2} ? {reg10, wire2} : (^~reg8)) ?
                              ($unsigned(reg7) - wire4[(1'h1):(1'h1)]) : reg11)),
                      $signed(((~(!wire0)) ?
                          (~|reg9[(2'h3):(1'h0)]) : {(-wire4),
                              $signed(reg5)}))};
  always
    @(posedge clk) begin
      reg15 <= $unsigned((($unsigned((reg9 ^~ reg6)) < ($unsigned(wire3) ~^ reg12)) ?
          ((~|reg7[(3'h6):(1'h0)]) ~^ $unsigned(((8'h9e) ~^ wire2))) : reg12[(1'h1):(1'h0)]));
      reg16 <= ((8'h9f) >= $signed((!(-((8'hb5) == wire4)))));
      reg17 <= $signed(wire3[(4'hc):(3'h5)]);
      reg18 <= (&{reg16, wire2[(3'h6):(3'h4)]});
      reg19 <= (~^$signed((|reg15[(1'h0):(1'h0)])));
    end
  assign wire20 = $signed($unsigned($unsigned((reg15 ?
                      (reg19 << reg19) : (reg13 || (8'ha5))))));
  assign wire21 = reg5[(4'ha):(2'h2)];
  assign wire22 = $signed((+$unsigned((~&wire1))));
  assign wire23 = (~^({$unsigned($signed(reg17)), (-{(8'hb8)})} ?
                      $unsigned((&{reg18})) : $unsigned((&(reg8 <= reg13)))));
  assign wire24 = ((!(+$signed(wire0))) ?
                      (reg10 != {$unsigned((~^(8'haa))),
                          (wire20 ^ $unsigned(wire1))}) : wire4);
  assign wire25 = $unsigned((+{{(wire2 ? (7'h41) : wire22), reg18},
                      wire4[(2'h2):(1'h0)]}));
  assign wire26 = $unsigned((reg9 && (^$signed(wire22[(2'h2):(2'h2)]))));
  assign wire27 = ($unsigned($signed($signed($unsigned(reg9)))) * ({reg7} ~^ (-reg16)));
  assign wire28 = $signed((~^wire27[(4'hb):(4'hb)]));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire27[(3'h5):(3'h5)])))
        begin
          reg29 <= ((($unsigned((wire26 & wire24)) == $unsigned({wire0,
                  (8'ha1)})) | ((8'h9d) ?
                  reg7[(5'h11):(2'h2)] : (|{reg18, wire21}))) ?
              (8'haf) : (8'h9d));
        end
      else
        begin
          reg29 <= $unsigned((^~reg12));
          reg30 <= (!((reg29 ?
                  $signed($signed(wire14)) : (((8'hb6) ? wire23 : wire3) ?
                      (reg7 & reg5) : reg6[(5'h11):(4'hc)])) ?
              (((8'hb1) == reg8[(3'h5):(2'h2)]) ?
                  reg7 : (^(wire21 ~^ wire0))) : wire4[(3'h4):(1'h1)]));
          reg31 <= wire25[(1'h0):(1'h0)];
        end
      reg32 <= (~&$signed((({wire27} | wire28[(4'he):(4'hc)]) ?
          wire1[(2'h2):(2'h2)] : wire28[(5'h13):(3'h6)])));
    end
  assign wire33 = (((~&wire14[(4'hb):(3'h5)]) ?
                          wire24[(1'h0):(1'h0)] : $unsigned($unsigned($unsigned(reg17)))) ?
                      (^wire27[(1'h1):(1'h0)]) : $unsigned((8'h9f)));
  assign wire34 = $unsigned(($unsigned($signed((wire3 ?
                      wire25 : reg8))) ~^ ($unsigned((~^wire14)) ?
                      $signed((reg13 ? reg17 : reg18)) : ((^reg5) ?
                          (-reg31) : (wire14 & reg10)))));
  assign wire35 = $unsigned($signed(reg13[(4'h8):(4'h8)]));
  assign wire36 = ((+($unsigned(wire21[(1'h1):(1'h0)]) ?
                      wire22[(4'h9):(1'h0)] : $signed($unsigned(reg12)))) <<< {((~|{reg30}) < (((7'h43) >>> reg15) ?
                          wire25 : $signed(wire0))),
                      $signed(wire24)});
  assign wire37 = wire2;
  assign wire38 = $signed($signed($unsigned({(wire14 ? reg5 : reg10),
                      (^wire25)})));
  module39 #() modinst105 (wire104, clk, wire0, reg6, wire38, wire35, reg16);
  assign wire106 = (-($signed((^~(^~wire20))) == ($signed($unsigned(reg30)) | $unsigned(wire36))));
endmodule

module module39
#(parameter param102 = ({{{{(8'hbf), (8'hb9)}, ((8'hb2) ? (8'haa) : (8'hbd))}, (((8'hbd) ? (8'hb1) : (8'hae)) ? ((8'hb5) >>> (8'haf)) : ((8'hbc) <= (8'ha6)))}, ({((8'hac) >>> (8'ha4))} ? (((8'hb3) + (8'hbe)) ? (8'hb1) : ((7'h42) ? (8'hbf) : (8'had))) : {((8'hb5) & (8'hbd))})} && (~&((((8'h9d) ? (8'ha2) : (8'hbb)) - {(7'h40), (8'hab)}) ? ({(8'hb2), (7'h42)} ? ((8'ha6) == (8'hb5)) : ((8'hb9) ? (8'hb2) : (8'haa))) : ((-(7'h43)) >= {(8'h9e)})))), 
parameter param103 = (~(((((8'hb0) <<< param102) ^~ {param102}) << param102) | (8'hb7))))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire44;
  input wire [(4'hc):(1'h0)] wire43;
  input wire [(4'h8):(1'h0)] wire42;
  input wire signed [(4'hb):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  reg signed [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  assign y = {wire87,
                 wire85,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg88,
                 reg50,
                 (1'h0)};
  assign wire45 = (-wire43[(3'h4):(3'h4)]);
  assign wire46 = $signed((wire43 << wire43[(3'h6):(2'h3)]));
  assign wire47 = $unsigned(((+({wire41} ?
                      $unsigned((8'haf)) : (wire42 ?
                          (8'hb9) : wire43))) >>> {((wire41 & (8'ha3)) ?
                          $signed(wire44) : wire42)}));
  assign wire48 = (($signed({(wire45 ? wire40 : wire46),
                          wire41[(1'h1):(1'h0)]}) ?
                      (^~(wire47 ?
                          (wire44 ?
                              (8'ha1) : wire40) : $signed(wire40))) : $unsigned($unsigned($unsigned(wire42)))) ^ $signed(($unsigned(wire41[(3'h6):(1'h1)]) ?
                      {(~|wire47)} : wire44[(1'h0):(1'h0)])));
  assign wire49 = (+{$signed(wire47), $signed(wire42)});
  always
    @(posedge clk) begin
      reg50 <= wire41;
    end
  module51 #() modinst86 (.wire54(wire48), .wire53(wire45), .clk(clk), .y(wire85), .wire52(wire40), .wire55(wire41));
  assign wire87 = wire43;
  always
    @(posedge clk) begin
      if ((^(($unsigned($signed((8'h9d))) ?
              $unsigned($signed(wire85)) : reg50) ?
          wire40 : wire49[(4'ha):(2'h3)])))
        begin
          if ($signed(wire46[(4'he):(3'h6)]))
            begin
              reg88 <= (($unsigned($signed((wire47 <<< (8'ha0)))) || wire48[(4'hc):(4'ha)]) ?
                  $signed(reg50[(4'h9):(3'h6)]) : (^~$unsigned(((wire48 ?
                          wire44 : wire45) ?
                      (wire43 ? reg50 : wire49) : $unsigned(wire87)))));
              reg89 <= $unsigned($signed(reg88[(5'h11):(4'hc)]));
              reg90 <= ((~^(wire41 * $signed($unsigned((8'h9d))))) ?
                  wire40[(4'ha):(2'h3)] : wire43);
              reg91 <= ($unsigned(({{wire41, wire87}} ?
                      $signed((+reg88)) : ($unsigned(wire44) <= wire40[(1'h0):(1'h0)]))) ?
                  reg89[(1'h1):(1'h1)] : (~&$signed($unsigned(wire40))));
              reg92 <= $unsigned((~&$unsigned((&{wire44, wire47}))));
            end
          else
            begin
              reg88 <= $unsigned({wire49[(4'h9):(2'h3)],
                  $signed(reg92[(4'h9):(3'h5)])});
              reg89 <= $signed({wire47});
            end
        end
      else
        begin
          reg88 <= wire45[(2'h2):(2'h2)];
          if ((wire41 ?
              (~$unsigned((-((8'hb3) <<< wire42)))) : (wire45 * wire43[(1'h1):(1'h0)])))
            begin
              reg89 <= (~reg50);
            end
          else
            begin
              reg89 <= $unsigned({wire40[(4'h9):(3'h4)],
                  (((reg90 || wire47) ? (&wire45) : (wire48 >> wire47)) ?
                      $unsigned((wire44 >> reg89)) : (reg89 & wire47[(3'h4):(2'h2)]))});
              reg90 <= $signed($unsigned(wire43[(4'hb):(1'h0)]));
            end
        end
      if ((8'had))
        begin
          reg93 <= reg50[(2'h3):(1'h1)];
        end
      else
        begin
          reg93 <= ((^(^~$unsigned($signed(wire45)))) << wire85);
          if ($signed((|$signed(reg88))))
            begin
              reg94 <= wire42;
              reg95 <= reg94;
              reg96 <= $signed(((wire45 ?
                      $signed((reg88 ~^ wire49)) : (reg93[(1'h1):(1'h0)] ?
                          (reg88 ? wire48 : wire42) : (wire44 > (8'hb0)))) ?
                  (^wire45[(2'h3):(2'h3)]) : $unsigned(wire49)));
              reg97 <= (reg91 && reg90[(5'h12):(4'ha)]);
            end
          else
            begin
              reg94 <= (8'ha5);
            end
          reg98 <= $signed((reg93[(4'hd):(4'hb)] ?
              (~&((^reg88) << {wire41})) : (-wire48)));
          reg99 <= {reg90[(2'h3):(1'h1)], reg91};
        end
      reg100 <= reg90;
      reg101 <= (~&((((reg99 ? reg93 : (8'hbe)) ^~ (+reg91)) ?
              reg100[(4'h9):(2'h2)] : $unsigned(reg96)) ?
          ((reg99 - {reg89}) ?
              (~|$signed(wire42)) : (wire46 || $unsigned((8'hae)))) : (|reg92)));
    end
endmodule

module module51
#(parameter param83 = (((-{((8'ha7) ? (8'had) : (8'ha1)), {(8'hac), (8'hb0)}}) ? ((8'hbe) && (~(8'hbe))) : ((((8'hb4) ? (8'ha4) : (8'ha3)) ? {(8'hbb), (8'ha0)} : ((7'h42) ? (8'ha4) : (8'hb0))) ? {(~|(8'hb6)), ((8'ha0) ~^ (8'ha3))} : ((^~(8'hbe)) | (8'hb4)))) ? (~|(((~^(8'ha6)) ? ((8'ha4) ? (8'hba) : (7'h40)) : ((8'hb7) ? (8'ha8) : (8'hac))) ? (((8'h9d) ? (8'ha6) : (8'hb7)) >= ((8'ha6) ? (8'ha9) : (8'ha7))) : (!((7'h44) ? (8'hb4) : (8'hae))))) : ((({(8'h9c), (7'h42)} ? ((7'h42) ? (8'hb8) : (8'hbc)) : (~|(8'hba))) ? ((~|(8'had)) ? ((7'h40) ? (8'ha4) : (8'ha5)) : ((8'h9d) ? (8'h9d) : (7'h44))) : (((8'ha9) ? (8'h9f) : (8'ha0)) ? ((8'hba) - (8'h9f)) : ((7'h43) - (8'ha1)))) ? ((~((8'hb0) && (8'hb6))) ? (|(^(8'hb9))) : (~^((8'hb9) ? (8'ha5) : (8'haa)))) : {{{(8'ha9), (7'h44)}}})), 
parameter param84 = (((({param83, param83} - {param83, param83}) ? ((param83 ? param83 : param83) ? (param83 >> param83) : param83) : param83) > (+({param83} ? {param83, param83} : (param83 ~^ param83)))) - (param83 ? (^((param83 ? param83 : (8'h9d)) <<< param83)) : ({(!param83), (param83 || (8'hb0))} < ((^param83) & (param83 ^ param83))))))
(y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire55;
  input wire [(4'hc):(1'h0)] wire54;
  input wire [(5'h13):(1'h0)] wire53;
  input wire [(4'hd):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire58;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire70,
                 wire69,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg68,
                 (1'h0)};
  assign wire56 = $unsigned(($signed($signed($unsigned(wire55))) ?
                      $unsigned({(8'hbd)}) : (($unsigned(wire52) ?
                          (!(8'h9c)) : (wire55 ? wire52 : wire55)) ^~ ((wire55 ?
                          wire55 : wire53) == $signed(wire52)))));
  assign wire57 = ($signed((^~$signed((wire56 - (8'hae))))) ?
                      $signed({wire53[(5'h13):(1'h1)],
                          $signed(wire52)}) : (~|(wire54 ?
                          (^~wire55) : {$signed(wire52)})));
  assign wire58 = wire55;
  assign wire59 = (8'ha3);
  assign wire60 = ($unsigned((~|wire56[(1'h0):(1'h0)])) << $signed({wire55[(1'h0):(1'h0)]}));
  assign wire61 = wire54;
  assign wire62 = $unsigned((+wire60));
  assign wire63 = ((($unsigned($signed((8'h9f))) ?
                          wire52 : $unsigned(((8'ha8) >>> (7'h44)))) ?
                      ($signed((^~wire53)) ?
                          $signed({(8'h9c), wire57}) : $unsigned((wire59 ?
                              (8'hbc) : wire53))) : (($signed(wire62) ~^ {(7'h41)}) <<< (~|(wire59 ?
                          wire54 : wire57)))) ^ (-((wire57[(3'h7):(1'h0)] ?
                          (wire60 ? (8'ha0) : wire55) : wire55[(1'h0):(1'h0)]) ?
                      (wire52[(2'h2):(2'h2)] ^ {(8'ha7),
                          wire59}) : $signed($unsigned(wire55)))));
  assign wire64 = $unsigned({$unsigned($signed({wire59, wire53}))});
  assign wire65 = $signed($unsigned((wire63 || (^(wire57 ?
                      (7'h44) : wire58)))));
  assign wire66 = wire64[(4'ha):(4'h9)];
  assign wire67 = $unsigned((wire58 ? (&wire56) : wire58[(4'hf):(2'h2)]));
  always
    @(posedge clk) begin
      reg68 <= (wire65[(2'h2):(1'h1)] ?
          $signed($unsigned($unsigned((8'hb6)))) : wire62);
    end
  assign wire69 = {$signed((~&((~^wire63) <<< wire67)))};
  assign wire70 = $signed(wire55);
  always
    @(posedge clk) begin
      reg71 <= wire61[(3'h4):(2'h3)];
      if (wire66)
        begin
          reg72 <= wire61[(5'h13):(1'h1)];
          reg73 <= $unsigned(({$signed(wire70)} << wire58));
          reg74 <= $unsigned($signed($unsigned(((wire70 > wire60) ?
              (8'hbf) : {wire54}))));
          reg75 <= $unsigned($signed((~&$unsigned(reg74))));
          reg76 <= reg71;
        end
      else
        begin
          reg72 <= reg76;
          if ({$signed(wire62[(2'h3):(2'h3)])})
            begin
              reg73 <= reg76;
              reg74 <= ($unsigned($signed($signed(wire62))) && $unsigned((8'haf)));
              reg75 <= (+wire60);
              reg76 <= (8'h9f);
            end
          else
            begin
              reg73 <= ((~^((reg72 ?
                      (wire59 >>> (8'hbd)) : (wire55 ?
                          reg72 : (7'h40))) | wire53[(1'h0):(1'h0)])) ?
                  ($signed(wire66) <<< {$signed({reg72, wire66})}) : wire70);
              reg74 <= $unsigned(wire62);
              reg75 <= reg72[(3'h6):(1'h1)];
            end
          reg77 <= ($signed((wire60 ?
              (reg75 ?
                  (wire57 ~^ (8'hbd)) : $signed((8'ha3))) : reg68)) ~^ {wire63[(2'h3):(1'h0)],
              $unsigned(($unsigned(reg71) * $unsigned(wire52)))});
        end
    end
  always
    @(posedge clk) begin
      reg78 <= wire65;
      reg79 <= reg77[(4'hc):(2'h3)];
    end
  assign wire80 = reg78[(3'h4):(1'h0)];
  assign wire81 = $unsigned($signed(((wire55[(1'h0):(1'h0)] != $unsigned(wire67)) | ($signed(wire67) + (wire60 ?
                      wire54 : reg71)))));
  assign wire82 = wire65[(5'h12):(5'h10)];
endmodule
