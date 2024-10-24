module top
#(parameter param25 = (((~&(((8'hb5) >> (8'ha8)) == (8'hac))) <<< ((((8'h9d) >= (8'hbb)) ? ((8'ha2) >> (8'hb1)) : {(7'h42), (8'hae)}) | {{(8'ha2), (7'h40)}, (&(8'hb9))})) ? (8'ha4) : (!(~|(~^((8'hb3) - (8'ha7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg14,
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
      reg5 <= $unsigned({wire2[(4'hb):(4'h9)]});
      reg6 <= {{wire2},
          (((-$signed(wire4)) >= (8'haf)) ?
              $signed($signed(((8'h9d) + (8'hb2)))) : ({(~&(8'hab))} < $signed(wire4[(2'h2):(2'h2)])))};
      if ((8'hb7))
        begin
          reg7 <= wire0;
          reg8 <= $unsigned(({(wire2 ? $signed((8'hab)) : wire3),
              (wire1[(3'h5):(3'h4)] >>> $signed(wire0))} < $signed(($signed(reg7) ?
              $unsigned(wire2) : wire4[(1'h1):(1'h1)]))));
          reg9 <= reg7[(4'hf):(4'hb)];
        end
      else
        begin
          reg7 <= (wire1[(1'h1):(1'h1)] ? (8'hb7) : $unsigned(wire4));
          reg8 <= ((wire3 ^~ reg6[(5'h12):(5'h11)]) || $signed((+$signed((^wire0)))));
          reg9 <= $unsigned({$signed((^~{reg7, (8'hb4)}))});
          if ($unsigned(wire1))
            begin
              reg10 <= ((8'hb4) * $unsigned(wire0));
              reg11 <= (~^$signed(reg6));
              reg12 <= reg11[(1'h0):(1'h0)];
              reg13 <= $signed(($signed($signed(reg7[(3'h5):(3'h4)])) ?
                  $signed({(reg8 ~^ reg7)}) : wire0[(2'h3):(2'h3)]));
              reg14 <= $unsigned((~|(+((!wire1) ?
                  $unsigned(reg12) : (wire3 ? reg9 : wire2)))));
            end
          else
            begin
              reg10 <= (|((({(8'h9e)} ?
                  (reg12 > wire0) : $unsigned(wire2)) || ((~&(8'hb7)) >>> $unsigned(reg7))) >>> reg7));
            end
        end
    end
  assign wire15 = {($signed(reg5) * (&wire1[(1'h0):(1'h0)]))};
  assign wire16 = reg9;
  assign wire17 = (!(({{reg6, wire3}} ? reg5 : reg9) ?
                      (^{$unsigned(reg13), $unsigned(wire3)}) : (8'hb4)));
  assign wire18 = wire17[(2'h2):(2'h2)];
  assign wire19 = ((({(wire15 ~^ wire1)} == (((8'ha4) ?
                          wire2 : wire3) != reg5)) == $signed((~&(reg6 == reg7)))) ?
                      $unsigned($signed($unsigned($signed(wire17)))) : (8'h9c));
  assign wire20 = ($unsigned($signed(reg13[(3'h6):(2'h2)])) ?
                      wire1[(1'h1):(1'h0)] : (+(~|wire15)));
  assign wire21 = $signed(reg8[(1'h0):(1'h0)]);
  assign wire22 = reg13[(2'h2):(1'h1)];
  assign wire23 = $unsigned($unsigned($unsigned(({reg10,
                      reg11} ^~ (wire17 ^~ reg9)))));
  assign wire24 = (~|reg14);
endmodule
