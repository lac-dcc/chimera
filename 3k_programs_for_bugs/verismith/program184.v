module top #(parameter param73 = (8'hb8)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire68,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg70,
                 (1'h0)};
  assign wire4 = $unsigned({(8'hba),
                     ($unsigned(((8'h9f) < (8'h9d))) ?
                         $unsigned((&wire2)) : $unsigned(((8'hbb) ?
                             wire1 : wire2)))});
  assign wire5 = $signed(wire1);
  assign wire6 = wire4;
  assign wire7 = $signed((+(wire1 * wire1[(3'h4):(1'h1)])));
  assign wire8 = (|wire0[(3'h4):(2'h2)]);
  assign wire9 = wire1;
  assign wire10 = wire0;
  assign wire11 = (($unsigned($unsigned(wire10[(1'h0):(1'h0)])) ?
                      ($signed($signed(wire8)) || $unsigned(wire8)) : {wire1[(4'hb):(1'h0)]}) >>> wire1[(4'hb):(4'h8)]);
  assign wire12 = {$signed((((wire4 ? wire7 : wire5) ?
                              ((7'h44) ? (7'h44) : wire9) : $signed(wire7)) ?
                          ($unsigned(wire8) >>> (wire6 ?
                              wire3 : wire5)) : ($signed((8'hae)) ?
                              (~^wire4) : (wire7 ^ wire10))))};
  assign wire13 = $signed($unsigned(wire11));
  module14 #() modinst69 (wire68, clk, wire12, wire10, wire5, wire7);
  always
    @(posedge clk) begin
      if (((^$unsigned($unsigned($unsigned(wire68)))) << {{wire8},
          ($signed((^~wire3)) + ((wire12 ?
              wire11 : wire3) != (wire11 ^~ wire13)))}))
        begin
          reg70 <= wire8[(1'h0):(1'h0)];
        end
      else
        begin
          reg70 <= wire10[(4'h8):(1'h0)];
        end
    end
  assign wire71 = wire11[(2'h3):(1'h1)];
  assign wire72 = wire6;
endmodule

module module14
#(parameter param67 = (((~(((8'ha4) ? (8'hba) : (8'haa)) ? ((8'hb4) ? (8'hb1) : (8'hb7)) : {(8'ha1)})) || {{((7'h44) == (8'h9c))}}) - {(+(|((8'h9f) ? (8'ha0) : (8'hba))))}))
(y, clk, wire15, wire16, wire17, wire18);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire17;
  input wire [(5'h14):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire [(4'h8):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire62;
  assign y = {wire66, wire65, wire64, wire30, wire32, wire62, (1'h0)};
  module19 #() modinst31 (wire30, clk, wire17, wire18, wire15, wire16);
  assign wire32 = (^$signed(wire16));
  module33 #() modinst63 (wire62, clk, wire32, wire16, wire15, wire30, wire18);
  assign wire64 = wire32[(4'h8):(1'h0)];
  assign wire65 = (~|$unsigned($signed(wire16[(4'hf):(2'h3)])));
  assign wire66 = {((&$unsigned((~^wire17))) | wire17)};
endmodule

module module33  (y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire38;
  input wire [(4'hd):(1'h0)] wire37;
  input wire signed [(5'h13):(1'h0)] wire36;
  input wire signed [(4'hd):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire61;
  wire signed [(3'h6):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire46;
  wire signed [(4'he):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  reg [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
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
                 (1'h0)};
  assign wire39 = $unsigned(wire34);
  assign wire40 = wire34[(4'hf):(4'he)];
  assign wire41 = {{(((~wire35) ? (8'had) : wire36[(1'h1):(1'h1)]) ?
                              (((8'ha0) >> (8'hb4)) ?
                                  ((8'hb9) ?
                                      wire37 : (8'hbc)) : (wire34 >> wire35)) : ($unsigned(wire37) ?
                                  wire36[(2'h3):(2'h3)] : (wire37 * wire35)))},
                      $signed(wire34)};
  assign wire42 = (8'hb4);
  assign wire43 = wire35[(1'h0):(1'h0)];
  assign wire44 = $unsigned((wire41 ?
                      wire40[(3'h7):(3'h6)] : {(-wire36[(4'hb):(3'h6)])}));
  assign wire45 = ({wire42[(4'h8):(3'h5)],
                      $unsigned((~^(wire36 >>> wire41)))} == {(!({wire38,
                              wire35} ?
                          (wire35 ? (8'hba) : wire38) : (wire42 ?
                              wire38 : wire37))),
                      $signed((!(wire42 || wire34)))});
  assign wire46 = (((wire40 < $signed(wire44)) * $unsigned($signed((^wire45)))) && wire36);
  always
    @(posedge clk) begin
      reg47 <= $signed((~|(^~($signed((8'ha5)) ?
          wire35[(2'h2):(1'h1)] : ((8'hb6) ? wire45 : wire36)))));
      reg48 <= wire42[(3'h6):(2'h3)];
      if (wire42[(4'ha):(2'h2)])
        begin
          reg49 <= wire39[(4'h8):(1'h0)];
          reg50 <= (8'h9d);
          reg51 <= reg50[(4'ha):(1'h1)];
        end
      else
        begin
          reg49 <= wire46;
          reg50 <= (wire40 | {{((wire34 ? (8'hb1) : (8'hb0)) ?
                      ((8'hbe) * reg48) : (wire46 - reg50))},
              {$unsigned((wire40 ? wire36 : (8'hbe))),
                  ((wire39 > wire41) ?
                      wire42[(1'h1):(1'h0)] : {wire37, wire34})}});
          reg51 <= $signed({($unsigned(reg51) >>> $signed($signed(reg50)))});
          if ($unsigned((8'ha9)))
            begin
              reg52 <= $signed((~^$unsigned(((wire43 ? reg48 : reg47) ?
                  (wire46 ? wire37 : reg48) : reg49[(5'h14):(4'hc)]))));
            end
          else
            begin
              reg52 <= $unsigned((wire42 & $unsigned(wire35)));
              reg53 <= $signed((~&$signed(reg52)));
              reg54 <= $signed(reg49);
              reg55 <= reg47;
              reg56 <= $signed({wire44});
            end
          if ($unsigned((wire39[(4'h9):(2'h3)] ?
              wire41 : (~|wire36[(3'h5):(2'h2)]))))
            begin
              reg57 <= (&wire44);
              reg58 <= (wire42[(3'h6):(2'h3)] ?
                  ((wire41 >>> (-((8'hb4) ?
                      reg52 : reg48))) && wire38) : $signed({((-wire34) ?
                          ((8'ha4) ? reg52 : reg49) : reg55)}));
              reg59 <= $signed(({wire38,
                      $unsigned((wire36 ? wire38 : wire39))} ?
                  (wire37 ?
                      ((~&wire36) ?
                          (wire46 ?
                              wire43 : reg56) : wire44) : $unsigned(wire43[(3'h7):(3'h6)])) : wire45));
            end
          else
            begin
              reg57 <= (~$signed($unsigned($signed($unsigned((8'ha8))))));
              reg58 <= reg54;
            end
        end
    end
  assign wire60 = reg49[(4'he):(3'h5)];
  assign wire61 = (|$unsigned(wire41));
endmodule

module module19
#(parameter param29 = (~|((&{(^(8'ha3))}) >>> ((~^((8'hb8) ? (8'h9e) : (8'haa))) > {(~&(8'ha9))}))))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire23;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  assign y = {wire28, wire27, wire26, reg25, reg24, (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= {$signed({wire23[(3'h7):(2'h2)],
              ((wire22 >> (8'h9f)) ? wire21 : wire22[(4'h9):(2'h3)])}),
          ($unsigned((~|wire22[(3'h6):(3'h4)])) < wire20[(4'hb):(4'hb)])};
      reg25 <= (-(^($unsigned(reg24[(1'h0):(1'h0)]) * {(|wire23),
          $signed(reg24)})));
    end
  assign wire26 = $signed((8'ha9));
  assign wire27 = wire26[(4'ha):(1'h0)];
  assign wire28 = reg24;
endmodule
