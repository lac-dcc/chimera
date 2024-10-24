module top
#(parameter param13 = (-(((((8'h9e) ? (8'hb5) : (8'ha5)) ? (~|(8'hae)) : (&(8'hb3))) <<< (~((7'h40) ~^ (8'hae)))) ? (({(8'ha6)} ? ((8'ha0) ? (8'hb6) : (7'h43)) : (~&(8'ha5))) || ((~(8'hb8)) >>> (~|(8'hbd)))) : (((~|(8'hb0)) ? ((8'hbd) ? (7'h43) : (7'h44)) : (^(8'hbf))) ? {(~|(8'hb1)), (~&(8'h9d))} : ((^(8'hbb)) > (!(8'ha3)))))), 
parameter param14 = (param13 ? param13 : ({((param13 | param13) ? (~|param13) : {param13}), {{param13, param13}}} ? (((param13 & param13) != ((8'hab) ? param13 : param13)) >> param13) : (param13 ? ((param13 ? param13 : (8'ha0)) >= {param13, param13}) : (((8'hb5) > param13) ? param13 : param13)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg4 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {$unsigned($signed($signed((wire1 == wire3)))),
          wire1[(1'h0):(1'h0)]};
      if ($signed(wire3))
        begin
          reg5 <= $unsigned({(+wire2), $unsigned(wire3)});
          reg6 <= (wire2 ? wire2 : (^$signed($unsigned(reg4[(3'h7):(3'h6)]))));
        end
      else
        begin
          reg5 <= $signed(wire3[(4'h9):(3'h7)]);
          reg6 <= $unsigned($signed({(|reg4)}));
          reg7 <= $unsigned(wire0[(2'h2):(1'h0)]);
          reg8 <= reg6[(1'h0):(1'h0)];
        end
      reg9 <= reg5[(1'h0):(1'h0)];
    end
  assign wire10 = wire2;
  assign wire11 = (reg7[(4'h8):(3'h6)] ^ {((reg4 >>> (wire2 + wire3)) ?
                          (!(wire1 ?
                              reg4 : (8'h9e))) : (reg8[(1'h1):(1'h1)] << wire0)),
                      wire2});
  assign wire12 = (reg4[(1'h1):(1'h1)] < ($unsigned(($unsigned(reg8) <<< wire1[(1'h0):(1'h0)])) ?
                      ($signed((+(8'hb1))) - wire11[(1'h0):(1'h0)]) : wire11[(2'h2):(2'h2)]));
endmodule
