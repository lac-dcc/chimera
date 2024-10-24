module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire12;
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire69,
                 wire12,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
      if (wire4[(1'h1):(1'h0)])
        begin
          reg5 <= $unsigned(wire4[(4'hd):(3'h6)]);
          reg6 <= (-$unsigned((wire2[(1'h1):(1'h0)] * $unsigned($signed(reg5)))));
          reg7 <= $unsigned(wire0);
          reg8 <= $unsigned({(wire1[(1'h0):(1'h0)] ^~ {$unsigned(reg7)}),
              $unsigned(((wire2 <= reg7) ^~ wire2))});
          reg9 <= $unsigned(wire0);
        end
      else
        begin
          if ((^(reg9 ?
              (^~((reg7 << wire1) * reg7[(1'h0):(1'h0)])) : ($signed((-reg8)) == $unsigned($signed(reg5))))))
            begin
              reg5 <= ({wire4, (8'h9e)} ?
                  $unsigned((~&reg5)) : (($signed(wire3) || (~&$signed(reg9))) ?
                      wire0 : (~^(^reg7))));
            end
          else
            begin
              reg5 <= ((&($unsigned({wire4}) < reg8[(1'h1):(1'h0)])) ?
                  wire4 : ($unsigned(({(8'h9d), reg8} ?
                      {(8'ha4), (8'hbf)} : (~reg7))) ^ ($signed((wire3 ?
                      reg9 : reg8)) > {wire0[(3'h5):(1'h1)], (reg8 ^ reg8)})));
              reg6 <= $unsigned(reg5);
              reg7 <= reg8[(4'ha):(2'h3)];
            end
          if ((^(reg8[(4'h8):(2'h2)] >= $unsigned((+$signed(reg8))))))
            begin
              reg8 <= reg5;
              reg9 <= (8'hbb);
            end
          else
            begin
              reg8 <= ($unsigned($signed((~&(reg7 >> (8'ha0))))) ?
                  $signed({({reg7} > (reg6 ? wire4 : wire3)),
                      (+(reg8 ?
                          reg5 : wire3))}) : $unsigned(reg6[(4'ha):(3'h6)]));
            end
        end
      reg10 <= {$unsigned(wire1)};
    end
  always
    @(posedge clk) begin
      reg11 <= $signed($signed((|(|reg7))));
    end
  assign wire12 = (8'ha5);
  module13 #() modinst70 (.clk(clk), .wire16(wire0), .wire14(wire2), .y(wire69), .wire17(reg6), .wire15(reg9));
  always
    @(posedge clk) begin
      if ($signed(wire3))
        begin
          if (reg6)
            begin
              reg71 <= wire12[(2'h2):(1'h0)];
              reg72 <= $signed((wire69[(2'h3):(1'h1)] - $unsigned((((8'haf) ?
                      wire69 : reg5) ?
                  $unsigned(reg5) : (+(7'h42))))));
              reg73 <= $signed((~wire69));
              reg74 <= (reg9 ?
                  $unsigned($signed((wire12[(1'h1):(1'h0)] ?
                      ((8'hb0) ?
                          reg9 : (8'hab)) : (wire4 | wire3)))) : ($signed((wire4 ~^ reg7)) ?
                      (~&reg9) : $unsigned(((+(7'h40)) < $signed(wire3)))));
              reg75 <= $unsigned((^~((-(~^wire1)) == $unsigned((reg73 & wire3)))));
            end
          else
            begin
              reg71 <= $unsigned((^~($signed((wire4 < reg6)) ^~ (((8'hab) ^~ wire12) ?
                  wire12 : $signed((8'hbf))))));
              reg72 <= {$signed((!((^~reg6) ?
                      (wire69 ? reg73 : wire3) : $unsigned(reg10)))),
                  {{((reg6 ^ wire3) * reg6[(3'h5):(2'h3)])}}};
            end
          reg76 <= {$unsigned(((|(&reg10)) ?
                  (~reg71[(3'h7):(1'h1)]) : ($unsigned(reg71) ^ $unsigned(reg11))))};
          reg77 <= (reg71 ?
              $unsigned($unsigned((!(8'h9c)))) : reg5[(4'hd):(4'ha)]);
        end
      else
        begin
          reg71 <= $signed(($signed(reg71) ~^ reg8));
          if (reg11)
            begin
              reg72 <= wire0;
              reg73 <= reg76[(4'h9):(3'h4)];
            end
          else
            begin
              reg72 <= wire12;
              reg73 <= reg5[(4'h8):(4'h8)];
              reg74 <= {$signed((8'hbe)),
                  {(reg9 ? $signed(reg11) : $unsigned($signed(wire3)))}};
              reg75 <= (reg72[(3'h5):(1'h1)] && (!(!((wire1 ? (8'ha6) : wire2) ?
                  reg5[(4'hc):(4'h9)] : (^~reg74)))));
            end
          reg76 <= $unsigned((&$signed(reg9)));
          reg77 <= wire4;
        end
      reg78 <= ((!(~($unsigned(reg74) ? (!(8'hb2)) : $unsigned((8'ha9))))) ?
          (^$signed($unsigned($unsigned(reg7)))) : wire2);
    end
  assign wire79 = $unsigned(wire69);
  assign wire80 = wire0[(4'ha):(3'h6)];
endmodule

module module13  (y, clk, wire14, wire15, wire16, wire17);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire67;
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  assign y = {wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire67,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 (1'h0)};
  assign wire18 = $unsigned((($unsigned((wire17 - wire16)) ?
                          ({wire17, wire15} ?
                              ((8'hb0) ?
                                  wire16 : wire14) : $unsigned((8'hae))) : $unsigned((wire16 == (7'h44)))) ?
                      wire17[(1'h0):(1'h0)] : wire17[(1'h1):(1'h0)]));
  assign wire19 = wire18;
  assign wire20 = $signed((|$unsigned((!$unsigned(wire19)))));
  assign wire21 = (wire16 != wire17[(2'h3):(1'h0)]);
  assign wire22 = {(((wire16 ? (8'hb3) : (&(8'ha6))) ?
                          {{wire16, (7'h41)},
                              wire19[(4'hf):(4'hd)]} : wire17[(2'h2):(2'h2)]) * wire21),
                      wire19};
  assign wire23 = $unsigned({wire20[(1'h1):(1'h1)]});
  assign wire24 = ($signed(wire17) + (~wire20));
  always
    @(posedge clk) begin
      reg25 <= ({$unsigned(({wire15} & (~wire15))), wire21} ^ (-wire24));
      reg26 <= wire21;
      reg27 <= wire17[(3'h5):(3'h4)];
      reg28 <= $signed((+wire20[(3'h6):(1'h0)]));
    end
  module29 #() modinst68 (wire67, clk, wire17, reg26, wire20, wire24);
endmodule

module module29
#(parameter param66 = ((|{(-(8'haa))}) ? (+((((8'ha4) ? (8'hae) : (8'hac)) || (|(8'hbd))) ? (((8'hb0) ~^ (8'had)) & ((8'hb5) - (8'ha7))) : {(+(7'h40))})) : {((((8'h9f) ? (8'hba) : (8'hb4)) ? ((8'h9d) <<< (8'h9e)) : ((8'h9d) ? (8'ha1) : (8'ha1))) ? {((7'h43) ? (7'h40) : (7'h40)), ((8'hb3) ~^ (8'ha5))} : (((7'h42) >>> (8'hb2)) ? {(8'hb1), (8'ha0)} : {(8'ha3)})), ((-((7'h40) ^~ (8'h9e))) | (8'ha0))}))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire33;
  input wire signed [(4'ha):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(3'h7):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire34;
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire46,
                 wire45,
                 wire34,
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
                 (1'h0)};
  assign wire34 = $signed((($unsigned((-wire31)) ~^ ((wire32 ^~ wire32) ?
                          $unsigned(wire31) : $unsigned(wire33))) ?
                      wire33 : wire32[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg35 <= ((&(((wire31 ?
          wire34 : wire33) || (~&wire33)) - (^wire32))) * $unsigned(wire34[(3'h6):(1'h1)]));
      if (((wire32[(3'h5):(3'h4)] ^ ((7'h44) * $signed((~&(7'h40))))) ?
          (^~wire34[(3'h5):(3'h4)]) : ((&wire30[(3'h6):(2'h3)]) << {wire32[(2'h2):(1'h1)],
              $unsigned($signed(wire30))})))
        begin
          if ((wire32[(3'h7):(3'h7)] ?
              wire34[(4'hd):(1'h1)] : $signed((~^$unsigned(reg35[(1'h0):(1'h0)])))))
            begin
              reg36 <= wire33[(3'h4):(3'h4)];
              reg37 <= $unsigned((+($signed(wire32) <<< reg36[(3'h4):(1'h1)])));
            end
          else
            begin
              reg36 <= (~^$signed(reg37));
              reg37 <= {$signed($unsigned((~$signed(reg37)))),
                  ((~|(|reg35[(3'h4):(1'h0)])) ?
                      (&$signed(reg36[(4'hc):(2'h3)])) : {$signed($signed(wire33)),
                          wire30[(3'h6):(3'h4)]})};
              reg38 <= (reg37[(2'h3):(1'h0)] - wire31[(1'h1):(1'h1)]);
              reg39 <= reg36[(1'h0):(1'h0)];
              reg40 <= $unsigned((-((reg38 ?
                  (8'hbf) : $signed(wire32)) - reg38[(2'h2):(2'h2)])));
            end
          reg41 <= reg36;
          reg42 <= reg40[(2'h3):(1'h0)];
        end
      else
        begin
          reg36 <= ((~((~|$unsigned(reg42)) > (~reg37))) <<< reg35[(1'h0):(1'h0)]);
        end
      reg43 <= (!(({$signed(reg40), $signed(wire34)} < (~|$signed(reg38))) ?
          ($signed((+reg35)) ?
              $unsigned(wire31) : reg42) : $unsigned($unsigned($signed(reg36)))));
      reg44 <= wire33;
    end
  assign wire45 = $signed((wire32[(3'h7):(2'h2)] ?
                      (8'hb1) : $unsigned((|(reg43 ? reg39 : reg43)))));
  assign wire46 = $unsigned($unsigned(reg42));
  always
    @(posedge clk) begin
      if (($unsigned((^~reg38)) - (!wire30)))
        begin
          reg47 <= (|(reg37 ?
              reg44 : $unsigned(((reg37 << reg44) ?
                  (reg38 ? (7'h44) : reg37) : $signed(reg36)))));
          reg48 <= (((+$signed((reg42 > reg38))) ~^ reg43) ?
              reg37[(2'h2):(1'h1)] : reg44);
          reg49 <= wire30[(3'h4):(2'h3)];
          reg50 <= {$signed($signed($unsigned((~&wire34))))};
          reg51 <= $unsigned(wire46[(1'h1):(1'h1)]);
        end
      else
        begin
          if ($signed($signed((^~(+(wire30 ? wire33 : wire34))))))
            begin
              reg47 <= wire45[(3'h5):(1'h0)];
              reg48 <= (wire32 ?
                  (wire30 ?
                      ($signed($signed(reg49)) || reg39) : $signed(reg42)) : {($signed((wire46 * wire32)) ?
                          reg39[(2'h2):(1'h0)] : $signed($unsigned(reg48))),
                      $unsigned($unsigned((reg43 ? reg36 : (7'h41))))});
            end
          else
            begin
              reg47 <= reg47[(1'h1):(1'h0)];
              reg48 <= (reg37[(1'h0):(1'h0)] ~^ wire33);
              reg49 <= reg37[(1'h1):(1'h0)];
              reg50 <= {$unsigned(reg42), reg48[(3'h6):(2'h2)]};
            end
          if (wire30)
            begin
              reg51 <= reg41;
              reg52 <= $unsigned((reg37 ?
                  (~&({wire45} ?
                      $signed(reg51) : (reg43 + reg35))) : $unsigned(wire32[(3'h7):(2'h3)])));
            end
          else
            begin
              reg51 <= $unsigned(wire31);
              reg52 <= (reg47[(2'h2):(1'h0)] <<< (~{$signed($signed((8'h9d))),
                  reg51[(2'h3):(2'h2)]}));
              reg53 <= (^(8'h9e));
            end
          reg54 <= $unsigned({(reg50[(4'he):(4'ha)] || ((reg41 * (8'ha8)) == {wire33,
                  wire34}))});
          reg55 <= (~&($unsigned(reg48) ?
              wire45[(1'h0):(1'h0)] : reg54[(4'ha):(4'ha)]));
          reg56 <= reg41[(2'h2):(2'h2)];
        end
    end
  assign wire57 = ((|((~(reg38 ?
                      reg38 : reg47)) ^~ {$signed(wire31)})) <= reg41);
  assign wire58 = reg44;
  assign wire59 = {(^~reg39), wire46};
  assign wire60 = wire33[(1'h1):(1'h1)];
  assign wire61 = $signed(wire46);
  assign wire62 = (((~|{$signed((8'hb6))}) ?
                          (wire32[(4'h8):(3'h6)] ?
                              ($signed((8'hbb)) ?
                                  $signed(reg36) : (~|reg52)) : (^wire60)) : wire59[(2'h2):(1'h1)]) ?
                      reg38[(1'h0):(1'h0)] : wire30[(4'h8):(3'h7)]);
  assign wire63 = ((wire33[(2'h2):(1'h0)] & ($unsigned(((8'ha0) ?
                          reg52 : wire60)) ?
                      wire30 : ((8'ha7) | wire60))) >= $signed((($unsigned((8'haa)) ?
                      reg56[(3'h5):(2'h2)] : $unsigned(wire45)) & wire60)));
  assign wire64 = wire46[(1'h0):(1'h0)];
  assign wire65 = reg41;
endmodule
