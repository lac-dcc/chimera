module top
#(parameter param35 = ((8'hac) < ({((~^(8'ha5)) != {(8'ha4), (8'hb2)}), (!((8'hab) ~^ (8'ha5)))} ? (+(-((8'hb1) ? (8'hb3) : (8'hbd)))) : ((((7'h42) ? (8'ha4) : (8'h9e)) != ((8'h9d) << (7'h40))) ? (^((8'h9e) ? (8'hb6) : (8'ha4))) : (((8'hb7) ? (8'hb3) : (8'haa)) >>> ((8'ha4) || (8'hb7)))))), 
parameter param36 = ({((^{param35}) ? (param35 ? (param35 < param35) : ((8'ha2) & param35)) : ((param35 ? param35 : param35) ? (param35 <= (8'hb2)) : (param35 ? param35 : param35)))} ? (~&(param35 ? (param35 ? (param35 ? param35 : param35) : param35) : (|{param35, param35}))) : {((8'ha2) ? {(param35 ^~ param35), {param35, (8'hbc)}} : {param35}), (((param35 - param35) <<< (param35 ? param35 : param35)) ? (param35 | {(8'hb7), param35}) : ((~param35) || (param35 ? param35 : (8'hb0))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg31,
                 reg30,
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
                 (1'h0)};
  assign wire5 = wire2[(2'h3):(1'h0)];
  assign wire6 = (($unsigned((-(7'h40))) == (((8'hbf) << (^~wire2)) ?
                     $signed(wire3[(5'h11):(1'h1)]) : $unsigned((^~wire0)))) * $signed($signed(({wire3,
                     wire4} ^~ $unsigned((8'h9d))))));
  assign wire7 = ($signed(wire2) >> wire4);
  assign wire8 = $unsigned((wire4[(2'h2):(1'h1)] ?
                     wire3 : $unsigned(wire6[(3'h7):(2'h2)])));
  always
    @(posedge clk) begin
      reg9 <= {($signed((wire2[(2'h3):(1'h0)] | {(8'hb0)})) ?
              wire2 : wire7[(2'h2):(1'h1)]),
          $unsigned((~|($signed((8'hb4)) >= (&(8'hb8)))))};
      reg10 <= wire0;
      if ((^~(7'h42)))
        begin
          reg11 <= $unsigned(wire1[(3'h5):(2'h3)]);
          reg12 <= {(wire6 << $unsigned(wire7[(2'h3):(1'h0)]))};
          if ((wire4 - wire6[(3'h6):(3'h4)]))
            begin
              reg13 <= (reg10[(1'h1):(1'h1)] ?
                  $signed(reg10[(1'h1):(1'h0)]) : (wire6 + (^~reg11)));
              reg14 <= (+$signed($unsigned(($unsigned(wire5) | wire1))));
              reg15 <= {{(&((wire4 ? wire7 : wire7) ^~ $signed(reg14))),
                      (^$signed($signed(wire7)))},
                  (^~$unsigned($unsigned((wire8 ? wire1 : reg10))))};
              reg16 <= ((wire2[(1'h1):(1'h1)] >>> reg10[(2'h3):(1'h0)]) ?
                  $unsigned($unsigned($signed((reg12 ?
                      wire1 : reg12)))) : {($unsigned((+(8'ha6))) ?
                          $unsigned((^reg12)) : wire2[(1'h0):(1'h0)]),
                      {{((8'haa) ? (8'ha7) : wire4), (!wire8)}}});
              reg17 <= $unsigned(reg12[(4'h9):(4'h9)]);
            end
          else
            begin
              reg13 <= ((^((wire4[(1'h1):(1'h0)] >> (!(8'hbf))) >> $unsigned((reg12 >= wire0)))) ?
                  wire6[(3'h6):(1'h0)] : (({reg9, $unsigned(reg9)} ?
                      reg11[(1'h0):(1'h0)] : ($unsigned(wire7) ?
                          (wire4 >> wire8) : (reg15 ?
                              reg9 : (8'hb0)))) ^~ $signed(reg17[(3'h7):(1'h0)])));
              reg14 <= $signed((^$signed(((~^wire1) >> $unsigned((7'h42))))));
            end
          if ((wire5 > ((^~(~|$signed(reg9))) ?
              (~|(wire8[(2'h2):(2'h2)] == $unsigned(wire5))) : (~&reg14[(4'h8):(3'h7)]))))
            begin
              reg18 <= (+wire7);
              reg19 <= $signed((-$signed($unsigned(reg15))));
              reg20 <= ($unsigned(($signed((reg9 ? wire3 : reg13)) ?
                  {((8'ha9) && wire5)} : (!(wire5 < reg16)))) >= ($unsigned(((8'hbb) - (reg14 < reg13))) ^ (({wire6} ?
                  (reg18 ?
                      wire6 : wire3) : reg19[(3'h6):(2'h2)]) == wire5[(4'h9):(1'h0)])));
              reg21 <= {(8'hbd)};
            end
          else
            begin
              reg18 <= ($signed({$signed((reg17 ? reg17 : (8'hb8)))}) ?
                  wire3 : (wire4[(3'h5):(2'h2)] ?
                      reg20[(1'h1):(1'h1)] : wire5[(4'hb):(3'h7)]));
              reg19 <= ($signed($unsigned({(wire0 >> wire2),
                      $signed((8'ha2))})) ?
                  (wire6[(3'h4):(3'h4)] ?
                      ($unsigned($unsigned(reg13)) * reg15[(2'h3):(1'h0)]) : (8'hb6)) : $signed(wire8));
            end
        end
      else
        begin
          reg11 <= $unsigned((!reg10[(4'h9):(4'h9)]));
        end
      if ((($unsigned(wire7) ^ wire7[(1'h1):(1'h0)]) ?
          (~|(wire5[(4'ha):(3'h7)] - $signed((+wire2)))) : $signed($unsigned((!(^~reg12))))))
        begin
          reg22 <= reg14;
          reg23 <= $unsigned((reg10 ?
              wire6[(2'h2):(2'h2)] : ({reg9} ? reg16 : (+reg14))));
          reg24 <= $unsigned($signed($signed((wire3 ?
              (^reg21) : reg15[(4'ha):(3'h6)]))));
        end
      else
        begin
          if (reg24)
            begin
              reg22 <= (^~reg18);
            end
          else
            begin
              reg22 <= ($signed({($signed(reg20) ?
                          (wire0 ? wire6 : reg15) : ((8'hb5) ?
                              wire6 : reg18))}) ?
                  $unsigned((((reg9 ? wire8 : reg12) >= (wire5 ?
                          reg12 : reg14)) ?
                      reg17 : {$signed(reg10),
                          (^~reg15)})) : ((8'hbb) | (~|reg21[(4'ha):(4'h9)])));
              reg23 <= reg11;
            end
          reg24 <= (wire4[(2'h3):(1'h1)] ? $signed((8'h9f)) : $signed(wire4));
          if ((reg11 ^~ (reg14 || ($unsigned(wire6[(3'h7):(1'h0)]) ?
              $unsigned((8'hb3)) : (reg10[(4'hb):(4'ha)] ?
                  ((8'had) && reg10) : (^wire2))))))
            begin
              reg25 <= $unsigned((wire6 >> $unsigned($unsigned((reg21 ?
                  reg13 : (8'ha6))))));
              reg26 <= ($unsigned(($signed($unsigned(reg20)) ?
                  ((~|reg17) || $unsigned(reg20)) : ($signed(reg19) ?
                      reg24[(1'h0):(1'h0)] : (wire1 - (8'haf))))) * (&$unsigned(($unsigned(wire4) != $unsigned(wire8)))));
            end
          else
            begin
              reg25 <= $signed({(^~$unsigned(((8'hbe) | wire4)))});
            end
        end
    end
  assign wire27 = (8'ha9);
  assign wire28 = $unsigned({reg9[(2'h2):(2'h2)], reg24});
  assign wire29 = reg18;
  always
    @(posedge clk) begin
      reg30 <= (~^(reg24 <<< $signed(((wire6 <<< (8'hba)) ?
          wire6[(3'h4):(1'h1)] : $signed(wire27)))));
      reg31 <= $signed(reg25);
    end
  assign wire32 = wire3;
  assign wire33 = ($signed((7'h41)) || reg20[(2'h2):(1'h0)]);
  assign wire34 = (8'hbd);
endmodule
