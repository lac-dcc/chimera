module top
#(parameter param16 = (!(~&(+({(8'ha7)} ? ((8'ha1) >>> (8'h9c)) : ((8'hba) ? (7'h40) : (8'hb6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire8,
                 wire7,
                 wire6,
                 reg10,
                 reg9,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (wire0[(1'h1):(1'h0)] >> wire1[(1'h1):(1'h0)]);
      reg5 <= reg4[(5'h11):(2'h3)];
    end
  assign wire6 = (((reg5 ?
                             (~^reg4) : ((reg4 ?
                                 reg4 : wire2) & $unsigned(reg4))) ?
                         ($unsigned(wire2) >> $unsigned({wire2,
                             (8'hbe)})) : {$unsigned($unsigned((8'ha5))),
                             {(wire1 ? wire2 : wire3), reg5}}) ?
                     (7'h40) : (|reg5[(4'h8):(3'h5)]));
  assign wire7 = $signed((&(&(wire1[(1'h1):(1'h1)] <<< $signed(reg5)))));
  assign wire8 = (wire0 << (wire0[(2'h3):(1'h1)] != (wire2 ?
                     (^$unsigned(wire2)) : $unsigned({(8'h9c)}))));
  always
    @(posedge clk) begin
      reg9 <= ($signed(wire3) ? (wire0 <= wire8) : wire1);
    end
  always
    @(posedge clk) begin
      reg10 <= ({$signed($unsigned((wire0 ? wire2 : wire1))), $signed(wire1)} ?
          $unsigned((wire2[(1'h0):(1'h0)] * $signed(wire7))) : wire0);
    end
  assign wire11 = reg10[(4'ha):(3'h6)];
  assign wire12 = $signed(wire1);
  assign wire13 = $unsigned({wire7[(3'h4):(3'h4)], (-wire2)});
  assign wire14 = (wire1 >>> wire3[(1'h0):(1'h0)]);
  assign wire15 = {({$signed($unsigned(reg10)), {{reg10, reg4}}} < ({{wire13},
                          reg4[(1'h1):(1'h0)]} - ({(8'ha4),
                          wire1} <<< (&wire7)))),
                      (wire14[(1'h0):(1'h0)] ? wire7 : wire2[(5'h11):(5'h10)])};
endmodule
