module top
#(parameter param26 = (^((8'ha8) ? ({(^~(8'hba)), ((8'h9d) + (8'h9c))} ? (&((8'hba) | (8'hbc))) : (8'hbe)) : {(((8'ha6) ? (8'h9d) : (8'h9e)) >= ((8'hb0) ? (8'ha3) : (8'hb1)))})), 
parameter param27 = (param26 - param26))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(5'h11):(1'h0)] reg4 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
      reg4 <= ($signed($signed($unsigned((~wire0)))) ?
          (wire0[(2'h2):(1'h0)] ^ wire3[(3'h7):(3'h4)]) : (wire0 ?
              $signed(wire1) : ({$unsigned((8'ha3)), {(8'ha8), wire0}} ?
                  ($unsigned(wire0) != wire3) : (wire1 * {wire3, wire3}))));
      reg5 <= $unsigned((&(((wire0 <= wire2) ?
          $unsigned(wire1) : wire2) << $unsigned((+(8'haf))))));
      reg6 <= ($unsigned(($signed(reg5[(4'h9):(2'h2)]) ?
          (wire1 ^~ wire0) : (^~(wire1 <= reg4)))) || ($unsigned($signed((wire2 * reg5))) ?
          wire3 : wire0[(1'h1):(1'h1)]));
      reg7 <= $signed(wire2);
      if ((reg7 ? (^{{(^wire0)}}) : wire1))
        begin
          if ($signed($unsigned(reg4[(3'h5):(1'h0)])))
            begin
              reg8 <= {wire1[(4'h8):(1'h1)],
                  (~$signed((&(wire0 ? (8'ha8) : wire2))))};
              reg9 <= (^~$signed($unsigned((!(wire1 ? wire0 : reg5)))));
              reg10 <= $signed({(~|$signed(((8'h9e) ? wire3 : wire2))),
                  $unsigned((^~wire3[(3'h6):(2'h3)]))});
              reg11 <= reg10;
              reg12 <= (($unsigned($signed((^(8'hb3)))) ?
                  ({$signed(wire0)} ?
                      (&((8'hae) << reg10)) : $signed(reg4[(3'h6):(3'h6)])) : ((wire1[(1'h0):(1'h0)] && reg7[(4'hb):(4'h8)]) ?
                      $signed(wire2[(2'h3):(2'h2)]) : (+reg8[(1'h1):(1'h1)]))) < ((^~$unsigned((reg10 + reg11))) || (reg8 ^ (8'hba))));
            end
          else
            begin
              reg8 <= wire1[(3'h5):(3'h5)];
              reg9 <= (^~reg5[(4'he):(4'h9)]);
              reg10 <= $signed(reg5[(4'ha):(3'h5)]);
            end
          reg13 <= (~&((({(8'hbf)} ?
              $signed(wire3) : (wire3 ?
                  (8'hab) : reg12)) << (reg6[(3'h6):(3'h6)] & reg8)) <= (wire1 ~^ $signed($signed(reg9)))));
          reg14 <= (^reg4);
          reg15 <= {(~|({(reg14 >> reg4)} ~^ wire2[(3'h6):(3'h6)]))};
        end
      else
        begin
          reg8 <= reg9[(5'h11):(4'h8)];
          if (reg15[(1'h0):(1'h0)])
            begin
              reg9 <= (-$signed($signed({reg10[(5'h11):(2'h2)],
                  (wire1 ? reg5 : reg9)})));
              reg10 <= $signed($unsigned(reg5));
              reg11 <= $unsigned(wire3[(1'h0):(1'h0)]);
              reg12 <= (8'ha8);
            end
          else
            begin
              reg9 <= (&$unsigned((reg10[(1'h1):(1'h0)] != (8'h9c))));
              reg10 <= reg15;
              reg11 <= $signed((($unsigned((wire3 ^ reg10)) ?
                  reg5 : reg6[(4'h8):(4'h8)]) < reg15[(4'h9):(2'h3)]));
              reg12 <= ((&(+((~&reg5) ? $signed(wire1) : reg4))) ?
                  ($signed((~$signed(wire1))) ?
                      wire0 : $unsigned($signed(reg14[(1'h0):(1'h0)]))) : ((^(wire1 ?
                      reg13[(3'h6):(3'h5)] : wire2[(3'h4):(1'h1)])) * $unsigned($unsigned($signed(reg7)))));
              reg13 <= (^reg5);
            end
          reg14 <= (wire1 | {$signed((&reg10[(3'h6):(3'h4)]))});
          reg15 <= ($unsigned((-(8'ha8))) ?
              $unsigned($signed($signed($signed((8'hb6))))) : (reg6 ?
                  wire0[(3'h6):(3'h5)] : (7'h40)));
          if ((($unsigned(($signed(wire0) ? (~wire0) : reg12)) ?
              (|(~|(8'hb8))) : (((wire2 >>> reg14) ?
                      reg12[(4'ha):(4'ha)] : $unsigned(reg10)) ?
                  $signed($signed(reg12)) : reg13[(2'h3):(2'h3)])) ~^ ((((^reg6) ?
                  (reg13 << wire1) : reg6[(3'h7):(1'h0)]) ?
              reg10[(4'ha):(1'h0)] : wire1[(1'h1):(1'h0)]) >>> wire3[(4'hb):(2'h2)])))
            begin
              reg16 <= reg14[(1'h1):(1'h1)];
            end
          else
            begin
              reg16 <= $signed((8'ha7));
              reg17 <= $signed(reg9);
              reg18 <= (reg17[(2'h2):(2'h2)] ?
                  ((reg8[(3'h4):(2'h3)] ~^ ({(8'hbd)} >= (~&reg11))) ?
                      (^reg7) : $unsigned((8'hac))) : ((!reg17[(4'h9):(2'h2)]) ?
                      $unsigned(($signed((8'ha7)) ?
                          wire2 : wire2)) : (-(8'hb9))));
              reg19 <= (($signed($unsigned((~|wire0))) ?
                      reg6[(3'h5):(2'h3)] : (-wire3[(3'h5):(3'h5)])) ?
                  $unsigned($signed(((~&reg11) >> reg15))) : (reg18[(5'h14):(5'h11)] ?
                      ($unsigned((reg12 ? (8'hbe) : (8'haa))) ?
                          wire2 : (reg18 ~^ (~reg7))) : $unsigned(($signed(reg4) ?
                          wire3[(4'hc):(4'h9)] : reg7))));
              reg20 <= {wire2[(3'h5):(1'h1)]};
            end
        end
    end
  assign wire21 = {$signed(($unsigned($unsigned(reg13)) == $unsigned((wire0 ?
                          reg20 : reg17))))};
  assign wire22 = $unsigned($signed($unsigned(((wire3 >> wire1) >= $unsigned(reg20)))));
  assign wire23 = $unsigned((reg9[(4'h8):(4'h8)] ?
                      (reg18 - (reg7[(3'h6):(3'h5)] <= $signed((8'ha1)))) : ($signed(wire22) ?
                          (^$signed(reg12)) : reg19)));
  assign wire24 = (((~&($signed(reg4) - reg10)) ?
                          (|((reg11 ?
                              wire0 : (8'hb7)) || reg17)) : (({reg7} - $signed(reg18)) || reg6[(4'h8):(2'h3)])) ?
                      (!reg10[(1'h1):(1'h0)]) : $signed($unsigned((~|(reg12 ?
                          wire23 : reg12)))));
  assign wire25 = $signed($unsigned((8'hb6)));
endmodule
