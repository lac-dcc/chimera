module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(4'hd):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  assign y = {wire34,
                 wire26,
                 wire25,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg35,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
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
                 (1'h0)};
  assign wire5 = ((+{$unsigned({wire1, wire3}),
                         ($signed((8'ha8)) ?
                             (wire4 ? wire3 : wire4) : wire1)}) ?
                     (((!$unsigned(wire0)) ?
                         $signed($signed(wire1)) : wire4) >= {($unsigned(wire2) || ((8'hae) ?
                             wire4 : (8'haf))),
                         $signed({wire1})}) : {((|(wire3 > wire2)) << wire2[(2'h2):(1'h1)])});
  assign wire6 = (~|(^~wire1[(4'hb):(1'h0)]));
  assign wire7 = $unsigned(wire4[(4'hf):(4'hb)]);
  assign wire8 = $unsigned($signed(wire0));
  always
    @(posedge clk) begin
      if ($signed((wire3[(2'h2):(1'h0)] | (wire0[(2'h3):(1'h1)] << ($unsigned(wire3) ?
          $signed(wire8) : (wire3 >>> (8'hab)))))))
        begin
          reg9 <= (8'ha0);
          reg10 <= ({{$unsigned((~&wire1))},
                  $signed(((^reg9) >>> reg9[(1'h0):(1'h0)]))} ?
              ((^reg9) << wire3) : (~((^wire7) != ({wire3} >= wire4[(2'h3):(2'h2)]))));
          if ((wire7 >= ((~^wire5) ?
              wire6[(1'h1):(1'h0)] : ($unsigned((~&wire7)) ?
                  reg10 : ((!wire8) < $signed(wire5))))))
            begin
              reg11 <= (|(^~$signed(reg10)));
              reg12 <= $signed($signed(wire6[(5'h13):(5'h11)]));
              reg13 <= wire8;
              reg14 <= $signed($unsigned(reg12[(3'h6):(2'h2)]));
              reg15 <= reg12[(5'h13):(1'h1)];
            end
          else
            begin
              reg11 <= $signed(($signed($unsigned($signed(reg10))) ?
                  (8'ha2) : {((wire0 ? reg9 : wire3) ?
                          wire6 : $unsigned(wire5)),
                      ($unsigned(reg10) ? (~^(8'hbf)) : $signed((8'ha0)))}));
              reg12 <= {reg9[(3'h5):(1'h0)]};
              reg13 <= (~$signed(wire2[(2'h3):(1'h0)]));
              reg14 <= ($signed(wire8[(3'h4):(1'h1)]) ?
                  reg13 : (|(wire5[(5'h11):(4'hf)] << ($signed(reg9) != $unsigned(reg13)))));
              reg15 <= reg15[(2'h2):(1'h1)];
            end
          reg16 <= (~&(^~((!reg15[(2'h2):(2'h2)]) > {(wire8 ? wire2 : wire8),
              (wire6 ? wire8 : wire1)})));
        end
      else
        begin
          if (wire8[(3'h4):(2'h2)])
            begin
              reg9 <= ($signed(reg11) <<< (reg11 ?
                  $unsigned(reg10) : (|wire3)));
            end
          else
            begin
              reg9 <= $signed($unsigned(reg10));
              reg10 <= wire0[(4'hf):(2'h3)];
              reg11 <= $unsigned(((((^~reg13) > {reg10}) > reg9) ?
                  ((wire6 ^~ wire4[(2'h2):(2'h2)]) + wire6) : (!(+{reg12}))));
            end
          if (wire1)
            begin
              reg12 <= $signed({(($signed(wire0) | $signed(reg11)) ?
                      $signed(wire4) : $signed($unsigned(reg9))),
                  $unsigned((reg16 ? (^~wire6) : $signed(reg15)))});
              reg13 <= ($unsigned(((~|(|wire8)) ?
                  $unsigned((wire5 >> reg10)) : (wire5[(5'h10):(4'he)] >>> wire8[(3'h4):(1'h1)]))) >>> wire8[(2'h2):(1'h0)]);
            end
          else
            begin
              reg12 <= {(~^(~&$unsigned(wire2[(4'hb):(3'h7)]))),
                  (!(($unsigned(wire2) > (wire5 >>> wire3)) ?
                      reg9[(1'h1):(1'h1)] : wire6))};
              reg13 <= $signed($signed((~&((|reg13) & {wire4}))));
              reg14 <= $signed(reg14);
            end
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(((wire3[(4'hf):(4'hc)] >> ((!wire7) ?
              (reg13 ? (8'ha7) : wire8) : (~|(8'hb9)))) ?
          $signed(reg14) : ($signed(reg9[(1'h0):(1'h0)]) - (^~$signed((8'haf)))))))
        begin
          reg17 <= {reg12, (~wire5)};
          if ($unsigned((~wire2[(2'h3):(1'h1)])))
            begin
              reg18 <= (&(~|(^wire2)));
              reg19 <= wire5;
            end
          else
            begin
              reg18 <= (wire2[(4'ha):(4'ha)] | wire4[(4'ha):(1'h1)]);
              reg19 <= ($signed((8'hb7)) ?
                  $unsigned((wire8[(2'h3):(1'h1)] ?
                      ({wire8, reg9} << {wire1,
                          reg15}) : (8'hab))) : ($unsigned($unsigned((^~reg18))) ?
                      $unsigned((8'haf)) : (~|wire3[(5'h12):(4'hc)])));
              reg20 <= reg15[(3'h4):(3'h4)];
            end
          if ($signed((&$unsigned(wire5[(4'hc):(4'hb)]))))
            begin
              reg21 <= (-$unsigned(reg20[(3'h6):(3'h6)]));
              reg22 <= ((8'h9c) != $signed($signed(({wire6,
                  wire1} ^~ $unsigned(reg15)))));
              reg23 <= wire8;
            end
          else
            begin
              reg21 <= reg14[(4'hc):(1'h0)];
              reg22 <= (^(reg14[(5'h14):(4'hf)] ?
                  wire4 : ($unsigned((reg11 ? wire4 : reg18)) << {wire6,
                      ((8'hae) == reg19)})));
            end
        end
      else
        begin
          reg17 <= $unsigned(((((wire4 ? reg12 : reg11) >>> reg16) >> wire3) ?
              reg12[(3'h7):(3'h4)] : reg23));
        end
      reg24 <= $signed($signed(({(reg10 ? reg23 : reg20)} ?
          {(reg17 ? wire4 : wire3), (|reg22)} : (+(~^reg12)))));
    end
  assign wire25 = $signed({(wire2 ? {reg21} : (-wire7)),
                      $unsigned(($signed(reg15) ? {wire8, wire0} : reg15))});
  assign wire26 = (8'ha5);
  always
    @(posedge clk) begin
      if (reg18)
        begin
          reg27 <= ($signed((^$signed(wire6))) << wire5);
          reg28 <= reg20;
          reg29 <= {reg22[(4'hd):(3'h7)]};
          if (reg28)
            begin
              reg30 <= reg9[(2'h2):(2'h2)];
              reg31 <= ($signed((($signed(wire7) ? reg15 : {reg14, wire5}) ?
                  reg10[(3'h6):(1'h0)] : wire2)) ~^ $unsigned({$unsigned((&(7'h44))),
                  ((~wire2) ? $signed(reg17) : $signed((8'hac)))}));
            end
          else
            begin
              reg30 <= ((reg13[(4'h8):(2'h3)] ?
                      (~|(^$signed(reg11))) : (+(reg10[(4'h9):(3'h5)] <<< reg10))) ?
                  (^$signed(reg9[(3'h7):(2'h2)])) : $unsigned({$unsigned({reg22,
                          reg15}),
                      (^~(reg16 ~^ wire7))}));
            end
        end
      else
        begin
          if (reg23[(3'h4):(1'h0)])
            begin
              reg27 <= reg14[(4'hc):(4'hb)];
              reg28 <= {({reg20[(5'h13):(4'ha)]} ^ $signed(($unsigned(reg22) ?
                      $unsigned(reg12) : reg11[(1'h1):(1'h1)])))};
              reg29 <= wire2[(3'h7):(1'h0)];
              reg30 <= $unsigned($signed((wire8 < {{reg14, reg11},
                  $unsigned(reg19)})));
            end
          else
            begin
              reg27 <= (8'h9c);
              reg28 <= (((((reg19 * (8'hab)) ?
                      $unsigned(reg22) : wire0[(3'h4):(2'h2)]) <= $signed({reg19,
                      wire2})) ?
                  (reg19[(4'h8):(2'h3)] < $signed((reg24 ?
                      reg18 : (8'hbd)))) : ((~^reg29) + reg30)) >= (reg22 ?
                  wire25 : (+wire4[(3'h5):(3'h5)])));
              reg29 <= reg22;
              reg30 <= (&reg15);
            end
          reg31 <= {(wire6[(2'h3):(1'h0)] ?
                  (~^$signed(wire7[(1'h1):(1'h1)])) : (!reg11)),
              ((((reg30 >> wire25) ?
                      (reg21 ? reg9 : reg31) : (&reg31)) << {$signed(reg27),
                      (reg14 ^~ reg10)}) ?
                  (wire26[(3'h4):(2'h3)] ^~ reg17[(4'hb):(1'h1)]) : $signed(((-reg21) >= $unsigned(reg23))))};
        end
      reg32 <= $unsigned({{{wire0[(4'he):(3'h5)]},
              ($unsigned(reg22) ? $signed(reg10) : (~^reg9))},
          reg16[(5'h11):(2'h2)]});
      reg33 <= (((~^{(8'hbc)}) ? wire0 : (^{(reg22 >= reg18)})) ?
          $unsigned(($signed($unsigned(wire25)) >= wire6)) : reg10[(2'h2):(1'h1)]);
    end
  assign wire34 = {$unsigned($signed({((8'h9e) ? (8'hbf) : reg10),
                          $signed(reg12)}))};
  always
    @(posedge clk) begin
      reg35 <= (((~$signed(reg22)) <= (($unsigned(wire8) - (reg32 ?
                  reg17 : reg16)) ?
              $unsigned(wire5[(3'h7):(2'h2)]) : wire3[(5'h10):(4'hf)])) ?
          $signed((reg32 >>> $unsigned({wire6,
              wire25}))) : (wire5[(4'hc):(4'h9)] >= ((wire26[(2'h3):(2'h3)] ?
                  $signed((8'hbc)) : (reg29 ? wire25 : reg30)) ?
              ({wire6, wire6} ? $signed((8'ha4)) : reg22) : ({wire2} >= (reg10 ?
                  reg33 : wire4)))));
    end
endmodule
