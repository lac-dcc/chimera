module top
#(parameter param40 = ((~^(({(8'hb9)} >= (~&(8'hb6))) >> {((8'hb2) ? (8'had) : (8'ha2)), ((7'h41) ? (7'h41) : (8'ha2))})) << {(~(~(~(8'haf)))), ((((8'hb5) ? (8'hac) : (8'hb3)) ? (&(7'h44)) : ((8'hb1) ? (8'ha7) : (8'haa))) ? (|((8'hb0) ? (7'h44) : (8'ha8))) : ({(7'h44)} ? ((8'had) ? (8'h9f) : (7'h40)) : {(7'h41), (7'h42)}))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  assign y = {wire39,
                 wire30,
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
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
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
                 (1'h0)};
  assign wire5 = ($signed({$unsigned(wire3[(2'h3):(1'h0)]), wire4}) & wire2);
  assign wire6 = ((wire5[(2'h3):(1'h1)] ?
                     $unsigned({wire4,
                         wire4[(1'h1):(1'h0)]}) : (8'hb4)) * wire4);
  assign wire7 = wire4;
  assign wire8 = wire0;
  assign wire9 = ($signed(wire5[(3'h5):(2'h2)]) ?
                     $signed(wire0[(4'hd):(4'hb)]) : (~^{$signed(wire5[(1'h0):(1'h0)])}));
  assign wire10 = wire0[(1'h1):(1'h1)];
  assign wire11 = $signed(wire3);
  assign wire12 = $signed(wire0);
  assign wire13 = {(8'hae),
                      ($unsigned(($unsigned(wire8) ?
                          ((8'ha7) ?
                              (8'haa) : wire10) : $unsigned(wire4))) & $unsigned(wire12))};
  assign wire14 = wire4[(1'h0):(1'h0)];
  assign wire15 = $signed($signed({(~^(wire10 ? (8'h9f) : wire14))}));
  always
    @(posedge clk) begin
      reg16 <= {(+$signed(wire1)), wire10[(4'ha):(3'h5)]};
      if ($signed(wire4))
        begin
          if (($unsigned(wire4[(4'h8):(2'h2)]) <<< (~|(~wire7[(4'hc):(1'h1)]))))
            begin
              reg17 <= $signed(((-(-$unsigned(reg16))) ?
                  $signed($signed(wire2)) : $signed(wire7[(1'h0):(1'h0)])));
              reg18 <= (reg17[(4'hb):(4'ha)] ~^ (~|($unsigned($signed(wire3)) ?
                  $signed($signed(wire12)) : ((&wire13) ?
                      $unsigned(wire2) : (reg17 & (8'had))))));
              reg19 <= (8'hbe);
            end
          else
            begin
              reg17 <= ($unsigned(($unsigned($signed(wire13)) && {wire14[(2'h3):(2'h3)],
                      $signed(reg17)})) ?
                  $signed($signed({(wire3 ? wire2 : wire9)})) : ((wire7 ?
                      wire0[(4'h8):(3'h5)] : $signed((wire5 ?
                          wire10 : wire12))) ^~ ((-$unsigned((8'hb4))) ?
                      $unsigned((wire4 ? reg18 : wire3)) : $signed({wire3,
                          wire3}))));
              reg18 <= (&$unsigned($signed(wire2[(2'h3):(2'h2)])));
            end
          reg20 <= $signed((wire0[(4'ha):(2'h2)] <<< (^(~|(wire13 && wire14)))));
          reg21 <= $unsigned((wire9[(3'h6):(1'h1)] | {wire3[(1'h0):(1'h0)]}));
        end
      else
        begin
          reg17 <= (^~$signed(wire4));
        end
      reg22 <= (((wire10[(4'hc):(1'h0)] ?
              reg18[(1'h1):(1'h0)] : $signed($unsigned((8'had)))) == $unsigned({{reg20}})) ?
          (!{((wire9 ? wire14 : reg17) ? (wire9 + wire2) : wire5)}) : (~wire0));
      reg23 <= wire14;
    end
  always
    @(posedge clk) begin
      if ({wire3})
        begin
          reg24 <= (&wire15[(4'hb):(2'h3)]);
          reg25 <= ($signed((reg16 ?
                  $unsigned(reg21) : ({wire0, wire4} ?
                      $signed((8'ha6)) : (wire0 + (8'hb2))))) ?
              ($signed(($unsigned(wire6) == (&wire15))) <= wire10) : $unsigned((-(^(~|wire8)))));
          reg26 <= (&(reg21[(3'h7):(3'h6)] || $unsigned($signed(wire14[(3'h5):(3'h4)]))));
          reg27 <= $unsigned(({(&(!wire12)), (7'h44)} ?
              ($signed(reg22) ?
                  (+{reg17, reg20}) : ($unsigned(reg25) ?
                      $unsigned(reg19) : (8'hb5))) : (|($signed((7'h41)) || (reg19 == wire2)))));
        end
      else
        begin
          reg24 <= $signed((({reg24[(4'ha):(1'h0)]} ?
              (~(reg16 ^~ reg23)) : $unsigned((~|(8'ha0)))) >> $unsigned($signed((wire12 != wire12)))));
          reg25 <= ($signed($signed(reg27[(3'h6):(2'h2)])) ?
              $unsigned({wire6[(2'h3):(1'h1)],
                  ($signed(reg23) >= $unsigned(reg23))}) : wire6[(3'h7):(1'h1)]);
        end
      reg28 <= ($unsigned({(^~(wire13 && wire9))}) || wire7[(4'ha):(1'h1)]);
      reg29 <= wire13;
    end
  assign wire30 = (reg28[(1'h0):(1'h0)] ?
                      $signed(wire4[(1'h0):(1'h0)]) : {wire3, wire10});
  always
    @(posedge clk) begin
      if (wire0)
        begin
          reg31 <= {$unsigned($signed(($signed(wire4) ?
                  $signed(reg18) : wire5)))};
          if ($signed($unsigned({((8'had) ?
                  (wire9 ~^ (8'hb8)) : reg17[(3'h5):(2'h2)])})))
            begin
              reg32 <= $signed($signed(wire0[(4'h9):(3'h4)]));
              reg33 <= ((($signed(reg21) >> (8'ha6)) ?
                      $signed((8'hbc)) : $unsigned(wire6)) ?
                  (((8'hbd) ? reg31[(2'h3):(2'h3)] : wire4[(3'h4):(1'h0)]) ?
                      ((!$unsigned((8'hb0))) >>> (^~wire8[(1'h1):(1'h1)])) : $unsigned(((wire15 ?
                              (8'hb4) : reg21) ?
                          ((8'hb4) < reg21) : wire6))) : reg28[(3'h7):(3'h4)]);
            end
          else
            begin
              reg32 <= wire4[(1'h1):(1'h0)];
              reg33 <= {wire30,
                  ($signed(reg29[(2'h2):(1'h1)]) - $unsigned(reg27))};
              reg34 <= $unsigned({(((^wire3) ?
                      (reg29 << wire12) : $signed(wire14)) >= (reg22[(4'hc):(3'h4)] ?
                      wire10[(4'h9):(1'h0)] : (wire7 ? reg21 : wire15)))});
              reg35 <= (~&wire9);
            end
          reg36 <= $unsigned({wire1, reg18});
        end
      else
        begin
          reg31 <= wire5[(2'h2):(1'h0)];
          reg32 <= wire10[(1'h0):(1'h0)];
          reg33 <= (~$unsigned($signed($unsigned($signed((8'h9f))))));
        end
      reg37 <= $unsigned($unsigned(reg32[(1'h1):(1'h1)]));
      reg38 <= (((&wire14[(2'h3):(2'h2)]) <= (|(reg20[(1'h1):(1'h0)] ~^ reg19))) ?
          wire1 : wire1[(4'h8):(1'h1)]);
    end
  assign wire39 = (^~({{$unsigned((8'hb3))}} ? reg38 : reg31[(1'h1):(1'h0)]));
endmodule
