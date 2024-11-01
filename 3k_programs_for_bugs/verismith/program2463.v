module top
#(parameter param72 = {((({(8'hb0), (8'ha9)} ^~ (|(8'hab))) ? (!(!(8'hb0))) : (!((8'hb0) >> (8'hb8)))) ? ((((8'ha1) > (8'had)) ? ((7'h42) ? (7'h43) : (8'h9e)) : ((8'hbe) << (8'ha4))) << {((8'ha0) ? (8'hb7) : (8'hb4))}) : (+((~|(7'h42)) ? ((8'ha5) ? (8'hb7) : (8'hb1)) : ((8'h9c) ? (8'ha2) : (8'hb1)))))}, 
parameter param73 = param72)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h272):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(4'hd):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  assign y = {wire69,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire30,
                 wire29,
                 wire26,
                 wire25,
                 wire24,
                 wire6,
                 wire5,
                 reg71,
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
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg27,
                 reg28,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 (1'h0)};
  assign wire5 = $unsigned(wire0[(4'hf):(4'hc)]);
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= (8'ha7);
      if ($signed($signed($unsigned(wire4))))
        begin
          reg8 <= (^~(-wire4));
          reg9 <= {(($unsigned(wire6[(1'h1):(1'h0)]) ?
                      (~{wire3, wire4}) : $unsigned((reg8 && wire2))) ?
                  (~((wire0 ? wire4 : reg8) >> (wire1 ?
                      wire1 : wire4))) : (+($unsigned(wire1) ^ reg8))),
              wire0[(4'h8):(2'h2)]};
          reg10 <= wire0;
          if ((~|((|$unsigned(wire5)) & (!wire6[(3'h7):(3'h5)]))))
            begin
              reg11 <= (|reg8);
              reg12 <= $unsigned((|$unsigned($unsigned($unsigned(wire1)))));
              reg13 <= ((wire1[(2'h2):(2'h2)] ?
                      $signed(wire0[(1'h0):(1'h0)]) : {((reg9 ?
                              wire4 : reg8) ^~ $unsigned(wire6)),
                          wire0[(4'h9):(3'h7)]}) ?
                  $unsigned(wire3[(2'h2):(1'h0)]) : ($signed(wire3) ?
                      wire1[(3'h4):(1'h0)] : (^((reg12 ?
                          reg7 : wire2) + wire1[(2'h3):(2'h2)]))));
              reg14 <= $signed($unsigned(reg12));
            end
          else
            begin
              reg11 <= $unsigned(reg7);
              reg12 <= ((~(wire2[(4'h9):(4'h8)] ?
                      ({reg10} ^~ reg9[(3'h5):(3'h5)]) : reg9[(1'h1):(1'h0)])) ?
                  ({(wire4 ?
                          $signed(wire4) : {(8'hbe)})} < (+(|((8'hab) ~^ reg7)))) : (($signed((wire5 >= wire0)) ~^ {reg8[(2'h3):(2'h2)],
                      (8'hb8)}) >> {$unsigned($signed(reg12)), (!wire5)}));
              reg13 <= ($signed(wire3) ?
                  $unsigned(({(wire5 ? reg7 : reg13), reg11} ?
                      {(|wire5)} : (!(wire6 ?
                          reg10 : reg12)))) : $unsigned(($unsigned((7'h43)) ?
                      (~&reg11[(4'hc):(3'h7)]) : $unsigned(wire5[(1'h1):(1'h0)]))));
              reg14 <= ((^(^$signed($unsigned((8'ha0))))) ?
                  reg10 : $unsigned($unsigned(wire2)));
            end
          reg15 <= wire6;
        end
      else
        begin
          if (reg9)
            begin
              reg8 <= (reg9[(2'h3):(1'h0)] ? {wire0} : (8'hbc));
            end
          else
            begin
              reg8 <= (!wire0);
              reg9 <= $signed(reg9[(4'hb):(4'h9)]);
              reg10 <= (~^$unsigned(wire4));
            end
          reg11 <= (~reg11);
        end
      if (wire4[(1'h1):(1'h0)])
        begin
          reg16 <= $unsigned(($signed(wire5) ?
              $unsigned((~^reg10[(4'hc):(4'h9)])) : $unsigned((|(!(7'h42))))));
          if ((&(wire0 ? (!reg10) : (~$signed(reg9)))))
            begin
              reg17 <= $signed((~wire2[(1'h0):(1'h0)]));
              reg18 <= (wire6 ?
                  $signed($unsigned($unsigned(((8'hb3) ?
                      (8'h9d) : wire6)))) : ($unsigned({$signed(reg13)}) | $unsigned(($unsigned((8'haf)) ?
                      (~wire3) : reg9[(4'ha):(4'ha)]))));
            end
          else
            begin
              reg17 <= (~^(8'haa));
              reg18 <= {(8'had)};
              reg19 <= (~&reg7[(4'h8):(4'h8)]);
              reg20 <= ($unsigned($signed($unsigned(((8'hb7) ?
                  (8'hac) : reg8)))) ^~ wire5);
              reg21 <= (^wire0);
            end
          reg22 <= {$unsigned((&reg17)),
              $unsigned(({(reg16 ? wire5 : wire2)} ?
                  ($unsigned(wire3) ?
                      wire6[(4'hc):(1'h1)] : wire0[(5'h10):(3'h5)]) : $signed(reg8)))};
          reg23 <= wire5;
        end
      else
        begin
          reg16 <= $signed((|$unsigned(($signed(wire5) << reg15[(5'h11):(4'h9)]))));
          reg17 <= $unsigned($signed(($unsigned((~|(8'hb9))) ?
              $signed((+reg13)) : reg11[(5'h11):(3'h4)])));
          if ((reg7[(2'h3):(2'h2)] ?
              (($unsigned((reg10 ? reg11 : (8'hb8))) ?
                      (+$unsigned(wire2)) : reg11[(3'h6):(1'h0)]) ?
                  reg23 : reg18) : $unsigned((8'ha5))))
            begin
              reg18 <= reg21[(4'h8):(1'h1)];
            end
          else
            begin
              reg18 <= {(8'ha4)};
              reg19 <= (reg9[(4'ha):(1'h0)] ?
                  ((~{(wire5 ? wire0 : reg19)}) > wire0) : reg20);
            end
          reg20 <= (^(($unsigned($unsigned(reg18)) ?
                  $unsigned($unsigned(reg22)) : $unsigned((8'ha3))) ?
              reg16 : (+(-$unsigned(wire6)))));
        end
    end
  assign wire24 = $signed({$unsigned($signed((^reg19))), reg16[(4'h9):(2'h2)]});
  assign wire25 = reg15[(3'h4):(3'h4)];
  assign wire26 = ((~|reg19) ?
                      $signed({(~(|wire1))}) : (wire2 ?
                          (~^$signed($unsigned(wire6))) : ((|$unsigned(wire0)) && reg14)));
  always
    @(posedge clk) begin
      reg27 <= reg22[(1'h0):(1'h0)];
      reg28 <= ({{wire24[(3'h5):(3'h4)], reg17}} - ({(-reg16[(1'h0):(1'h0)])} ?
          (~($signed(wire24) == reg18)) : (((reg27 ? wire26 : reg22) ?
              (~reg8) : {reg15, wire2}) - ((|reg11) ?
              (wire24 ~^ reg17) : (&reg13)))));
    end
  assign wire29 = {(8'hab),
                      ({(reg12 ? wire5[(2'h2):(2'h2)] : $signed(wire0))} ?
                          (+(~(wire0 >= reg12))) : reg11)};
  assign wire30 = reg18[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg31 <= $unsigned(($signed($unsigned(wire30)) ?
          $signed({(wire24 ? reg19 : reg27),
              {reg17, (8'haa)}}) : (wire6[(1'h1):(1'h0)] ?
              wire1[(3'h4):(2'h2)] : $unsigned($unsigned(wire24)))));
      reg32 <= ((~&($signed(reg8[(2'h3):(2'h2)]) == (wire0 ?
          reg9 : wire29[(3'h4):(3'h4)]))) - $unsigned($unsigned($signed(reg14))));
    end
  always
    @(posedge clk) begin
      reg33 <= $signed(($signed(reg19[(4'h9):(1'h0)]) ?
          (wire29 ?
              $unsigned((wire24 & wire26)) : (reg23[(3'h4):(1'h1)] <<< $signed(wire6))) : $signed(wire5)));
      reg34 <= (reg27 ?
          reg28 : (|($unsigned($unsigned(reg22)) << ((wire6 == reg28) ?
              $signed(reg31) : reg17[(3'h4):(3'h4)]))));
      if ($signed(reg13[(2'h2):(1'h1)]))
        begin
          reg35 <= {(~|((+((8'hac) ? reg10 : wire29)) ?
                  reg9 : wire3[(5'h13):(3'h6)]))};
          reg36 <= $signed(((~^((wire25 ? reg11 : wire1) & (reg23 << reg10))) ?
              (+(wire6[(4'hb):(1'h0)] >> reg31)) : $unsigned((reg14 != reg11[(1'h1):(1'h1)]))));
          if (reg23[(1'h1):(1'h0)])
            begin
              reg37 <= (&$signed((!$signed((8'hb0)))));
              reg38 <= wire6[(4'h8):(3'h5)];
              reg39 <= (reg33[(4'ha):(4'ha)] <= (wire30[(4'h9):(3'h7)] >>> $signed($unsigned(reg20))));
              reg40 <= reg20[(5'h11):(3'h6)];
              reg41 <= $unsigned($signed(wire3));
            end
          else
            begin
              reg37 <= {$unsigned(wire30),
                  (($signed($signed((8'ha6))) ?
                      (|(|reg37)) : reg10) != $signed({(^reg15)}))};
              reg38 <= (^~($signed((!(reg32 <<< reg10))) ?
                  wire4 : (~($unsigned((8'hb4)) >>> {wire6}))));
              reg39 <= ((8'h9e) <= ($signed(((|reg35) ?
                      $unsigned(reg32) : (&wire6))) ?
                  (|(^$unsigned(reg35))) : (~^$signed((reg40 ?
                      reg12 : reg27)))));
              reg40 <= {(reg13 ? (|$unsigned(reg12)) : (~|(+reg7)))};
            end
          reg42 <= {reg17[(2'h3):(1'h0)]};
        end
      else
        begin
          reg35 <= (-(reg15 ?
              (~^$signed((reg31 ? wire3 : reg27))) : $signed(reg28)));
          reg36 <= ({reg35, reg17} == (reg22[(4'hb):(2'h3)] | reg11));
          reg37 <= (~&(~&(!$signed((-wire2)))));
          reg38 <= $unsigned((^~$unsigned($signed($unsigned(wire0)))));
        end
      reg43 <= ((~({((8'ha4) >> reg13)} * ($signed(wire3) ?
              $unsigned(wire5) : (&wire0)))) ?
          $unsigned(wire25[(2'h2):(1'h0)]) : reg19[(3'h4):(2'h3)]);
    end
  always
    @(posedge clk) begin
      reg44 <= (($signed((~^$signed(wire26))) ?
          (((wire1 ? (8'hb7) : reg13) ?
                  $signed((8'had)) : wire2[(4'hb):(4'h9)]) ?
              $signed($signed(wire25)) : (~wire4)) : reg22) == $signed($unsigned((wire2 + (+reg40)))));
      reg45 <= {$unsigned((($signed(wire2) ?
              (reg40 ? reg8 : reg15) : wire29[(2'h3):(2'h3)]) | $signed((reg18 ?
              wire3 : reg34)))),
          (reg23[(1'h0):(1'h0)] | wire25)};
      reg46 <= $signed(($unsigned((wire1 ^ $signed((8'hbd)))) == ({$signed(reg9),
              (~&wire3)} ?
          wire2 : reg9)));
      reg47 <= ({((8'had) >= ({reg18, reg16} * (-reg18)))} ?
          reg19[(4'hb):(1'h0)] : reg11[(5'h12):(4'hc)]);
      reg48 <= (reg39[(2'h3):(2'h3)] < (((8'hac) ^ $unsigned((reg18 ~^ reg44))) ?
          (reg42 ? (~|$signed(wire2)) : (~$unsigned(wire3))) : {reg27, wire5}));
    end
  assign wire49 = $unsigned($unsigned(($unsigned($signed(reg36)) ?
                      $signed((reg47 ? reg8 : reg41)) : (wire30[(3'h6):(2'h3)] ?
                          reg12 : (8'haf)))));
  assign wire50 = (&reg20);
  assign wire51 = reg46[(2'h2):(1'h1)];
  assign wire52 = $unsigned($unsigned($signed((!wire3[(5'h10):(3'h6)]))));
  assign wire53 = reg13;
  assign wire54 = $unsigned(({reg39[(1'h1):(1'h1)]} + (+$unsigned({reg10}))));
  assign wire55 = $signed(({reg13} != ((|(wire50 * wire0)) - wire6[(2'h3):(2'h2)])));
  assign wire56 = $signed({(((^~reg7) ?
                          $signed(wire50) : (|(8'ha1))) & (~$unsigned((8'hba)))),
                      (reg46[(1'h0):(1'h0)] >>> ((reg12 ?
                          (8'hb1) : wire25) >>> $signed(reg35)))});
  module57 #() modinst70 (.y(wire69), .wire61(wire4), .wire59(wire2), .wire60(reg23), .wire62(reg20), .wire58(reg31), .clk(clk));
  always
    @(posedge clk) begin
      reg71 <= $signed(wire69);
    end
endmodule

module module57
#(parameter param68 = {((((~^(7'h44)) ? (-(8'hb0)) : ((8'hb3) + (8'hbd))) ? (((8'h9c) != (8'hae)) >> ((8'hb5) + (8'hba))) : ({(8'ha0), (8'hbe)} ? ((8'hae) ? (7'h43) : (8'hae)) : (-(8'haa)))) >> (+(|{(7'h42), (8'hb2)}))), (^((((8'h9c) ? (7'h40) : (8'ha2)) ? ((7'h40) >>> (8'hb4)) : ((8'ha3) << (8'hbd))) * {(~^(8'ha5))}))})
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire62;
  input wire [(2'h3):(1'h0)] wire61;
  input wire signed [(4'hf):(1'h0)] wire60;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire [(4'hf):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire63;
  assign y = {wire67, wire66, wire65, wire64, wire63, (1'h0)};
  assign wire63 = $unsigned(((wire59[(3'h7):(3'h6)] ^ $unsigned($unsigned((8'hb7)))) ?
                      (8'hb7) : ((wire60 ? (8'hbc) : $unsigned(wire60)) ?
                          $signed($signed((8'hbd))) : wire60)));
  assign wire64 = $signed({$signed(({wire62} << (!wire63)))});
  assign wire65 = ((8'ha7) ?
                      wire59[(3'h6):(3'h4)] : ((-(&$unsigned((8'hbd)))) ?
                          {($unsigned(wire62) ?
                                  (~^wire58) : (8'ha9))} : wire61[(2'h2):(1'h0)]));
  assign wire66 = (wire63 >>> (wire65 ?
                      $unsigned((!$signed(wire58))) : (wire60[(2'h3):(2'h3)] ?
                          $signed(((8'hb6) ~^ (8'hb0))) : (wire62[(1'h1):(1'h1)] >>> (wire60 ?
                              wire62 : wire59)))));
  assign wire67 = ($unsigned({{(wire65 ? (8'hb3) : wire64)},
                      $unsigned(wire64[(1'h0):(1'h0)])}) && wire62[(3'h5):(3'h4)]);
endmodule
