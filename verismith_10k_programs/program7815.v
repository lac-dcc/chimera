module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 wire6,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = $signed((8'hab));
  assign wire6 = wire0[(5'h10):(4'he)];
  always
    @(posedge clk) begin
      reg7 <= ({(~&({(8'h9f)} >>> $unsigned((8'haf)))), wire4} > (~|wire3));
      reg8 <= $unsigned((wire5[(4'h9):(3'h7)] >>> wire1[(3'h5):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg9 <= $unsigned({$signed(wire0)});
      reg10 <= (^~((~^($unsigned(wire6) ?
          (~^wire5) : $signed(wire5))) < ((^$unsigned(reg8)) | $unsigned((wire1 + (8'hab))))));
      reg11 <= $signed({({$signed(reg10),
              {wire3}} << $unsigned(wire3[(1'h1):(1'h1)])),
          reg10[(1'h0):(1'h0)]});
      reg12 <= wire5[(4'hb):(4'hb)];
    end
  module13 #() modinst23 (.y(wire22), .wire17(reg9), .wire15(wire3), .clk(clk), .wire14(reg11), .wire16(wire4));
  assign wire24 = wire4;
  assign wire25 = ((-wire22) <<< ($unsigned($unsigned(reg11)) >> (8'h9e)));
  assign wire26 = wire6[(4'hf):(2'h2)];
  assign wire27 = ((^~($unsigned((-reg7)) ?
                          wire24[(3'h6):(2'h3)] : ((-reg12) & $signed(wire4)))) ?
                      $unsigned((~^(~&reg10[(3'h6):(2'h2)]))) : reg9);
  assign wire28 = {$unsigned((reg11[(2'h2):(1'h0)] ?
                          ($signed(reg9) & $unsigned(wire22)) : ((reg12 ?
                                  wire2 : wire2) ?
                              (wire24 >> reg7) : (~|wire6))))};
  assign wire29 = $unsigned($unsigned($unsigned($unsigned((&wire27)))));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h26):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire18;
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  assign y = {wire21, wire20, wire18, reg19, (1'h0)};
  assign wire18 = $unsigned(wire15);
  always
    @(posedge clk) begin
      reg19 <= (((wire17[(1'h0):(1'h0)] <= ((~&wire15) <<< wire17)) ?
          $signed($unsigned($unsigned(wire18))) : $unsigned((!$signed(wire18)))) || {(!wire15[(4'h8):(3'h6)]),
          ((~|(|wire16)) ? wire17 : ((wire14 ? wire14 : wire14) > {(8'hb7)}))});
    end
  assign wire20 = $unsigned(wire14[(3'h4):(3'h4)]);
  assign wire21 = ((($signed({(8'haa),
                          (8'ha6)}) == $signed(wire18)) - (8'h9e)) ?
                      (+wire16) : wire18[(4'h9):(1'h0)]);
endmodule
