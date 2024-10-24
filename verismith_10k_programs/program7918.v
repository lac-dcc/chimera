module top
#(parameter param41 = (~|{((((8'ha1) ? (8'hbd) : (8'ha2)) && ((8'hba) != (8'hb6))) ? {((8'had) ? (8'hbe) : (7'h42)), {(8'ha4), (8'ha2)}} : (((8'had) & (8'hb1)) ^ (~|(8'hba))))}), 
parameter param42 = ((((8'h9e) == ((param41 ? param41 : param41) ? (+param41) : param41)) * (param41 + {(param41 << param41)})) & ((param41 ? ((param41 >= (7'h41)) != ((8'h9e) * param41)) : ((^(8'hb7)) ? (^param41) : param41)) ? ((&(param41 && param41)) ^~ param41) : (^(!(param41 ? param41 : param41))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire40;
  wire [(4'h9):(1'h0)] wire30;
  wire signed [(2'h3):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire28;
  wire signed [(3'h4):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(4'hc):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire16;
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hd):(1'h0)] reg5 = (1'h0);
  assign y = {wire40,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg21,
                 reg20,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned((&{(wire4 ? wire3 : wire0), wire2})) | wire4))
        begin
          if ({wire1[(4'he):(4'h9)]})
            begin
              reg5 <= $signed($signed({((8'hb0) & wire1),
                  ($unsigned(wire1) ? (8'hb5) : (~|wire4))}));
            end
          else
            begin
              reg5 <= $unsigned(wire4[(2'h3):(2'h2)]);
              reg6 <= (!$unsigned((^(!wire1[(4'hd):(4'h8)]))));
              reg7 <= ($unsigned((wire2[(3'h4):(2'h3)] ?
                      reg6 : reg5[(3'h6):(3'h5)])) ?
                  $signed((({wire4} > wire2[(3'h7):(3'h7)]) >>> {(wire0 >> reg5),
                      (wire1 ? (8'hae) : wire1)})) : wire0[(4'h9):(1'h1)]);
              reg8 <= {({reg5, $unsigned((reg6 + (8'hb8)))} == wire4),
                  ({(^~reg5[(4'ha):(4'ha)]),
                      $unsigned({wire3, (8'hae)})} * ({$signed((8'h9e)),
                          (~wire4)} ?
                      (~&((8'hb7) != reg6)) : ((^(7'h43)) <= reg7[(5'h13):(2'h2)])))};
              reg9 <= $signed(wire3[(3'h7):(2'h2)]);
            end
          reg10 <= (-((^~wire2[(4'h8):(3'h7)]) ^ $signed((^~(^wire4)))));
          reg11 <= $unsigned($signed(wire4[(2'h3):(2'h3)]));
          reg12 <= $signed(reg11);
        end
      else
        begin
          if ({$signed($signed($signed($signed(wire3)))), reg6[(3'h6):(3'h6)]})
            begin
              reg5 <= wire2;
              reg6 <= $unsigned(((reg12[(3'h7):(1'h1)] >= ((~^reg12) ?
                      (wire4 ? wire2 : (8'ha1)) : (reg11 >= reg11))) ?
                  (wire2[(4'h9):(3'h4)] < (~&$signed(reg10))) : {$signed((reg9 >> reg9))}));
              reg7 <= $signed($signed(reg10));
            end
          else
            begin
              reg5 <= wire1[(5'h10):(4'hb)];
              reg6 <= wire3[(4'ha):(3'h5)];
              reg7 <= {((wire4[(2'h3):(1'h0)] != $unsigned(((8'ha6) ?
                          wire4 : reg11))) ?
                      $unsigned((reg11 ?
                          (reg12 ?
                              reg9 : wire3) : {wire0})) : (~&reg8[(1'h1):(1'h0)]))};
            end
          reg8 <= (~^$unsigned(reg5));
          if ($unsigned(reg12))
            begin
              reg9 <= $unsigned((reg9 ?
                  (^~{{wire0, (8'ha4)}}) : reg6[(5'h14):(5'h12)]));
            end
          else
            begin
              reg9 <= $unsigned($unsigned((+$signed(reg6))));
            end
          reg10 <= wire1;
          reg11 <= reg5[(3'h4):(1'h0)];
        end
      reg13 <= (&$signed(reg11[(2'h2):(2'h2)]));
      reg14 <= $unsigned(reg6);
      reg15 <= ($unsigned(($unsigned((reg10 ? (8'hbc) : reg10)) ?
          reg11[(1'h0):(1'h0)] : (&(reg7 ? reg6 : (8'hb9))))) << (reg14 ?
          $unsigned((reg10[(3'h5):(2'h3)] ?
              (reg9 ?
                  reg5 : reg10) : $unsigned(wire2))) : reg12[(4'hc):(4'h9)]));
    end
  assign wire16 = ({(|$signed($signed(wire4)))} && reg10);
  assign wire17 = ((reg13 - {(~&$signed(reg9))}) ?
                      $unsigned($unsigned((8'ha7))) : reg5);
  assign wire18 = ($signed($unsigned((wire17 ?
                      (reg9 ? reg8 : reg9) : reg5))) >>> ((&(reg10 ?
                          (~|wire17) : wire17)) ?
                      reg12 : (($unsigned(reg7) ? (^reg12) : $unsigned(reg12)) ?
                          ((reg13 ? reg6 : reg14) | (reg8 ?
                              wire3 : wire3)) : $signed((7'h40)))));
  assign wire19 = reg10;
  always
    @(posedge clk) begin
      reg20 <= (($unsigned(wire16) ?
              $signed($signed($signed((8'ha3)))) : {reg14[(2'h2):(2'h2)]}) ?
          wire19[(3'h7):(3'h4)] : {wire1[(1'h1):(1'h0)], (-wire16)});
      reg21 <= reg14[(3'h4):(3'h4)];
    end
  assign wire22 = wire4[(2'h3):(1'h0)];
  assign wire23 = reg12[(1'h0):(1'h0)];
  assign wire24 = (&$unsigned((~^(wire18 ?
                      $unsigned((8'h9f)) : $signed(wire0)))));
  assign wire25 = (reg14[(2'h3):(2'h2)] ?
                      (wire0[(4'hf):(4'hf)] & $unsigned($unsigned({wire3}))) : (($signed({reg15}) - reg5) == $unsigned($signed((~&reg11)))));
  assign wire26 = $unsigned(reg5);
  assign wire27 = {($signed({(reg12 ? reg21 : reg6), $signed(reg9)}) ?
                          $unsigned($signed((+(8'h9e)))) : reg13[(3'h4):(2'h3)]),
                      {(wire1 * (~reg20[(1'h1):(1'h0)]))}};
  assign wire28 = $unsigned((reg5[(1'h1):(1'h1)] <= $unsigned((wire3[(4'hb):(2'h2)] ?
                      wire2 : (reg7 ? wire1 : reg6)))));
  assign wire29 = (~|$unsigned(($unsigned($signed(wire18)) & $unsigned((wire2 ?
                      wire26 : wire16)))));
  assign wire30 = ((wire28 ?
                      $unsigned(wire23[(4'hf):(4'h8)]) : wire22) * (!reg13[(3'h5):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire16)
        begin
          if (wire3)
            begin
              reg31 <= (wire27 + (^~(wire3 == {wire3[(3'h6):(2'h2)],
                  (8'hba)})));
              reg32 <= wire23[(4'hf):(4'hf)];
              reg33 <= {$signed({(!reg32)}),
                  $unsigned($signed(({(8'ha4), reg6} >>> reg21)))};
            end
          else
            begin
              reg31 <= (~|($unsigned($signed($unsigned(wire4))) + {reg11[(1'h1):(1'h0)]}));
              reg32 <= wire24;
              reg33 <= reg33[(1'h1):(1'h0)];
            end
          reg34 <= $unsigned(wire23[(4'h9):(3'h6)]);
        end
      else
        begin
          if ($unsigned({$unsigned((reg32[(2'h2):(1'h1)] ?
                  {reg20, wire23} : $unsigned((8'ha9)))),
              {(&{wire29, wire17})}}))
            begin
              reg31 <= $signed((8'h9e));
              reg32 <= (($signed(reg10) <<< reg20) | $signed(wire22));
              reg33 <= (&(reg15[(3'h5):(1'h0)] ?
                  (reg9 >> {wire4[(1'h1):(1'h1)],
                      $signed((8'h9c))}) : $unsigned($unsigned((reg31 ?
                      (8'hb2) : wire4)))));
              reg34 <= ($unsigned({wire26,
                  ((8'hbd) != ((8'ha4) ? wire0 : wire23))}) == (&wire24));
              reg35 <= reg34;
            end
          else
            begin
              reg31 <= $signed({(8'hb3)});
              reg32 <= $signed({wire18});
              reg33 <= $unsigned(((|{(|reg15)}) <= wire27[(2'h3):(1'h1)]));
              reg34 <= wire18[(3'h6):(1'h0)];
            end
        end
      reg36 <= wire30[(3'h6):(2'h3)];
      reg37 <= (+wire4[(3'h6):(3'h4)]);
      reg38 <= (~wire27);
      reg39 <= $unsigned(wire17[(3'h6):(3'h4)]);
    end
  assign wire40 = $signed((|{((reg21 ? reg13 : reg31) >> ((8'ha3) ^ reg34)),
                      $signed($signed(reg6))}));
endmodule
