module top
#(parameter param150 = (({(((7'h44) ? (8'h9e) : (7'h43)) <= {(8'hb6), (8'hbd)})} > ((^~((8'hb9) <= (8'hbe))) ? {(8'hb7), (~(8'hb0))} : (|(!(8'hbb))))) || (^~{((~|(8'ha1)) > ((7'h40) ? (7'h43) : (8'h9f)))})), 
parameter param151 = param150)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire149;
  wire [(4'hb):(1'h0)] wire148;
  wire [(5'h12):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire142;
  wire signed [(2'h3):(1'h0)] wire141;
  wire [(3'h6):(1'h0)] wire140;
  wire signed [(5'h13):(1'h0)] wire139;
  wire signed [(3'h6):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire105,
                 wire37,
                 wire35,
                 wire7,
                 wire6,
                 wire5,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 (1'h0)};
  assign wire5 = wire3;
  assign wire6 = wire3;
  assign wire7 = (|wire5);
  module8 #() modinst36 (wire35, clk, wire5, wire7, wire1, wire0);
  assign wire37 = wire6;
  always
    @(posedge clk) begin
      reg38 <= ($unsigned($signed((wire2 ?
              $unsigned(wire2) : (wire0 >= wire6)))) ?
          $signed((~^wire5[(4'h8):(4'h8)])) : {((&wire4) ?
                  wire37 : ((wire2 ? wire7 : wire4) ?
                      $unsigned(wire6) : $unsigned(wire6)))});
      reg39 <= (|reg38);
      reg40 <= $signed((~^$unsigned(((~|wire3) ^~ $signed(wire3)))));
      reg41 <= $unsigned((+$signed($unsigned((wire37 ? (8'hbd) : wire37)))));
    end
  module42 #() modinst106 (.wire47(wire4), .clk(clk), .wire44(wire2), .wire45(reg41), .wire43(wire35), .wire46(wire5), .y(wire105));
  module107 #() modinst137 (.wire109(wire37), .wire111(wire7), .y(wire136), .wire110(reg40), .clk(clk), .wire108(reg38));
  assign wire138 = wire6[(3'h7):(1'h0)];
  assign wire139 = {$unsigned((((8'ha9) ?
                           (&wire3) : $signed(wire105)) >= ($unsigned(wire5) & $signed(wire5))))};
  assign wire140 = wire7;
  assign wire141 = {(^~$unsigned(reg39[(5'h11):(1'h1)]))};
  assign wire142 = wire2[(3'h4):(1'h0)];
  assign wire143 = ((-$unsigned(reg40[(3'h6):(2'h3)])) | wire140);
  always
    @(posedge clk) begin
      reg144 <= {(wire6 ?
              (($unsigned(wire6) & ((8'ha4) && wire143)) ?
                  ((wire139 ? wire2 : wire141) ~^ (reg40 ?
                      reg40 : wire35)) : $signed({wire6, wire5})) : wire140),
          $unsigned($signed(($signed(wire6) != $signed((8'ha5)))))};
      reg145 <= (~|($signed($signed(wire1[(5'h10):(4'hd)])) <<< $signed({$unsigned(wire138),
          {wire2, wire1}})));
      reg146 <= $unsigned($signed($signed(wire136)));
      reg147 <= wire0[(4'hd):(4'hd)];
    end
  assign wire148 = (((^~($unsigned(reg146) ?
                           (wire1 ?
                               wire7 : wire139) : wire7[(1'h0):(1'h0)])) < reg147[(5'h12):(3'h5)]) ?
                       ((wire37[(3'h7):(3'h7)] ?
                           wire136 : wire139[(5'h12):(4'he)]) & wire139) : ((wire143 ?
                           $signed((wire136 ?
                               wire37 : reg39)) : (wire140[(3'h5):(2'h2)] ?
                               wire7 : wire1)) <= reg144[(1'h0):(1'h0)]));
  assign wire149 = wire7;
endmodule

module module107
#(parameter param135 = {(7'h40)})
(y, clk, wire111, wire110, wire109, wire108);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire111;
  input wire [(4'hd):(1'h0)] wire110;
  input wire signed [(4'hd):(1'h0)] wire109;
  input wire signed [(3'h6):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire134;
  wire signed [(4'hc):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire124;
  wire signed [(3'h6):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  wire [(4'hc):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg [(4'hb):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  assign y = {wire134,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire113,
                 wire112,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire112 = $signed(wire111[(3'h5):(3'h5)]);
  assign wire113 = ($signed(wire108[(3'h4):(2'h2)]) < $unsigned($unsigned((~&{wire108,
                       wire109}))));
  always
    @(posedge clk) begin
      reg114 <= (wire108 >= wire110[(4'h9):(3'h6)]);
      reg115 <= (|$signed((~(((8'h9e) <= (8'hb4)) ?
          (8'hac) : $signed((8'hbf))))));
      reg116 <= {(+wire108)};
      reg117 <= wire109[(4'hd):(3'h5)];
    end
  assign wire118 = (wire108[(1'h0):(1'h0)] >= $signed(wire113));
  assign wire119 = ($unsigned(wire109) ?
                       $unsigned({((wire108 && (8'ha1)) ?
                               reg114 : wire112)}) : {($unsigned($unsigned((7'h42))) >= (~|(~^wire109)))});
  assign wire120 = reg116;
  assign wire121 = $signed((-{wire111[(1'h1):(1'h1)]}));
  assign wire122 = (~&reg116[(1'h0):(1'h0)]);
  assign wire123 = ($signed($unsigned(wire110)) ?
                       $signed((~|wire113)) : ((~^$unsigned(((7'h43) ?
                           reg114 : (8'hb9)))) - wire120[(3'h4):(2'h2)]));
  assign wire124 = wire112[(4'h8):(3'h6)];
  assign wire125 = (wire111 >> $signed(({wire118} < $unsigned($unsigned(wire112)))));
  always
    @(posedge clk) begin
      reg126 <= wire121[(5'h14):(4'h9)];
      reg127 <= wire120;
      reg128 <= wire122[(3'h4):(2'h3)];
      reg129 <= ((($unsigned((+reg116)) >> wire120) << ($unsigned((8'hbc)) ?
              reg117 : $unsigned({wire109, wire125}))) ?
          ({((^wire113) ? wire108[(1'h1):(1'h0)] : wire109)} ?
              wire112[(3'h4):(3'h4)] : {wire119}) : $unsigned((($unsigned(wire113) ?
                  $signed(reg114) : {wire124, reg127}) ?
              $signed(wire113[(2'h3):(2'h2)]) : ({wire118} ?
                  ((8'hab) ? reg114 : wire112) : (|wire125)))));
    end
  always
    @(posedge clk) begin
      reg130 <= (&$signed((({reg114, wire119} ?
          $unsigned(wire122) : (8'ha0)) || $signed((reg117 ?
          reg114 : wire111)))));
      reg131 <= (wire122 >= $unsigned((~(8'hac))));
      reg132 <= reg131;
      reg133 <= (($unsigned((~^wire122)) == $signed($unsigned((wire123 + reg126)))) ?
          {$signed({$signed((8'hbc))})} : ({wire120} - reg130[(4'hc):(4'ha)]));
    end
  assign wire134 = reg133[(1'h0):(1'h0)];
endmodule

module module42
#(parameter param103 = (((({(8'had)} ? ((8'ha2) ? (7'h44) : (8'ha7)) : ((8'ha6) ? (8'ha5) : (8'h9f))) > {((8'hb6) ? (8'hac) : (7'h43)), (|(8'hb7))}) ? (&(~(|(8'hb0)))) : {(+((8'h9c) + (8'h9c)))}) ? (~^((~^(^~(8'h9c))) ? (+((7'h42) + (8'ha1))) : {((8'hbd) ^~ (8'ha8))})) : ((((~(8'hb2)) == (-(8'ha9))) ? ({(8'hb6)} > ((8'hbe) ? (8'ha8) : (8'hb8))) : (-{(8'ha7), (8'hac)})) ^ {({(7'h41), (8'ha3)} && (^~(8'ha2)))})), 
parameter param104 = (~|(((8'ha9) ? ((param103 ? param103 : (8'hb6)) ? (!param103) : (param103 ^ param103)) : {(~param103), {param103, (8'hba)}}) ? (8'hb2) : {((~^param103) | (-param103)), {(param103 >>> param103)}})))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire47;
  input wire signed [(5'h14):(1'h0)] wire46;
  input wire signed [(4'hc):(1'h0)] wire45;
  input wire signed [(2'h3):(1'h0)] wire44;
  input wire [(5'h10):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  assign y = {wire102,
                 wire100,
                 wire87,
                 wire86,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 (1'h0)};
  assign wire48 = {$signed(wire43)};
  assign wire49 = $signed(wire43[(3'h6):(1'h0)]);
  assign wire50 = wire49[(4'ha):(2'h2)];
  assign wire51 = ({($signed(wire46) ?
                              wire46 : ((wire49 ?
                                  wire50 : wire46) == $unsigned(wire49)))} ?
                      ((^((wire48 - wire46) ? (wire47 + wire49) : wire48)) ?
                          wire48[(3'h5):(1'h0)] : $signed($signed($signed(wire47)))) : $unsigned({(8'ha9),
                          $unsigned($unsigned(wire45))}));
  assign wire52 = $unsigned((&wire45));
  assign wire53 = ({((-wire47) ?
                              $signed($unsigned(wire52)) : $unsigned((wire49 == (8'haa))))} ?
                      wire51 : wire51[(2'h3):(1'h0)]);
  assign wire54 = wire45;
  module55 #() modinst73 (.clk(clk), .wire57(wire43), .wire58(wire47), .y(wire72), .wire56(wire52), .wire59(wire48));
  assign wire74 = (8'hb3);
  assign wire75 = (&$signed((!$unsigned((7'h40)))));
  assign wire76 = (!($unsigned($signed($signed(wire54))) || $unsigned(wire74[(2'h3):(1'h1)])));
  assign wire77 = wire52[(2'h2):(1'h0)];
  assign wire78 = (~|$signed(wire77));
  always
    @(posedge clk) begin
      if ($signed(((^~wire53[(4'h8):(3'h7)]) ?
          $signed($unsigned(wire72)) : (-wire77))))
        begin
          reg79 <= $unsigned($signed($unsigned(((&wire52) ?
              (wire50 ? wire75 : (8'hac)) : wire76))));
          reg80 <= wire72[(1'h1):(1'h0)];
        end
      else
        begin
          reg79 <= $signed(wire47[(4'h8):(1'h1)]);
          if ($unsigned($unsigned($unsigned(({wire44} + $unsigned(wire51))))))
            begin
              reg80 <= (wire75[(2'h3):(1'h0)] >= $signed($unsigned($unsigned((~|(7'h44))))));
              reg81 <= wire47;
              reg82 <= (~wire75[(3'h7):(3'h4)]);
              reg83 <= ($unsigned(wire43[(3'h7):(3'h7)]) ^~ (&$signed(reg82)));
              reg84 <= reg82;
            end
          else
            begin
              reg80 <= wire54;
              reg81 <= ((reg81 ?
                  $unsigned($signed($signed(wire49))) : (~(wire49 ?
                      ((8'hba) ^ reg79) : wire77))) ^ (~(|wire44[(1'h1):(1'h1)])));
              reg82 <= wire43[(1'h1):(1'h0)];
            end
          reg85 <= ((8'hb0) >>> reg83[(2'h2):(1'h1)]);
        end
    end
  assign wire86 = wire46[(3'h4):(2'h3)];
  assign wire87 = ((($unsigned($unsigned(wire78)) <= (~wire53)) * (~|((^~wire54) >> $unsigned(reg81)))) ?
                      wire74 : (-(~((~|wire45) | $signed(wire72)))));
  module88 #() modinst101 (.y(wire100), .wire92(wire51), .wire89(reg80), .wire91(wire43), .wire93(wire77), .wire90(wire74), .clk(clk));
  assign wire102 = (~|$unsigned(wire44[(2'h2):(2'h2)]));
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(5'h11):(1'h0)] wire13;
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
  assign wire13 = (!$signed(($unsigned(wire11[(3'h7):(3'h7)]) ?
                      $signed((wire11 ?
                          wire10 : wire10)) : $unsigned({wire12}))));
  assign wire14 = $unsigned(wire10);
  assign wire15 = wire9;
  assign wire16 = (-wire10[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      reg17 <= $signed(wire9[(2'h2):(1'h0)]);
      reg18 <= wire14;
      reg19 <= $unsigned(($unsigned(wire13[(2'h3):(1'h0)]) && $unsigned((wire16 ?
          (wire11 ? wire11 : (8'ha4)) : (~&wire9)))));
      reg20 <= $signed($signed($signed({(~|wire16), (+(7'h42))})));
      if ({$unsigned((wire11[(1'h1):(1'h1)] && $signed($unsigned(wire12)))),
          wire11[(3'h4):(1'h0)]})
        begin
          reg21 <= (^~reg19[(4'hd):(1'h0)]);
          reg22 <= (8'hb9);
          reg23 <= ($signed((+$unsigned({wire11, (7'h41)}))) ?
              reg21 : $signed($signed(wire10)));
        end
      else
        begin
          if (reg21)
            begin
              reg21 <= $signed(($signed((wire9 ?
                      $signed(reg20) : $signed(wire11))) ?
                  (^~$signed($signed(reg22))) : wire14));
              reg22 <= reg23[(4'h9):(3'h7)];
              reg23 <= {$signed($unsigned(($signed(wire11) - (|wire14)))),
                  (-$signed(wire15))};
            end
          else
            begin
              reg21 <= {{(~reg18)}};
              reg22 <= (($signed(wire13[(4'hf):(2'h3)]) >= reg18[(4'hc):(4'hb)]) ?
                  $signed((^~((wire14 < reg20) ?
                      {wire12, reg19} : $signed(wire10)))) : (8'hbe));
              reg23 <= wire11;
              reg24 <= ((((!(8'ha2)) ?
                  ($signed(reg22) ?
                      ((8'hbe) ?
                          reg17 : wire10) : wire13[(4'hf):(1'h1)]) : {(|wire16),
                      {(8'ha6)}}) >= {(~$unsigned(reg21)),
                  reg20[(4'hf):(4'hc)]}) - (((8'ha2) ?
                      (~|(reg19 << wire10)) : $signed((~&wire10))) ?
                  wire14[(4'ha):(1'h0)] : (((wire13 ? reg21 : (8'hac)) ?
                          $unsigned((8'hb9)) : $unsigned(reg20)) ?
                      $unsigned((^reg19)) : $signed($unsigned(wire9)))));
              reg25 <= reg18;
            end
          if ((((((reg19 - (8'hb6)) >> $signed(reg18)) ?
                  $signed((reg23 ? reg20 : reg22)) : reg22[(2'h2):(1'h1)]) ?
              reg17 : ({(reg24 & reg25)} ?
                  (^$unsigned(reg23)) : $unsigned(reg24))) > ($signed(wire9[(4'ha):(4'ha)]) == reg23)))
            begin
              reg26 <= wire11;
              reg27 <= (~|{$unsigned($signed({(8'hbd), (8'ha2)})),
                  (wire11[(1'h0):(1'h0)] << (~^reg20[(5'h12):(2'h2)]))});
              reg28 <= reg25;
              reg29 <= reg25;
            end
          else
            begin
              reg26 <= $signed({$signed((((8'ha1) >>> reg22) & reg20[(4'ha):(3'h5)])),
                  $unsigned($unsigned($signed(wire15)))});
              reg27 <= ($signed((!(reg28[(3'h6):(2'h2)] ?
                  $unsigned(wire16) : (reg19 + reg17)))) && $signed(reg18[(4'ha):(4'h8)]));
              reg28 <= ((~&reg21[(4'h9):(3'h6)]) ?
                  {reg29} : $unsigned($signed(reg26)));
              reg29 <= reg25;
            end
        end
    end
  always
    @(posedge clk) begin
      reg30 <= $unsigned(($unsigned(reg24[(2'h2):(2'h2)]) ? reg18 : reg25));
      reg31 <= ((^{wire9[(5'h12):(3'h5)],
              (wire12[(4'hb):(2'h2)] ?
                  (wire12 ? wire15 : wire14) : $unsigned(reg19))}) ?
          (reg30 - reg22) : $unsigned((reg23[(3'h4):(1'h0)] && wire10)));
    end
  assign wire32 = (8'ha2);
  assign wire33 = $unsigned(wire13[(3'h7):(3'h6)]);
  assign wire34 = wire14[(4'hc):(4'hb)];
endmodule

module module88
#(parameter param99 = (^(((-((8'hb3) ? (8'ha4) : (8'hae))) ? {((8'h9d) ? (7'h41) : (8'ha0))} : (8'ha1)) ? (~((|(8'hb9)) <<< {(8'hac)})) : (+(^((7'h43) == (8'ha0)))))))
(y, clk, wire93, wire92, wire91, wire90, wire89);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire93;
  input wire signed [(3'h4):(1'h0)] wire92;
  input wire [(5'h10):(1'h0)] wire91;
  input wire signed [(5'h13):(1'h0)] wire90;
  input wire signed [(4'h8):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire96;
  wire signed [(3'h7):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  assign y = {wire98, wire96, wire95, wire94, reg97, (1'h0)};
  assign wire94 = ((&wire89[(3'h6):(3'h4)]) ?
                      {wire89} : (wire92[(1'h0):(1'h0)] ?
                          (&wire92[(2'h2):(1'h0)]) : $unsigned(wire90[(3'h4):(3'h4)])));
  assign wire95 = wire90[(5'h10):(1'h0)];
  assign wire96 = wire92;
  always
    @(posedge clk) begin
      reg97 <= ((wire95 | (wire94[(1'h1):(1'h0)] ^~ $unsigned((~|wire96)))) ?
          $signed($signed({wire93,
              wire89})) : ($unsigned(wire92[(2'h3):(2'h3)]) + $signed(wire93)));
    end
  assign wire98 = $signed((&(reg97[(2'h2):(2'h2)] - (7'h41))));
endmodule

module module55
#(parameter param71 = (^(((((8'ha4) && (8'hb7)) * (^(8'ha2))) << ({(8'ha9), (8'hbd)} ~^ ((7'h44) ? (8'hba) : (7'h41)))) ? ((8'hb0) ? ({(8'had)} < {(8'h9f), (7'h42)}) : ((~&(8'hb6)) ^ (~&(7'h41)))) : {{((8'h9e) * (8'hb4)), (~(8'h9d))}, ((!(8'hb4)) - {(8'hb5)})})))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire59;
  input wire [(4'h9):(1'h0)] wire58;
  input wire [(5'h10):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire [(4'hd):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  assign y = {wire70,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire60 = $unsigned($signed($unsigned(wire58)));
  assign wire61 = (^~$unsigned($unsigned((wire60[(4'h8):(1'h1)] >= wire58))));
  assign wire62 = (wire56 ?
                      (~^$unsigned(wire58[(1'h0):(1'h0)])) : ({$unsigned($unsigned(wire58))} ?
                          wire60[(2'h3):(1'h1)] : wire60));
  assign wire63 = $signed($unsigned((~|($signed(wire62) == wire57[(1'h0):(1'h0)]))));
  assign wire64 = (wire59[(3'h4):(2'h2)] ?
                      wire58[(1'h1):(1'h1)] : wire61[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg65 <= wire61[(3'h7):(1'h0)];
      reg66 <= wire61[(2'h3):(2'h3)];
      reg67 <= (wire57[(3'h6):(3'h5)] ~^ {wire60});
      reg68 <= ($signed((~^(8'ha2))) ?
          (8'ha5) : $unsigned(($signed({wire57, wire58}) ?
              wire60[(5'h10):(3'h5)] : (wire59 ?
                  $signed(wire59) : $signed(wire59)))));
      reg69 <= $signed(($signed($unsigned($unsigned(wire64))) * wire62));
    end
  assign wire70 = (($unsigned($signed(wire60)) ?
                      {((reg66 ^ (8'hb3)) ?
                              (reg67 ?
                                  (8'hbb) : reg66) : wire59)} : $signed($unsigned($signed(reg67)))) || (+wire63[(3'h6):(3'h5)]));
endmodule
