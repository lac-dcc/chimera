module top
#(parameter param35 = (8'ha5), 
parameter param36 = ({(param35 != (((7'h42) ? param35 : param35) << (!param35))), (param35 + {param35, (param35 & (8'haf))})} == (7'h42)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  assign y = {wire33,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (~$unsigned((|(|(~wire4)))));
  assign wire6 = ($signed(wire0) + $signed((8'ha6)));
  assign wire7 = ($unsigned((8'hbc)) & $signed(wire3));
  assign wire8 = wire4;
  assign wire9 = $signed((wire8[(4'h9):(3'h6)] <= wire7));
  assign wire10 = $signed(wire3[(4'hb):(4'h8)]);
  assign wire11 = ({$unsigned(wire0[(4'he):(2'h3)])} >>> (-(((-(8'hbd)) ?
                      wire9 : ((8'hb6) ?
                          wire7 : wire0)) ^~ wire2[(2'h2):(2'h2)])));
  assign wire12 = wire3[(4'hc):(4'h9)];
  module13 #() modinst34 (wire33, clk, wire6, wire3, wire7, wire11);
endmodule

module module13
#(parameter param32 = (((8'h9c) | (({(8'hba)} ? ((8'hae) ? (8'hbb) : (8'hbb)) : (-(8'ha4))) ? {(|(8'h9f))} : (((8'hbc) ? (8'ha9) : (8'hb3)) ? (~(8'hab)) : ((8'ha4) ? (8'haa) : (8'hbb))))) != (~&{((+(8'hbe)) ^ (&(8'hb6)))})))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire19;
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire19,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= ((wire17[(1'h0):(1'h0)] * wire16) | $unsigned((($signed(wire17) > $signed(wire14)) ?
          (~&wire16) : wire15)));
    end
  assign wire19 = ($signed($unsigned(($signed(wire16) ?
                      {wire15,
                          (8'hb0)} : wire17[(1'h1):(1'h0)]))) <= (^$unsigned(wire16[(3'h5):(1'h0)])));
  always
    @(posedge clk) begin
      reg20 <= $unsigned((~^(8'hb1)));
      reg21 <= reg18;
      reg22 <= $signed((($signed($unsigned(wire15)) ?
              wire14[(2'h2):(2'h2)] : wire19[(1'h0):(1'h0)]) ?
          $signed({(&reg21), wire17[(3'h6):(3'h5)]}) : (($unsigned(reg18) ?
              (wire16 ?
                  (8'hbd) : reg20) : $unsigned(wire16)) ^ $unsigned(wire14[(3'h5):(2'h3)]))));
      reg23 <= wire14[(2'h2):(1'h0)];
      reg24 <= ($signed(reg22[(1'h1):(1'h1)]) ?
          wire16 : $signed(wire17[(4'h9):(1'h0)]));
    end
  assign wire25 = (-(($unsigned($unsigned(wire16)) ?
                      reg20[(2'h2):(1'h1)] : $unsigned($signed((7'h42)))) && ((|(wire15 == wire19)) | $signed(wire15))));
  assign wire26 = reg24[(3'h4):(2'h2)];
  assign wire27 = $signed(($unsigned({wire14[(3'h7):(1'h0)]}) | wire25));
  assign wire28 = (^wire14[(3'h4):(3'h4)]);
  assign wire29 = (reg24 ?
                      $signed(wire19[(2'h2):(1'h0)]) : {$signed(wire19),
                          $signed($signed(wire19[(2'h3):(2'h3)]))});
  assign wire30 = wire17;
  assign wire31 = ({($signed((reg23 && (8'hb5))) || $unsigned((~wire29))),
                      {(^wire15),
                          wire15[(1'h1):(1'h0)]}} * ($signed($unsigned(wire15)) ?
                      (reg20[(4'he):(4'he)] << {wire15,
                          wire27[(1'h0):(1'h0)]}) : reg18[(2'h3):(1'h1)]));
endmodule
