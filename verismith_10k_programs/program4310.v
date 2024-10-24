module top
#(parameter param287 = (((({(8'hbf)} ? (~|(8'haf)) : (~|(8'haf))) - (7'h43)) < (+(!((8'hbc) <= (8'hab))))) ? {((8'hac) ? ((^(8'hbe)) + ((8'hbf) ^~ (8'h9c))) : {((8'ha1) != (8'h9f)), ((8'ha8) ? (8'ha9) : (8'ha7))}), ((~|(8'ha2)) >>> {((7'h41) != (8'hab)), ((8'hbb) >= (8'hbe))})} : ((^~(8'ha1)) ? (+((~^(8'had)) ~^ ((8'hac) ? (8'hb3) : (8'hb2)))) : (~|(((8'hb9) & (7'h41)) ? (~|(8'ha5)) : (~|(8'hbc)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1d6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire286;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire64;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire284;
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  assign y = {wire286,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire57,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire67,
                 wire284,
                 reg66,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((wire2 ? wire3[(5'h12):(4'he)] : (|wire2))))
        begin
          reg4 <= wire0;
          reg5 <= $signed((+(((reg4 * wire1) | reg4) ?
              $unsigned($unsigned(wire3)) : wire3[(4'he):(2'h2)])));
          if ((wire3[(5'h13):(4'hb)] << (~^$signed(reg5))))
            begin
              reg6 <= wire3[(4'hf):(2'h3)];
              reg7 <= $unsigned(((((wire0 ? wire0 : reg6) ?
                      $signed(reg4) : wire1) ?
                  ((wire1 + wire3) > wire1[(3'h7):(2'h3)]) : (reg5[(4'h8):(3'h4)] > (wire0 ^ (7'h42)))) >> (($signed(reg6) ?
                  {(8'hb6)} : wire1) << wire1)));
              reg8 <= {(($signed(reg6[(1'h1):(1'h0)]) - ($signed(reg4) ?
                          (!wire2) : wire0)) ?
                      reg6 : ({reg5} < ((~wire2) >>> $unsigned((8'hb6))))),
                  (wire1[(4'ha):(3'h7)] * reg6[(2'h3):(2'h3)])};
              reg9 <= $signed(wire0);
              reg10 <= {(^$unsigned(wire2[(2'h3):(1'h1)])), (8'hac)};
            end
          else
            begin
              reg6 <= wire0[(1'h1):(1'h0)];
              reg7 <= reg7[(4'ha):(3'h5)];
            end
          reg11 <= wire2[(3'h4):(1'h0)];
        end
      else
        begin
          if (($unsigned(reg5) ?
              $signed({reg5[(4'h9):(3'h5)],
                  ((reg10 ? wire1 : wire2) * {reg10,
                      reg4})}) : reg6[(3'h6):(3'h4)]))
            begin
              reg4 <= ((reg11 > (reg11[(3'h5):(2'h2)] ?
                      (^(reg9 ? reg10 : reg8)) : {reg8})) ?
                  $signed(wire0) : reg4[(4'h8):(3'h5)]);
            end
          else
            begin
              reg4 <= $unsigned(($unsigned($signed(reg5[(3'h7):(3'h4)])) ?
                  ($unsigned(reg9) >= {$unsigned(wire2)}) : (($unsigned(reg11) ?
                      $unsigned((8'had)) : (reg8 & wire3)) ^~ (&$unsigned(reg11)))));
              reg5 <= (!$signed(reg7[(3'h7):(3'h6)]));
              reg6 <= wire0[(3'h7):(3'h4)];
            end
          if ((~^reg11))
            begin
              reg7 <= wire3;
            end
          else
            begin
              reg7 <= ((+reg9) <<< $signed(reg5[(3'h5):(2'h3)]));
              reg8 <= (~(wire1[(1'h1):(1'h0)] << (((reg10 ? reg6 : reg4) ?
                      (wire3 >> (8'hba)) : (reg9 ? wire3 : (8'ha4))) ?
                  ((reg9 && reg8) ?
                      reg10[(3'h5):(1'h0)] : reg4[(3'h5):(1'h0)]) : {reg8[(4'h8):(1'h0)]})));
              reg9 <= wire2[(3'h4):(1'h0)];
              reg10 <= reg7;
              reg11 <= ({reg6} == (reg8 ?
                  $unsigned((reg9[(3'h4):(1'h0)] <<< (reg7 == reg10))) : wire2[(2'h2):(2'h2)]));
            end
          reg12 <= (^~$unsigned($signed((!$signed(reg8)))));
        end
      reg13 <= (reg9 ~^ $unsigned(reg4[(3'h5):(2'h3)]));
      reg14 <= $signed((wire0 != $unsigned(((reg12 ? wire1 : reg9) ?
          (wire0 >= reg4) : (reg13 << (8'ha8))))));
    end
  assign wire15 = reg4[(3'h7):(2'h2)];
  assign wire16 = $unsigned(($unsigned(wire0[(3'h6):(1'h0)]) ?
                      (wire3[(4'ha):(3'h5)] ?
                          $signed(((8'ha5) ?
                              reg13 : reg5)) : (wire0[(3'h5):(3'h4)] ?
                              $signed((8'h9e)) : $signed(reg9))) : (~&wire3)));
  assign wire17 = wire15[(2'h2):(1'h1)];
  assign wire18 = ($unsigned(($signed((~^wire17)) ?
                          {$unsigned(reg6), (+reg12)} : $unsigned({wire15,
                              (7'h41)}))) ?
                      ($unsigned($unsigned(reg5)) ?
                          (8'h9d) : $signed(($unsigned(reg11) || (reg4 ?
                              reg6 : wire2)))) : ((({reg9, reg12} ?
                          (reg6 ^~ reg13) : (reg9 >>> reg8)) * $signed(wire3)) >= wire1));
  assign wire19 = wire3[(4'h9):(3'h4)];
  assign wire20 = (^$unsigned(((~&(wire1 ?
                      wire2 : wire15)) * ($signed(reg13) >>> (wire18 ^~ reg4)))));
  assign wire21 = ((((&{wire15}) ?
                      wire15 : reg12[(5'h12):(4'hf)]) && (wire2[(3'h4):(1'h1)] ?
                      {(~|wire19),
                          (~|wire20)} : $unsigned((8'ha6)))) - ((|(wire0 && (wire19 <= (8'had)))) ?
                      $signed($unsigned(wire20[(3'h6):(3'h5)])) : reg8[(3'h5):(3'h5)]));
  assign wire22 = ($unsigned((wire3 ?
                      (wire21 >= reg9[(4'ha):(3'h6)]) : ($unsigned(reg4) >>> (reg13 ?
                          wire0 : (8'hbb))))) & ($signed(wire3[(3'h7):(2'h2)]) > reg11));
  always
    @(posedge clk) begin
      reg23 <= ($unsigned($unsigned($unsigned(reg7[(1'h1):(1'h1)]))) ?
          $unsigned(wire15) : ($unsigned((&(wire15 + reg7))) ?
              $unsigned(((~&reg14) ?
                  (reg9 >= (8'hbb)) : $signed((8'hbf)))) : (reg11[(3'h4):(3'h4)] ?
                  reg8[(3'h7):(2'h2)] : ((reg8 >>> wire3) * (8'ha0)))));
      reg24 <= (($signed({(reg10 ? wire22 : reg12), wire20[(3'h7):(3'h7)]}) ?
              $signed($signed(wire22[(5'h11):(1'h1)])) : (~&$signed((wire16 ?
                  wire2 : reg8)))) ?
          $unsigned(wire19) : {$signed(($signed(wire17) > {(8'ha0)})),
              {((reg7 ? reg23 : reg23) ?
                      $signed(wire21) : $unsigned((8'h9e)))}});
      if (wire0)
        begin
          reg25 <= reg13[(4'hd):(4'hd)];
        end
      else
        begin
          if ((wire20 + (~reg14[(4'hc):(1'h1)])))
            begin
              reg25 <= (-$signed($signed($unsigned({reg8, reg9}))));
              reg26 <= reg24;
            end
          else
            begin
              reg25 <= reg23[(4'h8):(3'h4)];
              reg26 <= $unsigned($signed(((&(reg4 ?
                  reg11 : wire2)) ^~ {reg26[(3'h5):(1'h0)]})));
              reg27 <= wire15[(3'h4):(1'h0)];
              reg28 <= (((wire0[(4'hb):(3'h4)] <<< reg5[(4'he):(3'h7)]) > reg13[(3'h7):(2'h3)]) ?
                  $signed(wire1[(4'ha):(2'h2)]) : (8'hb2));
            end
        end
    end
  module29 #() modinst58 (.wire33(reg28), .wire31(reg24), .clk(clk), .wire34(wire1), .wire32(wire3), .wire30(reg7), .y(wire57));
  assign wire59 = {(reg5[(1'h0):(1'h0)] ~^ {wire19[(1'h0):(1'h0)], reg10}),
                      reg4};
  assign wire60 = wire21;
  assign wire61 = $signed(wire1[(2'h3):(2'h2)]);
  assign wire62 = ($unsigned((($signed(wire20) ?
                              wire60[(4'he):(1'h1)] : wire20[(5'h11):(3'h5)]) ?
                          wire20[(3'h7):(2'h2)] : ((wire22 ?
                              wire16 : reg25) ^ wire2))) ?
                      $signed($unsigned(wire57)) : reg6);
  assign wire63 = reg5;
  assign wire64 = {{($unsigned(((8'had) | reg28)) > wire20[(2'h2):(1'h1)]),
                          (reg11[(2'h2):(2'h2)] ?
                              (+$unsigned((7'h41))) : (+reg11[(3'h4):(2'h2)]))},
                      (+(wire22 & (((8'hb1) ? (8'hb2) : wire59) ?
                          (reg13 ~^ (8'haf)) : reg24)))};
  assign wire65 = wire21[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg66 <= (~|{($unsigned($signed(reg23)) >= reg12[(4'ha):(1'h1)])});
    end
  assign wire67 = {$signed((((wire20 & reg7) ?
                          (reg23 ?
                              wire22 : (8'h9e)) : wire59) <<< {(reg23 != wire57),
                          (!reg14)}))};
  module68 #() modinst285 (wire284, clk, reg24, reg66, reg23, wire16, reg12);
  assign wire286 = $unsigned(reg66);
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'h225):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire73;
  input wire signed [(5'h12):(1'h0)] wire72;
  input wire [(5'h10):(1'h0)] wire71;
  input wire [(3'h4):(1'h0)] wire70;
  input wire signed [(5'h11):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire283;
  wire signed [(4'h8):(1'h0)] wire282;
  wire [(4'hd):(1'h0)] wire281;
  wire [(3'h6):(1'h0)] wire280;
  wire [(5'h14):(1'h0)] wire279;
  wire [(3'h7):(1'h0)] wire278;
  wire signed [(5'h15):(1'h0)] wire276;
  wire [(4'hf):(1'h0)] wire226;
  wire [(4'hf):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire95;
  wire [(3'h5):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire162;
  wire [(5'h11):(1'h0)] wire164;
  wire signed [(3'h7):(1'h0)] wire224;
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'hb):(1'h0)] reg89 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  assign y = {wire283,
                 wire282,
                 wire281,
                 wire280,
                 wire279,
                 wire278,
                 wire276,
                 wire226,
                 wire124,
                 wire104,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire74,
                 wire162,
                 wire164,
                 wire224,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 (1'h0)};
  assign wire74 = (((8'hb7) >>> $unsigned((^~wire69[(4'hb):(1'h1)]))) + (^(8'hac)));
  always
    @(posedge clk) begin
      if (wire72[(1'h1):(1'h0)])
        begin
          if ($signed((wire72[(1'h0):(1'h0)] ?
              $signed($unsigned((|(8'hbb)))) : (($unsigned((8'hbe)) ^~ $unsigned(wire71)) ?
                  (wire71 != $signed(wire72)) : $unsigned({wire70})))))
            begin
              reg75 <= $unsigned(((~|(wire69[(4'hd):(4'h9)] ?
                  $unsigned(wire71) : (wire73 ?
                      wire70 : wire73))) == ({$unsigned(wire74),
                      wire72[(1'h0):(1'h0)]} ?
                  $unsigned((wire73 >= wire74)) : ((wire72 != wire70) ?
                      $unsigned((8'hb0)) : $signed((8'hb3))))));
              reg76 <= {wire70[(2'h2):(1'h1)],
                  ($unsigned({wire71}) ^~ $signed($unsigned(wire72)))};
              reg77 <= $signed($unsigned(reg75[(4'hc):(1'h0)]));
              reg78 <= $signed($signed((8'ha8)));
              reg79 <= reg76;
            end
          else
            begin
              reg75 <= ({({((8'ha6) ? reg76 : (8'hb5))} ?
                          (8'ha8) : (reg79[(2'h2):(2'h2)] ?
                              $signed(reg75) : $unsigned(wire74)))} ?
                  (8'ha9) : $unsigned(($unsigned(((8'haf) ?
                      wire69 : wire74)) | ($unsigned(wire69) << (reg75 + wire73)))));
              reg76 <= $signed({$signed(wire74[(3'h4):(3'h4)])});
            end
          if ($signed($signed({$unsigned((reg78 ^~ reg79))})))
            begin
              reg80 <= ($unsigned((wire74 ~^ ((8'hbd) ?
                      (wire69 ? reg77 : reg75) : {wire69, reg77}))) ?
                  wire74[(4'h9):(1'h1)] : wire69);
              reg81 <= wire69[(4'h8):(3'h7)];
              reg82 <= reg80[(4'h8):(2'h3)];
              reg83 <= $signed((($signed((reg81 ? wire72 : wire69)) ?
                      (~&(!wire69)) : (8'ha2)) ?
                  $unsigned(reg80[(2'h3):(2'h2)]) : $signed($signed((~|wire73)))));
              reg84 <= wire71;
            end
          else
            begin
              reg80 <= $unsigned(reg79[(1'h0):(1'h0)]);
            end
          reg85 <= (+$signed(reg84));
          reg86 <= wire69[(3'h5):(3'h4)];
        end
      else
        begin
          reg75 <= $unsigned(((8'hbe) ?
              {wire69} : (-((reg80 ? reg86 : wire73) ?
                  reg77[(3'h5):(2'h3)] : wire69[(2'h2):(1'h0)]))));
          reg76 <= {wire71, wire73};
          reg77 <= $unsigned((reg77 ?
              (|reg75) : {($unsigned(wire69) ?
                      ((8'h9f) <= reg85) : (wire71 != wire73))}));
          reg78 <= $unsigned({$unsigned($signed(((8'ha4) ? reg84 : reg77))),
              (reg83 & ($signed(reg81) | $signed(reg78)))});
        end
      reg87 <= {((($signed(reg83) * (~&reg83)) < {{wire70}}) ?
              wire72 : $unsigned(($signed((8'ha6)) ~^ reg79[(1'h1):(1'h0)])))};
      reg88 <= ((|(reg76[(5'h10):(4'hd)] ?
              $signed((~^wire74)) : {((8'hb0) ? (8'ha0) : reg78)})) ?
          wire70[(2'h2):(2'h2)] : {$signed($signed(reg87[(2'h3):(2'h3)])),
              $signed(wire69)});
      reg89 <= ((~&$unsigned(((8'hb8) << $signed(wire69)))) >= (^$unsigned((~$signed(reg83)))));
    end
  assign wire90 = reg88;
  assign wire91 = reg89;
  assign wire92 = reg76[(4'h9):(3'h4)];
  assign wire93 = (wire91[(1'h1):(1'h1)] ? (reg82 > (8'ha2)) : $signed(reg79));
  assign wire94 = (~&(+wire91));
  assign wire95 = (~^(($signed({(8'hbf), wire93}) ^~ (^~(reg81 ?
                      wire93 : wire93))) <<< wire69[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      reg96 <= (wire92 ?
          ((wire72 && reg78) ?
              (reg83 ?
                  (wire74[(3'h4):(1'h1)] >>> (reg80 ?
                      wire91 : wire74)) : ((wire93 ? reg81 : (8'hb7)) ?
                      reg84 : $signed(reg83))) : (^({reg78} ^ wire95))) : $unsigned((($unsigned(wire91) ?
              (&reg75) : $signed(wire94)) != $unsigned($signed(wire72)))));
      if (($signed($unsigned(($signed(wire93) <= ((8'hbf) ?
          reg86 : reg79)))) & (($unsigned((reg96 ? reg76 : reg82)) * reg75) ?
          wire74 : ($signed($unsigned(wire71)) ?
              (+(|(8'hae))) : $unsigned(((8'had) ? wire74 : reg86))))))
        begin
          if (wire95)
            begin
              reg97 <= (~|(reg82[(1'h0):(1'h0)] ?
                  $unsigned($unsigned(reg78)) : ($unsigned($unsigned(wire72)) | reg75)));
              reg98 <= $signed((|reg88));
            end
          else
            begin
              reg97 <= $signed(((wire95[(1'h1):(1'h0)] ?
                  (|wire93) : (reg81 ?
                      (wire74 >> (8'haa)) : $unsigned((8'ha1)))) != reg82[(1'h1):(1'h1)]));
            end
          if ((reg81[(3'h5):(2'h3)] ?
              (^((&$signed((8'hae))) ~^ $unsigned(reg96[(3'h5):(1'h1)]))) : ($unsigned(reg87) ?
                  (-$unsigned($signed(reg77))) : (((^~wire72) ?
                          (wire70 << (8'hb3)) : $signed(reg89)) ?
                      $signed((reg78 ?
                          wire94 : reg86)) : wire92[(3'h5):(3'h5)]))))
            begin
              reg99 <= $unsigned($unsigned(reg83));
              reg100 <= $unsigned(wire92);
              reg101 <= $signed($unsigned(((&{(8'haf)}) || $unsigned(reg81[(3'h7):(3'h7)]))));
            end
          else
            begin
              reg99 <= (($signed((wire73[(5'h15):(4'hc)] ?
                      wire93[(4'h9):(2'h2)] : (&(8'ha8)))) ?
                  $signed(((reg88 & reg83) ?
                      ((8'ha3) & (7'h42)) : reg87)) : $signed(reg86)) >= $signed($unsigned(reg83[(1'h0):(1'h0)])));
              reg100 <= {$unsigned(($unsigned({wire72, reg97}) | wire74)),
                  {($signed({reg75}) ?
                          ((wire74 ?
                              reg98 : wire70) <<< (~|(8'ha7))) : (^~(|wire93)))}};
              reg101 <= (((-(8'hb4)) * wire93[(1'h0):(1'h0)]) ?
                  ({((|reg79) ? {wire93, reg78} : $unsigned(reg84)),
                      (~^(reg75 ?
                          wire71 : wire91))} > wire70[(2'h2):(2'h2)]) : ({((8'hb5) ?
                              wire73[(3'h5):(2'h2)] : (8'hbd)),
                          ((reg88 ? wire74 : reg97) && wire90)} ?
                      $unsigned((((8'ha0) ? (7'h40) : reg79) ?
                          (|wire93) : (!reg75))) : $signed(reg88[(2'h3):(2'h2)])));
              reg102 <= reg86;
            end
          reg103 <= $unsigned(reg84);
        end
      else
        begin
          if ((~^reg96[(2'h2):(1'h0)]))
            begin
              reg97 <= reg88;
              reg98 <= reg79;
            end
          else
            begin
              reg97 <= {(reg79 ? $signed(wire71[(3'h4):(2'h2)]) : wire95),
                  reg102[(3'h7):(3'h7)]};
              reg98 <= $unsigned({(reg77 >= reg99[(5'h13):(5'h11)]), reg75});
              reg99 <= $signed($unsigned($signed(($unsigned(reg88) ?
                  (reg75 ? reg75 : reg86) : wire73))));
            end
          reg100 <= (($unsigned(wire74) ?
                  (reg96[(1'h0):(1'h0)] <= reg84[(2'h2):(1'h1)]) : $unsigned(((reg103 ?
                      reg98 : reg83) <<< (reg99 ? reg76 : reg87)))) ?
              (8'hb9) : wire91[(2'h2):(1'h1)]);
        end
    end
  assign wire104 = wire93;
  module105 #() modinst125 (.clk(clk), .wire107(wire72), .y(wire124), .wire109(reg97), .wire106(wire69), .wire108(wire74));
  module126 #() modinst163 (wire162, clk, reg101, reg86, reg81, reg79, reg78);
  assign wire164 = $signed(((reg77 + $signed(wire162[(4'ha):(3'h4)])) || $unsigned(($unsigned(reg76) ?
                       (reg83 + wire124) : {wire69}))));
  module165 #() modinst225 (wire224, clk, reg102, wire91, reg89, wire164, wire71);
  assign wire226 = $signed(wire73[(4'h8):(4'h8)]);
  module227 #() modinst277 (.clk(clk), .wire231(wire74), .wire232(wire95), .wire230(reg98), .y(wire276), .wire229(reg75), .wire228(reg87));
  assign wire278 = (^~($signed((^wire104)) - reg82[(1'h0):(1'h0)]));
  assign wire279 = reg86;
  assign wire280 = {reg79};
  assign wire281 = $unsigned((-$unsigned($signed((reg77 ? reg101 : reg100)))));
  assign wire282 = wire93[(4'hb):(4'ha)];
  assign wire283 = (8'ha2);
endmodule

module module29
#(parameter param56 = {(-((((8'haf) ^~ (8'hb5)) ? (+(7'h43)) : (!(8'ha0))) ? (-((8'ha5) == (8'h9e))) : (((8'ha2) ? (8'hb0) : (8'hb6)) <<< ((7'h44) ? (8'ha6) : (8'hac))))), ((8'hbb) || ({((8'ha4) ? (8'ha9) : (8'ha5)), (8'hbf)} + (((8'hba) ? (8'h9d) : (8'hbd)) | ((8'hb4) ? (8'h9c) : (7'h42)))))})
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  input wire signed [(5'h13):(1'h0)] wire32;
  input wire signed [(4'h8):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  wire signed [(4'ha):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(4'hb):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  assign y = {wire55,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire36,
                 wire35,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire35 = $unsigned($unsigned(wire31[(2'h2):(1'h0)]));
  assign wire36 = $unsigned(wire34[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg37 <= ((|wire32[(5'h13):(3'h7)]) ?
          (-wire36[(2'h3):(2'h2)]) : $signed(($unsigned((wire35 ^~ wire32)) - wire35)));
      reg38 <= $signed((reg37 >= wire32));
    end
  assign wire39 = $signed(wire33);
  assign wire40 = wire30[(1'h1):(1'h0)];
  assign wire41 = $unsigned((((|(-wire35)) != (8'hb1)) ?
                      $signed(wire34[(3'h7):(3'h5)]) : $unsigned({$unsigned(wire35)})));
  assign wire42 = ((+$unsigned((8'h9c))) ^ wire35[(1'h0):(1'h0)]);
  assign wire43 = $signed(((&wire35[(3'h7):(2'h2)]) ?
                      ($unsigned((wire31 ? wire34 : reg37)) ?
                          ((wire32 || wire36) ?
                              (wire31 ?
                                  wire32 : wire39) : (wire35 * wire35)) : reg37) : {(!$unsigned(wire35))}));
  assign wire44 = wire42[(1'h1):(1'h0)];
  assign wire45 = (8'ha6);
  assign wire46 = (&($signed(((8'h9c) ?
                          $signed(reg38) : ((8'ha0) ? wire32 : wire33))) ?
                      (!wire36) : wire41));
  always
    @(posedge clk) begin
      if (((((|wire41[(4'ha):(2'h3)]) ?
              $signed((^(8'hbf))) : $unsigned((8'ha3))) ?
          wire36 : {((wire40 != wire32) - wire40)}) >= {(!(wire42[(2'h3):(2'h2)] ?
              $signed(wire43) : {wire33})),
          wire35}))
        begin
          reg47 <= (~(wire36[(1'h1):(1'h0)] >= ((|(wire41 + (8'haa))) & (~$signed(wire33)))));
          reg48 <= (wire36[(2'h2):(1'h0)] ^ (wire46 ?
              (((reg47 > wire39) ? reg47 : (wire32 ? wire31 : reg38)) ?
                  ((~^reg38) || $signed(wire39)) : (+$unsigned(wire32))) : (wire43 ?
                  ((8'hb2) ^~ $signed(wire44)) : ($unsigned(reg38) ?
                      wire34 : (wire44 ? reg37 : reg37)))));
          reg49 <= wire40;
          reg50 <= $unsigned($signed(wire41));
        end
      else
        begin
          reg47 <= reg50;
          reg48 <= wire30;
          reg49 <= wire43[(1'h0):(1'h0)];
          reg50 <= {((|((~|wire31) * $signed(wire31))) << ($signed((8'hb8)) ?
                  {$unsigned(wire36)} : wire40[(3'h5):(1'h1)])),
              (~|((wire41 ? (8'hb9) : (wire39 ? wire40 : wire30)) ?
                  wire44[(4'h8):(2'h3)] : wire40))};
        end
      reg51 <= $signed($unsigned(reg47));
      reg52 <= (wire35 ?
          $signed(reg50[(4'he):(1'h1)]) : {wire31[(3'h6):(1'h0)]});
      reg53 <= $unsigned(wire32[(5'h13):(3'h4)]);
      reg54 <= (~^wire39);
    end
  assign wire55 = reg53;
endmodule

module module227
#(parameter param274 = (8'ha1), 
parameter param275 = param274)
(y, clk, wire232, wire231, wire230, wire229, wire228);
  output wire [(32'h1ae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire232;
  input wire [(4'hd):(1'h0)] wire231;
  input wire [(3'h6):(1'h0)] wire230;
  input wire signed [(3'h5):(1'h0)] wire229;
  input wire signed [(2'h3):(1'h0)] wire228;
  wire [(4'ha):(1'h0)] wire273;
  wire [(3'h4):(1'h0)] wire272;
  wire [(5'h10):(1'h0)] wire252;
  wire signed [(5'h15):(1'h0)] wire251;
  wire signed [(3'h7):(1'h0)] wire250;
  wire [(4'hf):(1'h0)] wire249;
  wire [(5'h11):(1'h0)] wire248;
  wire signed [(5'h11):(1'h0)] wire247;
  wire signed [(5'h10):(1'h0)] wire246;
  wire [(3'h5):(1'h0)] wire245;
  wire [(4'hc):(1'h0)] wire244;
  wire [(5'h14):(1'h0)] wire243;
  wire signed [(5'h15):(1'h0)] wire238;
  wire [(4'hd):(1'h0)] wire234;
  wire signed [(4'hd):(1'h0)] wire233;
  reg signed [(3'h4):(1'h0)] reg271 = (1'h0);
  reg [(3'h7):(1'h0)] reg270 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg269 = (1'h0);
  reg [(4'h9):(1'h0)] reg268 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg267 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg266 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg265 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg264 = (1'h0);
  reg [(4'h9):(1'h0)] reg263 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg262 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg261 = (1'h0);
  reg [(4'ha):(1'h0)] reg260 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg259 = (1'h0);
  reg [(4'hb):(1'h0)] reg258 = (1'h0);
  reg [(3'h4):(1'h0)] reg257 = (1'h0);
  reg [(3'h5):(1'h0)] reg256 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg255 = (1'h0);
  reg [(2'h2):(1'h0)] reg254 = (1'h0);
  reg [(5'h12):(1'h0)] reg253 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg242 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg241 = (1'h0);
  reg [(4'hb):(1'h0)] reg240 = (1'h0);
  reg [(4'hb):(1'h0)] reg239 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg237 = (1'h0);
  reg [(5'h11):(1'h0)] reg236 = (1'h0);
  reg [(4'hc):(1'h0)] reg235 = (1'h0);
  assign y = {wire273,
                 wire272,
                 wire252,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire238,
                 wire234,
                 wire233,
                 reg271,
                 reg270,
                 reg269,
                 reg268,
                 reg267,
                 reg266,
                 reg265,
                 reg264,
                 reg263,
                 reg262,
                 reg261,
                 reg260,
                 reg259,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg237,
                 reg236,
                 reg235,
                 (1'h0)};
  assign wire233 = ((8'haf) ?
                       (!(8'h9f)) : ($unsigned((~|$unsigned(wire229))) ?
                           $unsigned($signed((wire231 ?
                               wire228 : wire229))) : $signed((8'ha5))));
  assign wire234 = ((wire229 ?
                           $signed(($signed(wire228) ?
                               (~wire228) : (wire232 >= (8'ha8)))) : wire231) ?
                       $signed({((wire228 ? wire233 : wire230) <= {wire229}),
                           (~$unsigned(wire233))}) : wire233[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg235 <= $unsigned(wire233[(1'h0):(1'h0)]);
      reg236 <= (wire232 ? wire234[(1'h0):(1'h0)] : $unsigned(reg235));
      reg237 <= $signed((wire231 ?
          ({{wire233}} < ($unsigned(reg235) ?
              (8'h9e) : {wire230})) : reg235[(3'h7):(1'h0)]));
    end
  assign wire238 = wire233;
  always
    @(posedge clk) begin
      reg239 <= wire234;
      reg240 <= (-$signed($unsigned((~|wire233))));
      reg241 <= (8'hbd);
    end
  always
    @(posedge clk) begin
      reg242 <= $unsigned((~|$signed(wire233[(4'h8):(3'h6)])));
    end
  assign wire243 = ($unsigned(reg241) ?
                       (reg241 ^~ $unsigned((|(wire234 ?
                           wire238 : wire233)))) : wire233);
  assign wire244 = $signed(wire228);
  assign wire245 = reg240;
  assign wire246 = $unsigned(wire230);
  assign wire247 = wire238[(3'h5):(3'h4)];
  assign wire248 = reg241;
  assign wire249 = (8'hb9);
  assign wire250 = ({(^wire228[(2'h2):(2'h2)])} ^~ $signed(((wire246 != reg240) ~^ wire234[(1'h0):(1'h0)])));
  assign wire251 = wire246;
  assign wire252 = wire243[(4'he):(1'h1)];
  always
    @(posedge clk) begin
      reg253 <= $unsigned($signed($signed(((wire247 <= wire234) ?
          (wire244 ? wire238 : wire234) : {reg239}))));
      if (wire238[(5'h11):(2'h2)])
        begin
          reg254 <= (^~(8'haa));
          if (wire233[(2'h2):(1'h0)])
            begin
              reg255 <= (8'ha4);
              reg256 <= $signed((&wire243[(4'hf):(4'hc)]));
              reg257 <= $signed(wire248[(2'h3):(2'h3)]);
              reg258 <= $unsigned(wire230);
              reg259 <= (~(~&wire229));
            end
          else
            begin
              reg255 <= (~|(-reg255));
              reg256 <= ($signed((|((~^reg259) >> {(8'haa)}))) >>> reg259);
            end
          reg260 <= wire238[(4'h8):(2'h2)];
          reg261 <= (~|$unsigned(((~(wire232 ? reg254 : wire251)) && (wire252 ?
              (^reg239) : $unsigned((8'hbe))))));
          reg262 <= (!reg254);
        end
      else
        begin
          reg254 <= $signed({$signed((~^$unsigned(wire250))),
              (wire231 ?
                  ($signed(wire244) ^ (&wire250)) : (((8'ha3) && (8'hbb)) >> reg257))});
          reg255 <= wire232;
          if ((!$unsigned((((-(8'haf)) >>> (reg241 ?
              reg240 : reg259)) > wire231[(4'hc):(4'hb)]))))
            begin
              reg256 <= (^~$unsigned($signed(reg259)));
              reg257 <= $unsigned((8'ha9));
            end
          else
            begin
              reg256 <= wire247;
              reg257 <= $signed(reg253[(5'h12):(4'h8)]);
              reg258 <= (^~(($signed($unsigned(reg240)) ?
                      $unsigned(wire238) : $signed((wire248 ?
                          reg237 : wire232))) ?
                  (8'h9d) : reg254));
              reg259 <= {$signed((reg257 ? {(8'had)} : wire249)),
                  (reg235[(3'h5):(3'h4)] <= wire246)};
              reg260 <= (reg262 ? $unsigned(reg259) : wire245[(1'h1):(1'h1)]);
            end
        end
      if (wire245)
        begin
          reg263 <= reg237;
          reg264 <= ((^~$unsigned(({wire244} & (wire229 >> reg237)))) ~^ wire243[(5'h10):(2'h2)]);
          reg265 <= reg242[(2'h3):(2'h3)];
        end
      else
        begin
          if ({reg260[(3'h6):(3'h4)],
              (+($unsigned(reg239) ? {wire246} : reg237))})
            begin
              reg263 <= $unsigned((((wire244 ?
                      wire230[(2'h2):(1'h1)] : $signed((8'hb5))) == (~^$signed((8'h9c)))) ?
                  ($unsigned(reg263) ?
                      (~&(-reg264)) : ({reg256} ?
                          wire230[(3'h6):(2'h3)] : wire248)) : $signed(wire252)));
              reg264 <= ((reg254[(1'h0):(1'h0)] ? wire228 : reg260) ?
                  wire231[(1'h0):(1'h0)] : (($unsigned($signed(reg241)) ?
                          (wire232[(5'h12):(1'h1)] ?
                              reg255[(3'h5):(3'h5)] : $signed(wire244)) : wire233) ?
                      (~^$unsigned((wire252 ?
                          (8'haa) : reg241))) : $unsigned({reg261[(1'h1):(1'h0)]})));
              reg265 <= $signed({(+wire230), reg253[(3'h4):(2'h2)]});
              reg266 <= (7'h41);
            end
          else
            begin
              reg263 <= ({{$unsigned($unsigned(wire248)), wire233}} ?
                  wire247[(4'he):(4'hc)] : (^~$unsigned((reg241 ?
                      (^reg239) : {(8'had), (7'h42)}))));
              reg264 <= $signed((-($signed($signed((8'hb4))) ?
                  $signed({wire246}) : ((wire250 * reg241) ~^ (~|(8'hb1))))));
            end
          reg267 <= ((^reg265[(3'h4):(3'h4)]) ?
              wire233[(4'hd):(4'hb)] : (+reg266[(1'h1):(1'h1)]));
          reg268 <= (~(^~$signed(({reg260, (7'h41)} & (wire228 ^~ wire247)))));
          if ((+($signed(($signed(wire247) ? (~&reg253) : $signed(reg257))) ?
              wire250 : $signed(($unsigned((8'h9d)) ? (8'hb0) : wire250)))))
            begin
              reg269 <= (|(($unsigned((reg241 ^~ reg267)) ?
                      wire230[(3'h4):(1'h0)] : (-(reg265 ? reg254 : wire251))) ?
                  wire245 : $unsigned(((reg258 ^~ wire238) ?
                      wire231[(4'hc):(4'ha)] : (reg242 ? wire250 : reg257)))));
              reg270 <= ((+reg253[(4'h9):(2'h2)]) ?
                  wire251 : (-$signed({reg267})));
            end
          else
            begin
              reg269 <= $signed((&(8'had)));
              reg270 <= $signed($signed(wire252[(5'h10):(4'h9)]));
            end
        end
      reg271 <= wire251[(4'hb):(2'h3)];
    end
  assign wire272 = $signed(wire234);
  assign wire273 = (^reg267);
endmodule

module module165
#(parameter param222 = ({((8'ha8) ? {{(8'ha3), (7'h44)}} : {((8'hb8) >>> (8'hbd)), (~(8'ha3))}), ((~^{(8'hb7)}) ? (+(+(8'ha3))) : (|(+(8'hab))))} >> (!(&(8'hb6)))), 
parameter param223 = {param222})
(y, clk, wire170, wire169, wire168, wire167, wire166);
  output wire [(32'h242):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire170;
  input wire signed [(4'hb):(1'h0)] wire169;
  input wire signed [(4'h9):(1'h0)] wire168;
  input wire [(3'h4):(1'h0)] wire167;
  input wire signed [(5'h10):(1'h0)] wire166;
  wire signed [(2'h3):(1'h0)] wire174;
  wire [(5'h13):(1'h0)] wire173;
  wire signed [(4'hf):(1'h0)] wire172;
  wire [(2'h2):(1'h0)] wire171;
  reg [(5'h14):(1'h0)] reg221 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg220 = (1'h0);
  reg [(5'h13):(1'h0)] reg219 = (1'h0);
  reg [(5'h14):(1'h0)] reg218 = (1'h0);
  reg [(3'h6):(1'h0)] reg217 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg215 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg213 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg212 = (1'h0);
  reg [(2'h3):(1'h0)] reg211 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg210 = (1'h0);
  reg [(4'hb):(1'h0)] reg209 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg208 = (1'h0);
  reg [(5'h10):(1'h0)] reg207 = (1'h0);
  reg [(5'h12):(1'h0)] reg206 = (1'h0);
  reg [(5'h11):(1'h0)] reg205 = (1'h0);
  reg [(2'h2):(1'h0)] reg204 = (1'h0);
  reg signed [(4'he):(1'h0)] reg203 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg202 = (1'h0);
  reg [(5'h12):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg199 = (1'h0);
  reg [(4'hf):(1'h0)] reg198 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  reg [(5'h14):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg193 = (1'h0);
  reg [(5'h13):(1'h0)] reg192 = (1'h0);
  reg [(4'hc):(1'h0)] reg191 = (1'h0);
  reg [(4'hb):(1'h0)] reg190 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg189 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg187 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg186 = (1'h0);
  reg [(5'h10):(1'h0)] reg185 = (1'h0);
  reg [(3'h7):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg [(3'h4):(1'h0)] reg182 = (1'h0);
  reg [(3'h4):(1'h0)] reg181 = (1'h0);
  reg [(4'h9):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg179 = (1'h0);
  reg [(5'h15):(1'h0)] reg178 = (1'h0);
  reg [(4'h9):(1'h0)] reg177 = (1'h0);
  reg [(3'h6):(1'h0)] reg176 = (1'h0);
  reg [(4'h9):(1'h0)] reg175 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 (1'h0)};
  assign wire171 = $unsigned((wire166 && $unsigned(((|(8'ha7)) | $signed(wire169)))));
  assign wire172 = $unsigned(wire168);
  assign wire173 = (^$unsigned((wire172 ?
                       ((wire167 ?
                           wire170 : wire168) > $signed(wire167)) : ((~|wire171) ^ $signed(wire170)))));
  assign wire174 = $signed(wire172);
  always
    @(posedge clk) begin
      reg175 <= {wire169};
      reg176 <= {wire168[(3'h6):(3'h5)]};
      if ({wire171[(1'h0):(1'h0)]})
        begin
          reg177 <= {$signed((((~wire174) & $unsigned(wire170)) ?
                  wire171 : {reg175[(1'h1):(1'h1)],
                      ((8'had) ? reg176 : wire167)})),
              $unsigned(((|(wire171 ? wire173 : (8'hba))) ^~ wire169))};
        end
      else
        begin
          if ($signed((|wire172[(3'h5):(3'h5)])))
            begin
              reg177 <= (reg176[(3'h5):(1'h1)] ?
                  $signed(wire172[(4'h9):(3'h5)]) : (($unsigned((wire170 ?
                              wire167 : wire172)) ?
                          (wire166 >>> (reg176 ^~ wire169)) : (~&(wire170 != wire172))) ?
                      (wire171 ?
                          wire169 : $unsigned((reg176 ?
                              wire171 : wire172))) : $signed($signed($unsigned((8'hb3))))));
            end
          else
            begin
              reg177 <= wire168[(3'h5):(2'h2)];
              reg178 <= ({((wire172 != (reg175 ?
                          wire171 : wire170)) <= ((~|wire168) || wire173[(5'h10):(4'hc)]))} ?
                  wire170[(4'h8):(3'h4)] : (~($unsigned(wire167) ?
                      $signed($unsigned(wire174)) : $signed(reg176))));
              reg179 <= wire167;
            end
          reg180 <= wire171[(1'h1):(1'h1)];
        end
      reg181 <= (reg175 - ((reg179 ~^ (^~(reg177 <<< reg178))) ?
          $unsigned($unsigned(reg176)) : wire172[(4'ha):(3'h6)]));
      if ((wire166 ?
          (|{$signed((wire172 ? reg178 : wire168)),
              {(wire173 >= wire166), {(8'ha4)}}}) : wire171))
        begin
          reg182 <= $signed($signed((((~&(8'had)) ?
                  (wire167 ? wire173 : reg179) : (|reg180)) ?
              {$signed(reg180), (wire172 & (8'hb9))} : $unsigned((wire170 ?
                  (8'ha0) : reg175)))));
          reg183 <= $signed($unsigned($unsigned(reg181)));
          if (wire168)
            begin
              reg184 <= wire169;
              reg185 <= $signed(($signed(reg176[(3'h5):(2'h2)]) ?
                  ((8'ha9) <= $signed(reg182[(2'h2):(2'h2)])) : wire171));
              reg186 <= $signed(wire172);
            end
          else
            begin
              reg184 <= (8'hb8);
              reg185 <= $unsigned((reg186[(3'h5):(1'h1)] > (((8'hb6) ?
                      reg175 : reg183[(1'h0):(1'h0)]) ?
                  $unsigned(wire167) : (!{reg178, wire169}))));
            end
          reg187 <= (reg184 << $unsigned((~&reg183)));
        end
      else
        begin
          reg182 <= reg178[(4'ha):(2'h2)];
          if ($unsigned(($unsigned((^$unsigned(reg183))) ?
              $signed(wire170[(1'h1):(1'h0)]) : reg177[(3'h5):(1'h0)])))
            begin
              reg183 <= reg176[(2'h2):(1'h1)];
              reg184 <= reg185[(3'h7):(1'h0)];
              reg185 <= ($unsigned({{(reg183 ?
                          reg186 : wire174)}}) << (~|(+reg182)));
              reg186 <= $unsigned(reg180[(3'h5):(3'h4)]);
            end
          else
            begin
              reg183 <= reg186[(3'h6):(3'h6)];
            end
          reg187 <= reg184;
          if ((~|reg177[(2'h2):(2'h2)]))
            begin
              reg188 <= {{{reg186}}};
              reg189 <= (reg188 ?
                  reg183[(4'h8):(2'h3)] : reg187[(3'h6):(3'h4)]);
            end
          else
            begin
              reg188 <= (($unsigned({$unsigned(reg179)}) < $signed($signed($unsigned(wire173)))) && (~$unsigned((((8'hbb) ?
                      reg181 : reg189) ?
                  $signed(reg184) : $signed(reg184)))));
              reg189 <= $signed((^~$unsigned(reg180[(3'h5):(2'h2)])));
            end
        end
    end
  always
    @(posedge clk) begin
      reg190 <= $unsigned($signed((((^(8'hb4)) >> (reg180 < reg182)) ?
          reg177 : ((~^wire171) >= (-wire167)))));
      reg191 <= (~|wire166);
      reg192 <= $unsigned((7'h41));
    end
  always
    @(posedge clk) begin
      reg193 <= reg189;
    end
  always
    @(posedge clk) begin
      reg194 <= wire168;
      reg195 <= $unsigned({{$signed($unsigned(reg180)), $unsigned(wire174)}});
    end
  always
    @(posedge clk) begin
      if ((^$unsigned(reg182)))
        begin
          reg196 <= reg190;
          reg197 <= reg195;
          if ((~^$unsigned($unsigned(reg179[(1'h0):(1'h0)]))))
            begin
              reg198 <= wire173;
              reg199 <= $unsigned(((~(-((8'ha4) ^~ (8'hae)))) ?
                  {wire167[(1'h0):(1'h0)]} : ((~^$unsigned(reg194)) ^~ reg185[(4'hc):(1'h1)])));
            end
          else
            begin
              reg198 <= $unsigned(wire172[(2'h3):(2'h3)]);
            end
          reg200 <= (reg187[(3'h6):(1'h1)] ?
              (reg194 ~^ reg196[(4'h8):(3'h4)]) : ($signed(((wire173 <= wire169) ?
                      {reg175, reg184} : (~^(8'h9d)))) ?
                  (reg177 <= reg195[(3'h4):(2'h3)]) : $unsigned(((reg189 >> reg195) != $signed(reg188)))));
          reg201 <= (+({(reg194[(3'h6):(3'h5)] ^~ $unsigned(reg181)),
                  reg187[(1'h0):(1'h0)]} ?
              $signed({reg192[(5'h10):(2'h3)],
                  reg187[(3'h4):(3'h4)]}) : (~&$signed($signed(reg198)))));
        end
      else
        begin
          reg196 <= (reg190 ?
              (reg191 >>> $signed((reg188 ?
                  {reg198, reg191} : {reg193}))) : $signed((8'hbb)));
          reg197 <= (reg200 ?
              ((~|((wire173 ?
                  reg194 : reg190) <<< $unsigned(wire166))) << $signed({$signed(wire174)})) : $signed((&reg198)));
          reg198 <= $unsigned($signed(reg187));
        end
      if ((+(reg196[(4'hd):(3'h6)] ?
          (~^$unsigned({reg195})) : $unsigned(((~|reg200) ?
              reg188 : $signed(reg177))))))
        begin
          reg202 <= (~|(reg184 ~^ (&(+(|reg178)))));
          if (reg194)
            begin
              reg203 <= $signed($unsigned((reg187[(1'h1):(1'h0)] << reg182)));
              reg204 <= {(~|{$unsigned(reg181)}),
                  $unsigned(((((8'hb9) - reg189) <<< {wire172}) - ($signed(wire168) ?
                      (-reg193) : {reg180, reg177})))};
              reg205 <= (+(reg192 ?
                  wire166[(5'h10):(5'h10)] : (~|$unsigned($signed(reg184)))));
              reg206 <= ({$signed($unsigned((|reg176)))} ^~ reg182);
              reg207 <= {(reg196 ? (^reg192) : reg191[(3'h6):(1'h0)])};
            end
          else
            begin
              reg203 <= (~$unsigned((-(+reg186[(3'h5):(2'h2)]))));
              reg204 <= (^~{$signed((~^(reg199 ? reg186 : reg177)))});
              reg205 <= reg180;
              reg206 <= (reg183 ?
                  {{reg192, $signed((-wire169))},
                      wire174} : $signed(({$unsigned(reg196),
                          reg206[(1'h1):(1'h0)]} ?
                      $signed((reg201 > reg195)) : ((^~wire174) ?
                          $signed(reg197) : $unsigned(reg202)))));
              reg207 <= (~^$unsigned($unsigned((8'ha7))));
            end
          if ($unsigned((-$unsigned(($signed(reg188) - (reg189 >= (7'h44)))))))
            begin
              reg208 <= (((|(|(8'ha4))) ?
                  $unsigned($signed(reg192[(5'h10):(5'h10)])) : $signed($signed((|reg202)))) == ({(reg183 | $signed(reg194))} < ({$unsigned(reg192),
                      reg191} ?
                  reg180[(4'h8):(1'h0)] : $signed((reg176 & reg198)))));
              reg209 <= reg208[(4'hc):(2'h3)];
              reg210 <= ((~|$signed(($signed(reg175) >>> (~|reg179)))) ?
                  $unsigned((!(7'h42))) : (~^(~&(~&$unsigned(reg190)))));
            end
          else
            begin
              reg208 <= {(reg182[(3'h4):(1'h0)] ?
                      $unsigned($unsigned($unsigned((8'ha4)))) : (reg204 != ($signed((8'hab)) ?
                          $unsigned(reg185) : $signed(reg202))))};
              reg209 <= reg187;
              reg210 <= (8'haf);
              reg211 <= reg197;
            end
          reg212 <= (~&($signed($unsigned((~^(8'hb6)))) ?
              ($unsigned(reg194[(3'h5):(3'h4)]) ?
                  ($unsigned(reg177) ~^ (wire173 ?
                      (8'hab) : wire173)) : (~&$unsigned(reg180))) : reg199));
          reg213 <= $unsigned((8'haf));
        end
      else
        begin
          reg202 <= {(reg212[(3'h5):(3'h5)] * reg179), reg184[(3'h6):(3'h6)]};
          reg203 <= reg204[(1'h1):(1'h0)];
          reg204 <= ((8'ha2) ?
              (reg180 ?
                  (wire170 ?
                      $unsigned($signed((8'haa))) : $signed((reg204 >> (8'ha5)))) : (({(8'hae),
                      (8'hbb)} > $unsigned(reg183)) <= wire166[(4'he):(4'h8)])) : reg189);
          reg205 <= wire174;
          reg206 <= (reg191 >>> $signed(($signed(reg211[(2'h3):(2'h3)]) != (~^{reg179,
              wire166}))));
        end
      if ($unsigned(reg188[(2'h3):(2'h2)]))
        begin
          reg214 <= (!($unsigned(((reg208 - reg204) ?
                  $signed(reg197) : (-reg193))) ?
              $unsigned($signed($signed(reg197))) : reg192[(4'h9):(1'h0)]));
          if ((8'ha6))
            begin
              reg215 <= wire173;
              reg216 <= (^~$signed(reg213));
              reg217 <= {(reg181 ? reg185 : reg201[(2'h3):(1'h0)]),
                  $unsigned(wire174[(1'h0):(1'h0)])};
              reg218 <= (reg184[(2'h3):(2'h3)] <<< $unsigned($signed((~|$unsigned((8'haf))))));
              reg219 <= $unsigned(($unsigned($unsigned((reg209 & wire170))) ?
                  (reg178 || ((reg208 || reg184) ?
                      $signed(reg214) : (~reg196))) : wire169[(2'h3):(2'h2)]));
            end
          else
            begin
              reg215 <= (~|{$signed({$signed(reg206)}),
                  (^~$signed((^reg201)))});
              reg216 <= reg206;
            end
        end
      else
        begin
          if ((reg180[(1'h0):(1'h0)] == (reg178[(4'ha):(4'h8)] ?
              $unsigned(((+reg188) <<< (reg210 <= (8'hb3)))) : $unsigned($signed($signed(reg186))))))
            begin
              reg214 <= reg185;
            end
          else
            begin
              reg214 <= (~^$signed(reg217));
              reg215 <= {(((&reg195[(2'h2):(2'h2)]) | ((reg198 ^ (8'ha7)) ?
                      $unsigned(wire173) : wire170[(3'h4):(1'h1)])) <<< reg218)};
            end
          reg216 <= (((~^($unsigned(reg212) ?
                  (reg191 <= reg180) : (reg212 ?
                      wire174 : reg212))) | ($signed((|reg208)) ?
                  $unsigned((&reg211)) : ((~^reg210) >= wire167))) ?
              $unsigned(reg182[(2'h2):(2'h2)]) : $signed($signed({(~^reg212),
                  (8'ha6)})));
          if ((reg201[(4'hc):(4'hb)] < ($signed(($unsigned(reg210) && {(8'hb9)})) ?
              $unsigned(((~wire174) ?
                  (8'hb3) : $unsigned((8'ha5)))) : ((-$signed(reg218)) ?
                  reg175[(3'h4):(1'h1)] : reg217))))
            begin
              reg217 <= (reg194[(2'h3):(2'h3)] ?
                  reg194[(1'h0):(1'h0)] : (reg179[(3'h6):(2'h2)] ?
                      $signed((&reg180)) : ($unsigned($signed(reg189)) ?
                          $unsigned((reg191 >= reg180)) : $unsigned(reg181[(1'h0):(1'h0)]))));
              reg218 <= (!$unsigned($unsigned(wire166)));
              reg219 <= ({reg203[(3'h4):(2'h3)],
                  reg205[(5'h11):(2'h3)]} + $signed((({reg182,
                  reg198} + {reg207}) ~^ ($signed(reg193) + reg209[(4'h9):(3'h6)]))));
              reg220 <= reg193;
              reg221 <= reg175[(2'h2):(1'h0)];
            end
          else
            begin
              reg217 <= $unsigned(reg212[(1'h0):(1'h0)]);
              reg218 <= $signed((&(((-wire170) ?
                  (reg218 * (8'ha6)) : (~reg185)) ^~ reg200)));
              reg219 <= $unsigned($signed((^~((-reg175) ?
                  (reg202 <= reg201) : $signed(reg190)))));
            end
        end
    end
endmodule

module module126
#(parameter param160 = (~&((&({(8'h9c), (8'hb1)} && (8'ha3))) ? {(((7'h44) + (8'ha9)) ? ((8'ha2) ? (8'hb7) : (8'haa)) : ((8'hbb) ? (8'hbc) : (8'hb9))), (8'hb5)} : ({((8'ha6) ? (8'hac) : (8'haf)), (-(8'hb5))} ? (|{(8'h9e), (8'hb5)}) : (((8'ha3) ^~ (8'hac)) ? (^(8'h9e)) : (^~(8'hbd)))))), 
parameter param161 = (~&(((~|param160) & (~&(param160 & param160))) >= (+(^(param160 ? param160 : param160))))))
(y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire131;
  input wire [(3'h5):(1'h0)] wire130;
  input wire [(3'h7):(1'h0)] wire129;
  input wire [(5'h15):(1'h0)] wire128;
  input wire signed [(5'h15):(1'h0)] wire127;
  wire [(4'h9):(1'h0)] wire157;
  wire signed [(4'he):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire155;
  wire [(4'h8):(1'h0)] wire141;
  wire signed [(5'h10):(1'h0)] wire140;
  reg signed [(4'ha):(1'h0)] reg159 = (1'h0);
  reg [(5'h11):(1'h0)] reg158 = (1'h0);
  reg [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg [(5'h15):(1'h0)] reg147 = (1'h0);
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(4'ha):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(4'hd):(1'h0)] reg137 = (1'h0);
  reg [(3'h7):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire155,
                 wire141,
                 wire140,
                 reg159,
                 reg158,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg132 <= wire128;
      reg133 <= wire127[(1'h0):(1'h0)];
      if (($signed(wire128) ?
          reg133 : ($signed((reg132[(1'h1):(1'h0)] > {(8'ha4), wire129})) ?
              (&$unsigned(((8'h9e) ?
                  wire127 : wire131))) : (wire129[(3'h6):(1'h0)] ?
                  (~(wire129 || wire131)) : $unsigned((wire127 ?
                      wire129 : wire131))))))
        begin
          if ($unsigned((^{(+((8'ha8) * (8'hb0))),
              {$unsigned(reg133), (wire131 ? wire131 : (8'hab))}})))
            begin
              reg134 <= wire131[(4'hc):(3'h7)];
              reg135 <= wire129[(2'h2):(1'h0)];
              reg136 <= wire131;
            end
          else
            begin
              reg134 <= wire128;
            end
          reg137 <= reg136[(3'h7):(3'h7)];
          reg138 <= (+($signed(wire127[(2'h2):(1'h1)]) ?
              (wire128[(4'hb):(4'h8)] >> $signed({reg136})) : (~&{(wire129 + reg134)})));
        end
      else
        begin
          reg134 <= $unsigned(wire127[(4'hc):(3'h6)]);
          reg135 <= (wire131[(4'hd):(3'h6)] ?
              ((reg138 <= ({wire129, (8'h9e)} ?
                  (wire128 * wire129) : wire127)) ~^ ($signed(reg135) ?
                  ((wire127 ?
                      reg133 : reg135) << reg137[(1'h1):(1'h0)]) : {(8'ha2),
                      (^reg134)})) : reg135[(4'hb):(4'h9)]);
          if ({$unsigned((((&reg136) ?
                  (&reg137) : wire131[(3'h5):(1'h0)]) ^~ wire130[(1'h0):(1'h0)])),
              $unsigned((({(8'hb9), reg133} <= ((8'haf) ? reg132 : wire129)) ?
                  {wire131, $signed(wire129)} : (&$signed(reg132))))})
            begin
              reg136 <= (|((8'ha3) < $unsigned($unsigned($unsigned(reg134)))));
              reg137 <= {($signed($signed($signed(wire131))) ?
                      (~^({wire130} ^~ ((7'h42) ?
                          reg134 : wire129))) : wire128[(1'h1):(1'h1)])};
            end
          else
            begin
              reg136 <= reg137;
            end
        end
    end
  always
    @(posedge clk) begin
      reg139 <= ($signed($unsigned((reg137[(4'ha):(2'h3)] - $signed((7'h41))))) ?
          wire129 : {$signed((reg132[(5'h15):(4'he)] * (wire129 ?
                  reg132 : wire129))),
              (reg136 ^ (|$signed(wire128)))});
    end
  assign wire140 = $unsigned($signed((~|wire129)));
  assign wire141 = (((($unsigned(wire140) <= (reg134 ? (8'ha8) : wire131)) ?
                       reg136 : $signed($unsigned(wire140))) ^~ ((-$unsigned(wire127)) <<< wire131)) ^ reg137[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (((($signed($signed(reg135)) < $unsigned(reg136)) == $signed($signed((8'ha9)))) ?
          wire130 : (({$unsigned(reg135), (wire128 ? wire128 : wire129)} ?
                  (!reg135[(4'hd):(3'h5)]) : wire131[(3'h6):(3'h4)]) ?
              {(wire129[(1'h1):(1'h0)] ?
                      (reg137 ? reg139 : wire141) : {reg139,
                          reg136})} : {wire131[(3'h7):(3'h5)]})))
        begin
          if ({reg136[(1'h1):(1'h0)],
              $signed((($unsigned((8'had)) != $signed(wire141)) <= $signed($signed(reg139))))})
            begin
              reg142 <= $signed(($signed($signed($signed(reg135))) ?
                  {reg133} : (+(reg135 ?
                      (wire130 ? (8'h9c) : reg133) : $unsigned(wire131)))));
              reg143 <= (((-$signed($unsigned(reg139))) != {{(|wire131),
                          (&reg142)},
                      reg136}) ?
                  (&((~$unsigned(reg134)) ?
                      ((wire129 ? wire140 : reg136) ?
                          (reg137 >>> wire130) : (wire129 ?
                              wire140 : reg137)) : {(wire140 ?
                              reg133 : (8'hb2)),
                          $unsigned(reg142)})) : wire127[(5'h10):(4'he)]);
              reg144 <= $signed($unsigned((+reg138)));
              reg145 <= $signed({(wire140[(1'h1):(1'h1)] ?
                      reg138 : ((reg133 ?
                          (8'ha6) : wire130) ^ $unsigned(wire131)))});
              reg146 <= (wire141 + ((reg135 ?
                      ($unsigned((8'hb6)) ?
                          (reg139 ?
                              reg145 : wire140) : ((8'hbd) ^~ reg133)) : $unsigned($signed((8'hb0)))) ?
                  reg137[(2'h2):(1'h0)] : {(&$unsigned(reg135)),
                      $signed(((8'h9c) || wire130))}));
            end
          else
            begin
              reg142 <= ($unsigned(({reg144,
                      (reg133 == wire128)} >> wire140[(4'he):(4'hb)])) ?
                  reg132 : reg139[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg142 <= $signed($unsigned($signed(reg139[(3'h4):(2'h3)])));
          reg143 <= $signed(reg144);
          reg144 <= $unsigned(reg143[(1'h1):(1'h1)]);
          reg145 <= ($unsigned(({$unsigned(wire140),
                  (reg145 ? reg139 : wire131)} ?
              wire129 : $unsigned((reg145 ?
                  reg133 : wire130)))) && $signed(wire129[(3'h5):(1'h1)]));
        end
      if (((^$unsigned($unsigned((reg138 ?
          (8'haf) : wire141)))) <= reg135[(5'h11):(3'h4)]))
        begin
          if (((~^((+(reg133 ?
                  wire131 : wire140)) & (reg134[(3'h5):(1'h0)] ~^ (~|wire128)))) ?
              {$unsigned(reg138[(2'h2):(1'h1)]),
                  (($unsigned(wire130) ? reg132 : {wire141, reg135}) ?
                      (8'hbb) : ($signed(reg134) ?
                          reg139[(3'h6):(1'h0)] : wire128))} : (~$unsigned((|(&reg136))))))
            begin
              reg147 <= (wire140 ^~ ({$signed($signed(wire141)),
                  ({reg133} ?
                      (reg133 ?
                          wire130 : reg136) : $signed(wire129))} && $unsigned(reg134)));
              reg148 <= $unsigned($unsigned(($unsigned((|(7'h44))) ?
                  ($signed(wire127) ?
                      ((8'ha5) ?
                          reg134 : reg133) : $unsigned(reg138)) : ((wire128 ?
                          (8'ha3) : (8'hbf)) ?
                      $unsigned(wire140) : (^~wire140)))));
              reg149 <= (^~(wire141 ?
                  reg135[(4'hb):(3'h4)] : wire141[(1'h1):(1'h1)]));
              reg150 <= ($signed($unsigned(((reg149 ? (8'hab) : reg132) ?
                  {(8'h9e), wire131} : wire130[(3'h5):(3'h5)]))) > wire141);
            end
          else
            begin
              reg147 <= (reg136[(3'h4):(1'h0)] > reg145);
              reg148 <= reg132;
              reg149 <= reg133;
              reg150 <= (reg146 ? wire141 : reg143[(4'h9):(1'h0)]);
            end
          reg151 <= $signed(reg137[(3'h6):(3'h5)]);
        end
      else
        begin
          if (reg133)
            begin
              reg147 <= {$unsigned((8'hb7))};
              reg148 <= (~|($unsigned((~^$unsigned((8'ha2)))) ?
                  reg139[(1'h0):(1'h0)] : wire140));
              reg149 <= $signed(($signed(wire129[(3'h7):(1'h0)]) ?
                  (reg147 - (8'hb1)) : ((~$unsigned((8'h9f))) ^~ ((reg144 ?
                          reg132 : (7'h42)) ?
                      $signed((8'hbc)) : reg149))));
              reg150 <= (8'ha4);
            end
          else
            begin
              reg147 <= {$signed(reg135[(5'h12):(4'he)]), $unsigned(reg151)};
              reg148 <= reg138[(1'h1):(1'h1)];
              reg149 <= wire128;
            end
          reg151 <= {reg146,
              (($signed(wire131) || ((~|reg136) ?
                      (reg148 ? reg149 : (8'ha3)) : reg133)) ?
                  reg148 : (!$unsigned(wire140[(2'h3):(1'h0)])))};
          reg152 <= $signed((|reg146[(1'h1):(1'h0)]));
          reg153 <= (reg152[(4'hd):(4'hb)] * $signed(reg149));
          reg154 <= $signed(reg137);
        end
    end
  assign wire155 = $unsigned((~&$signed(wire131[(4'he):(4'h8)])));
  assign wire156 = (($signed($signed((reg137 <= reg147))) ?
                       wire127 : (8'hac)) || (^~(|wire130[(3'h4):(1'h1)])));
  assign wire157 = reg144[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg158 <= wire141[(1'h1):(1'h0)];
      reg159 <= $signed(reg142[(1'h1):(1'h1)]);
    end
endmodule

module module105
#(parameter param123 = {{(~{((8'ha7) ? (8'hae) : (8'hba))}), {{((8'ha8) ? (8'hbc) : (8'hb4)), (~&(8'hbc))}, {((8'ha0) ? (7'h42) : (8'h9d))}}}, (^(|({(8'h9d)} ~^ (^~(8'ha7)))))})
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire109;
  input wire signed [(2'h3):(1'h0)] wire108;
  input wire [(5'h12):(1'h0)] wire107;
  input wire signed [(5'h11):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire [(3'h4):(1'h0)] wire112;
  wire signed [(3'h4):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire110;
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire110 = wire109;
  assign wire111 = ((^$unsigned({$signed(wire109), {wire108, (8'hbd)}})) ?
                       (7'h43) : $unsigned($signed(wire107)));
  assign wire112 = (((((|wire111) ? wire109[(4'hd):(3'h6)] : $signed(wire111)) ?
                               $unsigned((~&wire109)) : wire109) ?
                           $unsigned(($unsigned(wire108) ?
                               wire110[(3'h6):(2'h3)] : $signed(wire111))) : wire110[(2'h2):(1'h1)]) ?
                       (~&((wire110 ?
                               wire106[(3'h5):(3'h5)] : (wire107 && wire110)) ?
                           $signed($unsigned(wire109)) : $signed($signed(wire109)))) : $unsigned((~&$signed(wire111[(1'h0):(1'h0)]))));
  assign wire113 = $signed(wire107);
  assign wire114 = wire111[(1'h0):(1'h0)];
  assign wire115 = ($unsigned((wire111[(2'h2):(2'h2)] ?
                       (+wire113[(4'hd):(4'ha)]) : wire113[(1'h0):(1'h0)])) || (8'hb9));
  always
    @(posedge clk) begin
      if ((~|($signed(wire113[(4'h9):(3'h6)]) ?
          (~|({wire108} ? {wire112, wire110} : (8'ha6))) : {$signed((8'h9c))})))
        begin
          reg116 <= wire114;
          if (((+(wire110[(3'h4):(2'h3)] ?
              $signed((~^wire114)) : $signed((wire110 << wire113)))) ^ wire106))
            begin
              reg117 <= {(~^wire112)};
              reg118 <= (wire107[(1'h1):(1'h1)] ?
                  (~&{wire113[(3'h7):(1'h1)]}) : $unsigned($signed($signed({wire108,
                      wire108}))));
              reg119 <= $signed($signed({((~&wire111) + (-reg117)),
                  ($signed(wire112) ? $signed((7'h43)) : $signed(wire113))}));
              reg120 <= (($signed(((wire113 ? (8'hbc) : wire115) ?
                      (~&reg118) : $unsigned(wire109))) ?
                  ($unsigned($signed(wire110)) ?
                      ((reg117 ^ reg116) ?
                          wire107[(1'h1):(1'h0)] : {wire108}) : $unsigned($signed(wire109))) : ($signed(wire109[(4'hc):(1'h1)]) < (+(wire108 ?
                      wire112 : reg117)))) ~^ $unsigned((((wire111 ?
                      wire115 : reg118) & wire113) ?
                  (wire112 ?
                      reg116[(4'h9):(4'h9)] : wire112) : $signed(reg116))));
              reg121 <= (+wire114[(2'h2):(2'h2)]);
            end
          else
            begin
              reg117 <= (reg121[(4'hb):(2'h3)] ?
                  wire115[(2'h2):(1'h0)] : $signed($unsigned(wire110[(3'h5):(1'h0)])));
              reg118 <= wire111[(2'h2):(1'h1)];
              reg119 <= ((~|$signed({wire115[(3'h7):(2'h3)]})) ?
                  (reg116 >= ($signed(reg120[(4'hd):(3'h6)]) ?
                      ((reg117 ? (8'hb7) : wire109) ?
                          wire107[(2'h3):(2'h3)] : $signed(wire112)) : (reg116[(4'hb):(4'ha)] ?
                          reg121[(4'hd):(3'h7)] : $unsigned(wire115)))) : {wire109});
            end
        end
      else
        begin
          reg116 <= $unsigned(wire112[(2'h2):(1'h0)]);
          reg117 <= (^~(((^(7'h42)) ~^ wire109) ?
              {{((7'h44) ? reg120 : wire112)}} : wire110));
          reg118 <= ((!$unsigned((wire109[(1'h1):(1'h1)] > $unsigned(reg118)))) | (((+$unsigned((8'haf))) ?
              $unsigned((wire110 & wire106)) : (!wire112)) >= (8'hb7)));
        end
    end
  always
    @(posedge clk) begin
      reg122 <= wire109;
    end
endmodule
