module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire152;
  wire signed [(4'h9):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire149;
  wire signed [(4'h8):(1'h0)] wire148;
  wire [(3'h7):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire146;
  wire [(4'h8):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire [(4'he):(1'h0)] wire143;
  wire [(4'hc):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire140;
  wire signed [(2'h3):(1'h0)] wire139;
  wire [(3'h5):(1'h0)] wire138;
  wire signed [(5'h10):(1'h0)] wire137;
  wire signed [(2'h2):(1'h0)] wire136;
  wire [(4'ha):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire134;
  wire signed [(5'h10):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire48;
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire132,
                 wire48,
                 (1'h0)};
  module5 #() modinst49 (.wire7(wire4), .y(wire48), .clk(clk), .wire10(wire3), .wire9(wire2), .wire8(wire0), .wire6(wire1));
  module50 #() modinst133 (.clk(clk), .wire54(wire4), .y(wire132), .wire53(wire2), .wire51(wire0), .wire52(wire3));
  assign wire134 = wire2;
  assign wire135 = $unsigned({{wire2, (8'ha9)}, (8'ha6)});
  assign wire136 = wire2;
  assign wire137 = $signed($signed((|wire4[(3'h5):(1'h1)])));
  assign wire138 = $signed(wire4);
  assign wire139 = wire137;
  assign wire140 = (~^(($signed(wire3) ?
                           wire0 : $signed(wire137[(3'h4):(2'h3)])) ?
                       $signed(((wire2 == (8'hb6)) - (^~(8'hbd)))) : $signed(wire134[(2'h3):(2'h2)])));
  assign wire141 = $unsigned((({(wire3 == wire0)} & $unsigned({wire48,
                           wire132})) ?
                       wire136[(1'h0):(1'h0)] : $signed({$unsigned(wire140),
                           $signed(wire4)})));
  assign wire142 = wire4[(2'h2):(1'h1)];
  assign wire143 = ({{wire3[(3'h4):(1'h1)]}} ~^ $signed((&$signed(wire0[(4'he):(3'h5)]))));
  assign wire144 = (-$signed(wire135));
  assign wire145 = wire132;
  assign wire146 = $signed($signed($unsigned(wire141)));
  assign wire147 = ($unsigned(wire145) ?
                       (wire132[(4'hb):(1'h1)] + (~(~|(~&(8'hbe))))) : $signed(wire4));
  assign wire148 = $unsigned((wire2 || {{$signed(wire134), (-(8'hbf))}}));
  assign wire149 = (wire143[(2'h2):(1'h0)] >> wire135[(2'h3):(1'h0)]);
  assign wire150 = $signed(((wire132 * $unsigned((wire0 ~^ wire136))) ~^ wire1[(4'hb):(2'h3)]));
  assign wire151 = ({$signed($signed((~wire4))),
                           ($unsigned($signed(wire48)) ?
                               ($signed(wire144) <<< $signed(wire139)) : {((8'hb0) <<< wire0)})} ?
                       ({$signed({(8'ha3)}),
                           (wire141[(4'h9):(4'h9)] ^ wire3)} ^~ $unsigned({wire137})) : wire141[(4'hf):(4'ha)]);
  assign wire152 = wire1;
endmodule

module module50
#(parameter param130 = (!(+(!({(8'hbc), (7'h43)} ? (~&(8'hbe)) : {(8'h9e)})))), 
parameter param131 = ({({(param130 ^ param130)} ? param130 : param130)} ? param130 : (+{((!(8'h9c)) ? param130 : {param130})})))
(y, clk, wire51, wire52, wire53, wire54);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire51;
  input wire signed [(4'he):(1'h0)] wire52;
  input wire [(4'he):(1'h0)] wire53;
  input wire signed [(5'h15):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire129;
  wire signed [(4'he):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire124;
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire78,
                 wire80,
                 wire84,
                 wire85,
                 wire86,
                 wire124,
                 reg81,
                 reg82,
                 reg83,
                 (1'h0)};
  module55 #() modinst79 (wire78, clk, wire53, wire51, wire54, wire52);
  assign wire80 = (({(7'h43),
                      (wire52 * (wire53 ?
                          wire53 : wire54))} << $signed({(wire78 >>> (8'hac))})) && ($unsigned((~&(^~wire53))) ?
                      $signed($unsigned((wire51 ?
                          wire78 : wire52))) : $signed((+wire54[(4'hc):(2'h3)]))));
  always
    @(posedge clk) begin
      reg81 <= ({(+(((8'hb3) ? wire52 : wire54) ?
              (wire78 ?
                  wire53 : wire51) : $unsigned(wire52)))} * $signed((8'hba)));
      reg82 <= reg81[(1'h1):(1'h0)];
      reg83 <= wire51;
    end
  assign wire84 = $signed((8'hb9));
  assign wire85 = ({{wire80}} ?
                      {(wire84[(2'h2):(1'h1)] ?
                              (^wire53[(4'h8):(1'h0)]) : wire84),
                          wire52} : reg83[(4'h8):(3'h4)]);
  assign wire86 = (wire78 > $unsigned(wire54[(4'ha):(3'h7)]));
  module87 #() modinst125 (.y(wire124), .clk(clk), .wire90(wire80), .wire88(wire86), .wire89(wire51), .wire91(reg82));
  assign wire126 = wire84[(3'h6):(3'h6)];
  assign wire127 = wire86[(4'hc):(4'h8)];
  assign wire128 = wire124[(1'h0):(1'h0)];
  assign wire129 = reg82;
endmodule

module module5
#(parameter param46 = ((~|({(8'hba)} ? {(&(8'h9e)), ((8'ha3) ? (8'ha9) : (8'ha9))} : ((8'haa) ? ((8'ha5) >= (8'h9e)) : ((8'h9e) ? (7'h44) : (8'hb0))))) || {(((8'hbd) ? {(8'hb2), (8'ha8)} : ((8'h9d) + (8'hbc))) == {{(7'h42)}, ((8'h9c) ? (8'hbe) : (8'hb8))})}), 
parameter param47 = (|param46))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(4'h8):(1'h0)] wire37;
  wire signed [(5'h11):(1'h0)] wire11;
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire11,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire11 = $unsigned(wire9[(2'h3):(2'h2)]);
  module12 #() modinst38 (wire37, clk, wire7, wire8, wire11, wire6);
  assign wire39 = (-$unsigned(wire37));
  assign wire40 = (8'hbf);
  assign wire41 = ($signed($signed(wire39)) & {{wire10},
                      $unsigned(((wire39 ~^ wire7) >> (wire6 - wire10)))});
  always
    @(posedge clk) begin
      reg42 <= $unsigned($unsigned($unsigned($signed(wire37[(1'h0):(1'h0)]))));
      reg43 <= ($signed((wire6 ? wire11 : (8'ha8))) ?
          (~^($unsigned(reg42[(2'h3):(1'h1)]) ?
              (wire41[(4'hc):(2'h3)] ?
                  $unsigned(wire37) : {(8'hbc),
                      (8'had)}) : $unsigned($signed((8'hbf))))) : $unsigned($unsigned(wire8)));
      reg44 <= ($signed($unsigned(({wire39,
          wire41} ~^ wire7[(3'h4):(2'h3)]))) * (wire9 ?
          $signed(wire11) : wire11));
    end
  always
    @(posedge clk) begin
      reg45 <= {$signed($unsigned($unsigned(reg42))),
          $signed({(wire41 ?
                  (wire7 ? (8'hb6) : (8'haa)) : wire8[(4'hb):(4'hb)]),
              $signed($unsigned((8'hb9)))})};
    end
endmodule

module module12
#(parameter param36 = {(8'hba)})
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(3'h4):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(4'h8):(1'h0)] wire17;
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire31,
                 wire19,
                 wire18,
                 wire17,
                 reg32,
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
  assign wire17 = wire14[(3'h7):(3'h6)];
  assign wire18 = wire15[(4'hb):(3'h7)];
  assign wire19 = wire18;
  always
    @(posedge clk) begin
      reg20 <= $unsigned(wire17);
      reg21 <= (wire14 ? (wire16 >>> {(~^(-wire14))}) : {wire14, {(8'ha6)}});
      reg22 <= (~&$unsigned(((8'hab) ?
          wire16[(4'ha):(1'h1)] : $signed($signed((8'hb0))))));
      reg23 <= ($unsigned(reg20[(2'h3):(2'h3)]) ~^ wire14);
      if ($unsigned(reg20))
        begin
          if ($signed(wire19[(1'h0):(1'h0)]))
            begin
              reg24 <= (+$signed($signed(((wire15 | (8'ha6)) ?
                  (^wire13) : $signed(reg20)))));
              reg25 <= (wire18 >>> {wire15});
            end
          else
            begin
              reg24 <= (wire14 ? (reg25 == reg24) : wire18[(3'h4):(3'h4)]);
            end
          reg26 <= $signed(wire15[(1'h1):(1'h0)]);
          if ((^(((&$signed(reg20)) | (~^$unsigned(reg21))) ?
              (wire19 * $signed(reg21)) : {(-(|reg23))})))
            begin
              reg27 <= wire14;
              reg28 <= wire18;
            end
          else
            begin
              reg27 <= ((reg27 + $unsigned($unsigned(reg23[(4'hf):(4'he)]))) >>> {{(+$unsigned(reg23))},
                  {(+(wire18 ? wire17 : reg26)),
                      ((reg26 ^~ wire15) ?
                          $unsigned(wire16) : $signed(reg27))}});
              reg28 <= ($signed({((~(7'h42)) ?
                          wire17[(3'h7):(2'h3)] : reg21[(1'h0):(1'h0)])}) ?
                  $signed(wire15) : {reg23, reg26});
              reg29 <= ($unsigned({((|reg26) ? reg28 : (~&wire15)),
                  (~^(8'hb2))}) >>> (&reg24[(4'hc):(3'h7)]));
              reg30 <= (~|($unsigned((&{wire17,
                  wire16})) * $unsigned((|wire14[(4'ha):(4'ha)]))));
            end
        end
      else
        begin
          reg24 <= ($unsigned(((8'ha9) == reg20)) - (+wire15[(3'h7):(3'h6)]));
          reg25 <= {(^~(((!wire17) ? $unsigned(wire13) : $unsigned(wire19)) ?
                  reg21[(3'h5):(2'h2)] : ((reg24 <<< reg25) ?
                      ((8'ha8) >= reg22) : ((8'hb8) ? reg22 : reg26)))),
              {$unsigned({(~|reg27)})}};
          if (wire19)
            begin
              reg26 <= $signed(reg26);
              reg27 <= (8'hba);
              reg28 <= {{$unsigned((reg30 ?
                          (reg30 ? wire16 : reg22) : (~reg20))),
                      ((reg20 >> reg22[(2'h2):(2'h2)]) > reg25)}};
              reg29 <= reg23[(2'h2):(1'h1)];
              reg30 <= ((({wire18[(4'hb):(2'h2)]} ?
                      {wire16[(4'h9):(3'h4)], $signed(reg30)} : (^(&(8'ha0)))) ?
                  $signed(reg22[(1'h0):(1'h0)]) : $signed(((|wire14) ?
                      $unsigned(wire13) : reg25))) + (($signed($signed(wire18)) ?
                      wire19[(2'h3):(1'h0)] : reg20[(1'h1):(1'h0)]) ?
                  {$unsigned(reg25)} : reg24[(1'h1):(1'h0)]));
            end
          else
            begin
              reg26 <= (-reg27);
            end
        end
    end
  assign wire31 = wire18[(4'hb):(1'h0)];
  always
    @(posedge clk) begin
      reg32 <= reg21[(2'h3):(1'h0)];
    end
  assign wire33 = reg23;
  assign wire34 = (^~(~&{(reg23 ? {wire18} : reg32[(2'h3):(1'h0)]),
                      (reg26 >>> reg27)}));
  assign wire35 = (((wire16 ? reg20 : wire15) < $unsigned(wire31)) ?
                      {reg24, reg30[(2'h2):(2'h2)]} : wire16[(4'h9):(3'h4)]);
endmodule

module module87
#(parameter param123 = (8'haf))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire91;
  input wire [(3'h7):(1'h0)] wire90;
  input wire signed [(4'hc):(1'h0)] wire89;
  input wire signed [(4'hb):(1'h0)] wire88;
  wire [(3'h6):(1'h0)] wire122;
  wire [(2'h3):(1'h0)] wire121;
  wire signed [(2'h2):(1'h0)] wire120;
  wire signed [(2'h3):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire107;
  wire [(4'ha):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire signed [(5'h11):(1'h0)] wire96;
  reg signed [(5'h13):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire109,
                 wire107,
                 wire106,
                 wire105,
                 wire96,
                 reg111,
                 reg110,
                 reg108,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg92 <= ((wire89[(3'h5):(1'h1)] >= $unsigned(($unsigned(wire88) ?
              $unsigned(wire88) : (wire89 ? wire90 : wire89)))) ?
          $signed((+(!wire91[(3'h4):(2'h3)]))) : $signed((wire88[(4'h9):(2'h3)] ?
              $signed($signed(wire90)) : {$unsigned(wire91)})));
      reg93 <= ((wire88 ^ reg92) == (~(wire88[(4'h8):(2'h3)] - ($unsigned(wire88) ?
          wire88[(4'h9):(3'h6)] : reg92))));
      reg94 <= wire91[(3'h6):(2'h2)];
      reg95 <= $signed((!($signed((wire88 | reg94)) ?
          $unsigned($unsigned(reg93)) : ((wire88 <<< reg92) == (~wire88)))));
    end
  assign wire96 = wire90;
  always
    @(posedge clk) begin
      if (reg95[(2'h3):(2'h3)])
        begin
          if ($signed({(reg93[(4'ha):(4'h8)] ?
                  $unsigned((wire96 ?
                      wire89 : reg92)) : $unsigned(wire89[(1'h0):(1'h0)]))}))
            begin
              reg97 <= (^(wire91 ?
                  $signed(reg93) : ($signed((wire89 ?
                      wire91 : wire96)) && $unsigned(wire89[(3'h6):(2'h2)]))));
              reg98 <= reg92;
              reg99 <= $signed(reg92);
              reg100 <= reg92[(3'h5):(2'h2)];
            end
          else
            begin
              reg97 <= (!($unsigned(((~wire88) ?
                  $signed(wire96) : $unsigned(reg94))) & ($unsigned(reg93) ?
                  $unsigned($signed(reg99)) : {$signed((8'ha5))})));
              reg98 <= $signed(((&wire88) ?
                  ((~$unsigned(wire90)) == ((|(8'ha5)) ?
                      $unsigned(reg99) : (|reg98))) : reg93[(3'h7):(2'h3)]));
              reg99 <= (wire90 ^~ $signed(($unsigned((^~wire91)) ?
                  {(reg94 ? reg97 : (8'ha3))} : $unsigned((wire90 ^ reg100)))));
              reg100 <= wire96;
              reg101 <= $signed((|wire91[(3'h6):(3'h6)]));
            end
          reg102 <= {(reg99 ?
                  (^((reg94 ? reg94 : reg97) ?
                      wire89 : {reg100})) : (~(wire90 << {(8'hb9), (7'h40)})))};
          reg103 <= (^~wire88);
        end
      else
        begin
          reg97 <= ((wire89 <<< wire91[(3'h7):(2'h2)]) ^~ $signed(reg103[(2'h2):(1'h0)]));
        end
      reg104 <= (|(reg99 ^~ reg103[(2'h2):(1'h1)]));
    end
  assign wire105 = reg102[(1'h0):(1'h0)];
  assign wire106 = (+(+$signed($unsigned((reg94 ? (8'haa) : reg92)))));
  assign wire107 = reg103[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg108 <= reg104[(3'h7):(1'h1)];
    end
  assign wire109 = {$signed($unsigned(((~|reg103) ?
                           (|reg92) : $signed(wire89)))),
                       (($unsigned($unsigned(wire88)) ^~ reg104[(3'h5):(3'h4)]) << $signed({$signed(reg103)}))};
  always
    @(posedge clk) begin
      reg110 <= wire107[(4'h9):(2'h3)];
      reg111 <= (8'ha0);
    end
  assign wire112 = reg97[(1'h1):(1'h1)];
  assign wire113 = wire105;
  assign wire114 = reg92;
  assign wire115 = $unsigned($unsigned(reg97));
  assign wire116 = (~^reg108[(3'h6):(2'h3)]);
  assign wire117 = $signed($unsigned($unsigned($unsigned($unsigned((8'hb8))))));
  assign wire118 = $signed((!$signed(({(8'hbb)} * wire96[(4'h9):(1'h0)]))));
  assign wire119 = reg95[(2'h2):(1'h1)];
  assign wire120 = (~|$unsigned((wire109 ?
                       (~|(~(8'hbd))) : $signed((^reg108)))));
  assign wire121 = (^~reg104[(3'h5):(2'h2)]);
  assign wire122 = (wire113 <= reg101);
endmodule

module module55  (y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire59;
  input wire [(3'h6):(1'h0)] wire58;
  input wire signed [(2'h2):(1'h0)] wire57;
  input wire signed [(4'he):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire73;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire60 = (&{$unsigned($unsigned({wire59, wire57})),
                      (((+wire58) > wire58[(1'h1):(1'h1)]) ~^ $unsigned(wire58[(1'h1):(1'h0)]))});
  assign wire61 = wire59[(4'h9):(3'h6)];
  assign wire62 = (8'ha1);
  assign wire63 = {$signed($unsigned(wire60)), wire57[(1'h0):(1'h0)]};
  assign wire64 = wire58[(3'h5):(1'h1)];
  assign wire65 = wire58;
  always
    @(posedge clk) begin
      reg66 <= $signed(wire65[(3'h4):(1'h0)]);
      reg67 <= ($signed((8'hba)) | ($unsigned($signed({wire62})) ?
          (((~wire63) ?
              (&wire58) : (^~wire60)) ~^ $unsigned($unsigned(reg66))) : wire57[(1'h0):(1'h0)]));
      reg68 <= (~&(8'ha4));
      reg69 <= ((((8'hae) == wire56) ?
          ($signed((~reg66)) > (wire58[(1'h1):(1'h1)] ?
              (8'h9c) : (~|wire62))) : $unsigned($unsigned((~reg68)))) << ((wire56 ?
              wire62[(3'h6):(3'h6)] : {(wire60 ? reg67 : wire62)}) ?
          {(^~(~&wire62))} : (~(8'hba))));
      reg70 <= {reg67, reg67[(1'h1):(1'h0)]};
    end
  assign wire71 = (~|(($unsigned(wire59[(4'ha):(3'h7)]) - (+(wire58 <<< wire62))) ?
                      (!reg66) : wire57[(1'h1):(1'h1)]));
  assign wire72 = wire58;
  assign wire73 = reg66;
  assign wire74 = $signed(wire71);
  assign wire75 = wire72[(4'ha):(4'ha)];
  assign wire76 = {$unsigned((^$unsigned(((8'hb5) || (8'ha4)))))};
  assign wire77 = $unsigned(wire73);
endmodule
