module top
#(parameter param57 = (((|((&(8'hac)) != ((8'ha1) + (8'had)))) | {{((8'haa) >= (8'had))}, (~^(-(8'ha0)))}) <<< (^~{(|(!(8'hb2))), (((8'h9e) ? (7'h44) : (8'hae)) ? (8'hab) : {(8'hbc), (8'ha3)})})), 
parameter param58 = {(|param57), ((&param57) ^~ (8'hb4))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire16;
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire16,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 reg30,
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
                 (1'h0)};
  module4 #() modinst17 (.wire8(wire3), .y(wire16), .wire6(wire0), .wire5((8'hb4)), .clk(clk), .wire9(wire2), .wire7(wire1));
  assign wire18 = wire0;
  assign wire19 = wire1[(5'h11):(4'he)];
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg20 <= wire18[(4'hc):(3'h4)];
        end
      else
        begin
          if ($signed(wire18))
            begin
              reg20 <= {($signed($unsigned($signed((7'h41)))) & $unsigned(wire3[(2'h2):(1'h1)]))};
              reg21 <= $unsigned((-$signed(wire3)));
            end
          else
            begin
              reg20 <= ((7'h41) != $unsigned((wire16 | $unsigned((~&wire2)))));
              reg21 <= (8'hb5);
              reg22 <= wire3[(1'h1):(1'h1)];
              reg23 <= (reg22[(1'h1):(1'h0)] ?
                  (8'h9f) : (($unsigned((wire3 != (8'h9f))) == wire2) >>> $unsigned({$unsigned((7'h44))})));
              reg24 <= ((($unsigned($unsigned(wire3)) ?
                      reg22 : wire2) + reg21[(4'h8):(3'h4)]) ?
                  (($signed((reg23 | reg20)) >>> wire2[(4'hf):(4'hd)]) ?
                      wire2 : (~|(!(wire2 << reg21)))) : (+(wire3[(2'h2):(1'h0)] ?
                      reg21[(3'h7):(2'h3)] : (!{reg20}))));
            end
          reg25 <= wire19[(4'hf):(4'hd)];
          if (($signed(((^(wire1 ? reg24 : reg25)) ?
              $signed((wire18 ?
                  (8'hb4) : reg20)) : $signed($unsigned(wire18)))) & (reg20[(1'h0):(1'h0)] ?
              (reg23 >= {wire3[(1'h1):(1'h1)]}) : (-$unsigned((reg22 ?
                  wire1 : wire1))))))
            begin
              reg26 <= reg21;
              reg27 <= ((($signed({(8'hab)}) ?
                          (8'h9e) : ($signed(reg25) ?
                              (+(8'ha8)) : {wire19, reg26})) ?
                      reg26[(3'h7):(3'h7)] : ($signed($signed((8'had))) ?
                          $unsigned((wire18 - wire3)) : ((wire2 ?
                                  reg22 : wire16) ?
                              {reg24} : ((7'h41) >> reg20)))) ?
                  wire16 : {wire2[(4'ha):(3'h4)]});
            end
          else
            begin
              reg26 <= (reg21[(4'he):(3'h7)] ?
                  (wire18 || ($unsigned(reg23) & $unsigned((^wire18)))) : ((reg21[(4'hf):(4'ha)] ~^ (wire3[(3'h5):(3'h4)] ?
                      wire19[(5'h13):(3'h5)] : (reg25 ?
                          wire0 : wire19))) | $unsigned(((reg22 ?
                          reg26 : reg23) ?
                      ((8'ha4) ^ reg21) : (reg25 != wire18)))));
              reg27 <= {(^{(8'h9c), (8'hbb)}),
                  {{($unsigned(wire19) ? (^~(8'hbc)) : wire3[(1'h0):(1'h0)])}}};
              reg28 <= wire3;
              reg29 <= (!wire16);
            end
          reg30 <= (((+((^reg20) >> wire1)) || ((|$signed(wire2)) && {(reg29 ^ wire18)})) ?
              {$signed(wire16),
                  (wire0 ?
                      (^~$signed(reg24)) : $unsigned($signed(wire3)))} : reg22[(4'h8):(3'h5)]);
        end
      if (reg28)
        begin
          if ((($unsigned($unsigned($signed(reg28))) >>> ($unsigned(reg21) > $signed((~&reg22)))) ?
              wire0[(1'h1):(1'h0)] : $unsigned((((~&reg22) ~^ {wire2,
                  wire3}) + reg22))))
            begin
              reg31 <= wire18[(1'h1):(1'h0)];
              reg32 <= $unsigned(((reg26[(4'hc):(2'h3)] ^~ (+(reg25 & reg30))) ?
                  (~&((reg23 ? reg22 : wire2) ?
                      (reg24 ?
                          reg29 : reg31) : (reg26 || wire19))) : reg29[(3'h6):(3'h4)]));
              reg33 <= (8'hbb);
            end
          else
            begin
              reg31 <= wire19;
              reg32 <= $signed($unsigned((((reg23 ?
                      (8'ha2) : reg32) * reg23[(4'h8):(2'h2)]) ?
                  reg21[(2'h2):(1'h1)] : $unsigned($unsigned(wire18)))));
            end
          reg34 <= (~&$unsigned(((-$unsigned((8'hb6))) ?
              ($signed(wire0) != (^reg23)) : reg22[(4'h9):(2'h2)])));
          if (((reg23 ? wire18[(3'h6):(2'h2)] : wire16) ?
              $unsigned($unsigned((((8'hba) <<< reg30) ?
                  (reg28 < reg23) : $unsigned(wire3)))) : $unsigned((8'ha3))))
            begin
              reg35 <= ($signed($unsigned(reg20[(3'h7):(3'h7)])) * ((!$unsigned((wire1 ?
                  reg22 : reg21))) + $signed($unsigned($signed((8'ha2))))));
              reg36 <= wire2[(4'hc):(1'h1)];
              reg37 <= (!$unsigned($signed((^~((8'hb7) ? reg32 : reg32)))));
              reg38 <= $unsigned(reg30);
            end
          else
            begin
              reg35 <= (8'hbf);
              reg36 <= $signed({$signed(((8'ha7) <= (wire19 + (8'hbc)))),
                  $unsigned(((wire1 ? (8'ha8) : reg38) ?
                      ((8'ha4) ? reg27 : reg24) : wire2))});
              reg37 <= $unsigned(((8'hb3) && (~^(-$unsigned(wire3)))));
            end
          reg39 <= $signed((|$unsigned($unsigned((wire16 ? wire3 : wire18)))));
        end
      else
        begin
          reg31 <= (reg39[(4'h8):(2'h2)] ?
              (reg32 ?
                  wire1[(3'h4):(1'h0)] : (wire18 && $signed(reg39))) : ($unsigned($unsigned(((7'h40) ?
                  wire1 : reg25))) + $unsigned(((reg38 | reg27) ?
                  (reg32 ? reg23 : reg22) : {wire16, reg22}))));
          reg32 <= (&$unsigned($signed($unsigned({reg25, wire18}))));
        end
      if (reg20)
        begin
          if (($unsigned($unsigned($unsigned((wire16 >= reg22)))) << $unsigned(($unsigned((reg36 && (8'hb4))) ?
              (reg39 * (|reg27)) : $unsigned((wire18 ? reg20 : wire16))))))
            begin
              reg40 <= {reg23[(3'h6):(1'h0)],
                  (~($signed($signed(wire0)) ?
                      $unsigned((~reg38)) : $unsigned((reg35 <<< reg22))))};
              reg41 <= $signed((~(~&(&$unsigned(wire16)))));
              reg42 <= (!{({(reg27 <= wire2)} ?
                      ((wire2 ? (8'hb4) : reg39) || (reg39 >= reg24)) : wire16),
                  reg27[(3'h7):(3'h4)]});
            end
          else
            begin
              reg40 <= {(&($unsigned({reg23,
                      (8'hb5)}) ^ reg32[(2'h3):(2'h3)]))};
            end
          if ($signed((^(($signed(reg22) ? $signed(reg24) : wire3) ?
              $unsigned(wire2) : reg33[(4'hd):(4'h9)]))))
            begin
              reg43 <= {{$unsigned(((reg32 ? (8'h9f) : reg21) ?
                          {(8'haf), reg20} : (~reg42))),
                      $unsigned((reg29[(1'h0):(1'h0)] >= (reg31 ?
                          (8'hb0) : reg23)))},
                  $signed(($unsigned($signed(reg31)) >> $signed({reg38})))};
              reg44 <= (wire19 || reg42);
              reg45 <= (-((reg22 ?
                  (~&((8'ha0) > reg37)) : $signed($signed(reg21))) >>> $unsigned((!wire16[(3'h4):(1'h1)]))));
              reg46 <= reg20[(4'hd):(4'hd)];
              reg47 <= $unsigned(reg39);
            end
          else
            begin
              reg43 <= $signed(((|reg44) > reg46));
              reg44 <= wire3[(3'h7):(1'h0)];
              reg45 <= (+$unsigned(reg46));
              reg46 <= reg40[(1'h0):(1'h0)];
            end
          reg48 <= (($signed((~reg43)) << reg45) ^ reg24[(2'h3):(1'h1)]);
          reg49 <= reg36[(4'h9):(1'h0)];
        end
      else
        begin
          reg40 <= {$signed($unsigned((-$unsigned(reg48)))),
              (^~(+((&reg41) <<< $unsigned((8'haa)))))};
        end
      if (((reg30[(3'h6):(2'h3)] <<< (~&$unsigned((^~reg30)))) == {(reg26[(2'h3):(1'h0)] == (reg40[(3'h4):(2'h3)] ?
              (^wire16) : $signed(reg45))),
          ($unsigned(reg41) * reg20)}))
        begin
          reg50 <= reg26;
          reg51 <= ($unsigned($signed((^~(wire18 ?
              reg41 : wire2)))) <= $signed($signed((|reg42))));
          reg52 <= reg25[(4'hd):(4'h8)];
        end
      else
        begin
          if (($unsigned($signed((^~$signed(reg46)))) > ((reg45 >> {{reg32},
              (reg27 >> reg25)}) <<< reg41)))
            begin
              reg50 <= {reg50[(2'h3):(2'h3)],
                  (reg30[(1'h1):(1'h1)] <<< reg25[(1'h0):(1'h0)])};
              reg51 <= wire19;
              reg52 <= reg27;
              reg53 <= $signed(reg36[(4'ha):(3'h7)]);
            end
          else
            begin
              reg50 <= (({(~|(wire0 == reg40)),
                      $unsigned($unsigned((8'hab)))} <= ($signed($unsigned(reg45)) ?
                      reg43 : $signed(reg33))) ?
                  ((reg36 * $unsigned($unsigned(reg47))) ?
                      reg45[(2'h2):(1'h1)] : (8'ha3)) : {wire2,
                      ((~&(reg45 ? reg27 : reg38)) << reg39[(3'h6):(3'h4)])});
            end
          reg54 <= $unsigned((reg44[(2'h3):(2'h2)] | reg51));
          reg55 <= $unsigned($unsigned((~|$unsigned({(8'ha4), reg48}))));
        end
      reg56 <= (~^$signed({((|reg21) ? $signed(wire18) : (-(8'hb9)))}));
    end
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  input wire [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire10;
  assign y = {wire15, wire14, wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = wire8;
  assign wire11 = wire8[(1'h0):(1'h0)];
  assign wire12 = $signed($unsigned((($signed(wire9) ?
                      (|wire9) : $unsigned(wire8)) <<< $unsigned((wire5 ?
                      wire9 : wire5)))));
  assign wire13 = ((!wire5[(2'h3):(1'h1)]) ?
                      $unsigned($signed((^~wire11))) : wire11);
  assign wire14 = ($unsigned(($signed(wire11) * wire13[(4'hc):(1'h0)])) != $unsigned((({(8'hb0),
                              wire12} ?
                          (+(8'hb5)) : $unsigned(wire12)) ?
                      wire11 : $signed(wire6))));
  assign wire15 = $unsigned(({{(~|wire14), $signed(wire5)},
                          $unsigned((wire7 || wire8))} ?
                      ($signed({wire7}) >= (^~(~wire8))) : (({(8'hb2)} ?
                              (~&wire8) : ((8'h9d) ? (8'hb1) : (8'hb9))) ?
                          $unsigned(wire10) : $signed((wire14 ?
                              wire13 : wire10)))));
endmodule
