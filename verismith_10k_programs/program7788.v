module top
#(parameter param12 = (((({(8'ha9)} ? ((8'ha3) == (8'hb6)) : (&(8'hab))) + (((8'hb7) ? (7'h43) : (7'h44)) ^~ (8'hbf))) ? ((8'hb9) ? ((-(8'hb3)) >>> (~&(8'ha8))) : (!((8'ha7) && (8'hb0)))) : (!(((7'h43) ? (8'hb6) : (8'ha1)) || ((8'h9e) >>> (8'ha9))))) ? (~^{((~&(8'hb8)) ? (8'ha5) : ((8'hb6) | (7'h43)))}) : ((-((^(7'h42)) ? (!(8'hb4)) : ((8'ha8) == (8'had)))) ? (~(((8'hb7) ^ (8'ha2)) ? ((8'ha0) >>> (8'ha4)) : ((8'hbd) ? (7'h41) : (7'h44)))) : {(((8'ha8) ? (8'hbc) : (7'h40)) <= ((8'h9c) ? (8'hbe) : (8'haa)))})), 
parameter param13 = (~|(((param12 < (param12 ? (8'ha6) : param12)) ? (param12 <<< param12) : (~|(param12 ^~ (8'hba)))) ? param12 : {(^~(param12 ? param12 : param12))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  assign y = {wire11, wire10, wire9, wire8, wire6, wire5, wire4, reg7, (1'h0)};
  assign wire4 = ($unsigned($signed($unsigned(wire2[(1'h0):(1'h0)]))) ?
                     (wire2[(3'h5):(1'h0)] ~^ ((^~(wire1 ? (8'hbb) : (8'hbb))) ?
                         $unsigned((wire0 >> wire3)) : wire2)) : (-((wire0 <<< wire1[(4'hf):(4'hd)]) <<< $signed($unsigned(wire0)))));
  assign wire5 = wire3;
  assign wire6 = wire0;
  always
    @(posedge clk) begin
      if ((((~&wire1) << $unsigned(((wire6 * wire6) ?
              $unsigned(wire4) : wire0))) ?
          ({$unsigned(wire2)} ?
              ({wire2[(3'h5):(2'h2)]} != wire6) : $unsigned(wire6)) : wire6))
        begin
          reg7 <= $unsigned(wire2[(3'h5):(3'h5)]);
        end
      else
        begin
          reg7 <= wire2[(3'h5):(3'h4)];
        end
    end
  assign wire8 = wire3;
  assign wire9 = $unsigned($signed((((|wire2) < $signed(wire6)) >= wire0)));
  assign wire10 = (^~$unsigned($signed(wire1[(1'h1):(1'h0)])));
  assign wire11 = (|wire0);
endmodule
