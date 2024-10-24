module top
#(parameter param10 = ({(~(((8'hb8) ? (8'hb3) : (8'hb3)) != (7'h42)))} < (!({(&(8'ha4))} * (((8'hac) ? (8'ha8) : (8'hb9)) ? (~|(7'h41)) : ((8'ha7) || (8'hbc)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire9, wire8, wire6, wire5, reg7, (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire4;
  always
    @(posedge clk) begin
      reg7 <= $unsigned($signed(($unsigned(wire0[(4'hd):(2'h2)]) ?
          wire4 : (wire1[(2'h2):(2'h2)] >> ((8'h9f) ? (8'ha9) : wire4)))));
    end
  assign wire8 = $unsigned(($unsigned(wire3[(1'h0):(1'h0)]) ?
                     reg7 : (~&$unsigned((7'h44)))));
  assign wire9 = ((((8'ha2) << ({wire6} <<< $unsigned(wire8))) ?
                         ({wire6[(4'hf):(3'h6)], $signed((8'ha1))} & (((8'ha4) ?
                             wire0 : wire3) < $signed(wire4))) : wire8) ?
                     (wire0 < (wire3[(1'h1):(1'h1)] ?
                         $unsigned((wire1 == wire0)) : $signed((|wire1)))) : (^$unsigned($unsigned((wire0 & wire8)))));
endmodule
