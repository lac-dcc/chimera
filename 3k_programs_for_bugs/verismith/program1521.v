module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire43,
                 wire31,
                 wire30,
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
  always
    @(posedge clk) begin
      if ($unsigned(wire2[(4'he):(2'h2)]))
        begin
          if ($unsigned((~$unsigned(wire3))))
            begin
              reg5 <= ($signed($signed(wire0[(2'h2):(2'h2)])) ?
                  wire4 : $signed($unsigned($signed($signed(wire2)))));
              reg6 <= $unsigned(({$unsigned($unsigned(wire0))} + (|((^wire4) ?
                  (wire3 ? wire0 : wire2) : ((8'h9e) ? wire3 : wire0)))));
              reg7 <= reg6;
              reg8 <= $signed(((8'ha4) ?
                  $unsigned(({wire3} || $unsigned(reg6))) : {reg7}));
            end
          else
            begin
              reg5 <= wire2[(4'h8):(3'h5)];
              reg6 <= wire2[(2'h3):(2'h2)];
              reg7 <= wire4;
              reg8 <= wire2[(4'h9):(2'h3)];
              reg9 <= (~&{$signed(wire0)});
            end
          reg10 <= reg5;
          reg11 <= $signed({(((reg6 ?
                  wire1 : wire3) == (reg6 >>> wire1)) >= {(wire0 | wire4)})});
        end
      else
        begin
          reg5 <= ((+reg6) ?
              (^~wire4) : ($signed($unsigned($signed(wire1))) ?
                  wire2 : reg5[(2'h3):(1'h1)]));
        end
      if ($unsigned((reg5[(1'h1):(1'h1)] != $signed((reg10 ?
          (-wire2) : (reg8 & reg5))))))
        begin
          if ((((wire4 != ((reg9 ~^ wire3) ~^ (+reg10))) ?
                  wire2[(3'h5):(1'h1)] : $signed({$signed(reg5)})) ?
              wire3 : $unsigned((reg6[(1'h1):(1'h1)] ?
                  (8'hb3) : {wire1[(1'h1):(1'h1)]}))))
            begin
              reg12 <= (~|($signed($unsigned(reg5)) ?
                  $unsigned($signed($unsigned((8'h9e)))) : (($signed(reg6) ?
                          reg9[(3'h5):(1'h1)] : reg10) ?
                      ((reg8 ? (8'haf) : reg6) >> $unsigned(reg7)) : (&reg8))));
            end
          else
            begin
              reg12 <= ((8'ha9) ?
                  ($unsigned($unsigned(((8'hb7) <<< reg6))) ?
                      (-$signed((^~(8'hb9)))) : (wire2 ?
                          (^~$unsigned(reg7)) : ($signed(wire4) ?
                              ((8'hb9) ? reg6 : reg9) : {wire1}))) : reg7);
              reg13 <= $signed($unsigned(reg5));
              reg14 <= reg9;
            end
          reg15 <= reg11[(1'h0):(1'h0)];
          reg16 <= (~&{wire4, (^~$unsigned({reg5}))});
        end
      else
        begin
          reg12 <= ($unsigned((^~($signed(reg5) ?
                  (^reg16) : $unsigned(reg9)))) ?
              reg15 : (+({(|reg8), (8'hbe)} ?
                  (~$signed(wire1)) : (|(reg11 ? reg9 : reg12)))));
          reg13 <= $signed($signed($unsigned(wire2)));
          if ($unsigned((reg12[(3'h5):(2'h2)] ~^ reg5[(2'h2):(2'h2)])))
            begin
              reg14 <= $signed(wire4[(1'h0):(1'h0)]);
              reg15 <= {$signed(reg8)};
              reg16 <= ($unsigned(({(8'haf)} ? reg5 : {reg13[(4'ha):(3'h5)]})) ?
                  (~^($unsigned((reg6 & reg10)) + ($signed(reg13) ?
                      {wire2, reg5} : (reg5 ?
                          reg5 : wire4)))) : $signed(wire3));
              reg17 <= reg5;
            end
          else
            begin
              reg14 <= ((reg7 ?
                  $signed((~^$unsigned(wire4))) : $unsigned($unsigned((wire3 != wire4)))) ^ (($unsigned({wire2,
                  reg5}) == (reg17 ?
                  ((8'h9d) > reg5) : $signed(wire1))) ^~ $unsigned((8'ha6))));
              reg15 <= (+wire4[(2'h2):(1'h0)]);
              reg16 <= ((reg15[(2'h3):(2'h2)] && ($unsigned((reg7 <= wire4)) ?
                      {reg15, (reg7 || wire1)} : $unsigned(reg16))) ?
                  (reg5[(1'h0):(1'h0)] ? reg6 : reg9) : (reg9 ?
                      reg16 : reg10[(4'he):(3'h6)]));
            end
        end
      if (wire4)
        begin
          reg18 <= $signed(($unsigned(wire2[(4'ha):(3'h7)]) && $signed($unsigned(reg15))));
          if ((($unsigned(($unsigned(reg18) * (wire1 ~^ reg17))) ?
              $unsigned($signed($unsigned(wire1))) : ({$unsigned(reg5),
                  (|wire3)} << (8'ha2))) - wire2[(4'hf):(4'h8)]))
            begin
              reg19 <= $signed(reg18[(5'h12):(2'h2)]);
              reg20 <= reg10;
              reg21 <= ($signed(({reg18[(5'h11):(2'h3)],
                      $signed((8'ha3))} != (&(reg17 || (8'ha9))))) ?
                  (-(|reg11)) : $unsigned((reg12[(2'h2):(2'h2)] + wire0[(3'h5):(1'h0)])));
            end
          else
            begin
              reg19 <= reg16[(5'h14):(4'hb)];
              reg20 <= (+(reg5[(1'h1):(1'h1)] >> reg8[(2'h2):(2'h2)]));
              reg21 <= reg9[(1'h1):(1'h1)];
              reg22 <= wire3[(1'h0):(1'h0)];
            end
          if ((^~(!reg17)))
            begin
              reg23 <= {{({(wire2 > reg19)} == $signed(wire3)),
                      ((+(reg21 < reg13)) * {(^reg9), reg12[(1'h0):(1'h0)]})}};
              reg24 <= reg16;
            end
          else
            begin
              reg23 <= $signed((^~(reg9 ?
                  {$unsigned(reg14)} : {reg22, $signed(reg15)})));
              reg24 <= $unsigned((~|wire0));
              reg25 <= (reg17 + (reg15[(2'h2):(1'h0)] ^~ (wire2 <= ((reg17 ?
                      reg5 : reg6) ?
                  $signed(reg19) : (wire4 ? reg16 : (8'ha6))))));
              reg26 <= reg8;
            end
          reg27 <= $unsigned({((-reg17[(1'h0):(1'h0)]) ?
                  reg13[(3'h5):(3'h5)] : $unsigned($unsigned(reg7))),
              $signed(reg21)});
          reg28 <= (&($unsigned((^$unsigned(reg21))) > {(wire2 ?
                  wire3[(2'h3):(2'h3)] : ((8'hac) ? reg19 : (8'h9d))),
              $signed((reg9 ? reg14 : reg23))}));
        end
      else
        begin
          if ((~|$unsigned((wire3[(5'h13):(4'ha)] <= {reg19[(3'h5):(1'h1)]}))))
            begin
              reg18 <= $signed(({reg26} >= (^~(((7'h41) > reg9) ?
                  reg13 : $unsigned(wire1)))));
              reg19 <= $unsigned(($signed(wire3) <= $signed((~|$unsigned(wire0)))));
              reg20 <= {reg19[(2'h3):(2'h2)]};
              reg21 <= (~$signed(reg13));
            end
          else
            begin
              reg18 <= $unsigned(((wire1[(2'h2):(1'h1)] ?
                      $signed(reg16) : ($signed(wire2) * reg8[(2'h2):(1'h1)])) ?
                  $unsigned(reg10[(1'h1):(1'h0)]) : (reg5 + $unsigned(reg16[(4'ha):(1'h1)]))));
            end
          if ((reg27 << reg10[(4'h8):(1'h0)]))
            begin
              reg22 <= $signed((($unsigned((reg20 ?
                  reg23 : reg18)) >>> (!{reg15})) + (&((~&reg18) ?
                  $signed(reg21) : ((7'h42) ? wire1 : reg10)))));
              reg23 <= ((8'hbb) >= reg16);
              reg24 <= (8'hab);
            end
          else
            begin
              reg22 <= $unsigned(((&reg13[(1'h1):(1'h0)]) ^~ ((~^reg22[(2'h2):(2'h2)]) | (|(reg6 <<< (7'h41))))));
              reg23 <= (reg25 != (&$unsigned(wire3[(4'hd):(3'h4)])));
            end
          if ((($signed({$unsigned(wire2)}) ?
              (reg13[(5'h11):(4'he)] & $unsigned($unsigned((8'hb6)))) : (reg12[(3'h6):(3'h6)] * $unsigned((&reg6)))) << ($signed($signed($unsigned(reg27))) ^ (({reg19} ?
              wire4 : $unsigned(reg23)) << reg24[(3'h4):(2'h2)]))))
            begin
              reg25 <= reg26[(2'h3):(2'h3)];
              reg26 <= ({(($signed((8'hbb)) && (~&wire1)) && (~^(reg11 == (8'hb8)))),
                  {$signed(wire4[(3'h4):(2'h3)]),
                      ({(8'hb9)} < (reg25 ? reg12 : reg28))}} != reg21);
            end
          else
            begin
              reg25 <= reg9;
              reg26 <= ($unsigned(reg17) ?
                  $signed((~|$unsigned((+(8'haa))))) : {(((reg18 >> reg23) - (wire3 != (8'hb9))) ?
                          (reg7[(5'h14):(4'ha)] != (reg15 << reg14)) : $signed($unsigned(reg19))),
                      $unsigned({reg17[(2'h2):(1'h0)], $unsigned(reg14)})});
              reg27 <= $unsigned($signed((reg22 ? reg25 : reg12)));
              reg28 <= ((wire2[(4'hb):(3'h4)] | ($unsigned((reg25 ?
                      wire4 : (8'hb4))) ?
                  reg17[(3'h4):(1'h0)] : reg26[(3'h6):(1'h1)])) * reg19);
              reg29 <= ($signed({$unsigned((~^(8'hb4)))}) >> (reg23 == wire0));
            end
        end
    end
  assign wire30 = (reg11 && {((^(reg7 - (8'hb3))) == reg16)});
  assign wire31 = $signed($signed(((-(wire30 ? reg17 : reg25)) ?
                      $unsigned($unsigned(reg13)) : reg22[(3'h4):(3'h4)])));
  module32 #() modinst44 (wire43, clk, wire4, wire31, reg19, reg10);
endmodule

module module32
#(parameter param41 = (({{((8'ha3) || (8'hbd))}} < (((8'hbb) <= (~^(8'hbb))) ? (8'ha4) : (^(~&(8'ha3))))) ? (^~(((~&(8'hb4)) <<< (+(8'ha1))) ? {(+(8'hb1))} : (~&((8'hae) <<< (8'hb3))))) : (((8'hbd) ? {((7'h41) ? (8'h9f) : (8'ha4)), (8'hba)} : (!((8'ha2) >= (7'h40)))) ? (((~(8'ha6)) | {(8'hb6), (8'hb8)}) ? (+(~&(8'hb6))) : (((7'h40) ? (8'hbf) : (8'ha1)) ? ((8'hb2) ? (7'h41) : (8'ha1)) : {(8'hb4)})) : ((((8'ha6) >> (8'ha1)) + (~^(8'hb1))) ? (^((8'haa) >>> (8'hbb))) : (8'hb1)))), 
parameter param42 = {((~|(param41 * ((8'hae) == param41))) | (((param41 ? param41 : param41) ? (param41 ? (8'hb0) : param41) : (param41 ? (8'hb2) : (8'h9e))) ? (+(8'hb0)) : (!(|param41)))), (((~{(8'ha7), param41}) ? ((param41 ? (8'hae) : param41) ? (param41 ? param41 : param41) : (-param41)) : (+(param41 < param41))) ? (param41 >>> (param41 | (8'had))) : (!({param41} ? param41 : param41)))})
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire36;
  input wire signed [(4'h9):(1'h0)] wire35;
  input wire [(2'h2):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  assign y = {wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = (|$signed((((|(8'hb7)) | {wire33}) * $signed(wire34))));
  assign wire38 = wire33[(2'h3):(1'h1)];
  assign wire39 = (+wire38);
  assign wire40 = wire39;
endmodule
