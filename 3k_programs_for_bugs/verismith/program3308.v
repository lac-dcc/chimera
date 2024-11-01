module top
#(parameter param43 = (8'haf), 
parameter param44 = (+(8'hbe)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire35;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire5,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= (wire3[(2'h2):(1'h1)] ? wire5 : wire5[(1'h0):(1'h0)]);
      reg7 <= wire0;
      reg8 <= ({(8'hb5), (^wire0)} <= ((wire2 ?
              $signed({reg6}) : $signed(reg7[(1'h1):(1'h1)])) ?
          $signed($unsigned((wire4 ^ wire1))) : $signed(wire0)));
      reg9 <= (((^(~&wire4[(1'h0):(1'h0)])) ?
          (~|$signed((^~wire3))) : $signed(wire1[(2'h2):(1'h0)])) >> wire5);
      if (($unsigned($signed(reg9)) >> $unsigned({wire0})))
        begin
          reg10 <= $signed((~|wire1[(4'h8):(3'h7)]));
          reg11 <= (wire2[(2'h2):(1'h0)] ?
              ((!reg10[(4'h8):(3'h4)]) ?
                  (~|(wire3 ?
                      reg8 : reg6)) : (~&wire0)) : ($signed(($unsigned(reg6) ?
                  (wire1 ?
                      wire4 : wire4) : wire4[(2'h3):(2'h3)])) | $signed($signed((8'hbe)))));
          reg12 <= reg11;
          reg13 <= $signed($unsigned(((~|(|reg9)) ^ ((reg9 ? wire4 : wire5) ?
              (wire4 ? reg7 : reg6) : reg9[(3'h4):(1'h1)]))));
        end
      else
        begin
          reg10 <= $signed(wire0[(3'h7):(3'h6)]);
          reg11 <= {($unsigned({$signed(wire1), (^reg6)}) ?
                  reg8 : (((wire0 + reg12) ? (wire3 * wire1) : $signed(reg12)) ?
                      (8'ha9) : $unsigned($unsigned(reg11)))),
              reg11[(1'h0):(1'h0)]};
          reg12 <= reg8;
        end
    end
  always
    @(posedge clk) begin
      reg14 <= (($signed(($signed((8'ha2)) <<< (reg13 < reg7))) ?
              $signed($signed((reg13 || reg9))) : $signed(($signed(wire0) ?
                  {reg7} : (8'hac)))) ?
          ({wire4,
              (((8'hb5) ? wire3 : reg6) ?
                  (wire0 & wire2) : reg7)} << $signed(((wire3 ? reg9 : reg6) ?
              (reg12 | reg7) : {reg13}))) : (reg9 ?
              $signed((~|(reg9 & reg12))) : ($signed(wire0[(3'h7):(2'h2)]) >>> (^(wire0 ?
                  wire4 : reg13)))));
    end
  assign wire15 = $signed(reg9[(2'h2):(1'h0)]);
  assign wire16 = $signed((^($signed(wire1) ?
                      wire1[(3'h6):(2'h3)] : (|(!wire4)))));
  assign wire17 = ($signed(($unsigned((reg14 ?
                          reg14 : wire16)) < (reg9[(1'h1):(1'h0)] ?
                          $unsigned(reg14) : {wire5, (8'hb8)}))) ?
                      $signed((~&$unsigned(wire4[(3'h4):(3'h4)]))) : reg10);
  assign wire18 = {((8'ha1) ^~ reg14[(4'h8):(3'h5)]),
                      (+$signed(($signed(reg9) ?
                          (wire3 ^ reg14) : $signed(reg9))))};
  assign wire19 = $unsigned(((8'ha3) < ((^~$signed((8'ha3))) >>> (~(~|wire16)))));
  assign wire20 = wire19[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg21 <= $unsigned(wire15[(1'h1):(1'h0)]);
      reg22 <= reg6;
      if (reg6)
        begin
          reg23 <= ($unsigned((7'h43)) ?
              ((~&reg10) > $signed((^(wire0 ? reg7 : reg7)))) : wire20);
          if ($signed(((reg12 ?
                  $signed($unsigned((8'hbc))) : (~^reg23[(3'h6):(2'h3)])) ?
              ((wire20 ?
                  $signed(reg10) : wire0) ^ $signed(reg10)) : (~|$unsigned((7'h40))))))
            begin
              reg24 <= $unsigned($signed(wire5[(3'h6):(3'h4)]));
              reg25 <= wire18;
              reg26 <= reg10;
            end
          else
            begin
              reg24 <= (~^((~&(~|{wire3, reg21})) < wire15));
              reg25 <= ((reg21 * reg7) ?
                  $unsigned(wire0) : (wire3 <<< wire18[(3'h4):(2'h3)]));
            end
        end
      else
        begin
          reg23 <= ((-(wire16 ? {reg21, (reg21 & reg23)} : wire3)) ?
              wire18 : $unsigned((~|$unsigned($unsigned(wire17)))));
          reg24 <= {{(+$signed($signed(wire5)))}, wire18};
          if ((+(~|wire4)))
            begin
              reg25 <= ($signed($signed($unsigned($signed(reg23)))) >= ((~|reg21) >> ($unsigned((reg6 ?
                      wire5 : wire17)) ?
                  (8'hb4) : wire17)));
              reg26 <= $unsigned(wire18[(4'h9):(1'h0)]);
            end
          else
            begin
              reg25 <= reg25;
              reg26 <= (wire17 ? (^~$signed(wire17[(3'h7):(3'h5)])) : reg21);
              reg27 <= (+(^((^~reg21[(4'h8):(1'h1)]) ?
                  ((^reg9) ?
                      $unsigned((8'ha3)) : $signed(reg13)) : ($signed(reg12) && {wire2}))));
            end
          reg28 <= wire4;
        end
      reg29 <= {reg24};
      reg30 <= $signed((!(&wire3)));
    end
  assign wire31 = (~^reg7[(2'h2):(1'h0)]);
  assign wire32 = {{{(8'hb7)}, wire20}, $unsigned({$signed((wire2 == reg22))})};
  assign wire33 = wire18[(5'h11):(1'h0)];
  assign wire34 = {reg27, reg7};
  assign wire35 = ((-wire2) ?
                      $unsigned({{reg14, reg25},
                          $unsigned($unsigned((8'hac)))}) : wire18[(4'hc):(2'h3)]);
  always
    @(posedge clk) begin
      reg36 <= reg23;
      reg37 <= reg26[(4'he):(3'h5)];
      reg38 <= ($unsigned((7'h44)) ?
          reg11[(1'h1):(1'h0)] : reg30[(1'h1):(1'h0)]);
      reg39 <= ($unsigned($unsigned((^$signed(reg38)))) ?
          $unsigned((wire34 < wire20[(3'h5):(3'h4)])) : (((!$unsigned((7'h40))) != ((reg8 ?
              (8'hb7) : reg36) >= (wire17 ^~ reg6))) * $signed($unsigned((reg21 ~^ wire31)))));
    end
  assign wire40 = ($unsigned((($unsigned((8'ha5)) ?
                          reg37[(3'h7):(3'h6)] : $signed((8'hae))) ?
                      (reg14[(4'hb):(2'h2)] ?
                          $signed((8'hbc)) : $unsigned(reg7)) : wire19[(5'h10):(4'hb)])) ^~ $signed($unsigned(((reg27 ~^ wire2) && (reg24 * reg38)))));
  assign wire41 = (wire19[(3'h7):(3'h4)] & (reg23[(3'h5):(2'h3)] ?
                      ($unsigned((reg37 ?
                          wire17 : wire4)) != wire31) : (((!(8'ha0)) ?
                              (wire15 <= (7'h44)) : $unsigned(wire18)) ?
                          wire32[(4'h8):(1'h0)] : $unsigned($unsigned(reg23)))));
  assign wire42 = (^($signed($unsigned((7'h41))) ?
                      (wire1[(4'h8):(3'h5)] < wire35[(5'h10):(4'ha)]) : {(^~wire31[(4'h9):(3'h6)])}));
endmodule
