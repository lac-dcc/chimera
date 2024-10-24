module top
#(parameter param30 = (|{{(((7'h42) << (8'ha6)) ? (^~(8'hb6)) : ((8'hb0) >= (8'hb9)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (^~wire2[(3'h6):(3'h6)]);
  assign wire6 = wire0[(3'h6):(3'h4)];
  assign wire7 = (|(^$unsigned($unsigned(wire1[(4'hb):(4'ha)]))));
  assign wire8 = ((wire1[(4'he):(4'h8)] >= $unsigned((wire2[(3'h6):(3'h5)] ?
                     (wire0 ? wire7 : wire6) : $signed(wire6)))) ^~ wire6);
  assign wire9 = wire5[(1'h0):(1'h0)];
  assign wire10 = {wire8};
  always
    @(posedge clk) begin
      reg11 <= ((wire0[(4'ha):(3'h7)] + {wire1, wire2}) ?
          (^(8'hbe)) : wire9[(2'h3):(2'h2)]);
      reg12 <= wire3;
      if (((~&wire2[(1'h0):(1'h0)]) ?
          (wire7[(1'h0):(1'h0)] ? wire1 : (7'h40)) : {wire6}))
        begin
          reg13 <= ($signed(wire0) ?
              ($unsigned($signed($unsigned((8'hbe)))) ?
                  $signed(reg12) : (^~$unsigned((wire3 ~^ reg12)))) : wire10[(4'h8):(3'h5)]);
          reg14 <= $signed($unsigned($signed(((8'hb3) == {wire9, wire3}))));
          if (wire9[(4'h9):(4'h9)])
            begin
              reg15 <= $signed($unsigned((8'ha7)));
              reg16 <= (^~(wire1 ?
                  (~$unsigned($unsigned(reg12))) : ($unsigned($unsigned(reg13)) ?
                      ((wire0 ? wire5 : wire8) ?
                          $signed(wire8) : $signed((8'ha2))) : $unsigned($signed(reg13)))));
              reg17 <= ($unsigned($signed($unsigned($signed(reg15)))) ?
                  (!$unsigned((!(~wire4)))) : wire9[(1'h0):(1'h0)]);
              reg18 <= {((&((!(8'hbb)) ?
                      (wire0 ? (8'haf) : wire0) : $signed(wire5))) - (8'h9d)),
                  (8'hab)};
            end
          else
            begin
              reg15 <= ($signed($signed((((8'ha1) != wire8) ?
                  $signed(reg15) : reg13[(4'he):(4'he)]))) && wire8[(3'h4):(1'h1)]);
              reg16 <= wire0;
              reg17 <= (($signed($signed(wire1)) ?
                  ({(wire7 ? reg12 : reg11)} ?
                      $signed($unsigned(wire9)) : $unsigned((&wire0))) : (wire9 ?
                      ({wire5,
                          reg11} * {wire5}) : reg15[(2'h2):(1'h0)])) - ((reg13 ?
                      $unsigned($unsigned(reg18)) : ((wire9 || reg16) + (reg16 & reg13))) ?
                  ((reg11 ? (|reg17) : wire1) ?
                      $signed(wire3) : (wire8[(5'h13):(4'h8)] != {wire4})) : (wire4[(3'h6):(3'h6)] != wire1[(1'h1):(1'h1)])));
              reg18 <= ((((~$unsigned(wire9)) ?
                      ((wire0 ?
                          (8'ha0) : wire5) ^ $unsigned(wire8)) : ((reg14 > (7'h41)) ?
                          (+wire5) : (wire0 > reg18))) && ($signed((~^reg14)) ^~ wire6)) ?
                  {(reg16 ? reg14 : (^wire4[(2'h3):(2'h2)]))} : (-reg11));
              reg19 <= $signed(reg16[(3'h5):(3'h4)]);
            end
        end
      else
        begin
          reg13 <= wire7;
          reg14 <= (wire8 ?
              ($unsigned(reg17) ?
                  ($signed({(8'hae)}) | ((~|(8'hb2)) || (8'h9f))) : (~^({wire10,
                      reg12} >> $signed(reg12)))) : $signed(((-$signed(wire8)) ?
                  wire10 : wire7)));
          reg15 <= wire10;
          reg16 <= {$signed(wire7),
              (reg17[(1'h0):(1'h0)] - {((~^reg17) ^~ ((8'hbc) ?
                      wire10 : wire3)),
                  (wire10[(3'h5):(2'h3)] | reg11)})};
          if ((((-(~wire2)) ?
              ($signed((wire10 ?
                  reg15 : wire6)) >> ($unsigned(reg11) >>> $signed(wire3))) : reg14[(3'h4):(2'h2)]) < (|(($signed(reg18) & wire1[(4'hd):(4'h8)]) ?
              wire7[(3'h6):(3'h6)] : wire10[(4'h8):(3'h6)]))))
            begin
              reg17 <= (reg11 <<< (|reg14[(3'h4):(2'h2)]));
            end
          else
            begin
              reg17 <= (((&(~(~^wire6))) - (($signed(reg16) != reg16[(1'h1):(1'h0)]) * $signed($signed((8'ha7))))) ?
                  reg17[(3'h4):(1'h0)] : $signed(reg17));
              reg18 <= reg11[(4'he):(3'h7)];
              reg19 <= reg11[(5'h10):(4'h9)];
            end
        end
      if ($unsigned($unsigned((wire10 < wire4[(2'h3):(2'h2)]))))
        begin
          if (((!($unsigned(reg18[(3'h6):(2'h3)]) ?
                  wire9[(4'h8):(1'h0)] : $signed(wire8[(1'h1):(1'h1)]))) ?
              wire8 : wire5))
            begin
              reg20 <= $unsigned((wire8 ?
                  $signed($signed($signed(wire7))) : reg13[(4'hc):(4'hb)]));
              reg21 <= (|(&(wire5 << $unsigned(wire0))));
              reg22 <= (+(8'hb0));
            end
          else
            begin
              reg20 <= (((8'h9e) ?
                      ($signed((~&wire3)) ?
                          $signed(reg19) : $signed($signed(reg15))) : $unsigned(wire7[(4'he):(1'h1)])) ?
                  (reg17 >>> $signed($unsigned((8'hb4)))) : ((+$signed(wire0[(4'h9):(4'h9)])) ?
                      wire7[(4'h8):(3'h5)] : wire10[(3'h6):(2'h3)]));
            end
          reg23 <= (8'hba);
          if ((reg12 >> (~^wire9[(2'h3):(1'h1)])))
            begin
              reg24 <= wire6[(3'h4):(1'h1)];
              reg25 <= {$unsigned($unsigned($signed($signed(reg15))))};
              reg26 <= ($signed(reg19) + $signed($signed((8'h9e))));
            end
          else
            begin
              reg24 <= {(^$signed($signed(wire0)))};
              reg25 <= ((wire1 && ($unsigned((wire0 | reg22)) || ((reg14 ?
                      reg20 : wire3) ?
                  {reg16} : (wire9 << reg14)))) << $unsigned($unsigned($unsigned((reg15 ?
                  reg16 : reg21)))));
              reg26 <= $signed((^~wire2));
              reg27 <= {reg19[(3'h7):(2'h2)], wire9};
              reg28 <= ({$unsigned(reg13), reg21[(3'h7):(2'h3)]} < {(^reg26)});
            end
          reg29 <= $signed({(&reg27)});
        end
      else
        begin
          if ($signed(((reg17 ? (!(reg27 | wire8)) : wire6[(2'h2):(2'h2)]) ?
              reg11 : wire6[(2'h2):(2'h2)])))
            begin
              reg20 <= reg27;
              reg21 <= $signed(({$unsigned((+reg20)), reg26[(4'h8):(3'h4)]} ?
                  (~^(~|(reg28 || (8'h9d)))) : $signed(reg27)));
              reg22 <= wire10[(4'h8):(2'h2)];
              reg23 <= {reg20[(3'h5):(2'h3)], wire8};
            end
          else
            begin
              reg20 <= {$signed((&reg17))};
            end
          reg24 <= (~^reg29[(1'h0):(1'h0)]);
          reg25 <= $unsigned(reg17[(3'h5):(2'h2)]);
          reg26 <= ({$signed($unsigned($signed(wire10)))} ?
              reg19[(3'h5):(3'h4)] : ($signed((((8'hb9) >= reg16) && $signed(wire3))) ?
                  ($signed($signed(reg21)) ?
                      (^$signed(reg23)) : ((reg15 ?
                          wire1 : wire1) <= (+reg21))) : ($unsigned({reg25,
                      reg27}) << wire3[(2'h2):(1'h0)])));
          reg27 <= $signed((wire9[(4'h8):(2'h3)] ?
              reg13[(5'h12):(5'h10)] : (-($signed((8'hbf)) ?
                  (wire9 ? wire3 : (8'hbe)) : (~^reg18)))));
        end
    end
endmodule
