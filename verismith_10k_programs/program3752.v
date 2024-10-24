module top
#(parameter param41 = ((~{(((8'ha8) ? (8'ha1) : (8'hb4)) + ((8'ha9) - (8'ha8)))}) << (~&((~^((8'ha7) ? (8'ha1) : (8'hae))) <= ((+(8'h9f)) ? ((8'hb0) & (8'hbf)) : (~(8'ha6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg9 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = wire3;
  assign wire6 = {$signed((8'hb7)), (|wire1)};
  assign wire7 = (!$signed($unsigned(($unsigned(wire3) <= wire5[(1'h1):(1'h1)]))));
  assign wire8 = (wire0[(1'h1):(1'h0)] ^~ $unsigned((~^$unsigned((wire7 ?
                     wire4 : wire1)))));
  always
    @(posedge clk) begin
      reg9 <= ($unsigned(($signed(wire8) ^~ $signed({(8'hb7), wire3}))) ?
          $signed(wire1) : ($unsigned(wire4) ?
              {$unsigned(wire0),
                  ($signed(wire1) ?
                      (wire7 * wire5) : (^wire3))} : $unsigned(wire0[(3'h4):(2'h3)])));
      if ((~(~|(wire2[(4'hc):(1'h1)] ?
          ((wire8 ? wire1 : wire0) >>> $signed(wire0)) : wire6))))
        begin
          reg10 <= (wire6 ? wire8[(4'h8):(3'h6)] : wire2[(3'h6):(3'h4)]);
          reg11 <= reg9[(5'h12):(2'h2)];
        end
      else
        begin
          reg10 <= (|wire7[(2'h3):(2'h2)]);
        end
      if ({(|$unsigned((~^reg11))),
          (+((^(8'ha0)) ?
              $signed($unsigned((8'h9d))) : $unsigned(wire7[(3'h5):(2'h3)])))})
        begin
          if ($unsigned(reg11[(1'h1):(1'h0)]))
            begin
              reg12 <= $signed($unsigned($unsigned((wire5 + (reg10 * wire8)))));
              reg13 <= {wire5[(4'hf):(4'hb)]};
              reg14 <= (!$unsigned(reg10[(4'h8):(4'h8)]));
              reg15 <= (({wire6[(3'h4):(3'h4)],
                  (|wire3[(2'h3):(2'h2)])} > ((&$signed(reg9)) ^ reg10)) & wire5);
              reg16 <= $signed($signed(wire2));
            end
          else
            begin
              reg12 <= wire8;
              reg13 <= (~(~reg13));
              reg14 <= $signed(wire1[(3'h6):(2'h3)]);
              reg15 <= ((wire2[(1'h1):(1'h1)] ?
                      $signed((!$signed((8'ha5)))) : (reg13[(4'hb):(3'h4)] ?
                          {(wire0 >>> reg10)} : ((wire7 ? wire7 : reg14) ?
                              (|(8'ha9)) : wire4[(3'h6):(3'h6)]))) ?
                  ($unsigned((reg14[(4'hb):(2'h3)] ^~ wire5[(3'h5):(3'h5)])) >>> (8'ha6)) : $signed({$unsigned(wire0[(1'h1):(1'h1)]),
                      (wire5[(1'h1):(1'h1)] ~^ wire4)}));
              reg16 <= $unsigned(reg10);
            end
          reg17 <= wire3[(2'h2):(1'h0)];
          reg18 <= ((~|(wire5[(3'h5):(2'h3)] - $unsigned($signed(wire5)))) ?
              $unsigned(reg15) : (|(~&reg11[(2'h2):(1'h1)])));
          reg19 <= wire1[(1'h1):(1'h0)];
        end
      else
        begin
          reg12 <= $signed(($unsigned(((~^wire5) && reg11)) ?
              $signed($unsigned(((8'hb7) <<< (8'hab)))) : ($signed(reg12) ?
                  {(wire5 >>> reg16)} : wire7)));
          reg13 <= (reg11 ?
              $signed(($unsigned(reg15) & wire1[(2'h2):(1'h1)])) : {$unsigned($signed($unsigned((8'hb3))))});
          if (((((!(8'hb4)) != $unsigned(wire7[(3'h7):(3'h4)])) + $signed((~(wire0 == wire8)))) ?
              (^({reg18[(2'h2):(1'h1)]} ?
                  $unsigned(wire3) : $signed(reg14))) : reg14))
            begin
              reg14 <= {(~^$unsigned({$signed(reg19), (~^reg17)})),
                  (~(~&wire1))};
              reg15 <= (^~(reg12 * {{reg9}, wire1}));
              reg16 <= reg9[(3'h4):(1'h1)];
            end
          else
            begin
              reg14 <= (~^(wire5 <= (wire8 ?
                  (&(wire6 ? reg18 : wire2)) : $unsigned($signed(reg12)))));
              reg15 <= (8'h9d);
              reg16 <= (-$signed((wire0 ^~ wire6[(4'hb):(4'h9)])));
              reg17 <= reg12;
            end
          reg18 <= (^~$unsigned((($signed(reg17) << wire7) ?
              (~(reg16 && wire2)) : (reg19[(4'hf):(3'h4)] ?
                  $unsigned((8'hae)) : (wire1 ? wire5 : wire8)))));
          reg19 <= ({wire6[(3'h5):(1'h1)],
              (|((wire2 ? reg9 : reg11) ?
                  $unsigned((8'hbd)) : (~|reg16)))} >> {(($signed(reg19) < (reg10 ?
                  (8'hb2) : (8'ha0))) ^~ $unsigned(reg9))});
        end
    end
  assign wire20 = (({(^(&wire1))} | $unsigned(reg14)) ?
                      $signed(reg12) : {(({wire5, reg9} ?
                                  (wire6 ?
                                      (8'h9d) : wire7) : ((8'ha7) < wire0)) ?
                              (^(reg18 << reg13)) : (|reg11[(3'h5):(2'h2)])),
                          reg16[(3'h7):(1'h0)]});
  assign wire21 = {reg18[(1'h0):(1'h0)], {(^$signed($signed(reg13)))}};
  assign wire22 = (^(wire0[(3'h4):(2'h3)] >> (reg15 + wire2[(4'h9):(3'h4)])));
  assign wire23 = {reg12[(4'h8):(3'h7)],
                      ({{wire6, $signed((8'ha2))}} ^ reg11[(2'h2):(1'h1)])};
  always
    @(posedge clk) begin
      reg24 <= (wire3[(3'h6):(1'h1)] ?
          ((8'hb2) ^~ {($unsigned(wire6) ?
                  wire22[(3'h4):(1'h1)] : $unsigned(reg19)),
              $unsigned((reg11 <<< reg14))}) : ($unsigned($unsigned(wire0[(3'h4):(2'h3)])) ?
              wire2 : {{(wire20 ? reg9 : wire7)}}));
      reg25 <= {{reg13[(5'h11):(5'h10)]}, (~wire7)};
      reg26 <= (^(8'h9e));
      if (reg25[(1'h1):(1'h1)])
        begin
          if ((((^~wire6[(3'h7):(2'h2)]) ?
              {(-$signed(reg16)),
                  $unsigned($unsigned(wire5))} : (((reg15 << wire6) ?
                  (wire20 | reg12) : {reg26}) * (8'hb7))) >> {$unsigned({$signed(wire21)}),
              (reg16[(2'h3):(1'h0)] ?
                  (^((7'h44) ?
                      reg13 : (8'hb7))) : ((8'ha9) && $unsigned(wire2)))}))
            begin
              reg27 <= reg12[(5'h11):(2'h2)];
              reg28 <= reg16;
            end
          else
            begin
              reg27 <= wire8;
              reg28 <= ((wire22[(4'h8):(3'h7)] ?
                      (!wire7) : (({wire5, reg16} != (^~reg15)) ?
                          {$signed(wire23), reg17} : reg26[(3'h4):(2'h2)])) ?
                  $unsigned((&$unsigned(wire7[(2'h2):(2'h2)]))) : $unsigned(($signed(reg19[(4'hb):(3'h5)]) ?
                      (+(reg17 ~^ (8'hb9))) : reg14[(4'hf):(1'h1)])));
              reg29 <= $signed($signed(((&(&(8'ha6))) ?
                  $signed($signed(wire21)) : (reg17 != reg26[(3'h6):(2'h3)]))));
              reg30 <= ($unsigned((~|$signed(wire20[(4'hb):(4'hb)]))) ?
                  ($unsigned(reg16[(4'hd):(4'h8)]) ?
                      $signed(($unsigned(reg15) ?
                          (reg9 ^ reg19) : (wire5 + reg17))) : wire5[(4'hd):(4'hb)]) : ($unsigned(reg12) ?
                      (~reg17[(4'h8):(4'h8)]) : (((wire23 | wire20) + $unsigned((7'h40))) && wire23[(4'ha):(4'h9)])));
              reg31 <= ((+reg24) ?
                  {$signed((|{reg18}))} : ((({(8'hac), wire6} ?
                          (wire8 ^ reg9) : reg17) ?
                      wire3[(3'h4):(1'h1)] : {$signed(reg15),
                          $unsigned(wire2)}) <<< $signed(wire21[(1'h0):(1'h0)])));
            end
          reg32 <= $signed(($unsigned($signed((wire8 ? reg30 : wire23))) ?
              ({(reg15 >> wire21)} == $signed((wire0 || wire1))) : ((reg12[(4'h8):(3'h4)] ?
                      (8'h9d) : (-wire2)) ?
                  ((8'had) ^ $unsigned(wire2)) : (|(^(8'hb5))))));
          reg33 <= $unsigned((reg27[(3'h6):(2'h2)] == ($unsigned({wire6,
                  wire0}) ?
              (reg28[(3'h5):(3'h4)] >= reg17) : (reg26 - (reg14 ?
                  reg26 : (8'hb5))))));
          if ($signed(reg26))
            begin
              reg34 <= $unsigned($unsigned($unsigned($unsigned($unsigned(wire4)))));
              reg35 <= (&reg14[(1'h0):(1'h0)]);
              reg36 <= (reg11[(1'h1):(1'h1)] << reg11);
            end
          else
            begin
              reg34 <= ((+({wire0[(2'h3):(1'h1)]} * reg14[(3'h4):(2'h3)])) ?
                  wire0[(2'h3):(2'h3)] : (^~$unsigned(reg10)));
              reg35 <= $signed((wire3 ?
                  ((8'hb9) ~^ $signed(((8'hbd) ?
                      reg18 : wire20))) : (&$unsigned($unsigned(wire7)))));
              reg36 <= (wire7 ?
                  $unsigned(wire20[(5'h10):(4'h8)]) : wire23[(3'h7):(3'h4)]);
              reg37 <= (^reg30);
            end
          reg38 <= ($unsigned((!reg32)) ?
              (~^($signed((^~reg19)) ?
                  reg34 : $unsigned($signed(reg26)))) : $signed($unsigned(reg35[(2'h3):(2'h3)])));
        end
      else
        begin
          reg27 <= wire2;
          reg28 <= reg35[(3'h5):(3'h4)];
          if ($unsigned($signed(reg18)))
            begin
              reg29 <= wire8;
              reg30 <= $unsigned(wire8);
              reg31 <= wire6;
            end
          else
            begin
              reg29 <= ((&($signed($signed(wire3)) ?
                      (~(reg11 ? reg9 : reg13)) : wire20)) ?
                  $signed($signed(((reg31 <= reg37) >>> (!reg37)))) : (($signed($unsigned(wire20)) ?
                          {reg30[(1'h1):(1'h1)],
                              wire0[(1'h1):(1'h0)]} : (reg13[(3'h4):(1'h0)] ?
                              ((7'h40) & reg30) : {(8'haf)})) ?
                      $unsigned(wire22[(2'h2):(2'h2)]) : (~|$unsigned(reg28))));
              reg30 <= (!(~|(~^{(reg18 ? reg9 : reg24)})));
              reg31 <= reg18[(4'h8):(3'h4)];
            end
          if ($signed(reg11))
            begin
              reg32 <= $signed(reg9);
              reg33 <= reg29[(1'h1):(1'h1)];
            end
          else
            begin
              reg32 <= ({(~($signed(reg30) ?
                      $signed((8'hb2)) : (~|reg12)))} >>> wire2[(3'h5):(2'h3)]);
            end
          reg34 <= $unsigned(($signed(reg28[(3'h5):(1'h0)]) < (reg25 ?
              {$signed((8'ha6)), (~^reg18)} : ({reg10} ? wire23 : {(8'h9e)}))));
        end
    end
  assign wire39 = (8'haf);
  assign wire40 = (reg17[(3'h5):(3'h4)] | wire20[(1'h0):(1'h0)]);
endmodule
