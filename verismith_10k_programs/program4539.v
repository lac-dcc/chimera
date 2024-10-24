module top
#(parameter param235 = (8'ha9), 
parameter param236 = (~^((8'hba) ? (param235 ? ((+(7'h42)) ? (8'ha8) : (~param235)) : ((^param235) - (param235 ? param235 : param235))) : ((((8'ha7) >>> param235) ? {param235} : (~|param235)) << {(-param235)}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h218):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire202;
  wire [(4'hd):(1'h0)] wire201;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(4'he):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(5'h10):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire89;
  wire [(4'hd):(1'h0)] wire198;
  reg signed [(3'h4):(1'h0)] reg234 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg233 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg232 = (1'h0);
  reg [(5'h15):(1'h0)] reg231 = (1'h0);
  reg [(4'h8):(1'h0)] reg230 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg229 = (1'h0);
  reg [(5'h11):(1'h0)] reg228 = (1'h0);
  reg [(4'h9):(1'h0)] reg227 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg226 = (1'h0);
  reg [(5'h11):(1'h0)] reg225 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg223 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg222 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg221 = (1'h0);
  reg [(4'h9):(1'h0)] reg220 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg219 = (1'h0);
  reg signed [(4'he):(1'h0)] reg218 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg216 = (1'h0);
  reg [(4'hf):(1'h0)] reg215 = (1'h0);
  reg [(4'hd):(1'h0)] reg214 = (1'h0);
  reg [(4'h8):(1'h0)] reg213 = (1'h0);
  reg [(5'h14):(1'h0)] reg212 = (1'h0);
  reg [(5'h13):(1'h0)] reg211 = (1'h0);
  reg [(5'h10):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg209 = (1'h0);
  reg [(3'h5):(1'h0)] reg208 = (1'h0);
  reg [(4'hf):(1'h0)] reg207 = (1'h0);
  reg [(5'h11):(1'h0)] reg206 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg205 = (1'h0);
  reg [(4'hb):(1'h0)] reg204 = (1'h0);
  reg [(4'hf):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg200 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire5,
                 wire6,
                 wire7,
                 wire85,
                 wire87,
                 wire88,
                 wire89,
                 wire198,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
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
                 reg200,
                 (1'h0)};
  assign wire5 = ((~&wire2[(1'h0):(1'h0)]) ?
                     $unsigned($unsigned(wire2)) : {(+wire4)});
  assign wire6 = (wire1 ?
                     ($signed(wire4) ?
                         $unsigned(($signed((8'h9f)) < ((8'ha1) * wire1))) : ((wire5[(1'h0):(1'h0)] != wire1) | ($unsigned((8'h9d)) || (wire5 ?
                             wire5 : wire4)))) : wire1);
  assign wire7 = (!{(+$unsigned({wire6}))});
  module8 #() modinst86 (.clk(clk), .wire9(wire2), .wire10(wire0), .wire12(wire5), .y(wire85), .wire11(wire7));
  assign wire87 = (&wire4[(1'h1):(1'h0)]);
  assign wire88 = (~^((wire7[(1'h1):(1'h1)] ?
                      ($unsigned((8'hb4)) ?
                          (~|wire87) : wire3[(5'h12):(5'h10)]) : {(!wire87),
                          ((8'ha7) ? wire0 : (8'had))}) - {(~&(&wire85)),
                      $unsigned($signed(wire1))}));
  assign wire89 = (!($signed((&wire87[(4'hf):(1'h1)])) ?
                      (wire88 ?
                          $signed(wire85[(4'h8):(2'h2)]) : (wire0[(4'he):(4'hb)] ?
                              {wire0} : $signed(wire2))) : $signed((-$unsigned((8'ha2))))));
  module90 #() modinst199 (wire198, clk, wire6, wire0, wire4, wire2, wire3);
  always
    @(posedge clk) begin
      reg200 <= (wire85[(4'hc):(3'h7)] <<< wire7);
    end
  assign wire201 = (8'hb2);
  assign wire202 = wire198;
  always
    @(posedge clk) begin
      reg203 <= {wire88};
      reg204 <= ($signed($unsigned(wire2)) ?
          wire202 : (wire6[(4'h8):(2'h2)] >>> (~|$unsigned(wire88))));
      if ((~|$signed(((wire2[(3'h5):(3'h5)] ?
              ((7'h41) ^ reg203) : (wire202 - reg200)) ?
          {$signed(wire88), (&wire202)} : ((wire2 * wire201) ?
              (wire201 ? reg203 : (8'hac)) : (reg203 ? (8'hbe) : (8'ha2)))))))
        begin
          reg205 <= $unsigned(wire0[(4'h9):(3'h7)]);
          if ($unsigned(wire88))
            begin
              reg206 <= ((~^{$signed((wire88 ? reg203 : wire3)),
                  {reg205,
                      (wire198 << (8'hab))}}) ^~ ($signed($unsigned(wire2[(3'h4):(2'h3)])) ?
                  (($signed(wire0) ? $unsigned(wire3) : wire1) ?
                      $signed(wire201) : wire7) : wire89));
              reg207 <= wire7[(4'hd):(2'h3)];
              reg208 <= (8'hb1);
              reg209 <= wire201;
            end
          else
            begin
              reg206 <= reg208;
            end
          reg210 <= (((~&$unsigned((wire201 & reg205))) + {(^$unsigned(reg207))}) <<< $unsigned(reg204[(3'h6):(1'h0)]));
          if (reg208)
            begin
              reg211 <= (reg207[(3'h7):(3'h7)] | (wire5[(4'he):(2'h2)] ?
                  ((-wire85) - ((~(8'hbd)) >>> $signed((8'had)))) : ($unsigned($signed(wire2)) ?
                      (^~$signed((8'ha3))) : $unsigned((~(8'ha0))))));
            end
          else
            begin
              reg211 <= $signed((^~($signed($unsigned(wire7)) ?
                  ($signed(reg203) <= $unsigned(reg208)) : (~&(wire85 ?
                      reg203 : reg203)))));
              reg212 <= ($unsigned($signed((^~{wire6,
                  wire4}))) | $signed(wire201[(2'h2):(1'h0)]));
              reg213 <= $signed(reg211);
              reg214 <= ($signed(((+{wire0,
                      (8'hba)}) + wire85[(4'hc):(4'ha)])) ?
                  $unsigned(({wire2[(3'h7):(1'h0)]} <<< wire7)) : reg204);
              reg215 <= (reg205 ?
                  $signed(((~&$unsigned((8'hbf))) & ((-reg207) ?
                      {reg207, reg203} : reg211))) : ((reg203[(1'h1):(1'h1)] ?
                          wire4 : (((8'hac) * reg209) || (-wire4))) ?
                      $unsigned($unsigned($signed(reg209))) : (((~&wire5) ?
                              reg207[(4'h8):(4'h8)] : (wire4 ?
                                  reg212 : reg206)) ?
                          ({wire4} ~^ ((7'h43) ~^ wire202)) : {reg212[(4'hb):(1'h0)],
                              reg210})));
            end
        end
      else
        begin
          if ($signed(($signed((&$unsigned((8'hb4)))) ?
              ((wire4 ? wire88[(1'h0):(1'h0)] : (wire5 == reg204)) ?
                  wire89 : ((wire201 ?
                      reg214 : (8'hb1)) ^~ wire89[(3'h7):(1'h0)])) : (reg208 ?
                  (^$unsigned(wire201)) : (8'hb9)))))
            begin
              reg205 <= (+({wire0} ? wire7 : $unsigned(reg205)));
              reg206 <= reg209;
              reg207 <= $unsigned(wire201[(4'h8):(3'h4)]);
              reg208 <= (+(~&(reg204[(3'h5):(2'h3)] || $unsigned({reg200}))));
              reg209 <= reg200;
            end
          else
            begin
              reg205 <= {(reg205[(2'h3):(1'h1)] ?
                      ($signed(wire85[(5'h12):(4'ha)]) ?
                          ($signed(reg215) ^ (wire198 ?
                              reg212 : reg204)) : wire202[(3'h5):(2'h3)]) : $unsigned(reg203))};
            end
        end
      if ((^(({{reg212}} ?
          (^~(wire3 ?
              reg204 : wire87)) : wire87) ^ ($signed(((8'ha2) <<< wire202)) || ((^wire7) ^~ reg206[(3'h5):(1'h1)])))))
        begin
          reg216 <= reg208;
          reg217 <= ((reg209 | (8'hbc)) ?
              ($signed(wire87[(4'h8):(3'h4)]) ?
                  (&((reg209 ?
                      (8'h9e) : wire201) + (&wire7))) : $signed($unsigned((wire6 != reg214)))) : $unsigned(reg209));
          reg218 <= $signed(reg212);
          if (wire4[(1'h0):(1'h0)])
            begin
              reg219 <= (((^$unsigned(wire4[(2'h3):(2'h2)])) ?
                      wire5 : {((~|(8'ha6)) ?
                              (reg206 ~^ (8'hb6)) : (wire1 ? wire88 : reg200)),
                          $unsigned({(8'ha1)})}) ?
                  $signed(($unsigned((wire1 | wire198)) * reg209)) : ((^~wire89[(5'h10):(2'h2)]) ?
                      reg203[(2'h3):(2'h3)] : $unsigned((+wire87[(3'h5):(2'h2)]))));
              reg220 <= reg217[(3'h6):(3'h4)];
              reg221 <= $unsigned(wire5);
            end
          else
            begin
              reg219 <= reg206;
              reg220 <= $signed(reg205);
              reg221 <= wire87;
              reg222 <= $unsigned((|(^~(|reg220))));
              reg223 <= (((reg217[(3'h4):(2'h2)] ?
                      wire198 : ($signed(reg213) < (reg216 >> reg213))) ?
                  reg216 : $unsigned($signed({wire85}))) * $signed((~|reg215)));
            end
          reg224 <= $signed((((~^(+wire202)) >> $unsigned((wire2 ?
              reg200 : reg206))) | {$signed((reg204 ? (8'ha9) : reg221))}));
        end
      else
        begin
          reg216 <= $signed($signed(reg207));
        end
      if ((+$signed((8'ha0))))
        begin
          reg225 <= (^~($unsigned({$unsigned(reg221)}) <<< (^$signed(reg206[(1'h0):(1'h0)]))));
          reg226 <= ((~(~^($signed(reg220) > $unsigned((7'h42))))) * ($signed($signed($signed(wire1))) ?
              reg212 : wire89[(4'he):(1'h1)]));
          if ((-($signed({((8'hb7) < wire7)}) == ($signed((|reg212)) - wire202))))
            begin
              reg227 <= (($signed(({wire198, reg209} ?
                      $signed((7'h42)) : (&reg212))) ?
                  wire1[(4'h9):(4'h8)] : reg211[(1'h1):(1'h0)]) || ((~$signed($signed(wire4))) + $unsigned(((reg211 | reg214) != (reg217 ?
                  reg225 : wire7)))));
            end
          else
            begin
              reg227 <= reg226[(4'h8):(3'h7)];
              reg228 <= wire6;
              reg229 <= ((reg220 != $unsigned((8'hab))) ^~ reg213);
              reg230 <= wire198;
              reg231 <= reg203;
            end
          if ((~|reg218))
            begin
              reg232 <= $signed(reg210[(4'hd):(4'h9)]);
              reg233 <= ((reg204[(3'h5):(2'h3)] ?
                      reg227[(2'h3):(2'h3)] : (((reg217 >>> reg231) < $unsigned(reg220)) ?
                          wire87 : ($unsigned(wire89) ?
                              {reg210, reg200} : $unsigned(wire198)))) ?
                  reg225 : $unsigned((~reg204)));
            end
          else
            begin
              reg232 <= ((reg226 | reg233[(3'h5):(3'h5)]) ?
                  (^~reg203[(3'h7):(2'h3)]) : ({((~^(8'hb5)) < reg213[(1'h0):(1'h0)])} ?
                      (!$signed($signed(wire85))) : ((^$unsigned(wire0)) ?
                          $signed($unsigned((8'ha5))) : {reg231[(5'h13):(3'h6)]})));
              reg233 <= ({$unsigned(reg231[(5'h12):(5'h11)])} ?
                  reg226[(1'h1):(1'h1)] : $signed((reg207[(3'h7):(1'h0)] > (wire0 ?
                      (reg226 >> wire202) : $signed(wire0)))));
              reg234 <= {{reg227[(1'h0):(1'h0)]}, (+reg228[(4'h8):(1'h0)])};
            end
        end
      else
        begin
          reg225 <= ((~reg228) ?
              $signed(wire89[(1'h0):(1'h0)]) : (($signed($unsigned(reg205)) ?
                  reg233[(3'h6):(3'h4)] : (reg218 ?
                      {wire3} : $unsigned(reg218))) ~^ reg220[(3'h7):(3'h4)]));
          reg226 <= $signed((|((reg224[(3'h6):(3'h4)] ?
                  {reg224, reg212} : {reg215}) ?
              reg217 : $signed($signed(reg203)))));
        end
    end
endmodule

module module90  (y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire95;
  input wire [(3'h6):(1'h0)] wire94;
  input wire [(3'h5):(1'h0)] wire93;
  input wire [(4'h9):(1'h0)] wire92;
  input wire signed [(5'h14):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire197;
  wire [(4'h8):(1'h0)] wire196;
  wire [(4'he):(1'h0)] wire195;
  wire [(4'hf):(1'h0)] wire194;
  wire [(3'h5):(1'h0)] wire193;
  wire signed [(3'h7):(1'h0)] wire191;
  wire signed [(3'h6):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire119;
  wire [(5'h13):(1'h0)] wire118;
  wire signed [(4'hf):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire signed [(5'h13):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg108 = (1'h0);
  reg [(5'h11):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  assign y = {wire197,
                 wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire191,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire97,
                 wire96,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
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
                 (1'h0)};
  assign wire96 = wire93[(3'h5):(1'h1)];
  assign wire97 = wire95;
  always
    @(posedge clk) begin
      reg98 <= (!$signed($unsigned((wire91 * wire91[(3'h7):(3'h7)]))));
      reg99 <= $signed((~&$signed(((wire97 - wire94) <= wire97))));
      if ((wire96[(3'h4):(1'h1)] ?
          $unsigned($unsigned($signed(wire97[(2'h2):(1'h0)]))) : wire93[(1'h0):(1'h0)]))
        begin
          if (wire95)
            begin
              reg100 <= (!((wire91 && (wire97 ?
                  {(8'ha5),
                      (8'hb8)} : (wire97 + wire96))) == $signed(($unsigned(wire91) < (wire91 ?
                  wire95 : wire94)))));
              reg101 <= ((8'hab) + $unsigned(((8'hbf) ?
                  $signed((wire95 ?
                      wire94 : reg99)) : $unsigned($unsigned(wire92)))));
              reg102 <= $signed(($signed($signed((7'h43))) || (~|(wire96[(3'h4):(1'h0)] == $signed(wire97)))));
              reg103 <= reg100;
            end
          else
            begin
              reg100 <= ($unsigned((wire93 ?
                      $unsigned($unsigned(wire95)) : {$unsigned(wire96),
                          wire93})) ?
                  (&(~|{(7'h44)})) : wire95);
              reg101 <= wire95;
              reg102 <= (reg100 ? reg103 : $unsigned((+wire96)));
            end
          reg104 <= (~$unsigned(wire94));
          reg105 <= $signed((!(wire94 ?
              reg102[(3'h6):(1'h0)] : ($signed((8'ha0)) ?
                  (!reg102) : wire96))));
        end
      else
        begin
          if ((reg98 == reg103[(4'hb):(4'hb)]))
            begin
              reg100 <= (wire94 ?
                  (-(reg99 ?
                      (~|reg101) : ($signed(wire95) ?
                          (8'hbe) : reg101[(1'h1):(1'h0)]))) : reg103);
            end
          else
            begin
              reg100 <= (~|$signed($signed({(wire91 - wire95),
                  (wire96 << reg99)})));
              reg101 <= (^$signed(($signed((+wire93)) ?
                  ($signed(reg100) & $unsigned(reg102)) : ($signed((8'ha8)) & (wire94 ~^ (8'hbd))))));
            end
          reg102 <= (~&$unsigned((~&(wire93[(3'h4):(1'h0)] ?
              wire93 : wire96))));
        end
      reg106 <= ((-({wire93, (8'hb1)} ?
              $signed((&wire91)) : $signed(reg103[(4'hc):(4'hb)]))) ?
          ($signed((-(~|reg100))) ?
              wire97[(2'h2):(1'h0)] : (8'ha8)) : $signed((reg101[(3'h5):(1'h0)] >= (~^$unsigned(reg105)))));
      reg107 <= $unsigned($signed(({(reg102 ?
              reg99 : wire93)} * wire91[(5'h14):(5'h12)])));
    end
  always
    @(posedge clk) begin
      reg108 <= $unsigned((|reg101[(2'h3):(1'h0)]));
      reg109 <= $signed($unsigned({(reg102[(1'h0):(1'h0)] << $unsigned(reg106))}));
      if ($unsigned((wire91 && $unsigned(reg98))))
        begin
          reg110 <= (|$unsigned((reg101 ?
              {wire94, ((8'hb6) ? wire92 : reg101)} : {reg101})));
          reg111 <= (~&reg100);
          if (wire97)
            begin
              reg112 <= wire95;
            end
          else
            begin
              reg112 <= {wire92,
                  $unsigned($signed(($unsigned(reg110) ?
                      (reg108 ? wire93 : wire96) : (reg104 ?
                          wire96 : reg111))))};
              reg113 <= reg111[(3'h6):(1'h1)];
            end
          reg114 <= (+(~reg109[(4'ha):(3'h7)]));
        end
      else
        begin
          reg110 <= (reg114[(3'h4):(1'h1)] & ($signed(reg101) ?
              $unsigned($unsigned($signed((7'h41)))) : $signed($signed($unsigned(wire96)))));
        end
    end
  assign wire115 = (reg108[(4'ha):(1'h0)] ^~ {wire95});
  assign wire116 = $signed((&{$signed({reg106}),
                       ((reg109 || reg107) & (reg100 >= wire95))}));
  assign wire117 = $unsigned((&$unsigned((!$unsigned(reg109)))));
  assign wire118 = reg114;
  assign wire119 = $signed(reg114[(3'h5):(3'h5)]);
  assign wire120 = {$signed($signed((8'haf))), reg104};
  module121 #() modinst192 (.wire122(reg101), .wire125(reg108), .wire123(reg105), .wire124(reg111), .clk(clk), .y(wire191));
  assign wire193 = (wire191 ?
                       (reg102 ?
                           (|(~|wire120)) : (~^reg105[(3'h6):(2'h3)])) : $signed(reg112[(3'h5):(2'h2)]));
  assign wire194 = reg109;
  assign wire195 = wire115[(5'h13):(1'h0)];
  assign wire196 = (wire97[(2'h2):(2'h2)] == reg104[(1'h1):(1'h1)]);
  assign wire197 = {wire119, (|$unsigned($unsigned((+(8'h9c)))))};
endmodule

module module8
#(parameter param83 = ((({((8'hab) <= (7'h40)), (~|(8'hac))} ? {((8'h9f) ? (8'hac) : (8'hb6))} : {{(8'hb1), (8'h9c)}}) ? {((!(8'hae)) ? ((8'ha0) == (8'ha9)) : ((8'ha3) >> (8'hb1)))} : ((((8'hb0) != (8'haf)) ? {(8'ha1), (8'hbd)} : (+(7'h40))) ? (~^((8'h9d) * (8'hb0))) : (&((8'ha0) ? (8'hb1) : (8'ha4))))) | ({(-((8'hb7) <<< (8'hb9))), (-((8'hb0) ? (8'had) : (8'ha9)))} >> (!((+(8'h9e)) < (~^(8'hbb)))))), 
parameter param84 = {((((^~param83) != (param83 ~^ param83)) && param83) ? (+param83) : (^~{(^param83), (param83 - (7'h42))}))})
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h1e6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire [(3'h7):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire13;
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  assign y = {wire82,
                 wire80,
                 wire53,
                 wire52,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire13,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire13 = $signed(wire10[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg14 <= $unsigned((wire9 + (~(8'ha9))));
      if ((|$signed(wire11)))
        begin
          reg15 <= {wire12,
              $signed(($unsigned($signed(wire9)) ^~ wire13[(2'h3):(1'h1)]))};
          if (wire9)
            begin
              reg16 <= wire10;
              reg17 <= {{(^({wire12, wire13} ?
                          (reg14 ? reg15 : reg15) : reg16)),
                      (!($unsigned(wire9) ? $signed(reg16) : (8'hbe)))},
                  $signed($signed(wire13))};
              reg18 <= {wire12};
            end
          else
            begin
              reg16 <= {$unsigned($unsigned(reg14[(4'h8):(3'h5)]))};
            end
          if ($unsigned(wire12[(5'h14):(1'h1)]))
            begin
              reg19 <= ($unsigned(reg17) ^~ $signed($signed(reg16)));
              reg20 <= reg16;
              reg21 <= $signed(($signed($unsigned((reg15 ?
                  wire12 : wire10))) & $signed(reg20[(2'h3):(1'h1)])));
              reg22 <= $signed(reg14[(3'h5):(3'h4)]);
            end
          else
            begin
              reg19 <= $signed((8'hb6));
              reg20 <= reg22;
              reg21 <= $unsigned($unsigned(reg18));
              reg22 <= reg15;
            end
          reg23 <= $unsigned((&((reg21[(3'h6):(2'h2)] ?
                  $unsigned((8'ha2)) : reg18) ?
              $signed((~reg18)) : reg18)));
          reg24 <= wire12[(5'h10):(4'h9)];
        end
      else
        begin
          reg15 <= $signed(reg15);
          reg16 <= $signed((-wire11));
          if ((reg20 + wire10))
            begin
              reg17 <= (($signed($unsigned({wire9,
                  reg16})) + ($signed($signed((8'ha3))) >= (reg19[(5'h13):(4'he)] ?
                  (^(8'hb6)) : $unsigned(reg23)))) >> ({reg17[(3'h4):(2'h3)]} ?
                  $unsigned(((~|wire13) ?
                      (!wire12) : (reg19 == reg21))) : (wire11 & (reg23[(4'h9):(1'h1)] ?
                      (reg15 >> reg15) : (+reg14)))));
              reg18 <= (+($signed(wire11[(3'h4):(2'h2)]) != (|wire13)));
              reg19 <= (reg14[(2'h2):(2'h2)] < ($unsigned(reg22[(5'h11):(3'h5)]) ?
                  (8'ha6) : ($signed(reg17) ?
                      reg22 : $unsigned(wire13[(1'h0):(1'h0)]))));
              reg20 <= ({$signed($signed(wire12[(3'h4):(1'h1)]))} + {(((reg21 ^~ reg16) >> $unsigned(reg24)) ?
                      (wire9[(1'h0):(1'h0)] + reg20) : {(^reg23)}),
                  reg24});
              reg21 <= $signed((|$unsigned(reg24[(3'h4):(1'h0)])));
            end
          else
            begin
              reg17 <= $unsigned(reg21);
              reg18 <= (-reg23[(3'h5):(2'h2)]);
              reg19 <= reg23[(3'h5):(2'h3)];
              reg20 <= ($signed($unsigned({((8'hb4) <<< reg24)})) ?
                  ($signed(wire10) ?
                      $signed({$signed(reg21),
                          reg18[(1'h1):(1'h0)]}) : wire11[(3'h4):(2'h2)]) : wire12[(1'h1):(1'h1)]);
              reg21 <= (reg24[(3'h4):(3'h4)] <<< ((^~((reg22 ?
                          wire9 : (8'ha6)) ?
                      $signed(reg24) : $signed(wire11))) ?
                  {{wire10[(3'h5):(3'h5)], (reg23 ? wire10 : reg18)},
                      $signed($unsigned(reg19))} : $signed(reg14[(1'h0):(1'h0)])));
            end
          reg22 <= (((^($signed(reg23) >> (wire13 || wire11))) ?
                  (((~^wire10) ?
                      $signed(reg23) : (reg21 ?
                          reg16 : reg18)) + wire11) : ($signed(reg22) || (wire13 ?
                      $unsigned(reg21) : (+wire9)))) ?
              (($signed({wire10}) ?
                      reg20[(3'h7):(3'h4)] : $unsigned((reg17 != wire10))) ?
                  $signed(reg22[(2'h2):(2'h2)]) : $unsigned((reg14 ?
                      (wire13 ? reg14 : reg23) : {wire11, (8'ha7)}))) : reg18);
        end
      reg25 <= ($signed((((reg23 <<< reg22) >= ((8'ha9) ?
              (8'haf) : reg23)) << {reg23[(5'h10):(4'hd)]})) ?
          wire10 : wire11);
      if ((~^($unsigned(reg18) ?
          ($signed($unsigned((8'hba))) < reg20) : reg23[(2'h2):(1'h0)])))
        begin
          if (({$unsigned($unsigned((~^reg19)))} ~^ $signed(($unsigned($unsigned(reg21)) & $unsigned(reg23[(5'h12):(3'h6)])))))
            begin
              reg26 <= reg18[(3'h4):(2'h2)];
              reg27 <= ($unsigned((($unsigned(wire11) < reg16) * (!(reg20 + reg26)))) >> $signed(($unsigned((~&reg14)) ?
                  (wire12 ?
                      wire10 : (!(8'hbe))) : (((8'ha0) ^ reg24) && reg20[(4'h9):(3'h4)]))));
              reg28 <= wire13[(2'h3):(1'h0)];
              reg29 <= ($signed($unsigned(reg14)) ?
                  reg20 : wire10[(2'h3):(2'h2)]);
              reg30 <= (~|((!$unsigned((reg29 + wire13))) && $unsigned($unsigned($unsigned(wire13)))));
            end
          else
            begin
              reg26 <= (reg28 ? (!reg23) : $signed(reg27[(3'h4):(1'h0)]));
              reg27 <= {(-$unsigned(($unsigned(wire12) ~^ reg26[(3'h5):(2'h2)])))};
              reg28 <= $unsigned(reg17[(3'h5):(2'h3)]);
              reg29 <= $signed((-$signed((reg15[(3'h5):(3'h5)] * (|(8'h9f))))));
            end
          reg31 <= (!{reg21});
        end
      else
        begin
          if ({(~^reg25[(2'h3):(2'h2)]),
              ((reg30 <<< reg18[(1'h0):(1'h0)]) ?
                  $unsigned(reg15) : {{(~^reg28)},
                      $unsigned((reg21 ? reg22 : reg28))})})
            begin
              reg26 <= $unsigned((~&(reg20 << ((reg29 ?
                  reg19 : reg18) < (wire13 ? (8'ha0) : wire12)))));
            end
          else
            begin
              reg26 <= (reg27[(5'h10):(3'h6)] ?
                  $signed(((~$signed(reg29)) ?
                      wire9[(2'h2):(1'h1)] : $unsigned((reg25 ?
                          reg23 : reg24)))) : wire9);
              reg27 <= wire13[(2'h2):(2'h2)];
              reg28 <= $signed(reg23[(3'h6):(3'h5)]);
              reg29 <= ((~&{{reg25},
                  $signed((reg27 ?
                      reg18 : reg20))}) < {$signed($signed($signed(reg18))),
                  $signed($unsigned((&wire11)))});
            end
          reg30 <= {(reg20 || {reg16[(2'h3):(2'h2)]})};
        end
      reg32 <= ($unsigned($signed({$signed((8'ha0))})) ?
          ((reg20 << $signed((wire11 != reg21))) <= ($signed((reg27 == reg23)) ?
              reg21 : reg29[(2'h2):(1'h0)])) : $signed($signed($unsigned((|reg17)))));
    end
  assign wire33 = reg25[(1'h0):(1'h0)];
  assign wire34 = ((reg31[(4'hd):(1'h0)] >> wire10[(1'h1):(1'h0)]) != ({$signed(reg22),
                          ($unsigned((7'h43)) * (reg28 ? reg21 : (8'had)))} ?
                      (((reg29 <<< reg17) ? $unsigned(reg32) : wire9) ?
                          $unsigned($unsigned(wire33)) : (~$unsigned((8'hb5)))) : $unsigned((~&$unsigned(reg21)))));
  assign wire35 = reg26[(4'h9):(4'h8)];
  assign wire36 = reg31;
  always
    @(posedge clk) begin
      if ((~^reg24))
        begin
          reg37 <= (({reg20[(3'h4):(2'h3)]} ?
              wire36 : reg21[(3'h5):(1'h1)]) > (wire10[(3'h6):(3'h6)] + (~|(reg25[(2'h2):(1'h0)] ?
              (reg26 ? reg32 : wire13) : ((8'h9d) ? reg22 : (8'hb6))))));
          if (wire35)
            begin
              reg38 <= ((~$signed($unsigned((reg22 ^ (8'hb1))))) ?
                  $unsigned($unsigned($signed((-reg23)))) : $unsigned({$signed(reg28[(3'h5):(2'h3)]),
                      reg30}));
              reg39 <= {wire11};
              reg40 <= (($signed($signed(reg18)) ?
                  $signed($signed(wire12[(4'hd):(3'h5)])) : reg27[(5'h13):(4'hd)]) ~^ wire36[(1'h1):(1'h1)]);
              reg41 <= $signed($signed({reg30[(2'h3):(1'h0)],
                  ({reg39, wire9} ? $unsigned(wire10) : (^~reg14))}));
            end
          else
            begin
              reg38 <= wire36[(2'h2):(1'h1)];
            end
        end
      else
        begin
          if (($signed($signed($unsigned(reg31[(1'h1):(1'h1)]))) ?
              (|(8'hbb)) : $unsigned(reg22)))
            begin
              reg37 <= (((($unsigned(reg17) ?
                          $unsigned((8'h9f)) : (8'hb5)) || $unsigned($unsigned(reg27))) ?
                      (wire9[(2'h3):(1'h1)] > ($signed(wire9) ?
                          $signed(wire9) : reg32[(1'h0):(1'h0)])) : $unsigned(reg21)) ?
                  {{reg41[(2'h2):(1'h1)],
                          (-reg18[(3'h4):(1'h0)])}} : wire35[(3'h5):(2'h2)]);
            end
          else
            begin
              reg37 <= reg24[(1'h1):(1'h0)];
              reg38 <= $unsigned(({{$signed(wire13)}} | (($unsigned(reg14) >>> $unsigned(wire11)) ?
                  $unsigned(reg39[(3'h5):(1'h1)]) : wire12)));
              reg39 <= $unsigned(((($unsigned(wire36) ?
                      $unsigned(reg28) : $signed(wire10)) && ($unsigned(reg24) < {reg39})) ?
                  reg15[(2'h3):(1'h0)] : ((~$unsigned((8'hbe))) == (&(reg22 ?
                      reg23 : reg21)))));
              reg40 <= $unsigned($unsigned((($unsigned(wire11) ?
                  {reg29, wire10} : $signed(reg21)) * $signed({reg29,
                  (8'hab)}))));
              reg41 <= $unsigned(reg37);
            end
          reg42 <= reg32;
          if ((~^reg16[(2'h3):(2'h2)]))
            begin
              reg43 <= ({(reg38[(1'h0):(1'h0)] >= (wire11[(2'h2):(2'h2)] >> reg22))} ?
                  reg18[(3'h6):(2'h3)] : ((~^wire12) ?
                      ($signed(reg24[(1'h0):(1'h0)]) | ($unsigned(wire9) + (reg38 && reg29))) : reg25));
              reg44 <= wire13[(1'h1):(1'h1)];
              reg45 <= (reg17 - (+wire33));
            end
          else
            begin
              reg43 <= (-$signed((8'ha2)));
              reg44 <= reg37[(3'h7):(1'h1)];
              reg45 <= $signed((&({$unsigned(wire9),
                  $unsigned(reg24)} == wire13[(1'h0):(1'h0)])));
              reg46 <= reg31[(4'hb):(2'h3)];
            end
        end
      reg47 <= (reg39 < (|(!$signed((wire13 >>> wire33)))));
      reg48 <= $signed((!$signed($signed(reg40[(4'ha):(1'h1)]))));
      if (reg25[(1'h0):(1'h0)])
        begin
          reg49 <= $unsigned($signed(reg28));
        end
      else
        begin
          reg49 <= reg19[(5'h14):(4'h8)];
          reg50 <= wire35[(3'h5):(3'h5)];
          reg51 <= reg25[(1'h0):(1'h0)];
        end
    end
  assign wire52 = (^~$signed((reg29 ? (8'hbd) : reg24)));
  assign wire53 = $unsigned(wire9[(2'h3):(2'h3)]);
  module54 #() modinst81 (wire80, clk, reg29, reg38, reg20, reg28);
  assign wire82 = ((({wire13[(1'h0):(1'h0)]} ? reg47 : $signed(reg26)) ?
                          (reg50[(1'h1):(1'h1)] ?
                              (8'ha1) : $signed({(8'hbb), wire33})) : wire9) ?
                      $unsigned((~^$signed(((8'hbd) ?
                          reg29 : (7'h41))))) : ($signed(($signed(wire34) ?
                              wire13 : $unsigned(reg21))) ?
                          (reg46 <<< ($unsigned(reg49) ?
                              (reg21 < (8'had)) : (+wire33))) : reg49[(1'h0):(1'h0)]));
endmodule

module module54
#(parameter param79 = ({((-((7'h43) ? (8'hbb) : (8'hb2))) ? (+((7'h41) ? (8'ha1) : (8'h9d))) : {((8'ha3) ? (8'ha0) : (8'h9f))})} || (~|{({(8'hb1), (8'hbc)} ? (~(8'ha6)) : {(8'hbc)})})))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire58;
  input wire signed [(3'h6):(1'h0)] wire57;
  input wire [(4'hb):(1'h0)] wire56;
  input wire [(4'h9):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(4'hb):(1'h0)] wire77;
  wire [(4'hc):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire62;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(4'h8):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
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
                 (1'h0)};
  assign wire59 = (((|(((8'ha3) ^ wire56) != wire55[(3'h5):(1'h0)])) > $unsigned((wire56[(3'h7):(2'h2)] ?
                      (8'ha6) : wire57))) ^ $signed($signed($unsigned($signed(wire56)))));
  assign wire60 = $unsigned((((wire56 ? $unsigned(wire56) : $unsigned(wire56)) ?
                      wire59[(1'h0):(1'h0)] : wire58[(3'h6):(2'h3)]) != {wire55[(1'h1):(1'h1)]}));
  assign wire61 = ((^(~|(|$unsigned((8'hb9))))) ~^ $unsigned((8'ha5)));
  assign wire62 = (((((8'h9d) | $signed(wire59)) | ($unsigned(wire60) ?
                              (wire57 ?
                                  wire56 : (8'ha2)) : (wire56 >>> (8'hab)))) ?
                          $unsigned((-(~(8'ha3)))) : (wire59[(1'h0):(1'h0)] <<< $unsigned({wire60}))) ?
                      $signed(({{wire58}} ?
                          ((^wire61) >> ((7'h44) ?
                              wire59 : wire61)) : (8'hba))) : (^{wire57[(2'h2):(1'h1)],
                          $unsigned($signed(wire57))}));
  assign wire63 = wire55[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg64 <= (|$signed(($unsigned($signed(wire59)) ?
          (&(wire63 >= wire60)) : wire61[(5'h10):(1'h0)])));
      if (($unsigned((wire62 != $unsigned($unsigned(wire55)))) ?
          $signed($signed(($unsigned(wire57) && (wire59 ~^ (8'hb3))))) : {$unsigned({$signed(wire59),
                  (wire62 != (8'hb0))}),
              wire59}))
        begin
          reg65 <= {wire60[(3'h7):(1'h1)],
              ((^($signed(wire60) && $unsigned(wire57))) ?
                  $signed((wire55 ?
                      (wire55 <<< wire63) : (wire57 - wire59))) : wire63[(3'h4):(3'h4)])};
          reg66 <= wire61[(1'h0):(1'h0)];
          reg67 <= (wire58[(3'h4):(2'h2)] != reg65[(1'h0):(1'h0)]);
          reg68 <= wire55[(4'h8):(1'h0)];
        end
      else
        begin
          if ($unsigned(({reg67} ?
              (((^~reg67) ?
                  ((8'ha3) || wire58) : wire61[(3'h7):(3'h6)]) >>> (8'had)) : (((+wire56) == (~^reg64)) ?
                  ((wire60 ? wire59 : wire56) ?
                      $unsigned(wire63) : wire60) : reg65[(1'h0):(1'h0)]))))
            begin
              reg65 <= reg68;
              reg66 <= (^~$unsigned(reg64[(1'h1):(1'h1)]));
              reg67 <= ((~^(!wire57[(2'h3):(1'h1)])) ?
                  $signed({(8'h9c)}) : reg64);
            end
          else
            begin
              reg65 <= (wire61[(3'h6):(1'h1)] < ((reg64 << (~(~&wire55))) || ({(reg67 ?
                          (8'hac) : reg66),
                      (wire63 ? reg66 : wire57)} ?
                  ((!reg67) ?
                      wire59[(3'h5):(2'h3)] : reg67) : $signed($unsigned(wire58)))));
              reg66 <= $unsigned($unsigned((-$signed(reg64))));
            end
          reg68 <= $signed({reg65[(1'h1):(1'h1)], wire61});
          reg69 <= wire63;
          if (reg67[(4'hd):(1'h1)])
            begin
              reg70 <= {{$unsigned(($unsigned(wire59) << wire62))},
                  $signed($signed({((8'ha2) ^ wire63)}))};
            end
          else
            begin
              reg70 <= reg64;
              reg71 <= ((&wire58) | ((reg67[(4'hb):(3'h4)] ?
                  {wire62[(4'hb):(4'h9)], $signed(reg65)} : ((reg67 ?
                      wire55 : wire61) ~^ (reg65 >> wire57))) * (&wire55)));
              reg72 <= (~^(^~$signed((~|(&wire62)))));
              reg73 <= $signed($signed(wire56[(1'h0):(1'h0)]));
              reg74 <= $signed($unsigned((~^$unsigned((wire63 ?
                  wire61 : (8'ha7))))));
            end
          reg75 <= ($signed(wire56) > $signed(reg68));
        end
    end
  assign wire76 = ($signed(reg74) + $unsigned((((~reg70) >>> (8'haa)) | reg68[(4'h8):(2'h2)])));
  assign wire77 = (($unsigned($unsigned((wire57 ? reg70 : (8'hbe)))) ?
                      ($signed((reg65 | reg64)) & $unsigned((reg70 ?
                          reg67 : wire57))) : (($unsigned(reg72) > (^~wire55)) + $signed(wire56))) ~^ wire76);
  assign wire78 = ((!$unsigned($unsigned((reg73 * reg70)))) * $signed(($unsigned((wire77 && reg69)) ?
                      $unsigned($signed(wire60)) : ((wire60 ^~ wire77) ^~ $unsigned(wire57)))));
endmodule

module module121
#(parameter param190 = (((!({(8'ha4), (8'ha5)} ? ((7'h40) ? (8'hb1) : (8'h9f)) : (-(8'hb5)))) ? (((~&(8'ha3)) ? ((8'hbb) - (8'hbd)) : (~(8'hb5))) << (((7'h41) ? (8'had) : (8'ha8)) + {(8'hb9), (7'h44)})) : (^~(((8'hb3) && (8'ha3)) | ((8'h9e) || (8'hb4))))) >= (|((~&(^(8'h9e))) ? (&((8'hb2) >= (8'h9e))) : (((8'hbe) ? (8'ha3) : (8'h9c)) ? (8'ha4) : ((8'hbc) && (8'ha7)))))))
(y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h2fc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire125;
  input wire [(4'he):(1'h0)] wire124;
  input wire signed [(4'hb):(1'h0)] wire123;
  input wire signed [(4'ha):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire189;
  wire signed [(4'h8):(1'h0)] wire188;
  wire [(4'hb):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire155;
  wire [(5'h10):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire151;
  wire signed [(4'h9):(1'h0)] wire150;
  wire signed [(3'h7):(1'h0)] wire149;
  wire [(4'hf):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire147;
  wire [(4'h9):(1'h0)] wire132;
  wire [(5'h13):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire [(3'h5):(1'h0)] wire129;
  wire signed [(3'h4):(1'h0)] wire128;
  wire signed [(4'ha):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire126;
  reg signed [(5'h11):(1'h0)] reg187 = (1'h0);
  reg [(4'hb):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg182 = (1'h0);
  reg [(2'h2):(1'h0)] reg181 = (1'h0);
  reg [(5'h12):(1'h0)] reg180 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg169 = (1'h0);
  reg [(4'hc):(1'h0)] reg168 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg167 = (1'h0);
  reg [(4'hd):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(5'h12):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg142 = (1'h0);
  reg [(4'h9):(1'h0)] reg141 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(4'he):(1'h0)] reg139 = (1'h0);
  reg [(4'ha):(1'h0)] reg138 = (1'h0);
  reg [(5'h10):(1'h0)] reg137 = (1'h0);
  reg [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire179,
                 wire155,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
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
                 reg158,
                 reg157,
                 reg156,
                 reg154,
                 reg153,
                 reg146,
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
                 (1'h0)};
  assign wire126 = wire123;
  assign wire127 = (((({wire126, wire123} ?
                                   $signed((8'hb9)) : wire125[(3'h6):(3'h4)]) ?
                               ((7'h44) <<< $signed(wire126)) : $unsigned((wire125 == wire125))) ?
                           $signed({(^~wire123)}) : wire125[(1'h0):(1'h0)]) ?
                       $unsigned(wire123[(1'h1):(1'h1)]) : {$signed({(wire123 ?
                                   wire124 : (8'ha0)),
                               $unsigned(wire126)})});
  assign wire128 = (~&$unsigned((+((+wire122) ? (|wire122) : (~^wire124)))));
  assign wire129 = $unsigned(wire128);
  assign wire130 = {wire126[(4'hc):(3'h4)], wire122[(1'h0):(1'h0)]};
  assign wire131 = ($unsigned((~&wire130[(3'h7):(1'h1)])) < (~&wire124));
  assign wire132 = wire122[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg133 <= $unsigned((($signed((wire127 + wire124)) ?
          $unsigned((!wire123)) : (wire125 ?
              ((8'h9f) ?
                  wire127 : wire132) : (&wire125))) > ((~&wire123[(4'hb):(2'h3)]) <<< ((wire132 ?
              wire129 : wire126) ?
          wire122 : (wire130 ? (8'hac) : wire123)))));
      reg134 <= wire125[(3'h6):(1'h1)];
      if ($unsigned($unsigned($unsigned(wire127))))
        begin
          reg135 <= ($signed({(~&wire130)}) ?
              $unsigned((($signed(wire131) <= wire126[(3'h7):(2'h2)]) ?
                  ($unsigned(wire125) ?
                      $signed(wire131) : (+wire122)) : ((wire123 ?
                      wire130 : (8'ha3)) * (wire125 ?
                      wire127 : wire123)))) : (~^(+{(~|wire124), (~wire125)})));
        end
      else
        begin
          reg135 <= {{{{(~&reg133), reg135}, $signed($unsigned(wire127))},
                  $unsigned(wire127[(4'h9):(3'h5)])},
              $unsigned(((~^(8'ha1)) ?
                  wire132[(1'h0):(1'h0)] : ($unsigned(wire129) | wire132)))};
          reg136 <= ((8'ha2) >>> wire131);
          reg137 <= wire123;
          if (wire125[(4'h8):(3'h6)])
            begin
              reg138 <= $unsigned($signed((|wire126)));
              reg139 <= (wire122 ?
                  $signed($unsigned($unsigned((reg137 <<< wire132)))) : reg134[(3'h7):(2'h3)]);
            end
          else
            begin
              reg138 <= $unsigned(reg137);
              reg139 <= ({$unsigned(reg139[(4'h9):(3'h7)]),
                  wire132[(3'h7):(1'h1)]} * wire123[(1'h0):(1'h0)]);
              reg140 <= wire131[(4'h9):(1'h0)];
              reg141 <= (wire129[(3'h5):(3'h4)] ?
                  reg140[(1'h1):(1'h0)] : reg135);
            end
          if (wire131)
            begin
              reg142 <= reg134[(4'h8):(1'h1)];
              reg143 <= (+$signed($unsigned(reg133[(2'h2):(2'h2)])));
              reg144 <= $unsigned($signed($signed(((wire122 ? reg135 : reg138) ?
                  (wire128 ? (8'hba) : (8'ha7)) : (wire123 ^ wire132)))));
            end
          else
            begin
              reg142 <= (~^(wire127[(2'h2):(1'h1)] ^~ (~^{(wire131 ?
                      wire122 : wire128)})));
            end
        end
      reg145 <= wire132;
      reg146 <= (|$signed((+(wire122 ?
          (reg141 ? reg142 : reg141) : (reg143 ? wire127 : reg135)))));
    end
  assign wire147 = $signed(reg142);
  assign wire148 = (|(reg133 >= wire124));
  assign wire149 = $signed(reg133[(2'h2):(1'h1)]);
  assign wire150 = wire129[(1'h1):(1'h0)];
  assign wire151 = $signed((($unsigned((|reg135)) ?
                           reg142[(1'h0):(1'h0)] : ((reg134 ?
                               reg142 : wire130) || reg141[(3'h7):(1'h0)])) ?
                       ((|wire125[(4'h8):(3'h6)]) ?
                           reg134 : $unsigned({wire129})) : $signed($signed((reg134 & wire150)))));
  assign wire152 = reg138[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg153 <= wire124;
    end
  always
    @(posedge clk) begin
      reg154 <= (^{{wire122[(3'h6):(3'h6)], {$unsigned(wire152)}},
          {($unsigned(wire132) ? (+reg135) : $unsigned((8'h9e)))}});
    end
  assign wire155 = $unsigned((+reg140[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire124)
        begin
          reg156 <= (($signed(($signed(reg135) < (wire148 ?
                  wire124 : reg139))) ?
              (wire129 ?
                  ((wire130 ?
                      reg133 : wire147) ^~ (~&(7'h42))) : wire125[(3'h5):(1'h1)]) : $unsigned((!wire129))) ^~ ((^~reg153) ?
              {(&reg138[(2'h3):(2'h2)])} : reg139));
          reg157 <= $signed($unsigned((~&$unsigned(wire155))));
          if ($unsigned((^~(~&reg138))))
            begin
              reg158 <= (wire128[(1'h0):(1'h0)] ?
                  reg133 : $unsigned(wire124[(1'h0):(1'h0)]));
              reg159 <= $unsigned($unsigned((reg138 ?
                  $signed(reg135[(5'h11):(5'h11)]) : $signed(wire129[(1'h0):(1'h0)]))));
              reg160 <= ((!(^~reg146[(4'hb):(3'h6)])) ^ wire125);
              reg161 <= (|(~|wire132[(3'h5):(2'h3)]));
            end
          else
            begin
              reg158 <= $unsigned(((~&($signed(wire128) ?
                  (7'h43) : {reg133, reg153})) > $signed(reg161)));
            end
        end
      else
        begin
          reg156 <= (reg161 ?
              (~$signed($unsigned((8'hbc)))) : $unsigned((^({(8'had)} ~^ reg159[(2'h2):(1'h1)]))));
          reg157 <= $signed($unsigned(wire122[(2'h2):(2'h2)]));
          if (((~(7'h42)) ^ reg134))
            begin
              reg158 <= (~|({($unsigned(wire128) + {reg157}),
                      {reg143[(3'h6):(1'h0)], $unsigned(wire151)}} ?
                  $unsigned(((-wire129) ?
                      ((7'h40) >> reg153) : {reg146})) : wire126[(5'h12):(4'hd)]));
              reg159 <= (-reg137);
              reg160 <= ({($signed($signed(reg136)) ?
                      wire124[(3'h7):(3'h5)] : reg133)} ^ reg135[(4'hb):(4'ha)]);
            end
          else
            begin
              reg158 <= $unsigned(reg157[(1'h1):(1'h0)]);
              reg159 <= (wire151 * $unsigned({wire152[(3'h5):(3'h5)],
                  $unsigned((wire124 == (8'hbc)))}));
            end
        end
      if ((8'hbf))
        begin
          reg162 <= wire124;
        end
      else
        begin
          reg162 <= $signed((+reg137));
          reg163 <= wire125;
          reg164 <= $unsigned((~|(reg143[(3'h4):(1'h1)] ?
              (reg146 ? (&reg139) : reg146[(2'h3):(2'h2)]) : (|reg142))));
          reg165 <= (({($signed(wire126) >> ((7'h40) >>> (8'hba))),
              $unsigned($unsigned(reg163))} || (+(reg153[(3'h4):(1'h1)] ~^ $unsigned(wire129)))) == $unsigned(({$signed(wire127),
                  ((8'hb7) ~^ reg160)} ?
              reg145 : $signed(((8'hb2) ? wire126 : wire122)))));
        end
      reg166 <= (~^($signed(reg138[(3'h6):(1'h0)]) ?
          (wire122[(4'ha):(4'ha)] >= (~&(wire125 || reg153))) : (~&(~{wire127,
              wire125}))));
      reg167 <= $signed((+(~|((reg156 != reg143) ?
          (-(8'ha0)) : reg161[(1'h0):(1'h0)]))));
      if ((~(^$unsigned(((wire132 << reg135) ?
          ((8'hbe) ? reg137 : wire126) : wire151)))))
        begin
          if (reg135[(5'h11):(3'h7)])
            begin
              reg168 <= $unsigned((8'ha7));
              reg169 <= $unsigned((({(reg154 || wire148)} ?
                      $signed(reg146[(3'h4):(2'h2)]) : wire129) ?
                  reg144 : $unsigned(($unsigned(wire128) ?
                      reg167[(4'hc):(3'h4)] : $unsigned((8'hb4))))));
              reg170 <= ((wire129[(3'h5):(2'h3)] | (~|$signed($unsigned((8'h9f))))) ^~ $signed(((((8'ha1) ?
                          wire131 : reg144) ?
                      (+reg161) : (wire129 ? reg162 : reg136)) ?
                  wire132 : $signed($unsigned(wire129)))));
              reg171 <= $unsigned((!($signed((reg160 && (8'hb1))) ~^ ($signed(reg162) ?
                  $unsigned(wire148) : reg159[(2'h2):(1'h1)]))));
            end
          else
            begin
              reg168 <= $unsigned((~^(wire152 >= $unsigned($unsigned(reg133)))));
              reg169 <= ((!(({wire131} == wire155[(4'hc):(4'h8)]) ?
                  (^((7'h43) ? (7'h41) : (7'h42))) : ($unsigned(reg171) ?
                      (~|wire126) : {(8'ha6)}))) < wire128[(3'h4):(1'h1)]);
              reg170 <= wire147;
              reg171 <= reg154;
              reg172 <= reg137;
            end
          if ((|(-$unsigned(($unsigned(wire151) ?
              (reg165 << reg168) : (!reg146))))))
            begin
              reg173 <= wire148;
            end
          else
            begin
              reg173 <= reg167[(3'h4):(1'h0)];
              reg174 <= {(reg137[(2'h3):(2'h2)] ?
                      wire148[(2'h2):(1'h0)] : ({(reg144 ? reg173 : (8'h9d)),
                          ((7'h43) * wire152)} + $signed((~reg170)))),
                  $signed(((~|$unsigned(wire129)) ?
                      ({(8'hb6),
                          wire125} & (~reg137)) : (|reg145[(4'he):(2'h3)])))};
              reg175 <= ({{$unsigned($unsigned((8'hb4))),
                      reg168}} & ($signed($signed((8'ha6))) ?
                  $signed((reg161[(2'h2):(1'h0)] * (~reg158))) : (~^(^~(~|reg136)))));
              reg176 <= (~(&reg142[(1'h1):(1'h1)]));
              reg177 <= reg159[(2'h2):(2'h2)];
            end
          reg178 <= (-({$signed(reg172[(3'h6):(1'h0)])} ?
              wire150[(3'h6):(2'h2)] : ({reg146[(4'hb):(4'h9)],
                      (wire123 ? wire132 : reg138)} ?
                  (reg169[(1'h1):(1'h0)] >> $unsigned(reg140)) : (8'ha9))));
        end
      else
        begin
          reg168 <= ($signed($signed($signed($unsigned((8'ha2))))) * (^~reg141[(4'h9):(3'h4)]));
        end
    end
  assign wire179 = ((wire131[(1'h1):(1'h1)] ?
                       $unsigned(reg174) : $signed(((reg171 + reg175) < (+reg159)))) >= $signed((((7'h42) >= $unsigned(reg157)) ^~ reg139[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned($signed($unsigned(reg168))) && {{{(8'hae),
                  reg166},
              $signed(reg134)}})))
        begin
          reg180 <= {(!(+reg157[(1'h0):(1'h0)]))};
          if (wire123[(1'h1):(1'h1)])
            begin
              reg181 <= wire148;
            end
          else
            begin
              reg181 <= reg140[(3'h4):(3'h4)];
              reg182 <= (8'hab);
              reg183 <= $unsigned(((~(reg180[(5'h12):(2'h3)] < (reg177 > reg168))) ?
                  ((reg137[(4'h9):(3'h6)] ? (+reg176) : (8'hb1)) ?
                      $signed((!wire147)) : $unsigned((reg181 ?
                          wire155 : reg173))) : reg167));
              reg184 <= (reg173[(1'h0):(1'h0)] || ($signed($unsigned((reg145 >= reg137))) ?
                  wire128[(2'h3):(2'h2)] : reg176[(1'h0):(1'h0)]));
            end
          reg185 <= {wire131};
        end
      else
        begin
          reg180 <= {$signed(wire147[(5'h10):(4'h8)])};
          reg181 <= $unsigned(reg168);
          reg182 <= $signed(((wire126[(4'hd):(2'h2)] << ((wire179 ?
                  reg185 : wire179) >= {reg160, reg141})) ?
              reg156[(4'h8):(1'h0)] : (reg169 ?
                  wire126[(5'h11):(4'hb)] : $unsigned($unsigned((8'haa))))));
        end
      reg186 <= $unsigned((~|{(~|$unsigned((8'hbd))),
          (reg144 ~^ $unsigned(wire179))}));
      reg187 <= (reg186 ?
          (&$unsigned($unsigned($unsigned(wire148)))) : $unsigned(reg173[(3'h7):(2'h3)]));
    end
  assign wire188 = {wire127};
  assign wire189 = {wire179};
endmodule
