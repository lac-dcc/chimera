module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire87;
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire29,
                 wire58,
                 wire60,
                 wire61,
                 wire62,
                 wire87,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire0[(5'h14):(4'hc)])
        begin
          if (wire1)
            begin
              reg4 <= $unsigned(((~|wire2) <= ($signed((wire0 << wire1)) >> wire0)));
              reg5 <= (~|(wire1[(3'h7):(1'h1)] ?
                  ($unsigned(wire2) ?
                      ($signed(wire2) ?
                          $signed(wire2) : $unsigned((7'h43))) : (reg4 >= (-wire2))) : (wire2 == $unsigned((wire0 ?
                      wire1 : reg4)))));
            end
          else
            begin
              reg4 <= ($unsigned((8'haa)) == ($signed(reg5[(3'h6):(2'h2)]) ?
                  (wire1 ?
                      wire3[(4'ha):(4'h9)] : $signed($unsigned(reg5))) : (((~^wire1) ?
                      $unsigned(wire3) : ((8'hbb) ?
                          wire1 : wire1)) - $signed($unsigned(wire2)))));
              reg5 <= (|(reg5 ?
                  (!(~^(wire3 <= wire1))) : $signed(((wire1 ?
                      (8'hb4) : wire2) >>> wire1[(1'h1):(1'h1)]))));
              reg6 <= (wire1[(1'h0):(1'h0)] ?
                  $signed({reg4[(3'h6):(3'h6)]}) : $unsigned((~^(~$signed(reg5)))));
              reg7 <= $signed($signed($signed(wire2)));
            end
          reg8 <= {wire2[(5'h13):(4'h8)]};
          if (((wire2 ?
                  reg4[(3'h7):(3'h5)] : $signed(({wire2} << $unsigned(reg5)))) ?
              (8'h9f) : reg4[(3'h6):(3'h6)]))
            begin
              reg9 <= (reg6[(2'h2):(2'h2)] ~^ (wire1 >> ($signed((-reg7)) <<< (&(reg8 == reg4)))));
              reg10 <= ((^~reg5) != $signed({(reg5[(4'h9):(2'h2)] ^~ (wire3 ?
                      reg7 : wire3))}));
            end
          else
            begin
              reg9 <= reg4;
            end
          reg11 <= wire2;
        end
      else
        begin
          reg4 <= reg11;
          reg5 <= ($unsigned((((reg6 ^~ reg5) != $unsigned(reg8)) < (7'h40))) ?
              $signed((((reg7 & reg9) ?
                  ((8'h9e) ~^ reg5) : (reg6 ?
                      (8'ha9) : reg5)) >= ($unsigned(reg10) ^~ {reg5}))) : ((~&reg8[(5'h12):(3'h4)]) ?
                  {$unsigned((8'ha7)),
                      ((reg5 < reg8) >> $signed((8'h9c)))} : reg8));
          reg6 <= reg7;
          reg7 <= (-(((wire0[(4'ha):(1'h1)] * reg4[(1'h1):(1'h0)]) ?
              (-wire0[(1'h0):(1'h0)]) : wire2[(3'h6):(1'h0)]) != $unsigned($signed(reg11))));
          reg8 <= ((($signed(reg8) == $unsigned((reg4 ? wire2 : (8'hbf)))) ?
                  $unsigned(reg5) : (~$unsigned($unsigned(reg6)))) ?
              (-$signed(reg6)) : (!$signed((|$unsigned(reg8)))));
        end
      reg12 <= wire0[(3'h4):(1'h1)];
      if ((^reg9))
        begin
          if (reg12)
            begin
              reg13 <= ($unsigned(($signed((reg11 ? reg4 : reg4)) ?
                  ((reg12 && wire2) ^~ (reg9 - (8'ha5))) : $signed(reg12[(4'h9):(2'h2)]))) >= reg12[(1'h0):(1'h0)]);
              reg14 <= ((~|reg9) ?
                  $unsigned($unsigned({(reg8 ?
                          (8'hbf) : reg4)})) : $signed((reg9 << {(wire2 <<< reg9),
                      (reg9 ? reg7 : reg4)})));
              reg15 <= reg14[(2'h3):(1'h0)];
              reg16 <= reg9[(1'h0):(1'h0)];
            end
          else
            begin
              reg13 <= {{$signed(wire3[(2'h3):(1'h1)])}, reg11};
            end
          reg17 <= $signed(($unsigned($signed(reg7[(4'hb):(2'h3)])) ^ wire0));
          reg18 <= $signed(reg15[(3'h7):(3'h6)]);
          reg19 <= (((reg7 ?
                      ($unsigned(reg10) >= $unsigned(reg15)) : ($signed(wire1) ?
                          (|reg9) : $signed(wire3))) ?
                  reg8 : (^((^~reg16) ? (wire2 << reg9) : (~^reg8)))) ?
              ($unsigned($signed($unsigned(reg13))) != $unsigned($unsigned($unsigned((8'ha3))))) : {(reg9 ^~ $unsigned(reg5))});
        end
      else
        begin
          if ($signed(($unsigned(reg5[(2'h2):(1'h0)]) - ($unsigned((^reg17)) ?
              (|$unsigned((8'had))) : reg8[(4'hc):(1'h0)]))))
            begin
              reg13 <= (+($signed(reg4) ?
                  (reg11[(4'ha):(3'h7)] <<< reg19[(3'h5):(1'h1)]) : ({reg5} ?
                      reg14 : (~&reg7[(2'h3):(1'h1)]))));
            end
          else
            begin
              reg13 <= $signed((+({wire0,
                  (~^reg9)} <<< ($signed(reg6) << (reg19 > wire0)))));
              reg14 <= {reg10};
              reg15 <= $unsigned($signed($signed(((wire0 ~^ reg11) ?
                  (reg14 ? (8'ha3) : reg11) : (reg11 ? reg6 : reg8)))));
              reg16 <= reg8[(2'h3):(2'h2)];
            end
          if ((((reg16 ? {(reg4 <= reg9)} : reg18[(4'ha):(2'h3)]) ?
                  (~^((reg17 ? reg8 : reg12) ?
                      $signed(reg15) : reg15)) : ({$signed(reg9),
                          ((8'hbe) ~^ wire0)} ?
                      $unsigned($unsigned(reg17)) : (reg15[(4'h8):(2'h3)] ?
                          wire3 : (+reg6)))) ?
              {$signed((|reg11[(1'h0):(1'h0)]))} : (($signed(reg11[(3'h6):(1'h0)]) ^ (-(wire1 ?
                      (8'hb1) : reg13))) ?
                  reg6[(2'h2):(2'h2)] : (reg9[(2'h3):(2'h2)] & ({reg4} << $signed(reg7))))))
            begin
              reg17 <= $unsigned((|$signed(reg9)));
              reg18 <= $unsigned(((+((&reg8) << (+wire3))) >= $unsigned(reg10)));
              reg19 <= reg19;
            end
          else
            begin
              reg17 <= {reg6[(1'h1):(1'h0)]};
              reg18 <= reg13;
              reg19 <= ($signed((((wire0 > (8'hbb)) >> ((8'ha8) ?
                          reg6 : reg4)) ?
                      reg12 : (~^wire0))) ?
                  reg12[(3'h7):(3'h6)] : (8'hbc));
              reg20 <= ((reg7[(1'h0):(1'h0)] ^~ ($unsigned($unsigned((8'ha1))) ?
                      ($signed(wire3) + reg9[(3'h4):(2'h3)]) : reg14[(2'h2):(2'h2)])) ?
                  $signed((($unsigned((7'h40)) ^ $unsigned(reg8)) ?
                      $unsigned((reg12 | wire0)) : $signed($signed(wire0)))) : reg10[(4'hc):(4'hc)]);
              reg21 <= (((-(^$unsigned(wire2))) ?
                      $unsigned(reg15[(3'h5):(2'h2)]) : ({(reg6 < (8'ha9)),
                              (|reg15)} ?
                          (-(8'ha0)) : reg16)) ?
                  reg8[(5'h10):(4'h9)] : (8'hac));
            end
          reg22 <= (~|{wire2[(4'h9):(3'h7)]});
          reg23 <= $signed((reg22 ? reg16 : reg7[(1'h1):(1'h0)]));
          if ($signed($unsigned(($unsigned($signed(reg15)) ?
              (!{(8'h9c), (8'haf)}) : (8'h9c)))))
            begin
              reg24 <= ($signed(reg16[(1'h1):(1'h0)]) ?
                  reg10[(4'h9):(3'h5)] : {({reg7} ?
                          (&{reg20, reg5}) : $signed($unsigned(wire0)))});
              reg25 <= $unsigned(reg7[(1'h1):(1'h0)]);
              reg26 <= reg11[(2'h2):(2'h2)];
              reg27 <= reg21[(4'hb):(3'h4)];
            end
          else
            begin
              reg24 <= ($unsigned($signed($unsigned({wire1, (8'ha4)}))) ?
                  $unsigned((&$signed($unsigned(reg20)))) : ($unsigned($unsigned(reg16[(1'h0):(1'h0)])) ?
                      ($unsigned((8'h9f)) ?
                          reg23 : ((reg9 >= (8'ha6)) ?
                              (8'ha1) : {reg23})) : ((~^(wire2 >= wire1)) ?
                          ($unsigned(reg4) ~^ (+reg6)) : $signed((^~reg16)))));
              reg25 <= {{(|{$unsigned(reg18)}), reg19[(4'h9):(2'h2)]},
                  (reg6 ?
                      $signed(((reg23 ?
                          reg26 : reg23) < reg24)) : ((~^(~|(8'hb8))) ?
                          reg15[(3'h7):(3'h7)] : ((8'h9c) ?
                              (reg16 ? reg20 : (8'ha6)) : (^reg13))))};
              reg26 <= $signed((8'ha6));
            end
        end
      reg28 <= $unsigned($signed($signed({(reg15 ? reg12 : reg16),
          $unsigned((8'hae))})));
    end
  assign wire29 = (reg21[(4'hb):(4'h8)] != reg9);
  module30 #() modinst59 (wire58, clk, reg8, reg15, reg17, reg9, reg28);
  assign wire60 = reg24[(1'h0):(1'h0)];
  assign wire61 = $unsigned($unsigned(($signed((~&reg6)) && wire0)));
  assign wire62 = $signed($unsigned($signed($unsigned(reg11))));
  module63 #() modinst88 (.wire67(wire29), .wire66(reg18), .clk(clk), .wire64(reg27), .wire65(reg20), .y(wire87));
  assign wire89 = $signed(reg28);
  assign wire90 = ((^$unsigned($signed((8'hae)))) >> $unsigned(reg4));
endmodule

module module63  (y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire67;
  input wire [(4'hb):(1'h0)] wire66;
  input wire signed [(5'h14):(1'h0)] wire65;
  input wire [(5'h14):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  assign y = {wire86,
                 wire74,
                 wire70,
                 wire69,
                 wire68,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire68 = $unsigned(wire64);
  assign wire69 = $signed(wire64);
  assign wire70 = (|wire64[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if (({$signed(wire67)} ^~ ((8'hab) || wire65[(5'h13):(2'h3)])))
        begin
          reg71 <= wire64[(5'h10):(5'h10)];
        end
      else
        begin
          if (((wire69 && (wire66 ?
              ((wire67 ? wire70 : wire65) ?
                  $unsigned(wire64) : {wire69}) : wire69[(4'ha):(3'h6)])) >>> wire66))
            begin
              reg71 <= wire67;
              reg72 <= (-(-($signed($unsigned(reg71)) - (wire68[(4'h9):(4'h9)] <= $unsigned(wire70)))));
              reg73 <= (~$unsigned(wire64));
            end
          else
            begin
              reg71 <= reg71;
              reg72 <= (^~(!$unsigned(wire67[(4'h9):(3'h6)])));
              reg73 <= ($signed($signed({$signed(wire64),
                  (reg72 << wire67)})) + (|$unsigned(((|wire69) ?
                  reg72 : (wire67 >>> wire66)))));
            end
        end
    end
  assign wire74 = wire70[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      reg75 <= $unsigned($unsigned($signed(reg72[(1'h0):(1'h0)])));
      reg76 <= {(^($signed((wire67 ~^ (8'hbf))) ?
              $unsigned((wire74 <= reg73)) : $signed((reg71 ~^ wire65))))};
      if ($unsigned(((~&wire65) ?
          reg73 : (wire65[(3'h5):(3'h4)] | $signed((&reg72))))))
        begin
          reg77 <= $unsigned(reg73[(4'ha):(3'h7)]);
          reg78 <= $unsigned($signed(wire67[(3'h7):(2'h2)]));
          if (wire65[(4'hf):(2'h2)])
            begin
              reg79 <= wire64[(1'h0):(1'h0)];
              reg80 <= ((((^$signed(wire66)) - $signed({reg79,
                      wire64})) & $unsigned(wire69[(4'hc):(4'h8)])) ?
                  {wire65[(4'hd):(3'h5)],
                      (wire74[(2'h2):(1'h1)] == reg78[(1'h0):(1'h0)])} : wire65[(3'h5):(1'h0)]);
            end
          else
            begin
              reg79 <= (8'hbb);
              reg80 <= (reg80[(3'h7):(2'h2)] ?
                  wire74[(1'h1):(1'h1)] : reg77[(4'hb):(3'h5)]);
            end
          if ((~($signed(((wire70 ?
              (8'hb6) : reg79) <<< $signed(wire65))) <= $unsigned((~&wire66[(4'h9):(2'h2)])))))
            begin
              reg81 <= $unsigned(reg71[(3'h4):(1'h1)]);
              reg82 <= $unsigned($signed($signed(reg77)));
              reg83 <= wire64;
              reg84 <= ($unsigned($signed((wire70 - (!wire69)))) <<< {wire64[(5'h14):(2'h2)],
                  (~|$signed(((8'haa) ? wire64 : reg83)))});
            end
          else
            begin
              reg81 <= reg80;
            end
        end
      else
        begin
          reg77 <= ((-$unsigned((~|((8'hbb) ? reg71 : wire65)))) ?
              reg83 : ($unsigned(wire67) << (reg79 ?
                  $signed((~&reg77)) : $unsigned($signed(wire68)))));
          if ($signed(reg71[(3'h7):(3'h5)]))
            begin
              reg78 <= $unsigned($unsigned((~^((wire65 ?
                  reg80 : reg82) != $signed(reg71)))));
            end
          else
            begin
              reg78 <= $signed($signed(reg79[(3'h7):(3'h7)]));
              reg79 <= reg81[(3'h5):(3'h4)];
              reg80 <= reg77[(3'h4):(1'h0)];
              reg81 <= (wire66 & ({(~$signed(wire67))} <= ((^$unsigned(reg79)) ?
                  ((wire65 ?
                      wire69 : wire68) != reg78[(1'h0):(1'h0)]) : (!wire67))));
            end
        end
      reg85 <= reg75;
    end
  assign wire86 = wire65;
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  input wire signed [(4'hc):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  assign y = {wire57,
                 wire55,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 (1'h0)};
  assign wire36 = wire33;
  assign wire37 = (8'ha3);
  assign wire38 = ($signed(wire36) ?
                      {wire36[(3'h4):(1'h1)],
                          {wire37[(2'h3):(1'h0)]}} : {wire34[(4'hd):(4'hd)],
                          wire35[(1'h1):(1'h1)]});
  assign wire39 = $signed((~|wire31[(3'h7):(1'h1)]));
  assign wire40 = (wire34 ?
                      $unsigned((|$signed((wire37 != (8'h9f))))) : (wire37[(3'h7):(1'h1)] <= (+((8'hbd) ^~ (~^wire34)))));
  assign wire41 = ($unsigned((((~&wire33) ? $signed(wire33) : $signed(wire35)) ?
                          wire31[(1'h0):(1'h0)] : ((|wire39) ?
                              (wire32 ?
                                  wire37 : wire36) : $unsigned(wire33)))) ?
                      (wire36[(3'h4):(1'h0)] ?
                          ((~^(wire31 ? wire31 : wire39)) & ((wire40 ?
                                  wire38 : wire32) ?
                              ((8'ha5) ?
                                  wire40 : wire31) : $unsigned(wire35))) : (wire36[(1'h0):(1'h0)] <<< ((^wire40) ?
                              (wire40 ^~ wire39) : $signed(wire33)))) : {(~|wire37[(3'h7):(3'h7)])});
  module42 #() modinst56 (.wire44(wire37), .y(wire55), .clk(clk), .wire43(wire35), .wire45(wire32), .wire46(wire38));
  assign wire57 = $signed(wire39);
endmodule

module module42
#(parameter param54 = ((|(&(8'hb8))) != (((^((7'h42) + (8'hab))) * (((8'hb7) != (8'hb9)) == ((8'hb1) ? (8'had) : (7'h40)))) && ({((8'ha2) ? (8'ha0) : (8'hbb))} ? {(^(8'ha5))} : ((-(8'h9d)) ? ((8'ha0) & (7'h43)) : ((7'h41) ? (8'h9d) : (8'hac)))))))
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire46;
  input wire [(2'h3):(1'h0)] wire45;
  input wire [(3'h6):(1'h0)] wire44;
  input wire [(2'h2):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(4'ha):(1'h0)] wire47;
  assign y = {wire53, wire52, wire51, wire50, wire49, wire48, wire47, (1'h0)};
  assign wire47 = $unsigned(wire44);
  assign wire48 = (^wire43);
  assign wire49 = (wire47 * ($unsigned(wire46) ?
                      (8'h9d) : ($unsigned($unsigned((7'h41))) ^ (8'hbf))));
  assign wire50 = wire47;
  assign wire51 = wire43[(1'h0):(1'h0)];
  assign wire52 = $unsigned(wire45);
  assign wire53 = wire49;
endmodule
