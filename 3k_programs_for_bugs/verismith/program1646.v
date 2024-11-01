module top
#(parameter param39 = (((8'hba) & (+({(8'h9d)} ? {(8'ha3), (8'h9e)} : ((8'ha2) >>> (8'hb3))))) ? (~(((8'ha5) + (~(8'hb3))) >>> {((7'h44) ? (8'hba) : (8'haf)), (|(8'hab))})) : {(~&((8'ha1) ? {(8'hbf)} : ((8'ha4) + (8'hb7)))), ((~^((8'ha7) ? (8'hb5) : (8'ha7))) | (+(~(8'hbc))))}), 
parameter param40 = (param39 ? ((~^(!param39)) - ((&(~^param39)) & param39)) : {({{param39, param39}, (param39 ? param39 : param39)} ? (^~{param39, param39}) : (~&(param39 ? param39 : param39)))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h30):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire34;
  assign y = {wire38, wire37, wire36, wire5, wire6, wire34, (1'h0)};
  assign wire5 = (($unsigned(wire3) >> (wire1 ?
                         wire0[(3'h7):(1'h0)] : wire1[(4'hd):(1'h0)])) ?
                     ({((8'hb0) >>> wire0), wire4} ?
                         wire2 : wire4[(4'h9):(3'h6)]) : {(((wire3 != wire2) & wire0) & $signed((wire2 <= wire2))),
                         ($unsigned(wire2) != (wire2[(4'ha):(2'h2)] ?
                             (+wire0) : (^wire2)))});
  assign wire6 = $unsigned((wire2 ?
                     wire0[(4'h8):(3'h4)] : $unsigned((wire0 & (wire2 ?
                         (8'h9d) : (8'ha8))))));
  module7 #() modinst35 (wire34, clk, wire1, wire0, wire3, wire4, wire6);
  assign wire36 = ($signed($signed((~^$unsigned(wire0)))) ^~ wire34);
  assign wire37 = ((({(&(8'hbd)), ((8'h9d) ^ wire36)} ?
                          (-wire4) : $signed((wire34 >>> wire5))) ?
                      ((wire34 == wire4[(2'h2):(2'h2)]) ^~ (-wire6)) : {wire2,
                          ({wire34,
                              wire36} == $unsigned(wire2))}) || $signed({((~^wire2) ?
                          $signed((8'h9c)) : (wire3 ~^ wire0))}));
  assign wire38 = ($unsigned((7'h41)) >= wire2);
endmodule

module module7
#(parameter param33 = (((({(8'hb3)} ^~ ((8'hb4) ? (8'ha1) : (8'hab))) ? (((8'hb1) && (7'h40)) > (8'hb8)) : (8'hbb)) ? (~^(((8'had) <= (8'ha4)) ? ((8'hb2) == (8'hb0)) : ((8'hb3) + (8'hbd)))) : ((^((8'ha1) ? (8'hbb) : (8'hb6))) ? (((8'hbd) && (8'ha2)) ? (^(8'hac)) : {(7'h44), (8'hab)}) : (~((7'h42) * (7'h43))))) ^ {((((8'hac) ? (8'h9f) : (8'h9c)) ? ((8'ha8) ? (8'hb3) : (8'h9e)) : ((7'h41) == (8'hb8))) ? (^((8'hbb) | (8'hb8))) : (8'ha8))}))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire13;
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire25,
                 wire13,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire13 = (-($signed(({(7'h42)} ? wire8 : wire10[(4'h9):(3'h6)])) ?
                      ((!wire8) ?
                          wire11 : $unsigned(wire9[(1'h0):(1'h0)])) : wire10));
  module14 #() modinst26 (wire25, clk, wire8, wire13, wire11, wire12);
  always
    @(posedge clk) begin
      reg27 <= {({{(wire9 <<< wire25)}} != ((^~(wire13 ? wire25 : wire9)) ?
              $unsigned(((8'hbc) << wire8)) : $unsigned((wire9 ~^ wire10)))),
          wire12[(4'hf):(3'h5)]};
      reg28 <= ($unsigned(wire12[(5'h11):(4'hc)]) | (~|wire9[(2'h3):(1'h0)]));
      reg29 <= (&$unsigned((wire8 * reg28[(2'h2):(1'h0)])));
      reg30 <= wire8;
    end
  assign wire31 = (({wire9[(2'h2):(2'h2)]} ? reg29 : wire11[(4'h9):(3'h6)]) ?
                      (~^($unsigned((reg30 ? wire12 : (8'hb9))) ?
                          $signed((wire9 ? wire9 : reg30)) : (wire10 ?
                              wire9 : ((8'ha6) ?
                                  (7'h40) : wire10)))) : $signed(reg29));
  assign wire32 = $unsigned(((~((wire31 ?
                      (8'hbc) : reg30) | reg30)) || wire25));
endmodule

module module14
#(parameter param24 = ((+((~^((8'ha4) ? (8'hb1) : (8'ha9))) << (((8'ha2) < (8'hac)) > ((8'hac) <<< (8'ha2))))) | (((~&((8'hb6) << (8'hb5))) ? (((8'h9c) < (8'hbd)) ? (&(8'ha9)) : ((8'hbc) >> (8'ha6))) : (+(+(8'hb0)))) ? (~|(((7'h41) < (8'hb5)) ? ((8'hb3) <<< (8'hb1)) : ((8'h9e) ~^ (8'haa)))) : ((-(|(8'ha0))) ? (~^{(8'h9c), (8'hbc)}) : (((8'hab) ? (8'hbc) : (8'hac)) ^ ((8'ha5) ^~ (8'ha8)))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire [(5'h10):(1'h0)] wire16;
  input wire [(5'h12):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  assign y = {wire22, wire21, wire20, wire19, reg23, (1'h0)};
  assign wire19 = wire16;
  assign wire20 = $signed(wire19[(1'h1):(1'h1)]);
  assign wire21 = $unsigned(($unsigned($signed(wire20[(5'h10):(4'hc)])) ?
                      ((&(!wire15)) ?
                          $signed($signed(wire15)) : (8'haf)) : ({$signed(wire17),
                              (wire17 ? wire15 : wire17)} ?
                          ({wire20} || (wire19 & wire18)) : wire18[(3'h4):(2'h2)])));
  assign wire22 = $unsigned((wire18[(2'h3):(2'h2)] && $signed(((&wire17) > (wire17 >>> wire21)))));
  always
    @(posedge clk) begin
      reg23 <= ((wire15[(2'h3):(2'h2)] << $unsigned((~^(wire22 ?
          (7'h42) : wire21)))) < $signed($signed($signed($signed(wire15)))));
    end
endmodule
