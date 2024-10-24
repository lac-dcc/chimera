module top
#(parameter param11 = (((({(8'ha9)} ? (!(8'hb5)) : ((8'h9d) * (8'hb1))) ? (8'h9c) : (|(^~(8'hbb)))) ^ (((&(8'hb1)) ^ ((8'hba) ? (8'hbb) : (7'h43))) <= ((8'h9f) <= {(7'h40)}))) ? ((-(((8'hb2) + (8'ha4)) <<< ((8'haf) != (8'ha8)))) ? (&(+(^~(7'h41)))) : {(((8'ha2) ? (8'h9e) : (8'hbe)) ? (8'h9e) : (|(8'hac))), ((+(8'hb4)) ? ((8'h9e) ? (8'hb0) : (8'hbc)) : ((7'h41) << (7'h42)))}) : ((((^(8'ha4)) ? ((8'hb2) ? (8'hb2) : (8'hab)) : ((8'ha3) ? (8'hbd) : (7'h44))) < {((8'hb2) ^~ (8'hb0)), (~&(8'hb5))}) ? ({(+(8'h9c)), (|(7'h41))} ? (((8'h9f) ? (8'ha4) : (8'ha5)) ? ((8'hb2) ^~ (8'hb2)) : (~|(8'ha2))) : (((8'h9e) ? (8'ha8) : (7'h40)) <= ((8'haf) <<< (8'ha7)))) : ({(~&(8'hbf)), ((8'hba) > (8'hae))} ? (~|((8'hb7) ? (7'h40) : (8'haf))) : (((8'ha5) == (8'hb8)) * (~&(8'ha9)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  assign y = {wire10, wire7, wire6, wire5, wire4, reg9, reg8, (1'h0)};
  assign wire4 = ((&$unsigned(wire1[(4'h8):(3'h6)])) ?
                     ($unsigned($signed($signed(wire1))) ?
                         $unsigned($unsigned($signed(wire3))) : wire1) : $signed((wire1 ?
                         $unsigned((!wire3)) : $unsigned((~^wire3)))));
  assign wire5 = wire2[(4'hf):(3'h7)];
  assign wire6 = (($signed(wire5[(2'h2):(1'h1)]) ?
                         ($signed(((8'hbc) ?
                             (8'hb9) : wire5)) && wire1[(2'h3):(2'h3)]) : wire0[(1'h0):(1'h0)]) ?
                     ({wire4} ?
                         ((8'hbc) <<< wire5) : $unsigned(wire5[(3'h6):(1'h0)])) : wire3[(1'h1):(1'h0)]);
  assign wire7 = wire5[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg8 <= wire4;
      reg9 <= $signed($signed((wire0 ?
          {(wire1 ? wire0 : (8'h9e)),
              (wire0 != wire1)} : (wire3[(3'h4):(1'h1)] ?
              $unsigned(wire4) : ((8'hab) ? wire5 : wire5)))));
    end
  assign wire10 = $unsigned($unsigned(($signed($unsigned((8'hb8))) ~^ $unsigned($unsigned(reg8)))));
endmodule
