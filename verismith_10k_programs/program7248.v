module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(3'h6):(1'h0)] wire58;
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire58,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ($unsigned(wire3[(2'h2):(1'h1)]) ?
                     wire0[(4'hb):(3'h6)] : $signed($unsigned($signed(wire2[(1'h0):(1'h0)]))));
  assign wire5 = ($signed($unsigned(((|wire0) ?
                         wire4[(2'h2):(1'h1)] : wire4))) ?
                     $signed(($signed((~^wire2)) ?
                         $signed(wire0[(4'hc):(3'h5)]) : ((~wire0) >>> $unsigned(wire2)))) : $unsigned(((~&wire2) == wire1)));
  always
    @(posedge clk) begin
      reg6 <= (8'hac);
      if (wire5[(3'h6):(1'h0)])
        begin
          if ($signed((|((~&$unsigned(wire3)) + (wire4[(1'h0):(1'h0)] | $signed(wire4))))))
            begin
              reg7 <= {wire0[(4'h9):(2'h3)]};
              reg8 <= $signed({wire1[(3'h6):(1'h0)], $unsigned(wire1)});
              reg9 <= $unsigned((~&($signed($signed(reg8)) ?
                  $unsigned($signed(wire4)) : (~|wire1))));
              reg10 <= ((reg9 ?
                      (wire5 ?
                          reg6 : $signed(wire0[(3'h7):(1'h0)])) : ($unsigned({wire1,
                          (8'hbd)}) <<< {$signed(wire4)})) ?
                  $signed(reg7[(3'h5):(2'h3)]) : reg7[(1'h1):(1'h1)]);
              reg11 <= $unsigned((-(((!reg9) ?
                  $signed(reg9) : (&wire0)) >> (!(wire1 || reg8)))));
            end
          else
            begin
              reg7 <= (wire2[(2'h2):(1'h0)] ?
                  (~^{({reg9, (7'h41)} ? (wire0 ^~ reg7) : $signed(wire1)),
                      reg10[(1'h0):(1'h0)]}) : (~($signed($unsigned(reg7)) == ($unsigned((8'hb1)) ?
                      (8'hbb) : wire2))));
              reg8 <= (($signed($unsigned($signed(wire0))) * {wire1[(4'hd):(3'h7)]}) >= reg10);
              reg9 <= reg6;
              reg10 <= {wire3[(2'h3):(2'h3)]};
              reg11 <= (reg7[(2'h2):(1'h0)] ?
                  reg9 : (($signed($unsigned(reg7)) ?
                          reg7[(3'h4):(3'h4)] : reg8) ?
                      reg11[(2'h2):(2'h2)] : $unsigned($unsigned(wire3))));
            end
          reg12 <= reg8[(4'he):(4'hd)];
          reg13 <= (({(-(8'had))} ?
              $unsigned($signed($signed((8'ha8)))) : (8'h9d)) << reg10);
        end
      else
        begin
          reg7 <= (!(~(&(!$signed(reg8)))));
          if (reg9[(1'h0):(1'h0)])
            begin
              reg8 <= (wire5[(1'h1):(1'h0)] == ($signed(((|reg9) ?
                      $signed(reg6) : $unsigned(wire0))) ?
                  reg8[(1'h0):(1'h0)] : ($unsigned(wire2[(1'h0):(1'h0)]) ?
                      (~|(~^(8'ha2))) : $signed($signed(wire5)))));
            end
          else
            begin
              reg8 <= ((~&(reg10 ?
                  (-$signed(reg9)) : (~^reg8[(5'h14):(5'h12)]))) + $unsigned($unsigned($unsigned(reg12[(3'h4):(1'h0)]))));
            end
        end
    end
  module14 #() modinst59 (.wire17(wire3), .wire18(wire1), .wire16(reg11), .wire15(reg13), .y(wire58), .clk(clk), .wire19(wire5));
endmodule

module module14
#(parameter param57 = (!((~&(~&(~&(8'haf)))) != (^~(~((8'h9d) >= (8'hb9)))))))
(y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire42;
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire45,
                 wire42,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg44,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire15[(4'hc):(3'h7)])))
        begin
          if ((&wire16))
            begin
              reg20 <= {$unsigned((8'ha4)),
                  ((+{(wire15 ? (8'hb9) : wire19)}) < wire18)};
              reg21 <= (((7'h40) ?
                  $signed(reg20) : (wire19 ?
                      {(^wire17),
                          {wire17,
                              wire16}} : $unsigned(wire17[(2'h3):(1'h1)]))) - $unsigned($unsigned(wire17)));
              reg22 <= (reg20[(3'h7):(2'h2)] < $signed(wire15));
            end
          else
            begin
              reg20 <= (~&$signed(wire18));
            end
          reg23 <= wire16;
          reg24 <= $unsigned(((+wire16) ^~ (7'h42)));
          reg25 <= wire16[(3'h5):(1'h0)];
          reg26 <= reg24[(2'h3):(2'h3)];
        end
      else
        begin
          reg20 <= reg21;
          reg21 <= $signed(wire15);
          reg22 <= wire19[(3'h4):(2'h2)];
        end
      reg27 <= wire18;
    end
  module28 #() modinst43 (.wire30(wire17), .clk(clk), .y(wire42), .wire29(wire15), .wire32(reg27), .wire31(wire16));
  always
    @(posedge clk) begin
      reg44 <= $signed(wire42[(3'h6):(2'h3)]);
    end
  assign wire45 = $signed(wire42[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg46 <= (wire45[(2'h2):(1'h1)] > wire19);
      reg47 <= $unsigned((wire16[(1'h0):(1'h0)] < ({{wire16}} != (reg20 ?
          {wire17} : $signed(reg20)))));
      reg48 <= wire42[(4'hc):(2'h3)];
      reg49 <= {(wire45 < ({$unsigned(reg27), wire16} ?
              reg44[(3'h5):(3'h4)] : (reg20[(4'h9):(4'h9)] ?
                  $unsigned(reg24) : $unsigned(reg20))))};
      reg50 <= $signed($signed(wire15));
    end
  assign wire51 = (&(~$signed(reg50[(4'ha):(4'h8)])));
  assign wire52 = $unsigned($unsigned((($signed(reg24) ~^ reg22) ?
                      ((reg24 ? wire45 : reg49) ?
                          reg22[(2'h2):(2'h2)] : $unsigned(wire18)) : $unsigned(wire51))));
  assign wire53 = (~|reg50);
  assign wire54 = reg46[(3'h4):(2'h3)];
  assign wire55 = {(((reg27 <= (-wire18)) << $unsigned(reg21)) && $unsigned((reg23[(4'hd):(3'h7)] ?
                          wire15[(2'h3):(2'h3)] : (^~wire54))))};
  assign wire56 = {{{(^((8'hb7) ? wire51 : reg24)),
                              {$unsigned(wire52), $unsigned((8'hbb))}}}};
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire [(5'h13):(1'h0)] wire30;
  input wire [(3'h4):(1'h0)] wire29;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  assign y = {wire41,
                 wire35,
                 wire34,
                 wire33,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire33 = $signed(wire29);
  assign wire34 = wire29;
  assign wire35 = {$unsigned((((~|wire29) ^ (wire32 == wire33)) ?
                          $unsigned((~|wire34)) : $unsigned((wire31 - wire30))))};
  always
    @(posedge clk) begin
      reg36 <= wire31;
      reg37 <= (^$unsigned($signed({{(8'hb0)}})));
      reg38 <= wire30;
      reg39 <= ($signed($signed(wire33)) ?
          wire33[(5'h12):(5'h12)] : (wire30 ?
              $signed($signed((wire30 ?
                  wire35 : wire34))) : wire29[(3'h4):(1'h0)]));
      reg40 <= reg36[(5'h12):(4'he)];
    end
  assign wire41 = $unsigned((~{wire30[(2'h3):(2'h2)]}));
endmodule
