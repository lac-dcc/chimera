module top
#(parameter param49 = {({(((8'haa) ? (8'hb3) : (8'hbf)) <<< ((8'haa) ? (8'hab) : (8'hbd))), (~|((8'had) ? (8'hbd) : (8'h9f)))} ? (8'hab) : (((^~(8'hbc)) ? (!(8'ha1)) : ((8'hab) & (8'hb1))) ? (-((8'hbf) < (8'hb6))) : {((8'h9c) < (8'ha0))}))}, 
parameter param50 = (|(~(((!param49) - ((8'h9c) ? param49 : param49)) && ((!param49) ? param49 : param49)))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire22;
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  assign y = {wire48,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire4,
                 wire22,
                 reg47,
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
  assign wire4 = (wire0[(4'hc):(4'hb)] ? wire0 : wire2);
  module5 #() modinst23 (wire22, clk, wire0, wire1, wire4, wire3, wire2);
  assign wire24 = (((~&(|(~|wire3))) ~^ $unsigned((&wire1))) <= (wire2 >= wire3));
  assign wire25 = $signed($unsigned(wire4[(1'h0):(1'h0)]));
  assign wire26 = wire0;
  assign wire27 = ($unsigned($unsigned(($signed(wire1) && $signed(wire2)))) ?
                      $signed((!$signed($signed(wire25)))) : $unsigned(wire4[(4'h9):(4'h8)]));
  assign wire28 = ((wire24 | ((&(wire25 ? wire24 : wire27)) ?
                      ((wire1 ?
                          (8'ha1) : wire2) << $signed(wire25)) : $unsigned((&wire26)))) & {$signed($unsigned({wire2,
                          (8'hb6)}))});
  assign wire29 = (~^{wire22, wire0});
  assign wire30 = wire24;
  always
    @(posedge clk) begin
      reg31 <= $signed(wire3[(5'h11):(4'h8)]);
      if ((8'had))
        begin
          reg32 <= (wire4[(5'h12):(3'h6)] < (wire4 ?
              {(~|(wire3 ^~ wire30))} : $signed(($signed(wire29) ?
                  (+wire3) : wire4[(5'h12):(1'h0)]))));
          reg33 <= wire28[(2'h3):(1'h1)];
          reg34 <= wire30[(4'hb):(4'h9)];
          reg35 <= {(|$unsigned($signed((reg33 ? wire1 : reg34)))),
              (~^((~^$signed(wire28)) ?
                  $unsigned((wire25 ? wire29 : wire4)) : ((8'ha5) ?
                      wire22[(2'h3):(2'h3)] : wire29)))};
        end
      else
        begin
          reg32 <= reg31;
          if ((^~wire2))
            begin
              reg33 <= wire3;
              reg34 <= $unsigned($signed({{(|(8'ha7)), (reg31 + reg33)},
                  ((~&wire22) ? wire22 : (+wire3))}));
              reg35 <= (wire30 ?
                  wire4 : ($signed($signed(wire29)) ?
                      wire2 : $unsigned(wire27[(2'h3):(2'h3)])));
              reg36 <= (!wire30);
            end
          else
            begin
              reg33 <= (~|{wire2, wire26[(3'h7):(1'h1)]});
            end
        end
      if (($signed(({(-(8'had))} ?
          (~((8'ha2) ? wire30 : wire1)) : ($signed(wire25) ?
              {wire27, wire30} : (wire0 ?
                  wire0 : wire0)))) - ({$signed((wire30 <<< wire22))} ~^ reg35)))
        begin
          reg37 <= reg33[(3'h5):(2'h3)];
          if (wire24)
            begin
              reg38 <= reg35;
              reg39 <= (!(8'ha8));
              reg40 <= (~{(((wire28 ? reg38 : wire22) << reg34) ?
                      reg31[(4'hb):(3'h6)] : $unsigned(wire3[(1'h1):(1'h0)])),
                  $signed($signed(wire3))});
              reg41 <= wire28;
              reg42 <= (+$unsigned($signed(reg33[(4'ha):(3'h4)])));
            end
          else
            begin
              reg38 <= wire26;
            end
        end
      else
        begin
          if ($signed(reg40))
            begin
              reg37 <= (~|wire25);
              reg38 <= (~^((~&$unsigned($signed((8'ha0)))) >= reg34));
              reg39 <= reg42;
              reg40 <= wire2[(5'h11):(3'h5)];
              reg41 <= wire2[(5'h11):(5'h11)];
            end
          else
            begin
              reg37 <= (~^wire3);
              reg38 <= $signed(($signed(((^~reg32) != (reg32 >= reg39))) ?
                  (($unsigned(reg31) + {reg31}) >= $signed(reg35)) : wire29[(5'h10):(2'h2)]));
              reg39 <= (((^($signed(wire25) ?
                      reg40[(2'h2):(1'h0)] : (wire2 | wire2))) ?
                  $unsigned(wire22[(2'h3):(2'h3)]) : (((+wire4) ?
                          (&reg41) : {reg39, reg40}) ?
                      $signed((reg39 ? wire3 : wire3)) : wire26)) - (~|wire0));
              reg40 <= (((((wire0 & reg34) > $unsigned(reg35)) ~^ (((7'h40) >= (8'ha7)) ?
                          (reg41 ? reg31 : (8'ha0)) : wire27[(1'h1):(1'h0)])) ?
                      ($unsigned(((8'hb4) >> wire3)) ?
                          $signed(wire26[(2'h3):(2'h3)]) : ((reg40 | wire24) ?
                              (&reg42) : (wire25 * wire27))) : {(wire3 ?
                              wire28[(4'h8):(2'h2)] : $signed(wire27))}) ?
                  $unsigned(((8'ha7) ?
                      (wire22 || reg34[(2'h3):(1'h1)]) : ((reg39 ?
                              (8'ha3) : (8'hb5)) ?
                          $signed(reg35) : wire28))) : $signed((|$unsigned(wire0[(3'h7):(1'h1)]))));
            end
          reg42 <= wire28[(4'hc):(3'h7)];
          reg43 <= wire4;
          reg44 <= $unsigned(wire28);
          reg45 <= wire29;
        end
      reg46 <= (7'h42);
      reg47 <= ((reg44[(4'h9):(3'h7)] ?
          (!(+{wire29, reg31})) : reg42) <<< ((((reg32 ? (8'ha6) : wire3) ?
              (wire1 >>> wire24) : ((8'h9d) & (8'haf))) ?
          (|(reg44 ?
              reg31 : wire2)) : (!$unsigned(reg43))) == ((wire0 ~^ $signed(reg44)) ?
          $signed((reg41 ? reg41 : reg45)) : {wire22})));
    end
  assign wire48 = {reg36, (8'hbe)};
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= {{((8'hb0) ?
                  $unsigned((wire9 << (8'ha9))) : ((wire8 <<< (8'h9d)) ?
                      $signed(wire10) : wire6)),
              ((+wire9) ? wire7 : $unsigned($signed(wire6)))},
          (&wire10)};
      reg12 <= {reg11,
          ({wire9[(1'h0):(1'h0)], reg11[(1'h1):(1'h0)]} ?
              $signed(wire7) : reg11[(3'h6):(2'h3)])};
      if ($unsigned((wire6[(1'h1):(1'h1)] ? reg12 : (!(8'hb3)))))
        begin
          if (wire9)
            begin
              reg13 <= $unsigned((($signed(wire10) > reg12[(2'h2):(1'h1)]) || wire8[(2'h3):(2'h2)]));
            end
          else
            begin
              reg13 <= ($unsigned($signed(wire9[(2'h2):(2'h2)])) ~^ (~|{(8'h9f),
                  $unsigned((wire9 > reg12))}));
              reg14 <= (-($signed(wire10[(4'hd):(4'hd)]) >>> reg12));
              reg15 <= (reg14 ^~ $unsigned(((^$signed((8'hab))) ?
                  $unsigned((reg13 ? wire8 : wire6)) : ((~&reg13) ?
                      wire7[(1'h0):(1'h0)] : (wire10 ? wire9 : reg14)))));
              reg16 <= wire9[(2'h3):(1'h1)];
            end
        end
      else
        begin
          reg13 <= reg16;
          reg14 <= (^~(7'h42));
          if (reg13)
            begin
              reg15 <= (~(($signed($signed(reg12)) ?
                  ($signed(wire8) ?
                      (reg12 ?
                          reg14 : reg15) : wire9[(1'h0):(1'h0)]) : (reg15[(1'h1):(1'h0)] ?
                      reg15 : (-wire10))) || (((reg15 <<< (8'ha9)) - {wire6,
                      reg16}) ?
                  wire8 : reg11[(3'h6):(1'h1)])));
            end
          else
            begin
              reg15 <= $unsigned((^~wire8));
            end
        end
      reg17 <= wire9;
    end
  assign wire18 = reg15[(2'h3):(2'h2)];
  assign wire19 = (reg12 ?
                      ((reg11[(2'h2):(2'h2)] ?
                              ($signed(wire6) ?
                                  (reg11 ?
                                      wire18 : wire7) : $unsigned(wire18)) : ($signed(reg13) ?
                                  (wire7 + reg15) : $signed(wire6))) ?
                          ($signed(wire7[(2'h3):(2'h2)]) ?
                              (wire8[(3'h7):(2'h3)] >>> wire18[(3'h4):(2'h3)]) : reg16[(1'h1):(1'h1)]) : ((wire18 != {wire10}) ?
                              {wire8[(4'hf):(3'h6)]} : $unsigned($signed(reg12)))) : reg15[(4'h8):(3'h6)]);
  assign wire20 = {(!$unsigned($unsigned((~&wire19))))};
  assign wire21 = reg11[(1'h1):(1'h0)];
endmodule
