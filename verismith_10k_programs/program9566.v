module top
#(parameter param9 = ({(({(8'hba)} ? ((8'h9f) && (8'ha9)) : {(7'h43), (8'hb7)}) ? {((8'hbd) - (8'hbe))} : (~|((8'hab) - (8'hb8))))} ? ({(((8'ha0) ? (8'ha8) : (8'hb5)) ^~ (^(8'h9d)))} && (8'hb3)) : (((((7'h44) ? (8'hbf) : (8'ha5)) ? ((8'hb4) ~^ (8'ha4)) : ((7'h42) ^~ (8'hbc))) ? (((8'haf) ? (7'h42) : (8'hbe)) ? ((8'hb1) > (8'ha2)) : ((8'hbc) == (8'hb6))) : (((8'hb6) ~^ (8'ha9)) + {(8'ha5), (7'h42)})) - ((~|((8'ha9) && (8'h9d))) - {(&(8'h9c))}))), 
parameter param10 = ((~|(param9 < (|(~^param9)))) && (param9 ? ((param9 ? param9 : param9) <= ((~param9) ? (param9 ? param9 : param9) : (param9 <= param9))) : (((param9 ^ param9) ? {(8'ha9)} : {param9, param9}) - {(param9 ? param9 : param9), param9}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire6, wire5, wire4, reg8, reg7, (1'h0)};
  assign wire4 = $signed(($unsigned((8'ha5)) ?
                     (((~wire0) <<< wire2[(3'h5):(2'h3)]) ?
                         wire0[(1'h1):(1'h0)] : (~&(^wire1))) : wire0));
  assign wire5 = $unsigned(((^~wire1[(2'h2):(2'h2)]) ?
                     {$signed((wire4 ?
                             wire3 : wire3))} : wire1[(1'h0):(1'h0)]));
  assign wire6 = $unsigned(wire3[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      reg7 <= ((~(((^~wire4) ? $signed(wire6) : $signed(wire6)) ?
          wire3[(1'h1):(1'h1)] : {wire6, wire1[(1'h1):(1'h1)]})) ^~ wire4);
      reg8 <= {(^((((8'ha9) ? wire6 : wire6) >= wire0) ?
              (reg7 >> wire5[(2'h2):(1'h1)]) : ($unsigned(reg7) >>> $signed(wire5)))),
          (!{wire5, wire5})};
    end
endmodule
