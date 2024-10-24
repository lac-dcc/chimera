module top
#(parameter param41 = (^(({((8'ha2) | (8'haa)), ((8'hbb) ? (8'hb5) : (8'hb0))} ? (((8'hb2) || (8'hb5)) < (!(8'hbc))) : (~^(~|(8'h9d)))) ? (~|{((8'hb0) ? (8'hb1) : (8'hab))}) : ({(^(8'hbc)), ((8'hae) ^ (8'hbb))} ? {(~^(8'hba))} : (((7'h40) ? (8'ha4) : (8'ha4)) ? ((8'ha3) <= (8'hae)) : (~|(7'h43)))))), 
parameter param42 = (({(param41 << (&param41)), param41} ? ((^~(param41 ? (8'hb1) : param41)) ? ((param41 ? param41 : param41) | (|param41)) : param41) : (param41 << {((8'hb8) ? param41 : param41)})) ? (({param41} ? ((~&param41) ? param41 : param41) : ((param41 || param41) & (|(8'h9c)))) && {((^~param41) ^ (~param41)), (~^(param41 > param41))}) : (param41 & (~|{{param41, param41}, param41}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1cd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(4'h9):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire4,
                 reg35,
                 reg34,
                 reg33,
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
  assign wire4 = wire1[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (wire3[(2'h2):(1'h0)])
        begin
          if ($signed((!$unsigned(((wire2 ?
              wire0 : wire1) | $unsigned(wire1))))))
            begin
              reg5 <= $unsigned(wire3);
              reg6 <= $unsigned((wire3[(1'h0):(1'h0)] && {(~&(wire0 <<< (8'hba))),
                  (wire0[(4'hd):(4'h8)] ?
                      wire1[(1'h0):(1'h0)] : wire4[(5'h11):(3'h5)])}));
              reg7 <= ((wire3[(1'h0):(1'h0)] > (|$unsigned($signed(wire0)))) ?
                  (wire1 <<< reg5[(4'ha):(3'h5)]) : {wire2, reg5});
              reg8 <= ($unsigned(($signed(wire4) ?
                  wire4 : $unsigned($signed(reg5)))) >> (+(($unsigned(reg5) ?
                      (wire0 < wire1) : wire0[(3'h4):(3'h4)]) ?
                  (wire2 ? (wire3 >>> reg6) : (|reg7)) : (((8'had) | (8'haa)) ?
                      $signed((8'ha5)) : (wire2 ~^ wire4)))));
            end
          else
            begin
              reg5 <= {($unsigned($signed(wire2[(2'h2):(2'h2)])) << ((reg6 < {(8'ha9),
                          (7'h44)}) ?
                      ((reg8 ?
                          reg5 : wire0) <<< $signed(wire4)) : ($unsigned(wire1) >>> $unsigned((8'hb0))))),
                  {wire4}};
              reg6 <= ((wire2 ?
                  {reg5[(4'ha):(3'h4)]} : (^(wire4 ?
                      {(8'hb5)} : $signed(reg5)))) & ($signed(($signed(reg7) && wire2)) >= reg6));
              reg7 <= (!wire4);
            end
          reg9 <= reg6;
          reg10 <= $signed(reg8[(3'h6):(3'h5)]);
        end
      else
        begin
          if ((8'hbd))
            begin
              reg5 <= (reg5 & reg5);
              reg6 <= {wire0[(4'hd):(3'h6)]};
              reg7 <= $unsigned($signed((wire1[(2'h2):(1'h1)] ?
                  $unsigned(reg8[(3'h7):(3'h5)]) : (~(wire4 ? reg6 : reg6)))));
              reg8 <= wire2;
              reg9 <= $signed(wire4[(1'h0):(1'h0)]);
            end
          else
            begin
              reg5 <= $unsigned(wire1[(1'h1):(1'h1)]);
            end
          reg10 <= $signed((^(~^$signed($unsigned(reg7)))));
          if ($unsigned((((~reg10[(3'h4):(3'h4)]) < ($unsigned(wire4) << (8'ha5))) ?
              $signed({$unsigned(wire2),
                  $unsigned(wire3)}) : wire4[(3'h4):(2'h3)])))
            begin
              reg11 <= ({reg8[(5'h14):(3'h5)],
                  wire2} ^ ($unsigned($unsigned({(8'ha8),
                  (7'h44)})) || reg9[(1'h0):(1'h0)]));
              reg12 <= $signed($signed(((reg6 + {wire4, wire3}) ?
                  (wire1 ?
                      (wire4 ?
                          reg8 : (8'hac)) : (^~wire0)) : $unsigned($unsigned(wire2)))));
              reg13 <= (($signed($signed($signed(reg12))) < {($unsigned(wire4) ?
                          $unsigned((8'hab)) : {reg10, reg5})}) ?
                  reg9[(1'h0):(1'h0)] : (($unsigned($unsigned(reg11)) ?
                          ($signed(wire4) ? $signed(reg11) : reg8) : wire1) ?
                      $signed(((wire4 ? wire2 : reg7) ?
                          {(7'h43), (7'h44)} : reg8)) : (^~((~&reg8) ?
                          (^reg9) : (^wire1)))));
            end
          else
            begin
              reg11 <= $signed(($signed($unsigned(wire1[(1'h0):(1'h0)])) ?
                  (|$signed(reg5[(3'h5):(2'h3)])) : ((&reg7[(1'h0):(1'h0)]) ?
                      ($unsigned((8'hb9)) ?
                          (-wire0) : ((8'hb9) ?
                              reg7 : reg12)) : $unsigned(reg12))));
              reg12 <= reg7;
              reg13 <= $unsigned(((8'h9f) ?
                  reg8[(4'he):(4'hc)] : ((reg13 ?
                      reg11 : (reg5 ? reg13 : (7'h41))) ^ $unsigned(reg10))));
            end
          reg14 <= ((reg6 <<< $unsigned(reg7[(2'h2):(2'h2)])) ?
              (~^wire4) : ($signed(((wire0 ? (8'h9d) : reg5) << {wire4,
                  reg12})) >= $unsigned($signed($signed(reg9)))));
          reg15 <= (~|$signed($unsigned(($unsigned((8'hba)) ?
              $signed(reg11) : $unsigned(reg6)))));
        end
      reg16 <= reg5[(1'h0):(1'h0)];
      reg17 <= {$signed((~|$signed((reg13 <<< wire4))))};
      if ((^~((reg12 && wire3) ?
          reg11[(3'h6):(2'h2)] : ($unsigned(reg11) == {$signed(wire3),
              $signed(reg9)}))))
        begin
          if (reg14[(2'h2):(1'h1)])
            begin
              reg18 <= $signed((((8'hb8) ?
                  reg7[(1'h1):(1'h0)] : (wire0[(4'hb):(3'h7)] || reg10[(4'h9):(2'h2)])) & $unsigned($unsigned(wire0))));
              reg19 <= (&wire2[(4'h9):(4'h8)]);
              reg20 <= wire2;
            end
          else
            begin
              reg18 <= (-(reg15[(3'h5):(3'h4)] ?
                  $unsigned((+((8'ha8) ?
                      reg6 : (8'haa)))) : ({$unsigned((8'hb7))} ?
                      (~|$unsigned(reg8)) : reg16)));
              reg19 <= (^~$unsigned({$signed(((8'hae) ? wire2 : reg9))}));
              reg20 <= (($signed((^reg10)) ^ {reg9[(1'h1):(1'h0)]}) - ($unsigned($signed({wire3,
                  reg14})) < {$unsigned({wire4}), reg20[(5'h10):(3'h5)]}));
              reg21 <= (reg13[(3'h5):(3'h4)] ?
                  ($unsigned(($signed(reg14) ?
                          reg10[(1'h0):(1'h0)] : $signed(reg10))) ?
                      wire1 : wire3) : $unsigned((wire4 ?
                      $unsigned($unsigned(wire3)) : $unsigned($signed(reg8)))));
              reg22 <= reg21;
            end
          reg23 <= $signed($unsigned(reg17));
        end
      else
        begin
          if (reg15)
            begin
              reg18 <= ((!reg19) && $unsigned(((~(reg9 & reg5)) ?
                  wire1 : $unsigned((~^reg7)))));
              reg19 <= (&(+reg10));
              reg20 <= $signed($signed($unsigned($signed($signed(reg20)))));
            end
          else
            begin
              reg18 <= (~^$unsigned($unsigned((|((8'ha6) << reg11)))));
              reg19 <= reg10;
              reg20 <= $unsigned({(((reg6 ? reg23 : wire3) ?
                      (wire3 != reg19) : {wire3}) << wire0[(5'h10):(4'h9)]),
                  ((-(reg9 ? wire3 : reg7)) ?
                      $signed($unsigned(reg12)) : $signed((reg23 ?
                          reg11 : reg22)))});
            end
          if (reg13[(4'ha):(4'ha)])
            begin
              reg21 <= reg6;
              reg22 <= (wire3[(1'h0):(1'h0)] ?
                  reg15 : $unsigned((reg5[(4'h9):(4'h8)] - (|$unsigned(reg17)))));
              reg23 <= $unsigned(((~&$unsigned({wire4})) <= $unsigned(reg16[(4'hd):(2'h3)])));
              reg24 <= $unsigned(($unsigned(reg16[(3'h6):(3'h5)]) != (8'ha6)));
              reg25 <= reg15;
            end
          else
            begin
              reg21 <= (~wire2);
              reg22 <= reg5[(1'h0):(1'h0)];
              reg23 <= ((!{$unsigned(reg6[(4'hb):(2'h3)])}) > (|reg17[(4'h9):(4'h9)]));
            end
          reg26 <= ($signed(({reg16[(4'hd):(1'h0)]} ?
              $signed((wire3 ? reg20 : reg20)) : $unsigned((reg6 ?
                  reg9 : reg11)))) - $unsigned(wire3[(3'h6):(1'h0)]));
        end
      reg27 <= wire4;
    end
  assign wire28 = $signed((8'hb8));
  assign wire29 = ($signed(reg21[(1'h1):(1'h0)]) && (~reg15));
  assign wire30 = (&(&{$unsigned(wire2[(5'h11):(1'h1)]),
                      ($signed(reg14) ? (~reg25) : (reg12 - reg23))}));
  assign wire31 = $signed(({wire4,
                          ((|reg5) ? $unsigned(reg12) : reg10[(2'h2):(1'h1)])} ?
                      {({reg12} ? {reg18, reg6} : reg12[(3'h7):(2'h2)]),
                          (^$unsigned(reg9))} : (reg25 << (&(^(8'hba))))));
  assign wire32 = ((~(($signed((8'hbf)) ? $unsigned(wire30) : (|wire2)) ?
                      {$signed(reg21)} : $signed($signed(reg15)))) && (8'hbb));
  always
    @(posedge clk) begin
      reg33 <= reg16;
      reg34 <= (reg6 - ($unsigned(reg16) * reg18[(3'h5):(1'h1)]));
      reg35 <= reg7;
    end
  assign wire36 = reg13;
  assign wire37 = $signed(({reg24[(4'hb):(2'h3)],
                      ($signed(reg35) << (reg22 | reg26))} << $unsigned($unsigned(((8'hbe) ?
                      wire29 : reg20)))));
  assign wire38 = $unsigned(reg8);
  assign wire39 = reg7[(1'h0):(1'h0)];
  assign wire40 = (^~(($signed($unsigned((8'hba))) >= (8'ha6)) ^~ $signed(reg10)));
endmodule
