module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire132;
  wire signed [(5'h10):(1'h0)] wire131;
  wire [(3'h4):(1'h0)] wire130;
  wire signed [(5'h12):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire signed [(4'hc):(1'h0)] wire126;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg10 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire26,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire3[(3'h6):(2'h2)];
  assign wire6 = wire3;
  assign wire7 = wire3;
  assign wire8 = wire7[(4'h8):(3'h4)];
  assign wire9 = wire1[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg10 <= wire8[(4'h9):(1'h1)];
      reg11 <= $unsigned((8'ha4));
    end
  always
    @(posedge clk) begin
      reg12 <= (wire9 ?
          $signed((~^($signed(wire8) ? wire1 : wire7))) : {$signed(wire3),
              {{(wire7 - wire4), (wire9 - wire7)}}});
      reg13 <= (8'hbd);
      if (wire8[(5'h14):(3'h7)])
        begin
          reg14 <= (wire3 * {reg10[(2'h3):(1'h1)],
              {(|(~|reg12)), reg13[(3'h7):(3'h5)]}});
          if (reg13[(3'h6):(1'h0)])
            begin
              reg15 <= wire9[(3'h5):(1'h1)];
              reg16 <= (^(reg12 ?
                  $signed(((wire0 > reg11) ?
                      (wire3 ?
                          reg14 : wire6) : ((8'ha6) < wire5))) : ($signed(wire1) & reg13[(3'h7):(2'h3)])));
              reg17 <= wire2[(2'h2):(2'h2)];
            end
          else
            begin
              reg15 <= wire9[(3'h5):(2'h2)];
              reg16 <= (reg10 ?
                  $unsigned(reg17) : $signed(($unsigned($unsigned(reg14)) != $unsigned(wire0[(3'h5):(1'h1)]))));
              reg17 <= ($unsigned(reg16) ?
                  (!wire4) : $signed((~wire0[(4'he):(4'hc)])));
            end
          reg18 <= $signed(reg14[(5'h11):(3'h6)]);
          if ((~&$unsigned(wire8)))
            begin
              reg19 <= reg11[(3'h5):(1'h0)];
              reg20 <= (+wire8[(3'h6):(1'h0)]);
              reg21 <= ($unsigned(wire4[(4'hd):(4'hd)]) >> {reg20,
                  $signed(reg17[(2'h3):(1'h0)])});
              reg22 <= wire5[(1'h1):(1'h0)];
              reg23 <= $unsigned((($unsigned(wire3) | $signed(((8'hb9) || wire4))) ^ reg22[(3'h4):(1'h1)]));
            end
          else
            begin
              reg19 <= $unsigned(({$signed((reg10 ? reg18 : reg18)), (8'ha0)} ?
                  $signed($signed((wire8 ?
                      (8'hbf) : wire1))) : (reg21[(3'h7):(2'h3)] || reg22[(1'h1):(1'h1)])));
              reg20 <= reg14;
            end
          reg24 <= ((~$unsigned($unsigned((wire7 ?
              (8'had) : wire4)))) ^~ reg17);
        end
      else
        begin
          reg14 <= {$unsigned((reg13[(4'h9):(3'h4)] >>> (|$signed((8'hbf)))))};
          if (reg20)
            begin
              reg15 <= wire5;
              reg16 <= (+$signed($unsigned({$signed((8'ha6))})));
              reg17 <= {$unsigned($signed(wire6[(3'h4):(1'h0)])),
                  reg19[(3'h5):(3'h4)]};
            end
          else
            begin
              reg15 <= ({$signed({(wire6 ? wire9 : wire5),
                          reg16[(3'h5):(3'h5)]})} ?
                  (~&(^{wire3,
                      (reg13 ^ reg17)})) : $signed(wire2[(2'h2):(1'h1)]));
              reg16 <= $signed(reg14[(4'hd):(3'h4)]);
            end
          if ((8'hb2))
            begin
              reg18 <= ($unsigned($signed($signed($signed((8'hbe))))) ?
                  reg18 : {((8'hb7) & ((&wire3) ? reg22 : reg16))});
              reg19 <= $unsigned(wire6[(2'h2):(2'h2)]);
              reg20 <= {(-($unsigned(wire4) ?
                      $signed((wire2 ? reg17 : wire4)) : wire1)),
                  $signed($signed(reg17[(1'h1):(1'h0)]))};
            end
          else
            begin
              reg18 <= reg19;
            end
          if ($unsigned((wire5 >>> $unsigned(($signed(wire4) ~^ $signed(reg10))))))
            begin
              reg21 <= ($signed({$unsigned((reg16 ? reg19 : reg22))}) & reg10);
              reg22 <= ($signed((~(~|$unsigned(reg23)))) ?
                  reg14[(3'h6):(3'h6)] : ((+{{reg19}}) >>> $unsigned(((reg14 == reg16) > {reg18,
                      (8'h9e)}))));
              reg23 <= reg10[(1'h0):(1'h0)];
              reg24 <= reg16;
            end
          else
            begin
              reg21 <= $unsigned(({$signed({(8'hb3), (8'hb9)})} ?
                  ($signed($unsigned(reg10)) ?
                      ((reg22 << (8'ha9)) ?
                          $signed(wire0) : (reg22 ?
                              (7'h43) : reg23)) : (|(reg14 ?
                          (8'hbb) : wire2))) : {$signed((~|(8'h9c))),
                      (+reg18[(3'h6):(1'h0)])}));
              reg22 <= $signed($signed({$signed({reg22, (8'ha6)}),
                  (^~$unsigned(wire9))}));
              reg23 <= (wire4[(4'h9):(3'h6)] ?
                  $unsigned($unsigned(wire5[(4'h8):(1'h0)])) : {reg18,
                      ($unsigned({wire3, wire0}) & {{reg11}})});
            end
        end
      reg25 <= (~^(reg22[(3'h4):(3'h4)] ?
          ((-{reg24}) ?
              wire7[(3'h6):(1'h1)] : ((wire5 & wire9) * $signed(reg24))) : (+$signed(reg21[(4'hc):(2'h3)]))));
    end
  assign wire26 = (wire1 * (8'hab));
  module27 #() modinst127 (.wire28(reg11), .clk(clk), .wire29(reg18), .wire30(reg14), .y(wire126), .wire31(reg22));
  assign wire128 = ((!({(8'hb0)} == {(wire1 >> wire3)})) ~^ {(reg15 == reg20[(4'h9):(3'h5)])});
  assign wire129 = ($signed((|(^~reg13))) ?
                       ({(+(reg18 ^~ reg10)), wire8} >> (($unsigned(reg21) ?
                           (~reg23) : $signed(wire1)) <= reg17[(1'h1):(1'h0)])) : ($unsigned($signed(((7'h43) ?
                               wire7 : wire2))) ?
                           ({(reg18 & wire4),
                               (reg12 | (7'h44))} <<< reg22[(4'hf):(3'h6)]) : $unsigned($signed($unsigned((8'hac))))));
  assign wire130 = $signed($unsigned((reg16 >> ((!reg21) ?
                       (reg25 >>> wire6) : $signed(wire4)))));
  assign wire131 = (reg19 == (^(((wire8 ?
                           reg22 : reg14) & (wire126 != wire129)) ?
                       wire3[(1'h1):(1'h1)] : {$unsigned(reg25)})));
  assign wire132 = $unsigned($unsigned(reg22[(3'h6):(2'h3)]));
endmodule

module module27
#(parameter param125 = ((-(!(8'hb8))) ? (((((7'h42) ? (8'h9c) : (8'h9f)) ? ((8'hb6) ? (8'hba) : (8'hb5)) : ((8'hb0) >>> (8'hae))) <<< (8'hbf)) ? ((-((8'hb5) ? (8'ha0) : (8'ha1))) >>> (((8'hac) ? (8'hb9) : (8'h9f)) ? ((7'h42) ? (8'hb2) : (8'hb8)) : {(8'ha1)})) : (&{{(8'hb4), (8'ha9)}})) : ((8'ha2) ? ((-((8'ha0) << (7'h41))) || (8'ha0)) : (~|(((8'h9e) ? (8'hae) : (8'h9c)) ? ((8'ha8) ? (8'hb4) : (8'ha3)) : {(8'hb5)})))))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire31;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire signed [(4'hc):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire124;
  wire [(5'h14):(1'h0)] wire123;
  wire signed [(4'hd):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(4'ha):(1'h0)] wire120;
  wire signed [(3'h6):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire32;
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire118,
                 wire42,
                 wire32,
                 (1'h0)};
  assign wire32 = wire29[(2'h3):(2'h3)];
  module33 #() modinst43 (.wire34(wire31), .y(wire42), .clk(clk), .wire37(wire32), .wire36(wire29), .wire35(wire28));
  module44 #() modinst119 (wire118, clk, wire30, wire42, wire29, wire31);
  assign wire120 = wire32[(2'h3):(1'h1)];
  assign wire121 = ((8'hae) || $unsigned((~|$unsigned($unsigned((7'h42))))));
  assign wire122 = $signed((^$unsigned((^~(|wire30)))));
  assign wire123 = (wire31[(5'h13):(3'h6)] ?
                       (((-(wire30 ~^ wire32)) ?
                           wire32 : {(^~wire32)}) <<< ((~(wire121 ?
                           wire122 : wire31)) <= $signed((wire120 <<< wire30)))) : $unsigned(((!((8'hb1) ?
                               wire42 : wire30)) ?
                           (~(wire118 ?
                               wire30 : wire31)) : wire32[(3'h6):(2'h3)])));
  assign wire124 = wire118;
endmodule

module module44
#(parameter param117 = (~|((((~&(8'ha9)) > ((8'ha6) ? (8'had) : (8'hbc))) ? (+((8'hb4) <<< (7'h41))) : {((8'ha0) ^ (8'h9c)), ((8'had) ? (7'h42) : (8'hbc))}) ? ((((8'hb1) & (8'hb9)) <= ((8'ha0) != (8'hab))) | (((8'hac) & (8'hbd)) ? ((8'hbe) >> (8'ha3)) : {(8'hb4)})) : (^({(8'hbf)} * ((8'ha4) ? (8'hac) : (8'ha8)))))))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h317):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire48;
  input wire [(3'h5):(1'h0)] wire47;
  input wire signed [(4'h8):(1'h0)] wire46;
  input wire [(5'h13):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire114;
  wire signed [(4'hc):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(5'h15):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(5'h14):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(4'h8):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg [(4'hd):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire94,
                 wire93,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 reg116,
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
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 (1'h0)};
  assign wire49 = (8'hbf);
  assign wire50 = {$unsigned(((wire45[(4'h8):(1'h0)] ? (8'hb3) : (~^wire45)) ?
                          $signed(wire45) : $signed($signed((8'ha8))))),
                      $signed(wire45)};
  assign wire51 = $signed((wire49 < {($signed(wire45) ~^ wire46)}));
  assign wire52 = (^~($unsigned($unsigned((~|wire48))) ^ $unsigned($unsigned(wire48[(2'h2):(1'h0)]))));
  always
    @(posedge clk) begin
      reg53 <= (&wire52);
      reg54 <= {$signed($unsigned(((wire52 ? wire51 : wire51) ?
              wire52[(3'h6):(2'h2)] : wire48[(2'h3):(2'h2)])))};
      if (((((~wire48[(1'h0):(1'h0)]) && ((^(8'ha6)) ?
              $signed(wire51) : (wire46 ?
                  wire48 : wire47))) >>> (!(((8'haf) << reg53) ?
              $signed(reg54) : (reg54 ? wire46 : wire48)))) ?
          $unsigned({$signed((&wire47))}) : (7'h42)))
        begin
          if ({wire45, wire49[(4'h8):(2'h3)]})
            begin
              reg55 <= $signed(($signed(wire48[(3'h6):(1'h0)]) ?
                  $unsigned(wire48) : wire52));
              reg56 <= wire51[(3'h4):(1'h1)];
            end
          else
            begin
              reg55 <= reg53[(3'h4):(3'h4)];
              reg56 <= ($unsigned((~|wire47)) ^~ ((-$unsigned(((8'ha2) ?
                      reg54 : wire46))) ?
                  wire47[(2'h3):(2'h2)] : ($unsigned((-wire48)) ?
                      $unsigned(wire47) : (wire45 ?
                          (wire45 ~^ wire46) : {wire50}))));
              reg57 <= $unsigned((reg53[(1'h0):(1'h0)] << wire47));
              reg58 <= (((reg54 ?
                      (~(~^reg55)) : $signed((reg55 << wire45))) > reg54) ?
                  wire52[(2'h3):(2'h2)] : wire50[(5'h11):(4'hd)]);
              reg59 <= $unsigned($unsigned((8'hb8)));
            end
        end
      else
        begin
          reg55 <= ($unsigned((wire48[(1'h0):(1'h0)] ?
              {$unsigned(wire51),
                  $signed((8'hb6))} : reg54[(3'h5):(1'h0)])) ^~ wire50);
          reg56 <= $signed(wire52[(4'hb):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg60 <= $unsigned(wire49[(3'h7):(2'h2)]);
      reg61 <= reg53;
      reg62 <= (^((reg59 ~^ (reg58 ^ wire52)) >>> $signed($unsigned((8'ha4)))));
      reg63 <= reg55;
      reg64 <= ({reg54[(1'h1):(1'h1)],
          ((^~$signed(reg56)) ?
              ((-reg62) * ((8'ha3) >>> reg58)) : (~^{reg59}))} - $unsigned((8'hb8)));
    end
  always
    @(posedge clk) begin
      reg65 <= wire45[(3'h5):(1'h0)];
      reg66 <= $unsigned($unsigned(wire52));
      reg67 <= (8'h9d);
      reg68 <= reg62[(2'h2):(1'h1)];
    end
  assign wire69 = (8'had);
  assign wire70 = (($unsigned(({wire46} | (wire49 ?
                      reg55 : reg68))) ^~ reg61) ^ (-(wire50[(2'h2):(1'h1)] ?
                      reg64 : $unsigned(reg61[(2'h3):(2'h2)]))));
  assign wire71 = reg53;
  assign wire72 = {{$unsigned(wire49)}, wire71[(3'h4):(1'h0)]};
  assign wire73 = $unsigned(wire49[(4'he):(3'h6)]);
  always
    @(posedge clk) begin
      if (reg57)
        begin
          reg74 <= {((|($unsigned(wire70) ?
                  ((8'ha8) ? wire70 : wire73) : reg59)) <= $unsigned(reg62))};
          if (wire48)
            begin
              reg75 <= ({wire47[(3'h5):(2'h2)]} ?
                  ((($signed(wire72) << (-reg58)) ?
                      (wire46 ?
                          $signed((7'h40)) : wire52[(3'h4):(1'h0)]) : $signed(wire69[(1'h1):(1'h1)])) != {((8'ha2) ?
                          {reg66, wire50} : reg59[(2'h2):(1'h0)]),
                      $signed(wire50)}) : $signed(wire52));
              reg76 <= (reg61[(4'h8):(4'h8)] || $unsigned(((|{reg68, reg57}) ?
                  (~^wire52) : $unsigned($signed((8'ha2))))));
              reg77 <= wire49;
            end
          else
            begin
              reg75 <= (((8'h9d) | {$unsigned($unsigned(reg54)),
                      {(&reg57), {reg75, reg56}}}) ?
                  (({((8'hb0) != reg53), $signed(wire49)} | (~|(wire50 ?
                          reg74 : reg53))) ?
                      $signed((((8'hbb) > wire46) ?
                          $unsigned(reg53) : $unsigned(reg76))) : reg55) : $unsigned((wire48 != (reg74 ?
                      $unsigned((8'h9f)) : (-wire52)))));
              reg76 <= $unsigned((wire73[(2'h3):(1'h0)] ?
                  $signed(($unsigned(reg55) ?
                      {wire48,
                          reg60} : ((8'h9e) <= reg53))) : (~|$signed($unsigned(wire45)))));
              reg77 <= reg67[(3'h6):(2'h3)];
            end
          reg78 <= $unsigned((($signed($signed((8'hb6))) ?
                  ((reg58 << reg61) & $unsigned(reg62)) : $unsigned($signed(reg75))) ?
              reg66 : $unsigned(reg59)));
        end
      else
        begin
          reg74 <= $unsigned(wire51);
          if (wire47)
            begin
              reg75 <= wire69[(2'h3):(1'h1)];
              reg76 <= $signed((^~reg55));
            end
          else
            begin
              reg75 <= $signed($unsigned((reg54 << reg59[(1'h0):(1'h0)])));
            end
          if ({wire70})
            begin
              reg77 <= ($signed((+(~^$unsigned(reg54)))) & $signed(wire48));
              reg78 <= $signed($signed((reg57[(2'h2):(1'h1)] * (reg63 ?
                  (~^reg54) : $signed(wire45)))));
              reg79 <= $unsigned({reg68, wire48[(4'h9):(2'h3)]});
            end
          else
            begin
              reg77 <= {((8'ha7) ?
                      $signed((~^wire70)) : ((~|(reg76 ? (7'h43) : (8'ha9))) ?
                          ((wire49 ^ wire48) < ((8'hb5) ?
                              reg58 : reg60)) : $signed((wire73 * wire49))))};
              reg78 <= reg74[(1'h0):(1'h0)];
              reg79 <= reg74[(2'h2):(1'h1)];
            end
          reg80 <= $signed($signed(reg65));
        end
      if ($unsigned(wire70[(2'h3):(2'h3)]))
        begin
          if ($unsigned($unsigned($unsigned($unsigned((reg65 < (8'ha1)))))))
            begin
              reg81 <= reg78;
              reg82 <= (($signed(wire71) >>> (reg81 ?
                  (~^reg81) : $signed((reg79 ? (8'h9f) : reg79)))) ^~ reg67);
            end
          else
            begin
              reg81 <= $unsigned(reg79[(5'h12):(2'h2)]);
            end
          reg83 <= $unsigned((|$signed(wire70[(2'h2):(1'h1)])));
          reg84 <= $signed((wire73[(1'h1):(1'h0)] | {$unsigned($signed(reg80)),
              {{(8'ha1)}, (+reg59)}}));
          reg85 <= ((reg82 & (-wire48)) ?
              (8'h9c) : $signed(($signed((~^(8'h9c))) ?
                  {reg75[(3'h6):(2'h3)], (~&wire71)} : ((wire46 ?
                      wire50 : reg78) ^~ $signed(reg68)))));
        end
      else
        begin
          reg81 <= reg83[(3'h7):(2'h2)];
          reg82 <= (~$unsigned(((~&$unsigned(reg57)) - wire48[(4'hd):(3'h5)])));
          reg83 <= $signed((wire52[(2'h3):(1'h1)] ?
              reg66 : {(-$signed(reg67))}));
          if (reg75[(4'he):(3'h6)])
            begin
              reg84 <= $unsigned((reg56 ?
                  ((|reg68[(1'h0):(1'h0)]) ?
                      (-(^~reg77)) : ($unsigned((8'hbe)) + (reg62 ?
                          reg68 : (8'h9d)))) : ((^~(reg85 ? reg60 : (8'hb8))) ?
                      $signed((wire71 + (8'ha4))) : ({reg68, reg61} ?
                          (~^(8'h9d)) : $unsigned(reg84)))));
              reg85 <= (((reg64 ?
                  $signed((~|reg85)) : $unsigned((8'ha3))) >= wire46) ^ reg78);
              reg86 <= wire50;
              reg87 <= reg78;
              reg88 <= (+((~^reg66[(3'h5):(3'h5)]) || (((~reg85) || {reg77}) ?
                  (~&$signed(reg79)) : (reg59 ?
                      reg59 : ((8'hbb) ? reg60 : (8'h9e))))));
            end
          else
            begin
              reg84 <= $signed(reg66[(1'h1):(1'h1)]);
              reg85 <= $signed($signed((+reg87)));
            end
          reg89 <= ({((!{(8'hbf)}) ?
                  {{(8'haf)},
                      $signed(reg65)} : $unsigned($signed(reg67)))} * ((-((reg79 && reg54) | (reg56 < wire72))) <= (~&$unsigned((7'h42)))));
        end
    end
  always
    @(posedge clk) begin
      reg90 <= ($signed((($signed(reg58) >>> reg82) ?
          reg57 : (reg86 >= (reg82 ? reg60 : reg61)))) == reg89[(4'h9):(2'h2)]);
      reg91 <= reg88[(3'h5):(2'h2)];
      reg92 <= wire47[(3'h5):(2'h3)];
    end
  assign wire93 = $signed((reg88 ? (&{(~^reg57)}) : reg81[(4'hb):(4'hb)]));
  assign wire94 = (7'h40);
  always
    @(posedge clk) begin
      reg95 <= $unsigned((($unsigned(((8'haa) ?
          reg88 : reg53)) ^~ reg80[(3'h6):(3'h5)]) == reg56[(5'h13):(4'he)]));
      reg96 <= reg84;
      if (({({{reg75}} > (~|reg77[(2'h2):(1'h0)]))} ?
          ((reg74[(1'h1):(1'h0)] ?
              ((reg56 && reg61) * reg59[(2'h2):(2'h2)]) : reg66[(1'h0):(1'h0)]) * $unsigned((!reg55[(3'h7):(3'h4)]))) : {$signed({$unsigned(reg55)})}))
        begin
          if ((~((reg61 ? wire94 : $unsigned((^reg81))) ?
              (~&(((8'hbc) == reg81) ^ (reg62 != reg83))) : ((reg84[(2'h2):(2'h2)] ?
                      wire94[(2'h3):(1'h0)] : (reg78 ? reg89 : reg63)) ?
                  reg74[(3'h5):(1'h1)] : $unsigned((reg75 & reg54))))))
            begin
              reg97 <= (reg76[(4'h9):(3'h4)] ^ $signed($unsigned(($unsigned((8'hb4)) ?
                  (reg84 < reg67) : reg81[(4'hc):(3'h6)]))));
              reg98 <= reg66;
            end
          else
            begin
              reg97 <= {(($unsigned((reg95 ? reg66 : reg96)) ?
                          reg84 : (!$signed(reg62))) ?
                      reg68 : $unsigned(reg82[(2'h2):(1'h0)]))};
              reg98 <= (8'h9c);
            end
          reg99 <= $unsigned(reg53);
          reg100 <= (reg87[(2'h2):(1'h1)] ?
              ($unsigned(wire69[(1'h1):(1'h1)]) ?
                  ($unsigned({wire45}) <= $signed({wire71,
                      reg88})) : {reg60}) : reg87[(1'h0):(1'h0)]);
        end
      else
        begin
          reg97 <= ($signed(($signed((7'h41)) ?
              (8'hb3) : (~&(8'h9d)))) || ((reg74 || ((^reg62) ?
                  $unsigned(wire46) : (&reg68))) ?
              reg89 : ({(^reg59)} ?
                  (|(reg98 ~^ reg54)) : ({wire52} & (reg58 ? reg62 : reg75)))));
          if (reg95)
            begin
              reg98 <= $signed($signed({reg90, $unsigned((7'h44))}));
              reg99 <= (~^(((!$unsigned(reg77)) && (&{reg53, (8'hb3)})) ?
                  reg97[(1'h1):(1'h1)] : ({$unsigned(reg63),
                      (~&reg79)} && reg67)));
              reg100 <= (-(reg90[(2'h3):(1'h0)] ?
                  ($unsigned($signed(wire71)) << ((~reg92) ?
                      $signed(reg82) : reg58[(2'h3):(1'h0)])) : $signed((~(reg78 && reg97)))));
              reg101 <= (8'hb7);
              reg102 <= $unsigned(wire73[(5'h12):(1'h0)]);
            end
          else
            begin
              reg98 <= {reg99,
                  (+{$signed($unsigned(reg77)),
                      ((reg68 | wire45) ? ((8'hbd) > reg61) : reg55)})};
              reg99 <= ((|wire69[(3'h4):(3'h4)]) ?
                  ((&$signed({reg98,
                      reg97})) <= reg89[(4'ha):(2'h2)]) : reg66[(3'h4):(2'h3)]);
              reg100 <= ((~|$unsigned((wire70 || reg61))) ?
                  reg62 : (reg75[(2'h3):(1'h0)] ?
                      reg95 : (((wire49 <<< reg101) <<< {reg92, (7'h40)}) ?
                          {{reg61, reg99},
                              $unsigned(wire70)} : ({reg62} ^~ (8'ha9)))));
              reg101 <= ((~(8'hbd)) ? $signed(reg86) : reg100);
              reg102 <= $signed(($unsigned($signed($unsigned((8'h9c)))) <= $unsigned(reg74[(3'h5):(1'h1)])));
            end
          reg103 <= (-reg90);
        end
      if (reg56)
        begin
          reg104 <= reg92[(1'h1):(1'h1)];
        end
      else
        begin
          if (($signed($unsigned((^~(&reg56)))) ?
              reg57[(1'h0):(1'h0)] : $signed(reg96[(3'h5):(3'h4)])))
            begin
              reg104 <= ({(-reg66[(3'h7):(3'h7)]),
                      ({(wire70 ~^ wire69),
                          (reg54 <<< (8'hb2))} >> ($unsigned(reg57) | (wire48 ?
                          wire94 : reg75)))} ?
                  ($unsigned(reg99[(1'h0):(1'h0)]) + (!reg65)) : (-reg66));
              reg105 <= (((($unsigned(reg53) + (wire51 >= reg86)) ?
                  (&$unsigned(reg101)) : wire73) != (&((!reg100) ?
                  $signed(reg68) : wire45))) >= wire47[(3'h5):(3'h5)]);
              reg106 <= reg96[(2'h3):(2'h3)];
              reg107 <= wire72[(4'hf):(1'h1)];
              reg108 <= wire93;
            end
          else
            begin
              reg104 <= reg95[(4'ha):(1'h0)];
              reg105 <= ($signed(reg59[(2'h3):(1'h1)]) | ((reg82 >>> ($unsigned(reg90) ?
                      (~|reg90) : $signed(reg108))) ?
                  ($signed((~(8'hab))) || {reg77}) : $unsigned(reg66)));
            end
          if (({(reg84[(1'h0):(1'h0)] ?
                      ((reg60 > wire49) << $signed((7'h40))) : ({reg106} < $unsigned(reg104))),
                  $unsigned(wire52[(4'hb):(3'h7)])} ?
              ($signed(wire49) >>> (8'hb5)) : reg104[(1'h1):(1'h0)]))
            begin
              reg109 <= {$signed((wire50 <<< (((8'ha2) ? wire72 : reg54) ?
                      (!reg74) : $signed(reg102)))),
                  ($unsigned((~^(-reg107))) <<< {{reg62,
                          ((8'hb2) ? (7'h41) : reg79)},
                      (reg61 ? (wire73 | wire94) : (reg66 >> reg91))})};
            end
          else
            begin
              reg109 <= reg80[(3'h6):(3'h6)];
              reg110 <= {$signed(($signed((reg65 ?
                      (8'h9c) : (8'hb0))) ~^ $signed($unsigned(reg77))))};
              reg111 <= (wire71 >>> (+(+{reg110})));
            end
          reg112 <= $unsigned((((reg104 ?
              (reg82 ?
                  reg89 : reg68) : $signed(wire48)) & (|$signed((8'hb1)))) >= (7'h43)));
        end
      reg113 <= (reg87[(2'h2):(2'h2)] | ((!$signed((wire52 >= reg79))) || $signed($unsigned((wire94 - reg81)))));
    end
  assign wire114 = $unsigned((^~(+{reg87, reg66[(1'h0):(1'h0)]})));
  assign wire115 = reg102;
  always
    @(posedge clk) begin
      reg116 <= $unsigned(((~&$signed(reg58[(2'h2):(2'h2)])) ?
          reg110[(3'h4):(1'h0)] : ($signed($unsigned(reg75)) ?
              (8'ha3) : {{reg101, (7'h42)}})));
    end
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire37;
  input wire [(4'hc):(1'h0)] wire36;
  input wire [(4'he):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  assign y = {wire41, wire40, wire39, wire38, (1'h0)};
  assign wire38 = (^~((({wire37, wire37} ?
                          (~|wire34) : wire37) * $signed({wire35, (8'hb9)})) ?
                      $unsigned((&(wire36 & wire35))) : {((wire35 ?
                                  wire34 : wire34) ?
                              $unsigned(wire35) : ((8'haf) ^~ wire37))}));
  assign wire39 = (|$unsigned($unsigned(wire36)));
  assign wire40 = (^(^(((wire34 ? wire39 : wire39) >= wire37) ?
                      wire36[(4'h8):(1'h1)] : (((8'hab) ~^ wire34) ?
                          ((8'hb7) >> wire36) : $unsigned(wire37)))));
  assign wire41 = ((-($signed((+wire36)) != (8'h9c))) <= (wire34[(4'h9):(3'h6)] ?
                      (!$unsigned(wire40)) : (~|(|(~|wire36)))));
endmodule
