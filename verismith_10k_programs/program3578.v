module top
#(parameter param42 = ((^~(((-(8'hb9)) ^ (8'hb4)) >> (((8'hbb) ? (8'ha6) : (8'haa)) < ((8'ha5) ? (8'ha3) : (8'ha0))))) ~^ ((~^(~|((8'h9f) ~^ (8'ha9)))) ? ({(~^(8'ha0))} ? {{(8'hb4)}} : {((8'hb4) * (8'hab))}) : (((7'h42) ? (~^(8'hb8)) : ((8'ha4) & (8'hb8))) ? (((8'hbd) | (7'h42)) ? ((8'ha3) + (8'hac)) : ((8'hb0) && (8'hb1))) : {(+(8'hb6)), ((8'hac) + (8'ha8))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire6;
  wire [(3'h7):(1'h0)] wire5;
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire41,
                 wire39,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 reg7,
                 (1'h0)};
  assign wire5 = wire3[(3'h7):(3'h5)];
  assign wire6 = $unsigned($unsigned($unsigned(($signed(wire4) ?
                     ((8'hb4) == wire3) : $signed(wire0)))));
  always
    @(posedge clk) begin
      reg7 <= $unsigned((((~|((8'ha4) << wire3)) | ((~^wire1) ?
          (!wire6) : $unsigned(wire1))) * $signed($signed(wire4[(1'h0):(1'h0)]))));
    end
  assign wire8 = wire4[(2'h3):(2'h2)];
  assign wire9 = {($signed((wire0 ^ wire0)) || (-(~&wire4))),
                     (^$signed($signed(wire4)))};
  assign wire10 = $unsigned(wire6);
  assign wire11 = wire10;
  assign wire12 = wire0[(2'h3):(2'h3)];
  assign wire13 = {(-(wire11 || $unsigned($unsigned(wire11))))};
  module14 #() modinst40 (wire39, clk, wire10, wire2, reg7, wire4, wire13);
  assign wire41 = $unsigned((~&(&$unsigned($signed(wire39)))));
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg20 <= $signed(wire16[(4'h8):(3'h5)]);
      reg21 <= wire18;
      reg22 <= (8'ha6);
      if ((-wire15))
        begin
          reg23 <= ((+(|$signed(wire19[(4'he):(2'h3)]))) ?
              (wire17 ?
                  wire16 : $signed(($unsigned(reg22) ?
                      reg20 : {wire17, wire15}))) : wire16);
        end
      else
        begin
          reg23 <= reg22[(4'h9):(1'h1)];
          reg24 <= wire19[(2'h3):(1'h1)];
          reg25 <= (~({{$signed(reg23)}} <<< $unsigned((-{reg20}))));
          reg26 <= ((+$signed({$unsigned(wire16)})) ?
              (wire17 ?
                  ($unsigned($unsigned(reg25)) ?
                      $signed({wire16}) : {(reg20 ?
                              reg23 : wire17)}) : reg21) : (wire15[(1'h0):(1'h0)] ?
                  wire16 : (~|(^~(reg22 ? reg24 : reg20)))));
          if ((8'hb8))
            begin
              reg27 <= (~wire16[(1'h0):(1'h0)]);
              reg28 <= {$unsigned($signed((wire16 && (~|reg20)))),
                  $unsigned((~&({reg27, reg20} ?
                      reg26[(1'h0):(1'h0)] : reg24)))};
              reg29 <= reg27;
              reg30 <= reg20;
              reg31 <= (reg30 > (8'ha4));
            end
          else
            begin
              reg27 <= ((reg21[(2'h3):(2'h3)] ?
                  reg26 : (wire15[(3'h7):(3'h7)] ?
                      $signed((reg29 + (8'hb3))) : reg23[(2'h2):(1'h0)])) == (reg27[(1'h1):(1'h0)] ?
                  {($signed(reg31) ? wire16 : reg22[(1'h0):(1'h0)]),
                      (^~reg28)} : $signed($unsigned(reg28))));
              reg28 <= $unsigned(reg24);
              reg29 <= ((((+(reg28 ?
                          reg30 : reg30)) <<< $unsigned($unsigned(reg23))) ?
                      ($signed($signed(reg28)) * $unsigned($signed(reg21))) : $unsigned($signed((8'ha0)))) ?
                  $signed(reg20[(4'he):(3'h4)]) : ((^~(~^$unsigned(wire17))) ^ {$signed(reg28)}));
              reg30 <= ($signed((~((&wire17) ^~ (reg28 ?
                  reg20 : wire16)))) != (($unsigned($unsigned(wire19)) >> ($unsigned((8'hae)) == reg21)) && (8'ha2)));
            end
        end
    end
  assign wire32 = $unsigned((~^wire19));
  assign wire33 = $unsigned(($unsigned($signed($unsigned(wire17))) ?
                      ((+{wire19,
                          reg28}) - (8'ha2)) : $signed((^~$signed(reg24)))));
  assign wire34 = $signed(($signed((-$signed(wire19))) * wire17[(2'h3):(1'h1)]));
  assign wire35 = ($signed((wire15 ?
                      wire18 : $unsigned((|wire18)))) >> $signed((8'h9c)));
  assign wire36 = ($signed($signed((+{(8'hbc), wire34}))) ?
                      ((reg25[(2'h3):(2'h3)] - (8'hbe)) ?
                          (({wire32} && reg25[(4'h8):(2'h2)]) ^~ wire19[(1'h1):(1'h0)]) : ((~wire35) >= reg20[(3'h5):(3'h5)])) : (&reg31[(1'h1):(1'h0)]));
  assign wire37 = $unsigned($signed((((wire18 ? (8'ha3) : wire35) ?
                      reg25 : $signed(wire18)) == (~&{wire34}))));
  assign wire38 = (reg21 * $unsigned(($signed(reg24[(4'he):(4'he)]) ?
                      reg26[(3'h5):(3'h4)] : reg28[(3'h6):(2'h3)])));
endmodule
