module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(4'he):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg9 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
  assign wire5 = ($unsigned($unsigned((-(~^wire2)))) ?
                     ((|(7'h43)) >> (|wire1[(2'h2):(1'h0)])) : wire2);
  assign wire6 = (($unsigned($signed($unsigned(wire5))) ~^ ($unsigned($unsigned(wire3)) <= ((wire3 ?
                         (8'hbc) : wire2) ?
                     wire5 : (wire2 ?
                         wire0 : wire5)))) * (&((~&((8'haf) < wire2)) ?
                     ((wire2 << wire1) <<< $signed(wire1)) : ($unsigned((8'hba)) ^ $signed(wire1)))));
  assign wire7 = wire4;
  assign wire8 = ((&(($signed(wire0) ? wire7 : $unsigned(wire5)) ?
                     $unsigned((wire7 ? wire6 : wire2)) : ({wire1} ?
                         $signed(wire6) : $signed(wire6)))) * $unsigned((wire2 | wire4)));
  always
    @(posedge clk) begin
      reg9 <= (((!((~^wire3) ?
              $signed(wire5) : $signed((7'h41)))) != wire3[(2'h2):(1'h1)]) ?
          $unsigned(($unsigned((+wire1)) ?
              ((^~(8'ha2)) ?
                  wire3[(4'h8):(1'h1)] : $signed(wire6)) : $signed((wire2 < wire8)))) : wire3[(2'h3):(2'h2)]);
      reg10 <= (~|(8'ha8));
      if (($unsigned($signed((+$signed(reg10)))) ?
          ((~^wire1) ?
              wire0[(1'h0):(1'h0)] : (^~$unsigned($unsigned(wire2)))) : (~($unsigned((~^wire0)) ?
              (&wire6[(4'h9):(1'h0)]) : $unsigned({(8'h9e), reg10})))))
        begin
          if (wire3)
            begin
              reg11 <= $unsigned($signed($unsigned((&wire3[(1'h1):(1'h0)]))));
              reg12 <= (reg9[(1'h0):(1'h0)] ?
                  {$signed((^(reg10 << wire3))),
                      (reg10[(1'h0):(1'h0)] == $signed((~wire7)))} : wire5[(2'h3):(1'h1)]);
              reg13 <= wire8[(1'h1):(1'h0)];
              reg14 <= (wire8[(4'hd):(2'h2)] | $unsigned(wire0));
              reg15 <= $signed((((~wire0[(2'h2):(1'h0)]) ?
                  (8'ha9) : ($signed(reg10) ?
                      wire2 : {reg13})) || reg9[(1'h1):(1'h0)]));
            end
          else
            begin
              reg11 <= $unsigned(reg9[(1'h1):(1'h1)]);
              reg12 <= $unsigned($unsigned(reg14));
              reg13 <= ($unsigned($unsigned(((wire2 == wire4) ?
                      (reg10 + reg10) : wire1))) ?
                  wire4[(3'h6):(2'h3)] : wire1[(3'h4):(1'h1)]);
              reg14 <= $signed(reg12);
              reg15 <= ($signed((((~^(8'ha2)) ?
                      (!reg13) : (wire0 >> wire1)) ^~ (~&{wire3, reg12}))) ?
                  wire3[(4'hd):(4'hb)] : wire5[(3'h5):(1'h0)]);
            end
          reg16 <= $unsigned(reg12[(1'h1):(1'h0)]);
        end
      else
        begin
          reg11 <= $unsigned($unsigned(($unsigned(reg16) + (&$unsigned(wire4)))));
          if ((~|($unsigned($signed(((8'h9d) ? reg13 : reg11))) & (((wire0 ?
              reg13 : wire2) ^~ (wire7 ? wire1 : (8'hb1))) + $unsigned((reg15 ?
              reg14 : (8'haf)))))))
            begin
              reg12 <= wire4;
              reg13 <= ($signed($unsigned($signed((&reg9)))) ?
                  (~reg10) : (8'haf));
              reg14 <= $signed($signed({wire3}));
              reg15 <= ((wire6[(1'h0):(1'h0)] ?
                      ({(wire1 >> reg16)} ~^ reg13) : (((8'hb8) >= $signed(wire6)) >> $signed(wire7))) ?
                  ((wire0[(2'h3):(2'h2)] ?
                      (reg12 ?
                          {reg10} : (|reg12)) : $signed(wire8)) & (((~|wire8) ?
                          wire6[(4'ha):(4'h9)] : $signed(wire7)) ?
                      $signed(wire6[(3'h6):(1'h0)]) : reg15)) : $signed(wire3[(4'h8):(2'h2)]));
            end
          else
            begin
              reg12 <= {$unsigned((reg11[(4'ha):(3'h7)] ?
                      ((wire2 ?
                          wire1 : wire4) != $unsigned(wire2)) : (wire4[(3'h5):(1'h0)] < $unsigned((8'ha9))))),
                  wire1[(2'h3):(2'h3)]};
              reg13 <= wire4[(3'h7):(2'h3)];
              reg14 <= (+reg10);
              reg15 <= ($unsigned(wire4[(3'h7):(3'h4)]) | reg14);
            end
          if ((reg10 ?
              {(({wire8, (8'hb2)} | (wire5 ? reg9 : wire8)) ?
                      ((|wire1) ? $unsigned(reg16) : {reg11}) : (~&{(7'h40),
                          reg9}))} : $unsigned(wire5)))
            begin
              reg16 <= $signed((reg9[(3'h4):(2'h2)] ?
                  (!((!(8'h9d)) ?
                      ((8'ha1) ? wire4 : wire0) : (reg14 >= wire8))) : reg15));
              reg17 <= (($unsigned((((8'hb1) ? wire2 : reg12) ?
                      $unsigned(wire8) : (reg15 >>> wire6))) ?
                  (-(wire6 ?
                      $unsigned(wire3) : $unsigned(reg13))) : reg14) + wire1);
            end
          else
            begin
              reg16 <= $signed($signed($signed($unsigned((reg12 ~^ reg10)))));
            end
        end
    end
  assign wire18 = (~&(reg12 ?
                      (!(reg9[(3'h4):(1'h1)] ?
                          {reg17} : $signed((8'haa)))) : ($signed(wire8[(4'h9):(2'h3)]) < reg14[(3'h5):(3'h4)])));
  assign wire19 = wire2[(3'h4):(1'h1)];
  assign wire20 = wire4;
  assign wire21 = reg14;
  assign wire22 = $signed(wire2);
  assign wire23 = reg13[(1'h0):(1'h0)];
  assign wire24 = $signed(wire3);
  assign wire25 = (((($signed(wire1) ? $signed(wire3) : reg13) ?
                      $signed((~&wire6)) : {reg17[(3'h6):(3'h4)]}) || (({wire18} >= (reg17 ?
                      reg10 : wire4)) + (|wire23))) * ((~&($signed(wire18) || wire21)) - (^~(^$unsigned(wire5)))));
  assign wire26 = $unsigned($unsigned(reg13[(3'h7):(1'h1)]));
  assign wire27 = (~|{wire6[(4'hd):(4'ha)], (+(^$unsigned(wire3)))});
  assign wire28 = reg16;
  assign wire29 = ($signed((^~((reg10 ? reg16 : wire28) | {wire23}))) ?
                      (reg15 ?
                          ((+(reg13 ^~ reg11)) ~^ $unsigned((~&wire28))) : {reg12}) : reg11);
endmodule
