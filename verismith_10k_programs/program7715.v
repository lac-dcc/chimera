module top
#(parameter param13 = (!((8'hb1) ? ((((8'ha3) ? (8'ha7) : (8'ha7)) ? ((8'hbc) ? (8'hbe) : (8'ha1)) : ((8'ha4) ^~ (8'hb0))) ? (((8'hb3) <= (8'hba)) == (+(8'ha4))) : (~|((8'hae) ~^ (8'hb6)))) : ((((8'ha6) > (8'hb1)) ^~ (-(8'h9f))) ? (&(^~(8'hb9))) : {((8'ha9) ^~ (8'hac))}))), 
parameter param14 = {(param13 ? (&(~^(param13 + param13))) : (8'h9d))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = (-wire0[(2'h3):(1'h0)]);
  assign wire5 = ((~$unsigned(wire0[(4'hb):(4'h9)])) ~^ (8'hb3));
  assign wire6 = wire0[(3'h5):(3'h5)];
  assign wire7 = $unsigned(wire2[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg8 <= $signed(wire4);
      reg9 <= $unsigned({$signed(((reg8 ? reg8 : wire4) ?
              (wire5 ? wire7 : wire6) : (wire5 <= wire0))),
          (&wire2)});
      reg10 <= (!(reg9[(4'hf):(4'hf)] ?
          wire2 : ({(~wire5)} ?
              (!((8'ha1) ^~ wire3)) : $signed($unsigned(reg9)))));
    end
  assign wire11 = (reg9 ?
                      $signed((~|(reg8 ?
                          $signed(wire7) : $signed(wire2)))) : ($unsigned($unsigned((8'ha3))) ?
                          {((8'hb1) ?
                                  ((8'h9c) ? reg9 : wire4) : (wire0 ?
                                      (8'ha9) : wire2))} : $unsigned(({wire5} ?
                              $unsigned(wire5) : $unsigned((8'hbd))))));
  assign wire12 = ($unsigned(wire0[(5'h11):(4'hc)]) ?
                      reg9[(5'h11):(2'h3)] : ((+wire1) <<< $signed(((wire11 * wire7) == reg9))));
endmodule
