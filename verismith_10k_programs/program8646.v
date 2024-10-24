module top
#(parameter param106 = {((-({(8'ha5)} ? ((8'h9d) ? (8'ha3) : (8'ha9)) : ((8'h9f) ? (8'hb4) : (8'h9c)))) != {(((8'hb1) ? (8'hb7) : (8'ha5)) >= (-(8'hb2)))}), (+({(+(8'hbe)), (!(8'hab))} | (^~{(8'h9f), (8'ha5)})))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(5'h12):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire59;
  assign y = {wire105, wire104, wire103, wire101, wire61, wire59, (1'h0)};
  module5 #() modinst60 (.wire10(wire4), .clk(clk), .wire8(wire1), .wire7(wire0), .y(wire59), .wire9(wire3), .wire6(wire2));
  assign wire61 = (wire59[(4'hb):(2'h2)] ?
                      $signed(wire3[(3'h6):(3'h5)]) : ($unsigned(wire3) ?
                          wire59 : wire0));
  module62 #() modinst102 (wire101, clk, wire2, wire4, wire0, wire59);
  assign wire103 = (&(wire1[(3'h5):(2'h2)] ?
                       $unsigned((~^$unsigned(wire0))) : wire3[(4'hc):(3'h4)]));
  assign wire104 = wire2[(3'h5):(1'h0)];
  assign wire105 = ((((|$signed(wire103)) ?
                               wire103[(2'h3):(1'h0)] : (&$unsigned(wire61))) ?
                           wire104 : wire4[(4'he):(4'hb)]) ?
                       $unsigned($unsigned($signed(wire101))) : $signed($signed(wire101[(4'h8):(1'h1)])));
endmodule

module module62
#(parameter param99 = (({{((7'h43) << (8'hae)), (^(8'ha9))}} + (((~&(8'hab)) <= (~|(8'hb6))) ? (&((8'ha7) <<< (7'h40))) : ((^~(8'ha2)) ? (~(8'h9c)) : (8'h9d)))) && ((^~((-(8'had)) ? ((8'hab) ? (8'ha0) : (8'h9c)) : (|(7'h41)))) ? ((!((8'hb8) ^ (8'hba))) * (((8'hb6) ? (8'ha0) : (8'hba)) & ((8'hb3) ? (8'hb2) : (8'haa)))) : {(((8'haf) ? (8'h9f) : (7'h42)) ? {(8'haf), (8'h9c)} : (8'hae))})), 
parameter param100 = (-((~param99) || ((param99 ? (param99 ? param99 : param99) : (~&param99)) ^ param99))))
(y, clk, wire66, wire65, wire64, wire63);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire66;
  input wire [(4'hc):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire64;
  input wire [(4'h9):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  reg signed [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'ha):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(3'h5):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire67 = ($signed((^$unsigned(wire65[(4'hc):(2'h2)]))) ?
                      wire64[(3'h6):(2'h3)] : wire65);
  assign wire68 = (!(~|$signed($signed($signed(wire63)))));
  assign wire69 = $signed(wire64[(2'h3):(1'h1)]);
  assign wire70 = (wire67[(2'h2):(1'h1)] ?
                      (wire63 | wire67) : $signed($unsigned($signed(wire68[(4'he):(4'hc)]))));
  assign wire71 = $unsigned($signed(wire68[(3'h4):(2'h2)]));
  always
    @(posedge clk) begin
      reg72 <= wire69;
      if ($signed(wire66[(4'h8):(1'h1)]))
        begin
          reg73 <= (wire67[(4'h9):(2'h3)] ?
              {wire69[(1'h0):(1'h0)],
                  (|(^~(wire70 || wire67)))} : ($unsigned({(wire70 >= wire66),
                      {reg72}}) ?
                  wire68[(4'he):(4'h9)] : $unsigned(wire65)));
          reg74 <= ($signed((~^($unsigned(wire70) & (wire65 >>> wire70)))) != (wire67[(5'h11):(4'ha)] ?
              $signed($signed(wire67)) : {wire69,
                  ((wire71 >>> (8'hb9)) ?
                      $unsigned(wire67) : $unsigned((7'h40)))}));
          reg75 <= (~|({reg73, (+(wire70 ~^ wire64))} ?
              $unsigned($signed((wire64 ?
                  wire65 : wire70))) : $unsigned($signed($unsigned(wire65)))));
        end
      else
        begin
          reg73 <= $unsigned(wire65);
          reg74 <= $unsigned((-$signed((7'h44))));
          reg75 <= {$signed(wire69)};
          reg76 <= ((&reg72[(4'hd):(3'h7)]) && (|(wire70[(1'h0):(1'h0)] != (~&$signed((8'ha1))))));
          if ((^($unsigned((|(reg76 == reg74))) * ((~(reg75 | wire68)) > (~(!wire66))))))
            begin
              reg77 <= (wire69[(1'h0):(1'h0)] ^ (!reg73));
            end
          else
            begin
              reg77 <= wire70;
              reg78 <= $unsigned(($unsigned($unsigned($signed(reg73))) ?
                  (({(8'had)} ?
                      {wire65} : (-reg76)) != (!$signed(reg75))) : wire66[(1'h1):(1'h1)]));
              reg79 <= reg73;
            end
        end
      if (reg79)
        begin
          if ($signed(wire68))
            begin
              reg80 <= $signed($signed(reg72[(4'h8):(3'h7)]));
            end
          else
            begin
              reg80 <= (~|wire64);
              reg81 <= (~&$unsigned(wire66));
            end
          reg82 <= reg80[(5'h10):(1'h1)];
          if ((wire66 == $unsigned((8'hb0))))
            begin
              reg83 <= $signed(($unsigned(($signed(wire67) ?
                  reg76[(1'h1):(1'h0)] : (reg78 ? wire63 : (7'h41)))) & reg77));
            end
          else
            begin
              reg83 <= $unsigned(($signed(({wire70, reg78} ?
                      {wire65} : $signed(reg82))) ?
                  ((wire64[(3'h4):(1'h0)] || (|wire65)) != wire71[(4'hb):(3'h5)]) : $unsigned(reg75)));
              reg84 <= wire67;
              reg85 <= {reg83};
              reg86 <= (-$signed((reg82 ?
                  wire68 : $unsigned(reg81[(5'h12):(1'h0)]))));
              reg87 <= (wire66 ?
                  ((reg86 ^ (reg78 < (wire69 ? reg74 : reg84))) ?
                      reg78 : $unsigned($signed(reg83[(4'h9):(4'h8)]))) : $unsigned((|reg82[(2'h3):(1'h0)])));
            end
          if ($unsigned($unsigned($signed({(+(8'hb3))}))))
            begin
              reg88 <= reg84;
            end
          else
            begin
              reg88 <= (&(wire68 ?
                  reg82[(1'h1):(1'h0)] : $signed(wire63[(1'h0):(1'h0)])));
              reg89 <= (reg74 ?
                  wire65 : $unsigned({reg72[(1'h1):(1'h0)],
                      reg88[(2'h2):(2'h2)]}));
              reg90 <= wire64[(1'h1):(1'h0)];
              reg91 <= ((reg78 > reg81[(4'hd):(3'h4)]) ^ {((+reg87[(3'h7):(3'h4)]) ?
                      ((8'ha8) << wire71[(4'h9):(2'h2)]) : $unsigned($signed(wire69))),
                  reg83});
            end
          reg92 <= (-(!wire63));
        end
      else
        begin
          reg80 <= ($unsigned((8'hac)) ?
              $unsigned(($signed({reg79,
                  (8'hb8)}) >= reg74[(1'h1):(1'h0)])) : $signed(wire68[(1'h1):(1'h0)]));
          if (($signed($signed((!(~&reg73)))) >= (&{(-(wire67 | reg83)),
              $unsigned(wire67[(3'h7):(1'h0)])})))
            begin
              reg81 <= ({(8'hb4)} ?
                  reg82 : $unsigned({({wire69,
                          reg92} != reg82[(2'h2):(1'h0)])}));
              reg82 <= ($signed(({$unsigned(wire64)} <<< wire64)) != (8'ha2));
            end
          else
            begin
              reg81 <= $unsigned((^~$unsigned(wire67)));
              reg82 <= $unsigned(({(reg82 || (wire68 ? reg80 : wire63)),
                  reg76[(3'h5):(2'h3)]} >> $unsigned((wire67 ?
                  $signed(wire67) : (!reg73)))));
              reg83 <= (({$signed(wire71)} ?
                      (8'hbb) : (~&{$signed(reg80), $unsigned((8'hb2))})) ?
                  (|{((reg73 ?
                          (8'hb9) : wire67) & reg76[(2'h2):(1'h1)])}) : wire70);
            end
          reg84 <= (((((reg78 & (8'ha6)) ^~ wire65) - ($unsigned(wire70) | reg92)) ?
              $signed($unsigned((reg78 && wire65))) : $unsigned(wire71[(2'h3):(1'h0)])) ^~ $signed((+$signed((^reg72)))));
        end
      if (({$signed($unsigned((8'ha1))),
          (|$unsigned((wire71 == reg85)))} + (reg74[(1'h1):(1'h0)] ?
          wire70 : $signed(reg81))))
        begin
          reg93 <= $signed(($unsigned($unsigned($signed(wire63))) ?
              ((&{reg86}) ?
                  (reg85 >> $signed(reg82)) : (reg72 ?
                      {reg77} : wire70[(2'h2):(1'h1)])) : $unsigned($unsigned(reg72))));
        end
      else
        begin
          reg93 <= reg74[(2'h2):(2'h2)];
          reg94 <= $unsigned($unsigned($signed(({reg85} ?
              $signed(reg86) : (^reg72)))));
          if (((^~(~|((wire71 ?
              reg88 : (8'haf)) <<< (~reg75)))) <= (~&(reg75[(3'h6):(3'h5)] - (|(reg87 <<< reg84))))))
            begin
              reg95 <= (~^($signed((reg94 ?
                  (reg73 ? reg94 : reg79) : {(8'hb4),
                      wire67})) ^~ $unsigned(reg79)));
              reg96 <= $signed((reg92 ~^ (reg94 != {(wire68 ?
                      wire67 : wire70)})));
              reg97 <= reg79;
            end
          else
            begin
              reg95 <= $signed((~^(($signed(reg94) >= ((8'hb1) >= reg89)) >> ((reg89 || reg89) ?
                  wire66 : reg93[(3'h5):(3'h4)]))));
            end
          reg98 <= {$unsigned(($unsigned(reg86[(3'h6):(3'h5)]) ?
                  (|$signed(reg88)) : $unsigned(wire66))),
              reg84};
        end
    end
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire58;
  wire signed [(3'h5):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire34;
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire11,
                 wire12,
                 wire34,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 (1'h0)};
  assign wire11 = (8'hb1);
  assign wire12 = (((((wire7 ?
                      wire10 : wire7) == (wire8 ^ wire8)) || wire7[(1'h0):(1'h0)]) ^~ (~(~^$unsigned((8'ha8))))) <<< (wire11[(3'h5):(1'h1)] <= $unsigned(((^wire8) < $unsigned(wire6)))));
  module13 #() modinst35 (.wire17(wire12), .y(wire34), .wire18(wire6), .wire16(wire9), .wire15(wire7), .wire14(wire11), .clk(clk));
  assign wire36 = $signed($unsigned(($unsigned(wire10) - $signed(wire10))));
  assign wire37 = ($signed(((8'hbb) & wire11)) ^~ (((8'hba) > wire7) && (|$unsigned((wire36 < wire9)))));
  assign wire38 = (~&($signed(wire8[(1'h1):(1'h1)]) ?
                      wire36 : ((8'ha6) ?
                          ($unsigned(wire12) ?
                              (wire6 ?
                                  wire6 : wire10) : wire7[(3'h6):(1'h1)]) : wire12[(4'ha):(3'h5)])));
  assign wire39 = (wire11[(3'h4):(2'h2)] ? (~^wire9) : wire11);
  assign wire40 = $unsigned((!((^~$unsigned(wire37)) - wire10[(2'h2):(1'h1)])));
  assign wire41 = wire6;
  assign wire42 = (wire34 ?
                      wire40 : ({wire6[(5'h13):(5'h13)],
                          (wire34[(1'h0):(1'h0)] ?
                              wire38[(3'h5):(2'h3)] : {wire37,
                                  wire7})} ^~ (8'h9c)));
  assign wire43 = {$signed(($signed((wire41 ? wire34 : wire6)) ~^ ({wire9} ?
                          wire40[(3'h7):(3'h4)] : (wire39 <<< wire38)))),
                      ({wire11[(4'hd):(3'h5)]} ?
                          ((^~$signed(wire38)) ^~ (!(wire40 >= wire39))) : wire10)};
  assign wire44 = (^~wire10[(4'h8):(4'h8)]);
  assign wire45 = (|$signed(($signed({wire10}) ?
                      wire42 : ((wire41 + (8'hab)) ? (^~wire42) : wire12))));
  assign wire46 = ({{($signed(wire10) ? {wire44} : wire38),
                          wire8}} > $unsigned((-$signed((wire37 ?
                      wire40 : wire43)))));
  always
    @(posedge clk) begin
      reg47 <= (^(wire11[(1'h1):(1'h0)] + $unsigned((wire39 << $unsigned(wire45)))));
      if ((8'hab))
        begin
          reg48 <= (wire6 ?
              (((((8'ha6) >= wire9) ?
                  $signed(wire40) : {wire7}) ^~ wire39[(2'h3):(2'h3)]) * $signed(((~|wire42) ?
                  wire12[(3'h4):(1'h0)] : $unsigned(wire37)))) : (^wire43));
          reg49 <= {(&$unsigned($unsigned(wire9)))};
          reg50 <= wire43;
        end
      else
        begin
          reg48 <= wire37;
        end
      if (($unsigned($unsigned(wire10)) ?
          wire7[(1'h0):(1'h0)] : $signed($signed($unsigned(((8'hbd) & wire44))))))
        begin
          reg51 <= (~(wire39[(3'h4):(1'h0)] ?
              $signed({(wire37 ? wire11 : reg49)}) : $unsigned((8'hbf))));
          reg52 <= (8'haf);
          reg53 <= (8'ha0);
        end
      else
        begin
          reg51 <= ((((~&(~|wire6)) ?
                  $signed((-(7'h40))) : $signed((wire43 >>> reg48))) <= $signed({(reg50 >> wire45)})) ?
              $unsigned($signed(wire11[(4'hc):(2'h3)])) : ($signed((reg49 | {(8'hb1)})) ?
                  $unsigned($unsigned(wire39)) : $unsigned((~(+wire46)))));
        end
      reg54 <= ($unsigned(((~&reg52) ?
          ((8'ha4) ?
              (wire8 >= wire41) : wire43[(2'h3):(1'h0)]) : $unsigned((wire8 ?
              wire34 : (8'hbe))))) ^~ $unsigned((8'hb9)));
    end
  assign wire55 = {($unsigned(((^~wire41) ?
                              (wire44 ? reg54 : reg53) : ((8'hb2) > reg54))) ?
                          (~$signed(wire34[(2'h2):(2'h2)])) : $unsigned((&wire12[(4'hd):(3'h5)]))),
                      wire7[(4'he):(4'h9)]};
  assign wire56 = ({reg53[(4'ha):(3'h4)]} << wire46);
  assign wire57 = (~&(^(~reg50[(2'h3):(2'h2)])));
  assign wire58 = ($signed((^$unsigned($unsigned(reg47)))) ?
                      (wire34[(2'h2):(1'h0)] * (!$unsigned(reg54))) : (wire45[(4'hb):(3'h5)] ?
                          (~wire8[(1'h1):(1'h1)]) : reg50[(1'h1):(1'h0)]));
endmodule

module module13
#(parameter param32 = ((((((8'h9f) ? (8'hb6) : (8'hbd)) < ((8'haa) ? (8'hb9) : (8'hbb))) > (((8'hb5) >>> (8'hb8)) ? (!(8'hbf)) : ((8'hb2) ? (8'hac) : (8'ha6)))) ? (!{(^~(7'h43))}) : ((~|((8'hb2) ^~ (8'ha8))) ? (((8'h9f) ? (8'ha7) : (7'h43)) ? ((8'ha0) < (8'h9e)) : ((8'hbe) - (8'hbb))) : {((8'haa) ? (8'ha7) : (8'hbf)), ((7'h42) ? (8'ha5) : (7'h42))})) || ((((~(8'ha1)) ? (8'hb2) : ((7'h42) ? (7'h42) : (8'ha9))) && {((8'hb6) & (8'hac)), ((8'had) ? (8'hb8) : (8'ha2))}) ? (({(8'hbb), (8'ha9)} >>> (~^(8'hb8))) ? {(8'h9f), (^~(8'hb5))} : {(+(8'haa)), {(8'hbe), (8'hba)}}) : ((((8'hb7) && (8'ha2)) ? (|(8'ha8)) : ((8'ha6) >= (8'hb8))) ? ((^~(8'hbe)) ? ((8'hae) - (8'hbe)) : ((8'hbe) ? (8'hbc) : (8'hb5))) : (((8'hac) ? (8'hbd) : (8'hbb)) ? ((7'h43) ? (8'hb9) : (8'ha0)) : ((8'h9f) <= (8'ha7)))))), 
parameter param33 = (param32 <= ((((8'hb9) != param32) <= (~^param32)) >> ((param32 || param32) ? param32 : (((8'ha4) ? (8'hbf) : (8'h9d)) || param32)))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(3'h5):(1'h0)] wire25;
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  assign y = {wire26,
                 wire25,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= (8'hb9);
      reg20 <= $signed({{wire14, $unsigned(((8'ha4) ? wire16 : wire16))}});
      if ($signed(wire17))
        begin
          reg21 <= ((8'hae) << (-(!$signed($unsigned(reg19)))));
        end
      else
        begin
          reg21 <= {wire14};
          reg22 <= (wire14 ?
              (($signed((&wire14)) >> wire17[(4'h8):(4'h8)]) - ((wire17[(4'ha):(3'h5)] ?
                  $signed(wire18) : $unsigned((8'hbb))) == (wire15 ?
                  (reg19 >= wire14) : reg21))) : wire16);
          reg23 <= reg22;
        end
      reg24 <= $unsigned(((~^(8'hb1)) << $unsigned((8'hb1))));
    end
  assign wire25 = wire14;
  assign wire26 = $unsigned(reg20[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned(wire25))
        begin
          reg27 <= (~(wire25 ^~ $signed((~&(wire16 ? reg20 : (8'ha5))))));
          reg28 <= (reg21[(4'h9):(3'h5)] & (|(^$unsigned((reg19 ?
              (8'hba) : wire15)))));
          reg29 <= ($unsigned(reg19) ? {(^~reg20)} : $signed(reg27));
          reg30 <= {$unsigned(wire26)};
          reg31 <= (~^($signed((^(|(8'hb2)))) | reg23));
        end
      else
        begin
          reg27 <= $signed($signed(reg30[(4'he):(4'hd)]));
          reg28 <= {reg23, $unsigned(wire16[(4'h9):(3'h5)])};
          reg29 <= {{$signed({(reg30 ~^ reg20)})}};
          reg30 <= $unsigned(($signed(wire18[(1'h1):(1'h0)]) ~^ reg21));
          reg31 <= reg20[(4'h8):(2'h2)];
        end
    end
endmodule
