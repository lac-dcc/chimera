module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  assign y = {wire11, wire10, wire9, wire7, wire6, wire5, wire4, reg8, (1'h0)};
  assign wire4 = (|{wire3, {(|{wire3, (8'ha7)}), (8'h9e)}});
  assign wire5 = wire4;
  assign wire6 = wire5;
  assign wire7 = ($unsigned(wire4) + $signed(wire5[(3'h6):(3'h6)]));
  always
    @(posedge clk) begin
      reg8 <= (!$signed($unsigned(((wire4 ? (7'h44) : wire5) ?
          (wire1 > wire1) : $signed(wire2)))));
    end
  assign wire9 = ($unsigned(wire6[(2'h2):(2'h2)]) ?
                     ($signed($signed($signed(wire0))) ?
                         $signed({reg8[(4'ha):(3'h5)]}) : (&((wire4 ?
                                 wire1 : (8'hb7)) ?
                             {(8'haa)} : (^~wire3)))) : (+$unsigned($unsigned({(8'hbd)}))));
  assign wire10 = ({wire5[(4'hf):(4'hd)]} ?
                      ((~&$unsigned((~^wire4))) ^ (({wire9, wire4} ?
                              $signed(wire4) : {wire3, reg8}) ?
                          (wire5 ?
                              (wire1 ?
                                  wire5 : wire5) : ((8'hae) + (8'hb3))) : $signed(wire2[(3'h7):(3'h5)]))) : reg8[(4'ha):(1'h0)]);
  assign wire11 = $unsigned((({(^(8'hbb))} ?
                      wire4[(3'h4):(1'h1)] : $unsigned((^~wire10))) ~^ {((wire5 - wire7) ?
                          $signed(reg8) : wire5),
                      (^(^~reg8))}));
endmodule
