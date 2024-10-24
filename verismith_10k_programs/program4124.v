module top
#(parameter param24 = ((^~({(~(8'ha8))} <= ({(8'hbb), (8'h9d)} ? (8'h9d) : ((8'ha1) >> (8'hb0))))) && (^~{(^~(&(8'hba)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg4 = (1'h0);
  assign y = {wire11,
                 wire10,
                 wire9,
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
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {($unsigned(((!wire2) ?
              (wire3 ^~ wire0) : wire2)) && $unsigned(($signed(wire1) ?
              ((8'hbb) == wire0) : wire0[(3'h7):(3'h7)])))};
      reg5 <= (wire1 >= ({wire1[(3'h4):(1'h1)]} ?
          wire2[(3'h7):(1'h1)] : $signed(($signed(wire2) ?
              (wire3 >>> wire2) : (wire2 & wire1)))));
      reg6 <= {$signed((^~((reg4 >> (7'h44)) ?
              $unsigned(wire1) : $unsigned(wire0)))),
          wire3[(2'h2):(1'h1)]};
      reg7 <= (wire2[(4'hb):(4'ha)] ?
          reg4 : ((|($unsigned(wire2) & (8'hb4))) >> wire3));
      reg8 <= reg7;
    end
  assign wire9 = wire1;
  assign wire10 = ($signed($unsigned($unsigned((wire0 ? (7'h44) : wire9)))) ?
                      {wire0[(1'h1):(1'h0)],
                          (reg4 ?
                              (!((8'hb6) != reg4)) : $signed(wire2[(2'h2):(1'h1)]))} : $unsigned(((~&(wire0 >>> wire0)) >>> reg5)));
  assign wire11 = (~&$unsigned(reg4[(4'h8):(4'h8)]));
  always
    @(posedge clk) begin
      if (wire10)
        begin
          reg12 <= $unsigned(((~^(wire1 ?
              $unsigned(wire1) : $signed(reg6))) | wire2));
          if (((|$unsigned(wire9[(2'h2):(1'h0)])) * $signed((~^{wire1,
              reg5[(4'hf):(1'h1)]}))))
            begin
              reg13 <= (-wire9[(3'h5):(3'h4)]);
              reg14 <= ($signed((8'ha4)) ^~ ((+(((8'ha0) ?
                      (8'ha7) : reg7) >> reg12)) ?
                  $signed(reg13) : (~|((wire0 != wire0) >> {reg6, reg6}))));
              reg15 <= $signed((!(($signed(reg8) ? {reg6} : (~|reg4)) * (reg12 ?
                  ((8'hbd) == reg8) : $signed(reg6)))));
              reg16 <= $signed($signed(wire10));
              reg17 <= ({($unsigned((|(8'hb1))) ?
                          (wire11 ?
                              {wire3,
                                  reg5} : $signed(reg7)) : $unsigned((|reg13)))} ?
                  $signed(((~$unsigned(reg5)) ?
                      reg15[(2'h2):(1'h1)] : $signed({reg16}))) : ({(8'ha2),
                          ((~reg14) ? $unsigned(reg12) : (^~wire1))} ?
                      (wire0 & $unsigned($signed(wire11))) : ((^(-reg13)) ?
                          ((wire11 ^ wire11) ?
                              (wire1 ? reg8 : reg13) : (reg8 ?
                                  wire3 : wire0)) : ($unsigned(reg12) ^~ $unsigned((8'ha6))))));
            end
          else
            begin
              reg13 <= $unsigned(reg8[(2'h2):(1'h1)]);
              reg14 <= (({reg13[(1'h1):(1'h1)],
                      $signed($unsigned(wire2))} | ((~wire11) ?
                      $unsigned($unsigned(reg12)) : $signed((wire9 ~^ (8'had))))) ?
                  ((~|(-(wire9 ? reg4 : reg12))) ?
                      reg17 : ({(reg4 <<< (8'hbc))} << reg13[(2'h3):(1'h0)])) : reg8[(3'h5):(1'h1)]);
              reg15 <= $unsigned(reg12[(3'h4):(2'h3)]);
              reg16 <= $signed((($unsigned((reg7 * reg5)) >> reg6[(1'h0):(1'h0)]) ?
                  wire11[(4'h8):(3'h6)] : (($signed(wire0) ?
                          (reg12 ? reg17 : (8'hb7)) : (reg6 ?
                              (8'ha8) : wire11)) ?
                      (wire9[(1'h1):(1'h1)] ?
                          reg13 : $unsigned((8'hb5))) : (^~{reg8}))));
              reg17 <= reg15;
            end
          reg18 <= reg14;
          reg19 <= reg18;
        end
      else
        begin
          reg12 <= reg19[(5'h12):(4'hf)];
          if ($unsigned($unsigned((^~{(~reg19), (reg16 ? (7'h40) : wire9)}))))
            begin
              reg13 <= ($signed(wire0[(1'h1):(1'h0)]) + (8'ha7));
              reg14 <= $signed($signed((!($signed(reg14) != (!reg12)))));
              reg15 <= ($unsigned({((reg13 ? reg13 : reg13) ?
                          $unsigned(wire1) : $signed(reg7)),
                      {(wire1 << reg17), {(8'h9d)}}}) ?
                  $unsigned((((~|reg17) - (reg19 & reg19)) <<< $unsigned((^wire1)))) : (-$unsigned({$unsigned(wire2),
                      (-reg12)})));
              reg16 <= $signed((~&(($signed(reg4) || reg7[(3'h4):(1'h1)]) ?
                  (reg5 + $unsigned((7'h44))) : reg7[(2'h2):(2'h2)])));
              reg17 <= wire11[(3'h4):(1'h0)];
            end
          else
            begin
              reg13 <= $signed($unsigned((|$signed($signed(reg14)))));
              reg14 <= $signed((~|$unsigned($signed((reg16 == (8'hb4))))));
              reg15 <= reg6[(3'h4):(1'h0)];
            end
          reg18 <= (~($unsigned(wire10) ?
              $unsigned(wire2[(4'hb):(2'h3)]) : (wire3 <= $signed((reg12 > (8'hb6))))));
          reg19 <= $signed(wire11);
          reg20 <= (~((8'ha4) - ((^(^~reg5)) < ((wire10 <<< reg7) <= (reg12 && reg16)))));
        end
      reg21 <= $signed(wire10);
      reg22 <= reg7[(4'h9):(1'h1)];
      reg23 <= wire9;
    end
endmodule
