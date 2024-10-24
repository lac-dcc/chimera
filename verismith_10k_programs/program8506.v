module top
#(parameter param164 = {{({{(8'ha9), (8'ha2)}} >> (((8'hbd) == (8'hb9)) * (!(7'h42))))}})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire163;
  wire signed [(4'ha):(1'h0)] wire162;
  wire signed [(2'h3):(1'h0)] wire161;
  wire signed [(4'h9):(1'h0)] wire160;
  wire [(2'h3):(1'h0)] wire159;
  wire [(5'h10):(1'h0)] wire158;
  wire signed [(4'hd):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire154;
  wire signed [(4'hc):(1'h0)] wire155;
  wire [(5'h15):(1'h0)] wire156;
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  assign y = {wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire152,
                 wire5,
                 wire75,
                 wire154,
                 wire155,
                 wire156,
                 reg77,
                 (1'h0)};
  assign wire5 = wire4;
  module6 #() modinst76 (wire75, clk, wire1, wire2, wire0, wire3, wire4);
  always
    @(posedge clk) begin
      reg77 <= $unsigned((wire2 ? wire5[(4'he):(3'h7)] : $signed((|wire1))));
    end
  module78 #() modinst153 (.wire80(wire2), .wire83(wire4), .wire79(wire0), .wire81(wire5), .y(wire152), .wire82(wire75), .clk(clk));
  assign wire154 = {wire0, (~&($signed((wire4 != wire152)) ? wire2 : (8'hb5)))};
  assign wire155 = wire75[(1'h0):(1'h0)];
  module6 #() modinst157 (.wire8(wire0), .y(wire156), .wire11(wire154), .wire9(wire1), .wire10(wire4), .wire7(wire3), .clk(clk));
  assign wire158 = $signed(wire1[(3'h5):(1'h1)]);
  assign wire159 = $unsigned((wire5[(2'h2):(2'h2)] & wire4[(3'h7):(2'h3)]));
  assign wire160 = $signed($unsigned(wire152));
  assign wire161 = (+((wire2 ?
                       $unsigned((|wire159)) : ($signed(wire2) == (^~wire2))) << wire159));
  assign wire162 = {({((wire152 ? wire5 : wire75) ?
                                   $signed(wire158) : (^wire159)),
                               $unsigned(((8'ha8) ? reg77 : wire1))} ?
                           $unsigned(wire159) : ((wire159[(1'h0):(1'h0)] >> (wire4 ?
                                   wire161 : wire158)) ?
                               {wire2} : $signed((wire161 ?
                                   wire1 : wire158))))};
  assign wire163 = (!wire161);
endmodule

module module78
#(parameter param150 = ((((~|(8'hb3)) ? (|{(8'ha0), (8'hab)}) : (~|((8'ha4) ? (8'hb5) : (8'hb3)))) ^~ ((~|(|(8'haa))) || (^~(8'h9c)))) ? (8'hb0) : (+((&{(8'ha0)}) == (!(&(8'hbf)))))), 
parameter param151 = (((param150 && ((param150 ? param150 : param150) ? param150 : ((8'hb2) == param150))) ? (-((param150 - param150) && (param150 - (8'hbc)))) : {((param150 ? param150 : param150) ? param150 : (&param150))}) ? ({{(8'hb5)}} ? (param150 ? ({param150, param150} <= (param150 ^ param150)) : ((~^param150) ~^ param150)) : (param150 ^ {param150})) : (((^(param150 ^~ param150)) <<< (~((8'hb5) ? param150 : param150))) & (({param150} == (^param150)) ? (8'haf) : param150))))
(y, clk, wire79, wire80, wire81, wire82, wire83);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire79;
  input wire signed [(4'ha):(1'h0)] wire80;
  input wire [(4'hd):(1'h0)] wire81;
  input wire [(3'h6):(1'h0)] wire82;
  input wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire119;
  wire [(3'h7):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire148;
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  assign y = {wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire90,
                 wire91,
                 wire117,
                 wire119,
                 wire120,
                 wire148,
                 reg89,
                 (1'h0)};
  assign wire84 = wire80[(1'h0):(1'h0)];
  assign wire85 = (~((((wire81 ?
                      wire84 : wire82) << (^wire83)) >>> (wire84[(1'h1):(1'h1)] ?
                      $signed(wire79) : (wire79 ?
                          (8'hab) : wire80))) >> wire81));
  assign wire86 = $unsigned($unsigned($unsigned({wire85})));
  assign wire87 = (7'h44);
  assign wire88 = $signed((wire79[(1'h0):(1'h0)] && wire81));
  always
    @(posedge clk) begin
      reg89 <= $signed($unsigned((+wire82[(1'h1):(1'h0)])));
    end
  assign wire90 = $signed((+($signed((|wire88)) ?
                      (wire83[(2'h2):(2'h2)] ?
                          $unsigned(reg89) : (wire84 ?
                              (8'hbd) : wire86)) : wire81[(1'h1):(1'h1)])));
  assign wire91 = $unsigned($unsigned((^~($signed(reg89) ?
                      wire82[(3'h5):(2'h3)] : $signed(wire84)))));
  module92 #() modinst118 (.wire96(wire84), .clk(clk), .y(wire117), .wire93(wire79), .wire95(wire88), .wire94(wire85));
  assign wire119 = $signed({(~(wire81 ?
                           (wire81 << wire80) : $unsigned(reg89)))});
  assign wire120 = $signed(wire90);
  module121 #() modinst149 (.wire124(wire117), .wire123(wire81), .clk(clk), .y(wire148), .wire125(wire79), .wire122(wire120), .wire126(wire86));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h200):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire52;
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire54,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire36,
                 wire52,
                 reg72,
                 reg71,
                 reg70,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
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
                 (1'h0)};
  assign wire12 = wire7;
  assign wire13 = ($signed(wire9) ?
                      wire7 : ({wire10[(1'h1):(1'h0)], wire8} ?
                          {$signed(wire10),
                              (wire11 ?
                                  (wire10 && wire10) : $signed(wire7))} : $signed(wire9[(3'h6):(3'h5)])));
  assign wire14 = wire13[(3'h6):(3'h4)];
  assign wire15 = wire7;
  assign wire16 = $unsigned(wire12[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg17 <= wire9;
      reg18 <= (!$signed(wire11[(4'h8):(2'h2)]));
      if (wire14[(3'h6):(1'h1)])
        begin
          reg19 <= $unsigned($unsigned(($unsigned((7'h43)) >>> wire7)));
        end
      else
        begin
          reg19 <= (&((wire16[(4'he):(4'h8)] - wire7[(1'h1):(1'h1)]) < wire8[(1'h1):(1'h0)]));
          reg20 <= reg19;
          reg21 <= (|(wire10[(1'h1):(1'h1)] ~^ (8'ha8)));
        end
      reg22 <= wire12[(1'h1):(1'h1)];
      if (reg19[(2'h2):(2'h2)])
        begin
          reg23 <= ((wire11[(1'h0):(1'h0)] >> (((reg17 >= (8'ha5)) || wire10[(1'h1):(1'h0)]) <<< wire12)) || wire9[(4'he):(2'h2)]);
          if ((^~{(~|wire14), $unsigned(wire13)}))
            begin
              reg24 <= ($signed($unsigned($signed(wire13))) && ((~$unsigned((^wire10))) >= $unsigned((~^$signed(reg23)))));
              reg25 <= (8'ha7);
              reg26 <= (((-reg25[(1'h0):(1'h0)]) - wire9) ?
                  wire9[(1'h1):(1'h1)] : (((wire12 ?
                          ((8'ha7) >= reg21) : wire8) ?
                      (|reg17[(4'h9):(1'h0)]) : $unsigned((8'ha7))) ~^ $unsigned((-{wire15,
                      (8'ha4)}))));
            end
          else
            begin
              reg24 <= reg18;
              reg25 <= wire8[(4'hb):(4'h8)];
              reg26 <= $unsigned((reg17[(4'hb):(1'h0)] ? reg25 : reg18));
              reg27 <= $unsigned($unsigned(wire9[(3'h6):(1'h0)]));
              reg28 <= ($unsigned({$unsigned((wire14 * reg21)),
                  {$unsigned(wire12), ((8'hb3) ? wire7 : (7'h44))}}) <= reg21);
            end
          reg29 <= {($signed(wire12) >= ((8'haf) > $signed(reg17[(2'h2):(2'h2)]))),
              ($unsigned((~$signed(reg17))) ? reg19 : wire8[(5'h13):(2'h2)])};
          if ((8'hac))
            begin
              reg30 <= (^~(wire12 && {(wire10[(1'h1):(1'h1)] ?
                      (reg27 & reg25) : {reg23}),
                  (!reg19[(3'h7):(1'h1)])}));
            end
          else
            begin
              reg30 <= reg27[(1'h0):(1'h0)];
              reg31 <= reg23;
            end
        end
      else
        begin
          reg23 <= {($signed(wire14[(5'h11):(1'h0)]) ? reg30 : reg21), reg19};
          if (wire12[(1'h0):(1'h0)])
            begin
              reg24 <= wire7[(2'h3):(1'h1)];
              reg25 <= reg28[(4'h8):(3'h7)];
              reg26 <= (($unsigned($signed((wire12 ? wire7 : reg21))) ?
                      {(((8'hb0) - reg19) ?
                              (^(8'hbd)) : $signed(reg27))} : (~|$unsigned($unsigned(reg25)))) ?
                  $unsigned($unsigned(wire13)) : ($unsigned((-reg24[(2'h3):(2'h2)])) ~^ wire15));
              reg27 <= $unsigned((reg29[(3'h5):(1'h0)] ?
                  wire12[(2'h3):(2'h3)] : $signed($unsigned((-reg18)))));
              reg28 <= {(($unsigned($signed(reg22)) > {{reg31,
                          wire11}}) ~^ $unsigned({$signed((8'hbc))}))};
            end
          else
            begin
              reg24 <= (~&$unsigned((wire12 ?
                  $signed(wire13[(3'h4):(1'h1)]) : $unsigned((~|wire12)))));
              reg25 <= $unsigned((($unsigned($signed(reg24)) <= (~|wire11[(2'h3):(2'h3)])) ?
                  $unsigned((!(+(8'hb9)))) : $signed((&reg30))));
              reg26 <= (&(7'h41));
            end
          reg29 <= (^(reg25[(1'h0):(1'h0)] >> (reg18[(1'h0):(1'h0)] ^ {$unsigned(wire9)})));
          if ((~^(~|((&(reg28 != reg30)) && (wire15 ?
              (reg21 * reg27) : wire14[(5'h10):(3'h4)])))))
            begin
              reg30 <= (-wire10[(2'h2):(1'h1)]);
              reg31 <= $signed(reg19[(3'h7):(3'h5)]);
              reg32 <= wire8[(4'hb):(4'hb)];
              reg33 <= (reg21[(5'h12):(4'h9)] & reg24[(1'h1):(1'h0)]);
              reg34 <= (+wire14);
            end
          else
            begin
              reg30 <= wire16[(4'h8):(1'h1)];
              reg31 <= $unsigned({($unsigned($unsigned(reg19)) ~^ ($signed(reg22) + wire12[(3'h4):(1'h1)]))});
            end
          reg35 <= {$unsigned(((!(8'hae)) + (wire10[(1'h0):(1'h0)] ?
                  ((8'hb5) ? reg29 : wire8) : $signed(reg18)))),
              ({$unsigned(((8'ha3) ? reg32 : reg34)),
                  ($unsigned(wire9) || $unsigned(reg33))} - reg21)};
        end
    end
  assign wire36 = (reg35[(3'h5):(1'h1)] ? (&$unsigned(reg20)) : (8'h9d));
  module37 #() modinst53 (.y(wire52), .wire39(wire10), .clk(clk), .wire40(reg34), .wire38(wire12), .wire41(wire16));
  assign wire54 = $unsigned($unsigned(({(reg27 >> reg26),
                      (+(8'ha3))} <<< (~^reg17[(3'h6):(3'h5)]))));
  always
    @(posedge clk) begin
      if ($unsigned({(^~(((8'hb7) > (8'hb0)) ?
              $signed(reg28) : (reg19 ? reg24 : wire52))),
          (8'haf)}))
        begin
          if ($signed($signed(reg23)))
            begin
              reg55 <= $unsigned(reg30);
              reg56 <= {wire14};
              reg57 <= $signed(reg56);
              reg58 <= reg24[(5'h13):(4'hb)];
            end
          else
            begin
              reg55 <= wire15[(1'h0):(1'h0)];
              reg56 <= (~&wire54);
            end
          reg59 <= $signed($signed(wire11[(1'h0):(1'h0)]));
        end
      else
        begin
          reg55 <= reg31;
          reg56 <= {(^wire12[(4'h9):(1'h1)])};
        end
      reg60 <= (~|wire11[(2'h3):(2'h2)]);
    end
  assign wire61 = ((reg28[(1'h0):(1'h0)] ?
                      (reg31[(3'h4):(3'h4)] ?
                          (wire36 ?
                              (wire9 ?
                                  reg60 : wire8) : reg30[(3'h5):(3'h4)]) : $signed((reg27 ?
                              wire11 : reg59))) : $unsigned($unsigned(((8'hb5) ^ wire9)))) && (wire54 - $signed($signed((reg60 & wire36)))));
  assign wire62 = $unsigned(reg22);
  assign wire63 = wire54;
  assign wire64 = ($signed(wire11[(4'hb):(4'h8)]) << $signed($signed(reg27)));
  assign wire65 = $signed(reg30[(3'h6):(2'h2)]);
  assign wire66 = (&{(((reg24 - (8'haa)) ?
                              (reg20 ? reg19 : wire7) : $signed(wire12)) ?
                          $signed((reg25 ? wire16 : reg59)) : wire8)});
  assign wire67 = reg35[(3'h4):(1'h1)];
  assign wire68 = (~|{((^(^~reg29)) | ($signed(reg17) ?
                          (reg19 && reg59) : reg33[(3'h4):(2'h3)])),
                      (~$signed((reg18 & reg31)))});
  assign wire69 = $unsigned(({(~|(-wire15)),
                      reg26} == $unsigned(reg55[(4'hb):(1'h1)])));
  always
    @(posedge clk) begin
      reg70 <= reg22;
      reg71 <= wire61[(4'hb):(4'h9)];
      reg72 <= $signed(reg34);
    end
  assign wire73 = wire10;
  assign wire74 = reg35;
endmodule

module module37
#(parameter param51 = {(~&({((8'ha4) ? (8'ha7) : (8'hac))} > (((8'ha3) & (7'h41)) ? ((8'ha1) ? (7'h41) : (7'h42)) : {(8'h9d), (8'hb7)}))), (({(^(8'haf)), (+(8'hb2))} ^ ({(8'ha6), (8'hbb)} ? (!(8'ha9)) : ((8'hac) >= (7'h40)))) ? (({(8'ha6), (8'ha6)} << {(8'hb5), (8'ha4)}) << (((8'ha9) ? (8'hae) : (8'hac)) ? ((8'hb6) ? (8'ha6) : (7'h41)) : ((8'hbe) >> (8'hbd)))) : ({((8'ha6) ? (7'h42) : (8'hb9)), ((8'hae) ? (8'ha2) : (8'haa))} || (+(8'hb4))))})
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire41;
  input wire [(5'h11):(1'h0)] wire40;
  input wire signed [(4'hf):(1'h0)] wire39;
  input wire [(4'hd):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 (1'h0)};
  assign wire42 = ((wire41[(3'h6):(1'h0)] < $signed(wire39[(4'hb):(4'hb)])) != (-wire40));
  assign wire43 = $unsigned($unsigned(wire38[(3'h5):(3'h4)]));
  assign wire44 = {(7'h41),
                      $unsigned({$unsigned($unsigned((8'hac))),
                          ((8'hbc) * (^~wire43))})};
  assign wire45 = wire43[(2'h3):(1'h1)];
  assign wire46 = $unsigned((~&$unsigned(wire45[(2'h2):(2'h2)])));
  assign wire47 = $signed(wire43);
  assign wire48 = wire46[(3'h6):(1'h1)];
  assign wire49 = $signed(($unsigned((wire42 ?
                      (~wire40) : wire38)) && wire47[(5'h10):(3'h4)]));
  assign wire50 = (+$unsigned(wire41));
endmodule

module module121
#(parameter param146 = (^~((({(7'h41), (8'hbc)} ? {(8'hb9), (8'ha3)} : ((8'hb5) >> (8'hab))) ? ({(7'h43), (8'hbc)} && (^(8'hb1))) : (((8'h9f) ? (8'ha7) : (8'ha1)) ^ (-(8'hb7)))) ? ((((8'hb3) ? (8'ha3) : (8'h9c)) ^ {(8'ha8), (7'h40)}) ? {{(8'h9e), (8'h9e)}} : ((~^(8'ha1)) ? ((8'hbc) ? (8'h9e) : (8'hb5)) : ((8'hb9) ? (8'ha6) : (8'ha5)))) : (^~({(8'hba), (8'ha2)} ? ((8'hb4) ? (8'haf) : (8'hb7)) : (8'h9e))))), 
parameter param147 = ((param146 >= (8'hbc)) ? param146 : (8'ha7)))
(y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'hb7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire126;
  input wire signed [(3'h6):(1'h0)] wire125;
  input wire signed [(4'ha):(1'h0)] wire124;
  input wire signed [(4'hd):(1'h0)] wire123;
  input wire [(3'h6):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire [(3'h6):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire136;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire134;
  wire signed [(4'ha):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire131;
  wire signed [(3'h4):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire [(5'h12):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire127;
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(4'h9):(1'h0)] reg144 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg143 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg137 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 reg145,
                 reg144,
                 reg143,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire127 = (|wire125[(1'h1):(1'h0)]);
  assign wire128 = ($signed({wire125[(2'h2):(1'h0)]}) <<< $unsigned($signed(wire123[(2'h2):(1'h0)])));
  assign wire129 = $unsigned({wire124,
                       $unsigned($signed((wire127 ? (8'ha4) : wire122)))});
  assign wire130 = ($signed($unsigned((~|(wire124 << wire122)))) && (+(^~wire122)));
  assign wire131 = wire122[(3'h5):(3'h4)];
  assign wire132 = $signed(((({wire130,
                       wire123} << (wire130 ~^ wire123)) == wire125[(3'h4):(2'h2)]) & $signed(wire127[(2'h3):(1'h0)])));
  assign wire133 = wire131[(3'h4):(1'h0)];
  assign wire134 = $unsigned($signed((wire124 ?
                       ((wire131 ? wire129 : wire127) ?
                           $signed(wire123) : wire133[(3'h4):(1'h0)]) : ((~wire127) == wire132))));
  assign wire135 = $unsigned(($signed(wire124[(3'h7):(2'h3)]) ~^ $unsigned($unsigned($signed(wire125)))));
  assign wire136 = {$signed($signed(wire133[(2'h2):(1'h0)]))};
  always
    @(posedge clk) begin
      reg137 <= $signed((wire127 | wire131));
      reg138 <= $signed(wire127);
    end
  assign wire139 = ((!($signed({wire128, wire126}) ~^ (~^(wire123 ?
                           (8'hab) : reg138)))) ?
                       wire136[(3'h7):(3'h6)] : (8'ha1));
  assign wire140 = $signed({((~^(7'h44)) <= {(wire132 & wire122),
                           ((8'hbf) ? wire136 : wire122)}),
                       $unsigned((!$unsigned(wire126)))});
  assign wire141 = $signed(($signed(wire136[(4'ha):(1'h0)]) == wire130));
  assign wire142 = (($signed(wire129[(1'h0):(1'h0)]) >>> ((8'had) << (^~wire126[(1'h1):(1'h1)]))) ~^ {{((~|wire128) ?
                               (wire139 >= wire132) : $unsigned(wire122))}});
  always
    @(posedge clk) begin
      reg143 <= (wire141 ?
          $unsigned(((reg138[(2'h2):(1'h1)] ^ $unsigned(wire135)) << wire139)) : $unsigned(wire128[(4'ha):(4'h8)]));
      reg144 <= wire132[(1'h0):(1'h0)];
      reg145 <= (8'ha0);
    end
endmodule

module module92  (y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire96;
  input wire [(3'h5):(1'h0)] wire95;
  input wire [(4'hd):(1'h0)] wire94;
  input wire [(2'h2):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire [(3'h4):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire signed [(3'h4):(1'h0)] wire97;
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  assign y = {wire116,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg115,
                 reg114,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 (1'h0)};
  assign wire97 = ($unsigned($unsigned(((~|wire95) ?
                      (wire93 != wire96) : wire95[(3'h4):(1'h1)]))) & ($unsigned(wire96) ?
                      wire93[(2'h2):(1'h1)] : ($unsigned($signed(wire95)) ?
                          (-wire94[(4'ha):(4'ha)]) : $signed(wire94[(4'h9):(1'h0)]))));
  assign wire98 = wire97[(2'h3):(2'h2)];
  assign wire99 = wire96[(3'h5):(1'h0)];
  assign wire100 = wire96;
  assign wire101 = (^(wire99 > (wire93 ?
                       ((wire93 ?
                           wire99 : wire100) < wire97) : {(wire100 < wire98)})));
  assign wire102 = $unsigned(wire99[(3'h7):(3'h6)]);
  always
    @(posedge clk) begin
      reg103 <= wire94[(2'h3):(1'h0)];
      reg104 <= wire98[(2'h2):(1'h1)];
      reg105 <= ($unsigned($signed(wire100[(3'h7):(3'h5)])) << wire93[(2'h2):(1'h0)]);
      reg106 <= ((reg103[(4'hb):(1'h1)] ?
          ({wire99, ((8'ha0) <= wire97)} - ($unsigned(wire94) ?
              wire97[(2'h2):(1'h0)] : reg104)) : $unsigned(wire100[(2'h3):(2'h2)])) > wire101);
    end
  assign wire107 = wire95;
  assign wire108 = (^~$signed(reg106));
  assign wire109 = (|$signed(reg105[(1'h1):(1'h0)]));
  assign wire110 = $unsigned(wire96[(3'h6):(2'h2)]);
  assign wire111 = ($signed((^$signed((wire96 == wire97)))) >= wire99[(3'h6):(2'h3)]);
  assign wire112 = (+wire94);
  assign wire113 = $signed((~{$unsigned($signed(wire110)),
                       ($signed(wire109) <<< (reg106 <<< wire109))}));
  always
    @(posedge clk) begin
      reg114 <= (|{$unsigned(((~&(8'h9d)) ?
              wire95[(3'h4):(2'h2)] : $signed(wire100)))});
      reg115 <= (wire110[(3'h4):(1'h1)] ?
          (|$signed($signed($signed(reg104)))) : {($unsigned(wire98) ?
                  (~&{wire102}) : (8'ha8))});
    end
  assign wire116 = $signed($unsigned(({reg104} ?
                       $unsigned(wire112[(3'h6):(1'h0)]) : ({(8'hb0)} & wire112[(2'h2):(1'h1)]))));
endmodule
