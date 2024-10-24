module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(2'h2):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire11;
  wire [(2'h3):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire34,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = (((wire3[(4'ha):(2'h2)] <= wire0) ?
                     ($unsigned(wire2) ^~ (~&$unsigned(wire4))) : wire0[(1'h0):(1'h0)]) >>> $unsigned($signed((&(wire4 ?
                     wire2 : (7'h42))))));
  assign wire6 = $unsigned(($unsigned(($signed(wire1) ^ ((8'hba) < wire4))) ?
                     $unsigned((^~{wire1})) : $unsigned((wire1[(3'h7):(2'h3)] ?
                         $signed(wire0) : {wire0}))));
  assign wire7 = (wire0 && {wire3});
  assign wire8 = wire0;
  assign wire9 = wire1[(3'h5):(3'h4)];
  assign wire10 = $unsigned((!(wire4 ? (8'hb0) : {wire1, $signed(wire5)})));
  assign wire11 = $signed((-({wire10[(2'h2):(2'h2)], (~wire5)} ?
                      (-(wire6 ? wire6 : (8'hb3))) : wire10[(1'h1):(1'h1)])));
  assign wire12 = $unsigned($unsigned(wire1));
  assign wire13 = {(|(|wire11[(2'h2):(1'h0)]))};
  assign wire14 = wire7;
  assign wire15 = wire3;
  assign wire16 = (($signed((~&{(8'hac), wire3})) + ({(~&wire3)} ?
                      wire7 : wire10)) << $unsigned((wire10 ?
                      $unsigned($unsigned(wire5)) : $signed(wire3[(2'h3):(1'h0)]))));
  assign wire17 = wire1;
  always
    @(posedge clk) begin
      reg18 <= (8'ha7);
      if (wire13)
        begin
          reg19 <= ({(~&(wire14[(1'h1):(1'h1)] ?
                      $signed(wire7) : $unsigned(wire4)))} ?
              $unsigned(wire9) : wire10);
          reg20 <= (reg19[(1'h0):(1'h0)] <<< $signed(((7'h40) ?
              $unsigned(((8'ha1) - reg19)) : $signed((wire9 < wire2)))));
          reg21 <= wire12[(4'h8):(2'h3)];
          reg22 <= $unsigned((!wire11[(3'h6):(2'h3)]));
        end
      else
        begin
          if (reg22[(4'he):(3'h5)])
            begin
              reg19 <= reg21[(3'h4):(2'h3)];
              reg20 <= wire5[(3'h4):(3'h4)];
              reg21 <= $unsigned(wire16);
            end
          else
            begin
              reg19 <= (~(&{$unsigned((wire13 - wire16))}));
              reg20 <= $unsigned({$signed(((wire0 ^ reg20) >>> wire14)),
                  reg19[(2'h3):(2'h3)]});
              reg21 <= wire9[(2'h2):(2'h2)];
              reg22 <= (($unsigned($unsigned($signed(wire9))) ?
                  reg19 : ((~|(&reg21)) ?
                      (~^wire3) : wire4)) & {{($signed(wire2) ?
                          reg21[(4'hb):(2'h2)] : (wire2 + wire1)),
                      wire8},
                  wire5[(2'h2):(2'h2)]});
            end
          if ($signed(wire10[(1'h0):(1'h0)]))
            begin
              reg23 <= $unsigned(wire14);
              reg24 <= (^~wire10);
              reg25 <= reg19[(5'h10):(4'h9)];
              reg26 <= {$unsigned((&((wire15 ?
                      (8'hb9) : wire9) >>> (reg20 >>> (8'hb4)))))};
            end
          else
            begin
              reg23 <= ($unsigned($unsigned(($signed(wire5) <<< (wire6 ?
                      wire15 : reg26)))) ?
                  {(wire14[(2'h2):(1'h0)] == $signed($signed((8'hab)))),
                      wire16[(4'ha):(3'h6)]} : {$unsigned($unsigned((wire3 ?
                          wire10 : wire10))),
                      (wire16 ^ $signed((7'h43)))});
              reg24 <= ((&reg23) >> $unsigned(reg22));
              reg25 <= wire15[(4'h9):(3'h4)];
            end
          reg27 <= $unsigned($unsigned(($signed($unsigned(reg18)) >= wire8[(2'h3):(2'h3)])));
          reg28 <= $unsigned(wire16[(4'he):(3'h6)]);
          if (wire1)
            begin
              reg29 <= ($unsigned((wire12[(4'hb):(3'h6)] << ($signed((7'h43)) * (+wire0)))) || ((wire10 ~^ (~$unsigned(reg27))) ?
                  ((!(^(8'hbe))) != $unsigned($unsigned(wire11))) : reg21));
              reg30 <= $unsigned((-reg24));
              reg31 <= ((^reg24) ?
                  wire4[(4'h9):(2'h2)] : (((^~$unsigned(reg20)) != (-{reg18})) ?
                      (wire1 ?
                          ((7'h41) ?
                              (wire7 && wire3) : (wire10 ?
                                  reg25 : wire9)) : (-$signed(wire13))) : wire16[(3'h5):(3'h5)]));
              reg32 <= ((~$unsigned(((wire11 ^~ wire5) ?
                  (&reg30) : reg25[(3'h6):(3'h6)]))) == {$signed(reg29[(4'he):(4'h8)]),
                  $unsigned($unsigned(wire8[(3'h4):(1'h0)]))});
              reg33 <= ($signed((wire16[(3'h6):(2'h2)] >= $unsigned($unsigned(reg26)))) ?
                  wire13[(4'h9):(3'h4)] : wire1);
            end
          else
            begin
              reg29 <= (wire4 ?
                  reg33[(5'h11):(4'hb)] : (wire9 ?
                      $unsigned($unsigned((|wire6))) : ($signed(wire9) ?
                          $unsigned($signed(wire5)) : reg25[(4'h9):(3'h4)])));
              reg30 <= $unsigned((&$unsigned(((~|wire10) ?
                  (!reg33) : $signed(wire7)))));
              reg31 <= (reg21 ? wire12 : reg19[(4'ha):(2'h3)]);
              reg32 <= wire11;
              reg33 <= $unsigned({(8'hba)});
            end
        end
    end
  assign wire34 = ({$unsigned($signed({(8'ha0), reg33}))} ? reg31 : reg33);
  always
    @(posedge clk) begin
      if ($unsigned((^(reg21[(4'hb):(3'h7)] >= (!(wire3 ? (8'had) : reg30))))))
        begin
          if (reg33)
            begin
              reg35 <= ($signed(((&(wire2 ^~ wire11)) ?
                      (((8'hb0) == reg29) & reg20[(2'h2):(1'h0)]) : (|(reg22 ?
                          reg18 : reg27)))) ?
                  (~$signed(({(8'hae), wire10} ?
                      {wire2} : $signed(wire8)))) : reg33[(4'hb):(4'hb)]);
              reg36 <= (((|{$unsigned(reg20),
                      (wire1 ? reg25 : reg32)}) - (((wire8 && wire17) ?
                      $unsigned(reg29) : reg32[(3'h6):(1'h1)]) == (8'hb7))) ?
                  reg18 : $signed((wire9 || reg19[(4'hb):(3'h7)])));
              reg37 <= reg28;
              reg38 <= {reg31[(3'h4):(1'h0)],
                  (reg31[(1'h0):(1'h0)] ?
                      wire6[(4'h8):(3'h5)] : reg33[(5'h13):(1'h1)])};
            end
          else
            begin
              reg35 <= $unsigned($signed((wire34 ?
                  $unsigned((reg35 ? wire4 : reg33)) : wire11)));
              reg36 <= wire8[(3'h4):(3'h4)];
              reg37 <= ($unsigned($signed((|wire14))) ?
                  wire7 : ($unsigned($unsigned($signed(reg19))) ?
                      ($unsigned(wire3[(4'ha):(2'h3)]) ?
                          wire17 : $unsigned(wire15[(2'h2):(1'h0)])) : $signed($signed($signed(reg31)))));
            end
          reg39 <= (^{reg20});
        end
      else
        begin
          reg35 <= $signed(reg32);
          reg36 <= ({wire6,
              reg31} * $signed($unsigned((reg39[(3'h4):(2'h3)] - {reg38,
              reg37}))));
          reg37 <= $signed($signed(wire13[(3'h6):(3'h4)]));
          if ({wire34})
            begin
              reg38 <= reg36[(4'ha):(3'h4)];
              reg39 <= $signed(reg19[(2'h2):(1'h0)]);
              reg40 <= reg32[(3'h4):(3'h4)];
              reg41 <= (~reg38[(1'h0):(1'h0)]);
              reg42 <= reg25;
            end
          else
            begin
              reg38 <= wire5;
              reg39 <= $unsigned($unsigned((|$unsigned($signed(reg42)))));
              reg40 <= ({wire9[(2'h2):(1'h1)]} ? reg21 : wire10[(1'h1):(1'h1)]);
              reg41 <= ($signed($signed($signed((reg18 <<< reg39)))) << ((~((reg36 ?
                      reg31 : wire13) ?
                  (reg30 || reg21) : (wire17 ?
                      reg26 : wire15))) >= reg42[(3'h4):(2'h3)]));
            end
        end
      reg43 <= (+$unsigned((^wire4[(3'h4):(2'h3)])));
      reg44 <= reg42[(2'h2):(2'h2)];
      reg45 <= (((!wire11[(3'h5):(1'h0)]) ?
          wire0 : (8'hac)) < $signed({$signed({reg31})}));
    end
  assign wire46 = ((reg39[(3'h4):(2'h2)] || ($signed((|(8'ha2))) ?
                      ($signed(wire10) <= (|reg22)) : $signed(((8'ha0) ?
                          (7'h41) : (8'ha1))))) >>> reg45[(1'h1):(1'h1)]);
  assign wire47 = $signed((8'hb9));
endmodule
