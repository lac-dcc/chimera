module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg13,
                 (1'h0)};
  assign wire4 = $unsigned({((wire3[(4'h9):(1'h1)] < $signed((8'hab))) ?
                         wire1[(3'h4):(2'h3)] : wire2)});
  assign wire5 = wire4;
  assign wire6 = wire2[(4'h9):(3'h5)];
  assign wire7 = (wire3[(4'h8):(3'h5)] ?
                     $signed({{$unsigned(wire6), $signed(wire6)},
                         wire4[(3'h5):(2'h3)]}) : (wire0[(4'hc):(4'ha)] >>> {wire5[(2'h2):(1'h0)],
                         (&wire1)}));
  assign wire8 = wire2;
  assign wire9 = {wire7[(4'hb):(2'h3)]};
  assign wire10 = (wire5 ? $signed(wire1) : wire6[(1'h0):(1'h0)]);
  assign wire11 = $unsigned($signed(wire1));
  assign wire12 = (($signed((+(~^(8'haf)))) ?
                          ({{wire8}} ?
                              (~&(wire5 ?
                                  wire1 : wire6)) : (~|(wire10 >= wire6))) : wire2[(4'hb):(4'h9)]) ?
                      $unsigned($unsigned(((8'hbc) ?
                          wire4 : $unsigned((8'hbf))))) : ($unsigned((^~(wire9 > wire7))) ?
                          ($unsigned($signed(wire3)) <<< (wire6[(1'h1):(1'h0)] ?
                              (wire6 ?
                                  wire7 : wire1) : (!wire8))) : wire10[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg13 <= {wire4};
    end
endmodule
