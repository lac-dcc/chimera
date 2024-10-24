module top
#(parameter param19 = (~((~^(((8'ha6) ? (8'ha7) : (8'hbd)) >= (|(8'hb7)))) | (((~(8'h9f)) <<< ((8'hbc) ? (8'h9c) : (8'hb7))) != (~&((7'h40) ? (8'ha3) : (8'had)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire18,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire0[(4'ha):(3'h7)];
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned(wire4));
      reg6 <= reg5[(2'h2):(1'h1)];
      reg7 <= {((wire0 - wire1) > $unsigned(((^~wire0) ?
              (wire3 > wire3) : $unsigned(wire0))))};
      reg8 <= reg6[(4'he):(2'h2)];
    end
  assign wire9 = $signed($signed({$signed(wire1), (7'h42)}));
  assign wire10 = (reg6[(3'h5):(2'h3)] ?
                      $unsigned(((~(8'hb1)) ?
                          $unsigned(((7'h44) ? reg7 : (8'hb8))) : {(reg5 ?
                                  reg7 : (8'h9f)),
                              wire9})) : ((&wire2[(3'h6):(2'h3)]) && wire0[(4'h9):(3'h5)]));
  assign wire11 = ($signed($signed(wire3)) > $signed((wire9 > reg7)));
  assign wire12 = {$unsigned((reg8[(4'h8):(2'h2)] ?
                          $signed($signed(reg8)) : reg7))};
  assign wire13 = wire1;
  always
    @(posedge clk) begin
      reg14 <= ((($unsigned({wire1}) ?
                  $signed(wire2[(5'h10):(1'h1)]) : wire3[(2'h2):(2'h2)]) ?
              $signed($unsigned(wire1)) : wire12) ?
          $signed({(wire11 ? $signed(wire3) : (reg6 ? reg5 : (8'h9f))),
              {reg7}}) : {wire10[(2'h3):(2'h2)],
              ($unsigned((&wire9)) ?
                  wire3[(2'h2):(2'h2)] : wire1[(2'h3):(1'h0)])});
      reg15 <= $unsigned((|($signed(wire2) ? reg5 : $unsigned((~(8'hb6))))));
      reg16 <= $signed({$unsigned($signed({wire2}))});
      reg17 <= wire11;
    end
  assign wire18 = wire0;
endmodule
