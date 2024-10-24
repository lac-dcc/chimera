module top
#(parameter param13 = {{{((!(8'hb6)) <<< (^~(8'hb3))), (8'ha7)}, (8'ha1)}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire12;
  wire [(4'ha):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {((+($signed(wire1) ? $signed(wire2) : $signed((8'h9c)))) ?
                         $signed((!wire3)) : ((|wire2) && ($unsigned(wire2) ?
                             {(8'hbc), (8'hb7)} : wire0)))};
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned((|((wire3 || (8'had)) ?
          {wire4} : (^wire3)))));
      reg6 <= {wire0[(3'h4):(3'h4)], $unsigned(wire3[(2'h2):(1'h1)])};
      reg7 <= (&$unsigned(reg5[(5'h14):(4'hb)]));
      reg8 <= $unsigned(((((reg5 ? reg5 : reg7) ?
                  reg5[(2'h2):(1'h0)] : (^wire2)) ?
              reg5 : ($signed(wire0) >= $signed((8'hbc)))) ?
          $unsigned(reg6) : (~{wire0[(4'h8):(1'h0)]})));
      reg9 <= (-wire1);
    end
  assign wire10 = ({(reg6[(3'h6):(1'h0)] | ($signed(reg8) + (8'hba)))} > ($unsigned((-$signed(reg9))) ?
                      $signed({{wire2, reg5},
                          (~^wire1)}) : $signed((-(-wire1)))));
  assign wire11 = $unsigned((+$unsigned(wire3)));
  assign wire12 = $signed(((~|$signed((wire11 ? wire10 : wire1))) ?
                      reg8 : ((|wire3[(1'h1):(1'h1)]) ?
                          {(reg8 | wire1)} : wire2[(1'h0):(1'h0)])));
endmodule
