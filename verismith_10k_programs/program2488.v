module top
#(parameter param22 = {((({(8'hbd), (8'hb3)} + ((8'hb6) >= (8'hbf))) ^ ((^(7'h42)) == {(8'ha7), (8'ha0)})) ? (({(8'hbc)} == (^~(8'hae))) && ((&(8'hba)) ? ((8'ha0) | (8'ha2)) : ((8'h9d) << (8'h9c)))) : {(~|{(8'hb6)})})}, 
parameter param23 = (({{(~^(8'hac))}, param22} ? ((param22 < param22) ? ({param22, param22} < {param22}) : (param22 ? (param22 ^~ (8'hae)) : param22)) : {({param22, param22} ? (param22 & param22) : ((8'hb2) ? param22 : (8'h9e)))}) ? ((param22 ? {param22, ((8'hb7) ? param22 : param22)} : (8'ha3)) <<< (^~(+(param22 ^ param22)))) : param22))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  assign y = {wire21,
                 wire16,
                 wire15,
                 wire14,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire4 = ({$unsigned($signed({(7'h42), wire3}))} ?
                     (((-{wire2}) >>> ((wire2 ?
                         wire1 : wire3) >> $unsigned(wire0))) <<< wire2) : wire3[(3'h6):(3'h6)]);
  assign wire5 = {(&$signed(($signed(wire2) ?
                         (wire1 | wire2) : $signed((8'hb6)))))};
  assign wire6 = ({$signed(wire3)} + wire5[(4'h8):(1'h1)]);
  assign wire7 = wire3[(3'h4):(1'h0)];
  assign wire8 = (!(8'ha9));
  assign wire9 = $unsigned((wire4[(2'h2):(2'h2)] < (~$signed(wire0))));
  assign wire10 = wire1;
  always
    @(posedge clk) begin
      reg11 <= wire1;
      reg12 <= $signed($unsigned(($unsigned($unsigned(wire4)) ^ ((wire5 & wire7) ?
          $signed(wire4) : $unsigned(wire6)))));
      reg13 <= wire5;
    end
  assign wire14 = $signed(wire10[(2'h3):(2'h2)]);
  assign wire15 = wire4[(2'h2):(1'h0)];
  assign wire16 = ((8'hb3) & wire0);
  always
    @(posedge clk) begin
      reg17 <= wire5;
      reg18 <= $unsigned((wire1 - (8'h9f)));
      reg19 <= ((wire2[(3'h7):(1'h0)] | ((|(reg13 ?
              reg11 : wire1)) + wire3[(5'h14):(4'hb)])) ?
          $signed($unsigned(((wire9 - wire7) >> {wire5}))) : {(8'ha0),
              $unsigned({wire10})});
      reg20 <= (^((-(-wire3[(4'hd):(4'ha)])) ~^ $unsigned($signed($unsigned(wire15)))));
    end
  assign wire21 = $signed(($signed(wire7[(2'h2):(2'h2)]) ?
                      $signed((reg12 << {reg11})) : wire15[(3'h7):(3'h4)]));
endmodule
