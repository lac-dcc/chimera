module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire7, wire6, wire5, reg8, (1'h0)};
  assign wire5 = ({wire4} ^~ ((wire4 >= (~&wire4)) ?
                     wire0[(3'h5):(2'h3)] : (wire0[(3'h5):(3'h5)] ?
                         wire1[(3'h6):(2'h2)] : ($unsigned(wire3) ?
                             $signed(wire2) : (wire3 ^ (8'h9c))))));
  assign wire6 = (($signed($unsigned(wire5)) ?
                     (~|$unsigned((~^wire1))) : $signed(((wire5 ?
                             (8'ha7) : wire0) ?
                         wire0[(2'h2):(1'h1)] : wire0))) ^ $unsigned(wire0));
  assign wire7 = ((&({wire1[(2'h2):(2'h2)]} ^ $unsigned($unsigned(wire2)))) ?
                     ($unsigned($signed($signed(wire6))) == $unsigned((|(wire5 & wire6)))) : $signed((+wire3[(2'h3):(2'h2)])));
  always
    @(posedge clk) begin
      reg8 <= ($signed($signed((wire7 ?
          $signed(wire5) : (wire0 > wire1)))) ^~ $signed(wire4));
    end
endmodule
