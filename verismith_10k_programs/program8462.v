module top
#(parameter param89 = (8'hb4))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire87;
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire33,
                 wire44,
                 wire87,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire5 = wire2[(4'ha):(2'h3)];
  assign wire6 = (wire1[(1'h0):(1'h0)] * (~^$signed(((8'hbd) - wire4[(1'h0):(1'h0)]))));
  assign wire7 = $unsigned((^~($unsigned((+wire4)) ?
                     $unsigned({(7'h41), wire6}) : $signed(wire3))));
  module8 #() modinst34 (wire33, clk, wire6, wire3, wire2, wire4);
  always
    @(posedge clk) begin
      if ($signed(wire1))
        begin
          if (wire0)
            begin
              reg35 <= {wire7};
              reg36 <= $unsigned($unsigned(({(8'hb8)} ?
                  ($unsigned(wire7) ?
                      $signed(reg35) : {reg35,
                          (8'hbb)}) : $signed(wire3[(5'h10):(2'h3)]))));
              reg37 <= (~|$signed(((|((8'ha3) ?
                  wire2 : wire33)) >= ($unsigned(wire2) ?
                  (wire0 ? wire3 : reg35) : $unsigned(reg36)))));
              reg38 <= $unsigned({wire5});
              reg39 <= ((8'h9c) & (~$unsigned(($signed(reg38) ?
                  reg38 : wire2[(4'ha):(3'h7)]))));
            end
          else
            begin
              reg35 <= (reg36 ~^ $unsigned((~$unsigned({wire3}))));
              reg36 <= $signed((wire0 ?
                  $unsigned($signed(wire2[(1'h1):(1'h1)])) : (8'hb1)));
              reg37 <= $unsigned((reg36 ?
                  (~^wire6) : ($unsigned((wire33 ? (8'hbd) : wire33)) ?
                      $signed($signed(wire4)) : (^~reg36[(5'h13):(5'h10)]))));
              reg38 <= (~&$signed($unsigned(wire0)));
            end
          reg40 <= ((-reg37) & {(&reg37)});
          reg41 <= reg40[(5'h14):(4'h8)];
          reg42 <= $unsigned(($unsigned(((wire0 ? wire5 : wire2) ?
              (reg38 ? reg40 : reg37) : (&wire33))) == wire2));
          reg43 <= (wire33 ? (8'ha0) : (8'hbe));
        end
      else
        begin
          reg35 <= (8'hb0);
          reg36 <= {wire3, (~|(~^$unsigned((reg41 > wire6))))};
          reg37 <= $signed($unsigned($unsigned({((8'hb5) ? (8'hb4) : reg35)})));
          if ((wire3 == $signed((wire4 >= (8'ha0)))))
            begin
              reg38 <= reg40;
            end
          else
            begin
              reg38 <= ({(~|(|reg40[(5'h13):(4'h9)]))} ?
                  ($unsigned(reg36) ?
                      (~^((wire2 || reg41) ^ (8'hbb))) : reg38[(2'h2):(2'h2)]) : (reg35[(2'h2):(1'h1)] > (^~{wire4[(3'h4):(1'h1)]})));
            end
        end
    end
  assign wire44 = $signed(reg40);
  module45 #() modinst88 (.y(wire87), .wire47(wire0), .wire46(reg35), .clk(clk), .wire50(wire6), .wire48(reg36), .wire49(wire7));
endmodule

module module45  (y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire50;
  input wire signed [(5'h11):(1'h0)] wire49;
  input wire [(5'h10):(1'h0)] wire48;
  input wire [(5'h15):(1'h0)] wire47;
  input wire [(4'h9):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(4'hd):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  assign y = {wire86,
                 wire70,
                 wire69,
                 wire67,
                 wire52,
                 wire51,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire51 = {wire47[(5'h12):(4'h8)]};
  assign wire52 = ({$signed(wire49)} != $signed($unsigned({wire49[(3'h5):(3'h5)]})));
  module53 #() modinst68 (wire67, clk, wire49, wire47, wire46, wire48);
  assign wire69 = wire67[(4'h9):(3'h4)];
  assign wire70 = $signed((wire48 ?
                      (wire47 << wire46) : wire48[(4'hd):(4'ha)]));
  always
    @(posedge clk) begin
      reg71 <= (8'ha6);
      if (((wire70[(4'hb):(4'hb)] ?
          wire51[(3'h4):(1'h1)] : wire69) ~^ $signed(((wire69 ?
          (^(8'hb9)) : $signed(wire69)) >= ((~^wire51) ?
          wire48[(2'h2):(1'h0)] : {wire70})))))
        begin
          if (wire49[(4'he):(3'h7)])
            begin
              reg72 <= (((($signed(wire50) ?
                  $unsigned((8'hbb)) : (wire51 ?
                      reg71 : wire51)) <= ($unsigned((8'h9c)) && wire69[(4'ha):(3'h5)])) <<< (!(!{wire67}))) <= ((wire46 ?
                  {$signed(wire52),
                      (reg71 > wire69)} : $unsigned(wire47)) ~^ (~(&((8'hb3) ?
                  (8'hb2) : wire70)))));
              reg73 <= {((((^~wire47) ? wire70 : $unsigned(wire48)) ?
                      (wire69 ?
                          (wire69 || (8'hab)) : (wire46 ?
                              wire69 : reg72)) : wire50[(3'h6):(1'h1)]) ~^ ($signed($signed(wire52)) ?
                      $signed(((8'hb2) ?
                          (8'ha7) : wire67)) : $signed((^~wire69)))),
                  $signed(wire48[(3'h7):(3'h5)])};
              reg74 <= wire51[(4'ha):(2'h3)];
              reg75 <= wire70;
              reg76 <= wire70[(2'h2):(1'h0)];
            end
          else
            begin
              reg72 <= wire48[(4'hf):(4'hc)];
              reg73 <= $unsigned(((+{{reg74, (8'ha2)}}) ?
                  {wire70[(3'h5):(2'h2)],
                      reg76[(4'he):(3'h5)]} : wire52[(2'h2):(1'h0)]));
              reg74 <= ($signed((~|$unsigned($signed(wire51)))) ?
                  $unsigned((wire46 ?
                      reg71[(3'h4):(3'h4)] : reg75)) : $unsigned($unsigned({$unsigned(reg75),
                      $unsigned(wire46)})));
              reg75 <= $signed((~$signed($signed(wire49))));
              reg76 <= $unsigned(((!{$unsigned(reg72)}) < $signed(reg76[(1'h0):(1'h0)])));
            end
          if ((wire51[(4'ha):(3'h6)] <<< $unsigned((~^(((8'haa) ?
              reg76 : wire47) < reg72)))))
            begin
              reg77 <= (($unsigned($unsigned((reg75 * reg75))) ?
                      $unsigned(reg74) : {(reg75[(2'h3):(1'h1)] != (+wire47)),
                          (-((8'hb8) ? wire46 : wire49))}) ?
                  reg72[(1'h1):(1'h1)] : {$signed((8'hb6)),
                      $signed((|(~^(8'ha8))))});
              reg78 <= (reg74 == wire51);
              reg79 <= wire69;
              reg80 <= ((&(wire50[(1'h0):(1'h0)] - wire51[(5'h10):(1'h0)])) & ((~(&wire50[(3'h5):(2'h3)])) ?
                  reg72[(2'h2):(1'h1)] : reg75));
            end
          else
            begin
              reg77 <= $signed(reg73[(3'h5):(1'h0)]);
              reg78 <= (+$unsigned(wire70[(1'h1):(1'h0)]));
              reg79 <= {{(wire51 ?
                          $signed($signed(wire70)) : ({wire51, wire51} ?
                              $signed(wire50) : (&wire47))),
                      (($unsigned(wire67) ?
                          (reg76 != reg73) : reg73) << wire69)},
                  ($signed(wire70[(4'hb):(4'ha)]) ^ reg80[(1'h0):(1'h0)])};
              reg80 <= (wire67[(3'h6):(3'h4)] ?
                  (($unsigned((+wire52)) <= (~^(&(8'ha7)))) ?
                      (($unsigned(wire46) <= $unsigned(reg75)) | $signed(wire70)) : $unsigned((reg78 ?
                          reg80 : $unsigned(wire52)))) : wire67[(3'h5):(1'h1)]);
            end
          reg81 <= (wire47[(5'h13):(4'he)] >= $unsigned({$signed((~|reg80)),
              $signed((reg80 == wire70))}));
          if ({reg75, $unsigned(reg77[(4'hc):(1'h0)])})
            begin
              reg82 <= (-reg80);
              reg83 <= (reg79[(1'h1):(1'h0)] - $signed((~^$signed({reg74}))));
              reg84 <= wire49[(2'h2):(2'h2)];
              reg85 <= $signed({((~reg77[(4'ha):(4'ha)]) ?
                      {(reg82 ? (8'h9f) : reg84)} : $signed({wire46}))});
            end
          else
            begin
              reg82 <= wire50;
              reg83 <= reg80[(2'h3):(1'h1)];
              reg84 <= reg71;
            end
        end
      else
        begin
          reg72 <= ({(~|{$unsigned(wire50)}), reg73[(1'h1):(1'h1)]} ?
              reg83 : wire49);
          reg73 <= (reg71 ? (!$unsigned($unsigned((wire49 * reg72)))) : wire51);
          reg74 <= {(+(8'hb9)), reg85};
          reg75 <= ({$signed(reg72)} && $unsigned($signed((!(^(8'ha5))))));
        end
    end
  assign wire86 = {(-(~|({wire51} ? (|(8'ha5)) : $signed(wire50))))};
endmodule

module module8
#(parameter param32 = (^(({((8'hbd) ? (7'h41) : (8'hb5))} < ({(8'hae), (8'hbb)} && ((8'h9e) ? (7'h40) : (8'hac)))) == (-(^~((8'ha8) ? (8'haf) : (8'ha6)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(3'h7):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(2'h3):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire31,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 (1'h0)};
  assign wire13 = $signed((((wire9 ?
                          ((8'hb0) ? (8'hac) : wire10) : $unsigned(wire12)) ?
                      $signed((^~wire11)) : (8'h9c)) <<< {(wire9 ?
                          wire11 : (wire12 ? wire10 : (8'ha9)))}));
  assign wire14 = {$unsigned($signed(wire12)), wire12};
  assign wire15 = wire14[(1'h1):(1'h0)];
  assign wire16 = {(wire10 ?
                          (+$unsigned((8'ha8))) : (^$unsigned(wire13[(3'h4):(2'h3)]))),
                      wire13[(1'h1):(1'h0)]};
  assign wire17 = (wire16[(3'h6):(3'h6)] >>> {$unsigned(((!wire14) | (~^wire16))),
                      $unsigned(wire15[(5'h10):(1'h0)])});
  assign wire18 = ($signed(($unsigned($unsigned(wire17)) != (+(-wire9)))) + (|(~^$signed((wire9 | wire11)))));
  assign wire19 = wire17;
  assign wire20 = (+wire17);
  always
    @(posedge clk) begin
      reg21 <= $unsigned((($unsigned((&wire19)) ?
              ({wire14} - (wire17 ? wire14 : wire9)) : (&wire12)) ?
          (&((wire10 ?
              wire14 : (8'h9c)) << wire14[(1'h1):(1'h1)])) : $signed($unsigned(((8'hb7) || wire14)))));
      reg22 <= wire10[(2'h3):(1'h1)];
      reg23 <= (~|(!$unsigned(wire11)));
      if (wire11[(2'h3):(2'h3)])
        begin
          if (wire16[(3'h5):(3'h4)])
            begin
              reg24 <= wire11[(5'h10):(5'h10)];
              reg25 <= (({$unsigned({reg24})} ?
                  {(wire19 ?
                          (reg22 < (8'ha1)) : $unsigned(wire10))} : wire18) ^ {$signed($signed({reg24,
                      wire18})),
                  $unsigned(reg24[(1'h1):(1'h0)])});
              reg26 <= wire9;
              reg27 <= (($signed((reg24 ?
                          ((8'ha0) * wire20) : $unsigned(wire14))) ?
                      wire18[(3'h4):(1'h1)] : wire16) ?
                  $signed($unsigned($signed((~|(7'h42))))) : (&(^($signed(wire10) < $unsigned((8'h9c))))));
            end
          else
            begin
              reg24 <= (~($unsigned(reg21[(1'h0):(1'h0)]) + $unsigned((^((8'hb8) | wire14)))));
              reg25 <= {$signed(wire10[(4'h9):(3'h5)]),
                  (^~(~|$signed((reg25 ? (8'ha4) : wire13))))};
              reg26 <= ((^{reg21[(4'h9):(1'h0)]}) ?
                  (!(reg22[(4'he):(4'hd)] ?
                      wire9[(3'h7):(1'h1)] : $signed({wire12,
                          reg23}))) : (((~|(8'ha3)) ?
                          (|reg22[(4'he):(4'he)]) : ($unsigned(wire11) ?
                              (&wire19) : (wire13 ^ wire20))) ?
                      (8'hb3) : (reg23 ? wire19[(1'h0):(1'h0)] : {reg24})));
              reg27 <= wire14;
              reg28 <= (~|{(((8'ha7) - $signed(wire19)) * wire11),
                  reg26[(2'h2):(1'h1)]});
            end
          reg29 <= (reg27 ? (!reg24[(1'h1):(1'h1)]) : wire15[(4'he):(4'hc)]);
        end
      else
        begin
          reg24 <= wire18[(2'h2):(1'h1)];
          reg25 <= {$unsigned(wire12[(5'h14):(4'ha)]),
              (&($unsigned(wire9) >= ((wire16 ?
                  wire17 : wire20) <= $signed(wire11))))};
        end
      reg30 <= ({($signed(wire20[(1'h0):(1'h0)]) ?
                  ($unsigned(reg21) ?
                      wire15[(2'h3):(2'h2)] : reg22[(4'hc):(3'h5)]) : (+reg21[(1'h1):(1'h1)]))} ?
          $signed({(wire13 ?
                  $signed(reg21) : wire14[(1'h0):(1'h0)])}) : ($unsigned(((wire17 ?
                  (7'h40) : reg29) << (wire20 < wire13))) ?
              wire17 : wire12[(2'h2):(1'h1)]));
    end
  assign wire31 = ($signed(wire12) && wire18);
endmodule

module module53  (y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire signed [(3'h5):(1'h0)] wire55;
  input wire [(4'h9):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire58;
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  assign y = {wire62,
                 wire58,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire58 = $unsigned($unsigned((|wire54)));
  always
    @(posedge clk) begin
      reg59 <= (~|wire54);
      reg60 <= (|{(($unsigned((8'ha8)) ?
              $signed(wire55) : (-wire57)) && (~|$signed(wire54))),
          ($signed(wire57) ?
              $unsigned((8'hae)) : ((reg59 ? wire57 : wire55) ?
                  (~^reg59) : {wire56}))});
      reg61 <= $signed(wire57[(3'h6):(1'h0)]);
    end
  assign wire62 = wire57[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg63 <= wire62;
      reg64 <= (wire57[(4'ha):(4'h8)] == $unsigned(reg59));
      reg65 <= ($unsigned($signed((~wire56))) ?
          ({wire62, reg59} != ((~(~wire57)) ?
              $unsigned($unsigned(wire57)) : wire55)) : ($unsigned(($signed(wire54) >> (wire58 ?
              (8'h9c) : wire57))) ^~ $unsigned($signed(((8'hbc) == reg63)))));
    end
  always
    @(posedge clk) begin
      reg66 <= $unsigned((($unsigned(wire55) ?
              ($unsigned(wire55) >>> (~^wire58)) : (&$unsigned(reg60))) ?
          {wire56} : reg61));
    end
endmodule
