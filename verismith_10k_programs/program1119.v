module top
#(parameter param21 = ((^{{{(8'hb4)}}}) <<< ({(^~((8'hb3) ? (7'h42) : (8'hbe)))} ? ((|((8'had) | (8'hbf))) ? ((-(7'h41)) & (~&(8'h9e))) : {((8'hb0) && (8'ha3))}) : {((^(8'hb8)) ? ((8'ha0) ? (8'hb3) : (8'ha2)) : ((8'hb2) >>> (8'hb9)))})), 
parameter param22 = ((param21 ? ((^(param21 ? param21 : param21)) >>> ((param21 >>> param21) & param21)) : ((~^(~&param21)) ? ((^param21) ? (param21 ? (8'hae) : (8'h9d)) : (^~param21)) : param21)) ? {param21} : param21))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  assign y = {wire20,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = wire1;
  assign wire6 = $unsigned((-(^~$unsigned((~wire1)))));
  assign wire7 = (|(-{({wire5, (8'hb0)} ? wire0 : ((8'ha7) ? (8'haf) : wire3)),
                     ($signed(wire0) >> (wire3 || wire5))}));
  always
    @(posedge clk) begin
      if (($signed($signed(wire6)) ?
          {$unsigned((wire4[(4'ha):(2'h2)] ~^ wire0))} : wire3))
        begin
          reg8 <= wire6[(4'hc):(4'ha)];
          if ((^~$signed($unsigned($unsigned($signed(wire2))))))
            begin
              reg9 <= (-{((wire0 ^ (wire2 <= wire4)) << ($signed(wire0) ?
                      {wire3} : $unsigned(wire3))),
                  $signed(wire1[(4'he):(4'h8)])});
              reg10 <= wire4;
              reg11 <= {(wire2 * {$unsigned(wire6[(4'hd):(4'h9)])}),
                  (($signed(reg8) + ({wire7} >> (reg8 ?
                      wire2 : (8'ha5)))) + (((reg10 ? wire7 : reg9) >> (reg9 ?
                          wire5 : wire4)) ?
                      {{wire1, wire1}} : $unsigned(wire0)))};
            end
          else
            begin
              reg9 <= (reg8[(1'h0):(1'h0)] ?
                  ((wire4[(4'ha):(3'h4)] ? ((&reg11) >> (!wire2)) : (8'hbd)) ?
                      (^~{((8'hbd) ^ reg11)}) : $unsigned({wire3[(3'h4):(2'h2)],
                          (!wire5)})) : (wire7 ?
                      $signed($signed(wire7[(2'h3):(1'h0)])) : $unsigned($signed($signed(wire3)))));
              reg10 <= wire0[(4'hb):(4'ha)];
              reg11 <= reg8;
              reg12 <= $unsigned($signed($unsigned(((wire5 == reg9) ?
                  (-(8'ha7)) : $signed((8'h9d))))));
              reg13 <= $signed($signed((&wire6)));
            end
          reg14 <= ($signed({wire4[(3'h6):(3'h4)],
              $signed((+reg12))}) == (^~{(+$unsigned(wire7))}));
          reg15 <= $signed($unsigned(($unsigned((wire5 ^ wire4)) ?
              (&(reg12 >>> reg13)) : $unsigned(reg10[(2'h3):(1'h1)]))));
          if (reg10[(2'h2):(1'h0)])
            begin
              reg16 <= $unsigned((~|(((wire4 ?
                      reg9 : wire7) ~^ (wire1 > wire3)) ?
                  $unsigned((|reg10)) : $signed($signed(reg10)))));
              reg17 <= $unsigned((($unsigned(reg9[(3'h4):(3'h4)]) ?
                      ((reg11 ?
                          wire3 : reg10) * {wire2}) : (&$unsigned(reg10))) ?
                  $signed($signed(reg16[(1'h1):(1'h0)])) : reg15));
              reg18 <= ((!(wire3 & {wire7[(1'h1):(1'h0)]})) ?
                  (+(($signed(wire7) ?
                      (wire4 ?
                          (8'ha8) : wire5) : (wire2 + wire1)) ^~ wire1)) : (~|wire5[(2'h2):(1'h0)]));
              reg19 <= reg17[(3'h6):(1'h1)];
            end
          else
            begin
              reg16 <= {wire5[(3'h6):(3'h4)]};
              reg17 <= wire5;
              reg18 <= $unsigned((reg19 ?
                  (-($signed(wire4) >= (8'hac))) : (!((~&wire2) != (wire7 ?
                      wire1 : reg11)))));
            end
        end
      else
        begin
          if ({reg12[(1'h0):(1'h0)]})
            begin
              reg8 <= (((^~(^~$unsigned(reg19))) ?
                  reg10 : (~{(8'hbd)})) > (!reg18[(4'h9):(3'h6)]));
              reg9 <= (-(&($signed(reg16) >> $unsigned((reg10 ?
                  reg15 : wire7)))));
              reg10 <= ((7'h42) * (reg16[(1'h1):(1'h0)] ?
                  ($signed((wire5 ?
                      wire7 : (8'ha5))) << wire0[(1'h0):(1'h0)]) : (($unsigned(wire7) ?
                      (wire3 && reg11) : wire2[(4'h8):(3'h7)]) <= (reg14[(3'h5):(3'h5)] ~^ (wire6 >>> reg12)))));
              reg11 <= $unsigned($unsigned((^wire5)));
            end
          else
            begin
              reg8 <= $signed(wire0);
              reg9 <= reg18[(5'h11):(4'hc)];
              reg10 <= (+$signed((({wire4, (8'h9c)} ?
                  (~|reg15) : reg8[(4'h8):(2'h2)]) ~^ reg12)));
              reg11 <= ({reg9[(5'h11):(3'h6)],
                      $unsigned($signed({reg9, wire2}))} ?
                  (!((&$unsigned(wire5)) ^ reg19)) : wire5);
              reg12 <= reg9;
            end
          if (($unsigned((reg9 ?
                  ($signed(wire6) >>> (reg8 ?
                      reg15 : reg12)) : ((8'ha8) < $unsigned(reg15)))) ?
              reg8[(4'h9):(2'h3)] : (((~^(^wire0)) ?
                      ((reg17 + reg12) ?
                          $signed(wire4) : $signed((8'ha1))) : (~&$unsigned(reg11))) ?
                  reg10 : wire7)))
            begin
              reg13 <= $signed((8'ha8));
              reg14 <= {reg10[(2'h3):(1'h0)],
                  {{$signed(wire7[(3'h6):(3'h4)]),
                          ($unsigned(reg14) ? wire7[(5'h12):(1'h1)] : wire4)}}};
            end
          else
            begin
              reg13 <= reg11;
              reg14 <= $signed(($unsigned((+reg13)) != (~&$signed((8'ha8)))));
              reg15 <= wire4;
              reg16 <= (reg14 >= ({(reg15 < (!wire6))} ?
                  (~((~wire1) ? {wire2} : reg19[(3'h4):(1'h0)])) : {(8'hba),
                      reg18}));
              reg17 <= wire4[(4'h8):(3'h5)];
            end
          reg18 <= (($signed(reg9) ?
                  (wire7[(1'h0):(1'h0)] ?
                      reg13 : {reg16,
                          $unsigned(reg13)}) : $unsigned((reg13[(3'h4):(2'h2)] >>> wire5[(3'h4):(1'h1)]))) ?
              reg9 : reg18);
          reg19 <= wire0[(1'h0):(1'h0)];
        end
    end
  assign wire20 = (8'hb5);
endmodule
