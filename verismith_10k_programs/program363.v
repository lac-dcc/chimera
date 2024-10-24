module top
#(parameter param155 = (((~&({(8'hb0)} ? {(8'hb3), (7'h43)} : (8'hac))) - ((|(+(7'h41))) ? (((8'ha6) ? (8'hab) : (8'hbd)) || {(8'h9c), (8'hb3)}) : ({(8'ha8)} ~^ (~&(8'ha0))))) >>> (({(8'haa), ((8'hb3) ? (8'h9e) : (8'hb2))} == ((~|(8'hab)) ^~ (^~(8'hb9)))) ? ({{(8'hae), (8'hbc)}, (~|(8'ha1))} ? (((8'ha5) & (8'ha9)) ? ((7'h40) ? (8'ha4) : (8'ha2)) : (|(7'h40))) : {((8'hae) ? (8'ha4) : (8'hbf))}) : {(^~((8'hb7) ? (8'h9c) : (8'hb8))), ((~&(8'hb3)) ? ((8'ha0) | (8'ha3)) : ((8'had) ^ (8'ha9)))})), 
parameter param156 = {{(8'hb7), (((7'h43) ? (param155 ~^ param155) : (param155 >>> param155)) <<< param155)}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire154;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire152;
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire154,
                 wire5,
                 wire6,
                 wire7,
                 wire9,
                 wire48,
                 wire50,
                 wire63,
                 wire64,
                 wire152,
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
                 reg8,
                 (1'h0)};
  assign wire5 = ((8'hbb) - $unsigned(wire2[(5'h12):(2'h2)]));
  assign wire6 = $signed($unsigned((~wire2[(5'h12):(3'h7)])));
  assign wire7 = {wire4[(3'h6):(3'h6)], $unsigned(((+(+wire0)) && {wire4}))};
  always
    @(posedge clk) begin
      reg8 <= (+wire1);
    end
  assign wire9 = $signed(wire4[(3'h5):(2'h2)]);
  module10 #() modinst49 (wire48, clk, wire3, wire5, reg8, wire6, wire1);
  assign wire50 = (wire0[(4'hb):(4'h8)] ?
                      ((~$signed(wire6)) >> wire2) : ($unsigned(({wire2, reg8} ?
                          (wire9 ?
                              wire9 : wire4) : {(8'hbf)})) >= $signed(((&wire6) > {wire48,
                          (8'hb2)}))));
  always
    @(posedge clk) begin
      reg51 <= (({(~^$unsigned(reg8))} == ((wire3[(2'h2):(1'h0)] ?
                  wire9 : ((8'hb8) ? wire1 : (8'ha8))) ?
              ($signed(wire48) < (~|reg8)) : wire3[(3'h7):(2'h3)])) ?
          $signed(({{wire7, wire9}} ?
              {wire5[(4'hf):(4'he)]} : (-wire7))) : wire48[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg52 <= $unsigned(wire1);
      if (wire0)
        begin
          reg53 <= wire2;
          if ($unsigned((-reg8[(3'h4):(2'h2)])))
            begin
              reg54 <= (wire0[(3'h6):(3'h4)] ?
                  (|$unsigned(reg8)) : wire7[(2'h2):(1'h0)]);
            end
          else
            begin
              reg54 <= $signed(((^~wire50) ^ {wire6[(4'hb):(4'h9)]}));
              reg55 <= ((|reg8[(2'h2):(1'h1)]) >>> (wire48 ?
                  (((reg51 ?
                      wire9 : reg51) == (wire6 >= wire5)) <= ($unsigned(wire6) >> (reg53 && wire7))) : (8'hbc)));
            end
          if (($signed($unsigned($unsigned((wire1 ? wire9 : wire1)))) ?
              (~wire2[(2'h3):(1'h1)]) : reg51))
            begin
              reg56 <= (8'h9c);
              reg57 <= ($unsigned($unsigned(($unsigned(reg52) ?
                  (reg55 ?
                      (7'h40) : (7'h42)) : (wire5 < wire7)))) <<< wire5[(4'h9):(1'h1)]);
            end
          else
            begin
              reg56 <= reg8;
              reg57 <= (-reg55);
              reg58 <= reg56[(3'h6):(1'h0)];
              reg59 <= {$unsigned($unsigned(((8'hac) ?
                      $unsigned(wire6) : (reg8 || wire9)))),
                  wire48[(1'h1):(1'h0)]};
              reg60 <= {$signed(reg52),
                  $unsigned((((~^reg57) < (reg8 ? wire2 : wire5)) ?
                      ((8'h9c) ?
                          $unsigned(reg53) : (|wire2)) : wire5[(5'h14):(4'hc)]))};
            end
          reg61 <= wire0[(3'h7):(1'h1)];
        end
      else
        begin
          reg53 <= $signed(wire4[(1'h1):(1'h1)]);
          reg54 <= reg58[(2'h3):(1'h1)];
          reg55 <= ((~^$unsigned(wire4)) ?
              ((8'hbb) ?
                  {(reg55 ?
                          (~|(8'hae)) : reg54)} : reg58[(2'h2):(1'h0)]) : $signed(wire1));
        end
      reg62 <= $unsigned($signed(wire3));
    end
  assign wire63 = (|(wire50[(4'hc):(4'h8)] ?
                      wire4 : (wire4 ?
                          $unsigned({reg52, wire6}) : wire3[(4'ha):(3'h5)])));
  assign wire64 = (((((^(7'h40)) + wire63) ?
                              $signed(((8'hbf) ? reg8 : wire48)) : wire4) ?
                          ($unsigned(reg53[(2'h2):(1'h1)]) ?
                              wire1 : $signed(wire1[(3'h4):(1'h1)])) : $unsigned(wire4)) ?
                      $signed($unsigned(wire0)) : $unsigned(((~&reg61[(3'h4):(1'h1)]) ?
                          wire48[(1'h1):(1'h0)] : (^wire63[(4'ha):(1'h1)]))));
  module65 #() modinst153 (.wire70(reg56), .wire68(reg53), .wire66(wire6), .clk(clk), .wire69(reg52), .wire67(reg60), .y(wire152));
  assign wire154 = ((($unsigned((^wire152)) ?
                           $signed((~reg55)) : ($signed(wire64) ?
                               reg59[(4'hc):(3'h4)] : $unsigned(wire2))) ?
                       ($unsigned(reg56[(4'h9):(1'h1)]) < ($unsigned(wire152) ?
                           wire48[(1'h1):(1'h0)] : wire63[(4'h9):(4'h8)])) : (($unsigned(reg57) ^ reg61[(1'h1):(1'h0)]) ?
                           wire6[(4'he):(4'ha)] : ($unsigned(reg53) <= (reg61 | (8'ha7))))) ^~ ((^~(+(!wire4))) > wire64[(2'h2):(2'h2)]));
endmodule

module module65  (y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire70;
  input wire [(5'h14):(1'h0)] wire69;
  input wire signed [(5'h15):(1'h0)] wire68;
  input wire signed [(3'h7):(1'h0)] wire67;
  input wire signed [(5'h12):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(5'h14):(1'h0)] wire71;
  reg [(5'h13):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire139,
                 wire73,
                 wire72,
                 wire71,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
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
                 (1'h0)};
  assign wire71 = ({$unsigned({wire69[(1'h0):(1'h0)], wire70}),
                          (({wire66} || wire68[(4'hc):(3'h5)]) ?
                              $signed($signed(wire67)) : ((wire69 ?
                                      wire68 : wire68) ?
                                  $unsigned((8'hb1)) : wire69))} ?
                      $signed((7'h44)) : wire69[(5'h13):(3'h4)]);
  assign wire72 = (+{wire69});
  assign wire73 = $signed(wire67[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg74 <= wire66;
      reg75 <= $unsigned($unsigned(((wire67[(1'h1):(1'h1)] ?
              $unsigned(wire68) : $unsigned((7'h42))) ?
          $signed(wire71) : ($unsigned(wire69) ^~ wire67[(2'h2):(1'h0)]))));
      if ((~|(8'hbb)))
        begin
          if ((wire71 ?
              $signed(($signed(wire68[(4'h8):(4'h8)]) <= ((8'ha0) ?
                  (+wire72) : $unsigned(wire66)))) : (reg74 ?
                  (~&(~wire69[(4'hd):(4'ha)])) : $signed($unsigned(wire70)))))
            begin
              reg76 <= $signed({wire73});
            end
          else
            begin
              reg76 <= (reg76 ?
                  (^($signed((wire72 << (8'hb5))) ?
                      wire70[(4'h9):(2'h2)] : reg75[(1'h1):(1'h1)])) : $unsigned((($unsigned(reg75) || (^~wire71)) && ($unsigned(reg76) ?
                      (wire67 ~^ wire67) : wire68))));
              reg77 <= ((+wire72[(3'h5):(1'h0)]) ?
                  {((+{(8'ha1)}) ^~ $signed((reg76 >= wire66)))} : wire66[(5'h11):(3'h5)]);
              reg78 <= $unsigned((8'hb3));
              reg79 <= wire69[(1'h1):(1'h0)];
            end
          reg80 <= ({reg74, $signed(wire73)} >> {wire73[(3'h4):(1'h1)],
              (wire72[(4'hb):(4'h8)] <= $signed($unsigned(wire71)))});
          reg81 <= (-{(((reg74 ? reg77 : wire71) | $signed(wire67)) ?
                  wire67 : {$signed(wire69), $signed(reg77)})});
          if (({(+((-reg79) != (reg74 ? reg80 : wire66)))} ?
              (((reg81[(3'h5):(3'h5)] & wire69) ^~ ($signed(reg74) ?
                      $unsigned(reg75) : (~wire71))) ?
                  {reg79} : (~^{wire66[(3'h5):(3'h5)],
                      (wire70 && (8'ha8))})) : wire68))
            begin
              reg82 <= {{(reg81[(1'h1):(1'h1)] << (-(wire70 ? reg74 : reg76)))},
                  wire70};
              reg83 <= $signed($signed(wire72[(4'hd):(4'h9)]));
              reg84 <= $unsigned($signed(reg79));
              reg85 <= ($signed((($unsigned(reg79) + {reg82}) ^ (7'h43))) * ((((8'hab) ?
                      $signed(reg77) : reg84[(4'he):(1'h0)]) ?
                  ($unsigned(reg82) >> (wire73 >= reg81)) : $signed($unsigned(wire67))) && (+((-wire66) ^ {reg83}))));
            end
          else
            begin
              reg82 <= $unsigned($unsigned($unsigned(((-reg83) ^ wire67))));
              reg83 <= (~^((((&(8'hbf)) + (reg83 ? wire70 : reg82)) ?
                  $signed((wire69 && reg78)) : (8'ha9)) > (8'hb0)));
              reg84 <= {((wire66 << (~&reg78[(2'h3):(2'h2)])) ?
                      wire70[(3'h4):(1'h1)] : reg78[(4'hb):(1'h1)]),
                  reg74[(2'h2):(2'h2)]};
              reg85 <= reg83;
            end
        end
      else
        begin
          reg76 <= ((8'hbd) > $unsigned($unsigned($signed((wire70 & wire68)))));
          if ($unsigned($unsigned(wire66)))
            begin
              reg77 <= {(~&$unsigned((8'hae)))};
            end
          else
            begin
              reg77 <= wire66[(3'h4):(2'h3)];
              reg78 <= reg81[(1'h0):(1'h0)];
              reg79 <= (reg85[(3'h4):(2'h3)] ?
                  wire71[(5'h12):(4'ha)] : (~^((-wire67[(2'h2):(2'h2)]) ^ $signed((wire70 <<< reg75)))));
              reg80 <= ($unsigned((((reg76 ? wire69 : wire73) >> (reg78 ?
                      reg74 : reg74)) << $unsigned((8'h9f)))) ?
                  (-$unsigned($unsigned($signed(reg81)))) : reg79);
              reg81 <= reg77;
            end
          reg82 <= $unsigned(reg79);
        end
    end
  module86 #() modinst140 (.clk(clk), .wire88(wire69), .y(wire139), .wire89(reg84), .wire90(reg78), .wire87(wire67));
  assign wire141 = (((~|$signed({(8'ha0),
                       wire139})) <= wire139[(4'h8):(1'h1)]) < (~^({reg74} ?
                       {$signed(reg84), wire139} : wire68)));
  assign wire142 = (8'h9d);
  always
    @(posedge clk) begin
      if ($unsigned(wire141))
        begin
          if ({((~^((-reg82) ? (reg82 << (8'hb2)) : reg75)) ?
                  $unsigned(wire69[(4'hd):(2'h3)]) : wire69[(4'hb):(3'h5)])})
            begin
              reg143 <= ($unsigned(((^~{(8'hbd)}) > (~|wire66[(1'h0):(1'h0)]))) ?
                  ($unsigned(reg74[(2'h3):(1'h1)]) ?
                      wire68[(1'h0):(1'h0)] : $unsigned((wire72 || (wire139 ^ reg81)))) : {(reg81 ?
                          (-(~&wire142)) : ($signed(reg81) ?
                              (+reg76) : $unsigned(wire141))),
                      wire142});
            end
          else
            begin
              reg143 <= $unsigned((((|$unsigned((8'hab))) ?
                      (reg74 << reg82[(3'h6):(3'h5)]) : wire142) ?
                  $signed(((wire70 ? wire73 : wire71) ?
                      (~^(8'ha6)) : (~|wire142))) : ({reg84[(4'hc):(2'h2)]} && wire72)));
            end
          reg144 <= (wire70[(3'h7):(1'h0)] > {wire142[(4'h9):(1'h1)]});
          if (reg74)
            begin
              reg145 <= reg85;
              reg146 <= wire72;
              reg147 <= (!(&reg146[(1'h0):(1'h0)]));
            end
          else
            begin
              reg145 <= (&(8'hb2));
            end
        end
      else
        begin
          reg143 <= {(wire142[(4'ha):(3'h5)] ^ ((((7'h42) ?
                  wire67 : wire67) != $unsigned(reg143)) == $signed($signed(reg83))))};
          reg144 <= $signed($signed((|$signed((reg80 ? reg85 : (8'hbc))))));
          reg145 <= reg83[(1'h1):(1'h0)];
          reg146 <= $unsigned({(&reg85[(2'h3):(1'h1)]),
              ((reg79[(3'h5):(1'h0)] ?
                      ((8'hae) != wire139) : (wire139 != reg74)) ?
                  reg143[(3'h7):(3'h4)] : ((&reg75) > (+reg85)))});
          reg147 <= reg146[(3'h6):(3'h5)];
        end
      reg148 <= (8'hb8);
      reg149 <= reg144[(2'h2):(1'h1)];
      reg150 <= ({(reg149 ? reg75[(3'h7):(1'h1)] : (~|reg143[(2'h3):(2'h3)]))} ?
          wire72[(4'ha):(2'h3)] : $signed($unsigned(wire71[(3'h7):(3'h5)])));
      reg151 <= $unsigned(((8'ha9) ~^ (8'hab)));
    end
endmodule

module module10
#(parameter param46 = (8'hb9), 
parameter param47 = (&((((param46 ? param46 : (8'hbb)) ? (param46 <<< param46) : (param46 != param46)) >= (+{param46})) ? (+param46) : param46)))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire40;
  assign y = {wire45, wire44, wire43, wire42, wire16, wire17, wire40, (1'h0)};
  assign wire16 = (({$unsigned($signed(wire12)),
                          ((wire12 & wire14) ?
                              wire15 : {wire15})} >= (((~wire11) ?
                              $unsigned(wire15) : wire15) ?
                          $signed((&wire13)) : $signed((wire15 || wire15)))) ?
                      wire12[(3'h5):(1'h1)] : wire14[(2'h3):(2'h3)]);
  assign wire17 = $signed($signed(wire14[(3'h6):(1'h0)]));
  module18 #() modinst41 (wire40, clk, wire16, wire15, wire11, wire17, wire13);
  assign wire42 = ((($unsigned($unsigned(wire12)) ~^ ($signed(wire14) ?
                          $unsigned(wire40) : $unsigned((8'ha4)))) ?
                      ((8'h9e) != wire40[(2'h3):(1'h0)]) : $unsigned((wire12[(3'h6):(3'h4)] ?
                          $signed(wire13) : wire40))) >> wire14);
  assign wire43 = $signed($unsigned(wire42[(4'h8):(4'h8)]));
  assign wire44 = (&{(((8'hb8) ? wire11 : wire13[(4'hc):(2'h2)]) ?
                          {((8'hb4) - wire42)} : $unsigned({wire40})),
                      ($unsigned((wire12 ^ wire13)) ?
                          {(^~wire13),
                              ((7'h43) ?
                                  wire11 : (8'ha2))} : $unsigned($signed(wire43)))});
  assign wire45 = wire40;
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire23;
  input wire signed [(2'h3):(1'h0)] wire22;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire19;
  wire signed [(4'hf):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire25,
                 wire24,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire24 = {((^~(~|$unsigned(wire19))) ?
                          (~$unsigned(wire20[(2'h2):(1'h0)])) : (^(!wire23)))};
  assign wire25 = wire24;
  always
    @(posedge clk) begin
      reg26 <= wire20[(2'h2):(1'h0)];
      reg27 <= $signed((wire21[(1'h0):(1'h0)] ?
          $signed(wire24[(3'h6):(2'h3)]) : $unsigned(($signed(reg26) == ((8'h9f) == wire23)))));
    end
  always
    @(posedge clk) begin
      reg28 <= wire19;
      reg29 <= wire23[(3'h5):(1'h1)];
    end
  assign wire30 = (!$signed(wire23[(3'h5):(2'h3)]));
  assign wire31 = ((^reg29) - ((reg26 - reg26[(1'h1):(1'h0)]) >>> ((~^reg26) ?
                      {reg27[(1'h1):(1'h0)], (wire23 >= (8'haf))} : wire23)));
  assign wire32 = (^$signed(($unsigned($unsigned(wire30)) ?
                      (~^reg27[(1'h0):(1'h0)]) : reg27[(1'h0):(1'h0)])));
  assign wire33 = reg29;
  assign wire34 = $signed({{$signed({wire21}),
                          ($unsigned(wire30) <<< (~&reg29))},
                      ({(8'ha4)} & wire23[(4'hc):(2'h3)])});
  assign wire35 = $signed({wire25});
  assign wire36 = (($unsigned(wire32[(4'h9):(4'h8)]) ?
                      {$signed(((8'hb4) ?
                              (7'h43) : reg26))} : $signed($unsigned($unsigned(reg28)))) ~^ $signed(((^(&(7'h43))) ?
                      ($unsigned(wire20) ?
                          (^~wire19) : wire24[(3'h5):(1'h0)]) : wire21[(2'h3):(1'h0)])));
  assign wire37 = (wire24 | wire22);
  assign wire38 = (!wire31);
  assign wire39 = wire21;
endmodule

module module86
#(parameter param138 = {((({(8'hb1)} == ((8'hae) << (7'h41))) ? (((8'hb5) ? (8'hbf) : (8'ha5)) ? (^(8'hb7)) : ((8'hb9) & (7'h41))) : (((8'hae) > (8'had)) ? ((8'hae) ? (8'hab) : (8'hb9)) : ((8'hb5) < (8'haf)))) <= (~(((8'h9d) ? (7'h43) : (8'had)) ? ((8'ha7) ? (8'hb4) : (8'ha4)) : ((8'hb1) << (8'hb0))))), (!(({(8'hb7)} >= {(8'h9d), (8'haa)}) ? (((8'ha1) ? (8'hba) : (8'ha4)) + (~&(8'h9e))) : (8'hbf)))})
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h269):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire90;
  input wire [(5'h10):(1'h0)] wire89;
  input wire [(3'h5):(1'h0)] wire88;
  input wire [(3'h7):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire121;
  wire [(5'h15):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire95;
  wire signed [(4'hc):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(5'h13):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(5'h11):(1'h0)] reg97 = (1'h0);
  assign y = {wire121,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
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
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire91 = wire90[(2'h2):(2'h2)];
  assign wire92 = {(8'ha8)};
  assign wire93 = wire92[(3'h5):(2'h3)];
  assign wire94 = wire93[(1'h1):(1'h0)];
  assign wire95 = $signed(($unsigned(((wire88 ? wire93 : wire94) & (wire92 ?
                      (8'hb3) : wire91))) < wire88));
  assign wire96 = ((($unsigned((!wire94)) >> wire91[(2'h2):(2'h2)]) ?
                      {$unsigned((wire90 ?
                              wire95 : wire87))} : $signed(((+wire95) ?
                          wire87[(3'h4):(3'h4)] : $signed((8'hb5))))) ^ {{wire90[(1'h1):(1'h1)]}});
  always
    @(posedge clk) begin
      if (wire96)
        begin
          reg97 <= {wire91,
              (($unsigned((wire91 ?
                      wire95 : wire91)) * $unsigned(wire96[(1'h0):(1'h0)])) ?
                  ($signed(wire93[(2'h3):(2'h3)]) ?
                      (^wire87) : ($signed((8'had)) && $signed(wire95))) : wire96)};
          reg98 <= (8'hba);
          reg99 <= (~&(8'hba));
          reg100 <= wire95;
          reg101 <= $signed(((((~^(8'hbd)) ?
                  $unsigned((8'hbb)) : $unsigned((8'had))) ^~ {$signed(wire92)}) ?
              $signed($unsigned((|reg97))) : (wire90 ?
                  ($signed(reg99) ?
                      reg99[(1'h0):(1'h0)] : (reg98 ?
                          wire87 : wire90)) : (+wire91[(1'h1):(1'h1)]))));
        end
      else
        begin
          reg97 <= $unsigned($signed(reg98[(4'hb):(3'h4)]));
          reg98 <= ((((wire88[(2'h2):(2'h2)] ?
                      ((7'h42) << wire87) : wire90[(1'h0):(1'h0)]) ?
                  $unsigned((wire88 * wire89)) : (+reg99[(1'h1):(1'h1)])) >= ((wire96[(4'he):(3'h7)] ?
                      wire87 : (wire87 ? (8'ha9) : (8'hac))) ?
                  wire95 : wire92[(4'he):(4'h8)])) ?
              $unsigned($unsigned($unsigned(wire95))) : (wire89[(4'hd):(2'h3)] ?
                  reg99 : $unsigned(wire95)));
          reg99 <= ($signed((~reg97[(3'h6):(3'h5)])) ?
              ({$unsigned($signed(wire87)),
                      {reg101[(2'h2):(2'h2)], wire94[(3'h5):(2'h2)]}} ?
                  $signed((~&$unsigned((8'hb6)))) : $signed(((wire96 ?
                          wire93 : wire95) ?
                      reg98 : (wire96 < reg97)))) : $signed(wire90[(2'h2):(1'h1)]));
        end
      reg102 <= $unsigned(wire87);
    end
  always
    @(posedge clk) begin
      reg103 <= (reg100 ?
          ($signed($signed((wire89 ?
              reg102 : reg97))) + $signed(reg100[(4'ha):(3'h4)])) : wire89);
      if ({$unsigned((reg100[(4'h9):(3'h6)] == ((~&reg100) & (8'ha6)))),
          ($unsigned((|$unsigned(wire89))) < $unsigned($unsigned({(8'hab),
              wire88})))})
        begin
          if (($signed(wire93) * {$unsigned((+wire92)),
              {reg100[(4'h9):(4'h8)]}}))
            begin
              reg104 <= (reg99[(1'h0):(1'h0)] ?
                  reg98 : $signed({$unsigned(wire95)}));
              reg105 <= (((~|{wire88[(2'h2):(1'h1)]}) - $unsigned(reg98)) == (+(wire93[(4'ha):(4'ha)] ^~ ($unsigned(reg100) ?
                  $signed(wire94) : (reg104 ? reg100 : wire91)))));
              reg106 <= wire94;
              reg107 <= $signed(reg106);
              reg108 <= $unsigned((wire93[(2'h2):(1'h1)] ?
                  $unsigned($signed((wire90 ?
                      wire92 : reg104))) : $signed({(~reg97),
                      $unsigned(reg102)})));
            end
          else
            begin
              reg104 <= (^~(wire96[(1'h1):(1'h1)] & reg104[(4'hb):(4'h8)]));
              reg105 <= $signed($unsigned($signed((wire95 & wire91[(1'h0):(1'h0)]))));
              reg106 <= (reg101[(2'h2):(2'h2)] ?
                  {{($unsigned(reg100) ?
                              (reg107 < (8'ha7)) : (reg100 > reg108)),
                          $signed(reg102[(1'h0):(1'h0)])}} : $signed(wire87[(2'h2):(2'h2)]));
              reg107 <= {$unsigned(reg100[(4'h9):(3'h7)]),
                  $signed((reg101 & ({wire96} ?
                      reg106[(4'hf):(2'h3)] : (wire95 ? wire95 : reg102))))};
              reg108 <= (|((+($unsigned(reg100) ?
                      $signed((8'hb6)) : reg103[(4'ha):(3'h7)])) ?
                  ($unsigned($unsigned((8'hbb))) ?
                      (!reg97[(4'hf):(4'hc)]) : reg106[(2'h3):(1'h1)]) : ((((8'ha2) >= reg104) * reg99) & {(~^wire88)})));
            end
          reg109 <= (({reg103} ?
              (wire95[(3'h7):(2'h3)] ~^ (~&(&wire91))) : ($unsigned(((7'h44) ?
                      wire88 : reg99)) ?
                  reg107 : reg99)) == (({reg107, (wire87 ? wire90 : reg100)} ?
              {reg103[(2'h2):(2'h2)]} : wire94) <= reg103));
          reg110 <= ((+$unsigned((((8'hac) || reg98) ?
                  (8'hb3) : (wire92 ? reg106 : wire95)))) ?
              (!(8'ha2)) : {reg98});
          reg111 <= (($unsigned($unsigned((~&reg108))) <<< wire93[(4'hc):(4'hb)]) - (-$unsigned((^~(~&reg110)))));
          reg112 <= $signed(((^(reg111[(4'hc):(4'hc)] != wire89)) ?
              $unsigned((-(wire94 ?
                  reg101 : wire88))) : (($unsigned((8'ha2)) <= (wire95 ?
                  (8'haa) : reg98)) >> (reg108 ?
                  (|reg106) : (wire92 ? wire91 : wire94)))));
        end
      else
        begin
          reg104 <= $unsigned($signed(((8'hb5) ?
              ({(8'hb0), (8'ha0)} ?
                  $signed(wire95) : reg97[(4'h8):(3'h7)]) : reg103[(4'hc):(1'h0)])));
          if ((~$signed((reg99 ? reg105 : (~reg109)))))
            begin
              reg105 <= $unsigned(((~^$signed(reg111)) ?
                  wire96 : ($signed({reg107}) - $unsigned($unsigned((8'hb8))))));
              reg106 <= $unsigned(($unsigned((8'ha2)) + reg99));
              reg107 <= (wire90 >> ((|((~reg111) ^~ reg112)) ?
                  ((wire89[(2'h2):(1'h0)] || (reg108 >= (8'hb3))) ^ $signed({reg104})) : wire95));
            end
          else
            begin
              reg105 <= $unsigned($signed((($signed(reg103) ?
                      reg111 : (reg105 + wire93)) ?
                  ((reg108 ~^ wire91) << (^~reg107)) : (^(&reg108)))));
              reg106 <= (~^(~&((&$unsigned(wire96)) ?
                  reg112[(4'hc):(3'h5)] : ($signed(reg112) ?
                      wire91[(2'h2):(2'h2)] : (reg98 ~^ reg99)))));
            end
          reg108 <= (((($signed((8'ha6)) ?
                  wire94[(4'hc):(4'hb)] : (reg101 ?
                      wire94 : reg105)) * (reg108[(4'hf):(1'h1)] ?
                  (^~reg100) : wire92)) >= wire96[(3'h5):(3'h5)]) ?
              (^$unsigned($signed((wire88 ^~ wire88)))) : ($signed(reg99) & reg111[(2'h2):(2'h2)]));
          if ((wire95 ? (~^$unsigned((+(-(8'hab))))) : (8'h9c)))
            begin
              reg109 <= wire96;
              reg110 <= $unsigned((!(((reg101 >= wire88) ~^ (reg107 ?
                      reg110 : wire94)) ?
                  $unsigned((wire93 + reg109)) : reg104)));
              reg111 <= (8'ha4);
              reg112 <= $unsigned($signed(reg104[(5'h10):(3'h7)]));
            end
          else
            begin
              reg109 <= reg101[(3'h4):(3'h4)];
              reg110 <= (8'ha6);
              reg111 <= {(($signed(wire96[(5'h13):(4'h9)]) ?
                      $unsigned((reg98 >>> reg112)) : (8'hbd)) >= reg98)};
              reg112 <= wire92[(5'h14):(4'hb)];
              reg113 <= wire88;
            end
        end
      if ({wire88[(2'h2):(1'h1)]})
        begin
          if (wire93[(1'h0):(1'h0)])
            begin
              reg114 <= $unsigned((($unsigned(reg106[(5'h11):(4'hf)]) >= ((|wire88) <<< $signed(reg107))) ?
                  wire96[(4'hd):(1'h0)] : (+$unsigned((reg105 ^ wire91)))));
              reg115 <= reg114;
            end
          else
            begin
              reg114 <= wire87;
            end
        end
      else
        begin
          if ((+reg109[(1'h1):(1'h1)]))
            begin
              reg114 <= $unsigned((wire96[(3'h5):(1'h1)] != $unsigned($signed((+reg107)))));
              reg115 <= $signed((wire90 ?
                  (~^({wire88,
                      reg97} << $unsigned(reg107))) : $unsigned($signed(reg109))));
              reg116 <= ($unsigned($signed($signed((8'hb9)))) ?
                  (wire94 + $unsigned({(reg101 == reg98),
                      (~^wire89)})) : (!(((reg111 * (8'hb9)) ^~ (^~wire87)) && $signed($signed(wire92)))));
              reg117 <= (+reg100);
            end
          else
            begin
              reg114 <= {((~&(reg102 ?
                      $unsigned(wire96) : {reg107,
                          reg108})) != $unsigned($unsigned((^reg108))))};
              reg115 <= reg107;
            end
          if (((reg113 >> reg107) ?
              $unsigned((reg98 ?
                  $signed((reg106 ?
                      wire95 : (7'h42))) : $signed(reg114[(3'h7):(3'h6)]))) : (^~$signed(((-wire91) ?
                  reg110[(2'h3):(2'h3)] : $unsigned(wire89))))))
            begin
              reg118 <= (reg110[(2'h2):(2'h2)] ^~ $unsigned($signed((-(wire88 < (8'hb0))))));
            end
          else
            begin
              reg118 <= $signed((~&(reg116 ?
                  ($signed(reg108) ?
                      (~(8'ha3)) : (reg113 == reg117)) : $unsigned($unsigned(wire92)))));
              reg119 <= ({$signed({reg107}),
                      (wire96 ^~ $signed($signed(reg118)))} ?
                  (~|$signed(wire87)) : (~&(($unsigned(wire90) ?
                      reg115 : wire88) > $signed((^~reg103)))));
            end
        end
      reg120 <= (8'hb0);
    end
  assign wire121 = $unsigned(reg120[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ((|{$signed((reg118[(1'h0):(1'h0)] != $unsigned(wire88))),
          $signed((+(!reg98)))}))
        begin
          reg122 <= $signed((~&reg103));
          if (reg101)
            begin
              reg123 <= {$signed((^~(8'ha0))), wire89};
              reg124 <= reg122;
              reg125 <= (~|((^~({wire89} | ((8'hb1) ?
                  wire94 : reg113))) >>> $signed($signed(wire91))));
              reg126 <= reg122[(3'h4):(3'h4)];
              reg127 <= $signed(((($unsigned(reg120) ?
                      reg97[(4'hf):(4'h8)] : (~^reg123)) & (^~reg104[(2'h2):(1'h0)])) ?
                  {reg118} : (&((wire121 ? reg114 : reg111) ?
                      $unsigned(reg113) : reg110[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg123 <= reg127[(3'h4):(3'h4)];
              reg124 <= $unsigned((($signed($signed(wire94)) ?
                  wire88 : (reg112 >>> (reg115 << wire88))) + $signed({reg109})));
            end
        end
      else
        begin
          reg122 <= (~^(+$unsigned($signed((wire93 <= wire92)))));
          reg123 <= {reg124[(3'h7):(1'h1)]};
        end
      reg128 <= reg125[(1'h0):(1'h0)];
      reg129 <= reg103[(3'h5):(3'h5)];
      reg130 <= $signed($signed((&$unsigned(((8'hbe) <= (8'had))))));
      if (({$signed(reg126[(4'h9):(3'h5)]), $unsigned((^~(-reg119)))} ?
          ((+{$signed(reg99)}) || ((((8'hac) ? reg98 : reg119) ?
              {reg113, reg103} : $signed(reg116)) << {(^reg105),
              {reg120, reg99}})) : (^~$signed($signed($signed(reg116))))))
        begin
          reg131 <= $unsigned($signed($unsigned(reg118[(2'h2):(1'h0)])));
          reg132 <= {wire92[(3'h5):(2'h2)]};
          reg133 <= reg112;
          if ((reg97 != (reg99 ?
              reg110[(1'h1):(1'h0)] : $unsigned($signed((reg118 <= reg115))))))
            begin
              reg134 <= (reg97[(2'h2):(1'h0)] >= ((^reg115) ?
                  {reg132} : $signed((reg115[(1'h0):(1'h0)] >= $signed(reg117)))));
              reg135 <= (reg132 ?
                  (&({((8'hb3) ? reg125 : reg132),
                      wire88[(2'h3):(2'h3)]} || reg120)) : (((reg117 ?
                          reg118 : (wire87 ~^ reg120)) + ((|reg118) | $signed(wire87))) ?
                      $signed((&(~&reg108))) : reg99[(1'h1):(1'h1)]));
              reg136 <= wire91;
              reg137 <= reg122[(4'h8):(3'h4)];
            end
          else
            begin
              reg134 <= (reg128 ?
                  reg137 : ($unsigned($unsigned((reg136 > wire94))) ?
                      $signed(reg98[(4'h8):(3'h7)]) : (($unsigned(wire94) > $signed(reg100)) > $unsigned((wire88 ?
                          reg116 : wire121)))));
            end
        end
      else
        begin
          if ((!{reg129[(4'hb):(4'hb)]}))
            begin
              reg131 <= $signed((~^$unsigned((^~(~^reg124)))));
            end
          else
            begin
              reg131 <= ((~&reg109) ?
                  {reg131[(2'h3):(1'h0)],
                      wire91[(2'h2):(1'h1)]} : $signed((~^(&(reg108 ?
                      reg111 : reg129)))));
              reg132 <= {reg104};
              reg133 <= (~^$signed((reg113 ?
                  ($unsigned(reg118) && $unsigned(wire94)) : reg111[(4'hc):(2'h3)])));
              reg134 <= ($signed((($unsigned(wire89) + $signed(reg98)) - (reg130[(3'h6):(3'h6)] || {wire94}))) < reg118);
            end
          reg135 <= reg109[(2'h2):(1'h0)];
          reg136 <= ($signed(reg115[(4'hf):(3'h6)]) > ((8'hb7) ?
              (({reg105} ?
                  (reg98 && wire87) : $unsigned(wire92)) & $signed((8'h9f))) : reg129[(4'hc):(3'h5)]));
        end
    end
endmodule
