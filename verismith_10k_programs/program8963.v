module top
#(parameter param33 = (^((~^(((8'hb5) + (8'hb7)) ? ((8'hbb) != (8'ha8)) : (+(8'ha0)))) ? {(8'had)} : ((~&((8'hb8) ? (8'had) : (8'hbc))) || {(~|(8'hbe)), ((8'h9f) + (8'ha7))}))), 
parameter param34 = param33)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = wire1[(4'h9):(3'h7)];
  assign wire7 = wire0[(4'he):(3'h7)];
  assign wire8 = $unsigned((~$unsigned((~&$signed(wire5)))));
  module9 #() modinst28 (wire27, clk, wire3, wire8, wire4, wire2);
  assign wire29 = (($signed((wire1[(4'ha):(1'h1)] ? wire27 : (&(8'hb7)))) ?
                      $signed(wire6) : wire3) && (&$signed(((wire2 & (8'haa)) >> $unsigned((7'h42))))));
  assign wire30 = $unsigned((wire27 >= ((^(wire8 ? (8'hab) : wire4)) ?
                      ({wire29} || $signed((8'hba))) : ($signed(wire1) ?
                          wire2 : (wire8 >>> wire1)))));
  assign wire31 = (wire7 == (wire2 || (({wire29, wire0} ?
                          $unsigned(wire0) : wire3[(2'h2):(1'h1)]) ?
                      (+(wire29 - wire4)) : $signed(wire4[(2'h3):(2'h2)]))));
  assign wire32 = {$signed($signed($unsigned({(8'hbc), wire7})))};
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire13;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire [(3'h4):(1'h0)] wire11;
  input wire [(5'h13):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire19;
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire19,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= $unsigned($signed($unsigned($signed($signed(wire13)))));
      reg15 <= $unsigned(($signed(((wire11 | reg14) ^~ wire12[(1'h0):(1'h0)])) ?
          ((-(&wire13)) ? wire12 : $signed(wire13)) : $unsigned(((~&wire13) ?
              {wire11} : (~^wire10)))));
      reg16 <= wire13;
      reg17 <= (-(wire10 ?
          (^$unsigned(((8'hb3) ? reg15 : wire10))) : {($signed(reg16) ?
                  $signed(wire12) : (|wire13)),
              ((wire11 & wire10) ? (!reg15) : reg15)}));
      reg18 <= wire13[(2'h2):(2'h2)];
    end
  assign wire19 = reg16[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg20 <= $signed((($signed((!wire11)) ? reg15 : reg15) ?
          ({(wire19 ?
                  (8'hba) : wire12)} + wire11[(3'h4):(1'h0)]) : reg16[(4'hc):(2'h2)]));
      reg21 <= wire19[(2'h3):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg22 <= ((8'ha2) ~^ wire19[(3'h5):(3'h4)]);
      reg23 <= reg16;
      reg24 <= wire19[(3'h6):(2'h2)];
    end
  assign wire25 = (^~{$unsigned(wire13[(2'h2):(1'h0)])});
  assign wire26 = wire25[(1'h0):(1'h0)];
endmodule
