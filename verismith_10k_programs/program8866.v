module top
#(parameter param21 = ((~^(^((+(8'ha1)) ? ((7'h41) ? (8'ha5) : (8'ha7)) : ((8'h9e) || (8'hba))))) <<< ((8'ha9) << ((((8'hb9) ? (7'h41) : (8'hae)) ? {(8'hb3)} : ((8'hae) ? (8'hbc) : (7'h44))) ^~ (7'h41)))), 
parameter param22 = (param21 && ((param21 - ((~param21) && (8'ha7))) ? param21 : (((param21 ? param21 : param21) ? (param21 <= param21) : (param21 ? param21 : param21)) ? ((&param21) == param21) : param21))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (!(^~(wire1 >= $unsigned($signed((8'hb3))))));
      reg6 <= $unsigned($unsigned($unsigned((((8'haa) * wire1) ?
          {wire3} : (^reg5)))));
      if (((wire0[(3'h4):(2'h3)] <= $signed(wire1)) ?
          $signed({{$unsigned(reg5),
                  (~|wire4)}}) : ($signed((wire0[(5'h10):(4'hd)] >>> (wire0 ?
              reg5 : wire3))) >>> $signed(wire3[(1'h0):(1'h0)]))))
        begin
          reg7 <= (|$unsigned(reg5[(4'ha):(3'h4)]));
          if (reg6[(4'hf):(1'h1)])
            begin
              reg8 <= (8'h9c);
            end
          else
            begin
              reg8 <= (reg7[(3'h6):(3'h5)] ?
                  ($signed((~^$signed(wire0))) ?
                      (((wire4 ^~ wire0) ?
                          wire4 : (-reg7)) != (+(+(8'h9e)))) : (~{$unsigned(wire3)})) : ((8'h9e) * (^~reg5[(1'h1):(1'h1)])));
              reg9 <= (wire0 | $unsigned((reg6 ?
                  (~|wire3) : $unsigned((~^wire4)))));
              reg10 <= (8'had);
            end
        end
      else
        begin
          reg7 <= $unsigned(({(|(wire1 ? (8'hbf) : (7'h40))),
                  reg6[(3'h7):(3'h7)]} ?
              (reg5[(4'hc):(4'h9)] | (^(wire4 >>> (8'hbc)))) : $signed((^~wire1[(4'hc):(3'h5)]))));
          reg8 <= reg7[(3'h7):(2'h2)];
        end
    end
  assign wire11 = $signed(wire2[(3'h7):(2'h2)]);
  assign wire12 = wire0[(4'h9):(4'h9)];
  assign wire13 = (8'hb7);
  assign wire14 = ((8'ha0) ?
                      reg9[(4'h8):(4'h8)] : ((~wire4[(3'h4):(1'h1)]) ?
                          (+($signed(reg6) ?
                              wire13 : (~|wire13))) : ($unsigned(wire2[(3'h6):(3'h6)]) ?
                              $unsigned(wire3) : $signed(wire3[(2'h2):(1'h1)]))));
  assign wire15 = $signed((8'ha3));
  assign wire16 = ((wire0[(5'h10):(4'hb)] ?
                          ({((8'h9f) == reg9),
                              (reg10 << wire11)} | wire13) : wire12[(3'h4):(2'h3)]) ?
                      wire13 : reg6);
  assign wire17 = $unsigned((^$unsigned($signed($unsigned(reg6)))));
  assign wire18 = (wire2[(3'h6):(3'h4)] <<< $signed(((^~{reg7, wire0}) ?
                      {(wire2 <= wire17), (wire3 == wire3)} : ((~^wire16) ?
                          reg5 : reg6))));
  assign wire19 = $unsigned(((^~reg6) ?
                      wire17[(1'h1):(1'h0)] : ({(wire2 ^ reg10)} ?
                          wire1[(5'h10):(1'h0)] : wire1[(4'hf):(3'h7)])));
  assign wire20 = ((~^(wire4 ?
                      ((8'ha8) < (&reg9)) : $unsigned((-wire19)))) != (+((8'hb5) & $unsigned($unsigned(wire14)))));
endmodule
