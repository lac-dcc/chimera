module top
#(parameter param57 = (8'hac))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire51;
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire5,
                 wire8,
                 wire20,
                 wire21,
                 wire22,
                 wire51,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = {$signed(wire2), wire3};
  always
    @(posedge clk) begin
      reg6 <= $unsigned($unsigned($unsigned($signed({wire1, wire0}))));
      reg7 <= (7'h42);
    end
  assign wire8 = (!((wire1[(4'hd):(2'h2)] ?
                         wire5 : ({reg7, reg6} << (^wire5))) ?
                     (^$signed($unsigned(wire5))) : $signed($unsigned((+(7'h41))))));
  always
    @(posedge clk) begin
      reg9 <= (^~(wire3 << ((reg6[(3'h5):(1'h1)] != $signed((7'h41))) <= $signed(wire4[(4'hc):(3'h6)]))));
      reg10 <= $unsigned({$unsigned(((reg9 << reg7) ?
              (reg7 >> wire3) : (!reg6)))});
      if (wire4)
        begin
          reg11 <= wire5;
          reg12 <= (wire5 & reg7);
          reg13 <= ($unsigned({$unsigned((wire2 + (7'h40)))}) || reg11);
          reg14 <= $unsigned((~^{(!(reg9 ? reg6 : reg13))}));
          reg15 <= reg10[(2'h2):(1'h1)];
        end
      else
        begin
          if ({(reg12 ^~ ((&(reg14 || reg12)) > ((reg10 ? reg12 : reg10) ?
                  $signed((8'ha0)) : (wire5 ? reg12 : (8'ha8))))),
              $unsigned(wire5[(4'h9):(1'h1)])})
            begin
              reg11 <= (($signed((~|wire1)) ? reg12 : wire4) ?
                  $signed(((~|{reg9, wire8}) ?
                      wire2[(3'h6):(2'h2)] : (reg15 ?
                          $signed(wire1) : (reg13 ?
                              reg15 : reg7)))) : (((^~(^~reg10)) + ((reg9 ?
                              wire8 : reg11) ?
                          $unsigned(reg13) : {reg9, reg15})) ?
                      $unsigned(($unsigned(wire4) ?
                          (reg7 | wire1) : $signed((8'hbb)))) : (&$unsigned(reg11[(4'hd):(4'h9)]))));
            end
          else
            begin
              reg11 <= $signed($unsigned((reg9 != (|((8'had) ?
                  reg10 : reg9)))));
              reg12 <= $unsigned(reg9);
              reg13 <= ((^~({wire3[(1'h1):(1'h1)]} ?
                  reg7[(1'h1):(1'h0)] : {$unsigned(wire0)})) * (wire4 ?
                  wire1 : reg6[(2'h3):(1'h1)]));
            end
          reg14 <= reg9;
          reg15 <= (-$unsigned(((^$unsigned(reg11)) || $unsigned($unsigned(reg11)))));
          if ($signed(((~$signed((!wire0))) <= $unsigned(($signed((8'hb7)) ?
              (wire3 && (8'ha6)) : (reg12 ? wire5 : wire2))))))
            begin
              reg16 <= reg12[(4'ha):(3'h5)];
              reg17 <= ((8'haf) - wire8);
              reg18 <= {wire5[(3'h6):(1'h1)]};
            end
          else
            begin
              reg16 <= reg10[(3'h4):(3'h4)];
              reg17 <= (-$signed($signed((reg9 & (~^reg16)))));
              reg18 <= reg7;
              reg19 <= (~|reg15);
            end
        end
    end
  assign wire20 = wire3;
  assign wire21 = $signed((reg15 ~^ ($signed((^reg18)) ?
                      ($signed(wire3) ?
                          $signed(reg11) : {reg10,
                              wire4}) : $signed($unsigned(wire2)))));
  assign wire22 = $signed(reg11[(2'h3):(2'h2)]);
  module23 #() modinst52 (.clk(clk), .wire25(wire20), .wire24(reg7), .wire26(reg11), .y(wire51), .wire28(wire21), .wire27(wire4));
  assign wire53 = $unsigned($unsigned(($unsigned($unsigned(reg11)) >= ((reg15 ?
                          reg14 : wire21) ?
                      $signed(reg17) : (reg18 >= wire0)))));
  assign wire54 = reg14[(1'h0):(1'h0)];
  assign wire55 = $signed((reg7 ?
                      wire2 : (($signed(reg9) >= $signed(wire0)) << (+reg11))));
  assign wire56 = ($signed({{$unsigned(wire0)}}) ?
                      reg17[(5'h10):(4'he)] : (&wire54[(4'hb):(1'h0)]));
endmodule

module module23
#(parameter param49 = (&(^((((8'hae) ? (8'hae) : (8'h9f)) ~^ (+(8'hbb))) ? (~|((7'h41) ? (8'ha4) : (8'hb1))) : (-(+(8'hb1)))))), 
parameter param50 = ({param49} ? (8'ha9) : (~(8'ha6))))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire48;
  wire signed [(5'h12):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire30,
                 wire29,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire29 = wire26[(2'h2):(1'h0)];
  assign wire30 = ($unsigned($unsigned({$unsigned((8'hb0)),
                      (wire28 ? wire26 : wire27)})) > wire24);
  always
    @(posedge clk) begin
      reg31 <= wire26;
      if ($unsigned(($unsigned($signed(wire29[(3'h4):(1'h0)])) ?
          wire30[(4'h8):(2'h3)] : $unsigned($unsigned($unsigned(wire27))))))
        begin
          reg32 <= $unsigned($unsigned(wire30[(3'h7):(3'h6)]));
          reg33 <= $signed({wire28[(2'h3):(1'h1)]});
          reg34 <= $signed(reg31);
        end
      else
        begin
          reg32 <= ((~&$signed({wire28,
              (~reg32)})) & $signed($signed((-$signed(wire28)))));
          reg33 <= (wire26 + {(~&$signed((wire24 ? reg34 : wire26)))});
          reg34 <= (~&(reg33[(2'h2):(2'h2)] ~^ $unsigned(((8'hb3) - reg31[(4'ha):(2'h2)]))));
          if (wire29)
            begin
              reg35 <= reg34;
            end
          else
            begin
              reg35 <= ((|wire29) >>> wire29);
              reg36 <= $unsigned(reg33);
            end
        end
      reg37 <= {$unsigned($signed($unsigned((reg31 | reg32)))),
          {reg31[(4'ha):(2'h2)]}};
      reg38 <= {(((reg37[(3'h7):(3'h4)] ^ ((8'h9f) ?
              wire27 : wire27)) || ((!(8'hb0)) ?
              $unsigned(reg32) : {reg33})) - $signed(($signed(reg33) > $unsigned(reg34))))};
      if ((reg36[(4'h9):(1'h0)] && wire24[(3'h5):(1'h1)]))
        begin
          reg39 <= ({$unsigned($signed((wire25 ^~ wire24))), reg31} ^ reg36);
        end
      else
        begin
          reg39 <= reg37[(3'h5):(1'h1)];
          reg40 <= wire25;
          reg41 <= (8'hab);
          if ($signed({$unsigned((reg36 ? reg34 : wire27)),
              ((wire26[(2'h2):(1'h1)] ?
                      $signed(wire25) : (reg31 ? wire27 : wire28)) ?
                  (~(reg40 * wire24)) : ((|(8'hb5)) | wire27[(1'h1):(1'h0)]))}))
            begin
              reg42 <= ((|wire26[(2'h2):(2'h2)]) ?
                  ((|wire24[(2'h3):(2'h2)]) ^~ wire26) : ($unsigned(reg40) ?
                      (({reg36, wire25} ? $signed(wire27) : (reg31 < reg32)) ?
                          {{(8'hbc), reg36}} : (reg35 ?
                              $unsigned(wire25) : {(8'haa),
                                  reg32})) : $signed({(^~reg38),
                          (reg33 ? reg31 : (7'h41))})));
              reg43 <= reg35[(5'h13):(1'h0)];
              reg44 <= $unsigned(reg37);
              reg45 <= (^(($signed($unsigned(wire27)) >> $signed(reg38[(4'h8):(1'h0)])) ?
                  ($signed((reg37 ^ (8'hba))) ?
                      ((8'haf) ?
                          ((8'haf) ?
                              reg32 : wire24) : reg44[(1'h1):(1'h1)]) : ({(8'hbb),
                              reg44} ?
                          reg35 : (-wire29))) : (^$unsigned((wire26 ^~ wire28)))));
            end
          else
            begin
              reg42 <= reg39;
              reg43 <= {($signed((^$unsigned(reg36))) == (8'hb8))};
              reg44 <= reg38;
              reg45 <= $unsigned($signed($signed({(reg33 ? reg31 : wire27)})));
            end
          reg46 <= ($signed((-(8'hb6))) || (-wire27));
        end
    end
  assign wire47 = {($signed((&$signed(reg33))) ?
                          (^$signed((~&reg43))) : {(~^reg42[(2'h2):(2'h2)])})};
  assign wire48 = (($unsigned(((&reg36) ? reg46[(1'h0):(1'h0)] : reg39)) ?
                      wire30 : $signed(((^~reg39) ?
                          $unsigned(wire30) : reg33[(1'h0):(1'h0)]))) > (+$signed($unsigned(wire26[(1'h0):(1'h0)]))));
endmodule
