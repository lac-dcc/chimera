module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire196;
  reg signed [(4'hd):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg220 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg218 = (1'h0);
  reg [(5'h14):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg216 = (1'h0);
  reg [(5'h15):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg214 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg213 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg211 = (1'h0);
  reg [(4'he):(1'h0)] reg210 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg209 = (1'h0);
  reg [(4'hd):(1'h0)] reg208 = (1'h0);
  reg [(4'h8):(1'h0)] reg207 = (1'h0);
  reg [(2'h2):(1'h0)] reg206 = (1'h0);
  reg [(3'h7):(1'h0)] reg205 = (1'h0);
  reg [(2'h3):(1'h0)] reg204 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg203 = (1'h0);
  reg signed [(4'he):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg201 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg198 = (1'h0);
  assign y = {wire57,
                 wire5,
                 wire4,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire196,
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
                 (1'h0)};
  assign wire4 = $signed(($unsigned((wire3 ?
                         (wire0 << (7'h44)) : $unsigned(wire1))) ?
                     wire2 : wire3[(1'h0):(1'h0)]));
  assign wire5 = (($unsigned($signed(wire3)) ?
                     {wire0[(3'h4):(1'h0)]} : wire3[(3'h7):(2'h2)]) && $unsigned((($unsigned(wire4) ?
                     {(8'hb5)} : (8'haf)) * ({wire0, (7'h42)} ?
                     (^wire1) : (+(8'ha0))))));
  module6 #() modinst58 (.clk(clk), .wire9(wire3), .wire8(wire0), .y(wire57), .wire11(wire2), .wire7(wire5), .wire10(wire4));
  assign wire59 = ($unsigned((((wire0 && (8'hb7)) & (wire1 ^ wire0)) >= $signed(wire57[(1'h0):(1'h0)]))) ?
                      $signed(wire2) : (&(+($unsigned((7'h43)) ?
                          (~&wire4) : (&wire2)))));
  assign wire60 = {(!{(&(wire57 != (8'ha1))),
                          $unsigned(wire59[(4'hc):(4'hc)])})};
  assign wire61 = (8'ha5);
  assign wire62 = $signed($unsigned($signed({(wire5 ? (8'ha1) : wire59)})));
  assign wire63 = ($unsigned((|wire62[(4'hd):(4'ha)])) ?
                      $unsigned($signed((wire4[(4'hd):(3'h7)] != $signed((8'hb5))))) : wire2[(2'h3):(2'h3)]);
  module64 #() modinst197 (wire196, clk, wire59, wire57, wire0, wire2, wire61);
  always
    @(posedge clk) begin
      if ($signed(((wire61[(1'h1):(1'h0)] >= (wire62[(1'h1):(1'h0)] ?
          wire3 : wire5)) >>> $signed($unsigned(((8'haf) & (8'h9f)))))))
        begin
          if ({(8'ha6)})
            begin
              reg198 <= $unsigned(wire57[(4'hf):(4'hc)]);
              reg199 <= ($unsigned(wire2[(2'h3):(1'h1)]) >>> (!$signed((reg198[(2'h3):(1'h1)] ?
                  {wire62, (8'ha1)} : wire2[(2'h3):(1'h0)]))));
              reg200 <= (wire61 ^~ wire0[(1'h0):(1'h0)]);
            end
          else
            begin
              reg198 <= $signed(reg200[(4'hb):(2'h2)]);
              reg199 <= (&$unsigned($unsigned($signed((reg200 ?
                  wire0 : wire61)))));
            end
          reg201 <= {{(wire59[(4'ha):(3'h6)] <<< $signed((reg198 ?
                      wire57 : reg200))),
                  $signed((((8'ha4) ? wire3 : wire5) ? (+wire5) : (~|wire62)))},
              ((|$unsigned({wire62})) ?
                  wire60 : $unsigned((~|$signed(reg198))))};
        end
      else
        begin
          if ($signed((-$unsigned(((reg198 ?
              wire60 : wire60) != $signed((8'ha1)))))))
            begin
              reg198 <= $unsigned((^$unsigned({$unsigned(reg201)})));
              reg199 <= (wire5[(3'h5):(1'h0)] ? wire5 : {(!(+reg198))});
              reg200 <= $signed((~^{(wire62[(3'h6):(3'h5)] > wire63[(4'he):(3'h7)]),
                  ({wire57, reg200} ?
                      $unsigned(reg200) : (wire0 <<< (8'hbd)))}));
            end
          else
            begin
              reg198 <= $unsigned($unsigned({wire62[(2'h2):(1'h1)],
                  (wire196 ? wire196 : $signed(wire62))}));
              reg199 <= ($unsigned(wire60) ?
                  ((~^(~&(&wire5))) - wire59[(4'h8):(3'h6)]) : ($signed(((wire61 | (8'hbc)) ?
                      $unsigned(wire5) : $signed((8'haf)))) + wire3[(2'h2):(1'h1)]));
              reg200 <= $signed(reg198);
              reg201 <= wire62[(4'ha):(4'h8)];
              reg202 <= (wire3 + {{wire0,
                      (((8'ha5) ? (7'h42) : wire5) ?
                          (-wire2) : {wire0, wire59})}});
            end
          reg203 <= $signed({wire61, {wire4}});
          reg204 <= reg201[(2'h3):(2'h2)];
          reg205 <= $signed(wire59[(2'h3):(2'h2)]);
        end
      reg206 <= (wire4[(5'h11):(1'h1)] ?
          wire60[(1'h1):(1'h0)] : $unsigned((|$signed((~&wire3)))));
      reg207 <= ($signed(($unsigned(reg203) ? (^~(~^wire2)) : (7'h43))) ?
          ((wire3[(1'h0):(1'h0)] ? ((8'ha9) ? reg198 : (-reg201)) : reg205) ?
              reg203 : (((^~wire2) == reg205) ?
                  $unsigned((~&(8'ha7))) : (^$unsigned(wire63)))) : wire57);
      if ($signed((~$signed($unsigned(reg206)))))
        begin
          reg208 <= ($unsigned($unsigned(reg200[(3'h5):(1'h0)])) >> {($unsigned($unsigned(wire0)) ?
                  (8'ha9) : $unsigned((8'hb6))),
              $unsigned((+$signed(wire5)))});
          reg209 <= (($unsigned(((wire4 ? reg202 : (8'hb5)) ?
                  (^~wire62) : wire59)) ?
              wire59[(4'hb):(1'h0)] : (($signed(reg203) ?
                  reg207[(4'h8):(3'h4)] : (wire57 ?
                      wire62 : wire196)) || $unsigned(wire196[(4'hf):(1'h1)]))) >>> wire61);
          reg210 <= reg207[(2'h2):(1'h1)];
          reg211 <= (!(wire59[(4'he):(3'h5)] + ({wire4[(1'h1):(1'h0)],
                  (reg201 ? wire5 : (8'hab))} ?
              ({reg206, reg210} ? (^wire1) : {wire61}) : {(wire59 ?
                      reg208 : reg200),
                  wire59})));
          reg212 <= {(~|wire59[(3'h7):(3'h7)]), reg198[(3'h4):(3'h4)]};
        end
      else
        begin
          reg208 <= $signed($signed($unsigned($unsigned(((7'h44) ^ reg199)))));
          if ((8'ha3))
            begin
              reg209 <= $signed($signed(({(wire63 <<< wire3)} && ($unsigned(reg205) ?
                  $signed((7'h44)) : wire3))));
              reg210 <= (~|{reg204[(2'h2):(2'h2)], $signed(reg212)});
              reg211 <= (^$signed((({wire63} ?
                  $signed(reg202) : $signed(wire57)) & $signed((reg209 >= (8'ha4))))));
              reg212 <= ($unsigned($unsigned(wire5[(2'h3):(2'h3)])) ?
                  $unsigned((((wire3 ? reg209 : reg212) ?
                      wire2 : wire61) > ($signed(reg202) ^ wire63[(4'hc):(3'h7)]))) : (reg198 ?
                      reg205 : $signed(wire60)));
            end
          else
            begin
              reg209 <= (wire5[(4'h8):(3'h5)] && $unsigned(wire59));
              reg210 <= (reg205[(2'h2):(1'h1)] ?
                  reg202[(3'h5):(3'h5)] : (|$unsigned(reg205)));
            end
        end
    end
  always
    @(posedge clk) begin
      reg213 <= ((+$signed((+(reg212 || reg209)))) ?
          (wire4[(5'h14):(4'h8)] & {wire57[(3'h6):(3'h4)],
              {((7'h40) ? wire60 : (8'h9c))}}) : (~reg210));
      reg214 <= $unsigned((~|$unsigned($signed(reg207[(3'h4):(2'h3)]))));
      reg215 <= (8'hbb);
      reg216 <= ((((reg203 <<< ((8'hb5) ? reg210 : reg207)) ?
              wire1[(3'h4):(2'h3)] : (reg211 <= (&wire3))) ?
          $unsigned(((&reg214) > (reg211 ?
              reg200 : reg200))) : $unsigned((!(reg199 ?
              reg208 : reg208)))) ^ reg210[(4'he):(3'h5)]);
      if ($unsigned((reg210 >= ((reg211 ?
          $unsigned(wire60) : (reg214 ? wire1 : wire1)) >= (~^(wire62 ?
          reg214 : reg207))))))
        begin
          reg217 <= (8'hb6);
          reg218 <= ($unsigned(wire2[(4'h9):(3'h6)]) ?
              (reg210 ? wire3[(4'h8):(1'h1)] : reg204) : reg216);
          reg219 <= (!(wire59 ? reg200[(1'h1):(1'h1)] : {reg204}));
        end
      else
        begin
          reg217 <= reg219;
          reg218 <= ($unsigned((wire1[(2'h3):(1'h1)] ^ wire60)) ?
              $signed((wire59 <<< $signed($unsigned(reg211)))) : (reg205[(3'h4):(3'h4)] - (^$signed((reg201 ~^ wire59)))));
          reg219 <= {$unsigned(wire2[(4'h9):(2'h3)]), reg217[(4'h8):(2'h2)]};
          reg220 <= $unsigned(((({reg207,
                  reg209} | $unsigned(wire4)) >>> {reg209[(4'hd):(2'h3)]}) ?
              $signed(reg218) : ({wire57, {wire2}} >= wire2)));
          reg221 <= (8'ha6);
        end
    end
endmodule

module module64  (y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h124):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire69;
  input wire signed [(5'h15):(1'h0)] wire68;
  input wire signed [(4'ha):(1'h0)] wire67;
  input wire [(4'hf):(1'h0)] wire66;
  input wire signed [(4'hb):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire195;
  wire [(2'h3):(1'h0)] wire194;
  wire [(5'h15):(1'h0)] wire193;
  wire [(4'hf):(1'h0)] wire192;
  wire [(3'h5):(1'h0)] wire191;
  wire signed [(5'h13):(1'h0)] wire190;
  wire signed [(2'h2):(1'h0)] wire189;
  wire [(5'h12):(1'h0)] wire188;
  wire [(3'h7):(1'h0)] wire186;
  wire [(4'ha):(1'h0)] wire114;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire118;
  wire [(3'h7):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire121;
  wire [(5'h10):(1'h0)] wire164;
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  assign y = {wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire186,
                 wire114,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire118,
                 wire119,
                 wire120,
                 wire121,
                 wire164,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire70 = $signed(($unsigned(((^~wire68) != (~&wire67))) <<< wire67[(3'h7):(1'h0)]));
  assign wire71 = (^~((!$unsigned({wire70, wire70})) ?
                      $unsigned((wire67 > (^wire68))) : $unsigned(($signed((8'ha5)) ?
                          (wire68 << wire70) : (+wire67)))));
  assign wire72 = (((~^wire65[(1'h1):(1'h0)]) | wire69) ?
                      $unsigned((+(&$signed(wire68)))) : ($signed(($signed(wire69) & (wire70 ?
                          wire66 : wire68))) ^ wire65[(1'h0):(1'h0)]));
  assign wire73 = ({wire68[(1'h1):(1'h1)]} ?
                      (((~^wire66[(3'h7):(2'h2)]) != (8'ha7)) ?
                          wire67[(1'h1):(1'h1)] : wire72[(3'h5):(3'h5)]) : $signed((wire72[(2'h2):(1'h1)] ^~ $unsigned($unsigned((8'ha0))))));
  assign wire74 = ($signed($unsigned((^(~^wire71)))) >>> (&((wire69[(1'h0):(1'h0)] & $signed(wire71)) * wire71)));
  assign wire75 = $unsigned(wire72);
  module76 #() modinst115 (.y(wire114), .wire78(wire71), .wire79(wire66), .clk(clk), .wire80(wire68), .wire77(wire73), .wire81(wire70));
  always
    @(posedge clk) begin
      reg116 <= $unsigned(($unsigned(((wire74 == (8'hbd)) & (~^wire67))) == $unsigned(wire73[(3'h6):(3'h6)])));
      reg117 <= wire75[(2'h2):(1'h1)];
    end
  assign wire118 = {(!(wire74 ? wire73 : wire66[(3'h5):(2'h2)]))};
  assign wire119 = ((~|$unsigned({(wire67 ^~ wire66)})) >= ($signed(wire65) + (wire72[(2'h2):(1'h0)] ?
                       $unsigned(wire65[(3'h6):(2'h2)]) : $signed($signed(wire72)))));
  assign wire120 = wire72;
  assign wire121 = $signed($signed($unsigned($signed(((8'had) ?
                       wire69 : wire70)))));
  module122 #() modinst165 (wire164, clk, wire73, wire65, wire74, wire67, wire68);
  module166 #() modinst187 (wire186, clk, wire66, wire120, wire74, wire75);
  assign wire188 = wire75;
  assign wire189 = $signed((wire121 & (wire72[(3'h6):(2'h2)] ?
                       $unsigned((wire119 ?
                           wire118 : wire69)) : $signed((~wire67)))));
  assign wire190 = ((^($signed(wire68[(5'h15):(3'h4)]) ?
                       $unsigned((reg117 - wire189)) : {(!wire67),
                           (|wire118)})) < $unsigned(wire75[(3'h4):(1'h0)]));
  assign wire191 = ($unsigned(((8'hb4) <<< ($signed(wire66) ?
                       ((8'ha7) ?
                           wire68 : (8'ha4)) : (^wire188)))) <<< ((reg117[(3'h7):(3'h6)] ~^ (~&(wire69 * wire69))) ^~ (((wire65 ?
                       wire188 : wire188) - wire189) << ($signed(wire75) & reg116))));
  assign wire192 = ((&{reg117[(4'he):(1'h0)],
                           {wire189[(2'h2):(1'h1)], (wire188 + wire118)}}) ?
                       ((wire67 * ((wire69 <= wire69) ?
                           {reg116,
                               wire72} : wire121[(2'h3):(1'h1)])) >> (wire69 <<< (-(wire66 ?
                           (7'h42) : wire188)))) : $unsigned({((~&wire66) == (wire70 >= wire114))}));
  assign wire193 = reg116[(1'h0):(1'h0)];
  assign wire194 = ((wire67 + (^((wire121 ? wire120 : (8'hac)) ?
                       wire164[(4'hb):(3'h4)] : wire75))) - ($signed((~^(wire68 ?
                       wire118 : wire121))) <= ($unsigned(((8'hb3) && wire73)) && $unsigned(wire189))));
  assign wire195 = wire69;
endmodule

module module6
#(parameter param55 = (~^(+(+({(8'had), (8'hb6)} > (~(8'hba)))))), 
parameter param56 = ((~(|{((8'hbb) ? param55 : param55)})) ^ ({(8'ha1), (~^(param55 ? param55 : param55))} ? (~|(~&(param55 || param55))) : param55)))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire52;
  wire signed [(2'h2):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire12;
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire12,
                 (1'h0)};
  assign wire12 = {($signed(($unsigned(wire10) & wire10)) ^ $unsigned(wire10[(4'hc):(3'h4)]))};
  module13 #() modinst48 (wire47, clk, wire9, wire10, wire7, wire12);
  assign wire49 = ((wire11[(1'h0):(1'h0)] == wire7) ?
                      ($signed((wire7[(3'h6):(1'h0)] ?
                          $unsigned(wire8) : wire7)) + $signed((~|(~|wire8)))) : $signed(wire11[(1'h0):(1'h0)]));
  assign wire50 = (|$signed(wire11));
  assign wire51 = $signed((wire12[(1'h1):(1'h0)] ?
                      $signed($unsigned($unsigned(wire49))) : (wire10[(4'hd):(3'h7)] - ({wire50,
                          wire8} << (wire8 ~^ wire9)))));
  assign wire52 = $unsigned($signed($unsigned($unsigned(wire11[(1'h1):(1'h0)]))));
  assign wire53 = ((wire7 ?
                          (wire7[(3'h4):(2'h3)] ?
                              (wire12[(1'h0):(1'h0)] && (wire51 ?
                                  wire51 : (8'hbc))) : $signed(wire49)) : $unsigned($signed($signed((8'ha3))))) ?
                      ($unsigned(wire7[(1'h0):(1'h0)]) ?
                          {wire12[(1'h0):(1'h0)],
                              wire11[(2'h2):(1'h0)]} : $signed(wire49[(2'h2):(2'h2)])) : $signed(wire12[(1'h0):(1'h0)]));
  assign wire54 = wire50;
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  input wire [(4'ha):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  wire signed [(5'h10):(1'h0)] wire18;
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire18,
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
                 (1'h0)};
  assign wire18 = wire16;
  always
    @(posedge clk) begin
      reg19 <= $signed(((^((wire16 ~^ wire18) + {wire16,
          wire17})) + $unsigned(wire15[(4'ha):(2'h3)])));
      if (((reg19[(3'h5):(3'h5)] && {wire14[(2'h3):(1'h0)],
          wire18[(3'h5):(3'h5)]}) >> $signed(wire17[(2'h2):(2'h2)])))
        begin
          reg20 <= wire15;
          if ((~&((&reg20) ? (8'hb9) : $unsigned($signed((!wire15))))))
            begin
              reg21 <= wire16[(4'ha):(3'h5)];
              reg22 <= $unsigned(($signed({reg20}) * ((wire18[(4'h8):(3'h6)] ?
                      ((8'hbe) >= reg19) : (|reg19)) ?
                  ((|wire14) << {reg20,
                      wire14}) : $unsigned(wire15[(3'h5):(3'h5)]))));
              reg23 <= wire18[(4'he):(4'h9)];
            end
          else
            begin
              reg21 <= wire17[(3'h7):(1'h1)];
            end
          reg24 <= $signed($unsigned((wire15 < wire17)));
          if ((8'haa))
            begin
              reg25 <= $signed(({$signed((wire16 ?
                      (8'hb0) : wire18))} >>> $signed((reg24[(1'h1):(1'h0)] ?
                  (wire14 ? reg24 : wire15) : $signed(reg22)))));
              reg26 <= $unsigned({(~|($signed((8'hb1)) + $unsigned(reg25))),
                  wire15});
            end
          else
            begin
              reg25 <= $signed((|wire14[(1'h1):(1'h0)]));
            end
          reg27 <= (reg24[(1'h1):(1'h0)] > (wire18 * ((8'ha1) ?
              (wire17 & (wire15 * (8'hb2))) : wire17[(3'h5):(3'h4)])));
        end
      else
        begin
          reg20 <= wire18[(1'h0):(1'h0)];
          reg21 <= $signed(wire17[(3'h4):(1'h1)]);
          reg22 <= (^(8'hbd));
          reg23 <= (((($unsigned(wire14) ^~ {reg20}) << (~&$signed(reg20))) * (((wire18 ?
                          reg23 : wire18) ?
                      $signed(wire14) : reg22[(4'hc):(4'hc)]) ?
                  reg24 : (8'hbd))) ?
              ($unsigned((~^(wire15 ?
                  reg24 : reg27))) != $unsigned((8'ha9))) : reg25[(3'h6):(1'h0)]);
        end
      reg28 <= (((8'hb9) ?
          $unsigned(($unsigned(reg23) ?
              {wire17} : (8'ha7))) : (((wire16 && reg26) ? wire17 : reg25) ?
              {(&reg26),
                  (wire16 ^ reg22)} : reg24[(1'h0):(1'h0)])) && (wire18[(4'he):(4'hc)] == $signed(((reg27 > reg24) & (reg25 ?
          reg20 : wire16)))));
    end
  assign wire29 = $signed(wire16[(3'h5):(1'h1)]);
  assign wire30 = $unsigned(((^~(wire18 * (wire18 ? wire17 : wire17))) ?
                      reg21[(5'h10):(4'hf)] : (^~reg22)));
  assign wire31 = (wire16 ? $signed(reg21) : reg22);
  assign wire32 = ($unsigned(reg21[(3'h4):(3'h4)]) ?
                      wire30[(4'ha):(4'h9)] : $signed((reg22[(4'he):(4'he)] ?
                          (|reg22[(3'h5):(1'h0)]) : wire31[(3'h4):(2'h3)])));
  assign wire33 = $signed((reg27 ?
                      $unsigned(reg22) : {((wire16 ? (8'hb6) : wire18) ?
                              $unsigned(reg26) : (^~reg25)),
                          $signed($signed(reg22))}));
  assign wire34 = $signed(((~^$unsigned(reg25)) ?
                      (!(wire18[(4'hd):(4'ha)] * (^~reg25))) : (((7'h40) | wire15[(4'h9):(2'h3)]) < wire15[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg35 <= $signed({(($unsigned(reg28) ? (8'hb8) : wire17) ?
              reg22[(3'h5):(1'h1)] : (^~(~&reg25))),
          (((wire14 * (8'hb1)) - (wire15 ?
              reg28 : reg24)) >= $unsigned((8'ha0)))});
      reg36 <= wire31;
      reg37 <= (-((reg35[(4'ha):(4'h9)] ?
          (~&{reg26, (7'h42)}) : (8'hac)) ~^ wire34[(3'h7):(3'h6)]));
      if ((8'h9d))
        begin
          reg38 <= $unsigned(reg20[(3'h4):(1'h1)]);
          reg39 <= $signed($unsigned($unsigned(($signed(reg22) <= (wire32 ?
              reg20 : wire31)))));
          if (($signed(reg39) ?
              $unsigned(((wire18[(4'hb):(4'ha)] + $signed(reg19)) | reg24[(1'h0):(1'h0)])) : $unsigned($signed(((wire33 >>> (8'hb1)) << wire18)))))
            begin
              reg40 <= wire32[(2'h3):(2'h3)];
              reg41 <= reg21[(4'hf):(4'h8)];
              reg42 <= $unsigned(reg22);
            end
          else
            begin
              reg40 <= (-reg41[(3'h6):(1'h1)]);
              reg41 <= ($signed(wire15[(4'ha):(1'h0)]) - wire16[(4'hb):(1'h0)]);
              reg42 <= reg38[(2'h2):(1'h0)];
              reg43 <= reg27;
              reg44 <= $signed(reg26);
            end
          reg45 <= wire31[(3'h5):(3'h5)];
          reg46 <= (-(^~reg23[(3'h7):(3'h5)]));
        end
      else
        begin
          reg38 <= reg20;
          reg39 <= wire31[(2'h2):(1'h0)];
          reg40 <= (reg38 + (8'ha1));
        end
    end
endmodule

module module166
#(parameter param184 = (+(((!(+(8'ha6))) < (((8'hbe) ? (7'h41) : (8'h9d)) ? {(8'ha5)} : (!(8'hbf)))) ? ((&(!(8'h9f))) != ((8'ha7) ? ((8'ha9) <<< (8'hbe)) : (^~(7'h40)))) : (&(+((7'h44) ? (8'haa) : (7'h40)))))), 
parameter param185 = (((^((param184 ? param184 : param184) ? (param184 ? param184 : param184) : (param184 && param184))) ? (+(+param184)) : (((param184 ? param184 : param184) ? param184 : (!param184)) ? (8'hb2) : ((^param184) ? {param184, param184} : (param184 ? param184 : param184)))) - (param184 ? (~&param184) : ((^(param184 ? param184 : param184)) >>> ((&param184) & (param184 ? (8'hb1) : param184))))))
(y, clk, wire170, wire169, wire168, wire167);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire170;
  input wire signed [(5'h15):(1'h0)] wire169;
  input wire signed [(4'ha):(1'h0)] wire168;
  input wire [(4'hf):(1'h0)] wire167;
  wire [(2'h2):(1'h0)] wire183;
  wire [(4'hd):(1'h0)] wire182;
  wire signed [(3'h7):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire [(2'h3):(1'h0)] wire178;
  wire [(4'hc):(1'h0)] wire176;
  wire [(3'h5):(1'h0)] wire175;
  wire signed [(3'h6):(1'h0)] wire174;
  wire [(2'h3):(1'h0)] wire173;
  wire signed [(3'h4):(1'h0)] wire172;
  wire signed [(5'h10):(1'h0)] wire171;
  reg [(4'ha):(1'h0)] reg177 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 reg177,
                 (1'h0)};
  assign wire171 = (^wire170[(4'hf):(3'h5)]);
  assign wire172 = (~^(!(^~($unsigned(wire168) < (wire169 ?
                       wire170 : wire168)))));
  assign wire173 = (wire171 & (~^(wire172 << $unsigned(((8'hba) - wire168)))));
  assign wire174 = $unsigned(((wire172 ?
                           $signed(wire168) : (wire171[(4'hb):(4'h8)] == {wire170,
                               wire173})) ?
                       wire172[(1'h1):(1'h0)] : (&(8'hbd))));
  assign wire175 = $unsigned($unsigned({((wire172 <= wire173) == $signed(wire170)),
                       ((wire167 >> (8'h9f)) ?
                           $signed(wire170) : (wire172 ^ wire173))}));
  assign wire176 = wire170[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg177 <= $unsigned($signed(wire175));
    end
  assign wire178 = ($unsigned($signed((-$unsigned(wire170)))) << (~&((^$unsigned(wire170)) ?
                       (|(8'hb6)) : (reg177 == (~|wire171)))));
  assign wire179 = wire171[(4'hd):(3'h7)];
  assign wire180 = ($signed(wire168[(2'h2):(1'h0)]) ?
                       (&$signed((wire168 ^~ (wire178 <<< wire170)))) : wire173);
  assign wire181 = (|({wire167[(1'h0):(1'h0)]} ?
                       ($unsigned($signed(wire172)) ?
                           (wire176 + $signed(wire172)) : wire169) : ((~(^~(8'h9d))) ?
                           wire174[(1'h1):(1'h0)] : $signed(((8'h9d) ?
                               reg177 : wire173)))));
  assign wire182 = $signed((wire180 << wire179[(3'h7):(2'h2)]));
  assign wire183 = wire176[(4'h9):(1'h1)];
endmodule

module module122  (y, clk, wire127, wire126, wire125, wire124, wire123);
  output wire [(32'h1d3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire127;
  input wire [(2'h2):(1'h0)] wire126;
  input wire signed [(5'h12):(1'h0)] wire125;
  input wire signed [(4'ha):(1'h0)] wire124;
  input wire signed [(5'h15):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire163;
  wire [(3'h4):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire130;
  wire [(4'he):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire128;
  reg [(5'h15):(1'h0)] reg162 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg159 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg154 = (1'h0);
  reg [(4'h9):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg141 = (1'h0);
  reg [(5'h10):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(4'hf):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  assign y = {wire163,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 reg162,
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
                 (1'h0)};
  assign wire128 = wire124[(1'h0):(1'h0)];
  assign wire129 = wire124[(4'h8):(2'h2)];
  assign wire130 = (((|$unsigned($unsigned(wire123))) ?
                       {wire125,
                           $signed((wire124 ^ wire126))} : wire126) <= wire129);
  assign wire131 = $unsigned(wire127);
  always
    @(posedge clk) begin
      if ($unsigned((wire124 ? wire130 : wire123[(4'ha):(3'h7)])))
        begin
          reg132 <= ($unsigned(((+(wire128 + wire130)) ~^ {(wire130 ?
                  wire124 : wire124)})) == wire130);
          reg133 <= (+wire123[(5'h14):(3'h7)]);
          reg134 <= wire128[(3'h6):(1'h0)];
          if (wire127)
            begin
              reg135 <= $unsigned((((~^{wire131}) ?
                  {{reg134, reg133}} : {(reg134 ? wire127 : reg133),
                      ((8'hae) << reg133)}) == {$unsigned((7'h42)),
                  $signed($signed(wire123))}));
              reg136 <= (reg135 ? wire124 : reg134[(3'h6):(3'h5)]);
              reg137 <= ($signed(wire128[(4'he):(4'ha)]) ^~ ($unsigned($signed((reg136 << reg135))) ?
                  $signed(wire123) : $signed((8'hb5))));
              reg138 <= ((({$signed(wire130)} ?
                          reg133[(4'hb):(4'h8)] : wire128[(1'h0):(1'h0)]) ?
                      ($unsigned((~^reg134)) != (^~(^~reg137))) : (wire130[(5'h12):(2'h2)] ?
                          (^(~|reg133)) : wire128)) ?
                  ((wire129[(1'h1):(1'h0)] & (wire128 ?
                          wire123[(5'h13):(4'he)] : reg134[(3'h6):(1'h1)])) ?
                      {($unsigned(reg134) ?
                              (wire127 < reg133) : {wire128})} : wire125[(4'hc):(2'h3)]) : reg137);
            end
          else
            begin
              reg135 <= ((wire128[(4'h9):(3'h5)] ^ wire125) ^~ reg138);
              reg136 <= {wire128[(3'h6):(2'h3)]};
              reg137 <= {reg136};
              reg138 <= reg132[(4'h8):(3'h7)];
            end
        end
      else
        begin
          reg132 <= (&{wire123});
          reg133 <= $unsigned(wire130[(3'h7):(3'h7)]);
          reg134 <= ((~|reg136) ?
              ({wire123[(4'hd):(4'hd)],
                  ((wire128 | reg133) > wire123)} >>> $unsigned({(~^(8'hbf))})) : $signed((reg133 ^ (wire131[(2'h3):(2'h3)] ?
                  {(8'haa)} : (~|reg135)))));
        end
      reg139 <= $signed((reg132[(3'h5):(3'h5)] & reg137));
      reg140 <= (8'haf);
      reg141 <= (-wire126);
      if ($unsigned($unsigned((~{(wire129 >>> wire127)}))))
        begin
          reg142 <= $unsigned($signed($unsigned((|(wire126 <= reg140)))));
          reg143 <= $unsigned($unsigned(reg133));
          if ((|($unsigned({$signed(wire131), reg138[(4'hb):(2'h2)]}) ?
              (wire124 - (~^reg132)) : ((reg132[(4'h8):(2'h3)] ~^ (~^reg138)) + reg136))))
            begin
              reg144 <= (reg137 ?
                  $unsigned($unsigned(($signed(wire123) && (wire126 >>> reg132)))) : $unsigned(($signed((reg142 ?
                      wire125 : wire128)) * $unsigned({(8'h9f)}))));
              reg145 <= (((+$unsigned((reg134 ? reg133 : wire130))) ?
                  (wire130 ?
                      {$unsigned(reg133),
                          ((8'ha5) ?
                              reg141 : (8'hb7))} : reg139[(2'h3):(2'h3)]) : ($unsigned(wire128[(5'h13):(4'hd)]) ?
                      wire128 : reg137)) + {(+($unsigned(wire124) * (~wire123))),
                  wire126[(1'h1):(1'h1)]});
            end
          else
            begin
              reg144 <= $signed({$unsigned(($unsigned(reg132) ?
                      $unsigned(reg145) : reg138)),
                  reg139[(4'hf):(4'hf)]});
              reg145 <= (+$unsigned($signed({((8'ha2) ? wire127 : wire123),
                  $unsigned(reg134)})));
              reg146 <= (&($signed($signed((~^wire131))) ?
                  wire123[(5'h12):(5'h10)] : (7'h44)));
              reg147 <= wire126[(1'h1):(1'h1)];
            end
        end
      else
        begin
          if ($signed($signed($signed(reg135))))
            begin
              reg142 <= wire129[(2'h3):(2'h3)];
              reg143 <= $unsigned($signed((((-(8'ha8)) ?
                  (|reg143) : wire127[(4'ha):(3'h5)]) ^~ reg139)));
              reg144 <= {reg139[(3'h4):(1'h1)], $signed(reg142)};
            end
          else
            begin
              reg142 <= {(&(wire130[(4'hc):(1'h0)] ?
                      ($unsigned(reg133) == {wire123}) : $signed($unsigned(reg136)))),
                  {(+((!wire125) ?
                          ((7'h44) <= wire129) : reg139[(4'hb):(2'h2)])),
                      reg143[(4'hd):(4'ha)]}};
              reg143 <= wire125[(3'h4):(2'h2)];
              reg144 <= $signed(({(!$signed((8'hb0)))} ?
                  reg140[(3'h4):(2'h3)] : ($signed((reg140 ^~ wire128)) ?
                      ($unsigned(reg146) <<< reg137[(2'h2):(1'h1)]) : (reg143 > reg135[(2'h3):(1'h1)]))));
              reg145 <= {($signed(reg142) ?
                      (~^$unsigned(((8'hb9) ?
                          (8'ha1) : reg141))) : {($signed(wire129) | wire127),
                          wire129}),
                  $signed((((~&reg137) ?
                          reg138[(4'hb):(2'h2)] : $unsigned(reg145)) ?
                      $signed($signed((8'ha6))) : $unsigned(((8'hb4) ?
                          (8'hbd) : reg134))))};
              reg146 <= {($unsigned($unsigned($unsigned(reg145))) ^~ ($unsigned(wire126[(1'h0):(1'h0)]) ?
                      (&$signed(wire125)) : reg136))};
            end
          reg147 <= reg141;
          reg148 <= {reg143, (reg144[(4'h9):(2'h2)] != reg141[(1'h0):(1'h0)])};
        end
    end
  always
    @(posedge clk) begin
      reg149 <= reg136[(5'h10):(4'hf)];
      if ((($signed($signed({wire123,
          reg145})) * $unsigned($signed($unsigned(wire126)))) != reg137[(3'h5):(3'h5)]))
        begin
          if (wire126[(1'h1):(1'h0)])
            begin
              reg150 <= reg137[(2'h3):(1'h0)];
              reg151 <= (((reg133 ?
                          (~|{reg135, reg149}) : ((reg135 ^~ reg138) * {wire128,
                              reg146})) ?
                      $signed($signed((reg139 && reg145))) : $unsigned({$signed((8'h9f))})) ?
                  (8'hb7) : (8'hb1));
              reg152 <= wire130[(3'h5):(3'h5)];
              reg153 <= ($signed((((reg138 >= reg134) ?
                  $unsigned(wire129) : $signed(wire128)) == (reg144[(4'ha):(2'h2)] * wire127[(4'hc):(3'h6)]))) ^ $signed($unsigned($signed($unsigned(reg144)))));
            end
          else
            begin
              reg150 <= ($unsigned((({(7'h42)} ?
                      (reg143 ? wire123 : reg138) : (reg148 ?
                          (8'haa) : reg152)) ?
                  (~(reg149 ? wire123 : reg142)) : (~|{wire124,
                      reg143}))) ^~ {reg151, {reg133[(2'h2):(1'h1)], wire124}});
              reg151 <= (reg151 + reg136[(3'h4):(1'h0)]);
              reg152 <= wire130;
              reg153 <= (|(&$signed((^~$signed(reg152)))));
              reg154 <= $unsigned(reg133[(4'hc):(3'h7)]);
            end
          if ($signed((^$unsigned(((~&reg148) ?
              (reg150 >> wire129) : reg145)))))
            begin
              reg155 <= $signed($signed($signed($signed((wire130 > wire126)))));
              reg156 <= reg146;
              reg157 <= reg135[(3'h6):(3'h5)];
            end
          else
            begin
              reg155 <= $unsigned((~^$signed(reg134[(3'h7):(2'h3)])));
            end
          reg158 <= (|($unsigned(reg137) & $signed({(reg133 ?
                  wire126 : wire126),
              (reg149 > reg153)})));
          reg159 <= $signed(wire127);
        end
      else
        begin
          reg150 <= (~|$signed($unsigned($signed((wire124 >> reg156)))));
          if ($signed((!$unsigned($signed((&reg155))))))
            begin
              reg151 <= (({(^(reg157 != reg138))} ?
                  ((!(reg158 ^ wire131)) | $signed($signed(reg144))) : reg148[(2'h2):(2'h2)]) == $unsigned(wire125));
              reg152 <= reg151;
              reg153 <= {((((reg133 ?
                      reg133 : reg156) < $unsigned(reg142)) - reg139[(4'ha):(1'h0)]) < $signed(reg137[(4'hd):(4'hd)]))};
            end
          else
            begin
              reg151 <= ($unsigned($unsigned((~|(&(8'ha9))))) ?
                  $unsigned({(~|(!reg143)),
                      (-$signed((8'hb7)))}) : (($unsigned((reg151 >= wire129)) | $signed($signed((8'ha2)))) ?
                      $signed((^~$signed(reg135))) : (~^reg150[(5'h11):(4'h8)])));
              reg152 <= $signed($signed((~|$unsigned($signed(reg158)))));
              reg153 <= (8'hbc);
              reg154 <= $unsigned((reg149[(1'h1):(1'h0)] ?
                  ((reg144 ?
                      (8'ha3) : wire131) - (+(reg157 <<< reg144))) : $signed($unsigned((8'hae)))));
            end
          reg155 <= reg148[(1'h1):(1'h1)];
          reg156 <= reg145[(1'h1):(1'h0)];
          reg157 <= {$unsigned({(~^(reg151 ? reg132 : (8'hb8))), reg137})};
        end
      reg160 <= reg153[(4'h9):(1'h1)];
      reg161 <= (&reg139[(4'hb):(2'h3)]);
      reg162 <= $unsigned($signed($signed(reg138)));
    end
  assign wire163 = (|wire131[(2'h3):(2'h3)]);
endmodule

module module76  (y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire81;
  input wire [(4'hc):(1'h0)] wire80;
  input wire [(2'h3):(1'h0)] wire79;
  input wire [(3'h6):(1'h0)] wire78;
  input wire [(3'h5):(1'h0)] wire77;
  wire [(3'h4):(1'h0)] wire113;
  wire [(3'h6):(1'h0)] wire112;
  wire signed [(5'h10):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(5'h12):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(4'hc):(1'h0)] wire106;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(5'h12):(1'h0)] wire102;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire82;
  reg signed [(4'h8):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(3'h4):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg [(5'h14):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire103,
                 wire102,
                 wire101,
                 wire85,
                 wire82,
                 reg105,
                 reg104,
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
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire82 = (8'hbb);
  always
    @(posedge clk) begin
      reg83 <= (^wire77[(3'h4):(1'h0)]);
      reg84 <= wire81;
    end
  assign wire85 = (wire79 ?
                      $signed({(~^(~wire81))}) : $unsigned(($unsigned((|(8'ha5))) ?
                          (7'h42) : ({wire79, wire79} ~^ $unsigned(wire79)))));
  always
    @(posedge clk) begin
      if ({wire80})
        begin
          reg86 <= wire85;
        end
      else
        begin
          reg86 <= $signed((wire82[(2'h3):(2'h2)] ?
              $signed(wire85) : (reg84[(1'h1):(1'h0)] ?
                  $signed(reg83[(3'h5):(1'h0)]) : $unsigned((wire79 - reg84)))));
          reg87 <= $signed($signed(wire80[(4'hc):(3'h6)]));
          reg88 <= reg83;
          reg89 <= {wire78[(2'h2):(1'h1)],
              $signed($unsigned($signed($unsigned(reg84))))};
        end
      if (wire79[(1'h1):(1'h1)])
        begin
          reg90 <= $signed(reg87);
          if (((reg90[(3'h4):(3'h4)] > {reg90[(1'h0):(1'h0)],
                  $unsigned(reg88)}) ?
              ((((!wire77) >> reg88[(3'h6):(2'h2)]) ~^ {$signed(wire79)}) & wire81) : $unsigned((reg89 ?
                  ((reg88 >= reg84) ?
                      $signed(wire82) : $unsigned((8'ha8))) : wire81[(4'hc):(3'h7)]))))
            begin
              reg91 <= ((^~($unsigned((reg89 && wire79)) ?
                      (8'hbc) : {(reg88 ? reg89 : wire79),
                          (wire77 << wire85)})) ?
                  wire81[(4'h8):(2'h3)] : (+reg90[(2'h3):(2'h3)]));
              reg92 <= ((wire80[(3'h5):(3'h5)] ?
                  ($signed(reg83[(3'h4):(2'h3)]) ?
                      ($unsigned(reg91) ?
                          $signed(wire85) : (reg83 ?
                              reg88 : reg89)) : $signed((wire78 ?
                          reg90 : reg87))) : {$signed({(8'h9e), wire82}),
                      (~&(+(8'hbc)))}) & $unsigned($unsigned({$signed(reg89),
                  $signed((8'hb3))})));
              reg93 <= reg89[(1'h1):(1'h0)];
              reg94 <= reg84[(4'ha):(3'h5)];
              reg95 <= (|reg93[(2'h2):(1'h0)]);
            end
          else
            begin
              reg91 <= $unsigned((($unsigned($signed(reg88)) ?
                  (^~$unsigned(reg84)) : $unsigned((reg91 ?
                      wire80 : wire78))) | (^$unsigned(reg91[(3'h4):(1'h1)]))));
              reg92 <= {reg87, reg94};
              reg93 <= ((reg84[(4'h8):(3'h5)] + ({$unsigned((7'h41))} ?
                      (wire80[(3'h7):(1'h0)] ?
                          $signed((7'h43)) : $unsigned(wire80)) : $signed(reg86[(1'h0):(1'h0)]))) ?
                  wire79 : wire81[(4'h8):(2'h2)]);
              reg94 <= $unsigned(reg84);
            end
          if ((8'had))
            begin
              reg96 <= ((-$signed(({wire78} > (+reg86)))) <= $signed($unsigned({(~reg84)})));
              reg97 <= reg90[(3'h6):(3'h4)];
              reg98 <= $signed($unsigned(reg97[(2'h2):(1'h1)]));
              reg99 <= (~(wire77[(3'h5):(3'h5)] == ((~^(reg89 - (8'hab))) < wire79[(1'h1):(1'h1)])));
              reg100 <= $signed(wire81);
            end
          else
            begin
              reg96 <= $unsigned(({(&(8'hbd)),
                  reg92} >>> ($signed({(8'ha0)}) & {$unsigned(reg88)})));
              reg97 <= $unsigned(reg87);
              reg98 <= reg88[(3'h4):(2'h2)];
              reg99 <= $signed($signed($unsigned($unsigned($unsigned((8'hae))))));
              reg100 <= wire85;
            end
        end
      else
        begin
          if (reg87)
            begin
              reg90 <= $signed((((reg100 ^~ reg91[(2'h3):(1'h1)]) >> $unsigned((reg94 ?
                  reg96 : reg88))) >> $signed({$unsigned(reg84)})));
            end
          else
            begin
              reg90 <= reg84;
              reg91 <= reg92[(5'h14):(4'h8)];
            end
          reg92 <= reg87;
        end
    end
  assign wire101 = {$signed(reg100), reg94[(2'h3):(2'h2)]};
  assign wire102 = (($signed(((&(8'ha0)) ?
                       (~&reg90) : reg99[(3'h4):(2'h3)])) | $unsigned(wire78[(3'h5):(3'h4)])) + reg83[(2'h2):(1'h0)]);
  assign wire103 = reg99;
  always
    @(posedge clk) begin
      reg104 <= (7'h43);
    end
  always
    @(posedge clk) begin
      reg105 <= {$signed(wire101[(3'h5):(2'h3)]), reg87};
    end
  assign wire106 = ((~$unsigned(((reg90 ? reg97 : reg90) ?
                       $unsigned(reg92) : reg94))) - $unsigned(wire81));
  assign wire107 = ($unsigned($signed(wire85)) * ((~^($signed(reg84) <<< reg93)) ?
                       wire79 : $signed(wire102)));
  assign wire108 = (($signed((|((8'hbe) != (8'hb8)))) ^~ (8'hac)) ?
                       ((reg88[(2'h3):(2'h2)] ?
                               {wire78, {wire101}} : (~&{wire80})) ?
                           wire80[(4'hc):(2'h3)] : (|(reg93[(2'h2):(2'h2)] || (reg99 ?
                               reg97 : wire102)))) : ((((wire79 ?
                                   wire102 : reg96) ?
                               (reg100 >> (8'haf)) : (reg93 ?
                                   wire107 : wire107)) != $unsigned(wire103[(2'h2):(2'h2)])) ?
                           (~&(+{wire103, wire77})) : (8'hb7)));
  assign wire109 = ((reg90 ^ $unsigned((^(wire81 >> reg93)))) ?
                       ($signed((~&$signed(wire79))) ?
                           (^(8'hb9)) : ($signed(wire108) != (reg83[(4'h9):(3'h6)] + (wire77 ?
                               wire106 : reg90)))) : reg92[(5'h14):(4'h9)]);
  assign wire110 = $unsigned(reg93[(3'h5):(2'h2)]);
  assign wire111 = (((+$signed(reg99)) ?
                           $unsigned(reg97[(2'h3):(1'h1)]) : $unsigned((^(^~reg104)))) ?
                       $signed(wire106) : (|((reg104 || (wire107 ?
                               reg90 : (8'hbc))) ?
                           reg92[(5'h11):(4'hb)] : ($unsigned(wire109) ?
                               (wire106 ? wire80 : reg84) : ((8'haf) ?
                                   (8'ha2) : (8'haa))))));
  assign wire112 = {(($unsigned((-wire102)) > ($signed(reg96) ?
                           wire101[(4'h9):(1'h1)] : ((8'ha2) ?
                               reg92 : reg86))) != $unsigned(wire110[(2'h2):(1'h0)])),
                       $signed($signed($unsigned(wire109[(4'hd):(4'hd)])))};
  assign wire113 = reg105[(2'h2):(2'h2)];
endmodule
