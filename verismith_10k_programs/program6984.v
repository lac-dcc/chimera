module top
#(parameter param16 = {{(&((^~(7'h43)) >>> {(8'hb4)}))}, (|{(((8'ha2) ? (8'ha9) : (8'ha1)) & ((8'hb3) > (8'hbe)))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire0[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if (wire2[(1'h1):(1'h0)])
        begin
          reg6 <= (-$signed((wire1[(2'h2):(1'h1)] == $unsigned($unsigned(wire4)))));
          reg7 <= wire5[(4'hf):(4'hd)];
        end
      else
        begin
          reg6 <= reg7[(3'h6):(3'h6)];
          reg7 <= {(~&$signed($unsigned({wire4, wire1}))),
              $signed(($signed(wire4[(3'h7):(2'h3)]) << {(wire4 ?
                      (8'hb2) : wire5)}))};
          reg8 <= wire5;
          reg9 <= (|$signed(wire2[(3'h6):(3'h5)]));
          reg10 <= (({wire0} ?
              reg6 : $signed(((wire0 ? reg7 : reg7) >> reg7))) - wire5);
        end
      if (reg9[(3'h4):(1'h1)])
        begin
          reg11 <= $unsigned(((!reg7[(1'h0):(1'h0)]) ?
              ($unsigned($unsigned(reg8)) * reg10) : (7'h42)));
        end
      else
        begin
          reg11 <= $signed(wire1);
          reg12 <= $unsigned((7'h40));
        end
      reg13 <= $signed($unsigned({reg12[(3'h6):(3'h4)]}));
    end
  assign wire14 = {$signed(($signed($unsigned((8'hbe))) + reg12))};
  assign wire15 = $unsigned(($signed($unsigned(reg6)) + ({$unsigned(reg11)} ?
                      {wire2[(3'h4):(1'h1)],
                          $unsigned(reg10)} : $unsigned({reg7, reg6}))));
endmodule
