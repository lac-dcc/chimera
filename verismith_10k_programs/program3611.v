module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire117;
  wire signed [(2'h3):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'h8):(1'h0)] reg115 = (1'h0);
  reg [(4'hf):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg109 = (1'h0);
  reg [(4'hd):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire15,
                 wire14,
                 wire6,
                 wire5,
                 wire4,
                 reg116,
                 reg115,
                 reg114,
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
                 reg101,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = (^$signed((!wire3)));
  assign wire5 = (-wire4[(4'hc):(4'ha)]);
  assign wire6 = $signed({(((wire5 ? wire2 : (8'hb1)) ^~ $signed(wire2)) ?
                         (8'hae) : (-$unsigned(wire2))),
                     ({(^~wire3)} <<< wire0[(3'h5):(1'h1)])});
  always
    @(posedge clk) begin
      reg7 <= $signed($unsigned((8'ha6)));
      if ((&(+$signed(((^~wire0) ? (wire1 - wire3) : $signed(reg7))))))
        begin
          reg8 <= ((!(({(8'hb9), wire4} ?
                  {(8'ha9), wire3} : (-wire0)) & wire0)) ?
              ($unsigned($unsigned(wire3)) ?
                  $unsigned(wire4[(3'h6):(1'h1)]) : ($unsigned({wire2, wire3}) ?
                      (+reg7[(1'h1):(1'h0)]) : ($unsigned(wire4) << wire1[(3'h5):(1'h0)]))) : wire5);
          reg9 <= wire1;
          reg10 <= wire5[(1'h0):(1'h0)];
        end
      else
        begin
          reg8 <= ((((+$unsigned(wire2)) | $signed(wire2)) >>> wire0[(4'he):(3'h4)]) | wire1);
          reg9 <= ($signed(wire1) ?
              (wire3[(5'h11):(3'h6)] == (~{wire6})) : (~^(wire0 ?
                  ($unsigned(reg10) & $signed(wire6)) : (reg10 & reg8[(2'h2):(2'h2)]))));
          reg10 <= reg9[(4'h8):(2'h3)];
          reg11 <= (((wire3 ? wire2[(4'h8):(2'h3)] : $signed(wire6)) ?
              wire0 : (wire2[(5'h10):(4'h9)] ?
                  $unsigned(((8'hbd) == reg8)) : reg7)) || ($unsigned((8'hba)) ?
              (8'ha9) : ((~{reg7, wire4}) >>> (~&(wire0 ? reg10 : reg8)))));
          reg12 <= ($unsigned({$signed((wire5 ? (7'h40) : wire5)), wire2}) ?
              reg8[(3'h4):(1'h1)] : ((((~|reg8) || (wire5 ? (8'hb7) : reg11)) ?
                  (wire6 ?
                      $unsigned(wire0) : (wire2 ?
                          reg10 : reg7)) : wire2) < (8'ha2)));
        end
      reg13 <= $unsigned(({{$signed(wire4)}} >= (($unsigned(wire3) < ((7'h41) ?
              wire0 : wire6)) ?
          wire2[(3'h6):(3'h5)] : (wire2[(2'h3):(2'h3)] ?
              (wire3 <<< wire5) : reg10))));
    end
  assign wire14 = wire1[(1'h0):(1'h0)];
  assign wire15 = wire5;
  module16 #() modinst96 (.wire18(reg7), .wire21(wire5), .wire19(reg10), .wire17(reg11), .y(wire95), .clk(clk), .wire20(wire2));
  assign wire97 = (!(reg12 ?
                      (($unsigned(wire4) ?
                          wire6 : $signed(wire95)) << reg11) : $unsigned((~&{wire6,
                          reg9}))));
  assign wire98 = reg8[(3'h4):(2'h2)];
  assign wire99 = wire1[(1'h0):(1'h0)];
  assign wire100 = wire1;
  always
    @(posedge clk) begin
      if (reg8[(2'h2):(1'h0)])
        begin
          reg101 <= reg12;
          if (((((wire2[(4'he):(2'h2)] < $signed(wire14)) < ((8'hba) ?
                      reg7 : $signed(wire0))) ?
                  $signed(((wire98 & reg12) ?
                      wire2[(4'h8):(2'h2)] : (reg7 ?
                          reg9 : wire14))) : $unsigned((!$signed(wire3)))) ?
              $signed(wire15) : $signed($unsigned(wire3[(3'h6):(3'h5)]))))
            begin
              reg102 <= $unsigned(wire3);
            end
          else
            begin
              reg102 <= ($unsigned((~|wire95)) & ($unsigned(wire98[(4'hb):(1'h0)]) ^ ((wire15[(3'h4):(2'h2)] ^ (reg9 >> wire98)) ?
                  ($unsigned(wire1) ?
                      $signed((8'ha2)) : $unsigned(wire0)) : {(reg102 ?
                          wire1 : (8'hab)),
                      wire2})));
            end
          if (($signed(wire99[(2'h3):(2'h2)]) ?
              $unsigned(wire98) : ((reg102[(4'h8):(3'h4)] << wire0) ?
                  (wire95[(4'hd):(2'h2)] ^ {(wire6 ^ wire99)}) : (reg13[(4'hc):(3'h4)] < $unsigned(((8'ha5) ?
                      wire99 : reg13))))))
            begin
              reg103 <= {reg9};
              reg104 <= ($unsigned($unsigned({(~^reg101),
                  $unsigned(reg103)})) - $signed((($signed(wire2) <<< (wire6 + wire97)) ?
                  wire6[(4'h8):(1'h1)] : $unsigned((8'hb1)))));
              reg105 <= reg102;
            end
          else
            begin
              reg103 <= ($unsigned((~|{$signed(wire1), wire98})) ?
                  (!$unsigned($unsigned((wire4 ?
                      reg104 : wire14)))) : (wire5 << wire98));
            end
          reg106 <= wire4;
          if ($signed(reg12[(1'h1):(1'h1)]))
            begin
              reg107 <= ((reg106 ?
                      $signed(wire3[(3'h6):(3'h6)]) : wire98[(4'he):(3'h4)]) ?
                  $unsigned($unsigned($unsigned({wire100,
                      reg11}))) : wire0[(1'h1):(1'h0)]);
              reg108 <= $unsigned(wire2[(3'h4):(2'h2)]);
              reg109 <= reg108;
              reg110 <= ((((+reg108) ?
                      $unsigned((reg108 > reg107)) : reg9[(3'h7):(3'h7)]) ?
                  {($signed(reg11) ^ {reg8, reg107}),
                      reg106[(3'h4):(3'h4)]} : wire100) && (&$signed((~&wire1))));
              reg111 <= (~^{$signed((~^(wire15 ? wire6 : wire100))), reg109});
            end
          else
            begin
              reg107 <= (wire4[(4'hc):(3'h7)] ?
                  ((&$signed((+wire100))) >= ($signed((reg9 > reg13)) ?
                      (!(-reg105)) : ($signed(reg106) ?
                          $unsigned(wire4) : (reg102 && reg12)))) : ($signed(reg110) + reg7));
            end
        end
      else
        begin
          reg101 <= $unsigned(reg12[(3'h5):(1'h0)]);
          reg102 <= reg102[(4'h8):(3'h6)];
        end
      if (({$unsigned(reg102[(3'h7):(3'h4)]), $signed($signed(wire3))} ?
          reg108[(1'h1):(1'h1)] : $signed((wire5[(2'h3):(2'h3)] < {wire95,
              reg11}))))
        begin
          if ($unsigned(($signed($unsigned((|(8'hb8)))) != wire1[(1'h0):(1'h0)])))
            begin
              reg112 <= $unsigned((~$signed(($unsigned(wire6) + ((8'ha5) ?
                  wire6 : reg13)))));
              reg113 <= reg102[(4'he):(1'h0)];
              reg114 <= $signed((reg106[(2'h2):(2'h2)] ?
                  $unsigned($signed($signed((8'ha0)))) : $unsigned((!(reg107 != (8'hbc))))));
            end
          else
            begin
              reg112 <= reg109[(3'h4):(2'h2)];
              reg113 <= $unsigned((~&$signed((reg108 ?
                  $unsigned(wire98) : {wire98, reg101}))));
              reg114 <= $unsigned((&$signed({wire14, {wire15}})));
              reg115 <= (+($unsigned((reg113 ?
                  $unsigned(wire95) : wire100)) <= $unsigned(((^~reg103) & reg109))));
            end
        end
      else
        begin
          reg112 <= {$signed((&reg11[(2'h2):(1'h1)]))};
        end
      reg116 <= $signed((reg108[(4'ha):(2'h3)] ? wire3 : reg111));
    end
  assign wire117 = wire0[(4'ha):(3'h5)];
  assign wire118 = reg106[(4'h8):(3'h7)];
  assign wire119 = reg10[(5'h15):(3'h6)];
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire17;
  input wire signed [(3'h5):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire93;
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  assign y = {wire22,
                 wire30,
                 wire93,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 (1'h0)};
  assign wire22 = wire20;
  always
    @(posedge clk) begin
      if ($unsigned(wire19[(1'h1):(1'h0)]))
        begin
          reg23 <= (wire19 == wire22[(4'h8):(2'h3)]);
          reg24 <= ($unsigned((-$signed((!wire18)))) ?
              reg23 : (wire21[(4'hc):(4'h9)] ?
                  $signed((8'ha8)) : wire22[(4'h9):(3'h4)]));
          reg25 <= ($unsigned($signed($signed(reg24[(4'hb):(2'h3)]))) <<< (|wire19));
          reg26 <= ((wire18[(2'h3):(1'h0)] ?
                  reg23 : (~^reg23[(5'h12):(3'h7)])) ?
              wire21[(1'h0):(1'h0)] : (~|$unsigned($signed($unsigned(wire18)))));
          reg27 <= $signed($signed($signed(wire17[(3'h4):(1'h1)])));
        end
      else
        begin
          reg23 <= $unsigned(({(^wire22[(4'ha):(3'h4)])} != reg24));
          reg24 <= ((~(~|reg25[(1'h0):(1'h0)])) ~^ wire21);
          reg25 <= (~{((8'hb7) ~^ ((^~reg24) ?
                  (wire18 ? reg26 : wire20) : ((8'hbf) ? (8'h9e) : reg23)))});
        end
      reg28 <= {(|($unsigned({reg26, wire17}) ?
              reg26[(3'h6):(1'h0)] : (~&$unsigned(reg26)))),
          $unsigned($unsigned(reg24[(3'h5):(1'h0)]))};
      reg29 <= (($signed((^~{reg26, wire22})) ?
              $unsigned($signed($unsigned(reg25))) : $signed((+wire22))) ?
          (~($unsigned((reg23 < (7'h40))) ?
              (+(reg25 != wire19)) : (^~$signed((7'h40))))) : (({$unsigned((8'hb5))} < $unsigned((&wire20))) && wire18[(1'h1):(1'h1)]));
    end
  assign wire30 = $signed(((7'h44) != $unsigned($unsigned((wire19 ^~ wire20)))));
  module31 #() modinst94 (wire93, clk, wire20, wire17, reg27, wire30);
endmodule

module module31
#(parameter param91 = {(~|((((8'hb9) & (8'hb4)) >>> ((8'h9e) >>> (7'h40))) ? (^((7'h42) ? (8'ha6) : (8'had))) : (~((8'h9e) | (8'h9d))))), (({((8'ha1) != (7'h41)), (+(8'hbb))} << ({(8'ha9)} ? (8'hb3) : ((7'h41) == (7'h44)))) >= (+(&{(7'h42), (8'ha9)})))}, 
parameter param92 = {((param91 ? ({param91} - param91) : (param91 - (~|param91))) <<< {(7'h42), (^(~^param91))}), param91})
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h27b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire35;
  input wire signed [(3'h5):(1'h0)] wire34;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire [(5'h12):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire [(3'h5):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  reg [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  assign y = {wire90,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire63,
                 wire37,
                 wire36,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire36 = wire35;
  assign wire37 = $unsigned({$signed(wire34),
                      ($unsigned($signed(wire35)) <= wire33[(2'h2):(2'h2)])});
  always
    @(posedge clk) begin
      reg38 <= {wire34[(2'h2):(2'h2)]};
      reg39 <= (~(~&(($unsigned(reg38) ?
              (wire36 ? wire35 : wire32) : (wire37 ? wire36 : (8'ha2))) ?
          wire34 : $unsigned(wire35[(2'h3):(1'h1)]))));
      if (($unsigned($unsigned((~wire34))) ~^ {($unsigned(reg38) << ((reg39 ?
              wire32 : wire36) == (wire33 - (8'hb1))))}))
        begin
          reg40 <= wire34[(3'h5):(3'h4)];
          reg41 <= $unsigned($signed(((|$unsigned(reg39)) ^ (+((8'had) ?
              (8'ha4) : wire34)))));
          reg42 <= ((~|(((~^wire37) ?
              wire34 : (wire32 ?
                  reg38 : reg41)) <= reg38)) & (-$unsigned($unsigned((reg39 ?
              wire32 : wire35)))));
          reg43 <= (&wire32);
          reg44 <= wire32[(4'hd):(3'h7)];
        end
      else
        begin
          reg40 <= wire32[(4'hb):(3'h4)];
        end
    end
  always
    @(posedge clk) begin
      reg45 <= (|reg42);
      reg46 <= $signed(wire35[(3'h6):(3'h5)]);
      if (reg40[(4'ha):(4'h8)])
        begin
          reg47 <= reg38[(2'h2):(1'h0)];
          reg48 <= reg38[(2'h3):(1'h1)];
        end
      else
        begin
          reg47 <= reg38[(3'h6):(1'h1)];
          reg48 <= reg43;
          reg49 <= (~^(reg40 ? reg41[(4'hd):(4'h8)] : reg44));
        end
    end
  always
    @(posedge clk) begin
      if (reg42[(3'h7):(2'h2)])
        begin
          if (wire36)
            begin
              reg50 <= ((reg38 ? (8'hbe) : reg48[(3'h6):(3'h4)]) ?
                  reg45[(3'h4):(3'h4)] : (~&reg47[(1'h1):(1'h0)]));
              reg51 <= $unsigned((8'ha3));
              reg52 <= wire33;
              reg53 <= reg50[(1'h1):(1'h1)];
              reg54 <= {reg43[(1'h1):(1'h0)],
                  $signed($signed($signed($signed(reg49))))};
            end
          else
            begin
              reg50 <= $signed(reg40[(4'hb):(1'h1)]);
              reg51 <= $signed(wire32);
            end
          if (reg54[(2'h2):(1'h1)])
            begin
              reg55 <= ({(~&((-wire36) ^~ wire35)),
                  ((8'hb2) - ($signed(reg48) >>> (reg39 >> reg53)))} && (~(-reg40[(3'h6):(3'h4)])));
            end
          else
            begin
              reg55 <= $unsigned(reg46);
              reg56 <= ($unsigned($signed(reg41[(4'hd):(4'h9)])) << $unsigned(wire34[(1'h0):(1'h0)]));
              reg57 <= reg48[(1'h1):(1'h1)];
            end
          reg58 <= (reg39 ?
              (~wire37[(2'h2):(1'h1)]) : {$unsigned($signed(reg46)),
                  $signed($unsigned($unsigned(reg53)))});
          reg59 <= (^reg58[(2'h2):(1'h1)]);
          reg60 <= ($unsigned({((reg48 ? wire35 : reg48) ?
                      $signed(reg41) : {reg53, reg38})}) ?
              (~|(8'hb2)) : reg54);
        end
      else
        begin
          reg50 <= reg46;
          reg51 <= ({reg53[(4'hf):(4'he)],
              ((reg45[(1'h0):(1'h0)] ?
                  (reg49 ?
                      (7'h43) : reg57) : {reg56}) ^~ (~&$signed(wire35)))} >= (reg39[(2'h3):(2'h2)] >> ($unsigned((reg57 ?
                  (8'haf) : reg52)) ?
              reg43 : (^$signed(reg53)))));
          reg52 <= $unsigned($unsigned($unsigned($unsigned($unsigned(reg44)))));
        end
      reg61 <= reg57[(2'h2):(2'h2)];
      reg62 <= (reg46[(4'hd):(4'hd)] <= (~|(~^$unsigned($unsigned(reg57)))));
    end
  assign wire63 = wire36;
  always
    @(posedge clk) begin
      reg64 <= (((8'hac) ?
              ((~&$signed(reg61)) - reg60[(2'h2):(2'h2)]) : (|reg54)) ?
          {(($unsigned((8'ha4)) ^ reg48[(1'h1):(1'h1)]) ?
                  reg46[(5'h10):(1'h1)] : ({(8'haf), reg40} ?
                      (wire34 <= reg40) : (wire63 + (8'ha2))))} : ($unsigned(((reg60 ?
              wire33 : reg48) + reg39)) && (reg39[(3'h7):(1'h1)] - $signed({reg60,
              reg56}))));
      if ($unsigned(reg40))
        begin
          reg65 <= wire63;
        end
      else
        begin
          reg65 <= reg52;
        end
      reg66 <= {((reg62 >>> reg54) ? reg41 : (|$signed((^(8'hab)))))};
      reg67 <= ((8'hbf) ?
          $signed($signed(reg52)) : {(|((reg46 || (8'ha7)) && {reg64}))});
    end
  assign wire68 = ((8'h9c) * $unsigned(wire34[(2'h2):(1'h1)]));
  assign wire69 = reg49;
  assign wire70 = ($signed(wire37[(1'h0):(1'h0)]) ?
                      $signed({({reg60} ? ((8'hba) >> (8'hb2)) : (^~reg55)),
                          (+reg64[(4'h8):(3'h5)])}) : $signed(reg58[(2'h2):(1'h0)]));
  assign wire71 = $signed(($unsigned(wire36) ?
                      (((reg40 ? reg50 : reg56) ?
                          (8'hae) : (reg57 ?
                              reg41 : wire69)) < $signed(reg61)) : $signed($signed(((8'ha4) >>> reg57)))));
  assign wire72 = ($signed(((^reg40[(4'h8):(3'h6)]) >= $unsigned(reg66[(4'hc):(4'hb)]))) ?
                      (~reg48) : $unsigned((!((~|reg55) | $unsigned(reg49)))));
  assign wire73 = (({reg54} ?
                      reg67 : (~{{(8'hbd), wire69},
                          reg48})) & $unsigned($signed((~&{(7'h44)}))));
  assign wire74 = reg42;
  assign wire75 = $signed({($signed((&(8'hb4))) ?
                          ($signed(reg39) ?
                              {(8'hbb),
                                  reg60} : wire34[(2'h3):(2'h3)]) : ((~wire70) ?
                              ((7'h40) ^~ wire71) : $unsigned(reg55))),
                      {wire70[(1'h1):(1'h0)]}});
  assign wire76 = (($unsigned(reg41[(4'hc):(3'h4)]) ?
                      {reg38} : (~$signed($unsigned(wire36)))) | (-$unsigned($unsigned((+reg47)))));
  assign wire77 = reg44;
  assign wire78 = {reg46};
  always
    @(posedge clk) begin
      reg79 <= $unsigned((((wire71 != {reg48, wire75}) ?
          $unsigned((8'ha2)) : (~^(wire68 ? reg60 : reg42))) + wire73));
    end
  always
    @(posedge clk) begin
      if ((~^reg47[(2'h3):(1'h1)]))
        begin
          reg80 <= {wire77};
          if ($unsigned(reg44))
            begin
              reg81 <= (-$signed(reg58));
              reg82 <= $signed({(((wire32 ? wire37 : reg53) ?
                          {reg40, wire70} : wire76) ?
                      (8'had) : ((reg52 ?
                          wire76 : reg64) + ((8'ha6) + wire37)))});
              reg83 <= wire73;
            end
          else
            begin
              reg81 <= wire77;
            end
        end
      else
        begin
          reg80 <= $unsigned($signed(wire76[(4'hc):(3'h4)]));
          if ({$unsigned(($unsigned((-(8'hb1))) ?
                  ($unsigned(reg46) && reg67) : reg80[(5'h10):(1'h1)])),
              reg52[(1'h1):(1'h0)]})
            begin
              reg81 <= (8'hb6);
              reg82 <= ($unsigned(((-$signed((8'ha0))) ?
                      {(reg43 ? (8'hab) : reg83)} : $signed((~^reg38)))) ?
                  ({(8'hae),
                      $unsigned((wire36 ?
                          wire33 : wire78))} != $unsigned($signed((reg81 ?
                      reg55 : (7'h42))))) : (^(8'hba)));
              reg83 <= $unsigned(reg81);
            end
          else
            begin
              reg81 <= ((reg81[(3'h7):(3'h4)] && $signed(wire63[(1'h0):(1'h0)])) >>> (wire63 ?
                  (((~|reg43) | reg51) > wire72) : $signed(((!reg79) ?
                      reg81 : wire73[(4'hd):(3'h4)]))));
              reg82 <= (~(!$signed(reg50[(4'hb):(3'h6)])));
              reg83 <= (&(8'ha7));
              reg84 <= reg82[(2'h3):(1'h0)];
              reg85 <= $signed($unsigned(reg82[(3'h4):(2'h3)]));
            end
          reg86 <= $signed((($signed(reg45[(2'h3):(2'h3)]) ?
              $unsigned((&reg82)) : ({reg82} == $unsigned(reg66))) && $signed(((~&reg54) || reg44))));
          reg87 <= ($signed((reg44 ? {wire72} : wire34)) ?
              wire75[(3'h4):(1'h0)] : wire76);
        end
      reg88 <= (~^(reg79 ? {$unsigned((reg44 ? reg44 : reg59))} : wire36));
      reg89 <= {(~|(~^(^~(wire77 ^ reg51))))};
    end
  assign wire90 = wire77[(2'h3):(2'h2)];
endmodule
