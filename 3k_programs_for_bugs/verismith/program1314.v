module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire127;
  wire [(5'h13):(1'h0)] wire114;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(5'h12):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(2'h2):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire4,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg5,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire4 = wire2[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg5 <= $unsigned(($signed($signed($signed(wire4))) ?
          $unsigned(wire2[(3'h5):(1'h1)]) : ($unsigned(((8'ha8) ?
                  wire3 : wire3)) ?
              (wire3[(3'h4):(1'h0)] >> wire3[(2'h2):(1'h1)]) : {(^wire1),
                  $signed(wire2)})));
    end
  assign wire6 = wire3[(1'h1):(1'h0)];
  assign wire7 = wire3[(2'h2):(1'h0)];
  assign wire8 = $unsigned(wire2[(3'h6):(2'h2)]);
  assign wire9 = $signed($signed(wire7[(3'h4):(1'h0)]));
  assign wire10 = (~^(!$signed(wire7)));
  assign wire11 = $signed($unsigned(wire2[(1'h0):(1'h0)]));
  assign wire12 = (~wire11[(4'h9):(4'h9)]);
  always
    @(posedge clk) begin
      reg13 <= (((^(+wire2[(1'h1):(1'h1)])) ?
          wire1[(2'h2):(1'h0)] : $signed(wire8)) ^~ $signed($unsigned($unsigned($signed(wire1)))));
      reg14 <= {($unsigned($signed(wire3)) ^ reg5), wire4};
      reg15 <= $signed(wire0);
    end
  module16 #() modinst111 (wire110, clk, wire4, wire11, wire0, wire1, reg14);
  assign wire112 = wire12[(4'he):(4'ha)];
  assign wire113 = wire10;
  assign wire114 = $unsigned($signed($signed((+$signed(wire112)))));
  always
    @(posedge clk) begin
      reg115 <= {(+(+(^$unsigned(wire110))))};
      reg116 <= (^~$unsigned($signed((wire8[(1'h1):(1'h1)] >= (~&(8'hb7))))));
      reg117 <= $signed($unsigned(reg115));
      reg118 <= wire4;
    end
  always
    @(posedge clk) begin
      reg119 <= reg115[(4'h8):(3'h7)];
      reg120 <= $signed(($signed((((7'h40) < wire11) ?
              (^~wire4) : $signed(wire0))) ?
          $signed((reg117 < (~|wire6))) : ($signed(((8'ha1) ^~ wire3)) - reg118)));
      if ((((-{(~|wire112), (~&wire7)}) ?
              (~&(reg119 ? (wire0 <<< wire1) : $unsigned(wire4))) : ((((8'hbe) ?
                      wire114 : reg118) ^~ wire12[(4'hf):(4'hd)]) ?
                  ((reg120 ? wire10 : (8'hb4)) | (reg120 ?
                      wire3 : wire4)) : ($unsigned(wire10) ~^ (wire11 ?
                      wire8 : wire8)))) ?
          (($signed($signed(wire2)) ?
                  ((reg14 && reg117) <= $signed(wire6)) : reg115) ?
              {$unsigned((~|wire1)),
                  ((wire10 ?
                      wire113 : wire114) == ((8'hbe) - reg118))} : {wire8,
                  {wire1}}) : $signed((~^$signed((wire8 >> wire1))))))
        begin
          if (wire1[(3'h4):(2'h2)])
            begin
              reg121 <= (wire7 ?
                  wire12 : $unsigned(($signed((wire12 ?
                      wire9 : wire114)) ^~ (~^{(8'h9e)}))));
            end
          else
            begin
              reg121 <= (wire2[(3'h5):(2'h3)] ? wire0[(1'h1):(1'h1)] : wire6);
              reg122 <= (~&(reg13 ?
                  (~|((8'h9e) ?
                      reg116 : wire0[(2'h2):(1'h0)])) : wire12[(4'hc):(2'h2)]));
              reg123 <= wire112;
              reg124 <= ({(((8'haf) ? reg123 : (|reg117)) ?
                      wire1 : (^~$unsigned(reg117))),
                  wire12[(2'h3):(2'h2)]} >= ($signed(reg115) > $unsigned($unsigned((!wire11)))));
            end
        end
      else
        begin
          if (reg15[(1'h0):(1'h0)])
            begin
              reg121 <= wire113[(2'h2):(1'h1)];
              reg122 <= ((reg117[(2'h3):(1'h0)] ?
                  (~^($signed(wire12) ?
                      (wire110 ?
                          (8'hb5) : wire3) : (~^reg123))) : (wire2[(3'h5):(3'h5)] ?
                      ($unsigned(wire11) | (reg15 ?
                          wire4 : reg14)) : reg115)) <= ({((reg13 ?
                      wire6 : reg14) || (7'h43))} == $signed({(^~(8'hb5))})));
              reg123 <= {$unsigned((((reg122 * reg119) ?
                          reg15[(2'h3):(2'h2)] : $signed(reg124)) ?
                      (8'h9c) : $signed((wire7 ? reg118 : wire9))))};
              reg124 <= (wire8 ?
                  $unsigned($signed(reg14[(4'he):(3'h4)])) : (8'had));
            end
          else
            begin
              reg121 <= (^~wire12[(2'h2):(1'h0)]);
              reg122 <= wire113;
            end
        end
      reg125 <= (($signed($unsigned($unsigned(reg13))) ?
              wire113[(2'h3):(2'h2)] : reg121) ?
          ($signed({wire8[(2'h2):(1'h0)]}) != (~wire12[(4'hc):(3'h6)])) : ($unsigned(wire9) ?
              (~&$unsigned(reg117[(4'he):(3'h6)])) : (~^$unsigned((wire112 ?
                  reg5 : wire1)))));
      reg126 <= wire0[(1'h0):(1'h0)];
    end
  assign wire127 = (~&(&$signed((-$unsigned(wire12)))));
  assign wire128 = (reg14 - (8'hac));
endmodule

module module16
#(parameter param108 = ((!{(8'hac)}) ? ((~&(((8'hae) ? (8'hab) : (8'ha0)) ? ((7'h41) >= (8'h9f)) : ((8'hb1) >= (8'ha5)))) ? {(&(~^(7'h40))), (((8'hbd) <<< (8'hb5)) >> (+(8'ha0)))} : (-(~((8'haf) ? (8'hb5) : (8'hb4))))) : ((~|(((8'ha0) * (8'h9d)) ? ((8'hba) ? (7'h42) : (8'had)) : ((7'h44) ? (8'ha0) : (7'h43)))) ? ((!(~(8'hb7))) ^ (((8'hbb) ? (7'h43) : (8'hac)) ? ((8'haa) ? (8'hae) : (8'ha3)) : {(8'hbd)})) : (~(!((8'haf) ? (8'hab) : (8'hb4)))))), 
parameter param109 = (^~{(((~&param108) ^~ (+param108)) | (((8'ha6) ? param108 : param108) == param108))}))
(y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h28c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire19;
  input wire signed [(5'h15):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(5'h11):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire71;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire105;
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  assign y = {wire107,
                 wire22,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire71,
                 wire72,
                 wire73,
                 wire105,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
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
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 (1'h0)};
  assign wire22 = (wire19 ~^ $unsigned(({(wire19 >= wire20)} ^~ wire17[(4'h9):(3'h6)])));
  always
    @(posedge clk) begin
      reg23 <= {($unsigned((wire22 ? (wire21 ? wire21 : wire17) : wire17)) ?
              (((wire22 > wire22) ?
                  (+(8'hbe)) : $signed(wire17)) != wire17[(4'h9):(3'h4)]) : wire19),
          wire18};
      reg24 <= (wire21 > ($signed({wire19[(2'h2):(1'h1)],
          (reg23 != wire22)}) << $unsigned(((-wire17) ^~ wire18[(3'h5):(3'h5)]))));
      reg25 <= $unsigned(wire22[(3'h6):(2'h3)]);
      reg26 <= (|$signed(((((8'hb8) ^ wire18) ?
          $signed(wire22) : $signed(wire17)) >> reg25[(1'h0):(1'h0)])));
    end
  assign wire27 = ($unsigned($unsigned($unsigned({reg26}))) == ($unsigned({{wire21,
                              wire19}}) ?
                      (8'hb3) : $signed($unsigned($unsigned(wire17)))));
  assign wire28 = wire17;
  assign wire29 = reg26[(1'h0):(1'h0)];
  assign wire30 = $signed((wire28[(4'h8):(1'h0)] ?
                      $signed(($signed(reg23) ?
                          {wire28} : reg24[(4'ha):(4'ha)])) : wire18[(2'h2):(1'h0)]));
  assign wire31 = wire27[(3'h6):(2'h3)];
  assign wire32 = $unsigned({$signed(reg26),
                      ({(reg25 ? wire30 : wire18), $signed(wire28)} ?
                          $signed((8'h9f)) : ((~|(8'ha3)) == wire19[(2'h2):(1'h1)]))});
  assign wire33 = wire18[(3'h4):(2'h3)];
  assign wire34 = (^(($unsigned(reg25) ^ {(wire27 ? reg24 : (7'h43)),
                      (^(8'ha2))}) >= (($signed((8'hb3)) == wire22[(4'h9):(3'h4)]) ~^ (((8'hb1) + wire31) <= (&(8'ha9))))));
  assign wire35 = (&wire30[(3'h4):(1'h1)]);
  assign wire36 = (~&{reg23, $unsigned($signed({(8'hb1), (8'ha5)}))});
  always
    @(posedge clk) begin
      reg37 <= $unsigned($signed($unsigned($unsigned((wire22 ?
          wire18 : reg23)))));
      reg38 <= wire31;
      reg39 <= {wire17[(3'h6):(3'h6)]};
      if (reg23)
        begin
          reg40 <= $signed((!((wire35 + wire29[(3'h4):(2'h3)]) ?
              ({wire32, reg38} * (wire36 > reg25)) : (wire35 < {wire20}))));
          if (reg23[(5'h13):(4'h9)])
            begin
              reg41 <= ((($unsigned($signed(reg23)) ?
                          (wire31[(4'h8):(4'h8)] ?
                              {reg38} : ((8'hb1) ?
                                  reg38 : reg24)) : wire31[(3'h5):(2'h2)]) ?
                      wire18 : $unsigned((&{reg38, wire30}))) ?
                  (^$unsigned(wire22[(1'h0):(1'h0)])) : (reg37 + ($unsigned((wire18 ?
                      wire36 : reg24)) + wire36[(2'h2):(1'h0)])));
              reg42 <= ($signed(reg38) ?
                  (~^$unsigned((7'h41))) : (((|(wire31 ?
                      wire30 : reg23)) || wire33[(2'h2):(1'h1)]) << ((8'had) | ($unsigned(wire29) && wire22))));
            end
          else
            begin
              reg41 <= reg25[(2'h2):(1'h0)];
            end
        end
      else
        begin
          if ($unsigned(reg37))
            begin
              reg40 <= wire27[(2'h2):(2'h2)];
              reg41 <= (wire18 - (({reg37,
                  (wire35 ?
                      reg41 : reg25)} || (~|$signed(wire22))) * $unsigned(wire22)));
            end
          else
            begin
              reg40 <= {(wire32 << reg26[(2'h2):(2'h2)]),
                  $signed((wire27 >>> reg39))};
              reg41 <= (!((({wire29, wire18} ?
                          reg25[(1'h0):(1'h0)] : wire35[(4'hd):(2'h2)]) ?
                      wire34[(4'h8):(1'h0)] : (|(reg26 - wire32))) ?
                  (&$signed(wire30[(2'h3):(2'h2)])) : wire19));
              reg42 <= wire21;
              reg43 <= $unsigned($signed(wire21));
              reg44 <= $unsigned((~&({reg26[(1'h0):(1'h0)]} < ({reg39,
                  wire32} > (wire32 ? wire22 : (8'ha9))))));
            end
          reg45 <= {{$signed((&wire29[(1'h0):(1'h0)])),
                  ($unsigned($unsigned(reg24)) ?
                      $signed($unsigned(reg41)) : $unsigned(reg42))},
              (((+$signed(reg44)) ?
                      wire36[(1'h1):(1'h0)] : (reg37 * wire32[(2'h3):(1'h1)])) ?
                  $unsigned(reg41[(4'he):(4'h8)]) : reg25)};
          reg46 <= ($signed(wire34) ?
              ($signed(reg25[(3'h6):(3'h6)]) ?
                  ($signed((&(8'ha4))) ?
                      ((reg41 ?
                          reg45 : reg23) && $unsigned(wire27)) : $unsigned((reg45 ^ reg26))) : ((^(8'hba)) + $signed($unsigned(wire36)))) : ($signed($signed(wire20[(5'h13):(4'hb)])) ?
                  (~|$signed((reg23 ? reg40 : wire32))) : (~|((+(8'ha7)) ?
                      ((8'ha4) <= reg38) : (wire35 ? (7'h44) : reg23)))));
          reg47 <= wire22[(2'h2):(2'h2)];
          reg48 <= wire36[(1'h0):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg49 <= $unsigned((8'ha8));
      if (($signed(($unsigned((~|(8'ha1))) || reg23[(3'h5):(2'h2)])) ?
          reg48 : (!((((8'h9c) ? reg46 : reg46) ?
                  wire30[(4'ha):(4'h9)] : wire18) ?
              $unsigned($signed(wire28)) : (reg39[(3'h7):(3'h5)] >> (wire22 + wire18))))))
        begin
          if (reg45[(4'h9):(1'h0)])
            begin
              reg50 <= $unsigned((reg45[(3'h4):(2'h3)] ?
                  (({reg49} || (reg37 ^~ (8'ha0))) & $unsigned((wire31 & reg37))) : $unsigned(reg24[(4'ha):(2'h2)])));
            end
          else
            begin
              reg50 <= $signed($unsigned($unsigned(reg50[(2'h3):(1'h1)])));
              reg51 <= (reg24[(4'h9):(3'h5)] ?
                  reg48 : $unsigned(reg42[(4'hd):(1'h0)]));
              reg52 <= $signed($unsigned($unsigned($unsigned((wire18 ?
                  reg51 : reg37)))));
            end
          reg53 <= (8'hba);
        end
      else
        begin
          if (wire35[(3'h7):(3'h7)])
            begin
              reg50 <= {reg41, $signed(((8'ha4) != {reg39}))};
              reg51 <= reg26[(1'h0):(1'h0)];
            end
          else
            begin
              reg50 <= ({reg48, (8'ha8)} ^ reg25);
              reg51 <= ($signed($signed($unsigned($unsigned(reg26)))) ?
                  (^~$unsigned(({reg49, wire20} ?
                      $unsigned(reg24) : $unsigned(wire17)))) : $unsigned((~|($unsigned(reg46) << wire22))));
              reg52 <= (7'h40);
              reg53 <= $signed(($signed(reg49) == $unsigned($signed($signed(reg52)))));
            end
          if (($signed($unsigned($signed(reg37[(1'h1):(1'h0)]))) ?
              (~(+wire17)) : $unsigned((wire18 + ((~&reg49) ?
                  ((8'h9d) ? wire30 : reg52) : $signed(reg51))))))
            begin
              reg54 <= wire36[(2'h2):(1'h1)];
            end
          else
            begin
              reg54 <= $unsigned(($signed($unsigned(reg52)) ?
                  (8'hb3) : reg54[(3'h5):(2'h2)]));
              reg55 <= (!$signed((+{wire28})));
            end
          if ((~&{(reg37 ?
                  (^$signed(reg52)) : (^((8'hac) ? (8'hbe) : wire33)))}))
            begin
              reg56 <= (($signed((8'hb4)) ~^ (~^reg45[(3'h4):(2'h3)])) + $signed(wire29));
              reg57 <= $signed($unsigned($unsigned(($signed((8'hbd)) <= reg54[(2'h2):(2'h2)]))));
              reg58 <= reg44[(2'h2):(1'h0)];
              reg59 <= (8'hb9);
            end
          else
            begin
              reg56 <= (~|$signed($signed(reg48)));
              reg57 <= ((((+{wire19,
                          reg44}) >= (wire22[(3'h6):(2'h3)] * wire35[(4'hf):(4'hd)])) ?
                      (+wire27[(1'h0):(1'h0)]) : ((reg26[(1'h0):(1'h0)] ?
                          (reg50 ?
                              reg44 : wire33) : $unsigned(wire36)) >= {$signed(wire30),
                          (reg26 ? reg57 : (8'ha1))})) ?
                  $signed($unsigned((^(~|wire22)))) : $signed(reg43));
              reg58 <= (^~reg24);
              reg59 <= wire30[(1'h0):(1'h0)];
            end
        end
      reg60 <= (wire35 ?
          ((((wire28 + reg53) ?
                  (reg24 ?
                      reg38 : reg40) : reg56[(2'h3):(1'h1)]) - $unsigned($signed(wire34))) ?
              (8'haf) : wire17) : reg48);
      reg61 <= (((~|$signed($unsigned((8'hb3)))) | $unsigned((+(8'hb6)))) & wire30);
      if ($unsigned($unsigned($unsigned(reg55[(3'h4):(2'h2)]))))
        begin
          reg62 <= reg24[(4'ha):(2'h2)];
          reg63 <= $unsigned((~^(((reg41 ? reg50 : wire29) ?
              {wire19} : wire31[(5'h11):(4'hd)]) - $unsigned((^~reg24)))));
          if (reg61)
            begin
              reg64 <= ($signed((((wire35 ? reg23 : (8'hbf)) ?
                      wire17[(4'hb):(3'h4)] : $signed((7'h44))) ?
                  wire28[(3'h6):(3'h5)] : reg46[(1'h1):(1'h0)])) << (8'hb7));
              reg65 <= (&(-(^{{reg58, (8'hb6)}})));
            end
          else
            begin
              reg64 <= (reg60[(4'hd):(3'h6)] >= wire19);
            end
          if ($signed($unsigned(wire17[(1'h1):(1'h1)])))
            begin
              reg66 <= reg60;
            end
          else
            begin
              reg66 <= $unsigned(reg46[(2'h2):(1'h1)]);
            end
          if ({$unsigned((^$unsigned(reg60[(4'h8):(3'h6)]))),
              ({((^~reg57) <<< (reg42 ? reg51 : (8'hb5)))} ?
                  (((wire35 ? reg61 : wire29) << reg47) ?
                      (|$unsigned(reg39)) : (^reg64)) : reg38)})
            begin
              reg67 <= $signed((($unsigned($signed(wire33)) >= (!(^reg47))) ?
                  ($unsigned(wire21) ?
                      (~|((8'hbc) ?
                          (8'haa) : wire22)) : wire19[(1'h1):(1'h0)]) : (~reg49)));
              reg68 <= (!(($signed($signed(reg43)) <= (|(reg56 ?
                      wire27 : reg62))) ?
                  $unsigned((8'hb7)) : $unsigned((~reg61[(5'h12):(1'h1)]))));
              reg69 <= $signed(wire21);
              reg70 <= (reg45[(3'h6):(1'h1)] ?
                  (({reg51[(2'h2):(1'h1)],
                      reg37} != (-wire29[(2'h2):(1'h1)])) ^ $unsigned(reg47[(1'h1):(1'h1)])) : ($signed(((+reg25) ?
                          $unsigned(reg42) : reg45)) ?
                      ({$signed(wire17)} >> reg47[(2'h3):(1'h1)]) : $signed(reg45)));
            end
          else
            begin
              reg67 <= reg56[(3'h5):(3'h5)];
              reg68 <= reg47[(3'h7):(3'h4)];
            end
        end
      else
        begin
          reg62 <= (&reg53[(3'h7):(3'h6)]);
          reg63 <= (($unsigned($signed($signed(reg59))) ?
                  {wire32[(1'h0):(1'h0)], (^~(reg63 == reg48))} : (-((reg62 ?
                      reg50 : reg65) ^~ $unsigned(reg43)))) ?
              $signed({$signed($unsigned(reg44))}) : (~($signed((!reg24)) ?
                  ((!(8'hb3)) >>> reg68) : (reg63 < wire31))));
          reg64 <= ((reg69 | {reg26, $signed(reg57)}) <= (reg53 ?
              {(~&(~^reg52))} : reg48[(2'h3):(2'h3)]));
          reg65 <= (8'ha9);
          if ((&$unsigned($signed(reg38))))
            begin
              reg66 <= reg54;
              reg67 <= (reg51[(1'h1):(1'h1)] == $unsigned((!wire31)));
              reg68 <= reg39[(3'h5):(1'h0)];
            end
          else
            begin
              reg66 <= (reg37[(1'h1):(1'h1)] || ((!((reg39 ?
                  reg65 : reg56) & reg25)) & $unsigned(reg67[(1'h1):(1'h1)])));
              reg67 <= $signed(((((+wire34) ?
                      (-reg65) : reg60) << reg41[(4'h9):(2'h2)]) ?
                  wire36[(1'h0):(1'h0)] : $unsigned(($unsigned((8'ha6)) ?
                      (8'hac) : $signed(reg60)))));
              reg68 <= ((reg44 ?
                      $unsigned(($signed(reg26) ?
                          $signed(reg64) : (^~reg44))) : reg57[(2'h2):(1'h0)]) ?
                  $unsigned(({reg60, $signed(reg58)} ?
                      {wire17[(4'ha):(3'h7)],
                          {reg40,
                              reg46}} : $unsigned((!reg40)))) : ($signed((reg40[(5'h10):(3'h4)] ?
                          (8'hb5) : (reg61 ? wire36 : reg53))) ?
                      $unsigned($signed($signed(reg65))) : (!($signed(reg63) <= reg26[(1'h1):(1'h0)]))));
              reg69 <= (8'hbc);
              reg70 <= ((8'hae) >= {{{(reg69 ? reg56 : reg41)},
                      reg37[(3'h4):(3'h4)]},
                  wire19});
            end
        end
    end
  assign wire71 = {(-(reg67[(1'h0):(1'h0)] >>> (reg53 ?
                          reg54[(1'h0):(1'h0)] : (reg24 ? (8'hbb) : reg39))))};
  assign wire72 = $signed((~|{reg67}));
  assign wire73 = reg47;
  always
    @(posedge clk) begin
      reg74 <= $unsigned($unsigned($signed((-(reg23 ? wire72 : reg66)))));
      reg75 <= $unsigned(wire17);
      reg76 <= reg38[(5'h14):(1'h1)];
      reg77 <= $signed($unsigned(($signed(wire18) ?
          wire34 : (reg70[(1'h1):(1'h0)] > (reg53 ? wire28 : reg37)))));
    end
  module78 #() modinst106 (.clk(clk), .wire81(reg23), .y(wire105), .wire79(reg48), .wire80(wire18), .wire82(reg50));
  assign wire107 = reg67[(3'h7):(1'h1)];
endmodule

module module78
#(parameter param104 = ((((8'hab) < {(+(8'ha2)), (&(8'hbe))}) < ((((8'ha4) ? (8'hb6) : (8'had)) ? ((8'ha8) ? (8'hb9) : (8'hab)) : ((8'hb4) ? (8'hbc) : (8'ha6))) ? (~{(8'hb9)}) : ({(8'hbc)} == {(8'hb1)}))) ? (((~&{(8'ha1)}) + ((~&(8'h9f)) || {(8'ha4), (7'h41)})) ? ((((8'hb7) != (8'hb1)) ? ((8'ha5) * (8'ha3)) : ((8'hb4) ? (8'h9c) : (8'ha7))) > ({(8'ha0)} ? ((8'hb5) ? (8'hb0) : (8'ha7)) : ((8'ha1) ? (8'h9e) : (8'hbb)))) : (((^(8'ha7)) ? ((8'hb4) ? (7'h43) : (7'h43)) : ((8'hb1) || (8'ha0))) ~^ ({(7'h44), (8'hab)} <<< ((7'h40) ? (8'hb1) : (8'hb7))))) : (^((((8'hb3) ~^ (8'hb5)) && ((8'hb0) ? (8'hae) : (8'ha7))) & (((8'h9d) || (8'hb5)) + {(8'hbf), (8'ha1)})))))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire82;
  input wire signed [(4'h8):(1'h0)] wire81;
  input wire [(4'he):(1'h0)] wire80;
  input wire [(2'h3):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire99;
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
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
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg83 <= (^~(~|((8'hb6) ?
          (~&(wire80 ? wire79 : wire80)) : ($unsigned(wire80) <= (wire79 ?
              wire82 : wire80)))));
      if ((((+(wire79[(1'h1):(1'h0)] >> wire82[(4'he):(4'hd)])) ?
              (wire81 ?
                  $signed(wire81[(3'h7):(1'h1)]) : (wire79[(2'h3):(2'h3)] <= $signed((8'hac)))) : $signed($signed((~&wire79)))) ?
          ((((wire82 != wire79) ?
              reg83 : (wire79 ? reg83 : reg83)) * wire79) >= (({wire80,
              reg83} > (8'ha0)) & ($signed((8'hbd)) >> ((8'ha4) << wire81)))) : (&(-wire80[(3'h7):(1'h0)]))))
        begin
          if ($signed(($unsigned((wire79 ?
                  (reg83 ^~ wire82) : (reg83 * wire80))) ?
              wire79[(1'h1):(1'h1)] : reg83)))
            begin
              reg84 <= $signed(({(((8'hb7) ? wire81 : wire79) ?
                          ((8'hb7) ? wire79 : wire82) : (reg83 ?
                              wire81 : reg83))} ?
                  wire79 : $signed($signed(reg83))));
              reg85 <= wire82;
              reg86 <= reg84;
              reg87 <= (|(reg84 >>> {wire82[(4'h8):(3'h4)]}));
            end
          else
            begin
              reg84 <= (wire81[(3'h4):(3'h4)] >= (8'hac));
              reg85 <= wire80[(4'hd):(3'h6)];
              reg86 <= {(~^(&wire81)),
                  $unsigned((({reg84, wire80} | $unsigned(wire79)) ?
                      $signed((reg83 ?
                          wire80 : wire81)) : ((wire80 * reg84) >= (reg83 <= wire79))))};
              reg87 <= (+$unsigned($signed(reg87[(3'h5):(3'h4)])));
              reg88 <= reg84[(4'h8):(2'h3)];
            end
          if ((~^{$unsigned($signed($unsigned(reg88)))}))
            begin
              reg89 <= reg86;
              reg90 <= ($signed({$unsigned((~|reg88)),
                  ($unsigned(wire81) ?
                      $signed(reg89) : (reg83 ? reg89 : wire79))}) || wire82);
            end
          else
            begin
              reg89 <= (|(8'hbb));
              reg90 <= wire82;
            end
          if (reg89[(1'h1):(1'h0)])
            begin
              reg91 <= $signed((($signed((^reg89)) ?
                      ({reg83,
                          reg87} ^~ $unsigned(reg89)) : $signed($unsigned(reg89))) ?
                  reg83[(1'h0):(1'h0)] : $unsigned({$signed(reg87)})));
            end
          else
            begin
              reg91 <= $signed(reg89[(1'h1):(1'h0)]);
              reg92 <= ((reg88[(3'h6):(2'h2)] == $unsigned((&(^~reg86)))) ?
                  $unsigned(($signed(reg87) ?
                      $unsigned(reg87) : (wire82[(4'hc):(4'h9)] ?
                          (reg85 >>> (8'ha7)) : (reg87 - reg86)))) : ((|((|wire80) * (^reg83))) ?
                      $signed((~|wire80)) : wire82));
            end
          reg93 <= (^((8'hb8) || (-(wire80[(4'ha):(3'h4)] ?
              ((8'ha3) ~^ (8'haa)) : (~&wire82)))));
          reg94 <= ($signed({((~reg84) ? $signed(wire79) : $unsigned(wire81)),
              $signed($signed(reg89))}) < reg90[(1'h1):(1'h1)]);
        end
      else
        begin
          if ((reg87[(1'h0):(1'h0)] <= {(({(8'ha7)} * $unsigned(reg85)) == $signed({wire82,
                  reg91})),
              $unsigned(reg84[(2'h3):(2'h3)])}))
            begin
              reg84 <= (($signed(wire81) ?
                  ((^$signed(wire79)) ?
                      (7'h44) : $signed({wire82})) : (&$signed(wire79[(2'h3):(1'h1)]))) ~^ ((reg92 ?
                  reg89 : $signed(reg83)) << reg91[(3'h7):(1'h0)]));
            end
          else
            begin
              reg84 <= reg91;
            end
          reg85 <= $unsigned(reg90);
        end
      reg95 <= (wire79[(2'h2):(2'h2)] ?
          (~|$unsigned(reg91[(3'h6):(2'h2)])) : wire80[(1'h1):(1'h0)]);
      reg96 <= (~^{$signed(((&reg93) > $unsigned(wire80)))});
      if ($unsigned({$unsigned((~$unsigned((8'h9c))))}))
        begin
          reg97 <= reg92;
          reg98 <= {wire79};
        end
      else
        begin
          reg97 <= $unsigned((($signed(reg90) ?
              $unsigned(reg91) : $signed($signed(reg90))) <= (~|(reg92[(4'hc):(3'h5)] ^ (~reg84)))));
        end
    end
  assign wire99 = reg86[(4'hf):(4'he)];
  assign wire100 = $signed(wire81[(3'h4):(2'h3)]);
  assign wire101 = (reg93[(2'h3):(1'h0)] <= reg83);
  assign wire102 = (8'ha9);
  assign wire103 = $signed((|(~|$signed($unsigned(wire79)))));
endmodule
