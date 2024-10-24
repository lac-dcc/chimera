module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(5'h13):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  assign y = {wire38,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg26,
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
  assign wire5 = wire1;
  assign wire6 = (~|wire4);
  assign wire7 = (~^(8'ha1));
  assign wire8 = $signed((wire1[(1'h0):(1'h0)] ?
                     $signed(({wire7, wire6} ?
                         $unsigned(wire0) : (~&wire6))) : (wire0[(4'h9):(2'h3)] ?
                         $signed($signed(wire1)) : ($signed(wire5) > wire1[(3'h6):(2'h3)]))));
  always
    @(posedge clk) begin
      reg9 <= wire0;
      reg10 <= (wire2 != {(!(-wire3))});
      reg11 <= reg9;
      if (wire4)
        begin
          reg12 <= (wire2 ?
              wire0[(3'h5):(1'h0)] : (((wire8 << $signed(wire3)) ?
                      $signed($signed(reg11)) : $signed($unsigned(wire4))) ?
                  (($signed(wire1) ?
                      wire4[(3'h6):(3'h5)] : (wire8 >= wire3)) & (reg10[(3'h6):(3'h5)] ?
                      (wire6 != wire0) : (reg9 | wire8))) : reg9));
        end
      else
        begin
          reg12 <= $signed((^~$unsigned(reg9)));
          reg13 <= (((reg9[(3'h7):(1'h0)] ?
                      {reg11[(3'h7):(1'h1)],
                          wire1[(3'h6):(1'h0)]} : wire7[(1'h0):(1'h0)]) ?
                  (wire8[(1'h1):(1'h1)] ?
                      (8'hbf) : ((|reg11) >= reg12[(3'h5):(2'h2)])) : $unsigned(reg12)) ?
              $unsigned(reg10) : $signed((!$signed(wire6[(3'h4):(1'h0)]))));
          reg14 <= (|(({$signed(wire1),
                  $unsigned(wire1)} != {wire5[(1'h0):(1'h0)], (~wire3)}) ?
              (^$unsigned(wire4)) : reg12[(3'h5):(2'h3)]));
          if ((~^$signed(((reg10 & wire1[(3'h5):(1'h0)]) >> ($unsigned(reg14) ?
              wire2 : reg11)))))
            begin
              reg15 <= (8'ha7);
              reg16 <= reg15[(3'h6):(1'h1)];
              reg17 <= (|($signed($signed(reg11)) == reg11[(3'h6):(1'h0)]));
              reg18 <= ($signed(($signed(wire8) ~^ (8'hbe))) << reg10[(1'h0):(1'h0)]);
              reg19 <= $unsigned(wire4);
            end
          else
            begin
              reg15 <= $signed({(wire6 ^ (|$signed(reg17)))});
            end
          if ($unsigned(reg19[(2'h3):(2'h3)]))
            begin
              reg20 <= reg10;
              reg21 <= {(wire6[(4'he):(3'h5)] == $signed($signed($signed(reg14))))};
              reg22 <= ((~wire1[(4'ha):(2'h3)]) ?
                  ($signed(($signed(reg15) <= wire3)) ?
                      $signed($unsigned((-reg16))) : (~&(+wire2[(4'h8):(1'h1)]))) : $unsigned((($unsigned(reg10) == wire4) << $signed((reg19 ?
                      reg14 : reg12)))));
              reg23 <= wire7[(4'he):(4'hb)];
              reg24 <= {$unsigned($unsigned({(reg16 ? reg19 : wire8)})),
                  ($unsigned(((~wire3) ?
                          reg13[(4'hc):(4'hb)] : (reg20 >> reg11))) ?
                      $signed(((!(8'h9d)) ?
                          $signed((8'hb7)) : (reg9 ? reg13 : wire2))) : wire5)};
            end
          else
            begin
              reg20 <= reg14;
              reg21 <= $signed($signed(({reg16[(3'h7):(2'h3)]} ?
                  reg14 : ((8'ha4) ? reg22 : wire1[(2'h3):(1'h1)]))));
              reg22 <= $signed($signed(($signed($unsigned(reg15)) ?
                  $unsigned((wire6 ?
                      wire8 : (8'hae))) : $unsigned($unsigned(reg17)))));
            end
        end
    end
  assign wire25 = ($unsigned(((^((8'hae) ?
                      reg20 : reg19)) << ($unsigned(reg24) <<< $signed((8'hb8))))) << ($signed((wire4[(3'h6):(1'h0)] ^~ (wire5 ?
                          (7'h40) : reg21))) ?
                      $unsigned({$signed(reg14),
                          $unsigned((8'hab))}) : (!$unsigned((reg13 ?
                          wire7 : wire4)))));
  always
    @(posedge clk) begin
      reg26 <= ($signed($signed($signed((wire6 || reg16)))) << $unsigned(wire0[(3'h6):(2'h3)]));
    end
  assign wire27 = wire0[(2'h2):(1'h0)];
  assign wire28 = $signed(reg24);
  assign wire29 = $unsigned({(wire3 ?
                          $signed((~^reg20)) : ((reg22 == reg17) >>> (!(8'hbc)))),
                      ($unsigned($signed(wire8)) <<< $signed((wire0 ?
                          wire2 : reg24)))});
  assign wire30 = (~^wire5);
  always
    @(posedge clk) begin
      if ($unsigned((8'hb7)))
        begin
          reg31 <= (^(~&(reg10[(3'h4):(2'h3)] ?
              $signed($unsigned(wire3)) : $signed($unsigned(reg18)))));
          reg32 <= (~&(~&$unsigned((7'h43))));
          reg33 <= (reg20 != ((((~|(8'hb4)) ?
              ((8'hae) >>> wire5) : (-reg31)) * {(~&wire3)}) ~^ $unsigned((|(8'h9e)))));
          if ($signed({($unsigned(reg22[(3'h7):(2'h3)]) ?
                  (+(reg13 ? reg12 : reg13)) : wire30[(4'h9):(3'h6)]),
              reg9[(4'hd):(4'hb)]}))
            begin
              reg34 <= $unsigned(($unsigned(($signed(reg13) >> {reg16})) < (~(^~((8'hb6) ?
                  (8'haa) : reg19)))));
            end
          else
            begin
              reg34 <= reg11[(3'h7):(3'h5)];
              reg35 <= (reg24[(2'h2):(1'h0)] | {reg19,
                  ((~|(reg23 >= reg9)) ? (+$signed(wire1)) : (8'haf))});
            end
        end
      else
        begin
          reg31 <= wire7[(2'h3):(2'h3)];
          reg32 <= $unsigned(($signed($signed((wire3 >> reg34))) && ($unsigned((reg24 ?
                  (8'haa) : wire27)) ?
              $unsigned(reg34[(3'h5):(3'h4)]) : $unsigned(((8'ha0) ?
                  reg16 : reg9)))));
          reg33 <= $signed((-($unsigned($signed((8'h9f))) ?
              reg9[(4'ha):(3'h4)] : ((wire3 ? reg33 : wire7) ?
                  $unsigned(reg10) : wire3))));
          reg34 <= $signed(reg35);
        end
      reg36 <= wire30;
      reg37 <= (&$signed((|(^reg20[(1'h0):(1'h0)]))));
    end
  assign wire38 = $unsigned((8'hb3));
endmodule
