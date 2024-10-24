module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire123;
  wire [(4'hd):(1'h0)] wire122;
  wire [(4'hc):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire120;
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire4,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire120,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned((8'hb9));
  always
    @(posedge clk) begin
      if (wire1[(4'h8):(1'h1)])
        begin
          reg5 <= wire1;
          reg6 <= {(^~({(wire2 ? wire1 : wire1)} ?
                  $unsigned($signed(reg5)) : ((wire0 >= wire0) >= wire2[(2'h3):(1'h0)]))),
              (~^{(wire3[(1'h1):(1'h1)] != (reg5 - wire4))})};
          reg7 <= ((reg5[(3'h7):(3'h5)] ^ wire3[(1'h1):(1'h1)]) - wire1[(4'h8):(3'h5)]);
        end
      else
        begin
          reg5 <= $unsigned($signed(((~&(~^wire0)) >>> $unsigned($signed(reg5)))));
          reg6 <= {$signed((((wire3 ? reg7 : reg7) ~^ reg6) ?
                  (^~wire0) : wire1[(4'hc):(4'hb)]))};
          reg7 <= $unsigned(wire4);
          if (($signed(reg7) ?
              wire1 : ((~^((|reg7) && (!wire2))) != ({$signed((8'h9d))} ?
                  (^~$unsigned(wire4)) : (~|((8'ha1) ? wire2 : wire4))))))
            begin
              reg8 <= {wire3,
                  ($unsigned($unsigned($unsigned((8'hb1)))) ?
                      $unsigned((reg6 ?
                          $signed(reg7) : (wire1 ?
                              reg6 : reg5))) : (|($unsigned(wire0) ?
                          wire2[(1'h1):(1'h1)] : (|wire1))))};
            end
          else
            begin
              reg8 <= (8'ha0);
            end
        end
      reg9 <= $unsigned($unsigned((reg5[(1'h0):(1'h0)] > (&$signed(wire4)))));
    end
  assign wire10 = wire1;
  assign wire11 = reg7[(1'h0):(1'h0)];
  assign wire12 = {(~|wire3), reg8[(3'h4):(3'h4)]};
  assign wire13 = (reg9 ~^ ((($signed(wire11) || (!reg5)) <= (!$signed(wire12))) ?
                      $signed((~^wire1[(3'h4):(2'h3)])) : $signed(wire10[(3'h5):(2'h3)])));
  module14 #() modinst121 (.y(wire120), .wire15(wire1), .clk(clk), .wire18(reg8), .wire16(reg5), .wire17(wire11), .wire19(wire0));
  assign wire122 = (-$signed(($unsigned((~|wire13)) ?
                       reg8[(3'h5):(1'h1)] : reg8)));
  assign wire123 = (-(7'h42));
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h2c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(5'h11):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire111,
                 wire98,
                 wire97,
                 wire80,
                 wire77,
                 wire76,
                 wire75,
                 wire56,
                 wire52,
                 wire50,
                 wire21,
                 wire20,
                 reg53,
                 reg54,
                 reg55,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg78,
                 reg79,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 (1'h0)};
  assign wire20 = wire17;
  assign wire21 = {$unsigned($unsigned((|(+wire17))))};
  module22 #() modinst51 (.wire23(wire16), .wire24(wire18), .wire25(wire15), .wire26(wire20), .clk(clk), .y(wire50));
  assign wire52 = (!$signed(((&$signed(wire50)) << $signed(wire50[(4'ha):(3'h7)]))));
  always
    @(posedge clk) begin
      reg53 <= wire17[(5'h13):(3'h7)];
      if (((wire20[(4'hb):(4'hb)] * (-wire21[(4'hf):(3'h6)])) ?
          ((&wire50) && (8'haa)) : ((wire50[(3'h6):(1'h1)] >= wire19[(2'h2):(2'h2)]) ?
              ((^{wire50}) & ($signed((7'h40)) == {wire15})) : (wire52[(3'h5):(3'h4)] ?
                  wire50 : wire17))))
        begin
          reg54 <= (($signed(wire18) ?
              wire20[(1'h1):(1'h0)] : (((wire20 ? wire52 : wire16) && {wire20,
                  (7'h42)}) + ((|(8'hb1)) * $unsigned(wire52)))) && {$unsigned(((wire16 > wire50) ?
                  wire17 : (wire19 ? wire52 : wire15)))});
          reg55 <= wire52[(3'h6):(2'h3)];
        end
      else
        begin
          reg54 <= $unsigned(((!wire20) ^ reg54));
        end
    end
  assign wire56 = wire15[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire56[(1'h0):(1'h0)])
        begin
          reg57 <= $unsigned((($unsigned(wire16) | ($unsigned(wire15) ?
                  (wire19 ? (8'ha1) : wire17) : $unsigned(wire17))) ?
              {(!wire20[(2'h2):(1'h1)])} : reg54));
          reg58 <= $unsigned($signed($unsigned($unsigned(wire21[(4'ha):(1'h1)]))));
          if ($signed($signed($unsigned(wire17[(4'ha):(4'h8)]))))
            begin
              reg59 <= reg57;
              reg60 <= $signed(wire50[(4'h9):(3'h4)]);
              reg61 <= wire19;
              reg62 <= $signed({(^~($unsigned(reg59) ?
                      (wire21 - wire56) : wire19)),
                  (~((reg57 >>> wire50) ? wire20 : (reg59 & reg57)))});
            end
          else
            begin
              reg59 <= wire17[(2'h3):(2'h3)];
              reg60 <= $signed((7'h41));
            end
          if ($signed($signed($unsigned(($signed((8'hb5)) ?
              reg61 : reg58[(1'h1):(1'h1)])))))
            begin
              reg63 <= $signed(wire56[(1'h0):(1'h0)]);
              reg64 <= (~(&{wire16}));
              reg65 <= ($signed(($signed(reg55[(2'h3):(1'h0)]) ?
                  wire16 : $unsigned(wire17))) - $signed(({wire56[(1'h0):(1'h0)],
                  wire19[(4'he):(4'ha)]} <= ((8'hb8) ?
                  (-reg64) : (reg57 ^~ reg55)))));
            end
          else
            begin
              reg63 <= wire20[(1'h1):(1'h1)];
              reg64 <= ((~^wire19) && $signed((($signed(reg62) != $unsigned(wire21)) ?
                  (wire18 > $unsigned((8'hbb))) : reg65)));
            end
          reg66 <= (~^reg54);
        end
      else
        begin
          reg57 <= reg57;
          reg58 <= reg65[(4'h8):(1'h1)];
          reg59 <= reg63[(4'ha):(4'h8)];
          reg60 <= ((&$unsigned(reg66[(4'h8):(3'h5)])) <<< (~|$unsigned(((wire20 | (8'hab)) ?
              $signed(wire20) : (wire52 || (8'ha8))))));
          if ((8'ha5))
            begin
              reg61 <= ({(reg59 * {(wire15 ? wire18 : wire56), $signed(reg61)}),
                  {$signed($signed(wire20))}} >= $signed($signed($signed($signed((8'hb6))))));
            end
          else
            begin
              reg61 <= $signed((&$signed(((reg53 ? reg57 : (8'hbd)) ?
                  $unsigned(reg53) : wire21[(5'h10):(3'h7)]))));
              reg62 <= ((($unsigned($unsigned(wire17)) ^~ $unsigned((!reg57))) << ((~reg65[(5'h11):(3'h7)]) >>> ((-reg61) ?
                      reg55 : $signed(reg64)))) ?
                  wire50[(3'h4):(2'h3)] : (~&$signed(wire52)));
            end
        end
      if ($signed($signed($unsigned($unsigned(reg66)))))
        begin
          reg67 <= {reg64, $unsigned({wire21})};
        end
      else
        begin
          if ((&$unsigned({reg63[(3'h7):(1'h0)]})))
            begin
              reg67 <= $unsigned($signed({reg61[(1'h0):(1'h0)]}));
              reg68 <= reg58;
              reg69 <= $signed(reg68[(2'h2):(1'h1)]);
            end
          else
            begin
              reg67 <= wire18;
            end
          if ({$unsigned((^~$unsigned((wire18 ? reg61 : (8'hbe))))),
              {($unsigned((+wire15)) + (wire50[(4'h9):(1'h0)] ?
                      $unsigned(reg58) : $signed(reg57)))}})
            begin
              reg70 <= $signed($signed((($signed(wire52) - $signed(wire56)) << ($unsigned(reg55) <<< $unsigned(reg55)))));
            end
          else
            begin
              reg70 <= reg60[(4'ha):(3'h6)];
              reg71 <= ($unsigned((((+reg59) >> (wire56 ?
                      (8'hb7) : (7'h44))) + (reg63[(4'he):(4'ha)] * $signed(reg67)))) ?
                  $unsigned($unsigned((|(wire16 || (7'h44))))) : ((($signed(reg65) <= reg69) && $signed($unsigned(wire17))) & ((^(wire21 ?
                          reg60 : wire17)) ?
                      $signed((~|wire16)) : (!((8'ha0) ? wire18 : wire52)))));
              reg72 <= $signed(reg62);
              reg73 <= (!$unsigned($unsigned((~&reg57[(1'h1):(1'h1)]))));
            end
          reg74 <= (~^(((|reg54) != ((8'hba) + {(8'hb9)})) * reg64));
        end
    end
  assign wire75 = (^(+{((wire18 <= wire52) >= reg58)}));
  assign wire76 = reg63;
  assign wire77 = ($signed((~^$signed(wire50[(2'h2):(1'h1)]))) ?
                      wire21 : ((|(8'hac)) ?
                          $signed(reg69[(3'h7):(1'h1)]) : (((wire75 ?
                                      (8'ha1) : reg65) ?
                                  (reg64 > wire18) : $signed(wire52)) ?
                              (8'ha5) : $signed((7'h41)))));
  always
    @(posedge clk) begin
      reg78 <= wire17;
      reg79 <= {$unsigned(wire52)};
    end
  assign wire80 = (^~reg70[(4'hf):(4'ha)]);
  always
    @(posedge clk) begin
      if ((8'hbe))
        begin
          reg81 <= (&(+$signed(wire56[(2'h2):(1'h1)])));
          if (wire52)
            begin
              reg82 <= ((-wire18[(1'h1):(1'h0)]) & ($signed($unsigned((reg65 | reg54))) ?
                  {(wire50 ? $signed(wire75) : reg64), (~{reg60})} : ((&(reg62 ?
                      reg78 : reg62)) == wire21)));
            end
          else
            begin
              reg82 <= ($unsigned(wire52[(1'h0):(1'h0)]) ?
                  $signed((((wire77 ?
                      reg72 : reg69) != (&(8'haf))) <= reg78)) : $signed(reg71));
              reg83 <= $unsigned($unsigned(((reg61[(3'h5):(2'h3)] ?
                      (~&reg59) : wire56[(1'h0):(1'h0)]) ?
                  (7'h42) : reg81[(4'hf):(4'he)])));
              reg84 <= (((~reg55[(5'h13):(4'hf)]) + (~|$signed(reg57[(3'h7):(3'h6)]))) ?
                  reg69 : $unsigned(reg83));
              reg85 <= $signed($signed(wire15));
              reg86 <= ($signed(reg64) ?
                  wire15 : $signed($unsigned($unsigned($signed(reg62)))));
            end
          if ($signed($unsigned((&$signed((-reg78))))))
            begin
              reg87 <= $unsigned(reg63[(4'ha):(2'h2)]);
              reg88 <= $unsigned($signed({$unsigned((reg82 ? reg74 : reg71))}));
            end
          else
            begin
              reg87 <= wire75[(3'h5):(1'h1)];
              reg88 <= {$unsigned(reg87)};
            end
        end
      else
        begin
          reg81 <= $signed(($unsigned(($unsigned(reg83) ?
                  ((8'h9e) + reg55) : wire52)) ?
              (&$signed((reg73 ? wire77 : wire75))) : ($signed((reg69 ?
                  reg74 : (8'haf))) == reg57[(4'hc):(3'h7)])));
          reg82 <= (!(reg57 ?
              $unsigned((reg55[(1'h1):(1'h0)] & (wire17 ?
                  reg72 : reg59))) : $unsigned(($signed(reg68) != $signed(wire21)))));
        end
      reg89 <= ((8'hb3) ?
          $signed((($signed(reg78) ~^ reg70[(2'h2):(1'h1)]) ?
              $signed((wire20 > reg69)) : ((reg74 ^ reg66) ?
                  (wire15 ?
                      wire20 : reg82) : reg69[(3'h4):(2'h3)]))) : {$unsigned(($unsigned((8'ha6)) <<< wire77[(4'he):(3'h6)]))});
      if ((^~{(~&$signed($unsigned(wire21))),
          (wire19[(5'h10):(3'h4)] ?
              $unsigned($signed(wire56)) : $signed((~wire75)))}))
        begin
          reg90 <= wire18;
          reg91 <= reg88[(2'h2):(1'h0)];
        end
      else
        begin
          if (wire52)
            begin
              reg90 <= ((~|(!$unsigned(wire50[(3'h6):(1'h1)]))) * reg78);
              reg91 <= {$signed({$unsigned($signed(reg71))})};
              reg92 <= reg83[(3'h6):(2'h3)];
              reg93 <= {$signed(wire50[(1'h1):(1'h0)]), reg67[(1'h1):(1'h1)]};
              reg94 <= ($signed((!({wire77, reg78} ?
                      {reg89, (8'h9e)} : $signed(reg55)))) ?
                  ($unsigned(reg88) ?
                      {((reg69 ? reg71 : reg73) ^~ $signed(reg88)),
                          reg57[(3'h4):(1'h1)]} : wire76[(3'h7):(1'h0)]) : (&(wire50 ?
                      reg55[(1'h0):(1'h0)] : {$signed(wire21),
                          $signed(wire52)})));
            end
          else
            begin
              reg90 <= (!($unsigned(((reg94 ?
                      wire21 : reg60) && (reg90 ^~ reg60))) ?
                  ($signed(((8'hbe) * wire80)) ^ ($unsigned(reg67) ^~ {reg94,
                      reg90})) : (!((wire52 ? wire50 : wire52) >>> reg57))));
              reg91 <= $signed(reg82[(3'h4):(2'h3)]);
              reg92 <= (~^$signed($unsigned(((~&reg57) >> (wire76 ?
                  reg68 : reg58)))));
            end
          reg95 <= reg85[(3'h5):(3'h4)];
        end
      reg96 <= ($signed((((wire56 ? wire17 : reg93) ?
              (wire76 ? (8'haf) : (8'ha5)) : ((8'hb8) ? reg65 : reg55)) ?
          (~^{wire77}) : reg87)) <= reg88);
    end
  assign wire97 = reg69;
  assign wire98 = $unsigned((($signed((wire15 ? reg63 : reg58)) <<< wire19) ?
                      $unsigned(reg54[(1'h0):(1'h0)]) : ((!(wire20 >= reg94)) == {$unsigned(reg70),
                          (reg63 ? reg79 : reg54)})));
  module99 #() modinst112 (.wire100(reg68), .wire101(reg95), .wire102(wire50), .clk(clk), .y(wire111), .wire104(reg81), .wire103(wire17));
  assign wire113 = $signed((|(~^$signed(reg53[(1'h0):(1'h0)]))));
  assign wire114 = ((^~$unsigned(((reg96 | reg71) ?
                           $unsigned(wire16) : ((7'h40) << wire98)))) ?
                       $signed((reg59 ?
                           reg95[(1'h0):(1'h0)] : {(reg55 ?
                                   wire113 : reg74)})) : ((({(8'hab),
                                   reg53} > (~&reg55)) ?
                               reg88[(2'h2):(1'h0)] : ((reg72 ?
                                       reg74 : (8'hb7)) ?
                                   $signed((8'hab)) : (reg63 <= (7'h41)))) ?
                           (&((wire19 ?
                               (7'h43) : (8'hb4)) == $unsigned(reg67))) : ($signed(((8'ha7) ?
                               reg96 : reg78)) >> ({reg84, reg83} ?
                               reg91[(1'h0):(1'h0)] : $unsigned(reg72)))));
  assign wire115 = {((reg92 & $unsigned($signed(reg54))) ?
                           reg61[(4'ha):(1'h1)] : (wire17[(4'hc):(4'h9)] > ((+reg54) ?
                               $signed((8'hb0)) : (reg60 - wire16)))),
                       (8'hb9)};
  assign wire116 = reg84;
  assign wire117 = wire76;
  assign wire118 = ((!$signed(((+wire113) ?
                       (reg74 || wire18) : {reg55,
                           wire15}))) ^~ $unsigned((^($signed(wire19) > reg53))));
  assign wire119 = $unsigned({$unsigned(((wire21 ?
                           (8'ha8) : (8'ha5)) << reg78)),
                       $unsigned(reg83)});
endmodule

module module99
#(parameter param109 = (~(((~(~(7'h41))) & ({(7'h41), (8'haf)} ? (&(8'h9c)) : {(8'hba)})) | (|({(8'hb2)} ? (-(8'hb6)) : ((7'h44) ~^ (8'h9c)))))), 
parameter param110 = (+({((param109 || param109) ? (~|param109) : (param109 < param109)), (~^{param109})} >>> (param109 ? (-param109) : (((8'h9d) >> param109) != (param109 ? param109 : param109))))))
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire104;
  input wire [(3'h6):(1'h0)] wire103;
  input wire [(5'h12):(1'h0)] wire102;
  input wire signed [(3'h6):(1'h0)] wire101;
  input wire [(5'h15):(1'h0)] wire100;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire signed [(5'h12):(1'h0)] wire106;
  wire signed [(4'ha):(1'h0)] wire105;
  assign y = {wire108, wire107, wire106, wire105, (1'h0)};
  assign wire105 = {$unsigned(wire103), wire100[(4'hd):(4'hc)]};
  assign wire106 = (^wire103);
  assign wire107 = (+(~^{((~wire102) ?
                           $unsigned(wire104) : $signed((8'ha3)))}));
  assign wire108 = wire100[(1'h0):(1'h0)];
endmodule

module module22
#(parameter param49 = {(^~{{(8'ha7), ((8'haf) ? (8'hbe) : (8'ha6))}, (^~((8'hbf) ? (8'ha7) : (8'hac)))})})
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire signed [(3'h4):(1'h0)] wire24;
  input wire [(4'h9):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire27;
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire40,
                 wire39,
                 wire38,
                 wire27,
                 reg43,
                 reg42,
                 reg41,
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
                 (1'h0)};
  assign wire27 = $signed($unsigned((^{$unsigned((8'hbf)),
                      (wire23 & wire25)})));
  always
    @(posedge clk) begin
      reg28 <= $unsigned($unsigned(wire26));
      if ((8'hae))
        begin
          reg29 <= (wire27 * wire24[(1'h1):(1'h1)]);
        end
      else
        begin
          reg29 <= $signed({$signed(reg28[(3'h6):(2'h2)])});
          if (wire26)
            begin
              reg30 <= {$signed(wire24)};
              reg31 <= ($unsigned($unsigned(((wire24 ? reg28 : reg28) ?
                  {(8'ha9)} : $signed((8'ha4))))) ^ (~&(~((^~wire23) ?
                  wire27 : (~|(8'hb9))))));
              reg32 <= {$unsigned(($unsigned((reg30 < reg31)) ?
                      (^~{reg29}) : wire25)),
                  wire27};
              reg33 <= reg32[(3'h4):(3'h4)];
              reg34 <= ((&(8'ha7)) ?
                  $signed(wire27) : (reg32[(1'h0):(1'h0)] ?
                      (((wire27 ? reg29 : wire26) ?
                              (reg31 ? reg32 : reg28) : $unsigned((8'hb0))) ?
                          ({(8'ha5)} >> wire27) : wire26) : wire24[(2'h3):(2'h2)]));
            end
          else
            begin
              reg30 <= (($unsigned($unsigned(wire27)) > (|$unsigned({reg28,
                  reg33}))) ^ $unsigned($signed(wire25[(2'h2):(1'h0)])));
              reg31 <= $signed($signed({{(^wire25)}}));
              reg32 <= reg33;
              reg33 <= (!wire25);
              reg34 <= ({(wire25[(2'h3):(2'h3)] > $signed((wire26 ?
                          (7'h44) : reg32)))} ?
                  ($signed(reg32[(1'h1):(1'h0)]) >> ((^~{reg33}) ?
                      ((^(7'h41)) ?
                          (-reg34) : (!reg32)) : ((-(8'hac)) + ((8'h9e) ?
                          reg29 : reg29)))) : ((~wire26[(3'h6):(3'h4)]) ?
                      {$signed(reg33)} : reg33));
            end
        end
      reg35 <= {reg29};
    end
  always
    @(posedge clk) begin
      reg36 <= (^~reg32[(3'h4):(2'h3)]);
      reg37 <= (^~(-(reg35 ^~ reg35[(3'h5):(2'h3)])));
    end
  assign wire38 = $unsigned($unsigned((~((reg33 + wire25) ?
                      {reg35, reg37} : $unsigned(reg28)))));
  assign wire39 = reg29[(3'h5):(1'h0)];
  assign wire40 = $unsigned($signed($signed((wire26[(1'h0):(1'h0)] ?
                      {reg33, wire25} : (reg37 & (8'hb7))))));
  always
    @(posedge clk) begin
      reg41 <= reg34;
      reg42 <= (~|(($unsigned($unsigned(wire27)) ?
              reg32 : ((wire27 ? reg30 : reg30) >>> reg33[(2'h3):(2'h2)])) ?
          {(8'hb1)} : $signed((~|(|reg37)))));
      reg43 <= reg34[(4'hc):(1'h0)];
    end
  assign wire44 = $unsigned(((!(reg33[(2'h3):(1'h0)] ?
                      (wire40 ~^ reg37) : (reg42 ?
                          reg34 : reg29))) << wire39[(3'h5):(1'h0)]));
  assign wire45 = (^$unsigned(wire39));
  assign wire46 = ({($signed({reg34}) || $signed((+reg41))),
                      (reg43 & $signed((wire26 << reg37)))} >> reg32[(1'h0):(1'h0)]);
  assign wire47 = $signed(reg28[(3'h7):(3'h7)]);
  assign wire48 = $signed(wire27);
endmodule
