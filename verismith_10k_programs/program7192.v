module top
#(parameter param55 = (&(~^(!(-{(8'hbb), (8'h9c)})))), 
parameter param56 = (^param55))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'ha9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire53;
  reg signed [(4'he):(1'h0)] reg4 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  assign y = {wire5,
                 wire53,
                 reg4,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned($signed(wire2));
    end
  assign wire5 = wire1[(5'h12):(5'h11)];
  always
    @(posedge clk) begin
      reg6 <= ($signed($signed($unsigned(reg4))) ?
          wire0 : ($signed((~&$signed((8'hb7)))) >> wire1[(4'h8):(3'h5)]));
      if (((^wire0) ?
          ((wire1 ?
              ((wire1 - wire5) ?
                  {wire3,
                      wire2} : (reg4 <= reg4)) : $signed($signed(wire5))) ~^ (wire1[(2'h2):(1'h0)] ?
              {reg4, $unsigned(reg6)} : {(wire2 ?
                      (8'hb3) : (8'hb5))})) : (wire2[(2'h2):(2'h2)] * wire2)))
        begin
          reg7 <= $signed(($signed(wire1) - {(reg4 ?
                  wire2 : $unsigned(reg6))}));
          reg8 <= $signed((^$signed(wire1)));
        end
      else
        begin
          reg7 <= (~^$signed($unsigned((~|$unsigned(wire3)))));
        end
      reg9 <= {(((wire5 ? (reg6 >>> wire0) : $unsigned((8'ha4))) ?
              (~&(|(8'hac))) : $signed($unsigned(wire3))) != reg4)};
      if ((~^({$signed(((8'hb6) ? wire2 : wire1)), reg6[(1'h1):(1'h1)]} ?
          reg6 : ($signed((reg4 < wire1)) > $signed((wire2 - wire2))))))
        begin
          reg10 <= (~^reg8);
          if ($unsigned(reg7[(5'h11):(4'hd)]))
            begin
              reg11 <= (8'ha4);
              reg12 <= (~^(~$unsigned(reg4[(2'h3):(1'h1)])));
              reg13 <= (-{$signed(($unsigned(wire2) > ((8'hbb) ~^ (8'hbd))))});
              reg14 <= wire2[(2'h3):(1'h1)];
            end
          else
            begin
              reg11 <= (8'h9c);
            end
        end
      else
        begin
          reg10 <= reg7;
          reg11 <= (~^reg14);
          reg12 <= ((((&reg13) == reg9[(1'h0):(1'h0)]) ?
              $unsigned(({reg13} > reg6)) : (+((~reg14) << (reg8 ?
                  reg9 : reg12)))) ~^ (({(^~wire0)} ?
                  ({wire0, wire0} <<< {reg4}) : reg7[(2'h3):(1'h0)]) ?
              reg14[(4'ha):(1'h1)] : $unsigned(reg7[(2'h2):(1'h0)])));
          reg13 <= (!wire3);
          if (reg10[(2'h2):(1'h1)])
            begin
              reg14 <= (+$unsigned($signed(reg13)));
              reg15 <= $unsigned(wire0[(2'h2):(1'h1)]);
            end
          else
            begin
              reg14 <= $signed((7'h44));
            end
        end
      reg16 <= (~^(wire2[(1'h0):(1'h0)] ^~ $unsigned($unsigned((wire3 ~^ wire1)))));
    end
  module17 #() modinst54 (.y(wire53), .wire18(reg7), .wire20(reg8), .wire21(wire3), .wire19(reg14), .clk(clk));
endmodule

module module17
#(parameter param52 = (((8'ha0) < ((((8'hab) >= (8'hb2)) ^ (&(8'h9d))) ? ({(8'hb8), (8'hb9)} ? (&(8'hb7)) : ((7'h43) ? (8'hb9) : (8'ha5))) : (((7'h40) ? (8'haa) : (8'hb0)) ? ((7'h44) ? (8'had) : (8'hb8)) : {(7'h44)}))) <<< (((((8'ha0) ^~ (7'h43)) ? (^~(8'ha0)) : ((8'hac) ? (8'hac) : (7'h40))) + {((8'ha2) <= (8'ha7))}) != (8'ha3))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  input wire [(3'h7):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  wire [(3'h6):(1'h0)] wire51;
  wire signed [(3'h5):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire22;
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire24,
                 wire23,
                 wire22,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire22 = wire21[(4'h9):(4'h8)];
  assign wire23 = $unsigned($signed(wire18));
  assign wire24 = $signed((8'hb9));
  always
    @(posedge clk) begin
      reg25 <= wire22[(4'hc):(3'h5)];
      reg26 <= wire18[(3'h4):(3'h4)];
      if (reg25)
        begin
          if ($signed(wire22[(5'h10):(4'h8)]))
            begin
              reg27 <= {wire21,
                  ((({wire20, wire24} ? ((8'ha5) - reg25) : $signed((8'haf))) ?
                          (wire24 ?
                              (wire22 > wire24) : ((8'hb7) * reg25)) : $unsigned($unsigned((8'ha5)))) ?
                      wire19 : wire19[(3'h6):(3'h4)])};
              reg28 <= (~&$signed((^{$signed(reg25), $signed(wire18)})));
            end
          else
            begin
              reg27 <= (($signed(reg26[(3'h4):(2'h3)]) < reg25[(4'ha):(2'h3)]) ?
                  wire18[(4'hc):(1'h1)] : ($signed((reg27[(3'h5):(1'h1)] < wire21)) ^~ wire19));
              reg28 <= reg25;
              reg29 <= wire22;
              reg30 <= reg27[(4'hb):(3'h5)];
              reg31 <= $signed((wire21 < (reg26 ?
                  ((wire18 == wire22) ?
                      $signed((8'ha3)) : (reg28 ?
                          reg26 : (8'ha6))) : reg28[(4'h9):(3'h6)])));
            end
          reg32 <= ($unsigned((8'hbc)) ?
              wire22[(4'hc):(3'h4)] : (&(reg28[(1'h1):(1'h0)] * {(wire19 ?
                      wire21 : reg25)})));
          reg33 <= wire24[(3'h4):(1'h1)];
          if ($signed($unsigned(wire19[(2'h3):(2'h3)])))
            begin
              reg34 <= (($unsigned((-{reg33,
                      wire22})) || $signed($unsigned((wire21 ?
                      (8'hbd) : (8'hb2))))) ?
                  ($unsigned((^wire19)) ?
                      {((wire18 + reg27) <= (reg30 ? wire24 : wire18)),
                          (((8'hb4) < reg30) ^~ wire21)} : (wire18 ~^ $unsigned(reg27[(3'h5):(2'h2)]))) : $unsigned(((reg33[(4'h8):(4'h8)] ?
                          (wire23 >>> reg26) : $signed(wire22)) ?
                      (reg28[(3'h7):(1'h0)] >> (reg25 >> reg33)) : $unsigned($unsigned(reg27)))));
            end
          else
            begin
              reg34 <= $unsigned(wire19[(2'h2):(1'h0)]);
              reg35 <= ($unsigned((8'hb9)) ?
                  $signed(reg27) : ((reg26 <<< {(reg27 ^ wire19),
                      reg33[(3'h5):(2'h2)]}) ^ reg29[(2'h3):(2'h3)]));
              reg36 <= wire23;
              reg37 <= reg27;
              reg38 <= ((reg25 << {$unsigned((+reg26))}) == $signed((($signed(wire19) ?
                      (reg28 << reg27) : (reg32 ? wire21 : reg36)) ?
                  ($signed(reg34) >> (reg25 < reg35)) : ((reg36 * (8'h9c)) ?
                      (reg34 & wire18) : reg36[(4'h8):(1'h1)]))));
            end
          reg39 <= reg34;
        end
      else
        begin
          reg27 <= (^(~|$unsigned(({reg33, wire21} ?
              (8'ha6) : {wire18, reg26}))));
          if (reg32)
            begin
              reg28 <= (~^((reg25[(4'h9):(4'h9)] >= ((&wire22) ?
                  $signed(wire20) : wire20[(2'h2):(1'h0)])) * (wire22 ?
                  ($unsigned((8'hae)) ?
                      ((7'h42) || reg35) : $signed(reg27)) : {(reg38 ?
                          (7'h44) : (8'haa)),
                      ((8'hb7) ? (8'h9c) : reg35)})));
              reg29 <= (~^($unsigned((+$unsigned((8'h9d)))) ?
                  $unsigned($signed(((8'hb1) | wire24))) : ((7'h44) ?
                      $unsigned({reg38}) : ((reg35 ?
                          (8'hbc) : reg30) < wire20[(4'hb):(2'h3)]))));
              reg30 <= $signed(reg25[(4'h8):(2'h3)]);
            end
          else
            begin
              reg28 <= wire20;
              reg29 <= reg37;
            end
        end
      if ((7'h44))
        begin
          if ((8'h9c))
            begin
              reg40 <= $unsigned((($signed((wire18 ? reg34 : reg37)) ?
                  reg26 : {wire18,
                      (reg39 ?
                          wire22 : wire23)}) & (($signed(reg38) | $unsigned(reg27)) ?
                  $signed($unsigned(reg26)) : reg33)));
            end
          else
            begin
              reg40 <= (!reg27[(4'h8):(2'h3)]);
              reg41 <= wire23[(2'h2):(1'h0)];
            end
          reg42 <= {wire18[(4'hf):(3'h5)]};
          if ((8'ha2))
            begin
              reg43 <= ((reg36 > reg37) || (7'h44));
              reg44 <= (~^((reg30[(2'h2):(1'h0)] * wire22[(4'hf):(3'h5)]) ^ (~^(!(~wire23)))));
              reg45 <= ((wire18[(4'hf):(4'h8)] << (8'h9d)) && ($unsigned($signed(reg35[(5'h10):(3'h5)])) ?
                  $signed($signed({reg28,
                      reg30})) : $signed(reg26[(1'h0):(1'h0)])));
              reg46 <= reg31[(2'h3):(1'h0)];
            end
          else
            begin
              reg43 <= {(7'h42)};
              reg44 <= ((~&((~^$unsigned((8'hb0))) ?
                  $signed($signed(wire18)) : reg33[(3'h6):(3'h4)])) ^~ ($unsigned((~^reg34)) & (~|{(+wire19),
                  reg42[(3'h7):(3'h5)]})));
              reg45 <= $unsigned($unsigned($signed(((^reg35) | (-reg31)))));
              reg46 <= $signed((($signed((reg31 >>> wire20)) && (^~(reg40 | wire19))) ?
                  wire24[(3'h6):(1'h1)] : reg35));
            end
        end
      else
        begin
          if (reg27[(3'h5):(2'h2)])
            begin
              reg40 <= $signed((^~$unsigned(((8'hb0) <<< $signed(reg30)))));
              reg41 <= (8'ha1);
              reg42 <= ($signed($unsigned((&$signed(reg36)))) >>> (8'hb6));
              reg43 <= $unsigned(wire22[(4'hc):(4'hc)]);
            end
          else
            begin
              reg40 <= $signed($unsigned(reg45));
              reg41 <= $unsigned($signed({wire18, $signed(reg44)}));
              reg42 <= $signed($signed(reg40));
            end
        end
      reg47 <= $unsigned(((($signed(wire23) ^~ reg33[(4'hb):(3'h6)]) ~^ reg26[(1'h1):(1'h1)]) < (^~(^$unsigned(wire24)))));
    end
  assign wire48 = (!(8'hb8));
  assign wire49 = $signed($signed((reg40[(2'h3):(1'h1)] & $signed(wire21[(5'h12):(4'h8)]))));
  assign wire50 = ({reg47, $signed($signed(wire20))} ?
                      {($signed($signed(reg45)) ?
                              $unsigned($unsigned(reg36)) : {(^~reg39)})} : (^~$unsigned((wire20[(1'h1):(1'h0)] ?
                          wire19[(3'h6):(3'h6)] : $signed((8'hb3))))));
  assign wire51 = $signed(($unsigned($signed((reg34 ? reg27 : reg42))) ?
                      reg30 : ({$signed(reg34), $unsigned(wire19)} ?
                          (~&reg28) : {(wire19 ? wire21 : wire50),
                              (&(8'hbc))})));
endmodule
