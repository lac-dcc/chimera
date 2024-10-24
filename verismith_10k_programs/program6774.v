module top
#(parameter param38 = (!(~|{{(!(7'h43))}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire11,
                 wire7,
                 wire5,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg6,
                 (1'h0)};
  assign wire5 = {wire1,
                     {((wire4 && (8'hab)) * $unsigned(wire4[(4'ha):(4'h9)])),
                         {$unsigned($signed((8'hb1)))}}};
  always
    @(posedge clk) begin
      if (((wire4[(4'hd):(3'h6)] >> (((wire4 ^~ wire2) ?
              $signed(wire5) : wire4[(4'hc):(4'h9)]) == (wire1[(3'h7):(3'h4)] ?
              (^(8'hb4)) : ((8'hb5) ? wire1 : (8'hb4))))) ?
          ($signed((wire0[(3'h4):(1'h0)] != (wire1 ?
              wire1 : wire0))) << (-wire3[(5'h10):(3'h7)])) : ((((wire4 ?
                  wire1 : wire1) != $signed((8'hb3))) ?
              (8'hb1) : ((wire5 ?
                  wire1 : wire5) > wire2[(2'h2):(2'h2)])) < (($signed(wire2) ?
                  $signed(wire1) : (~|wire5)) ?
              ((+wire1) ? $unsigned(wire2) : wire0) : wire4))))
        begin
          reg6 <= ((+wire2) ?
              $unsigned((!((wire3 + wire5) ?
                  (&wire3) : $unsigned(wire1)))) : wire2);
        end
      else
        begin
          reg6 <= $signed(($unsigned($unsigned($unsigned((8'h9f)))) ?
              $unsigned({wire4[(3'h5):(2'h3)], (~|wire2)}) : (wire4 ?
                  $signed((wire3 ?
                      (7'h40) : wire2)) : $signed(wire4[(3'h6):(3'h4)]))));
        end
    end
  assign wire7 = (~|(~|$signed(($unsigned(wire0) < (!wire1)))));
  always
    @(posedge clk) begin
      reg8 <= ((wire3 || (~^wire5)) == $unsigned(((~^wire7) ?
          $unsigned(reg6) : ((8'ha5) ^ wire5[(5'h11):(4'hf)]))));
      reg9 <= (-(8'hab));
      reg10 <= (((wire4 ?
              $signed((wire4 ? wire2 : (8'h9e))) : (wire3 ?
                  (wire1 ? reg9 : wire1) : $signed(wire4))) ?
          wire5[(4'hb):(4'h9)] : {wire3[(3'h7):(1'h1)],
              (|reg8)}) >>> ((!($unsigned(wire4) - (|reg9))) < (((wire2 != wire0) <= (!reg6)) << ($unsigned((8'hb5)) ?
          {wire4, wire7} : $unsigned(reg8)))));
    end
  assign wire11 = {(!$signed({wire5[(1'h0):(1'h0)], wire4[(5'h11):(4'hc)]}))};
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire1);
      if ((8'hb0))
        begin
          if ({($signed((8'haa)) ? $signed((8'hb1)) : wire5)})
            begin
              reg13 <= (^wire7);
              reg14 <= reg10[(5'h10):(3'h7)];
              reg15 <= {$unsigned($unsigned(((~^wire1) & wire11))),
                  (~$signed(wire0[(3'h7):(3'h4)]))};
              reg16 <= $unsigned(($signed(((~^wire11) ?
                      $unsigned(reg15) : (^~wire1))) ?
                  $signed($signed($unsigned(wire7))) : wire2));
              reg17 <= (-reg9[(5'h12):(5'h12)]);
            end
          else
            begin
              reg13 <= reg6[(5'h10):(2'h3)];
              reg14 <= ((8'hba) ?
                  reg13 : ($unsigned((reg10 ?
                      $signed((8'ha7)) : (wire1 ? reg16 : (7'h42)))) ^~ reg17));
              reg15 <= $signed(wire5[(5'h11):(4'hd)]);
              reg16 <= (^~{reg17, $signed(({(8'hbe)} ? reg12 : {wire2}))});
              reg17 <= (($signed(($unsigned(wire7) ?
                      (reg15 ? wire2 : reg12) : (|wire3))) ?
                  {($signed((8'ha1)) && $unsigned(wire4))} : reg17[(1'h0):(1'h0)]) + $signed($unsigned((reg6[(3'h5):(1'h1)] ?
                  (8'hbe) : $unsigned(reg12)))));
            end
          reg18 <= (&$signed(reg8[(4'hf):(4'hf)]));
        end
      else
        begin
          reg13 <= ({(~|$signed((-(7'h40))))} ?
              $unsigned(($signed((reg15 ?
                  wire0 : reg17)) >>> $signed(wire5[(1'h1):(1'h1)]))) : $unsigned($signed(($signed(wire4) - wire7[(1'h1):(1'h0)]))));
          if ((8'ha1))
            begin
              reg14 <= wire5;
              reg15 <= wire2[(3'h4):(1'h0)];
              reg16 <= $unsigned($signed($signed(wire0[(1'h1):(1'h1)])));
              reg17 <= (~(+(^~reg14)));
            end
          else
            begin
              reg14 <= reg16;
            end
        end
      if ((^($signed((&$unsigned((8'hb1)))) == {(reg6 ^~ reg10[(4'ha):(3'h4)])})))
        begin
          reg19 <= $unsigned(wire5[(1'h1):(1'h1)]);
          if ((wire7[(1'h1):(1'h0)] & reg13[(4'h8):(3'h4)]))
            begin
              reg20 <= (reg19[(4'hc):(3'h4)] ? reg15[(2'h3):(1'h0)] : reg17);
              reg21 <= wire2;
              reg22 <= wire11[(1'h0):(1'h0)];
              reg23 <= $unsigned($unsigned(reg20));
              reg24 <= reg19[(3'h4):(1'h0)];
            end
          else
            begin
              reg20 <= $unsigned({$signed((reg13 ?
                      $signed(reg15) : (^(7'h44)))),
                  ($signed((reg18 + reg9)) ^ wire7[(2'h2):(2'h2)])});
            end
          reg25 <= reg21[(4'h8):(3'h7)];
          reg26 <= reg19[(4'h9):(2'h3)];
        end
      else
        begin
          if ($signed($unsigned(wire3[(3'h7):(1'h1)])))
            begin
              reg19 <= $signed(({({wire1, wire7} ?
                      (^~reg13) : (reg12 ?
                          wire4 : (8'hab)))} << (~|$unsigned(reg8))));
              reg20 <= (reg13 ?
                  (reg17[(2'h2):(1'h0)] ?
                      reg16[(2'h2):(1'h1)] : (&wire11)) : (|(~|(((8'ha9) ?
                      (8'ha1) : wire4) >>> $signed(reg22)))));
              reg21 <= ((($signed((~reg15)) ^~ $signed((wire5 ?
                          reg12 : reg23))) ?
                      {{wire3[(4'hb):(2'h3)]}} : (8'haf)) ?
                  wire11[(3'h4):(3'h4)] : reg20[(2'h2):(2'h2)]);
              reg22 <= {(((~&(wire0 ? reg16 : reg16)) + reg17) ?
                      (reg24[(2'h3):(2'h3)] < ((-wire2) ?
                          {wire11} : (^~reg9))) : ((8'h9e) ?
                          ($unsigned(reg9) << (wire2 | reg24)) : wire4))};
            end
          else
            begin
              reg19 <= reg18[(2'h2):(1'h0)];
              reg20 <= $signed(reg25[(5'h13):(2'h3)]);
              reg21 <= (reg12 ?
                  (|((-(reg22 <= (7'h44))) ?
                      $unsigned($unsigned(reg9)) : (~wire5))) : $unsigned(((+reg22[(3'h4):(1'h0)]) - (reg19[(4'ha):(3'h7)] == $unsigned(reg9)))));
              reg22 <= $unsigned($signed($unsigned(reg6)));
            end
        end
      if ({$unsigned(($signed(((8'had) ? reg16 : reg15)) ~^ $unsigned((reg19 ?
              reg17 : reg9))))})
        begin
          reg27 <= $unsigned($unsigned($signed({(reg12 ? (8'hb0) : wire7),
              (reg24 | reg19)})));
          reg28 <= (reg16 && $unsigned($signed(((wire0 * reg13) ?
              (reg8 != (8'hbb)) : {wire1, reg18}))));
          if ($signed((!$signed(({wire3} ? $signed(wire1) : reg24)))))
            begin
              reg29 <= $signed((-reg20));
              reg30 <= $unsigned($unsigned((reg22[(2'h3):(1'h0)] ?
                  $unsigned((wire1 < reg9)) : {{reg24, wire0},
                      (wire2 ? wire2 : (8'hb9))})));
              reg31 <= ($signed($unsigned(wire0[(3'h5):(3'h4)])) - (^(~&$unsigned((reg9 * reg15)))));
            end
          else
            begin
              reg29 <= (^~({reg22} ? $unsigned((&$signed(reg24))) : reg20));
              reg30 <= reg25[(5'h11):(4'hd)];
              reg31 <= ($unsigned($unsigned($unsigned((!reg15)))) ?
                  $unsigned((reg18[(1'h1):(1'h0)] || (8'h9f))) : (-reg19[(4'hd):(1'h0)]));
              reg32 <= (~reg21[(4'hd):(4'ha)]);
              reg33 <= $unsigned($unsigned($signed(wire0[(2'h3):(2'h2)])));
            end
        end
      else
        begin
          if ((|(~wire3)))
            begin
              reg27 <= $signed({(&{reg17, reg19[(4'ha):(3'h5)]})});
              reg28 <= reg6[(3'h5):(1'h0)];
              reg29 <= (reg17[(4'ha):(2'h2)] | wire5);
              reg30 <= ((~^(+reg13[(3'h6):(3'h4)])) ?
                  reg30 : $unsigned((~&reg20[(2'h2):(1'h1)])));
              reg31 <= (!$unsigned($signed(reg23)));
            end
          else
            begin
              reg27 <= {(+$unsigned($signed({(8'hba)})))};
              reg28 <= (+$signed(reg33));
              reg29 <= $signed({($unsigned($unsigned(reg27)) ?
                      $unsigned($unsigned(reg20)) : $unsigned($unsigned((7'h44)))),
                  $signed((~$signed(reg8)))});
              reg30 <= ((8'hac) ~^ $unsigned($unsigned(reg24)));
            end
          reg32 <= (~|{((+(reg20 ? reg33 : reg6)) ?
                  (~|wire5[(2'h2):(1'h0)]) : $unsigned({(8'hac), reg19})),
              ((&(reg8 ? wire3 : wire3)) >>> ((^~(8'ha9)) ?
                  (8'hbf) : $unsigned(reg29)))});
          reg33 <= reg6;
          reg34 <= $unsigned($unsigned((!$signed((^~reg14)))));
          reg35 <= reg34[(4'hd):(4'ha)];
        end
    end
  assign wire36 = $unsigned(((wire3 ?
                      (^(8'hab)) : reg23[(2'h2):(2'h2)]) & reg16));
  assign wire37 = $unsigned((!(wire3 >>> $unsigned((reg30 >> reg18)))));
endmodule
