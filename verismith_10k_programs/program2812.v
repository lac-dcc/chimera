module top
#(parameter param27 = (&{(8'hac), {(8'hba)}}), 
parameter param28 = (~|(~|(&((!param27) << (+param27))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire22;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire22,
                 (1'h0)};
  assign wire5 = wire1;
  assign wire6 = (wire4[(2'h2):(1'h0)] ?
                     (~|wire4[(3'h5):(3'h4)]) : wire4[(1'h0):(1'h0)]);
  assign wire7 = wire1[(4'h9):(2'h2)];
  assign wire8 = {$unsigned((^$unsigned(wire0[(4'hb):(3'h5)])))};
  assign wire9 = ({($unsigned((wire7 ?
                         (8'hb6) : wire5)) ~^ $signed($signed(wire0))),
                     (8'hb3)} + {wire4, wire1[(4'h9):(4'h8)]});
  module10 #() modinst23 (wire22, clk, wire9, wire1, wire0, wire4, wire6);
  assign wire24 = (8'ha1);
  assign wire25 = {wire5[(3'h4):(3'h4)], $unsigned(wire8)};
  assign wire26 = (($unsigned(wire2) | $unsigned((wire25[(4'h8):(3'h7)] ?
                          wire5[(2'h3):(1'h1)] : wire7))) ?
                      wire6[(3'h7):(3'h5)] : $unsigned(wire6[(2'h3):(1'h0)]));
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  assign y = {wire21, wire20, wire19, wire17, wire16, reg18, (1'h0)};
  assign wire16 = (+wire12);
  assign wire17 = wire14;
  always
    @(posedge clk) begin
      reg18 <= ((~((((8'hb1) ^~ wire16) ?
              (~wire14) : (wire15 ? (8'hab) : wire14)) ?
          wire16 : (-$signed(wire15)))) ^ $signed(wire11));
    end
  assign wire19 = $unsigned($signed(((^~wire11) ?
                      {$signed(wire12), (8'hbd)} : wire16[(5'h12):(4'h8)])));
  assign wire20 = wire16;
  assign wire21 = ((($unsigned({reg18, wire14}) ? wire17 : wire17) ?
                      ((~(^wire15)) ?
                          {wire12, (7'h44)} : ((wire17 ?
                              wire17 : wire20) || ((8'ha6) && wire20))) : (wire17 ?
                          {wire12[(4'ha):(4'h9)],
                              $signed(wire12)} : (wire19 + ((8'haf) ?
                              wire14 : wire19)))) <<< (8'hbf));
endmodule
