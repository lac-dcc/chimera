module top
#(parameter param26 = ({((((8'ha0) && (7'h43)) >> ((8'hb8) ^~ (8'hb0))) * (7'h44)), (((~^(8'hba)) < ((7'h40) >>> (8'hb1))) | (-{(7'h40)}))} ? ((~^{((8'haf) ? (8'ha4) : (8'ha4)), ((8'haa) ? (8'hb0) : (8'ha5))}) ? {(|{(8'ha0)})} : ((+((8'hb0) ? (8'hb0) : (8'h9d))) ? (((8'hb0) << (8'ha2)) ? (!(8'hab)) : (-(8'hab))) : (((8'hb5) | (8'hab)) | ((8'hba) ~^ (8'ha6))))) : ((~|{((7'h42) ? (8'hb8) : (8'hb4)), {(7'h43), (8'hb0)}}) ? ((~^(^~(8'ha6))) > (7'h42)) : (({(8'hb1), (8'hbf)} ? ((8'hb7) ~^ (8'haa)) : ((8'ha9) ? (8'had) : (8'hb1))) <<< (!{(8'hb6), (8'hb5)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(4'he):(1'h0)] reg5 = (1'h0);
  reg signed [(4'he):(1'h0)] reg4 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($unsigned(wire0));
      if ({(reg4[(3'h4):(1'h1)] ? reg4 : $unsigned($signed($unsigned(wire2))))})
        begin
          reg5 <= $signed(wire0);
          reg6 <= $unsigned((wire0 ?
              $signed(({wire1} < ((8'hae) >= wire3))) : $signed(reg4[(2'h2):(1'h1)])));
          reg7 <= (reg6 ? reg6[(1'h0):(1'h0)] : $unsigned(wire3));
          reg8 <= (8'hb4);
        end
      else
        begin
          reg5 <= $unsigned($signed($signed($signed($signed(wire2)))));
          reg6 <= $unsigned(wire1[(2'h3):(2'h2)]);
        end
      reg9 <= (+(wire1[(4'hb):(1'h0)] ?
          reg4[(4'hc):(4'h9)] : $signed((wire1[(1'h1):(1'h0)] ?
              reg5[(3'h7):(2'h2)] : reg7[(2'h3):(2'h2)]))));
      if ((|$signed(((&reg5) <<< reg5[(2'h2):(1'h0)]))))
        begin
          reg10 <= $signed(($unsigned($signed((~|reg4))) < (!reg5[(1'h0):(1'h0)])));
          if ($unsigned($signed({{$signed((8'haf))},
              ($unsigned(wire3) ? (reg6 ? reg5 : reg4) : (-wire1))})))
            begin
              reg11 <= $unsigned($unsigned(reg10[(4'hc):(4'h8)]));
              reg12 <= reg11;
              reg13 <= (!$unsigned(reg10[(4'h9):(3'h5)]));
              reg14 <= ((~^$unsigned($signed($signed(reg6)))) ?
                  (-$signed($signed($unsigned(reg11)))) : $unsigned($unsigned(($signed(wire0) ?
                      {wire1} : (reg6 ? (8'hb0) : reg5)))));
              reg15 <= ($unsigned({$signed((reg5 << reg5)), reg12}) ?
                  $unsigned(((^~(+(7'h44))) ~^ $unsigned(((8'ha1) ?
                      wire0 : reg10)))) : $signed(($unsigned(((8'hb0) ?
                      reg14 : reg5)) || ((reg6 ?
                      reg8 : reg9) - reg8[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg11 <= (|wire1[(4'hc):(4'hc)]);
              reg12 <= $unsigned(($unsigned($signed(wire0[(3'h4):(3'h4)])) ?
                  (reg8[(4'ha):(3'h4)] ?
                      ($signed((8'hba)) ?
                          reg12 : (8'hb4)) : (!reg8)) : ($signed((~&(8'hb8))) ?
                      $unsigned((reg6 ? reg5 : reg15)) : (8'hb9))));
              reg13 <= (&((~&wire2) >> $unsigned($unsigned((~reg12)))));
            end
          reg16 <= $signed($signed((&($signed(reg12) ?
              $unsigned(wire3) : (reg11 ~^ reg9)))));
          if (reg4[(4'h9):(3'h5)])
            begin
              reg17 <= $signed((~$unsigned((reg12 ?
                  (+reg16) : $signed((8'ha2))))));
              reg18 <= wire0;
              reg19 <= {$signed(((~|(wire3 ?
                      reg10 : wire1)) >>> $signed((+reg6)))),
                  $unsigned($unsigned(($unsigned(wire2) ~^ $unsigned((8'hb6)))))};
              reg20 <= $signed((+$unsigned(reg15)));
            end
          else
            begin
              reg17 <= (|(wire1 ?
                  (reg13[(3'h5):(3'h4)] - ((^reg14) <= (wire2 ?
                      wire0 : reg9))) : $signed((^$unsigned(reg14)))));
              reg18 <= $unsigned((reg7 ?
                  (-(|$unsigned(reg15))) : reg5[(4'h8):(1'h1)]));
              reg19 <= (^(($signed((reg20 ? reg11 : reg17)) ?
                  {(^reg10)} : $signed(reg11)) ~^ {$unsigned((reg16 ?
                      reg11 : wire2))}));
              reg20 <= reg8[(4'h8):(2'h2)];
              reg21 <= reg11;
            end
          reg22 <= (+$unsigned($unsigned((+(reg16 * reg6)))));
        end
      else
        begin
          reg10 <= ($unsigned($unsigned(reg12)) ? {reg16} : reg13);
          reg11 <= {(~&$unsigned(((reg9 ? (8'ha6) : reg18) || (-(8'had))))),
              reg7[(3'h6):(2'h3)]};
          if (($unsigned(($signed({wire3, reg17}) ?
              $unsigned(wire1) : $signed(reg19))) ^~ reg4[(4'h9):(3'h7)]))
            begin
              reg12 <= (wire2 ?
                  {wire2,
                      reg20[(4'he):(2'h3)]} : $unsigned(reg13[(3'h6):(3'h5)]));
              reg13 <= $signed((^(|$unsigned($unsigned(reg11)))));
            end
          else
            begin
              reg12 <= (~&reg16[(4'h9):(3'h6)]);
              reg13 <= ((8'hbf) ~^ ((reg14 ?
                      $unsigned(((8'h9e) ?
                          reg8 : reg22)) : $signed($signed(reg22))) ?
                  reg13[(3'h5):(3'h5)] : reg13[(3'h7):(1'h0)]));
            end
        end
    end
  assign wire23 = wire1;
  assign wire24 = {reg15[(3'h5):(3'h5)]};
  assign wire25 = (+reg18[(1'h0):(1'h0)]);
endmodule
