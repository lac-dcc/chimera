module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'h8):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire30,
                 wire17,
                 wire15,
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
  assign wire4 = wire3;
  assign wire5 = $unsigned(wire0);
  module6 #() modinst16 (wire15, clk, wire4, wire2, wire0, wire5);
  assign wire17 = {$unsigned((((~|wire4) ?
                          (wire1 ?
                              wire5 : wire4) : ((7'h40) ~^ wire0)) < ({wire5} ?
                          $unsigned(wire4) : $unsigned(wire0))))};
  always
    @(posedge clk) begin
      if (wire15[(4'he):(3'h6)])
        begin
          reg18 <= (wire4[(4'hd):(4'h8)] ?
              ($unsigned((~wire0[(3'h4):(2'h3)])) ^~ wire3[(4'ha):(3'h6)]) : $signed((((wire17 < wire17) < (wire17 | wire5)) ?
                  (~^(wire0 || wire2)) : (~^((8'ha0) ? wire1 : wire1)))));
          if (wire5)
            begin
              reg19 <= $unsigned(($unsigned(wire17) ?
                  wire5[(2'h3):(1'h1)] : ($signed({wire1,
                      (8'ha9)}) ^~ (wire4 >>> (wire3 <= wire17)))));
              reg20 <= (((~|$signed($unsigned(wire4))) ?
                      $signed($unsigned(((8'hb4) ?
                          wire17 : wire5))) : $unsigned({$signed(wire3),
                          (&wire1)})) ?
                  $unsigned($signed(($signed((8'hbe)) << (+wire2)))) : wire17);
              reg21 <= (~|reg19[(4'h9):(1'h0)]);
              reg22 <= wire4[(2'h3):(1'h1)];
              reg23 <= (!{(&($signed(reg18) ? (|wire3) : $signed(wire15)))});
            end
          else
            begin
              reg19 <= (({wire5[(4'ha):(4'h8)], $signed($unsigned((8'ha7)))} ?
                      ($signed(wire0) ?
                          (-$signed((8'h9e))) : wire0) : $unsigned(((^~wire4) >>> $signed(wire17)))) ?
                  $signed($unsigned(reg19)) : (wire2[(1'h1):(1'h1)] ?
                      reg19[(3'h5):(1'h0)] : ((^~$unsigned(wire1)) && ((wire15 ?
                          wire2 : reg23) & (wire2 ? wire17 : wire5)))));
              reg20 <= (reg22[(3'h7):(2'h3)] ?
                  reg19[(4'hb):(1'h0)] : (((~|{wire5, wire2}) ?
                          ($unsigned(reg23) ?
                              (^wire2) : {wire17, wire15}) : {(~(8'hbe)),
                              (-wire3)}) ?
                      wire0[(2'h2):(1'h0)] : (&(&wire3[(4'hc):(3'h5)]))));
              reg21 <= (-$signed((^($unsigned((8'hbe)) ~^ (~reg23)))));
            end
          reg24 <= ($unsigned($unsigned((+$signed(reg21)))) ?
              wire5[(4'hc):(3'h4)] : $signed(reg19[(3'h5):(3'h5)]));
          reg25 <= $signed((wire3[(2'h2):(1'h1)] ?
              {$unsigned({wire3,
                      (8'hb6)})} : (~&($signed(wire3) ^ wire17[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg18 <= (((wire15[(4'h9):(4'h9)] ?
                  reg20[(3'h4):(2'h2)] : (wire1 | ((8'hb0) ?
                      reg21 : wire5))) <<< ({$unsigned(wire5)} ?
                  ($signed(wire17) < $signed(wire17)) : wire17[(2'h2):(1'h1)])) ?
              $signed(($unsigned(wire17[(1'h0):(1'h0)]) ?
                  ((reg21 ? wire4 : reg25) ?
                      {(8'h9e)} : $signed((8'hb4))) : ((reg18 * wire5) ?
                      $unsigned((8'ha9)) : (~wire3)))) : wire5);
          reg19 <= ({$unsigned($unsigned($signed(reg23))),
                  $unsigned((+(^wire17)))} ?
              reg23 : (^~reg25));
          reg20 <= wire0[(1'h0):(1'h0)];
          if ($signed(((reg23[(3'h4):(1'h1)] >>> wire17) + reg23)))
            begin
              reg21 <= ($signed(wire1[(1'h1):(1'h0)]) ?
                  $signed($signed(wire4)) : (!$unsigned((7'h44))));
            end
          else
            begin
              reg21 <= (^(^reg20[(3'h4):(3'h4)]));
              reg22 <= (~|(|{($unsigned(reg19) > ((8'hb8) ? wire5 : reg20))}));
              reg23 <= $unsigned((8'hbc));
              reg24 <= reg18[(5'h11):(4'he)];
            end
          if ($signed(((reg18[(4'hd):(4'hb)] & ({reg25} ?
              (reg25 & (8'ha1)) : {reg18})) >>> (~|wire0[(2'h2):(1'h0)]))))
            begin
              reg25 <= ({(wire5[(3'h6):(3'h6)] ? wire4 : (|$signed(reg25)))} ?
                  $unsigned(($unsigned((wire1 >>> (7'h42))) ?
                      reg23[(3'h5):(1'h1)] : wire2[(5'h12):(4'ha)])) : $signed((($unsigned((8'ha6)) ?
                          ((8'hb2) ? wire0 : reg23) : {wire1}) ?
                      (8'ha3) : reg23)));
              reg26 <= ($unsigned((~&{$signed(wire1),
                      ((8'hb5) ? wire17 : wire4)})) ?
                  wire5 : {{(reg18[(5'h13):(4'hd)] ?
                              (wire15 < (8'ha8)) : wire3),
                          ((+wire3) > wire15)},
                      wire3[(2'h3):(2'h2)]});
              reg27 <= (wire5[(4'h8):(2'h2)] ? wire4 : $signed($signed(wire4)));
              reg28 <= reg20;
            end
          else
            begin
              reg25 <= wire4[(5'h13):(3'h7)];
              reg26 <= (($signed($signed($unsigned(reg20))) - reg21[(3'h5):(3'h5)]) >> (^~(-{wire0,
                  reg27[(1'h0):(1'h0)]})));
              reg27 <= reg22[(3'h4):(2'h3)];
              reg28 <= $unsigned(reg22);
            end
        end
      reg29 <= (wire0 != ($unsigned(reg19) * {{((8'ha4) - wire1)}}));
    end
  assign wire30 = (($signed($signed((-reg28))) ?
                      {$unsigned({reg23})} : (|(&$signed(reg22)))) || reg28[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      if (reg23[(3'h6):(3'h6)])
        begin
          reg31 <= (-$unsigned($unsigned(reg24)));
          reg32 <= {($signed((reg29[(3'h6):(3'h6)] >= wire3[(3'h5):(2'h3)])) && (~^reg20[(1'h0):(1'h0)]))};
          reg33 <= wire4[(4'ha):(2'h3)];
          reg34 <= (~&$signed(wire3));
          reg35 <= (7'h44);
        end
      else
        begin
          reg31 <= reg33[(1'h0):(1'h0)];
          reg32 <= {reg23};
          reg33 <= (reg33[(2'h2):(1'h0)] ?
              reg32 : (reg29 || wire30[(4'hd):(4'hc)]));
        end
      reg36 <= $unsigned((~^(&(+(reg26 << wire4)))));
      reg37 <= (($unsigned((reg35[(4'h8):(3'h7)] ?
              reg24[(4'hc):(3'h6)] : reg27[(1'h1):(1'h0)])) || reg22) ?
          ((wire5 ?
              reg31 : (8'ha5)) < {(+(~|wire15))}) : (($signed($unsigned(reg28)) ^ $unsigned({(7'h44),
                  (8'hae)})) ?
              (&$signed($unsigned(reg34))) : (reg18 - reg18)));
      reg38 <= $unsigned($signed(wire4));
    end
  assign wire39 = $signed((~^reg24));
  assign wire40 = ($signed((((~|reg19) ?
                          $signed(reg20) : (reg20 + wire4)) ^~ reg25[(2'h2):(1'h1)])) ?
                      ($signed($unsigned($signed(reg20))) & reg26) : $signed(reg29));
  assign wire41 = (($unsigned((!(&reg19))) ? wire30[(4'hb):(3'h4)] : reg19) ?
                      ((7'h41) ^ reg28) : wire39[(4'hf):(4'h8)]);
  assign wire42 = (+((&(wire5[(3'h6):(3'h4)] ?
                      $signed(reg25) : (wire1 + reg23))) - (({reg33, reg19} ?
                          (reg18 & (8'hb5)) : $signed(reg37)) ?
                      {wire4} : ($unsigned(reg36) | {wire5}))));
  assign wire43 = (^((((reg34 ?
                      reg35 : reg28) == reg36) | reg34[(4'h9):(1'h0)]) << ((^~reg31) ?
                      $unsigned($signed(wire0)) : ($unsigned(wire17) > (reg37 << wire39)))));
  assign wire44 = reg24;
  assign wire45 = $signed($unsigned($unsigned($unsigned(reg20[(1'h0):(1'h0)]))));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = (~wire9[(5'h11):(3'h7)]);
  assign wire12 = $unsigned(wire11[(1'h0):(1'h0)]);
  assign wire13 = ($signed($signed(((7'h44) ?
                      wire8[(2'h3):(1'h1)] : (~&wire9)))) ^~ wire10);
  assign wire14 = (wire8[(3'h5):(1'h0)] ?
                      ($signed((wire9[(2'h3):(1'h0)] ? (~wire9) : (^wire12))) ?
                          wire7 : {$signed($signed(wire11)),
                              ($signed(wire8) ?
                                  (^~wire13) : (wire11 ?
                                      wire8 : wire12))}) : (^~$unsigned(($signed(wire7) != ((8'hb9) < wire13)))));
endmodule
