module top
#(parameter param40 = (~|(~|((&{(8'h9c), (8'h9f)}) > (((8'h9d) <<< (8'hb4)) << ((8'hab) ? (8'ha8) : (8'ha3)))))), 
parameter param41 = ((param40 ? (((^param40) ? param40 : param40) ? ((param40 ^~ (7'h40)) ? (param40 ? param40 : param40) : (param40 * param40)) : ((^~param40) ? (^param40) : (~|param40))) : (!{((8'hab) ? param40 : param40), (param40 <= (8'hbd))})) <<< (((7'h44) ? (^(param40 ? param40 : param40)) : ((param40 ? (8'hb6) : param40) >= {param40, param40})) ^ ((param40 != param40) << (~|(param40 ? param40 : param40))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg12 = (1'h0);
  reg [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg7 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire6,
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
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ((&($signed((7'h44)) || (~$unsigned(wire1)))) ?
                     (8'hae) : $unsigned($signed(($signed((8'hb3)) ^ (wire3 ^ (8'ha1))))));
  assign wire6 = (wire3[(4'he):(4'hb)] ^ $unsigned((8'hb2)));
  always
    @(posedge clk) begin
      reg7 <= wire6[(1'h1):(1'h0)];
      reg8 <= {wire1[(4'hd):(3'h6)],
          (wire3 ?
              {$unsigned((~|wire1))} : (-($unsigned(wire1) ?
                  (^~reg7) : $unsigned(wire1))))};
      if (wire6[(1'h0):(1'h0)])
        begin
          reg9 <= wire5;
          reg10 <= ((~^$signed($signed((wire4 & wire0)))) | $unsigned($signed(reg8)));
          if ($unsigned((~&((reg10[(1'h0):(1'h0)] ^~ (reg7 ? wire1 : wire2)) ?
              ($unsigned(wire4) ?
                  $signed(wire2) : wire3[(5'h10):(4'hb)]) : (reg8 ?
                  reg7[(1'h0):(1'h0)] : $unsigned(wire1))))))
            begin
              reg11 <= wire6[(1'h1):(1'h1)];
              reg12 <= wire1[(3'h6):(3'h5)];
            end
          else
            begin
              reg11 <= $unsigned(wire5[(4'h9):(3'h6)]);
              reg12 <= (8'ha6);
              reg13 <= (({$signed(reg12[(1'h1):(1'h1)]),
                  $signed(reg9)} || reg8[(1'h0):(1'h0)]) ^ reg7[(2'h2):(1'h1)]);
              reg14 <= $unsigned(((~^(reg10[(4'h9):(3'h5)] ?
                      (~reg9) : {(8'hb0)})) ?
                  reg11[(2'h3):(1'h0)] : {(((8'hb2) ?
                          wire3 : wire4) <= (+reg7))}));
              reg15 <= (wire2 <<< ((-$signed(reg12[(3'h7):(3'h6)])) ?
                  $unsigned(reg7) : reg14));
            end
        end
      else
        begin
          reg9 <= $unsigned($signed(reg12[(1'h1):(1'h0)]));
          reg10 <= $signed({$signed({reg12[(3'h5):(1'h0)]})});
          if ((reg7[(2'h2):(1'h1)] ^~ (~|wire3)))
            begin
              reg11 <= reg13[(4'ha):(3'h6)];
              reg12 <= ((reg14 ? wire3[(4'h8):(2'h2)] : $unsigned(wire6)) ?
                  $unsigned({reg14,
                      ($unsigned(reg8) >>> wire5[(4'ha):(3'h5)])}) : $signed((wire2[(4'hd):(1'h0)] ?
                      (&(8'hb7)) : $unsigned(reg9[(1'h1):(1'h1)]))));
              reg13 <= reg7;
            end
          else
            begin
              reg11 <= (8'hb1);
              reg12 <= $signed((reg14[(1'h1):(1'h1)] ?
                  $signed((!{wire4, wire1})) : {wire1,
                      ((reg11 <<< wire4) ? (reg13 ^ reg8) : (reg13 | wire5))}));
              reg13 <= (($signed($signed(((8'hb0) ~^ reg10))) ?
                  $unsigned((^$unsigned(reg9))) : (($unsigned((8'h9c)) << ((8'hb7) << wire2)) | reg12)) ^ (-(^{(+(8'h9e))})));
              reg14 <= reg12;
              reg15 <= (^~wire0[(3'h7):(1'h0)]);
            end
          reg16 <= (8'hae);
          reg17 <= (~^((^~$unsigned($unsigned(reg12))) + wire0[(2'h2):(2'h2)]));
        end
      reg18 <= ($unsigned($unsigned({((7'h42) || (8'ha7))})) ?
          $unsigned(reg15[(3'h5):(3'h5)]) : (~wire0[(3'h6):(3'h4)]));
      if ($unsigned($unsigned($unsigned((8'hac)))))
        begin
          reg19 <= (({({wire3} ? (wire5 || wire4) : (^reg7)),
                  $signed($unsigned((8'hb8)))} < $signed($signed(wire6))) ?
              $unsigned((({reg15} >>> (-reg14)) ?
                  ($signed((8'haa)) ?
                      $signed(reg13) : {reg10}) : reg10)) : ($unsigned($signed($unsigned(reg16))) ?
                  ((~$signed((8'hbb))) <= {(reg18 & wire5)}) : {$signed($unsigned((7'h43))),
                      (-reg10)}));
        end
      else
        begin
          reg19 <= reg13;
          reg20 <= $unsigned($unsigned((~|reg18)));
          reg21 <= (reg16[(3'h7):(3'h6)] ?
              $unsigned({reg19[(4'h9):(3'h6)]}) : $unsigned($unsigned(reg7[(1'h1):(1'h1)])));
          reg22 <= $signed($signed(reg9[(2'h3):(1'h0)]));
          reg23 <= (!(~|$unsigned((reg8[(2'h2):(1'h1)] * $signed(reg20)))));
        end
    end
  always
    @(posedge clk) begin
      reg24 <= $signed((~|$signed($unsigned(reg23[(4'hc):(4'hb)]))));
      reg25 <= $unsigned(($signed((8'ha3)) + (((wire1 ? reg13 : (8'hbf)) ?
          reg20[(2'h3):(2'h3)] : (reg20 == wire1)) ~^ $signed(reg7))));
      reg26 <= {(~^$unsigned($unsigned(reg18[(2'h2):(1'h1)])))};
      if (($signed(reg15) | wire0[(3'h6):(3'h5)]))
        begin
          if (wire4[(4'hb):(3'h7)])
            begin
              reg27 <= (+$unsigned($unsigned(wire3[(5'h11):(5'h10)])));
            end
          else
            begin
              reg27 <= ({reg8} ^~ wire5);
              reg28 <= (~^{reg12, (7'h41)});
              reg29 <= (reg9[(3'h4):(3'h4)] - ($unsigned(($unsigned(reg11) >> reg23)) ?
                  {reg19[(2'h2):(2'h2)]} : (+$unsigned((reg16 ?
                      (8'hb4) : (8'hab))))));
              reg30 <= {reg24[(2'h2):(1'h0)],
                  (!((^reg24[(2'h3):(1'h0)]) & {(~&reg23), reg17}))};
            end
          reg31 <= ($unsigned({({wire3, reg22} || (wire0 << (8'hb5))),
              ((reg11 ? wire6 : (8'ha7)) ?
                  reg18[(2'h2):(2'h2)] : reg15[(3'h7):(1'h1)])}) && ($signed(reg23[(2'h3):(1'h1)]) ?
              (reg7 << ((!reg14) ?
                  wire4[(4'h9):(3'h6)] : (reg15 ? reg26 : wire5))) : reg19));
          reg32 <= ((8'hb1) ? $unsigned(reg11) : reg20[(2'h2):(1'h1)]);
          reg33 <= (((~($unsigned(wire0) ? (wire6 + reg27) : (~|(8'ha9)))) ?
                  reg17[(4'hc):(4'h8)] : $signed((~&(reg27 << reg31)))) ?
              (reg27 ?
                  {(((8'hba) ? reg13 : wire1) ?
                          $signed((8'hb4)) : $signed(reg7))} : $signed(reg28)) : (wire0[(1'h1):(1'h1)] ?
                  reg19[(2'h2):(2'h2)] : reg21[(3'h4):(3'h4)]));
          reg34 <= ((&reg27[(4'ha):(3'h4)]) ?
              ({(~|((8'hb4) ? reg26 : (7'h42))),
                  $signed(reg28[(4'h9):(3'h7)])} <<< (reg12 ?
                  $unsigned($unsigned(reg11)) : reg31[(3'h6):(2'h2)])) : reg14[(1'h0):(1'h0)]);
        end
      else
        begin
          if ($unsigned((reg7 ? (8'hb6) : {wire2})))
            begin
              reg27 <= (!reg15[(1'h0):(1'h0)]);
            end
          else
            begin
              reg27 <= reg28[(4'hb):(3'h7)];
              reg28 <= reg21[(3'h6):(2'h2)];
              reg29 <= ((($unsigned(wire1) <<< ((wire4 <= reg10) <<< (reg15 ?
                          reg17 : reg22))) ?
                      $unsigned($signed($unsigned(reg23))) : (reg33 ^~ ($unsigned(reg11) << wire4))) ?
                  $signed(reg8[(1'h1):(1'h0)]) : $signed(($unsigned(reg15[(3'h4):(1'h1)]) & (wire4[(4'ha):(4'ha)] <= reg9[(1'h0):(1'h0)]))));
            end
        end
      reg35 <= {$signed((~^{$unsigned(reg28), ((8'hb9) ? reg22 : wire0)})),
          wire0[(3'h5):(2'h2)]};
    end
  assign wire36 = $unsigned($signed({$signed($unsigned(reg16))}));
  assign wire37 = $unsigned(((-$signed(reg20[(2'h3):(1'h1)])) ?
                      ($signed(reg16[(4'hd):(4'ha)]) >>> reg32) : {(~^$signed(reg9)),
                          ($unsigned(reg18) != $signed(reg15))}));
  assign wire38 = ((((reg18 ?
                          $unsigned(reg11) : {reg18,
                              reg26}) << $signed((8'h9d))) ?
                      wire6 : {($signed(reg8) ?
                              $signed(wire2) : wire2)}) == wire37);
  assign wire39 = (((!$unsigned((&reg28))) >= reg10) | ((~(7'h42)) ?
                      wire3 : $unsigned({{reg28, wire6}, $unsigned(wire5)})));
endmodule
