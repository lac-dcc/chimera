module top
#(parameter param50 = ((((~&((8'ha5) ? (7'h44) : (8'hbe))) ? {((8'ha5) ? (7'h44) : (8'hb3))} : (((8'ha9) < (8'ha7)) ? (^(8'ha6)) : (&(7'h40)))) ? (({(8'hbd), (8'hb7)} == (-(8'hb8))) != (^((8'hb3) ~^ (8'hb7)))) : ({((8'ha7) >>> (8'h9c)), ((8'hae) ^ (8'haa))} - (&(^(8'hbf))))) ? (((((8'hb7) ^ (8'hba)) ? ((7'h40) - (8'ha0)) : (^(8'hba))) ? (~((8'ha2) ? (8'h9e) : (8'ha4))) : (-((8'h9f) ? (8'hb1) : (7'h44)))) - ((&((8'hb0) ? (8'ha0) : (8'h9e))) ? {((8'ha6) ? (8'ha0) : (8'ha1))} : (((8'had) ? (8'h9c) : (8'hab)) >= (8'hbe)))) : (~&(~(-(!(8'hbc)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire44;
  assign y = {wire49, wire48, wire47, wire46, wire44, (1'h0)};
  module5 #() modinst45 (wire44, clk, wire1, wire3, wire0, wire4);
  assign wire46 = (~$signed(wire44));
  assign wire47 = $signed(wire44);
  assign wire48 = wire2[(1'h1):(1'h0)];
  assign wire49 = {$signed($unsigned((^$unsigned(wire0)))),
                      ($unsigned(wire1) >= (((-wire46) ?
                          $signed(wire46) : $signed(wire4)) > (-(wire46 ?
                          wire2 : wire1))))};
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire6;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire42;
  reg [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire18,
                 wire19,
                 wire20,
                 wire42,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire10 = ((($signed($unsigned(wire9)) ?
                          (wire8[(5'h10):(1'h1)] ?
                              wire7[(1'h1):(1'h0)] : (|wire6)) : $unsigned((&wire7))) ?
                      wire7 : wire7) * ((~|wire8) << wire6[(4'h8):(3'h7)]));
  always
    @(posedge clk) begin
      if (wire7)
        begin
          reg11 <= wire10[(4'h8):(4'h8)];
          reg12 <= (reg11[(1'h0):(1'h0)] && wire6);
          if (wire9[(1'h0):(1'h0)])
            begin
              reg13 <= $unsigned(wire8);
            end
          else
            begin
              reg13 <= $signed((reg11 == $signed((|(wire8 ? wire6 : wire8)))));
              reg14 <= {wire9,
                  ((($signed(wire9) ?
                              ((8'h9c) ? wire6 : wire9) : $unsigned(wire6)) ?
                          (reg12 >>> $signed(reg12)) : {wire8[(2'h2):(1'h1)],
                              $signed(wire10)}) ?
                      wire6[(4'hb):(2'h2)] : wire9[(3'h5):(1'h1)])};
              reg15 <= ({reg14} >= (~^(|$signed(wire9))));
            end
        end
      else
        begin
          if ((8'hab))
            begin
              reg11 <= wire8[(4'h8):(2'h2)];
              reg12 <= (reg15 > $signed((reg12 ?
                  {wire8, reg12[(1'h0):(1'h0)]} : ({reg13, wire8} ?
                      (reg13 ? reg11 : reg11) : {reg11, reg12}))));
              reg13 <= $signed((~wire6));
              reg14 <= (&reg12);
              reg15 <= ((~&{reg14, $signed($signed((8'hac)))}) ?
                  ((((-reg13) > {reg11, wire7}) <= (((8'had) ?
                              wire7 : (8'ha3)) ?
                          $unsigned((8'hb6)) : reg12)) ?
                      (wire7 ^ (~|reg11)) : ({$signed(reg11),
                              (wire10 | wire7)} ?
                          $signed((reg14 & (8'h9d))) : ($signed(reg13) + (~^reg13)))) : wire8);
            end
          else
            begin
              reg11 <= (+(reg14[(1'h0):(1'h0)] ?
                  reg15 : (wire9[(3'h5):(3'h4)] ?
                      (+$unsigned(wire7)) : (8'hbc))));
            end
        end
      reg16 <= $unsigned((^$unsigned($signed((8'had)))));
      reg17 <= (+$signed(({(-wire6)} ?
          ($unsigned((8'hb0)) ?
              $unsigned(reg11) : reg14[(2'h3):(1'h0)]) : ((wire10 > reg12) ?
              (~reg15) : $unsigned(reg12)))));
    end
  assign wire18 = $unsigned({(((wire8 ^ (8'hb7)) - $unsigned(reg13)) > reg17[(3'h6):(1'h1)]),
                      reg11[(1'h1):(1'h0)]});
  assign wire19 = (8'hbe);
  assign wire20 = ($unsigned($unsigned($unsigned((8'ha1)))) ?
                      (!$signed(wire10[(4'hc):(3'h6)])) : ($unsigned(($unsigned(reg12) >>> (wire8 << wire8))) & reg17));
  module21 #() modinst43 (.y(wire42), .wire22(reg11), .wire25(reg15), .wire23(reg16), .clk(clk), .wire26(reg12), .wire24(wire20));
endmodule

module module21
#(parameter param41 = (&(+({(7'h44)} ? ({(8'h9f)} ? ((8'ha2) ? (8'ha2) : (8'ha4)) : ((8'hbf) <= (8'hb0))) : ((8'ha7) != (~(8'haa)))))))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h82):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire signed [(5'h11):(1'h0)] wire24;
  input wire signed [(4'ha):(1'h0)] wire23;
  input wire [(4'h8):(1'h0)] wire22;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire29,
                 wire28,
                 wire27,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire27 = $unsigned({{($signed(wire26) ?
                              (wire22 ~^ wire24) : {wire26, wire26}),
                          (wire23 ? ((8'ha3) << wire25) : (wire26 << (8'haf)))},
                      ($unsigned($unsigned(wire24)) ?
                          wire22 : wire22[(1'h0):(1'h0)])});
  assign wire28 = $signed(wire23[(4'h9):(3'h6)]);
  assign wire29 = wire22[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg30 <= (~^{($signed({wire24}) & ((wire24 <= (8'ha9)) ^ $unsigned(wire23))),
          (($signed(wire29) ? $unsigned(wire23) : wire29) ?
              {(^~wire25)} : $unsigned((wire22 ? (8'h9e) : wire22)))});
      if ((&(wire28[(1'h0):(1'h0)] ?
          wire24 : (wire25 ?
              wire24 : ($signed(wire23) ? reg30 : ((8'hbe) == wire25))))))
        begin
          reg31 <= wire28[(1'h0):(1'h0)];
          reg32 <= wire23;
          reg33 <= wire26[(3'h4):(2'h3)];
          if (wire26)
            begin
              reg34 <= wire28;
            end
          else
            begin
              reg34 <= (wire22[(1'h1):(1'h1)] ^~ (reg31 ?
                  {wire27,
                      ((wire23 << reg34) & (wire26 ?
                          wire29 : reg33))} : $signed({$signed(reg31),
                      $signed(wire27)})));
              reg35 <= (wire22 ?
                  ($signed((~(^reg31))) ?
                      (8'ha1) : $signed({(reg30 ^~ reg32)})) : $signed($signed((-{wire29,
                      reg30}))));
            end
        end
      else
        begin
          if ({(wire24[(1'h0):(1'h0)] || $signed(((8'had) & (reg34 ?
                  reg32 : (8'ha9))))),
              $unsigned({(reg31 ? wire23[(3'h7):(1'h1)] : (wire23 > reg31))})})
            begin
              reg31 <= $unsigned(wire23[(3'h6):(2'h3)]);
              reg32 <= reg35;
              reg33 <= {($unsigned(((wire26 ? wire22 : reg33) ?
                      (!wire25) : (wire27 ^ reg34))) <<< (^~wire28)),
                  wire27};
              reg34 <= (($signed($signed($signed((8'hae)))) > $signed({$signed(wire27)})) & reg31);
              reg35 <= wire28;
            end
          else
            begin
              reg31 <= reg33;
              reg32 <= reg30;
              reg33 <= $signed(reg33[(1'h0):(1'h0)]);
              reg34 <= reg33;
              reg35 <= reg31[(4'h8):(4'h8)];
            end
        end
      if (wire26)
        begin
          reg36 <= ((~&$unsigned({$signed(reg32)})) <<< wire25[(3'h6):(3'h6)]);
        end
      else
        begin
          reg36 <= $signed($unsigned(reg36[(4'hb):(3'h5)]));
          reg37 <= ($signed($signed(reg36[(2'h3):(2'h3)])) ?
              reg30 : {$unsigned(reg36), reg30});
        end
    end
  assign wire38 = {$signed(wire22[(3'h7):(1'h0)])};
  assign wire39 = (reg33 ?
                      (-(&reg35)) : (^((wire25[(3'h4):(2'h3)] ?
                              $signed((8'ha6)) : $unsigned(wire28)) ?
                          wire27 : wire22)));
  assign wire40 = (wire22 && (|({(reg34 < wire22),
                      $signed(wire39)} >= (~^$signed((8'hba))))));
endmodule
