module top
#(parameter param197 = (8'hb6), 
parameter param198 = (|param197))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire196;
  wire signed [(4'hd):(1'h0)] wire194;
  wire [(3'h5):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire117;
  assign y = {wire196,
                 wire194,
                 wire121,
                 wire120,
                 wire119,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire117,
                 (1'h0)};
  assign wire5 = (($signed(($unsigned(wire2) * $unsigned(wire4))) >> (+{{wire4}})) ?
                     ($signed({$unsigned(wire0)}) == wire3) : ((^~(^((8'haf) ?
                         (7'h40) : wire3))) | wire4));
  assign wire6 = (wire5[(4'h9):(3'h6)] ?
                     ((8'hbf) ?
                         wire4[(4'hb):(1'h0)] : $unsigned({(wire3 & wire2)})) : wire1[(3'h4):(2'h3)]);
  assign wire7 = (+(~|$unsigned($unsigned(wire3[(3'h6):(3'h6)]))));
  assign wire8 = ((-$unsigned({$signed(wire2)})) ?
                     ($unsigned({wire0[(3'h6):(3'h5)]}) ?
                         $signed(wire1[(5'h13):(5'h10)]) : wire0) : wire1);
  assign wire9 = (!(wire5[(4'ha):(3'h7)] + (wire4 != wire2)));
  assign wire10 = (-($unsigned(((|(8'hb7)) < (wire9 == wire3))) - wire4));
  assign wire11 = (~^(wire0 | ({(wire9 && wire10),
                      {wire8, (8'hae)}} - $signed($signed((8'ha3))))));
  assign wire12 = wire4;
  assign wire13 = ((^wire5) ?
                      ((wire5[(4'ha):(3'h4)] ? wire0 : $unsigned(wire8)) ?
                          ($signed($signed(wire3)) ~^ $unsigned($unsigned(wire3))) : $unsigned({{(8'hac),
                                  wire2},
                              (wire2 ? wire4 : wire10)})) : $signed({(+(wire4 ?
                              (8'hb9) : wire0)),
                          {$signed(wire2), $unsigned(wire2)}}));
  assign wire14 = ((8'ha8) ?
                      $unsigned((wire7[(3'h7):(3'h5)] && {$unsigned(wire11),
                          $signed(wire6)})) : wire11[(3'h4):(2'h2)]);
  assign wire15 = ((({wire3[(2'h2):(1'h0)]} > wire7[(4'h8):(1'h1)]) >>> ((&((8'h9c) || (8'hbc))) + (wire9[(1'h1):(1'h1)] ?
                          ((8'hbc) ? wire11 : wire1) : (!wire0)))) ?
                      {((^~$signed((8'ha9))) ?
                              ((wire1 ?
                                  wire13 : wire13) >>> wire12) : (~&wire14))} : wire14);
  assign wire16 = wire13[(2'h2):(2'h2)];
  assign wire17 = wire1[(5'h11):(2'h3)];
  module18 #() modinst118 (wire117, clk, wire10, wire1, wire12, wire13, wire6);
  assign wire119 = wire0[(1'h1):(1'h1)];
  assign wire120 = ($signed((wire11[(2'h3):(2'h2)] ?
                       wire6 : (wire4[(3'h5):(2'h2)] ?
                           (~&wire119) : wire7[(4'hf):(4'hd)]))) ~^ {(((wire119 ?
                                   wire8 : wire1) ?
                               wire1 : $signed(wire6)) ?
                           wire8 : $unsigned({(8'hbc)})),
                       $signed((wire16[(4'h9):(1'h0)] ?
                           $signed(wire15) : ((7'h41) ? wire117 : wire10)))});
  assign wire121 = ($signed(wire8[(4'ha):(2'h3)]) ~^ {wire10[(4'hf):(4'he)],
                       $unsigned(wire2)});
  module122 #() modinst195 (wire194, clk, wire5, wire11, wire9, wire1);
  assign wire196 = $signed($unsigned((+$signed($unsigned(wire6)))));
endmodule

module module122  (y, clk, wire123, wire124, wire125, wire126);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire123;
  input wire [(4'hd):(1'h0)] wire124;
  input wire [(4'hc):(1'h0)] wire125;
  input wire signed [(4'h8):(1'h0)] wire126;
  wire [(5'h13):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire128;
  wire signed [(2'h2):(1'h0)] wire129;
  wire [(4'hc):(1'h0)] wire130;
  wire [(4'hc):(1'h0)] wire146;
  wire [(5'h10):(1'h0)] wire147;
  wire [(5'h15):(1'h0)] wire148;
  wire signed [(3'h4):(1'h0)] wire149;
  wire [(4'he):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire151;
  wire signed [(3'h4):(1'h0)] wire161;
  wire [(5'h14):(1'h0)] wire163;
  wire [(4'he):(1'h0)] wire164;
  wire [(4'h8):(1'h0)] wire192;
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'h8):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg131 = (1'h0);
  assign y = {wire127,
                 wire128,
                 wire129,
                 wire130,
                 wire146,
                 wire147,
                 wire148,
                 wire149,
                 wire150,
                 wire151,
                 wire161,
                 wire163,
                 wire164,
                 wire192,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire127 = (^~wire125[(1'h1):(1'h0)]);
  assign wire128 = wire124[(4'h9):(4'h9)];
  assign wire129 = wire127;
  assign wire130 = $signed(((^~wire128) ?
                       $unsigned(($unsigned(wire126) <<< wire125[(3'h4):(1'h1)])) : $signed(($unsigned(wire123) ?
                           $unsigned(wire123) : (wire126 ?
                               wire127 : wire127)))));
  always
    @(posedge clk) begin
      reg131 <= $signed((~^(~wire129)));
      reg132 <= ((((~(~(8'hb3))) ?
              $unsigned($signed(wire125)) : (|reg131)) * wire123) ?
          $unsigned($signed(($unsigned(wire129) ?
              (+wire128) : (wire126 ?
                  wire125 : reg131)))) : {((+$signed(wire126)) ^~ wire126[(2'h3):(1'h1)]),
              wire129[(2'h2):(1'h1)]});
    end
  always
    @(posedge clk) begin
      reg133 <= $signed(wire125);
      if ($signed({(wire126 ?
              ((wire127 > wire128) && wire130[(4'h9):(3'h7)]) : reg131[(1'h1):(1'h1)])}))
        begin
          reg134 <= ((8'ha8) <<< (wire129 ? wire128 : $signed(wire124)));
          if ((reg134 ?
              ($signed($signed($unsigned(reg132))) ?
                  wire130 : $signed($signed((wire127 ?
                      wire123 : wire126)))) : ((~&reg133) << wire125[(2'h3):(2'h2)])))
            begin
              reg135 <= (-(wire127[(4'ha):(4'h8)] ?
                  (^{reg134, (reg132 <= wire127)}) : $unsigned(reg134)));
              reg136 <= (({$signed((^~wire127)),
                      $signed($signed(wire125))} < $signed({$signed(wire127),
                      $unsigned(wire128)})) ?
                  ({($unsigned(reg134) ?
                              (wire124 & (8'had)) : (wire128 > wire127))} ?
                      $unsigned(reg133[(2'h2):(1'h1)]) : $signed((reg134 ?
                          (wire126 - reg131) : $unsigned(wire128)))) : ({{$signed(reg133)}} ?
                      (~|{$signed(reg134)}) : (-(!$unsigned(wire126)))));
              reg137 <= ((wire130 >>> (~|reg131[(3'h4):(2'h3)])) >> (~$signed((~|(wire126 ?
                  wire127 : wire128)))));
              reg138 <= (((~|{(wire125 ? (8'h9f) : wire129),
                      $signed(wire124)}) >= {wire124}) ?
                  {{$unsigned(wire130[(3'h6):(3'h6)]),
                          (&(wire124 | reg132))}} : wire126[(2'h3):(1'h1)]);
            end
          else
            begin
              reg135 <= (reg136 ?
                  ($signed(reg133) && $unsigned(reg135)) : ((7'h42) ?
                      (!$unsigned($signed(wire127))) : ((&(&wire126)) ?
                          $signed((wire125 ?
                              reg134 : reg135)) : (-(wire128 && reg131)))));
              reg136 <= ($unsigned(wire126[(1'h0):(1'h0)]) ^~ (reg138 ?
                  wire130 : (wire126 ?
                      wire124[(4'h9):(3'h4)] : $signed($signed((8'had))))));
              reg137 <= ({wire129[(2'h2):(1'h0)]} ?
                  $unsigned($unsigned($unsigned((reg132 > reg135)))) : ((~^wire126[(1'h0):(1'h0)]) ?
                      wire129[(2'h2):(1'h1)] : reg133[(4'hb):(3'h4)]));
              reg138 <= reg138[(4'hf):(3'h5)];
              reg139 <= {(wire129[(1'h1):(1'h0)] > wire124[(3'h6):(2'h3)]),
                  $signed($unsigned((~(wire126 + (8'hac)))))};
            end
        end
      else
        begin
          reg134 <= ($unsigned($signed((reg131 + $signed(reg131)))) + $unsigned(($signed($unsigned(reg132)) ?
              wire128[(3'h5):(2'h2)] : $signed((~reg138)))));
          reg135 <= ($unsigned(reg139) ?
              $signed((!wire130)) : {$unsigned(((wire129 ? wire124 : (7'h40)) ?
                      $signed((8'hbd)) : (wire130 ? wire124 : (7'h42)))),
                  (8'h9e)});
        end
      reg140 <= ($signed(((8'hbd) ?
          wire127[(3'h4):(1'h0)] : ((reg131 || wire127) ~^ (^~wire124)))) >= wire130);
      reg141 <= (~{(+($signed(reg134) > (-reg140))),
          ((~^$unsigned(wire124)) ?
              (^$unsigned(reg135)) : (reg133[(2'h3):(1'h1)] ?
                  (~&wire124) : reg139[(1'h0):(1'h0)]))});
    end
  always
    @(posedge clk) begin
      reg142 <= (($unsigned((~reg134)) != reg138[(2'h3):(2'h2)]) ?
          $signed((wire128 <= reg132[(3'h6):(1'h0)])) : $signed($signed($signed((reg131 & wire128)))));
      if (($signed($signed({reg140[(1'h1):(1'h0)]})) ?
          (~|(&(~&reg131[(1'h1):(1'h0)]))) : (8'hbc)))
        begin
          reg143 <= $signed((8'hb2));
        end
      else
        begin
          reg143 <= reg133;
          reg144 <= wire124;
          reg145 <= wire125;
        end
    end
  assign wire146 = (&(8'ha0));
  assign wire147 = reg145;
  assign wire148 = (~^((({wire128} ?
                           $unsigned(reg134) : (&(8'hb5))) ~^ {((8'hb2) ?
                               wire128 : (8'hb1)),
                           reg131}) ?
                       reg137 : {reg136}));
  assign wire149 = wire123[(1'h1):(1'h0)];
  assign wire150 = ((reg141 - reg141[(3'h7):(2'h3)]) == {$unsigned($signed(wire129[(1'h0):(1'h0)])),
                       {$signed($signed(reg134)), reg133}});
  assign wire151 = $signed((-((reg139[(4'hc):(3'h7)] >>> {wire124}) ?
                       $unsigned($unsigned(reg135)) : wire127)));
  module152 #() modinst162 (.wire156(wire126), .y(wire161), .clk(clk), .wire153(reg140), .wire155(reg145), .wire154(wire125));
  assign wire163 = (&reg144[(3'h4):(1'h1)]);
  assign wire164 = $signed(($unsigned({(~|reg144),
                       (reg136 <= reg136)}) >= $signed(wire125)));
  module165 #() modinst193 (.wire169(reg142), .wire168(wire128), .wire170(wire127), .wire167(wire148), .wire166(reg140), .y(wire192), .clk(clk));
endmodule

module module18
#(parameter param115 = ((8'haa) ? (~({(~(8'hb1))} >>> (((8'hbd) ? (8'ha0) : (8'hbf)) | {(8'haf), (8'hb6)}))) : (+{(^~((8'hbb) ? (8'h9c) : (8'hbe))), (((7'h43) + (8'haa)) == ((8'ha2) >>> (8'ha5)))})), 
parameter param116 = param115)
(y, clk, wire19, wire20, wire21, wire22, wire23);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire [(5'h13):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire94;
  reg signed [(3'h6):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h13):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg [(5'h12):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire110,
                 wire105,
                 wire97,
                 wire96,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire37,
                 wire62,
                 wire64,
                 wire65,
                 wire94,
                 reg111,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire24 = (|(8'ha3));
  assign wire25 = wire21;
  assign wire26 = $signed($signed((({(8'hbf), wire25} ?
                      $signed(wire20) : {wire21}) < $unsigned(((8'hbe) || wire19)))));
  assign wire27 = {wire21[(4'ha):(2'h3)]};
  always
    @(posedge clk) begin
      reg28 <= wire23;
      if (wire26)
        begin
          reg29 <= (wire19 ~^ $signed(((^$signed(wire24)) != $unsigned(wire23))));
          reg30 <= (^(~$unsigned((wire21 | (wire27 * (8'hb5))))));
          if ((-(^(~$signed((reg30 - wire21))))))
            begin
              reg31 <= $unsigned((|$signed(($signed(wire21) && wire21[(3'h7):(3'h6)]))));
            end
          else
            begin
              reg31 <= $unsigned((8'ha4));
              reg32 <= (wire26 > (wire25[(4'ha):(1'h0)] ?
                  {$unsigned(wire23[(2'h2):(2'h2)]),
                      (8'ha9)} : $signed(((~(8'hb5)) ?
                      (~|wire20) : (wire22 ? wire25 : wire26)))));
              reg33 <= $signed({wire23});
            end
          reg34 <= reg28;
          reg35 <= $unsigned(wire21[(4'hb):(4'h9)]);
        end
      else
        begin
          reg29 <= $signed($unsigned((~&(^{wire22, wire27}))));
          reg30 <= (^~{((wire20[(5'h13):(4'hd)] ?
                      (wire19 ? wire27 : (7'h44)) : (wire24 ? reg29 : wire20)) ?
                  $signed((reg31 ?
                      wire26 : (7'h41))) : $signed((reg29 <= reg32))),
              $unsigned(((8'ha8) ? reg33 : $signed(wire23)))});
        end
      reg36 <= wire26[(3'h6):(2'h3)];
    end
  assign wire37 = wire19[(1'h1):(1'h0)];
  module38 #() modinst63 (wire62, clk, wire19, reg34, reg31, reg35, wire21);
  assign wire64 = $unsigned(wire62);
  assign wire65 = ((~^(8'hb8)) - (reg36[(3'h4):(3'h4)] ? wire27 : (8'had)));
  module66 #() modinst95 (wire94, clk, wire19, wire23, reg29, wire26, reg36);
  assign wire96 = $unsigned(wire37[(4'h9):(1'h1)]);
  assign wire97 = (($signed($unsigned((~wire22))) ?
                          {$unsigned($signed(wire21)),
                              ($unsigned(wire96) ?
                                  reg30 : (reg30 ?
                                      wire26 : reg35))} : (~$signed((wire94 || reg35)))) ?
                      (($unsigned({wire22}) >= (~&(~|wire27))) ?
                          reg31 : $unsigned(((wire22 >> (8'hb8)) > ((8'ha4) ?
                              (8'hab) : (8'hbe))))) : (reg32 ?
                          $unsigned(($unsigned(reg31) ?
                              $unsigned(wire25) : (7'h42))) : $signed(($signed(reg30) ?
                              $unsigned(reg28) : (-wire64)))));
  always
    @(posedge clk) begin
      reg98 <= (^~(~(((wire19 ? wire20 : reg30) ?
          $unsigned(wire19) : reg35[(2'h2):(1'h1)]) >= (wire37 <= (wire65 ?
          reg36 : (7'h40))))));
      reg99 <= ($signed((+(+$signed(wire23)))) <<< wire97);
      if (wire26)
        begin
          reg100 <= $unsigned($unsigned((~&wire20[(3'h7):(3'h6)])));
          reg101 <= $unsigned(((&{(+wire21), $unsigned(wire23)}) && (^wire24)));
          reg102 <= $unsigned(reg28);
          reg103 <= {(wire20[(2'h2):(1'h0)] ?
                  (^wire27[(4'hb):(2'h3)]) : (~&(wire21 == wire24[(4'hc):(3'h5)])))};
        end
      else
        begin
          reg100 <= (reg99 ?
              {(((8'hbd) & (reg35 ? reg98 : reg29)) ?
                      $unsigned((wire94 ?
                          wire94 : reg98)) : $signed(wire65[(4'hb):(3'h7)]))} : $unsigned((~|$signed((8'ha7)))));
          if (((($signed($signed(wire19)) ?
                  {(~&reg31)} : ((~&wire27) ?
                      $signed(reg36) : wire21[(2'h3):(2'h3)])) - (~|($signed(wire64) >>> wire25[(1'h1):(1'h0)]))) ?
              (((reg103 ?
                  $unsigned(wire19) : ((7'h43) ?
                      wire62 : wire21)) && $unsigned((reg36 ?
                  reg34 : (8'ha2)))) & {$signed(wire21),
                  ((wire27 | (8'h9e)) ?
                      wire37 : $unsigned((8'ha2)))}) : ($unsigned((wire65[(1'h0):(1'h0)] != (wire25 ~^ reg28))) ?
                  wire24[(4'h8):(2'h2)] : ($unsigned($unsigned((8'ha8))) ?
                      (|(wire62 ? wire19 : reg28)) : $signed((+(8'hb8)))))))
            begin
              reg101 <= ({wire22,
                      (((wire25 ? reg98 : reg35) << (8'hbd)) ?
                          wire19[(4'he):(1'h1)] : ((wire64 >>> reg100) ?
                              (~reg100) : (wire19 ? wire25 : wire23)))} ?
                  {wire21} : {($signed({(8'hba)}) || ($unsigned(wire65) ?
                          reg35[(1'h1):(1'h0)] : wire96))});
              reg102 <= $signed((reg31[(3'h5):(1'h1)] ?
                  ($unsigned($unsigned(wire96)) ?
                      ((~^wire96) >> wire62) : {$unsigned(wire22)}) : reg28[(2'h2):(2'h2)]));
              reg103 <= (wire20[(4'h8):(2'h2)] ^ reg32);
              reg104 <= {(~{$signed($unsigned(wire62)), (&{(8'hb4), wire25})}),
                  wire25[(3'h6):(2'h2)]};
            end
          else
            begin
              reg101 <= (($signed($signed((wire19 >> wire65))) ?
                  reg29 : ((8'haa) | ({wire19} | (-wire94)))) || $unsigned($signed($signed({(8'hb7)}))));
              reg102 <= (^~$signed($unsigned(((|(8'h9f)) & reg35))));
            end
        end
    end
  assign wire105 = $unsigned((^wire37[(4'hd):(4'hb)]));
  always
    @(posedge clk) begin
      reg106 <= $unsigned(wire64);
      reg107 <= ({{$signed(reg29[(2'h2):(1'h1)])},
          (reg28[(4'h8):(4'h8)] ?
              $signed(wire23[(1'h0):(1'h0)]) : {{wire65, reg99},
                  reg34[(3'h4):(3'h4)]})} < $unsigned(wire64[(2'h3):(2'h2)]));
      reg108 <= $unsigned($unsigned($unsigned($unsigned($signed((8'hba))))));
      reg109 <= wire64[(2'h2):(1'h1)];
    end
  assign wire110 = ((((reg99[(2'h3):(2'h3)] ?
                           (reg31 ?
                               reg108 : wire24) : $signed(reg36)) >> ({reg104,
                               wire94} ?
                           wire23[(4'ha):(3'h7)] : (+reg108))) ?
                       (wire97[(4'hc):(1'h1)] ?
                           $unsigned((^~wire20)) : wire23) : (reg107 ^~ (wire94[(4'h8):(2'h3)] ?
                           (wire21 >> wire62) : $signed((8'ha1))))) * (reg100[(3'h7):(1'h0)] > ((8'hbf) ?
                       (~|(~^reg28)) : $unsigned((reg33 ? wire23 : wire27)))));
  always
    @(posedge clk) begin
      reg111 <= wire26;
    end
  assign wire112 = reg109[(3'h6):(2'h2)];
  assign wire113 = reg109;
  assign wire114 = wire37;
endmodule

module module66
#(parameter param93 = ((~^{{((8'hb6) || (8'hbe)), {(8'haf)}}}) <<< (|((^((8'haf) < (8'hb0))) ? (((8'ha2) ? (8'hb6) : (8'ha3)) ? ((8'hb0) <<< (7'h42)) : ((8'had) ~^ (8'hbd))) : (&((8'hae) || (8'had)))))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire71;
  input wire [(3'h5):(1'h0)] wire70;
  input wire [(2'h3):(1'h0)] wire69;
  input wire [(5'h14):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(3'h4):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire72 = (^~(8'hb6));
  assign wire73 = (wire69 ?
                      (wire71[(4'hb):(3'h6)] ^ ({(wire69 <= wire68)} >> $signed($signed(wire68)))) : {wire72});
  assign wire74 = wire67;
  assign wire75 = (8'ha4);
  assign wire76 = wire68[(4'h9):(2'h3)];
  assign wire77 = (~^wire67);
  always
    @(posedge clk) begin
      reg78 <= (&(wire72[(4'hc):(2'h3)] ? (8'ha8) : wire67));
      reg79 <= (~^((wire74[(3'h4):(1'h1)] ?
          $unsigned(wire68[(3'h5):(1'h1)]) : $unsigned($unsigned((8'hbd)))) > wire71));
      if ($signed((~(&wire77[(3'h6):(2'h2)]))))
        begin
          if ((+((~&($signed(wire73) != (wire73 ? wire73 : (8'hbf)))) ?
              ($unsigned(wire67) ?
                  (7'h43) : $unsigned($unsigned(wire75))) : $unsigned(wire76))))
            begin
              reg80 <= {((($unsigned(reg78) ? reg78[(2'h3):(1'h0)] : (8'ha3)) ?
                      (^reg78) : $unsigned(wire75)) <= {(-$unsigned(wire67))})};
              reg81 <= wire72[(5'h11):(4'hf)];
              reg82 <= wire75;
              reg83 <= $signed((&wire68[(4'ha):(2'h3)]));
            end
          else
            begin
              reg80 <= {$signed(wire77[(1'h0):(1'h0)]),
                  $signed($unsigned(((wire73 ?
                      reg79 : reg78) >> $signed(wire73))))};
              reg81 <= ((^$signed(wire67)) < ($signed(((wire69 != wire76) != (|wire77))) ?
                  (~|$signed((reg79 < wire75))) : $unsigned(((8'ha1) || $unsigned(wire73)))));
              reg82 <= $signed((reg79[(3'h5):(2'h3)] ^ (&((|(8'hb8)) ?
                  (wire77 ? wire77 : wire67) : $unsigned(wire69)))));
              reg83 <= wire68;
            end
          if (wire70)
            begin
              reg84 <= {(~|$signed($signed(wire74))),
                  $unsigned(((^~(7'h42)) ?
                      ($unsigned((7'h42)) ^ wire69) : reg79[(1'h1):(1'h0)]))};
              reg85 <= wire72;
              reg86 <= $signed(((^~reg85) ?
                  $unsigned(reg84[(1'h1):(1'h1)]) : wire75[(4'h8):(2'h3)]));
            end
          else
            begin
              reg84 <= wire71;
              reg85 <= {($signed((8'hbb)) ? wire68 : (~^reg86))};
              reg86 <= $signed((~&((!wire68) ?
                  (+(reg86 ? wire68 : (8'hb3))) : ((reg84 ?
                      wire68 : wire75) && wire70))));
              reg87 <= ($signed(reg79[(3'h4):(1'h1)]) ?
                  reg86 : $signed(($unsigned($unsigned(wire76)) >= ($unsigned((8'hbc)) >> $unsigned(reg80)))));
            end
        end
      else
        begin
          if ({((^reg78[(2'h3):(1'h1)]) ?
                  {$unsigned((wire75 ? reg79 : wire68)),
                      {(wire67 ? reg79 : (8'hbe)),
                          reg83[(2'h2):(1'h1)]}} : $signed((&(~&(8'haa))))),
              $signed(wire67)})
            begin
              reg80 <= $signed((&($signed(wire74[(1'h0):(1'h0)]) ?
                  reg80 : $unsigned($unsigned(wire69)))));
            end
          else
            begin
              reg80 <= $signed(wire69[(1'h0):(1'h0)]);
            end
          if ($signed($signed((((reg79 * wire68) ?
                  (wire71 ? reg86 : wire71) : $signed(wire76)) ?
              $unsigned(((8'hba) != wire69)) : reg86))))
            begin
              reg81 <= wire71[(4'hb):(3'h5)];
            end
          else
            begin
              reg81 <= reg83[(2'h2):(1'h0)];
              reg82 <= ((wire70 ? reg84[(2'h3):(1'h0)] : reg78) ?
                  (-reg87[(3'h5):(3'h4)]) : {{(^~reg78[(1'h1):(1'h1)]),
                          (reg87 >> (wire76 ? wire76 : wire69))}});
              reg83 <= reg87[(3'h6):(3'h4)];
              reg84 <= $signed((~^{(8'h9f)}));
              reg85 <= wire74;
            end
          reg86 <= $unsigned(($unsigned((reg79 ?
              $signed(reg82) : $unsigned(reg79))) * $unsigned(reg78)));
          if ($signed(reg86))
            begin
              reg87 <= ((reg86[(1'h0):(1'h0)] >= wire69[(2'h2):(2'h2)]) ~^ ($unsigned(((8'h9f) ?
                      $signed((8'hbe)) : (reg84 ? wire70 : (7'h40)))) ?
                  {$signed((+(8'hb3)))} : reg82));
            end
          else
            begin
              reg87 <= wire77[(4'hc):(4'hc)];
              reg88 <= (reg86[(4'hb):(3'h4)] ~^ {wire67});
              reg89 <= $unsigned((8'had));
            end
          reg90 <= $signed((!($signed((|reg85)) | wire77)));
        end
      reg91 <= $signed((reg79 ?
          $unsigned(wire71[(1'h0):(1'h0)]) : (&($unsigned(wire67) ?
              wire72 : (~^(8'h9e))))));
      reg92 <= ($unsigned(($unsigned((~|reg84)) || ((wire69 ? reg81 : wire77) ?
          reg79 : reg89))) << wire68[(1'h1):(1'h0)]);
    end
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire43;
  input wire [(5'h15):(1'h0)] wire42;
  input wire [(3'h4):(1'h0)] wire41;
  input wire [(2'h3):(1'h0)] wire40;
  input wire signed [(5'h10):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire45,
                 wire44,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg47,
                 (1'h0)};
  assign wire44 = $signed({(wire43 ?
                          wire40[(2'h3):(1'h0)] : wire40[(1'h0):(1'h0)]),
                      ((~$unsigned(wire39)) <<< wire40[(1'h1):(1'h0)])});
  assign wire45 = wire44[(1'h1):(1'h1)];
  assign wire46 = ((wire45 > (-{(wire42 != wire41),
                      ((8'hbf) | wire39)})) ^~ {wire44[(1'h0):(1'h0)],
                      $unsigned($signed($signed(wire44)))});
  always
    @(posedge clk) begin
      reg47 <= $signed({{$unsigned((+wire45)), {wire43, (~^wire43)}}});
    end
  assign wire48 = $signed($unsigned(wire46[(2'h3):(1'h0)]));
  assign wire49 = (&(reg47 ?
                      (wire42[(3'h6):(3'h5)] ?
                          $signed((wire48 > wire45)) : $signed(((7'h41) == wire40))) : (((~^wire46) ?
                              (wire46 * wire42) : wire42[(5'h14):(4'ha)]) ?
                          wire41 : wire42[(3'h5):(2'h2)])));
  assign wire50 = $unsigned(wire44);
  always
    @(posedge clk) begin
      if ((wire49[(2'h2):(1'h0)] ?
          $unsigned($signed($unsigned((^wire48)))) : (8'ha5)))
        begin
          if (($signed((|$signed((~wire41)))) ?
              ((((wire42 ? wire50 : wire49) ? (^(8'ha4)) : (wire48 != reg47)) ?
                      wire41 : wire41) ?
                  (&((wire45 ? wire45 : wire40) | (wire39 ?
                      (8'ha6) : wire48))) : (~&($signed((8'hbc)) ?
                      ((8'hae) <= wire44) : wire46[(3'h7):(2'h3)]))) : wire40))
            begin
              reg51 <= wire41[(2'h2):(1'h0)];
              reg52 <= wire45[(2'h3):(1'h0)];
              reg53 <= reg51[(4'h9):(3'h5)];
            end
          else
            begin
              reg51 <= (reg47 && reg52[(1'h1):(1'h1)]);
              reg52 <= (wire49[(4'h8):(2'h3)] <<< reg51);
              reg53 <= (($signed(reg53) ?
                  $signed(($unsigned(reg47) ~^ reg51)) : $unsigned(reg52[(2'h2):(1'h1)])) == (^(~^wire46)));
              reg54 <= (((wire50 ? $signed($unsigned(wire39)) : wire42) ?
                      wire41 : ((wire49[(2'h3):(1'h0)] >> (&wire49)) ?
                          ($unsigned(wire50) ?
                              wire41[(3'h4):(3'h4)] : (^~wire41)) : $unsigned($unsigned(wire42)))) ?
                  wire50 : wire42[(3'h4):(1'h0)]);
              reg55 <= {wire42};
            end
        end
      else
        begin
          reg51 <= reg47;
          reg52 <= wire39[(4'hc):(2'h3)];
          reg53 <= ($signed({{(&wire42), ((8'hb0) ? wire41 : reg55)}, wire43}) ?
              reg47[(1'h0):(1'h0)] : (^~wire44));
          reg54 <= $signed($unsigned((~|(reg51 * $unsigned((8'ha6))))));
          reg55 <= (~(!(8'h9f)));
        end
    end
  assign wire56 = $signed(reg55[(4'h8):(4'h8)]);
  assign wire57 = ((^~wire50[(4'he):(3'h5)]) ^ wire42);
  assign wire58 = {$unsigned(wire49), (&reg51)};
  assign wire59 = ({$signed(($unsigned(wire46) ?
                          wire45 : reg52[(3'h4):(2'h3)]))} <= {$unsigned((wire50 >> reg47[(2'h3):(2'h2)]))});
  assign wire60 = (($signed($signed(wire56[(2'h2):(2'h2)])) * wire43) ^~ reg52[(4'h8):(4'h8)]);
  assign wire61 = $signed(reg54[(4'hb):(1'h0)]);
endmodule

module module165  (y, clk, wire170, wire169, wire168, wire167, wire166);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire170;
  input wire [(4'h8):(1'h0)] wire169;
  input wire signed [(5'h12):(1'h0)] wire168;
  input wire [(5'h15):(1'h0)] wire167;
  input wire [(5'h14):(1'h0)] wire166;
  wire signed [(3'h7):(1'h0)] wire191;
  wire signed [(5'h15):(1'h0)] wire190;
  wire [(3'h5):(1'h0)] wire189;
  wire signed [(3'h4):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire186;
  wire [(2'h2):(1'h0)] wire185;
  wire [(4'hc):(1'h0)] wire183;
  wire signed [(5'h11):(1'h0)] wire172;
  wire [(3'h4):(1'h0)] wire171;
  reg signed [(5'h11):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg177 = (1'h0);
  reg [(5'h11):(1'h0)] reg176 = (1'h0);
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg173 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire186,
                 wire185,
                 wire183,
                 wire172,
                 wire171,
                 reg187,
                 reg184,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 (1'h0)};
  assign wire171 = (-(($signed((wire168 == (8'hb7))) ?
                       $unsigned((wire167 != wire166)) : ($unsigned((7'h41)) ?
                           $unsigned((8'hbd)) : (wire166 << wire168))) || wire166));
  assign wire172 = (((wire166[(3'h4):(2'h2)] + ($unsigned(wire167) | wire168)) ^ wire169[(1'h1):(1'h0)]) == wire169);
  always
    @(posedge clk) begin
      reg173 <= $unsigned(wire169[(2'h2):(1'h1)]);
      reg174 <= wire170[(4'hd):(1'h1)];
      if ((^(-($unsigned((~&wire168)) ?
          ($signed((7'h42)) >= (&wire169)) : (^~{wire170, wire167})))))
        begin
          reg175 <= (reg173[(5'h10):(4'he)] ^~ {(((wire166 ?
                      (8'ha7) : wire172) || {wire167}) ?
                  (wire167 ?
                      ((8'ha3) ?
                          (8'hbf) : wire169) : wire169) : (~&(reg173 * reg174)))});
          reg176 <= reg175;
          reg177 <= $signed($unsigned($signed($signed(wire167))));
          if (($unsigned((~reg174[(2'h2):(2'h2)])) && (|$unsigned(((wire170 ?
              wire170 : reg173) >= (~&reg176))))))
            begin
              reg178 <= reg173[(4'hc):(4'h9)];
              reg179 <= (~|wire167[(4'ha):(3'h4)]);
            end
          else
            begin
              reg178 <= $signed((-(+{wire167[(5'h15):(2'h3)],
                  (reg175 >> reg174)})));
              reg179 <= ($unsigned(reg175[(5'h14):(3'h5)]) ?
                  (^wire167) : (reg179[(2'h2):(1'h1)] << $unsigned(($signed(reg177) > wire170))));
              reg180 <= $unsigned($unsigned(wire171));
            end
        end
      else
        begin
          reg175 <= (wire166 >>> ((wire172[(1'h1):(1'h0)] ?
              (8'hbe) : ({reg176, wire166} ?
                  (~^reg177) : $unsigned(wire171))) <= wire167[(5'h11):(5'h11)]));
          if (($unsigned($signed({(wire170 ? (7'h44) : wire170)})) ?
              (&(!$unsigned(wire171[(1'h1):(1'h1)]))) : $unsigned($unsigned((~^$unsigned((8'h9d)))))))
            begin
              reg176 <= ($unsigned((~$unsigned((wire166 <<< reg176)))) >= (reg173[(5'h11):(4'h9)] ?
                  (wire170[(4'h8):(3'h6)] ^ {$signed(reg177),
                      reg179[(4'hf):(4'hf)]}) : wire166[(3'h7):(2'h3)]));
              reg177 <= $signed((($signed((&reg179)) ?
                  ({(7'h40), (8'hb1)} ?
                      reg180 : $signed(wire166)) : (wire172[(1'h1):(1'h1)] == $unsigned(reg177))) != (((~wire169) ?
                  (wire170 ? reg174 : (8'ha3)) : {reg178,
                      reg173}) | (reg179[(4'hf):(3'h5)] - wire169))));
            end
          else
            begin
              reg176 <= ($unsigned($unsigned(reg177[(3'h4):(1'h0)])) && $unsigned($signed(wire168)));
            end
          reg178 <= (8'ha8);
        end
      reg181 <= $unsigned(wire167[(4'h9):(1'h1)]);
      reg182 <= (reg181[(3'h5):(3'h5)] ?
          wire169[(3'h7):(3'h4)] : reg179[(4'h8):(4'h8)]);
    end
  assign wire183 = wire168[(5'h12):(4'hf)];
  always
    @(posedge clk) begin
      reg184 <= wire183[(4'h9):(3'h6)];
    end
  assign wire185 = (8'ha6);
  assign wire186 = reg174;
  always
    @(posedge clk) begin
      reg187 <= $signed($unsigned(((~&{(8'hba),
          wire185}) < ($signed(wire185) && $signed(reg180)))));
    end
  assign wire188 = wire186[(3'h4):(2'h3)];
  assign wire189 = (((-reg187[(4'h8):(3'h6)]) ?
                           ((reg182 ? $signed(wire170) : (^wire185)) ?
                               ($signed(reg173) ?
                                   $signed(reg181) : {(8'hbe),
                                       reg182}) : $unsigned(((7'h44) ?
                                   (8'h9d) : reg175))) : reg187) ?
                       $signed(wire169[(3'h7):(3'h5)]) : (((reg177 ?
                               (&reg181) : $unsigned(reg181)) ?
                           reg180[(4'ha):(3'h7)] : reg173) >>> wire169[(1'h1):(1'h1)]));
  assign wire190 = ((wire169[(3'h4):(2'h3)] ?
                           (~|((^wire170) ?
                               $unsigned((8'hae)) : {wire172})) : (^~reg173[(5'h12):(1'h0)])) ?
                       (wire166 ?
                           reg173[(3'h7):(2'h3)] : reg176[(4'hd):(3'h4)]) : reg176);
  assign wire191 = $signed((&{{(reg178 + reg187), (reg180 - reg173)}}));
endmodule

module module152  (y, clk, wire156, wire155, wire154, wire153);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire156;
  input wire signed [(5'h13):(1'h0)] wire155;
  input wire signed [(4'hc):(1'h0)] wire154;
  input wire [(3'h4):(1'h0)] wire153;
  wire [(2'h2):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire158;
  wire [(5'h12):(1'h0)] wire157;
  assign y = {wire160, wire159, wire158, wire157, (1'h0)};
  assign wire157 = $unsigned($unsigned((wire154 != $unsigned((wire155 ?
                       wire153 : wire153)))));
  assign wire158 = $signed((($signed(wire156) << (~&wire156[(3'h7):(2'h3)])) | (-$signed($signed(wire156)))));
  assign wire159 = (((((~&(8'hbf)) ^~ (wire157 ?
                           (8'hba) : wire156)) <= (~^$signed((8'hae)))) ?
                       (&$signed({wire158})) : (|{(wire155 ?
                               wire153 : (8'ha4))})) * {$unsigned(($unsigned(wire157) ^~ wire155[(5'h13):(3'h7)]))});
  assign wire160 = ((~|($signed((wire153 | wire156)) ?
                       wire155[(4'he):(3'h5)] : ((wire153 ? wire158 : (7'h40)) ?
                           (^wire153) : (wire159 ?
                               wire157 : wire157)))) && {(~^(^(wire154 ?
                           wire157 : wire154))),
                       wire159});
endmodule
