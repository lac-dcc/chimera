module top
#(parameter param15 = ({(~|((~(8'hb6)) > (|(8'hab))))} != ({(8'h9d)} ~^ (((!(8'hb5)) <= ((7'h40) ? (8'h9e) : (8'hae))) >= (-(^~(8'ha6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire14,
                 wire13,
                 wire5,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed($signed({wire2}));
  always
    @(posedge clk) begin
      reg6 <= wire1[(1'h1):(1'h0)];
      if ($unsigned({$signed($signed((wire3 ? wire4 : wire2))), wire2}))
        begin
          reg7 <= $unsigned((($signed($signed(wire5)) & (-(-wire2))) & ($unsigned((wire0 ?
              wire5 : wire5)) - ($signed(wire5) < $unsigned(wire4)))));
          reg8 <= $unsigned((wire3 ?
              reg7[(4'h8):(3'h5)] : $unsigned(({reg7} ?
                  reg7 : $unsigned(reg7)))));
          reg9 <= ((reg8[(1'h1):(1'h1)] ?
                  (((reg6 - reg8) ^~ (wire5 ?
                      (8'hbe) : reg6)) || reg7[(4'h8):(3'h6)]) : $signed(reg6)) ?
              (wire0[(1'h0):(1'h0)] ?
                  $unsigned((|(reg7 ?
                      wire2 : reg8))) : wire4) : ({$signed((^wire3)),
                      (-(+wire5))} ?
                  reg8 : $unsigned(($signed(reg7) ? wire2 : reg8))));
          reg10 <= (reg9 ~^ $signed((($unsigned(reg6) ?
                  (reg9 ? reg8 : reg9) : $signed((8'h9e))) ?
              {(wire0 + wire0)} : $signed({wire1, reg9}))));
        end
      else
        begin
          reg7 <= (|wire2);
          reg8 <= ($signed((7'h43)) >> reg9);
        end
      reg11 <= wire0;
      reg12 <= (reg10 ?
          $unsigned($signed(reg7)) : ({wire3, (&$signed(reg9))} ?
              reg10 : (8'h9e)));
    end
  assign wire13 = $unsigned(($unsigned(wire2) ?
                      reg7[(3'h6):(1'h0)] : $unsigned({reg8[(2'h2):(1'h1)]})));
  assign wire14 = wire4;
endmodule
