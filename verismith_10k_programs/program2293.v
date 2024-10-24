module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h27c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire251;
  wire [(5'h13):(1'h0)] wire243;
  wire [(4'ha):(1'h0)] wire198;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire217;
  wire signed [(5'h11):(1'h0)] wire219;
  wire signed [(4'he):(1'h0)] wire221;
  wire [(4'hf):(1'h0)] wire236;
  wire signed [(4'hf):(1'h0)] wire237;
  wire [(3'h4):(1'h0)] wire238;
  wire signed [(5'h11):(1'h0)] wire239;
  wire signed [(5'h10):(1'h0)] wire241;
  wire signed [(5'h14):(1'h0)] wire245;
  wire [(5'h10):(1'h0)] wire246;
  wire signed [(5'h11):(1'h0)] wire247;
  wire [(3'h4):(1'h0)] wire248;
  wire signed [(3'h6):(1'h0)] wire249;
  reg [(3'h5):(1'h0)] reg216 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg215 = (1'h0);
  reg [(2'h2):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg213 = (1'h0);
  reg [(5'h11):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg211 = (1'h0);
  reg [(2'h2):(1'h0)] reg210 = (1'h0);
  reg [(5'h12):(1'h0)] reg209 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg208 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg207 = (1'h0);
  reg [(5'h10):(1'h0)] reg206 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg204 = (1'h0);
  reg signed [(4'he):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg202 = (1'h0);
  reg [(3'h5):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg223 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg226 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg227 = (1'h0);
  reg [(5'h11):(1'h0)] reg228 = (1'h0);
  reg [(3'h6):(1'h0)] reg229 = (1'h0);
  reg [(3'h6):(1'h0)] reg230 = (1'h0);
  reg [(4'he):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg232 = (1'h0);
  reg [(5'h13):(1'h0)] reg233 = (1'h0);
  reg [(5'h10):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg235 = (1'h0);
  assign y = {wire251,
                 wire243,
                 wire198,
                 wire58,
                 wire217,
                 wire219,
                 wire221,
                 wire236,
                 wire237,
                 wire238,
                 wire239,
                 wire241,
                 wire245,
                 wire246,
                 wire247,
                 wire248,
                 wire249,
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
                 reg223,
                 reg224,
                 reg225,
                 reg226,
                 reg227,
                 reg228,
                 reg229,
                 reg230,
                 reg231,
                 reg232,
                 reg233,
                 reg234,
                 reg235,
                 (1'h0)};
  module4 #() modinst59 (wire58, clk, wire3, wire2, wire1, wire0, (8'h9c));
  module60 #() modinst199 (wire198, clk, wire58, wire1, wire3, wire2, wire0);
  always
    @(posedge clk) begin
      if ((^$signed(wire3[(5'h10):(3'h4)])))
        begin
          reg200 <= $unsigned((+wire3[(1'h1):(1'h0)]));
          reg201 <= (~^{(8'hbb),
              ({((8'had) ? (7'h44) : wire58)} <<< ($unsigned(wire0) & (wire3 ?
                  wire3 : (8'hb4))))});
        end
      else
        begin
          reg200 <= (wire3 ?
              $signed((reg200 - wire3)) : (^~(((8'ha8) | (wire2 ?
                      reg200 : reg200)) ?
                  (^(~&wire0)) : $signed($signed(wire198)))));
        end
      if ({$unsigned(({$signed(wire58)} & wire58[(4'hf):(1'h1)])), (~&reg201)})
        begin
          reg202 <= (wire3[(4'he):(4'hc)] + (~^$unsigned({wire1[(4'he):(1'h0)]})));
        end
      else
        begin
          reg202 <= (wire0 << ($signed({wire58,
              {wire2}}) ^ $unsigned({wire198[(4'h8):(3'h7)]})));
          reg203 <= {$unsigned($signed($signed((wire2 ? reg201 : wire58)))),
              wire0};
        end
      reg204 <= (^~$signed(wire0[(4'hd):(3'h4)]));
      if ({{$unsigned($unsigned(wire3[(4'hb):(2'h3)]))},
          ($signed($signed($unsigned(reg201))) ?
              ($signed($unsigned(wire3)) ?
                  reg201 : ((-wire3) + reg203[(4'h8):(4'h8)])) : (|((|wire58) ?
                  (~&wire1) : (wire2 < (8'hb7)))))})
        begin
          if (((!$unsigned((reg202 ? (wire198 ? wire2 : reg204) : {reg200}))) ?
              $unsigned((|reg203)) : (((~|reg204) && $signed(wire3)) << wire2[(3'h4):(1'h1)])))
            begin
              reg205 <= (&reg201[(1'h1):(1'h1)]);
              reg206 <= reg204[(3'h7):(1'h0)];
            end
          else
            begin
              reg205 <= reg206[(3'h5):(2'h3)];
              reg206 <= (~&(reg202 == reg202));
              reg207 <= reg205;
            end
          reg208 <= wire3[(4'hc):(2'h2)];
          reg209 <= ((((8'ha0) - (8'hb2)) && ($signed(reg201) ?
              (~&$signed(reg208)) : (&$unsigned((8'hb4))))) & (8'had));
          reg210 <= (((8'hba) >> $unsigned((reg209 == (&(8'hb4))))) ?
              wire198[(4'h8):(3'h4)] : {{$unsigned($signed(reg204))}});
          if (($unsigned(((^~$signed(wire198)) ?
                  reg206[(2'h3):(1'h1)] : {(wire58 != (8'hb4))})) ?
              (wire1 ?
                  (($signed((7'h43)) ? (reg205 * reg208) : reg202) ?
                      $unsigned({reg204,
                          reg204}) : (~^reg203)) : reg205) : $unsigned($signed($signed((~reg209))))))
            begin
              reg211 <= $unsigned($signed($signed($signed({(8'h9c), reg201}))));
              reg212 <= $signed(($unsigned(reg202[(4'h9):(3'h4)]) | $signed(reg211)));
              reg213 <= $unsigned((!(((8'haa) ?
                      (wire2 - reg212) : $unsigned(reg204)) ?
                  $unsigned({(8'hbe), wire58}) : reg205[(1'h1):(1'h0)])));
            end
          else
            begin
              reg211 <= $signed((|(|{wire0[(2'h2):(2'h2)]})));
              reg212 <= (8'hbf);
              reg213 <= reg204;
              reg214 <= (((!{(~|reg210),
                      reg208}) << (~&((reg206 - (8'ha5)) | $signed(wire58)))) ?
                  $unsigned(($signed($signed(reg212)) ?
                      (reg208 ?
                          reg211 : wire1[(4'hf):(3'h7)]) : wire198)) : (~|reg209));
              reg215 <= (($signed((reg206 + (^~reg211))) ?
                  $unsigned(wire1) : (~((~&reg204) ?
                      reg204 : (+wire0)))) | $unsigned($unsigned($unsigned($unsigned(reg212)))));
            end
        end
      else
        begin
          if ((^(8'hbc)))
            begin
              reg205 <= (wire3 <= (reg208[(1'h0):(1'h0)] < reg208[(1'h0):(1'h0)]));
              reg206 <= reg215[(2'h2):(2'h2)];
              reg207 <= (((($unsigned((8'hba)) + reg204) != ((~^wire0) ?
                          $unsigned(reg213) : reg205)) ?
                      ($signed(reg208[(1'h1):(1'h1)]) <<< reg213) : (reg202 ?
                          {$signed((8'hb2)),
                              (~&reg212)} : $signed((!wire198)))) ?
                  (-reg206[(2'h3):(1'h0)]) : $unsigned(((|((8'ha2) != reg212)) && reg201)));
              reg208 <= $signed($signed((^{((8'hbb) ? (8'hb4) : reg211),
                  (reg212 ? (8'h9f) : reg213)})));
              reg209 <= (~|(((8'hbf) ?
                      $signed($unsigned(reg206)) : (~(reg201 > reg208))) ?
                  reg207 : $unsigned(reg207)));
            end
          else
            begin
              reg205 <= $signed((^$unsigned({(reg206 ^~ wire0),
                  (reg212 ? reg211 : wire58)})));
              reg206 <= (-(|(reg201[(1'h0):(1'h0)] != ((+wire198) || (^reg208)))));
            end
          if ($signed((($unsigned((~|wire3)) ^ reg213) ?
              reg212[(3'h7):(1'h1)] : ($signed(wire58) ?
                  (((8'hb8) == reg213) ?
                      $unsigned(reg215) : reg212[(4'h9):(2'h2)]) : reg204))))
            begin
              reg210 <= (~&($signed($unsigned((|wire2))) ?
                  $unsigned((~^(reg204 ?
                      reg210 : reg210))) : $signed($signed((~&reg203)))));
              reg211 <= (wire198 < (((8'hb0) ?
                  (((8'hbe) + reg211) ?
                      $unsigned(wire1) : reg209) : wire58) == reg202[(4'h8):(3'h4)]));
              reg212 <= {(+reg204), wire3[(4'hd):(2'h2)]};
            end
          else
            begin
              reg210 <= wire198;
              reg211 <= (8'h9e);
              reg212 <= ((($unsigned((reg205 ? reg214 : (8'hbd))) ?
                  reg201[(3'h5):(3'h4)] : ($signed(reg213) - {wire0})) >> reg210[(2'h2):(1'h1)]) ^ reg202);
            end
        end
      reg216 <= wire0;
    end
  module4 #() modinst218 (wire217, clk, reg200, wire198, reg203, reg205, wire2);
  module14 #() modinst220 (wire219, clk, reg213, reg216, reg209, reg204, reg206);
  module4 #() modinst222 (.wire6(wire219), .wire5(wire3), .y(wire221), .clk(clk), .wire8(reg211), .wire7(reg202), .wire9(reg212));
  always
    @(posedge clk) begin
      if (reg214[(1'h0):(1'h0)])
        begin
          if ($signed(((|$unsigned({reg200})) * reg204[(2'h2):(2'h2)])))
            begin
              reg223 <= reg200[(4'ha):(2'h3)];
              reg224 <= reg213[(5'h11):(3'h6)];
              reg225 <= $signed(reg203[(4'hb):(4'hb)]);
              reg226 <= (reg225[(4'ha):(3'h4)] ?
                  (~((~&wire1) ?
                      $unsigned((reg223 ?
                          (8'hb5) : wire221)) : reg202[(1'h1):(1'h0)])) : wire219[(4'hf):(3'h7)]);
              reg227 <= wire3;
            end
          else
            begin
              reg223 <= reg224;
              reg224 <= $unsigned($signed($signed($unsigned((reg213 <= (8'hb3))))));
            end
          reg228 <= wire1;
          reg229 <= wire0;
          reg230 <= reg209;
          reg231 <= ($unsigned(reg228[(4'hb):(1'h0)]) ?
              wire2 : (^reg202[(3'h6):(3'h4)]));
        end
      else
        begin
          reg223 <= (8'hb6);
        end
      reg232 <= reg202;
      reg233 <= $signed({reg204[(3'h5):(2'h2)], reg205});
    end
  always
    @(posedge clk) begin
      reg234 <= (((reg224 ?
              $signed($unsigned(reg226)) : ((-reg205) ?
                  {reg203} : ((7'h43) ^ wire1))) == (|$signed($signed(reg205)))) ?
          $signed(((^~(reg211 ? (8'ha6) : reg229)) ^ wire0)) : reg231);
      reg235 <= {(-reg209), $unsigned(reg228)};
    end
  assign wire236 = $unsigned((^reg224[(4'h8):(3'h4)]));
  assign wire237 = reg200[(4'hf):(4'hd)];
  assign wire238 = (^(-$unsigned($signed(reg226))));
  module102 #() modinst240 (wire239, clk, wire237, wire3, reg209, reg233);
  module68 #() modinst242 (wire241, clk, reg204, reg228, reg200, wire217);
  module68 #() modinst244 (wire243, clk, reg208, reg212, wire219, reg229);
  assign wire245 = (|(({(wire0 ?
                               reg230 : wire221)} != (~reg200[(3'h5):(1'h0)])) ?
                       (^~($signed(reg212) ?
                           (~&reg204) : (wire217 - wire58))) : (reg216[(1'h1):(1'h1)] ?
                           ($signed((8'ha4)) ?
                               (reg227 ? reg224 : reg225) : (8'hbd)) : ({reg233,
                                   (8'ha5)} ?
                               reg206 : {reg235}))));
  assign wire246 = (($signed(((reg232 ? wire238 : reg226) ?
                       (~&reg227) : $signed(wire219))) > (reg206 ?
                       (~$signed(reg227)) : $signed((reg212 > (8'hb6))))) >> reg215[(4'hb):(4'h9)]);
  assign wire247 = (~$unsigned((+(wire245 ?
                       {reg205, wire239} : $unsigned((8'hb3))))));
  assign wire248 = ($unsigned((+reg211)) << (wire246 | ({$signed(wire246),
                       (~|(7'h42))} ^~ (7'h41))));
  module102 #() modinst250 (.wire106(wire198), .wire103(reg202), .y(wire249), .clk(clk), .wire105(reg232), .wire104(reg231));
  assign wire251 = reg200;
endmodule

module module60
#(parameter param196 = ((((~|(~&(8'hb3))) ? {((8'hb6) < (8'ha1)), ((8'h9c) - (8'hb4))} : (((8'ha5) ^~ (8'ha8)) - ((8'h9e) ? (7'h43) : (8'ha3)))) >> (8'hb9)) >>> ((({(8'hab), (8'hbf)} == (^~(8'h9d))) ? ({(8'hb2)} ? (8'ha6) : (&(8'ha5))) : (8'ha9)) ? ({{(8'hbf)}, ((8'hbe) ? (8'hb3) : (8'h9d))} < (~&((8'hb2) ? (8'ha2) : (8'h9e)))) : (((^~(8'hbf)) != (!(8'hae))) > (!(&(7'h41)))))), 
parameter param197 = param196)
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire65;
  input wire [(5'h11):(1'h0)] wire64;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire signed [(4'h8):(1'h0)] wire62;
  input wire signed [(5'h10):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire195;
  wire signed [(5'h15):(1'h0)] wire194;
  wire [(4'h9):(1'h0)] wire192;
  wire signed [(4'hc):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire100;
  wire signed [(3'h5):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(3'h7):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  assign y = {wire195,
                 wire194,
                 wire192,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire67,
                 wire66,
                 (1'h0)};
  assign wire66 = ({wire61} && $signed($unsigned(((wire64 ?
                      wire64 : wire63) <= {wire64, wire64}))));
  assign wire67 = wire64[(3'h5):(1'h0)];
  module68 #() modinst95 (wire94, clk, wire65, wire64, wire67, wire63);
  assign wire96 = (((wire67 ?
                      (^~wire62) : ({(8'hbb),
                          wire65} | $signed(wire65))) | (wire61[(3'h5):(2'h2)] ?
                      {wire67,
                          (wire61 ?
                              wire94 : wire94)} : $signed((^wire63)))) <= $unsigned(((~|(~|wire66)) ^ (^~wire62))));
  assign wire97 = wire96[(1'h1):(1'h0)];
  assign wire98 = (~|((wire94[(3'h4):(3'h4)] ?
                          wire64 : $unsigned($signed(wire97))) ?
                      wire64[(5'h11):(4'h9)] : $signed($signed($signed(wire67)))));
  assign wire99 = wire66[(3'h5):(2'h3)];
  assign wire100 = (^~(&(!(wire66 <= (wire63 ? wire97 : wire94)))));
  assign wire101 = ((wire100[(2'h3):(1'h0)] << $unsigned($unsigned((wire63 | wire62)))) ?
                       $unsigned(wire66[(3'h5):(1'h0)]) : ($unsigned($unsigned(wire65[(1'h1):(1'h1)])) != {$signed($unsigned(wire98))}));
  module102 #() modinst193 (wire192, clk, wire96, wire66, wire98, wire67);
  assign wire194 = wire100;
  assign wire195 = $signed((-($signed((wire62 > (8'hb8))) ?
                       $signed($unsigned(wire99)) : ((-wire62) ?
                           {(8'h9f), wire99} : wire65))));
endmodule

module module4
#(parameter param56 = ((^~(8'ha3)) ? (^((((8'hba) ? (8'hac) : (7'h42)) ~^ (~|(8'hb3))) >>> (((8'haa) ? (8'hbe) : (8'hba)) != (^(7'h42))))) : {(({(8'hb7), (8'hb8)} || (~&(8'hb8))) ? {(~|(8'haf)), (-(8'hb8))} : (((8'had) ? (8'hb1) : (8'had)) <= {(8'h9d)}))}), 
parameter param57 = param56)
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire6;
  input wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire10;
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  assign y = {wire55, wire54, wire52, wire13, wire10, reg11, reg12, (1'h0)};
  assign wire10 = (~((!$unsigned(wire6)) ?
                      (^wire7) : $signed((wire6[(1'h0):(1'h0)] ?
                          wire5 : {wire5, wire8}))));
  always
    @(posedge clk) begin
      reg11 <= ({{$unsigned($signed(wire7))}} | wire9);
      reg12 <= $signed((wire10 ? $signed(wire7[(1'h0):(1'h0)]) : wire6));
    end
  assign wire13 = $signed({(wire6 ~^ {$signed(wire10),
                          (wire6 ? (8'ha2) : reg11)})});
  module14 #() modinst53 (.wire19(reg11), .y(wire52), .wire15(wire9), .wire16(wire7), .wire18(wire5), .clk(clk), .wire17(wire6));
  assign wire54 = ({wire52} ?
                      $unsigned((!((wire10 ? wire5 : wire8) ?
                          $signed(wire5) : (wire10 >> (8'hb3))))) : (!wire9));
  assign wire55 = $unsigned(wire10[(2'h2):(1'h0)]);
endmodule

module module14  (y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h17d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire20;
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'ha):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire20,
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
  assign wire20 = {$signed((&wire17[(3'h6):(2'h2)]))};
  always
    @(posedge clk) begin
      reg21 <= $signed(wire20);
      reg22 <= wire20[(5'h12):(3'h7)];
      reg23 <= (reg21 * $unsigned(((8'hba) >> wire15)));
      reg24 <= {reg21, $unsigned($signed({wire17}))};
    end
  always
    @(posedge clk) begin
      if (((reg21 ?
          $signed($signed({(7'h41),
              reg22})) : $unsigned((&(8'hbc)))) & wire18[(1'h0):(1'h0)]))
        begin
          reg25 <= (~&{$signed(wire20), reg24[(2'h3):(1'h0)]});
          reg26 <= $unsigned($signed(reg21[(4'hb):(4'h8)]));
          reg27 <= {({{$unsigned(reg22), $unsigned(reg26)}} ?
                  {$unsigned((wire15 ?
                          wire16 : reg23))} : ((~&$signed((8'hb6))) <= $signed($signed(wire16))))};
          reg28 <= reg26;
          reg29 <= wire16;
        end
      else
        begin
          reg25 <= $signed((+(!$signed((!wire15)))));
          reg26 <= $signed({wire19,
              ($signed((~|wire15)) ?
                  ($unsigned(reg24) ?
                      $signed(wire18) : reg25[(3'h6):(3'h6)]) : (wire20[(4'h9):(1'h1)] ?
                      (|wire16) : {(8'ha4), reg23}))});
          reg27 <= wire17[(1'h0):(1'h0)];
          if ((+reg29))
            begin
              reg28 <= $signed($signed((wire16 <= ($unsigned(wire17) ?
                  $unsigned(wire20) : $unsigned(reg29)))));
              reg29 <= reg27[(4'h9):(1'h1)];
            end
          else
            begin
              reg28 <= $unsigned((((&$signed(wire16)) ^~ (&wire16)) != (&((reg26 ?
                  reg27 : wire16) <<< (+reg27)))));
              reg29 <= (-(|$signed(((|wire20) << (-reg26)))));
              reg30 <= $unsigned(reg29);
              reg31 <= wire15;
            end
        end
      reg32 <= (^$signed(($unsigned($unsigned(reg25)) ?
          $unsigned($unsigned(reg24)) : ((reg31 != wire18) ?
              {reg26} : reg24))));
      reg33 <= (~&(reg23[(4'hf):(2'h3)] >> (~|wire16[(3'h6):(3'h4)])));
      reg34 <= $signed(($signed(({reg31, reg23} ?
              $unsigned(wire15) : (~&wire16))) ?
          $signed((~&wire16[(3'h5):(2'h3)])) : ((~|reg23[(4'hf):(2'h3)]) - reg24)));
    end
  always
    @(posedge clk) begin
      if ({$signed(wire15[(2'h2):(1'h0)])})
        begin
          reg35 <= $signed($signed(reg33[(1'h1):(1'h1)]));
          reg36 <= $signed(reg31);
          if (reg30)
            begin
              reg37 <= (8'hb3);
            end
          else
            begin
              reg37 <= $signed($unsigned(reg36[(3'h4):(2'h3)]));
            end
          reg38 <= (reg32[(1'h0):(1'h0)] >> reg29[(3'h4):(1'h0)]);
        end
      else
        begin
          reg35 <= reg25[(1'h1):(1'h0)];
          reg36 <= reg37[(2'h2):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      if ({$signed(({{reg27, reg32}} ?
              {(wire20 ? (8'hbf) : reg34)} : reg36[(1'h0):(1'h0)]))})
        begin
          reg39 <= (~^$unsigned(($unsigned(reg32) | reg30)));
        end
      else
        begin
          reg39 <= {reg21};
        end
      if ($signed((($signed(reg32[(1'h1):(1'h0)]) < ((reg27 == (8'hb4)) ?
          reg26 : reg29)) ~^ (&$signed($signed(reg21))))))
        begin
          reg40 <= ($signed((({reg32} ?
                  $signed(reg23) : (reg22 ?
                      wire20 : reg31)) && $signed(reg25[(1'h1):(1'h1)]))) ?
              {reg37[(1'h0):(1'h0)],
                  wire20} : ((8'h9f) >= (wire17[(1'h1):(1'h0)] >= $signed(wire16[(3'h7):(1'h1)]))));
          reg41 <= ($signed($unsigned(reg35)) <= $signed((~&($signed(reg37) & reg37))));
          reg42 <= {reg37, $unsigned($unsigned($signed($unsigned((8'ha5)))))};
          reg43 <= $signed($signed(($unsigned({reg21}) - (reg27 ?
              reg41 : wire16[(3'h5):(3'h4)]))));
          reg44 <= (reg30[(4'ha):(4'h9)] + (&wire20[(3'h4):(2'h3)]));
        end
      else
        begin
          reg40 <= reg25[(4'h9):(2'h3)];
        end
      reg45 <= (reg35[(1'h0):(1'h0)] ?
          $signed($signed((+$signed((8'hb8))))) : $unsigned(((~^$signed(reg23)) == (-reg22))));
    end
  assign wire46 = reg32[(2'h3):(2'h3)];
  assign wire47 = (8'hbb);
  assign wire48 = (reg38 ?
                      $signed($signed(reg34[(2'h2):(1'h0)])) : reg34[(1'h1):(1'h0)]);
  assign wire49 = ({$unsigned($signed((~|reg41)))} <= ((wire16[(3'h5):(3'h5)] ?
                      ((-reg33) >> (+reg41)) : (~{reg37, (8'h9c)})) >= reg45));
  assign wire50 = {(|$unsigned(wire18)),
                      {(reg31[(2'h3):(2'h3)] ?
                              $unsigned($unsigned(reg30)) : {reg43,
                                  $unsigned(reg32)})}};
  assign wire51 = $signed($unsigned($signed(wire19[(2'h3):(2'h3)])));
endmodule

module module102
#(parameter param190 = {((((|(7'h41)) ? ((8'ha0) ? (8'h9f) : (8'h9f)) : {(8'ha7), (8'hbb)}) ? {((8'ha6) ? (8'ha0) : (8'h9c))} : (+((8'hbe) - (8'h9e)))) ? ((-((8'hbc) == (8'hb8))) >> (~{(8'hb5)})) : ((((8'ha4) <<< (8'hbb)) ? ((8'hb0) ? (7'h44) : (7'h40)) : {(7'h42), (8'ha7)}) ^~ (|((8'ha9) ? (8'h9f) : (8'hb3)))))}, 
parameter param191 = ((((param190 ? (~^param190) : (~|param190)) == param190) ? param190 : (((~param190) ? (param190 << param190) : (param190 ^~ param190)) + (^(param190 << param190)))) ? {((param190 << (param190 <<< param190)) ? ((param190 + param190) ? ((8'ha8) >> param190) : (param190 > param190)) : ((param190 * param190) | (-param190)))} : ((|((param190 ? param190 : param190) ? (!param190) : {param190})) ? ((param190 ? {param190} : (param190 ? param190 : param190)) ? ((-(8'h9e)) ? (^~param190) : (param190 ? param190 : param190)) : ((param190 >> (8'hac)) ? {param190, param190} : param190)) : param190)))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h3f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire106;
  input wire signed [(5'h15):(1'h0)] wire105;
  input wire signed [(4'he):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire189;
  wire signed [(5'h13):(1'h0)] wire187;
  wire [(4'hc):(1'h0)] wire165;
  wire signed [(4'h8):(1'h0)] wire164;
  wire [(2'h3):(1'h0)] wire163;
  wire [(3'h6):(1'h0)] wire162;
  wire [(4'hc):(1'h0)] wire131;
  wire signed [(5'h11):(1'h0)] wire130;
  wire signed [(4'ha):(1'h0)] wire129;
  wire signed [(2'h3):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire108;
  wire signed [(4'h8):(1'h0)] wire107;
  reg signed [(3'h6):(1'h0)] reg188 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg186 = (1'h0);
  reg [(4'h9):(1'h0)] reg185 = (1'h0);
  reg [(5'h13):(1'h0)] reg184 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg182 = (1'h0);
  reg [(2'h3):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg180 = (1'h0);
  reg [(3'h6):(1'h0)] reg179 = (1'h0);
  reg [(4'ha):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg174 = (1'h0);
  reg [(5'h13):(1'h0)] reg173 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(5'h10):(1'h0)] reg171 = (1'h0);
  reg [(5'h10):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg169 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg167 = (1'h0);
  reg [(4'hf):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(2'h2):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg155 = (1'h0);
  reg [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg146 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(3'h6):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg [(4'hf):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  assign y = {wire189,
                 wire187,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire131,
                 wire130,
                 wire129,
                 wire117,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg188,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
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
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
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
                 reg132,
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
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire107 = (((((wire103 ? wire106 : wire105) ?
                           wire103 : (-wire106)) <<< $signed($unsigned(wire106))) ?
                       wire103 : (wire106[(1'h0):(1'h0)] < $signed(wire106[(3'h6):(1'h1)]))) != $unsigned((wire104 ^ $signed($signed(wire106)))));
  assign wire108 = wire103;
  assign wire109 = (&$unsigned(((8'ha1) <= $signed($signed((7'h42))))));
  assign wire110 = $unsigned((~wire105));
  always
    @(posedge clk) begin
      if (wire105[(4'h8):(3'h7)])
        begin
          reg111 <= $unsigned((($signed((wire106 ?
                  wire109 : wire108)) <<< ((~wire103) || {wire109, wire106})) ?
              {(&(wire103 ? wire103 : wire105)),
                  ($unsigned(wire109) >> (wire109 ?
                      wire104 : wire108))} : wire104[(3'h6):(3'h6)]));
          reg112 <= $signed((((reg111[(4'hc):(3'h5)] >>> (reg111 >> wire110)) & $signed((wire105 == (8'hb2)))) ?
              {(wire106 ?
                      wire105[(3'h5):(3'h5)] : wire107)} : wire106[(3'h4):(1'h1)]));
          reg113 <= $unsigned($signed($unsigned(($unsigned((8'hbb)) ?
              (wire108 ^ reg112) : $signed(wire105)))));
          reg114 <= (^~$signed((wire105[(1'h0):(1'h0)] < (~^$unsigned(reg111)))));
          reg115 <= wire107[(3'h6):(1'h1)];
        end
      else
        begin
          reg111 <= $unsigned($signed($signed((~$unsigned(wire105)))));
          reg112 <= $unsigned($unsigned(wire109));
          reg113 <= $signed(wire107);
        end
      reg116 <= wire106;
    end
  assign wire117 = {reg111[(4'h9):(3'h7)]};
  always
    @(posedge clk) begin
      reg118 <= wire109;
      reg119 <= {wire103[(4'h9):(3'h4)]};
      if ($unsigned($unsigned(wire109[(5'h10):(4'hd)])))
        begin
          reg120 <= $unsigned(((reg115[(4'hf):(3'h4)] ?
                  (wire104[(4'he):(3'h7)] || ((8'hb6) == (8'hb3))) : $signed((reg113 ^ reg114))) ?
              $unsigned(((wire103 < reg119) ?
                  {reg111, wire109} : (reg114 + reg113))) : reg114));
          reg121 <= (($signed(reg118[(1'h1):(1'h0)]) ?
              $unsigned((8'ha5)) : $unsigned($unsigned((wire105 ?
                  wire106 : reg113)))) <<< $unsigned((8'hbf)));
        end
      else
        begin
          if ($unsigned(($signed(reg115) >> ($unsigned(reg120[(4'h9):(3'h7)]) ?
              {wire107[(4'h8):(3'h6)]} : ({reg115} ?
                  (reg111 ? wire107 : (8'h9c)) : {(8'ha3)})))))
            begin
              reg120 <= (!reg112);
              reg121 <= $signed($signed({{((8'ha2) ? wire104 : wire109)}}));
              reg122 <= (wire107[(4'h8):(4'h8)] ?
                  wire103 : ($signed((~$unsigned(wire106))) ^ ({(reg121 || reg118)} ?
                      (reg114[(4'hc):(1'h0)] || reg116[(1'h0):(1'h0)]) : ((wire104 | reg118) ^~ $signed(reg118)))));
            end
          else
            begin
              reg120 <= (reg111[(2'h2):(1'h0)] ?
                  $signed($signed(($unsigned(reg113) ?
                      reg120 : (wire110 | wire106)))) : $unsigned($signed((~&wire105))));
              reg121 <= ($unsigned(reg121[(1'h0):(1'h0)]) ?
                  reg121 : (|((+$unsigned(wire104)) ?
                      (((8'hb0) + reg116) ?
                          (wire105 == reg112) : $unsigned(wire108)) : {(~reg121)})));
            end
          if ((~|{((reg120 || (wire107 ? reg114 : reg121)) ?
                  reg114 : ((reg118 | reg122) * wire107[(1'h0):(1'h0)]))}))
            begin
              reg123 <= $signed((wire104 >>> $unsigned(((reg112 == wire110) ?
                  reg118 : (reg121 ? reg120 : (8'hb4))))));
              reg124 <= (^~wire109);
              reg125 <= $unsigned(wire117);
            end
          else
            begin
              reg123 <= ((wire106[(2'h2):(1'h1)] ?
                      $signed((~(8'ha5))) : reg111[(4'h9):(3'h4)]) ?
                  wire109 : ((({wire109} ? $unsigned((8'h9c)) : (~|wire110)) ?
                          (~|(~^wire110)) : wire104[(4'h9):(3'h7)]) ?
                      $unsigned((~^{wire117,
                          (8'hac)})) : $unsigned($signed({reg118, reg112}))));
              reg124 <= (wire106 ?
                  (8'hbe) : ($signed(($unsigned(reg111) >= wire110[(4'h8):(1'h0)])) ?
                      $unsigned($unsigned($signed((8'hb4)))) : (~|wire110)));
              reg125 <= $signed(wire107[(1'h1):(1'h0)]);
              reg126 <= reg119;
              reg127 <= reg113[(4'hd):(3'h6)];
            end
        end
      reg128 <= ((({$signed(reg119)} == wire108) == wire106[(3'h6):(1'h1)]) == $unsigned((($unsigned(reg113) != $unsigned((8'h9e))) ?
          (~&wire106[(3'h5):(2'h3)]) : (8'hba))));
    end
  assign wire129 = wire105[(4'hd):(2'h2)];
  assign wire130 = reg125;
  assign wire131 = reg128[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed($signed((reg115 == reg119))))))
        begin
          reg132 <= $unsigned({$signed((~|wire105))});
          reg133 <= $signed({(7'h40)});
          reg134 <= wire103;
          if ((((|wire103) > (-(~^((8'ha8) ?
              (8'had) : wire105)))) >>> wire103[(1'h1):(1'h1)]))
            begin
              reg135 <= $unsigned($unsigned({{(8'hb3)}}));
              reg136 <= $unsigned(($unsigned({(reg121 & reg122)}) ?
                  ((wire110[(3'h6):(1'h1)] ? wire130 : (~^reg134)) ?
                      wire107 : $unsigned($signed((8'hba)))) : (+($unsigned(reg127) & ((7'h42) ?
                      reg119 : reg121)))));
              reg137 <= $signed((wire130[(4'hc):(3'h6)] ?
                  wire106 : $unsigned((~|$signed(reg116)))));
              reg138 <= $unsigned(reg115[(4'hd):(4'hd)]);
              reg139 <= (+reg128);
            end
          else
            begin
              reg135 <= {((reg115 >= (~^{wire130,
                      reg125})) | {($unsigned((8'haa)) ?
                          reg113 : $unsigned(reg118)),
                      (^$signed(wire108))}),
                  $unsigned($signed((~&reg114[(4'hf):(3'h5)])))};
              reg136 <= ((~&wire107) < ((($signed(reg114) ?
                  $signed(reg112) : reg120[(2'h3):(1'h0)]) & reg123) ^ (($signed(wire117) << $unsigned(wire130)) ?
                  reg119 : $signed(reg137[(2'h2):(1'h0)]))));
              reg137 <= reg136[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg132 <= (wire129[(2'h3):(1'h0)] + reg137[(4'he):(2'h3)]);
          if (reg116[(2'h2):(1'h1)])
            begin
              reg133 <= $unsigned(reg132[(3'h5):(2'h3)]);
            end
          else
            begin
              reg133 <= ((reg126 ?
                      $signed((8'ha6)) : $unsigned(($signed(wire117) ^ reg126))) ?
                  $unsigned(reg115[(5'h11):(3'h6)]) : $signed($signed(reg119[(3'h5):(1'h1)])));
              reg134 <= reg133[(2'h2):(1'h1)];
              reg135 <= $signed(wire131);
              reg136 <= (wire109 << {$unsigned(reg125[(4'hd):(1'h0)])});
              reg137 <= wire104;
            end
          if ((|$unsigned($signed($unsigned($signed(reg124))))))
            begin
              reg138 <= reg114[(4'hf):(4'hc)];
              reg139 <= {wire104[(4'hc):(1'h0)]};
            end
          else
            begin
              reg138 <= (^(~^$unsigned($unsigned($unsigned(wire110)))));
              reg139 <= (reg122 | reg124[(3'h7):(2'h2)]);
              reg140 <= (reg121[(2'h2):(1'h1)] ~^ reg127);
            end
          reg141 <= reg127[(1'h0):(1'h0)];
        end
      if (((!((-$signed((8'ha2))) <<< (^((8'h9d) ?
          (8'hbd) : wire131)))) ~^ (+reg118[(2'h3):(1'h0)])))
        begin
          if (reg118[(2'h3):(2'h3)])
            begin
              reg142 <= $signed($unsigned($signed(((~^reg116) ?
                  reg114 : (reg141 && wire109)))));
              reg143 <= ($unsigned((reg128[(3'h6):(2'h2)] & (~^$signed(reg126)))) << reg111);
              reg144 <= (~|$unsigned((~^{reg112, $signed((7'h43))})));
              reg145 <= (^{({$unsigned(wire106)} >>> $unsigned(reg125[(4'hc):(2'h2)]))});
              reg146 <= $signed((((!reg126) ?
                      $unsigned($unsigned(reg133)) : $signed({reg139,
                          wire130})) ?
                  $signed($unsigned(reg115[(5'h12):(4'he)])) : (reg114[(5'h12):(1'h0)] - reg132)));
            end
          else
            begin
              reg142 <= reg125;
            end
          reg147 <= (8'hb0);
          if (reg123[(4'hc):(3'h7)])
            begin
              reg148 <= reg127;
              reg149 <= reg119;
            end
          else
            begin
              reg148 <= (~|wire105[(2'h3):(2'h2)]);
            end
          reg150 <= (reg145 - (($signed(reg111) ?
              ((-wire109) ?
                  {reg139} : (~&wire117)) : $unsigned($unsigned(reg115))) >> {$signed((reg144 >= reg121)),
              (((8'hab) > reg119) ^ {reg148})}));
        end
      else
        begin
          reg142 <= $signed((|wire130));
          reg143 <= (8'ha8);
          if (($unsigned(reg148) ?
              reg125[(1'h1):(1'h0)] : $signed((|reg115[(3'h4):(1'h1)]))))
            begin
              reg144 <= reg113;
              reg145 <= {{($signed($signed((8'hab))) ?
                          reg116[(3'h4):(2'h2)] : $unsigned(reg142[(3'h7):(1'h0)]))}};
              reg146 <= {wire109, reg116};
              reg147 <= reg132[(3'h6):(3'h6)];
            end
          else
            begin
              reg144 <= (&($signed(((-(8'hb5)) ?
                  reg134 : $unsigned(reg127))) | $signed($unsigned((!reg128)))));
              reg145 <= $unsigned(reg144[(1'h0):(1'h0)]);
              reg146 <= $unsigned(reg119[(1'h1):(1'h0)]);
            end
        end
      if ({$signed(reg144[(3'h5):(3'h4)]),
          ((~&reg113) ? (8'hac) : (|reg143[(2'h2):(1'h0)]))})
        begin
          reg151 <= (((~|((wire129 ? reg149 : (8'h9f)) ?
                  $signed(wire117) : {(8'hac)})) < ((8'ha0) ?
                  reg124[(3'h4):(2'h3)] : ((reg134 ?
                      (8'ha6) : wire106) ^~ reg134))) ?
              (($unsigned((~wire105)) ?
                  ($signed(wire109) ?
                      {wire110,
                          reg147} : reg114) : reg124[(4'h9):(3'h7)]) + (+(reg142[(4'h8):(2'h3)] ?
                  wire107[(3'h5):(1'h1)] : (reg115 ?
                      reg121 : reg123)))) : reg124[(3'h7):(1'h0)]);
          reg152 <= {reg144[(1'h0):(1'h0)]};
          reg153 <= (wire129[(2'h2):(1'h0)] ?
              reg134[(3'h5):(2'h2)] : (reg139 | (&($unsigned(reg135) ~^ (reg135 < wire109)))));
          reg154 <= wire131[(2'h3):(1'h0)];
          reg155 <= $unsigned(reg152);
        end
      else
        begin
          if ((8'ha0))
            begin
              reg151 <= (-reg115[(1'h1):(1'h0)]);
              reg152 <= $unsigned(($unsigned({$signed((8'hb9))}) ?
                  (^$unsigned((reg141 | reg126))) : (wire103[(3'h5):(3'h5)] ?
                      $unsigned($unsigned(wire106)) : wire106[(3'h7):(2'h2)])));
            end
          else
            begin
              reg151 <= (wire105[(4'hc):(3'h5)] ?
                  ({({wire107, reg141} ^ (wire106 ^ (8'hab))),
                          $unsigned({wire105, reg111})} ?
                      {{wire108[(2'h2):(1'h0)]},
                          ({reg137, wire107} ?
                              $signed((8'ha2)) : {wire108})} : reg120[(4'hc):(4'h8)]) : ({$unsigned($signed((8'haf))),
                          ((^wire105) && (~^reg119))} ?
                      $unsigned($signed((~^reg116))) : reg124[(3'h4):(3'h4)]));
              reg152 <= (~reg120[(2'h2):(2'h2)]);
              reg153 <= ({(~|(8'hbe)), (8'ha7)} | {(8'hb3),
                  (((reg128 ? wire105 : reg148) >= ((8'hb8) ?
                      reg153 : (8'ha6))) >> ($unsigned(reg155) ~^ (reg111 ?
                      reg148 : wire109)))});
              reg154 <= (wire130[(4'h9):(2'h3)] ?
                  reg111[(3'h6):(2'h3)] : (((~|{reg152, wire129}) ?
                      $signed($unsigned(wire106)) : (&(wire110 ?
                          reg124 : wire129))) ^~ reg122));
            end
          if (($unsigned((reg141[(1'h1):(1'h1)] | $signed(reg153[(4'hc):(1'h1)]))) ?
              {$signed(reg153[(4'h8):(1'h1)]),
                  (8'h9d)} : $signed(($signed((8'hb8)) + $signed($unsigned(reg135))))))
            begin
              reg155 <= reg116[(1'h1):(1'h0)];
              reg156 <= wire107[(2'h3):(1'h0)];
            end
          else
            begin
              reg155 <= $unsigned({($signed((wire129 ?
                      reg137 : reg143)) & {$signed((8'hbe)),
                      (reg119 == reg121)})});
              reg156 <= ({(+$unsigned($unsigned(reg154))),
                      $unsigned(($unsigned(wire117) << $unsigned(reg113)))} ?
                  ($unsigned((reg143[(3'h4):(2'h3)] ?
                          $signed((8'hb3)) : (reg127 ? reg144 : reg155))) ?
                      ((reg143[(3'h5):(2'h3)] ?
                              (reg113 >> reg125) : (wire103 ?
                                  reg143 : reg123)) ?
                          (reg149[(2'h3):(2'h3)] ?
                              $unsigned(reg121) : reg148) : ((!(8'hb6)) ?
                              (reg148 >>> (8'hab)) : (reg113 >= reg113))) : wire109) : ((^~wire108[(2'h3):(2'h3)]) ?
                      $unsigned((wire129 >= (reg138 ?
                          reg141 : reg148))) : (reg114 * $signed((&reg113)))));
              reg157 <= ((^(~|(reg116[(3'h4):(1'h0)] >> reg128[(4'hd):(3'h4)]))) ?
                  reg113 : ($unsigned(reg150) ?
                      reg135 : $unsigned($signed(reg125))));
              reg158 <= $signed($unsigned(reg118[(1'h0):(1'h0)]));
              reg159 <= (!$signed(reg155));
            end
        end
      reg160 <= (wire108[(4'hb):(4'h8)] ?
          (reg154[(2'h3):(2'h2)] ?
              wire110 : (((~&reg123) ?
                  $unsigned(reg145) : (reg148 != reg132)) | $unsigned(reg115[(2'h2):(2'h2)]))) : $unsigned(wire131));
      reg161 <= $signed(((~|$signed($signed(reg147))) ^~ $signed($unsigned((reg133 ?
          wire109 : reg125)))));
    end
  assign wire162 = $signed({(reg161[(3'h4):(2'h3)] ?
                           {$unsigned(reg114)} : {(reg159 ? reg138 : reg127)}),
                       (~&(reg111 <= reg111))});
  assign wire163 = wire104;
  assign wire164 = reg154[(2'h2):(1'h1)];
  assign wire165 = $unsigned((({$unsigned(reg147), $unsigned((8'hb7))} ?
                       (reg111[(3'h5):(1'h1)] + $unsigned(reg134)) : (8'had)) | $unsigned(reg120[(3'h7):(3'h5)])));
  always
    @(posedge clk) begin
      if ($signed((({$signed(reg146)} ?
          ((&reg140) >= $signed(wire108)) : (reg146[(3'h5):(3'h5)] && (reg140 ?
              reg157 : (7'h42)))) ^~ $signed({wire130[(4'hb):(2'h3)]}))))
        begin
          reg166 <= $unsigned($unsigned(((-(reg141 ? (8'h9c) : reg136)) ?
              ((~^reg147) == (reg137 ^~ wire117)) : ((8'h9e) ?
                  reg122 : {reg125}))));
          reg167 <= $signed(reg161);
          if ($unsigned($signed((7'h40))))
            begin
              reg168 <= ($signed(reg145[(2'h2):(2'h2)]) > reg137);
              reg169 <= (reg138[(3'h4):(1'h1)] ?
                  ($signed($unsigned($signed(wire106))) ?
                      (8'h9f) : reg145[(2'h2):(2'h2)]) : ((reg167[(2'h3):(1'h1)] && reg127[(2'h2):(2'h2)]) ?
                      reg153[(5'h14):(4'hc)] : {(^((8'h9f) ?
                              reg114 : reg124))}));
              reg170 <= (-(^(((|reg148) ?
                  {reg137} : ((8'hb2) | wire104)) && $unsigned($signed(reg155)))));
              reg171 <= ((reg116 ? reg112 : (~$unsigned({reg141, wire108}))) ?
                  ((&reg154[(2'h3):(1'h0)]) ?
                      $signed(reg134) : ((((7'h43) ?
                          reg147 : reg155) >= reg149) + $signed((reg170 & wire107)))) : reg142);
            end
          else
            begin
              reg168 <= ($signed($signed({(wire129 - (8'had)),
                      (reg147 | reg136)})) ?
                  (reg137 ?
                      ((8'haf) + {$unsigned(reg118),
                          reg171[(4'hf):(4'he)]}) : reg136) : ($signed($signed({wire164})) ?
                      ($unsigned(reg126) ?
                          $signed($unsigned(wire110)) : $signed(reg145[(2'h2):(2'h2)])) : $signed($signed($unsigned(reg156)))));
              reg169 <= reg115;
            end
          reg172 <= (((8'h9d) ?
                  ((reg114[(5'h12):(2'h2)] ?
                      reg123 : (wire129 ?
                          reg151 : reg136)) >= reg137) : (wire103 || $signed(reg141[(1'h0):(1'h0)]))) ?
              $unsigned($signed($signed((reg139 ?
                  wire109 : reg134)))) : wire110[(3'h4):(2'h3)]);
        end
      else
        begin
          reg166 <= ($unsigned(($signed($unsigned(wire107)) == reg139[(4'he):(1'h0)])) ?
              $unsigned((7'h40)) : (~|((reg128 >> $signed(reg111)) > wire110[(3'h5):(3'h4)])));
          reg167 <= reg148;
          reg168 <= (|($signed((!(~reg112))) & ({(~&wire164),
              (wire109 << reg144)} > reg123[(3'h6):(3'h4)])));
        end
      reg173 <= reg158;
      reg174 <= (~&$signed($signed($unsigned((&(8'h9e))))));
      reg175 <= $unsigned((~$signed(reg147[(1'h1):(1'h0)])));
      if ($unsigned($unsigned($signed($unsigned($unsigned((8'hb5)))))))
        begin
          reg176 <= (reg138 || reg149[(4'hd):(2'h2)]);
          reg177 <= ($unsigned(({$signed((7'h41))} ?
                  reg141[(3'h7):(3'h7)] : (-((8'hb1) || reg150)))) ?
              wire165 : $signed(($unsigned($unsigned(reg169)) ?
                  (^~(wire104 << wire131)) : {(^reg167), (8'h9e)})));
        end
      else
        begin
          reg176 <= ($unsigned((wire131 ?
              ($unsigned(reg124) < reg119) : reg152)) || {$signed(reg128[(4'hd):(4'hc)])});
          reg177 <= (-$signed(reg174));
          if ((-{({$unsigned(wire109)} >> $signed(reg125))}))
            begin
              reg178 <= {$unsigned((^((reg167 && reg118) ^~ (~^reg126))))};
              reg179 <= reg142;
              reg180 <= reg157[(4'h8):(3'h6)];
            end
          else
            begin
              reg178 <= {((7'h44) ?
                      $unsigned($unsigned($signed(reg156))) : $unsigned(reg153))};
              reg179 <= $unsigned($unsigned((8'haa)));
              reg180 <= reg125;
              reg181 <= ((8'hb9) ^ $unsigned((~^$unsigned((~^(7'h42))))));
              reg182 <= (+({(reg173 ?
                      (reg124 != reg116) : ((8'ha6) >>> wire130))} + ((|reg172[(1'h1):(1'h0)]) ?
                  reg118 : $signed(((8'ha0) + reg176)))));
            end
          reg183 <= (reg132[(1'h0):(1'h0)] < ($unsigned(reg170[(3'h5):(1'h1)]) || wire117[(1'h0):(1'h0)]));
          if ($signed(($signed((~{reg161})) != wire104)))
            begin
              reg184 <= {((reg178[(1'h1):(1'h1)] ?
                      reg124 : (|$unsigned(reg126))) <<< {(wire106[(3'h4):(3'h4)] ?
                          reg113[(2'h3):(1'h0)] : (+reg151))})};
              reg185 <= $unsigned($unsigned((reg148 ?
                  reg158 : $signed($signed((8'haf))))));
              reg186 <= (-$unsigned({((wire108 ? reg147 : (8'ha7)) ?
                      wire106[(2'h2):(1'h0)] : reg147),
                  (+reg145[(2'h3):(1'h0)])}));
            end
          else
            begin
              reg184 <= wire109[(4'hd):(4'hb)];
            end
        end
    end
  assign wire187 = reg167;
  always
    @(posedge clk) begin
      reg188 <= wire103;
    end
  assign wire189 = $signed(($signed({(reg132 ? reg111 : reg122)}) ?
                       $unsigned({(reg157 ? reg121 : reg167),
                           reg124}) : ($signed($unsigned(wire105)) & {reg168[(1'h1):(1'h0)]})));
endmodule

module module68  (y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire72;
  input wire [(5'h11):(1'h0)] wire71;
  input wire signed [(4'h8):(1'h0)] wire70;
  input wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 (1'h0)};
  assign wire73 = ($signed(($unsigned(((8'hbf) ~^ wire70)) ^ ({wire70, wire70} ?
                      ((8'ha2) ?
                          wire70 : wire69) : $signed(wire69)))) & {$unsigned(wire71[(4'hf):(4'ha)]),
                      (((wire69 | wire69) >>> (^wire70)) ?
                          $signed((~wire72)) : (-$unsigned(wire71)))});
  assign wire74 = (wire73[(3'h6):(3'h6)] || ($unsigned(($unsigned(wire72) ?
                      ((8'hb6) & wire71) : (wire70 < wire73))) & (|wire71)));
  assign wire75 = (8'ha4);
  assign wire76 = $unsigned(wire71);
  assign wire77 = wire73[(4'hc):(3'h4)];
  assign wire78 = $unsigned(($signed((~^(wire76 | wire70))) || wire73[(2'h3):(1'h0)]));
  assign wire79 = wire77;
  assign wire80 = wire74;
  assign wire81 = (~|((|(~wire78[(2'h2):(1'h0)])) == {{wire74,
                          {wire77, wire74}},
                      (^wire72[(2'h2):(1'h0)])}));
  assign wire82 = (~^$unsigned((wire81[(1'h0):(1'h0)] - ($unsigned((8'hb8)) ?
                      (wire72 >>> (7'h41)) : {(7'h41)}))));
  assign wire83 = {({{wire74, $signed((8'ha8))}} + wire70)};
  assign wire84 = ((8'hac) ? $signed({(~(~|wire70))}) : wire83);
  assign wire85 = (+wire70[(2'h2):(1'h1)]);
  assign wire86 = wire82[(4'hc):(3'h7)];
  assign wire87 = $unsigned((wire70[(3'h7):(2'h3)] ?
                      (^~wire69) : wire79[(3'h7):(3'h7)]));
  assign wire88 = wire80[(4'he):(2'h3)];
  assign wire89 = {((~&((wire78 ? wire70 : (8'hbb)) <= wire85)) ?
                          (wire84[(1'h1):(1'h0)] ?
                              (wire84 ^ (^wire75)) : wire71) : (8'hbf))};
  assign wire90 = (wire69[(2'h3):(2'h3)] * wire79);
  assign wire91 = wire77[(3'h6):(3'h5)];
  assign wire92 = wire71;
  assign wire93 = (&$signed(wire76[(2'h2):(1'h1)]));
endmodule
