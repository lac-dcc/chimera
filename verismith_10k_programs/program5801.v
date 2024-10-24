module top
#(parameter param38 = (({{((8'ha3) ~^ (8'hb6))}, {((8'h9c) ? (7'h41) : (7'h41))}} ? (((-(8'hae)) != (8'ha0)) * (~^((8'ha1) ~^ (8'haf)))) : (~^{((8'ha8) ? (7'h42) : (8'ha1))})) << ((8'hab) ? ((((8'ha0) ? (8'hbe) : (8'h9d)) ^ ((8'hac) << (8'ha3))) ? ((~^(7'h41)) & {(8'hb3)}) : {((8'hae) ? (8'ha2) : (8'hbf)), ((8'hbc) ? (8'ha7) : (8'hbf))}) : {(!(~&(7'h44)))})), 
parameter param39 = param38)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire31;
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire33, wire31, reg37, reg36, reg35, reg34, (1'h0)};
  module4 #() modinst32 (.clk(clk), .wire8(wire1), .y(wire31), .wire9((8'ha6)), .wire5(wire0), .wire6(wire3), .wire7(wire2));
  assign wire33 = wire1[(5'h12):(4'hb)];
  always
    @(posedge clk) begin
      reg34 <= (!$unsigned((((8'h9c) ?
          $signed((8'h9f)) : wire0[(4'ha):(3'h7)]) >> ((wire1 ?
              (8'haf) : wire31) ?
          {wire33, wire0} : wire3))));
    end
  always
    @(posedge clk) begin
      reg35 <= (~^(8'ha9));
      reg36 <= $signed($signed(wire2[(4'hf):(4'he)]));
      reg37 <= ((~&$unsigned((~&$signed((7'h41))))) <= ((&((reg36 ^~ reg35) != wire1[(2'h2):(1'h1)])) ?
          $signed(($signed((8'had)) + $signed(reg35))) : ($unsigned(reg34[(2'h3):(2'h2)]) << reg35[(2'h3):(1'h0)])));
    end
endmodule

module module4  (y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire5;
  input wire signed [(5'h14):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(3'h6):(1'h0)] wire27;
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire10,
                 wire11,
                 wire27,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  assign wire10 = $unsigned(wire6[(1'h0):(1'h0)]);
  assign wire11 = {wire10,
                      $signed((wire7 ?
                          (((7'h42) << wire5) ^~ $unsigned(wire7)) : $unsigned((wire10 || wire8))))};
  always
    @(posedge clk) begin
      reg12 <= wire6[(2'h2):(1'h1)];
      reg13 <= (((((8'ha8) ? (~|wire11) : (8'ha8)) | ((wire10 & wire10) ?
          {wire11} : (wire6 | wire5))) - $unsigned((wire5 <= wire6))) > $signed($unsigned($unsigned((~&wire8)))));
      reg14 <= (wire10 <= ((8'ha7) || wire5[(4'hb):(3'h4)]));
      reg15 <= $signed((+$unsigned(((wire7 ? wire8 : wire11) ?
          $signed(wire6) : (wire6 ? (8'h9f) : reg12)))));
    end
  module16 #() modinst28 (wire27, clk, wire7, wire10, wire6, reg13);
  assign wire29 = wire7;
  assign wire30 = ((~(!wire6)) >> reg14[(4'hf):(2'h3)]);
endmodule

module module16
#(parameter param26 = ((|{(^((8'hae) ~^ (8'h9c)))}) ? (~((((8'hb0) ~^ (8'hb4)) | ((8'hba) != (8'h9d))) ? (&((8'ha9) - (8'ha6))) : (((8'had) <<< (7'h43)) ^~ ((7'h43) - (8'ha0))))) : {({(-(8'ha6))} ~^ (((7'h41) ? (8'hba) : (8'had)) << ((8'hbd) ? (8'hbf) : (8'hae))))}))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  input wire [(4'hc):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire25;
  wire [(3'h7):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  assign y = {wire25, wire24, wire23, wire22, wire21, (1'h0)};
  assign wire21 = $unsigned((~^wire18[(3'h5):(2'h2)]));
  assign wire22 = $unsigned(wire17[(2'h3):(1'h0)]);
  assign wire23 = $signed(((wire18[(1'h1):(1'h1)] <<< wire17[(4'h8):(1'h0)]) ?
                      {wire18,
                          (wire19[(1'h0):(1'h0)] ?
                              wire18 : (!(8'hb0)))} : {(!$signed(wire22))}));
  assign wire24 = ((wire23 && $signed((|(wire18 ?
                      (8'ha7) : (8'ha6))))) != wire19[(1'h0):(1'h0)]);
  assign wire25 = (wire17 ^ (+wire17));
endmodule
