module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire signed [(3'h5):(1'h0)] wire151;
  wire [(4'ha):(1'h0)] wire150;
  wire [(5'h10):(1'h0)] wire149;
  wire signed [(5'h11):(1'h0)] wire147;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire94;
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire5,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire94,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (~|(($signed((^wire2)) ?
                     {wire3[(4'he):(4'hc)]} : wire0) && wire3));
  always
    @(posedge clk) begin
      reg6 <= wire5[(1'h0):(1'h0)];
      reg7 <= ((^wire2) ? wire3 : (&(!$unsigned((wire2 == (8'hb0))))));
    end
  assign wire8 = wire5;
  assign wire9 = ((&(^~(wire1[(1'h1):(1'h0)] ~^ (wire2 ? wire5 : reg7)))) ?
                     $signed(wire2) : wire0);
  assign wire10 = ((((~^(wire9 | (8'hb3))) == $unsigned($unsigned(wire4))) ?
                      {((reg7 ? wire0 : wire5) ?
                              (reg6 ? reg7 : reg6) : {(8'ha7), wire0}),
                          wire9[(4'hb):(3'h6)]} : (~(~&(wire4 ?
                          (7'h42) : wire0)))) | reg6);
  assign wire11 = (~wire3);
  module12 #() modinst95 (wire94, clk, wire10, wire11, wire2, wire3, wire5);
  module96 #() modinst148 (wire147, clk, reg6, wire8, wire11, wire0, wire9);
  assign wire149 = $signed((8'hba));
  assign wire150 = (~$unsigned((((wire3 > wire147) ?
                       (8'hba) : $unsigned(wire3)) & {reg7, (reg6 * wire3)})));
  assign wire151 = (~&$signed((wire11 ?
                       wire150[(1'h0):(1'h0)] : (wire8 ~^ $signed(wire147)))));
  assign wire152 = $signed((&(wire149[(4'hc):(4'h8)] ?
                       $unsigned(wire8) : $unsigned($signed(wire8)))));
  module96 #() modinst154 (.clk(clk), .wire98(reg7), .y(wire153), .wire97(wire147), .wire101(wire8), .wire99(wire3), .wire100(wire5));
endmodule

module module96
#(parameter param145 = (+(-((8'ha3) ? (+{(8'hb3), (8'ha0)}) : (((8'hac) ? (8'hae) : (8'haa)) ? {(8'h9e)} : (|(8'ha2)))))), 
parameter param146 = param145)
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire101;
  input wire signed [(4'hf):(1'h0)] wire100;
  input wire [(5'h12):(1'h0)] wire99;
  input wire signed [(3'h7):(1'h0)] wire98;
  input wire [(4'h9):(1'h0)] wire97;
  wire [(5'h14):(1'h0)] wire144;
  wire signed [(3'h6):(1'h0)] wire143;
  wire signed [(4'hf):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire141;
  wire signed [(3'h7):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire138;
  wire [(3'h4):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire signed [(5'h14):(1'h0)] wire134;
  wire [(2'h2):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire104;
  wire [(5'h15):(1'h0)] wire102;
  reg signed [(5'h10):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  assign y = {wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire134,
                 wire132,
                 wire104,
                 wire102,
                 reg135,
                 reg103,
                 (1'h0)};
  assign wire102 = {wire98[(1'h1):(1'h0)], wire97[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg103 <= $unsigned($unsigned(wire100));
    end
  assign wire104 = $signed(wire97[(2'h3):(1'h1)]);
  module105 #() modinst133 (.wire107(wire98), .wire108(wire101), .clk(clk), .wire109(wire100), .y(wire132), .wire106(wire102));
  assign wire134 = $unsigned(wire104[(3'h7):(3'h4)]);
  always
    @(posedge clk) begin
      reg135 <= (8'hb8);
    end
  assign wire136 = (({((wire102 >= wire99) * (+reg135)),
                           wire132[(1'h1):(1'h1)]} ?
                       $signed($signed((~^wire102))) : (|reg103)) <= {wire132,
                       wire132[(1'h0):(1'h0)]});
  assign wire137 = (reg135[(4'h9):(3'h4)] ?
                       ($unsigned(wire100) ?
                           wire132 : wire99) : $unsigned(wire132[(1'h0):(1'h0)]));
  assign wire138 = wire100;
  assign wire139 = $unsigned($signed(wire97));
  assign wire140 = $unsigned(wire138[(1'h0):(1'h0)]);
  assign wire141 = (wire101[(2'h3):(1'h0)] <<< reg135[(4'h9):(2'h2)]);
  assign wire142 = (wire136[(3'h4):(1'h1)] >= $signed(wire138));
  assign wire143 = {(wire102 & (~(8'hb8))), wire141[(4'he):(4'hd)]};
  assign wire144 = reg135;
endmodule

module module12
#(parameter param92 = (~|(+(^~({(7'h40)} ? {(8'ha4)} : ((8'ha4) <<< (8'hb1)))))), 
parameter param93 = {((param92 ? (-(param92 & param92)) : (((8'ha1) ? param92 : param92) ? param92 : (param92 ^~ param92))) + (((param92 ? param92 : (8'ha0)) ? (~|param92) : ((8'hae) > param92)) | (param92 << {param92, param92})))})
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire58;
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  assign y = {wire91,
                 wire88,
                 wire18,
                 wire19,
                 wire24,
                 wire40,
                 wire58,
                 reg90,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg60,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire18 = (^wire17);
  assign wire19 = ((($signed($signed((8'ha1))) ?
                          (wire16[(4'hc):(3'h5)] - (^wire16)) : (^~(wire17 ?
                              wire15 : wire13))) > ($unsigned($unsigned(wire16)) << $unsigned(wire14))) ?
                      ($unsigned($signed(wire16[(4'hc):(2'h2)])) ?
                          (~&(wire14 ?
                              $unsigned(wire17) : (^~(8'ha9)))) : {$unsigned($unsigned(wire15))}) : wire13[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg20 <= {(8'hab), wire19};
      reg21 <= ($unsigned(reg20) ?
          (+$signed($signed(((8'hb4) <= wire14)))) : (((wire18[(4'h8):(3'h4)] ~^ wire15[(2'h3):(1'h0)]) ?
                  (~$signed((8'hb9))) : $unsigned((~wire13))) ?
              (wire15 ^ ((reg20 >= wire19) ?
                  $unsigned(wire19) : (reg20 - wire18))) : (wire14[(1'h0):(1'h0)] | (8'hb0))));
      reg22 <= wire18[(1'h0):(1'h0)];
      reg23 <= $unsigned((wire13 | wire19));
    end
  assign wire24 = ($unsigned((+reg22)) & $signed($unsigned(($signed(wire18) ?
                      (wire14 && reg20) : reg23[(3'h4):(1'h0)]))));
  always
    @(posedge clk) begin
      reg25 <= (wire15[(3'h6):(2'h2)] ?
          wire19[(2'h2):(1'h1)] : $signed(reg23[(1'h1):(1'h0)]));
      if ($unsigned($signed((8'hb8))))
        begin
          if (wire17)
            begin
              reg26 <= $unsigned($unsigned(wire13));
              reg27 <= $unsigned($signed($signed((~&{wire17, reg23}))));
              reg28 <= $signed(($unsigned($signed((+wire18))) ?
                  wire19 : $unsigned($signed(reg25[(4'he):(4'h9)]))));
              reg29 <= (~|$signed(((wire14 ? $unsigned(reg28) : (&(8'ha0))) ?
                  reg21[(4'he):(4'hc)] : $signed($unsigned(wire15)))));
              reg30 <= $unsigned((^$signed({$unsigned((8'hb2)),
                  wire17[(4'hb):(3'h4)]})));
            end
          else
            begin
              reg26 <= (+(((8'hbf) == $signed($signed(reg20))) ?
                  ($unsigned((reg28 ?
                      wire14 : wire19)) && ((-wire16) >= (reg23 || reg22))) : ({reg29,
                      (reg25 ? reg26 : wire14)} ^ (|(^~reg28)))));
              reg27 <= wire15;
              reg28 <= $signed($signed($unsigned($unsigned($unsigned(reg27)))));
            end
        end
      else
        begin
          reg26 <= (8'ha9);
          if ((wire24 ?
              ((reg25 ?
                  (wire19 >> wire17) : reg22) >>> (~$signed(wire13))) : (+$unsigned(reg20))))
            begin
              reg27 <= {{($unsigned($signed(wire15)) | (~|(reg23 ?
                          (8'ha8) : reg21)))}};
              reg28 <= ($signed((reg26 ?
                  $unsigned($unsigned(reg25)) : ({reg23} ?
                      (wire17 < wire19) : (8'hac)))) >> reg20[(2'h2):(2'h2)]);
              reg29 <= (wire24[(3'h4):(1'h0)] ?
                  reg30 : $unsigned((reg26[(3'h6):(3'h5)] ?
                      {$signed(wire18)} : reg23[(3'h4):(2'h2)])));
            end
          else
            begin
              reg27 <= wire24;
              reg28 <= $unsigned($unsigned((|(reg26[(3'h7):(1'h1)] ?
                  (~reg23) : (reg30 ? (8'haf) : reg25)))));
              reg29 <= (reg23 ?
                  reg29[(5'h12):(3'h5)] : $signed((($signed(reg28) * (wire14 ?
                      reg28 : reg27)) <= wire19)));
              reg30 <= $signed(($unsigned(reg23[(2'h3):(1'h0)]) || ({(^~wire14)} ?
                  reg25 : ((wire24 * wire24) ? {wire14, (7'h42)} : wire14))));
            end
          if ($signed(reg29[(4'hb):(1'h0)]))
            begin
              reg31 <= reg23[(1'h1):(1'h1)];
              reg32 <= reg26[(4'ha):(1'h0)];
              reg33 <= (reg27[(3'h5):(1'h1)] ?
                  (~&$signed(((reg23 ~^ (8'hae)) >>> $signed(wire16)))) : $unsigned(((~reg28[(3'h7):(3'h5)]) ?
                      (~&reg31) : {$unsigned(reg26)})));
              reg34 <= $unsigned(wire24);
              reg35 <= {wire14[(1'h0):(1'h0)],
                  {$unsigned(({reg30} >= (~&wire15)))}};
            end
          else
            begin
              reg31 <= reg33[(5'h13):(2'h3)];
              reg32 <= wire17[(4'ha):(2'h3)];
              reg33 <= $signed($unsigned(($unsigned(reg20[(1'h0):(1'h0)]) ?
                  ($unsigned(reg21) ?
                      (reg25 != reg30) : (reg33 <<< reg28)) : reg28)));
              reg34 <= wire13[(2'h3):(1'h1)];
            end
          if (($signed(reg28[(4'hb):(3'h6)]) >= wire15[(4'hb):(1'h0)]))
            begin
              reg36 <= {wire16, $unsigned(reg30)};
              reg37 <= (^~reg27[(2'h2):(2'h2)]);
            end
          else
            begin
              reg36 <= wire18;
              reg37 <= reg37[(1'h0):(1'h0)];
              reg38 <= reg33;
            end
          reg39 <= (-((($signed(reg22) ? {reg33} : wire16) ?
                  (^~reg37[(2'h2):(2'h2)]) : (wire15[(4'hb):(4'h8)] ?
                      {reg34} : (~reg35))) ?
              ($unsigned($signed(wire24)) << ((reg38 ?
                  reg38 : (8'hb5)) - (reg35 << wire15))) : reg34));
        end
    end
  assign wire40 = (|wire24);
  module41 #() modinst59 (.clk(clk), .wire46(reg29), .y(wire58), .wire44(reg35), .wire45(wire15), .wire42(reg28), .wire43(reg27));
  always
    @(posedge clk) begin
      reg60 <= reg31;
      reg61 <= reg25[(5'h11):(4'he)];
      reg62 <= {(^~$signed($unsigned((reg61 ? wire19 : reg60))))};
    end
  module63 #() modinst89 (wire88, clk, reg32, reg22, reg35, wire16, wire40);
  always
    @(posedge clk) begin
      reg90 <= $unsigned(reg37[(3'h6):(2'h3)]);
    end
  assign wire91 = (reg21[(4'he):(2'h2)] ?
                      reg29 : ((~&$unsigned((~wire17))) ?
                          wire15 : $signed((!reg37[(1'h0):(1'h0)]))));
endmodule

module module63  (y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire68;
  input wire [(4'hd):(1'h0)] wire67;
  input wire signed [(5'h15):(1'h0)] wire66;
  input wire signed [(5'h10):(1'h0)] wire65;
  input wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire [(4'h8):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(4'he):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  reg [(3'h5):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire78,
                 wire71,
                 wire70,
                 wire69,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire69 = {{$unsigned(wire66)}};
  assign wire70 = wire64;
  assign wire71 = (|$unsigned(((~{wire66}) ?
                      ((wire65 < wire66) ?
                          wire64 : {wire69}) : $signed((|wire65)))));
  always
    @(posedge clk) begin
      if ((((-{$signed(wire69)}) ?
          ((~wire69[(2'h2):(2'h2)]) ?
              {wire69} : (-(wire64 ^ wire67))) : (&(!(wire69 < wire68)))) & (7'h44)))
        begin
          reg72 <= $unsigned({(^~wire67),
              $unsigned($unsigned(wire64[(2'h2):(2'h2)]))});
        end
      else
        begin
          reg72 <= ({wire68} && (({(wire66 ? wire64 : wire67)} ?
              wire67 : reg72) * ($signed($signed(wire70)) ?
              (&(wire68 - wire66)) : wire68[(3'h7):(3'h4)])));
          reg73 <= (&((reg72[(3'h4):(1'h0)] ?
                  $signed((wire70 ? wire68 : wire66)) : wire68) ?
              $signed($signed({wire70, wire70})) : (wire69[(5'h13):(3'h7)] ?
                  (^~(-wire64)) : (reg72[(1'h1):(1'h0)] << $signed(wire70)))));
          reg74 <= (wire68[(3'h4):(3'h4)] <<< (wire71 ?
              ((reg73 ?
                  $unsigned(reg72) : (reg73 ?
                      reg73 : (8'hb0))) - (8'hbd)) : (-($signed(wire70) ?
                  {wire66} : (^wire68)))));
          reg75 <= (-(8'hbf));
        end
      reg76 <= $unsigned(wire68);
      reg77 <= (^($signed({wire67, {reg73, reg73}}) <= ({(reg73 ?
              wire68 : reg75)} == (~|(~&wire65)))));
    end
  assign wire78 = reg74;
  always
    @(posedge clk) begin
      reg79 <= wire66;
      if (reg72[(3'h7):(2'h2)])
        begin
          reg80 <= $unsigned(((^~$signed(wire65)) ^ $signed(reg75[(1'h0):(1'h0)])));
        end
      else
        begin
          reg80 <= reg76[(4'ha):(3'h7)];
          reg81 <= ((^$unsigned(((&wire69) - (~|wire67)))) || ((~&(~&(~|wire68))) ?
              $signed(reg80) : $unsigned((wire71[(3'h5):(1'h0)] ?
                  (reg77 ^ (8'ha9)) : {reg77}))));
        end
      reg82 <= $unsigned($unsigned(reg80[(5'h11):(5'h11)]));
      reg83 <= (~^(wire71 ~^ $signed($unsigned((reg79 ? reg76 : reg73)))));
    end
  assign wire84 = (~|((^~reg73[(4'hc):(1'h0)]) <<< ($unsigned(reg80) ?
                      $unsigned($unsigned(reg82)) : ($unsigned(reg77) ?
                          $unsigned(reg77) : ((8'hbb) - wire70)))));
  assign wire85 = $signed(wire67);
  assign wire86 = $signed(({($signed(reg75) >= wire64), reg83} ?
                      ($signed((wire64 ? wire84 : wire71)) ?
                          wire68[(4'h9):(3'h6)] : ((7'h42) ?
                              $signed(reg75) : $unsigned(wire85))) : $signed(({wire67} >= reg73))));
  assign wire87 = (^(wire66 & {$signed(wire86[(1'h0):(1'h0)])}));
endmodule

module module41
#(parameter param57 = (8'ha4))
(y, clk, wire46, wire45, wire44, wire43, wire42);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire46;
  input wire [(3'h6):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(4'hd):(1'h0)] wire43;
  input wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire [(4'he):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 (1'h0)};
  assign wire47 = $signed(($unsigned((wire43[(2'h3):(1'h0)] ?
                      ((8'hac) && wire43) : wire46)) ^~ (((wire46 > wire45) ^ (wire43 <= wire42)) + ($signed(wire44) ?
                      $unsigned(wire44) : $unsigned(wire43)))));
  assign wire48 = $unsigned(((((8'hb0) <<< $unsigned((8'hba))) ?
                          wire45 : $unsigned(wire47[(4'hb):(3'h4)])) ?
                      (($signed(wire45) ?
                              wire44[(1'h1):(1'h0)] : $signed(wire46)) ?
                          wire47[(4'he):(4'hb)] : wire46[(2'h3):(1'h0)]) : ((wire42 ^~ $signed(wire42)) && ($signed(wire47) ?
                          {wire46} : (wire45 ^ wire46)))));
  assign wire49 = wire48;
  assign wire50 = {$unsigned($unsigned((^$signed(wire45)))),
                      $signed({(((8'hb6) - wire43) ? (|wire44) : {wire43}),
                          (+wire44[(1'h1):(1'h0)])})};
  assign wire51 = $signed(wire42);
  assign wire52 = wire49;
  assign wire53 = $signed($signed({$unsigned(wire45)}));
  assign wire54 = (((($unsigned(wire47) + $signed(wire44)) ?
                          (^~(wire47 ?
                              wire47 : wire48)) : (wire46[(2'h2):(1'h1)] ?
                              $signed(wire46) : ((8'hb9) && (8'hbb)))) < wire52[(3'h5):(3'h4)]) ?
                      ($unsigned($signed($signed(wire50))) ^~ wire47[(2'h2):(1'h1)]) : wire50[(4'h8):(1'h1)]);
  assign wire55 = {$unsigned(wire43[(4'ha):(4'ha)]),
                      $unsigned($signed($unsigned($signed((8'hbd)))))};
  assign wire56 = $signed((~&{(+wire51), ({(8'ha3)} ^~ $unsigned(wire48))}));
endmodule

module module105  (y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire109;
  input wire [(5'h10):(1'h0)] wire108;
  input wire [(2'h3):(1'h0)] wire107;
  input wire signed [(4'hb):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire130;
  wire signed [(4'hf):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire126;
  wire [(4'h8):(1'h0)] wire125;
  wire [(4'ha):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire111;
  wire [(4'h8):(1'h0)] wire110;
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire110 = ({(~(~((7'h43) ? (8'ha6) : (8'hb4)))),
                           wire108[(4'hc):(2'h3)]} ?
                       $signed($signed((((8'hbd) ? wire108 : (8'hbb)) ?
                           (+(8'hb6)) : (~&wire106)))) : {wire107[(1'h1):(1'h1)],
                           wire106});
  assign wire111 = wire108;
  assign wire112 = $signed(((wire110 ?
                           $unsigned((wire107 ? wire109 : wire106)) : wire106) ?
                       $unsigned((~&$signed(wire106))) : wire110[(3'h6):(3'h6)]));
  assign wire113 = wire112[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg114 <= ($signed((({wire112, wire109} <= (8'ha1)) ?
          ($unsigned((8'hb9)) ?
              wire113 : (wire110 >> wire108)) : wire109)) << ((((^~(8'hb9)) - $signed(wire112)) && wire110[(1'h0):(1'h0)]) <= (+(^~{wire111,
          wire109}))));
      reg115 <= ((($unsigned(wire111) ?
              (~(wire109 ?
                  wire110 : wire107)) : wire111) >> $unsigned((reg114[(3'h5):(1'h1)] <<< {wire108}))) ?
          ($signed(wire109[(2'h3):(2'h3)]) ?
              wire109 : (+wire111[(1'h1):(1'h1)])) : {$unsigned(((wire107 ?
                      wire107 : wire108) ?
                  (^~wire113) : $signed(wire111)))});
      reg116 <= reg114;
      if ($unsigned($signed(reg114[(5'h14):(3'h7)])))
        begin
          if ($signed({wire107[(2'h3):(2'h2)]}))
            begin
              reg117 <= {wire110};
              reg118 <= (^((($unsigned(reg117) ?
                  wire110[(3'h6):(2'h2)] : (8'ha5)) << $unsigned($unsigned((8'ha2)))) > $unsigned($unsigned($signed(wire113)))));
              reg119 <= (8'hb9);
              reg120 <= wire112[(3'h4):(1'h1)];
            end
          else
            begin
              reg117 <= wire106;
              reg118 <= wire108;
            end
          reg121 <= (($signed($signed(((8'ha6) & (8'h9c)))) > ({((8'hb7) ?
                      reg114 : wire106)} && (|wire109[(4'ha):(4'ha)]))) ?
              wire112 : ({reg117} << $unsigned(($unsigned(reg115) | $signed(wire113)))));
          reg122 <= ($signed((wire110[(1'h0):(1'h0)] ?
              $unsigned(((8'hb2) && wire106)) : (wire108[(3'h5):(2'h3)] << {reg120}))) + $unsigned((wire108 ?
              wire113 : reg114[(4'hc):(2'h3)])));
          reg123 <= $signed((&$unsigned((8'haf))));
        end
      else
        begin
          reg117 <= (((((reg118 <<< (8'hb5)) ?
                  (reg118 ?
                      (8'ha6) : wire109) : reg119) >>> {(wire106 <= reg116)}) > reg118) ?
              (reg122 ?
                  $signed($signed(((8'hab) ^~ (8'hab)))) : (+wire107[(1'h0):(1'h0)])) : (~|$unsigned((!$signed(wire107)))));
          reg118 <= ($signed($signed(wire110)) ?
              wire109 : (-(reg117[(3'h6):(3'h6)] == {reg117[(1'h1):(1'h0)]})));
        end
      reg124 <= ($unsigned($signed(reg114[(1'h0):(1'h0)])) != $unsigned(($signed({reg116}) ?
          ((reg118 ? reg121 : wire113) >> reg115[(3'h7):(3'h4)]) : wire111)));
    end
  assign wire125 = $signed(((wire109 ?
                           $signed((reg116 ^~ wire113)) : (+wire113)) ?
                       $signed($signed(wire107)) : $unsigned((~$unsigned(reg118)))));
  assign wire126 = reg119;
  assign wire127 = (((({wire110,
                       reg123} + (reg120 << reg116)) | $unsigned({wire111})) && (reg119[(4'ha):(2'h2)] ?
                       $unsigned({wire112,
                           wire112}) : reg118)) || ($signed((reg121[(1'h0):(1'h0)] ^ wire107)) ^ $unsigned($signed((!reg116)))));
  assign wire128 = {{(^~$signed($unsigned(reg116)))}};
  assign wire129 = $unsigned(($unsigned({(reg121 ^ wire127),
                           $signed((8'hbc))}) ?
                       (-{$signed(reg122),
                           (^~reg118)}) : ((~|reg121) ^ wire108[(3'h6):(3'h5)])));
  assign wire130 = $unsigned($unsigned($unsigned(wire106[(3'h7):(1'h1)])));
  assign wire131 = reg124;
endmodule
