module top
#(parameter param24 = {{((((8'hb1) ? (8'ha7) : (8'h9d)) ? ((8'ha1) ~^ (8'hab)) : ((8'hb0) <<< (8'ha7))) ? (((8'ha4) == (8'ha9)) + ((8'hb2) >= (8'hab))) : (((8'haa) != (7'h41)) ? ((8'hab) >> (8'hb3)) : (^~(8'hb4)))), {(^~((8'hb1) >> (8'hb6)))}}, ((((~&(8'hb5)) ? ((8'haf) ^~ (8'hbc)) : (^(8'h9c))) ? (((8'hab) ? (8'ha6) : (8'h9e)) >>> ((8'hbe) ? (8'ha2) : (8'had))) : {((7'h42) ^~ (8'ha1))}) ^ (~|((~&(8'ha8)) >> (~&(8'hb4)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire23, wire21, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = (($signed((^~wire1)) >= $unsigned((~&$signed(wire2)))) ?
                     wire2 : $unsigned(wire1[(3'h4):(3'h4)]));
  assign wire5 = {$signed((~|$signed(((8'hb4) ? wire0 : (8'hb9))))),
                     $unsigned(wire0[(1'h1):(1'h0)])};
  assign wire6 = $unsigned($signed(wire4[(4'h8):(3'h4)]));
  assign wire7 = wire3;
  module8 #() modinst22 (wire21, clk, wire0, wire4, wire6, wire5);
  assign wire23 = {(~wire5), (+(~^$signed(wire5[(1'h1):(1'h1)])))};
endmodule

module module8
#(parameter param20 = ((({((8'hb2) ? (7'h41) : (8'ha7)), (|(8'ha5))} || (&(&(8'ha0)))) * ({((8'ha3) < (8'had))} ? (!((8'hb7) <= (8'ha4))) : {((8'ha7) + (8'h9f)), (^~(8'hb6))})) == (-((&((8'hbb) << (8'hbc))) & (((8'hbf) ? (8'hbb) : (8'had)) ? (8'ha3) : ((8'h9c) ? (8'hbe) : (8'ha1)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  assign y = {wire14, wire13, reg19, reg18, reg17, reg16, reg15, (1'h0)};
  assign wire13 = wire12[(2'h3):(1'h0)];
  assign wire14 = (8'ha0);
  always
    @(posedge clk) begin
      reg15 <= wire14[(2'h3):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg16 <= $unsigned((wire10 ?
          wire14[(3'h7):(3'h6)] : ((wire10[(3'h7):(3'h4)] < (~reg15)) ?
              reg15 : {(wire12 ? wire14 : wire14)})));
      reg17 <= wire14;
      reg18 <= ($unsigned($signed(wire10[(4'ha):(2'h2)])) == (|$unsigned(wire13[(4'h9):(1'h1)])));
      if (wire10[(1'h0):(1'h0)])
        begin
          reg19 <= {wire9[(2'h2):(1'h0)], (|$unsigned((&(&reg18))))};
        end
      else
        begin
          reg19 <= (wire12[(4'h8):(2'h2)] & ($unsigned((wire12[(4'h8):(1'h0)] && (reg19 ?
                  wire11 : (8'hbe)))) ?
              $unsigned($signed($unsigned(wire10))) : wire10[(5'h11):(4'hf)]));
        end
    end
endmodule
