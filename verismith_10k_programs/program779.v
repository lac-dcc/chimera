module top
#(parameter param170 = (^(!(^~((+(8'hab)) ? ((8'hbb) ? (8'ha5) : (8'hbb)) : {(8'hba)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire169;
  wire [(4'h9):(1'h0)] wire167;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  assign y = {wire169, wire167, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = {wire2, (~^$unsigned(wire2[(2'h3):(2'h2)]))};
  assign wire5 = $unsigned($signed($signed(wire4[(3'h4):(2'h2)])));
  assign wire6 = (8'ha8);
  assign wire7 = (8'hae);
  assign wire8 = $unsigned(($signed(wire6[(3'h6):(1'h0)]) ?
                     wire2 : $signed(wire1)));
  module9 #() modinst168 (.wire10(wire8), .wire11(wire7), .y(wire167), .wire13(wire1), .wire12(wire5), .clk(clk));
  assign wire169 = (^~wire0);
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire166;
  wire [(4'ha):(1'h0)] wire165;
  wire [(5'h11):(1'h0)] wire164;
  wire [(4'h9):(1'h0)] wire163;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire143;
  wire signed [(4'hf):(1'h0)] wire145;
  wire signed [(5'h14):(1'h0)] wire146;
  wire signed [(5'h15):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire161;
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire83,
                 wire27,
                 wire85,
                 wire143,
                 wire145,
                 wire146,
                 wire147,
                 wire161,
                 (1'h0)};
  module14 #() modinst28 (wire27, clk, wire10, wire12, wire11, wire13);
  module29 #() modinst84 (.wire34(wire10), .wire32(wire13), .wire33(wire27), .wire30(wire11), .clk(clk), .wire31(wire12), .y(wire83));
  assign wire85 = $signed(wire27);
  module86 #() modinst144 (.wire87(wire10), .clk(clk), .y(wire143), .wire90(wire12), .wire88(wire83), .wire89(wire85));
  assign wire145 = wire85[(2'h3):(1'h1)];
  assign wire146 = $signed({wire27});
  assign wire147 = wire12[(4'h9):(4'h8)];
  module148 #() modinst162 (wire161, clk, wire12, wire85, wire11, wire146, wire27);
  assign wire163 = wire10[(5'h11):(1'h1)];
  assign wire164 = (8'hb6);
  assign wire165 = (($unsigned((&(wire12 <<< wire12))) ?
                           wire83 : (~&$signed($signed(wire146)))) ?
                       $signed($signed(wire11[(3'h7):(3'h6)])) : $unsigned($unsigned(($unsigned(wire145) ?
                           wire145[(4'hf):(4'hc)] : (~&wire12)))));
  assign wire166 = ($unsigned(wire146) ?
                       ($signed(wire27[(5'h12):(3'h4)]) != ($signed((wire165 > wire161)) ?
                           (-wire12[(1'h0):(1'h0)]) : (|wire164))) : (^~($unsigned((8'hb1)) != $unsigned(wire164))));
endmodule

module module148
#(parameter param159 = (!({({(7'h42), (8'ha1)} == ((8'hac) ? (8'ha0) : (8'ha5))), ({(8'ha3)} ? (8'ha8) : ((7'h43) | (8'ha2)))} ? ((~^((8'hb1) ? (7'h40) : (8'hbb))) ^~ (((8'h9d) ^ (8'hae)) ~^ (+(8'h9e)))) : (!(8'ha0)))), 
parameter param160 = (|((^~((|param159) ? (&param159) : (param159 | (8'h9d)))) ? (({param159} ? param159 : (param159 != param159)) || (~&(+param159))) : (((+param159) ? (param159 ? param159 : param159) : param159) - ((param159 ? param159 : param159) + (param159 << param159))))))
(y, clk, wire153, wire152, wire151, wire150, wire149);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire153;
  input wire signed [(3'h7):(1'h0)] wire152;
  input wire signed [(4'hd):(1'h0)] wire151;
  input wire [(4'hc):(1'h0)] wire150;
  input wire [(5'h10):(1'h0)] wire149;
  wire signed [(2'h2):(1'h0)] wire158;
  wire [(5'h12):(1'h0)] wire157;
  wire signed [(4'hd):(1'h0)] wire156;
  wire [(4'hd):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire154;
  assign y = {wire158, wire157, wire156, wire155, wire154, (1'h0)};
  assign wire154 = wire152;
  assign wire155 = ((wire151 << (((~|wire150) ?
                           (wire154 ?
                               wire151 : wire152) : (wire154 * wire154)) << wire153[(3'h7):(3'h5)])) ?
                       (wire149[(5'h10):(2'h2)] ?
                           (wire151 & $unsigned(wire152[(1'h1):(1'h0)])) : (^~((~wire150) | wire150))) : (wire150[(1'h1):(1'h0)] * wire151));
  assign wire156 = $unsigned(({(|wire154)} || wire153));
  assign wire157 = (($signed((~&$unsigned((8'h9c)))) ^~ ($signed(wire154[(1'h0):(1'h0)]) ?
                           wire151[(1'h0):(1'h0)] : (~^$signed(wire152)))) ?
                       wire149 : ((+$signed($unsigned(wire150))) <<< (~|wire156)));
  assign wire158 = ($unsigned((({(7'h40), wire149} ? (~^wire150) : wire157) ?
                       wire156 : wire151)) && wire151[(2'h2):(2'h2)]);
endmodule

module module86
#(parameter param141 = ((!(((-(8'hac)) * ((8'ha0) ^ (8'hb8))) ? {((8'ha5) ? (8'hbf) : (8'h9c))} : ((~|(8'ha7)) ^~ {(7'h44), (8'ha6)}))) << ({(~((8'ha5) <<< (8'ha9)))} ? (~^({(8'h9c), (8'ha0)} ? ((8'hae) ? (8'ha7) : (8'h9f)) : ((8'ha8) ? (8'ha7) : (8'hab)))) : (8'hb1))), 
parameter param142 = (param141 ? ((((param141 == param141) ? (param141 ? param141 : (8'ha4)) : (&(8'hb0))) << (~|param141)) ? ((!((8'had) ? param141 : param141)) ^~ param141) : (((8'hb3) ~^ param141) ? (param141 ? param141 : param141) : (!((8'hab) && param141)))) : (~^((^~param141) ? ((param141 < param141) ? (+param141) : (+param141)) : ((param141 ? param141 : param141) ? (~|param141) : (8'hb7))))))
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire90;
  input wire signed [(3'h5):(1'h0)] wire89;
  input wire [(5'h10):(1'h0)] wire88;
  input wire [(4'hc):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire140;
  wire signed [(5'h15):(1'h0)] wire139;
  wire signed [(5'h14):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire137;
  wire signed [(4'hc):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(3'h6):(1'h0)] wire96;
  wire signed [(4'h9):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire94;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire91;
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(3'h7):(1'h0)] reg125 = (1'h0);
  reg [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(4'h9):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire112,
                 wire111,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg136,
                 reg135,
                 reg134,
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
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire91 = $unsigned({({(wire88 * wire88)} ?
                          wire87[(2'h2):(1'h1)] : $signed($signed(wire90))),
                      $signed((wire87 == wire90))});
  assign wire92 = $unsigned({$unsigned(((wire90 - wire88) > $unsigned(wire91)))});
  assign wire93 = ({$signed({$signed(wire90), wire92})} >= {(wire91 ?
                          (wire91[(2'h2):(1'h1)] ?
                              {wire90} : wire92[(3'h6):(1'h1)]) : wire91[(4'hb):(3'h7)]),
                      $signed($signed(wire92[(4'h9):(4'h8)]))});
  assign wire94 = {wire91[(1'h1):(1'h0)]};
  assign wire95 = $unsigned(wire90[(3'h5):(3'h4)]);
  assign wire96 = {$signed((-$unsigned(wire91[(4'h8):(2'h3)]))),
                      (~|wire87[(2'h3):(1'h1)])};
  always
    @(posedge clk) begin
      if ((8'hac))
        begin
          reg97 <= wire93[(4'hb):(3'h4)];
          reg98 <= {$unsigned((&(wire87 ~^ (reg97 >>> reg97))))};
          reg99 <= (!(7'h43));
        end
      else
        begin
          reg97 <= (((wire91 | $unsigned((~|wire90))) ^ $unsigned(wire90[(2'h2):(2'h2)])) && $unsigned((+$signed(wire89))));
        end
      reg100 <= $unsigned(($unsigned(($signed(wire91) * $unsigned(wire87))) || $unsigned(wire87[(2'h3):(1'h0)])));
      reg101 <= (({$signed($unsigned(wire94))} >= wire89) < wire89[(1'h0):(1'h0)]);
      reg102 <= wire90[(1'h1):(1'h0)];
      if ((+(wire90 ?
          {((|reg100) ?
                  $unsigned(reg101) : ((8'ha6) ?
                      wire87 : wire87))} : ($signed((!(8'hbb))) ?
              $signed((~wire94)) : wire92))))
        begin
          reg103 <= reg97[(1'h1):(1'h0)];
          if ($unsigned($signed({wire94[(3'h6):(3'h6)]})))
            begin
              reg104 <= ($unsigned(((wire89 & wire93[(3'h5):(3'h5)]) << $signed((wire88 ?
                      (8'ha0) : wire87)))) ?
                  (^(-((wire93 ?
                      reg101 : (8'ha4)) + $unsigned(wire90)))) : ({((8'hac) ?
                              $unsigned(wire91) : wire88)} ?
                      $signed($signed($signed(wire89))) : $unsigned((8'hb0))));
              reg105 <= reg100;
              reg106 <= wire87[(4'h8):(1'h1)];
              reg107 <= (~|reg100);
              reg108 <= reg107;
            end
          else
            begin
              reg104 <= $unsigned(($unsigned(((wire94 + wire91) > (reg101 ?
                      wire87 : (7'h40)))) ?
                  $unsigned(((wire93 ? reg99 : wire94) ?
                      (reg103 >= reg106) : (^wire88))) : ((~|$signed(wire95)) ?
                      $unsigned($unsigned((7'h40))) : $unsigned({wire94}))));
              reg105 <= (reg102[(1'h1):(1'h1)] ^ {($unsigned(wire92[(3'h4):(1'h1)]) - {wire91[(2'h2):(1'h0)],
                      (wire89 ? reg99 : reg102)}),
                  $signed($signed((reg98 <<< wire89)))});
              reg106 <= (wire91 - ((~&reg101) ?
                  ((((8'ha6) - reg104) ?
                      (-reg107) : reg102) <<< (8'h9e)) : $signed((wire94[(3'h6):(1'h0)] ^ (~|reg103)))));
            end
          reg109 <= ($unsigned($unsigned(({reg100} ?
                  (reg106 ? reg98 : reg97) : $unsigned(wire93)))) ?
              (((wire87[(1'h1):(1'h1)] || {wire89, reg108}) > (((8'ha5) ?
                      reg105 : wire95) >> wire90[(3'h5):(2'h3)])) ?
                  wire89 : ($unsigned($unsigned((7'h42))) ?
                      wire96 : reg106[(4'hc):(3'h7)])) : wire95);
          reg110 <= $signed($signed(($signed((reg98 > (7'h42))) ?
              {reg106[(2'h2):(1'h1)]} : (-(8'h9d)))));
        end
      else
        begin
          reg103 <= (((+((reg109 ^~ reg106) * (reg107 ?
                  reg107 : wire92))) << (8'haf)) ?
              reg97 : {(((~&wire92) ? (^~wire88) : $signed((8'hb6))) ?
                      wire93[(3'h4):(1'h1)] : reg110),
                  reg109});
          reg104 <= wire88;
          reg105 <= {(~|(~^reg107))};
        end
    end
  assign wire111 = $signed((^$signed($unsigned(reg98[(2'h2):(1'h1)]))));
  assign wire112 = reg104[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ((($signed(reg105[(2'h2):(1'h0)]) >>> {$signed(((8'hbf) >= reg102)),
          (reg104 ~^ (~&wire92))}) * reg105[(2'h2):(1'h1)]))
        begin
          if ((-reg101[(3'h6):(3'h5)]))
            begin
              reg113 <= $signed(wire89);
              reg114 <= (8'hb0);
            end
          else
            begin
              reg113 <= reg101[(4'hd):(2'h2)];
              reg114 <= reg105;
              reg115 <= $signed((reg102[(2'h2):(1'h1)] ^~ (~^$signed((reg100 < (8'hbd))))));
            end
          if (($unsigned(reg100) ? $signed(reg99[(3'h5):(2'h2)]) : reg110))
            begin
              reg116 <= wire90[(1'h1):(1'h0)];
              reg117 <= wire92[(3'h4):(3'h4)];
            end
          else
            begin
              reg116 <= ((^~(-(((8'hab) == (8'ha8)) ?
                  (wire91 ? wire95 : reg100) : reg108))) && reg113);
              reg117 <= ({(8'h9e), (&$unsigned((8'had)))} > $signed((reg117 ?
                  reg116[(3'h4):(2'h3)] : (reg100 != (reg109 ?
                      wire88 : reg102)))));
              reg118 <= (~(7'h43));
              reg119 <= $unsigned($unsigned(((~&$unsigned(wire89)) - wire111[(1'h0):(1'h0)])));
            end
          reg120 <= wire93;
          if (reg119)
            begin
              reg121 <= $unsigned(reg110[(1'h0):(1'h0)]);
              reg122 <= $unsigned(($signed((-reg108)) | {reg106}));
              reg123 <= wire94;
            end
          else
            begin
              reg121 <= ({(^~((reg123 ? wire112 : reg121) ^~ {(7'h40)})),
                  (~|$signed(reg99))} <<< $unsigned(({(-(8'ha0)),
                      $unsigned(wire96)} ?
                  wire87 : ((&reg121) ? (~reg119) : (8'hba)))));
            end
          if ($signed(reg102[(2'h2):(1'h1)]))
            begin
              reg124 <= $unsigned($signed((wire88 && reg97[(3'h5):(3'h4)])));
              reg125 <= $unsigned(reg107);
              reg126 <= (8'h9c);
              reg127 <= (reg108[(4'ha):(4'h8)] || $signed((reg110[(2'h2):(2'h2)] ?
                  (!(reg114 ^ reg99)) : $unsigned($signed(wire90)))));
              reg128 <= reg126;
            end
          else
            begin
              reg124 <= reg128;
              reg125 <= (8'hbf);
            end
        end
      else
        begin
          reg113 <= $unsigned($signed(wire89[(1'h0):(1'h0)]));
          if (($signed($signed((|$signed(reg119)))) ?
              ($signed($unsigned((8'haf))) <= (reg118[(5'h10):(5'h10)] ?
                  ((reg125 * reg119) ?
                      {(8'hb7)} : $unsigned(reg128)) : (~|reg128[(3'h6):(1'h0)]))) : reg124[(1'h0):(1'h0)]))
            begin
              reg114 <= wire112[(4'hb):(3'h4)];
              reg115 <= $unsigned(((reg121[(1'h0):(1'h0)] ?
                  reg122 : reg128[(2'h2):(1'h0)]) + (($unsigned(reg105) ?
                      (-wire89) : (^~reg115)) ?
                  wire111[(2'h2):(1'h1)] : reg128[(5'h14):(3'h5)])));
              reg116 <= $signed((reg110[(3'h7):(3'h4)] ?
                  {($signed(reg104) ? $unsigned(reg127) : (wire112 != (8'hb2))),
                      wire111} : $signed(((reg115 ?
                      wire111 : (7'h40)) >>> (~&reg122)))));
              reg117 <= $signed((^~{$signed({reg106, reg99}),
                  ($unsigned((8'ha6)) ? wire93 : (reg128 >> wire95))}));
              reg118 <= $signed(reg115[(1'h0):(1'h0)]);
            end
          else
            begin
              reg114 <= $signed($unsigned($unsigned(wire90)));
              reg115 <= reg104;
            end
          reg119 <= $signed($signed($signed((!reg109))));
          reg120 <= wire94;
        end
    end
  always
    @(posedge clk) begin
      if ($signed($signed(reg128[(3'h7):(3'h4)])))
        begin
          reg129 <= (((^~(wire112 ? {wire90} : wire90)) ?
              reg109 : $unsigned({reg128,
                  (^reg101)})) != ($unsigned((~reg126)) ^~ (^($unsigned((8'hb5)) ?
              (+reg110) : $unsigned(reg104)))));
        end
      else
        begin
          reg129 <= reg124;
          reg130 <= reg108;
          reg131 <= (8'hb5);
          if ((~^$unsigned((reg114[(3'h5):(2'h2)] ?
              (~&wire94[(3'h6):(2'h3)]) : reg123))))
            begin
              reg132 <= (wire96 >> $unsigned({reg103[(3'h5):(1'h0)]}));
              reg133 <= (|$signed(({wire91[(2'h2):(2'h2)], $unsigned(wire88)} ?
                  ((^reg124) || wire94[(1'h1):(1'h0)]) : (reg102 && $unsigned(reg129)))));
              reg134 <= reg102;
              reg135 <= {(7'h41)};
            end
          else
            begin
              reg132 <= reg108;
              reg133 <= (+(~(^~$unsigned(reg130[(4'hd):(3'h7)]))));
              reg134 <= (~$signed($signed((8'hb9))));
              reg135 <= reg110[(4'hb):(3'h7)];
            end
        end
      reg136 <= (-{($unsigned({wire94}) ?
              $unsigned((reg131 ?
                  wire94 : reg107)) : (reg121[(2'h2):(1'h1)] <= $signed(wire95)))});
    end
  assign wire137 = {($unsigned(($unsigned(reg97) ?
                           (~&reg99) : wire95)) | (reg113 ?
                           {(reg110 <<< reg101)} : {$unsigned(reg121)}))};
  assign wire138 = (|{reg123, ($unsigned((^~wire91)) - reg136)});
  assign wire139 = ((reg105 > (wire96 >>> ((~&(8'hb8)) ?
                       $signed(reg105) : (~|reg130)))) != $signed((8'h9e)));
  assign wire140 = (reg97 ?
                       ((($signed((8'ha6)) ?
                           $unsigned(reg122) : $signed(wire139)) - ((8'hb7) + (~|reg123))) && reg99) : ((reg100 < $signed(reg132[(4'h9):(3'h5)])) ?
                           (reg107 >>> (reg99 ?
                               (reg104 | wire89) : reg110)) : {reg127,
                               (reg115[(3'h5):(3'h5)] ?
                                   $unsigned(wire112) : $signed(reg131))}));
endmodule

module module29  (y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h23a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire34;
  input wire [(3'h6):(1'h0)] wire33;
  input wire signed [(4'hc):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire signed [(4'ha):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire82;
  wire signed [(4'hf):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire80;
  wire signed [(5'h11):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(4'hb):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire35;
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire59,
                 wire58,
                 wire46,
                 wire45,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire35 = (-$unsigned(((^~wire33) >>> wire34)));
  assign wire36 = $signed($unsigned($signed($unsigned($signed(wire35)))));
  assign wire37 = wire33[(3'h6):(2'h2)];
  assign wire38 = ((wire33[(3'h4):(1'h1)] | (wire30 ~^ $unsigned(wire35[(3'h5):(3'h5)]))) ?
                      (wire32 && {wire34}) : (wire36[(1'h0):(1'h0)] ?
                          $signed({{wire33, (8'haa)},
                              wire36[(1'h0):(1'h0)]}) : wire33));
  assign wire39 = (|$signed(($signed(wire32[(4'hc):(1'h0)]) ?
                      ($unsigned(wire30) < (wire36 ?
                          wire36 : wire33)) : wire31)));
  assign wire40 = {wire33,
                      (~(wire38 ?
                          (~|$signed(wire31)) : $signed((wire31 <= wire34))))};
  always
    @(posedge clk) begin
      reg41 <= (~wire40[(2'h2):(1'h1)]);
      reg42 <= ($signed({($unsigned(reg41) ?
                  (wire33 ? wire36 : reg41) : {wire38}),
              $unsigned((!reg41))}) ?
          (!(^~wire37[(2'h3):(2'h2)])) : (8'hb5));
      if (((!(+(~&(wire32 ?
          wire37 : wire33)))) && $unsigned(($unsigned($unsigned(wire40)) >= wire35))))
        begin
          reg43 <= ($unsigned(wire33) ^~ (wire34 ^ ($signed(wire38[(2'h3):(2'h2)]) ?
              wire32[(4'hc):(2'h2)] : ((-wire34) ~^ (wire39 ?
                  wire40 : wire34)))));
          reg44 <= $unsigned(wire40);
        end
      else
        begin
          reg43 <= ($signed((((~wire31) ? {(8'ha2)} : (~wire36)) ?
                  wire34[(4'hc):(4'h8)] : (+reg41[(3'h4):(1'h0)]))) ?
              ($unsigned(reg44) ?
                  {(~&(wire33 ? wire40 : wire36)),
                      {{reg44, wire38}}} : $signed((wire32 ?
                      $unsigned(wire30) : (wire38 ?
                          wire40 : wire35)))) : wire33[(1'h1):(1'h1)]);
        end
    end
  assign wire45 = $unsigned((-(wire39[(2'h3):(1'h0)] & {$signed(reg42)})));
  assign wire46 = {$signed(($signed((wire32 <= wire37)) != $signed((|wire37)))),
                      reg41[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      reg47 <= wire34[(2'h2):(1'h0)];
      if ($signed((-wire46)))
        begin
          reg48 <= ($signed(wire33[(2'h2):(1'h0)]) ?
              $unsigned(($unsigned($unsigned((8'ha4))) ?
                  wire32[(4'hb):(3'h5)] : (wire34[(4'he):(2'h2)] ?
                      reg43[(3'h4):(1'h0)] : (wire39 ^ reg44)))) : (reg47 ?
                  ($signed((^~wire34)) - (~^reg42[(4'ha):(2'h3)])) : wire46[(3'h4):(2'h2)]));
        end
      else
        begin
          if ($signed($signed($unsigned((~|$unsigned(wire46))))))
            begin
              reg48 <= wire39;
            end
          else
            begin
              reg48 <= $signed((((~&(wire30 ^ wire45)) == $signed($signed((8'haa)))) ?
                  (+wire30[(2'h3):(1'h1)]) : wire37[(4'hc):(4'h9)]));
            end
          reg49 <= {(((^wire31[(3'h6):(3'h4)]) < $signed({(7'h44), (8'ha6)})) ?
                  $unsigned($signed((reg43 ?
                      (8'ha6) : wire45))) : (!reg43[(3'h4):(2'h2)])),
              wire38[(1'h1):(1'h0)]};
          if ($signed(wire37[(3'h4):(2'h3)]))
            begin
              reg50 <= $unsigned(((wire39[(4'ha):(4'h8)] ?
                  (&wire36) : {$unsigned(wire30),
                      {wire45}}) ^~ reg43[(2'h3):(2'h2)]));
            end
          else
            begin
              reg50 <= ({(&wire38[(2'h2):(1'h1)]),
                  $unsigned(($unsigned(reg47) - $unsigned(reg49)))} >= {(($unsigned(wire45) > (wire38 ?
                          reg41 : wire39)) ?
                      wire31[(4'hd):(4'h9)] : ({(7'h41)} <= wire34)),
                  reg47[(2'h3):(1'h1)]});
              reg51 <= wire33[(1'h0):(1'h0)];
              reg52 <= (reg48[(1'h0):(1'h0)] ?
                  $unsigned($signed(wire35)) : wire40[(2'h2):(1'h1)]);
            end
          if ((~^reg41))
            begin
              reg53 <= $signed(wire45);
              reg54 <= (($signed((8'hb0)) ?
                      $signed(reg49) : $unsigned($unsigned(wire36))) ?
                  $signed((wire32 | wire46)) : (((~&$unsigned(wire38)) ?
                          $signed(wire37[(2'h3):(1'h0)]) : wire40) ?
                      (!(-$signed((8'hb5)))) : ((wire45[(2'h2):(1'h0)] ?
                              ((8'ha2) != wire37) : (wire34 ? reg53 : reg47)) ?
                          (reg43[(1'h1):(1'h0)] || reg49[(4'hd):(3'h7)]) : $signed((reg52 ^ reg41)))));
              reg55 <= (({wire34} ?
                      ($unsigned({(8'haf)}) ?
                          $unsigned($unsigned((8'ha0))) : wire40[(2'h3):(2'h2)]) : reg53) ?
                  ($unsigned(reg43) ?
                      reg44[(3'h7):(3'h6)] : wire35) : (wire35[(1'h1):(1'h1)] ?
                      (8'hb3) : (~&(~^$unsigned(reg44)))));
            end
          else
            begin
              reg53 <= $unsigned($unsigned($unsigned(reg55)));
            end
        end
      reg56 <= reg43;
      reg57 <= wire40[(2'h3):(1'h0)];
    end
  assign wire58 = (wire31 ?
                      ($unsigned($signed(wire34[(2'h2):(1'h1)])) ?
                          ($unsigned((wire36 ? wire33 : (8'hbf))) ?
                              ((wire32 == wire46) ?
                                  (^reg44) : (~&wire37)) : (8'ha2)) : (reg54[(4'hd):(4'hd)] ?
                              {(~&(8'hb9))} : reg55)) : $signed(wire37));
  assign wire59 = $signed((wire46[(1'h0):(1'h0)] ?
                      $unsigned($unsigned($signed(wire33))) : ((+$unsigned(wire58)) ?
                          ({wire37} ?
                              wire45[(1'h1):(1'h1)] : {wire34,
                                  wire32}) : reg54)));
  always
    @(posedge clk) begin
      reg60 <= $unsigned($signed(((reg47 & wire31[(5'h11):(4'h9)]) << ($unsigned(wire34) ?
          $signed(reg54) : $signed(wire59)))));
      if (wire46[(5'h10):(3'h7)])
        begin
          reg61 <= reg54[(5'h10):(3'h7)];
          if ({$unsigned(((8'hb4) ?
                  reg49[(3'h7):(3'h4)] : wire30[(3'h4):(3'h4)]))})
            begin
              reg62 <= $unsigned(reg49[(4'h8):(3'h5)]);
              reg63 <= ((reg47 ?
                      (~|reg42[(4'h9):(3'h6)]) : wire35[(2'h3):(2'h2)]) ?
                  (!wire32[(1'h1):(1'h0)]) : $signed($unsigned(($unsigned((8'ha6)) & $unsigned(wire59)))));
              reg64 <= $signed(reg47);
            end
          else
            begin
              reg62 <= $unsigned(($signed($unsigned(wire35)) && $unsigned({reg43[(2'h3):(2'h2)]})));
            end
          reg65 <= (~($signed(reg44) ?
              (!$signed((reg55 ? wire30 : wire39))) : wire45));
          reg66 <= reg44;
          reg67 <= (($unsigned($signed($unsigned(reg60))) ?
              ((reg65 - $unsigned(wire37)) ?
                  $signed($unsigned((8'ha5))) : ((wire39 - reg41) ?
                      reg44 : $unsigned(reg47))) : $signed($unsigned((7'h43)))) & {(~&{$unsigned(wire30)}),
              (($unsigned((7'h43)) ?
                  (reg41 ? reg50 : wire33) : wire34[(1'h1):(1'h1)]) >> reg43)});
        end
      else
        begin
          if ((reg65 * $unsigned(reg54[(4'hc):(4'hb)])))
            begin
              reg61 <= reg49;
            end
          else
            begin
              reg61 <= reg41;
            end
          reg62 <= (8'haa);
        end
    end
  always
    @(posedge clk) begin
      reg68 <= {$unsigned($unsigned((((8'ha3) || reg57) ? wire31 : (8'hac))))};
      if ((((~reg60[(2'h2):(1'h0)]) ?
          $signed($unsigned((-wire34))) : (&({wire45} ?
              ((8'hb7) ? wire58 : reg60) : (wire45 ?
                  wire36 : wire38)))) ^ ($signed(wire39) ?
          reg42 : {reg49[(4'hc):(2'h3)], $signed(reg64)})))
        begin
          reg69 <= wire39;
          if ((($signed({$unsigned((8'hbf))}) ?
              (((reg44 ^ reg55) ?
                  reg62 : reg53) | (^~reg62[(4'hd):(3'h5)])) : (reg62[(3'h4):(1'h1)] ^ (reg52[(2'h2):(1'h0)] ~^ wire37[(3'h4):(1'h1)]))) + (reg48 > (($unsigned(reg49) >> (reg55 ?
              reg60 : (8'hbe))) >> (8'h9e)))))
            begin
              reg70 <= $signed((wire35 ?
                  ((^~(wire46 ? wire46 : reg61)) - reg68) : reg53));
              reg71 <= reg57;
              reg72 <= ($signed((^(reg70[(4'ha):(2'h2)] == reg68[(4'he):(3'h4)]))) ~^ ((!($unsigned(reg44) ?
                      (8'hb7) : $unsigned(wire38))) ?
                  reg42 : $signed((((8'h9d) ~^ reg71) ^~ reg48))));
            end
          else
            begin
              reg70 <= (~&$unsigned((8'hb7)));
              reg71 <= $signed((~|reg72[(2'h3):(1'h1)]));
              reg72 <= {wire37};
              reg73 <= (^~wire36[(2'h2):(2'h2)]);
              reg74 <= (reg56 ?
                  {$signed(((reg54 >= wire35) ?
                          $signed(reg42) : $unsigned((8'haa))))} : ((^~$unsigned((wire35 ?
                      wire33 : wire40))) + (($signed(reg49) ?
                          (~wire35) : (reg63 ^~ wire58)) ?
                      $unsigned((~|reg66)) : reg63[(4'h8):(2'h2)])));
            end
          reg75 <= ((~reg41) <= $unsigned($signed($signed($unsigned(wire37)))));
          if ($signed((^~(reg75[(2'h2):(1'h1)] ?
              $signed((wire30 ? reg68 : reg72)) : reg68[(3'h6):(3'h5)]))))
            begin
              reg76 <= (~^(7'h41));
              reg77 <= $signed($unsigned(wire35[(4'h8):(4'h8)]));
              reg78 <= $unsigned($unsigned((wire33[(1'h0):(1'h0)] ?
                  reg67 : $signed((reg63 << reg77)))));
              reg79 <= (8'hab);
            end
          else
            begin
              reg76 <= wire32;
            end
        end
      else
        begin
          reg69 <= $unsigned(reg66);
          if (($unsigned((reg43[(3'h4):(1'h1)] >>> ((reg71 ?
              reg43 : reg42) << (!wire35)))) >> (((8'hb2) > {(reg60 & reg70),
              {reg65, reg50}}) <<< $unsigned($unsigned({reg78})))))
            begin
              reg70 <= {($unsigned(reg49) - (($unsigned(reg73) | (wire59 ?
                      reg74 : reg77)) <<< ({reg41, reg74} >>> (~^reg75))))};
              reg71 <= $unsigned($unsigned($unsigned(reg51)));
              reg72 <= reg48;
            end
          else
            begin
              reg70 <= $unsigned(reg77);
              reg71 <= (~^((reg42 << wire34[(2'h3):(1'h0)]) == reg61));
            end
          reg73 <= ((~^(reg51 & reg47[(4'hf):(4'hb)])) ~^ $signed(reg60[(5'h11):(4'ha)]));
          reg74 <= ($unsigned((8'hbe)) ?
              $signed((wire45[(3'h4):(1'h0)] ?
                  {reg56} : $signed(((8'hbf) < reg53)))) : reg77);
        end
    end
  assign wire80 = ({reg68[(3'h4):(1'h1)]} != (8'hb6));
  assign wire81 = ($unsigned((-reg56)) >>> wire40);
  assign wire82 = $unsigned(({{(wire35 <<< reg70)},
                          $unsigned({reg70, wire30})} ?
                      wire35 : reg74));
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire signed [(4'hd):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(4'h8):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 (1'h0)};
  assign wire19 = (!wire16);
  assign wire20 = {(wire19 ?
                          wire19 : ((~^wire18) ?
                              (~^$signed((8'hb1))) : $signed($signed(wire17))))};
  assign wire21 = (wire15[(4'hc):(4'h9)] ? wire18 : $unsigned(wire20));
  assign wire22 = $signed((wire19 ?
                      $unsigned($unsigned((wire20 + wire19))) : $signed(wire19)));
  assign wire23 = (wire15 * wire22);
  assign wire24 = wire16;
  assign wire25 = (({wire15, wire15[(2'h2):(1'h0)]} ?
                          $unsigned(wire19) : ($unsigned(wire23) ?
                              {$unsigned(wire22)} : $signed(wire23))) ?
                      wire22[(3'h5):(3'h5)] : $unsigned(wire19));
  assign wire26 = ((!wire20[(2'h2):(1'h1)]) == {$signed({wire15[(1'h1):(1'h0)],
                          $unsigned(wire21)})});
endmodule
