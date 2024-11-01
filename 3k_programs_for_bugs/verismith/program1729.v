module top
#(parameter param157 = ((((((8'ha1) == (8'ha0)) <<< ((8'haa) ? (8'hb3) : (8'h9d))) ? (-(!(7'h42))) : (((8'hb5) ? (8'h9c) : (8'haa)) ? ((8'hac) - (7'h42)) : (^~(8'hbe)))) <= (^~((!(8'hb6)) == ((7'h42) ~^ (8'hba))))) ? {(&(((8'ha7) != (8'ha9)) >> ((8'had) ~^ (8'hb4))))} : {((((8'hab) ? (8'ha5) : (8'hb6)) << (-(8'hb7))) + (&((8'ha4) >>> (8'hb5))))}), 
parameter param158 = (8'hb6))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h126):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire38;
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  assign y = {wire155,
                 wire60,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire38,
                 reg40,
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
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 (1'h0)};
  module5 #() modinst39 (.wire6(wire2), .wire9(wire3), .wire8(wire1), .y(wire38), .clk(clk), .wire7(wire4));
  always
    @(posedge clk) begin
      reg40 <= $signed((-wire0[(1'h1):(1'h0)]));
    end
  assign wire41 = $signed({$unsigned($unsigned(wire2))});
  assign wire42 = ((((^~(^~reg40)) || wire4[(4'hd):(3'h7)]) ?
                          wire38 : (^((~wire38) ?
                              $unsigned(wire2) : (wire3 * wire4)))) ?
                      {$signed(((wire41 ? wire4 : reg40) ^ (wire38 ?
                              wire4 : wire1)))} : wire38[(4'hd):(2'h3)]);
  assign wire43 = ((8'hb5) ^~ (wire38[(4'hd):(3'h5)] ?
                      (!(~wire41[(2'h2):(1'h1)])) : wire38[(4'hc):(4'hb)]));
  assign wire44 = (-(8'hac));
  assign wire45 = $signed({(~^wire0[(3'h4):(2'h2)]), wire38});
  assign wire46 = ($signed((~^wire3)) * (8'haf));
  always
    @(posedge clk) begin
      reg47 <= ({(~$signed(wire42[(4'hf):(4'hb)])), (|(8'hbb))} ?
          $unsigned(wire0[(2'h2):(1'h1)]) : reg40[(1'h1):(1'h1)]);
      reg48 <= $signed(((wire43[(3'h6):(1'h0)] | $signed((wire46 > wire2))) ?
          wire3 : {(^~wire1),
              ($signed((8'h9c)) << (wire38 ? wire42 : (8'h9e)))}));
      reg49 <= ($unsigned((-($signed(wire42) ?
          (reg40 == wire42) : wire42))) || (8'ha7));
      reg50 <= $unsigned({({{reg40, wire3}} ?
              {{wire42, reg49}, (-(8'ha3))} : wire0)});
      if ((~|(($signed($signed(wire2)) ?
          (~{wire42}) : (reg50 >>> (~&wire3))) * (~{$unsigned(wire41),
          wire0[(3'h5):(2'h3)]}))))
        begin
          reg51 <= wire4;
          reg52 <= $signed(reg50[(4'h9):(3'h4)]);
          reg53 <= (!wire0[(3'h6):(3'h6)]);
          if (wire1)
            begin
              reg54 <= ((~$unsigned($unsigned(wire38[(2'h2):(2'h2)]))) ?
                  $signed($unsigned(reg48)) : wire38[(3'h7):(2'h2)]);
              reg55 <= ((wire42[(1'h0):(1'h0)] && reg51[(4'ha):(2'h3)]) < ($unsigned(reg53[(3'h6):(1'h1)]) || $signed(wire3[(4'hd):(4'h8)])));
              reg56 <= (wire44[(2'h2):(1'h1)] ?
                  (($signed((&wire3)) ^~ ((^~wire42) != $signed((8'h9e)))) || (($unsigned((8'hb4)) <<< (8'hbf)) ?
                      wire41[(4'h8):(1'h0)] : $signed((reg50 >>> reg54)))) : wire41[(4'h8):(3'h6)]);
            end
          else
            begin
              reg54 <= wire43;
              reg55 <= ($unsigned((!((reg52 && wire2) == $signed(wire45)))) & $signed(($unsigned({wire43}) & (reg56 < wire41[(1'h0):(1'h0)]))));
              reg56 <= (+(8'h9d));
              reg57 <= reg52[(3'h7):(3'h5)];
              reg58 <= ((((reg55[(3'h4):(1'h0)] & wire42[(3'h5):(3'h4)]) ?
                      (~^$signed(wire44)) : $unsigned(wire2[(4'h9):(3'h6)])) ?
                  ($unsigned($signed(wire43)) ?
                      (-$unsigned(wire43)) : reg51) : ($unsigned({reg48}) - ({wire38,
                          reg51} ?
                      {(7'h43),
                          reg54} : (^wire44)))) + $unsigned(({wire45[(3'h7):(1'h0)]} <= $unsigned((reg52 ~^ wire2)))));
            end
          reg59 <= wire3;
        end
      else
        begin
          if (((&wire1[(3'h5):(2'h2)]) && $signed({($signed(wire3) ?
                  (wire2 & reg48) : (wire44 ? reg58 : wire38))})))
            begin
              reg51 <= $unsigned((^~$unsigned($signed(reg58[(3'h5):(1'h1)]))));
              reg52 <= $signed(($signed(((~|(8'hb6)) ?
                      $unsigned((8'hba)) : reg47[(4'h9):(2'h3)])) ?
                  reg40[(1'h0):(1'h0)] : $signed(wire3)));
            end
          else
            begin
              reg51 <= {((({wire43, wire43} ?
                          (wire41 && reg58) : reg54[(1'h0):(1'h0)]) ?
                      $signed((wire46 ?
                          reg40 : wire44)) : ($signed(reg55) | $unsigned(reg55))) || {$signed($unsigned(reg56))}),
                  reg57};
              reg52 <= wire0;
              reg53 <= wire3;
            end
          reg54 <= wire3;
          reg55 <= (wire2 > ((({reg50, wire38} | reg51[(5'h12):(3'h5)]) ?
              ($signed(reg53) ?
                  $signed(reg48) : wire1) : $signed($unsigned((8'ha7)))) < $signed(wire1)));
          reg56 <= (!(|(8'ha0)));
          reg57 <= ((!(+((reg59 ? reg50 : reg49) & (reg40 ?
              reg51 : reg50)))) || (reg50[(1'h0):(1'h0)] ?
              $signed($unsigned(reg59)) : reg53[(1'h0):(1'h0)]));
        end
    end
  assign wire60 = $unsigned({reg48});
  always
    @(posedge clk) begin
      if (reg48)
        begin
          reg61 <= $signed(wire3);
          reg62 <= $signed((~$unsigned((reg52[(1'h0):(1'h0)] ?
              (wire38 ? wire2 : wire46) : wire60))));
          reg63 <= $signed(({((+reg61) ? (reg55 + reg56) : $unsigned(reg49)),
              reg55} == ($signed(wire42[(1'h1):(1'h1)]) ?
              ((+wire38) ?
                  $signed(reg47) : reg59) : ($unsigned((8'h9c)) ^~ $unsigned(wire2)))));
          reg64 <= wire45[(4'hd):(3'h4)];
        end
      else
        begin
          reg61 <= {(-(^$signed($unsigned((8'hb3))))),
              $unsigned(wire45[(2'h2):(2'h2)])};
          reg62 <= {(^~((&(^~wire38)) || reg58)), reg55};
        end
      reg65 <= $signed(wire60[(3'h6):(1'h0)]);
      reg66 <= {((($signed(wire44) < (-(8'hbb))) ?
              ((wire60 <<< (8'ha9)) ^~ reg63[(2'h2):(1'h1)]) : reg63) <= $signed(((wire3 > (8'hb0)) ?
              ((8'ha1) != reg47) : {reg53}))),
          $signed(reg47)};
    end
  module67 #() modinst156 (.wire68(reg58), .clk(clk), .wire70(reg55), .wire72(reg66), .y(wire155), .wire69(reg63), .wire71(reg50));
endmodule

module module67  (y, clk, wire68, wire69, wire70, wire71, wire72);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire68;
  input wire signed [(5'h12):(1'h0)] wire69;
  input wire signed [(4'hd):(1'h0)] wire70;
  input wire [(5'h13):(1'h0)] wire71;
  input wire signed [(3'h7):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire154;
  wire signed [(5'h10):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire137;
  wire signed [(4'hd):(1'h0)] wire136;
  wire signed [(4'hd):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire134;
  wire signed [(4'hf):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire86;
  wire [(5'h12):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire89;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(4'hc):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire129;
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire151,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire129,
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
                 reg73,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((~|wire68[(3'h5):(1'h0)]))
        begin
          if (wire72)
            begin
              reg73 <= wire72;
              reg74 <= (^~$signed((7'h44)));
            end
          else
            begin
              reg73 <= (reg74 ?
                  $unsigned($signed($unsigned({(8'ha7)}))) : (wire71[(5'h10):(2'h3)] | wire69[(4'hb):(4'ha)]));
            end
          reg75 <= (-((($unsigned(reg73) ?
                  (wire68 ?
                      wire69 : reg74) : wire70) << $signed($unsigned(wire68))) ?
              (8'hb6) : $unsigned($unsigned((reg73 ? wire68 : wire71)))));
          reg76 <= $signed($signed({wire70}));
          if ($signed(reg74[(1'h0):(1'h0)]))
            begin
              reg77 <= wire71[(3'h5):(2'h2)];
              reg78 <= (!({$signed($signed(reg74)),
                  $unsigned({wire68,
                      reg74})} ^~ ($signed((~^wire69)) * reg74)));
              reg79 <= wire72[(1'h0):(1'h0)];
              reg80 <= (-((reg79 | ((!reg74) ?
                  (wire70 ? (8'had) : wire70) : wire69)) ~^ ((8'hbd) ?
                  $unsigned(wire71) : {reg75[(2'h2):(1'h1)],
                      $unsigned(wire68)})));
            end
          else
            begin
              reg77 <= ($unsigned(reg78[(1'h1):(1'h1)]) > $signed(((((8'h9e) <<< wire68) + (^reg75)) << ((!reg76) || {reg76,
                  wire71}))));
              reg78 <= (+wire69[(4'hb):(3'h7)]);
              reg79 <= reg75;
            end
        end
      else
        begin
          reg73 <= $unsigned(($unsigned($signed(reg75)) ^ $signed(((~&reg80) <= (wire72 & wire68)))));
        end
      reg81 <= wire71;
      if (wire68[(2'h3):(1'h0)])
        begin
          reg82 <= wire72;
        end
      else
        begin
          reg82 <= $unsigned(wire71);
          reg83 <= wire71[(2'h3):(2'h2)];
        end
      reg84 <= (((&(+(reg76 ? reg74 : wire71))) ?
          reg81[(2'h3):(1'h1)] : reg74[(3'h7):(1'h1)]) ^~ ((&$signed(reg82[(2'h3):(2'h3)])) ?
          reg80 : $signed(($unsigned(reg83) ? {reg83} : (reg78 || (8'ha2))))));
    end
  assign wire85 = $unsigned($signed((8'ha3)));
  assign wire86 = ({(reg74 ?
                          ((^~reg75) ?
                              (^~reg80) : (reg82 ^ reg75)) : (&(!wire68)))} | reg84);
  assign wire87 = $signed((wire86 == reg78));
  assign wire88 = wire71;
  assign wire89 = $unsigned((8'ha2));
  assign wire90 = ($unsigned((^wire70[(4'h9):(3'h7)])) * {($unsigned((-wire88)) * ((wire71 ?
                          wire88 : reg80) || ((8'h9f) >>> reg79))),
                      $unsigned(reg75[(3'h4):(1'h1)])});
  assign wire91 = ((reg79 & ((+reg75[(4'hc):(2'h3)]) - $unsigned((^wire90)))) ?
                      (wire86 ?
                          wire69 : (((reg75 ? reg83 : reg79) ?
                              wire86[(4'ha):(4'h8)] : reg73) == {reg76,
                              $signed(reg73)})) : wire72);
  module92 #() modinst130 (.y(wire129), .wire94(reg78), .wire93(reg83), .wire95(reg73), .wire96(wire69), .clk(clk));
  assign wire131 = wire90;
  assign wire132 = {$unsigned(({reg83[(4'hc):(2'h3)],
                           (wire86 >> reg84)} >>> $unsigned($signed(reg80))))};
  assign wire133 = $signed(wire85);
  assign wire134 = wire90;
  assign wire135 = $signed($signed(reg74));
  assign wire136 = $signed((($unsigned($signed(reg84)) ?
                       ((+wire129) != (8'ha4)) : $unsigned((8'ha1))) <<< wire135));
  assign wire137 = wire134[(3'h4):(1'h1)];
  module138 #() modinst152 (.wire139(wire69), .y(wire151), .clk(clk), .wire140(wire68), .wire141(wire135), .wire143(reg75), .wire142(wire129));
  assign wire153 = ((wire151[(3'h6):(2'h2)] | ($unsigned((wire129 ?
                           wire136 : (8'ha7))) ?
                       reg73[(1'h0):(1'h0)] : wire72[(2'h2):(1'h1)])) & (reg79 ?
                       ((8'hb3) ?
                           reg81 : ((!wire86) ?
                               (+(8'hb6)) : $unsigned(wire131))) : $signed((!wire151[(2'h2):(1'h0)]))));
  assign wire154 = wire89;
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire35;
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire37, wire11, wire12, wire35, reg10, (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $unsigned(($signed({wire6}) ?
          wire9[(1'h0):(1'h0)] : $unsigned($unsigned(wire7[(4'hc):(4'hb)]))));
    end
  assign wire11 = (~^wire8);
  assign wire12 = wire9;
  module13 #() modinst36 (.wire15(wire8), .y(wire35), .wire17(wire6), .clk(clk), .wire14(reg10), .wire16(wire11));
  assign wire37 = wire11;
endmodule

module module13
#(parameter param33 = (((&(((8'had) ? (8'hb8) : (8'haa)) ? ((8'hbf) ? (8'hb3) : (8'hb7)) : ((8'hb9) + (8'hab)))) ? (~^(~|((8'ha9) ? (8'hbc) : (8'hb9)))) : ((((8'hbb) ? (8'had) : (7'h40)) ? ((8'hba) < (8'hae)) : {(8'ha2)}) ? (+(~&(8'had))) : ((8'ha2) | (8'ha5)))) ? (((((8'hb0) ? (8'h9f) : (8'hbd)) > (8'hb5)) ? (^((8'hb4) ^ (8'hb2))) : ((+(8'hba)) ? {(8'hbb)} : {(7'h40), (8'hb1)})) == (~&(~|((8'hb5) ? (8'had) : (8'ha6))))) : ((!(^(^~(8'hb6)))) ? {(8'hbe), (((8'ha7) ? (7'h43) : (8'hb0)) >>> (|(8'hbd)))} : (~(((7'h41) ? (8'hb8) : (8'hb4)) ~^ ((8'hb1) ^ (8'hbf)))))), 
parameter param34 = (((&(!(+(8'hb5)))) ? param33 : ((8'ha5) | ((^~param33) == param33))) ? (|(8'hbf)) : param33))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(4'hf):(1'h0)] wire15;
  input wire [(4'h9):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire18;
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire18 = $unsigned(((8'ha4) ?
                      ($signed(((8'hb6) + (8'ha2))) <= $signed((wire15 * wire16))) : $signed((^~$signed((8'hab))))));
  assign wire19 = (+(((^wire15[(4'hc):(4'ha)]) ^ wire16[(4'h9):(2'h2)]) != (~|wire16)));
  assign wire20 = $unsigned($signed((8'hb3)));
  assign wire21 = $signed(((^(~(wire17 ? wire16 : wire16))) ?
                      $unsigned((~^$unsigned(wire19))) : {wire20,
                          $signed($signed(wire17))}));
  assign wire22 = $unsigned(wire19[(4'h9):(1'h0)]);
  assign wire23 = wire16;
  assign wire24 = $unsigned($unsigned(({(wire19 ?
                          wire20 : wire18)} <= $signed({(8'ha8), wire18}))));
  assign wire25 = ($unsigned((|wire22)) ~^ wire19);
  always
    @(posedge clk) begin
      reg26 <= (wire23 ?
          ((~|($signed(wire14) == $unsigned(wire23))) | wire18) : (~$unsigned(((wire20 ?
                  wire18 : (7'h41)) ?
              ((8'h9e) == wire21) : $signed(wire18)))));
      reg27 <= $signed(($signed({$signed(wire22), ((8'hb0) * wire14)}) ?
          ((!(7'h42)) >>> (wire24[(3'h6):(3'h5)] << {(8'had),
              wire25})) : (wire16[(4'hb):(1'h0)] >= wire23[(3'h6):(3'h6)])));
      reg28 <= wire15[(3'h5):(1'h0)];
      if ({($unsigned({$signed(wire17), (~reg26)}) ?
              $signed({wire22[(2'h2):(1'h0)]}) : wire22[(3'h6):(3'h4)])})
        begin
          reg29 <= wire14;
          reg30 <= $unsigned($unsigned(wire24[(4'ha):(4'ha)]));
        end
      else
        begin
          reg29 <= (((reg26 ?
                      ({(8'ha6)} ?
                          {wire22, reg27} : (wire25 ?
                              reg26 : wire19)) : $unsigned(reg28)) ?
                  reg28[(3'h6):(3'h6)] : wire23) ?
              reg29[(4'hd):(4'hc)] : ((($signed(reg26) & reg27[(4'h8):(2'h3)]) & ($unsigned(wire16) ?
                  (wire16 ^~ wire22) : wire20[(1'h0):(1'h0)])) >= reg27));
          reg30 <= {(~$signed(($unsigned(wire19) ?
                  {wire22, wire22} : $unsigned(wire21)))),
              (^(!wire15[(4'h9):(1'h0)]))};
          reg31 <= ($unsigned(reg28[(1'h0):(1'h0)]) + ({((~^reg30) >> wire22),
              (-(~^wire21))} >>> (~|(^~wire18))));
        end
      reg32 <= (^reg26[(2'h3):(1'h0)]);
    end
endmodule

module module138
#(parameter param149 = {{(({(8'hb8), (7'h40)} && ((8'ha8) + (8'hbb))) ? (^(~|(8'hbd))) : (((7'h43) <<< (8'hb4)) ? ((8'hbc) ? (8'haa) : (8'ha7)) : (+(8'hbb))))}, ((+((|(8'haa)) & (8'hb4))) ? ((((8'hab) ? (8'ha4) : (8'hb1)) <<< ((8'h9f) >= (7'h44))) && (^(~(8'hae)))) : (((8'hb0) ? ((8'hb0) ? (8'hb1) : (8'hb2)) : ((8'hba) ? (7'h44) : (8'ha5))) && (|(~(8'ha1)))))}, 
parameter param150 = ((param149 ? {param149} : (param149 && (~&(param149 ? param149 : param149)))) ? param149 : param149))
(y, clk, wire143, wire142, wire141, wire140, wire139);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire143;
  input wire [(5'h13):(1'h0)] wire142;
  input wire signed [(2'h2):(1'h0)] wire141;
  input wire [(5'h13):(1'h0)] wire140;
  input wire [(4'hb):(1'h0)] wire139;
  wire [(5'h13):(1'h0)] wire148;
  wire signed [(5'h14):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire146;
  wire signed [(3'h4):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  assign y = {wire148, wire147, wire146, wire145, wire144, (1'h0)};
  assign wire144 = $signed((8'ha1));
  assign wire145 = (^~$unsigned((8'ha3)));
  assign wire146 = {wire139, wire141};
  assign wire147 = $signed({$unsigned(((wire144 ? (8'ha5) : wire144) ?
                           $signed(wire141) : wire139)),
                       wire144});
  assign wire148 = $unsigned(wire139);
endmodule

module module92
#(parameter param127 = (~&(&(((8'hb5) <= ((8'ha2) ? (8'haa) : (7'h43))) == (((8'h9e) | (8'hb5)) ? ((8'ha0) ^~ (8'hbf)) : (~|(8'h9c)))))), 
parameter param128 = (param127 ? (({(param127 ? param127 : param127), (8'hab)} ? ({param127} ? param127 : (param127 <<< param127)) : (~|(param127 ? param127 : param127))) ? ((param127 ? (param127 && param127) : (param127 != param127)) ^ ({param127, param127} ~^ (param127 != param127))) : (param127 ? (param127 ^~ (param127 ? param127 : param127)) : (~(param127 ? param127 : param127)))) : param127))
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h170):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire96;
  input wire signed [(4'hb):(1'h0)] wire95;
  input wire [(4'h8):(1'h0)] wire94;
  input wire signed [(4'hf):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire126;
  wire signed [(5'h14):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire109;
  wire [(2'h3):(1'h0)] wire108;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire105;
  wire [(5'h15):(1'h0)] wire104;
  wire signed [(4'hc):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire102;
  wire signed [(5'h12):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire98;
  wire [(4'h8):(1'h0)] wire97;
  reg [(4'h9):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg114 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
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
                 reg114,
                 (1'h0)};
  assign wire97 = ($unsigned((($unsigned((8'hab)) >> (wire95 ?
                              wire94 : wire96)) ?
                          wire93[(4'h9):(2'h3)] : $unsigned((wire94 != (8'hbe))))) ?
                      (($unsigned((wire96 ?
                          wire96 : wire96)) && wire93) & (~|(wire94 ?
                          (wire93 * wire93) : (wire93 & wire93)))) : ((wire95 ?
                          $signed(wire93[(4'hc):(4'hc)]) : ($unsigned(wire96) ?
                              (wire96 ?
                                  wire96 : wire93) : (wire94 >> (8'ha2)))) << $unsigned((wire94 ?
                          (wire95 ? wire94 : wire94) : $signed(wire94)))));
  assign wire98 = $unsigned($unsigned((((wire95 ? (8'hb1) : wire96) > wire95) ?
                      (^wire93[(1'h0):(1'h0)]) : wire95[(4'h8):(2'h2)])));
  assign wire99 = $signed((|wire95));
  assign wire100 = ((&{wire98}) ?
                       (~|($unsigned((wire97 ?
                           wire98 : wire97)) >= $unsigned((wire96 ?
                           wire97 : (8'hac))))) : $unsigned(($unsigned({wire97,
                           wire98}) & ((~wire95) ?
                           ((8'hb8) | wire96) : $signed(wire95)))));
  assign wire101 = ((~^(wire100[(3'h5):(2'h2)] ?
                           (8'hb1) : $signed($unsigned(wire98)))) ?
                       (&$signed(((wire99 ?
                           (8'h9d) : wire95) < (wire100 <= wire100)))) : (wire99[(4'h8):(3'h5)] ?
                           $unsigned(({(8'hb9)} == $signed(wire94))) : (wire93[(3'h5):(1'h1)] >> $unsigned((wire93 >> (8'hbd))))));
  assign wire102 = wire99[(3'h5):(3'h4)];
  assign wire103 = (^$signed($unsigned(wire98)));
  assign wire104 = $signed(wire98[(2'h3):(2'h3)]);
  assign wire105 = $signed(wire98[(2'h3):(1'h1)]);
  assign wire106 = wire94[(3'h7):(1'h1)];
  assign wire107 = $signed($unsigned({(|((8'hba) ? wire99 : (8'hb9))),
                       ((-wire95) || $unsigned((8'ha4)))}));
  assign wire108 = $signed($signed((((^~wire106) + wire99) <<< (+wire93))));
  assign wire109 = wire105[(4'ha):(4'h9)];
  assign wire110 = $unsigned(wire106[(5'h10):(4'h8)]);
  assign wire111 = (^$signed($signed((((8'hbd) ^~ wire108) || (wire94 ?
                       wire107 : wire108)))));
  assign wire112 = ({(wire101[(2'h3):(2'h2)] >>> (~$signed(wire105))),
                           wire110} ?
                       $unsigned((&((^~wire103) ?
                           (wire100 ^ wire102) : (~&wire100)))) : (($signed({wire106,
                               wire110}) >= $unsigned(wire97)) ?
                           wire107 : wire111));
  assign wire113 = {$unsigned(wire95),
                       (((|$unsigned((8'hab))) ?
                           $signed((wire110 ?
                               wire100 : wire110)) : (!wire109[(3'h6):(3'h6)])) || ($unsigned($unsigned(wire97)) <<< $unsigned($signed(wire112))))};
  always
    @(posedge clk) begin
      if (wire97[(3'h6):(2'h2)])
        begin
          if (wire112[(2'h3):(2'h3)])
            begin
              reg114 <= ($signed($unsigned(wire94)) ~^ wire101[(1'h1):(1'h1)]);
            end
          else
            begin
              reg114 <= ((wire94 & wire112) <<< (reg114 < wire98[(3'h5):(3'h5)]));
              reg115 <= (({wire101} ?
                  (^~(!(wire99 ? wire98 : reg114))) : (((wire101 == wire94) ?
                          (wire105 ? wire106 : wire109) : (7'h40)) ?
                      {{wire111,
                              wire112}} : wire111)) + ($unsigned($signed((!wire98))) >> {(!(~wire107)),
                  reg114}));
              reg116 <= $signed(wire97);
              reg117 <= (~^(wire101[(1'h1):(1'h1)] <= $unsigned((~wire94))));
              reg118 <= wire110;
            end
        end
      else
        begin
          if ((^wire105[(5'h10):(2'h3)]))
            begin
              reg114 <= ((!($signed($signed((8'hbf))) >> (-wire102[(3'h6):(2'h2)]))) ?
                  wire100[(3'h5):(1'h1)] : $signed(($signed((wire95 ?
                          wire109 : wire94)) ?
                      (8'ha5) : $unsigned({wire98, wire105}))));
              reg115 <= $unsigned(wire108[(1'h0):(1'h0)]);
              reg116 <= $signed((wire111 != wire98[(1'h1):(1'h0)]));
              reg117 <= $signed((^~(((8'h9d) != (wire95 ? wire112 : (8'hbe))) ?
                  (~|wire102[(4'h9):(3'h4)]) : ((+wire113) ?
                      $signed(wire94) : {wire95}))));
            end
          else
            begin
              reg114 <= (~^$unsigned(wire95[(3'h7):(2'h2)]));
              reg115 <= (~&({($unsigned(wire104) ^~ $signed((8'ha7)))} < $unsigned((wire100[(3'h5):(3'h4)] ?
                  $signed(wire103) : $unsigned((7'h43))))));
              reg116 <= $unsigned({wire97, {wire105}});
              reg117 <= ((+((~|$unsigned(wire111)) ?
                  wire94[(1'h1):(1'h0)] : wire105)) ^~ $signed($unsigned(reg115)));
              reg118 <= reg116;
            end
          reg119 <= ({reg114} ?
              ((wire105[(4'he):(3'h6)] ~^ $unsigned(wire103)) ?
                  $unsigned((wire98[(3'h5):(1'h1)] * $signed(wire112))) : ((wire95 != wire109[(2'h2):(1'h0)]) != {wire107[(1'h1):(1'h1)]})) : reg115[(3'h4):(2'h2)]);
          reg120 <= $unsigned(($unsigned(wire104[(5'h15):(4'he)]) ?
              (wire102 ?
                  $unsigned(reg118[(4'h9):(3'h6)]) : ({wire95, wire94} ?
                      wire103[(2'h2):(1'h0)] : wire96[(1'h1):(1'h0)])) : {wire108[(1'h0):(1'h0)]}));
        end
      reg121 <= (wire97 ?
          $signed(((wire104[(5'h11):(1'h0)] | $signed(reg119)) ^~ $unsigned((+reg118)))) : ((&wire113) <= ((-{wire95,
              reg115}) != $unsigned((wire99 * wire109)))));
      if ((reg120 ? $unsigned(reg121[(1'h0):(1'h0)]) : reg115[(3'h5):(3'h4)]))
        begin
          reg122 <= $signed(wire104);
        end
      else
        begin
          reg122 <= $unsigned(reg116);
        end
      reg123 <= $signed((((~&$unsigned(wire98)) ^ wire100[(2'h2):(2'h2)]) ?
          (~(~&wire93[(3'h6):(3'h5)])) : ($unsigned(wire93) || (^$signed(wire112)))));
      reg124 <= ({(reg117 ? reg117 : wire105),
          (reg119[(3'h4):(2'h3)] ?
              (8'h9e) : $unsigned((~reg117)))} > {{((^~(8'hb3)) > {wire102})},
          (reg115 ? {{(8'hb6), wire100}} : (^(~&reg123)))});
    end
  assign wire125 = wire102;
  assign wire126 = (|($signed((~{(7'h44)})) ? wire105 : reg118[(4'h9):(1'h1)]));
endmodule
