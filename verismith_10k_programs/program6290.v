module top
#(parameter param10 = {((|(~((8'had) ? (8'haf) : (8'hbe)))) ? ({(+(8'hb1)), ((8'hbd) == (8'hb7))} ? {{(8'ha8), (8'ha6)}} : ((7'h40) ^~ ((8'hb5) ? (8'h9c) : (8'hb2)))) : (&((~|(8'h9c)) ^ {(8'hac)})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(3'h5):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire9, wire5, wire4, reg8, reg7, reg6, (1'h0)};
  assign wire4 = (((($unsigned((8'hbf)) ?
                             {wire0,
                                 wire0} : ((8'ha7) >> wire0)) <<< wire1[(4'h9):(4'h9)]) ?
                         wire1[(5'h12):(4'h9)] : (wire3[(2'h3):(1'h0)] ^ (~&{wire2}))) ?
                     {(8'hac)} : (-wire2));
  assign wire5 = wire0[(4'ha):(4'ha)];
  always
    @(posedge clk) begin
      reg6 <= (8'hac);
      reg7 <= ($signed((&wire2)) - $signed($unsigned(((|wire0) ?
          (reg6 ? reg6 : (7'h40)) : $signed(wire4)))));
      reg8 <= wire2[(3'h7):(3'h7)];
    end
  assign wire9 = wire0;
endmodule
