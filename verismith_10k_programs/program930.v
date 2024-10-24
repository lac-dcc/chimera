module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(3'h4):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire24,
                 wire23,
                 wire6,
                 wire5,
                 wire4,
                 reg39,
                 reg38,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 (1'h0)};
  assign wire4 = wire1[(1'h0):(1'h0)];
  assign wire5 = (((&$signed(wire1[(1'h1):(1'h1)])) | ($unsigned($unsigned(wire3)) ?
                     wire0[(3'h6):(2'h2)] : $unsigned(wire3[(4'hf):(3'h5)]))) ^ ((wire0 ?
                     (((8'h9e) ?
                         wire3 : wire1) || (&wire3)) : $unsigned((wire4 >> wire3))) != {({(8'hb0),
                         (8'hb8)} > (wire2 <<< wire0))}));
  assign wire6 = ($unsigned((($unsigned(wire4) ~^ (8'ha8)) ?
                         (~&wire4[(2'h2):(2'h2)]) : (+wire3[(4'h9):(3'h5)]))) ?
                     ({($unsigned(wire0) ? (wire1 ? wire4 : wire3) : wire3)} ?
                         wire4 : (+$signed((wire4 <= wire1)))) : (-(($unsigned((8'ha0)) ?
                             (wire5 <= (8'hbe)) : ((8'hb1) ? wire3 : wire3)) ?
                         (wire3 ?
                             (wire0 << wire3) : $unsigned(wire4)) : (!(+wire4)))));
  always
    @(posedge clk) begin
      if ($unsigned($signed(($signed($unsigned(wire5)) < $unsigned($unsigned(wire4))))))
        begin
          reg7 <= ($signed(wire3) ?
              (-$signed($unsigned($unsigned(wire4)))) : wire0[(4'h8):(2'h2)]);
          if (wire4[(2'h2):(1'h0)])
            begin
              reg8 <= (^$unsigned(reg7));
              reg9 <= reg8[(3'h4):(2'h3)];
              reg10 <= ($signed((8'hac)) ?
                  (~|($signed((^~wire4)) || $signed((wire0 ?
                      wire3 : (8'hb5))))) : ($signed(((!(8'ha5)) ?
                      wire1 : (wire3 ~^ wire0))) == $unsigned(reg9[(5'h12):(4'h8)])));
              reg11 <= (-{($signed($signed(wire1)) <= $signed(wire1[(2'h2):(1'h0)])),
                  ($unsigned((~&wire3)) < $unsigned($unsigned(wire3)))});
              reg12 <= ($unsigned(wire1[(2'h2):(1'h0)]) <= $signed((8'ha7)));
            end
          else
            begin
              reg8 <= reg12[(4'h8):(4'h8)];
            end
        end
      else
        begin
          reg7 <= $signed(((wire4[(1'h1):(1'h1)] * $unsigned({wire2})) ?
              ((^(reg11 ? wire6 : reg12)) ?
                  {(wire5 ?
                          wire3 : reg10)} : $signed($signed(reg9))) : $unsigned(((~reg7) ?
                  $unsigned(reg12) : $unsigned(reg9)))));
          reg8 <= wire5;
          reg9 <= wire3[(3'h6):(1'h1)];
          reg10 <= $signed({$unsigned($signed(((8'hb4) ? wire4 : reg11)))});
        end
      reg13 <= (-($unsigned(({wire1, reg12} ?
          (wire0 * wire2) : (~&wire3))) >> $unsigned($unsigned((|wire1)))));
      reg14 <= ((wire3[(4'he):(2'h3)] ?
          ($unsigned((wire4 - wire2)) - (^$unsigned(reg11))) : $unsigned(reg8[(2'h3):(1'h1)])) * reg12[(3'h7):(3'h4)]);
    end
  always
    @(posedge clk) begin
      if ($signed($signed((reg11[(4'h8):(3'h4)] ?
          ((reg10 > wire1) ? (8'hbc) : wire2[(4'hb):(4'h8)]) : ((^wire4) ?
              reg8[(1'h1):(1'h1)] : $signed((8'ha7)))))))
        begin
          if (reg11[(2'h2):(2'h2)])
            begin
              reg15 <= wire0;
              reg16 <= (wire1 ?
                  $signed({($unsigned(reg7) ?
                          {reg12, reg8} : (reg8 >>> (8'ha1))),
                      $unsigned((+reg8))}) : ($signed(reg11) ?
                      {{reg7, $signed(reg7)}} : (($signed(reg9) ?
                          $signed(reg13) : (wire5 ?
                              wire0 : (8'hb0))) << $unsigned($signed(wire2)))));
              reg17 <= ({$unsigned($signed(reg8)), reg10} ?
                  $signed($unsigned($signed((wire4 != reg12)))) : reg12[(1'h0):(1'h0)]);
            end
          else
            begin
              reg15 <= ((wire6 ?
                  wire3 : ((wire3[(4'hb):(1'h1)] - reg9[(3'h7):(3'h6)]) * ($signed(wire5) << $signed(reg9)))) > ((8'hbb) || reg13));
              reg16 <= ((&(reg17[(1'h1):(1'h1)] ?
                      ((wire4 ? reg17 : reg12) ?
                          $unsigned(wire6) : ((8'ha9) ?
                              reg11 : (8'hbf))) : reg7)) ?
                  $unsigned((~((reg12 ?
                      reg15 : wire0) >> $signed(reg8)))) : (wire3 ?
                      $unsigned((~|$signed(wire6))) : (8'ha7)));
            end
          reg18 <= reg17[(4'h9):(1'h0)];
          reg19 <= wire6[(1'h0):(1'h0)];
          reg20 <= ($unsigned((({reg8} ? reg9[(4'he):(3'h6)] : $signed(wire0)) ?
              ((^wire5) + $unsigned(reg19)) : wire3[(3'h7):(3'h7)])) == $unsigned((reg17 <<< wire0[(3'h7):(3'h6)])));
        end
      else
        begin
          if ($signed(((-$signed((7'h42))) != $unsigned((((8'h9d) + reg20) <<< reg11[(1'h0):(1'h0)])))))
            begin
              reg15 <= ((wire1 ?
                  ($signed(reg17) ? {reg14} : (|reg8)) : (~{$unsigned(reg10),
                      $unsigned((8'h9e))})) ^ ((($signed(reg20) + ((8'hae) >> reg20)) ?
                  ((reg14 > wire6) ?
                      wire5 : $unsigned(wire1)) : wire6[(4'hc):(1'h1)]) || reg10));
              reg16 <= $unsigned($unsigned((+reg18)));
            end
          else
            begin
              reg15 <= $unsigned($signed($signed((~|wire3))));
              reg16 <= (+(~$unsigned(reg16[(2'h3):(2'h2)])));
              reg17 <= (8'hb7);
              reg18 <= ($unsigned($unsigned(((+(8'hb1)) ?
                      (^reg14) : $unsigned(reg9)))) ?
                  wire0[(2'h3):(1'h1)] : $signed($unsigned((reg11[(3'h7):(3'h6)] ~^ wire5[(1'h1):(1'h0)]))));
              reg19 <= wire6[(4'hc):(2'h2)];
            end
          reg20 <= (($signed((reg10[(1'h1):(1'h1)] ?
                  ((7'h43) != reg18) : (^~(8'ha6)))) == (($unsigned(reg13) != (wire6 << wire5)) || ((reg16 > (8'h9c)) ?
                  (reg16 * wire6) : wire2))) ?
              {(+(8'hb4)), reg20} : $signed((reg20 - wire4[(2'h3):(2'h2)])));
          reg21 <= $signed($unsigned((|(-reg10))));
          reg22 <= wire1[(1'h1):(1'h0)];
        end
    end
  assign wire23 = reg12[(4'h8):(2'h2)];
  assign wire24 = ($unsigned((reg14 ? (8'hac) : wire23)) ?
                      ($signed(({reg11} || (reg7 ?
                          wire5 : reg21))) <= ((reg21[(4'hd):(4'ha)] * (reg15 ?
                          (8'hab) : wire23)) ^~ $unsigned($signed(reg10)))) : $unsigned(((~&$unsigned(reg18)) > {(reg10 <<< wire2)})));
  always
    @(posedge clk) begin
      reg25 <= ($unsigned(((reg20 ?
          reg8 : wire5[(1'h0):(1'h0)]) - reg10[(1'h1):(1'h0)])) == (!(wire3 >= (8'hba))));
      if (((!reg14[(1'h0):(1'h0)]) ?
          (((~$unsigned(wire4)) ?
                  $unsigned((reg14 ? (8'h9e) : reg7)) : {reg22}) ?
              $unsigned(reg20[(3'h4):(1'h1)]) : (~(reg12[(5'h11):(3'h7)] >> $unsigned(reg9)))) : $signed((!$unsigned(reg16[(3'h5):(2'h3)])))))
        begin
          reg26 <= $signed(((((reg12 ? reg21 : reg14) ?
                  (!reg16) : ((8'hbd) ^~ wire6)) ?
              (reg21[(4'hb):(4'h9)] >> {reg19}) : (+(wire1 ?
                  wire3 : wire23))) <<< {((&wire23) <= (wire3 ?
                  reg10 : wire6))}));
          reg27 <= (~|($signed({(reg7 ? wire1 : reg13), (&(8'hb0))}) ?
              reg21 : (((reg22 ^~ wire4) ^ wire5[(2'h2):(2'h2)]) <<< (8'h9d))));
          reg28 <= ((reg15 ~^ $unsigned($signed($unsigned(reg8)))) << (~^$signed($signed(reg9))));
        end
      else
        begin
          reg26 <= (reg28 > reg15[(1'h1):(1'h0)]);
          reg27 <= (!(&{{{reg21}, (wire5 ? (8'ha6) : (8'ha9))}}));
        end
      reg29 <= (!(|(~&reg21)));
      reg30 <= (&$signed(reg22[(2'h2):(2'h2)]));
    end
  assign wire31 = reg14;
  assign wire32 = $signed({$unsigned(((8'hbd) || $signed(wire23)))});
  assign wire33 = (8'hb2);
  assign wire34 = $unsigned($unsigned(wire24[(3'h5):(1'h1)]));
  assign wire35 = (reg25[(3'h5):(1'h0)] ~^ wire6[(3'h5):(2'h2)]);
  assign wire36 = ($signed((~(reg10 ? $signed(reg19) : reg25))) > reg12);
  assign wire37 = (^~(^~(~|$signed(reg28))));
  always
    @(posedge clk) begin
      reg38 <= ($unsigned($unsigned(((reg20 ? wire0 : reg29) ?
          reg10[(2'h2):(1'h1)] : $unsigned(reg21)))) >> reg16);
      reg39 <= (reg28 ?
          ((wire23 - $unsigned((^wire34))) ?
              reg25[(5'h10):(4'hf)] : $signed(wire31[(3'h7):(2'h2)])) : $signed((wire4 ~^ wire24[(2'h3):(2'h2)])));
    end
  assign wire40 = $signed(reg20[(3'h4):(2'h2)]);
  assign wire41 = $unsigned((!(!(~^{reg26, reg13}))));
endmodule
