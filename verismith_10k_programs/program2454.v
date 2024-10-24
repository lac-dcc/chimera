module top
#(parameter param33 = {(!(8'hb8))}, 
parameter param34 = (param33 ? (((|param33) * (8'hb6)) ? (({param33, param33} < param33) == (~&(param33 ? param33 : param33))) : (((param33 ? param33 : param33) ? param33 : (7'h40)) && param33)) : ((param33 ? ((~^param33) ? {(8'hba), param33} : ((8'had) ? (8'hbe) : param33)) : param33) ? (param33 << ((param33 ? param33 : param33) ? (~&param33) : {param33, (8'ha4)})) : ({param33} > {(^~(8'hb2))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(3'h4):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire24;
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
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
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2;
      reg5 <= {($signed((~&$signed(wire1))) ^ wire1[(1'h1):(1'h1)]),
          wire3[(3'h5):(2'h3)]};
      if ({(wire2 ~^ ((reg5 == reg5[(1'h0):(1'h0)]) ?
              $signed(wire2) : $unsigned((wire1 & wire0))))})
        begin
          reg6 <= reg5[(4'h8):(3'h5)];
          reg7 <= reg6;
        end
      else
        begin
          reg6 <= $signed($signed(wire3[(2'h2):(1'h0)]));
        end
      if (reg7[(4'ha):(3'h5)])
        begin
          if (wire1[(4'h8):(4'h8)])
            begin
              reg8 <= (((($signed(wire2) >>> ((8'had) ^ reg7)) <= $unsigned(wire3)) * wire2[(5'h11):(5'h10)]) ?
                  ($unsigned(wire1) >> $unsigned((-$unsigned(reg5)))) : (^{reg7,
                      reg6}));
              reg9 <= wire0;
              reg10 <= wire1[(2'h2):(1'h1)];
              reg11 <= reg4;
              reg12 <= $unsigned((wire3[(5'h12):(4'hf)] >= (wire0[(2'h2):(1'h1)] | $unsigned(reg11))));
            end
          else
            begin
              reg8 <= ((($unsigned(((7'h40) ? (8'hb7) : wire0)) ?
                          $unsigned(((8'hb1) | reg12)) : $unsigned((reg11 ?
                              (8'hb1) : wire3))) ?
                      ((((8'ha6) ? reg12 : reg9) || reg11) ?
                          ($unsigned(reg5) & reg7[(4'he):(4'ha)]) : {(reg7 >>> (8'hbf)),
                              wire3[(4'hf):(2'h2)]}) : (({wire2, reg5} ?
                          (wire2 ? (8'hb6) : reg8) : (reg9 ?
                              wire2 : wire1)) != (reg6[(4'hc):(1'h0)] ?
                          $unsigned(reg9) : $signed(reg9)))) ?
                  $unsigned((((|reg4) ^ reg4[(4'h9):(3'h5)]) ?
                      ($unsigned(reg9) ?
                          (wire2 ? reg8 : reg11) : $signed(reg7)) : {(~wire0),
                          (reg9 ?
                              wire2 : (8'hbb))})) : $unsigned($signed((^(8'h9c)))));
              reg9 <= ({reg12[(3'h5):(2'h3)], reg4} ?
                  $unsigned((+$unsigned({wire3, reg12}))) : (8'ha7));
              reg10 <= (wire1[(3'h5):(2'h2)] || reg4);
              reg11 <= ((($signed((reg4 >>> wire2)) || wire0) && $signed($unsigned((reg7 ?
                      reg12 : (7'h43))))) ?
                  (|$signed(($unsigned((8'ha3)) > reg9))) : reg8[(1'h0):(1'h0)]);
            end
          if (wire2)
            begin
              reg13 <= (wire0[(3'h6):(3'h5)] * wire3);
              reg14 <= ($unsigned($signed(reg6[(3'h4):(3'h4)])) & $signed(reg10));
              reg15 <= reg8[(3'h4):(2'h3)];
            end
          else
            begin
              reg13 <= (|reg4[(3'h4):(2'h2)]);
              reg14 <= $signed($signed({reg14[(1'h1):(1'h1)], (^~(!reg12))}));
              reg15 <= ($unsigned(reg14[(1'h1):(1'h0)]) ^ (reg8 >= wire2[(4'h9):(4'h8)]));
              reg16 <= $unsigned((~|(((reg4 & (8'hb7)) ?
                  reg4[(3'h5):(3'h4)] : $unsigned(reg4)) << reg7[(4'ha):(3'h6)])));
              reg17 <= reg14;
            end
          reg18 <= {reg11[(2'h3):(2'h2)],
              ((~&(~|reg12)) & $unsigned((reg5[(4'h8):(2'h2)] ?
                  (^reg11) : $unsigned(reg10))))};
        end
      else
        begin
          if ($unsigned(((reg14[(1'h0):(1'h0)] ?
              reg7 : (!$signed((8'ha8)))) + ((reg11 <= {reg8,
              wire0}) | reg16[(2'h2):(2'h2)]))))
            begin
              reg8 <= (~^(!$unsigned(reg10[(4'hf):(3'h5)])));
              reg9 <= $signed({($signed($unsigned(wire0)) >= $signed(reg15[(4'hd):(4'hb)])),
                  $unsigned(wire3[(3'h7):(3'h4)])});
              reg10 <= (8'ha1);
            end
          else
            begin
              reg8 <= ($signed({((reg18 > reg17) ?
                      (8'ha7) : (reg16 ? reg10 : reg15)),
                  ($signed(reg6) != (~wire2))}) != $signed($signed((wire1[(2'h2):(2'h2)] ?
                  (reg12 ? reg14 : wire3) : (wire2 ? reg12 : reg5)))));
              reg9 <= $signed(reg17[(4'h9):(3'h5)]);
            end
          reg11 <= ((reg4 ^~ ((8'hbf) <<< reg8)) << reg8);
          reg12 <= reg16;
          reg13 <= {((^reg16[(4'ha):(2'h2)]) ?
                  reg6[(3'h5):(1'h1)] : (reg5 ? (8'hae) : (|(-reg5)))),
              $signed(wire2[(5'h12):(3'h7)])};
          if (($signed($unsigned($signed(wire1[(3'h7):(1'h1)]))) ?
              reg17[(4'hd):(2'h2)] : $signed(wire3)))
            begin
              reg14 <= {reg14[(2'h2):(1'h1)], $unsigned(reg5)};
              reg15 <= $unsigned(($signed(reg4) ?
                  reg18 : ($signed($signed(reg13)) ?
                      reg4 : ((reg4 ?
                          reg17 : reg14) ^~ wire2[(4'hf):(4'hb)]))));
              reg16 <= (((reg4 ?
                      ($signed(reg11) ?
                          $signed(reg18) : (reg14 ^~ wire1)) : reg5[(4'hc):(4'ha)]) ?
                  reg6[(4'h8):(4'h8)] : wire1) - (~|($signed(reg4) > $unsigned(wire1))));
              reg17 <= wire1[(1'h0):(1'h0)];
            end
          else
            begin
              reg14 <= $signed((^~(8'hbd)));
              reg15 <= {reg13, (reg4 & $unsigned({$signed(reg6)}))};
            end
        end
    end
  always
    @(posedge clk) begin
      reg19 <= (~&($signed(reg10) ?
          ({(wire1 <= wire2)} ?
              reg17 : wire1[(4'ha):(3'h6)]) : (~&(wire3[(4'hb):(3'h7)] <<< $signed(wire0)))));
      if ((^wire0[(2'h3):(2'h3)]))
        begin
          if (($signed({(8'haa)}) ? reg5 : $signed((!wire3[(3'h6):(3'h4)]))))
            begin
              reg20 <= $signed(reg18[(3'h4):(2'h3)]);
              reg21 <= {{$unsigned((-(!reg4)))}, (8'ha6)};
              reg22 <= (-(!(~|$unsigned($unsigned(reg4)))));
            end
          else
            begin
              reg20 <= reg14[(3'h4):(1'h0)];
              reg21 <= (8'hb8);
              reg22 <= reg15[(4'h8):(3'h6)];
              reg23 <= $signed((-wire0));
            end
        end
      else
        begin
          reg20 <= $signed((8'ha0));
          reg21 <= (^~($signed((-(reg5 ? reg17 : (8'hab)))) ^ (~&(reg10 ?
              (wire0 ? reg15 : (8'haa)) : reg12))));
          reg22 <= $unsigned((7'h44));
        end
    end
  assign wire24 = (8'had);
  assign wire25 = reg7[(3'h6):(1'h1)];
  assign wire26 = ({(($unsigned(reg21) ? $signed((8'ha6)) : (~|reg4)) ?
                          reg17[(4'he):(4'he)] : ((reg13 ? reg18 : reg14) ?
                              $unsigned(reg13) : $unsigned(wire24)))} + (reg9[(2'h2):(1'h1)] <= $unsigned($signed(wire2[(4'hd):(4'hb)]))));
  assign wire27 = ((reg18[(2'h3):(1'h0)] ?
                      $unsigned({wire3, (~^(8'hb0))}) : (wire24 ?
                          ((~(8'haf)) <= (^~(8'ha0))) : reg8[(4'hb):(3'h7)])) != (+($unsigned((wire26 < reg18)) ~^ (wire24[(2'h2):(1'h1)] == wire0[(3'h5):(1'h1)]))));
  assign wire28 = (reg9[(3'h5):(2'h3)] | $signed(((&{wire25}) ?
                      reg16[(4'h9):(3'h7)] : (~(8'hab)))));
  assign wire29 = $unsigned((+(($unsigned(wire27) ?
                          wire28[(2'h2):(1'h0)] : (8'ha3)) ?
                      wire26[(4'hb):(2'h3)] : wire28[(2'h3):(1'h1)])));
  assign wire30 = {reg22[(2'h2):(1'h1)],
                      (-(!((~^wire0) ?
                          $signed(wire28) : (reg9 ? wire1 : reg15))))};
  assign wire31 = reg8;
  assign wire32 = reg10[(4'ha):(4'ha)];
endmodule
