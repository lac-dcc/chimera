module top
#(parameter param34 = ((((((8'hac) ? (8'ha7) : (8'hb5)) ? (8'hac) : {(8'hb3)}) <= ((|(8'h9e)) ? (~|(7'h43)) : ((8'ha1) <<< (8'hae)))) | ({((8'hb5) | (8'haa)), ((8'h9e) ? (8'hbc) : (8'had))} == (((8'ha5) ^ (8'h9e)) ? ((8'ha2) ? (8'hae) : (8'haa)) : ((8'h9f) ? (8'ha1) : (8'hbb))))) ? ((~|{((8'had) <<< (7'h41))}) <= (~&({(8'ha6)} == (^~(8'hb7))))) : {(^(((8'hbf) ? (8'haf) : (8'haa)) ^ (~^(8'ha7))))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire5;
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (~|wire1);
  assign wire6 = (+wire5);
  assign wire7 = $signed($unsigned((wire6[(3'h6):(3'h4)] ? (8'h9f) : wire4)));
  assign wire8 = ((((~|(+wire4)) * $unsigned($signed(wire1))) << (!wire1)) ?
                     ((+($unsigned(wire5) ?
                         (wire2 > wire7) : ((8'hbc) ?
                             wire1 : wire2))) >= ((~|(wire6 ? wire4 : wire1)) ?
                         (~|wire3[(3'h6):(2'h3)]) : $unsigned($unsigned(wire7)))) : {($signed((wire4 * wire2)) ?
                             (wire6[(1'h0):(1'h0)] || (8'hb6)) : $signed(((8'ha6) >>> wire2))),
                         (^~$signed(wire1[(3'h4):(1'h1)]))});
  assign wire9 = ((~$signed({$unsigned(wire6)})) ?
                     wire7 : $signed(wire3[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg10 <= {wire7,
          {(~|(wire6[(4'h9):(2'h3)] ? {wire3, wire2} : wire7)), (-{(~wire8)})}};
      if (wire3[(1'h1):(1'h0)])
        begin
          reg11 <= (+(({(reg10 >> (7'h42)), ((8'had) == wire7)} ?
              wire0 : $unsigned($unsigned(reg10))) <= wire1[(5'h10):(4'h8)]));
          reg12 <= ($unsigned({(((8'haa) ? wire9 : wire7) - $signed(wire3)),
              ((-(8'hac)) ?
                  reg11[(2'h2):(1'h0)] : reg10[(3'h7):(1'h1)])}) <<< $unsigned(wire7));
          reg13 <= {wire9};
        end
      else
        begin
          reg11 <= wire5;
          reg12 <= (-{reg13[(3'h5):(1'h1)]});
          if ((+($unsigned($signed({wire5, reg11})) ?
              wire0 : $unsigned(wire5[(1'h0):(1'h0)]))))
            begin
              reg13 <= $signed(reg12);
            end
          else
            begin
              reg13 <= $signed($signed($signed(($unsigned(wire3) ?
                  (|wire8) : $unsigned(wire4)))));
              reg14 <= (($unsigned(wire3) ?
                      $unsigned(wire8) : wire5[(3'h5):(2'h2)]) ?
                  ($signed((reg11[(3'h7):(3'h4)] & (wire0 ^~ (7'h41)))) ?
                      (~^($signed(wire7) <= $signed(wire0))) : reg11) : {({$unsigned(wire6),
                          $signed((8'hbd))} * $signed(reg11)),
                      wire7[(2'h2):(1'h1)]});
            end
          reg15 <= (^~(8'ha3));
        end
      if (($signed(($signed(wire5) || $signed($signed(reg11)))) > $unsigned(((wire5 && (reg12 - wire5)) ?
          (~|(reg11 ? wire6 : wire7)) : (+(reg10 | reg13))))))
        begin
          reg16 <= (wire7[(2'h3):(2'h3)] >> $signed(($unsigned(((8'hbb) != wire3)) ?
              {(reg14 ? reg15 : wire0),
                  (+(8'hb7))} : ($unsigned(wire1) + ((8'haa) || wire2)))));
          reg17 <= wire2[(4'he):(2'h3)];
          reg18 <= $signed({(reg17[(3'h4):(1'h1)] ~^ wire8), (+(-(~&reg17)))});
        end
      else
        begin
          reg16 <= wire5[(2'h3):(2'h3)];
          reg17 <= reg11;
          reg18 <= $signed({(~^({wire6} | $signed(wire1)))});
          reg19 <= reg17;
        end
      reg20 <= (^~(-(~$signed({wire6, wire1}))));
    end
  assign wire21 = $unsigned(($unsigned(wire2) ?
                      {(reg13 ? reg17 : wire3)} : {reg18,
                          ($unsigned(reg11) ^~ $unsigned(wire5))}));
  assign wire22 = (~&((!(+(wire8 ? reg11 : reg19))) ?
                      $signed($signed($signed((7'h40)))) : wire3));
  always
    @(posedge clk) begin
      reg23 <= (-(&wire1));
      reg24 <= (8'ha9);
      if (((^{{$signed(reg14), reg11}}) ? wire9[(3'h4):(2'h3)] : wire3))
        begin
          reg25 <= ($unsigned($unsigned(wire2)) ^ ((wire7 ?
              $signed({reg16,
                  wire22}) : (-wire4)) >> ((~^(!reg23)) ^ reg14[(2'h3):(1'h1)])));
          if ((~^(~^$signed({$unsigned(wire7), (-reg11)}))))
            begin
              reg26 <= (reg15 ~^ $unsigned(wire1[(1'h1):(1'h0)]));
              reg27 <= (~|(~reg19[(1'h1):(1'h1)]));
              reg28 <= {$unsigned((8'hb1))};
            end
          else
            begin
              reg26 <= (+$unsigned(($unsigned(wire7[(2'h2):(1'h1)]) & ($signed(wire4) ?
                  wire5 : $unsigned(wire6)))));
              reg27 <= (+{{(reg24[(1'h1):(1'h1)] ?
                          reg16[(4'ha):(3'h5)] : $unsigned(wire4))}});
              reg28 <= (((($unsigned(wire0) * $unsigned(reg28)) ?
                          ((8'ha4) < (8'hb5)) : wire3[(3'h6):(2'h2)]) ?
                      wire2[(4'hc):(2'h3)] : wire5[(3'h4):(2'h3)]) ?
                  (($unsigned((!wire7)) <= $signed({wire9})) ?
                      (reg20[(2'h2):(2'h2)] * ($unsigned((8'h9c)) <= $unsigned(wire9))) : ($unsigned(wire4[(1'h1):(1'h0)]) == reg14[(3'h4):(2'h3)])) : wire7);
              reg29 <= $unsigned((^wire5));
            end
          if ($unsigned($signed($signed((^$unsigned(reg24))))))
            begin
              reg30 <= ({wire21[(3'h4):(2'h2)]} ?
                  (({((7'h43) ? wire0 : reg13), {reg25, reg26}} ?
                      reg14 : reg25) > $signed(((!reg13) ?
                      (reg18 ?
                          reg27 : (8'haa)) : ((8'hab) > (8'ha1))))) : reg28[(4'he):(3'h6)]);
              reg31 <= ({$signed(reg30)} ?
                  {$signed($unsigned((reg24 ?
                          reg20 : wire21)))} : $signed((8'hae)));
              reg32 <= (((((!reg24) ? $signed(reg28) : reg30) ?
                          {(^~reg15)} : (~&(8'haf))) ?
                      (+$unsigned(reg20[(4'hd):(3'h5)])) : (wire21[(4'he):(4'h8)] ?
                          (7'h41) : $unsigned((+(7'h41))))) ?
                  (-wire22) : wire2[(4'ha):(2'h2)]);
              reg33 <= $unsigned(((($signed(wire4) + wire4) ^~ reg15[(3'h4):(2'h2)]) & (~$signed(reg16))));
            end
          else
            begin
              reg30 <= ($unsigned((~|$unsigned($unsigned((8'haa))))) <= $signed($signed((-(reg15 ?
                  reg17 : reg16)))));
              reg31 <= $unsigned(reg23);
            end
        end
      else
        begin
          reg25 <= ($unsigned({((^reg11) || $unsigned(wire1))}) ?
              $unsigned({$signed(reg31)}) : ((reg10 ?
                  $unsigned((wire2 ? reg23 : reg12)) : ((wire6 < reg25) ?
                      wire3[(2'h2):(1'h1)] : wire6[(1'h1):(1'h0)])) & {($signed(reg29) ?
                      ((8'hbc) ? (8'h9e) : reg20) : reg11)}));
        end
    end
endmodule
