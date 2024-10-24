module top
#(parameter param37 = ((!(((~|(8'hb5)) | ((8'hac) ? (8'hab) : (8'ha3))) ? ({(8'hb7), (7'h42)} ? {(8'hb9), (8'hb0)} : {(8'hb9), (8'h9d)}) : (((8'hba) && (8'hae)) ? (^~(8'hb0)) : ((8'ha3) ? (8'h9e) : (8'hbd))))) ? (+(((~&(8'h9f)) <<< (-(8'hbd))) ? (^((8'hb2) >> (8'ha2))) : (((8'hbf) || (8'hbf)) ? (7'h43) : (8'hb8)))) : ((~|(((7'h42) <= (8'hab)) ? ((8'hb9) ? (8'h9f) : (8'hb8)) : {(8'hae)})) ? ((((8'had) ? (8'hbc) : (8'hbe)) ~^ ((7'h44) + (8'ha5))) + {(!(8'hab)), ((8'hae) | (8'hb7))}) : ((~((8'hbe) < (8'ha0))) || (((7'h42) ? (7'h44) : (8'hb4)) ? (|(7'h44)) : (+(7'h43)))))), 
parameter param38 = ((|(^~((param37 >= param37) != param37))) ? ((param37 ? ((+param37) > (param37 - param37)) : (-(param37 - param37))) ^ (({param37} * param37) >= {(^param37), {param37}})) : param37))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h191):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  assign y = {wire36,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire1[(1'h0):(1'h0)];
  assign wire5 = (8'hbd);
  always
    @(posedge clk) begin
      reg6 <= (wire4 ?
          (wire4 ?
              $unsigned($signed((~&wire1))) : wire3) : wire0[(3'h7):(2'h2)]);
      reg7 <= (&(((~&(wire4 + wire0)) ^~ wire0[(1'h0):(1'h0)]) >>> wire2));
      reg8 <= (^~$unsigned(wire1[(4'hb):(4'h8)]));
    end
  assign wire9 = reg6[(3'h7):(3'h6)];
  assign wire10 = (reg6[(1'h1):(1'h0)] ?
                      ($signed(($signed(wire2) - $unsigned(wire4))) < $unsigned(wire4[(1'h0):(1'h0)])) : ({(^~{wire5})} ?
                          {(-(reg7 ? wire5 : wire4)),
                              ({wire0} >> $unsigned(wire4))} : $unsigned($unsigned({(8'ha4),
                              reg6}))));
  assign wire11 = (!wire9);
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire11[(4'hc):(2'h3)]);
      reg13 <= ((($signed(wire4) != wire4) ?
              $signed(((wire2 ?
                  wire4 : wire9) >= reg7[(1'h1):(1'h0)])) : wire2[(3'h5):(3'h4)]) ?
          $signed((((wire3 ? (8'haa) : reg6) ?
              ((7'h40) ?
                  wire4 : reg12) : (reg8 <<< reg12)) ^ $unsigned((wire3 << wire10)))) : reg8[(1'h1):(1'h1)]);
      if (wire3)
        begin
          reg14 <= {((wire1[(5'h13):(1'h0)] ?
                  (-wire9[(1'h0):(1'h0)]) : wire4[(3'h6):(2'h3)]) ^~ {(8'ha6)})};
          reg15 <= $signed(($unsigned((wire0 ?
                  {wire11, reg13} : (wire3 ? wire0 : reg8))) ?
              ($unsigned((wire4 <<< (8'hb0))) ?
                  $signed((reg7 | wire10)) : ($signed(wire4) ?
                      $unsigned(wire2) : $unsigned((8'hbd)))) : reg13[(3'h7):(1'h1)]));
          reg16 <= $unsigned(wire5[(3'h7):(1'h1)]);
          if ({(^(|{$unsigned(wire3), $unsigned(wire1)}))})
            begin
              reg17 <= $unsigned(((~((reg13 < wire3) ?
                  $unsigned(reg6) : $signed(reg16))) ^ {(^$unsigned((8'hbf)))}));
              reg18 <= wire0[(1'h1):(1'h0)];
            end
          else
            begin
              reg17 <= $signed({($unsigned((wire9 ?
                      reg7 : wire4)) ~^ $unsigned((wire1 ? (8'h9f) : reg13)))});
              reg18 <= $signed(reg17[(3'h4):(1'h1)]);
            end
        end
      else
        begin
          if (($signed(reg14) ?
              (~|reg14) : ((reg15[(2'h2):(2'h2)] ?
                  (wire2[(4'ha):(4'ha)] < (wire11 ?
                      (8'h9f) : wire9)) : $unsigned($signed(reg7))) - $signed((8'hb5)))))
            begin
              reg14 <= (wire5 < reg6);
              reg15 <= $signed((((^~wire11[(5'h10):(4'he)]) ^~ (&$signed(wire5))) ?
                  reg6[(3'h7):(3'h5)] : wire0));
              reg16 <= ((((8'ha4) ?
                  reg17 : wire0[(1'h1):(1'h0)]) & reg16[(2'h2):(1'h0)]) >= (^(reg16[(3'h6):(3'h5)] ?
                  $unsigned({(8'ha9)}) : (8'ha6))));
            end
          else
            begin
              reg14 <= {(($unsigned((wire5 <<< reg14)) ^~ (~&$signed(reg7))) ?
                      $unsigned(($signed(reg18) ?
                          $unsigned((8'ha8)) : $unsigned((8'hb4)))) : (~$unsigned($signed(wire0))))};
            end
        end
      if ($unsigned(reg14[(4'h9):(3'h4)]))
        begin
          reg19 <= reg17;
          reg20 <= reg13;
          if (reg15)
            begin
              reg21 <= $signed((+($unsigned(reg6) ?
                  (~&reg17) : reg7[(3'h4):(1'h1)])));
              reg22 <= {wire2[(3'h5):(1'h0)]};
              reg23 <= (8'ha6);
              reg24 <= (reg7[(1'h0):(1'h0)] ?
                  $signed($unsigned($unsigned($signed(wire5)))) : {wire9[(1'h1):(1'h1)]});
            end
          else
            begin
              reg21 <= wire0;
              reg22 <= ((reg19 ?
                  (wire2 ?
                      ($unsigned(reg8) & $unsigned((8'hbd))) : reg12[(3'h6):(3'h4)]) : ($unsigned($signed(reg22)) ?
                      $signed({wire0}) : (~(reg7 != reg23)))) ~^ $unsigned(({reg13} ?
                  $unsigned((reg15 ? reg22 : reg21)) : reg24[(3'h6):(1'h1)])));
              reg23 <= {$signed(($signed((wire1 <<< reg15)) < {(-reg7)})),
                  ($signed(reg24[(4'he):(4'ha)]) >> (+reg24))};
              reg24 <= reg7[(3'h5):(1'h1)];
              reg25 <= ($signed(((~|(-wire1)) != reg6)) ?
                  (~^reg15) : ((reg8 <= ((wire5 <= wire2) ? (8'ha1) : {reg7})) ?
                      $signed($unsigned($signed(reg22))) : reg6[(3'h4):(1'h0)]));
            end
          reg26 <= {reg19[(5'h10):(1'h0)]};
        end
      else
        begin
          reg19 <= reg22[(2'h3):(1'h0)];
          reg20 <= $unsigned((($unsigned(reg13) ?
              ((^(8'ha5)) ~^ (reg6 ? wire9 : reg24)) : ($unsigned((8'had)) ?
                  wire9[(1'h0):(1'h0)] : reg23)) ^ {$unsigned($unsigned(wire1))}));
        end
      if (((~(-({wire0, reg17} ? {wire3} : wire5[(3'h4):(3'h4)]))) ?
          $unsigned((reg16[(3'h6):(3'h5)] ?
              $signed(((8'hba) ?
                  reg8 : reg17)) : $unsigned((~|reg8)))) : reg13[(3'h4):(1'h1)]))
        begin
          reg27 <= $signed((~&wire5[(3'h6):(3'h5)]));
          if ($unsigned(reg8))
            begin
              reg28 <= (7'h42);
              reg29 <= $signed(wire2);
              reg30 <= (+$unsigned(($signed({reg17}) ^ $unsigned((&wire3)))));
            end
          else
            begin
              reg28 <= $signed((~$signed(reg28)));
              reg29 <= (8'hae);
              reg30 <= ({((^{(8'ha3), (8'hb4)}) ?
                          reg14 : $signed($unsigned(wire2))),
                      $signed(wire2[(3'h6):(3'h4)])} ?
                  reg29 : $signed({$unsigned(reg25[(1'h1):(1'h1)]),
                      reg6[(3'h6):(3'h4)]}));
              reg31 <= reg22;
              reg32 <= reg8[(1'h1):(1'h0)];
            end
          reg33 <= ($signed(({$signed(wire0),
              $unsigned(reg6)} >= ((wire10 + reg31) ?
              {reg32} : $signed((7'h42))))) ~^ (!$unsigned(wire2[(1'h1):(1'h0)])));
          reg34 <= (~^reg6);
          reg35 <= (reg20 ?
              reg22 : (($unsigned($signed(reg22)) ?
                  (8'ha3) : $unsigned((~&reg15))) >>> ((((8'ha4) + reg8) != (wire9 | reg18)) ?
                  (^wire10[(2'h3):(2'h2)]) : ((reg23 ? reg34 : reg22) ?
                      (!(8'hbf)) : $unsigned(reg30)))));
        end
      else
        begin
          reg27 <= wire11;
          reg28 <= reg27[(4'hd):(2'h3)];
          reg29 <= reg19;
          reg30 <= ((^~(+reg17)) ?
              ($unsigned(reg23) == ({$signed(reg14)} < (reg35[(5'h13):(2'h2)] <= (reg25 ?
                  reg30 : wire10)))) : reg13[(2'h2):(1'h0)]);
        end
    end
  assign wire36 = ((^($signed({reg25, (8'hab)}) ?
                      (-(reg28 | reg21)) : reg14)) * ((reg31 || reg31[(4'ha):(3'h6)]) * $signed(reg29)));
endmodule
