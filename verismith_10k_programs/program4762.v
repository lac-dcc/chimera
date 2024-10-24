module top
#(parameter param23 = (~&(!(^~{((7'h42) ? (7'h44) : (8'hb1))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire4,
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
  assign wire4 = ($unsigned($signed($signed((|(8'hbf))))) > {(^~(wire1 ?
                         wire0 : (wire2 << wire0))),
                     {wire3, wire0}});
  always
    @(posedge clk) begin
      reg5 <= ((wire2[(3'h7):(2'h3)] ?
              wire0[(3'h7):(3'h5)] : {$unsigned((-(8'ha8)))}) ?
          (wire4 ?
              (wire3 || (~(+wire3))) : wire2) : (($unsigned(((8'ha5) >>> wire0)) ?
                  (wire2[(4'h8):(1'h1)] ?
                      (wire1 ? wire1 : wire4) : {wire3,
                          wire3}) : (wire4 ~^ (wire1 ~^ wire3))) ?
              (wire3[(3'h7):(1'h1)] ?
                  {(wire4 <<< wire1)} : (wire3[(5'h15):(4'hd)] || $signed(wire2))) : wire2));
      if (($unsigned(((!{wire4}) ?
          (wire1 ?
              wire1 : ((8'hb2) * (8'h9f))) : $signed((wire1 >= wire2)))) >>> wire1))
        begin
          reg6 <= $signed((($signed(wire3[(4'hf):(1'h0)]) ?
              wire1[(1'h1):(1'h1)] : wire2[(3'h6):(2'h2)]) <<< wire4[(4'h8):(4'h8)]));
          reg7 <= {wire3[(5'h15):(4'hd)], wire4[(1'h1):(1'h1)]};
        end
      else
        begin
          reg6 <= (reg5 || $signed(reg7));
          reg7 <= reg5[(3'h4):(3'h4)];
          reg8 <= $signed((+wire1[(1'h1):(1'h1)]));
        end
      reg9 <= ({($unsigned(wire3) >>> (reg7 ?
                  (~^wire3) : reg6[(1'h0):(1'h0)]))} ?
          wire1[(1'h0):(1'h0)] : ($signed(((reg6 > wire4) ?
                  {(8'hb0)} : (wire0 <<< (8'ha2)))) ?
              reg5[(1'h1):(1'h1)] : wire3));
      reg10 <= wire1;
      if ({$unsigned({reg6, ((reg9 ? reg6 : reg9) ^ wire2[(1'h0):(1'h0)])})})
        begin
          if ($unsigned(($signed((^(8'ha7))) ? reg8 : (8'hbd))))
            begin
              reg11 <= (^~reg6);
              reg12 <= reg11;
              reg13 <= (~$signed($signed($signed((reg11 ? reg6 : wire2)))));
              reg14 <= ($unsigned(((reg6[(3'h5):(1'h0)] && reg7[(3'h4):(1'h1)]) ^~ $signed((reg5 ?
                      reg5 : wire0)))) ?
                  ((8'hbf) >>> reg13) : ((-$unsigned(wire0[(3'h6):(2'h2)])) != wire3));
              reg15 <= $unsigned(wire4[(2'h3):(1'h0)]);
            end
          else
            begin
              reg11 <= (wire4[(3'h6):(3'h4)] ? (|wire4) : wire2[(2'h2):(1'h0)]);
              reg12 <= (+$unsigned(reg14));
              reg13 <= (~&($unsigned($signed((~reg11))) ^~ reg7));
              reg14 <= $unsigned(((&$signed((reg9 ?
                  reg14 : (8'ha2)))) * (+reg13)));
            end
          reg16 <= reg14[(3'h4):(2'h2)];
          reg17 <= $signed($unsigned((8'hb7)));
          reg18 <= (+(|wire0));
        end
      else
        begin
          if ((((($signed(reg13) & $signed(reg17)) * (reg12 + $unsigned(wire1))) & ({(&reg12),
                  $unsigned(reg12)} >> reg10)) ?
              $signed($unsigned(reg7)) : $unsigned({((!reg8) != (reg5 - reg7)),
                  wire1[(2'h3):(1'h1)]})))
            begin
              reg11 <= ((&(reg5[(4'hd):(3'h6)] - (&(reg8 != reg9)))) >> $unsigned((+(^~{reg10,
                  reg15}))));
              reg12 <= $signed($unsigned(($unsigned(((8'hb0) <= reg8)) ~^ $unsigned($unsigned((8'hb9))))));
              reg13 <= $signed(((~((~(8'hba)) ^ ((7'h41) ?
                  reg5 : wire4))) * (~&$signed({reg17}))));
              reg14 <= (&(^(~&$signed((reg13 | reg18)))));
            end
          else
            begin
              reg11 <= reg13;
              reg12 <= (~^reg5);
              reg13 <= $unsigned(($unsigned(reg10) ?
                  (^reg14) : $unsigned((~&(|reg15)))));
            end
          reg15 <= wire3;
          reg16 <= wire4[(1'h1):(1'h1)];
          reg17 <= $unsigned(($signed({wire1}) ?
              reg7 : (($signed(wire0) > $unsigned(reg17)) ?
                  reg8[(3'h7):(1'h1)] : $unsigned((reg14 >= (8'hab))))));
        end
    end
  assign wire19 = reg10;
  assign wire20 = (reg7[(3'h4):(1'h0)] ? $signed(reg5) : (8'hbe));
  assign wire21 = ($unsigned(reg5) || (~&(~^(~$unsigned(wire3)))));
  assign wire22 = ((!reg8[(1'h0):(1'h0)]) >> $unsigned({$signed($unsigned(reg7)),
                      $signed((~|wire4))}));
endmodule
