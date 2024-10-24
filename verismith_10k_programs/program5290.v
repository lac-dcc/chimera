module top
#(parameter param56 = (((^(|(~^(8'hb7)))) ? (~^(8'hb2)) : ((((7'h43) ? (8'hbb) : (8'hbd)) ? {(8'ha6), (8'haf)} : ((8'hbd) ? (8'hb4) : (7'h42))) - {(+(8'ha5))})) | (!((((8'hbb) - (8'h9c)) + (~&(8'haa))) ? {((8'hb2) ? (8'hb0) : (8'hbb))} : ((~^(8'hac)) == (7'h44))))), 
parameter param57 = param56)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire7;
  wire [(4'h8):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire30,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg50,
                 reg49,
                 reg48,
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
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire4 = wire1[(1'h0):(1'h0)];
  assign wire5 = (|(wire0 ?
                     wire3[(3'h5):(3'h5)] : $signed(wire2[(2'h2):(1'h0)])));
  assign wire6 = ({wire1} ? $unsigned(wire1) : wire0[(4'h9):(3'h6)]);
  assign wire7 = (((~^((wire4 ^~ wire2) ?
                     $signed(wire4) : wire0[(3'h7):(3'h4)])) >> (^$signed((&(8'had))))) < ({wire6[(3'h7):(2'h3)],
                     ((&wire3) - $unsigned(wire5))} & wire0[(4'h9):(4'h9)]));
  always
    @(posedge clk) begin
      if ((~|wire7[(1'h0):(1'h0)]))
        begin
          if ($signed($signed((|wire0[(2'h2):(1'h1)]))))
            begin
              reg8 <= (((~^wire4) == $unsigned({$signed(wire2)})) ?
                  $signed($signed(wire6)) : $unsigned((wire7[(2'h2):(2'h2)] != (wire5[(4'ha):(4'h8)] ?
                      (wire1 >= wire3) : (wire6 + wire1)))));
              reg9 <= $signed(wire1[(1'h1):(1'h1)]);
            end
          else
            begin
              reg8 <= (+($unsigned(wire4[(4'hc):(4'hc)]) | wire4[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          reg8 <= $unsigned({(~&$signed((wire7 || wire3)))});
          reg9 <= wire0[(1'h1):(1'h0)];
          reg10 <= wire6;
          if (wire5)
            begin
              reg11 <= ((wire0 ? reg9[(4'h9):(4'h8)] : wire6) ?
                  ((reg10[(4'h9):(4'h9)] ? wire6 : wire2[(2'h2):(1'h0)]) ?
                      $signed($signed((wire3 ?
                          wire3 : reg10))) : $signed($signed(reg10))) : {$unsigned(reg9)});
              reg12 <= reg8;
              reg13 <= wire5;
              reg14 <= ((&{($unsigned((8'hb3)) & reg11[(1'h1):(1'h0)]),
                      (reg13 << $signed(reg8))}) ?
                  reg11 : ((~|{$signed(wire5)}) ?
                      (~&{wire5, (~^reg9)}) : ((~|$signed(wire4)) ~^ {(wire6 ?
                              wire7 : (8'hb4))})));
              reg15 <= (-wire2);
            end
          else
            begin
              reg11 <= wire1[(2'h2):(1'h1)];
            end
        end
      reg16 <= reg13[(3'h5):(3'h4)];
      reg17 <= wire5;
      if (reg16)
        begin
          reg18 <= (wire1 ?
              wire7 : $signed($signed($signed((reg12 ? reg15 : reg15)))));
          reg19 <= reg13;
          if (reg12)
            begin
              reg20 <= reg13[(3'h7):(3'h7)];
              reg21 <= ($signed($signed(wire4)) ? wire6 : (7'h40));
              reg22 <= wire4;
            end
          else
            begin
              reg20 <= ((~^wire7[(2'h2):(2'h2)]) ?
                  reg22 : $unsigned((^~reg22)));
              reg21 <= $signed(($signed(wire0) != $signed($signed($signed(reg18)))));
              reg22 <= ($signed($unsigned(wire3[(4'hd):(3'h6)])) == reg20);
              reg23 <= $signed(((wire7[(2'h2):(2'h2)] ? wire4 : {(-(8'ha0))}) ?
                  ({(reg9 ? reg22 : reg10), (!reg8)} ^ wire4) : ((^(reg12 ?
                          wire6 : reg22)) ?
                      reg15[(4'he):(2'h3)] : (wire3 == (reg18 != (8'hb9))))));
              reg24 <= ($signed($unsigned($unsigned((^~wire7)))) - reg10);
            end
          reg25 <= reg20;
          reg26 <= $unsigned((^$signed({((8'hbe) <<< (7'h42))})));
        end
      else
        begin
          reg18 <= (-(({reg25} >>> ($unsigned(wire1) || (reg26 ?
                  reg17 : reg10))) ?
              $signed($unsigned((^reg26))) : ((wire1[(1'h1):(1'h1)] - reg25[(2'h2):(2'h2)]) ?
                  {reg26[(3'h4):(2'h3)],
                      ((8'hb7) ? reg14 : reg24)} : {(~^wire0)})));
          reg19 <= $unsigned(reg10);
          reg20 <= (($signed((&reg9[(2'h3):(2'h2)])) ?
              reg15[(3'h4):(3'h4)] : ((|reg11[(4'hb):(3'h7)]) ?
                  ($unsigned(reg20) ?
                      (reg22 ^ wire2) : (-reg11)) : (reg14 * (|reg11)))) << reg13[(4'h8):(1'h0)]);
          if (reg15[(4'hf):(2'h2)])
            begin
              reg21 <= wire6;
              reg22 <= $unsigned($signed({{$unsigned(wire5),
                      (reg14 ? reg12 : reg17)}}));
              reg23 <= reg20;
              reg24 <= $signed(wire1[(1'h0):(1'h0)]);
            end
          else
            begin
              reg21 <= ($signed($signed(reg21[(2'h2):(2'h2)])) <<< $unsigned((reg8 ?
                  ($signed(reg23) ?
                      reg18 : (7'h41)) : $unsigned($unsigned(wire4)))));
              reg22 <= $signed($unsigned({$signed(reg8[(4'h8):(4'h8)])}));
              reg23 <= (^reg15);
            end
        end
      if ((|(8'h9f)))
        begin
          reg27 <= {wire5[(3'h7):(2'h3)],
              (((reg8 ?
                  $signed(reg14) : $unsigned(reg13)) | ($signed(reg21) == wire7[(1'h0):(1'h0)])) ~^ {$signed((^~wire7))})};
          reg28 <= (+((&reg18[(3'h4):(1'h0)]) ?
              ($signed((reg25 >>> (8'h9d))) >> ({reg12} ?
                  reg24 : (reg9 != wire7))) : $signed(wire4)));
          reg29 <= $signed(($signed((+reg14[(4'h8):(2'h3)])) ?
              $unsigned(((reg27 && reg23) ?
                  reg19 : reg17)) : ((+(reg16 ^~ wire3)) * $unsigned($unsigned(reg9)))));
        end
      else
        begin
          reg27 <= reg12[(3'h7):(1'h1)];
          reg28 <= (|$unsigned(wire7[(2'h3):(1'h0)]));
          reg29 <= reg18[(4'he):(4'hd)];
        end
    end
  assign wire30 = (({({(8'had), wire1} & (wire0 ? reg10 : reg17)),
                              ($signed(wire3) ? (^(8'ha9)) : $signed(reg25))} ?
                          {(^~$unsigned(reg19))} : reg23[(2'h3):(1'h0)]) ?
                      (~$unsigned((~^{reg29, reg21}))) : reg15[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg31 <= $unsigned($unsigned($signed(((reg18 ? reg29 : wire0) ^ (reg23 ?
          (8'hac) : wire3)))));
      reg32 <= ((&(reg21 ?
              ($signed(reg20) ?
                  ((8'ha9) * wire6) : $unsigned((8'ha7))) : $unsigned($unsigned(wire4)))) ?
          (!({(reg20 + wire3)} ?
              {$unsigned(reg14), (^wire2)} : ((reg26 ? reg29 : reg18) ?
                  {wire3} : $signed(reg28)))) : wire6[(3'h7):(2'h3)]);
      if (wire7[(1'h0):(1'h0)])
        begin
          if (reg19[(4'h9):(2'h3)])
            begin
              reg33 <= (((~^reg8) ?
                  ((~^(reg13 ^~ reg16)) ?
                      ($unsigned(reg20) <<< $signed(reg24)) : $signed(wire6)) : wire7) != (reg18[(5'h10):(4'hb)] ?
                  ((~^(reg27 ? wire5 : reg16)) < (~|wire3)) : reg26));
              reg34 <= $signed(reg22);
              reg35 <= reg22;
              reg36 <= ($unsigned($unsigned(reg20[(1'h1):(1'h0)])) == reg21);
            end
          else
            begin
              reg33 <= $signed(reg25[(4'h9):(3'h6)]);
            end
          reg37 <= reg13[(3'h4):(1'h0)];
          reg38 <= ((reg16[(2'h2):(1'h1)] ~^ wire3) <<< (~^(~^(^~$signed(wire4)))));
        end
      else
        begin
          reg33 <= reg33;
          reg34 <= (|reg8[(4'hc):(4'h8)]);
        end
      reg39 <= reg12[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg40 <= (|((~|(~|reg9)) + reg11));
      if (reg31[(1'h1):(1'h1)])
        begin
          reg41 <= $unsigned({$signed(reg13),
              ((!(reg40 ? reg20 : wire5)) ?
                  ($signed(reg31) ?
                      (reg33 ?
                          reg18 : reg40) : $unsigned((7'h42))) : (^~{reg26}))});
          reg42 <= reg16[(2'h3):(1'h1)];
          if ((^(-wire3[(3'h7):(1'h0)])))
            begin
              reg43 <= wire4[(5'h12):(5'h12)];
            end
          else
            begin
              reg43 <= (|(-(~&$unsigned(reg32[(3'h4):(2'h2)]))));
              reg44 <= (~^wire2[(1'h1):(1'h0)]);
              reg45 <= (!reg29);
              reg46 <= $unsigned(reg36);
            end
          if ((|$signed(reg36[(4'h8):(3'h6)])))
            begin
              reg47 <= (wire4[(5'h10):(4'h9)] >>> (|$signed(wire30)));
              reg48 <= ($unsigned(({$signed((8'hb2)),
                      (wire7 ? (8'had) : wire30)} ?
                  (!(reg26 ?
                      reg17 : reg20)) : (-reg34))) << ((|$signed((8'hbe))) || (|$signed($signed((8'hbf))))));
            end
          else
            begin
              reg47 <= (reg10[(2'h2):(2'h2)] < ((~|(8'ha8)) * ((&wire2) | {(wire4 ?
                      reg16 : wire6)})));
              reg48 <= $unsigned($unsigned($signed($signed((|reg33)))));
              reg49 <= (!$unsigned(wire2[(1'h1):(1'h1)]));
              reg50 <= (~&$unsigned((7'h40)));
            end
        end
      else
        begin
          reg41 <= reg14;
          if ((^~(reg36 < $signed(((reg45 || (8'hbd)) == (8'had))))))
            begin
              reg42 <= $signed(reg46);
              reg43 <= ($signed($signed(reg13[(1'h1):(1'h1)])) >= wire30);
            end
          else
            begin
              reg42 <= reg25;
              reg43 <= (!reg31);
              reg44 <= $unsigned(wire4);
              reg45 <= (~|$unsigned((|(((8'h9d) ? reg40 : reg45) ?
                  $signed((8'h9e)) : {reg45, reg8}))));
              reg46 <= (reg16[(3'h7):(3'h4)] ?
                  reg23[(3'h4):(1'h0)] : (!$signed(reg42[(2'h2):(1'h1)])));
            end
          reg47 <= (reg25[(3'h6):(2'h3)] ?
              (-wire6[(3'h7):(3'h5)]) : $signed({(8'h9d),
                  $unsigned((~reg32))}));
          reg48 <= reg34;
          reg49 <= $unsigned($unsigned($unsigned(wire30[(4'he):(4'hd)])));
        end
    end
  assign wire51 = $unsigned(wire2[(2'h2):(1'h0)]);
  assign wire52 = reg22[(2'h3):(2'h3)];
  assign wire53 = $signed((-($unsigned(reg38) ? reg22 : $signed({reg12}))));
  assign wire54 = $signed((-(reg34 >>> reg40)));
  assign wire55 = (8'hbd);
endmodule
