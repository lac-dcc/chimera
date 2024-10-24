module top
#(parameter param230 = (((((~^(8'hb4)) * ((8'ha7) + (8'ha6))) || ((&(8'ha3)) ? ((8'hbb) ? (8'hb9) : (8'ha4)) : ((8'haf) ? (8'hac) : (8'hbf)))) <<< (^~(((8'hb0) + (8'hbb)) || (~&(8'ha4))))) ? (8'had) : ((^(((8'haa) - (8'hac)) ? (^(8'ha1)) : (-(8'ha8)))) ? (~^(8'h9c)) : ((((8'ha1) >>> (8'hbf)) ? ((8'ha9) * (8'hac)) : {(8'hb2), (8'hb8)}) != (((8'had) < (8'hac)) ? {(7'h43), (8'hb1)} : (-(8'h9c)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire228;
  wire [(4'h9):(1'h0)] wire227;
  wire [(3'h4):(1'h0)] wire226;
  wire signed [(4'hd):(1'h0)] wire224;
  wire [(3'h7):(1'h0)] wire194;
  wire [(5'h13):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg223 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg222 = (1'h0);
  reg [(4'hb):(1'h0)] reg221 = (1'h0);
  reg [(3'h7):(1'h0)] reg220 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg216 = (1'h0);
  reg [(4'hb):(1'h0)] reg215 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg214 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg213 = (1'h0);
  reg [(5'h15):(1'h0)] reg212 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg211 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg210 = (1'h0);
  reg [(3'h4):(1'h0)] reg209 = (1'h0);
  reg [(5'h14):(1'h0)] reg208 = (1'h0);
  reg [(4'ha):(1'h0)] reg207 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg206 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg204 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg203 = (1'h0);
  reg [(2'h2):(1'h0)] reg202 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg201 = (1'h0);
  reg [(4'hc):(1'h0)] reg200 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg199 = (1'h0);
  reg [(5'h11):(1'h0)] reg198 = (1'h0);
  reg [(4'hf):(1'h0)] reg197 = (1'h0);
  reg [(2'h3):(1'h0)] reg196 = (1'h0);
  assign y = {wire228,
                 wire227,
                 wire226,
                 wire224,
                 wire194,
                 wire80,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg225,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 (1'h0)};
  assign wire4 = {$unsigned($signed($signed(wire1))), wire3[(3'h5):(3'h4)]};
  assign wire5 = ((({wire2, (~^wire3)} - (wire3[(3'h6):(1'h1)] ^ wire0)) ?
                         $signed(wire2[(3'h7):(3'h5)]) : (wire4[(1'h0):(1'h0)] ?
                             wire2 : (|(^~wire1)))) ?
                     $unsigned((^~$signed((wire0 ?
                         wire4 : wire2)))) : (^~{(wire4[(1'h0):(1'h0)] ?
                             (^wire0) : wire2[(3'h4):(2'h3)]),
                         ($signed(wire0) < wire4)}));
  assign wire6 = {(8'haf)};
  assign wire7 = wire5[(2'h2):(1'h1)];
  assign wire8 = $signed($signed((wire0[(3'h5):(1'h0)] != $unsigned($unsigned(wire0)))));
  module9 #() modinst81 (.clk(clk), .wire12(wire6), .wire11(wire4), .wire13(wire3), .wire10(wire8), .y(wire80));
  module82 #() modinst195 (.wire86(wire4), .wire84(wire1), .wire85(wire6), .clk(clk), .wire83(wire80), .y(wire194));
  always
    @(posedge clk) begin
      reg196 <= wire0;
      if (wire7[(3'h7):(2'h3)])
        begin
          reg197 <= wire0[(3'h7):(1'h1)];
          reg198 <= (^~{(reg197[(3'h5):(2'h2)] + wire1), wire4});
          reg199 <= $signed({(|$signed($signed(wire194))),
              ($signed((8'hbb)) * $signed(reg196))});
          reg200 <= (~&(^$unsigned((~&{(7'h42), reg198}))));
        end
      else
        begin
          reg197 <= reg199[(1'h1):(1'h1)];
          if ({wire2[(3'h6):(2'h2)], $unsigned(reg199)})
            begin
              reg198 <= $unsigned({wire4, $signed(wire5)});
              reg199 <= (^(^($unsigned($signed(wire6)) != (~|(&wire6)))));
              reg200 <= $signed((8'had));
              reg201 <= $signed({$signed(wire3[(3'h5):(2'h3)])});
              reg202 <= wire2;
            end
          else
            begin
              reg198 <= wire3;
            end
          reg203 <= (|wire80);
        end
      reg204 <= ({{$signed((reg196 >= wire6)), (~$signed(wire6))}} ?
          (^$unsigned(wire5)) : wire80);
    end
  always
    @(posedge clk) begin
      reg205 <= $signed($unsigned({($signed(reg196) ? reg204 : reg197),
          (~|reg204[(4'hc):(2'h2)])}));
      if (reg199)
        begin
          if (wire3)
            begin
              reg206 <= {$signed(reg200[(3'h5):(2'h2)])};
            end
          else
            begin
              reg206 <= (((($signed(reg200) ?
                      ((8'haf) ? (8'h9f) : wire8) : wire80) == (8'hb4)) ?
                  $unsigned({(8'ha8)}) : wire7[(2'h2):(2'h2)]) >= {(7'h41)});
              reg207 <= (wire194 ?
                  wire4 : $unsigned((!((wire194 != wire194) ?
                      (+reg202) : reg199))));
            end
          reg208 <= (~^$signed(($signed($unsigned(reg199)) ?
              reg197[(1'h1):(1'h0)] : ((8'hbe) ?
                  wire6[(2'h2):(1'h0)] : (reg197 == wire4)))));
          if ((((wire0[(3'h7):(1'h1)] && (reg207[(4'h9):(3'h5)] >> {(8'hb8)})) ?
                  reg203 : (((reg200 ? reg203 : (8'ha5)) << $signed(reg204)) ?
                      (wire8 & wire194) : (reg208[(4'hd):(1'h0)] ?
                          wire4 : $signed(reg199)))) ?
              reg204 : (&($unsigned((reg197 ? reg204 : reg198)) ?
                  ((+wire2) ? {reg199, reg204} : reg203) : reg204))))
            begin
              reg209 <= (8'hb2);
              reg210 <= ((+$unsigned({wire2})) >> $signed($signed((-wire5))));
              reg211 <= ((reg198 & ($unsigned(wire194) ?
                      (+wire2) : {{reg197, wire5}})) ?
                  $unsigned($unsigned($signed(reg203[(2'h2):(1'h0)]))) : $signed($signed(((8'hab) ?
                      (reg209 ? wire8 : wire2) : (~reg210)))));
              reg212 <= (|((reg206 ?
                  ((~^reg198) ?
                      (wire7 ^ reg204) : $unsigned(reg205)) : wire7) < $signed({$signed((8'hb6)),
                  wire5[(4'h9):(3'h7)]})));
            end
          else
            begin
              reg209 <= $signed(($unsigned(((^reg209) >> $unsigned(reg202))) << $unsigned((wire6 ~^ (wire3 ?
                  reg205 : reg197)))));
            end
          reg213 <= $unsigned((((~^reg209[(2'h3):(1'h0)]) ?
              (|(~^reg209)) : $signed(reg202[(2'h2):(2'h2)])) || wire194));
        end
      else
        begin
          reg206 <= (+$unsigned($signed($unsigned($unsigned(wire0)))));
          reg207 <= (($signed(({reg196} != reg202[(1'h1):(1'h0)])) ~^ reg209) > wire3);
          if ((((~&(wire0 ?
              wire0[(4'h8):(3'h5)] : {reg213, reg203})) ^~ reg201) || {reg200}))
            begin
              reg208 <= wire4[(1'h1):(1'h1)];
              reg209 <= $unsigned((($unsigned(reg198[(1'h1):(1'h1)]) >> (reg208[(4'he):(3'h6)] ?
                  $signed((8'haa)) : $signed((8'hbd)))) && ((^wire8) >= ((~^(8'ha3)) ?
                  wire80 : $unsigned(reg204)))));
              reg210 <= ({reg198[(3'h5):(1'h0)]} * $signed($signed($signed(reg205[(1'h1):(1'h1)]))));
            end
          else
            begin
              reg208 <= ($unsigned(((^~(^~reg203)) > $unsigned((^~reg209)))) ?
                  (reg203 || (^~(wire8[(4'h8):(3'h6)] & wire8))) : $unsigned(reg207));
              reg209 <= {reg212[(1'h0):(1'h0)]};
              reg210 <= $signed(((reg203[(1'h1):(1'h0)] & $unsigned($unsigned(reg206))) ?
                  $unsigned(reg204[(4'hb):(3'h5)]) : $unsigned($signed((^~wire7)))));
            end
          reg211 <= ($signed((&({reg212, wire3} ?
              (^reg207) : wire4[(3'h7):(3'h7)]))) << reg210);
          reg212 <= $signed($signed((reg205[(2'h3):(1'h0)] ?
              $signed({reg199}) : wire80)));
        end
      reg214 <= wire8[(4'hd):(4'h8)];
      reg215 <= $signed(wire1[(3'h6):(2'h2)]);
      if (((!{($signed(reg214) ?
              (+wire6) : (reg215 <<< (8'ha4)))}) + {$unsigned((reg215 <= (-reg204)))}))
        begin
          if (((wire2 >= (8'ha8)) ? wire80 : $unsigned(wire0[(3'h6):(3'h6)])))
            begin
              reg216 <= reg203;
            end
          else
            begin
              reg216 <= reg211[(3'h6):(3'h4)];
              reg217 <= $signed((+wire5[(3'h5):(2'h2)]));
              reg218 <= $unsigned(wire4);
            end
          if (reg196)
            begin
              reg219 <= (((wire7 ?
                          (~|$signed(reg200)) : (^~(reg202 ?
                              (8'hbd) : (8'hb8)))) ?
                      (((|reg217) ? (~|(8'hbc)) : reg200[(3'h6):(2'h2)]) ?
                          ($unsigned(reg206) <= wire194) : reg211[(4'h8):(1'h0)]) : (~^($unsigned(wire6) << (|reg209)))) ?
                  ((reg202 ^~ wire1) << wire3) : (7'h43));
              reg220 <= ((^~(reg204[(1'h0):(1'h0)] ?
                      $signed({reg217}) : $unsigned($unsigned(wire8)))) ?
                  $unsigned(({(8'hbb),
                      {reg206,
                          reg201}} < $unsigned(reg219[(1'h1):(1'h1)]))) : {$unsigned((|reg218[(5'h13):(4'hf)]))});
            end
          else
            begin
              reg219 <= reg203;
            end
          reg221 <= wire6;
          reg222 <= reg213;
          reg223 <= (~{$signed((^~$unsigned(reg215)))});
        end
      else
        begin
          reg216 <= wire8[(5'h11):(1'h0)];
        end
    end
  assign wire224 = (($unsigned({wire6}) == reg218) + $signed((8'ha6)));
  always
    @(posedge clk) begin
      reg225 <= $signed(reg209);
    end
  assign wire226 = $unsigned(reg220[(3'h5):(3'h5)]);
  assign wire227 = reg216;
  module22 #() modinst229 (wire228, clk, reg217, reg210, reg198, reg215);
endmodule

module module82
#(parameter param193 = (((&(((8'hbd) ? (8'ha6) : (8'hab)) > ((8'ha8) ? (8'hb6) : (8'hb7)))) ? (8'ha8) : ((8'hb8) << (((8'hbd) ? (8'h9d) : (8'hae)) ? (+(8'ha3)) : ((8'ha5) ? (8'hae) : (8'hb6))))) ? (~|((((8'hb2) == (8'hb4)) ? ((8'hb4) ^ (8'ha0)) : (^~(7'h43))) ? (((8'hbe) ^~ (8'h9c)) ? (-(8'hb4)) : ((8'hae) ? (8'hac) : (8'ha3))) : (((8'hbf) ? (8'had) : (7'h43)) > ((8'hb4) ? (8'h9e) : (7'h40))))) : (((((8'ha5) ? (8'ha7) : (7'h41)) == ((8'hbd) ? (8'ha1) : (8'h9f))) ^~ {(|(8'hb1)), ((8'hb3) >>> (7'h43))}) ? ((((8'hb6) * (8'ha7)) != ((8'ha5) ? (7'h44) : (8'ha0))) ? (((8'haf) ? (8'hb7) : (8'hb0)) ? (~&(8'ha7)) : (^(8'hb7))) : (((8'hb2) ? (8'hbc) : (8'ha7)) ? (~|(7'h42)) : ((8'hb4) ? (8'hbb) : (8'ha9)))) : ({{(8'hab)}, ((7'h40) ? (8'hb7) : (8'hba))} || ((!(7'h41)) ? ((8'ha6) && (8'ha2)) : ((8'h9c) ? (8'ha5) : (8'hbb)))))))
(y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire86;
  input wire signed [(3'h7):(1'h0)] wire85;
  input wire [(2'h2):(1'h0)] wire84;
  input wire [(5'h13):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire192;
  wire [(3'h6):(1'h0)] wire190;
  wire signed [(5'h10):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire137;
  wire [(3'h4):(1'h0)] wire97;
  wire signed [(4'hc):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire92;
  wire [(5'h11):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire [(5'h13):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  reg signed [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg [(5'h11):(1'h0)] reg94 = (1'h0);
  assign y = {wire192,
                 wire190,
                 wire141,
                 wire140,
                 wire139,
                 wire137,
                 wire97,
                 wire96,
                 wire95,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg87,
                 reg93,
                 reg94,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg87 <= (-wire84);
    end
  assign wire88 = wire83[(4'hf):(2'h2)];
  assign wire89 = (wire84 + ({$signed((wire85 << wire88)),
                      $unsigned(wire83[(4'h9):(4'h8)])} | wire86[(1'h1):(1'h1)]));
  assign wire90 = $signed($unsigned(reg87));
  assign wire91 = wire83[(4'h8):(1'h1)];
  assign wire92 = wire84;
  always
    @(posedge clk) begin
      reg93 <= ((($signed((reg87 ?
              reg87 : wire88)) * ((^~wire85) | (8'hb1))) >= ($signed((~|wire89)) ?
              (wire84[(1'h0):(1'h0)] <= {wire84}) : ((~^wire85) ?
                  wire84 : wire92))) ?
          (+((+wire89[(4'h9):(2'h3)]) || ((wire88 ? reg87 : wire90) ?
              $signed(wire85) : (~^(8'hba))))) : {((8'ha9) ?
                  (^{wire84, wire88}) : $signed($signed(wire85))),
              (wire88 ? wire88 : {(wire83 ? wire84 : wire92)})});
      reg94 <= $signed($unsigned(wire91));
    end
  assign wire95 = $signed($unsigned(reg93));
  assign wire96 = $unsigned((wire88 ?
                      ({wire91[(2'h2):(1'h1)]} ?
                          wire86 : ({reg93} | (wire89 ^ wire85))) : reg94));
  assign wire97 = (wire88[(2'h2):(2'h2)] << ((~&$signed($signed(wire89))) ?
                      reg87[(2'h2):(2'h2)] : wire85));
  module98 #() modinst138 (.wire99(wire86), .wire100(wire83), .clk(clk), .y(wire137), .wire103(reg93), .wire102(wire91), .wire101(wire88));
  assign wire139 = ((~^$unsigned($unsigned((~^wire95)))) ?
                       (+wire137[(3'h7):(3'h4)]) : (($signed(reg94) ?
                               (+(+wire86)) : wire86[(1'h1):(1'h1)]) ?
                           {((wire89 ? wire88 : wire90) ?
                                   reg87 : (!wire83))} : wire85));
  assign wire140 = reg93;
  assign wire141 = wire137[(2'h2):(2'h2)];
  module142 #() modinst191 (wire190, clk, wire91, wire86, wire89, wire141);
  assign wire192 = (~^($unsigned(wire141) ?
                       $unsigned($signed($signed(wire91))) : ((wire86[(2'h2):(2'h2)] & wire89[(4'he):(4'h9)]) ?
                           {$signed(wire85)} : (+$unsigned(wire140)))));
endmodule

module module9
#(parameter param79 = (~^(((!{(8'hb2), (8'hb8)}) ? (~&{(8'had), (8'ha0)}) : ({(8'hac)} << {(8'ha8)})) ? {((^~(8'h9c)) || (8'ha3)), ((+(8'hbe)) >> (8'hb9))} : (^{(~|(8'ha8)), (~(8'hab))}))))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(4'hc):(1'h0)] wire72;
  wire signed [(5'h10):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire14 = (~|$unsigned((&$signed(wire12[(4'hb):(3'h7)]))));
  assign wire15 = (!wire14);
  assign wire16 = ($unsigned(wire14[(4'hc):(3'h6)]) & wire13);
  assign wire17 = wire11;
  assign wire18 = {wire15[(1'h0):(1'h0)], wire16};
  assign wire19 = $signed($signed((!{$signed(wire16), (-wire16)})));
  assign wire20 = wire16[(4'he):(2'h2)];
  assign wire21 = ($signed($unsigned(({wire12} ^ wire16))) ?
                      $signed(($signed({wire17}) ?
                          {{wire17,
                                  wire13}} : $unsigned(wire16[(1'h0):(1'h0)]))) : ((~|(wire20 ?
                              (wire10 ? wire12 : wire13) : (~&wire12))) ?
                          {wire20[(1'h1):(1'h0)], (8'hb6)} : wire14));
  module22 #() modinst71 (.clk(clk), .y(wire70), .wire25(wire15), .wire24(wire19), .wire23(wire13), .wire26(wire18));
  assign wire72 = wire70[(4'hf):(3'h7)];
  assign wire73 = $signed(((((&wire13) << (8'hb2)) ?
                          $signed((^~(8'haf))) : $signed((wire20 == wire72))) ?
                      $unsigned(({wire17} ?
                          $unsigned(wire19) : wire11)) : wire72));
  assign wire74 = $unsigned($signed(($signed((wire72 << wire19)) >> wire70)));
  always
    @(posedge clk) begin
      reg75 <= ($unsigned(($unsigned((7'h44)) ?
          wire73 : (wire20 != ((8'hb5) ? wire70 : (8'hbd))))) & (^wire18));
      reg76 <= $unsigned((({(wire11 - (8'ha9))} ?
              (^~(wire18 ? wire16 : wire72)) : wire74[(3'h6):(1'h0)]) ?
          ($unsigned($signed(wire21)) || (wire73 || {wire70})) : ($unsigned($unsigned(wire16)) ^ ($unsigned(wire18) ?
              $signed(wire74) : (8'ha7)))));
    end
  assign wire77 = wire14;
  assign wire78 = $unsigned(((+(8'hbf)) ?
                      $signed((&$unsigned(wire16))) : ((wire20[(2'h2):(2'h2)] ?
                          (~^wire70) : (~^wire13)) + wire72[(4'h8):(3'h7)])));
endmodule

module module22
#(parameter param69 = ((~|(+(((8'had) ? (8'ha5) : (8'hb1)) ? ((8'hb7) > (8'hb6)) : (+(7'h43))))) | (&((((8'ha5) ? (8'h9f) : (8'h9f)) == (8'h9c)) ? (8'hb1) : (-((8'ha8) ? (8'hb9) : (8'hba)))))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire26;
  input wire [(2'h3):(1'h0)] wire25;
  input wire [(4'hd):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire43;
  wire [(3'h7):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire27;
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire27,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
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
                 reg44,
                 reg39,
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
                 (1'h0)};
  assign wire27 = $signed(((((wire23 + wire23) ?
                      wire26 : wire26[(1'h0):(1'h0)]) > (~wire26[(3'h4):(1'h0)])) | wire26));
  always
    @(posedge clk) begin
      reg28 <= ($signed((wire26 >> $signed((~wire23)))) ?
          $unsigned(((~(^wire24)) ?
              $signed($signed((8'h9f))) : wire27[(3'h6):(3'h5)])) : $unsigned($signed($signed(wire25[(1'h0):(1'h0)]))));
      reg29 <= wire25[(1'h1):(1'h1)];
      reg30 <= reg28[(4'hb):(4'h9)];
      if ($signed(($signed({(8'ha3)}) > wire25)))
        begin
          reg31 <= ((wire27 <<< (~^reg28[(3'h5):(2'h3)])) ?
              ((reg28[(3'h5):(3'h4)] != wire27) ?
                  (reg28 ?
                      (^~(wire24 > reg30)) : $unsigned((wire27 ^~ reg28))) : ($signed((^wire27)) > wire27)) : (+(-(-wire27))));
          reg32 <= (wire24 ?
              $unsigned($unsigned(wire26)) : ({(^~(reg30 ^~ reg28)),
                  ($unsigned(reg29) > (reg31 ?
                      wire23 : reg29))} << (-$signed($signed(wire24)))));
        end
      else
        begin
          reg31 <= wire23;
          reg32 <= (8'hb8);
          if ((wire23[(3'h6):(1'h1)] >>> (wire26[(1'h1):(1'h1)] ?
              (((!reg32) ?
                  {reg31} : $signed(reg32)) ^~ ($unsigned((7'h44)) & wire26[(3'h4):(1'h0)])) : (wire26[(1'h1):(1'h1)] ?
                  wire25[(1'h0):(1'h0)] : wire23))))
            begin
              reg33 <= $unsigned((reg30 > (reg30 ?
                  $signed((wire23 || wire27)) : reg29)));
              reg34 <= {wire24,
                  {(($signed((8'ha4)) && $unsigned((8'hb6))) ?
                          (reg33 || ((8'ha4) || wire23)) : reg29),
                      ((8'hbf) ?
                          (reg33 ?
                              reg33[(3'h6):(1'h0)] : (reg32 << wire23)) : reg33)}};
              reg35 <= ((((!{reg32}) ?
                      reg33 : $signed($signed(wire27))) ^ wire26[(3'h7):(3'h6)]) ?
                  (((~^((7'h43) != wire27)) && $signed($unsigned(reg34))) * reg32) : $unsigned((((~reg28) ?
                          wire26[(1'h1):(1'h1)] : wire25) ?
                      reg28[(4'hc):(4'hb)] : ((wire23 && reg33) ?
                          wire26[(3'h7):(3'h6)] : reg32[(5'h14):(4'h9)]))));
              reg36 <= $unsigned((!wire24));
              reg37 <= (-reg36[(1'h1):(1'h0)]);
            end
          else
            begin
              reg33 <= wire24[(3'h6):(2'h2)];
            end
          reg38 <= {$unsigned($signed(wire27[(3'h4):(2'h3)]))};
          reg39 <= (+$unsigned(reg28[(3'h5):(2'h3)]));
        end
    end
  assign wire40 = {reg38,
                      (+$signed(($unsigned(reg39) ?
                          ((8'h9e) ^~ reg38) : reg38[(5'h11):(4'hb)])))};
  assign wire41 = {wire23[(4'h8):(2'h2)]};
  assign wire42 = (({reg30[(1'h1):(1'h1)]} * $signed(wire25)) ?
                      (8'ha8) : wire40[(2'h3):(1'h1)]);
  assign wire43 = $unsigned(wire23);
  always
    @(posedge clk) begin
      reg44 <= {$signed(wire24)};
    end
  assign wire45 = ((|$signed(wire24[(4'h8):(3'h6)])) ?
                      wire27 : (((|wire41) - $unsigned(reg29)) >> (~(reg39[(2'h3):(2'h3)] >>> $unsigned((8'hb7))))));
  assign wire46 = (8'ha3);
  always
    @(posedge clk) begin
      reg47 <= wire23[(3'h7):(3'h5)];
      if (((8'ha3) ?
          (reg37[(3'h5):(3'h4)] ?
              $signed({((8'ha3) ?
                      reg39 : wire24)}) : reg38[(2'h2):(1'h1)]) : $signed(reg44)))
        begin
          reg48 <= $unsigned($signed($signed({(~reg38), $signed(reg34)})));
          reg49 <= $unsigned($signed(((8'hb6) >>> reg39[(3'h7):(1'h0)])));
        end
      else
        begin
          if ({(~^reg38)})
            begin
              reg48 <= {{$unsigned(($signed(reg29) & wire25[(2'h2):(2'h2)])),
                      (&reg49)},
                  ($unsigned($signed($unsigned(reg37))) ?
                      reg31 : wire41[(1'h1):(1'h0)])};
              reg49 <= (&{wire25[(1'h0):(1'h0)]});
              reg50 <= reg30;
            end
          else
            begin
              reg48 <= reg31;
              reg49 <= $signed(((~&($signed((8'hb1)) ?
                  {wire43} : {reg30})) + {((wire24 ?
                      reg44 : reg35) & wire24[(3'h5):(2'h3)])}));
              reg50 <= ((^$unsigned($signed(reg36))) ^ wire41[(2'h3):(2'h2)]);
            end
          if ({wire45[(1'h1):(1'h1)]})
            begin
              reg51 <= ($signed(reg38) >> reg44[(4'hd):(3'h7)]);
              reg52 <= ($unsigned(reg48) ?
                  (((wire26 ? (reg33 - wire27) : wire27[(2'h3):(2'h2)]) ?
                          (7'h44) : $unsigned($signed(reg47))) ?
                      reg36[(2'h2):(2'h2)] : (-$signed(wire46))) : ({$unsigned((-wire27)),
                      (wire46 ?
                          (^wire46) : $unsigned(reg29))} && (reg49[(1'h0):(1'h0)] && $signed($unsigned(reg31)))));
              reg53 <= $signed({wire43});
              reg54 <= $signed(({(~|wire25[(1'h1):(1'h1)]),
                  (+$unsigned(reg28))} < reg53));
            end
          else
            begin
              reg51 <= (-(({(reg35 <<< reg37)} ?
                  $signed({(8'hb8)}) : reg36) || $unsigned($unsigned((wire46 <= wire40)))));
              reg52 <= wire42[(1'h1):(1'h1)];
              reg53 <= ((+((reg53 ?
                      (reg51 ?
                          wire43 : (8'hb8)) : $unsigned((8'h9f))) + $unsigned($signed(reg51)))) ?
                  $signed(wire23) : $unsigned(reg35));
            end
          reg55 <= $unsigned((wire45[(4'h9):(3'h5)] - (!wire41)));
          reg56 <= (wire41[(4'ha):(3'h7)] ?
              $signed((&reg28[(3'h4):(3'h4)])) : wire40);
        end
      if (reg28)
        begin
          reg57 <= {reg50[(3'h6):(3'h6)], (wire42 < $unsigned(wire25))};
        end
      else
        begin
          reg57 <= $signed((-reg32[(4'h8):(1'h1)]));
          reg58 <= ($unsigned($signed({$unsigned(reg47),
              $signed(wire25)})) ~^ wire40[(4'hb):(4'hb)]);
          if ($signed((^(-$signed($signed(wire27))))))
            begin
              reg59 <= (8'ha4);
              reg60 <= {$unsigned((^~(wire46 || (wire25 ^~ reg59))))};
              reg61 <= reg34;
            end
          else
            begin
              reg59 <= (8'hb5);
              reg60 <= reg50;
              reg61 <= $unsigned(reg49);
              reg62 <= $unsigned(reg53[(1'h0):(1'h0)]);
              reg63 <= $unsigned(({reg56} && $signed(reg56)));
            end
          if (reg30[(2'h3):(1'h1)])
            begin
              reg64 <= (~|$unsigned((reg38[(4'he):(4'h8)] < reg44)));
              reg65 <= reg56;
              reg66 <= wire43[(5'h12):(1'h1)];
              reg67 <= (~^$signed({$signed(wire45), (&(8'ha4))}));
            end
          else
            begin
              reg64 <= wire40;
            end
        end
    end
  always
    @(posedge clk) begin
      reg68 <= (({$signed((wire45 ? reg48 : reg29)),
                  ({reg67, reg66} || reg47[(3'h7):(3'h5)])} ?
              $signed(reg66[(4'h9):(3'h7)]) : reg61[(2'h3):(2'h3)]) ?
          {($signed({reg59}) && reg49),
              (reg59 == (^~(wire46 ^~ reg51)))} : $signed((^~(^$signed(reg67)))));
    end
endmodule

module module142  (y, clk, wire146, wire145, wire144, wire143);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire146;
  input wire signed [(3'h5):(1'h0)] wire145;
  input wire [(4'he):(1'h0)] wire144;
  input wire [(5'h10):(1'h0)] wire143;
  wire [(5'h14):(1'h0)] wire189;
  wire [(3'h7):(1'h0)] wire188;
  wire signed [(2'h3):(1'h0)] wire187;
  wire [(4'h8):(1'h0)] wire183;
  wire [(4'h8):(1'h0)] wire158;
  wire signed [(4'hb):(1'h0)] wire157;
  reg signed [(3'h6):(1'h0)] reg186 = (1'h0);
  reg [(3'h4):(1'h0)] reg185 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(2'h3):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(5'h11):(1'h0)] reg180 = (1'h0);
  reg [(5'h10):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg [(5'h13):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg176 = (1'h0);
  reg [(5'h15):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg165 = (1'h0);
  reg [(4'h9):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg163 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg160 = (1'h0);
  reg signed [(4'he):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg [(5'h12):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg150 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire187,
                 wire183,
                 wire158,
                 wire157,
                 reg186,
                 reg185,
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
                 reg161,
                 reg160,
                 reg159,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg147 <= (~^(wire144[(1'h1):(1'h0)] ~^ ((^~{wire145}) < $signed((wire145 ?
          wire145 : wire146)))));
      reg148 <= wire144[(2'h2):(1'h1)];
      if ((-(8'hbe)))
        begin
          reg149 <= ((^~(^~wire143)) && (reg148[(3'h5):(3'h4)] + wire143));
        end
      else
        begin
          reg149 <= (~({reg149, wire145} || wire146));
          if (reg149[(3'h6):(1'h1)])
            begin
              reg150 <= ((|(~((reg147 < (8'hab)) >> $unsigned(wire145)))) ?
                  (^~(($signed(wire144) ? $signed(wire144) : $signed(wire145)) ?
                      reg149[(4'h8):(1'h1)] : (reg147 >> wire143))) : ((~|reg147[(3'h5):(3'h4)]) ~^ wire144[(3'h5):(2'h2)]));
              reg151 <= $unsigned(wire146[(4'ha):(3'h5)]);
            end
          else
            begin
              reg150 <= ($unsigned(wire146) - (((&wire146) ?
                  reg151[(4'hc):(1'h1)] : ((reg148 ?
                      reg148 : reg151) << reg147[(1'h1):(1'h0)])) * (!$signed(wire144))));
            end
          reg152 <= (!reg149[(1'h0):(1'h0)]);
        end
      reg153 <= (8'hae);
      reg154 <= (wire146 == reg147);
    end
  always
    @(posedge clk) begin
      reg155 <= wire145[(3'h5):(2'h2)];
      reg156 <= {wire146, reg151[(3'h7):(3'h7)]};
    end
  assign wire157 = wire144[(1'h0):(1'h0)];
  assign wire158 = reg154[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg159 <= {$signed(reg147[(2'h2):(1'h1)]),
          (($signed((reg155 << wire158)) - reg152) & wire157[(1'h0):(1'h0)])};
      reg160 <= $signed((($signed(reg156) * $signed($unsigned(reg155))) || (((|reg156) ?
          (wire145 ? reg153 : (8'hb3)) : (reg147 && wire145)) & reg153)));
      reg161 <= $signed({(wire157 == ($unsigned(reg150) == reg159[(4'hc):(1'h1)])),
          (8'hb0)});
    end
  always
    @(posedge clk) begin
      reg162 <= (((&$signed(reg149[(1'h0):(1'h0)])) <= $signed(reg148[(3'h4):(2'h3)])) ^ ($unsigned(($unsigned(wire146) ^~ $unsigned(wire143))) ^~ ($unsigned({reg161}) ?
          ({wire143} | $unsigned(reg150)) : {(wire145 ? (8'hbf) : (7'h40)),
              $unsigned(wire144)})));
      if ($unsigned((~(+reg155))))
        begin
          reg163 <= $unsigned((($signed((reg152 ?
                  reg149 : reg147)) > $signed((reg159 + reg151))) ?
              {{((8'h9d) ? reg149 : wire143)}} : ($signed(reg147) && (8'ha2))));
          reg164 <= ({$signed($signed(((8'h9f) ? reg163 : wire157))),
                  $unsigned($signed((reg153 ? reg152 : wire143)))} ?
              $unsigned((wire143[(4'hf):(3'h7)] || ($unsigned((7'h44)) ~^ $unsigned(wire146)))) : $signed(({reg162[(2'h3):(1'h1)]} - wire158)));
          reg165 <= {(^$signed(wire145)),
              ((^~$unsigned((&reg147))) - ($unsigned({reg147, wire145}) ?
                  $unsigned(wire145) : $unsigned(reg164)))};
        end
      else
        begin
          if (((|reg147) ?
              $signed((+(~wire144))) : ((~^$signed((~|wire146))) == $signed(((reg149 ?
                      reg147 : wire146) ?
                  (^~reg150) : (wire157 ? reg162 : reg156))))))
            begin
              reg163 <= reg153[(3'h4):(1'h1)];
              reg164 <= {wire145,
                  ($signed($unsigned({reg149})) >>> (((~^wire157) >> {reg151,
                          reg161}) ?
                      reg154 : (8'hb7)))};
            end
          else
            begin
              reg163 <= ($unsigned(reg155[(3'h4):(2'h3)]) >> ($signed(reg164[(3'h5):(3'h4)]) ?
                  (|$unsigned(reg155[(4'h9):(4'h9)])) : (~&$unsigned((~^reg153)))));
              reg164 <= $unsigned($unsigned(reg147));
              reg165 <= (8'hae);
              reg166 <= reg156;
            end
          reg167 <= $signed(((8'hbb) ?
              {$unsigned((~wire146))} : {(reg153 ?
                      $signed(wire144) : $signed((7'h43)))}));
          if (reg162[(4'hb):(3'h5)])
            begin
              reg168 <= (~|{wire145,
                  ($signed(reg167[(2'h2):(1'h1)]) >> ({reg155,
                      reg159} | reg160[(2'h2):(2'h2)]))});
              reg169 <= (reg168 <<< $signed($unsigned(reg150[(2'h2):(2'h2)])));
              reg170 <= $signed($signed($unsigned(($unsigned(wire158) ?
                  wire145[(2'h3):(2'h2)] : (&reg160)))));
              reg171 <= (!(+reg168[(3'h7):(3'h5)]));
            end
          else
            begin
              reg168 <= {$signed((reg162[(3'h7):(3'h6)] ?
                      reg160[(1'h1):(1'h0)] : $signed(reg152[(4'hc):(1'h1)]))),
                  reg166};
              reg169 <= (((8'hbd) & ($signed($unsigned(reg161)) ?
                      wire157[(2'h2):(2'h2)] : (reg163[(5'h14):(2'h2)] ~^ (8'hb4)))) ?
                  $signed(((wire143[(4'ha):(2'h2)] == $unsigned(reg169)) || {(reg147 ?
                          reg152 : reg159),
                      (!reg164)})) : (~&(~(8'hae))));
              reg170 <= ((($signed(reg156) ?
                          reg169 : ((reg170 > reg147) & reg150)) ?
                      {$signed((^~wire144)),
                          ($signed((8'hbc)) ?
                              (^~reg148) : (reg149 < (8'haf)))} : reg153) ?
                  reg168 : {(reg154[(1'h1):(1'h1)] || ($signed(reg152) && $unsigned(wire146)))});
              reg171 <= $signed(reg168);
            end
        end
      reg172 <= (reg167[(1'h0):(1'h0)] == ($signed((7'h41)) ?
          reg168[(1'h1):(1'h0)] : (reg166 == reg156)));
      if (reg168)
        begin
          if (($signed({(8'hae),
              ($signed((8'hbb)) ?
                  reg153[(1'h0):(1'h0)] : (reg155 <<< reg149))}) - ((~^reg152) ?
              $unsigned(reg160) : (~^(reg151[(1'h1):(1'h0)] <= $unsigned(reg153))))))
            begin
              reg173 <= (+(7'h44));
              reg174 <= (^~{wire157[(3'h4):(1'h1)], reg173});
            end
          else
            begin
              reg173 <= reg164;
              reg174 <= ($signed({($unsigned(reg155) ?
                      ((8'ha4) ?
                          wire144 : reg168) : (reg161 || reg171))}) & (-reg165));
              reg175 <= wire157;
              reg176 <= $signed($unsigned(reg154[(1'h1):(1'h1)]));
            end
          reg177 <= $signed($signed((7'h44)));
          reg178 <= $signed(((reg161 ?
                  ((reg151 | reg149) ~^ $unsigned((8'ha6))) : {wire144}) ?
              ($unsigned((8'ha3)) >> (-(!reg156))) : ($unsigned($signed((8'h9d))) ?
                  $unsigned((&reg168)) : wire157)));
          reg179 <= (-{reg176[(1'h1):(1'h0)],
              ({wire157, $signed(reg161)} + reg147[(2'h3):(1'h0)])});
        end
      else
        begin
          reg173 <= (^~$signed(reg150));
          reg174 <= ($unsigned($unsigned(($unsigned(reg154) || $unsigned(reg176)))) ?
              reg167[(2'h2):(1'h0)] : reg150);
          reg175 <= reg173;
          reg176 <= reg148;
          reg177 <= wire143;
        end
      if ((($unsigned($signed(reg154[(1'h1):(1'h1)])) ?
          reg170 : $signed({$unsigned(reg169),
              (!(8'hb6))})) && ({$unsigned($signed((8'haf))),
              {wire144, {reg177, reg178}}} ?
          (reg168 == {$signed(reg155), $signed(wire157)}) : reg177)))
        begin
          reg180 <= {(!reg171)};
        end
      else
        begin
          reg180 <= ($signed(($signed((reg155 >>> (8'hab))) ~^ reg167)) ?
              reg147 : ($signed((reg156 << (!(8'hbe)))) ?
                  $unsigned((wire144[(3'h5):(2'h2)] | (8'ha9))) : (~&$unsigned($signed(reg171)))));
        end
    end
  always
    @(posedge clk) begin
      reg181 <= ((($unsigned((^(8'haf))) >> $unsigned({reg168})) ?
              reg173 : $unsigned(reg166[(3'h4):(1'h0)])) ?
          (($signed(reg171[(1'h0):(1'h0)]) >>> {$unsigned(reg164),
              $unsigned(reg172)}) ^ (((+reg155) ?
                  $unsigned(reg173) : {reg155}) ?
              (!reg156) : reg163)) : ($signed($signed($unsigned(reg155))) - (8'h9d)));
      reg182 <= reg172;
    end
  assign wire183 = ((reg163[(5'h10):(2'h3)] ?
                       (($unsigned(reg156) + wire157) >= (|reg179[(4'hf):(2'h3)])) : reg180[(4'hb):(3'h4)]) <<< wire158);
  always
    @(posedge clk) begin
      reg184 <= ((8'hb8) >> $signed(({$signed(reg179), $unsigned(reg153)} ?
          $unsigned(reg166) : reg151[(2'h2):(2'h2)])));
      if ((+(reg165 ?
          ((reg154[(1'h1):(1'h1)] ?
              reg162[(3'h6):(1'h1)] : wire143[(2'h3):(2'h3)]) ^ reg179) : ({reg159[(4'hd):(1'h1)]} >= reg156[(1'h0):(1'h0)]))))
        begin
          reg185 <= {$unsigned(reg180[(4'hc):(2'h2)]),
              (($unsigned($signed(reg180)) || ((~^reg180) ?
                      {wire157, reg180} : ((8'hbe) < reg163))) ?
                  ($signed($unsigned(reg170)) | $signed((reg167 ?
                      reg170 : reg148))) : (~&$unsigned($signed(wire157))))};
          reg186 <= reg148[(3'h5):(3'h5)];
        end
      else
        begin
          reg185 <= reg161;
        end
    end
  assign wire187 = (((reg177[(4'hd):(4'hc)] > wire158) + $signed({$signed(reg162),
                       reg147})) >= (($signed((reg174 ? reg185 : wire143)) ?
                       $unsigned((reg153 ? reg169 : (8'hb4))) : ({reg174,
                               reg162} ?
                           $unsigned(reg172) : (&wire183))) > $signed(((reg156 * reg177) ?
                       (~|reg177) : $signed(reg149)))));
  assign wire188 = ((8'ha8) ?
                       $signed((~^(&$unsigned((8'h9c))))) : ({($unsigned(reg162) <<< $signed(reg148)),
                               {(reg182 ? (8'ha0) : reg178), (~|reg162)}} ?
                           $unsigned({reg175[(4'hc):(4'h8)],
                               (reg153 ?
                                   reg147 : reg173)}) : reg185[(1'h0):(1'h0)]));
  assign wire189 = ((reg175[(5'h15):(5'h12)] ?
                       $unsigned($unsigned($unsigned(reg186))) : ((|$unsigned(reg176)) >= reg185[(1'h0):(1'h0)])) == (reg178[(3'h6):(2'h3)] < (&(^(reg159 >= reg150)))));
endmodule

module module98  (y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h1ae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire103;
  input wire [(2'h2):(1'h0)] wire102;
  input wire [(4'hc):(1'h0)] wire101;
  input wire signed [(5'h13):(1'h0)] wire100;
  input wire signed [(3'h5):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire134;
  wire [(4'he):(1'h0)] wire133;
  wire [(4'hb):(1'h0)] wire132;
  wire signed [(5'h15):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire107;
  wire [(5'h12):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  wire [(5'h10):(1'h0)] wire104;
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(5'h10):(1'h0)] reg127 = (1'h0);
  reg [(2'h2):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg136,
                 reg135,
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
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 (1'h0)};
  assign wire104 = wire102;
  assign wire105 = (+(+{$signed(wire101[(3'h5):(3'h4)]), wire101}));
  assign wire106 = (|$signed(($signed((wire105 >= (8'hb2))) > $signed({wire99}))));
  assign wire107 = wire101[(3'h4):(2'h3)];
  assign wire108 = ((8'hb6) ?
                       (|$unsigned(wire103[(3'h7):(1'h0)])) : ({(+$signed(wire107)),
                           ((wire102 && wire100) ~^ $unsigned(wire106))} ^ wire100[(4'hb):(2'h2)]));
  always
    @(posedge clk) begin
      reg109 <= ($signed({$signed((wire105 << wire106)),
          {{wire103}}}) & wire102[(1'h0):(1'h0)]);
      reg110 <= $unsigned($signed($unsigned((^~wire99))));
      reg111 <= $unsigned(($signed(wire99) ?
          reg109[(1'h0):(1'h0)] : (({wire107, reg109} ?
                  ((8'hb8) ~^ wire108) : $signed(wire103)) ?
              wire99[(1'h0):(1'h0)] : $signed((^reg110)))));
      reg112 <= (((wire99 + (8'hb1)) ?
          wire105[(3'h4):(2'h3)] : reg110) >>> wire101);
    end
  always
    @(posedge clk) begin
      if (wire104[(1'h0):(1'h0)])
        begin
          if ({((wire108 ?
                  (8'ha6) : (wire108 >= wire107[(5'h10):(4'h8)])) ^ wire102[(2'h2):(1'h1)])})
            begin
              reg113 <= (wire101 ?
                  ((((-reg111) || (wire102 ~^ reg110)) == {wire105[(1'h0):(1'h0)],
                          $signed(wire106)}) ?
                      wire99 : $signed(reg110)) : $signed((wire104[(4'hb):(4'hb)] ?
                      $signed($signed(wire102)) : (reg110 ?
                          (reg110 ? wire100 : wire103) : reg112))));
              reg114 <= $unsigned({$signed($unsigned($unsigned(wire100)))});
            end
          else
            begin
              reg113 <= (({(wire101[(1'h0):(1'h0)] ?
                          (reg110 | wire108) : {reg112}),
                      ((~&reg110) ?
                          $signed((8'hb7)) : (reg114 ? reg111 : wire101))} ?
                  {((reg114 <<< wire105) + (7'h41))} : $unsigned($signed(wire107[(4'ha):(3'h5)]))) <<< wire99);
              reg114 <= wire104[(4'h8):(1'h0)];
            end
        end
      else
        begin
          reg113 <= wire105;
          if ((((^$unsigned(reg112[(2'h2):(1'h1)])) ?
                  reg111[(4'hd):(4'hb)] : $unsigned((8'hb5))) ?
              $unsigned($unsigned($signed(wire108))) : $signed($signed($unsigned((+wire104))))))
            begin
              reg114 <= ((((^$signed(reg110)) ?
                          $unsigned(wire101[(1'h0):(1'h0)]) : ({wire101} ?
                              ((8'hbe) == reg109) : (+wire102))) ?
                      $signed((reg114[(2'h3):(1'h1)] ?
                          $signed(wire106) : (reg111 <= wire100))) : wire101[(2'h3):(2'h2)]) ?
                  wire107 : $signed($signed($unsigned(reg114))));
            end
          else
            begin
              reg114 <= (($signed((~^$unsigned(reg114))) * ($signed(reg109[(1'h0):(1'h0)]) ?
                      $unsigned((wire103 | reg110)) : ($unsigned(wire103) * wire102[(1'h1):(1'h1)]))) ?
                  reg113[(2'h2):(2'h2)] : (wire102 + (($signed(wire102) ^~ $signed(wire102)) == (wire104[(2'h3):(2'h2)] ?
                      (^~wire108) : (wire108 << reg114)))));
              reg115 <= (|(~^$signed((wire102 != wire106))));
              reg116 <= $unsigned($unsigned((((!(8'ha8)) | (wire106 ?
                      wire106 : (8'hbb))) ?
                  $unsigned($unsigned((8'hba))) : reg110)));
            end
          if (wire108[(3'h4):(2'h3)])
            begin
              reg117 <= (((reg110 ?
                      (~^$unsigned(reg113)) : (8'hac)) ^~ wire107[(2'h2):(2'h2)]) ?
                  wire99 : {($signed(wire101[(3'h6):(2'h2)]) >= $unsigned($signed((8'hb4)))),
                      (^{(wire106 ? wire108 : wire101), $unsigned((8'ha2))})});
            end
          else
            begin
              reg117 <= reg116;
              reg118 <= $signed($unsigned($unsigned(($signed(reg110) ?
                  $unsigned(reg114) : $signed(reg114)))));
            end
          if ((~wire103))
            begin
              reg119 <= ($signed($signed(({wire103, reg114} ?
                      (-reg110) : wire107))) ?
                  $unsigned($unsigned($unsigned($signed(reg110)))) : reg109);
              reg120 <= wire101[(3'h5):(1'h1)];
              reg121 <= ((~^wire101) ? wire103[(4'ha):(1'h0)] : reg113);
              reg122 <= ($signed($unsigned(reg113)) ?
                  reg120[(1'h1):(1'h0)] : wire104);
            end
          else
            begin
              reg119 <= (^(((reg117[(4'hd):(4'h9)] > $unsigned(wire105)) ?
                  ((wire105 ^~ wire104) ?
                      (~^(8'hb7)) : $unsigned(wire102)) : reg115[(2'h2):(1'h0)]) >= (($unsigned(wire104) ?
                      reg119 : (~wire99)) ?
                  $signed(wire104) : $signed((wire103 ? reg119 : reg112)))));
              reg120 <= $unsigned(wire99);
              reg121 <= reg114[(4'h8):(1'h0)];
              reg122 <= (wire104 ? reg120 : wire106[(4'hc):(4'h9)]);
            end
          reg123 <= (&$unsigned(wire99));
        end
      reg124 <= wire107[(4'hd):(4'ha)];
      if (reg114)
        begin
          reg125 <= (reg112[(4'ha):(3'h5)] ?
              $unsigned(((^~(reg112 ?
                  reg119 : (8'hab))) - $unsigned((!reg118)))) : reg118);
          reg126 <= $signed($signed({$signed((^~(8'hb3)))}));
        end
      else
        begin
          reg125 <= (+(reg110[(1'h0):(1'h0)] ?
              ((~^{wire104}) ?
                  $signed($signed(reg126)) : $signed(wire100)) : $unsigned(((~^reg119) ?
                  ((8'hb0) ? wire107 : reg117) : (wire102 & (8'hb3))))));
          reg126 <= $signed((&(-((reg118 ?
              wire104 : wire100) ^ reg121[(4'hb):(1'h0)]))));
          reg127 <= (+wire102[(2'h2):(1'h1)]);
          reg128 <= (((^~$signed($signed(reg119))) ?
              reg126 : ((~$unsigned(reg123)) ^~ (~^(reg114 ?
                  reg126 : wire108)))) > $unsigned(wire106[(5'h10):(4'hf)]));
        end
      reg129 <= $signed(((reg120 >= $signed((~^wire107))) ^ (reg122[(5'h12):(4'hf)] ?
          (~^wire106) : ($signed(wire103) ? ((8'hb7) + reg109) : reg113))));
      reg130 <= reg117[(3'h7):(3'h7)];
    end
  assign wire131 = reg118[(3'h5):(1'h1)];
  assign wire132 = reg119;
  assign wire133 = (($signed(wire101) <<< {(8'ha1)}) ~^ reg124);
  assign wire134 = reg117[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg135 <= reg119;
      reg136 <= $signed(wire103[(1'h1):(1'h0)]);
    end
endmodule
