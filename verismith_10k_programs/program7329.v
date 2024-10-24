module top
#(parameter param32 = {(~^(~&((~&(8'haa)) || (~&(8'ha3))))), (((((8'ha4) > (8'ha2)) ? {(8'hb8)} : ((8'hbe) >> (8'hba))) ? (~(^(8'ha5))) : ((~(7'h41)) * ((8'hae) | (8'h9c)))) ? (!{(~(8'hae))}) : (~|{((8'hb1) ? (8'ha2) : (8'hb1))}))}, 
parameter param33 = (&(((((8'hb3) ? param32 : param32) ^ param32) + (((8'hac) <<< param32) + {param32})) ? (8'haf) : param32)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire5,
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
                 (1'h0)};
  assign wire5 = wire4[(4'hb):(4'ha)];
  always
    @(posedge clk) begin
      if ((^wire0))
        begin
          reg6 <= {{$unsigned($unsigned(wire5[(3'h4):(2'h2)])),
                  (wire5 ?
                      (~^(wire2 ? wire0 : (8'ha2))) : wire1[(1'h1):(1'h0)])}};
          reg7 <= $unsigned({wire1[(3'h4):(3'h4)]});
          if (wire4)
            begin
              reg8 <= wire5;
              reg9 <= (((~|$signed(wire3)) != (wire3[(4'he):(3'h7)] ?
                      reg6[(5'h13):(4'h9)] : wire5)) ?
                  $unsigned($unsigned(((^reg8) ?
                      $signed(wire5) : wire4))) : ((~&$signed($unsigned(wire0))) ?
                      ((wire4[(1'h0):(1'h0)] ?
                              $unsigned(reg7) : $signed(wire1)) ?
                          wire3[(3'h5):(3'h5)] : ((!reg6) == (reg7 <<< wire4))) : ($signed($signed(reg6)) ^ wire4)));
              reg10 <= $unsigned($signed(((^(reg7 ^ wire3)) ?
                  $signed($unsigned(reg7)) : (!(reg8 ? reg6 : (8'hae))))));
            end
          else
            begin
              reg8 <= $signed(($unsigned(wire0[(4'hb):(4'hb)]) ?
                  ((reg6[(1'h0):(1'h0)] ? $signed((8'hb2)) : (reg9 || reg7)) ?
                      ((reg8 && wire2) | $signed((8'haa))) : $signed((wire3 ?
                          wire5 : (8'hb2)))) : ((~{wire2}) != ((!reg7) ?
                      reg10[(3'h7):(1'h1)] : $signed((8'ha1))))));
              reg9 <= (~(~|wire4[(3'h4):(1'h0)]));
              reg10 <= {$unsigned($signed($signed((reg9 ? wire3 : wire3)))),
                  wire4};
              reg11 <= $signed($signed(wire5[(2'h2):(1'h1)]));
              reg12 <= $signed($signed(($unsigned((reg11 ? wire1 : reg9)) ?
                  (~^reg10[(4'hf):(1'h0)]) : $unsigned($signed(reg11)))));
            end
          if (wire0)
            begin
              reg13 <= ($signed((reg12[(1'h0):(1'h0)] == reg9)) ?
                  (wire0[(4'hb):(2'h2)] ?
                      ((!wire0) < wire1[(3'h6):(3'h6)]) : (((wire5 || wire4) ?
                          (~(7'h41)) : {reg11,
                              wire3}) >= reg8)) : ((~(^wire2)) > (~|(^~(wire0 ?
                      reg9 : (8'hb5))))));
              reg14 <= reg12;
              reg15 <= $signed({((((8'ha1) ? (8'hb6) : (8'ha4)) ?
                          {reg13, wire5} : $unsigned(reg9)) ?
                      (~|((8'hb0) << reg13)) : (^wire2)),
                  (-{reg12[(2'h2):(2'h2)], $signed(reg12)})});
            end
          else
            begin
              reg13 <= $signed((~&($signed($unsigned(reg12)) ~^ (8'ha1))));
              reg14 <= reg11[(3'h5):(3'h4)];
            end
        end
      else
        begin
          reg6 <= (^~(($unsigned($unsigned(wire1)) ?
                  ((wire1 ? reg15 : wire1) ?
                      (&wire5) : reg6) : reg12[(1'h0):(1'h0)]) ?
              $unsigned((reg8[(3'h6):(3'h4)] && reg6[(4'hb):(1'h0)])) : reg7[(4'hf):(3'h4)]));
          reg7 <= reg14[(3'h7):(3'h7)];
          reg8 <= (8'ha9);
        end
      reg16 <= (+$unsigned((-$unsigned((reg15 ? (8'hb9) : wire0)))));
      reg17 <= $unsigned((^(+(&(wire5 ? reg6 : reg9)))));
      reg18 <= $unsigned((&((!wire3[(3'h5):(1'h1)]) + ({wire5} & {reg8,
          (8'hae)}))));
    end
  always
    @(posedge clk) begin
      if ((reg11[(2'h3):(1'h0)] ?
          (((~&wire0[(3'h4):(1'h0)]) ?
              reg13[(4'ha):(3'h4)] : (~^(8'ha3))) >> $signed(($unsigned((8'haa)) ?
              $unsigned(reg8) : (reg14 ?
                  reg13 : wire2)))) : $signed($signed(reg18[(1'h1):(1'h0)]))))
        begin
          if ({reg17})
            begin
              reg19 <= $unsigned(reg15);
              reg20 <= (~$unsigned((reg11[(1'h1):(1'h1)] - $unsigned(reg8))));
            end
          else
            begin
              reg19 <= $signed($unsigned((reg20 != {(wire4 || reg13),
                  $signed(reg11)})));
              reg20 <= $unsigned(($unsigned(($signed((8'ha7)) ?
                      wire2[(2'h3):(2'h2)] : (wire0 ? reg19 : (8'ha7)))) ?
                  (~^((&reg19) | $unsigned(reg17))) : $signed(reg13[(2'h3):(2'h3)])));
            end
          reg21 <= reg13[(2'h2):(2'h2)];
          reg22 <= (~reg16[(4'hc):(3'h6)]);
        end
      else
        begin
          if ({$unsigned($signed($signed(reg15)))})
            begin
              reg19 <= reg12[(1'h1):(1'h0)];
              reg20 <= ({reg7[(4'hf):(3'h7)]} <= ((^reg11[(1'h0):(1'h0)]) ?
                  ($unsigned(wire5) ?
                      reg22 : ((!reg10) * $unsigned(reg21))) : (8'h9d)));
              reg21 <= $unsigned((!(reg11[(2'h2):(2'h2)] ?
                  $signed(reg11[(3'h6):(3'h6)]) : reg16)));
            end
          else
            begin
              reg19 <= $unsigned((~|reg17[(4'h8):(4'h8)]));
              reg20 <= reg10;
            end
          reg22 <= $unsigned((8'h9d));
          reg23 <= ((~&reg15) ^ $signed(($signed(reg7) ?
              (reg9 ?
                  ((8'ha0) << reg19) : reg21[(3'h7):(3'h4)]) : (wire0[(3'h7):(3'h7)] & $unsigned((8'ha6))))));
          reg24 <= ($signed($signed($unsigned($unsigned(wire0)))) ?
              ((((wire3 >= reg18) ?
                      reg23[(3'h5):(3'h5)] : (reg15 || wire2)) < $unsigned($signed(wire4))) ?
                  (reg12[(2'h2):(2'h2)] ?
                      $unsigned($unsigned(wire4)) : ($signed(wire0) ?
                          reg9 : reg20[(3'h6):(1'h1)])) : $signed(($unsigned(reg9) < $unsigned(reg15)))) : ($unsigned(wire0[(4'ha):(3'h7)]) & $unsigned($signed(reg15[(2'h2):(1'h0)]))));
        end
      reg25 <= wire4[(1'h1):(1'h1)];
      reg26 <= reg10;
      if (wire1[(4'he):(3'h6)])
        begin
          reg27 <= wire0;
          reg28 <= $signed((|$signed($unsigned(wire4))));
        end
      else
        begin
          reg27 <= ({({((8'hbb) ? reg9 : wire0), reg28} ?
                  {$unsigned(reg12),
                      $unsigned(reg25)} : (reg8[(3'h4):(3'h4)] <<< (8'h9e))),
              {({reg27, wire0} ?
                      $signed(reg26) : (wire5 ?
                          reg22 : reg10))}} >= $signed((reg18 ?
              {(reg6 >> reg19)} : reg18)));
          reg28 <= reg21[(4'h8):(3'h5)];
        end
    end
  assign wire29 = (8'ha1);
  assign wire30 = reg22;
  assign wire31 = ($unsigned((reg24 ?
                          {(reg23 ? reg25 : wire30)} : (|$signed(reg25)))) ?
                      reg12 : $unsigned({reg7, $signed(reg25)}));
endmodule
