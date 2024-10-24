module top
#(parameter param29 = ({(!(((8'hae) <<< (8'h9c)) ? ((8'hae) ~^ (8'h9c)) : ((8'haf) >> (8'ha7))))} - (((~&((8'hb4) ? (8'hbd) : (8'hb3))) ? (~|((8'hbd) ? (8'hbd) : (7'h43))) : ((8'hb8) != ((8'hb6) ? (8'ha9) : (8'haa)))) <<< (~(|((8'ha0) ^ (8'h9c)))))), 
parameter param30 = ({(((~(8'hb2)) ? (|param29) : param29) * ((param29 <<< param29) ? (&param29) : param29))} ? (&(!(~&(~|param29)))) : ({(8'ha0)} ? (!{((8'h9d) < param29)}) : (param29 ? (^~param29) : (((8'haa) < param29) ? param29 : (param29 ? param29 : param29))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire20;
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire28,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
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
      reg4 <= (wire3 ?
          ((~&{wire0, wire1}) ?
              (8'ha7) : (&$unsigned((wire2 + (7'h40))))) : (8'had));
      reg5 <= wire0;
      if ((!(!($signed((wire1 > reg5)) ?
          $unsigned(reg5) : $unsigned((8'hb2))))))
        begin
          reg6 <= reg5[(4'ha):(3'h4)];
          reg7 <= ($unsigned(wire3) ?
              {reg6[(4'h9):(4'h8)],
                  ((~$unsigned(wire0)) || $signed($unsigned(wire3)))} : reg4);
          reg8 <= ((wire1 > (((wire2 ? wire0 : (8'h9c)) ?
              (reg6 >>> wire2) : reg4[(3'h4):(1'h0)]) >> (wire0[(3'h6):(3'h6)] >>> wire2))) < $signed($signed(wire2)));
          reg9 <= $signed($signed(reg8[(3'h6):(1'h0)]));
        end
      else
        begin
          reg6 <= (((wire2[(1'h0):(1'h0)] ?
                      (~^reg7) : $unsigned(reg7[(3'h4):(2'h2)])) ?
                  $signed(((8'hab) ?
                      reg5[(3'h6):(1'h0)] : (wire2 ? reg5 : reg9))) : wire0) ?
              $signed({(-wire0),
                  $unsigned(reg6[(4'h9):(4'h8)])}) : reg4[(4'ha):(3'h6)]);
          reg7 <= ($unsigned((wire1[(3'h6):(2'h3)] ?
                  $unsigned((reg9 < reg6)) : (|(|wire1)))) ?
              wire0[(2'h3):(1'h1)] : reg6[(1'h0):(1'h0)]);
        end
      if (wire3[(2'h3):(1'h1)])
        begin
          reg10 <= wire3[(2'h3):(1'h0)];
          reg11 <= ($signed(wire3) ? wire0 : reg5);
          reg12 <= {(reg6 ?
                  (^~reg11[(3'h5):(2'h3)]) : (~|$unsigned((wire1 >= reg6)))),
              $unsigned(((~&$unsigned(reg10)) ?
                  (^~$unsigned(reg6)) : (^~$signed(reg4))))};
          reg13 <= ({wire0[(3'h4):(3'h4)],
                  (wire0 && $signed((reg12 ? reg10 : wire3)))} ?
              $unsigned(reg12) : $unsigned((8'hb1)));
          reg14 <= ($signed($signed($signed($signed(wire3)))) ~^ (^$unsigned((wire2[(3'h6):(2'h2)] ^~ {(8'hbc)}))));
        end
      else
        begin
          if (wire0[(2'h2):(2'h2)])
            begin
              reg10 <= {wire0};
              reg11 <= (reg13 ~^ reg7[(1'h0):(1'h0)]);
              reg12 <= wire1[(5'h10):(2'h3)];
            end
          else
            begin
              reg10 <= reg4[(4'ha):(3'h5)];
              reg11 <= (((reg7 != $signed({reg5})) ~^ $unsigned(reg12)) * (((((8'ha0) ?
                          reg10 : reg8) ?
                      $unsigned(reg8) : {reg8, reg7}) ?
                  (~^$unsigned(wire2)) : ((!reg14) & $unsigned(reg7))) * ({(-wire1)} | ((reg9 ?
                      reg8 : reg12) ?
                  (reg10 ? reg6 : reg14) : $unsigned((8'hb6))))));
              reg12 <= $unsigned(((~&(reg8 ? (&(8'ha5)) : {(8'haf), reg4})) ?
                  $unsigned(reg6) : $signed($signed(reg7[(3'h4):(2'h2)]))));
            end
          reg13 <= ((-reg11[(2'h3):(2'h3)]) > ({(+$signed((8'hbe))),
              $signed({reg5, (7'h43)})} >= $signed(({wire1} ?
              reg6 : (wire3 ? reg10 : wire2)))));
          if (reg4)
            begin
              reg14 <= $unsigned(reg13[(1'h0):(1'h0)]);
              reg15 <= wire2[(4'h9):(3'h6)];
              reg16 <= {(wire0[(1'h1):(1'h1)] > $signed($signed((reg14 ?
                      wire0 : reg9))))};
              reg17 <= (~&(wire3 | $unsigned((8'hb4))));
              reg18 <= (8'hb4);
            end
          else
            begin
              reg14 <= $signed($signed($unsigned((^{reg11, reg15}))));
              reg15 <= ((~^$unsigned(($signed(reg4) ?
                  (reg17 - reg4) : {(8'h9d),
                      reg10}))) | (|wire2[(1'h0):(1'h0)]));
              reg16 <= (~(!wire2[(2'h2):(1'h0)]));
              reg17 <= (^~(wire2[(4'h8):(3'h6)] ?
                  $unsigned(((8'hba) ?
                      $unsigned(reg16) : wire1[(4'h8):(1'h1)])) : (8'had)));
            end
          reg19 <= (($unsigned($unsigned((+reg4))) == {$unsigned(reg10[(1'h0):(1'h0)]),
                  reg5}) ?
              ((((reg18 ~^ reg14) ?
                  reg6[(4'h8):(1'h1)] : (reg8 ?
                      reg7 : reg14)) | ($signed(reg10) <<< (reg18 ?
                  reg17 : reg9))) >= $unsigned((reg5 ?
                  $signed(reg10) : $signed(reg10)))) : (|($signed((reg4 + reg17)) ?
                  (((8'hb5) ~^ reg7) ?
                      (reg13 ^~ (8'had)) : reg4[(4'h8):(3'h5)]) : reg11[(5'h12):(5'h10)])));
        end
    end
  assign wire20 = reg7;
  assign wire21 = $unsigned((~{reg9}));
  assign wire22 = ($unsigned(($unsigned((wire20 ^~ wire2)) ?
                          ($signed(reg17) ?
                              (reg19 ?
                                  (8'ha7) : reg18) : $unsigned((7'h40))) : wire2[(3'h5):(2'h2)])) ?
                      $unsigned($unsigned($signed((reg18 ?
                          reg7 : reg19)))) : ((reg10 ? wire0 : wire20) ?
                          {$signed(reg8[(3'h6):(2'h3)])} : $unsigned((~&(reg10 ?
                              reg18 : reg19)))));
  assign wire23 = ($signed((~reg17[(1'h1):(1'h1)])) ?
                      (wire2[(4'hb):(4'ha)] <= (&$signed((reg7 <<< reg9)))) : (~|(^~$signed($unsigned(reg12)))));
  always
    @(posedge clk) begin
      reg24 <= (~^((+$unsigned(reg18)) >>> (~^$signed({wire22}))));
      reg25 <= $unsigned((wire3 ? reg5 : wire2[(3'h6):(2'h2)]));
      reg26 <= $signed((reg10 ?
          ($unsigned((reg19 == (7'h42))) - (!reg18[(1'h0):(1'h0)])) : {$signed($signed(reg19))}));
      reg27 <= ((wire23[(3'h7):(2'h3)] ?
              ((^$signed(reg9)) ?
                  $signed($signed((7'h42))) : ($signed(reg7) ?
                      $signed(reg11) : (reg9 < (7'h41)))) : reg18[(4'h8):(4'h8)]) ?
          $unsigned(({wire3[(1'h1):(1'h0)], (reg24 != wire2)} ?
              $unsigned($signed(reg5)) : $unsigned((reg6 ?
                  wire3 : wire21)))) : (~|reg6));
    end
  assign wire28 = reg12;
endmodule
