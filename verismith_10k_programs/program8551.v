module top
#(parameter param14 = (&(({(~&(8'hac))} < (^((8'hbe) ? (8'ha6) : (7'h42)))) ? ((~((8'ha1) ? (8'hb0) : (8'hba))) && (((8'hb0) & (8'hb3)) ? ((7'h43) ? (7'h43) : (7'h40)) : {(7'h43), (8'ha3)})) : (^{{(8'hab)}}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = ((^{wire3}) ~^ (^wire2));
  always
    @(posedge clk) begin
      reg6 <= ((-(((wire4 ? wire4 : wire1) ?
              $signed((8'ha7)) : wire1[(4'ha):(2'h2)]) ?
          (wire5 * (wire4 || (8'hb1))) : $unsigned(wire4))) ~^ $unsigned((8'hab)));
      reg7 <= $unsigned((($unsigned((~&wire5)) >= ((8'ha7) ?
          (wire5 + wire4) : $signed(wire2))) >> ($signed(wire3) == ($signed(wire4) & $unsigned(wire0)))));
      if ($signed($unsigned((reg7 >> (wire4[(1'h0):(1'h0)] | (wire4 ?
          wire3 : reg7))))))
        begin
          if ((|wire4[(4'hb):(1'h0)]))
            begin
              reg8 <= ($signed($signed(wire0[(2'h2):(1'h0)])) ?
                  (8'hbc) : $signed($signed(($unsigned(reg6) == $unsigned(reg6)))));
              reg9 <= wire4[(1'h1):(1'h0)];
            end
          else
            begin
              reg8 <= $unsigned($signed(reg9[(4'hc):(2'h2)]));
              reg9 <= $signed(wire5);
              reg10 <= $signed({wire5[(5'h11):(4'h8)]});
              reg11 <= ((reg9[(3'h5):(2'h2)] & reg7[(3'h7):(2'h2)]) >> $unsigned({wire0,
                  (~^$unsigned(wire0))}));
              reg12 <= (|$unsigned(wire1));
            end
        end
      else
        begin
          reg8 <= $signed(reg7);
          reg9 <= wire1[(4'hf):(4'hb)];
          reg10 <= (~|({$signed((^wire3)),
              $unsigned($unsigned(wire1))} && reg12));
          reg11 <= {(~((wire2[(4'h8):(1'h0)] ? ((8'ha9) < wire3) : wire2) ?
                  reg9 : $unsigned((-reg10))))};
        end
    end
  assign wire13 = wire1;
endmodule
