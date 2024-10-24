module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  assign y = {wire7,
                 wire6,
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
                 (1'h0)};
  assign wire4 = wire2[(3'h6):(1'h0)];
  assign wire5 = ((~({$signed(wire1)} ? wire3 : wire3)) ?
                     ($unsigned((^(wire3 ? (8'h9d) : wire4))) ?
                         wire1 : (wire0 ?
                             (^~$unsigned(wire0)) : (!((8'ha3) ?
                                 wire4 : (8'haf))))) : ((!$unsigned(wire4[(1'h0):(1'h0)])) ?
                         ((&wire1[(4'hb):(3'h6)]) | wire0) : (^~wire4)));
  assign wire6 = wire5[(2'h3):(1'h0)];
  assign wire7 = wire6[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg8 <= $unsigned($signed({($unsigned(wire2) < wire5)}));
      reg9 <= (+$unsigned($unsigned(((wire0 ?
          wire0 : wire7) || $unsigned(wire5)))));
      reg10 <= $unsigned($signed((($signed(wire3) * $unsigned(reg8)) >> ($unsigned((8'hb8)) ^ (wire4 ?
          wire6 : wire6)))));
      if ($unsigned(($unsigned((~^$unsigned(reg10))) ^ $signed((wire1[(4'hc):(3'h4)] ?
          $unsigned(reg8) : $unsigned((8'hb0)))))))
        begin
          reg11 <= wire5;
          if (($unsigned(reg11[(3'h7):(3'h4)]) ?
              {((wire3 > wire4) ?
                      {wire2[(3'h5):(3'h4)], reg8[(1'h1):(1'h1)]} : ({(8'hb1)} ?
                          (~&wire3) : (reg9 + (8'hb8)))),
                  wire1} : wire3))
            begin
              reg12 <= ({(wire7 ?
                          {(wire1 && (8'hab)),
                              (reg9 >= reg8)} : $unsigned((8'haa)))} ?
                  {((wire6[(1'h1):(1'h0)] ? $signed(wire4) : {reg8}) | (~(reg8 ?
                          (8'ha1) : reg8))),
                      {wire3[(1'h1):(1'h1)],
                          ($signed(wire7) ?
                              wire1[(5'h11):(4'ha)] : $signed(wire0))}} : (reg10 ?
                      ((-(wire3 ? wire2 : reg9)) ?
                          $unsigned((wire5 != wire5)) : ((reg10 ?
                                  wire4 : wire4) ?
                              wire2[(4'h8):(3'h6)] : {reg11,
                                  wire3})) : ((^~(wire7 ?
                          wire0 : wire7)) ^~ $signed(wire6[(1'h0):(1'h0)]))));
              reg13 <= ($signed($unsigned($signed($unsigned(wire7)))) << (reg9[(5'h13):(2'h2)] ?
                  $unsigned((~|wire6)) : (+($signed((8'ha6)) ?
                      (^wire2) : $signed(reg10)))));
              reg14 <= (|wire6[(4'h8):(2'h3)]);
            end
          else
            begin
              reg12 <= wire3;
              reg13 <= (8'ha3);
              reg14 <= (reg14[(3'h6):(2'h3)] ? wire7 : wire3[(1'h0):(1'h0)]);
            end
          reg15 <= ($unsigned($unsigned(($unsigned(wire6) >= (reg8 <= wire2)))) && ((^wire3) ?
              {wire3[(3'h5):(2'h3)]} : (-reg8[(3'h6):(2'h2)])));
          if ($signed($unsigned(($unsigned(wire1[(5'h11):(4'h9)]) | $signed(wire0[(1'h1):(1'h0)])))))
            begin
              reg16 <= $unsigned((~|$signed($signed(reg15[(1'h1):(1'h1)]))));
              reg17 <= ((|$signed($unsigned((~&(8'hab))))) | ({$signed(reg12[(3'h4):(1'h1)])} ?
                  (($unsigned(wire6) <<< (wire4 >>> reg11)) ?
                      ((wire0 * wire6) == wire7) : $signed($signed(wire3))) : (~{$unsigned((8'haa))})));
              reg18 <= $signed(({((reg15 ? wire5 : reg13) >= (wire6 ?
                          (7'h41) : reg16))} ?
                  wire7 : {$signed((wire5 << reg8)), (~&reg17)}));
              reg19 <= wire4[(1'h0):(1'h0)];
            end
          else
            begin
              reg16 <= wire3;
              reg17 <= $signed(wire7);
              reg18 <= $signed($unsigned(((reg11[(2'h2):(1'h0)] >> reg13[(4'h9):(4'h9)]) >> (+(~reg11)))));
              reg19 <= $signed(reg12[(1'h1):(1'h0)]);
            end
          reg20 <= (-(8'ha1));
        end
      else
        begin
          if ((~|((+$unsigned($unsigned(reg15))) <= (((8'hbd) ?
                  $unsigned(reg9) : (wire7 ? reg8 : wire5)) ?
              reg12[(3'h4):(2'h3)] : reg9))))
            begin
              reg11 <= reg20;
              reg12 <= wire5[(4'h8):(3'h6)];
              reg13 <= $signed(reg14);
            end
          else
            begin
              reg11 <= (^reg9[(4'h8):(1'h0)]);
              reg12 <= reg16;
              reg13 <= wire6;
              reg14 <= ({$signed((&{(8'hba), reg18}))} ?
                  ((-(-wire6)) ?
                      (reg10[(1'h0):(1'h0)] ?
                          $unsigned(reg10) : reg20[(3'h7):(1'h0)]) : reg14[(3'h6):(1'h0)]) : ($unsigned((reg8 ^ (reg8 ~^ reg9))) - ($unsigned(reg18[(3'h6):(3'h4)]) ?
                      wire1[(4'h8):(3'h5)] : (~^(reg11 | (8'ha7))))));
              reg15 <= $signed((((((8'hab) ~^ wire2) ?
                  (+reg18) : (reg17 ? wire0 : (8'h9e))) <= $signed({wire1,
                  reg18})) <= $unsigned(reg13)));
            end
          reg16 <= wire2[(4'he):(4'h8)];
          reg17 <= $signed(wire3);
          reg18 <= reg18;
        end
    end
endmodule
