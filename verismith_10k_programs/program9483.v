module top
#(parameter param18 = (8'hb1), 
parameter param19 = (param18 ? ({param18} ? ({{param18}, param18} ? param18 : (^{param18})) : ({{param18}} ? param18 : ((~param18) <<< (param18 ? param18 : param18)))) : param18))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $signed(wire1);
  assign wire5 = (({((8'had) ?
                         ((7'h43) < wire1) : (!wire0))} < wire0[(3'h4):(3'h4)]) | wire4[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      reg6 <= wire4[(2'h2):(1'h1)];
      reg7 <= (7'h43);
      reg8 <= ((~$signed((8'ha9))) ?
          $signed((~^((^~wire2) ~^ wire2[(2'h2):(2'h2)]))) : (7'h41));
      if (($signed(wire4) || (8'hb7)))
        begin
          reg9 <= wire3[(4'ha):(3'h7)];
        end
      else
        begin
          if ((~&(reg6 <= $unsigned(wire1[(4'h9):(3'h5)]))))
            begin
              reg9 <= (wire3 >= ($signed((|(-(8'hb2)))) <= $unsigned({$unsigned((8'hbf))})));
              reg10 <= reg9;
              reg11 <= reg10;
              reg12 <= $signed(reg8);
            end
          else
            begin
              reg9 <= (&wire3);
              reg10 <= ((wire4 == $unsigned({$unsigned(wire0),
                      reg8[(4'he):(3'h7)]})) ?
                  wire1[(1'h0):(1'h0)] : reg9);
              reg11 <= $signed(reg11);
            end
          reg13 <= $signed(((8'ha3) ?
              $unsigned(reg12[(3'h6):(1'h1)]) : wire2[(2'h3):(2'h3)]));
        end
      reg14 <= $unsigned(wire5[(3'h7):(1'h1)]);
    end
  assign wire15 = (8'hbd);
  assign wire16 = (+((($signed(wire1) && (reg8 >= (8'hbc))) < $signed(reg12)) * (~|((wire4 ?
                          wire2 : reg14) ?
                      (wire1 - wire5) : ((8'hbe) ? (8'hb6) : reg13)))));
  assign wire17 = ({{($signed((8'hb1)) ? reg9 : reg9[(1'h1):(1'h1)]),
                          $signed((wire3 != reg10))},
                      $signed(wire5[(4'he):(4'he)])} >= ($unsigned($unsigned((wire16 ?
                          wire3 : wire3))) ?
                      ($signed(reg10[(4'h8):(2'h2)]) ?
                          wire16[(1'h1):(1'h1)] : (-$signed((8'hb0)))) : $unsigned(((reg14 > reg14) | (wire2 ?
                          reg12 : (8'ha3))))));
endmodule
