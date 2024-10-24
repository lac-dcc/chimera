module top
#(parameter param13 = ((!{(^~{(8'ha9), (8'hae)}), (!((8'hb2) || (8'hac)))}) <= ((((~^(8'hba)) ? (&(8'hba)) : ((8'hb3) ^ (8'ha8))) <= ((-(8'hb7)) ? ((8'ha6) ? (8'hb3) : (8'haa)) : ((8'haa) ? (8'h9d) : (8'hac)))) <= (|(((8'hb0) ? (8'ha4) : (8'hb3)) ? ((8'hb8) || (8'hbe)) : (8'ha9))))), 
parameter param14 = ((-(~(~|(param13 ~^ param13)))) ? param13 : (-((^(param13 ^ param13)) ? ({param13, param13} >>> param13) : param13))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire6,
                 wire5,
                 wire4,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire1[(2'h3):(2'h3)];
  assign wire5 = wire0[(2'h2):(1'h0)];
  assign wire6 = $signed($signed(wire3[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg7 <= wire0;
    end
  always
    @(posedge clk) begin
      reg8 <= $signed($unsigned($unsigned($signed($signed(wire4)))));
      reg9 <= $unsigned(wire6[(3'h5):(3'h5)]);
    end
  assign wire10 = {$unsigned(wire4), $signed(wire0[(2'h2):(2'h2)])};
  assign wire11 = $signed((wire10 * $signed($signed({wire5, reg8}))));
  assign wire12 = ($unsigned((($signed(wire4) ?
                          (wire3 ? reg7 : (8'hb5)) : (7'h40)) ?
                      $unsigned($signed(wire5)) : $signed(((8'haf) ?
                          reg9 : wire2)))) >> $unsigned($signed({$unsigned(wire4)})));
endmodule
