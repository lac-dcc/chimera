module top
#(parameter param30 = ((-(&(((8'h9c) ~^ (8'ha5)) >= ((8'hbc) | (8'ha4))))) <= {{{((8'h9c) ? (8'hb3) : (8'hb4))}, (((7'h42) ? (8'had) : (8'had)) || (-(7'h41)))}, (~((^~(8'hbe)) != ((8'hb1) & (8'hbe))))}), 
parameter param31 = (|(param30 ? param30 : (((param30 ? (8'h9e) : param30) ^~ ((8'hb2) ? param30 : param30)) ? ((param30 == param30) ? (param30 ? param30 : param30) : (param30 ? (8'ha2) : param30)) : (~|(!param30))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire11;
  reg signed [(5'h14):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire26,
                 wire12,
                 wire11,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned($unsigned((^{wire2, wire0}))));
      reg5 <= ($signed((+wire2)) ?
          (^$unsigned(wire0[(4'h9):(3'h5)])) : $unsigned(($signed((wire2 <= reg4)) ?
              (+$unsigned(wire2)) : ((8'hbf) ?
                  $unsigned(wire3) : ((8'haa) ? wire1 : reg4)))));
      if ((7'h41))
        begin
          reg6 <= wire1[(3'h4):(1'h0)];
          reg7 <= (-($signed($unsigned(wire1)) ?
              wire0[(4'ha):(2'h2)] : wire1[(3'h7):(3'h6)]));
          reg8 <= wire1;
          reg9 <= wire1;
        end
      else
        begin
          reg6 <= ($unsigned((wire3[(3'h6):(3'h5)] ?
              $signed(reg7) : ((reg9 >>> reg7) ?
                  $signed((8'ha2)) : reg6[(1'h1):(1'h0)]))) >= reg8);
          reg7 <= reg6;
          reg8 <= (((~^(+(reg8 ? wire3 : reg6))) ?
                  reg8[(5'h10):(4'hf)] : wire0) ?
              reg5 : (((~{reg4, wire3}) ?
                  $signed($unsigned(reg8)) : $signed({reg5})) ~^ ((8'ha3) ?
                  (reg8[(2'h3):(1'h0)] ?
                      {wire0, wire2} : {wire2, wire1}) : $unsigned((wire0 ?
                      wire2 : wire1)))));
          reg9 <= {(8'hab), wire3};
        end
      reg10 <= $signed(((~^((wire3 > (8'ha4)) || (reg8 * wire3))) || $unsigned((~&$signed((8'ha9))))));
    end
  assign wire11 = {reg5,
                      (($unsigned($unsigned(reg9)) ?
                          reg9[(3'h7):(3'h4)] : reg7) < {(~^$unsigned(reg5))})};
  assign wire12 = reg8[(4'h8):(3'h6)];
  module13 #() modinst27 (.wire18(wire0), .wire17(reg10), .wire15(wire1), .clk(clk), .wire16(reg7), .y(wire26), .wire14(reg4));
  assign wire28 = $signed($signed({$signed($signed(reg5))}));
  assign wire29 = ((wire11 <= ($unsigned((wire3 + wire26)) ^~ ((reg5 && (8'ha3)) ?
                      reg9 : $unsigned(reg7)))) * ((((reg8 ?
                      wire2 : wire3) & $signed((8'haa))) + ((^reg5) ?
                      reg9[(4'hc):(1'h0)] : (^reg6))) && wire0));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(4'he):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(5'h11):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  assign y = {wire25, wire24, wire23, wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = wire14;
  assign wire20 = ({(~|wire17[(1'h0):(1'h0)])} * {wire19});
  assign wire21 = wire14;
  assign wire22 = {(wire15 >>> $unsigned((8'hb4)))};
  assign wire23 = ($unsigned({$signed((wire19 ? (8'hba) : wire18))}) ?
                      {$unsigned($signed((wire16 ? wire19 : wire14))),
                          $unsigned(($unsigned(wire19) | wire17))} : (&(^$unsigned((!wire16)))));
  assign wire24 = (~wire17);
  assign wire25 = (wire18[(4'hd):(3'h7)] ?
                      (&(($signed(wire20) << $signed(wire20)) << $unsigned(wire16[(2'h2):(1'h0)]))) : ($unsigned(wire19) ?
                          wire21 : $signed((&wire22))));
endmodule
