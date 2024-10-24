module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(3'h7):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  assign y = {wire44,
                 wire43,
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
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire5 = {($unsigned((8'hae)) - $unsigned((^~wire1[(3'h5):(2'h2)])))};
  assign wire6 = wire3[(1'h1):(1'h1)];
  assign wire7 = $signed(((-{(wire3 & wire1), wire5}) ?
                     wire0[(3'h5):(1'h1)] : {$signed(wire1)}));
  assign wire8 = wire5[(4'h9):(3'h4)];
  assign wire9 = $signed(((^~wire8) ?
                     wire3 : (wire0[(1'h1):(1'h1)] ?
                         {$signed(wire3),
                             wire6[(3'h6):(3'h4)]} : $unsigned((wire1 ?
                             wire8 : wire4)))));
  assign wire10 = wire7;
  assign wire11 = (~|$unsigned(((wire6 || wire0[(3'h5):(2'h2)]) ~^ (!$unsigned(wire8)))));
  assign wire12 = {(((wire8[(4'h9):(4'h9)] < $unsigned((8'hb4))) ?
                              $unsigned(wire5[(5'h12):(4'ha)]) : {$signed((7'h40)),
                                  wire3}) ?
                          (wire0 ?
                              ((~&(8'haf)) ?
                                  $signed(wire9) : $signed(wire7)) : {wire11,
                                  $signed(wire1)}) : (wire1[(2'h2):(2'h2)] ^~ $signed(wire6)))};
  assign wire13 = $unsigned((+$unsigned(({wire1} >= (wire5 ? wire5 : wire9)))));
  assign wire14 = (-wire4[(4'h8):(3'h5)]);
  assign wire15 = (wire13[(3'h6):(3'h5)] ?
                      ({wire9,
                          {wire1,
                              {(8'had)}}} || $unsigned(wire13[(3'h4):(2'h2)])) : ((wire14 * $signed(wire5[(5'h11):(3'h4)])) != $signed(wire12)));
  assign wire16 = ((~$unsigned((!(wire15 + wire5)))) <= $signed(($signed(wire10[(3'h4):(1'h0)]) ?
                      ((~^wire8) <= (-wire3)) : ((8'hb8) && $unsigned(wire8)))));
  always
    @(posedge clk) begin
      if (wire16)
        begin
          reg17 <= (((-(7'h43)) ?
              $unsigned(wire6) : $unsigned((wire4 ?
                  $signed(wire6) : (wire10 * (8'hb1))))) ~^ ({$signed((^~wire15))} ?
              $unsigned(wire3[(1'h1):(1'h1)]) : ($unsigned((wire13 ?
                  (8'hbd) : wire1)) ^ wire14)));
          reg18 <= $signed({wire3[(3'h5):(1'h1)]});
        end
      else
        begin
          reg17 <= $unsigned($signed($signed((wire0 ~^ (~&wire14)))));
          reg18 <= (wire9 ?
              $signed(wire7[(1'h1):(1'h0)]) : wire12[(3'h4):(2'h3)]);
          reg19 <= {(($signed($unsigned(reg18)) + (reg18[(4'h9):(3'h6)] ?
                  (wire3 ? wire16 : (8'hbc)) : (wire5 ?
                      wire0 : wire1))) ^ ((wire3[(3'h4):(1'h0)] ^ wire16[(2'h3):(2'h3)]) || $unsigned(wire3))),
              $unsigned($unsigned({$unsigned(wire5), (wire14 >= (8'hac))}))};
          if (((((((8'h9e) ^ wire13) ?
              wire3[(3'h5):(2'h2)] : {(8'hb6),
                  reg19}) || $unsigned($signed(wire15))) << $signed($unsigned({wire4}))) <= $signed(reg18)))
            begin
              reg20 <= $signed(wire11);
            end
          else
            begin
              reg20 <= $signed(wire10[(4'h8):(2'h3)]);
              reg21 <= $signed(((wire8 ?
                  $unsigned({wire15,
                      wire9}) : (^$unsigned(wire16))) != {(8'hb7),
                  {(^reg20)}}));
              reg22 <= ((~(reg20 ? (8'hbe) : (&(wire4 < reg17)))) ?
                  (~wire14) : wire0[(1'h0):(1'h0)]);
              reg23 <= ((~^wire16[(2'h3):(2'h3)]) ?
                  $signed((|$signed($unsigned((8'ha5))))) : $signed((($signed(reg20) ?
                      wire6 : wire1[(4'h8):(3'h6)]) ^~ (8'hbf))));
            end
          reg24 <= (wire6[(4'ha):(3'h7)] ?
              (~reg17[(4'h8):(1'h0)]) : $signed((reg20 || ((&reg21) ?
                  $unsigned(reg22) : ((8'hb0) ? wire0 : reg19)))));
        end
      reg25 <= {$unsigned((^~{{wire8}, $unsigned(wire4)}))};
      reg26 <= (~$unsigned($signed($unsigned($unsigned((8'hb7))))));
      reg27 <= {(|(wire11[(4'he):(4'h8)] ?
              {(reg18 ? (8'ha4) : reg26), (wire16 != reg25)} : ((wire3 ?
                      wire0 : wire7) ?
                  wire12 : (reg20 < reg19)))),
          {(reg26 + wire3[(3'h4):(2'h2)])}};
      if (wire1[(1'h1):(1'h0)])
        begin
          reg28 <= (wire6[(4'hc):(3'h5)] != $signed($signed($signed(wire2))));
          reg29 <= (wire9 ? (&reg26[(2'h2):(1'h0)]) : reg21[(1'h0):(1'h0)]);
          if ((!($unsigned(({wire3, reg22} ? {reg19} : (wire6 >> reg27))) ?
              (~|reg20) : reg26[(1'h0):(1'h0)])))
            begin
              reg30 <= $signed((~^(^$signed($signed(reg20)))));
            end
          else
            begin
              reg30 <= $unsigned((8'hb8));
              reg31 <= ((wire10[(2'h3):(2'h2)] ?
                  $signed((^~(^~reg28))) : (8'hbb)) << $signed(wire5));
              reg32 <= $signed(((8'ha3) && wire9));
              reg33 <= $unsigned((|$unsigned($unsigned(wire0))));
              reg34 <= $unsigned(reg21);
            end
          reg35 <= ((((!(wire8 ? wire9 : wire2)) ?
                      {(reg21 == reg26)} : ((wire15 > (8'ha0)) ?
                          (wire14 ? wire11 : reg26) : (reg34 ?
                              wire7 : reg30))) ?
                  $signed($signed($signed(reg18))) : $unsigned($signed($unsigned(reg28)))) ?
              {$unsigned($unsigned((wire9 ? wire7 : reg31))),
                  $unsigned(($signed(reg29) ?
                      (~wire9) : $unsigned(reg25)))} : {(-($unsigned(reg22) <<< $signed((8'ha7)))),
                  ($signed({wire7}) ? (~^reg32[(1'h1):(1'h1)]) : reg29)});
          reg36 <= {wire3[(1'h0):(1'h0)]};
        end
      else
        begin
          reg28 <= (8'haf);
        end
    end
  always
    @(posedge clk) begin
      reg37 <= (~&((reg28[(3'h6):(1'h1)] ?
              $signed((reg27 < reg36)) : ($unsigned((7'h44)) ?
                  (reg31 ? (8'hb6) : reg23) : {(8'hac), wire5})) ?
          $unsigned(wire16[(2'h3):(1'h1)]) : reg35));
      if ((~|({wire2[(4'h8):(3'h4)], reg30[(4'ha):(4'h9)]} ^~ {reg20, wire1})))
        begin
          reg38 <= (reg29 ?
              (&$signed($unsigned($unsigned((8'h9d))))) : (reg35[(4'he):(4'hc)] + (reg24[(2'h3):(2'h3)] * wire15[(5'h12):(4'ha)])));
          reg39 <= (7'h40);
          reg40 <= ((reg29[(1'h0):(1'h0)] ?
                  wire15[(2'h3):(2'h2)] : (+($unsigned(reg34) ?
                      (wire10 - reg27) : (7'h40)))) ?
              {reg24[(2'h3):(2'h3)]} : $unsigned((((!reg29) ?
                  $signed(wire11) : reg25[(3'h7):(2'h3)]) - (+(wire15 ?
                  reg31 : reg22)))));
          reg41 <= $signed($signed(($unsigned($unsigned(reg25)) ^~ (~&$signed(reg40)))));
          reg42 <= (-((8'ha1) >= {reg33[(3'h7):(2'h3)]}));
        end
      else
        begin
          reg38 <= reg37[(3'h4):(1'h1)];
        end
    end
  assign wire43 = reg18;
  assign wire44 = reg26;
endmodule
