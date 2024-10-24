module top
#(parameter param33 = (({((&(7'h42)) ? ((8'haa) ? (8'had) : (8'hba)) : ((8'hb8) ^~ (8'hae))), (((8'hbe) ^ (8'hb8)) < ((8'hb8) ^ (8'h9c)))} ? {(~((7'h41) ? (8'ha2) : (7'h42))), {((8'haf) ? (8'hb9) : (8'hb0))}} : (+((|(8'hbf)) ? ((8'h9f) ? (8'hb9) : (8'h9f)) : ((8'ha6) - (8'ha4))))) >>> (~^(+(&(+(8'hbe)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(3'h6):(1'h0)] wire29;
  wire signed [(3'h4):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(2'h2):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire5,
                 reg28,
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
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = wire3;
  always
    @(posedge clk) begin
      reg6 <= wire5[(5'h10):(4'hd)];
      if ((8'ha9))
        begin
          if (wire3)
            begin
              reg7 <= $unsigned($signed($unsigned(wire3)));
              reg8 <= reg7[(3'h6):(1'h0)];
            end
          else
            begin
              reg7 <= (((((wire2 ?
                  wire1 : wire0) - (~reg8)) >> reg8) >> wire0) >> (~^(&{{wire4},
                  wire4})));
              reg8 <= $signed((wire5[(4'he):(4'hb)] - $unsigned($signed((wire2 >= reg8)))));
              reg9 <= {wire3[(5'h10):(4'h9)],
                  (~^$signed($unsigned((reg7 ? (8'hb8) : (8'hb4)))))};
              reg10 <= ({reg9} ^~ $unsigned((wire2[(3'h7):(2'h3)] - $signed(reg6[(1'h0):(1'h0)]))));
            end
        end
      else
        begin
          reg7 <= $unsigned((~^wire1));
          if ($unsigned($unsigned((~^wire1[(2'h2):(2'h2)]))))
            begin
              reg8 <= $unsigned(wire0);
              reg9 <= $unsigned((|(((wire5 ~^ wire0) ?
                  reg8 : reg10[(1'h0):(1'h0)]) != (((8'ha2) + reg9) * {wire5,
                  reg6}))));
              reg10 <= {($signed($signed(wire2[(4'h9):(3'h6)])) < (((reg9 >= wire4) ?
                          {(8'hb6)} : (reg7 + wire5)) ?
                      $unsigned($signed(wire5)) : {(wire0 >> (8'hbe)),
                          $unsigned(wire1)})),
                  wire1};
              reg11 <= (~|$signed(($unsigned($signed(wire0)) ?
                  reg10 : ((wire4 - reg10) + $signed(reg7)))));
              reg12 <= $unsigned(($unsigned($unsigned(wire3[(2'h2):(2'h2)])) ?
                  ($unsigned((~^wire1)) ?
                      ((wire4 <<< wire0) + {wire3}) : (^$signed((8'ha7)))) : ($unsigned($signed(wire4)) | (~^(reg7 ?
                      reg11 : reg6)))));
            end
          else
            begin
              reg8 <= (7'h43);
              reg9 <= wire3[(4'h8):(2'h3)];
              reg10 <= reg6;
              reg11 <= (-reg11);
            end
          reg13 <= reg12;
        end
      reg14 <= $unsigned($unsigned({({wire4, reg12} ?
              reg8 : (wire3 ? reg12 : wire4))}));
      if ({wire2})
        begin
          reg15 <= $signed(reg8[(4'hb):(2'h3)]);
          reg16 <= $unsigned(wire3);
          if (((&(($signed((8'haf)) ?
                  $signed(wire0) : (reg7 ?
                      (8'hb5) : wire1)) >>> $unsigned({reg7, reg15}))) ?
              wire5[(4'hd):(4'hd)] : $signed(($unsigned($unsigned(reg11)) ?
                  {$signed(reg9), (8'h9f)} : wire0))))
            begin
              reg17 <= (!wire1[(3'h4):(3'h4)]);
            end
          else
            begin
              reg17 <= reg17[(3'h7):(3'h6)];
              reg18 <= $unsigned($unsigned(($signed(wire3[(4'hb):(3'h6)]) << ((|reg8) ^~ reg15[(3'h4):(1'h1)]))));
            end
          reg19 <= {{wire0, reg10[(2'h3):(2'h2)]}};
        end
      else
        begin
          reg15 <= (((8'hb0) ^~ wire4[(3'h4):(1'h1)]) ^ (^$signed($signed($signed(reg14)))));
          reg16 <= $signed((reg11[(3'h6):(2'h3)] ?
              $signed(((wire5 == reg11) >>> (reg15 - wire5))) : (^~(~^$signed((8'h9d))))));
          if ($unsigned({reg18}))
            begin
              reg17 <= (!$signed(($signed((reg18 ?
                  (7'h42) : reg13)) & reg6[(2'h2):(1'h1)])));
            end
          else
            begin
              reg17 <= wire4[(1'h1):(1'h1)];
              reg18 <= wire5;
            end
          if ((+(reg11[(1'h1):(1'h0)] || $signed({$signed(wire5),
              $signed(reg19)}))))
            begin
              reg19 <= (!reg12[(2'h3):(2'h3)]);
              reg20 <= $unsigned((wire4 <= ($unsigned((reg14 ? wire3 : wire1)) ?
                  $signed($unsigned(reg18)) : reg11)));
              reg21 <= wire5;
            end
          else
            begin
              reg19 <= (~($signed({$unsigned(reg19), $unsigned(wire0)}) ?
                  $signed($unsigned((&wire5))) : reg15[(4'h9):(3'h5)]));
              reg20 <= $unsigned($unsigned((~|reg11[(3'h5):(3'h4)])));
              reg21 <= (~(~$signed($signed((8'haf)))));
              reg22 <= reg9[(4'h8):(1'h0)];
              reg23 <= $signed(reg8);
            end
        end
      reg24 <= (((reg11[(1'h1):(1'h0)] ?
              wire4[(4'h8):(2'h2)] : (reg13 ^ reg19[(4'hd):(4'hb)])) == (~(-(reg9 ?
              (7'h42) : reg11)))) ?
          {reg9, wire3[(4'hf):(4'ha)]} : (reg13[(1'h0):(1'h0)] & reg21));
    end
  assign wire25 = $signed(reg10);
  assign wire26 = reg12;
  assign wire27 = (reg11[(3'h4):(2'h3)] ? (8'hae) : reg22);
  always
    @(posedge clk) begin
      reg28 <= (~(reg15 ^~ {((&(8'hba)) ^ (&wire0)),
          $signed($unsigned((8'hab)))}));
    end
  assign wire29 = $unsigned({(~reg11[(1'h1):(1'h1)])});
  assign wire30 = $unsigned($unsigned($unsigned($signed((+wire2)))));
  assign wire31 = (~^reg28);
  assign wire32 = (((reg19[(2'h3):(1'h1)] - {(-reg9), $unsigned(reg18)}) ?
                      wire1 : (+($unsigned((8'hbc)) < (reg7 && reg14)))) > $unsigned($unsigned($unsigned((reg22 >> (7'h41))))));
endmodule
