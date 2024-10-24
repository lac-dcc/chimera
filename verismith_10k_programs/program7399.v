module top #(parameter param45 = (8'hb7)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ff):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire [(4'hd):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire32,
                 wire28,
                 wire27,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 reg31,
                 reg30,
                 reg29,
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
                 (1'h0)};
  assign wire4 = $signed(wire3[(2'h3):(2'h3)]);
  assign wire5 = ($unsigned((8'hb5)) ?
                     ({((~^wire4) ?
                             (7'h42) : wire1[(1'h1):(1'h0)])} <<< (((^(8'ha9)) <<< wire4) ?
                         wire4 : {wire0[(3'h5):(3'h4)]})) : ((8'hb2) ?
                         ($unsigned(wire0[(3'h5):(3'h4)]) >= $unsigned((wire1 ?
                             wire0 : (8'ha2)))) : $unsigned(wire3)));
  assign wire6 = wire3;
  assign wire7 = (((+((-wire0) ?
                         $signed(wire1) : (wire2 >> wire0))) ^~ (((wire1 ?
                         wire5 : wire4) || wire2) ^ $unsigned($unsigned(wire5)))) ?
                     $signed(((wire3[(3'h7):(2'h2)] ?
                         (wire3 >= wire5) : (wire5 ?
                             wire3 : wire5)) && {{wire0},
                         wire3})) : $unsigned(wire6));
  always
    @(posedge clk) begin
      reg8 <= $signed(((wire5 ^~ ((wire3 && wire6) ?
          (wire4 ^ wire6) : wire2)) & (($unsigned(wire6) ?
          (wire1 ?
              (8'ha9) : wire7) : $unsigned(wire4)) << wire2[(4'h8):(3'h7)])));
    end
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg9 <= wire2;
          reg10 <= (-(~&(reg8[(2'h2):(1'h1)] ?
              wire4 : (wire4[(3'h7):(3'h7)] ~^ (wire7 ? reg9 : reg9)))));
        end
      else
        begin
          reg9 <= $signed(((($signed(wire5) ? (|(8'hb9)) : (wire5 ^ wire6)) ?
              $unsigned(wire2) : ((wire1 ?
                  wire2 : reg10) >>> wire6[(2'h3):(2'h2)])) != wire1[(3'h7):(3'h5)]));
          reg10 <= reg10[(5'h11):(5'h10)];
        end
      reg11 <= wire7[(1'h0):(1'h0)];
      if ($unsigned($unsigned($unsigned((~^wire6)))))
        begin
          reg12 <= wire6;
          if ((~^wire1))
            begin
              reg13 <= (($signed(({wire5} ?
                      (wire5 != reg10) : (reg8 & wire4))) ?
                  wire6[(4'h9):(3'h6)] : {wire6[(4'ha):(4'h8)]}) >= wire7);
              reg14 <= ((~$unsigned($signed(((8'hac) ? reg11 : (8'hba))))) ?
                  $signed($signed((-(wire6 ?
                      reg10 : wire5)))) : ($unsigned(($signed(wire2) <<< (^~(8'hbd)))) & wire6));
              reg15 <= {(~{(&$unsigned(wire5))})};
              reg16 <= {(+(!reg11[(1'h1):(1'h1)]))};
              reg17 <= (~&{reg14});
            end
          else
            begin
              reg13 <= wire0[(3'h4):(2'h2)];
              reg14 <= (8'haa);
              reg15 <= $signed($unsigned($unsigned(wire6[(1'h1):(1'h1)])));
              reg16 <= reg12[(1'h0):(1'h0)];
              reg17 <= wire3[(2'h2):(1'h1)];
            end
          if ($unsigned($unsigned($signed(wire5[(1'h0):(1'h0)]))))
            begin
              reg18 <= (~&$unsigned(wire1[(2'h3):(2'h3)]));
              reg19 <= ((^~($signed($signed(wire2)) ?
                  $signed($signed(reg9)) : (~&$signed(wire7)))) * ((reg10 >> reg8) ?
                  (|(wire0 ?
                      (reg16 ?
                          reg13 : wire6) : $signed(reg17))) : $signed(((reg13 ?
                          reg14 : wire4) ?
                      (wire0 ? reg13 : (8'hb1)) : (wire5 > reg16)))));
              reg20 <= wire1;
              reg21 <= ($unsigned({(~&$unsigned(reg16)),
                      $signed((wire4 ? reg8 : wire4))}) ?
                  $signed((~{{wire0}})) : $signed($signed($signed($signed(reg13)))));
              reg22 <= wire6[(3'h4):(2'h2)];
            end
          else
            begin
              reg18 <= (wire2[(3'h4):(3'h4)] > wire5);
              reg19 <= $unsigned(wire4);
              reg20 <= reg13[(3'h6):(1'h0)];
            end
          reg23 <= reg17[(3'h7):(3'h4)];
        end
      else
        begin
          reg12 <= $signed((wire7 ? wire2[(1'h1):(1'h1)] : reg12));
          if (($signed($unsigned(reg11[(1'h1):(1'h0)])) != {(8'hbe)}))
            begin
              reg13 <= {(&reg15)};
              reg14 <= wire0[(3'h5):(1'h0)];
              reg15 <= $signed(((8'hb6) && (reg11[(1'h0):(1'h0)] - reg9[(3'h5):(3'h4)])));
              reg16 <= reg16;
            end
          else
            begin
              reg13 <= reg18[(5'h11):(4'h9)];
            end
        end
      if (reg22)
        begin
          reg24 <= $signed(((wire0[(3'h5):(2'h3)] ~^ reg9) ^ reg18));
        end
      else
        begin
          reg24 <= {reg8, wire5};
          reg25 <= $signed(reg20[(5'h13):(1'h0)]);
          reg26 <= $unsigned(reg10[(4'he):(1'h1)]);
        end
    end
  assign wire27 = reg8;
  assign wire28 = ($unsigned(reg14[(4'ha):(3'h5)]) ?
                      (~((~&$unsigned((8'ha0))) ?
                          reg11 : $unsigned((8'hb1)))) : (^reg21[(3'h6):(3'h5)]));
  always
    @(posedge clk) begin
      reg29 <= reg18[(3'h5):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg30 <= reg8[(3'h4):(2'h3)];
      reg31 <= $unsigned((^reg30));
    end
  assign wire32 = wire7[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg33 <= $unsigned((&(($unsigned(reg20) > (8'h9c)) ?
          (^~$signed(reg11)) : reg16[(4'ha):(3'h6)])));
      if (reg19[(2'h3):(2'h2)])
        begin
          reg34 <= reg17[(5'h12):(5'h12)];
          if ($unsigned((((^~wire32[(4'hd):(4'hb)]) ?
              ((|reg9) ?
                  reg31[(2'h3):(2'h3)] : (wire3 | reg16)) : (reg11[(1'h0):(1'h0)] ?
                  wire7 : (reg22 || reg34))) >= (^~$signed($unsigned(reg29))))))
            begin
              reg35 <= $unsigned((8'hba));
              reg36 <= $unsigned(wire0[(3'h5):(1'h1)]);
              reg37 <= ((~$signed($signed(reg20))) ^ $signed((wire2 | $unsigned({reg35,
                  reg16}))));
              reg38 <= ($signed({(reg30[(4'h9):(4'h8)] >>> (reg13 ?
                      reg17 : wire5))}) ^ wire1[(1'h1):(1'h0)]);
            end
          else
            begin
              reg35 <= $unsigned(wire3);
              reg36 <= wire5[(4'ha):(2'h2)];
              reg37 <= (8'ha1);
              reg38 <= (($signed(wire0[(2'h2):(1'h0)]) ?
                  (!$unsigned(wire1)) : $signed(reg36)) || ($signed((-(!reg17))) ?
                  ($unsigned($signed(reg30)) ?
                      $signed($signed(wire5)) : ({reg11} ~^ $signed((8'h9e)))) : reg38));
            end
          reg39 <= $signed(reg22[(1'h0):(1'h0)]);
          reg40 <= $unsigned(($signed($signed(wire7)) << (^~((^reg33) ^~ reg33[(4'hb):(4'h8)]))));
        end
      else
        begin
          reg34 <= $signed((($signed((reg8 ?
              (8'ha2) : reg36)) != ($signed(reg26) != reg34)) >= ((8'hb0) ?
              reg9 : reg34)));
          reg35 <= reg23;
          if ({reg17[(5'h12):(1'h0)],
              $unsigned($unsigned($unsigned((~^reg24))))})
            begin
              reg36 <= ({(|(&$unsigned((8'had)))),
                  reg9} << {($signed($unsigned(wire28)) <<< ((wire3 + wire1) ?
                      $signed((8'hbc)) : reg40[(4'he):(2'h3)])),
                  $unsigned($signed((|reg23)))});
            end
          else
            begin
              reg36 <= reg26[(3'h5):(2'h2)];
              reg37 <= {((reg9[(4'h9):(4'h8)] ?
                          (^~$signed((8'hba))) : (((8'h9f) ?
                              reg36 : reg33) - $unsigned(reg9))) ?
                      (reg39[(4'hc):(3'h7)] ?
                          wire2[(3'h7):(3'h7)] : ((+reg24) ?
                              $signed(reg26) : ((8'ha8) ?
                                  reg24 : wire4))) : $unsigned(reg10)),
                  reg21[(3'h5):(3'h5)]};
              reg38 <= ((8'hb8) ?
                  (^~(wire3 <= wire1[(1'h0):(1'h0)])) : ((8'hb1) ?
                      (~reg39) : (~&$unsigned((|reg39)))));
            end
          reg39 <= reg29;
          reg40 <= ($unsigned((|(7'h43))) ?
              (&$signed((|$unsigned((8'ha9))))) : $unsigned(($unsigned((^~wire2)) == (reg10[(2'h3):(2'h3)] - reg8))));
        end
      reg41 <= wire5;
      reg42 <= $signed(((~&$signed((wire0 ?
          reg37 : reg9))) > {((reg39 <<< reg15) ?
              (reg15 - (7'h43)) : (^~reg39)),
          ({(8'hb3)} ? wire6[(4'hb):(4'hb)] : wire3[(5'h13):(2'h3)])}));
    end
  assign wire43 = reg33[(4'hb):(4'ha)];
  assign wire44 = $signed((8'hbe));
endmodule
