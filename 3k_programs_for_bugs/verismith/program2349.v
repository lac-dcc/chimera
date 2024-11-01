module top
#(parameter param92 = (^~{((8'hb3) < ((|(8'ha0)) < (^~(8'ha0)))), (+(((8'hbb) ? (8'h9e) : (8'ha8)) ? ((8'h9d) >> (8'hb8)) : ((8'hba) > (8'ha1))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(2'h3):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire86;
  assign y = {wire91, wire90, wire89, wire88, wire4, wire86, (1'h0)};
  assign wire4 = wire3;
  module5 #() modinst87 (wire86, clk, wire2, wire4, wire0, wire3, wire1);
  assign wire88 = wire86[(4'h8):(2'h3)];
  assign wire89 = {((((wire1 ? wire2 : wire1) ?
                              $signed((8'h9f)) : wire4[(1'h1):(1'h0)]) ?
                          (+(wire1 ?
                              wire3 : wire88)) : wire4[(4'hd):(4'ha)]) || $unsigned($signed($signed(wire88))))};
  assign wire90 = (~&$signed((^~$signed((wire0 ^~ (8'ha1))))));
  assign wire91 = ((wire3[(3'h7):(1'h1)] <<< ((~|(!wire2)) | ($signed(wire86) ?
                          wire90[(1'h1):(1'h0)] : (wire3 <= wire90)))) ?
                      wire90[(1'h0):(1'h0)] : (wire88 ?
                          $signed((wire89[(2'h2):(2'h2)] ~^ (wire90 > wire4))) : ($signed((8'ha3)) ?
                              $unsigned($unsigned(wire89)) : wire1)));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire36;
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  assign y = {wire85,
                 wire79,
                 wire78,
                 wire76,
                 wire39,
                 wire38,
                 wire36,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  module11 #() modinst37 (wire36, clk, wire10, wire8, wire6, wire7);
  assign wire38 = $signed(wire36[(4'h9):(3'h5)]);
  assign wire39 = {({(+(8'hbe))} ?
                          {(7'h42)} : (wire9[(2'h2):(1'h0)] ?
                              (~|(wire8 || (8'hb1))) : {$unsigned(wire8)}))};
  module40 #() modinst77 (wire76, clk, wire36, wire10, wire7, wire8);
  assign wire78 = {wire9};
  assign wire79 = (!wire6[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg80 <= (~wire10);
      reg81 <= (wire7[(4'hc):(4'h8)] <= $unsigned($signed(wire7)));
      reg82 <= ($signed($signed({{wire76, wire78}})) ?
          (8'ha1) : (!(wire79 ? wire6[(1'h1):(1'h0)] : reg81)));
      reg83 <= $signed(reg80);
      reg84 <= ($signed(((8'ha5) >>> (^~wire9))) & wire10[(5'h12):(4'h9)]);
    end
  assign wire85 = (reg82 ?
                      $signed($signed({(reg80 || wire39),
                          reg81[(1'h1):(1'h1)]})) : ((^(^wire76)) ?
                          ($signed(wire10) ?
                              ($signed(wire79) ?
                                  wire38 : $unsigned(wire9)) : (wire76 ?
                                  $signed(wire38) : (wire78 <= wire76))) : reg80));
endmodule

module module40
#(parameter param75 = ((+((^(+(8'hb0))) ? (((8'ha3) >= (8'hbb)) ~^ {(8'hae), (8'hb1)}) : (~|{(8'hbf), (8'hb2)}))) <<< ((~|((~&(8'hba)) ? ((8'hae) ? (8'hb0) : (8'ha7)) : ((8'hbd) ? (8'ha0) : (8'hb5)))) ? {(|((8'hac) != (8'ha3)))} : (8'hbe))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire44;
  input wire [(3'h5):(1'h0)] wire43;
  input wire signed [(4'hb):(1'h0)] wire42;
  input wire [(5'h13):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire74;
  wire [(3'h6):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  assign y = {wire74,
                 wire67,
                 wire66,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
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
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire45 = $unsigned(wire42);
  assign wire46 = ($unsigned((~^(-wire41[(4'ha):(1'h0)]))) ?
                      (wire45[(3'h6):(3'h5)] * $signed({$unsigned(wire45),
                          {wire42, wire44}})) : (~wire45));
  assign wire47 = $signed($signed(({$signed(wire45)} | wire46[(4'ha):(3'h5)])));
  assign wire48 = (&(wire47 ?
                      {(wire44 ?
                              (wire44 > wire41) : (wire42 ?
                                  (8'hbc) : wire46))} : (|($signed(wire44) ?
                          $unsigned(wire42) : (wire42 ? wire41 : wire43)))));
  assign wire49 = wire41[(5'h12):(5'h12)];
  always
    @(posedge clk) begin
      reg50 <= (wire44 ? $unsigned(wire48) : wire48);
    end
  always
    @(posedge clk) begin
      if ($signed((($signed({wire44, wire46}) ?
          $signed((wire47 ?
              wire41 : wire43)) : reg50[(4'hf):(4'he)]) ~^ wire49)))
        begin
          reg51 <= (^(~^(~&$signed((wire44 ? reg50 : wire43)))));
          reg52 <= $unsigned(wire47);
          reg53 <= ((wire45 ?
              $signed($unsigned(wire45)) : {(wire49 ?
                      $signed(wire49) : (&wire41)),
                  wire44}) > $unsigned($signed({$unsigned(wire49), reg50})));
        end
      else
        begin
          reg51 <= $unsigned($unsigned(reg50[(4'hf):(4'hb)]));
          reg52 <= $unsigned(((^wire45) ?
              wire47[(3'h6):(3'h4)] : ((reg52[(4'he):(3'h6)] - wire49[(1'h1):(1'h1)]) ?
                  (^~$signed(wire42)) : ((&wire48) ?
                      wire41 : $unsigned(reg52)))));
          reg53 <= (wire42[(1'h1):(1'h0)] ?
              (8'ha7) : ($signed({(reg51 ? reg52 : wire43)}) || wire45));
          reg54 <= reg50[(4'h9):(3'h7)];
          reg55 <= wire41;
        end
      if ($unsigned((reg55[(1'h1):(1'h1)] != reg53[(1'h1):(1'h0)])))
        begin
          reg56 <= (-reg54);
          reg57 <= (wire47 ?
              {(reg54 ? wire41 : $unsigned((wire49 ? wire43 : (8'hba)))),
                  ($unsigned((reg56 ? wire42 : reg52)) ?
                      (wire49 ?
                          $unsigned(reg56) : (wire41 > (8'hb8))) : reg50)} : ({wire46,
                      wire43} ?
                  ($signed((wire42 ^~ reg55)) ?
                      $signed({(8'hb6),
                          wire49}) : ((wire43 < wire41) & (wire46 ?
                          wire41 : wire43))) : (~|reg55)));
        end
      else
        begin
          if ((|($unsigned((-reg53[(1'h1):(1'h1)])) ?
              $unsigned((~|$unsigned(reg55))) : wire43[(1'h1):(1'h1)])))
            begin
              reg56 <= {($signed(((wire46 >> reg53) <= {(8'hbd)})) ?
                      reg54 : ((&reg54) ?
                          ($unsigned(wire46) || (8'ha2)) : $unsigned(((8'h9f) == wire46)))),
                  ($unsigned($signed((~reg51))) - reg56)};
              reg57 <= wire47[(3'h5):(2'h3)];
              reg58 <= $signed(((((wire45 ? reg56 : reg55) | $signed(reg54)) ?
                  ((~^(8'hb8)) * wire47) : (&wire46)) ^ (!reg50[(4'hc):(4'h9)])));
              reg59 <= (-$signed(((&(wire41 ? reg51 : wire45)) ?
                  wire49[(1'h0):(1'h0)] : (wire45[(3'h6):(2'h3)] ^~ {(7'h43),
                      (8'haa)}))));
            end
          else
            begin
              reg56 <= (reg55[(2'h2):(1'h0)] >= wire46[(4'hd):(1'h1)]);
              reg57 <= $signed(reg54[(3'h4):(1'h0)]);
            end
          reg60 <= reg55[(1'h1):(1'h1)];
          reg61 <= $unsigned($unsigned(({(~&reg59)} < $signed((wire42 ?
              (8'hba) : reg60)))));
          reg62 <= (reg53 ? $unsigned((~(8'hbd))) : reg52);
          if ((8'ha9))
            begin
              reg63 <= reg50[(3'h6):(1'h0)];
            end
          else
            begin
              reg63 <= reg60;
              reg64 <= ((reg58 >> (((wire43 ^ reg54) & wire45[(3'h6):(3'h4)]) & $unsigned($signed(wire47)))) < reg63[(1'h1):(1'h0)]);
              reg65 <= $signed({($signed({reg50}) >= {((8'h9c) ~^ wire44),
                      $signed((8'h9f))}),
                  (|reg57[(2'h2):(1'h0)])});
            end
        end
    end
  assign wire66 = $unsigned($unsigned(reg57));
  assign wire67 = $unsigned(wire44);
  always
    @(posedge clk) begin
      if ($signed(reg51[(1'h0):(1'h0)]))
        begin
          reg68 <= $signed(wire45[(1'h0):(1'h0)]);
          reg69 <= $unsigned((&(((|reg55) | wire46) & $unsigned((wire47 > wire48)))));
          reg70 <= (+$unsigned(wire41));
        end
      else
        begin
          reg68 <= $signed((wire41[(5'h13):(4'hb)] ?
              (reg64 ?
                  wire46[(5'h12):(4'hb)] : ((wire49 >> reg70) ?
                      reg60[(3'h7):(2'h3)] : $unsigned(wire46))) : (~$unsigned(((8'hae) ?
                  reg69 : (8'ha8))))));
          reg69 <= (!reg65);
          reg70 <= $unsigned(wire47);
        end
      reg71 <= $signed($signed(wire45[(4'h9):(4'h9)]));
      reg72 <= $signed($signed((((|reg55) || {reg62,
          (8'ha0)}) - $unsigned((~|reg70)))));
      reg73 <= $unsigned(reg58);
    end
  assign wire74 = ($unsigned($unsigned((^~reg53))) ?
                      reg69[(5'h11):(4'h9)] : wire46[(4'hc):(3'h6)]);
endmodule

module module11
#(parameter param34 = {(({(~^(8'hb5)), ((7'h40) ? (8'hb1) : (7'h44))} - (((8'hb9) ? (8'h9f) : (8'hbc)) ? ((8'ha7) + (8'had)) : (~|(8'ha7)))) ? ((~&(-(8'ha5))) ^~ {((8'ha4) ? (8'h9d) : (8'hbb)), ((8'ha1) != (8'ha2))}) : (&(((8'ha5) ? (8'h9e) : (8'hb7)) + {(8'ha2)})))}, 
parameter param35 = param34)
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire15;
  input wire [(4'hb):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= ({wire14[(2'h3):(2'h3)]} >> $signed({((wire13 ?
                  wire13 : wire12) ?
              (wire12 ? wire12 : wire14) : $unsigned(wire12)),
          (~|(wire15 <<< wire13))}));
      if ((reg16[(1'h1):(1'h1)] ?
          $signed(({wire15, (wire12 ? wire14 : wire12)} & (+{wire15,
              (8'h9c)}))) : (|$unsigned($signed($unsigned(reg16))))))
        begin
          if (wire14)
            begin
              reg17 <= $signed(wire13);
              reg18 <= (wire13 ?
                  ((^(wire15[(4'hb):(3'h4)] ?
                          ((8'ha3) > wire12) : reg16[(2'h3):(2'h2)])) ?
                      $unsigned($unsigned($signed(wire13))) : $unsigned($signed($unsigned(reg17)))) : {(8'ha8),
                      $signed(wire15)});
              reg19 <= (&(!reg18));
              reg20 <= ($unsigned($signed(wire12[(3'h5):(1'h0)])) ?
                  $unsigned(($unsigned($signed(wire12)) >>> $signed($unsigned(wire14)))) : (wire14[(2'h2):(1'h1)] ?
                      ($signed((wire15 & wire13)) ?
                          ($signed((8'hbf)) ?
                              $unsigned(reg17) : reg16[(3'h4):(1'h0)]) : (wire12[(2'h2):(2'h2)] <= $unsigned(wire12))) : (reg17 * wire14)));
            end
          else
            begin
              reg17 <= (7'h40);
            end
          reg21 <= (7'h42);
          reg22 <= (!$signed((|(reg18 ?
              $unsigned(wire14) : $signed((8'h9e))))));
          reg23 <= reg16;
        end
      else
        begin
          reg17 <= $signed($unsigned(($signed({reg20}) || $signed((reg23 ?
              reg20 : reg16)))));
        end
      if (reg17[(2'h2):(2'h2)])
        begin
          reg24 <= (&({reg23, $unsigned((wire13 > reg18))} ?
              {$signed((wire12 > reg16)), $unsigned((+wire15))} : (^(8'ha5))));
          reg25 <= reg23[(3'h4):(1'h0)];
          reg26 <= (~|$signed((((~^reg18) ?
                  (wire12 < reg16) : wire15[(1'h1):(1'h1)]) ?
              reg23[(4'ha):(2'h2)] : reg17[(3'h5):(1'h0)])));
          if ((&($unsigned(((reg16 ? (8'hbe) : reg26) ?
              reg24 : (wire14 - reg24))) == (^(reg23 ?
              $unsigned(wire13) : (&reg22))))))
            begin
              reg27 <= (~|$signed(wire14[(3'h7):(1'h1)]));
              reg28 <= ((8'hb7) ?
                  {(((-reg19) <<< $unsigned(wire12)) >> ($unsigned((8'hbb)) | $unsigned(reg22))),
                      wire14} : $signed(reg23[(5'h10):(3'h7)]));
            end
          else
            begin
              reg27 <= (($signed(reg17[(1'h1):(1'h0)]) && (~|reg16[(3'h4):(2'h3)])) ?
                  wire15 : (^~(($signed(reg23) <= reg21) || (^(wire13 > reg19)))));
            end
        end
      else
        begin
          if (((($signed($unsigned(wire12)) ?
              reg16[(1'h0):(1'h0)] : (-(wire15 < reg17))) ^ (reg19[(3'h5):(3'h4)] ?
              $signed(wire15[(4'he):(4'hb)]) : $unsigned($signed(wire13)))) > reg18[(3'h4):(3'h4)]))
            begin
              reg24 <= reg24[(1'h1):(1'h1)];
              reg25 <= (^~($unsigned($signed((-reg20))) > reg17));
            end
          else
            begin
              reg24 <= $unsigned(reg22[(2'h2):(2'h2)]);
            end
          reg26 <= ($signed(($signed((reg24 ~^ reg26)) >>> reg22)) ?
              reg28 : wire14[(3'h6):(2'h2)]);
        end
    end
  assign wire29 = (^(~|$signed({reg22, $signed(wire12)})));
  assign wire30 = reg18[(5'h10):(4'ha)];
  assign wire31 = reg23[(4'hd):(3'h6)];
  assign wire32 = reg26[(3'h5):(3'h5)];
  assign wire33 = ($signed(reg16) ?
                      $unsigned($unsigned({(wire15 ? reg17 : reg27),
                          (reg16 ?
                              reg17 : wire31)})) : (((~|(^(8'hb6))) ^~ ($signed(reg18) >> (8'hb8))) ?
                          ((reg21 ? reg25 : reg28[(1'h0):(1'h0)]) ?
                              ({reg16} - (reg22 ?
                                  (8'h9e) : wire13)) : (-wire31[(4'hf):(4'hc)])) : ({$unsigned(wire12)} ?
                              wire32[(2'h2):(1'h1)] : ($signed(reg18) | reg22[(4'h9):(3'h4)]))));
endmodule
