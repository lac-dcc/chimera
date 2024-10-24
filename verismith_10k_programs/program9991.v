module top
#(parameter param105 = ((((8'hb1) * ((&(8'ha7)) ? (^~(8'hbc)) : ((8'ha5) ? (8'hb2) : (8'h9d)))) ~^ ((((8'hb3) ? (8'hbf) : (8'hb6)) << {(8'hac)}) ? ((&(8'ha4)) != ((8'ha0) <<< (8'ha1))) : {((8'h9e) ? (8'hba) : (8'h9d)), (~&(8'hbe))})) ? ((^~((~(8'hb5)) ? (&(8'hbd)) : (&(7'h43)))) ? (^~{(~|(8'hb0))}) : ({((8'hb8) ? (8'hb2) : (8'hb2))} ^ (((8'hb1) >>> (8'hb4)) ? {(8'hbe), (8'hba)} : ((8'ha7) >>> (8'ha3))))) : (+(|({(8'ha6), (8'h9c)} ? (^(8'hae)) : (~|(7'h43)))))), 
parameter param106 = ({((((8'hac) ? param105 : param105) ? (|param105) : (|param105)) >> param105)} ? ({(|((8'ha0) & param105)), (((8'h9f) ~^ (7'h40)) ? param105 : {param105})} || param105) : (8'hb0)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hea):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  assign y = {wire104,
                 wire102,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire12,
                 wire6,
                 wire5,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire5 = (wire2 ?
                     ($unsigned((wire2[(3'h4):(1'h0)] ?
                         $signed(wire0) : wire0)) ~^ $unsigned(wire3[(4'h8):(2'h2)])) : wire4[(4'h8):(3'h4)]);
  assign wire6 = (^$unsigned($unsigned($signed((&(8'hbe))))));
  always
    @(posedge clk) begin
      reg7 <= wire5;
      reg8 <= {(wire4 ?
              $signed({((8'h9e) <<< wire4),
                  (wire5 >>> wire5)}) : wire0[(4'h9):(3'h7)]),
          (!wire6[(4'h9):(1'h0)])};
      reg9 <= ($signed($signed($signed((wire0 ? wire0 : wire0)))) ?
          (^~reg8) : wire6);
      reg10 <= {(~&{$signed(wire5)})};
      reg11 <= $signed($signed($signed(reg9)));
    end
  assign wire12 = ($signed({$unsigned($unsigned((8'hb5))), $unsigned(reg8)}) ?
                      ((((wire5 ? wire4 : (8'h9f)) ?
                              (wire4 > reg7) : $signed(wire2)) ?
                          $unsigned((wire2 ^~ reg9)) : ((wire5 ?
                              wire6 : wire6) & (8'ha3))) <<< $signed($signed(reg8))) : {reg8[(3'h7):(3'h6)],
                          (&{(&wire1)})});
  always
    @(posedge clk) begin
      reg13 <= $unsigned(reg10);
      reg14 <= wire5;
      reg15 <= (~^(|$signed(($signed(wire6) ?
          ((7'h42) ? wire12 : wire6) : reg14))));
      reg16 <= $signed(reg15);
    end
  assign wire17 = $signed(((wire4[(4'he):(4'hb)] && ((^(8'had)) ?
                          (wire4 - wire3) : wire0[(4'h9):(1'h0)])) ?
                      reg11 : wire2[(3'h6):(3'h6)]));
  assign wire18 = wire5;
  assign wire19 = $unsigned($unsigned($signed($signed({reg10, reg8}))));
  assign wire20 = $unsigned($signed(((~&(wire3 ? reg15 : reg7)) ?
                      {$unsigned(wire5)} : $signed($signed(wire6)))));
  module21 #() modinst103 (wire102, clk, reg9, wire6, reg11, wire3, reg14);
  assign wire104 = (^$unsigned(($unsigned(reg13) >= {(^wire4),
                       (reg15 - (8'ha2))})));
endmodule

module module21
#(parameter param100 = (((&(((8'ha3) || (8'h9f)) ? ((8'hbe) ? (8'hb0) : (8'hb5)) : ((8'h9e) ^~ (8'h9e)))) <= ((|(+(8'ha3))) && {{(8'hac)}, (~(8'ha7))})) ? {(^~(^~((8'hb7) ? (8'h9e) : (7'h42)))), ({((8'hb0) ? (8'hb1) : (8'ha8)), ((7'h42) * (7'h43))} * (((8'hb9) ^~ (8'ha2)) ? {(7'h44)} : (|(8'ha7))))} : {{{((7'h44) ~^ (8'hb3))}}}), 
parameter param101 = ({(8'ha6), param100} >>> ({(8'had), ((param100 * (8'h9c)) ? (param100 ? (8'hbc) : param100) : (param100 ? param100 : (8'ha0)))} >> (((~|param100) ? {param100, param100} : (param100 || param100)) - (-(param100 ? param100 : (8'hbe)))))))
(y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(5'h10):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire98;
  wire signed [(4'h8):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire66;
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire96,
                 wire68,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire66,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire27 = wire24;
  assign wire28 = (wire25[(4'h8):(3'h6)] * wire26[(1'h0):(1'h0)]);
  assign wire29 = $unsigned(($unsigned(wire23) & $unsigned(wire26[(2'h3):(2'h2)])));
  assign wire30 = (~&((~|(wire29 ?
                      {wire25, wire28} : wire28[(4'hc):(4'h8)])) ^~ wire27));
  always
    @(posedge clk) begin
      reg31 <= wire27;
      reg32 <= $unsigned($signed(wire22[(1'h1):(1'h1)]));
      reg33 <= (($signed($signed(wire24[(2'h3):(2'h2)])) ?
              (~^{$signed((8'h9c))}) : ((8'ha5) <<< {(8'haf), (8'h9c)})) ?
          reg31[(1'h0):(1'h0)] : (wire29[(3'h5):(3'h5)] > reg31[(2'h3):(1'h0)]));
    end
  assign wire34 = (|reg32);
  assign wire35 = wire26[(2'h2):(2'h2)];
  assign wire36 = $unsigned(wire29);
  assign wire37 = ((~|reg33[(2'h3):(1'h0)]) ?
                      {(wire27 || (!$signed(reg33))),
                          (($signed(wire36) * reg31[(1'h0):(1'h0)]) ?
                              wire27 : wire30[(2'h3):(1'h0)])} : wire29[(3'h6):(1'h0)]);
  assign wire38 = $unsigned($unsigned(({wire22, (wire28 ? (8'h9d) : (8'hb9))} ?
                      $unsigned(wire36[(4'h8):(1'h0)]) : wire28[(1'h0):(1'h0)])));
  assign wire39 = wire30[(1'h0):(1'h0)];
  module40 #() modinst67 (.y(wire66), .wire41(reg32), .wire42(wire26), .wire43(wire27), .clk(clk), .wire44(wire30));
  assign wire68 = $signed(((^wire34) <= (~&(8'ha8))));
  module69 #() modinst97 (.wire70(wire22), .wire71(reg31), .clk(clk), .wire74(wire38), .y(wire96), .wire73(wire28), .wire72(wire30));
  assign wire98 = {(^((+wire39) ?
                          ((wire37 ?
                              wire28 : wire24) >>> wire25[(3'h6):(3'h4)]) : ((reg33 ?
                              reg33 : wire23) & (wire35 ? wire36 : wire38)))),
                      $unsigned(wire39)};
  assign wire99 = (((|$signed((wire66 && (8'ha1)))) ?
                      $unsigned($unsigned((wire35 ?
                          wire22 : wire36))) : ({wire25[(3'h6):(3'h4)]} ?
                          $unsigned((wire30 ? wire23 : reg33)) : ((&wire30) ?
                              (-(7'h41)) : wire39))) << $signed($unsigned((|wire22[(3'h5):(3'h5)]))));
endmodule

module module69  (y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire74;
  input wire [(5'h11):(1'h0)] wire73;
  input wire signed [(4'hd):(1'h0)] wire72;
  input wire [(2'h3):(1'h0)] wire71;
  input wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(4'hd):(1'h0)] wire92;
  wire [(4'h8):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire75;
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire86,
                 wire85,
                 wire84,
                 wire75,
                 reg87,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire75 = $unsigned((&($unsigned($signed(wire73)) ?
                      ({wire74, wire72} | (wire74 != wire73)) : ({wire73,
                              wire73} ?
                          {wire71, wire74} : (wire72 >= (8'hbb))))));
  always
    @(posedge clk) begin
      reg76 <= {((((+wire75) ~^ wire73) ?
                  $unsigned($unsigned(wire71)) : (wire72[(3'h5):(3'h5)] ?
                      wire72[(4'h8):(2'h2)] : wire75[(2'h2):(2'h2)])) ?
              $unsigned((~&$signed(wire71))) : $signed({wire71,
                  (wire73 & wire70)}))};
      if (($unsigned({((^~wire72) + (wire75 ? wire74 : wire72)),
              $unsigned(wire72[(4'hc):(4'ha)])}) ?
          ($signed((-$signed(reg76))) ?
              (($unsigned(wire74) ? $unsigned(wire75) : (wire71 < (8'hb8))) ?
                  reg76 : $unsigned($unsigned(wire70))) : $unsigned($unsigned((wire75 - wire74)))) : $signed(({(wire75 == reg76)} ?
              $unsigned(wire71[(2'h3):(2'h2)]) : {(reg76 ? wire73 : reg76),
                  $unsigned(wire73)}))))
        begin
          reg77 <= ($signed(($signed((~&wire71)) ?
              reg76 : ($signed((8'hb1)) ?
                  $signed(wire71) : (wire71 & (8'hb2))))) >> (((wire72 ~^ wire72[(1'h1):(1'h0)]) ?
                  $unsigned((wire74 || reg76)) : ($unsigned(wire70) && $signed(wire73))) ?
              $unsigned(wire73[(2'h3):(1'h1)]) : wire73[(4'hf):(4'hc)]));
          reg78 <= ((~|{{wire72[(4'ha):(4'ha)]}, $unsigned(wire72)}) ?
              wire73 : ((({wire73} ? wire75 : {wire74}) ?
                  wire70[(1'h1):(1'h1)] : ((-wire75) <= (wire71 ?
                      wire71 : (8'hac)))) && $unsigned(((reg76 <<< wire73) & $signed(wire70)))));
          reg79 <= wire75[(1'h0):(1'h0)];
        end
      else
        begin
          if ((wire72[(4'hb):(4'h9)] ?
              $unsigned(((~(^~wire71)) ?
                  wire72 : wire71[(2'h2):(2'h2)])) : ((reg77 || ((!reg76) + wire73)) ?
                  reg79[(1'h0):(1'h0)] : (((reg77 ? wire72 : wire71) ?
                          (reg77 + wire70) : $unsigned((8'hb6))) ?
                      wire74[(5'h13):(4'hb)] : (~&$signed(wire73))))))
            begin
              reg77 <= $signed($unsigned($signed(((&(8'hba)) ?
                  (wire70 ? reg77 : (8'ha2)) : wire75[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg77 <= wire73[(2'h3):(2'h2)];
              reg78 <= {(8'hac), $signed({reg78[(1'h0):(1'h0)]})};
            end
          reg79 <= wire71;
          reg80 <= $unsigned((8'hbb));
          reg81 <= (+{reg80, $signed(wire74)});
          reg82 <= $signed(((~|{$signed(reg79)}) ?
              $signed($unsigned(reg80[(1'h1):(1'h1)])) : ($unsigned($unsigned(wire73)) ?
                  {(reg77 ? wire73 : wire73)} : reg76[(1'h1):(1'h0)])));
        end
      reg83 <= (((($signed(wire73) != (^~wire73)) | $signed(wire73[(4'hb):(2'h3)])) ^~ $unsigned(wire74)) ?
          $signed((~&{reg81, (wire71 ^ (8'hbd))})) : (-reg78));
    end
  assign wire84 = reg81[(3'h4):(1'h1)];
  assign wire85 = reg81;
  assign wire86 = ((8'ha2) ? $unsigned(wire72) : (~|(~|wire75[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg87 <= $unsigned(reg81);
    end
  assign wire88 = ({$signed(reg76[(1'h1):(1'h1)])} | ($unsigned($signed($signed(wire73))) ?
                      (((wire71 <<< reg83) ?
                              {wire73, wire70} : $unsigned(reg82)) ?
                          ((^~reg81) ?
                              $signed(wire70) : $unsigned(wire71)) : (!wire73)) : $unsigned({$unsigned(reg79),
                          $unsigned((8'ha5))})));
  assign wire89 = {$unsigned({(~^((7'h42) ? reg76 : reg76)),
                          $unsigned((reg79 ? reg77 : wire70))})};
  assign wire90 = $signed({(reg87 ?
                          ((wire72 ? wire73 : wire73) ?
                              wire89[(3'h6):(3'h5)] : $unsigned(wire74)) : (wire72 == (~(8'ha3)))),
                      ((reg87[(1'h1):(1'h1)] ?
                              (reg83 << wire71) : $signed((8'hba))) ?
                          reg83[(4'hb):(3'h7)] : (~&(+(7'h42))))});
  assign wire91 = (8'hb1);
  assign wire92 = $signed(((!wire86) ?
                      wire70 : (((wire86 >> wire75) * (8'hbb)) * {{wire73},
                          (wire89 ? reg77 : wire91)})));
  assign wire93 = {(+wire74[(4'h9):(2'h3)]),
                      {(+($unsigned(wire70) ?
                              wire72[(4'hc):(3'h6)] : $unsigned(wire91))),
                          ($unsigned(reg83[(1'h0):(1'h0)]) ?
                              reg87 : ($unsigned(reg81) ?
                                  {reg78, wire74} : $signed(wire91)))}};
  assign wire94 = reg77;
  assign wire95 = (~^reg76[(2'h3):(2'h3)]);
endmodule

module module40
#(parameter param65 = (((~&{((8'had) ? (8'hb7) : (8'hbd)), (+(8'hb6))}) >>> (~&((~^(8'hbc)) == ((8'hb4) ? (8'hb5) : (8'ha4))))) ^ ({({(7'h41)} >= (~(8'ha2)))} ^~ (^~(((8'ha6) & (8'ha2)) != {(8'ha0), (8'hac)})))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire44;
  input wire signed [(4'hc):(1'h0)] wire43;
  input wire [(3'h4):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire60,
                 wire47,
                 wire46,
                 wire45,
                 reg62,
                 reg61,
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
                 (1'h0)};
  assign wire45 = wire43;
  assign wire46 = wire43[(3'h4):(2'h3)];
  assign wire47 = $unsigned($unsigned((|wire46)));
  always
    @(posedge clk) begin
      reg48 <= {wire45,
          {$signed(({wire42} ? $unsigned(wire45) : (wire44 ? wire47 : wire44))),
              $unsigned((((8'hb2) - wire41) ? ((8'h9c) | wire45) : wire43))}};
      reg49 <= (^~{(wire41 < $unsigned($signed(wire47)))});
      reg50 <= wire47[(1'h0):(1'h0)];
      if ((8'ha1))
        begin
          reg51 <= (|(wire45 ?
              (~&$signed({wire43})) : (((8'hb1) > {wire43, (8'hab)}) ?
                  ((^~wire45) ?
                      wire47[(2'h2):(1'h1)] : $signed(wire47)) : ($unsigned(reg50) && (^~wire41)))));
          reg52 <= ($signed((($unsigned((8'ha5)) ?
                  (^wire45) : reg50[(3'h4):(1'h0)]) ?
              $signed((wire43 | wire45)) : $signed(reg51[(4'hb):(3'h4)]))) <<< (($unsigned($unsigned(wire44)) >= $signed($signed(wire41))) >= $unsigned((reg49[(3'h5):(2'h3)] ?
              $signed(reg48) : $signed(reg48)))));
        end
      else
        begin
          reg51 <= ($signed((|wire46[(4'h9):(2'h3)])) >= $unsigned((wire47[(2'h2):(1'h0)] << {$unsigned((8'hb8))})));
          reg52 <= $unsigned((wire43 ? wire46 : wire46[(4'he):(3'h5)]));
          reg53 <= reg48[(5'h11):(5'h11)];
          if (($signed(reg50[(2'h2):(2'h2)]) ?
              wire41[(3'h7):(3'h6)] : ({(-$signed(wire44))} ^~ (^~((reg49 ?
                      wire44 : wire46) ?
                  $signed(wire45) : (~^reg49))))))
            begin
              reg54 <= reg49;
              reg55 <= $unsigned(wire41[(3'h7):(1'h1)]);
              reg56 <= (&wire42);
              reg57 <= {(wire41 <= (reg50[(2'h2):(2'h2)] ?
                      (8'hb7) : (reg55[(1'h0):(1'h0)] + reg55)))};
            end
          else
            begin
              reg54 <= wire46;
              reg55 <= wire41[(2'h2):(2'h2)];
              reg56 <= wire43[(4'ha):(3'h5)];
              reg57 <= ((~^$signed(reg52[(4'h9):(3'h7)])) <<< (wire46[(1'h1):(1'h1)] <<< {wire42}));
              reg58 <= $unsigned((reg49[(2'h3):(1'h1)] & $unsigned(reg51)));
            end
          reg59 <= $signed((^~$unsigned(reg54)));
        end
    end
  assign wire60 = wire43[(3'h7):(3'h5)];
  always
    @(posedge clk) begin
      reg61 <= $unsigned(reg53);
      reg62 <= $unsigned(wire60[(4'hc):(4'h8)]);
    end
  assign wire63 = $unsigned(($unsigned(wire45[(5'h12):(4'he)]) ?
                      reg48 : wire41));
  assign wire64 = ((&wire45[(3'h6):(1'h0)]) ? wire60 : reg52);
endmodule
