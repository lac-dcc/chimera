module top
#(parameter param29 = ((~|(|(((8'hae) ? (8'hb2) : (8'hbe)) * ((8'ha3) ? (8'hb9) : (8'hab))))) ? (~^{((8'hab) ~^ ((8'ha6) <= (8'h9d)))}) : (({((8'ha9) ? (8'haa) : (8'hb7)), ((8'ha0) ? (7'h43) : (8'hab))} ? (((8'hb3) ^~ (8'had)) ? (~^(8'ha5)) : ((8'hb8) ? (8'hbd) : (8'haa))) : ((|(8'h9d)) ? {(8'haa)} : ((8'hb9) ^~ (8'h9e)))) >> (({(7'h44), (8'hbf)} == (~&(8'hbc))) ? ({(8'hac), (8'hb3)} <= (8'h9e)) : (((8'h9e) ? (8'ha3) : (8'ha9)) ? (&(8'hbc)) : (|(8'ha4)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire4;
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
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
                 reg8,
                 (1'h0)};
  assign wire4 = wire2[(4'h9):(1'h0)];
  assign wire5 = wire1;
  assign wire6 = {(~^wire1),
                     ({{wire5[(1'h0):(1'h0)]}} ? wire2 : wire0[(2'h3):(1'h0)])};
  assign wire7 = (((((~wire0) ^ (8'haf)) ?
                     {{wire4, wire0}} : ((&wire2) ?
                         {wire2,
                             wire1} : wire0[(5'h11):(3'h6)])) << wire4) ^ (&wire6));
  always
    @(posedge clk) begin
      if (((|wire0[(5'h10):(4'h9)]) + (&($signed($unsigned(wire7)) <= (((8'hb2) ?
          wire2 : (7'h44)) <<< (wire3 == wire1))))))
        begin
          reg8 <= ((($unsigned($unsigned(wire6)) && (~&wire6)) ?
                  (^wire5) : (8'haf)) ?
              wire7 : (+$signed({$signed(wire3)})));
          reg9 <= $unsigned((wire4[(3'h7):(2'h2)] >>> ({(~^wire1),
                  (wire5 ? wire4 : wire7)} ?
              (((8'hb1) ?
                  (8'had) : wire5) <= (~&wire6)) : ($signed((8'hac)) || wire0[(3'h7):(3'h4)]))));
          reg10 <= ({wire0[(4'h9):(3'h4)]} ?
              $signed((~|$signed({reg9}))) : wire7[(4'h8):(3'h4)]);
          reg11 <= reg9;
          if (((|(!wire3)) + reg8))
            begin
              reg12 <= reg8;
              reg13 <= ($unsigned((+$signed((&wire6)))) ^~ (8'hb1));
              reg14 <= $signed(((reg13[(4'ha):(3'h4)] ?
                  ((wire7 & (8'hbe)) >>> (^wire4)) : (+wire0)) || $unsigned(((-wire3) > wire0))));
              reg15 <= {wire4, wire3};
            end
          else
            begin
              reg12 <= (((reg14[(1'h0):(1'h0)] ?
                      ($signed(reg9) >>> (reg8 & wire6)) : $unsigned((wire1 ?
                          wire5 : wire5))) ?
                  $signed($signed($signed(reg12))) : $signed((~^{reg8}))) == {((~^$unsigned(reg9)) || $signed($signed(reg9)))});
              reg13 <= $signed((wire5 ?
                  (~&((~&reg11) ~^ (reg14 | wire6))) : (((reg10 ?
                      wire2 : (8'ha8)) ^ (wire0 - wire5)) < $unsigned($signed(wire6)))));
              reg14 <= ({$signed(reg9[(3'h4):(2'h3)]),
                  $signed((!(~^(8'ha4))))} <<< $signed(reg10));
              reg15 <= (~^$signed(wire5[(1'h0):(1'h0)]));
              reg16 <= ($unsigned((reg10[(2'h2):(1'h0)] & wire1[(1'h1):(1'h1)])) * (({{wire2,
                      (8'h9d)}} == wire4[(1'h1):(1'h0)]) < (~|($unsigned(wire0) ?
                  $unsigned(wire4) : wire3))));
            end
        end
      else
        begin
          reg8 <= (({(-reg16),
                  ((reg12 ? wire2 : wire0) ?
                      wire4 : (reg16 ? wire2 : reg14))} >= (($unsigned(wire2) ?
                  wire6 : $signed((8'hb3))) || {(reg8 >>> reg16),
                  $unsigned((8'h9c))})) ?
              ($signed(({wire0} || wire0)) ?
                  ($unsigned($signed(wire0)) ?
                      $unsigned(wire5[(3'h7):(1'h1)]) : ((reg8 ^ reg12) > wire6)) : $unsigned(reg15)) : (&reg14));
          reg9 <= (wire1 >> $unsigned((|$unsigned($unsigned(wire5)))));
          reg10 <= (reg16[(4'hd):(3'h4)] ? reg13 : (!reg12));
          if ($signed($unsigned($signed((-$signed(wire6))))))
            begin
              reg11 <= wire3;
            end
          else
            begin
              reg11 <= $signed($signed({wire1}));
              reg12 <= (reg11 || $unsigned($unsigned((|(~reg11)))));
              reg13 <= $unsigned(((^wire2[(4'ha):(4'h8)]) <<< ({{wire1}} - ($signed(reg13) - (wire0 ?
                  reg14 : reg16)))));
              reg14 <= wire7;
            end
          reg15 <= (-reg12);
        end
      reg17 <= $unsigned($signed(wire3));
      reg18 <= (~^$signed(($unsigned($unsigned(reg17)) ?
          (+reg9) : (&$unsigned((8'hb3))))));
    end
  assign wire19 = (((&$unsigned((reg15 ? wire4 : reg9))) ?
                          $unsigned($signed((-reg14))) : {$signed((reg12 ?
                                  (8'ha7) : wire5)),
                              reg12}) ?
                      ($unsigned(wire1[(4'h9):(3'h6)]) == $unsigned((~|((8'haa) ?
                          wire1 : reg13)))) : $unsigned((reg14[(3'h4):(2'h2)] ?
                          (reg18[(4'hd):(4'hb)] ?
                              {wire2,
                                  wire5} : reg15[(2'h2):(1'h1)]) : $unsigned(wire4))));
  assign wire20 = (!(^~$unsigned((+(-wire1)))));
  assign wire21 = (^~(~^reg8[(4'hb):(3'h6)]));
  assign wire22 = ({(-(&(wire0 ? reg9 : reg10))),
                          {{(reg16 ? wire2 : reg17),
                                  (reg10 ? wire20 : wire20)}}} ?
                      wire2[(3'h5):(1'h1)] : reg10[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire3[(2'h2):(1'h0)])
        begin
          reg23 <= {(({$unsigned(reg18), $signed(reg18)} >> (|{(8'hb3),
                      wire0})) ?
                  (reg16 >= $signed((wire22 == wire1))) : $unsigned(((reg13 < reg11) ?
                      $unsigned(wire0) : (8'ha4)))),
              (reg16[(1'h1):(1'h1)] < ($signed((wire7 ?
                  wire1 : reg16)) != wire4))};
          reg24 <= (&wire5);
          reg25 <= ($signed((~^(reg15 != wire22[(3'h5):(1'h0)]))) != (reg13[(2'h2):(2'h2)] - (wire1[(3'h7):(3'h4)] ?
              $signed((wire7 ? reg11 : (8'hae))) : reg23)));
        end
      else
        begin
          if ($unsigned(wire22))
            begin
              reg23 <= $unsigned((($signed((^reg13)) ^ wire22) - $unsigned(wire21)));
              reg24 <= $signed(($unsigned((8'ha4)) ?
                  $unsigned($unsigned(reg14)) : (^$signed(wire6[(3'h6):(3'h5)]))));
              reg25 <= ($unsigned($unsigned($unsigned((8'h9d)))) >>> wire1[(3'h7):(3'h5)]);
              reg26 <= (8'hb1);
            end
          else
            begin
              reg23 <= reg8[(5'h12):(4'he)];
            end
        end
      reg27 <= $signed((8'hb1));
      reg28 <= $unsigned($unsigned((+wire0)));
    end
endmodule
