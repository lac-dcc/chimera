module top
#(parameter param15 = ((8'hb4) ? ({({(8'ha4), (8'ha4)} == (8'hab))} + (^~(-(~&(8'hb1))))) : (((((8'hac) ? (8'ha9) : (8'hb7)) ? ((8'hb2) ? (8'hb5) : (7'h44)) : ((8'hb2) <= (8'hb0))) > {(+(8'hb9)), ((8'hb4) > (8'ha5))}) ? {((8'haf) ? (7'h44) : (-(8'hbd)))} : (((8'h9c) ? ((8'ha8) || (8'h9d)) : ((8'hb5) <= (8'hab))) ? (^~((8'ha6) ? (8'hb8) : (8'haf))) : ((8'ha2) ? ((8'had) <= (7'h44)) : ((8'hbc) ~^ (8'hae)))))), 
parameter param16 = param15)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = $signed(wire0[(1'h1):(1'h1)]);
  assign wire6 = ($unsigned((8'ha4)) <= wire3);
  assign wire7 = $unsigned($unsigned((!({wire6, (7'h43)} ?
                     wire2 : $unsigned(wire2)))));
  assign wire8 = ((!wire7[(3'h7):(3'h6)]) ?
                     ({{(8'h9d)}} ?
                         $signed(($signed(wire0) ?
                             (~&wire2) : {wire2})) : (($unsigned(wire3) ?
                                 $unsigned(wire6) : wire7[(3'h5):(1'h1)]) ?
                             wire6 : (8'h9e))) : (((((8'ha1) << wire6) ?
                             (^~wire5) : wire5) ~^ wire4) ?
                         (wire0 ?
                             (!wire7) : ((wire0 >>> wire0) >> (wire7 * wire1))) : (8'hb2)));
  assign wire9 = $unsigned($unsigned($unsigned(((wire8 + wire6) || wire3[(4'hd):(4'ha)]))));
  assign wire10 = $unsigned((8'hbb));
  assign wire11 = $unsigned((7'h41));
  always
    @(posedge clk) begin
      reg12 <= $signed(($unsigned(wire3[(3'h6):(3'h6)]) * $unsigned($signed((wire3 ?
          wire2 : wire3)))));
      reg13 <= ({wire11[(4'hd):(4'hd)]} ?
          (~(^~wire10)) : ((^~wire5[(3'h6):(1'h0)]) ?
              wire7[(4'hb):(3'h7)] : $unsigned(((wire10 < wire0) ?
                  (wire8 ? reg12 : wire5) : $signed(wire9)))));
      reg14 <= {$unsigned($unsigned({$unsigned((8'hb2)), $signed(wire0)}))};
    end
endmodule
