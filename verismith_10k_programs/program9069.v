module top
#(parameter param35 = ((+{(^~{(8'h9c)}), (|{(8'hb6), (8'hb5)})}) ? (+{({(8'h9e)} ? ((8'hac) ? (8'hbd) : (8'hbc)) : ((8'h9d) <<< (8'ha2))), (~^(-(8'ha1)))}) : ((8'hbe) ^~ ((((8'hab) ? (8'hbd) : (8'ha8)) >> (-(8'hbd))) || {{(8'hac)}}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire34, wire32, wire21, wire5, (1'h0)};
  assign wire5 = (wire4 != {(8'hbb)});
  module6 #() modinst22 (wire21, clk, wire5, wire0, wire1, wire2);
  module23 #() modinst33 (wire32, clk, wire3, wire21, wire1, wire5);
  assign wire34 = (wire2[(1'h1):(1'h1)] != ({wire5[(5'h10):(1'h1)]} ?
                      ($signed(((8'ha6) ^ wire5)) <= wire21) : (wire4[(1'h0):(1'h0)] & $unsigned(wire1))));
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  assign y = {wire31, wire30, wire29, wire28, (1'h0)};
  assign wire28 = wire24;
  assign wire29 = ((wire28[(3'h4):(2'h2)] != wire25) ^ $unsigned(wire25));
  assign wire30 = $unsigned(((($signed(wire26) < (|wire24)) || {$signed(wire28),
                          wire25[(4'hf):(4'hb)]}) ?
                      (8'hbe) : $unsigned(wire25[(4'hb):(3'h4)])));
  assign wire31 = $unsigned(wire29[(5'h10):(1'h1)]);
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire11;
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  assign y = {wire19,
                 wire11,
                 reg20,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = (8'ha7);
  always
    @(posedge clk) begin
      reg12 <= ((~wire10[(1'h1):(1'h1)]) || $signed(((^~$signed(wire10)) ?
          ($signed(wire10) ^~ wire8[(2'h3):(1'h0)]) : wire10)));
      if ($unsigned(reg12))
        begin
          reg13 <= $signed(wire9[(3'h4):(3'h4)]);
          reg14 <= {wire9,
              (-(($unsigned(wire9) | (^~(8'ha2))) * $unsigned(wire7)))};
        end
      else
        begin
          if (((wire7[(1'h1):(1'h1)] << $signed(wire9[(3'h5):(2'h3)])) < wire10[(1'h0):(1'h0)]))
            begin
              reg13 <= ($unsigned(($signed($signed((8'haf))) ?
                      $signed($unsigned(reg12)) : reg12[(3'h6):(2'h2)])) ?
                  ({(!(wire9 ? reg14 : wire11))} << wire9) : wire8);
            end
          else
            begin
              reg13 <= reg13[(3'h7):(1'h0)];
            end
          reg14 <= {$signed(reg12[(1'h1):(1'h0)]),
              (wire8 ?
                  ({$signed(reg14)} ?
                      (((8'hb4) >>> wire11) ?
                          wire10 : wire7) : $unsigned(((8'ha0) != reg14))) : $unsigned(($unsigned(wire11) & {(8'hb5)})))};
          reg15 <= ((reg13 <= wire8) ~^ {(-wire8),
              {$signed(wire9), (~&{wire9, wire10})}});
          reg16 <= $unsigned((^(wire8[(1'h1):(1'h0)] ? wire8 : wire7)));
          reg17 <= (~|$unsigned($signed($unsigned($unsigned(reg13)))));
        end
      reg18 <= $signed({(~reg14), reg14[(1'h1):(1'h1)]});
    end
  assign wire19 = reg14;
  always
    @(posedge clk) begin
      reg20 <= (~^$signed((^wire19)));
    end
endmodule
