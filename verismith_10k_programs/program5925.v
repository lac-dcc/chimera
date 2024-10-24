module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire156;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire154;
  reg [(5'h15):(1'h0)] reg4 = (1'h0);
  assign y = {wire156, wire5, wire154, reg4, (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (((|wire3[(4'hb):(2'h3)]) ?
              wire0[(1'h1):(1'h1)] : $signed((wire2[(4'h8):(3'h5)] | $signed(wire0)))) ?
          wire1[(2'h3):(1'h0)] : {$unsigned(($unsigned(wire0) ^~ (7'h41))),
              ((wire2[(4'h9):(2'h2)] ?
                  (wire1 ? wire1 : wire1) : ((8'ha9) >= wire0)) <<< wire1)});
    end
  assign wire5 = (~|{reg4, wire2[(2'h2):(1'h1)]});
  module6 #() modinst155 (wire154, clk, wire3, wire2, reg4, wire5);
  assign wire156 = $unsigned(($unsigned(({wire3, wire1} + {(8'hb8), reg4})) ?
                       $unsigned(({wire154, wire2} ?
                           (^wire154) : {(8'hb2),
                               wire5})) : (~|wire1[(3'h7):(3'h5)])));
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire152;
  wire signed [(2'h2):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire150,
                 wire100,
                 wire98,
                 wire84,
                 wire82,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire23,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 (1'h0)};
  assign wire11 = wire10[(2'h2):(1'h1)];
  assign wire12 = $signed(wire11);
  assign wire13 = $unsigned(wire7[(4'hc):(3'h7)]);
  assign wire14 = ((~&(+(!(wire11 - wire10)))) == wire11[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      reg15 <= (^(+(|wire10[(3'h4):(1'h0)])));
      reg16 <= (-$signed(({$signed(wire11)} <= wire10[(2'h2):(2'h2)])));
      reg17 <= $signed((wire13[(3'h5):(1'h0)] ?
          wire12[(3'h4):(1'h1)] : wire14[(5'h12):(4'hf)]));
    end
  always
    @(posedge clk) begin
      reg18 <= wire12[(3'h4):(2'h3)];
      reg19 <= (!$unsigned($unsigned((~&$unsigned(reg15)))));
      reg20 <= ((wire9[(3'h6):(1'h0)] ?
          ($signed((reg16 ? wire7 : reg17)) ?
              {(wire9 && wire8), wire13} : ((wire7 ? (8'hbd) : wire13) ?
                  (wire8 == wire10) : (~&wire14))) : (((7'h42) ?
              (reg15 <<< reg17) : (reg15 & wire8)) >>> ({reg16} ?
              ((7'h42) == (8'ha4)) : {wire9,
                  reg19}))) < ($unsigned($unsigned((reg18 ?
          reg16 : (8'ha7)))) <= (&wire14[(4'hd):(3'h5)])));
      reg21 <= reg20[(4'h9):(3'h7)];
      reg22 <= wire9;
    end
  assign wire23 = $unsigned($signed(reg22));
  always
    @(posedge clk) begin
      reg24 <= wire23[(4'hf):(4'hf)];
      if (((-(^((reg19 ? (8'hb3) : wire12) ?
              ((8'hb5) ? wire23 : wire13) : $signed(wire11)))) ?
          (+wire14[(4'hc):(3'h7)]) : {(|(wire11[(5'h10):(4'hd)] ?
                  ((8'ha6) ? reg21 : reg24) : ((8'h9e) * wire11)))}))
        begin
          if ($unsigned(reg20))
            begin
              reg25 <= wire12;
              reg26 <= $signed(reg19);
              reg27 <= reg26[(2'h2):(1'h0)];
              reg28 <= ($signed(reg16[(4'hc):(2'h2)]) ?
                  ($signed({wire14, ((8'ha9) <<< reg24)}) ?
                      reg16 : ((wire11[(5'h12):(3'h5)] == reg25[(4'he):(4'he)]) ?
                          wire23 : wire13)) : wire11);
              reg29 <= reg20;
            end
          else
            begin
              reg25 <= $signed({(reg16[(4'hd):(2'h2)] > ((~^wire23) == $unsigned((7'h43)))),
                  $unsigned({{(8'ha9)}, reg28})});
              reg26 <= wire8;
            end
          reg30 <= $signed($unsigned((reg24 ?
              {wire12} : $unsigned(reg21[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg25 <= $unsigned(reg30[(2'h3):(1'h0)]);
          reg26 <= $unsigned($unsigned({(wire9 ?
                  $unsigned(reg19) : $signed(wire8)),
              {$signed(reg29), $unsigned(reg19)}}));
        end
      reg31 <= {{wire9}};
    end
  assign wire32 = $unsigned($unsigned($signed((reg15 ?
                      (reg31 ? reg22 : reg21) : (^~reg20)))));
  assign wire33 = (7'h41);
  assign wire34 = (~|(^{($signed(reg20) ~^ (wire32 < reg26))}));
  assign wire35 = wire33;
  module36 #() modinst83 (wire82, clk, reg22, reg29, wire11, wire10);
  assign wire84 = (reg24 ?
                      {wire13,
                          ({wire7,
                              reg19[(4'ha):(3'h4)]} + $unsigned((~&wire23)))} : ((((reg15 ?
                                  wire82 : (8'hb1)) ?
                              (reg27 ? (8'ha2) : reg22) : $unsigned(reg31)) ?
                          (((8'hbb) ?
                              (8'hab) : reg25) < wire82[(2'h2):(1'h1)]) : $signed($unsigned((8'ha9)))) - $unsigned(($unsigned(wire23) && $unsigned(wire8)))));
  module85 #() modinst99 (wire98, clk, wire14, reg30, wire35, reg16, reg20);
  assign wire100 = $signed($unsigned({$unsigned(wire23)}));
  module101 #() modinst151 (wire150, clk, reg18, wire13, wire33, reg22);
  assign wire152 = reg20;
  assign wire153 = reg28;
endmodule

module module101  (y, clk, wire105, wire104, wire103, wire102);
  output wire [(32'h1d9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire105;
  input wire [(4'h9):(1'h0)] wire104;
  input wire signed [(4'he):(1'h0)] wire103;
  input wire [(5'h10):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire149;
  wire [(3'h6):(1'h0)] wire148;
  wire [(3'h5):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire137;
  wire signed [(4'hf):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(5'h10):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire signed [(4'h9):(1'h0)] wire118;
  wire [(5'h12):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire [(3'h6):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(4'hd):(1'h0)] wire106;
  reg [(4'ha):(1'h0)] reg146 = (1'h0);
  reg [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg [(5'h10):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg112 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire120,
                 wire119,
                 wire118,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire106 = (~|$signed($unsigned(wire102[(4'h9):(3'h4)])));
  assign wire107 = $signed((wire104[(3'h6):(2'h2)] ?
                       (wire105[(4'ha):(1'h1)] * wire106[(1'h1):(1'h1)]) : ((~^(^~wire106)) != {wire103})));
  assign wire108 = (wire104[(2'h2):(1'h0)] ?
                       $unsigned($unsigned((~|(wire107 >>> wire105)))) : $unsigned((|$signed((wire105 ?
                           wire106 : wire103)))));
  assign wire109 = {wire106[(4'hc):(3'h5)]};
  assign wire110 = (({wire102[(4'h9):(1'h1)],
                       {wire108}} + (wire106[(4'h8):(2'h3)] ?
                       wire105[(5'h11):(5'h11)] : ((wire108 << wire109) ^ $signed(wire104)))) > $unsigned((&(+$signed(wire109)))));
  assign wire111 = (^wire104[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg112 <= (wire102 ^~ wire103[(1'h1):(1'h1)]);
      reg113 <= $signed((reg112 <<< wire111));
      reg114 <= (~&wire104);
      if ((!reg112))
        begin
          if ($signed(wire108[(2'h2):(2'h2)]))
            begin
              reg115 <= (|wire104[(4'h8):(3'h7)]);
              reg116 <= $unsigned(reg114[(2'h3):(2'h2)]);
              reg117 <= (~|wire105[(2'h3):(1'h1)]);
            end
          else
            begin
              reg115 <= {(~$unsigned(((-wire104) < (|(7'h40)))))};
              reg116 <= reg117;
            end
        end
      else
        begin
          reg115 <= {({$unsigned((wire103 ? (8'h9f) : reg116)),
                      $signed((reg115 >>> (8'hb5)))} ?
                  $unsigned((~|((8'ha8) == wire109))) : $unsigned((~|(~|reg113)))),
              wire102};
          reg116 <= {reg117,
              (wire105 ?
                  $signed({$unsigned(wire106),
                      wire105[(1'h1):(1'h0)]}) : wire108)};
          reg117 <= (~|$unsigned(($signed($signed(wire109)) ?
              (-{reg115}) : ((wire103 ? reg115 : reg115) ?
                  (wire106 ? (8'hb2) : wire109) : (reg113 ?
                      wire105 : wire108)))));
        end
    end
  assign wire118 = $signed($unsigned(($signed((-(8'ha3))) ?
                       wire108 : (wire107 ?
                           $signed(wire109) : $signed(reg116)))));
  assign wire119 = ((reg116[(1'h1):(1'h0)] ?
                       ($signed($signed(wire118)) ?
                           (|$unsigned(reg116)) : wire111[(1'h0):(1'h0)]) : ((reg113 ?
                           wire109[(1'h0):(1'h0)] : wire102) <<< reg116)) != $signed($unsigned(reg115)));
  assign wire120 = $unsigned(wire118[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      if ($signed((8'haa)))
        begin
          if (reg113)
            begin
              reg121 <= (+$unsigned((!$signed((wire119 >>> reg115)))));
              reg122 <= (wire107[(3'h5):(2'h2)] ?
                  reg116 : $unsigned($unsigned($unsigned(wire120[(2'h2):(1'h0)]))));
              reg123 <= $signed(((|wire109) < wire120[(1'h1):(1'h1)]));
            end
          else
            begin
              reg121 <= ($unsigned((|$signed((reg113 ?
                  wire119 : reg122)))) >> wire118[(1'h0):(1'h0)]);
              reg122 <= wire110;
            end
          reg124 <= reg123[(3'h5):(2'h2)];
          reg125 <= $unsigned($signed((8'hb3)));
        end
      else
        begin
          reg121 <= ({($signed((8'haa)) - wire106[(3'h5):(3'h5)])} || reg125[(4'h8):(2'h3)]);
          reg122 <= $signed(reg113);
          reg123 <= (~$signed($unsigned(wire107[(1'h1):(1'h1)])));
        end
      reg126 <= $unsigned($signed(wire111[(3'h4):(1'h1)]));
      if (reg124[(1'h0):(1'h0)])
        begin
          reg127 <= wire103[(4'h9):(3'h5)];
          reg128 <= $unsigned((reg127[(1'h1):(1'h0)] ?
              (reg115[(2'h3):(1'h0)] << (wire111[(3'h4):(2'h3)] ?
                  (reg116 && wire104) : $unsigned(wire120))) : (reg126[(1'h1):(1'h0)] < reg116)));
          reg129 <= reg127[(2'h3):(1'h0)];
        end
      else
        begin
          reg127 <= reg128;
          reg128 <= reg124;
          reg129 <= reg126[(4'h8):(2'h2)];
          reg130 <= reg115[(2'h2):(2'h2)];
          reg131 <= reg115[(4'h8):(3'h4)];
        end
      reg132 <= $unsigned({($unsigned((7'h41)) == (^(wire108 ?
              wire105 : wire111))),
          (8'had)});
      reg133 <= reg131[(1'h1):(1'h1)];
    end
  assign wire134 = (!reg114[(1'h1):(1'h1)]);
  assign wire135 = reg125;
  assign wire136 = reg130;
  assign wire137 = $signed((reg124 ?
                       wire107[(1'h0):(1'h0)] : {$signed((!reg121)),
                           reg122[(5'h10):(2'h2)]}));
  always
    @(posedge clk) begin
      reg138 <= (reg114[(3'h4):(1'h0)] ?
          $unsigned((wire111 & {(8'hbd)})) : $signed(((!(|reg117)) && reg125)));
      if (wire134[(4'hb):(1'h1)])
        begin
          reg139 <= wire136[(4'hb):(4'ha)];
        end
      else
        begin
          reg139 <= wire108[(2'h2):(2'h2)];
          if ($unsigned(((!$signed((reg114 <= reg115))) < $unsigned($signed({reg128,
              wire120})))))
            begin
              reg140 <= ($signed($signed((wire104 ?
                      (~|(8'hb6)) : (wire107 ? reg139 : reg124)))) ?
                  (~^{({wire108} < reg125[(3'h7):(1'h1)])}) : {wire111[(4'hc):(4'ha)]});
            end
          else
            begin
              reg140 <= reg133;
              reg141 <= $signed($unsigned($signed(reg115)));
              reg142 <= {(~&((((8'hb9) ~^ reg128) ?
                      $signed(reg115) : $unsigned(wire105)) >> $signed(reg141))),
                  $signed({($signed(reg125) ? wire119 : (reg117 > (7'h41)))})};
              reg143 <= ($unsigned((8'hbd)) ?
                  (&{reg121}) : (^~($unsigned((~|wire135)) ?
                      $signed((reg132 ?
                          (8'hb4) : wire111)) : {(reg115 && (8'hb3))})));
              reg144 <= $signed(($unsigned(reg125[(4'he):(4'he)]) ?
                  reg131 : (~^({wire119} == $unsigned(reg124)))));
            end
        end
      reg145 <= ($signed(((8'hb9) ?
          {$signed(reg140)} : reg143)) | $unsigned(reg122[(4'hb):(4'hb)]));
      reg146 <= ((reg113 * reg138[(1'h1):(1'h0)]) <= (+($unsigned((reg141 ^ reg116)) ?
          ((wire107 ? reg127 : reg114) ^ (wire120 ?
              reg143 : wire103)) : ((reg145 ? (8'ha9) : reg126) ?
              (~^reg121) : ((8'hac) != wire109)))));
    end
  assign wire147 = wire106[(4'hc):(4'hb)];
  assign wire148 = (({wire120[(1'h0):(1'h0)],
                       $unsigned($signed(reg140))} && {reg126,
                       (~&((7'h44) ?
                           wire103 : reg123))}) && (($unsigned(reg142[(5'h11):(3'h5)]) && $signed((~wire110))) ?
                       $signed($signed((wire120 <= reg121))) : $signed((+(reg130 ?
                           wire105 : reg132)))));
  assign wire149 = wire103[(4'h8):(1'h0)];
endmodule

module module85
#(parameter param97 = {(|((((8'hb8) && (8'haa)) & (~^(8'h9e))) - ((+(8'hbb)) != {(8'ha4), (8'ha7)})))})
(y, clk, wire90, wire89, wire88, wire87, wire86);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire90;
  input wire signed [(4'hc):(1'h0)] wire89;
  input wire signed [(3'h4):(1'h0)] wire88;
  input wire signed [(4'hd):(1'h0)] wire87;
  input wire signed [(4'hb):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire93;
  wire [(5'h12):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire91;
  assign y = {wire96, wire95, wire94, wire93, wire92, wire91, (1'h0)};
  assign wire91 = (&{$signed($signed(wire87[(4'ha):(4'h9)]))});
  assign wire92 = {($unsigned($unsigned({(8'hbb), wire89})) != wire90),
                      $signed($signed(wire91))};
  assign wire93 = (7'h44);
  assign wire94 = $unsigned(wire87[(2'h2):(2'h2)]);
  assign wire95 = (($unsigned((wire92[(4'hf):(2'h3)] * (wire88 ?
                          wire89 : wire92))) ?
                      $unsigned((~&$signed(wire88))) : (8'hb5)) * $unsigned($unsigned($signed($unsigned(wire91)))));
  assign wire96 = $unsigned(((wire91[(2'h3):(1'h1)] >> wire87) ?
                      $signed({$unsigned(wire94),
                          $unsigned(wire86)}) : (($unsigned((8'hba)) ?
                              $unsigned(wire94) : wire89[(3'h7):(2'h2)]) ?
                          wire90 : wire87[(4'hc):(3'h7)])));
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire81;
  wire [(3'h5):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire69;
  wire signed [(2'h3):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire41;
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire41,
                 reg76,
                 reg74,
                 reg73,
                 reg72,
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
                 (1'h0)};
  assign wire41 = wire39;
  always
    @(posedge clk) begin
      if ((wire41 ?
          $signed({((wire37 ?
                  wire38 : (7'h44)) < $unsigned(wire41))}) : (($signed((~^wire40)) > wire37) ?
              $unsigned({(wire38 >> wire38)}) : $unsigned(wire40))))
        begin
          if ((wire39 ?
              ($signed(({wire41, (8'hb6)} ? (wire39 >> wire40) : (~&(8'ha7)))) ?
                  $signed((&wire38)) : wire41) : wire41[(3'h7):(3'h7)]))
            begin
              reg42 <= $signed((8'hb9));
              reg43 <= (!$unsigned(wire39));
              reg44 <= $unsigned(($signed(((|(8'hac)) ?
                  (^(8'hbb)) : (wire37 || reg43))) >> (8'ha2)));
            end
          else
            begin
              reg42 <= wire38[(4'hd):(3'h4)];
              reg43 <= wire39;
            end
        end
      else
        begin
          if ((wire38[(1'h0):(1'h0)] < $unsigned(((~|(~^reg42)) ?
              $signed((~^(8'hb3))) : {reg44[(1'h1):(1'h0)]}))))
            begin
              reg42 <= (reg42[(3'h6):(1'h0)] - $signed(((|reg44) ?
                  ($signed(reg42) ?
                      (wire41 <= wire40) : {(8'ha6)}) : reg44[(1'h0):(1'h0)])));
            end
          else
            begin
              reg42 <= ($signed($unsigned(($signed((8'hac)) ?
                      (wire37 ? wire40 : wire39) : $signed(wire39)))) ?
                  $unsigned($signed((8'hab))) : reg42[(4'h8):(3'h6)]);
              reg43 <= wire39[(4'hb):(3'h4)];
              reg44 <= $unsigned((~^(&(^$unsigned(wire41)))));
              reg45 <= reg42[(4'hb):(3'h7)];
              reg46 <= (($unsigned(((~^wire40) ?
                      ((8'hbd) > wire37) : $signed((8'hbb)))) ?
                  ((!(reg45 ?
                      (8'hb9) : reg44)) + reg42[(1'h0):(1'h0)]) : reg42[(1'h1):(1'h1)]) | (wire41[(4'he):(2'h2)] ?
                  (~&reg42[(1'h0):(1'h0)]) : (!(~&(-(8'haf))))));
            end
          reg47 <= wire39;
        end
      if ($unsigned($signed(reg42)))
        begin
          reg48 <= (8'ha3);
          reg49 <= $unsigned(($signed((wire41 ?
                  {wire41, reg47} : (wire40 ? (8'hbe) : reg42))) ?
              ($unsigned(reg46) ?
                  (^{wire38,
                      reg42}) : ({reg45} == $signed(reg43))) : ((&$unsigned(reg47)) ?
                  $unsigned((wire39 ? wire38 : wire37)) : $signed(reg43))));
        end
      else
        begin
          reg48 <= ($unsigned($signed(wire37[(4'hd):(3'h7)])) ?
              (~$unsigned(wire39[(1'h1):(1'h1)])) : {$unsigned((~^(wire39 ?
                      (8'hbd) : reg45))),
                  reg45[(2'h2):(2'h2)]});
          if (($signed($unsigned(((~reg49) * (reg42 ? wire39 : wire41)))) ?
              $unsigned($unsigned(reg45[(1'h1):(1'h0)])) : ($unsigned(((reg46 ?
                  reg44 : (8'hb9)) || (&(7'h42)))) && (^~reg49[(4'h8):(3'h4)]))))
            begin
              reg49 <= $signed({(7'h42)});
              reg50 <= (^reg48[(4'h9):(1'h0)]);
            end
          else
            begin
              reg49 <= (~|{((&(~^reg49)) ?
                      ((-reg42) ?
                          reg47[(2'h3):(1'h1)] : (reg46 ?
                              (8'ha3) : wire38)) : ($signed((8'hb4)) >= reg42[(2'h2):(2'h2)]))});
              reg50 <= reg48;
              reg51 <= {reg50[(1'h1):(1'h1)]};
              reg52 <= ($signed(reg48) ~^ $signed(({$unsigned(wire39),
                      $unsigned(reg50)} ?
                  reg49[(3'h6):(3'h4)] : $signed($unsigned(wire40)))));
            end
          reg53 <= wire38;
          if ($unsigned(((~^wire39) ? (|reg53[(3'h7):(1'h1)]) : (8'hb9))))
            begin
              reg54 <= reg51[(3'h7):(3'h5)];
              reg55 <= $unsigned((((reg44[(1'h0):(1'h0)] ^~ reg43) & wire37) || reg49));
              reg56 <= reg45[(1'h1):(1'h0)];
              reg57 <= $unsigned((+(($unsigned(reg53) > reg55) ?
                  $unsigned((8'ha5)) : reg48[(4'h9):(3'h4)])));
            end
          else
            begin
              reg54 <= (+reg51);
              reg55 <= {$unsigned((-reg50)),
                  ($unsigned(wire40) ?
                      $unsigned(reg44[(1'h1):(1'h0)]) : wire38[(1'h1):(1'h0)])};
              reg56 <= (+reg55[(3'h6):(2'h3)]);
              reg57 <= $signed(($unsigned(((|reg51) || ((8'hb6) ?
                  wire39 : reg54))) ^~ ($unsigned((reg54 ? wire38 : wire37)) ?
                  reg49 : $signed($signed(reg53)))));
            end
        end
      reg58 <= $signed(($unsigned(($signed(wire38) ^ reg46)) ?
          (((wire38 != wire41) + $signed(wire40)) == (!((7'h43) && reg49))) : ({{reg56,
                      reg51},
                  $unsigned(reg54)} ?
              reg50[(1'h0):(1'h0)] : ((reg49 & reg42) ?
                  $unsigned(reg51) : $unsigned(reg49)))));
    end
  always
    @(posedge clk) begin
      reg59 <= reg50[(3'h6):(3'h6)];
      reg60 <= wire39;
    end
  assign wire61 = $signed(reg59[(4'hc):(4'h8)]);
  assign wire62 = reg48;
  assign wire63 = reg53[(3'h6):(3'h6)];
  assign wire64 = {reg49};
  assign wire65 = ((wire40 ?
                      reg46[(5'h10):(5'h10)] : $signed(reg45)) ~^ ((^~reg53) ^~ (-reg53)));
  assign wire66 = (reg50 ? reg60 : wire41[(4'hf):(1'h0)]);
  assign wire67 = $unsigned(reg53);
  assign wire68 = $unsigned((wire65 ? (8'had) : reg45));
  assign wire69 = (((((~|reg53) ? (~^wire38) : $unsigned(reg50)) > reg57) ?
                          {(~&(8'hb0))} : $unsigned(reg44[(1'h0):(1'h0)])) ?
                      wire64 : ({$signed((~|wire38)), reg59[(3'h7):(3'h5)]} ?
                          reg43 : wire64[(4'hc):(4'h8)]));
  assign wire70 = $signed(reg42[(3'h6):(1'h0)]);
  assign wire71 = (~&(-{($signed(wire38) ?
                          $unsigned(reg54) : (reg43 ? (8'ha9) : wire61))}));
  always
    @(posedge clk) begin
      reg72 <= ($signed((({wire38} ?
          $signed(reg48) : (8'hb2)) <= ($unsigned(reg47) == (wire70 ?
          wire71 : reg42)))) >= $unsigned($signed((8'ha7))));
    end
  always
    @(posedge clk) begin
      reg73 <= $signed(({$signed($unsigned(wire71)),
          ($unsigned(wire69) ?
              ((8'h9c) ?
                  reg54 : reg53) : $signed(reg55))} != (|($unsigned(wire69) ?
          reg50[(2'h2):(2'h2)] : (^(8'ha1))))));
      reg74 <= (((+$signed({wire38})) | wire41[(5'h12):(5'h10)]) ?
          ((~^$unsigned(reg58)) ?
              {reg53, {(8'ha5), reg42[(3'h6):(1'h0)]}} : (((wire41 ?
                  reg52 : wire61) + $signed(reg58)) >>> (~&{(8'ha3)}))) : (&(({reg46} ?
                  (wire63 ~^ reg45) : (!wire63)) ?
              ($signed(reg52) & wire70[(1'h1):(1'h1)]) : (reg42[(3'h5):(1'h1)] + (wire65 ?
                  wire67 : wire38)))));
    end
  assign wire75 = $unsigned($signed((reg42 > $signed(((7'h43) <= wire68)))));
  always
    @(posedge clk) begin
      reg76 <= $unsigned($signed(((+(7'h40)) == (^(wire41 ?
          wire39 : (8'h9d))))));
    end
  assign wire77 = (((^~(~^$unsigned(reg76))) - {wire37,
                          $unsigned((wire67 ^~ wire40))}) ?
                      (reg44[(1'h0):(1'h0)] + wire69) : $signed($unsigned(((wire40 ?
                              reg43 : wire65) ?
                          reg52 : (|reg60)))));
  assign wire78 = wire65;
  assign wire79 = (|$unsigned((!wire77[(1'h1):(1'h1)])));
  assign wire80 = reg55[(3'h5):(1'h0)];
  assign wire81 = $signed($unsigned($signed($unsigned((reg42 && wire69)))));
endmodule
