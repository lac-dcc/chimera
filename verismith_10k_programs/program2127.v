module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire [(5'h12):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire31;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire4,
                 wire5,
                 wire6,
                 wire31,
                 (1'h0)};
  assign wire4 = $signed($signed((^~$signed((wire2 << wire3)))));
  assign wire5 = ((8'hb5) || wire3[(4'hc):(1'h1)]);
  assign wire6 = wire1[(3'h6):(3'h4)];
  module7 #() modinst32 (wire31, clk, wire2, wire3, wire0, wire6, wire5);
  assign wire33 = $signed(wire31[(3'h4):(2'h3)]);
  assign wire34 = (((8'hbd) ?
                      wire4[(2'h3):(2'h3)] : (^~((wire6 ? wire31 : wire2) ?
                          (8'h9d) : wire4))) << $signed(((+$signed((7'h40))) ^~ $unsigned($signed(wire31)))));
  assign wire35 = $unsigned(wire1[(3'h4):(2'h2)]);
  assign wire36 = $unsigned((|wire5[(4'h8):(2'h2)]));
  assign wire37 = ((-$unsigned($signed({wire34, wire5}))) > $unsigned(wire34));
  assign wire38 = $signed(wire31[(3'h4):(3'h4)]);
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  wire [(3'h6):(1'h0)] wire15;
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  assign y = {wire30,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire15,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg18,
                 reg17,
                 reg16,
                 reg14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= ($unsigned(wire12[(2'h2):(2'h2)]) ?
          {(8'ha3)} : ((|(wire8[(3'h5):(3'h4)] ?
                  $unsigned(wire11) : (wire9 >> wire11))) ?
              wire8 : $signed(wire11[(4'ha):(3'h6)])));
      reg14 <= wire12[(3'h4):(3'h4)];
    end
  assign wire15 = ((!$unsigned((^$unsigned(wire9)))) ~^ $unsigned(({$signed(reg13),
                      (-wire10)} > $unsigned((wire10 >>> wire8)))));
  always
    @(posedge clk) begin
      reg16 <= reg14;
      if ($unsigned((8'hb2)))
        begin
          reg17 <= ((~|wire9) - wire12);
        end
      else
        begin
          reg17 <= reg13[(3'h6):(3'h6)];
        end
      reg18 <= (8'ha7);
    end
  assign wire19 = ($signed($signed(($signed(wire12) ?
                      (!wire12) : $signed(wire8)))) - (8'hbb));
  assign wire20 = (wire10 ?
                      wire8[(4'hc):(4'h9)] : $signed(((~|(wire12 <= wire9)) + wire19)));
  assign wire21 = (reg18 ? (|reg18[(1'h0):(1'h0)]) : (8'hb3));
  assign wire22 = wire8[(4'h8):(3'h7)];
  assign wire23 = ((((+{reg16, wire20}) ?
                              (~&$signed((8'ha6))) : ((wire22 >> wire15) ?
                                  (!wire12) : (wire12 ? wire21 : wire22))) ?
                          (wire11 ?
                              $unsigned((reg13 ? wire8 : wire20)) : (wire15 ?
                                  (8'h9f) : (wire20 > wire15))) : reg13) ?
                      $signed($signed(((8'hb0) && (reg14 ?
                          (8'hbe) : wire11)))) : (+reg17[(4'h8):(3'h4)]));
  assign wire24 = $unsigned(wire10[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg25 <= wire10[(1'h0):(1'h0)];
      reg26 <= $unsigned((!reg25[(3'h4):(2'h3)]));
      reg27 <= reg18[(2'h2):(1'h0)];
      reg28 <= (((-((wire15 ? wire8 : reg18) ? (8'hb0) : reg16)) ?
              {((reg16 ? wire15 : (8'h9c)) | (+(8'hb8))),
                  (!$signed((8'hb3)))} : wire11[(4'hc):(1'h1)]) ?
          (~wire20) : (reg14[(4'hb):(4'ha)] ?
              (^$unsigned($signed(wire19))) : reg17));
      reg29 <= reg28;
    end
  assign wire30 = reg16;
endmodule
