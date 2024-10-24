module top
#(parameter param13 = (|(&((~(~(8'hae))) ? {((8'ha0) ? (8'ha1) : (8'hb3)), ((8'ha2) == (8'haf))} : (8'haf)))), 
parameter param14 = (^({(8'had), ({param13} + {param13, (8'hbc)})} << param13)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg12, reg11, reg10, reg9, reg8, (1'h0)};
  assign wire5 = (!$unsigned({({(8'hba), wire1} ?
                         $unsigned(wire0) : $unsigned((8'ha7)))}));
  assign wire6 = (~|((|(&{wire4, (8'hbd)})) ?
                     ($signed(wire3[(4'hf):(2'h3)]) ~^ ($unsigned(wire2) == (wire0 ?
                         wire3 : (8'h9c)))) : (^{(wire5 ? wire4 : wire2),
                         $unsigned(wire1)})));
  assign wire7 = ((~^$signed(wire4[(4'ha):(1'h1)])) != (!(wire3[(3'h7):(1'h0)] ?
                     ((wire6 != wire6) ?
                         $unsigned(wire6) : {wire6}) : wire6[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg8 <= $unsigned(wire1[(1'h1):(1'h0)]);
      reg9 <= wire7[(2'h3):(2'h3)];
      reg10 <= $signed(wire4);
      reg11 <= {((((!wire2) ?
                  (reg10 & wire1) : $signed((8'hae))) + $unsigned($signed(reg10))) ?
              $signed($signed((reg8 ? (8'hab) : reg8))) : (|reg9)),
          (&reg10[(2'h2):(2'h2)])};
      reg12 <= (($unsigned($signed($signed(reg9))) ?
          wire4[(5'h14):(4'he)] : (({wire1} <<< reg11[(1'h1):(1'h1)]) ?
              $signed((^wire6)) : $unsigned(wire0))) ^~ reg10[(4'hd):(1'h1)]);
    end
endmodule
