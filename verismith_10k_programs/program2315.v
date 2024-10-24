module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire56,
                 wire53,
                 wire52,
                 wire50,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire24,
                 wire23,
                 wire22,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg55,
                 reg54,
                 reg27,
                 reg26,
                 reg25,
                 reg21,
                 reg20,
                 reg19,
                 reg13,
                 reg12,
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
      if (wire1)
        begin
          reg5 <= wire0[(4'hb):(4'h8)];
          reg6 <= $signed($unsigned(wire0[(4'h9):(1'h1)]));
          if ($signed(wire1))
            begin
              reg7 <= (~|(8'h9e));
              reg8 <= ({wire3} ?
                  $signed(wire0) : ((~&(wire3 ?
                      reg7 : $unsigned(reg6))) == (~(~wire2))));
              reg9 <= $signed({reg6});
              reg10 <= reg5[(2'h2):(1'h0)];
              reg11 <= $signed((($signed((wire3 ? reg5 : reg9)) ?
                      reg7 : ((~|(8'hbf)) * (8'h9c))) ?
                  wire1[(2'h2):(1'h0)] : (~^(~^$signed((8'h9d))))));
            end
          else
            begin
              reg7 <= $signed($signed(reg9[(4'h8):(3'h5)]));
              reg8 <= ($unsigned((~&(wire3[(3'h7):(1'h1)] ~^ (~&reg7)))) - reg9[(1'h0):(1'h0)]);
            end
          reg12 <= wire3;
          reg13 <= ($signed($signed(wire0)) ?
              reg11[(3'h7):(1'h1)] : (|(-{reg8[(1'h1):(1'h1)], {reg12}})));
        end
      else
        begin
          reg5 <= (~&(|reg11));
          reg6 <= ((((^~(wire3 ? reg5 : (8'hb9))) <= {wire3}) & (8'hbc)) ?
              reg10 : wire1[(3'h7):(3'h7)]);
          reg7 <= ($signed($signed($signed({(8'hb4), wire3}))) ?
              reg5[(1'h1):(1'h1)] : (reg9[(4'h9):(3'h4)] >>> wire3[(4'hc):(1'h1)]));
          reg8 <= $unsigned($signed((8'hb8)));
          reg9 <= reg5;
        end
    end
  assign wire14 = $unsigned($signed(wire1[(3'h6):(3'h5)]));
  assign wire15 = reg12[(3'h4):(1'h0)];
  assign wire16 = (8'ha5);
  assign wire17 = reg6;
  assign wire18 = ((((8'hb0) ? {wire1} : $unsigned((wire1 || reg7))) ?
                      wire2[(4'ha):(3'h5)] : reg5[(2'h2):(1'h1)]) == $unsigned($signed(reg5[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg19 <= $unsigned((wire17 ?
          (((wire1 ? reg12 : wire15) ? $unsigned(reg6) : $signed(reg8)) ?
              wire18 : (wire0 ? reg12 : (8'h9d))) : reg5));
      reg20 <= reg19;
      reg21 <= (wire1[(2'h3):(2'h3)] ?
          wire15[(4'hd):(3'h6)] : $signed((~^reg6)));
    end
  assign wire22 = (!wire18[(1'h0):(1'h0)]);
  assign wire23 = ($unsigned(wire15) ? (8'h9f) : (^~$unsigned((^~(~&reg10)))));
  assign wire24 = (((-reg21[(4'ha):(3'h6)]) | $signed((reg20 >= $unsigned(reg11)))) ?
                      {reg5} : $signed((8'ha7)));
  always
    @(posedge clk) begin
      reg25 <= ($unsigned($signed($signed($signed(wire17)))) + wire0);
      reg26 <= wire18[(4'hb):(3'h6)];
      reg27 <= $unsigned($unsigned(reg20[(4'hf):(3'h7)]));
    end
  assign wire28 = wire14[(3'h4):(1'h0)];
  assign wire29 = (reg6[(2'h3):(2'h2)] | (!reg11[(1'h0):(1'h0)]));
  assign wire30 = $signed(wire15);
  assign wire31 = wire30[(2'h2):(2'h2)];
  module32 #() modinst51 (wire50, clk, wire15, wire14, wire28, wire3);
  assign wire52 = (!(((+wire15) ? (~&(!reg27)) : (&(~^reg11))) ?
                      {(reg26[(4'h8):(2'h2)] ? ((7'h44) | reg5) : reg19),
                          {$unsigned(wire29)}} : (+(+(8'hb5)))));
  assign wire53 = wire52[(4'he):(4'ha)];
  always
    @(posedge clk) begin
      reg54 <= ($unsigned(wire30[(2'h3):(2'h3)]) ?
          ((wire29[(3'h5):(2'h3)] - wire28[(4'h8):(3'h4)]) ?
              reg7[(3'h6):(2'h3)] : $signed($unsigned((wire52 ?
                  reg6 : wire16)))) : (~^$signed(reg27)));
      reg55 <= ((&(!$unsigned((^~reg26)))) ?
          (reg9[(1'h1):(1'h1)] == wire0[(3'h5):(3'h5)]) : wire16);
    end
  assign wire56 = (((7'h40) ?
                          {(reg19 ? wire24[(1'h1):(1'h1)] : {wire16, reg25}),
                              (~wire1[(2'h2):(2'h2)])} : (reg20 ?
                              $unsigned((!reg55)) : (!{(7'h44)}))) ?
                      ({(~^(reg10 >> (8'ha1)))} && reg8[(4'hf):(1'h1)]) : ((reg19 ?
                          reg7[(4'hc):(3'h4)] : $unsigned((reg12 ?
                              (8'hbf) : reg6))) < reg5));
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire36;
  input wire signed [(4'hd):(1'h0)] wire35;
  input wire [(4'ha):(1'h0)] wire34;
  input wire signed [(4'he):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
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
                 (1'h0)};
  assign wire37 = $unsigned((+(wire36 ^~ {{wire36}})));
  assign wire38 = wire34;
  assign wire39 = $signed($unsigned(wire38[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      if (wire34)
        begin
          if (wire39)
            begin
              reg40 <= (((wire36[(1'h0):(1'h0)] & wire38[(4'hb):(3'h4)]) && (~|$unsigned($signed(wire38)))) ?
                  {$signed($unsigned(wire33[(3'h5):(1'h0)]))} : ({$unsigned((wire37 ?
                              wire37 : wire39))} ?
                      (8'hb5) : $signed((+((8'hb7) > wire39)))));
              reg41 <= reg40;
              reg42 <= $unsigned((wire34 ?
                  $unsigned(wire39) : wire39[(1'h1):(1'h1)]));
              reg43 <= (8'hbd);
              reg44 <= ($unsigned((^{$signed(wire36), wire39[(3'h7):(1'h0)]})) ?
                  (+((|(^reg40)) - reg42[(4'h9):(4'h8)])) : $signed((wire36[(3'h6):(3'h4)] <= reg40[(1'h1):(1'h1)])));
            end
          else
            begin
              reg40 <= (~|$signed((reg43 ? wire33 : wire39[(1'h1):(1'h1)])));
              reg41 <= (|wire39[(2'h3):(1'h0)]);
            end
          if (({$unsigned(((reg42 < wire33) ?
                  (reg41 ? wire34 : wire39) : (8'h9f))),
              reg41} != wire35))
            begin
              reg45 <= ((({(reg43 ? reg42 : wire39)} >= ({reg43,
                      wire39} ~^ (reg44 ^ (8'hb6)))) >= {((|reg42) ?
                          $unsigned((7'h43)) : (wire37 ? reg43 : reg42)),
                      $signed($signed(wire37))}) ?
                  wire38[(3'h6):(3'h4)] : reg43);
            end
          else
            begin
              reg45 <= $unsigned(wire39);
            end
          reg46 <= ((|$unsigned((!(wire38 << wire34)))) ?
              (~&(($unsigned(reg43) <= reg43[(4'he):(4'ha)]) | {(wire39 | reg45),
                  (~^wire39)})) : wire39[(3'h7):(3'h7)]);
          reg47 <= reg40;
          reg48 <= (wire33 ?
              $signed(wire34) : {$unsigned((reg42 ?
                      (-wire39) : (wire38 ? reg46 : wire38))),
                  ($signed(wire35) ?
                      (wire39 ? reg47 : (reg45 & reg47)) : ({reg44, wire37} ?
                          (reg45 ? wire39 : wire36) : {(8'haf), reg44}))});
        end
      else
        begin
          if ($unsigned(wire39))
            begin
              reg40 <= (reg43[(1'h0):(1'h0)] ?
                  $signed(({(~&(8'hab))} & ((wire39 ? reg48 : (7'h41)) ?
                      reg42[(3'h5):(1'h1)] : ((7'h44) >= reg47)))) : ($unsigned(((8'hb7) || $signed(reg40))) || $unsigned($unsigned($unsigned(reg42)))));
              reg41 <= (~^{(~|$signed((wire34 ? wire37 : reg47))), (^(8'ha4))});
              reg42 <= $signed($unsigned((((reg45 >>> reg46) >>> $signed(wire37)) * wire37)));
            end
          else
            begin
              reg40 <= {$signed(wire39),
                  ($unsigned(reg40) ?
                      (!wire38[(3'h7):(3'h5)]) : (^~wire35[(3'h7):(2'h2)]))};
            end
          reg43 <= $signed((~&$signed(wire34)));
          reg44 <= $unsigned($unsigned($unsigned($signed((reg47 ?
              reg44 : reg45)))));
        end
    end
  always
    @(posedge clk) begin
      reg49 <= {reg44[(2'h3):(1'h0)]};
    end
endmodule
