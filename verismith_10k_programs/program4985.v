module top
#(parameter param221 = {({{(8'hba), (~|(8'ha5))}} ? ((((7'h41) ~^ (8'hbd)) ? (^~(8'hb9)) : {(8'hb5)}) <<< ({(8'ha7)} - (-(8'hac)))) : ({{(8'hae), (8'h9e)}, ((8'ha4) > (8'hbb))} ? (((8'hb4) ? (8'haa) : (8'had)) ? {(7'h43), (7'h44)} : ((8'haf) ^ (7'h41))) : (((8'hbf) < (8'ha6)) ? (~(8'ha5)) : {(8'hb6), (7'h42)}))), (!({{(8'hba), (7'h43)}} ^~ (((8'hb5) <<< (7'h42)) ? ((8'haf) > (8'ha5)) : ((8'hbf) * (8'hb6)))))}, 
parameter param222 = (~&((8'ha2) & (({param221} ? (param221 >>> param221) : param221) < (param221 ? ((8'ha3) ? param221 : param221) : param221)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire220;
  wire signed [(4'hc):(1'h0)] wire211;
  wire [(4'h9):(1'h0)] wire209;
  reg signed [(2'h3):(1'h0)] reg219 = (1'h0);
  reg [(3'h6):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg217 = (1'h0);
  reg [(4'h9):(1'h0)] reg216 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg214 = (1'h0);
  reg [(3'h5):(1'h0)] reg213 = (1'h0);
  reg [(5'h13):(1'h0)] reg212 = (1'h0);
  assign y = {wire220,
                 wire211,
                 wire209,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 (1'h0)};
  module5 #() modinst210 (wire209, clk, wire0, wire4, wire3, wire1);
  assign wire211 = (wire2 >> ((($signed(wire3) + wire3) ?
                           $signed({(8'hba)}) : (&(!wire209))) ?
                       (($signed(wire3) ? $signed((8'ha3)) : $unsigned(wire1)) ?
                           (wire1[(4'he):(3'h7)] | (wire4 - wire2)) : {wire1[(4'he):(3'h4)]}) : wire2));
  always
    @(posedge clk) begin
      if (wire2[(3'h4):(1'h0)])
        begin
          reg212 <= (~({(~|$signed(wire3)),
                  ($signed(wire209) <= (wire3 <= wire4))} ?
              (+$unsigned(((8'ha1) <= wire1))) : {(8'ha3),
                  $unsigned($unsigned(wire3))}));
          reg213 <= (((~&(8'hb9)) >= {$unsigned((wire4 ? wire0 : wire209))}) ?
              wire209 : ({(wire4[(3'h7):(2'h3)] - {reg212}),
                      wire209[(1'h1):(1'h0)]} ?
                  {wire1} : wire209[(1'h1):(1'h1)]));
          reg214 <= (+(wire209[(4'h8):(3'h7)] ?
              $signed($unsigned(wire1)) : (~&$unsigned((wire3 ^~ reg212)))));
          reg215 <= $unsigned(wire4[(1'h0):(1'h0)]);
        end
      else
        begin
          reg212 <= ({($signed((reg214 << reg212)) >> (&wire2))} ?
              reg215 : ({(&$signed(reg214)), reg212} ?
                  ((-$signed(reg212)) & (^~$unsigned(reg212))) : wire209[(3'h5):(1'h0)]));
          reg213 <= (((+reg212[(5'h10):(3'h6)]) ?
                  (($unsigned(wire4) ?
                          wire0[(3'h6):(1'h0)] : wire211[(3'h4):(1'h0)]) ?
                      ($signed((8'haa)) ?
                          $signed(reg213) : (!wire4)) : ($unsigned(wire2) ?
                          reg213[(1'h1):(1'h0)] : (wire2 == wire3))) : wire0) ?
              wire0[(3'h4):(1'h0)] : $signed((wire209[(1'h0):(1'h0)] ?
                  wire0[(2'h3):(1'h0)] : ($unsigned(wire1) ?
                      wire0[(3'h6):(3'h5)] : {wire1, reg212}))));
          reg214 <= $signed((~&wire1[(1'h1):(1'h1)]));
          reg215 <= (7'h43);
        end
      reg216 <= wire209;
      reg217 <= (((~((|reg216) ?
              (~wire0) : {reg215, (7'h43)})) | $unsigned($signed(reg212))) ?
          (&wire211) : (wire4[(3'h4):(3'h4)] == ((|wire1[(1'h1):(1'h1)]) && reg212[(4'h8):(1'h1)])));
      reg218 <= (wire1 ?
          $signed((8'ha2)) : (wire0 >>> $signed((~^((8'ha1) > wire209)))));
      reg219 <= reg215;
    end
  assign wire220 = $unsigned(wire209);
endmodule

module module5
#(parameter param208 = ({({{(8'haa)}} > ((^(7'h42)) * ((8'haa) << (8'hbc)))), (((&(7'h40)) <= ((7'h40) >>> (8'hba))) ? (~&((8'hac) ^~ (8'ha4))) : ((8'ha3) > (+(8'hba))))} - (({(~|(8'had))} | (((8'ha6) >= (7'h40)) ~^ ((8'h9d) ? (8'ha8) : (8'ha1)))) ? {(~((8'haa) ? (8'hb3) : (8'ha3))), (~^(~(8'ha7)))} : ((~^(~(8'hb9))) || {((8'h9c) ? (8'h9d) : (7'h44))}))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire207;
  wire signed [(3'h7):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(5'h14):(1'h0)] wire139;
  wire [(5'h13):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire188;
  wire signed [(4'h8):(1'h0)] wire190;
  wire signed [(3'h7):(1'h0)] wire205;
  assign y = {wire207,
                 wire99,
                 wire31,
                 wire30,
                 wire28,
                 wire12,
                 wire11,
                 wire10,
                 wire101,
                 wire139,
                 wire141,
                 wire188,
                 wire190,
                 wire205,
                 (1'h0)};
  assign wire10 = wire8[(3'h5):(3'h4)];
  assign wire11 = (wire9 ?
                      wire8 : ((wire9[(3'h6):(3'h5)] && wire8[(2'h2):(1'h0)]) <<< (((wire7 * wire7) >> $signed(wire10)) ?
                          $unsigned((wire9 - wire7)) : (wire6 ?
                              $signed(wire9) : wire8))));
  assign wire12 = (wire10[(5'h13):(5'h13)] ?
                      (~&(~^(7'h44))) : $signed($signed($signed(wire7[(2'h3):(2'h3)]))));
  module13 #() modinst29 (wire28, clk, wire8, wire12, wire11, wire7);
  assign wire30 = $unsigned(wire7);
  assign wire31 = {wire28, (~&wire6)};
  module32 #() modinst100 (.y(wire99), .wire33(wire28), .wire37(wire7), .wire36(wire8), .wire35(wire9), .wire34(wire10), .clk(clk));
  assign wire101 = {wire6[(4'h8):(3'h7)]};
  module102 #() modinst140 (.wire106(wire6), .wire104(wire8), .wire103(wire11), .wire105(wire30), .clk(clk), .y(wire139));
  assign wire141 = $signed((~|($unsigned((wire7 ? wire8 : wire31)) ?
                       wire99[(3'h4):(2'h2)] : ((wire9 ? wire9 : wire101) ?
                           wire6[(3'h4):(1'h0)] : (wire139 ?
                               wire9 : wire30)))));
  module142 #() modinst189 (.clk(clk), .wire146(wire30), .wire144(wire9), .wire145(wire101), .wire143(wire99), .y(wire188));
  assign wire190 = wire11[(3'h4):(1'h1)];
  module191 #() modinst206 (.clk(clk), .wire192(wire10), .wire195(wire28), .y(wire205), .wire194(wire101), .wire193(wire139), .wire196(wire12));
  assign wire207 = ($signed(wire31[(4'hd):(3'h6)]) ?
                       ((wire8 == wire28) ?
                           (!$signed(wire188[(2'h2):(2'h2)])) : ({$unsigned(wire30)} ?
                               (8'hb3) : $unsigned(wire31[(5'h12):(4'hf)]))) : (wire28 && $signed(({wire205,
                           wire12} - $unsigned(wire12)))));
endmodule

module module191  (y, clk, wire196, wire195, wire194, wire193, wire192);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire196;
  input wire signed [(4'hd):(1'h0)] wire195;
  input wire [(4'hc):(1'h0)] wire194;
  input wire [(5'h14):(1'h0)] wire193;
  input wire [(5'h14):(1'h0)] wire192;
  wire signed [(4'hb):(1'h0)] wire204;
  wire signed [(5'h11):(1'h0)] wire203;
  wire signed [(5'h13):(1'h0)] wire202;
  wire [(4'ha):(1'h0)] wire201;
  wire signed [(4'hc):(1'h0)] wire200;
  wire [(4'hc):(1'h0)] wire199;
  wire [(4'hf):(1'h0)] wire198;
  wire [(5'h13):(1'h0)] wire197;
  assign y = {wire204,
                 wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 (1'h0)};
  assign wire197 = $unsigned((+$unsigned(wire195[(4'hc):(1'h1)])));
  assign wire198 = ((wire193[(3'h4):(2'h3)] ?
                           $signed((wire197 ~^ (wire193 ?
                               wire196 : wire192))) : wire194[(4'h9):(4'h8)]) ?
                       wire192[(5'h14):(5'h13)] : $signed(wire192));
  assign wire199 = (~&(wire196[(4'hb):(1'h0)] < $signed($signed((~wire196)))));
  assign wire200 = wire197;
  assign wire201 = wire194[(4'ha):(3'h5)];
  assign wire202 = {$signed(wire194[(4'h9):(3'h7)])};
  assign wire203 = ((~|(wire196 ?
                       ({wire197,
                           wire193} << (wire199 << wire201)) : $signed(wire199))) >= (((wire201[(3'h7):(2'h2)] - (wire200 & wire192)) ?
                       (((8'h9f) < wire201) >= (wire197 ?
                           wire199 : wire198)) : $unsigned(wire196[(2'h3):(1'h1)])) + {$signed({wire195})}));
  assign wire204 = $unsigned($unsigned((($signed(wire194) ?
                       $signed(wire200) : (wire192 || wire195)) == (((8'hb4) != (8'hb8)) || $unsigned(wire201)))));
endmodule

module module142
#(parameter param186 = (&({(8'hb7), {(^~(8'ha5)), (|(8'hb4))}} ? {(!((7'h40) ? (8'ha3) : (8'ha2))), (((8'hb0) ? (8'hb2) : (8'hb5)) ? ((7'h42) == (8'ha4)) : ((8'h9c) ? (8'ha2) : (8'hb0)))} : (&((~|(8'hb8)) ? (!(8'hae)) : (8'had))))), 
parameter param187 = param186)
(y, clk, wire146, wire145, wire144, wire143);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire146;
  input wire [(3'h7):(1'h0)] wire145;
  input wire [(3'h5):(1'h0)] wire144;
  input wire signed [(2'h3):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire177;
  wire signed [(5'h15):(1'h0)] wire161;
  wire [(4'ha):(1'h0)] wire160;
  wire signed [(3'h6):(1'h0)] wire159;
  wire [(3'h7):(1'h0)] wire158;
  wire signed [(4'hd):(1'h0)] wire157;
  wire signed [(3'h6):(1'h0)] wire152;
  wire [(5'h10):(1'h0)] wire151;
  wire [(5'h10):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire149;
  wire [(3'h7):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire147;
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg [(5'h13):(1'h0)] reg184 = (1'h0);
  reg [(3'h6):(1'h0)] reg183 = (1'h0);
  reg [(3'h4):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(4'ha):(1'h0)] reg180 = (1'h0);
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg [(2'h3):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg170 = (1'h0);
  reg [(2'h2):(1'h0)] reg169 = (1'h0);
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg165 = (1'h0);
  reg [(3'h7):(1'h0)] reg164 = (1'h0);
  reg [(4'hd):(1'h0)] reg163 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg154 = (1'h0);
  reg [(3'h4):(1'h0)] reg153 = (1'h0);
  assign y = {wire177,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg176,
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
                 reg162,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 (1'h0)};
  assign wire147 = (!((($signed((8'h9c)) >= (wire146 > wire144)) - wire145) ?
                       wire143[(1'h1):(1'h1)] : $unsigned(($unsigned(wire144) ?
                           wire146[(4'hc):(1'h0)] : $unsigned(wire144)))));
  assign wire148 = (wire147[(4'ha):(4'h9)] ? (8'hbc) : wire147[(1'h1):(1'h0)]);
  assign wire149 = wire146;
  assign wire150 = (wire149[(2'h2):(1'h0)] >> ((~$signed((wire143 ?
                       (8'h9e) : wire144))) << (~(((8'ha2) ?
                           wire148 : wire144) ?
                       (wire149 ?
                           wire145 : wire147) : wire146[(3'h7):(2'h2)]))));
  assign wire151 = {((+(+(wire144 * wire149))) ?
                           ($signed(wire145[(1'h0):(1'h0)]) ?
                               {$signed(wire149)} : wire147[(3'h5):(3'h5)]) : (((~^wire146) || $unsigned(wire146)) ?
                               $signed((~wire144)) : ($signed(wire143) ?
                                   {wire145} : $signed((7'h41))))),
                       $unsigned(((wire145[(2'h2):(2'h2)] ?
                           wire144[(1'h0):(1'h0)] : (7'h40)) <= wire149))};
  assign wire152 = wire148[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg153 <= ((wire144[(1'h0):(1'h0)] ^~ $unsigned(wire152)) ?
          wire143[(2'h3):(1'h1)] : (wire152 < $unsigned($unsigned(wire150))));
      reg154 <= $unsigned(({wire146, wire150} ?
          wire148[(3'h6):(3'h5)] : $signed((wire150[(5'h10):(3'h4)] > wire143))));
      reg155 <= reg154;
      reg156 <= $signed((~^$signed((wire147[(4'h9):(3'h4)] ?
          $unsigned(reg153) : (&(8'h9c))))));
    end
  assign wire157 = $signed($signed((wire151[(4'h9):(1'h1)] >= $signed($unsigned(wire146)))));
  assign wire158 = {wire143};
  assign wire159 = wire143;
  assign wire160 = (wire144 ?
                       wire146 : $unsigned({$unsigned(wire147[(1'h1):(1'h0)]),
                           {(wire147 ? wire147 : reg154), $unsigned(reg155)}}));
  assign wire161 = (~^reg156);
  always
    @(posedge clk) begin
      if (wire150[(3'h6):(1'h1)])
        begin
          reg162 <= (&(~(reg156[(3'h4):(2'h2)] ?
              ($unsigned(wire150) ^~ (^~wire145)) : (wire149 > (wire146 != (8'had))))));
          reg163 <= $unsigned((&(wire151 ^~ wire143[(1'h1):(1'h0)])));
          reg164 <= wire161;
        end
      else
        begin
          reg162 <= reg155;
          if ({reg153[(1'h1):(1'h1)], $unsigned({wire151[(4'h9):(4'h9)]})})
            begin
              reg163 <= $unsigned($signed(reg162));
              reg164 <= (~&{($signed(wire148) ?
                      $signed((wire160 ? reg163 : wire151)) : (-wire151)),
                  $signed(($unsigned(wire150) ?
                      wire145[(3'h5):(3'h5)] : (+wire152)))});
            end
          else
            begin
              reg163 <= (8'ha9);
              reg164 <= (wire160[(1'h0):(1'h0)] ?
                  {{wire147[(2'h3):(2'h3)],
                          {(~^reg154), (wire143 ? wire148 : reg164)}},
                      (~^(+wire149[(2'h2):(1'h1)]))} : ($signed(wire146) ^ $unsigned(wire143[(2'h3):(1'h1)])));
              reg165 <= {($signed((!wire143)) ~^ wire147)};
              reg166 <= {$signed(($signed(((7'h42) ~^ wire144)) > reg154[(2'h2):(1'h1)])),
                  (reg154 ? wire160[(3'h4):(1'h0)] : reg155)};
            end
          if ($signed((reg155[(3'h5):(3'h4)] ? wire144 : $unsigned((8'haa)))))
            begin
              reg167 <= ($unsigned($signed((7'h40))) ?
                  (({$signed(reg156), reg156[(1'h1):(1'h0)]} ^ (~wire149)) ?
                      ((wire147 ?
                          reg154 : (reg165 | (8'had))) & {$signed(reg156),
                          (7'h42)}) : ((-{(8'haf)}) ?
                          wire144 : wire159[(3'h5):(3'h5)])) : wire160);
            end
          else
            begin
              reg167 <= {reg154[(3'h4):(3'h4)],
                  $signed($unsigned($unsigned((wire160 ? reg155 : reg154))))};
              reg168 <= {reg155[(4'h8):(4'h8)]};
            end
          reg169 <= $unsigned((8'h9c));
        end
      reg170 <= reg155[(1'h0):(1'h0)];
      reg171 <= reg167[(4'hc):(4'h8)];
      if ((~|((~&(reg165 ?
          wire161[(4'hc):(4'h8)] : (|reg167))) - wire151[(4'hd):(4'h9)])))
        begin
          reg172 <= reg156[(3'h4):(2'h2)];
          reg173 <= reg165[(4'hb):(2'h3)];
          reg174 <= {($unsigned(reg165[(5'h13):(4'hb)]) ?
                  reg168 : reg169[(1'h0):(1'h0)]),
              {(wire147 ?
                      reg168[(4'hc):(3'h6)] : (reg166[(1'h0):(1'h0)] ?
                          $unsigned((8'ha4)) : reg156[(2'h2):(1'h1)]))}};
          reg175 <= wire158;
          reg176 <= (~|$signed(wire157[(3'h5):(2'h3)]));
        end
      else
        begin
          if (wire150[(1'h1):(1'h1)])
            begin
              reg172 <= (reg166 ~^ $signed($unsigned($signed(wire159[(1'h0):(1'h0)]))));
              reg173 <= $unsigned((~|(wire148 ?
                  $signed($unsigned(reg176)) : ($signed(wire160) ^ reg154))));
            end
          else
            begin
              reg172 <= $unsigned(reg164);
              reg173 <= reg175;
              reg174 <= wire157;
            end
        end
    end
  assign wire177 = (reg162 << $unsigned(reg171));
  always
    @(posedge clk) begin
      reg178 <= (-({(+(wire177 + (8'had)))} ?
          reg166 : ($unsigned((reg176 ? reg170 : reg154)) == {$unsigned(reg169),
              $unsigned(wire149)})));
      reg179 <= (($unsigned($unsigned((wire152 ? wire160 : wire158))) ?
              $signed((^(wire145 != reg156))) : {(reg176[(2'h3):(1'h0)] ?
                      {reg155} : $unsigned(wire159))}) ?
          reg176 : $unsigned((~({wire146} > wire148))));
      if (((~(&(8'h9f))) || ((($unsigned(wire145) ?
              reg165 : wire161) <= $unsigned((reg163 ? wire146 : reg170))) ?
          (8'hba) : (-{$signed(wire160), (wire150 ? wire150 : reg153)}))))
        begin
          reg180 <= $unsigned((reg166[(2'h2):(1'h1)] ?
              (((reg168 ? wire158 : wire147) << (&wire157)) == ((+(8'h9f)) ?
                  (reg166 >= reg165) : $signed(reg178))) : {wire151,
                  ((wire150 ? wire146 : reg172) ^~ $unsigned(wire145))}));
        end
      else
        begin
          reg180 <= reg176[(2'h3):(2'h3)];
          reg181 <= $signed(wire151[(2'h2):(1'h1)]);
          reg182 <= $signed($signed($signed(reg156)));
        end
    end
  always
    @(posedge clk) begin
      reg183 <= wire143[(1'h1):(1'h0)];
      reg184 <= {reg172[(2'h3):(1'h1)]};
      reg185 <= (reg182[(2'h3):(2'h3)] & {$signed(reg181)});
    end
endmodule

module module102
#(parameter param137 = {(((^{(8'ha7), (8'h9c)}) | (~(^(8'hbe)))) > ((((8'h9f) | (8'ha0)) + (-(8'ha9))) && (((8'ha2) ? (8'h9f) : (8'ha8)) & ((7'h40) ^~ (8'hba)))))}, 
parameter param138 = ({{(((8'hb6) * param137) ? param137 : param137), (+(param137 * param137))}} ? param137 : ((8'ha3) << ({(8'hae), ((8'hbc) ^~ param137)} ? (|(+(7'h42))) : ((param137 | param137) - (param137 ? param137 : (7'h43)))))))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire106;
  input wire [(3'h4):(1'h0)] wire105;
  input wire [(2'h2):(1'h0)] wire104;
  input wire signed [(5'h12):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire136;
  wire signed [(4'h8):(1'h0)] wire135;
  wire [(2'h2):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire118;
  wire [(5'h13):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire116;
  wire [(5'h10):(1'h0)] wire115;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(5'h14):(1'h0)] wire113;
  wire [(5'h10):(1'h0)] wire112;
  wire signed [(2'h3):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire [(4'he):(1'h0)] wire109;
  wire signed [(2'h2):(1'h0)] wire108;
  wire signed [(3'h7):(1'h0)] wire107;
  reg signed [(2'h2):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(3'h7):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
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
                 (1'h0)};
  assign wire107 = (wire104 ?
                       ($unsigned((!(wire104 ? wire103 : wire104))) ?
                           $unsigned(wire105) : wire104[(1'h0):(1'h0)]) : wire104);
  assign wire108 = $signed($signed($unsigned((+$signed((7'h43))))));
  assign wire109 = (^~(8'ha9));
  assign wire110 = (~|$signed(((wire103[(2'h3):(2'h3)] ?
                           $unsigned(wire103) : wire104[(1'h1):(1'h0)]) ?
                       (~^(+wire105)) : (~(wire105 ? wire107 : wire108)))));
  assign wire111 = ((wire107 ? $unsigned((-$unsigned(wire106))) : wire103) ?
                       (~^wire103[(4'hc):(3'h6)]) : (($signed((wire107 ?
                           wire103 : wire103)) & $signed({wire106,
                           wire109})) ^ wire108));
  assign wire112 = ($signed(wire110[(1'h0):(1'h0)]) ?
                       (^(((!wire108) ?
                           (wire110 ?
                               (8'ha3) : wire105) : $unsigned(wire107)) == wire108[(1'h1):(1'h1)])) : wire104[(1'h0):(1'h0)]);
  assign wire113 = wire105;
  assign wire114 = (~&wire103[(3'h6):(1'h1)]);
  assign wire115 = wire108[(1'h1):(1'h0)];
  assign wire116 = wire106;
  assign wire117 = (-(~&wire108[(1'h1):(1'h0)]));
  assign wire118 = ($unsigned((^wire107)) | wire116[(5'h10):(3'h7)]);
  assign wire119 = $unsigned(wire111[(1'h1):(1'h0)]);
  assign wire120 = {wire108[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      reg121 <= (&(-$unsigned($signed((~&wire120)))));
      if ($unsigned($signed(({(reg121 ?
              wire118 : wire108)} < {wire110[(1'h0):(1'h0)]}))))
        begin
          if ($unsigned(wire118))
            begin
              reg122 <= wire106[(2'h2):(1'h0)];
              reg123 <= (wire104 >> $signed((8'haa)));
              reg124 <= $signed((wire116[(3'h5):(3'h4)] ?
                  $unsigned((-$signed(wire103))) : {wire120[(2'h2):(2'h2)]}));
              reg125 <= wire113;
            end
          else
            begin
              reg122 <= {(-($signed($unsigned(reg122)) ?
                      {wire109, {wire113}} : wire111))};
              reg123 <= ((reg121 - $signed(({wire107} >> (wire108 ?
                      (8'haf) : wire106)))) ?
                  (reg121 ?
                      wire115[(2'h2):(2'h2)] : (^((~|wire117) >>> $unsigned(wire115)))) : wire112);
              reg124 <= ($unsigned((8'hb1)) ?
                  ((wire104[(1'h1):(1'h1)] ?
                      $signed((wire105 ?
                          wire114 : wire103)) : wire108) >= $signed({(wire103 ?
                          wire119 : wire113)})) : (wire116 ?
                      wire106[(2'h3):(1'h1)] : $signed(wire118)));
              reg125 <= ((+$unsigned((-((8'hab) < wire105)))) ?
                  ((wire103[(3'h6):(1'h0)] - wire117) > (wire104[(2'h2):(1'h0)] ^ $signed((~reg123)))) : wire112[(1'h0):(1'h0)]);
              reg126 <= $unsigned((^$signed($signed((wire119 > reg121)))));
            end
          reg127 <= {wire112[(3'h4):(2'h3)]};
          reg128 <= (~^(~(wire109 ? (^(8'hb5)) : wire105)));
          reg129 <= $signed(($unsigned(wire116) >>> wire120));
        end
      else
        begin
          if (wire119)
            begin
              reg122 <= wire119[(2'h2):(1'h1)];
              reg123 <= {$unsigned(reg126), reg124};
            end
          else
            begin
              reg122 <= (^~(($unsigned(wire113) ?
                      wire103[(1'h1):(1'h1)] : (!$unsigned(reg122))) ?
                  (wire114 | {(8'ha6)}) : $signed($unsigned($signed(reg125)))));
              reg123 <= (((8'ha6) != $unsigned(((~|wire108) & $unsigned(wire116)))) ?
                  $unsigned({$signed(reg125)}) : (wire116[(2'h3):(2'h2)] ^ $signed($unsigned((reg124 ?
                      reg128 : reg127)))));
              reg124 <= $signed(reg129);
            end
          if (($signed((((wire104 ? (8'hac) : wire103) < {wire114, wire112}) ?
              $unsigned((~|wire113)) : $unsigned(wire116[(4'hc):(2'h3)]))) <<< $unsigned($unsigned((wire107[(2'h2):(1'h0)] ?
              reg127 : $signed(wire113))))))
            begin
              reg125 <= (wire119[(4'ha):(3'h6)] ?
                  (reg122[(1'h1):(1'h1)] ?
                      (~&(8'ha6)) : ((~(reg122 | wire106)) > wire112)) : (^~$unsigned((reg128[(1'h0):(1'h0)] << reg125))));
              reg126 <= (wire112 ? reg122[(3'h6):(1'h1)] : (|reg124));
              reg127 <= (($unsigned($signed((wire116 >= reg125))) ~^ (~&(8'hb4))) > (~(8'had)));
            end
          else
            begin
              reg125 <= $unsigned($unsigned($signed(((+wire110) ?
                  reg126[(1'h1):(1'h1)] : wire104[(1'h1):(1'h0)]))));
              reg126 <= wire119;
            end
          reg128 <= (~&(^{$signed((reg128 ~^ wire111)), wire117}));
          if ($unsigned(wire103[(5'h12):(5'h12)]))
            begin
              reg129 <= $signed((~&(wire104[(1'h1):(1'h0)] ?
                  $unsigned($signed(wire106)) : wire112[(4'hc):(3'h6)])));
              reg130 <= $unsigned($signed($unsigned($signed((~^(8'ha0))))));
              reg131 <= wire119;
              reg132 <= {(~&(wire106[(3'h5):(2'h2)] || ((~&wire112) >>> wire111[(2'h2):(1'h1)])))};
              reg133 <= $signed($unsigned(($signed(wire111) > $unsigned((reg127 ?
                  wire115 : wire120)))));
            end
          else
            begin
              reg129 <= ((($unsigned($unsigned(wire107)) + {(!reg131)}) >> $signed(wire112)) <<< $unsigned((&$unsigned($unsigned(wire119)))));
              reg130 <= (~^$unsigned((wire114[(3'h5):(3'h4)] ?
                  ((-wire111) ?
                      $signed(wire114) : reg132) : reg127[(2'h2):(1'h1)])));
              reg131 <= ($unsigned(wire104[(1'h1):(1'h0)]) & $unsigned($unsigned(((wire108 ^~ wire116) ~^ reg132[(2'h2):(2'h2)]))));
            end
        end
      reg134 <= wire116[(1'h0):(1'h0)];
    end
  assign wire135 = {(|wire105[(1'h1):(1'h1)])};
  assign wire136 = {reg127[(4'hf):(2'h2)], (~wire106)};
endmodule

module module32
#(parameter param98 = (~^((~(-((8'h9f) ^~ (8'hba)))) ? ({((8'hab) ? (8'ha3) : (8'ha7)), (~(8'hbe))} ^ ((-(8'ha3)) | (8'hb9))) : ((((8'hab) ~^ (8'hb1)) ? (8'ha3) : {(8'ha5), (8'ha2)}) < (!(8'hb0))))))
(y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h28e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire37;
  input wire [(5'h12):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  input wire signed [(4'hc):(1'h0)] wire34;
  input wire [(5'h11):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire97;
  wire signed [(3'h7):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(3'h5):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(4'hc):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg70 = (1'h0);
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire94,
                 wire75,
                 wire63,
                 wire62,
                 wire61,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg95,
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
                 reg77,
                 reg76,
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
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire38 = $unsigned((wire33 == wire36));
  assign wire39 = wire35[(1'h1):(1'h1)];
  assign wire40 = (+(7'h43));
  assign wire41 = {wire36[(5'h10):(2'h2)]};
  assign wire42 = (+(({$signed(wire39)} >= ({wire40, wire41} ?
                      (wire37 ~^ wire35) : (7'h40))) * wire40));
  assign wire43 = wire33;
  always
    @(posedge clk) begin
      reg44 <= $signed(wire35);
      reg45 <= wire37;
      reg46 <= $unsigned($signed((reg44 ?
          $unsigned(wire37[(3'h5):(3'h5)]) : wire37[(3'h5):(2'h3)])));
    end
  assign wire47 = wire40[(3'h4):(2'h2)];
  assign wire48 = (~({(wire33[(5'h11):(5'h11)] ^ (wire36 | wire40))} ?
                      $signed((~$unsigned(wire40))) : $signed((wire35[(2'h3):(1'h0)] * wire34[(4'ha):(4'ha)]))));
  assign wire49 = $signed(((~^wire38) + ({$unsigned((8'ha6))} << ({wire48} | $signed(wire36)))));
  assign wire50 = (wire40[(3'h5):(1'h0)] || $unsigned($unsigned({(~^reg46),
                      (wire49 ? wire43 : wire43)})));
  always
    @(posedge clk) begin
      reg51 <= (~|wire36);
      reg52 <= (wire43[(4'ha):(3'h7)] ?
          wire39[(2'h2):(2'h2)] : (~^(-(wire48[(3'h4):(1'h1)] - (wire35 ?
              wire37 : reg44)))));
      if (wire35[(3'h4):(1'h0)])
        begin
          if (wire34)
            begin
              reg53 <= wire41;
              reg54 <= {wire49,
                  (($signed($signed(wire49)) ?
                      {wire47[(1'h0):(1'h0)]} : (wire37 - {reg44,
                          wire37})) == (~|$signed((-wire36))))};
              reg55 <= reg53;
              reg56 <= wire33;
            end
          else
            begin
              reg53 <= wire35;
              reg54 <= $unsigned($signed((({wire36,
                  reg52} <= $unsigned(reg44)) * $unsigned((reg54 & wire39)))));
              reg55 <= reg52[(4'h8):(3'h7)];
              reg56 <= wire43[(3'h5):(1'h0)];
            end
          reg57 <= (^{$unsigned((!$unsigned(wire39))),
              {((reg53 > reg52) <<< {(8'had), (8'haa)})}});
          reg58 <= wire39[(2'h2):(1'h1)];
          reg59 <= wire35[(1'h1):(1'h0)];
        end
      else
        begin
          reg53 <= $unsigned($unsigned(({(|wire50)} ?
              reg56[(4'h9):(3'h4)] : ((~&wire49) << (^~(8'hab))))));
          if (($unsigned({((wire34 ? reg55 : reg44) ?
                      {wire33} : (reg51 > (8'ha6)))}) ?
              (8'hbe) : $unsigned((wire34 > wire43[(3'h4):(1'h0)]))))
            begin
              reg54 <= wire36;
              reg55 <= (((|(!$signed((8'hba)))) > $unsigned(((reg54 ^ reg57) == $unsigned(wire33)))) * reg56);
              reg56 <= $unsigned((reg55 && wire47[(3'h6):(2'h2)]));
              reg57 <= ($unsigned((^($unsigned(wire33) & (8'hbf)))) | $unsigned(($signed((wire33 << wire48)) + wire41[(2'h3):(2'h2)])));
            end
          else
            begin
              reg54 <= reg57;
              reg55 <= ((reg58[(1'h1):(1'h0)] & (~|reg57)) < (|(($signed(reg52) >= $unsigned((7'h40))) ?
                  ($signed(wire39) <<< {reg55}) : $signed(wire39))));
              reg56 <= (~^(|{$signed(wire33[(5'h10):(4'ha)])}));
            end
          reg58 <= reg56[(4'ha):(3'h4)];
        end
      reg60 <= {wire49[(1'h0):(1'h0)], $signed(reg44[(3'h4):(2'h3)])};
    end
  assign wire61 = ($unsigned(reg44) ?
                      (^(wire50[(3'h5):(3'h4)] != {$signed(wire35),
                          (~reg53)})) : $unsigned($signed(wire36[(2'h3):(1'h1)])));
  assign wire62 = $signed($unsigned(reg58[(3'h4):(2'h2)]));
  assign wire63 = (wire38[(3'h4):(3'h4)] <<< (reg51[(3'h5):(2'h2)] ?
                      $signed({$unsigned(reg46),
                          $unsigned(wire40)}) : (~^(wire35[(2'h3):(1'h0)] * reg52))));
  always
    @(posedge clk) begin
      if ($unsigned({$unsigned(((reg45 ? (8'hae) : reg59) ?
              reg51[(4'h8):(3'h4)] : {wire39, reg52})),
          wire39[(3'h4):(1'h1)]}))
        begin
          reg64 <= $signed({(+reg44)});
          reg65 <= reg46;
          reg66 <= reg64;
          if (((^~{wire62[(5'h10):(3'h5)],
              reg55[(1'h1):(1'h0)]}) && {{((wire34 ? wire62 : (8'ha4)) ?
                      (reg66 ? (8'ha1) : wire38) : wire37)},
              (^~(reg64 ^~ $unsigned(wire61)))}))
            begin
              reg67 <= (wire43[(4'hd):(4'h9)] > $unsigned((wire61[(4'hc):(3'h5)] ?
                  reg57[(2'h2):(1'h1)] : {(8'hbc)})));
              reg68 <= (~|(^(~$signed($unsigned(wire63)))));
              reg69 <= {$unsigned(wire49), (reg53 && wire34)};
              reg70 <= ((&{$unsigned($unsigned((8'h9d))),
                  $signed($unsigned(reg51))}) | (~$unsigned(wire35)));
            end
          else
            begin
              reg67 <= wire50;
              reg68 <= ($unsigned({$signed(reg60), (~|$signed(wire61))}) ?
                  $signed($unsigned(wire61[(4'hd):(4'hb)])) : (!$unsigned((+{reg56}))));
            end
          if ($signed($signed((~({(8'hb7), reg52} ?
              {wire36} : $signed(wire35))))))
            begin
              reg71 <= reg68[(4'h9):(3'h5)];
              reg72 <= (reg51 ?
                  wire40[(3'h7):(1'h1)] : (reg58 | ((^((8'h9f) ?
                      (8'ha5) : wire37)) < wire41)));
              reg73 <= ((8'ha8) << reg72);
              reg74 <= reg58[(1'h1):(1'h0)];
            end
          else
            begin
              reg71 <= $unsigned($signed({wire33}));
              reg72 <= ($unsigned(((|{wire38}) - $unsigned(reg57))) & $unsigned(((reg52 ?
                      $unsigned(reg58) : $signed(reg73)) ?
                  (|wire41[(3'h4):(2'h2)]) : $unsigned($unsigned(wire42)))));
              reg73 <= $unsigned((&wire35));
              reg74 <= {wire63};
            end
        end
      else
        begin
          reg64 <= (^wire38[(1'h1):(1'h0)]);
          reg65 <= (wire63 ?
              wire63 : $signed($signed(((wire34 ? reg69 : wire48) ?
                  {wire41} : (+reg55)))));
          reg66 <= reg74;
          reg67 <= {$unsigned($unsigned((reg58 + {wire62, reg68})))};
        end
    end
  assign wire75 = {wire35[(2'h2):(1'h0)], wire42};
  always
    @(posedge clk) begin
      if (wire47[(1'h1):(1'h0)])
        begin
          reg76 <= (~^$unsigned((wire36 <<< ((reg64 * wire63) << reg44))));
          reg77 <= ((reg46[(4'hb):(3'h6)] ?
                  ((^~{reg58}) ? wire40 : {(~&wire41)}) : reg74) ?
              $signed($unsigned(wire35[(2'h2):(1'h0)])) : $unsigned((reg70[(2'h3):(2'h2)] ?
                  (8'hbb) : $unsigned({wire39}))));
          reg78 <= (((~((|wire75) ?
              $signed((8'hab)) : {wire34,
                  (8'hb9)})) | ($unsigned(reg57[(1'h1):(1'h0)]) ?
              $unsigned(reg71) : wire50[(2'h2):(1'h0)])) * $signed($unsigned($unsigned($signed(wire43)))));
        end
      else
        begin
          reg76 <= (+$unsigned((((reg66 ? reg56 : (8'hbc)) << (8'hbd)) ?
              reg71[(1'h1):(1'h1)] : ((~&reg54) ?
                  (wire39 ? wire43 : (8'hb3)) : $unsigned(reg45)))));
          reg77 <= (7'h43);
        end
      reg79 <= ((^(~|((reg78 ~^ (8'hbc)) ^~ $unsigned((8'haa))))) ?
          reg71[(1'h1):(1'h0)] : $signed($signed($signed(wire34[(4'h8):(2'h3)]))));
      reg80 <= ((~^$signed(((reg78 * reg54) ? (8'ha5) : reg73))) ?
          wire50 : ($unsigned(((!wire35) && $signed((8'ha6)))) * (+((wire42 ?
              reg51 : wire48) >> reg58))));
      if ($signed($unsigned(wire35[(2'h3):(1'h1)])))
        begin
          reg81 <= (~reg66);
          if ((reg71[(1'h1):(1'h0)] == $unsigned(wire35)))
            begin
              reg82 <= $signed(wire49[(3'h5):(3'h5)]);
              reg83 <= $signed($signed(wire42));
              reg84 <= reg82[(5'h11):(3'h4)];
            end
          else
            begin
              reg82 <= $signed($signed((((^reg81) + (reg73 ? wire75 : reg76)) ?
                  wire63[(2'h2):(1'h0)] : reg56)));
              reg83 <= {{(reg77[(4'h8):(3'h4)] ? (8'ha3) : {$signed(reg82)}),
                      (((reg77 || wire43) ?
                          $unsigned(reg55) : (+reg57)) || $signed((!reg82)))},
                  $signed((~&$unsigned((&(8'hb1)))))};
              reg84 <= (~reg79[(2'h2):(2'h2)]);
              reg85 <= reg51;
              reg86 <= $signed({(reg77[(1'h0):(1'h0)] >> {$unsigned(wire39)}),
                  $unsigned(((wire48 >>> wire33) < (~reg58)))});
            end
          reg87 <= $signed((wire47 ?
              (($signed(wire61) < {reg58,
                  (8'ha6)}) < $unsigned(reg85[(1'h1):(1'h0)])) : reg72));
        end
      else
        begin
          reg81 <= reg52;
          if ($signed(wire37))
            begin
              reg82 <= ({($unsigned((reg80 ? reg60 : reg87)) ?
                      (^~(reg64 ? wire75 : wire62)) : ($unsigned(reg52) ?
                          (wire34 <<< (8'hb0)) : (reg59 ?
                              reg74 : reg82)))} == $unsigned(wire61));
              reg83 <= ({(($unsigned(wire48) ?
                          $unsigned(reg53) : reg79) ~^ reg77[(4'h8):(1'h1)]),
                      ($unsigned(wire38[(4'hc):(4'hc)]) ?
                          $unsigned({(7'h44)}) : $unsigned((+wire38)))} ?
                  wire36[(4'he):(4'h9)] : reg60);
            end
          else
            begin
              reg82 <= {wire47, wire36[(5'h10):(3'h4)]};
              reg83 <= (-(&$signed($signed(wire75[(2'h2):(2'h2)]))));
              reg84 <= $unsigned($signed(((~|$unsigned(reg71)) ?
                  reg74[(2'h2):(1'h0)] : (8'ha6))));
            end
          reg85 <= reg68[(4'h9):(2'h3)];
        end
      if ($unsigned(wire35))
        begin
          if ({(8'h9e),
              (reg44 ?
                  $unsigned({$signed(reg64)}) : ((reg74[(1'h0):(1'h0)] < (~^reg56)) << $signed((reg46 ?
                      reg55 : reg65))))})
            begin
              reg88 <= ($unsigned((~&reg84[(2'h2):(1'h0)])) >> (^{reg59}));
              reg89 <= reg70[(5'h12):(2'h2)];
              reg90 <= $unsigned(reg57);
            end
          else
            begin
              reg88 <= (reg79 ?
                  (^~reg56) : ({((~^wire47) ?
                          $unsigned(wire61) : {wire42})} == (^$signed($unsigned(wire38)))));
              reg89 <= (!{wire41[(1'h0):(1'h0)]});
              reg90 <= $unsigned(reg66[(4'hf):(4'hf)]);
              reg91 <= ((-((~wire35[(1'h0):(1'h0)]) ?
                      (((8'haa) ?
                          wire35 : (8'h9e)) & $signed(reg85)) : $unsigned((reg78 ?
                          reg80 : reg76)))) ?
                  (|reg53[(3'h5):(2'h2)]) : $unsigned((($signed(wire42) > (~^reg66)) ?
                      $signed((&reg60)) : $unsigned((~reg85)))));
              reg92 <= $unsigned((((~|wire49[(2'h3):(2'h3)]) ^ (~(wire35 ?
                  wire33 : reg57))) ^ $unsigned((8'hbc))));
            end
          if (((((~(wire38 ?
                  wire49 : wire38)) || $signed(wire43[(2'h2):(1'h1)])) ?
              reg64 : {reg80[(2'h2):(2'h2)]}) | (~(&(wire34[(3'h5):(2'h3)] << $unsigned(reg77))))))
            begin
              reg93 <= ((reg58[(1'h1):(1'h0)] ?
                  ((-$signed(reg88)) <<< (reg86 ?
                      (reg78 >> wire43) : (reg52 << (8'had)))) : (~^$unsigned((~&(8'hbe))))) & $signed($unsigned(((+reg77) > (reg76 <<< (8'hb4))))));
            end
          else
            begin
              reg93 <= reg56;
            end
        end
      else
        begin
          reg88 <= $unsigned($signed((((reg65 ? reg70 : reg51) ?
                  (~reg59) : (reg90 ? wire35 : reg67)) ?
              wire38[(1'h1):(1'h0)] : (reg56[(1'h0):(1'h0)] ^ (~^reg57)))));
          reg89 <= $unsigned(($unsigned(reg67) ~^ (|$signed(reg52[(4'h8):(1'h0)]))));
        end
    end
  assign wire94 = wire43[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg95 <= $signed(((~^(wire42[(3'h7):(1'h0)] ?
          wire75[(2'h2):(1'h0)] : (8'ha9))) + $signed(reg52[(3'h6):(2'h3)])));
    end
  assign wire96 = $signed(($unsigned($signed((8'haa))) ?
                      reg78 : {(wire49[(4'ha):(4'h9)] ?
                              $unsigned(reg80) : (-(8'hb3)))}));
  assign wire97 = wire41;
endmodule

module module13
#(parameter param26 = (8'h9d), 
parameter param27 = param26)
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  input wire signed [(4'hc):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 (1'h0)};
  assign wire18 = (wire15[(1'h0):(1'h0)] ?
                      ((((wire15 ? wire16 : wire16) ?
                              $signed(wire15) : wire14[(3'h6):(2'h2)]) ?
                          wire17 : wire16) >= $signed(({(8'hb0)} >> $unsigned(wire14)))) : wire17);
  assign wire19 = $signed((8'hbb));
  assign wire20 = $signed(wire16);
  assign wire21 = (8'hb3);
  assign wire22 = (-{wire21, $signed((wire14 > $unsigned(wire21)))});
  assign wire23 = (((&(~|{wire19})) ?
                      {$unsigned({wire21, wire22})} : $signed($unsigned({wire19,
                          (8'ha3)}))) >= $unsigned(wire17[(3'h4):(1'h0)]));
  assign wire24 = wire15;
  assign wire25 = wire16[(4'he):(4'hd)];
endmodule
