module top
#(parameter param26 = (({({(8'hbd)} ^ {(8'hac)})} > (((~&(8'ha8)) ? ((8'ha6) ? (8'hb5) : (8'hb5)) : {(8'hb9)}) ^ {((8'hb5) ? (8'ha3) : (8'hbf)), (^~(8'hb7))})) ? ((({(8'h9f)} ^ (8'ha2)) - {{(8'ha3), (8'ha2)}, (8'h9f)}) != {(((7'h40) >= (8'h9f)) == ((8'ha6) ? (8'ha3) : (8'h9d))), (((8'hb5) - (8'hba)) ? (~&(8'haa)) : {(8'hb0), (8'h9d)})}) : (^((((7'h42) ? (8'hab) : (8'hbe)) ? (8'hb7) : ((8'hb2) ~^ (7'h44))) ? {((8'h9e) ^ (8'hb7))} : (((8'hb3) ? (8'hb5) : (8'hb2)) ? (!(8'hbb)) : (8'ha9))))), 
parameter param27 = (^(({(param26 ? (8'hbf) : param26), (param26 - param26)} ? param26 : ((param26 ? param26 : (8'hb8)) ? param26 : (^~param26))) * (^((param26 ? param26 : (8'hae)) <<< param26)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire25,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = (($signed((^~wire0[(2'h2):(1'h1)])) ?
                     wire1[(1'h0):(1'h0)] : ($unsigned((+(8'h9d))) ?
                         $unsigned((8'ha6)) : wire3)) != wire0[(2'h3):(2'h3)]);
  assign wire5 = (~$unsigned(($signed({wire4}) <<< (wire1[(1'h0):(1'h0)] ?
                     $signed(wire1) : (~&wire2)))));
  assign wire6 = wire3;
  assign wire7 = (wire4[(5'h11):(5'h10)] == $signed(wire3[(3'h4):(2'h2)]));
  assign wire8 = (+$unsigned((8'hbf)));
  always
    @(posedge clk) begin
      reg9 <= wire6[(3'h7):(3'h4)];
      reg10 <= wire3;
      reg11 <= (~^wire3);
      if ($unsigned((({reg9[(2'h3):(1'h0)],
              $unsigned(wire6)} + (wire7[(2'h2):(1'h1)] || wire1[(1'h1):(1'h1)])) ?
          wire7 : ($unsigned(wire0[(1'h0):(1'h0)]) ?
              wire3[(3'h5):(1'h1)] : ({reg9} ?
                  $unsigned((8'hb0)) : $signed(wire5))))))
        begin
          reg12 <= wire3;
          reg13 <= reg12[(2'h3):(1'h1)];
          reg14 <= ($unsigned(reg12) > wire0);
          reg15 <= wire0[(3'h4):(3'h4)];
        end
      else
        begin
          reg12 <= reg13[(1'h1):(1'h1)];
          if ((reg13 >> $signed(reg13[(2'h3):(1'h1)])))
            begin
              reg13 <= wire6[(2'h2):(1'h1)];
              reg14 <= ({((^(reg10 ? wire7 : reg13)) ?
                          ((reg11 ?
                              (8'hab) : reg14) * (|wire6)) : $signed($unsigned(wire8)))} ?
                  reg12[(2'h2):(2'h2)] : wire6);
              reg15 <= $unsigned(($signed($signed(((8'hb8) < reg15))) << $unsigned($unsigned(wire3))));
              reg16 <= {(wire6 ?
                      $unsigned($unsigned((&(8'h9c)))) : (reg13 == {(!wire7)})),
                  (((~^reg10[(2'h3):(1'h0)]) < (wire1 >= $unsigned(reg9))) + wire7[(1'h1):(1'h0)])};
            end
          else
            begin
              reg13 <= {reg10};
            end
          if (({($signed({wire1}) ?
                      (^(~|wire0)) : ((wire2 && wire3) < (~(8'hb9)))),
                  (~&(|reg12[(4'h8):(2'h2)]))} ?
              (~$signed((^~(reg10 & wire7)))) : (~&$signed({$unsigned(reg16)}))))
            begin
              reg17 <= (reg10[(5'h14):(2'h3)] ?
                  (^wire7[(3'h4):(3'h4)]) : wire2);
              reg18 <= ($unsigned($unsigned((|(8'had)))) ?
                  $signed((reg17[(4'he):(4'h9)] ?
                      $unsigned({reg12}) : (+reg14))) : reg13[(2'h3):(2'h2)]);
            end
          else
            begin
              reg17 <= wire0[(2'h3):(1'h0)];
              reg18 <= reg15[(3'h6):(3'h5)];
            end
        end
      if (({(7'h44)} >= $unsigned(wire8)))
        begin
          if ($signed($signed(wire3[(3'h7):(3'h6)])))
            begin
              reg19 <= $unsigned(reg15);
              reg20 <= $unsigned(((~(~reg13)) ?
                  (($signed((8'ha9)) ?
                      (!wire1) : reg17) + {wire1}) : $unsigned((reg12 << {reg18,
                      wire3}))));
              reg21 <= ((^~({reg14} * reg12)) ?
                  reg9 : (reg13 ^~ ($unsigned({wire4, wire8}) ?
                      (reg12[(1'h1):(1'h1)] != {reg16}) : $unsigned((reg20 | wire3)))));
              reg22 <= (+$signed(reg15[(4'h9):(2'h2)]));
              reg23 <= {wire1[(1'h0):(1'h0)],
                  (+$unsigned(((|(8'ha3)) > (&reg17))))};
            end
          else
            begin
              reg19 <= $unsigned(({$signed($signed(wire8))} * ({$unsigned((8'hbb)),
                      ((8'h9f) ? reg18 : reg9)} ?
                  $unsigned(reg22) : reg17)));
              reg20 <= reg15;
              reg21 <= reg22;
              reg22 <= (($unsigned($signed($signed(reg16))) ?
                      ($unsigned((wire8 < wire4)) ?
                          wire8 : $signed((~|reg12))) : (reg11[(2'h2):(1'h0)] ?
                          reg12 : (wire6 ?
                              (wire8 << reg16) : $signed(reg14)))) ?
                  (!(($signed(reg20) & $unsigned(reg19)) >> reg15[(4'hb):(3'h4)])) : {reg15[(3'h6):(3'h6)],
                      $unsigned($signed(reg10))});
            end
          reg24 <= {((((reg15 >= reg16) < $signed(reg15)) || ((^~reg21) > (wire1 ?
                      wire3 : reg23))) ?
                  reg16 : wire5[(5'h15):(4'hf)]),
              reg23[(4'h9):(3'h7)]};
        end
      else
        begin
          reg19 <= (~^{(reg22[(4'hb):(3'h6)] ?
                  (((8'hb1) ? reg20 : reg11) ?
                      $unsigned(reg17) : reg20[(1'h1):(1'h1)]) : $unsigned((wire2 * reg11)))});
          reg20 <= $unsigned($signed(((8'haf) | $unsigned({(7'h42)}))));
          reg21 <= ((|$unsigned((reg16[(1'h1):(1'h1)] ? (~^reg21) : reg9))) ?
              $signed($unsigned(((wire2 + reg14) <= (+wire3)))) : wire0);
          reg22 <= ($unsigned(reg10) ?
              ($unsigned((^{(8'hb8), reg10})) ?
                  reg11 : ($unsigned((^~reg11)) < $signed($unsigned((8'hbc))))) : $signed({reg14[(2'h2):(1'h1)]}));
        end
    end
  assign wire25 = $unsigned($signed(({(reg20 ? reg16 : reg9),
                          (reg15 ? wire0 : reg12)} ?
                      (-(reg12 ? wire0 : reg10)) : ((wire1 ? reg17 : reg13) ?
                          $unsigned(reg15) : (-wire5)))));
endmodule
