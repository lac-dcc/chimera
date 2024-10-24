module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire64;
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire5,
                 wire6,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire64,
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
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= $unsigned($unsigned($unsigned(((wire1 ~^ wire0) ?
          wire2[(3'h4):(2'h2)] : (wire0 ? (8'hb3) : wire6)))));
      if ((wire5 ? (8'ha5) : wire3))
        begin
          reg8 <= $signed((^~(~^wire0[(2'h2):(1'h0)])));
        end
      else
        begin
          reg8 <= ((((&(wire1 >>> wire0)) - $unsigned((~|wire6))) ^ (((|reg7) < (~(8'had))) ?
              wire0 : wire5[(2'h2):(1'h0)])) ~^ $unsigned($unsigned($unsigned(wire5[(2'h2):(1'h1)]))));
          reg9 <= wire4[(3'h6):(3'h4)];
        end
      reg10 <= wire3[(5'h14):(3'h6)];
      if (((+(&(wire5[(1'h0):(1'h0)] ~^ (reg8 || wire5)))) != $unsigned((&wire6[(2'h3):(1'h1)]))))
        begin
          if (wire0)
            begin
              reg11 <= (wire1[(4'hb):(3'h6)] ?
                  ($unsigned((~(~|wire1))) != reg10) : (~&((-(~^(8'hba))) ?
                      ((reg10 ? wire0 : wire4) ?
                          $signed(reg10) : wire2) : wire2[(4'hb):(4'hb)])));
              reg12 <= $signed(((wire5 ?
                  reg11 : (wire2[(4'hb):(3'h5)] ?
                      $signed(wire4) : ((8'hb3) ?
                          wire5 : reg8))) * $unsigned($unsigned(wire2))));
              reg13 <= {($unsigned($unsigned((reg10 >= wire3))) ?
                      ($unsigned((reg9 ? wire0 : (7'h40))) ?
                          (8'ha2) : ((8'hbb) ?
                              $signed(wire4) : wire3[(5'h13):(4'hc)])) : (reg12 ?
                          (reg8 + (wire2 ?
                              wire1 : (8'ha0))) : $unsigned((reg12 ~^ reg9)))),
                  wire3};
            end
          else
            begin
              reg11 <= {$signed($unsigned(reg10)), wire1};
              reg12 <= (7'h43);
              reg13 <= {({(^wire2), reg9[(4'ha):(4'h8)]} ?
                      $signed(($unsigned(wire0) || $signed(wire3))) : $unsigned(wire3))};
              reg14 <= $signed((|({$unsigned(reg7), reg8} ?
                  $signed(((8'hbb) ?
                      reg9 : reg10)) : $unsigned(reg8[(3'h4):(2'h2)]))));
              reg15 <= wire1;
            end
          if (((|($signed((wire6 ? wire6 : (8'hb1))) ?
                  ($signed((7'h44)) ?
                      (^~(8'hbd)) : reg10) : $unsigned(reg11))) ?
              reg12[(4'hb):(4'h9)] : $unsigned(reg9[(4'h9):(1'h0)])))
            begin
              reg16 <= $unsigned((reg8 ?
                  $unsigned(wire4) : $unsigned((^~wire6))));
            end
          else
            begin
              reg16 <= (wire1 ?
                  (reg8 <<< reg14[(3'h4):(2'h3)]) : ($signed($signed(wire1)) ^ (~$unsigned($signed(wire6)))));
              reg17 <= wire5;
            end
          if ((8'haf))
            begin
              reg18 <= (8'had);
              reg19 <= (+wire1);
            end
          else
            begin
              reg18 <= (8'hbd);
              reg19 <= wire4[(5'h11):(4'hf)];
              reg20 <= $signed(reg18);
              reg21 <= {reg18[(4'hb):(4'hb)], wire2[(3'h6):(3'h4)]};
            end
          reg22 <= $unsigned({reg20});
          reg23 <= (^{reg12});
        end
      else
        begin
          reg11 <= ((reg15 > reg13) == reg15[(2'h2):(2'h2)]);
          reg12 <= $signed(reg17[(2'h2):(2'h2)]);
        end
    end
  assign wire24 = (&$unsigned((|(reg18[(5'h10):(4'hd)] || (reg13 ?
                      wire5 : wire2)))));
  assign wire25 = $unsigned(reg21);
  assign wire26 = ($signed(reg14[(1'h0):(1'h0)]) ?
                      reg21 : (({reg23,
                          (reg18 ? wire2 : wire5)} >> ((~&reg14) * {wire24,
                          (7'h41)})) * $signed($unsigned($signed(wire25)))));
  assign wire27 = wire24[(2'h3):(1'h0)];
  assign wire28 = ($signed((~^reg10)) + ($signed((~&reg8[(3'h4):(2'h2)])) ?
                      {((reg17 >> wire3) <<< $signed(reg10))} : $signed(((reg17 ?
                              wire27 : wire2) ?
                          $unsigned(reg22) : (wire3 < reg9)))));
  assign wire29 = (($unsigned(((-wire6) >> (wire27 | (8'ha0)))) ?
                      $signed($signed(wire28[(5'h10):(4'hf)])) : (&{$unsigned(reg10)})) || ($signed({$signed(reg11),
                      reg19}) << (~$signed(reg18))));
  module30 #() modinst65 (wire64, clk, reg18, wire27, reg20, reg10, reg22);
  assign wire66 = reg23;
  assign wire67 = (~|{($signed($unsigned(reg20)) ?
                          (8'h9c) : $unsigned($unsigned(reg14))),
                      $signed($unsigned(((8'ha5) && (7'h42))))});
endmodule

module module30
#(parameter param62 = ((((~^(^~(8'hbc))) ? ({(8'hb2), (8'hb0)} && ((8'ha6) != (8'hac))) : (((8'hbe) ~^ (8'h9e)) <<< (^(8'ha5)))) ? (^~(((8'ha8) >>> (8'hb9)) - ((8'hb0) ? (8'hae) : (7'h41)))) : ((~(-(8'hba))) + (|(+(8'haa))))) << (~^(((!(8'ha2)) + ((8'ha3) ? (8'hb1) : (8'hb1))) ? (((8'ha1) < (8'hab)) > ((8'hbe) ? (8'ha4) : (8'hbd))) : (~^(8'hb8))))), 
parameter param63 = (-param62))
(y, clk, wire31, wire32, wire33, wire34, wire35);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire32;
  input wire signed [(5'h13):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire34;
  input wire signed [(4'h8):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire [(4'h8):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire49;
  reg signed [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire49,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  module36 #() modinst50 (wire49, clk, wire34, wire32, wire35, wire33, wire31);
  always
    @(posedge clk) begin
      reg51 <= $signed($unsigned(wire33[(3'h6):(1'h1)]));
      reg52 <= (+wire33);
      reg53 <= wire32;
      reg54 <= (wire34 || $signed(reg51));
    end
  assign wire55 = $signed($unsigned(((8'ha6) ?
                      wire34[(4'h8):(1'h1)] : $unsigned(wire33[(4'he):(4'ha)]))));
  assign wire56 = (reg53[(1'h1):(1'h0)] ^ wire32[(3'h6):(3'h6)]);
  assign wire57 = wire56[(3'h6):(2'h3)];
  assign wire58 = (~&(~^wire35[(3'h5):(2'h3)]));
  assign wire59 = {(($signed((wire56 >>> wire56)) ?
                          reg52 : ((wire57 ? wire31 : wire55) + {reg52,
                              wire31})) >> ($signed((~^(8'h9c))) ?
                          (wire55[(3'h7):(1'h0)] ^ {reg54}) : wire56[(1'h0):(1'h0)]))};
  assign wire60 = {reg52[(3'h5):(1'h0)],
                      ($signed($signed(wire49)) ^~ $signed({$signed((8'ha5))}))};
  assign wire61 = (^~($unsigned({{(8'hb8), wire35}}) && wire58));
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire41;
  input wire signed [(3'h7):(1'h0)] wire40;
  input wire signed [(4'h8):(1'h0)] wire39;
  input wire [(2'h3):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  assign y = {wire48, wire47, wire46, wire45, wire44, wire43, wire42, (1'h0)};
  assign wire42 = $signed(({wire41} ?
                      $signed(wire38[(1'h1):(1'h1)]) : (({(8'haa)} ?
                          (wire37 != (8'hb4)) : {wire39}) <= ((wire37 ?
                              wire41 : wire37) ?
                          wire38[(2'h2):(2'h2)] : wire37))));
  assign wire43 = $unsigned($unsigned(wire42[(3'h6):(1'h0)]));
  assign wire44 = ((wire39[(3'h4):(1'h0)] < wire39) ?
                      $signed(($signed((wire41 ? wire40 : wire40)) ?
                          {wire41} : (-((8'hb0) * wire43)))) : $signed((8'ha1)));
  assign wire45 = wire39[(2'h2):(1'h0)];
  assign wire46 = wire40;
  assign wire47 = $unsigned($unsigned(($signed($signed((8'hbc))) != wire44)));
  assign wire48 = wire45[(1'h1):(1'h0)];
endmodule
