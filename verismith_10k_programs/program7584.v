module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire21, wire19, wire8, wire4, reg7, reg6, reg5, (1'h0)};
  assign wire4 = ((wire2 == (wire0 | ($signed(wire2) + $unsigned(wire2)))) == (+(wire1[(3'h4):(1'h1)] == (^~$signed((8'hba))))));
  always
    @(posedge clk) begin
      reg5 <= (wire3 || $unsigned($signed($unsigned({wire0, wire2}))));
      reg6 <= (reg5 >> $signed(((wire2 ?
              (wire1 ? wire4 : wire2) : $unsigned(wire3)) ?
          wire1[(3'h4):(2'h3)] : wire1[(3'h7):(2'h2)])));
      reg7 <= (~|(^(((~&(8'ha0)) * {wire4, wire0}) ?
          ($signed(wire1) * reg6) : (reg6 ? (8'hb5) : $signed(wire0)))));
    end
  assign wire8 = $signed(wire3[(3'h4):(2'h2)]);
  module9 #() modinst20 (.y(wire19), .wire13(reg7), .wire11(wire2), .wire12(reg5), .clk(clk), .wire10(wire3));
  assign wire21 = $unsigned(wire3);
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire14;
  assign y = {wire18, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = wire10;
  assign wire15 = wire13;
  assign wire16 = (~|wire13);
  assign wire17 = (($signed((~^(wire13 ? wire15 : wire11))) ^~ (!(8'h9f))) ?
                      wire12 : wire13);
  assign wire18 = $unsigned(wire12);
endmodule
