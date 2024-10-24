module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  wire [(3'h5):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire1[(3'h6):(3'h4)];
      reg5 <= wire2;
      reg6 <= reg5;
      if (wire2)
        begin
          reg7 <= wire0;
          reg8 <= $signed(reg7);
        end
      else
        begin
          reg7 <= ($signed((~^({(7'h40), reg5} ?
                  $unsigned((8'hbf)) : $signed(reg8)))) ?
              (reg7 ? wire0 : (~&wire1[(1'h1):(1'h0)])) : ($unsigned(reg5) ?
                  $unsigned(reg5[(4'hc):(4'hb)]) : $unsigned(wire3[(3'h5):(3'h4)])));
          reg8 <= wire3;
          reg9 <= $unsigned(wire3[(3'h6):(2'h3)]);
          reg10 <= $unsigned((-{reg6}));
        end
      reg11 <= (($unsigned({(reg9 ^~ (8'hae)), (~&(8'hbd))}) ?
              (^{$unsigned(reg7)}) : wire0) ?
          reg5[(4'hf):(3'h5)] : {(|$unsigned($unsigned(reg9))), (8'h9e)});
    end
  assign wire12 = reg9;
  assign wire13 = {$unsigned($unsigned((-wire0)))};
  assign wire14 = {(~^wire2), $unsigned(reg7)};
  assign wire15 = reg9[(1'h1):(1'h0)];
  assign wire16 = reg8;
  assign wire17 = (~&reg7[(3'h4):(2'h2)]);
  assign wire18 = ((!((&wire12[(5'h10):(1'h0)]) || (~(reg8 >>> wire15)))) ?
                      ($signed((|$unsigned(wire2))) ?
                          (^~wire2[(3'h7):(1'h1)]) : reg10[(1'h0):(1'h0)]) : $unsigned($signed((wire12 ?
                          $unsigned(wire15) : {reg6, reg7}))));
endmodule
