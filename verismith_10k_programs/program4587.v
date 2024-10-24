module top
#(parameter param22 = (({(((8'hbf) ? (7'h40) : (8'ha0)) ? {(8'ha6), (8'hb5)} : {(8'h9d)}), ((&(7'h43)) ? ((8'hb7) | (8'ha2)) : ((8'ha9) >= (8'ha6)))} || (+(((8'hb5) == (8'ha0)) <= {(8'hb3), (8'had)}))) || (({{(7'h44)}} - ({(8'hab), (8'hb3)} ? (~^(7'h42)) : ((8'ha5) << (8'hac)))) ^ (((^~(8'ha3)) ^ (^(8'hbf))) ? ((~|(8'h9f)) << ((8'ha4) ^ (8'ha3))) : ({(8'hac), (8'ha1)} | (8'hbc))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire21,
                 wire5,
                 wire4,
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
  assign wire4 = (((-(7'h44)) != wire0) <<< (^{{(wire3 ? (8'haf) : wire1),
                         $signed(wire3)},
                     (~&$unsigned(wire0))}));
  assign wire5 = (+wire4[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg6 <= $signed(wire3[(4'h8):(1'h0)]);
      reg7 <= $signed(($unsigned(wire3[(2'h2):(2'h2)]) == (^($signed(wire5) <= $signed(wire1)))));
      reg8 <= wire0[(1'h0):(1'h0)];
      if ($unsigned($unsigned($signed((^$unsigned(wire1))))))
        begin
          if (wire2[(4'h8):(3'h7)])
            begin
              reg9 <= $signed((~&$unsigned((+$unsigned(reg7)))));
              reg10 <= $signed(((8'ha7) ?
                  $signed(((&(8'hbf)) & $signed(reg8))) : $signed((+(wire5 != wire1)))));
            end
          else
            begin
              reg9 <= reg9[(4'ha):(2'h3)];
              reg10 <= ((&$unsigned($signed({reg10, wire0}))) ?
                  (reg7 ? wire5 : reg7) : (|reg6));
              reg11 <= ((wire5 ^~ (|reg6)) ?
                  $unsigned(reg10) : reg9[(3'h5):(2'h3)]);
            end
        end
      else
        begin
          if ((~&$signed((&(8'hbd)))))
            begin
              reg9 <= (^~{{(8'h9d)}});
            end
          else
            begin
              reg9 <= {reg11[(4'hd):(4'hd)]};
            end
          reg10 <= ($unsigned(wire2[(4'h8):(3'h6)]) ?
              $signed(reg10[(2'h2):(1'h0)]) : $unsigned((|(7'h41))));
          if ((((reg11[(4'hd):(4'ha)] ?
                      reg9[(4'h9):(3'h4)] : $unsigned({wire5, wire2})) ?
                  (((reg6 ~^ reg8) >> (wire2 < wire0)) ?
                      ($unsigned(wire5) >> (!reg8)) : ((wire3 && reg11) | (wire2 << (8'hb7)))) : $unsigned($unsigned($unsigned(wire1)))) ?
              $unsigned((7'h44)) : ((&wire4) ?
                  $signed((|(&wire4))) : (($unsigned((8'ha7)) >= (&wire1)) >>> reg7))))
            begin
              reg11 <= (wire1 - wire0[(4'hc):(2'h2)]);
              reg12 <= wire2;
              reg13 <= wire5[(3'h7):(2'h3)];
              reg14 <= {reg9,
                  $signed((reg8 ? {{reg13}} : $unsigned((~reg13))))};
              reg15 <= $signed(($signed({reg12}) ?
                  ((((8'hbe) ? reg8 : reg11) << $unsigned(reg8)) ?
                      ((reg7 ?
                          wire3 : wire5) << (reg13 <<< (8'hb5))) : reg13[(4'hf):(4'hb)]) : (~|((-wire0) ?
                      reg11[(4'h9):(3'h6)] : reg6))));
            end
          else
            begin
              reg11 <= (~wire1[(3'h6):(3'h6)]);
            end
          if ((|$signed(wire4)))
            begin
              reg16 <= {$signed(reg15[(4'hc):(4'ha)])};
              reg17 <= $unsigned(((&(&$signed(reg15))) != $signed((+reg7[(2'h3):(1'h0)]))));
              reg18 <= $unsigned($signed((8'hbc)));
              reg19 <= {(+(~&((~&reg8) < (|wire2))))};
              reg20 <= (&$unsigned(reg16[(1'h0):(1'h0)]));
            end
          else
            begin
              reg16 <= ((|$unsigned(wire2)) ?
                  ($signed((^~(wire2 ? (8'hbf) : reg11))) ?
                      ((~&reg13[(4'h8):(3'h5)]) ?
                          ($signed(reg7) | reg19) : reg12[(3'h5):(1'h1)]) : reg17) : $unsigned((reg18[(3'h7):(3'h4)] ^~ ((reg12 >= wire5) ?
                      $signed(wire4) : (wire0 <= (8'h9c))))));
              reg17 <= $unsigned((reg9 * ({reg14} ?
                  ((!reg6) ?
                      (^wire4) : (reg20 && wire4)) : (reg6 ^~ (wire1 >= wire2)))));
              reg18 <= (~|$unsigned(reg19[(1'h0):(1'h0)]));
              reg19 <= $signed({$signed((wire2[(4'ha):(3'h6)] + (reg14 ?
                      reg7 : reg14))),
                  ($unsigned(reg12) + reg18)});
            end
        end
    end
  assign wire21 = $unsigned(wire0);
endmodule
