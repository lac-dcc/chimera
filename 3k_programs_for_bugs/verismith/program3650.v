module top
#(parameter param110 = {(!((((8'ha4) ? (8'hae) : (8'h9e)) < ((8'hb9) ? (8'hbc) : (8'ha0))) ? ((|(8'hb0)) <<< (|(8'hb1))) : (~&((8'h9d) ? (8'hb9) : (8'hb3)))))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire109;
  wire [(4'hd):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire105;
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire107,
                 wire4,
                 wire21,
                 wire22,
                 wire23,
                 wire26,
                 wire27,
                 wire105,
                 reg25,
                 reg24,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
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
  assign wire4 = {$signed($signed($unsigned($signed(wire2)))),
                     ($unsigned(($unsigned(wire3) != $unsigned((8'hb9)))) || $unsigned($unsigned(wire1)))};
  always
    @(posedge clk) begin
      if (wire4[(3'h5):(1'h1)])
        begin
          reg5 <= (~^($signed($unsigned((^~wire2))) ?
              (((wire1 || wire0) | (~|wire3)) | (|(8'hb7))) : wire0[(4'hd):(4'hb)]));
        end
      else
        begin
          reg5 <= ((-$signed((!$unsigned(wire4)))) ?
              $signed($signed(($signed(wire4) ?
                  {wire0, wire2} : (!wire2)))) : $unsigned(wire0));
          reg6 <= $signed({($signed($signed(wire3)) ?
                  wire4 : (|wire1[(4'ha):(3'h6)]))});
          if ((reg6 ?
              {reg5[(4'hd):(3'h7)]} : (!({(wire1 ? reg5 : wire3)} ^~ {{(8'ha1)},
                  wire0}))))
            begin
              reg7 <= (reg6[(4'h8):(2'h2)] + reg6);
              reg8 <= (8'hb0);
              reg9 <= reg8;
              reg10 <= $unsigned($signed($unsigned(((wire4 ?
                  (7'h43) : (8'hb8)) >> (!wire4)))));
              reg11 <= $signed(((reg9[(2'h2):(2'h2)] <<< $signed((wire4 ?
                  reg9 : wire4))) ~^ wire3[(4'h8):(3'h6)]));
            end
          else
            begin
              reg7 <= (!$unsigned((~&$unsigned((reg8 ? wire1 : (8'hbf))))));
              reg8 <= ({(reg8 ?
                      wire2 : (reg9 ?
                          (reg6 && reg9) : $unsigned(wire4)))} << wire0[(4'ha):(3'h7)]);
              reg9 <= $signed($unsigned(wire2[(2'h3):(1'h1)]));
              reg10 <= $signed((&($signed((+wire3)) ?
                  ((reg6 ?
                      reg8 : reg10) * $signed(reg7)) : ((reg10 ~^ (8'hb7)) ?
                      $signed(reg10) : reg9))));
            end
        end
      reg12 <= $unsigned($unsigned(wire4[(2'h2):(1'h0)]));
      if ((^~$unsigned(((&$signed(wire2)) ?
          $unsigned(((8'ha1) < wire2)) : (!{(8'ha8), reg9})))))
        begin
          reg13 <= reg7;
          reg14 <= reg5;
        end
      else
        begin
          if ((~^(^reg6)))
            begin
              reg13 <= {reg10,
                  ((7'h41) & {$signed(((8'hbb) ? wire0 : reg11)),
                      (wire1[(3'h6):(1'h0)] ? $signed(reg5) : reg9)})};
              reg14 <= $signed($unsigned($signed($unsigned($signed(reg10)))));
              reg15 <= reg8[(1'h1):(1'h1)];
            end
          else
            begin
              reg13 <= reg8;
            end
          reg16 <= (~((~(((7'h41) ? (8'h9e) : reg10) + (reg14 ?
              reg8 : reg11))) ^ (|reg6)));
          reg17 <= {(reg5[(3'h4):(2'h2)] ~^ ((reg15 ?
                      ((8'ha1) || reg9) : {reg13}) ?
                  reg5 : reg11[(4'hd):(3'h5)]))};
          reg18 <= (+reg14[(5'h11):(4'h8)]);
          reg19 <= ((reg8 == $signed(((reg7 ?
              reg5 : wire1) - (reg7 == wire2)))) <<< $unsigned((&$signed(reg15[(2'h3):(2'h2)]))));
        end
      reg20 <= ($unsigned(reg11[(5'h11):(4'h9)]) ?
          ((~|$signed((reg14 ?
              reg6 : reg9))) ~^ reg14) : $signed($signed(reg7[(4'ha):(1'h0)])));
    end
  assign wire21 = ({wire1[(1'h0):(1'h0)],
                      (($signed(reg10) ? {reg8, reg18} : (reg5 ~^ reg7)) ?
                          $unsigned((|reg17)) : reg20[(1'h0):(1'h0)])} || reg8);
  assign wire22 = reg14[(3'h7):(3'h6)];
  assign wire23 = {(($signed((reg10 ? reg5 : (8'hbe))) ?
                          $unsigned((8'ha2)) : $signed($signed(reg15))) - ((~reg11[(4'hb):(3'h5)]) ?
                          {(8'ha4)} : reg18)),
                      (($signed((reg16 ? reg19 : reg13)) || (&{reg20,
                          wire1})) << reg14)};
  always
    @(posedge clk) begin
      reg24 <= wire22;
      reg25 <= {$unsigned(reg6)};
    end
  assign wire26 = {(~&$signed((+(wire4 ? reg25 : reg20))))};
  assign wire27 = reg14;
  module28 #() modinst106 (.clk(clk), .wire31(wire0), .wire29(reg18), .y(wire105), .wire33(reg8), .wire30(reg17), .wire32(reg10));
  assign wire107 = $signed(reg10[(4'h9):(4'h8)]);
  assign wire108 = reg5[(4'he):(1'h1)];
  assign wire109 = (($unsigned({$signed((8'hb9))}) ?
                           $signed($unsigned($unsigned((8'hbe)))) : wire0[(1'h1):(1'h0)]) ?
                       $signed((+$unsigned(reg13))) : $signed($unsigned(reg11[(5'h10):(5'h10)])));
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  input wire [(5'h13):(1'h0)] wire31;
  input wire signed [(4'hd):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  assign y = {wire103, wire63, wire36, wire35, wire34, (1'h0)};
  assign wire34 = ($signed($unsigned($signed($unsigned(wire32)))) ?
                      (({wire30, wire33} ?
                          $unsigned(wire30) : (8'hac)) != ((wire32 ?
                          (wire32 ~^ wire29) : (8'hb9)) || (wire29[(3'h6):(2'h3)] ?
                          $unsigned(wire30) : wire32))) : $unsigned({($unsigned(wire33) & {wire32,
                              wire32}),
                          $unsigned((~^wire33))}));
  assign wire35 = {$signed(($unsigned(wire33[(5'h12):(4'hb)]) == wire33)),
                      wire33};
  assign wire36 = wire29;
  module37 #() modinst64 (wire63, clk, wire29, wire35, wire30, wire34);
  module65 #() modinst104 (.wire66(wire30), .wire68(wire33), .wire67(wire29), .y(wire103), .clk(clk), .wire69(wire32));
endmodule

module module65
#(parameter param101 = ((({((8'h9e) << (8'had)), {(8'hb9)}} ? (((8'haf) ? (8'hb3) : (8'hb8)) != (-(8'hb8))) : (7'h41)) <<< ((~((8'hbe) <<< (8'hb7))) < (((8'hbb) ? (8'hac) : (7'h41)) ? (~(7'h41)) : {(8'ha1)}))) ? (((((8'hae) < (7'h41)) ~^ {(8'ha5)}) + ((~(8'h9f)) ? (^(8'hbe)) : ((8'hb9) * (7'h41)))) | ((-{(8'hbd)}) ^~ (!(|(7'h40))))) : (8'h9d)), 
parameter param102 = param101)
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire69;
  input wire [(5'h15):(1'h0)] wire68;
  input wire [(5'h15):(1'h0)] wire67;
  input wire [(4'ha):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire97;
  wire signed [(2'h3):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  reg [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
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
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire70 = wire69;
  assign wire71 = $unsigned(wire66[(1'h1):(1'h1)]);
  assign wire72 = (^(($unsigned(wire69) ?
                          {$unsigned(wire68),
                              $signed(wire68)} : $unsigned((wire71 & (8'hb4)))) ?
                      {wire67, wire66} : wire68[(2'h3):(1'h0)]));
  assign wire73 = ((8'ha3) >> wire70);
  assign wire74 = $unsigned($unsigned(wire71[(3'h7):(2'h3)]));
  assign wire75 = {(^wire72[(3'h6):(1'h0)])};
  assign wire76 = $unsigned(({wire67,
                          {wire67[(3'h6):(3'h4)], (wire74 && wire66)}} ?
                      ($unsigned(wire70) == (wire74 >>> $signed(wire67))) : ((~&wire68[(5'h10):(2'h3)]) ?
                          $unsigned((|wire73)) : wire70)));
  assign wire77 = (wire72 | $unsigned($signed((&wire72[(3'h4):(1'h0)]))));
  assign wire78 = (~^wire66);
  assign wire79 = (((-(wire74 ? wire78 : $signed(wire69))) ?
                          (wire76[(2'h3):(2'h2)] && $unsigned(wire77[(2'h2):(1'h0)])) : (((wire77 ^ (8'ha2)) << (^~wire69)) | wire69)) ?
                      $signed(($signed((wire72 ?
                          wire68 : wire69)) <= {wire69[(2'h2):(1'h0)],
                          wire76})) : wire77);
  assign wire80 = (wire79 ?
                      $signed((((^(8'ha1)) ?
                              ((8'hb9) ? wire70 : (7'h41)) : wire71) ?
                          (+$signed(wire71)) : $signed($signed((8'hb4))))) : wire66);
  always
    @(posedge clk) begin
      if ((~&((^wire73) ?
          {$signed(wire74[(1'h1):(1'h0)])} : $signed(((8'haf) ?
              (wire70 ? (7'h41) : wire79) : $unsigned(wire69))))))
        begin
          reg81 <= $signed({$signed(wire69),
              ((wire69 ? $signed((8'hbf)) : $signed(wire77)) ?
                  ((wire76 ? wire76 : wire79) ?
                      $unsigned(wire67) : (wire78 | wire80)) : (wire77[(2'h2):(1'h0)] == wire75[(3'h4):(3'h4)]))});
          if ($signed($unsigned($signed(wire69[(1'h1):(1'h1)]))))
            begin
              reg82 <= wire79;
              reg83 <= ((wire67[(3'h7):(2'h3)] - wire69) <<< (^{((~&wire71) && (~wire66)),
                  ($signed(wire79) ? (wire67 ^ wire67) : reg81)}));
              reg84 <= ((wire75[(2'h3):(2'h3)] ^ $signed(wire75[(3'h6):(1'h0)])) & wire71[(4'h9):(3'h5)]);
              reg85 <= (((reg81[(3'h4):(1'h1)] != ((8'hb5) <<< {wire70,
                          wire73})) ?
                      ($signed($unsigned((8'hbf))) ?
                          (((8'hbc) ? wire66 : reg84) ?
                              $signed(reg84) : $unsigned(wire68)) : (^~(-reg82))) : wire70[(3'h7):(2'h2)]) ?
                  $signed(wire72) : ($signed(wire80[(1'h1):(1'h1)]) ?
                      $signed(wire79[(1'h1):(1'h1)]) : (((wire69 <<< wire73) ?
                              $signed(wire69) : (wire73 ? reg84 : wire68)) ?
                          $signed($unsigned(wire75)) : wire70[(4'hb):(3'h5)])));
            end
          else
            begin
              reg82 <= reg82[(4'hb):(4'ha)];
              reg83 <= reg81[(2'h2):(1'h1)];
              reg84 <= {{((wire67 ?
                          wire80 : wire77[(3'h5):(1'h0)]) ^ $signed((reg84 << (7'h40))))},
                  reg84};
              reg85 <= $signed(($unsigned({(!wire79), $signed(wire70)}) ?
                  ($unsigned($signed((8'ha9))) ?
                      ((wire67 ?
                          reg84 : reg84) | wire76) : ({wire67} ~^ $unsigned(reg83))) : reg82[(4'hc):(3'h6)]));
              reg86 <= ((^~wire78[(2'h2):(1'h0)]) & $unsigned(reg84[(4'hf):(3'h6)]));
            end
          reg87 <= $signed(wire74);
          reg88 <= $signed($unsigned(wire79[(5'h13):(1'h1)]));
        end
      else
        begin
          if ($unsigned(((wire71[(4'h8):(3'h6)] >> {$signed(reg85),
                  (reg88 ? wire76 : (8'h9c))}) ?
              $signed($signed($unsigned(wire69))) : (reg86 > (+(reg85 ?
                  wire72 : wire75))))))
            begin
              reg81 <= ({($signed({wire79}) ?
                          {wire75[(2'h2):(1'h0)]} : wire68[(5'h12):(4'hd)])} ?
                  (~$signed(reg82)) : reg87);
              reg82 <= (&wire78[(1'h1):(1'h0)]);
              reg83 <= {(^~$signed($signed(wire66))),
                  ($unsigned((wire71 && (reg87 + reg87))) ^~ $signed((!(wire66 == wire76))))};
              reg84 <= wire70[(4'hc):(3'h4)];
              reg85 <= {{reg84[(4'hd):(3'h5)],
                      ((wire79 ?
                          reg87[(4'h9):(3'h4)] : wire73[(1'h1):(1'h0)]) ^~ (wire71[(3'h6):(3'h5)] ?
                          (wire67 && reg84) : reg86))},
                  {reg81[(3'h5):(1'h0)]}};
            end
          else
            begin
              reg81 <= (((!(~(~&wire71))) ?
                  (wire73 == $signed((~|reg81))) : wire79[(4'hc):(4'hb)]) | wire69[(3'h4):(3'h4)]);
              reg82 <= (&wire80);
              reg83 <= wire76[(4'h9):(3'h5)];
            end
          reg86 <= ((wire80[(4'he):(4'hc)] ?
              $unsigned({(reg88 <<< wire78)}) : reg86[(4'hc):(3'h4)]) * wire70[(3'h6):(3'h5)]);
          reg87 <= $signed(reg87);
          reg88 <= $unsigned((^~{$signed(reg81[(2'h2):(2'h2)])}));
          reg89 <= $unsigned($unsigned(((reg85 ?
              $signed(reg81) : reg81) >>> $unsigned(wire66[(2'h2):(2'h2)]))));
        end
      reg90 <= ((!(((reg86 - reg89) ?
              $signed((8'hbf)) : $signed(wire69)) && $signed((~reg88)))) ?
          (wire68[(3'h5):(2'h2)] ?
              (((8'ha7) - wire79[(3'h4):(1'h1)]) >= (wire67 ?
                  wire73 : reg83[(4'hd):(1'h1)])) : (wire73[(1'h0):(1'h0)] & (reg87 != $signed(wire69)))) : wire68);
      reg91 <= $signed(reg85);
      reg92 <= (reg84 ^ ($signed({$signed(wire68), $signed((8'haa))}) ?
          ((8'hb0) << $unsigned((-reg89))) : (~reg81)));
      reg93 <= wire76;
    end
  assign wire94 = ((($signed($unsigned((8'ha5))) ?
                              (~&{(8'ha9)}) : ($signed((8'h9e)) >>> (+wire71))) ?
                          $signed((^(reg84 << (8'hab)))) : reg86) ?
                      $signed((wire74 ?
                          $signed($signed(reg81)) : ($unsigned(wire71) ?
                              wire75[(3'h5):(2'h3)] : {wire71}))) : (8'hbf));
  assign wire95 = wire78;
  assign wire96 = reg87;
  assign wire97 = $signed(reg84);
  assign wire98 = (((^~$unsigned(wire95[(5'h10):(4'ha)])) - reg92[(4'ha):(1'h1)]) ?
                      {wire97,
                          ((reg84[(1'h1):(1'h1)] & (wire66 ? wire67 : wire67)) ?
                              reg85 : (reg85 != $unsigned(reg81)))} : wire95[(2'h2):(1'h1)]);
  assign wire99 = ($unsigned(wire70[(4'he):(3'h5)]) ?
                      (reg92 <<< (~^wire98)) : ((|reg84[(4'hc):(3'h7)]) ^~ (({wire75} ?
                              {wire77, reg92} : wire74) ?
                          $unsigned($signed(wire67)) : $signed(((8'hbc) + reg89)))));
  assign wire100 = (~^$signed($signed((((8'hb5) ?
                       reg84 : (7'h40)) != $signed(wire72)))));
endmodule

module module37
#(parameter param61 = (({(~|((8'hb1) ? (8'ha6) : (8'hb2))), (^((8'hab) || (8'ha5)))} ? (+((~^(7'h40)) ? ((8'h9c) ? (8'h9d) : (7'h40)) : {(7'h43), (8'ha0)})) : (~^((^~(8'hb4)) ? (-(7'h44)) : ((8'ha8) != (8'ha5))))) ? ((^({(7'h43)} ? (8'hb7) : (~^(8'hba)))) >> (((&(8'hbb)) <= {(8'hb6)}) >= {(^~(8'ha0))})) : (((-((8'ha2) | (8'hb4))) || (((8'ha5) >>> (8'hb7)) ? ((8'hb4) ? (8'had) : (8'haa)) : ((8'hb5) | (8'hb5)))) | (({(8'haf)} ~^ ((8'haa) ^~ (8'haa))) ? (((8'ha6) ? (8'ha3) : (8'ha9)) | ((8'ha7) ? (8'ha7) : (8'hbe))) : (!(~|(8'ha5)))))), 
parameter param62 = (param61 ^ param61))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire41;
  input wire signed [(3'h4):(1'h0)] wire40;
  input wire signed [(4'hd):(1'h0)] wire39;
  input wire [(3'h6):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  assign y = {wire60,
                 wire59,
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
                 wire43,
                 wire42,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire42 = ({wire40} || wire39);
  assign wire43 = $signed($unsigned(wire38[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg44 <= (wire40[(1'h0):(1'h0)] ?
          $signed($signed(({wire41} >>> wire43[(1'h0):(1'h0)]))) : (wire38[(2'h2):(2'h2)] - $signed(((wire39 ?
                  wire41 : (8'hba)) ?
              $unsigned(wire38) : ((7'h40) > wire41)))));
      reg45 <= {wire40, (-((8'hbe) << (~$signed(wire40))))};
      reg46 <= $signed((wire42[(2'h2):(1'h0)] != {(wire43 ^ wire41[(2'h3):(2'h2)])}));
      reg47 <= (^~({((-reg44) << $signed(wire41)), $signed($unsigned(wire39))} ?
          reg46 : (8'hab)));
    end
  assign wire48 = (reg45 << {reg45[(2'h2):(2'h2)],
                      {((wire43 ? wire39 : wire39) ?
                              $signed(wire39) : (reg45 ? wire41 : (8'hbc))),
                          (^~(^reg46))}});
  assign wire49 = $unsigned((((^~$signed(reg46)) ?
                          (&(8'hb9)) : $signed((wire41 ? wire39 : wire40))) ?
                      $signed((|(wire43 ^~ reg44))) : $unsigned((~&$signed(wire38)))));
  assign wire50 = wire41;
  assign wire51 = ((reg44 ?
                      {(((7'h44) ^ wire43) ^~ $signed(reg45)),
                          $signed((wire48 && wire49))} : (!((wire38 ?
                              wire39 : wire41) ?
                          (-wire38) : (wire39 != wire43)))) <<< (^(&($unsigned(wire49) ?
                      (wire50 ? wire38 : wire50) : (wire39 & reg47)))));
  assign wire52 = wire51[(2'h2):(1'h1)];
  assign wire53 = {reg44[(2'h3):(2'h2)],
                      ($unsigned(reg44) ?
                          (~|$unsigned($unsigned(wire41))) : (wire38[(3'h6):(1'h0)] ?
                              wire51 : (+(|reg45))))};
  assign wire54 = $signed(($signed((reg46 * (wire51 + wire43))) <<< {wire48}));
  assign wire55 = reg47;
  assign wire56 = $signed($signed(reg44[(1'h0):(1'h0)]));
  assign wire57 = (8'ha3);
  assign wire58 = (wire41 > ($unsigned((^{wire48})) ^~ wire54[(4'ha):(2'h2)]));
  assign wire59 = $signed(wire50);
  assign wire60 = $signed(wire48[(1'h0):(1'h0)]);
endmodule
