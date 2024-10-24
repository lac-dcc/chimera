module top
#(parameter param53 = ((+(8'hb3)) >= ({(((8'hb4) ? (8'h9e) : (8'h9c)) == ((8'hbb) & (8'h9d)))} >> (^~(((8'hbe) ? (8'haf) : (8'ha4)) ^ (8'had))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(5'h13):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire46;
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg12 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire49,
                 wire48,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire46,
                 reg50,
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
                 (1'h0)};
  assign wire4 = ($signed(wire2[(2'h3):(1'h0)]) - (~|wire1[(2'h2):(1'h0)]));
  assign wire5 = {$signed((^~((wire1 ? wire1 : wire3) ?
                         (8'hbe) : (wire0 < wire0)))),
                     $unsigned({(wire4[(2'h2):(1'h0)] | wire1[(1'h0):(1'h0)])})};
  assign wire6 = $unsigned($unsigned(wire4[(1'h1):(1'h1)]));
  assign wire7 = wire6;
  assign wire8 = (({($signed(wire6) ? (^~wire3) : (wire1 ~^ wire3)),
                         wire0[(3'h6):(1'h0)]} ?
                     wire0 : wire4[(1'h0):(1'h0)]) ~^ $unsigned((((^wire4) >= wire7[(3'h4):(3'h4)]) ?
                     $unsigned($unsigned((8'ha5))) : {wire5[(1'h0):(1'h0)],
                         ((8'h9c) ? wire6 : (8'h9c))})));
  assign wire9 = {($signed(wire4) ?
                         {(&$signed(wire0)), $unsigned((~|wire2))} : (8'hbe)),
                     wire2};
  assign wire10 = (+{wire0, {$unsigned(wire8), $unsigned(wire2)}});
  assign wire11 = wire5;
  always
    @(posedge clk) begin
      if ($unsigned(wire3[(1'h1):(1'h0)]))
        begin
          reg12 <= (~^$signed(wire6[(4'h8):(4'h8)]));
          reg13 <= wire10;
          reg14 <= (^$unsigned({($unsigned(wire5) ? (~&wire9) : $signed(wire5)),
              wire2}));
          if (wire0[(1'h1):(1'h0)])
            begin
              reg15 <= ($signed(wire1[(5'h11):(4'h8)]) ?
                  wire7[(3'h5):(1'h0)] : wire10);
            end
          else
            begin
              reg15 <= $unsigned((8'haa));
              reg16 <= wire3;
              reg17 <= (wire1 * (wire5[(3'h4):(2'h3)] ?
                  wire4 : (!(wire3 ?
                      (reg16 * (8'ha9)) : (wire8 ? reg12 : wire9)))));
              reg18 <= $unsigned($unsigned(wire10[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg12 <= $unsigned(wire10[(1'h1):(1'h1)]);
          reg13 <= reg13[(4'hb):(3'h6)];
        end
      reg19 <= ((-reg15) ?
          reg16[(1'h1):(1'h1)] : $unsigned(((~|wire8) << $unsigned(wire2))));
      reg20 <= reg12;
      if ({((+$signed($unsigned(reg13))) >= $signed(((reg20 != reg18) ?
              wire10[(2'h2):(1'h1)] : $unsigned((7'h42)))))})
        begin
          if ($signed(wire10))
            begin
              reg21 <= (($signed((~^{reg17})) || $unsigned((^wire6))) ?
                  $signed($signed(((reg19 << wire3) ^ $signed(wire1)))) : ((~&{(7'h43),
                          (wire2 >= wire5)}) ?
                      reg17 : $signed($signed({wire6, wire11}))));
              reg22 <= ((~^$unsigned((+$unsigned(reg17)))) ?
                  {$unsigned($unsigned($signed(wire9))),
                      (~^(-$signed(reg20)))} : (-($unsigned($signed(wire2)) ?
                      ((&(8'ha1)) ?
                          $unsigned(reg21) : $signed((8'hb8))) : (8'h9e))));
            end
          else
            begin
              reg21 <= reg20;
              reg22 <= ((($unsigned($unsigned(wire8)) < $signed(reg15)) && wire0[(3'h4):(2'h3)]) ?
                  $unsigned((^~{reg14})) : $unsigned((((~&(8'ha1)) ?
                          (reg12 || (7'h40)) : $signed(wire6)) ?
                      (~&(!wire7)) : ((reg21 ? reg21 : wire5) | (wire11 ?
                          reg12 : wire11)))));
              reg23 <= $unsigned($signed((reg19[(3'h4):(1'h0)] >= reg12)));
            end
          reg24 <= reg16;
          if ((($unsigned(reg12) && $unsigned(reg19)) ?
              ((~$unsigned($unsigned(reg13))) | (($unsigned(reg23) ~^ $unsigned(wire6)) | (^$unsigned((8'hbf))))) : $unsigned($signed($unsigned((wire3 ?
                  wire0 : reg23))))))
            begin
              reg25 <= ((!(reg14 ?
                  (~&reg21[(1'h1):(1'h0)]) : $signed(((8'ha2) | (7'h43))))) ^~ reg20);
              reg26 <= (wire9[(4'h9):(1'h0)] & (~^(((reg15 == (8'h9d)) ?
                      $unsigned(wire3) : (wire4 ? wire3 : reg24)) ?
                  (wire6[(2'h2):(2'h2)] ?
                      $signed(wire2) : $signed(reg22)) : wire1[(1'h0):(1'h0)])));
            end
          else
            begin
              reg25 <= (({$signed((~|wire2)),
                      $signed($unsigned(reg26))} && reg20[(2'h3):(1'h1)]) ?
                  ({$signed($signed(wire0))} * reg20[(4'h9):(4'h8)]) : {$signed($signed(reg20)),
                      (({reg19} == (reg21 | reg26)) ?
                          ((+wire4) >= {(8'ha8)}) : (wire6 != $signed(wire7)))});
              reg26 <= reg18[(4'hc):(4'h8)];
              reg27 <= $signed($signed($signed(reg26[(1'h1):(1'h0)])));
              reg28 <= $signed((((~|(|wire6)) ?
                  $unsigned((8'ha9)) : $unsigned($signed(wire2))) || reg22[(3'h7):(2'h2)]));
            end
        end
      else
        begin
          if (({((wire4 ?
                  (-(8'had)) : wire7[(2'h2):(1'h1)]) >= reg21[(2'h2):(1'h1)]),
              (^~{$signed(wire4), reg14[(3'h5):(1'h1)]})} || {((8'hb1) ?
                  $signed($unsigned(reg15)) : $unsigned((reg25 & reg16))),
              ((!$signed(reg23)) <<< (8'ha1))}))
            begin
              reg21 <= $unsigned(reg13);
              reg22 <= reg17;
            end
          else
            begin
              reg21 <= (^~{((^~$signed(wire4)) ?
                      {$signed(wire1)} : (~|$unsigned((8'haf)))),
                  (!(wire9 >>> (!wire7)))});
              reg22 <= reg24[(3'h6):(3'h6)];
              reg23 <= ((^~reg22[(1'h0):(1'h0)]) ^ ({$unsigned((!wire0))} ?
                  wire5[(3'h5):(3'h5)] : reg25));
              reg24 <= wire1[(4'hf):(4'hc)];
              reg25 <= reg26[(3'h4):(2'h3)];
            end
        end
    end
  module29 #() modinst47 (.y(wire46), .wire30(reg27), .wire34(wire7), .clk(clk), .wire33(reg18), .wire31(wire6), .wire32(wire9));
  assign wire48 = {(!((~$unsigned(reg20)) ?
                          wire11 : $signed((wire2 <<< reg13))))};
  assign wire49 = ((wire2[(1'h0):(1'h0)] & (reg14[(2'h2):(1'h0)] ?
                      ({wire2, reg13} - $signed(reg12)) : {(wire3 && wire2),
                          ((8'hb5) ?
                              reg19 : wire10)})) <= {$unsigned(((~&(8'hba)) ?
                          reg25[(1'h0):(1'h0)] : (wire5 ~^ reg28)))});
  always
    @(posedge clk) begin
      reg50 <= (wire3[(1'h0):(1'h0)] <= (&(8'hac)));
    end
  assign wire51 = ((!$unsigned(((^wire10) ?
                          $unsigned(wire0) : $unsigned(reg17)))) ?
                      $unsigned(($signed((reg50 - wire4)) ?
                          (^~(wire46 ?
                              reg27 : wire48)) : (8'ha7))) : (($signed($unsigned(reg19)) - ((reg26 ?
                          reg15 : wire2) <<< $signed(reg22))) || ($signed((wire0 ^~ reg27)) ?
                          $signed({(8'ha5), (8'haa)}) : reg16[(2'h2):(2'h2)])));
  assign wire52 = $signed(((($signed(reg13) ?
                          {wire0} : $unsigned(wire5)) < ((reg12 ?
                              wire11 : wire9) ?
                          (~&reg13) : reg25)) ?
                      ($unsigned((wire5 ? (8'h9d) : wire51)) ?
                          (wire48 ?
                              wire9[(3'h5):(1'h1)] : $signed((8'had))) : (reg13[(1'h0):(1'h0)] <= (wire0 ?
                              wire2 : wire0))) : ($unsigned(reg18[(5'h13):(4'h8)]) ?
                          $unsigned(((8'ha4) ? wire46 : wire46)) : wire46)));
endmodule

module module29
#(parameter param45 = (^~(8'h9e)))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire34;
  input wire signed [(3'h5):(1'h0)] wire33;
  input wire [(3'h7):(1'h0)] wire32;
  input wire [(3'h6):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 (1'h0)};
  assign wire35 = wire30;
  assign wire36 = $unsigned($signed(((wire31[(3'h5):(3'h4)] ?
                          wire30 : (+wire30)) ?
                      ((wire30 >>> wire35) ?
                          wire35[(3'h5):(2'h2)] : (wire34 << wire32)) : (wire30 ?
                          $signed(wire34) : (wire32 ? wire32 : wire31)))));
  assign wire37 = {(wire31 != $signed($unsigned({(8'hb7), wire32})))};
  assign wire38 = (^~wire35[(3'h6):(2'h3)]);
  assign wire39 = $unsigned((|wire35[(2'h2):(1'h1)]));
  assign wire40 = wire37;
  assign wire41 = $unsigned(($unsigned(((!wire39) ?
                          (wire38 ^~ (8'hb9)) : (wire38 ? wire30 : wire33))) ?
                      (^~$unsigned({wire35, wire37})) : wire33[(3'h4):(2'h3)]));
  assign wire42 = ({{(wire33 ? (~wire39) : wire35),
                              $unsigned((wire33 && (7'h41)))},
                          ((~&wire32) != (|wire31[(1'h1):(1'h0)]))} ?
                      $unsigned($signed(((wire40 ?
                          wire38 : wire34) >= $signed((8'hb9))))) : (&$unsigned({(wire36 ?
                              wire30 : wire35),
                          ((8'ha1) <<< wire36)})));
  assign wire43 = ({((wire37 ?
                          (wire42 ? wire35 : wire30) : (wire40 ?
                              wire31 : wire32)) && ($unsigned(wire30) ?
                          (wire41 == (8'hb6)) : (wire32 <<< wire40))),
                      wire38} <<< $signed({wire32[(3'h7):(3'h7)],
                      $signed((wire30 - wire42))}));
  assign wire44 = (wire34[(2'h3):(1'h0)] <<< wire42[(5'h10):(2'h2)]);
endmodule
