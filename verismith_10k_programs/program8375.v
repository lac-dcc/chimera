module top
#(parameter param18 = {(~&(((8'hb2) ? ((8'haf) + (8'haf)) : (~&(8'haf))) ? (((8'ha2) >= (8'hb9)) ? ((8'ha0) && (8'haf)) : {(8'haa), (8'hb5)}) : ({(8'hbc), (8'hbb)} <= ((8'hba) ? (8'hb8) : (8'h9f)))))}, 
parameter param19 = param18)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = (^(($signed((&wire0)) ? (8'ha4) : wire3[(3'h6):(2'h3)]) ?
                     wire2 : $unsigned($signed($signed((7'h42))))));
  assign wire5 = (7'h40);
  assign wire6 = $unsigned((8'ha3));
  assign wire7 = wire3;
  assign wire8 = {wire2, $unsigned($unsigned($signed(wire2[(2'h3):(1'h0)])))};
  assign wire9 = wire7[(2'h2):(2'h2)];
  assign wire10 = (((wire4 >>> wire8) * $unsigned($signed((wire9 && wire2)))) ~^ ((8'h9c) ?
                      $unsigned($unsigned({wire5})) : wire7[(4'hc):(1'h0)]));
  always
    @(posedge clk) begin
      reg11 <= wire8;
      reg12 <= $unsigned((wire3[(3'h7):(3'h7)] >>> $signed((wire7 ?
          $signed(wire8) : $signed(wire5)))));
      reg13 <= wire9;
      reg14 <= $signed((reg13 ?
          wire9 : {wire3[(2'h2):(1'h1)], $unsigned((wire6 < wire0))}));
      reg15 <= $unsigned($signed(($signed(((8'ha6) >>> reg13)) && (!wire2))));
    end
  assign wire16 = wire0;
  assign wire17 = $signed(wire5);
endmodule
