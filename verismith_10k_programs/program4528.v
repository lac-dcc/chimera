module top
#(parameter param48 = ((|{({(7'h43)} ? ((8'hb3) ~^ (8'hb0)) : {(8'ha5)})}) ? ((|(((8'hbb) ? (8'hb5) : (8'hb6)) ? ((8'hb4) > (8'hb1)) : (^(8'hb3)))) > ((|(^(8'ha5))) | (7'h41))) : (((((8'hb9) ^~ (8'haa)) ? ((8'hb2) ? (8'hbd) : (8'hb6)) : ((7'h40) ? (8'ha9) : (8'hb9))) ^~ (~|((8'hb8) ? (8'h9d) : (8'hbd)))) ? ((((8'ha0) <= (7'h43)) ? ((8'h9f) && (8'ha0)) : ((8'ha2) ? (8'ha2) : (8'ha7))) ? (((8'h9d) != (8'haf)) <<< {(8'ha4), (8'ha3)}) : (((8'hb0) ? (8'hb1) : (8'hac)) ? ((8'hb0) ? (8'ha7) : (8'ha2)) : (!(8'hb6)))) : ((((8'ha4) - (8'hb7)) >> (^~(8'hbd))) < (-(+(8'hb6)))))), 
parameter param49 = (param48 ? (({(param48 ? (8'hbc) : param48), {param48}} ? (|((8'hbd) ? param48 : param48)) : (param48 << (8'hb6))) ? (param48 << param48) : ((~^(+param48)) & {param48, (param48 ? param48 : param48)})) : {(~{(param48 <= param48)}), ({(|(8'haf)), (^param48)} | (^~(param48 ? param48 : param48)))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire [(5'h10):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(5'h10):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire47,
                 wire43,
                 wire42,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 wire20,
                 wire6,
                 wire5,
                 reg46,
                 reg45,
                 reg44,
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
                 reg22,
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
                 (1'h0)};
  assign wire5 = $signed(($signed($signed((wire4 ?
                     (8'ha2) : wire4))) && ((8'ha3) >> ($signed(wire2) ^~ $unsigned(wire0)))));
  assign wire6 = ((($signed((wire4 ^~ wire2)) != (+{(8'ha6)})) == wire3[(4'hf):(3'h5)]) ?
                     $signed($signed($signed((wire3 ^~ (8'hb6))))) : (!{wire4[(1'h0):(1'h0)],
                         (wire4[(1'h1):(1'h0)] <= wire5[(4'hb):(2'h2)])}));
  always
    @(posedge clk) begin
      reg7 <= wire6;
      reg8 <= wire0[(3'h6):(3'h5)];
      reg9 <= wire6[(3'h5):(1'h1)];
      reg10 <= (|{($signed($signed(wire1)) >> $signed(((8'haf) ?
              wire2 : reg7))),
          $unsigned($unsigned((8'hba)))});
      if ($signed(((~{(wire1 + reg10), $unsigned(reg10)}) ?
          $unsigned(wire5) : (~(^~{wire2})))))
        begin
          reg11 <= (!$unsigned($signed(reg9)));
          if ($signed($signed((&({reg8} ?
              (reg9 ? wire5 : wire4) : (|(7'h43)))))))
            begin
              reg12 <= ((((wire6[(1'h0):(1'h0)] >>> (wire6 ?
                  reg11 : wire6)) * $unsigned((reg7 ?
                  reg10 : wire1))) < wire5) == (wire5 ?
                  reg7[(2'h2):(2'h2)] : $unsigned(wire3[(1'h1):(1'h1)])));
            end
          else
            begin
              reg12 <= $unsigned({(^((&reg10) ?
                      (wire4 ? reg11 : reg10) : $signed(wire4))),
                  $signed($signed(reg9))});
              reg13 <= reg9[(2'h2):(1'h0)];
            end
          reg14 <= {$unsigned($unsigned(wire6))};
          if (reg10[(3'h5):(3'h4)])
            begin
              reg15 <= (wire5[(4'hb):(2'h3)] < ($signed($unsigned($unsigned(reg9))) ?
                  $signed(reg8[(1'h0):(1'h0)]) : ((-reg7[(1'h1):(1'h0)]) ^ (|$signed(reg12)))));
              reg16 <= $signed((^{((wire6 ? (7'h41) : (7'h42)) ?
                      (|wire5) : $signed((7'h43)))}));
              reg17 <= $unsigned({(reg10[(2'h3):(1'h1)] ?
                      $signed(reg16) : $unsigned($signed(reg13))),
                  $signed(wire6[(4'h9):(2'h2)])});
              reg18 <= reg17[(2'h3):(1'h1)];
              reg19 <= (+reg16);
            end
          else
            begin
              reg15 <= $unsigned($signed(reg14));
              reg16 <= (&((reg18[(2'h2):(1'h0)] ?
                      (!reg14[(3'h5):(2'h2)]) : $signed((reg19 - (8'ha5)))) ?
                  $unsigned(reg19) : $signed($unsigned($signed(wire1)))));
              reg17 <= $signed({reg7, (-$unsigned((&reg10)))});
            end
        end
      else
        begin
          if ($signed((($signed(reg12) > (~&(wire2 ? reg16 : wire4))) ?
              ({(wire6 < reg19), ((8'h9d) >> wire0)} ?
                  (reg7[(2'h2):(1'h0)] ?
                      {reg7,
                          reg15} : (wire4 >>> reg11)) : wire1) : {$unsigned(reg16[(3'h4):(3'h4)])})))
            begin
              reg11 <= reg16[(1'h1):(1'h0)];
              reg12 <= $unsigned(reg9);
              reg13 <= (~&({$signed(reg8[(1'h1):(1'h0)])} ?
                  ({reg10[(3'h5):(3'h4)]} ?
                      $signed((wire3 ?
                          reg14 : reg9)) : (~$signed(wire1))) : (({reg18} <<< reg13) ?
                      {$unsigned(reg8),
                          reg14} : (wire3[(4'he):(4'h8)] ^~ $signed((8'hac))))));
            end
          else
            begin
              reg11 <= wire6[(2'h2):(2'h2)];
              reg12 <= {$unsigned($unsigned(($signed(reg10) ^~ (reg17 ?
                      reg16 : wire0)))),
                  wire5[(2'h3):(1'h1)]};
              reg13 <= {reg12[(1'h0):(1'h0)]};
              reg14 <= $unsigned((+(^~reg14)));
              reg15 <= ($signed((8'ha3)) ^~ $unsigned((reg13 ?
                  $unsigned((reg14 + (8'hb2))) : (wire4[(2'h2):(1'h0)] ~^ reg14))));
            end
          reg16 <= {$unsigned(wire0[(1'h1):(1'h1)])};
          reg17 <= ((+$unsigned(reg17[(2'h3):(1'h1)])) ^ (~^wire5[(4'hb):(2'h3)]));
        end
    end
  assign wire20 = $unsigned(reg13);
  assign wire21 = reg16[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg22 <= ((~^(-wire21)) - wire1);
    end
  assign wire23 = {$signed({($signed((8'ha4)) ?
                              (wire21 << reg22) : (reg13 - reg18)),
                          ($signed(wire21) ? reg14 : (~|reg22))})};
  assign wire24 = wire5;
  assign wire25 = wire1[(5'h10):(4'hc)];
  always
    @(posedge clk) begin
      if ({(wire24 ^ wire3), (8'hb1)})
        begin
          reg26 <= reg9;
          if ((~^reg16))
            begin
              reg27 <= ((!(^$signed(wire20[(3'h5):(1'h0)]))) > wire5[(4'h9):(3'h5)]);
              reg28 <= {$signed(reg9[(2'h2):(2'h2)])};
              reg29 <= (-$unsigned({((wire5 <= (8'h9f)) ?
                      $unsigned(reg27) : (~&reg11))}));
            end
          else
            begin
              reg27 <= wire23;
            end
          reg30 <= ((|reg22) ?
              wire5[(4'hc):(3'h7)] : $unsigned(($unsigned($unsigned(wire0)) != $signed(((8'ha4) != reg14)))));
          reg31 <= $signed(($signed(wire0[(1'h0):(1'h0)]) ?
              {$unsigned((reg27 ? reg19 : reg28)),
                  (wire5 && (reg8 ?
                      reg12 : wire21))} : (~wire23[(3'h4):(2'h3)])));
          reg32 <= (wire5 ?
              (((reg16[(3'h4):(3'h4)] + {reg30}) ?
                  $unsigned(reg28) : (reg29 >= (reg31 ?
                      (7'h42) : reg18))) | $unsigned((+reg8))) : (-(((reg9 ?
                      wire4 : reg9) ?
                  (^~wire3) : $unsigned(reg22)) ~^ $signed($signed(reg28)))));
        end
      else
        begin
          reg26 <= reg28[(1'h1):(1'h0)];
          reg27 <= $unsigned(((reg30 ?
                  ((reg7 <<< wire6) ?
                      reg30[(3'h5):(1'h0)] : $signed((8'h9f))) : ($unsigned(reg12) ?
                      (reg18 ? wire25 : wire1) : (reg8 ? (8'hb8) : reg17))) ?
              {wire4} : $unsigned($signed((8'hb7)))));
          reg28 <= $signed(reg7);
          reg29 <= $signed((wire1[(4'hc):(4'ha)] ^~ reg29));
          if ((&($unsigned($signed(((8'ha2) ^ reg9))) ? (8'h9f) : reg8)))
            begin
              reg30 <= (7'h40);
            end
          else
            begin
              reg30 <= ($unsigned({$unsigned($unsigned((8'haf)))}) != (reg32[(3'h7):(3'h6)] ?
                  (~|{{wire25, wire0},
                      reg7[(1'h0):(1'h0)]}) : (+wire20[(3'h5):(1'h0)])));
              reg31 <= (({(-(~wire0))} ?
                      (!reg7[(1'h1):(1'h0)]) : $unsigned(wire3)) ?
                  {$unsigned(($unsigned(wire5) <<< reg29)),
                      reg7} : reg17[(2'h2):(1'h1)]);
              reg32 <= reg15;
              reg33 <= reg27;
            end
        end
      if ({reg30[(2'h2):(2'h2)]})
        begin
          reg34 <= (+$signed((((reg11 >>> reg19) ?
                  (wire4 ? wire5 : wire23) : (+reg12)) ?
              {{wire6, reg32}} : (reg16[(2'h2):(2'h2)] & wire2))));
        end
      else
        begin
          reg34 <= (($signed({(reg29 ? wire2 : reg14)}) ^~ reg12) ?
              reg7 : {(~&reg11)});
          reg35 <= reg10;
          reg36 <= $unsigned((8'hba));
          reg37 <= ({reg19[(4'hb):(4'hb)], $signed(wire5)} + (reg8 >>> (reg34 ?
              (8'h9f) : wire1[(3'h7):(1'h1)])));
          if (reg15)
            begin
              reg38 <= reg18;
              reg39 <= {$unsigned((&$signed((reg36 && (7'h43))))),
                  $unsigned(reg19)};
            end
          else
            begin
              reg38 <= ($signed(reg28) ?
                  ($unsigned((reg30 ? $signed(wire5) : $unsigned(reg34))) ?
                      ($signed({(8'h9f)}) ?
                          ($unsigned((8'ha6)) ?
                              (wire25 ?
                                  reg28 : reg29) : wire21) : reg16[(1'h1):(1'h1)]) : (($signed((7'h42)) >= wire24[(5'h14):(4'hc)]) >> reg19[(5'h10):(2'h2)])) : reg35);
            end
        end
      reg40 <= ($unsigned((-wire20[(3'h5):(1'h0)])) <<< (-(^~$signed($signed((8'ha7))))));
      reg41 <= wire0[(3'h5):(2'h3)];
    end
  assign wire42 = (((!$signed($unsigned(reg12))) != (^{(reg14 ?
                              reg18 : reg10)})) ?
                      (wire23 < ((^reg10) && reg10[(1'h1):(1'h0)])) : reg10);
  assign wire43 = {((~&(reg14[(2'h2):(2'h2)] != reg12[(2'h2):(1'h1)])) <= (((reg13 ?
                          reg35 : wire24) > reg35) << (reg18 & (wire4 ?
                          (8'had) : reg26)))),
                      $unsigned(($unsigned({reg30,
                          reg15}) >= (!wire1[(4'ha):(2'h2)])))};
  always
    @(posedge clk) begin
      reg44 <= (-(reg19[(5'h10):(2'h3)] ?
          (reg12 ?
              reg34 : ((reg31 ?
                  wire1 : wire20) + $unsigned(wire20))) : (8'hbc)));
      reg45 <= $signed((~(reg19[(3'h7):(1'h0)] >= (reg38 ~^ (reg36 ?
          reg31 : reg35)))));
      reg46 <= $signed($unsigned(reg45));
    end
  assign wire47 = $unsigned($signed($signed((~&$signed(reg19)))));
endmodule
