module top
#(parameter param12 = (((+(~&((7'h43) * (8'ha7)))) ~^ ((-((8'hb9) ^ (8'ha4))) ? ({(8'ha0), (8'ha9)} ^~ ((8'hba) ? (8'h9c) : (8'hb9))) : (|((8'hac) ? (8'hbc) : (8'ha5))))) < (^((((8'ha6) - (8'h9d)) ~^ (!(8'hb6))) >>> ((8'ha7) < ((8'hb6) ? (8'hae) : (8'hb6)))))), 
parameter param13 = (8'ha6))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  assign y = {wire11, wire10, wire8, wire7, wire6, wire5, reg9, (1'h0)};
  assign wire5 = $signed({(~^wire3[(3'h7):(3'h7)]),
                     $unsigned(($unsigned(wire0) ?
                         (wire2 >= (8'ha8)) : wire1[(2'h2):(1'h0)]))});
  assign wire6 = $signed({{wire3[(3'h7):(3'h5)],
                         (wire0[(4'hc):(2'h3)] ?
                             wire2[(1'h0):(1'h0)] : $signed(wire0))},
                     (!{$signed(wire5)})});
  assign wire7 = ((wire5 != $unsigned(($signed(wire4) & wire6[(2'h2):(1'h1)]))) >= wire4);
  assign wire8 = {$signed($unsigned(({wire2, wire0} ? {(8'hbb)} : wire3))),
                     ((wire2 << (~^(|wire7))) ~^ ($unsigned($unsigned(wire0)) ?
                         {wire4[(3'h7):(3'h5)]} : $signed($signed(wire0))))};
  always
    @(posedge clk) begin
      reg9 <= (((|(wire2[(3'h4):(1'h0)] ?
              wire6[(3'h4):(1'h1)] : {wire2})) <<< ((wire5[(3'h4):(2'h2)] ?
                  (wire5 >= wire5) : $signed((8'ha0))) ?
              {wire0, $unsigned(wire6)} : (wire0 | ((8'hbe) ?
                  (8'h9c) : wire6)))) ?
          {(8'hb6)} : (wire8[(3'h7):(3'h5)] * $signed(wire1[(3'h4):(1'h1)])));
    end
  assign wire10 = $signed($signed($unsigned($unsigned($signed(wire3)))));
  assign wire11 = ({wire5[(3'h4):(1'h0)]} ?
                      (~|$unsigned(({wire5} != wire0))) : (((&wire0[(4'he):(4'hb)]) ?
                              wire0 : $signed((|wire3))) ?
                          {(~&$signed((8'hba))),
                              $signed($unsigned(wire2))} : $signed($unsigned((wire2 ?
                              wire10 : wire6)))));
endmodule
