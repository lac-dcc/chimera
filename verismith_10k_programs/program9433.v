module top
#(parameter param9 = (((^~({(8'hb1), (8'hbf)} ^ {(8'ha0)})) ? (^{((8'hba) ? (7'h40) : (8'hbc)), {(8'hb1)}}) : (|((-(8'had)) ? (~^(8'ha9)) : ((8'h9e) << (8'ha9))))) < (((8'h9e) ? ({(8'haf)} ? {(8'ha8)} : ((8'ha7) ? (8'h9d) : (8'ha0))) : (~{(8'hbf)})) > ((|(~^(8'h9f))) ^~ ((-(8'hab)) ^ ((8'h9f) >>> (7'h42)))))), 
parameter param10 = (((((param9 ? param9 : (8'ha5)) <<< param9) > ((~&param9) >>> (|param9))) || (+{param9, param9})) >>> (^((~|((8'hbf) ? param9 : param9)) ? (~^(~&param9)) : ((param9 >>> param9) ? (param9 ? param9 : param9) : (param9 ? param9 : param9))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg4 = (1'h0);
  assign y = {wire8, wire7, wire6, wire5, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {(wire0 ?
              $signed(((wire0 ? wire2 : wire1) ?
                  $unsigned(wire2) : (~^wire3))) : $unsigned(wire1)),
          ($signed($unsigned($unsigned(wire0))) && ($unsigned(wire0) ~^ ($unsigned(wire1) ?
              (wire3 >= wire3) : wire0[(1'h0):(1'h0)])))};
    end
  assign wire5 = $signed($unsigned($unsigned(((|reg4) ? (7'h42) : {reg4}))));
  assign wire6 = wire0[(3'h4):(3'h4)];
  assign wire7 = ($signed($unsigned(wire6[(3'h6):(1'h0)])) > $unsigned(wire5));
  assign wire8 = $unsigned(($signed(((~^wire6) <<< (~&wire1))) ?
                     (wire3 ~^ wire0[(1'h0):(1'h0)]) : $signed($unsigned($signed(reg4)))));
endmodule
