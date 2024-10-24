module top
#(parameter param13 = (|((~(((8'h9c) >= (8'hb3)) | ((7'h42) ? (8'hbb) : (8'ha2)))) << (-((8'hb2) ? (~(8'hb8)) : ((8'hb8) && (8'ha1)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire4,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (~^(-(($signed((8'ha9)) ? (wire0 < wire3) : wire1) ?
                     (+$unsigned(wire2)) : {(wire3 ? wire1 : (8'hbf))})));
  always
    @(posedge clk) begin
      reg5 <= (wire4[(4'hb):(4'h8)] ?
          ($unsigned(wire2) | wire1) : $signed($unsigned($unsigned({wire1}))));
      reg6 <= $unsigned(($unsigned((~|((8'hbf) ? wire0 : wire0))) ?
          (($unsigned(wire3) ?
              (reg5 ? wire2 : wire4) : wire4[(3'h4):(1'h0)]) >= (wire2 ?
              (wire3 >> wire2) : wire4[(1'h1):(1'h0)])) : wire2));
    end
  assign wire7 = ($signed(reg5[(4'hb):(3'h7)]) >= $signed(wire1[(4'hb):(4'h8)]));
  assign wire8 = ((^~$signed((-((8'h9d) ?
                     wire1 : wire0)))) & ($unsigned(reg5[(4'ha):(3'h7)]) ?
                     $signed($signed({wire3, wire4})) : (8'hb7)));
  assign wire9 = {(|wire3[(4'h8):(3'h4)])};
  assign wire10 = (|(wire9 == ($unsigned((wire2 ^ wire0)) ?
                      $signed({wire3}) : ($unsigned(wire8) ?
                          (wire9 ? reg5 : wire7) : {wire1, wire9}))));
  assign wire11 = wire2;
  assign wire12 = $signed(wire2);
endmodule
