module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire4,
                 reg17,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned($signed($unsigned((((7'h42) && wire1) ?
                     wire1[(2'h2):(2'h2)] : $signed((8'haf))))));
  always
    @(posedge clk) begin
      reg5 <= ($unsigned(wire3[(4'hd):(4'hc)]) > $signed(wire1));
      reg6 <= $signed((wire0 ?
          wire4[(3'h7):(3'h6)] : ({$unsigned(reg5), wire3[(1'h0):(1'h0)]} ?
              (-(wire4 ? wire0 : reg5)) : (wire4 ?
                  {(8'ha7), wire1} : (wire0 ^ wire0)))));
      reg7 <= (($signed((wire1[(2'h2):(2'h2)] > $unsigned(wire0))) ^ ((~^$signed(wire1)) << (|(reg5 >= wire1)))) ?
          (^~($unsigned((8'hb2)) == $unsigned($signed(reg5)))) : (reg6 * (8'hbe)));
      reg8 <= $unsigned((~|reg7));
    end
  always
    @(posedge clk) begin
      reg9 <= reg6;
      reg10 <= $signed((wire4 ?
          $signed(reg5) : (($signed(wire4) ? $signed(reg6) : (8'hb6)) ?
              (|wire1[(1'h1):(1'h1)]) : wire2[(3'h5):(3'h4)])));
      reg11 <= ((&$unsigned({(wire2 ? reg8 : reg7)})) ?
          ($signed((wire3[(4'h8):(1'h1)] ^~ wire0)) ?
              wire2[(4'h9):(4'h9)] : wire0) : reg10[(1'h0):(1'h0)]);
    end
  assign wire12 = $unsigned(({(|((8'hac) ? wire0 : (8'hbf)))} ?
                      reg8 : wire3[(4'hc):(3'h6)]));
  assign wire13 = {(reg5 ?
                          (&$unsigned((|wire3))) : $unsigned(wire0[(4'he):(3'h7)]))};
  assign wire14 = (reg9[(3'h7):(2'h3)] * $signed($signed($signed((^~wire0)))));
  assign wire15 = $unsigned(({wire14, $unsigned((wire2 ? wire14 : reg9))} ?
                      $unsigned($signed(reg6[(3'h5):(1'h1)])) : (((|wire13) * (reg9 ?
                          (8'hbe) : reg11)) >> $unsigned(wire3))));
  assign wire16 = wire4[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= {(7'h42), wire2};
    end
  assign wire18 = reg10;
  assign wire19 = {((~&$unsigned($signed(wire14))) >= (7'h40)),
                      wire0[(4'he):(4'hb)]};
  assign wire20 = wire14;
  assign wire21 = wire3;
  assign wire22 = $unsigned((wire1[(2'h2):(1'h1)] <<< wire19[(1'h0):(1'h0)]));
  assign wire23 = ($unsigned(reg9[(3'h4):(2'h2)]) ?
                      (~&reg7) : (&($unsigned($signed(wire14)) ?
                          $unsigned((wire12 * reg8)) : (~|(wire3 < wire22)))));
endmodule
