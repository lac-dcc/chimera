module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire225;
  wire signed [(5'h13):(1'h0)] wire224;
  wire signed [(5'h12):(1'h0)] wire223;
  wire signed [(4'h8):(1'h0)] wire218;
  wire signed [(5'h10):(1'h0)] wire216;
  wire signed [(4'hf):(1'h0)] wire211;
  wire signed [(4'he):(1'h0)] wire210;
  wire signed [(5'h15):(1'h0)] wire209;
  wire signed [(4'hf):(1'h0)] wire208;
  wire signed [(5'h12):(1'h0)] wire206;
  wire [(4'hf):(1'h0)] wire205;
  wire [(5'h10):(1'h0)] wire198;
  wire signed [(5'h11):(1'h0)] wire197;
  wire [(2'h3):(1'h0)] wire196;
  wire signed [(4'h8):(1'h0)] wire194;
  wire signed [(4'hd):(1'h0)] wire117;
  wire signed [(3'h6):(1'h0)] wire220;
  wire [(3'h4):(1'h0)] wire221;
  reg signed [(4'hd):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg213 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg212 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg199 = (1'h0);
  reg signed [(4'he):(1'h0)] reg200 = (1'h0);
  reg [(4'h9):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg202 = (1'h0);
  reg [(4'hb):(1'h0)] reg203 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg204 = (1'h0);
  assign y = {wire225,
                 wire224,
                 wire223,
                 wire218,
                 wire216,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire206,
                 wire205,
                 wire198,
                 wire197,
                 wire196,
                 wire194,
                 wire117,
                 wire220,
                 wire221,
                 reg217,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg199,
                 reg200,
                 reg201,
                 reg202,
                 reg203,
                 reg204,
                 (1'h0)};
  module4 #() modinst118 (.clk(clk), .wire8(wire0), .wire7(wire2), .wire6(wire1), .wire5(wire3), .y(wire117));
  always
    @(posedge clk) begin
      reg119 <= wire0;
      reg120 <= (&(wire1 || $signed(wire3[(4'h9):(2'h3)])));
      reg121 <= (~^(~|$signed(($unsigned(wire3) - wire2))));
      reg122 <= {wire117[(3'h4):(3'h4)]};
      reg123 <= (8'ha9);
    end
  module124 #() modinst195 (.clk(clk), .wire128(wire117), .wire129(wire3), .wire125(reg123), .wire126(wire0), .y(wire194), .wire127(wire2));
  assign wire196 = ((reg120 ?
                           $signed((wire117[(4'hb):(3'h5)] ^ (reg122 ~^ wire3))) : wire0) ?
                       $signed(($unsigned({reg119, wire194}) ?
                           (!wire3) : (-{wire0}))) : reg119);
  assign wire197 = (~&($unsigned(($unsigned(wire194) ?
                           (reg120 ? wire3 : wire3) : (wire194 ?
                               wire1 : wire196))) ?
                       $unsigned({(!reg123)}) : wire0));
  assign wire198 = $unsigned(reg121[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg199 <= wire2;
      if (({({((8'hb4) & wire2)} <<< $signed({reg121, reg199}))} ?
          $signed((wire1 ?
              reg121[(1'h1):(1'h0)] : (((8'hba) ?
                  wire197 : (8'hbc)) & $unsigned(reg122)))) : reg120[(1'h1):(1'h1)]))
        begin
          reg200 <= reg199;
        end
      else
        begin
          reg200 <= ($signed($unsigned(wire1)) ?
              {$unsigned($signed((^~reg122)))} : $unsigned((($signed(reg122) ?
                      (reg199 ? wire196 : wire2) : (reg120 ? reg122 : reg123)) ?
                  reg123[(3'h6):(1'h0)] : (+(8'hb1)))));
          reg201 <= (+wire0);
        end
      reg202 <= wire196[(1'h1):(1'h1)];
      reg203 <= reg119[(1'h0):(1'h0)];
      reg204 <= $signed(($signed((wire197[(3'h6):(3'h4)] ?
          (reg201 ^~ reg123) : (reg123 ?
              reg203 : wire3))) > ($unsigned($unsigned(wire3)) ?
          (~|$unsigned(reg123)) : ((~&reg202) ~^ reg119[(3'h7):(3'h6)]))));
    end
  assign wire205 = reg201;
  module169 #() modinst207 (.y(wire206), .wire172(reg202), .wire173(reg120), .wire171(wire197), .wire170(reg123), .wire174(wire205), .clk(clk));
  assign wire208 = (8'had);
  assign wire209 = reg200;
  assign wire210 = (((&{(~|reg120)}) <= $unsigned(wire197[(3'h5):(3'h4)])) ?
                       (((~(|(8'hbb))) ~^ $unsigned($signed(wire2))) ?
                           $unsigned(((wire205 - wire3) ^~ $unsigned(wire2))) : $signed(reg123[(3'h4):(3'h4)])) : reg203[(1'h1):(1'h0)]);
  assign wire211 = {{reg203[(3'h7):(3'h6)]}};
  always
    @(posedge clk) begin
      reg212 <= (8'ha4);
      reg213 <= (~^(((~reg121[(1'h1):(1'h0)]) ?
              $unsigned({reg212}) : $unsigned($unsigned(reg120))) ?
          (~(8'haa)) : $unsigned((8'ha2))));
      reg214 <= {((~&($signed(wire2) << reg121[(1'h1):(1'h0)])) ?
              {((~&reg121) ? wire198 : $signed(reg201)),
                  $unsigned(wire196[(2'h3):(1'h0)])} : reg202),
          $unsigned((wire117 <<< reg120))};
      reg215 <= (~$unsigned(({{reg119, reg199}, (-wire197)} ?
          $unsigned($signed(reg123)) : (-wire209))));
    end
  assign wire216 = (-reg201);
  always
    @(posedge clk) begin
      reg217 <= reg122[(3'h5):(3'h4)];
    end
  module4 #() modinst219 (.y(wire218), .clk(clk), .wire8(wire210), .wire7(wire0), .wire5(reg120), .wire6(wire3));
  assign wire220 = $unsigned($unsigned($signed(wire209)));
  module66 #() modinst222 (.y(wire221), .wire68(wire197), .clk(clk), .wire70(reg120), .wire67(reg213), .wire69(reg200));
  assign wire223 = (8'haf);
  assign wire224 = {reg212[(2'h2):(1'h1)]};
  assign wire225 = $signed($signed((~|{wire196, reg214})));
endmodule

module module124
#(parameter param192 = ({(({(8'hb0)} ? (~&(8'hae)) : ((8'ha1) ? (8'ha3) : (8'hbb))) > (-((8'hb5) ? (8'ha2) : (8'hbc))))} || {((((8'ha9) | (8'ha2)) ? (~|(8'hb0)) : {(8'hb9)}) <<< {((8'ha5) ? (8'ha5) : (8'ha5)), ((8'ha3) - (8'hb7))}), (((&(8'hb2)) + ((8'hbd) ~^ (8'hbe))) ? (~((8'hbb) ? (8'hb5) : (7'h43))) : (-((8'hbb) >> (8'hab))))}), 
parameter param193 = ((+param192) ~^ {{((param192 >> param192) ? (param192 > param192) : (param192 ? (8'haf) : param192)), (7'h43)}, {(param192 && param192)}}))
(y, clk, wire125, wire126, wire127, wire128, wire129);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire125;
  input wire signed [(5'h11):(1'h0)] wire126;
  input wire signed [(5'h12):(1'h0)] wire127;
  input wire signed [(4'hd):(1'h0)] wire128;
  input wire signed [(4'ha):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire191;
  wire signed [(2'h3):(1'h0)] wire185;
  wire signed [(5'h13):(1'h0)] wire146;
  wire [(4'hc):(1'h0)] wire147;
  wire signed [(4'hb):(1'h0)] wire148;
  wire signed [(4'hb):(1'h0)] wire154;
  wire signed [(4'h8):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire183;
  reg signed [(4'h8):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg189 = (1'h0);
  reg [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg187 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(5'h13):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg165 = (1'h0);
  reg [(4'hd):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(5'h14):(1'h0)] reg162 = (1'h0);
  reg [(5'h15):(1'h0)] reg161 = (1'h0);
  reg [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(3'h7):(1'h0)] reg157 = (1'h0);
  reg [(4'hf):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg [(4'ha):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(2'h2):(1'h0)] reg142 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg signed [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg [(4'h9):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  assign y = {wire191,
                 wire185,
                 wire146,
                 wire147,
                 wire148,
                 wire154,
                 wire155,
                 wire183,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
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
                 reg130,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg130 <= $signed($unsigned(($unsigned($unsigned((7'h40))) ~^ $signed((wire129 ?
          wire128 : wire125)))));
      if (($unsigned($unsigned((wire127 ~^ wire129[(1'h1):(1'h0)]))) ?
          $signed($unsigned({$signed(wire128)})) : $unsigned($signed((!(~^reg130))))))
        begin
          reg131 <= ((~^wire128) >= (~^(($signed(reg130) ?
                  $unsigned((7'h44)) : wire126) ?
              (^(wire128 ?
                  reg130 : reg130)) : ($signed(wire125) ~^ (wire128 >>> wire129)))));
          reg132 <= (!$signed($unsigned((~|{wire128}))));
          reg133 <= wire125[(3'h5):(1'h1)];
          reg134 <= reg130;
        end
      else
        begin
          if ((-(wire129 ? $signed(wire128) : (~^wire128))))
            begin
              reg131 <= (~|((reg131 ?
                      {(~|reg131),
                          reg130[(1'h0):(1'h0)]} : ((reg131 && wire126) ?
                          wire125[(3'h4):(1'h0)] : (+(8'hab)))) ?
                  wire127[(3'h4):(1'h0)] : (~|(|((7'h40) ?
                      wire125 : reg132)))));
              reg132 <= reg131[(1'h1):(1'h0)];
              reg133 <= ((^$unsigned(wire129[(3'h7):(3'h7)])) - {wire127});
              reg134 <= {wire126[(3'h4):(2'h2)],
                  ((~|wire128[(4'hc):(4'ha)]) & ($signed(wire129[(4'h9):(2'h3)]) - (reg130 ?
                      (7'h43) : (^(8'h9d)))))};
            end
          else
            begin
              reg131 <= $unsigned($unsigned(($unsigned($unsigned(wire125)) <<< $signed({wire126}))));
              reg132 <= (reg131 | reg131[(1'h0):(1'h0)]);
              reg133 <= $unsigned((!$unsigned(($unsigned(wire128) ?
                  (~|(8'hb5)) : (&reg133)))));
              reg134 <= {(&wire127), wire128};
            end
          reg135 <= $signed(($signed((~^(reg134 ?
              wire127 : wire126))) ~^ (~^((reg133 ?
              wire128 : reg130) != (wire127 ? (8'ha4) : reg134)))));
          reg136 <= ($signed((reg132[(1'h1):(1'h1)] < ((^~reg132) + reg132[(2'h2):(1'h1)]))) ?
              reg132[(2'h3):(2'h2)] : (^wire126));
          reg137 <= (!{$signed($signed($signed(wire128))),
              {(-$unsigned(reg134)), $signed($signed(reg131))}});
        end
      reg138 <= $signed(wire127);
      if (($unsigned((+wire126)) < ((((reg137 >> (8'ha9)) < (reg137 >= reg137)) >> $unsigned($signed(reg136))) ?
          wire126 : reg134[(4'hc):(3'h6)])))
        begin
          reg139 <= (~($signed(((^~wire127) > reg133)) ?
              ($unsigned(((8'haa) ?
                  wire125 : (8'hbc))) >>> $unsigned(reg135[(2'h3):(2'h2)])) : reg132[(3'h5):(1'h1)]));
          if ({(+$signed($unsigned({reg131, (8'hb9)})))})
            begin
              reg140 <= (^~$signed($signed(reg132[(1'h1):(1'h0)])));
              reg141 <= {(~|($unsigned(((8'h9e) ?
                      wire125 : reg133)) <<< {(reg137 >>> reg139),
                      ((8'ha3) ? reg138 : reg134)}))};
              reg142 <= wire129;
              reg143 <= reg141[(1'h0):(1'h0)];
            end
          else
            begin
              reg140 <= (!reg136[(3'h5):(1'h1)]);
              reg141 <= $unsigned($signed(($unsigned(wire127[(4'he):(4'h9)]) ?
                  (^~reg137[(3'h5):(1'h0)]) : reg132)));
              reg142 <= ((|$signed(reg134[(4'h8):(3'h5)])) ?
                  {{(reg134[(3'h7):(1'h1)] ? (reg142 >>> reg137) : reg141),
                          (8'hbc)}} : $unsigned(reg143[(2'h2):(1'h0)]));
            end
        end
      else
        begin
          reg139 <= reg133;
          if ({($signed(reg135) ? (8'had) : (-$signed({reg133}))),
              (($signed({(8'hbb)}) ?
                      ({reg138, reg137} ?
                          reg130 : $unsigned((8'ha6))) : reg142) ?
                  ((^~(~^reg142)) ?
                      (((8'hb5) * reg137) != (!reg131)) : ((reg135 ?
                          wire126 : reg131) >>> {reg131,
                          reg139})) : $signed($unsigned($signed(reg140))))})
            begin
              reg140 <= (~|{reg132, reg134[(2'h2):(1'h1)]});
              reg141 <= reg135;
              reg142 <= (reg137[(4'h8):(3'h7)] <= ({{$signed(wire128)},
                      {(^~reg139)}} ?
                  (&{(reg140 ? reg133 : wire128)}) : (^{reg130})));
              reg143 <= (reg136 ? (8'hb2) : reg139);
              reg144 <= $unsigned((~|(7'h40)));
            end
          else
            begin
              reg140 <= ($unsigned((&$unsigned($signed(reg143)))) << ((wire125 < ({reg132} ?
                  $signed(reg132) : $signed(reg137))) || reg131[(2'h3):(2'h2)]));
              reg141 <= (^~reg141);
              reg142 <= (+reg144[(4'h9):(3'h7)]);
              reg143 <= $signed(reg140[(1'h0):(1'h0)]);
              reg144 <= wire128;
            end
          reg145 <= wire129;
        end
    end
  assign wire146 = reg140;
  assign wire147 = $signed(reg142[(1'h1):(1'h1)]);
  assign wire148 = (^~wire128);
  always
    @(posedge clk) begin
      reg149 <= wire148;
      reg150 <= (~^($unsigned((+reg130[(4'h9):(2'h2)])) > (($unsigned(reg145) | $signed(reg131)) && (^~$signed(wire127)))));
      reg151 <= $signed(wire147[(4'h9):(1'h0)]);
      reg152 <= (~|{$unsigned({reg143[(2'h2):(2'h2)], (|wire127)}),
          {($signed((8'haa)) ? reg149[(4'ha):(1'h1)] : reg150)}});
      reg153 <= wire126[(1'h0):(1'h0)];
    end
  assign wire154 = reg144[(4'h8):(4'h8)];
  assign wire155 = ((+$signed((-{reg132}))) ~^ (8'ha9));
  always
    @(posedge clk) begin
      reg156 <= ($unsigned(($signed($unsigned(reg140)) ?
          (reg139 <= wire129[(3'h6):(1'h1)]) : (~&wire148))) >>> $signed($signed($signed($signed(reg143)))));
      reg157 <= reg137[(5'h12):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg158 <= $unsigned(wire148);
      reg159 <= (~|(|{{reg137}}));
      reg160 <= {($signed($unsigned((|reg149))) ?
              ((^~$signed(reg133)) ?
                  wire147 : $signed(reg130)) : reg159[(2'h3):(1'h1)])};
      if ((((((!reg137) | reg142) & $unsigned(reg152)) ?
          $signed($signed((~^reg142))) : ($unsigned(((8'ha5) ?
                  reg144 : (8'hac))) ?
              {$unsigned(reg137)} : (wire129 ?
                  (reg142 ?
                      reg157 : wire146) : reg142[(2'h2):(2'h2)]))) ^ ((^~(7'h40)) ?
          reg142 : $signed(reg151))))
        begin
          reg161 <= $unsigned((reg156 >> reg153));
          reg162 <= {$signed(reg158), $unsigned((^~reg132[(3'h5):(2'h2)]))};
          reg163 <= (wire125[(3'h5):(1'h1)] >>> (&reg160[(4'he):(1'h0)]));
        end
      else
        begin
          if (($unsigned((~&reg142)) ?
              {(+(reg158[(4'ha):(3'h6)] ? reg150 : $unsigned((8'hac)))),
                  ($unsigned(wire127) > $signed((8'haf)))} : (reg151[(3'h5):(3'h5)] & (reg139[(3'h7):(3'h5)] == {reg163}))))
            begin
              reg161 <= reg145[(1'h1):(1'h0)];
              reg162 <= ({({reg162[(4'h9):(3'h7)]} ?
                          $unsigned((reg134 ?
                              (8'ha5) : wire154)) : $signed(((8'ha7) ?
                              reg160 : reg151))),
                      {(!(reg140 + reg130))}} ?
                  $signed(reg131[(3'h5):(1'h1)]) : (|$signed($signed((reg135 ^~ wire125)))));
              reg163 <= ($signed($signed(((8'hba) ?
                      $unsigned(reg153) : reg142[(1'h1):(1'h0)]))) ?
                  ($signed((~|reg149)) > $unsigned((&$unsigned(reg142)))) : $unsigned(reg153));
              reg164 <= $signed($signed(({(reg133 ?
                      reg136 : (8'h9c))} <= (8'ha6))));
              reg165 <= ((reg134 | ($signed((reg132 ?
                      reg132 : reg143)) | wire126[(3'h6):(3'h5)])) ?
                  (~|{wire127, {$unsigned(wire147)}}) : reg159);
            end
          else
            begin
              reg161 <= {$unsigned(({(wire155 ?
                          reg133 : wire129)} <<< reg143[(1'h0):(1'h0)])),
                  ((((8'h9d) ?
                          (reg131 == reg157) : wire155[(2'h2):(1'h1)]) >= ($signed(reg156) | (wire127 >= reg130))) ?
                      $signed($unsigned(reg156[(3'h5):(2'h2)])) : (reg133[(1'h0):(1'h0)] & (|$signed(reg140))))};
              reg162 <= ((reg141[(5'h14):(3'h7)] ?
                  reg163 : ($unsigned($unsigned(reg134)) & ((wire154 && (8'ha6)) ?
                      $signed(reg153) : wire129[(3'h5):(1'h1)]))) | (~reg137[(3'h7):(3'h4)]));
              reg163 <= wire146;
              reg164 <= ((reg153[(5'h11):(1'h1)] == (!({wire129, (8'ha4)} ?
                      reg151 : reg156[(1'h0):(1'h0)]))) ?
                  (($signed((8'hba)) >= ((reg161 ? reg135 : reg143) > ((8'hb8) ?
                          (8'hb4) : (7'h43)))) ?
                      reg152[(5'h10):(4'he)] : {(reg162 || $unsigned(reg131))}) : (~&$signed(reg139)));
            end
          reg166 <= (8'hae);
          reg167 <= {$unsigned($signed($signed(reg158[(4'h8):(3'h4)]))),
              {(reg141[(2'h3):(1'h1)] && ({reg141} <<< $signed(wire126)))}};
        end
      reg168 <= $signed($signed(((~^((8'ha8) - wire125)) < $signed(reg158))));
    end
  module169 #() modinst184 (.clk(clk), .wire173(reg162), .y(wire183), .wire170(wire127), .wire174(reg156), .wire172(reg152), .wire171(reg145));
  assign wire185 = $signed(reg133[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg186 <= (reg165[(5'h10):(2'h2)] ?
          (-{($unsigned(reg132) ? reg137 : (-reg142)),
              (^~(+(8'ha6)))}) : $signed($signed(wire126[(4'hd):(2'h2)])));
      reg187 <= $signed({(wire185[(2'h3):(2'h3)] ?
              (~reg152) : $signed($unsigned(reg130)))});
      reg188 <= reg156;
      reg189 <= reg133;
      reg190 <= reg188;
    end
  assign wire191 = ({(^(8'hb3)), reg161} >= reg139);
endmodule

module module4
#(parameter param115 = (((((~(8'hb7)) ? {(8'hb7)} : ((8'hbb) + (7'h42))) >= (((8'hb4) ? (8'hb2) : (8'ha2)) ? (8'hab) : (~|(8'ha7)))) < (8'hb3)) - (8'ha5)), 
parameter param116 = (|param115))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  input wire [(4'hd):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(5'h12):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire24;
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire109,
                 wire56,
                 wire54,
                 wire24,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= ($unsigned(wire7) ?
          ({wire5[(4'ha):(2'h3)]} ?
              wire8[(4'h9):(3'h4)] : (~|$signed(wire5))) : ({wire7[(1'h0):(1'h0)]} ?
              ($unsigned($signed(wire5)) * $unsigned(wire7[(2'h2):(1'h1)])) : $signed(($signed(wire5) >> $signed((8'hbd))))));
      reg10 <= ($unsigned($unsigned(((^~(8'hac)) ?
          $unsigned(wire6) : wire8))) - wire7[(2'h2):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg11 <= wire5;
      reg12 <= $unsigned((+({{reg10}} ?
          (^reg11[(3'h7):(3'h7)]) : (reg10[(1'h1):(1'h0)] ^~ (wire8 ^~ reg10)))));
      if ((~$unsigned({(+wire7[(1'h0):(1'h0)])})))
        begin
          reg13 <= $unsigned((wire8 ? (~wire6) : wire5[(3'h4):(3'h4)]));
          if (wire8[(2'h3):(2'h2)])
            begin
              reg14 <= reg11[(4'hd):(4'h8)];
              reg15 <= (~|(~^$unsigned($unsigned($unsigned(reg12)))));
              reg16 <= $signed(reg11[(5'h10):(2'h3)]);
            end
          else
            begin
              reg14 <= (~^$signed($signed(($unsigned(wire5) | (reg11 ?
                  reg10 : reg15)))));
            end
          if ((reg16 ?
              {$signed(((reg9 + reg12) ?
                      (reg15 && reg13) : $signed(wire5)))} : $unsigned({$signed((wire8 != reg9)),
                  ((reg15 ? reg11 : reg14) - (reg12 ? reg11 : reg13))})))
            begin
              reg17 <= {wire5[(4'hd):(2'h3)]};
              reg18 <= $signed(reg13[(3'h7):(3'h6)]);
              reg19 <= (~^(($signed((reg16 ?
                      reg9 : reg15)) >> ($unsigned(reg17) ?
                      (wire5 ? reg17 : reg16) : $signed((8'hb9)))) ?
                  $signed($unsigned((^wire8))) : ((-(reg17 & wire5)) <= $signed((reg14 && reg9)))));
              reg20 <= ($signed($unsigned(reg10[(4'he):(3'h6)])) >>> (wire6 <= ($unsigned((8'h9c)) ?
                  ((~|reg10) ?
                      (reg11 ? (8'h9e) : wire7) : {reg19,
                          reg13}) : $unsigned(reg10[(4'ha):(4'h8)]))));
              reg21 <= $unsigned(reg17[(5'h11):(3'h7)]);
            end
          else
            begin
              reg17 <= (({reg18, (|reg13[(2'h2):(2'h2)])} == ((&{reg9,
                  (8'h9e)}) ^~ (+(|reg20)))) > reg12[(1'h0):(1'h0)]);
              reg18 <= ($unsigned((8'h9e)) != $signed({wire5,
                  ((7'h42) ? $unsigned(reg15) : {reg18})}));
            end
          reg22 <= $unsigned({((8'hbe) + ((reg11 < reg12) ?
                  {reg21, reg11} : {wire5, reg13})),
              reg12[(1'h1):(1'h0)]});
          reg23 <= ({$unsigned((-$unsigned(reg11))),
                  ($unsigned($unsigned((8'ha7))) ?
                      ((reg16 ? reg20 : reg9) || (reg18 ?
                          reg11 : reg11)) : wire8[(1'h0):(1'h0)])} ?
              wire8[(4'hb):(3'h5)] : ((-reg17) ?
                  (((!reg13) ? reg10 : wire7[(3'h7):(3'h7)]) ?
                      reg13 : reg11) : $unsigned((^$unsigned(reg21)))));
        end
      else
        begin
          reg13 <= {(&$signed(((8'ha5) <= (8'ha8)))),
              (|{wire5, ((reg17 ? reg15 : reg11) ? (^~reg11) : (~&reg13))})};
          reg14 <= reg16[(3'h4):(2'h2)];
          reg15 <= reg16;
        end
    end
  assign wire24 = (8'hb5);
  module25 #() modinst55 (.wire29(reg10), .y(wire54), .clk(clk), .wire30(reg22), .wire27(reg9), .wire26(reg13), .wire28(reg16));
  assign wire56 = (reg21[(2'h2):(1'h1)] ?
                      $signed($signed(wire7[(4'h8):(3'h5)])) : reg10[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg57 <= (&($signed(reg13[(2'h3):(2'h3)]) ?
          $unsigned($unsigned((~^(8'hb0)))) : reg19));
      reg58 <= reg17;
      if ($signed($signed(reg18)))
        begin
          if ((^~$unsigned(reg19)))
            begin
              reg59 <= $unsigned(reg19);
              reg60 <= ($unsigned(reg12[(2'h3):(1'h1)]) ?
                  ($unsigned(((^~reg9) ? (^~wire7) : $signed((8'ha2)))) ?
                      (8'hbe) : $signed((wire8 < wire5[(4'ha):(4'h8)]))) : (wire6[(4'h8):(4'h8)] ?
                      (+($signed(reg9) * reg18)) : (8'hba)));
              reg61 <= (+(((8'hb7) ?
                      wire7[(1'h0):(1'h0)] : $unsigned({reg13})) ?
                  (^~$signed($signed(reg14))) : reg14[(2'h3):(1'h0)]));
              reg62 <= reg11[(4'hf):(4'hf)];
              reg63 <= reg10[(2'h3):(1'h0)];
            end
          else
            begin
              reg59 <= (!((~&(~^reg61)) >>> reg22));
              reg60 <= reg10;
              reg61 <= ($unsigned(wire5) | (((reg57[(3'h7):(1'h1)] >> reg61) ?
                  wire5[(3'h5):(2'h3)] : reg57[(1'h1):(1'h0)]) + $signed(reg9[(2'h2):(2'h2)])));
              reg62 <= $unsigned((8'ha6));
            end
          reg64 <= {(~(~^$signed((wire5 + reg57))))};
          reg65 <= $signed((&(~|reg23)));
        end
      else
        begin
          reg59 <= $unsigned(($signed($signed(reg20[(2'h2):(2'h2)])) ?
              $signed(reg15[(5'h10):(2'h2)]) : (~|({reg64, (8'hbe)} ?
                  (reg22 && reg13) : $unsigned(wire6)))));
          reg60 <= ($unsigned(wire24) ?
              $unsigned((8'hb4)) : reg64[(3'h6):(3'h5)]);
          reg61 <= {reg20, {$signed($unsigned(reg13))}};
        end
    end
  module66 #() modinst110 (.wire68(reg62), .y(wire109), .wire70(reg14), .clk(clk), .wire67(reg15), .wire69(reg21));
  assign wire111 = $signed((({reg19[(4'h9):(3'h7)]} | ($signed((8'h9c)) ~^ wire24)) ?
                       reg23 : (^(reg11 || wire8[(3'h4):(2'h3)]))));
  assign wire112 = $signed(({($unsigned(wire6) <<< (-wire6))} ?
                       {((reg22 ? reg9 : (8'haa)) ?
                               $signed((8'hbb)) : reg62[(4'h9):(3'h6)]),
                           reg62} : ($unsigned($signed(reg64)) ?
                           (^~{reg13, reg58}) : reg60)));
  assign wire113 = {reg19};
  assign wire114 = (~^reg9);
endmodule

module module66
#(parameter param108 = ((((8'hb7) ? ((~|(8'ha3)) <= {(8'hbc), (7'h40)}) : (~^((8'hba) ? (8'hb5) : (8'hba)))) <= ((~|((8'ha4) ^ (8'had))) ? (((8'hb2) ? (8'hb5) : (8'hb5)) ? {(8'h9c)} : ((8'hbe) ? (8'had) : (8'hb8))) : {((8'ha8) & (8'hbc))})) ? ((^~(((8'had) ^ (8'ha6)) != ((8'hbc) ? (8'hbc) : (8'hab)))) ? ({(~&(8'hb2))} ? (((8'h9f) ^ (7'h44)) ? ((7'h42) <<< (8'hb4)) : (^(8'ha8))) : {((8'hac) <= (8'h9e))}) : (({(8'ha0), (8'hbb)} ? (~&(8'hbc)) : {(7'h44)}) > (((8'h9c) ? (8'hb0) : (8'hb5)) ? ((8'ha9) ? (8'hb6) : (8'ha1)) : ((8'ha7) ? (8'hbe) : (8'ha8))))) : (((&{(8'ha7)}) * (((8'hb0) ? (8'hba) : (7'h40)) ? ((8'hb1) ? (8'hba) : (8'hb8)) : (~^(8'h9f)))) * ((((8'hae) >> (8'h9e)) ? ((8'ha0) << (8'hb5)) : (&(8'ha9))) ? ({(8'had)} ? (&(8'hb8)) : ((7'h43) == (7'h43))) : (((8'hb9) ? (8'haf) : (8'ha1)) + ((8'h9c) ? (8'hae) : (8'ha3)))))))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire70;
  input wire [(3'h6):(1'h0)] wire69;
  input wire signed [(4'hb):(1'h0)] wire68;
  input wire signed [(5'h10):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire [(4'hb):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire73;
  wire [(2'h3):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(4'he):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire82,
                 wire73,
                 wire72,
                 wire71,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire71 = wire70[(5'h12):(4'he)];
  assign wire72 = $signed(wire70);
  assign wire73 = $signed(((wire72 ?
                      $signed(wire67) : ($signed(wire70) ^ (-wire68))) | (wire72[(2'h3):(2'h3)] >>> $signed($unsigned(wire72)))));
  always
    @(posedge clk) begin
      if ({$signed($signed(({wire73, wire73} ?
              (wire73 ? wire72 : wire73) : wire70))),
          $signed({(+wire71), $signed((-wire71))})})
        begin
          if ($unsigned(wire68[(4'h8):(3'h4)]))
            begin
              reg74 <= ((~^wire67[(1'h1):(1'h0)]) < wire71[(4'h9):(3'h4)]);
              reg75 <= wire72[(1'h1):(1'h0)];
              reg76 <= $signed((((!(|wire67)) ?
                      (wire70 ? {wire71} : (^~reg74)) : wire72[(1'h0):(1'h0)]) ?
                  ((^~((8'hb7) ? reg75 : wire72)) ?
                      wire70 : ((wire68 ? reg75 : wire69) ?
                          (wire71 * reg74) : $signed(wire73))) : ((-wire71[(4'ha):(4'ha)]) ?
                      wire68[(3'h5):(3'h4)] : $signed((wire69 ?
                          wire69 : wire68)))));
            end
          else
            begin
              reg74 <= (!$signed($unsigned((~&(wire72 << wire72)))));
              reg75 <= wire73[(4'he):(4'hd)];
              reg76 <= $unsigned((wire67 * $signed(wire72)));
              reg77 <= {(|({reg75} * $signed((wire68 ? wire68 : wire70))))};
              reg78 <= (-(^~($signed(reg77[(2'h2):(1'h0)]) || $signed($unsigned(wire68)))));
            end
          reg79 <= $signed(wire68);
          reg80 <= ($unsigned(reg74) >>> $signed(($unsigned($unsigned((8'hae))) ?
              $signed((reg74 ? wire69 : wire73)) : {(8'hba),
                  (reg79 ? reg78 : (7'h40))})));
          reg81 <= (wire68 ?
              $signed(reg74[(2'h3):(1'h1)]) : $signed((+$unsigned({reg75,
                  reg75}))));
        end
      else
        begin
          reg74 <= $unsigned((-reg78[(1'h0):(1'h0)]));
        end
    end
  assign wire82 = (8'hb8);
  always
    @(posedge clk) begin
      reg83 <= wire82;
      reg84 <= (reg83[(4'h9):(3'h4)] << $unsigned(reg80[(4'hb):(3'h6)]));
      if ($unsigned($unsigned($unsigned((~|((8'ha4) ? wire82 : wire69))))))
        begin
          reg85 <= (|$signed({reg79[(3'h4):(2'h3)], wire69[(2'h3):(2'h2)]}));
          if ($unsigned($unsigned((wire70[(4'ha):(3'h5)] || ((wire68 << reg76) == (8'hb6))))))
            begin
              reg86 <= $signed($signed(wire71[(1'h1):(1'h1)]));
              reg87 <= ($signed(reg80) < wire67[(3'h4):(3'h4)]);
              reg88 <= $unsigned(reg83);
              reg89 <= (({{(reg74 + wire73)}, reg79[(4'hb):(2'h2)]} ?
                      wire82[(2'h3):(2'h2)] : wire70[(4'hc):(4'hc)]) ?
                  $unsigned(((reg84[(2'h2):(2'h2)] ^ $unsigned(reg84)) < wire71)) : (wire71 ?
                      $unsigned(reg75) : ($unsigned((wire69 ? reg78 : wire72)) ?
                          ($unsigned(reg80) << $signed(reg79)) : $signed((+reg88)))));
              reg90 <= $signed((-$signed(($unsigned(wire82) || (wire72 & wire67)))));
            end
          else
            begin
              reg86 <= wire71[(1'h0):(1'h0)];
              reg87 <= reg80;
            end
          reg91 <= {$signed(reg80[(4'ha):(2'h3)])};
          reg92 <= $signed($signed({(^~(~reg84))}));
          reg93 <= (reg76[(3'h4):(1'h0)] ?
              ($unsigned(((wire68 ? wire69 : reg91) ?
                  reg75[(3'h7):(2'h2)] : (reg85 ?
                      reg78 : reg83))) && (-($unsigned(reg91) >= wire67[(4'h8):(3'h5)]))) : (((reg92[(4'he):(1'h0)] >= (8'hba)) ?
                  reg83 : (^$signed(reg83))) <<< reg74[(4'ha):(3'h6)]));
        end
      else
        begin
          if ($unsigned(($unsigned((reg79[(3'h4):(1'h1)] | $unsigned((7'h42)))) ?
              (^~$signed(reg91[(2'h3):(2'h2)])) : reg81[(3'h4):(1'h0)])))
            begin
              reg85 <= (^~reg83);
            end
          else
            begin
              reg85 <= (~^{$signed(reg90)});
              reg86 <= (+wire69);
              reg87 <= $unsigned(wire69);
              reg88 <= reg81[(3'h6):(3'h5)];
              reg89 <= {(reg92[(4'ha):(3'h4)] - ($signed($signed(reg81)) <= $unsigned((8'h9c)))),
                  $unsigned($unsigned(($unsigned(wire72) || (8'hb2))))};
            end
        end
      reg94 <= $signed((~|$signed({(wire71 != reg83)})));
      reg95 <= $signed($unsigned((((wire72 ? reg89 : (8'ha4)) >= reg92) ?
          $unsigned({(8'ha4), reg83}) : ((^reg74) ?
              $unsigned((8'ha0)) : (|(8'hb4))))));
    end
  assign wire96 = (~|$unsigned($signed(reg93[(4'h9):(4'h9)])));
  assign wire97 = $signed($unsigned($signed($signed(((8'haf) * reg78)))));
  assign wire98 = {($unsigned($unsigned((~&(8'hb8)))) ?
                          wire96[(4'hc):(4'hc)] : (reg81[(3'h4):(1'h1)] ?
                              (-{reg75}) : reg83))};
  assign wire99 = ({(((reg86 < reg75) ? $unsigned(wire98) : (wire72 != reg85)) ?
                              ({wire72} >>> $signed(reg76)) : (reg77[(1'h1):(1'h0)] >>> reg86[(2'h3):(2'h2)]))} ?
                      {($unsigned((reg75 | reg93)) ?
                              reg81[(1'h1):(1'h0)] : $signed(((8'ha0) | reg87))),
                          ($signed((&(8'hb6))) - ($unsigned(reg85) > (8'hb0)))} : (-{(&$unsigned(reg77))}));
  assign wire100 = $unsigned((^({{wire98}} ?
                       (^~(reg87 ^ reg81)) : $unsigned((wire69 ^~ reg75)))));
  assign wire101 = $unsigned((-reg84));
  assign wire102 = (wire99 <<< (+(reg88[(4'h8):(4'h8)] ?
                       ($signed(reg85) > (!reg94)) : $signed({reg88,
                           wire71}))));
  assign wire103 = reg74;
  always
    @(posedge clk) begin
      reg104 <= (wire82[(4'hd):(1'h0)] & (&wire96[(1'h1):(1'h1)]));
      reg105 <= reg85[(1'h0):(1'h0)];
      reg106 <= $signed(wire102);
      reg107 <= ($signed($signed(reg90)) > $signed($unsigned({$unsigned(reg86)})));
    end
endmodule

module module25
#(parameter param52 = (((|((8'h9c) == ((8'hb9) ? (8'ha6) : (8'ha5)))) << ({((8'hb8) ? (8'haf) : (7'h40))} ? (((8'ha8) >>> (8'ha9)) ? (&(7'h44)) : (~|(8'h9e))) : {((8'hb8) ^ (8'hbc))})) & {{(((8'h9d) <<< (8'hbb)) ? ((8'hac) ? (8'h9e) : (8'ha5)) : ((8'ha1) ? (8'hb8) : (8'hb1))), ((|(8'h9f)) ? ((8'ha9) | (7'h44)) : ((8'ha7) ? (8'h9f) : (8'ha3)))}}), 
parameter param53 = (((param52 ? ((~param52) ? (param52 != param52) : ((8'hbc) ? param52 : (8'hb5))) : (+(~param52))) <= {({(8'hb4)} || (param52 >> param52))}) << (|{((^~param52) <<< (~|(8'hb3)))})))
(y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire [(5'h14):(1'h0)] wire28;
  input wire [(4'h8):(1'h0)] wire27;
  input wire [(3'h5):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire32;
  wire [(4'ha):(1'h0)] wire31;
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire32,
                 wire31,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire31 = wire28;
  assign wire32 = wire26;
  always
    @(posedge clk) begin
      if (wire29)
        begin
          if (($signed($signed((8'hba))) | ((&$signed(wire26[(3'h4):(2'h3)])) ?
              wire27 : $unsigned(wire31[(4'ha):(4'h8)]))))
            begin
              reg33 <= wire26[(3'h4):(2'h3)];
              reg34 <= ($signed($signed(($unsigned(reg33) ?
                  $signed(wire29) : {wire27}))) << $signed($signed({(&reg33),
                  (wire29 * wire26)})));
            end
          else
            begin
              reg33 <= (8'hb3);
              reg34 <= $signed($unsigned({((wire28 ?
                      wire30 : wire29) || $unsigned(wire32)),
                  ((wire27 ? wire32 : reg33) ?
                      wire30[(3'h7):(3'h4)] : $signed(wire27))}));
              reg35 <= $unsigned($unsigned($unsigned($unsigned((wire31 ?
                  wire30 : (8'hae))))));
            end
          if ((^~$signed((wire28 ? (!(~wire27)) : wire29))))
            begin
              reg36 <= wire29[(4'hb):(4'h8)];
              reg37 <= (wire30[(1'h1):(1'h0)] <= $unsigned((~^(((8'hb1) ?
                      wire26 : wire30) ?
                  $unsigned(reg33) : (wire32 ^~ reg36)))));
              reg38 <= ($unsigned({reg36[(1'h0):(1'h0)],
                      ($unsigned((8'ha8)) ? reg37 : (wire26 << reg36))}) ?
                  $unsigned((-wire27[(3'h6):(3'h4)])) : ($signed(wire27) ?
                      $signed(wire32) : $signed(((reg33 - wire27) ?
                          $unsigned(wire32) : reg36))));
              reg39 <= (reg35 ? (8'ha9) : ((~reg36[(3'h5):(1'h1)]) && reg33));
              reg40 <= (+$unsigned((~|(+reg34[(3'h5):(2'h3)]))));
            end
          else
            begin
              reg36 <= ((^~wire29) ?
                  $signed($signed({(reg34 ?
                          reg39 : reg34)})) : reg34[(3'h5):(1'h0)]);
              reg37 <= ({$signed(($signed((8'hbb)) < (reg38 ?
                      wire28 : wire30))),
                  ((reg34[(3'h4):(1'h0)] ~^ $signed(reg36)) ?
                      $signed((wire31 ? wire32 : wire26)) : ((!(8'hab)) ?
                          ((8'hb2) ?
                              reg38 : (7'h42)) : wire30[(1'h0):(1'h0)]))} != ((!(+$signed(wire29))) ?
                  $signed($signed(wire29[(4'h9):(4'h9)])) : ((wire27[(4'h8):(4'h8)] ?
                      $unsigned((8'ha8)) : wire30[(1'h1):(1'h1)]) ~^ (((8'hb1) ?
                      wire30 : wire31) != reg34[(3'h4):(1'h1)]))));
              reg38 <= reg36[(3'h7):(3'h7)];
            end
          if ($signed((~$signed(wire30[(3'h5):(1'h0)]))))
            begin
              reg41 <= reg35[(4'hc):(2'h2)];
            end
          else
            begin
              reg41 <= {(($unsigned({(8'hbc)}) && $signed((wire31 < wire31))) >= reg39[(3'h6):(2'h3)]),
                  $signed($signed($unsigned((wire27 < reg33))))};
              reg42 <= ((wire28 ?
                  ($unsigned(wire27) ?
                      reg38[(1'h0):(1'h0)] : (wire30 ^ $unsigned(reg36))) : wire26) == {reg39});
              reg43 <= wire31[(4'ha):(2'h2)];
            end
        end
      else
        begin
          if (reg36[(2'h3):(1'h1)])
            begin
              reg33 <= $unsigned(reg37[(3'h5):(3'h4)]);
            end
          else
            begin
              reg33 <= {(($signed((~|reg34)) ?
                      (reg36[(3'h4):(2'h2)] ?
                          (reg41 || (8'hb5)) : $unsigned((8'h9e))) : {{reg39},
                          {reg42, reg39}}) > {((~^reg43) ?
                          reg40[(3'h6):(2'h3)] : $unsigned((8'ha1)))}),
                  $unsigned(($unsigned(reg40[(1'h0):(1'h0)]) ?
                      ((~^reg39) ?
                          wire28[(5'h12):(3'h5)] : (wire29 >> reg43)) : reg43))};
              reg34 <= reg39[(3'h6):(3'h5)];
              reg35 <= $signed($signed(wire31));
              reg36 <= $signed(wire28[(4'he):(1'h0)]);
              reg37 <= $signed($signed((((~^reg40) ?
                  (reg40 || reg33) : (reg35 ?
                      wire30 : wire29)) >> {$signed(reg35)})));
            end
          if ((^~$signed(((^wire26[(3'h5):(1'h0)]) ^~ ((wire32 || reg33) != $signed((7'h43)))))))
            begin
              reg38 <= {(~|(($signed(wire29) >= ((8'hba) ?
                      wire26 : reg38)) - wire27)),
                  (wire32 < reg33[(2'h2):(1'h0)])};
              reg39 <= (-wire30[(4'h9):(3'h6)]);
              reg40 <= (|$unsigned((~^(((8'h9f) ? (8'hb4) : reg34) ?
                  reg43 : $unsigned(reg43)))));
              reg41 <= ($signed((~|(~|$unsigned(reg37)))) <= reg33);
              reg42 <= $signed(reg34[(2'h2):(1'h0)]);
            end
          else
            begin
              reg38 <= $unsigned((wire27[(2'h3):(1'h0)] - ($signed({(8'hb9)}) < $signed($signed((8'hb9))))));
              reg39 <= $unsigned(($unsigned($signed(reg36)) ?
                  (((wire31 > reg37) >> {reg41}) ?
                      $signed(reg39[(2'h2):(1'h1)]) : $unsigned((8'ha7))) : $signed($unsigned((~&reg36)))));
              reg40 <= $unsigned((|(^~wire29[(3'h4):(1'h1)])));
              reg41 <= reg35;
            end
          reg43 <= ((^reg42) != ((~&((reg41 & (8'hb4)) | reg38)) ?
              reg41[(3'h4):(2'h2)] : ($unsigned($signed((8'hb6))) | wire31[(3'h5):(3'h4)])));
        end
      if (((wire27 ?
              ($unsigned($signed(reg42)) * (^$unsigned(reg34))) : ((^~{(7'h41),
                      reg33}) ?
                  ((wire29 ? wire27 : reg33) ? (-reg35) : (8'hb3)) : wire29)) ?
          ($unsigned(((~reg33) > wire30[(3'h7):(1'h0)])) ?
              reg36[(2'h3):(1'h1)] : reg43[(4'hd):(3'h5)]) : (wire30[(3'h7):(3'h6)] ?
              $signed((+$unsigned((8'ha8)))) : reg39[(3'h5):(2'h2)])))
        begin
          reg44 <= wire26[(2'h3):(1'h0)];
          if ({(~|$signed($unsigned(reg35)))})
            begin
              reg45 <= {({reg39[(3'h5):(3'h5)],
                      wire27} < $unsigned(wire26[(2'h3):(1'h0)])),
                  wire29[(4'hb):(1'h1)]};
              reg46 <= ($signed($signed(((8'hbe) ?
                      wire32 : (reg35 == reg40)))) ?
                  $signed(wire26) : ((7'h42) <= $unsigned(wire30[(3'h4):(1'h1)])));
              reg47 <= $unsigned((reg33[(1'h1):(1'h1)] >= $signed(($signed(wire31) >= ((8'hb0) ?
                  wire26 : reg40)))));
            end
          else
            begin
              reg45 <= (+(^~(((^reg40) >> $signed(reg37)) | (wire28 <= (8'hb9)))));
              reg46 <= {reg47[(4'hd):(2'h2)], reg43};
              reg47 <= ($signed(((((8'hbe) ~^ (8'hb4)) >= (&reg46)) + reg33)) != reg35[(4'hf):(2'h3)]);
            end
          reg48 <= ((8'hba) ? $unsigned(reg36[(3'h7):(2'h2)]) : reg46);
        end
      else
        begin
          reg44 <= reg38[(1'h1):(1'h0)];
          reg45 <= $unsigned(reg36[(3'h6):(3'h4)]);
          reg46 <= reg40;
          reg47 <= ((^~reg45[(4'hb):(2'h2)]) ?
              wire30[(4'h9):(3'h4)] : (reg37[(3'h6):(3'h6)] | wire26));
          reg48 <= (reg41[(3'h4):(2'h3)] ? (+$unsigned(reg43)) : reg38);
        end
    end
  assign wire49 = (^~((reg37 <= (wire30[(4'h8):(3'h4)] ?
                          reg48[(4'h8):(4'h8)] : $signed(wire29))) ?
                      ((^~$signed(reg47)) ?
                          (&$unsigned(reg40)) : (wire26[(2'h3):(1'h1)] == $unsigned(reg46))) : reg41[(2'h2):(2'h2)]));
  assign wire50 = (&$unsigned($signed(wire28)));
  assign wire51 = $signed($signed($unsigned(((|reg33) ?
                      {wire49} : reg34[(3'h6):(2'h2)]))));
endmodule

module module169
#(parameter param181 = ({((~&((7'h42) || (8'h9d))) ? (~^(8'h9c)) : (((8'hbb) ? (8'hb8) : (7'h40)) > ((8'hbe) <<< (8'hb5)))), {((^~(8'ha0)) ? (~(8'h9f)) : (8'hab)), (((8'ha5) ? (8'hac) : (8'hb6)) < ((8'hb4) ? (8'hb3) : (8'h9d)))}} ? ((~&(~&((8'h9e) > (8'hb5)))) ? (({(7'h44)} ^~ (-(8'hb7))) ? (((7'h44) ? (8'hae) : (8'ha3)) ? ((8'hb0) != (8'ha2)) : {(7'h40), (8'hb5)}) : (((8'ha0) || (8'hb5)) << ((7'h40) ? (8'ha9) : (8'hae)))) : {(((8'hab) ? (8'hb2) : (8'hb5)) == ((8'hba) <<< (8'hbd))), (+((8'haa) << (8'hae)))}) : (-((~(^~(8'hb2))) > {(|(8'ha8)), ((8'hbf) & (8'hb3))}))), 
parameter param182 = (((((-(8'hbd)) ? (param181 ? param181 : param181) : (+param181)) << ({param181, param181} ? param181 : (param181 ^ param181))) ~^ (param181 > (((8'had) && (8'hb4)) != (&(8'hb8))))) ? param181 : param181))
(y, clk, wire174, wire173, wire172, wire171, wire170);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire174;
  input wire signed [(4'ha):(1'h0)] wire173;
  input wire signed [(5'h11):(1'h0)] wire172;
  input wire [(5'h11):(1'h0)] wire171;
  input wire signed [(3'h4):(1'h0)] wire170;
  wire [(4'he):(1'h0)] wire180;
  wire [(5'h15):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire175;
  assign y = {wire180, wire179, wire178, wire177, wire176, wire175, (1'h0)};
  assign wire175 = (+wire172[(1'h1):(1'h0)]);
  assign wire176 = wire173;
  assign wire177 = (8'ha3);
  assign wire178 = $signed(wire173[(3'h5):(1'h1)]);
  assign wire179 = {$unsigned({$signed({wire171, wire172})})};
  assign wire180 = wire179;
endmodule
