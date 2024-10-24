module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire9,
                 wire8,
                 wire4,
                 reg10,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire2;
  always
    @(posedge clk) begin
      reg5 <= $unsigned((~^$unsigned($unsigned($signed(wire2)))));
      reg6 <= (~^wire1[(5'h13):(4'he)]);
    end
  always
    @(posedge clk) begin
      reg7 <= wire4;
    end
  assign wire8 = ((((wire4 || wire3) < reg5[(2'h3):(2'h3)]) ^ $signed(((wire2 ^ wire3) | (wire2 << reg5)))) ?
                     {{(8'hbb), reg5},
                         $unsigned(reg5[(1'h1):(1'h0)])} : $signed(reg7));
  assign wire9 = ($unsigned(wire8[(1'h1):(1'h1)]) ?
                     ($unsigned(wire2) ?
                         {(wire4 ? $unsigned(reg6) : (wire8 && wire0)),
                             wire8[(2'h2):(1'h0)]} : (^$unsigned(wire8[(3'h5):(2'h2)]))) : ($signed(((^~(8'hb6)) ?
                             wire4[(4'h8):(3'h7)] : wire0)) ?
                         (((^~reg7) >= $unsigned(reg5)) ?
                             $signed(wire2) : wire2[(1'h0):(1'h0)]) : $signed($signed((reg6 * (8'hbf))))));
  always
    @(posedge clk) begin
      reg10 <= ($signed((($signed((8'hb2)) ?
              (reg5 >>> wire4) : (wire3 != reg6)) ?
          $signed(wire4) : (wire8 <<< $unsigned((7'h44))))) << (^~(wire1[(4'he):(1'h1)] ?
          (reg6[(3'h5):(2'h3)] <= (-wire4)) : $unsigned((~^wire2)))));
    end
  assign wire11 = wire2;
  assign wire12 = $unsigned($signed((~$unsigned($unsigned(wire2)))));
  assign wire13 = (({reg6, (~((8'hb8) ? (8'ha0) : (8'hb3)))} <= wire4) ?
                      (&wire4) : wire12[(2'h2):(2'h2)]);
  assign wire14 = (~&($signed({(+(8'h9f)),
                      wire9[(4'hd):(4'h9)]}) + (reg6[(2'h3):(2'h2)] & ({reg7} && (^~wire12)))));
  assign wire15 = (~&$signed(wire3));
  assign wire16 = reg10;
  assign wire17 = $signed(wire16[(4'h8):(1'h1)]);
endmodule
