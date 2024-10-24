module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire30,
                 wire29,
                 wire28,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire11,
                 wire5,
                 reg33,
                 reg32,
                 reg31,
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
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      reg6 <= (($signed(wire3[(4'hd):(1'h0)]) ? {wire4} : (~&(8'ha4))) ?
          wire2[(3'h5):(2'h2)] : (($signed($signed(wire3)) <<< $signed($unsigned(wire1))) >= $unsigned(wire2)));
      if (($unsigned((reg6 >>> reg6[(2'h2):(2'h2)])) ?
          (|(8'hab)) : reg6[(3'h4):(3'h4)]))
        begin
          reg7 <= (+$unsigned(wire4[(2'h3):(2'h3)]));
          reg8 <= $signed((($unsigned((^~wire5)) ?
                  (8'haa) : (^(wire3 ~^ wire4))) ?
              ((wire1[(3'h7):(2'h2)] - (wire5 + wire1)) - ($signed(wire0) || wire5)) : ((8'ha6) << ($unsigned(wire0) ?
                  (|reg7) : wire1))));
        end
      else
        begin
          reg7 <= $unsigned($signed(wire4[(4'he):(3'h7)]));
        end
      reg9 <= wire5;
      reg10 <= (^$unsigned($unsigned((wire3 ?
          {reg8, (8'hbf)} : $signed(reg6)))));
    end
  assign wire11 = $unsigned($signed((&$unsigned($unsigned(wire4)))));
  always
    @(posedge clk) begin
      reg12 <= ((($unsigned((reg7 ? wire1 : wire2)) ?
                  $unsigned((reg9 ? wire3 : reg10)) : (~((8'hac) ?
                      wire4 : (8'hac)))) ?
              (+$unsigned((wire1 > wire11))) : ((reg7 == (~^(8'ha8))) << ($unsigned(reg8) ?
                  $signed(wire3) : wire4))) ?
          (~&($unsigned((reg7 ?
              reg8 : reg9)) >>> (&{reg9}))) : $unsigned((wire2[(3'h4):(2'h3)] >= {$signed(reg8),
              (wire4 < reg10)})));
      reg13 <= $signed({(($signed((8'haa)) ?
              (reg10 ^ reg8) : ((8'haf) ^~ wire2)) != ((!reg9) ^ $unsigned(wire5))),
          $unsigned({(-(7'h42)), $signed(wire1)})});
    end
  assign wire14 = reg8[(4'hc):(1'h1)];
  assign wire15 = ((-$signed($signed($signed(wire0)))) ?
                      ($signed(((reg8 >> wire14) ^ (~&reg8))) ?
                          wire11[(3'h5):(2'h2)] : reg8[(3'h5):(2'h2)]) : ($unsigned({(8'ha5),
                              (&wire5)}) ?
                          $signed(reg10) : wire11[(1'h1):(1'h0)]));
  assign wire16 = wire15;
  assign wire17 = $signed($signed($signed(wire14)));
  always
    @(posedge clk) begin
      if ({reg8,
          (((|wire5) ? reg13[(1'h0):(1'h0)] : $signed($signed(wire11))) ?
              ((^~reg12[(1'h0):(1'h0)]) ?
                  wire11 : ({wire15, reg7} <<< (|reg7))) : ($signed((reg9 ?
                      reg12 : wire0)) ?
                  $unsigned((wire11 << reg12)) : {wire16[(3'h7):(1'h1)],
                      (reg10 ? reg6 : wire11)}))})
        begin
          reg18 <= {$unsigned(wire17[(1'h1):(1'h1)]), wire15[(3'h4):(3'h4)]};
        end
      else
        begin
          reg18 <= {$signed((^{(+reg13), reg12}))};
          reg19 <= wire17[(1'h0):(1'h0)];
        end
      reg20 <= $unsigned(reg19[(2'h2):(2'h2)]);
      if (reg9)
        begin
          reg21 <= $unsigned($signed(({$unsigned(reg7),
              (wire11 ? reg18 : reg20)} | ($signed(wire4) ?
              ((8'ha8) < wire14) : (~|reg7)))));
          reg22 <= {$signed(((!reg19) == reg21))};
          reg23 <= (wire0 | (-$signed((reg7[(1'h0):(1'h0)] ?
              $unsigned(wire3) : {reg10, reg19}))));
        end
      else
        begin
          if ($unsigned({wire3[(4'ha):(3'h6)],
              (reg21[(3'h6):(1'h0)] & (+(&reg19)))}))
            begin
              reg21 <= (&$unsigned(reg7[(4'hb):(1'h0)]));
              reg22 <= (reg12[(1'h0):(1'h0)] - {$signed(($unsigned((8'ha4)) > $unsigned(wire2)))});
              reg23 <= (reg9[(4'h8):(3'h4)] ^ $unsigned(reg13));
              reg24 <= $unsigned(wire11[(1'h1):(1'h0)]);
              reg25 <= reg10[(2'h3):(1'h1)];
            end
          else
            begin
              reg21 <= $signed((8'ha2));
            end
        end
      reg26 <= ((-$unsigned(wire17)) ^~ reg8[(5'h11):(4'he)]);
      reg27 <= wire15[(3'h4):(1'h0)];
    end
  assign wire28 = $signed(wire0);
  assign wire29 = reg12;
  assign wire30 = wire0[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg31 <= $unsigned(wire5[(2'h2):(1'h1)]);
      reg32 <= ((reg13[(1'h1):(1'h0)] ?
          wire0 : $signed(($unsigned(wire3) >= $signed(wire4)))) * reg22[(2'h3):(2'h2)]);
      reg33 <= $signed($signed((&{(|reg13), (wire3 <= wire11)})));
    end
  assign wire34 = (~$unsigned($signed($signed((&reg22)))));
  assign wire35 = ((~&((+wire1) ?
                      (wire34[(1'h0):(1'h0)] ?
                          (^wire14) : $unsigned((8'ha1))) : {(~&(8'hb3)),
                          $signed(reg32)})) || wire34);
  assign wire36 = reg23[(4'hb):(4'ha)];
endmodule
