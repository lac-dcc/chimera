module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire183;
  wire [(5'h12):(1'h0)] wire182;
  wire signed [(3'h6):(1'h0)] wire181;
  wire signed [(4'hc):(1'h0)] wire180;
  wire [(3'h6):(1'h0)] wire178;
  wire signed [(5'h14):(1'h0)] wire5;
  assign y = {wire183, wire182, wire181, wire180, wire178, wire5, (1'h0)};
  assign wire5 = wire3[(2'h2):(1'h0)];
  module6 #() modinst179 (wire178, clk, wire5, wire2, wire4, wire0);
  assign wire180 = wire2;
  assign wire181 = ((wire178 ?
                       ((wire180[(3'h4):(2'h3)] ? {wire1} : $unsigned(wire5)) ?
                           wire5 : (wire2 ?
                               (wire4 ?
                                   (8'hb9) : wire2) : $unsigned(wire3))) : $signed({{wire1,
                               wire0},
                           wire5[(4'hb):(4'ha)]})) - wire1[(3'h6):(2'h2)]);
  assign wire182 = {(8'hbd),
                       ((wire181 ?
                           $signed($signed(wire3)) : (wire0 > wire3)) <<< wire0[(4'hb):(1'h1)])};
  assign wire183 = wire2;
endmodule

module module6
#(parameter param176 = (|((({(8'h9d)} && (~^(8'ha1))) ? (((8'hbf) <<< (7'h44)) ? (!(8'h9f)) : (|(8'h9c))) : (((8'ha1) ? (8'ha9) : (8'had)) ? ((8'hb5) ? (8'hb2) : (8'hb5)) : (&(8'ha5)))) ? ((-(^(8'hac))) ? {{(8'hb1), (8'hbb)}, (8'ha6)} : {(|(8'hbd)), ((8'h9d) ? (8'ha0) : (8'ha7))}) : ((8'ha5) ? {(!(7'h43))} : (((8'hb9) ? (8'hb9) : (8'hb0)) ? ((8'hb3) * (7'h42)) : {(8'ha3)})))), 
parameter param177 = (((!(8'hac)) ? ({(param176 ? param176 : param176)} >>> ((-param176) >= (!param176))) : ((&(param176 & param176)) ? ({param176, param176} > (param176 ^~ param176)) : param176)) ^ (~&{param176, param176})))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h158):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(4'hc):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire58;
  wire [(4'he):(1'h0)] wire59;
  wire signed [(4'he):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(5'h12):(1'h0)] wire126;
  wire signed [(3'h6):(1'h0)] wire161;
  reg [(5'h14):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg174 = (1'h0);
  reg [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg171 = (1'h0);
  reg [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(4'hf):(1'h0)] reg168 = (1'h0);
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg [(3'h6):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg164 = (1'h0);
  reg [(3'h7):(1'h0)] reg163 = (1'h0);
  assign y = {wire11,
                 wire49,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire126,
                 wire161,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 (1'h0)};
  assign wire11 = $unsigned((^(~|(|wire7[(4'hb):(4'h8)]))));
  module12 #() modinst50 (wire49, clk, wire10, wire8, wire7, wire11);
  assign wire51 = (!(wire7[(3'h6):(1'h0)] || wire7));
  assign wire52 = (7'h41);
  assign wire53 = $unsigned($signed((|wire49)));
  assign wire54 = {wire11};
  assign wire55 = ({wire54} >= wire54[(2'h3):(2'h3)]);
  assign wire56 = $signed(wire11[(4'h8):(2'h2)]);
  assign wire57 = (8'hab);
  assign wire58 = wire8[(3'h6):(3'h5)];
  assign wire59 = (-(((8'hac) ? wire56 : $signed((+wire52))) ?
                      $signed((((8'hb8) ?
                          wire51 : wire9) < $unsigned(wire54))) : ($unsigned(((8'ha8) ?
                          wire52 : wire58)) != ({wire56} ?
                          (wire53 & wire7) : $signed(wire8)))));
  assign wire60 = wire51[(1'h1):(1'h0)];
  assign wire61 = $signed({(~$unsigned({wire49, wire59})),
                      (wire10 ?
                          $unsigned((-wire58)) : $unsigned((wire51 ?
                              wire49 : wire51)))});
  assign wire62 = wire55[(2'h2):(2'h2)];
  assign wire63 = ((~^(^~(~|$signed((8'hbd))))) * wire60[(3'h7):(2'h2)]);
  assign wire64 = (-(~(wire10 * $unsigned(wire49[(1'h1):(1'h0)]))));
  module65 #() modinst127 (wire126, clk, wire55, wire54, wire52, wire49);
  module128 #() modinst162 (wire161, clk, wire53, wire54, wire57, wire7, wire52);
  always
    @(posedge clk) begin
      reg163 <= $unsigned((($signed((wire7 ? wire55 : wire62)) ?
              wire161 : $signed((wire126 ? (8'ha5) : (7'h40)))) ?
          (((&wire11) ?
              $signed(wire10) : wire63[(4'h9):(3'h6)]) >> wire58) : wire161[(2'h3):(2'h2)]));
      if (((!(~|wire7)) ?
          $unsigned({$signed((|wire57)),
              (((8'hb4) | wire58) ?
                  (wire58 > (8'hb4)) : $signed(wire11))}) : ($signed(wire52) ?
              $unsigned({(wire9 <= wire60)}) : (~&((wire126 ^~ wire56) | $signed(wire56))))))
        begin
          reg164 <= $unsigned((wire10 ^~ reg163[(3'h7):(3'h5)]));
          if ($signed($unsigned($signed(((wire57 ?
              wire11 : wire62) | wire59)))))
            begin
              reg165 <= wire60;
              reg166 <= {wire64[(1'h1):(1'h1)],
                  $unsigned((^(wire49 ?
                      wire61[(1'h1):(1'h0)] : (wire126 ? wire51 : wire52))))};
              reg167 <= (&(wire53[(1'h0):(1'h0)] < ($signed({wire61}) * ((!reg164) < {wire60,
                  reg165}))));
              reg168 <= (({wire161} ?
                      reg166[(3'h4):(1'h1)] : (~^$unsigned($unsigned(wire7)))) ?
                  (8'haa) : (!(8'hbb)));
            end
          else
            begin
              reg165 <= (~&($unsigned(reg164) ?
                  ({$unsigned(wire62), wire53[(1'h1):(1'h0)]} ?
                      wire10 : wire10[(1'h0):(1'h0)]) : $unsigned(((8'ha0) < (!wire8)))));
              reg166 <= $signed(wire62);
            end
          if ((8'hb2))
            begin
              reg169 <= $signed($signed(wire10[(2'h3):(1'h1)]));
              reg170 <= $signed({((~(8'hb8)) > reg168), wire61[(3'h7):(3'h7)]});
              reg171 <= $unsigned($signed((((wire10 << wire58) ?
                      (wire49 ? (8'ha7) : reg163) : wire54) ?
                  $unsigned(wire55) : {((8'ha8) ? (8'hbe) : (8'hb5))})));
            end
          else
            begin
              reg169 <= $unsigned((-(&$unsigned(((8'hb8) ? wire9 : reg168)))));
              reg170 <= $signed(wire64);
              reg171 <= wire52;
              reg172 <= reg168[(3'h6):(1'h0)];
              reg173 <= wire59[(3'h6):(3'h5)];
            end
          reg174 <= (wire61[(4'h8):(3'h5)] < (+(^$signed((~wire54)))));
          reg175 <= reg165[(2'h3):(2'h2)];
        end
      else
        begin
          reg164 <= $signed(reg167);
        end
    end
endmodule

module module128
#(parameter param159 = (&(&(|((8'ha7) != (~(8'had)))))), 
parameter param160 = ({param159} ? (((&(param159 & param159)) ? (8'haa) : (-(param159 & (8'hb7)))) | ({(param159 ? (8'had) : (8'haa)), (~|param159)} - ({param159, param159} ? ((8'hba) ? (8'hb3) : param159) : (^param159)))) : (((!param159) ? (((8'hb6) * param159) ? {param159, param159} : (param159 ? param159 : param159)) : ({param159} ? {(8'hae), param159} : {param159})) | (&{(~^param159), (|(8'ha9))}))))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h129):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire133;
  input wire [(2'h3):(1'h0)] wire132;
  input wire signed [(3'h7):(1'h0)] wire131;
  input wire signed [(3'h7):(1'h0)] wire130;
  input wire [(4'h9):(1'h0)] wire129;
  wire [(4'hb):(1'h0)] wire158;
  wire signed [(4'hc):(1'h0)] wire157;
  wire signed [(4'h8):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire154;
  wire [(4'ha):(1'h0)] wire153;
  wire signed [(3'h7):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire signed [(5'h12):(1'h0)] wire147;
  wire [(4'ha):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire145;
  wire [(2'h2):(1'h0)] wire144;
  wire signed [(2'h3):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire signed [(3'h5):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(4'hd):(1'h0)] wire138;
  wire signed [(5'h11):(1'h0)] wire137;
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
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
                 reg150,
                 reg149,
                 reg148,
                 reg136,
                 reg135,
                 reg134,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg134 <= wire131[(3'h7):(2'h3)];
      reg135 <= reg134[(4'hc):(4'ha)];
      reg136 <= (((^~wire133[(2'h3):(2'h2)]) ^~ $signed(reg134)) ?
          $unsigned((wire129 ?
              {wire130[(3'h6):(3'h6)]} : {(~&wire131)})) : wire131);
    end
  assign wire137 = (8'hb2);
  assign wire138 = reg134[(3'h5):(2'h3)];
  assign wire139 = $unsigned(reg135[(4'hd):(1'h1)]);
  assign wire140 = $unsigned(reg135);
  assign wire141 = $signed(((reg136 ?
                       reg136[(2'h3):(1'h0)] : reg136) - $signed(reg136[(3'h5):(1'h0)])));
  assign wire142 = {((^~{{wire140}, (wire137 - reg136)}) ?
                           (~|((wire129 ^~ reg135) ?
                               $unsigned(wire129) : wire141)) : reg136[(1'h0):(1'h0)])};
  assign wire143 = {wire132, {reg136}};
  assign wire144 = ($signed((($signed(reg135) ?
                           {(8'hba), wire142} : wire129[(3'h4):(3'h4)]) ?
                       (-(~&wire139)) : wire130[(2'h2):(1'h1)])) == $signed(wire133));
  assign wire145 = $unsigned((^~reg136[(3'h6):(3'h4)]));
  assign wire146 = ((-(~^{(~&(8'hbf))})) >> (((wire145[(4'ha):(3'h4)] ~^ {wire129,
                           wire132}) ?
                       (~wire140) : wire144[(1'h0):(1'h0)]) <<< $signed($signed({(8'h9d),
                       wire141}))));
  assign wire147 = reg136;
  always
    @(posedge clk) begin
      reg148 <= $unsigned(($signed({(wire130 ? wire139 : wire139)}) ?
          ($signed((-wire146)) * $signed(wire140)) : ((!$unsigned(wire143)) ?
              wire140[(3'h4):(2'h3)] : ((reg135 <= wire132) ?
                  wire139 : (wire131 ? wire147 : wire132)))));
      reg149 <= $signed((|(~|{(~wire141), (wire133 | (8'ha6))})));
      reg150 <= (!wire133[(1'h0):(1'h0)]);
    end
  assign wire151 = (~$unsigned(wire146));
  assign wire152 = reg134;
  assign wire153 = (wire140 == (wire146 ?
                       $signed($unsigned({reg148, wire142})) : (8'hbf)));
  assign wire154 = (-wire151[(3'h5):(2'h2)]);
  assign wire155 = {$signed(((^wire147) ?
                           $signed($unsigned(wire142)) : reg136[(3'h5):(2'h3)])),
                       wire143};
  assign wire156 = (($unsigned((8'hb7)) != (^((8'ha2) >> ((8'hb6) ?
                       (7'h44) : reg148)))) >> $unsigned(wire129));
  assign wire157 = (~^(wire132 || $signed($signed($unsigned(wire144)))));
  assign wire158 = ((7'h43) <<< wire151[(2'h3):(2'h2)]);
endmodule

module module65
#(parameter param124 = (~&({({(8'h9c), (8'hb1)} >> ((8'hac) ? (8'ha2) : (7'h44)))} ? (({(8'ha6)} && (~(8'ha6))) || (!((8'ha7) ^~ (8'hb2)))) : ((^~((8'hbb) << (8'hbb))) | (((8'hae) != (8'h9f)) == ((8'h9d) ? (8'hab) : (8'hb2)))))), 
parameter param125 = (-param124))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h29a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire69;
  input wire signed [(3'h4):(1'h0)] wire68;
  input wire [(4'hc):(1'h0)] wire67;
  input wire [(4'hf):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire123;
  wire signed [(3'h5):(1'h0)] wire122;
  wire [(3'h7):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire100;
  wire [(5'h10):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg signed [(4'he):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'ha):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire106,
                 wire100,
                 wire92,
                 wire91,
                 wire90,
                 wire72,
                 wire71,
                 wire70,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire70 = $signed(wire66);
  assign wire71 = wire68[(1'h1):(1'h1)];
  assign wire72 = ((wire69 & wire69) ?
                      (wire69[(5'h11):(4'ha)] + (((~wire68) <<< $unsigned(wire69)) & $signed(wire69))) : wire67[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      if ((~&$unsigned(wire66)))
        begin
          reg73 <= wire68;
          reg74 <= (wire71 - wire72);
          reg75 <= (8'ha4);
          reg76 <= reg75[(2'h2):(1'h1)];
        end
      else
        begin
          if ((reg75 ?
              ((-($signed(reg75) ?
                  $signed(wire72) : (~&wire66))) * reg75) : reg74))
            begin
              reg73 <= (wire66 ? {$unsigned($signed((^wire67)))} : wire66);
              reg74 <= ($signed((^(~^(&wire69)))) ? wire72 : wire69);
            end
          else
            begin
              reg73 <= {$signed(wire70)};
              reg74 <= ($unsigned(({reg76,
                  (wire70 ? wire72 : (8'h9d))} < ($unsigned(reg73) ?
                  wire68[(1'h0):(1'h0)] : reg73))) != $signed({$signed((+(8'hb3)))}));
              reg75 <= $signed($unsigned(($signed((wire71 ?
                  wire68 : reg73)) ^~ $signed(reg73[(3'h5):(1'h0)]))));
              reg76 <= {((+$unsigned((wire69 ? (8'ha1) : wire66))) ?
                      (~wire72) : $signed($signed((wire72 ? wire68 : wire71)))),
                  {$signed(reg75)}};
              reg77 <= $unsigned(reg76[(4'hc):(3'h4)]);
            end
          if (wire69[(5'h12):(3'h6)])
            begin
              reg78 <= ((~(+((wire69 ? wire67 : reg73) ?
                  {reg75, reg76} : (reg74 ?
                      reg75 : reg76)))) ^~ wire70[(4'ha):(1'h1)]);
            end
          else
            begin
              reg78 <= reg78;
            end
          reg79 <= (wire69 ?
              wire66[(3'h7):(3'h7)] : ($signed(reg78) ?
                  {(|(!(8'hb8))),
                      $unsigned((reg75 >> reg73))} : ($unsigned({reg75}) ?
                      (^(reg76 ?
                          wire72 : reg73)) : $unsigned($signed(reg75)))));
          if (reg75[(3'h6):(2'h2)])
            begin
              reg80 <= (^(((8'h9c) ^ wire72) <= $signed($unsigned($unsigned(wire67)))));
              reg81 <= wire69[(3'h7):(3'h5)];
              reg82 <= (($unsigned(((&reg81) ? (reg79 >>> wire72) : wire70)) ?
                  $unsigned(reg79[(4'hb):(2'h3)]) : ($signed((reg75 >= reg73)) ?
                      $signed({reg79,
                          (8'hb1)}) : $unsigned(wire67[(2'h3):(1'h0)]))) | (wire67 ?
                  ((wire66[(4'hc):(4'ha)] > (wire71 ? wire72 : reg77)) ?
                      reg76 : ($signed((8'hb3)) ?
                          $signed(reg77) : wire67)) : {({wire69} >>> $signed(reg78)),
                      (~(~^reg77))}));
            end
          else
            begin
              reg80 <= $unsigned((((~&(~&(8'hbf))) ? wire69 : reg75) ?
                  {(|reg81[(3'h5):(1'h1)]),
                      (-$unsigned((8'hbe)))} : ((-(reg76 & wire71)) ?
                      reg74 : (-((8'haf) ? reg82 : reg78)))));
              reg81 <= ((+($signed($unsigned(wire69)) ?
                  (wire69[(5'h12):(2'h2)] ?
                      (~&reg80) : reg77[(2'h2):(1'h0)]) : ($unsigned(reg80) ^ ((8'hac) + reg78)))) | (7'h42));
              reg82 <= (~&$signed($unsigned(wire72[(2'h2):(1'h0)])));
              reg83 <= {$unsigned($signed(((reg74 | reg73) + (-(8'hb9))))),
                  (((8'hb3) == wire71[(3'h4):(1'h0)]) ?
                      {wire71,
                          {wire69[(3'h4):(2'h3)],
                              wire71[(4'hc):(1'h1)]}} : reg75[(3'h7):(3'h4)])};
              reg84 <= reg79[(4'h9):(4'h8)];
            end
          reg85 <= ((8'hb9) >> reg75[(2'h3):(2'h3)]);
        end
      reg86 <= $unsigned(((-wire72[(4'h9):(4'h9)]) ?
          wire69[(4'he):(4'hb)] : $signed({wire71})));
      reg87 <= ((&(|reg85)) ?
          $signed(($unsigned(wire71) == wire70)) : (reg86 ?
              ($unsigned({reg73}) | {(|reg81),
                  reg73}) : {$unsigned($signed(reg84))}));
      reg88 <= (reg76[(3'h5):(3'h5)] | ({$signed({reg82})} + ($unsigned(reg80) & $signed(wire67[(1'h1):(1'h1)]))));
      reg89 <= reg79;
    end
  assign wire90 = (^{($unsigned((&reg87)) - ((~^reg88) ?
                          (reg89 ? reg82 : wire67) : {reg85, wire69}))});
  assign wire91 = reg84;
  assign wire92 = $signed($unsigned((wire71 ?
                      reg79 : ($signed(wire66) < (reg86 <= reg83)))));
  always
    @(posedge clk) begin
      if (wire66[(2'h3):(2'h3)])
        begin
          reg93 <= reg88;
          reg94 <= {wire90,
              $unsigned($unsigned({reg93[(4'hc):(3'h6)], reg85}))};
          reg95 <= (((($unsigned(reg79) || reg79[(4'hc):(3'h5)]) >> ($unsigned(wire91) ?
                  $signed(reg80) : (wire92 ?
                      wire70 : wire91))) || $unsigned(reg89)) ?
              wire66[(3'h6):(3'h5)] : (((reg93 >>> $signed(wire69)) ?
                      $signed((reg75 ?
                          wire72 : wire91)) : (wire90[(4'he):(3'h5)] && $signed(reg77))) ?
                  (!reg80) : $unsigned(wire92)));
          reg96 <= ((reg86 ?
                  ($unsigned(((8'ha0) || reg79)) ?
                      reg73[(2'h3):(2'h2)] : $signed(wire91)) : (($unsigned(reg82) ?
                      (wire90 >= reg73) : (reg80 == (8'hbe))) ~^ $signed((reg83 ?
                      reg94 : wire66)))) ?
              $signed(((reg86 ? reg73[(2'h3):(1'h0)] : $unsigned(reg79)) ?
                  ($signed(reg75) ?
                      (~|wire70) : (reg78 ?
                          reg81 : reg89)) : {reg83[(2'h2):(1'h0)],
                      $unsigned(reg73)})) : $signed(reg76[(3'h4):(1'h1)]));
        end
      else
        begin
          reg93 <= {{$signed({{wire92}})}};
        end
      reg97 <= reg86[(1'h1):(1'h1)];
      reg98 <= (($signed({(~&reg85), (reg75 ? wire92 : (8'hac))}) ?
          ($signed(reg86) >> (8'ha5)) : reg83[(3'h6):(1'h0)]) ^~ reg88[(4'hf):(4'hf)]);
      reg99 <= reg77;
    end
  assign wire100 = $unsigned(((({wire91} ~^ $signed(reg89)) ?
                           reg75 : $unsigned((reg76 ? wire92 : reg84))) ?
                       $unsigned(($unsigned(reg95) ?
                           $unsigned(wire66) : ((7'h42) - wire72))) : {$unsigned((wire90 ?
                               (8'hb5) : (8'hbf)))}));
  always
    @(posedge clk) begin
      reg101 <= $unsigned((reg94 && reg86));
      reg102 <= {$unsigned(reg83)};
      reg103 <= ({reg99, (~^$signed((reg84 < reg97)))} * $signed(reg75));
      reg104 <= wire72;
      reg105 <= {{$unsigned(reg82[(5'h12):(3'h5)]), $signed($signed((8'hbc)))}};
    end
  assign wire106 = $signed($unsigned(reg81));
  always
    @(posedge clk) begin
      if (($signed((($unsigned(reg99) ?
          {reg98, reg105} : $signed(reg104)) != (~((8'hae) ?
          (8'ha1) : (8'h9e))))) ^~ (reg94 ?
          reg101 : $unsigned(((~reg84) && (&(8'hb5)))))))
        begin
          reg107 <= $signed($unsigned((reg97 ?
              $unsigned($signed(wire90)) : (|(^reg79)))));
          if (reg83[(2'h2):(1'h1)])
            begin
              reg108 <= (reg87[(3'h5):(1'h0)] | (reg101[(3'h4):(1'h1)] >= wire90[(4'hd):(3'h6)]));
              reg109 <= ((8'h9e) ?
                  $unsigned($signed((reg93 * (reg81 >= (8'hb0))))) : wire92[(4'hc):(4'h8)]);
              reg110 <= {$signed(((reg108[(3'h4):(3'h4)] <= wire69) ?
                      (^~$signed(reg94)) : ({(8'hb4), reg101} <= (^reg107))))};
              reg111 <= reg88[(4'hb):(4'h9)];
              reg112 <= (8'hae);
            end
          else
            begin
              reg108 <= $signed(reg112[(5'h14):(5'h13)]);
            end
        end
      else
        begin
          reg107 <= (~wire68[(2'h3):(1'h1)]);
          reg108 <= reg73[(4'hb):(2'h3)];
        end
      if ($signed(((($unsigned(reg76) ?
              (^~reg108) : (!reg86)) <<< wire106[(4'hf):(3'h7)]) ?
          $unsigned((^~(^wire71))) : (reg102 > {(reg99 | reg102),
              (wire69 << reg103)}))))
        begin
          reg113 <= {$signed({$unsigned(reg103[(4'h9):(1'h0)])})};
          reg114 <= $signed((-$unsigned((-reg97))));
          reg115 <= ({reg76, reg74} == reg83[(3'h6):(1'h1)]);
          if (reg84)
            begin
              reg116 <= $unsigned((reg77[(3'h5):(2'h3)] ?
                  $signed(($signed(reg76) ?
                      wire69[(4'ha):(4'ha)] : $signed((8'hb5)))) : (~&$unsigned(reg84[(3'h4):(3'h4)]))));
              reg117 <= ($signed($unsigned(((reg98 && (8'ha7)) ?
                      (reg95 ? reg89 : wire68) : {wire90}))) ?
                  {(^($signed(reg78) ?
                          (8'ha2) : {reg77, reg76}))} : reg95[(2'h3):(2'h2)]);
            end
          else
            begin
              reg116 <= (^wire67[(4'h8):(1'h0)]);
            end
        end
      else
        begin
          reg113 <= wire69;
        end
      reg118 <= $signed(reg84[(2'h3):(2'h2)]);
      reg119 <= (8'h9e);
    end
  assign wire120 = $unsigned($signed((~((reg113 * wire67) ?
                       ((8'ha6) << (8'hbf)) : $signed(reg82)))));
  assign wire121 = ((+(+reg89)) ?
                       $unsigned($signed((reg94 || (~^reg95)))) : $signed({$unsigned(reg76),
                           (~|$signed(reg111))}));
  assign wire122 = {$signed(reg75),
                       (reg78 ?
                           ((&$unsigned(reg112)) - reg95) : (~|$signed(reg107[(3'h4):(1'h0)])))};
  assign wire123 = $unsigned($signed($signed(((wire68 ? (8'ha8) : (8'hbe)) ?
                       wire121[(3'h5):(2'h3)] : (reg76 ^~ reg104)))));
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire16;
  input wire signed [(5'h10):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire26,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = (wire16[(4'ha):(3'h4)] ^~ wire13[(3'h5):(2'h2)]);
  assign wire18 = wire16;
  assign wire19 = {(((&(wire17 ? wire13 : wire14)) ?
                              $unsigned({wire13}) : $unsigned((~|wire17))) ?
                          $signed((&(wire14 < wire14))) : (8'haf))};
  assign wire20 = ($signed({(wire18 ? (8'hb7) : wire14),
                          wire18[(3'h6):(3'h6)]}) ?
                      (wire17[(2'h2):(1'h0)] <<< $unsigned({$signed(wire18)})) : {((((8'h9d) ?
                              wire17 : wire16) >= (wire19 - wire16)) > (8'hb3)),
                          (~(wire16 <<< (wire16 ? wire13 : wire16)))});
  always
    @(posedge clk) begin
      reg21 <= ($signed((~&$signed((~wire14)))) > wire17);
      reg22 <= (((!((wire20 >= wire20) ? wire15[(4'h9):(4'h8)] : (~(7'h40)))) ?
          $unsigned(wire19) : $signed(($signed((7'h42)) <<< $unsigned(wire16)))) || ((8'hac) ?
          $unsigned((~(wire14 ?
              wire16 : (7'h44)))) : (^(wire18 != $signed(wire13)))));
      reg23 <= wire15[(4'ha):(4'h9)];
      reg24 <= reg22[(2'h3):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg25 <= $signed((^~({reg22[(2'h3):(2'h3)], (8'h9d)} <= ((wire20 ?
          wire19 : wire14) ^~ (wire16 + wire15)))));
    end
  assign wire26 = wire14[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ((^~$signed($unsigned(((wire18 ? reg21 : wire15) >>> (~|wire13))))))
        begin
          if ({((-reg22) ?
                  ($signed($signed(reg21)) ?
                      wire26 : ($signed(wire13) ?
                          (wire26 && reg25) : (^~wire15))) : ({{reg24}} == (~^wire18[(3'h4):(1'h1)])))})
            begin
              reg27 <= $unsigned(($signed(($unsigned(reg25) ^ (8'hb3))) ?
                  {(8'h9c), wire26[(2'h3):(1'h1)]} : ({$signed(wire17)} ?
                      $signed($signed(wire17)) : $signed((-wire15)))));
              reg28 <= {{wire26}};
              reg29 <= (({$signed({wire17})} ?
                      (wire17[(1'h1):(1'h0)] && (wire15[(4'hf):(3'h5)] > wire18)) : reg22[(2'h2):(1'h0)]) ?
                  $unsigned(($signed((+(8'hbc))) ?
                      ((wire16 <= wire20) ?
                          (wire17 ?
                              wire15 : wire14) : wire13) : ((reg23 != wire17) ?
                          $unsigned(reg27) : (-reg23)))) : reg22);
              reg30 <= (&{wire17});
              reg31 <= ((|wire13) ? (~|reg27) : wire17[(1'h0):(1'h0)]);
            end
          else
            begin
              reg27 <= (~|(wire16 ?
                  $signed($unsigned({wire19,
                      (8'h9f)})) : ($unsigned($unsigned((8'hb4))) >= {(+(8'haa)),
                      (wire14 ? (8'hb2) : wire17)})));
              reg28 <= ($signed($signed((&(reg31 ?
                  wire26 : wire15)))) && (wire20[(1'h1):(1'h0)] ?
                  {$unsigned(reg24[(4'hb):(4'ha)])} : (8'hbc)));
              reg29 <= (((8'hbc) == {$unsigned(wire20[(2'h2):(1'h0)])}) ?
                  reg22 : wire17);
            end
          reg32 <= wire18[(3'h6):(2'h2)];
          reg33 <= (wire13[(4'h8):(3'h6)] ?
              $unsigned((^~reg28)) : reg30[(4'h8):(3'h6)]);
          reg34 <= reg33[(4'ha):(4'h8)];
        end
      else
        begin
          reg27 <= $unsigned((~&wire16));
        end
      reg35 <= $unsigned({(+wire18[(4'h9):(4'h8)])});
      reg36 <= $signed(wire19);
      reg37 <= (|reg28);
      reg38 <= reg36;
    end
  assign wire39 = $unsigned($signed($unsigned($unsigned(wire20[(2'h2):(1'h1)]))));
  assign wire40 = $signed(((~^$unsigned($signed(reg37))) ?
                      (wire18[(2'h3):(2'h2)] ?
                          ((-wire18) ? (!reg32) : (~|wire14)) : {(wire16 ?
                                  reg25 : wire15),
                              reg27}) : wire20));
  assign wire41 = (&(~$unsigned(reg21)));
  assign wire42 = ((reg33 ?
                          (8'hb6) : $unsigned(((^~reg29) ?
                              $unsigned(wire39) : wire13[(3'h6):(1'h0)]))) ?
                      ((!({reg36} ?
                              $unsigned(reg32) : (wire15 ? reg38 : wire15))) ?
                          wire18[(4'h9):(2'h3)] : {(reg36[(2'h3):(1'h0)] >> (!(8'hb1)))}) : $unsigned((($signed(reg25) | $unsigned(reg29)) >> $signed(wire13))));
  assign wire43 = ((reg37[(1'h1):(1'h1)] ?
                      $signed((8'ha3)) : $signed((8'hbf))) & wire16);
  assign wire44 = {($unsigned($unsigned((reg36 != wire16))) ^ ($unsigned((^reg35)) + $signed({wire14})))};
  assign wire45 = ((8'ha5) ?
                      $unsigned(((^reg38) << (~wire41))) : (+(~^wire17)));
  assign wire46 = $unsigned((wire17 ?
                      wire43[(3'h4):(2'h3)] : (wire13 ?
                          reg34[(1'h0):(1'h0)] : reg35[(4'hd):(2'h2)])));
  assign wire47 = ($unsigned((~&$signed(wire17))) >> (wire13[(3'h5):(3'h4)] ?
                      $signed((^$signed(reg34))) : ((|wire15) <= {$signed(reg30)})));
  assign wire48 = $signed({$unsigned({$signed(reg35)}), reg31});
endmodule
