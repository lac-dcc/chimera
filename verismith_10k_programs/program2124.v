module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire8,
                 wire7,
                 wire5,
                 wire4,
                 reg9,
                 reg6,
                 (1'h0)};
  assign wire4 = (^~(8'hb1));
  assign wire5 = ((wire1[(1'h0):(1'h0)] ?
                         $signed(({wire4,
                             wire2} ^ (^wire3))) : ((8'hba) == {(wire1 ?
                                 wire4 : (8'hb1)),
                             ((8'h9c) && wire0)})) ?
                     wire4[(1'h1):(1'h0)] : $signed({wire3,
                         ((wire4 ? wire4 : wire0) & $signed(wire4))}));
  always
    @(posedge clk) begin
      reg6 <= (wire3[(3'h5):(1'h1)] && $signed(wire3[(3'h4):(3'h4)]));
    end
  assign wire7 = wire1[(4'hc):(4'h8)];
  assign wire8 = (wire0[(1'h0):(1'h0)] & (~&(!((wire0 ? reg6 : wire3) ?
                     wire5[(2'h3):(2'h2)] : $signed((8'hb7))))));
  always
    @(posedge clk) begin
      reg9 <= ((~&(8'ha4)) ?
          wire0 : ((^~($signed(wire5) ? reg6 : $unsigned(wire2))) ?
              $unsigned($signed($unsigned(wire5))) : wire4));
    end
  assign wire10 = wire8;
  assign wire11 = {(^~$signed($unsigned((^~wire2))))};
  assign wire12 = $unsigned($unsigned($unsigned(wire8)));
  assign wire13 = (((^reg6) | (^~$signed($signed((7'h40))))) * wire0[(4'h9):(3'h5)]);
endmodule
