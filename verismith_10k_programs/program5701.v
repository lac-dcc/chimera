module top
#(parameter param12 = (^(((~&(&(8'h9d))) ? (&{(8'ha4)}) : (+(!(8'hbf)))) && (8'haa))), 
parameter param13 = ((({(param12 ? param12 : param12)} >= {(^param12), param12}) ? param12 : (((param12 ? param12 : param12) ? param12 : (param12 ? param12 : (8'hbc))) ? {param12, param12} : {(8'hb4)})) >> ((((|(8'ha2)) ? param12 : (param12 ? param12 : param12)) ^~ ((param12 ? (8'haf) : param12) ? (param12 || param12) : {param12, param12})) > ((param12 * param12) ^~ (~(8'hb1))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire9;
  wire [(2'h3):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  assign y = {wire11, wire9, wire8, wire7, wire6, wire5, wire4, reg10, (1'h0)};
  assign wire4 = (~(($signed(wire0[(1'h0):(1'h0)]) && wire3[(3'h5):(3'h4)]) ?
                     ($signed($unsigned(wire0)) ?
                         (!wire3[(3'h5):(1'h1)]) : ({wire2} ~^ $signed(wire1))) : (wire1[(1'h0):(1'h0)] ?
                         (^~wire0) : (wire1 <<< {wire2, wire0}))));
  assign wire5 = (wire4[(4'h8):(3'h6)] ?
                     (wire2 - (^(~^(wire2 ?
                         wire3 : (8'ha1))))) : ($signed({(wire1 ?
                             wire1 : wire1)}) >>> $unsigned((~^wire2[(4'hd):(1'h0)]))));
  assign wire6 = wire1;
  assign wire7 = (((~wire0[(3'h4):(1'h1)]) ?
                     wire3[(1'h0):(1'h0)] : {wire1[(3'h5):(2'h3)]}) == ($unsigned({{wire5},
                         ((8'hb0) >>> wire1)}) ?
                     {(!{wire4, wire6})} : $unsigned($unsigned(wire6))));
  assign wire8 = ({(wire6 ?
                         (wire0[(2'h3):(1'h1)] ~^ (wire0 ~^ wire5)) : ({wire1} ?
                             $signed(wire2) : $unsigned(wire7)))} ^ $signed($unsigned({wire7})));
  assign wire9 = $signed((wire2 && (~^((wire3 ?
                     wire7 : wire4) > wire4[(2'h3):(1'h1)]))));
  always
    @(posedge clk) begin
      reg10 <= ($signed($unsigned($signed(wire2))) < wire3[(2'h3):(2'h3)]);
    end
  assign wire11 = $unsigned($unsigned($unsigned((|(wire1 ? wire9 : wire3)))));
endmodule
