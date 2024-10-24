module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = ((^$signed(wire1)) + $unsigned((~|(~^(-wire1)))));
  always
    @(posedge clk) begin
      reg6 <= {$unsigned((~&($unsigned((8'hb8)) ?
              $unsigned(wire3) : (~^wire1)))),
          {{(((8'hbb) ? (8'ha0) : wire4) ? wire2[(3'h4):(1'h0)] : {wire5})}}};
    end
  always
    @(posedge clk) begin
      reg7 <= ($unsigned((8'h9d)) || {(($signed(wire5) ?
              (^~wire4) : $signed(wire3)) << $unsigned($unsigned(reg6)))});
      reg8 <= (wire2 ? (7'h41) : $unsigned($signed(wire0[(5'h13):(5'h13)])));
      reg9 <= (((!wire5) >>> $signed(reg7[(4'he):(4'hc)])) > $unsigned($signed((~$signed(wire0)))));
      reg10 <= ((reg9[(2'h3):(2'h3)] || wire0[(5'h13):(4'hc)]) ?
          ($unsigned(wire4[(2'h2):(2'h2)]) ^~ ($signed((wire2 ?
              wire1 : reg7)) <<< (8'hbd))) : (8'had));
    end
  assign wire11 = (wire3[(3'h5):(3'h4)] ?
                      wire2[(2'h2):(2'h2)] : ((^~((-wire4) >= (wire0 ?
                          wire2 : reg7))) << $signed(wire1)));
  assign wire12 = reg6;
  assign wire13 = (8'h9c);
  assign wire14 = (^wire1[(2'h2):(1'h1)]);
  assign wire15 = wire11;
endmodule
