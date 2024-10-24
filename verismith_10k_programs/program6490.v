module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire4;
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire75,
                 wire67,
                 wire65,
                 wire4,
                 reg84,
                 reg83,
                 reg82,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire4 = $signed(((~&wire3[(4'hb):(1'h1)]) || (~^(!{(8'ha9), wire0}))));
  module5 #() modinst66 (.wire6(wire2), .y(wire65), .wire7(wire4), .wire8(wire1), .clk(clk), .wire9(wire3));
  assign wire67 = wire0;
  always
    @(posedge clk) begin
      reg68 <= (wire65 >> wire65[(4'h9):(3'h4)]);
      reg69 <= ($signed((-$signed(wire4[(2'h3):(1'h0)]))) + (^($unsigned((wire1 ?
              wire2 : (8'haf))) ?
          wire0 : wire2)));
      if (((reg69[(1'h0):(1'h0)] ? wire67 : (8'hab)) ?
          $signed(($unsigned($unsigned(wire1)) ?
              ((wire3 && wire1) | ((8'hb7) ? wire4 : wire3)) : (wire1 ?
                  ((8'ha9) ^ (7'h44)) : wire4))) : $unsigned({(!$unsigned(wire4))})))
        begin
          reg70 <= ($unsigned((-$unsigned($unsigned((8'ha0))))) <= {$unsigned({wire3[(2'h2):(2'h2)]})});
          reg71 <= {(7'h43)};
        end
      else
        begin
          reg70 <= (8'ha9);
          reg71 <= wire4[(3'h6):(2'h3)];
          reg72 <= wire2;
          reg73 <= $signed({($signed(wire0) - $signed((wire67 ?
                  wire3 : wire3))),
              $signed($signed((!wire0)))});
          reg74 <= ($signed((((reg70 ?
                  reg70 : wire4) << reg70[(4'ha):(3'h6)]) | $unsigned((+reg68)))) ?
              $signed((~wire2)) : {(^~(~&$unsigned(reg70))),
                  {reg71[(4'h8):(3'h4)]}});
        end
    end
  assign wire75 = $unsigned($unsigned((($unsigned((8'ha6)) ?
                          (&reg74) : wire67[(3'h5):(2'h2)]) ?
                      wire1 : reg69[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg76 <= $unsigned($signed((+wire2)));
      reg77 <= wire2;
      reg78 <= $unsigned(wire0);
      reg79 <= wire4[(2'h3):(1'h0)];
    end
  assign wire80 = wire1;
  assign wire81 = $unsigned(wire4[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg82 <= $signed($signed(wire80));
      reg83 <= {(reg79[(3'h6):(3'h6)] ?
              (~$signed((~&reg82))) : $unsigned(((reg69 - wire3) ?
                  $signed(wire1) : wire80[(3'h4):(1'h1)]))),
          $signed($signed($unsigned($signed(wire4))))};
      reg84 <= $signed($unsigned($unsigned($signed(reg78))));
    end
endmodule

module module5
#(parameter param64 = (&((8'haf) >>> ((((8'h9d) ? (8'ha4) : (8'hb6)) ? ((8'hb5) > (8'ha6)) : ((8'ha8) ? (8'hac) : (8'haa))) ? (~(8'hb2)) : {((8'ha4) ? (8'hb9) : (8'hbd)), ((8'hb0) ? (8'ha5) : (8'h9d))}))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h293):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  assign y = {wire63,
                 wire37,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
  assign wire10 = (wire9 >= (-$signed(((wire6 && wire7) >= (wire6 ?
                      wire8 : wire6)))));
  assign wire11 = $signed(((~^$signed($unsigned(wire7))) ^ ($signed((wire10 ?
                          wire8 : wire8)) ?
                      ((wire7 ? wire10 : (8'hb3)) ?
                          (wire9 ~^ wire10) : wire9) : $signed($unsigned(wire6)))));
  assign wire12 = ($signed(((wire6[(2'h2):(1'h1)] ?
                      $unsigned(wire8) : $unsigned(wire10)) <= (&$signed(wire7)))) ^~ (&$signed(((wire6 ~^ wire6) + $signed(wire9)))));
  assign wire13 = (8'ha8);
  assign wire14 = ((($unsigned({wire7}) ?
                          $signed((wire8 ?
                              wire6 : wire12)) : wire13) * ($unsigned(wire6[(5'h11):(3'h6)]) <<< wire6)) ?
                      (~&(^((8'ha8) ?
                          wire8 : $signed(wire6)))) : wire13[(4'hb):(3'h4)]);
  assign wire15 = wire11;
  assign wire16 = (wire14 ? wire13[(4'ha):(4'ha)] : wire6);
  assign wire17 = wire11[(3'h4):(2'h3)];
  assign wire18 = wire8[(4'h9):(3'h7)];
  assign wire19 = {(($unsigned(wire11[(3'h5):(1'h0)]) ~^ wire18) <<< wire17[(4'h9):(2'h3)]),
                      $unsigned((({wire15, wire18} ?
                          (wire18 ?
                              (8'h9c) : (8'hbd)) : $unsigned(wire15)) ~^ $unsigned(wire7[(3'h5):(1'h0)])))};
  always
    @(posedge clk) begin
      reg20 <= (wire7[(1'h0):(1'h0)] < wire17[(1'h1):(1'h0)]);
      if ((^$unsigned((wire16[(4'hb):(2'h2)] * {(~^wire15)}))))
        begin
          if ((wire16[(4'he):(2'h3)] << wire14[(3'h6):(1'h0)]))
            begin
              reg21 <= (8'hb6);
              reg22 <= (8'ha8);
              reg23 <= $unsigned($signed($signed($unsigned($unsigned(wire18)))));
              reg24 <= reg21;
            end
          else
            begin
              reg21 <= (-((8'ha3) ?
                  (&({wire12} & $unsigned(wire10))) : (~&wire19)));
              reg22 <= (~((-($signed(wire10) ?
                  $unsigned(wire19) : (~^(8'ha0)))) << $signed(reg21[(3'h6):(2'h3)])));
              reg23 <= wire14[(4'hd):(4'hb)];
            end
          reg25 <= wire19;
          if ($unsigned(wire14))
            begin
              reg26 <= ((wire6[(4'hb):(1'h0)] >= (wire12 | wire6[(5'h12):(4'h9)])) ?
                  ($signed(reg22[(1'h1):(1'h1)]) << ((|(wire10 <= (8'h9d))) ?
                      $unsigned((^~wire7)) : (8'hb3))) : (((-(8'ha5)) ?
                          {{wire12}} : {(-wire15), {wire14, wire6}}) ?
                      $signed($signed((wire6 ?
                          wire13 : wire9))) : ($unsigned((wire11 ?
                          (8'ha1) : wire11)) != wire9)));
              reg27 <= (-(8'ha6));
            end
          else
            begin
              reg26 <= {(wire17[(3'h4):(2'h3)] & {($signed(reg21) ^~ (reg22 * wire9))}),
                  ($signed(((reg27 ? reg22 : reg26) ?
                      (^reg21) : wire13)) ~^ reg24[(1'h0):(1'h0)])};
              reg27 <= ((reg27 >>> reg25[(1'h0):(1'h0)]) ?
                  reg24[(3'h4):(2'h3)] : ($unsigned(wire8) >>> (~^wire8)));
              reg28 <= ((~|reg25) && ((8'h9c) ?
                  reg20 : (~^$unsigned((wire7 * reg23)))));
              reg29 <= wire6[(5'h11):(4'he)];
            end
          reg30 <= $unsigned(reg28[(4'ha):(3'h4)]);
        end
      else
        begin
          reg21 <= ($signed(((^~$signed(wire8)) ?
              wire6[(1'h0):(1'h0)] : wire9[(2'h2):(2'h2)])) & $unsigned(((wire11 ?
                  $unsigned(reg29) : $unsigned(reg22)) ?
              (~|$signed((8'hb8))) : (wire19[(3'h4):(1'h0)] ?
                  reg22 : $signed(wire16)))));
        end
      reg31 <= reg30;
      if ((^(wire13[(2'h3):(1'h1)] | $signed((8'ha0)))))
        begin
          reg32 <= wire14[(3'h6):(2'h3)];
        end
      else
        begin
          reg32 <= reg21[(3'h6):(1'h1)];
          reg33 <= $signed(reg25[(2'h3):(2'h3)]);
          reg34 <= reg32[(4'he):(4'hc)];
          reg35 <= ((~|wire13[(3'h5):(3'h5)]) ?
              (($unsigned((8'hb7)) ?
                  $signed((reg28 ?
                      wire17 : (8'hbe))) : $unsigned((~^wire19))) ~^ $unsigned((reg25 ?
                  (~^reg21) : (wire7 ?
                      (8'ha9) : (8'hb5))))) : ((|$signed({reg31})) - {(^~wire8)}));
          reg36 <= ($unsigned($signed((~^wire7[(3'h4):(2'h2)]))) ?
              {$signed($unsigned(((8'haf) & reg33)))} : {(((wire15 > wire17) && $unsigned(wire9)) ?
                      wire16 : reg23),
                  $signed($signed((+reg33)))});
        end
    end
  assign wire37 = $signed(((reg30 ?
                          (reg36[(4'hb):(2'h2)] <= (!reg36)) : reg31[(3'h4):(3'h4)]) ?
                      wire17[(3'h6):(1'h1)] : (wire11 ?
                          $signed((reg29 ? reg36 : wire10)) : (~^((8'hb9) ?
                              reg27 : wire19)))));
  always
    @(posedge clk) begin
      if ($signed($signed(reg31)))
        begin
          reg38 <= (&$signed(({(reg32 ?
                  wire7 : wire13)} & $signed($signed((8'h9f))))));
          reg39 <= ($unsigned((&(~$signed(wire10)))) ? wire13 : (8'hb4));
          if ({(reg26 ?
                  reg20[(1'h1):(1'h1)] : ($unsigned($signed(reg27)) < (^~wire17[(4'h9):(2'h2)])))})
            begin
              reg40 <= reg33;
              reg41 <= $signed({(^~$signed($signed((8'ha4)))),
                  $signed(((^wire17) ^~ {reg33}))});
              reg42 <= {{wire12[(4'h9):(1'h1)]},
                  $signed((!$signed($signed((8'hb6)))))};
              reg43 <= (($signed(($unsigned(reg28) < wire17[(3'h6):(2'h2)])) ^ (|((8'ha2) - (+wire17)))) ?
                  {(^((wire15 ?
                          reg23 : wire9) & wire9[(4'hb):(4'h8)]))} : $unsigned({$signed((reg40 >>> (8'ha2))),
                      wire17[(3'h4):(2'h2)]}));
              reg44 <= {reg38[(1'h1):(1'h0)]};
            end
          else
            begin
              reg40 <= (~&$unsigned(($unsigned((wire11 ? wire6 : wire6)) ?
                  reg44 : reg41)));
              reg41 <= (((((reg21 ?
                          reg36 : reg23) && (+reg23)) != ($unsigned(reg42) >>> (+reg28))) ?
                      wire16[(1'h1):(1'h1)] : ((8'hb2) > reg23)) ?
                  (|(8'h9c)) : $unsigned((wire13[(3'h7):(2'h3)] & ((8'hba) - (~|wire37)))));
            end
          reg45 <= reg34[(2'h3):(1'h1)];
          reg46 <= (7'h40);
        end
      else
        begin
          reg38 <= (8'hb6);
          reg39 <= ((!wire15) - wire19[(5'h11):(4'h8)]);
          reg40 <= ((^$unsigned(((wire14 ^~ reg20) ~^ reg41[(4'ha):(4'ha)]))) ?
              (~^$unsigned(({wire15, (8'hb1)} ?
                  (reg44 ? wire9 : reg45) : (wire14 ?
                      reg35 : (8'hb5))))) : reg30);
          reg41 <= (!reg34);
        end
      reg47 <= ($unsigned((((wire37 != (8'haf)) ?
          (8'had) : ((8'ha3) >= wire11)) <<< reg39[(5'h10):(1'h1)])) | $unsigned($signed($unsigned((+reg39)))));
      if ((8'ha5))
        begin
          reg48 <= (($signed(wire11[(3'h5):(1'h0)]) ?
                  $unsigned(wire37) : (wire37 * ((reg21 ^~ reg24) || $signed(reg26)))) ?
              ((&reg22[(5'h14):(1'h1)]) ?
                  $unsigned(reg46) : wire16[(3'h4):(1'h0)]) : wire13);
          reg49 <= $signed((wire17[(2'h2):(1'h0)] ?
              reg38[(2'h2):(2'h2)] : wire6[(3'h6):(3'h5)]));
          reg50 <= (($unsigned((wire12 ?
              reg20[(1'h0):(1'h0)] : $unsigned(wire13))) <<< $signed(((~&wire19) ?
              wire11 : (~|wire11)))) ^ (reg39[(4'h8):(3'h4)] ?
              $unsigned(wire12[(3'h4):(1'h0)]) : $unsigned((~$signed(wire8)))));
          reg51 <= (~|{$signed(reg26), reg46});
        end
      else
        begin
          reg48 <= $unsigned(((((wire14 ? wire37 : reg26) ?
                  (reg23 ? wire7 : wire7) : reg40) ?
              ($unsigned(wire6) || (~|reg27)) : (wire37 || $signed(reg51))) >>> (-wire9)));
          if (reg26[(2'h2):(1'h0)])
            begin
              reg49 <= wire18[(2'h2):(1'h0)];
              reg50 <= wire9;
            end
          else
            begin
              reg49 <= wire8;
              reg50 <= reg38;
              reg51 <= $signed($unsigned($signed((^~(7'h43)))));
              reg52 <= (~$unsigned(wire11));
            end
          reg53 <= reg29[(4'h8):(1'h0)];
          if (($signed(((((8'hb9) == reg20) == (^~reg33)) <= wire19[(4'hb):(3'h6)])) ?
              {($unsigned(reg51) ^ (8'hb5))} : $signed(reg22)))
            begin
              reg54 <= (^~((^~($unsigned(wire37) <<< (reg26 << (8'hbe)))) | (^(|(reg36 ?
                  wire37 : wire11)))));
            end
          else
            begin
              reg54 <= wire17;
              reg55 <= $signed($signed($unsigned(reg33)));
              reg56 <= reg54[(3'h6):(1'h0)];
              reg57 <= {(wire8 ?
                      ($signed(reg47) ?
                          {(wire11 ? reg25 : reg20),
                              (reg33 ?
                                  reg36 : wire14)} : (~&$unsigned(reg50))) : (^~$unsigned({reg26}))),
                  $signed((wire6 ?
                      ($unsigned(wire9) ?
                          $unsigned(wire10) : $signed(reg52)) : $signed((~&reg46))))};
              reg58 <= (($signed(($signed(reg30) ?
                      (!wire6) : wire13[(4'ha):(1'h0)])) ?
                  ((^~$signed(reg51)) && $unsigned({reg44})) : ($unsigned(((8'hb3) != reg50)) ?
                      ((wire7 >> (8'hbe)) ?
                          reg25 : (reg25 ?
                              reg32 : wire17)) : wire9[(1'h0):(1'h0)])) * (^wire12));
            end
          reg59 <= $unsigned((8'hb3));
        end
      reg60 <= $unsigned({(wire6[(3'h7):(1'h1)] ?
              reg39[(3'h4):(3'h4)] : $signed($signed(reg47)))});
      reg61 <= reg56[(4'hd):(4'ha)];
    end
  always
    @(posedge clk) begin
      reg62 <= $unsigned(($signed(reg34) ?
          $unsigned(({wire8, reg31} >>> reg32[(5'h11):(2'h3)])) : wire11));
    end
  assign wire63 = $unsigned({{wire17}, (~$unsigned($unsigned(reg54)))});
endmodule
