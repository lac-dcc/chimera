module top
#(parameter param41 = ({(+(((8'hac) > (7'h44)) >> (+(8'hbe))))} ? ((((+(7'h44)) * ((8'h9d) & (8'ha1))) >> ((8'hab) ? ((8'hac) < (8'hb6)) : ((8'ha2) ? (8'ha3) : (8'hb7)))) ~^ (^~{((8'ha2) ? (8'hb2) : (7'h42))})) : (((8'hb8) < {((8'had) ? (8'hb5) : (8'ha3)), ((8'hb0) ? (8'hbb) : (7'h42))}) ? {((+(8'hb5)) && ((8'hbe) ? (8'hac) : (8'hb8))), {((8'hae) ? (8'ha2) : (8'h9f)), ((8'ha1) ~^ (8'ha3))}} : {{((8'hbb) & (8'hb3)), {(8'hb9)}}, (8'hb2)})), 
parameter param42 = (((&((param41 ? (8'ha4) : param41) ? param41 : (param41 ^ param41))) ? (|{(8'hb6)}) : (^~{(param41 ? param41 : param41)})) == ((param41 >> (&(param41 ? param41 : param41))) - param41)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire15,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
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
                 reg14,
                 reg13,
                 reg12,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed($signed($signed(((wire1 ? wire3 : wire4) ?
                     wire2[(2'h2):(1'h0)] : wire1))));
  always
    @(posedge clk) begin
      reg6 <= wire2;
      reg7 <= $signed(((!((wire0 ? (7'h42) : wire4) ?
              (!wire0) : wire2[(3'h5):(3'h5)])) ?
          (wire2 ?
              wire4[(3'h5):(1'h0)] : $unsigned($unsigned(wire3))) : (((reg6 ?
                  (8'ha8) : (8'ha1)) ?
              (!reg6) : reg6) - (8'ha7))));
      reg8 <= $signed({(^~(wire5[(1'h0):(1'h0)] ^ {(8'h9c), reg7}))});
    end
  assign wire9 = (~{(^(|$unsigned(wire0))), reg7[(2'h2):(1'h1)]});
  assign wire10 = ((((reg8 ?
                          {reg6} : wire5[(1'h1):(1'h1)]) != $signed((8'hb5))) >> reg8[(1'h0):(1'h0)]) ?
                      (((~|{wire2}) ^~ ($unsigned((8'had)) || $unsigned(reg7))) && {$unsigned((wire9 >> wire0)),
                          wire2[(1'h0):(1'h0)]}) : $unsigned(($unsigned(wire3[(1'h1):(1'h1)]) ?
                          (~&(-(8'ha3))) : $unsigned(reg8))));
  assign wire11 = (wire5[(2'h3):(1'h1)] | wire10);
  always
    @(posedge clk) begin
      if (((wire4 ? ((7'h43) ? reg6 : wire5) : wire4) != wire2[(2'h2):(1'h0)]))
        begin
          if ((8'hae))
            begin
              reg12 <= (+wire10[(3'h6):(3'h6)]);
            end
          else
            begin
              reg12 <= $signed(wire0[(3'h4):(1'h0)]);
            end
          reg13 <= (8'h9c);
        end
      else
        begin
          reg12 <= $unsigned(wire9[(5'h14):(4'hf)]);
        end
      reg14 <= $unsigned(($unsigned(reg6[(4'hf):(3'h6)]) ?
          reg12[(1'h0):(1'h0)] : (^~((~wire2) ?
              wire5[(1'h1):(1'h0)] : {wire1}))));
    end
  assign wire15 = ($unsigned(reg7[(4'ha):(3'h4)]) <= $unsigned((+$signed(wire2[(3'h6):(2'h2)]))));
  always
    @(posedge clk) begin
      reg16 <= reg7[(1'h0):(1'h0)];
      if ($unsigned($signed(wire2)))
        begin
          reg17 <= wire3[(4'h8):(3'h7)];
          if ($signed($signed($signed(wire0))))
            begin
              reg18 <= ({(wire1 - $unsigned(wire0)),
                  (((8'had) ^~ (reg13 ? wire3 : reg14)) ?
                      reg17 : wire10[(2'h3):(2'h2)])} <<< $unsigned((8'hb2)));
            end
          else
            begin
              reg18 <= (~|wire2[(3'h7):(3'h4)]);
              reg19 <= $unsigned((^{(&(wire9 ^~ wire3))}));
              reg20 <= reg16[(3'h5):(1'h0)];
              reg21 <= reg8;
              reg22 <= $signed(wire15);
            end
          reg23 <= wire11[(4'h9):(3'h4)];
          if (wire2[(3'h6):(3'h6)])
            begin
              reg24 <= (wire15 ?
                  wire4 : ({wire3[(4'h8):(2'h2)], $signed((~|reg22))} + wire0));
              reg25 <= {((|(~|$unsigned(reg19))) ?
                      $signed($unsigned({wire15, reg24})) : reg21),
                  ($unsigned(($unsigned(reg7) & $signed((8'hb0)))) ?
                      (((reg19 || reg18) ? reg21[(2'h2):(1'h0)] : {wire11}) ?
                          {{wire5, wire1},
                              wire15} : $unsigned((~&reg7))) : wire2[(3'h4):(1'h0)])};
              reg26 <= ($signed($signed(wire9)) <= $unsigned((~|$unsigned((wire2 ?
                  (8'ha9) : reg14)))));
              reg27 <= $signed(($signed(({reg19} > reg13)) <= ((-(+wire5)) | reg6[(1'h0):(1'h0)])));
            end
          else
            begin
              reg24 <= reg20;
            end
        end
      else
        begin
          reg17 <= $unsigned((8'hb2));
          reg18 <= ({(|wire5[(2'h2):(2'h2)]),
              ((^~$signed(wire11)) > wire4[(1'h1):(1'h1)])} ~^ ((reg22[(1'h0):(1'h0)] ?
                  reg26 : reg25) ?
              (reg27 ?
                  $unsigned(((8'hb3) ?
                      reg21 : wire10)) : (8'ha0)) : (&wire1[(3'h4):(1'h0)])));
        end
    end
  always
    @(posedge clk) begin
      reg28 <= reg12[(2'h2):(1'h0)];
      reg29 <= $unsigned((-$signed((+reg18))));
      if (reg20)
        begin
          reg30 <= ({reg28,
              (($unsigned(reg24) > $unsigned(reg29)) != (reg23[(3'h7):(3'h7)] & {wire1,
                  reg22}))} >>> reg12[(3'h5):(2'h3)]);
          reg31 <= ($unsigned(wire11[(3'h6):(3'h6)]) ^ reg7[(3'h6):(2'h3)]);
          reg32 <= (8'ha5);
          reg33 <= $unsigned($unsigned($unsigned($unsigned((reg6 ?
              (8'hac) : reg26)))));
        end
      else
        begin
          reg30 <= {$signed((7'h40)), reg7[(2'h2):(2'h2)]};
          if (wire2)
            begin
              reg31 <= ((reg18 ?
                  {$signed($unsigned(wire1))} : $signed((wire4 || ((8'ha7) ?
                      wire0 : reg8)))) <<< $signed({((~reg25) ?
                      (!wire0) : $unsigned(reg17)),
                  ((reg32 + reg22) ?
                      (reg18 ? wire1 : reg7) : $signed((8'h9f)))}));
              reg32 <= reg6;
            end
          else
            begin
              reg31 <= (((reg21 <= (+reg16)) - ($signed(reg6) ?
                  $unsigned((reg18 ? reg19 : wire3)) : (reg33[(4'h9):(3'h4)] ?
                      reg8[(1'h0):(1'h0)] : $unsigned(reg25)))) | $unsigned((^$unsigned((~^(8'haa))))));
              reg32 <= reg12;
            end
          if (reg27)
            begin
              reg33 <= (((8'hba) | (reg21[(1'h1):(1'h1)] ?
                      wire11 : $signed($unsigned(wire11)))) ?
                  (~&($signed($signed(reg28)) < (((8'hb2) ?
                      reg23 : reg21) <= (7'h43)))) : wire15[(4'hb):(1'h1)]);
            end
          else
            begin
              reg33 <= ((($signed($unsigned(wire4)) ?
                      $signed($signed(reg24)) : ((reg22 - reg23) | wire3)) <<< (+($unsigned(reg22) > wire0[(4'hc):(4'h8)]))) ?
                  ($signed(((reg20 ? wire2 : reg8) <= $signed(wire1))) ?
                      wire3 : {reg29[(3'h4):(2'h3)]}) : {(reg7[(3'h6):(3'h4)] ?
                          $unsigned({reg16}) : $signed($signed(reg33))),
                      (|((~|reg7) ? (reg18 ? reg13 : reg8) : $signed(reg20)))});
              reg34 <= (reg33 < (~(wire9[(5'h10):(3'h7)] >= (-(reg26 >>> reg25)))));
            end
          if ({($signed({reg21}) ~^ ((~&((8'ha8) ~^ reg14)) >>> reg20)),
              (-{(!$signed((8'ha3))), (&(wire15 > reg26))})})
            begin
              reg35 <= (((((reg26 ? reg14 : (8'hba)) ^~ (~&reg6)) & (!(reg7 ?
                          reg34 : (8'ha7)))) ?
                      $unsigned(((reg30 ? reg26 : wire1) | (reg34 ?
                          (8'hba) : reg25))) : ((((8'hae) <= wire4) ?
                          (reg24 && wire4) : $unsigned(reg26)) <= $signed((reg13 ?
                          reg13 : (8'ha5))))) ?
                  {$signed(reg17), reg17[(4'h8):(1'h1)]} : {(({(8'h9d)} ?
                              (^reg34) : (!reg24)) ?
                          $signed((wire1 | reg6)) : (reg26[(3'h7):(1'h0)] ?
                              (-wire11) : $unsigned(wire5)))});
            end
          else
            begin
              reg35 <= $unsigned(($unsigned(($unsigned(wire9) + ((8'ha5) ^ reg32))) >>> $unsigned(reg33[(1'h1):(1'h1)])));
              reg36 <= {(({wire2, {reg25}} ?
                      reg23 : (wire10 ?
                          $unsigned(wire2) : (reg19 <<< wire5))) >= ($signed((reg6 < wire10)) != (~|reg8[(2'h2):(2'h2)]))),
                  ((8'hb4) ?
                      ((wire1[(3'h7):(3'h7)] ~^ reg20[(2'h2):(1'h1)]) ?
                          $unsigned((reg16 ^~ wire15)) : ((wire11 ^ wire0) > reg16[(1'h1):(1'h1)])) : ($signed($unsigned(wire9)) ?
                          (reg16[(1'h0):(1'h0)] ^ reg28) : $signed((~|(8'hb7)))))};
              reg37 <= $signed(reg27[(4'h8):(3'h6)]);
              reg38 <= wire9;
              reg39 <= (^~(^wire11[(2'h2):(1'h0)]));
            end
        end
      reg40 <= reg17[(2'h2):(1'h1)];
    end
endmodule
