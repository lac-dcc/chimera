module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire104;
  wire [(5'h14):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire125;
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  assign y = {wire104,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire64,
                 wire63,
                 wire56,
                 wire55,
                 wire54,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire49,
                 wire125,
                 reg51,
                 reg52,
                 reg53,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(wire4));
  assign wire6 = (^({{(wire3 ~^ wire5), $unsigned((8'hb6))},
                         wire3[(1'h1):(1'h1)]} ?
                     wire4[(3'h5):(2'h3)] : (wire4 ^ wire4[(3'h7):(1'h1)])));
  assign wire7 = $unsigned((|wire1));
  assign wire8 = (wire4 <= ($signed((wire3[(1'h1):(1'h1)] ?
                         (wire6 ^~ wire1) : {(8'ha1)})) ?
                     wire4 : wire0));
  module9 #() modinst50 (.wire13(wire1), .wire12(wire0), .wire14(wire2), .wire10(wire4), .wire11(wire8), .clk(clk), .y(wire49));
  always
    @(posedge clk) begin
      reg51 <= {wire6[(3'h7):(2'h3)]};
      reg52 <= wire49;
      reg53 <= {$signed(($unsigned((wire6 != (8'hb9))) && (!(wire49 ?
              wire2 : wire4)))),
          ($unsigned(wire5[(4'hf):(4'hf)]) & $unsigned(reg52[(4'he):(2'h3)]))};
    end
  assign wire54 = $unsigned((~|reg53[(4'hc):(4'h8)]));
  assign wire55 = (!$unsigned($signed($unsigned((wire2 & wire5)))));
  assign wire56 = (wire1[(2'h2):(1'h1)] ?
                      (reg51[(3'h7):(2'h3)] || ($unsigned((~(7'h40))) ?
                          $unsigned($signed(reg52)) : $signed($signed((8'ha6))))) : ({reg52[(4'h9):(3'h7)],
                          (+{wire8, wire6})} && $signed({$signed(wire2)})));
  always
    @(posedge clk) begin
      if (wire4[(2'h3):(2'h3)])
        begin
          reg57 <= $signed({$unsigned($unsigned((wire0 >> wire7)))});
          reg58 <= $unsigned(wire0[(3'h7):(1'h1)]);
          reg59 <= $unsigned(($unsigned((~&(+reg58))) ?
              (!$unsigned(wire0[(4'ha):(2'h2)])) : reg52));
          if ((^((8'ha3) * reg59)))
            begin
              reg60 <= (~($unsigned(wire0) ?
                  (8'hb9) : (-$unsigned((wire8 || wire4)))));
            end
          else
            begin
              reg60 <= ($unsigned(wire0) ? wire4 : reg58);
              reg61 <= $unsigned($unsigned($unsigned(((wire6 ?
                      (8'hb0) : wire54) ?
                  reg52 : reg60[(4'he):(3'h6)]))));
            end
          reg62 <= wire1;
        end
      else
        begin
          reg57 <= {$unsigned({(wire8[(4'hd):(3'h5)] ?
                      (wire54 ? wire6 : (8'h9f)) : wire54[(3'h4):(1'h1)]),
                  ($unsigned(wire56) ? (~reg51) : $unsigned(wire5))}),
              $unsigned((((~&reg52) ? $signed(reg58) : $signed(reg60)) ?
                  (8'ha2) : (((8'ha6) ? wire6 : wire7) ~^ reg52)))};
          reg58 <= $signed(wire55[(2'h2):(1'h1)]);
          if (($signed({reg53[(4'hf):(4'hd)]}) ?
              wire4 : $unsigned({($signed(wire0) ?
                      (wire55 >> (8'hb1)) : $signed(wire2))})))
            begin
              reg59 <= $unsigned(((($signed(reg61) ?
                          {wire56, reg59} : $unsigned(wire2)) ?
                      reg51[(4'h8):(3'h4)] : (+reg62)) ?
                  $unsigned($signed($unsigned(reg60))) : reg62[(3'h6):(1'h0)]));
            end
          else
            begin
              reg59 <= wire7[(2'h3):(2'h3)];
              reg60 <= reg51[(2'h2):(1'h1)];
            end
        end
    end
  assign wire63 = {reg59[(1'h0):(1'h0)],
                      (((((7'h40) >> reg53) <<< (reg60 ?
                              wire7 : reg60)) <<< wire8) ?
                          ((~&reg52) ?
                              ($signed(wire5) == reg51[(4'he):(3'h5)]) : $signed((|wire56))) : (|$signed($unsigned(wire2))))};
  assign wire64 = (wire5[(4'he):(3'h4)] >>> $unsigned(wire0[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if (($signed($unsigned(reg58[(1'h1):(1'h0)])) ?
          wire49 : $unsigned(((~|(+wire1)) ? (-reg62) : wire8))))
        begin
          reg65 <= $unsigned((^(!((^wire2) ^~ (|(7'h43))))));
          if ((|$unsigned($unsigned(((reg65 ? wire4 : wire4) ?
              wire49 : $unsigned(reg57))))))
            begin
              reg66 <= $signed(reg58[(1'h1):(1'h0)]);
              reg67 <= {wire54[(1'h1):(1'h1)]};
              reg68 <= $unsigned(wire56);
              reg69 <= reg58[(2'h2):(1'h0)];
              reg70 <= ((!(-reg59[(3'h6):(2'h3)])) ?
                  wire54[(3'h6):(3'h4)] : (&reg53[(1'h0):(1'h0)]));
            end
          else
            begin
              reg66 <= wire54[(4'hb):(2'h2)];
              reg67 <= $unsigned(((wire5 ? reg69 : wire49[(3'h4):(1'h1)]) ?
                  (^(wire63 ?
                      (reg67 ?
                          wire56 : wire3) : ((8'had) >>> reg70))) : $unsigned($signed((reg62 == wire2)))));
              reg68 <= $signed($unsigned($signed($unsigned(reg66))));
            end
        end
      else
        begin
          reg65 <= wire64[(1'h1):(1'h0)];
          reg66 <= ($unsigned((((~reg58) ^ reg57) <= (~&$signed(reg66)))) ?
              reg59 : (~reg66));
        end
      reg71 <= $unsigned({$signed($unsigned((~|reg60))),
          wire63[(4'hd):(3'h4)]});
    end
  assign wire72 = (wire64[(1'h1):(1'h1)] && (({$unsigned(reg68)} ?
                      $signed(wire54[(3'h6):(1'h1)]) : (-(reg70 ?
                          (8'hbc) : reg65))) | $signed((~((8'hab) != reg59)))));
  assign wire73 = ({((wire7[(4'hb):(4'ha)] < $unsigned((8'hbe))) != wire64),
                      (+($signed(wire72) > wire49[(4'h9):(4'h9)]))} || {wire1[(3'h5):(2'h3)],
                      (|($signed((8'haf)) > wire3))});
  assign wire74 = ($unsigned((!$signed(wire3[(2'h2):(2'h2)]))) + ($unsigned((~^wire54[(1'h0):(1'h0)])) - (wire0 ?
                      (-reg61[(4'hd):(2'h3)]) : wire73[(3'h6):(1'h1)])));
  assign wire75 = {(8'ha1), (8'hba)};
  assign wire76 = $signed(($signed(wire72[(2'h3):(1'h0)]) ?
                      (($signed(reg53) ?
                          {wire5} : (reg57 ?
                              wire0 : reg52)) >>> (~(wire55 <<< wire72))) : reg62));
  module77 #() modinst105 (wire104, clk, reg67, wire54, wire76, reg60, wire2);
  module106 #() modinst126 (.clk(clk), .wire108(wire5), .wire110(wire55), .wire107(reg57), .wire109(wire76), .y(wire125));
endmodule

module module106  (y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire110;
  input wire signed [(4'hc):(1'h0)] wire109;
  input wire [(5'h13):(1'h0)] wire108;
  input wire signed [(4'hf):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire124;
  wire [(3'h4):(1'h0)] wire123;
  wire signed [(5'h14):(1'h0)] wire122;
  wire [(5'h15):(1'h0)] wire121;
  wire [(4'hc):(1'h0)] wire120;
  wire [(3'h6):(1'h0)] wire119;
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(4'he):(1'h0)] reg111 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg111 <= wire109;
      if (((!$signed($signed(wire107[(4'ha):(3'h6)]))) ?
          $unsigned(wire110) : ((~|(((8'hbb) ? (8'hbd) : (8'hb3)) ^ (wire110 ?
                  wire110 : wire109))) ?
              $signed($unsigned(wire108[(4'ha):(4'ha)])) : $unsigned(wire108[(4'hb):(4'h8)]))))
        begin
          reg112 <= ({wire108, wire110} ^ wire108);
          reg113 <= ((({reg112[(2'h3):(2'h2)]} ?
                  (|reg111[(4'ha):(3'h7)]) : (&$signed((8'ha3)))) ?
              wire110[(2'h2):(1'h0)] : reg112) >> (^$unsigned(wire110[(2'h3):(1'h0)])));
          reg114 <= (((reg111 << wire109) ?
                  {wire107[(1'h1):(1'h0)],
                      ((reg113 * reg111) > reg112)} : (^reg111)) ?
              wire107 : $signed((~|((8'hb5) ?
                  (~&reg111) : (wire110 ? wire107 : reg113)))));
          if ($signed($signed(wire107[(3'h6):(1'h0)])))
            begin
              reg115 <= reg114[(3'h6):(3'h4)];
            end
          else
            begin
              reg115 <= (wire107 <<< reg112);
              reg116 <= $signed(reg111);
            end
        end
      else
        begin
          reg112 <= reg111;
          reg113 <= wire107;
          reg114 <= $unsigned(($unsigned($unsigned($unsigned(wire110))) == reg115[(1'h0):(1'h0)]));
        end
      reg117 <= $unsigned(($signed({(wire109 ?
              (8'hb9) : reg115)}) == {(~|$signed(reg111)),
          (~wire108[(4'he):(4'hc)])}));
      reg118 <= (($unsigned(((reg114 >>> wire107) ?
              wire109[(4'hb):(4'h8)] : (^wire108))) ?
          ((~$unsigned((8'h9c))) ?
              $signed(wire110) : wire109) : (((reg116 < reg111) ?
                  (^~wire108) : (wire107 ? reg112 : wire108)) ?
              {wire110,
                  reg111[(1'h0):(1'h0)]} : wire108)) <<< (^((8'hb4) <<< {(reg113 ?
              (8'hb1) : reg111),
          (+wire108)})));
    end
  assign wire119 = (+{$unsigned(wire107[(4'h8):(1'h1)]),
                       $signed(wire107[(2'h2):(1'h0)])});
  assign wire120 = $signed($unsigned((((reg117 << (7'h44)) || (reg116 ?
                           reg111 : reg116)) ?
                       $signed($signed(reg112)) : (~wire108[(4'h8):(2'h3)]))));
  assign wire121 = (-(8'hb9));
  assign wire122 = ({reg115[(3'h5):(1'h0)]} ?
                       $signed($unsigned(reg112[(2'h3):(2'h2)])) : (wire109[(3'h6):(3'h5)] ?
                           {{$signed(reg112), $unsigned(reg112)}} : (8'hb2)));
  assign wire123 = ((8'haf) >> ({((reg113 < wire121) ?
                               $signed(reg112) : (wire119 <<< reg114)),
                           $signed($signed((8'hbe)))} ?
                       (wire108[(3'h4):(1'h1)] <<< $unsigned(reg115)) : ((^~$signed(wire109)) ?
                           (~|$signed(reg118)) : ((~|wire107) ?
                               reg112 : wire110))));
  assign wire124 = wire122[(5'h14):(2'h2)];
endmodule

module module77
#(parameter param102 = {((+(7'h41)) ? ({((8'ha9) > (8'ha0))} != {(!(8'hb5))}) : ((!(^(8'hb1))) ~^ {((8'hb7) ? (8'hab) : (8'ha4)), ((8'hbc) >>> (8'ha4))}))}, 
parameter param103 = {(param102 != ((+(param102 ~^ param102)) ? param102 : param102)), ((param102 ? ((~|param102) ? (+param102) : (^~param102)) : {{(8'h9d)}}) ? (+(~|(param102 ~^ param102))) : param102)})
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire82;
  input wire [(2'h2):(1'h0)] wire81;
  input wire [(3'h5):(1'h0)] wire80;
  input wire signed [(4'hf):(1'h0)] wire79;
  input wire [(5'h11):(1'h0)] wire78;
  wire signed [(3'h7):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(3'h7):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg98 = (1'h0);
  reg [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  assign y = {wire101,
                 wire84,
                 wire83,
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
                 (1'h0)};
  assign wire83 = $signed(($unsigned((^wire80)) ?
                      wire78[(3'h6):(1'h1)] : wire80));
  assign wire84 = {{{{$unsigned(wire81)}}}, wire80};
  always
    @(posedge clk) begin
      reg85 <= {{$signed({(wire79 + wire81)})}, wire83[(3'h7):(3'h4)]};
    end
  always
    @(posedge clk) begin
      reg86 <= ((8'hb9) ?
          ($signed(wire83) - ($signed((wire78 ? wire80 : wire80)) ?
              wire80 : (((8'hb6) ? wire79 : reg85) >= reg85))) : (8'hae));
      reg87 <= ((^$signed($unsigned($unsigned(wire78)))) ?
          (wire78[(1'h0):(1'h0)] == (~|({(8'hab)} ?
              $signed(wire84) : $signed(wire78)))) : reg86);
      reg88 <= ({$unsigned(wire83), (7'h42)} ?
          (reg86[(2'h3):(1'h1)] ^~ $signed(wire83[(4'hb):(3'h5)])) : ($unsigned($unsigned({(7'h40)})) <<< ((|wire78[(5'h11):(4'hb)]) | wire80)));
      if ((wire78[(3'h5):(1'h0)] >= $unsigned(($unsigned($signed((8'ha1))) ?
          $unsigned($unsigned((8'hab))) : ($signed((8'hb7)) ?
              {(8'hb0)} : (reg88 << reg86))))))
        begin
          if ($unsigned(((~($signed(wire79) ? $unsigned((8'hb2)) : wire81)) ?
              wire81[(1'h0):(1'h0)] : {({(7'h42)} - wire79[(2'h2):(1'h1)]),
                  ((~&wire83) - (wire82 << wire83))})))
            begin
              reg89 <= $signed(wire79);
            end
          else
            begin
              reg89 <= (~^$unsigned(reg87));
              reg90 <= reg88[(4'h9):(1'h1)];
              reg91 <= $signed(({(^reg89),
                  {(reg86 ? reg87 : wire79)}} ^ reg85));
            end
          reg92 <= $unsigned((reg86 ^~ (~|{(~&reg90), (reg88 <= wire79)})));
          reg93 <= (8'hbf);
          reg94 <= $unsigned((-(((reg89 << wire82) ?
                  wire79[(4'ha):(2'h3)] : (^~wire84)) ?
              {reg90[(4'hb):(2'h2)]} : (~reg89))));
          if ($signed($unsigned((+wire83))))
            begin
              reg95 <= {wire80[(2'h3):(2'h3)]};
              reg96 <= ((|reg87) ?
                  ((|$signed({reg87})) - (reg95[(3'h7):(1'h1)] + $unsigned(reg89[(2'h3):(2'h2)]))) : (!reg90));
              reg97 <= $signed((^~wire81));
              reg98 <= (((|($signed(reg89) ^ (-wire82))) <<< $signed(({wire83} ?
                  wire82 : (&(8'hb9))))) << ((+$signed(reg95[(1'h0):(1'h0)])) ^ $unsigned($signed($unsigned(reg91)))));
              reg99 <= {reg98[(4'hf):(4'ha)], $unsigned(reg97)};
            end
          else
            begin
              reg95 <= $signed($signed(wire81));
              reg96 <= $signed($signed((^$unsigned(wire81))));
              reg97 <= $unsigned({$unsigned(reg86)});
              reg98 <= $unsigned(((((reg86 << reg92) >> {reg89, reg99}) ?
                  $signed(reg96[(1'h1):(1'h1)]) : ({wire81,
                      wire80} ^ $signed(reg98))) * wire83[(5'h11):(4'hc)]));
              reg99 <= reg97;
            end
        end
      else
        begin
          reg89 <= (~|(~$signed($signed((&reg99)))));
          reg90 <= ($signed((({reg94,
              wire78} - $signed(wire80)) ^ reg96)) && $signed($unsigned(wire80[(2'h3):(1'h0)])));
          reg91 <= $signed($signed((-((wire82 && reg85) ?
              (8'hb0) : wire84[(5'h10):(4'hf)]))));
        end
      reg100 <= ($signed(reg99) ? reg89[(3'h4):(1'h1)] : wire81);
    end
  assign wire101 = ($unsigned((reg91 >> ($signed(wire80) ?
                       (8'hb0) : (reg95 <= reg90)))) ^~ $signed({(+$signed(reg95))}));
endmodule

module module9
#(parameter param48 = (((-(((8'ha6) ? (8'hb1) : (7'h44)) ? (^(8'ha5)) : (+(8'hb7)))) == ((((8'hb6) <<< (8'haa)) >> ((8'hbf) ? (7'h40) : (7'h42))) ? ({(8'hba), (8'hb4)} | ((8'had) ? (8'hb5) : (8'hb5))) : (&{(8'haf)}))) ? ((((^(8'hbf)) ? ((8'hbe) != (8'ha5)) : ((7'h41) >= (8'ha8))) ? {((8'hb2) - (8'ha1))} : (~(~^(8'ha5)))) && ((~((8'hac) || (8'hb3))) == (&((8'ha9) ? (8'ha6) : (8'hb4))))) : (7'h44)))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire31;
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire15,
                 wire31,
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
  assign wire15 = wire12;
  module16 #() modinst32 (.wire20(wire12), .wire19(wire11), .wire21(wire13), .y(wire31), .clk(clk), .wire18(wire15), .wire17(wire14));
  always
    @(posedge clk) begin
      reg33 <= wire10;
      if ((~((8'hb1) ?
          ($signed($signed(wire13)) ?
              reg33 : wire12[(5'h13):(5'h12)]) : (wire12[(4'h9):(3'h6)] == reg33))))
        begin
          reg34 <= (reg33[(2'h3):(2'h3)] < reg33[(4'h9):(4'h9)]);
          if ($unsigned({$signed((wire12 <= wire13)),
              (wire11 ?
                  $unsigned($unsigned(wire31)) : ((8'h9f) ?
                      (~&(8'hb6)) : (reg33 ^~ reg34)))}))
            begin
              reg35 <= wire12[(5'h10):(2'h2)];
              reg36 <= $unsigned($signed($signed(wire13)));
              reg37 <= $unsigned($unsigned(reg33[(4'h9):(2'h3)]));
              reg38 <= (reg36[(1'h0):(1'h0)] ^~ $unsigned((8'hac)));
              reg39 <= $unsigned(reg38);
            end
          else
            begin
              reg35 <= reg33[(4'hc):(3'h6)];
              reg36 <= reg39;
              reg37 <= reg34;
              reg38 <= (wire13 ?
                  (&(wire31 ?
                      reg33[(1'h1):(1'h0)] : $signed($signed(wire31)))) : {{$unsigned((wire14 ?
                              reg37 : wire15)),
                          reg35[(2'h3):(1'h1)]},
                      wire12[(5'h10):(4'hc)]});
            end
          reg40 <= reg37[(3'h4):(3'h4)];
        end
      else
        begin
          reg34 <= $unsigned(($signed((-(8'h9c))) ^~ reg38[(3'h7):(1'h0)]));
          if ($unsigned($unsigned($signed(reg36[(1'h1):(1'h0)]))))
            begin
              reg35 <= wire12;
            end
          else
            begin
              reg35 <= (!$signed(({$unsigned(wire10),
                  (reg34 ^ (8'hb3))} - $signed((reg37 ? reg39 : reg36)))));
              reg36 <= reg35[(2'h2):(1'h0)];
            end
        end
      reg41 <= (8'hb3);
      reg42 <= reg40;
    end
  assign wire43 = ({{(wire31 ^~ reg34)},
                      reg39} == $unsigned((~&$signed($signed(reg34)))));
  assign wire44 = ((({(reg39 ? (8'h9d) : wire15), $signed(wire13)} & ((wire43 ?
                              reg41 : wire43) ?
                          reg41[(4'h8):(1'h0)] : $signed(wire13))) | reg33) ?
                      $signed(((~&{wire11}) ?
                          ((~^wire31) ?
                              (wire11 ?
                                  reg42 : reg33) : reg37[(3'h4):(2'h3)]) : ((8'hb5) > $signed(reg39)))) : (wire13 & $signed(reg39)));
  assign wire45 = (8'hac);
  assign wire46 = ((reg39[(3'h6):(2'h3)] ?
                      {(&(wire11 ? reg35 : wire13)),
                          $unsigned((wire11 | reg36))} : $unsigned($unsigned((!reg42)))) > $unsigned(reg41));
  assign wire47 = (^~(reg33 ?
                      $signed(reg41[(2'h2):(2'h2)]) : (wire43 != (wire31[(2'h2):(1'h1)] << $unsigned(reg42)))));
endmodule

module module16
#(parameter param29 = ((((~((8'hbc) ? (7'h40) : (8'hb7))) ? (((7'h40) ? (8'hbd) : (8'ha1)) | ((8'hb8) ? (8'hbb) : (7'h44))) : ((^~(8'hb0)) ? ((8'hbc) ~^ (8'hbf)) : ((8'ha4) <<< (8'haf)))) ? (^~(~|(^~(7'h41)))) : {((|(8'hb7)) ^~ ((8'ha7) ? (8'had) : (8'hb1))), (((7'h42) <= (8'hb4)) ? ((8'h9c) ^~ (8'hbf)) : (~^(8'ha0)))}) ? (|(+((~&(8'hbb)) ? (8'hbb) : ((8'h9c) ? (8'ha9) : (8'ha5))))) : ((-(!(+(8'hbc)))) << ((8'hb0) < (((8'hb0) - (8'hb2)) ? ((8'h9e) ? (8'h9e) : (8'ha3)) : ((8'hbc) ? (8'hbe) : (8'ha9)))))), 
parameter param30 = {param29, ((8'hab) ^~ ({(~|param29)} ^ param29))})
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  assign y = {wire28, wire27, wire26, wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = (8'hbe);
  assign wire23 = (^$unsigned($signed((wire17[(3'h6):(2'h2)] ?
                      $signed(wire17) : wire22))));
  assign wire24 = wire22[(4'hc):(3'h4)];
  assign wire25 = (wire17 ?
                      {(((wire23 && wire21) && ((8'hac) <<< wire24)) ?
                              (8'haf) : $unsigned(wire17)),
                          ($signed($signed(wire21)) | $unsigned((wire21 ^~ wire23)))} : wire20);
  assign wire26 = $unsigned($signed(($signed((wire24 ^~ wire21)) ?
                      ((^~wire22) - $unsigned(wire17)) : {$unsigned(wire20)})));
  assign wire27 = $signed(wire18[(4'hb):(3'h4)]);
  assign wire28 = ({$unsigned(($unsigned(wire23) ?
                              (wire23 <= wire17) : (wire24 ? wire22 : wire25))),
                          ({{(8'ha3)}} ?
                              {(wire23 ?
                                      (8'hae) : wire22)} : wire17[(4'hd):(4'ha)])} ?
                      (wire20 ? wire25[(3'h4):(2'h3)] : wire22) : wire27);
endmodule
