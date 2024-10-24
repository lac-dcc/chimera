module top
#(parameter param107 = (^{{((^(8'haa)) + {(8'hbc)}), (^((8'hb8) ? (7'h40) : (8'hbb)))}}), 
parameter param108 = ((-(~|((param107 ? param107 : param107) || (param107 ? (8'had) : param107)))) | {(param107 ? param107 : {{param107}})}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire95;
  wire [(5'h11):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = (~&(8'hbc));
  module6 #() modinst96 (wire95, clk, wire2, wire5, wire4, wire3);
  assign wire97 = (-($signed($unsigned($unsigned((8'ha9)))) ?
                      (^{$unsigned(wire2), $unsigned(wire0)}) : (|wire5)));
  assign wire98 = {$unsigned($unsigned(wire4[(4'hc):(1'h0)]))};
  assign wire99 = (~$unsigned(wire2));
  assign wire100 = wire97[(2'h3):(2'h2)];
  assign wire101 = wire1;
  assign wire102 = $signed((8'hb7));
  assign wire103 = ((~$unsigned(wire102)) <= wire101);
  assign wire104 = wire5;
  assign wire105 = wire95[(2'h3):(1'h1)];
  assign wire106 = $unsigned(($unsigned((wire0[(3'h6):(3'h4)] ~^ $unsigned(wire99))) ?
                       (($unsigned(wire2) ? wire0 : $unsigned(wire105)) ?
                           $signed((&(8'hba))) : $unsigned((^~wire95))) : $unsigned((~^(wire97 ?
                           wire104 : wire100)))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire69;
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  assign y = {wire93,
                 wire91,
                 wire40,
                 wire69,
                 reg94,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  module11 #() modinst41 (wire40, clk, wire7, wire9, wire10, wire8);
  module42 #() modinst70 (.wire45(wire9), .wire46(wire40), .clk(clk), .wire44(wire10), .y(wire69), .wire47(wire8), .wire43(wire7));
  always
    @(posedge clk) begin
      reg71 <= {{$unsigned({wire69[(3'h6):(3'h4)], $signed(wire69)})},
          ((!$signed(wire9)) ? wire10[(3'h4):(3'h4)] : wire10[(4'h8):(1'h0)])};
    end
  always
    @(posedge clk) begin
      reg72 <= (wire8 ?
          wire8 : (({(wire40 ?
                  wire10 : wire40)} < (~|$signed((8'ha6)))) || $unsigned((~^wire10[(3'h5):(3'h4)]))));
      reg73 <= (wire8 >>> reg71);
      reg74 <= wire69;
    end
  module75 #() modinst92 (.clk(clk), .wire79(reg74), .wire77(wire9), .wire78(reg73), .wire76(wire69), .y(wire91));
  assign wire93 = ({wire10[(2'h2):(1'h0)]} ?
                      reg71 : (!(((+wire69) > wire9) - reg73[(4'hf):(1'h1)])));
  always
    @(posedge clk) begin
      reg94 <= (((($unsigned(reg73) >>> (reg71 ~^ (8'hb6))) || {reg71[(2'h2):(1'h0)],
              wire10}) & (|wire10[(3'h7):(3'h4)])) ?
          wire91[(3'h5):(2'h2)] : (((((8'hbf) && reg72) == (wire69 ?
                      wire69 : wire40)) ?
                  (wire10[(4'h9):(3'h6)] ?
                      (wire10 ?
                          reg72 : wire8) : $signed((8'had))) : ($signed(reg73) | wire8[(2'h3):(2'h2)])) ?
              wire91 : wire69[(3'h5):(3'h4)]));
    end
endmodule

module module75  (y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire78;
  input wire signed [(4'ha):(1'h0)] wire77;
  input wire signed [(4'h8):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire90;
  wire signed [(3'h6):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(4'hd):(1'h0)] wire87;
  wire signed [(5'h12):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire80;
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire80,
                 reg82,
                 reg81,
                 (1'h0)};
  assign wire80 = wire78;
  always
    @(posedge clk) begin
      reg81 <= (~|(&wire80[(4'hd):(4'hd)]));
      reg82 <= {{($unsigned($signed(reg81)) >>> (!wire79[(2'h2):(1'h0)]))},
          $signed($signed(wire80))};
    end
  assign wire83 = wire80;
  assign wire84 = $signed($signed(wire77));
  assign wire85 = wire76[(2'h3):(2'h2)];
  assign wire86 = wire85[(1'h1):(1'h1)];
  assign wire87 = $signed($unsigned($unsigned($signed((^(7'h40))))));
  assign wire88 = ($unsigned(wire76[(2'h2):(2'h2)]) ?
                      ($signed(wire87[(2'h2):(1'h0)]) == (^~(((8'h9e) + wire78) ^ (wire85 ?
                          wire76 : wire79)))) : wire83[(4'ha):(4'h8)]);
  assign wire89 = $signed(((!(~^wire87[(4'hc):(4'hb)])) + $signed((|(reg82 <<< wire76)))));
  assign wire90 = (wire87[(4'h9):(3'h5)] ?
                      ((!wire78) ^~ {$unsigned(reg82[(3'h6):(2'h2)])}) : (({wire83[(4'he):(1'h1)]} >= $signed($signed(reg81))) >> (($signed((8'ha1)) ?
                              reg82 : wire78) ?
                          $signed($signed(wire79)) : (&(wire87 ?
                              wire83 : wire83)))));
endmodule

module module42  (y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire47;
  input wire [(5'h11):(1'h0)] wire46;
  input wire signed [(4'hb):(1'h0)] wire45;
  input wire signed [(4'h9):(1'h0)] wire44;
  input wire signed [(5'h13):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire53;
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg66,
                 reg65,
                 reg64,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire44 ^ (wire47[(1'h0):(1'h0)] > (&((wire45 == wire47) - (wire45 > wire43))))))
        begin
          reg48 <= ((8'hb4) ?
              ($signed(wire44) ?
                  wire44[(3'h6):(2'h3)] : {((^wire45) ?
                          wire47[(2'h2):(2'h2)] : wire45[(3'h4):(3'h4)]),
                      ($signed(wire43) ?
                          (wire45 <<< wire47) : $unsigned(wire46))}) : wire46[(4'hc):(3'h4)]);
          reg49 <= $signed(wire45[(4'h9):(1'h1)]);
          reg50 <= (^($unsigned($unsigned(reg48)) + wire45));
          reg51 <= (8'h9c);
          reg52 <= ($unsigned(({$signed(wire45),
                  wire43[(3'h5):(2'h3)]} - $signed((wire46 ?
                  wire44 : (8'ha2))))) ?
              (-reg48) : ((+$signed($unsigned(wire43))) ?
                  wire46[(1'h0):(1'h0)] : (^~(~|wire44[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg48 <= $unsigned(({(wire45[(4'ha):(3'h5)] ~^ (wire44 ?
                      reg49 : reg50))} ?
              $signed((reg52 ?
                  $unsigned(wire44) : (8'ha9))) : ((!reg50[(1'h1):(1'h0)]) ?
                  wire44 : ((reg50 ? (8'hb5) : reg48) | (|(8'hb8))))));
          reg49 <= $unsigned((({{reg51,
                  wire44}} >= $signed(wire47[(1'h1):(1'h0)])) - wire47));
          reg50 <= $signed(reg49);
          reg51 <= reg51;
          reg52 <= ((reg48 ^ (-{$unsigned(reg51)})) ?
              (-$signed(({reg51, reg50} & (wire45 ? reg48 : wire46)))) : reg49);
        end
    end
  assign wire53 = (reg48[(4'ha):(4'ha)] <= reg50);
  assign wire54 = (!(reg49[(4'ha):(3'h4)] && $unsigned((wire43[(4'he):(1'h1)] > wire45[(2'h3):(2'h3)]))));
  assign wire55 = reg49[(4'h9):(4'h9)];
  assign wire56 = reg48[(5'h11):(4'hb)];
  assign wire57 = $signed($unsigned({(wire45 == $signed(reg48)),
                      $unsigned(reg52)}));
  assign wire58 = {{$unsigned($unsigned(wire45[(4'h9):(4'h8)]))}};
  assign wire59 = $signed(reg51[(2'h3):(2'h3)]);
  assign wire60 = $unsigned(wire55[(3'h6):(3'h6)]);
  assign wire61 = (wire53 ~^ $unsigned(($signed((reg49 ? wire56 : wire60)) ?
                      $signed($unsigned(wire53)) : (~&reg52[(3'h5):(3'h4)]))));
  assign wire62 = ($signed($signed((-wire61[(4'hf):(2'h2)]))) + ((wire47 + $signed((wire47 ?
                          wire61 : reg48))) ?
                      (($signed(wire56) | ((8'hbb) >> wire58)) ?
                          {$signed(wire46)} : ((^(7'h40)) ~^ $unsigned(wire60))) : $unsigned(($unsigned((8'hb6)) + (wire43 ?
                          (8'hbd) : wire46)))));
  assign wire63 = (-($unsigned((-$unsigned(wire57))) * ((~|(wire53 != wire62)) < (wire60 ~^ (~^wire43)))));
  always
    @(posedge clk) begin
      reg64 <= ({(reg52[(1'h1):(1'h0)] <<< (((7'h42) ? wire61 : wire57) ?
              $unsigned(wire63) : $signed(wire47)))} || wire45);
      reg65 <= reg52;
      reg66 <= wire57[(4'h8):(2'h3)];
    end
  assign wire67 = wire45[(3'h4):(2'h2)];
  assign wire68 = (^~(wire60 ^ ($signed($unsigned(reg66)) ?
                      {reg66[(2'h3):(2'h3)],
                          $unsigned(wire58)} : (~|wire62[(2'h2):(2'h2)]))));
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire15;
  input wire signed [(3'h6):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  assign y = {wire39,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 (1'h0)};
  assign wire16 = wire15;
  assign wire17 = wire13;
  assign wire18 = (8'hb9);
  assign wire19 = (~wire18);
  assign wire20 = wire19[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ((8'hbb))
        begin
          reg21 <= $unsigned({(wire12[(5'h11):(4'ha)] ^~ $signed($signed(wire16))),
              (($unsigned(wire12) ~^ wire17[(4'hd):(4'ha)]) ?
                  (((8'ha0) >> wire12) ?
                      {wire18} : (wire13 <<< wire20)) : (-(8'hac)))});
          reg22 <= $unsigned({$signed((~&(~^wire16)))});
          if (wire15[(1'h1):(1'h0)])
            begin
              reg23 <= (({($signed(reg21) ? wire17 : (!(8'hbc)))} || (8'hbf)) ?
                  wire14[(3'h4):(1'h1)] : (reg22[(4'hb):(3'h6)] - $signed(($unsigned(wire15) ?
                      $signed(wire18) : ((8'h9d) ? wire15 : wire14)))));
            end
          else
            begin
              reg23 <= $signed((~&(~|((~|wire20) ^ (wire15 << reg22)))));
              reg24 <= ({({{wire18}, $unsigned(wire14)} >> ((wire12 - wire19) ?
                          reg21 : (wire13 << (8'hbf)))),
                      reg22[(4'hf):(3'h4)]} ?
                  $signed($unsigned($signed((wire15 ?
                      wire14 : reg21)))) : (&($signed(wire20[(4'hf):(4'hf)]) ?
                      wire19[(2'h3):(1'h1)] : (|$unsigned(wire12)))));
              reg25 <= $unsigned($signed(wire15));
              reg26 <= $signed(reg21);
            end
        end
      else
        begin
          reg21 <= wire18;
          reg22 <= wire19;
          reg23 <= (!(~(8'ha9)));
        end
      if ({wire16})
        begin
          if (({wire19,
                  ($signed((wire14 ?
                      wire12 : wire12)) == $signed($signed(wire20)))} ?
              (($unsigned(wire16) ?
                  wire20 : (wire12[(2'h2):(1'h0)] ?
                      wire15 : $unsigned(wire16))) <= $unsigned(((reg22 <<< (8'ha7)) ?
                  $signed(wire16) : reg26))) : wire17))
            begin
              reg27 <= wire15[(2'h3):(2'h3)];
            end
          else
            begin
              reg27 <= (reg26 && wire13);
              reg28 <= wire16[(1'h1):(1'h1)];
              reg29 <= (|$unsigned($unsigned($signed(wire18))));
              reg30 <= wire17[(4'h8):(1'h1)];
              reg31 <= {reg22};
            end
          if ($unsigned(reg21[(1'h0):(1'h0)]))
            begin
              reg32 <= {$unsigned(reg31[(1'h0):(1'h0)])};
              reg33 <= {$unsigned(reg32[(3'h7):(3'h4)])};
              reg34 <= (reg23 ?
                  (-$signed(reg23[(2'h2):(1'h0)])) : $signed(reg33[(3'h5):(3'h4)]));
              reg35 <= $signed($signed(reg29));
              reg36 <= ((reg25[(1'h0):(1'h0)] == (~&($signed(reg33) ?
                      reg21 : $signed(reg34)))) ?
                  $signed($signed($signed((&wire18)))) : reg26[(1'h0):(1'h0)]);
            end
          else
            begin
              reg32 <= wire20[(2'h3):(1'h1)];
              reg33 <= reg29[(3'h7):(3'h4)];
            end
          reg37 <= $signed(({reg36,
              $unsigned($signed(wire13))} <= $signed(($signed((8'hb9)) << {wire14,
              reg25}))));
        end
      else
        begin
          reg27 <= (wire14 & ($unsigned($signed((+wire19))) ?
              $signed($unsigned($signed(wire16))) : $signed(reg37)));
          reg28 <= ($signed({{(~|reg29)}}) < $signed((wire13[(1'h0):(1'h0)] ?
              (+$unsigned((8'ha7))) : (-{wire16, (7'h43)}))));
          reg29 <= reg37[(4'h9):(2'h3)];
          reg30 <= (reg36 >>> ($signed(wire19[(2'h3):(2'h2)]) ^ wire19));
          reg31 <= ((+$signed(reg27)) ?
              reg26[(2'h2):(2'h2)] : (&(~^$unsigned(wire14))));
        end
      reg38 <= (($unsigned($signed({reg23, reg22})) ?
          (reg30[(3'h5):(2'h2)] >> ((reg26 ?
              wire17 : reg31) * (-reg27))) : ({reg37,
              (reg24 << reg31)} + (|(wire15 >> (8'ha2))))) ~^ (reg25 ?
          ((^~{(8'haf), reg24}) ?
              $unsigned(reg32) : (wire15[(2'h2):(1'h0)] ~^ (|wire16))) : reg31[(1'h1):(1'h1)]));
    end
  assign wire39 = wire16;
endmodule
