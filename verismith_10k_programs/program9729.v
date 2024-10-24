module top
#(parameter param35 = {(|((((8'h9e) >= (8'ha2)) ? (^(8'hbf)) : ((8'hb0) ? (8'hbd) : (8'hb0))) || (~|((8'hb6) > (8'hbd)))))}, 
parameter param36 = (!param35))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire1[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg5 <= {$unsigned({($signed(wire3) && (~&wire0)), (7'h40)})};
      if (($unsigned(($unsigned((wire0 >> (8'ha2))) || (wire2[(3'h6):(2'h2)] << $signed(wire1)))) && $signed(wire0[(5'h13):(1'h0)])))
        begin
          reg6 <= {wire4[(4'h8):(3'h4)]};
          reg7 <= wire2[(3'h4):(3'h4)];
          reg8 <= reg7;
          if ({($signed(((reg7 - wire4) << reg6[(1'h1):(1'h0)])) ?
                  ($signed(wire1) ^~ $unsigned((wire4 ?
                      reg5 : reg5))) : wire1)})
            begin
              reg9 <= (wire4[(4'hb):(1'h0)] >> reg8[(1'h0):(1'h0)]);
              reg10 <= (7'h41);
              reg11 <= (~reg5);
              reg12 <= ((|($signed(wire4[(4'hf):(4'ha)]) * ((|(8'ha3)) ?
                  {reg7} : $unsigned(reg6)))) >>> (-({(8'hbb), reg7} ?
                  (~|wire3[(3'h4):(1'h1)]) : $signed((wire0 ? reg7 : reg10)))));
              reg13 <= $signed($unsigned($unsigned($signed($unsigned(reg10)))));
            end
          else
            begin
              reg9 <= (~^(~|(reg6[(1'h1):(1'h1)] ?
                  $signed({reg8}) : $unsigned(reg13))));
              reg10 <= (|({(reg11[(5'h14):(5'h14)] ?
                      {(8'ha5),
                          wire0} : ((8'hbd) < reg6))} ^~ ((~^$signed(reg11)) ?
                  reg8[(1'h1):(1'h0)] : reg7[(2'h2):(1'h1)])));
              reg11 <= (wire0 ~^ ($unsigned($signed(wire2[(3'h6):(3'h5)])) & (^~$unsigned((wire0 ?
                  reg12 : reg5)))));
            end
        end
      else
        begin
          if (wire1)
            begin
              reg6 <= $signed((^~(|($unsigned(reg7) ?
                  reg6[(4'hc):(4'hc)] : reg12))));
              reg7 <= ((((^~(reg13 >= reg11)) ?
                          ((+wire0) ?
                              $signed(reg5) : {wire2,
                                  wire4}) : ((wire3 == (8'hb9)) >>> reg7[(1'h1):(1'h0)])) ?
                      (|(^~wire3[(1'h1):(1'h0)])) : $signed(((reg11 << wire4) ^~ $unsigned((8'hbd))))) ?
                  reg7 : $signed(reg13[(3'h6):(3'h6)]));
              reg8 <= reg8[(1'h1):(1'h0)];
              reg9 <= $unsigned($unsigned($unsigned((^$signed(wire3)))));
            end
          else
            begin
              reg6 <= {reg7[(1'h1):(1'h1)],
                  ((($signed(reg10) ?
                          $unsigned(reg10) : (reg8 ?
                              wire3 : reg12)) | ({(8'hb5)} - (reg10 ~^ wire0))) ?
                      (7'h44) : $signed(reg8[(3'h7):(3'h5)]))};
              reg7 <= {$unsigned($unsigned(reg11[(4'hc):(4'hb)])), reg12};
              reg8 <= ($unsigned((($unsigned(reg12) ?
                      $signed(reg9) : (reg10 ?
                          wire1 : wire0)) <<< ($signed(reg11) ?
                      $signed(reg6) : {reg9, wire3}))) ?
                  ($signed((!(!(8'ha9)))) & reg11) : {(+$signed(reg6)),
                      (!{$unsigned((8'ha2))})});
            end
          if ({(~wire0), reg11})
            begin
              reg10 <= ($unsigned(($signed(reg7) == reg8)) ?
                  $unsigned(reg5[(4'ha):(3'h6)]) : reg6);
              reg11 <= wire3;
              reg12 <= $signed((&(wire4 ?
                  $signed($unsigned(wire2)) : reg12[(1'h1):(1'h1)])));
            end
          else
            begin
              reg10 <= reg12;
              reg11 <= (-(8'hbe));
              reg12 <= {$signed({wire2[(1'h0):(1'h0)], reg9[(4'hd):(4'h9)]})};
              reg13 <= {(reg12[(2'h2):(2'h2)] ?
                      $signed($unsigned((^wire0))) : reg11)};
            end
          reg14 <= $unsigned(reg10);
        end
      if ($signed(reg9))
        begin
          reg15 <= $signed((^(((wire4 ? (8'hb1) : wire4) | $signed(reg13)) ?
              (-reg7) : (reg11[(1'h1):(1'h1)] ?
                  wire2[(1'h0):(1'h0)] : {reg10}))));
        end
      else
        begin
          if (wire2)
            begin
              reg15 <= ((reg14 < wire1[(1'h1):(1'h1)]) ?
                  ((reg15 ?
                      ((reg9 || (8'ha8)) ?
                          $unsigned((8'had)) : $signed(reg5)) : {(reg13 || wire3),
                          $signed(reg13)}) <= (8'ha1)) : $signed($signed({((7'h43) ?
                          reg5 : reg12)})));
              reg16 <= wire1;
            end
          else
            begin
              reg15 <= reg5;
              reg16 <= reg10;
              reg17 <= ($unsigned((($signed(reg15) << reg6[(3'h5):(3'h4)]) ?
                  (~&reg6) : $unsigned((^~reg6)))) <= reg14);
              reg18 <= $unsigned(reg6[(2'h2):(2'h2)]);
            end
          reg19 <= (&$signed(reg18[(4'h9):(3'h5)]));
          if (reg9[(4'hc):(1'h0)])
            begin
              reg20 <= (reg8 ?
                  ((reg7[(1'h1):(1'h0)] ?
                      {(wire1 || wire2),
                          $signed((8'ha1))} : $unsigned((&wire2))) ~^ $signed((~^$signed(wire2)))) : $signed(($signed(reg17[(2'h2):(1'h0)]) ?
                      $unsigned($signed(wire0)) : ((reg6 >= reg19) > reg7[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg20 <= reg5;
            end
          reg21 <= $signed($signed((!reg13)));
          reg22 <= $signed(($signed(((wire1 >= wire3) > reg16)) >>> ((reg13 && (^reg6)) & $signed((wire3 <= reg8)))));
        end
      reg23 <= reg17[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg24 <= $unsigned((reg16[(2'h2):(2'h2)] << reg20));
      reg25 <= reg7[(2'h2):(1'h0)];
      if (($unsigned((8'ha9)) >>> (~&((^reg15) <= wire4[(2'h2):(2'h2)]))))
        begin
          if ({((reg15[(1'h1):(1'h1)] != reg12) ?
                  $unsigned({(+reg12), (wire2 ? reg18 : reg6)}) : {reg20,
                      $signed($unsigned(wire1))}),
              wire0})
            begin
              reg26 <= (reg5[(4'hc):(2'h2)] ?
                  $unsigned($unsigned(reg12[(4'ha):(4'ha)])) : (reg6[(3'h7):(2'h3)] != (-$unsigned(reg25))));
            end
          else
            begin
              reg26 <= $unsigned(reg18[(3'h6):(3'h4)]);
              reg27 <= (((((reg7 + (8'hbe)) ~^ (reg20 ? (8'hb5) : reg13)) ?
                      $unsigned((~^wire0)) : (8'hbf)) | $signed(reg15)) ?
                  (!((!wire0) * $signed($unsigned(reg21)))) : (reg9[(4'ha):(3'h4)] ?
                      ({(reg11 <= wire2)} ?
                          (~|reg13[(3'h6):(3'h6)]) : reg16) : $signed({(~wire4),
                          (~reg26)})));
              reg28 <= ((reg25[(3'h4):(2'h3)] ?
                  $signed($signed(reg24)) : ((^~wire2[(2'h3):(2'h3)]) ?
                      $signed(reg24[(4'h8):(3'h5)]) : wire0[(2'h3):(2'h2)])) < (8'hac));
            end
          reg29 <= ((8'ha8) << (+(((|reg11) + $unsigned(reg18)) ?
              (&(^~reg14)) : (&reg11))));
        end
      else
        begin
          reg26 <= (((($signed(reg24) ? {reg19, reg7} : reg9[(5'h15):(4'hc)]) ?
                  $signed((wire3 ? wire3 : (8'ha6))) : {(~|(8'h9c)),
                      $unsigned(reg16)}) ?
              (reg24[(1'h1):(1'h0)] == reg17[(1'h1):(1'h1)]) : ((reg8[(1'h1):(1'h1)] ?
                      $signed(reg13) : $unsigned(reg26)) ?
                  $signed(reg18[(2'h3):(2'h2)]) : ((reg29 ?
                      reg15 : reg26) < $unsigned(reg19)))) < (((-((8'h9f) > reg23)) ?
                  reg19[(4'hc):(2'h3)] : $signed($unsigned((8'ha4)))) ?
              ({reg26[(1'h0):(1'h0)],
                  (-reg19)} <= $signed((~&reg21))) : reg9[(5'h12):(5'h10)]));
          reg27 <= (+reg23);
        end
      reg30 <= reg29[(3'h6):(1'h1)];
    end
  assign wire31 = reg13[(1'h0):(1'h0)];
  assign wire32 = reg7[(1'h0):(1'h0)];
  assign wire33 = ($signed(((wire0 && reg14[(4'h9):(3'h6)]) ?
                      $unsigned(((8'hbd) >= (8'ha0))) : (^~wire2))) | (~(((reg9 ?
                      reg5 : reg25) | reg28[(2'h2):(1'h1)]) & reg6)));
  assign wire34 = $signed({({(!(8'hb1))} <<< $signed((~|(8'ha1))))});
endmodule
