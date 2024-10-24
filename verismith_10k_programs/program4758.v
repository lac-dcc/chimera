module top
#(parameter param37 = (!{(|((^(8'hac)) ? ((7'h41) ? (8'ha6) : (8'haa)) : ((8'hb0) ? (8'hbd) : (8'had))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg7 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire11,
                 wire10,
                 wire6,
                 wire5,
                 wire4,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire0[(3'h4):(2'h2)];
  assign wire5 = ($signed(wire3[(5'h12):(4'hf)]) < (wire4[(3'h4):(2'h3)] * (~&{((8'hb5) > wire0)})));
  assign wire6 = wire3[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg7 <= (&$signed((8'ha7)));
      reg8 <= $unsigned((wire1[(4'hd):(4'hc)] ?
          (^~(^(wire2 ? (7'h44) : wire0))) : {{(~(8'hb0))}, wire1}));
      reg9 <= ((!$signed($signed($signed(wire4)))) | (^$signed(wire0)));
    end
  assign wire10 = ((~^({$unsigned(wire0), $unsigned(reg8)} != (!(8'hb9)))) ?
                      (reg9[(3'h6):(3'h5)] | wire5[(1'h1):(1'h0)]) : {$unsigned(((wire1 - wire1) ?
                              wire3 : $unsigned(wire3))),
                          {((wire6 ? wire5 : wire1) < wire4), (~^{wire0})}});
  assign wire11 = (8'hb2);
  always
    @(posedge clk) begin
      reg12 <= wire4[(4'h9):(3'h6)];
      reg13 <= $unsigned($signed(wire3));
      reg14 <= $signed((^(~^{(!wire2)})));
      if ({$signed(wire0[(1'h1):(1'h1)])})
        begin
          reg15 <= (wire11[(2'h2):(1'h0)] ?
              $unsigned({(((8'had) ? wire10 : (8'ha7)) - $unsigned(reg7)),
                  wire3[(3'h5):(3'h4)]}) : $unsigned((7'h40)));
          if (wire11)
            begin
              reg16 <= ((({$unsigned(reg7)} << reg13[(4'ha):(2'h3)]) ?
                  $signed(({reg15} << $unsigned(reg13))) : reg12) >>> {wire1});
              reg17 <= (8'hae);
              reg18 <= $unsigned($signed((~^(~&(^reg8)))));
            end
          else
            begin
              reg16 <= $unsigned((((~&reg8) == (+(wire10 ? reg17 : wire0))) ?
                  (!(reg17[(1'h0):(1'h0)] <<< reg14)) : {((+wire5) ?
                          reg16[(4'hb):(3'h5)] : (~&(8'ha7)))}));
              reg17 <= reg18;
              reg18 <= $unsigned(($signed($unsigned($unsigned(reg17))) ?
                  $unsigned((+$signed(wire0))) : (reg16[(4'ha):(3'h4)] <<< {(wire2 < (7'h44)),
                      wire3})));
            end
        end
      else
        begin
          if (wire0)
            begin
              reg15 <= (&$signed((!wire0[(1'h1):(1'h1)])));
              reg16 <= reg16;
              reg17 <= (^~(8'hb9));
              reg18 <= reg18;
            end
          else
            begin
              reg15 <= (^(7'h41));
              reg16 <= wire1[(4'he):(3'h6)];
              reg17 <= ((^~$signed(wire1[(1'h1):(1'h0)])) > (&$signed(($unsigned(reg14) ^~ {reg15,
                  reg9}))));
            end
          reg19 <= $signed(wire11[(5'h15):(4'hc)]);
          reg20 <= (8'hb0);
          reg21 <= (wire5 ?
              (~|(^$signed(((8'hb3) ^~ (8'hbe))))) : ({wire3[(4'hb):(2'h2)]} ?
                  $signed(wire5[(2'h2):(1'h1)]) : (~|(((7'h41) ?
                          wire3 : (8'hb9)) ?
                      (reg18 ? (8'hb6) : reg14) : wire4[(5'h15):(4'hd)]))));
          if ($unsigned({({reg21[(5'h14):(2'h2)], wire5} ?
                  (+{reg20, wire2}) : $unsigned({reg16})),
              $signed((^reg13))}))
            begin
              reg22 <= wire10[(3'h4):(1'h0)];
              reg23 <= ({$unsigned((~|$unsigned(reg21)))} ?
                  (~&$signed(reg21)) : $unsigned(($signed((reg12 << wire5)) >> reg17)));
              reg24 <= wire6[(2'h2):(1'h0)];
              reg25 <= ({(!$signed((reg21 < wire10)))} && (reg7[(1'h1):(1'h1)] && reg14));
              reg26 <= {(((wire6[(3'h5):(3'h5)] ?
                      (reg12 ?
                          wire4 : (7'h40)) : (^~reg7)) & reg25) <<< wire3[(4'ha):(2'h3)]),
                  (|$unsigned((~$signed(reg14))))};
            end
          else
            begin
              reg22 <= $unsigned((!reg16[(1'h1):(1'h1)]));
              reg23 <= ($unsigned($signed($unsigned($signed(reg24)))) < (~$unsigned(($signed((8'hb7)) ?
                  (reg13 ? reg26 : wire1) : reg16[(4'hb):(4'h9)]))));
            end
        end
      reg27 <= $signed({wire1});
    end
  always
    @(posedge clk) begin
      reg28 <= reg13;
      reg29 <= (($unsigned(wire5[(1'h0):(1'h0)]) + ($signed(wire4[(5'h13):(5'h10)]) <<< $signed((reg8 & (7'h44))))) ?
          {($unsigned(reg15) + ((wire6 != reg27) ?
                  {wire3} : (^~wire4)))} : reg17);
      reg30 <= reg26;
      reg31 <= (reg30 ^ $unsigned(wire4));
      reg32 <= ($unsigned($signed((~^(reg14 <<< wire6)))) ?
          ((wire3[(5'h13):(3'h5)] ?
                  $unsigned(wire6[(1'h1):(1'h1)]) : (-reg15[(1'h1):(1'h0)])) ?
              $signed((^(7'h40))) : $unsigned($unsigned(reg25[(2'h3):(2'h2)]))) : {$signed($signed(reg20[(4'hd):(3'h4)])),
              reg27[(3'h4):(3'h4)]});
    end
  assign wire33 = (~$unsigned(reg22[(5'h15):(4'hc)]));
  assign wire34 = (8'hbf);
  assign wire35 = reg26[(3'h6):(3'h5)];
  assign wire36 = reg28[(3'h5):(3'h4)];
endmodule
