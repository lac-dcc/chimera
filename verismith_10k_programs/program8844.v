module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire39;
  assign y = {wire5, wire6, wire7, wire39, (1'h0)};
  assign wire5 = ((($unsigned($unsigned((8'hbf))) ?
                             ((wire2 ^ wire2) * $unsigned(wire0)) : ((wire1 ^ wire2) ?
                                 (8'hbf) : $signed(wire4))) ?
                         wire4 : (wire2[(1'h1):(1'h1)] - wire1[(3'h6):(3'h4)])) ?
                     (+(~&$unsigned($signed(wire2)))) : $unsigned(((wire1[(3'h4):(2'h3)] < (+wire3)) << $unsigned((-(8'ha6))))));
  assign wire6 = wire5;
  assign wire7 = $unsigned({$unsigned((wire3 >> ((8'ha7) ? wire3 : wire4)))});
  module8 #() modinst40 (wire39, clk, wire7, wire0, wire4, wire2, wire1);
endmodule

module module8
#(parameter param38 = (~|(~&((((8'hbf) >>> (8'hb2)) ? (+(8'hba)) : ((8'hb5) < (8'h9e))) ? (~&(^(8'hbb))) : (((8'hbe) ? (8'hb1) : (8'ha6)) ? {(8'ha6), (8'hae)} : {(8'hb7)})))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire13;
  input wire signed [(4'h9):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(4'hc):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(4'hf):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire27,
                 wire26,
                 wire25,
                 wire22,
                 wire21,
                 wire16,
                 wire15,
                 wire14,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg24,
                 reg23,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire14 = {$signed(wire11)};
  assign wire15 = $signed($signed((~|wire14)));
  assign wire16 = (^~(~|$unsigned(wire9)));
  always
    @(posedge clk) begin
      reg17 <= (7'h42);
      reg18 <= $signed(wire15);
      reg19 <= {($signed(wire11) ^ ((~(reg17 ~^ wire12)) & wire10[(2'h2):(1'h0)])),
          wire12};
      reg20 <= ((~&$signed(($unsigned(wire16) >> wire13))) <<< wire10[(2'h3):(2'h2)]);
    end
  assign wire21 = {(~^reg17[(4'hc):(4'h9)])};
  assign wire22 = $unsigned(wire11[(4'ha):(2'h3)]);
  always
    @(posedge clk) begin
      reg23 <= wire22;
      reg24 <= wire13;
    end
  assign wire25 = $unsigned(reg24[(3'h5):(3'h5)]);
  assign wire26 = (~&$signed(wire14));
  assign wire27 = wire14;
  always
    @(posedge clk) begin
      reg28 <= $signed(((~&(8'hbe)) * (~^wire22[(3'h7):(2'h2)])));
      reg29 <= $signed($signed((8'hb1)));
      reg30 <= ({(-$unsigned((wire11 >>> wire14))),
              (~&{((8'hb5) ? reg23 : wire22)})} ?
          wire21 : ({($signed(reg28) ? {wire25} : $unsigned(wire21)),
                  ((wire16 <<< reg23) ^~ (wire13 ? wire13 : (8'hbe)))} ?
              $signed((~$signed(reg23))) : wire25[(3'h5):(2'h2)]));
      reg31 <= ((8'hba) - wire26[(1'h0):(1'h0)]);
      reg32 <= ($signed(($unsigned((reg20 + wire14)) ?
              $unsigned((^reg30)) : reg19[(3'h7):(2'h3)])) ?
          wire27[(2'h2):(1'h1)] : reg31);
    end
  assign wire33 = wire26;
  assign wire34 = $unsigned(wire26[(1'h1):(1'h0)]);
  assign wire35 = (~&(wire26[(1'h1):(1'h0)] ~^ (({wire33,
                          wire12} | $signed(wire21)) ?
                      $signed($signed(wire9)) : reg17)));
  assign wire36 = ((($unsigned($signed(reg23)) ?
                      wire27 : ($unsigned(wire33) ?
                          (+reg28) : reg20[(3'h7):(1'h1)])) >= wire27[(5'h12):(4'hc)]) ^ reg29[(2'h3):(2'h3)]);
  assign wire37 = (~&$signed(($signed((&wire10)) ^ $signed(reg20))));
endmodule
