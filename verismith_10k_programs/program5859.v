module top
#(parameter param169 = ({(8'ha1), {{((8'hbf) ? (7'h44) : (8'hb7)), (^~(7'h44))}, (~(-(8'h9c)))}} == {((^(7'h42)) == (((8'hb0) <<< (8'hb5)) ? {(8'ha5), (8'ha4)} : ((8'hbb) << (8'ha4))))}), 
parameter param170 = ((param169 < (param169 ^~ (~&param169))) ? ((^~((^~(7'h43)) ? (param169 ^~ param169) : (8'hb4))) & (param169 ? (param169 || param169) : {param169})) : {(~(((8'hab) >= param169) + {param169, param169})), (8'hbb)}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire168;
  wire [(5'h14):(1'h0)] wire167;
  wire signed [(4'hf):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire165;
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  assign y = {wire168,
                 wire167,
                 wire44,
                 wire24,
                 wire22,
                 wire53,
                 wire54,
                 wire55,
                 wire165,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 (1'h0)};
  module4 #() modinst23 (.clk(clk), .wire7(wire2), .y(wire22), .wire5(wire1), .wire6(wire3), .wire8(wire0));
  assign wire24 = $signed(wire1);
  module25 #() modinst45 (wire44, clk, wire0, wire2, wire3, wire22, wire1);
  always
    @(posedge clk) begin
      reg46 <= wire0[(3'h6):(1'h0)];
      if ((((8'hbb) << ({wire3[(1'h1):(1'h1)],
          wire0[(1'h1):(1'h0)]} | ($unsigned(wire24) ?
          wire22[(1'h0):(1'h0)] : $signed((8'ha8))))) >>> $signed({wire24})))
        begin
          reg47 <= (&$signed(wire44));
          reg48 <= wire44[(4'ha):(3'h7)];
          if (((wire3 ?
              $signed(($unsigned(wire0) ?
                  (+wire2) : reg48[(1'h0):(1'h0)])) : (+(reg47[(3'h7):(3'h5)] ?
                  (^~reg48) : (wire2 ?
                      (8'ha3) : (8'ha1))))) != (wire3[(4'ha):(1'h1)] >>> wire3[(1'h1):(1'h1)])))
            begin
              reg49 <= (!$signed($signed(wire1)));
            end
          else
            begin
              reg49 <= $unsigned({$unsigned((~&{wire1}))});
              reg50 <= reg48[(1'h1):(1'h1)];
              reg51 <= {({($unsigned(wire2) ?
                              (reg47 ? wire0 : reg50) : (wire2 ?
                                  (8'ha4) : reg50)),
                          wire44} ?
                      {reg47} : $signed($unsigned((|wire1))))};
            end
          reg52 <= ((reg48 ?
                  ($signed({reg50,
                      reg47}) == (7'h40)) : $signed($unsigned($signed(wire2)))) ?
              ((!$unsigned($signed((8'ha2)))) ?
                  $unsigned((&(reg48 ? wire24 : reg49))) : {wire24,
                      {reg50}}) : $signed($unsigned(((wire0 && wire3) - (~&wire1)))));
        end
      else
        begin
          reg47 <= $unsigned(wire1);
          reg48 <= $unsigned({(($signed((8'ha7)) < (~^(8'ha8))) & $signed((wire1 ?
                  wire24 : wire1)))});
          reg49 <= wire24[(2'h2):(2'h2)];
          reg50 <= $signed((((reg52 ?
              ((8'hb8) ?
                  wire0 : wire44) : (wire24 ~^ wire44)) >>> ($signed(wire0) ?
              wire1[(4'ha):(1'h0)] : reg47)) << reg52[(2'h3):(2'h2)]));
        end
    end
  assign wire53 = reg47[(4'ha):(2'h3)];
  assign wire54 = $unsigned(($signed((reg52 ?
                      (^wire53) : $signed(wire0))) ^ reg47[(4'ha):(2'h2)]));
  assign wire55 = reg51[(4'ha):(3'h5)];
  module56 #() modinst166 (.clk(clk), .y(wire165), .wire60(reg46), .wire58(wire53), .wire59(wire55), .wire57(wire3));
  assign wire167 = ($unsigned(reg47[(3'h6):(1'h0)]) << wire53[(4'h8):(3'h5)]);
  assign wire168 = (+{$signed((^$signed(reg52))),
                       ($unsigned($unsigned(reg47)) >>> $signed(wire167[(2'h2):(2'h2)]))});
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h1dd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire60;
  input wire signed [(4'hf):(1'h0)] wire59;
  input wire signed [(4'h8):(1'h0)] wire58;
  input wire signed [(4'hc):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire164;
  wire [(4'he):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire [(4'hf):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire signed [(2'h2):(1'h0)] wire61;
  reg [(3'h6):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg162 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg160 = (1'h0);
  reg [(3'h7):(1'h0)] reg159 = (1'h0);
  reg [(4'hc):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg [(3'h5):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg154 = (1'h0);
  reg [(2'h2):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(4'hd):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg149 = (1'h0);
  reg signed [(4'he):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  assign y = {wire164,
                 wire145,
                 wire81,
                 wire80,
                 wire79,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg163,
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
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 (1'h0)};
  assign wire61 = $signed(wire57[(3'h6):(3'h6)]);
  assign wire62 = wire57;
  assign wire63 = $signed((!$signed((wire57 * $unsigned((8'hbc))))));
  assign wire64 = wire59[(3'h4):(2'h2)];
  assign wire65 = $signed($unsigned(($signed($signed(wire62)) ?
                      ($signed((8'haf)) - (wire62 >> wire62)) : $unsigned({wire63}))));
  assign wire66 = ($unsigned(($signed((wire58 ?
                          wire63 : (7'h42))) & $signed($unsigned(wire57)))) ?
                      wire58[(2'h2):(2'h2)] : (^~wire58[(1'h1):(1'h0)]));
  assign wire67 = ($unsigned({wire59}) != ((~|(^wire65[(4'hf):(3'h5)])) < (8'hbb)));
  assign wire68 = (wire66[(2'h2):(2'h2)] <= wire61[(1'h1):(1'h1)]);
  assign wire69 = {(wire57 >= (~|(8'ha2))), $unsigned((&{wire67}))};
  always
    @(posedge clk) begin
      reg70 <= $signed($signed($unsigned(($signed(wire57) ?
          (|wire57) : $unsigned(wire58)))));
      reg71 <= $signed(wire58[(1'h1):(1'h0)]);
      if ($signed(wire68))
        begin
          reg72 <= (^((($signed(wire65) ? $signed(wire66) : $signed((8'ha3))) ?
              (~^wire64[(1'h0):(1'h0)]) : ((~|wire64) || (reg71 != wire64))) == wire61));
          reg73 <= wire60[(1'h1):(1'h0)];
          reg74 <= ($signed($signed((wire63 - $signed(wire64)))) < ((wire58 >>> ({wire68,
                  reg70} - (!wire68))) ?
              (~|(reg71[(1'h0):(1'h0)] ?
                  {wire57, wire61} : (wire60 ?
                      wire61 : wire62))) : ($signed(wire64) >= wire66[(2'h2):(1'h1)])));
        end
      else
        begin
          reg72 <= ($signed(reg74[(3'h7):(2'h3)]) < $unsigned(wire69[(1'h0):(1'h0)]));
          reg73 <= $unsigned((wire69 ?
              ($unsigned((-wire58)) ?
                  $unsigned((reg70 ?
                      wire61 : wire68)) : (~&(~&reg72))) : $unsigned($signed((wire65 ?
                  reg73 : wire62)))));
          reg74 <= wire63[(3'h4):(1'h0)];
          reg75 <= $signed((|(^~($unsigned(wire66) ?
              (&wire66) : ((8'h9e) >= wire61)))));
          reg76 <= ($signed(wire60) && (wire60[(3'h6):(2'h3)] ?
              ((8'ha3) || $signed((^wire67))) : ($signed(reg70[(4'h9):(4'h8)]) ?
                  $unsigned(wire61) : wire66)));
        end
      reg77 <= $signed(reg73);
      reg78 <= ($unsigned($unsigned($signed(wire65))) ?
          ((-$unsigned({wire57, wire67})) ?
              (($signed(wire69) == {wire61}) ?
                  {(reg71 << reg77)} : $unsigned(reg71)) : $signed($signed((wire57 * reg72)))) : wire65);
    end
  assign wire79 = $unsigned({($unsigned(wire67[(4'he):(4'hd)]) || $unsigned($signed(wire62)))});
  assign wire80 = wire66[(2'h2):(2'h2)];
  assign wire81 = wire61[(1'h1):(1'h1)];
  module82 #() modinst146 (wire145, clk, wire65, wire59, wire63, reg76, wire67);
  always
    @(posedge clk) begin
      reg147 <= wire62[(2'h3):(1'h1)];
      reg148 <= $signed(reg74[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg149 <= $unsigned($signed($unsigned($unsigned((&wire63)))));
      reg150 <= reg76[(2'h2):(1'h1)];
      if (((($signed((wire62 && wire64)) >>> wire67) ?
              wire60[(4'h8):(1'h0)] : $signed(((wire65 ? (8'hb1) : (8'h9e)) ?
                  {reg75, wire80} : (reg74 ? reg71 : wire81)))) ?
          ($signed($unsigned((wire63 ? wire59 : reg147))) ?
              (~(reg147 ?
                  $unsigned(wire69) : $signed(wire60))) : wire63[(2'h2):(2'h2)]) : $unsigned(reg150)))
        begin
          if ($signed(($unsigned((~^reg73)) <= (~^({wire68, reg74} ?
              ((7'h40) ? wire57 : wire66) : {reg78, reg75})))))
            begin
              reg151 <= (($unsigned((+((8'hb1) | (8'hb2)))) ^ (reg72 ?
                      ($signed(reg78) < $unsigned((7'h42))) : {reg71[(1'h0):(1'h0)],
                          wire62[(2'h2):(1'h0)]})) ?
                  wire62[(1'h0):(1'h0)] : (&wire61[(1'h1):(1'h0)]));
            end
          else
            begin
              reg151 <= reg77[(4'h9):(2'h2)];
              reg152 <= (^$unsigned(($unsigned((!reg77)) <= (8'hba))));
            end
          reg153 <= reg74[(3'h5):(1'h0)];
          if ($signed(reg78[(3'h5):(3'h4)]))
            begin
              reg154 <= (~&wire80[(4'h8):(1'h0)]);
              reg155 <= (+($signed({$signed(wire81)}) ?
                  ($signed(wire57[(4'ha):(2'h2)]) <= (^~$signed((8'hb8)))) : ((8'hbc) <<< ($signed(reg77) && wire64))));
            end
          else
            begin
              reg154 <= {(reg74 ?
                      $unsigned(({reg73, reg76} ?
                          (reg148 ?
                              reg71 : wire67) : $signed((8'ha7)))) : $signed($unsigned($signed(wire145))))};
              reg155 <= wire57;
            end
          reg156 <= reg147[(4'hb):(3'h6)];
        end
      else
        begin
          if ((((|((8'ha9) ? (7'h44) : (wire61 | (8'haa)))) ?
                  (wire79 ?
                      wire63[(2'h3):(2'h3)] : reg72[(4'hf):(4'hd)]) : ((wire57[(4'h8):(2'h3)] ~^ (wire60 < wire65)) >>> $signed($signed(reg150)))) ?
              (($unsigned(wire58) < wire80[(2'h3):(2'h2)]) >= $unsigned(($signed(reg156) ?
                  reg148[(1'h1):(1'h0)] : wire67[(2'h3):(1'h1)]))) : reg73[(4'h9):(4'h9)]))
            begin
              reg151 <= (^wire58);
              reg152 <= $unsigned(reg151);
              reg153 <= (wire80 ?
                  (($unsigned((&reg151)) >> $unsigned(reg70)) ?
                      $signed((^~(reg155 ?
                          wire81 : wire79))) : wire66) : (^~reg70));
              reg154 <= $signed((!($unsigned(reg76[(1'h1):(1'h1)]) >>> $signed(reg150[(4'h8):(2'h3)]))));
              reg155 <= (reg72[(3'h4):(3'h4)] ?
                  $signed(reg156) : ((^reg149[(1'h0):(1'h0)]) <<< ((((8'hac) >= (7'h40)) ?
                          $signed(wire79) : ((8'ha0) ? wire81 : (8'hab))) ?
                      ($unsigned(reg148) ?
                          (!(8'haf)) : ((8'hb3) | reg70)) : $signed($signed(wire60)))));
            end
          else
            begin
              reg151 <= $signed($unsigned(reg70));
              reg152 <= ($signed(wire79[(4'ha):(4'ha)]) ?
                  $signed((~^((^~reg151) ?
                      (wire80 ?
                          wire81 : reg152) : $unsigned(wire63)))) : {((^$signed(wire80)) ?
                          $unsigned(wire59) : $signed((reg77 ~^ wire60)))});
              reg153 <= reg74[(3'h7):(1'h0)];
              reg154 <= {(~|wire68[(4'h8):(2'h2)])};
              reg155 <= ((^$signed(reg154[(4'hc):(4'h8)])) >> (wire57[(4'h9):(4'h8)] < ($unsigned($signed((8'hbf))) == $signed(wire66))));
            end
        end
      if ($unsigned($signed($unsigned(((reg152 > (8'hb9)) ?
          (~&reg71) : wire58[(2'h2):(2'h2)])))))
        begin
          reg157 <= $signed((reg78 ?
              ({(wire80 != reg156)} ?
                  (reg77[(3'h5):(3'h5)] * ((8'haa) ?
                      reg154 : wire61)) : reg147[(5'h11):(3'h7)]) : {reg147[(5'h13):(5'h12)]}));
        end
      else
        begin
          reg157 <= reg75;
          if ((~^$unsigned({(~|$unsigned(reg149)), wire67[(1'h1):(1'h0)]})))
            begin
              reg158 <= (8'hbc);
              reg159 <= $signed($unsigned(($signed(wire58[(3'h5):(3'h4)]) ?
                  (wire63 < (^wire58)) : ($signed(reg158) ?
                      $signed(reg75) : reg155[(1'h1):(1'h0)]))));
              reg160 <= reg71[(2'h3):(1'h1)];
            end
          else
            begin
              reg158 <= reg153;
              reg159 <= reg73;
              reg160 <= (~(8'ha5));
              reg161 <= $unsigned($unsigned((^wire60[(4'hf):(4'hd)])));
              reg162 <= (($signed(((reg150 ? reg155 : wire65) ?
                  (reg71 | (8'haf)) : {(7'h41)})) != wire67[(3'h4):(2'h3)]) >= $unsigned(reg70));
            end
          reg163 <= reg75[(2'h2):(1'h0)];
        end
    end
  assign wire164 = (^~(~&reg149));
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  input wire [(4'hc):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire43;
  wire signed [(5'h14):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire31;
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 reg37,
                 reg32,
                 (1'h0)};
  assign wire31 = ($unsigned(((|wire29[(2'h3):(1'h0)]) ?
                      (^~(wire26 ? (8'hbf) : wire28)) : (((8'ha5) ?
                              wire29 : wire28) ?
                          $unsigned(wire27) : $signed((8'h9c))))) ^~ wire26);
  always
    @(posedge clk) begin
      reg32 <= wire27[(4'ha):(3'h5)];
    end
  assign wire33 = (((^~(wire30[(1'h0):(1'h0)] > (wire26 ?
                      (8'haa) : reg32))) || wire27[(3'h6):(3'h5)]) & ($unsigned(wire28) ?
                      wire30[(2'h2):(1'h0)] : {wire30[(2'h2):(1'h1)],
                          (&(wire31 ? wire28 : wire29))}));
  assign wire34 = $signed(wire29[(3'h5):(1'h0)]);
  assign wire35 = $signed((+((((8'hb0) && (8'ha5)) ?
                      (wire26 * (7'h41)) : (~&wire28)) <<< (wire33[(1'h0):(1'h0)] ?
                      $signed(wire26) : wire33[(1'h1):(1'h0)]))));
  assign wire36 = ((8'ha2) ?
                      {$unsigned((~^$unsigned((7'h44)))),
                          ((8'ha1) ^ wire35)} : {$unsigned((~^$signed(wire30))),
                          ($signed(wire35) && (-$unsigned((7'h43))))});
  always
    @(posedge clk) begin
      reg37 <= wire29;
    end
  assign wire38 = ($unsigned($signed((^wire33))) - $unsigned(((^$unsigned(wire35)) > ((^~wire28) ^~ wire31[(1'h1):(1'h0)]))));
  assign wire39 = ({wire29} >= (~^$unsigned($unsigned(reg37[(3'h5):(1'h1)]))));
  assign wire40 = wire35;
  assign wire41 = wire29;
  assign wire42 = $signed(wire27[(3'h7):(1'h1)]);
  assign wire43 = $signed((&(^wire31)));
endmodule

module module4
#(parameter param21 = {{(({(8'h9c), (8'haa)} + (^(8'h9c))) ? (((8'h9f) >= (8'ha1)) ^~ ((8'had) >> (8'ha1))) : ((~^(8'hb1)) || (+(8'h9c)))), ((((7'h42) >>> (8'hae)) | (|(8'hb4))) ^ (~^((8'h9c) | (8'haa))))}, {((+((7'h40) * (8'ha9))) ? {((8'had) ? (8'ha5) : (8'hb0))} : (~|(~(8'haa)))), ((((8'ha1) != (8'h9c)) && (!(7'h44))) ? {((8'hbb) ^~ (8'haf))} : (-((8'h9e) ? (8'h9d) : (8'hb3))))}})
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  input wire signed [(3'h4):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire20;
  wire [(3'h6):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(5'h10):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = wire5[(3'h4):(1'h0)];
  assign wire10 = wire6[(1'h1):(1'h0)];
  assign wire11 = {(^({(wire10 < wire7)} ?
                          ((^~wire10) ? (^wire10) : (!wire8)) : ({wire6,
                              wire10} ^ wire9)))};
  assign wire12 = $unsigned(wire10);
  assign wire13 = wire11[(1'h1):(1'h1)];
  assign wire14 = $signed((wire10[(1'h0):(1'h0)] ?
                      (wire11[(4'h9):(3'h6)] ?
                          wire11 : {$signed(wire10)}) : wire6[(2'h2):(1'h0)]));
  assign wire15 = $unsigned($unsigned(wire7));
  assign wire16 = {wire9[(2'h2):(1'h1)]};
  assign wire17 = $unsigned(wire6[(1'h0):(1'h0)]);
  assign wire18 = $unsigned(({((wire11 ? wire14 : wire9) ? (8'hac) : wire8),
                      {$unsigned((8'ha8))}} + {wire14[(2'h2):(1'h0)]}));
  assign wire19 = $unsigned(wire8[(2'h2):(1'h1)]);
  assign wire20 = $signed($signed($signed(wire19[(1'h1):(1'h0)])));
endmodule

module module82  (y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h27d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire87;
  input wire signed [(4'hd):(1'h0)] wire86;
  input wire signed [(4'he):(1'h0)] wire85;
  input wire signed [(3'h7):(1'h0)] wire84;
  input wire [(4'h8):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire106;
  wire [(4'h9):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire103;
  wire signed [(4'hf):(1'h0)] wire102;
  wire [(2'h3):(1'h0)] wire101;
  wire [(5'h13):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire88;
  reg signed [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg138 = (1'h0);
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(5'h10):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(2'h2):(1'h0)] reg133 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(4'hb):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(5'h14):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg [(3'h4):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(2'h3):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(4'hd):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(5'h10):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg138,
                 reg137,
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
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg89,
                 (1'h0)};
  assign wire88 = ((~^(~|wire86)) ? wire86 : wire87[(4'h9):(2'h2)]);
  always
    @(posedge clk) begin
      reg89 <= $signed({{wire88, (wire84 != $unsigned(wire87))}});
    end
  assign wire90 = ($signed((((wire85 ? (8'hbc) : wire86) ?
                      (wire83 && wire87) : (wire84 ?
                          (8'ha7) : wire84)) | $signed($unsigned((8'hbd))))) ~^ $unsigned($signed($unsigned($signed(wire85)))));
  assign wire91 = wire86[(2'h3):(2'h3)];
  assign wire92 = (reg89[(4'h9):(2'h2)] <<< wire88[(5'h14):(5'h13)]);
  assign wire93 = wire85[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      if ((~|((^~$unsigned((wire91 > wire91))) ?
          wire83[(1'h0):(1'h0)] : $unsigned(wire84))))
        begin
          reg94 <= ((!(8'hbf)) ?
              wire83 : (({wire86} ?
                  (-(~wire85)) : wire84) ^~ $unsigned((^(8'h9c)))));
          reg95 <= (|(~^{(~^$signed((7'h44)))}));
          reg96 <= wire93;
        end
      else
        begin
          if (wire85)
            begin
              reg94 <= wire87[(3'h7):(1'h1)];
              reg95 <= $unsigned((~{wire84[(1'h1):(1'h1)],
                  {reg95, $unsigned(reg95)}}));
            end
          else
            begin
              reg94 <= {$unsigned(($unsigned((^wire84)) ^ (~&wire84[(1'h1):(1'h1)])))};
            end
          reg96 <= wire93;
          reg97 <= $signed(($signed(($signed(wire86) ^ {reg94, wire85})) ?
              wire85[(4'h9):(4'h9)] : (~|$signed(wire85[(3'h7):(1'h0)]))));
        end
      reg98 <= $unsigned((8'hbc));
      reg99 <= ($signed($unsigned(wire90)) ?
          $signed(reg96) : $unsigned((((~|reg96) ?
              wire88 : (~reg98)) >= (8'hae))));
      reg100 <= (8'hb7);
    end
  assign wire101 = wire93[(3'h4):(3'h4)];
  assign wire102 = wire87;
  assign wire103 = $signed($unsigned((~|$unsigned(((8'hb8) ?
                       (8'hba) : (8'hb6))))));
  assign wire104 = reg97;
  assign wire105 = {($signed(($unsigned(wire91) ^ $signed(wire104))) ?
                           (wire84[(3'h7):(2'h2)] < $unsigned((wire91 >> reg94))) : $unsigned($unsigned((wire84 ?
                               reg97 : wire102))))};
  assign wire106 = (8'hae);
  always
    @(posedge clk) begin
      if ($signed($signed(reg99)))
        begin
          reg107 <= ({$unsigned(wire104)} && $unsigned(((~(reg98 ?
              wire87 : reg94)) ^ $signed((reg89 ? wire86 : reg98)))));
          reg108 <= {(wire92[(2'h3):(2'h2)] ?
                  (!$unsigned($unsigned((8'ha6)))) : (!(^(reg96 ?
                      wire87 : reg89))))};
          if ((wire101 && ((!$signed(reg108)) ?
              $signed(((reg89 & reg95) && reg96)) : $signed(wire101))))
            begin
              reg109 <= ((~|$signed(($unsigned(wire93) >= $signed(reg98)))) ?
                  (~|$unsigned(((wire101 ? reg97 : reg96) ?
                      (wire88 || wire93) : wire101[(2'h2):(1'h1)]))) : (((!(reg94 >>> reg100)) && $unsigned($unsigned(reg94))) * reg100[(3'h4):(3'h4)]));
              reg110 <= reg100[(3'h6):(2'h3)];
              reg111 <= (~&wire88);
              reg112 <= (!(~&reg98[(1'h0):(1'h0)]));
            end
          else
            begin
              reg109 <= (~|reg112[(1'h0):(1'h0)]);
              reg110 <= $signed($signed(reg97[(5'h10):(4'ha)]));
              reg111 <= (8'haa);
            end
          reg113 <= reg95;
          reg114 <= reg98;
        end
      else
        begin
          reg107 <= ($unsigned((~&(!(reg95 ? reg108 : (8'hb9))))) ?
              reg94[(2'h3):(1'h1)] : ((+($signed(reg108) <<< wire103[(3'h5):(3'h4)])) ?
                  reg96 : ((~|(8'hb9)) ? {(^wire83)} : (!(wire93 <<< reg94)))));
          reg108 <= reg109;
        end
      if ((reg100[(4'h9):(4'h9)] > $unsigned(reg109)))
        begin
          reg115 <= ($signed(wire102[(4'h8):(3'h5)]) + $signed((^~(~&(^~wire101)))));
          reg116 <= $unsigned(($signed(((|reg97) ?
              $unsigned(wire86) : {(8'hb9)})) | reg111));
          reg117 <= ($signed($unsigned($signed((wire90 & wire90)))) ^ ((($unsigned(wire87) ?
                  $signed(wire88) : (reg99 ? wire84 : (8'hb0))) ?
              {(reg98 ? reg99 : reg89)} : wire90[(2'h2):(1'h1)]) <= reg115));
          reg118 <= wire104[(1'h0):(1'h0)];
          reg119 <= $unsigned((^reg95[(4'h8):(4'h8)]));
        end
      else
        begin
          if (((reg99 < $unsigned((8'haf))) ?
              $unsigned((wire104 >> (~^$unsigned(reg97)))) : reg108[(3'h5):(2'h3)]))
            begin
              reg115 <= (7'h44);
            end
          else
            begin
              reg115 <= wire86[(4'h9):(2'h2)];
            end
          reg116 <= (reg107[(2'h2):(1'h1)] <<< $signed((^reg98)));
          reg117 <= {wire84[(2'h2):(1'h1)]};
          if ((((wire103[(2'h2):(1'h1)] ?
                      ((reg89 ^~ reg119) ?
                          $unsigned((7'h43)) : wire83) : $unsigned({wire83,
                          reg100})) ?
                  {{$signed(reg113), wire92},
                      (wire105 ^ {(8'hb6)})} : (($unsigned(reg99) ?
                      ((8'ha9) ? reg99 : wire105) : (^~wire87)) || wire104)) ?
              wire104 : (^~(^(reg107[(1'h1):(1'h0)] == $signed(wire88))))))
            begin
              reg118 <= wire92;
              reg119 <= $signed(reg99);
              reg120 <= $signed((|(8'hb0)));
            end
          else
            begin
              reg118 <= (!$signed({wire90[(1'h0):(1'h0)]}));
            end
          if ((&((wire84 || $signed((8'ha6))) ?
              (~(^reg116[(1'h0):(1'h0)])) : (^((wire84 << reg111) >>> $signed((8'h9d)))))))
            begin
              reg121 <= $signed((|reg98));
              reg122 <= $signed((-($unsigned($signed(reg94)) ?
                  ($signed((8'ha6)) ? reg118 : (|wire93)) : {(reg117 ?
                          wire91 : wire88),
                      $unsigned((8'hba))})));
              reg123 <= reg109;
              reg124 <= $signed(reg100);
              reg125 <= $unsigned((|reg98[(4'h8):(2'h2)]));
            end
          else
            begin
              reg121 <= reg118[(1'h0):(1'h0)];
              reg122 <= ($unsigned($unsigned(wire102)) > (~|(-reg122)));
            end
        end
      if ($unsigned($signed($unsigned($unsigned((8'h9c))))))
        begin
          if (reg96[(3'h4):(1'h0)])
            begin
              reg126 <= {reg114[(2'h2):(1'h1)], reg109};
              reg127 <= (8'hb1);
              reg128 <= wire85[(1'h0):(1'h0)];
              reg129 <= ($signed(($signed($signed((8'had))) | (~&$unsigned(wire93)))) ?
                  (&({(reg121 ? reg97 : (8'hab)), ((8'hac) ? reg120 : reg125)} ?
                      $signed({(8'ha0), wire90}) : (+(8'hae)))) : (-reg118));
              reg130 <= (8'had);
            end
          else
            begin
              reg126 <= {reg125[(1'h1):(1'h0)]};
              reg127 <= ({wire92[(3'h4):(2'h3)]} ?
                  wire87[(4'h8):(2'h2)] : {$signed(((reg120 >>> reg116) ?
                          reg126 : reg127))});
            end
          reg131 <= reg120[(2'h2):(1'h0)];
          if (reg121[(1'h0):(1'h0)])
            begin
              reg132 <= ((&$unsigned({$signed(reg129), wire90})) ?
                  (($unsigned(wire92) ?
                          {(wire83 ?
                                  reg121 : reg118)} : ((wire104 ~^ reg96) * $unsigned(reg117))) ?
                      reg99 : ((|(reg118 ? wire91 : wire102)) ?
                          $unsigned(reg121[(1'h0):(1'h0)]) : ($signed(reg98) ?
                              {wire85,
                                  wire90} : (~^reg96)))) : reg123[(1'h1):(1'h1)]);
              reg133 <= {$signed(reg120[(1'h1):(1'h1)])};
              reg134 <= ($unsigned(($unsigned((wire86 + wire92)) - (reg117[(3'h6):(1'h0)] ^~ $signed(reg133)))) == reg113);
              reg135 <= wire85[(1'h1):(1'h0)];
              reg136 <= (($signed((|(wire103 <<< reg99))) ^ {$signed($unsigned(reg115)),
                  reg129}) && $signed(($signed($signed(reg128)) ?
                  reg121 : {(reg89 ? reg96 : wire86), reg119})));
            end
          else
            begin
              reg132 <= reg109[(4'h8):(3'h7)];
            end
          reg137 <= (^~reg134);
          reg138 <= {((reg133[(1'h1):(1'h1)] - $unsigned($unsigned(reg124))) ?
                  {wire87[(4'h9):(1'h1)],
                      $unsigned((reg129 << reg99))} : wire83),
              reg133[(1'h0):(1'h0)]};
        end
      else
        begin
          if ((8'hb2))
            begin
              reg126 <= reg109[(1'h0):(1'h0)];
              reg127 <= $signed($unsigned($unsigned(reg138)));
              reg128 <= (~^(!wire92[(1'h0):(1'h0)]));
              reg129 <= ($signed((~$signed(reg113[(3'h5):(2'h3)]))) * (^~$unsigned($unsigned({wire84,
                  wire105}))));
              reg130 <= (~&(($unsigned(reg133) ?
                      reg126[(4'hd):(1'h0)] : $signed(reg118[(4'he):(4'hb)])) ?
                  wire85[(4'ha):(4'h9)] : (($signed((8'ha8)) ?
                          (reg125 ? wire104 : reg94) : $signed(wire103)) ?
                      (wire84 >>> {reg133}) : (reg99 & $signed(reg127)))));
            end
          else
            begin
              reg126 <= (~|((~|$unsigned((reg116 && reg113))) ~^ reg128));
            end
          reg131 <= $signed(reg116);
          reg132 <= $signed({reg118[(4'h9):(1'h0)],
              $unsigned(((wire93 ? reg126 : (8'ha6)) ? (8'hb5) : wire105))});
        end
    end
  assign wire139 = $signed(reg115);
  assign wire140 = $unsigned($unsigned(($unsigned(wire88) | $unsigned((^wire83)))));
  always
    @(posedge clk) begin
      reg141 <= {(reg137[(1'h1):(1'h1)] ?
              (~{(^reg124)}) : wire105[(3'h5):(3'h5)]),
          {reg128[(1'h1):(1'h1)], reg89[(4'hd):(1'h0)]}};
      reg142 <= reg134[(1'h0):(1'h0)];
      reg143 <= (((|(~&wire87)) >= $signed(reg97[(4'he):(2'h3)])) <= $unsigned($unsigned((|(wire139 >> (8'hb9))))));
      reg144 <= wire86[(1'h1):(1'h1)];
    end
endmodule
