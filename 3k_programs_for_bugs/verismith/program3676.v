module top
#(parameter param197 = (8'haf), 
parameter param198 = (param197 ? param197 : (((&((8'ha1) ? param197 : param197)) ^~ param197) ? ({{param197}} ? ({(8'ha5)} - (&(8'had))) : param197) : {(-{param197, param197}), (!{param197})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire196;
  wire [(3'h7):(1'h0)] wire195;
  wire signed [(2'h2):(1'h0)] wire193;
  wire [(4'hb):(1'h0)] wire192;
  wire [(5'h10):(1'h0)] wire191;
  wire signed [(3'h4):(1'h0)] wire188;
  wire [(4'hc):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire169;
  wire [(2'h3):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire167;
  wire signed [(3'h6):(1'h0)] wire165;
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg175 = (1'h0);
  reg [(4'he):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg171 = (1'h0);
  reg [(4'hc):(1'h0)] reg170 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire193,
                 wire192,
                 wire191,
                 wire188,
                 wire176,
                 wire169,
                 wire168,
                 wire167,
                 wire165,
                 reg194,
                 reg190,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 (1'h0)};
  module5 #() modinst166 (wire165, clk, wire2, wire1, wire0, wire3);
  assign wire167 = $unsigned(wire165[(2'h2):(2'h2)]);
  assign wire168 = $unsigned($signed(wire3));
  assign wire169 = $signed(((8'h9f) <= $signed((wire2[(3'h7):(1'h1)] ~^ wire3))));
  always
    @(posedge clk) begin
      reg170 <= ($signed($signed($signed($unsigned(wire167)))) ?
          $signed((|$signed((wire1 ?
              (8'had) : wire3)))) : wire0[(1'h1):(1'h1)]);
      reg171 <= (wire167[(1'h0):(1'h0)] <<< (8'hb5));
      if ($unsigned($signed($unsigned((8'ha4)))))
        begin
          reg172 <= reg170[(2'h3):(1'h0)];
          reg173 <= wire169;
          reg174 <= (wire4[(4'h8):(3'h4)] ?
              (+({$unsigned(wire0)} - reg172)) : ($signed($unsigned($signed(reg170))) ?
                  (8'had) : (~^{{(7'h40), (8'ha4)}})));
        end
      else
        begin
          reg172 <= (wire168 ?
              ($unsigned(wire1[(3'h7):(3'h7)]) != $signed(reg171[(3'h5):(2'h3)])) : reg174);
          reg173 <= (-$unsigned(wire169[(4'h8):(3'h6)]));
          reg174 <= $unsigned((wire169[(3'h6):(3'h6)] ?
              {$unsigned(wire169[(1'h1):(1'h1)]),
                  reg171} : $signed((-(reg173 > wire4)))));
          reg175 <= wire167;
        end
    end
  assign wire176 = wire4;
  module177 #() modinst189 (.wire178(reg172), .wire179(reg175), .clk(clk), .wire180(wire169), .wire181(wire168), .y(wire188));
  always
    @(posedge clk) begin
      reg190 <= $unsigned($unsigned((~&(+$unsigned((8'hba))))));
    end
  assign wire191 = $unsigned($signed($unsigned({$signed((8'ha5))})));
  assign wire192 = wire4[(4'he):(1'h1)];
  assign wire193 = $unsigned((-wire176));
  always
    @(posedge clk) begin
      reg194 <= (reg190[(4'h9):(1'h0)] ?
          ($signed(($unsigned((8'h9e)) >= (~wire1))) ?
              $signed(reg190) : (wire192[(1'h1):(1'h0)] > wire192[(4'hb):(1'h0)])) : $unsigned((reg190[(1'h0):(1'h0)] ?
              ((reg170 ? reg174 : wire2) + (wire4 ?
                  reg173 : wire191)) : wire188[(2'h3):(1'h0)])));
    end
  assign wire195 = reg170;
  assign wire196 = wire167[(1'h1):(1'h0)];
endmodule

module module177
#(parameter param187 = ((8'ha8) ^~ {(+(((8'hb0) * (8'ha2)) ? ((8'ha6) < (8'hb6)) : ((8'hb2) ? (8'hb2) : (8'ha1))))}))
(y, clk, wire181, wire180, wire179, wire178);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire181;
  input wire [(5'h15):(1'h0)] wire180;
  input wire signed [(5'h12):(1'h0)] wire179;
  input wire [(2'h3):(1'h0)] wire178;
  wire [(4'ha):(1'h0)] wire186;
  wire signed [(2'h3):(1'h0)] wire185;
  wire [(4'he):(1'h0)] wire184;
  wire [(5'h15):(1'h0)] wire183;
  wire signed [(5'h13):(1'h0)] wire182;
  assign y = {wire186, wire185, wire184, wire183, wire182, (1'h0)};
  assign wire182 = ($signed((|$signed((8'ha0)))) && wire179);
  assign wire183 = wire180;
  assign wire184 = $signed($unsigned($unsigned(wire180[(3'h7):(2'h2)])));
  assign wire185 = (~$unsigned(wire182[(4'h9):(3'h5)]));
  assign wire186 = (wire183[(5'h15):(5'h15)] & $signed(wire182));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire164;
  wire [(5'h14):(1'h0)] wire163;
  wire [(5'h12):(1'h0)] wire162;
  wire [(3'h6):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(3'h4):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire112;
  wire [(4'hd):(1'h0)] wire160;
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire61,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire108,
                 wire110,
                 wire111,
                 wire112,
                 wire160,
                 (1'h0)};
  assign wire10 = wire8[(4'he):(2'h3)];
  assign wire11 = wire8;
  assign wire12 = wire9[(2'h3):(1'h1)];
  assign wire13 = wire11[(4'he):(2'h3)];
  assign wire14 = ($unsigned($unsigned((wire6 ? {wire9, wire8} : wire13))) ?
                      (~^(8'h9e)) : (($signed(wire7[(1'h1):(1'h0)]) <<< $signed((wire10 != wire13))) ?
                          (!wire7[(3'h4):(2'h3)]) : (((wire9 ?
                              (7'h41) : wire8) ~^ wire12) >> $signed(wire8[(2'h3):(2'h3)]))));
  module15 #() modinst62 (wire61, clk, wire6, wire9, wire13, wire11, wire10);
  assign wire63 = ((-($unsigned(wire7[(3'h7):(2'h2)]) ?
                          $unsigned(wire9) : ((&wire11) ?
                              (wire13 ? wire7 : wire10) : {(8'hae)}))) ?
                      $signed((({(8'had), (8'h9e)} ?
                              $signed(wire7) : (wire14 ? wire9 : wire13)) ?
                          (!{wire9}) : {$signed(wire9),
                              (wire9 ? wire11 : wire12)})) : (!(({wire13,
                                  wire6} ?
                              wire61[(3'h4):(1'h1)] : $signed((8'hbd))) ?
                          (-(wire12 ? wire11 : wire12)) : $signed((8'haa)))));
  assign wire64 = {({wire7, (~^(|wire11))} << wire10[(3'h6):(2'h2)])};
  assign wire65 = wire64[(2'h2):(1'h1)];
  assign wire66 = wire7;
  module67 #() modinst109 (.wire69(wire8), .clk(clk), .wire70(wire65), .wire68(wire6), .wire71(wire11), .y(wire108));
  assign wire110 = {wire7};
  assign wire111 = wire14;
  assign wire112 = ((^~wire63) ^ $signed(($signed((&(8'hbd))) ?
                       (^~(wire108 ? wire61 : wire8)) : wire13)));
  module113 #() modinst161 (wire160, clk, wire65, wire10, wire8, wire14, wire110);
  assign wire162 = (wire66[(1'h0):(1'h0)] ?
                       $signed({(wire112 >= (wire10 <<< (8'ha2))),
                           ((-wire111) == (wire61 + wire13))}) : wire112[(2'h2):(2'h2)]);
  assign wire163 = ({$signed(wire162),
                           (($signed(wire6) > $unsigned(wire162)) ^ wire8[(4'h9):(3'h6)])} ?
                       (~^{$signed((-wire108))}) : ($unsigned($signed({wire9,
                           wire63})) << ($unsigned((wire65 & wire111)) && ($unsigned(wire8) ?
                           wire112[(2'h3):(2'h2)] : (!wire7)))));
  assign wire164 = (8'hb0);
endmodule

module module113
#(parameter param159 = ({(^~({(8'hb0)} ? (~&(8'ha2)) : {(8'hb0), (8'hb7)})), ((((7'h43) ? (8'hb9) : (8'hbf)) ^~ (^~(8'hac))) ? ((~^(8'hb1)) ^ ((8'hbb) >= (7'h44))) : (^((7'h40) ? (8'hbf) : (8'hbc))))} * (((|((7'h43) ? (8'h9f) : (8'hbf))) <<< (~&(~&(8'ha2)))) <<< (({(7'h43)} ? (+(8'ha0)) : (^~(8'hab))) ? (8'h9d) : (((8'h9c) ? (7'h41) : (8'hb1)) ? (!(8'h9d)) : {(8'ha9), (8'hbb)})))))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire118;
  input wire signed [(5'h15):(1'h0)] wire117;
  input wire [(3'h7):(1'h0)] wire116;
  input wire [(4'hf):(1'h0)] wire115;
  input wire signed [(2'h3):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire158;
  wire signed [(5'h12):(1'h0)] wire157;
  wire [(2'h3):(1'h0)] wire147;
  wire signed [(4'h9):(1'h0)] wire146;
  wire [(3'h4):(1'h0)] wire142;
  wire [(4'ha):(1'h0)] wire141;
  wire signed [(5'h11):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire122;
  wire [(5'h14):(1'h0)] wire121;
  wire signed [(3'h7):(1'h0)] wire120;
  wire [(4'h8):(1'h0)] wire119;
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(4'h8):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg145 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire147,
                 wire146,
                 wire142,
                 wire141,
                 wire140,
                 wire131,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg145,
                 reg144,
                 reg143,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire119 = (($unsigned((^(wire116 == wire117))) != $unsigned((wire115[(4'ha):(4'h8)] ?
                           wire117 : (wire115 ? wire115 : wire114)))) ?
                       ((($signed(wire117) ?
                                   (wire115 <= wire116) : (wire117 >= wire117)) ?
                               wire114 : $unsigned((wire114 ?
                                   wire118 : (8'hab)))) ?
                           wire118[(4'h8):(4'h8)] : wire115) : (+$unsigned($signed(wire116))));
  assign wire120 = $signed((wire114[(1'h0):(1'h0)] > $signed((+$signed((8'hb7))))));
  assign wire121 = wire119;
  assign wire122 = (wire120 << ((|(((8'ha3) ^ wire121) <= wire120[(2'h2):(1'h1)])) | {(|wire115[(2'h3):(2'h2)])}));
  always
    @(posedge clk) begin
      if ({(~^(((wire120 <= (8'ha2)) && (wire117 ? wire119 : wire115)) ?
              {wire120,
                  (wire118 - wire114)} : $signed(wire121[(4'h9):(3'h7)]))),
          $signed($signed((7'h41)))})
        begin
          reg123 <= (&wire118[(3'h5):(3'h5)]);
        end
      else
        begin
          reg123 <= {$signed(wire114[(1'h0):(1'h0)]),
              ((-((wire122 ? wire122 : (8'ha2)) ?
                  $signed(wire115) : (wire121 ?
                      (8'hbb) : wire121))) < wire117)};
        end
      if ($signed(wire116))
        begin
          reg124 <= $signed((7'h40));
          if ((&wire119))
            begin
              reg125 <= {wire118[(4'h9):(4'h8)]};
              reg126 <= $signed((wire114 ?
                  ((wire116[(3'h4):(1'h1)] ?
                      {wire115,
                          reg123} : reg123[(2'h2):(1'h0)]) >= reg125[(1'h1):(1'h1)]) : wire122));
              reg127 <= ((reg126[(2'h2):(2'h2)] && (wire114 ?
                  (+(wire116 ?
                      (8'ha1) : reg123)) : (+wire115))) < $signed((~|wire117[(3'h7):(2'h2)])));
            end
          else
            begin
              reg125 <= {(~&(^((wire120 ? reg127 : wire118) >= (wire119 ?
                      wire115 : reg124))))};
              reg126 <= (^(^reg127[(1'h1):(1'h1)]));
            end
          reg128 <= $unsigned($signed((^wire120[(1'h1):(1'h1)])));
          reg129 <= (wire121 ?
              (&(($unsigned(reg126) != (reg127 ?
                  reg128 : (8'hb6))) - (reg126[(3'h4):(2'h2)] <<< {wire115,
                  wire117}))) : {wire120, {reg127[(4'h8):(4'h8)]}});
          reg130 <= (~&(8'ha6));
        end
      else
        begin
          reg124 <= wire115[(4'h9):(3'h5)];
          reg125 <= ((({$unsigned(wire121), ((8'h9f) <= wire115)} ?
                  $signed((wire119 ? wire122 : reg126)) : (^$signed(wire115))) ?
              wire115 : reg126) >= $signed(($unsigned($signed(wire114)) ?
              {$unsigned(reg124),
                  (wire119 ? (8'hb7) : reg126)} : (reg124[(4'hb):(1'h1)] ?
                  wire114[(1'h1):(1'h0)] : wire115[(3'h7):(1'h1)]))));
        end
    end
  assign wire131 = $unsigned($signed(reg125[(4'hf):(4'h9)]));
  always
    @(posedge clk) begin
      reg132 <= {wire118,
          (((~&$signed(wire118)) ? $signed(wire131) : reg125[(5'h11):(2'h3)]) ?
              reg124 : $signed($signed($unsigned(reg125))))};
      reg133 <= wire121[(4'ha):(1'h1)];
      if ($unsigned(((reg130[(4'ha):(4'ha)] >>> ({reg133,
              (8'hba)} < $unsigned(reg132))) ?
          (+(~|wire120[(3'h5):(2'h3)])) : (!{$unsigned(reg123), (|wire131)}))))
        begin
          reg134 <= reg126;
          if ({wire131, (|$signed(reg129[(2'h3):(1'h1)]))})
            begin
              reg135 <= (~(!(({reg125} * (reg130 != reg133)) ?
                  {{(8'hb7), (8'had)}, $signed((8'h9e))} : (8'hb9))));
              reg136 <= $unsigned((8'hb4));
              reg137 <= reg127;
            end
          else
            begin
              reg135 <= (($unsigned(reg133) ? reg126[(2'h3):(1'h0)] : reg136) ?
                  reg126[(1'h1):(1'h1)] : (!((~(wire121 ? reg126 : reg137)) ?
                      (8'ha2) : (|reg136[(1'h1):(1'h1)]))));
              reg136 <= wire114;
              reg137 <= $unsigned(((!((reg125 ? wire115 : wire118) ?
                      (8'hb1) : ((8'ha9) > wire117))) ?
                  $signed(($signed(wire121) ?
                      wire114[(1'h1):(1'h0)] : $unsigned((8'hb5)))) : ($unsigned({wire120}) ?
                      (8'hba) : $signed(wire120[(3'h7):(3'h5)]))));
              reg138 <= ($signed($unsigned(((8'hb1) ? reg128 : (~(8'hb5))))) ?
                  wire122 : $unsigned((wire131 ?
                      (((8'hb6) * reg133) ^~ (^wire117)) : ($signed(reg128) ?
                          (~wire114) : (reg130 || reg135)))));
              reg139 <= wire122;
            end
        end
      else
        begin
          reg134 <= reg125;
        end
    end
  assign wire140 = $signed((^wire122));
  assign wire141 = (reg123[(1'h0):(1'h0)] ?
                       ((((reg134 < reg125) > {wire115}) ?
                           wire120[(3'h5):(1'h0)] : $signed($unsigned(wire117))) >> $signed(reg123)) : (reg128 ^~ {(8'hba)}));
  assign wire142 = $signed((^reg134[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg143 <= wire115;
      reg144 <= ({{reg123}} ?
          $signed($unsigned(((wire122 ?
              wire140 : wire114) & $unsigned(reg133)))) : reg126[(1'h0):(1'h0)]);
      reg145 <= wire121;
    end
  assign wire146 = $signed((reg133 ? wire115[(4'h8):(3'h5)] : reg139));
  assign wire147 = (~(({$signed(reg126), (wire120 ~^ reg128)} + ((wire120 ?
                               (8'ha1) : reg124) ?
                           $signed(wire140) : {reg127, (8'ha3)})) ?
                       {{reg145[(2'h3):(2'h2)]}} : wire114));
  always
    @(posedge clk) begin
      if ({{(+$signed((~|wire146)))}, wire142[(1'h0):(1'h0)]})
        begin
          if ($signed((|((~&reg145) ?
              reg128[(3'h4):(1'h1)] : ((wire117 && wire131) ?
                  $unsigned(reg128) : wire142[(3'h4):(2'h2)])))))
            begin
              reg148 <= (wire146 == ($unsigned($unsigned(reg133)) ?
                  $signed(reg145) : wire116[(1'h0):(1'h0)]));
              reg149 <= ($unsigned({{(reg148 - reg128), $signed((8'hae))}}) ?
                  ($unsigned({$signed(reg129), {(8'hb2)}}) ?
                      reg127 : wire118[(3'h5):(3'h4)]) : reg144[(2'h2):(1'h1)]);
              reg150 <= ((wire146 | $signed(($unsigned(reg136) | (+wire142)))) ?
                  (($signed(reg135[(4'he):(2'h3)]) ?
                          wire122 : reg148[(5'h10):(4'h8)]) ?
                      (-$signed((wire121 ?
                          wire121 : reg136))) : ((wire140 >= (wire147 ^ wire122)) ?
                          (|(reg132 ?
                              (8'hbb) : reg136)) : $unsigned(reg133[(2'h2):(1'h1)]))) : (+(7'h42)));
              reg151 <= ($unsigned((&(~(8'hba)))) ? (8'ha1) : reg127);
              reg152 <= $unsigned((reg149[(5'h10):(5'h10)] ?
                  $unsigned((((8'hb4) ?
                      wire147 : reg124) <<< $unsigned(reg132))) : $signed({{(8'ha3),
                          reg128}})));
            end
          else
            begin
              reg148 <= ({$signed((8'hb7)),
                  (~{reg132})} == reg123[(1'h0):(1'h0)]);
              reg149 <= ($unsigned($unsigned($signed((reg124 ?
                      wire140 : reg135)))) ?
                  (^$unsigned(reg149[(4'hd):(4'ha)])) : $signed(reg134[(4'he):(3'h6)]));
              reg150 <= $unsigned((|{(reg151[(2'h2):(2'h2)] ~^ reg135)}));
              reg151 <= reg127;
            end
          reg153 <= reg152;
          reg154 <= $unsigned(($unsigned((^(reg143 == reg137))) ?
              {$signed((8'h9f))} : wire114));
          reg155 <= $signed(reg135[(4'hd):(4'hd)]);
        end
      else
        begin
          if ($signed($signed((8'ha5))))
            begin
              reg148 <= {{$unsigned(reg143[(4'hf):(4'h9)])}};
            end
          else
            begin
              reg148 <= {(reg134 >> $unsigned(($signed((8'ha8)) ?
                      (^~reg150) : {wire122, (8'hb0)})))};
              reg149 <= ($unsigned(reg135) ?
                  (!($unsigned((!(7'h43))) || ((~|wire121) || reg152))) : $unsigned($signed(wire117)));
              reg150 <= reg137;
              reg151 <= {{({(wire147 || (8'h9e))} | $unsigned($signed((8'hab))))}};
            end
          reg152 <= $signed(reg130);
          reg153 <= $unsigned((|reg155[(3'h5):(1'h1)]));
          reg154 <= $signed(reg136[(3'h5):(1'h0)]);
          reg155 <= ($signed($unsigned(reg128[(4'hc):(3'h5)])) || {{(wire115[(4'h8):(2'h3)] <= reg138)},
              (8'ha5)});
        end
      reg156 <= {reg126};
    end
  assign wire157 = reg135[(3'h4):(2'h3)];
  assign wire158 = $signed(reg134);
endmodule

module module67
#(parameter param106 = ((~&(~|(((8'ha0) & (8'hae)) ? {(8'h9c)} : ((8'haf) ? (8'hb0) : (8'hb7))))) ? (7'h44) : (((((7'h41) ? (8'hb2) : (8'hbe)) >>> {(8'haa), (8'ha0)}) | ((+(8'hbf)) ? (^(8'hba)) : {(8'haa), (8'hae)})) << (^~((^~(8'hbe)) + (~(8'ha4)))))), 
parameter param107 = (param106 >>> (param106 && ((!(param106 ? (8'ha8) : param106)) ? param106 : param106))))
(y, clk, wire71, wire70, wire69, wire68);
  output wire [(32'h196):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire71;
  input wire signed [(5'h11):(1'h0)] wire70;
  input wire [(5'h15):(1'h0)] wire69;
  input wire [(4'he):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire [(5'h10):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(4'hf):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  assign y = {wire105,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
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
  assign wire72 = ((~|wire69[(4'he):(2'h2)]) ^ $signed(wire70));
  assign wire73 = ((wire69[(4'h8):(1'h1)] ?
                      ($signed($signed(wire70)) ?
                          (8'had) : ((^~wire69) ?
                              wire71[(2'h2):(1'h1)] : wire70)) : {$signed((wire71 ?
                              wire72 : wire70))}) <<< {(~^$signed(((8'ha6) ?
                          (8'ha5) : wire72)))});
  assign wire74 = $unsigned({((~&$signed(wire72)) < $unsigned(wire68[(4'hd):(4'ha)])),
                      wire69[(2'h3):(2'h3)]});
  assign wire75 = {wire73[(5'h10):(2'h2)]};
  assign wire76 = (((wire68 ?
                          wire69[(3'h6):(3'h5)] : ((wire70 ^ wire69) ?
                              wire75 : wire73)) ?
                      $unsigned($unsigned((wire69 ~^ (7'h41)))) : wire73[(4'h8):(2'h2)]) > wire69);
  assign wire77 = (^~(wire69 ?
                      {({wire69, wire75} ?
                              $signed((7'h44)) : {wire69,
                                  wire71})} : wire70[(5'h10):(4'hc)]));
  always
    @(posedge clk) begin
      reg78 <= $signed((|($unsigned($signed(wire77)) || ({wire70} ?
          ((8'ha9) ? wire70 : wire75) : wire72[(2'h2):(2'h2)]))));
      if ($unsigned(wire72[(1'h0):(1'h0)]))
        begin
          reg79 <= (8'ha5);
          if ($unsigned(wire69[(1'h0):(1'h0)]))
            begin
              reg80 <= wire74[(4'hd):(3'h5)];
              reg81 <= (($unsigned(($unsigned(reg79) ?
                      (~^wire72) : (^wire77))) ?
                  $unsigned(reg78) : ((wire68 ?
                          $unsigned(wire69) : $unsigned(wire69)) ?
                      $unsigned({wire72}) : wire68[(1'h0):(1'h0)])) ^~ $signed({(((8'h9c) ?
                          (7'h44) : wire68) ?
                      {(8'ha1)} : (wire71 ? wire73 : reg78))}));
            end
          else
            begin
              reg80 <= $unsigned(({wire74} != (wire74 ?
                  reg79[(2'h3):(2'h2)] : reg78[(4'he):(4'hc)])));
            end
          if ((wire76 < wire75[(3'h4):(1'h0)]))
            begin
              reg82 <= wire69[(4'he):(4'ha)];
            end
          else
            begin
              reg82 <= wire72[(2'h2):(1'h0)];
              reg83 <= ($signed($signed(reg79)) ?
                  {wire75,
                      (wire73 >> $unsigned((wire74 << (8'ha2))))} : wire73[(2'h2):(1'h0)]);
              reg84 <= (wire77[(2'h3):(2'h2)] ?
                  $unsigned((((8'hb4) ^~ (reg79 * reg81)) ?
                      wire69 : (wire73 - $signed(wire73)))) : (($signed((wire68 ?
                          reg79 : wire70)) ?
                      (7'h44) : $signed((wire69 ?
                          wire74 : (8'h9c)))) >> $unsigned(reg83)));
              reg85 <= $signed($signed((|(8'haf))));
            end
          if ((^~((|($signed(reg83) | (~^(7'h42)))) ?
              $signed((wire76 ?
                  (^reg83) : (8'h9f))) : (!wire75[(4'ha):(2'h3)]))))
            begin
              reg86 <= ($unsigned((($signed((8'ha9)) <<< wire69) ?
                      wire75 : $signed(((8'ha0) ? reg78 : (8'hb0))))) ?
                  {wire74,
                      $signed((+(reg78 & reg85)))} : $unsigned($unsigned(((|wire69) >> (wire74 ?
                      wire75 : reg78)))));
            end
          else
            begin
              reg86 <= $unsigned(wire68[(2'h2):(2'h2)]);
              reg87 <= ((reg79 ?
                  wire69 : wire72) && $signed((wire72[(3'h4):(2'h2)] - wire74[(4'hc):(1'h0)])));
            end
        end
      else
        begin
          reg79 <= ($unsigned(wire77) == wire75[(3'h6):(2'h3)]);
          reg80 <= ({($unsigned(reg81) ?
                  {wire68[(4'h8):(1'h1)],
                      $unsigned(wire76)} : $unsigned($signed(wire76))),
              $signed(reg84)} << $signed($signed((+(reg84 ?
              (8'h9d) : wire75)))));
          reg81 <= reg79[(2'h3):(2'h2)];
          reg82 <= (~|({reg79[(1'h0):(1'h0)]} < $unsigned((-(wire71 ?
              (8'ha4) : (8'ha2))))));
          if (reg83)
            begin
              reg83 <= ((~&((8'hae) ?
                  wire74[(4'h9):(3'h6)] : ((wire75 >>> reg79) ^ reg80))) && ((reg80[(4'h8):(3'h5)] ?
                  $signed({wire72}) : wire75[(3'h6):(2'h3)]) == (&({reg85} ?
                  {wire69, reg86} : wire71))));
              reg84 <= (wire68 >> reg86);
              reg85 <= $unsigned($unsigned(wire76));
            end
          else
            begin
              reg83 <= (reg83 <= ({((wire68 ^~ reg87) << (wire70 != (8'ha9)))} ?
                  $signed(wire69) : (~|reg80)));
              reg84 <= ($unsigned(((8'hac) ?
                      {wire76[(3'h6):(3'h6)]} : ({wire75} ?
                          (wire73 * reg78) : $signed(wire69)))) ?
                  wire72[(3'h6):(2'h2)] : (wire68 ?
                      reg84 : {$signed((reg84 ? reg84 : (8'hbd))),
                          $unsigned({reg84})}));
              reg85 <= ((((wire73 ?
                      wire75[(3'h5):(2'h2)] : (reg81 || (8'hb9))) ^ reg80) | ($unsigned((reg86 <<< (8'hb1))) ~^ ((wire72 ?
                      reg85 : (8'hb0)) >= ((8'had) ? wire77 : reg86)))) ?
                  wire74[(3'h6):(1'h1)] : (wire73 ? reg81 : wire68));
            end
        end
      reg88 <= (reg83[(4'h8):(2'h2)] ?
          $unsigned(wire76) : $unsigned($unsigned($signed((wire74 >>> reg82)))));
      if ((~(($unsigned($unsigned((7'h43))) <<< reg82[(2'h3):(2'h3)]) ?
          reg78[(4'hf):(4'hd)] : $signed((+wire75[(3'h6):(1'h0)])))))
        begin
          if (((~^(wire68 == (^(reg87 ? reg87 : wire68)))) ?
              (~^($unsigned($unsigned(reg81)) ?
                  (~|(wire70 >= wire77)) : ({wire76, reg87} ?
                      wire75 : reg87[(4'ha):(2'h2)]))) : (^(~^wire72[(3'h4):(3'h4)]))))
            begin
              reg89 <= $unsigned(wire75);
              reg90 <= $unsigned(((reg87 ?
                  reg85[(1'h0):(1'h0)] : reg89) >> ($unsigned((reg78 | wire70)) ~^ (reg89 & {wire70,
                  reg78}))));
              reg91 <= {({wire71[(2'h3):(2'h2)],
                          $signed((wire77 ? reg86 : reg79))} ?
                      {({wire73} ? $signed(reg87) : (~reg82)),
                          (reg83[(1'h0):(1'h0)] ?
                              (8'h9d) : reg89[(4'h9):(3'h5)])} : {((+reg83) <<< (reg80 + (8'ha9))),
                          (wire73 ? (reg82 > (8'ha4)) : {reg82, reg81})})};
              reg92 <= (8'hb6);
              reg93 <= wire74;
            end
          else
            begin
              reg89 <= (reg88 <<< (^(!{(~^reg89)})));
            end
          if (wire69[(5'h12):(2'h2)])
            begin
              reg94 <= reg88;
            end
          else
            begin
              reg94 <= (^~(wire75[(5'h10):(3'h4)] >> reg87[(5'h12):(5'h10)]));
              reg95 <= $unsigned($signed($signed($signed($unsigned((8'hb3))))));
              reg96 <= reg78;
              reg97 <= {(~&reg95[(2'h2):(2'h2)]), (^~reg88)};
              reg98 <= $unsigned(($signed({(wire68 ? wire70 : wire74)}) ?
                  reg89[(3'h7):(3'h4)] : (&{reg86})));
            end
          reg99 <= (^~(8'ha2));
        end
      else
        begin
          reg89 <= {(&($signed(reg95) ? (7'h42) : reg86))};
          reg90 <= ({$unsigned($signed((reg84 ~^ reg92))),
              ($signed((!reg90)) ?
                  reg78[(4'h8):(2'h3)] : wire68)} && (+$signed((&((8'h9e) > reg79)))));
          reg91 <= reg87;
          reg92 <= (((^~(!(8'haa))) ^~ (reg97 >= $signed({(8'ha1), (8'h9f)}))) ?
              ((((reg81 ~^ reg83) != (~^reg99)) <<< $signed((reg89 ?
                  wire71 : reg80))) ~^ $signed(wire71)) : (^$unsigned({{reg95},
                  (reg78 ? reg83 : reg98)})));
          reg93 <= (((|(&$unsigned(wire71))) + wire75[(2'h3):(1'h1)]) ^~ {$signed({$unsigned(reg89),
                  $unsigned(reg80)})});
        end
    end
  always
    @(posedge clk) begin
      reg100 <= (~|{$signed(($unsigned(reg85) <= (reg81 ? reg98 : reg99))),
          reg90[(4'h9):(2'h3)]});
      reg101 <= $signed(wire71[(2'h3):(1'h0)]);
      reg102 <= reg93[(1'h0):(1'h0)];
      reg103 <= $unsigned((~^reg94[(4'ha):(4'h8)]));
      reg104 <= (7'h43);
    end
  assign wire105 = reg88[(3'h4):(1'h1)];
endmodule

module module15
#(parameter param59 = (((((~(8'h9f)) ? {(8'had)} : (~&(8'ha7))) >>> {((8'hbe) ? (8'ha1) : (8'ha5)), ((8'hb6) < (8'ha9))}) ? (~{((8'hb4) > (8'ha7))}) : {(!((8'ha6) ? (8'ha9) : (8'ha2))), ((+(8'ha0)) ? ((8'h9d) ? (8'hac) : (8'h9c)) : ((8'ha3) + (8'hae)))}) ? ((^(+{(8'h9d)})) ? ((^(-(7'h42))) ? (((8'hb8) >> (8'had)) && ((8'hbc) ? (8'ha0) : (8'hab))) : (((8'ha1) ? (7'h41) : (8'hbc)) ? (^~(8'hb2)) : ((8'haf) ? (8'ha7) : (8'haa)))) : (^~(~|{(8'ha7), (8'ha4)}))) : ((((~&(8'haf)) << ((7'h43) ? (8'ha6) : (8'hbc))) != {(^~(8'ha0)), ((8'hbe) == (8'h9e))}) & ((^~((8'haa) ? (8'ha9) : (8'hb5))) ~^ (!((8'haa) ? (8'hb5) : (8'hb1)))))), 
parameter param60 = {(&((param59 + (param59 ? param59 : param59)) != {{param59, param59}, {param59}})), param59})
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire [(3'h5):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(4'hd):(1'h0)] wire47;
  wire [(5'h10):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire55,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire37,
                 wire36,
                 wire35,
                 reg58,
                 reg57,
                 reg56,
                 reg54,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
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
  always
    @(posedge clk) begin
      if (wire18)
        begin
          reg21 <= wire16[(1'h0):(1'h0)];
          reg22 <= (~&$signed(((~|wire17) != (&{reg21}))));
        end
      else
        begin
          reg21 <= wire17;
          if (({wire20[(1'h0):(1'h0)], wire18} ?
              reg21[(3'h5):(2'h3)] : ($signed($unsigned(wire20[(2'h2):(1'h1)])) ?
                  wire16 : (^(wire20[(2'h2):(1'h0)] ?
                      (reg21 ? wire18 : wire18) : {wire17})))))
            begin
              reg22 <= wire18[(2'h3):(1'h1)];
              reg23 <= $signed(reg22);
              reg24 <= (&(~&((8'hb3) >> $signed((wire19 ? wire17 : wire19)))));
            end
          else
            begin
              reg22 <= ((~|{((~^reg23) && (&wire18)),
                  (~(wire16 << wire17))}) <= ({((~wire17) ?
                      ((8'hb5) ? wire19 : wire16) : ((7'h40) ? reg24 : wire17)),
                  (^wire17[(4'ha):(1'h0)])} >>> (((reg22 ? wire18 : wire16) ?
                  (-reg24) : $unsigned(reg24)) != ($signed(wire16) ?
                  {(8'haf), reg24} : {wire16, reg23}))));
              reg23 <= wire20;
              reg24 <= $unsigned($unsigned((reg23[(3'h6):(3'h4)] ?
                  wire19[(3'h4):(1'h1)] : {(~^(7'h40))})));
            end
          if (wire18)
            begin
              reg25 <= wire16;
            end
          else
            begin
              reg25 <= ((^(reg21 >= wire17[(3'h5):(2'h3)])) ?
                  (~^(^$signed({reg21,
                      reg25}))) : $unsigned(reg24[(1'h1):(1'h0)]));
              reg26 <= {reg22[(3'h5):(2'h3)],
                  ({reg24[(3'h6):(1'h0)]} >= $signed((&(wire17 ?
                      reg21 : (8'ha3)))))};
              reg27 <= (((reg26 ?
                      wire18[(3'h5):(1'h0)] : ($signed(wire18) ?
                          $signed(wire20) : (wire16 > (8'hac)))) >> {(~(reg21 ?
                          wire17 : wire16))}) ?
                  ({wire17[(3'h7):(1'h0)]} <= reg26) : ($unsigned(reg25[(4'hb):(3'h5)]) ~^ {wire16[(2'h2):(1'h0)],
                      (^(wire17 << reg26))}));
              reg28 <= $unsigned(((reg22[(3'h5):(3'h4)] ?
                      (&(~^wire18)) : reg21) ?
                  reg23[(4'ha):(4'h9)] : (8'ha5)));
            end
          reg29 <= reg25[(3'h7):(3'h5)];
          reg30 <= $signed(reg25[(4'h8):(2'h2)]);
        end
      reg31 <= wire18;
      reg32 <= {wire19[(3'h5):(1'h0)],
          (({wire18} != wire20[(3'h5):(1'h1)]) ?
              {{$unsigned(reg24)},
                  (reg29[(1'h0):(1'h0)] ?
                      {reg25, reg31} : $signed(reg26))} : (((^~reg21) ?
                  (~&wire18) : (reg27 ?
                      (8'h9f) : (8'ha2))) ^ $unsigned(reg23)))};
      reg33 <= reg26[(2'h3):(1'h1)];
      reg34 <= $unsigned((reg33[(3'h6):(3'h4)] < (~&wire18)));
    end
  assign wire35 = (wire20[(4'ha):(4'h9)] ?
                      wire16[(3'h6):(3'h5)] : $unsigned(($unsigned((!reg24)) - (+reg29[(4'hf):(3'h4)]))));
  assign wire36 = ($signed($unsigned($signed(((8'hb1) == reg31)))) * (!reg29[(4'ha):(2'h3)]));
  assign wire37 = ($unsigned((({reg27} * (wire17 ? reg21 : wire36)) ?
                          {reg34, (reg25 < reg27)} : ((-reg25) ?
                              (reg25 == wire18) : (wire19 ? wire16 : reg25)))) ?
                      reg28[(3'h6):(3'h6)] : (|$unsigned(reg25[(3'h5):(3'h5)])));
  always
    @(posedge clk) begin
      reg38 <= (+wire36);
      reg39 <= (~&({reg38,
          $unsigned($unsigned(reg21))} > $unsigned(reg34[(4'h8):(3'h6)])));
      reg40 <= (~$signed(($unsigned(reg38[(1'h1):(1'h1)]) || (~|$unsigned(reg34)))));
      reg41 <= {(+$signed($unsigned(reg21))), reg29};
      if ({reg25})
        begin
          if (reg31)
            begin
              reg42 <= (|(((^~reg21[(2'h2):(1'h1)]) ?
                  (wire35[(1'h0):(1'h0)] ^ {reg31,
                      wire37}) : $signed(((8'ha5) >> reg34))) < $signed($signed($unsigned(wire18)))));
              reg43 <= $unsigned({reg42, (reg24 || $unsigned(reg25))});
            end
          else
            begin
              reg42 <= reg39[(3'h5):(1'h0)];
            end
        end
      else
        begin
          reg42 <= (+$unsigned($unsigned(reg26[(4'hf):(2'h3)])));
          reg43 <= $signed(($unsigned(($unsigned(reg30) && $unsigned((8'hac)))) <= $signed(reg27)));
          reg44 <= $signed(((8'h9d) - ({reg38[(1'h0):(1'h0)],
              wire16[(1'h1):(1'h1)]} ~^ reg31)));
          reg45 <= {{$signed((reg21 - (^reg31)))}};
        end
    end
  assign wire46 = (reg34[(3'h7):(2'h3)] ^~ $unsigned(reg45));
  assign wire47 = $unsigned($signed(($signed(((8'hba) ? reg28 : (8'ha2))) ?
                      reg44 : reg22[(3'h4):(1'h1)])));
  assign wire48 = $signed($unsigned($unsigned({$signed(reg43)})));
  assign wire49 = $signed($signed(reg22));
  assign wire50 = reg38;
  assign wire51 = ($signed(((~^$unsigned(wire50)) ?
                          reg41[(3'h5):(1'h1)] : ((^reg39) - reg29))) ?
                      ($signed(wire46) ^~ ((reg42[(3'h4):(1'h1)] << (reg30 >> wire50)) ?
                          $signed((wire18 ?
                              (8'hbd) : reg24)) : reg45[(2'h2):(1'h0)])) : $unsigned((~&$unsigned(wire49))));
  assign wire52 = ((~&$signed(reg27)) ? (&(~|(~^$signed((8'hbc))))) : reg25);
  assign wire53 = (reg41[(2'h3):(2'h2)] ?
                      (-(-(~|$unsigned(wire18)))) : ((8'ha3) ^~ ((~&((8'ha9) ?
                              (8'hb8) : wire52)) ?
                          (reg25[(3'h4):(1'h0)] ?
                              (^reg30) : wire48) : (((8'ha3) ?
                              (8'hb2) : reg23) == (reg22 ? reg29 : wire51)))));
  always
    @(posedge clk) begin
      reg54 <= reg41;
    end
  assign wire55 = (((~(reg32 ^~ $signed(wire47))) ?
                      (reg54 ?
                          wire19 : ($unsigned(wire16) + (~&wire37))) : $signed($unsigned((8'ha9)))) <= (+(reg22[(1'h0):(1'h0)] <= wire50)));
  always
    @(posedge clk) begin
      reg56 <= ((~|reg28[(4'h8):(1'h1)]) != $signed((~|reg22)));
      reg57 <= $signed((&$unsigned({wire50, (reg39 > reg34)})));
      reg58 <= wire37;
    end
endmodule
