module top
#(parameter param34 = (((+{(|(8'hbc)), {(8'hb4), (8'hb6)}}) ? (({(8'hb8), (8'ha4)} ? {(8'ha9)} : (^~(8'hbe))) <<< ((~|(7'h44)) != ((8'hb0) != (8'hb9)))) : (((~(8'hb6)) ? ((8'had) ^ (8'hb1)) : {(8'hae), (8'hb1)}) << (((8'hb3) >>> (8'hbb)) ? ((8'h9c) ? (8'hb7) : (8'hb2)) : (7'h44)))) > ((^(((8'h9d) >>> (8'h9e)) ? ((8'hae) ? (8'haf) : (8'hb6)) : ((8'hba) <<< (8'hac)))) ? ((~^((8'ha6) ? (8'hb3) : (8'hbe))) ? (((8'ha1) | (8'hb0)) >= (|(8'ha0))) : (-{(8'hae), (8'hbb)})) : ({(^~(8'ha1)), ((8'hb0) >>> (7'h42))} ~^ ({(8'hb6)} ? ((8'hbf) ? (8'ha0) : (8'ha8)) : ((8'hb6) ? (8'hb0) : (8'hb1)))))), 
parameter param35 = ((({(!param34)} ? (~^{param34, param34}) : ((param34 <<< param34) ? (param34 * param34) : (param34 | param34))) << (7'h40)) + (8'ha8)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h141):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(3'h6):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire4,
                 reg31,
                 reg30,
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
  assign wire4 = wire0;
  always
    @(posedge clk) begin
      if ((|$unsigned(wire2)))
        begin
          reg5 <= (~|$signed(wire0));
          reg6 <= wire0;
          reg7 <= (($unsigned(reg6[(2'h2):(1'h1)]) ?
              reg5 : (|(8'hb5))) || wire1[(3'h5):(1'h0)]);
        end
      else
        begin
          if ($signed($signed(wire1[(2'h2):(2'h2)])))
            begin
              reg5 <= wire0;
              reg6 <= ($unsigned($signed({wire4})) ?
                  $signed($unsigned(((|wire4) == wire4[(2'h3):(2'h2)]))) : $signed(($unsigned(wire2) ?
                      $unsigned(((8'hb7) ?
                          (8'hb9) : wire4)) : $signed(((8'hb3) - reg6)))));
              reg7 <= (^reg6[(1'h1):(1'h0)]);
            end
          else
            begin
              reg5 <= (~|($unsigned((-(8'hb5))) ?
                  $unsigned($signed({wire0})) : reg7[(3'h5):(3'h5)]));
              reg6 <= (reg5 ?
                  (~^(^~wire1[(1'h1):(1'h1)])) : $unsigned(reg6[(3'h4):(2'h2)]));
              reg7 <= wire0[(5'h12):(2'h2)];
              reg8 <= $signed(wire4);
            end
          reg9 <= ($signed(wire4) ? (-reg6) : $unsigned(wire1[(1'h1):(1'h0)]));
          reg10 <= wire3;
          if ((8'hba))
            begin
              reg11 <= reg6[(3'h5):(1'h0)];
            end
          else
            begin
              reg11 <= ($unsigned(({reg10[(1'h1):(1'h0)],
                  (~&reg10)} > (reg9[(1'h0):(1'h0)] || {reg8,
                  (8'h9d)}))) ^~ wire2);
              reg12 <= $signed({($unsigned({wire0,
                      wire4}) != $unsigned($signed(reg8))),
                  {reg8, ((reg5 * (8'ha9)) ? (|reg6) : {reg6})}});
              reg13 <= (~&((^((&reg11) ?
                  (8'hab) : (|wire4))) << reg5[(1'h1):(1'h0)]));
              reg14 <= $signed(wire0[(3'h4):(3'h4)]);
            end
        end
      reg15 <= $unsigned({(|((wire4 ? reg6 : (8'hb4)) == (~reg14))),
          ($unsigned($unsigned(wire2)) == (7'h40))});
      if (reg11[(2'h2):(2'h2)])
        begin
          reg16 <= ($signed(({wire1} ?
              wire3 : reg14[(1'h0):(1'h0)])) < (!(&wire1[(3'h6):(3'h6)])));
        end
      else
        begin
          if ((+(reg7 <<< (((reg14 > reg15) ? wire4 : reg16) ? reg16 : reg16))))
            begin
              reg16 <= ($unsigned((8'haf)) <<< wire2);
              reg17 <= wire0;
              reg18 <= (($signed(reg10[(4'ha):(3'h5)]) ?
                      {reg11[(3'h4):(1'h1)]} : $signed({reg10[(3'h6):(3'h4)]})) ?
                  (((reg5 ? (reg15 ? wire2 : reg16) : $unsigned((8'hb8))) ?
                      ((reg5 ? wire3 : reg5) ?
                          (+(8'hb8)) : (wire4 ?
                              wire1 : reg10)) : (8'ha4)) + (|$signed((!reg12)))) : $unsigned(((|$signed(reg17)) > $unsigned((~reg10)))));
            end
          else
            begin
              reg16 <= {((reg11 == (+(wire3 ? reg16 : reg12))) ~^ reg15),
                  (reg17[(4'hd):(4'h9)] ?
                      reg8[(3'h6):(1'h0)] : $signed(reg14))};
              reg17 <= ((reg5[(3'h5):(2'h3)] > reg8[(4'h8):(1'h1)]) > $unsigned((reg18 << ($unsigned((8'h9d)) + reg12[(4'hc):(4'hb)]))));
              reg18 <= $signed(wire3[(2'h2):(2'h2)]);
            end
          if ((((({wire4} ?
                  $signed(wire3) : (reg18 ? reg14 : reg5)) || (~reg16)) ?
              (((reg10 && reg16) ?
                  (^reg11) : $unsigned(wire0)) || reg15) : $unsigned((8'hba))) ^ $unsigned(reg9[(1'h1):(1'h1)])))
            begin
              reg19 <= $unsigned(((8'hb0) != {reg10,
                  ($unsigned(wire1) >> ((8'hb6) + reg13))}));
              reg20 <= $unsigned(reg15);
              reg21 <= reg13;
            end
          else
            begin
              reg19 <= (($signed($unsigned((wire0 ? reg7 : (8'ha9)))) ?
                  $signed($signed((reg6 << reg12))) : ($signed((reg20 > reg10)) ?
                      (((8'ha9) ?
                          (8'hbe) : wire2) * (8'ha0)) : ({wire4} ^~ reg12[(4'h8):(3'h5)]))) <<< wire3);
              reg20 <= $unsigned(reg19);
              reg21 <= ((+(reg6[(3'h6):(1'h0)] ?
                      {(reg12 ~^ reg10)} : $signed(reg11))) ?
                  $unsigned($unsigned((~{reg20, (8'ha1)}))) : {{(^~reg14)},
                      $unsigned(reg21[(3'h6):(3'h6)])});
              reg22 <= $unsigned((!reg18[(4'h9):(1'h1)]));
            end
        end
    end
  assign wire23 = reg14[(1'h1):(1'h0)];
  assign wire24 = ((reg21[(4'h9):(3'h7)] < reg20[(1'h1):(1'h1)]) ?
                      {(reg8[(3'h6):(2'h2)] ?
                              (8'ha9) : $signed((8'hb4)))} : ({((reg13 == reg6) >> (&(8'hb1)))} ?
                          $unsigned(((wire3 ? reg22 : wire1) ?
                              (^reg19) : reg7)) : (8'ha0)));
  assign wire25 = reg13;
  assign wire26 = (7'h43);
  assign wire27 = $signed($unsigned({(reg7[(2'h2):(1'h0)] < $signed(wire3)),
                      wire24}));
  assign wire28 = wire4;
  assign wire29 = (reg15 | reg19);
  always
    @(posedge clk) begin
      reg30 <= (wire28[(4'h9):(2'h2)] ? wire3[(3'h7):(3'h4)] : reg12);
      reg31 <= $unsigned(wire0);
    end
  assign wire32 = wire24[(2'h3):(1'h1)];
  assign wire33 = (reg20[(1'h1):(1'h1)] ?
                      (!($signed((^wire32)) - ((reg15 <= wire24) ?
                          reg22 : (~^wire3)))) : (+(^(8'hb3))));
endmodule
