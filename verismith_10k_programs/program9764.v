module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire102;
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire28,
                 wire102,
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
                 (1'h0)};
  assign wire5 = ((~(wire0[(3'h6):(3'h6)] ?
                     ((~^(8'hba)) | wire2) : (|$unsigned(wire1)))) >= (^~(wire1[(5'h10):(3'h4)] ?
                     (((8'ha7) ^ wire4) ?
                         (!(8'h9f)) : (!wire0)) : $unsigned((wire2 ?
                         wire4 : wire2)))));
  assign wire6 = (~|($unsigned($signed({wire2,
                     wire2})) <<< $unsigned($unsigned(wire3[(3'h5):(2'h2)]))));
  assign wire7 = wire6;
  assign wire8 = ($signed($unsigned($signed($unsigned((8'hae))))) ?
                     $unsigned((~(wire1[(1'h0):(1'h0)] ?
                         wire7 : $signed(wire7)))) : wire5[(2'h3):(1'h0)]);
  assign wire9 = ($signed($unsigned({$unsigned(wire1), wire4})) ?
                     ($signed(wire8) ?
                         $unsigned((!wire7[(4'ha):(2'h3)])) : (wire2[(2'h3):(1'h1)] ?
                             ($unsigned(wire0) == wire8[(3'h4):(2'h2)]) : $signed(wire6))) : wire0);
  assign wire10 = (~wire5);
  assign wire11 = $signed((wire9 ? wire9 : wire0[(4'hb):(3'h6)]));
  assign wire12 = wire8;
  assign wire13 = $signed((~&(!$unsigned(wire4[(1'h0):(1'h0)]))));
  assign wire14 = wire0;
  always
    @(posedge clk) begin
      if (((8'hb0) ?
          ((!(~|$signed((8'ha9)))) ?
              (wire11 || ($unsigned((8'hae)) ?
                  $signed(wire2) : $unsigned(wire13))) : wire10[(4'h9):(3'h4)]) : wire9))
        begin
          reg15 <= $signed(wire10);
        end
      else
        begin
          if ((({(8'ha4)} ?
                  $signed((~(wire10 && wire6))) : $unsigned($signed(wire10))) ?
              (&$signed((+(reg15 << wire4)))) : (^wire2)))
            begin
              reg15 <= ((wire3[(2'h3):(1'h1)] ?
                  wire6[(4'h9):(1'h1)] : wire6[(2'h2):(1'h0)]) && $unsigned((wire12[(4'h8):(3'h4)] <= (wire14 ?
                  $signed(wire2) : (wire12 ~^ wire2)))));
              reg16 <= ($signed($unsigned($unsigned((wire3 ^~ wire4)))) < (!$signed(($unsigned(wire9) == $unsigned(wire6)))));
              reg17 <= wire9[(3'h5):(3'h5)];
              reg18 <= (wire4[(1'h0):(1'h0)] ?
                  $unsigned({(((8'hb4) ? wire7 : (8'ha1)) * {wire14,
                          wire11})}) : $unsigned(wire10));
            end
          else
            begin
              reg15 <= (wire4 ? wire1 : (&{wire14}));
              reg16 <= (8'haf);
            end
          reg19 <= (({(~^(+wire0)),
              reg16[(2'h2):(1'h0)]} & wire5[(2'h2):(1'h1)]) ^ ({(wire1[(3'h5):(2'h3)] ?
                  wire4 : wire11),
              $unsigned((reg15 ~^ wire0))} << $signed((~reg17))));
          if (wire9)
            begin
              reg20 <= reg17;
              reg21 <= {(8'h9e),
                  ((~|($unsigned(wire7) < $unsigned(reg20))) ?
                      wire13 : reg20[(2'h2):(1'h1)])};
              reg22 <= ((^~{$signed($signed((8'hb2))),
                      ((reg16 >>> wire3) ? (!wire6) : $unsigned(wire14))}) ?
                  ($signed(reg19[(3'h6):(3'h6)]) ?
                      $unsigned((~|(7'h40))) : $unsigned((!$signed(wire12)))) : (^~((8'ha6) >> $unsigned(reg21))));
            end
          else
            begin
              reg20 <= $signed($unsigned(((^~(^(8'hb8))) <= (~|reg22[(4'he):(3'h6)]))));
              reg21 <= (wire6 ?
                  $signed((($signed(wire0) ? $unsigned(reg15) : (~&reg17)) ?
                      (reg15[(3'h5):(1'h1)] > $signed(reg19)) : ((wire5 <= wire11) ^~ (wire11 ?
                          reg21 : wire4)))) : $signed($signed($signed((~wire13)))));
              reg22 <= wire7;
            end
          reg23 <= $signed((~&$unsigned($unsigned((^(8'ha2))))));
          reg24 <= $signed(((+reg17) ?
              (wire5[(1'h0):(1'h0)] * (~&$unsigned((8'hb4)))) : (-((-wire4) == $signed(wire7)))));
        end
      reg25 <= (({(wire10[(1'h0):(1'h0)] && $unsigned((8'hbf))),
                  (^~$signed(wire6))} ?
              $unsigned((reg23 ^ reg23[(1'h1):(1'h0)])) : reg20) ?
          ((reg18 >= ($signed((8'hac)) * (wire2 <<< wire14))) ?
              reg24 : (^~((wire1 ?
                  (8'hb0) : wire5) ~^ $signed(wire14)))) : $unsigned(wire0));
      reg26 <= $signed(($unsigned(($unsigned(wire2) ?
              (~&wire10) : $unsigned(wire13))) ?
          $unsigned(($unsigned(wire9) == wire13)) : (-wire12)));
      reg27 <= {($signed(((wire14 > reg23) >> $signed(wire5))) >= (reg26 ?
              {(wire11 == reg19), (wire2 << (8'hba))} : wire10)),
          (~&(reg22 ? $signed((reg26 & reg19)) : $unsigned({wire5})))};
    end
  assign wire28 = $unsigned(wire7);
  module29 #() modinst103 (.wire30(wire7), .wire33(reg24), .wire32(wire2), .clk(clk), .y(wire102), .wire31(reg21), .wire34(wire4));
endmodule

module module29  (y, clk, wire30, wire31, wire32, wire33, wire34);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire30;
  input wire [(5'h15):(1'h0)] wire31;
  input wire [(4'hd):(1'h0)] wire32;
  input wire signed [(4'hd):(1'h0)] wire33;
  input wire signed [(5'h11):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(5'h13):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(3'h4):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(5'h12):(1'h0)] wire97;
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire97,
                 (1'h0)};
  assign wire35 = $unsigned((&wire33));
  assign wire36 = ((wire33[(1'h0):(1'h0)] > ((-((8'h9d) ? wire31 : wire33)) ?
                          (~&(8'ha4)) : wire34)) ?
                      $unsigned((+($signed(wire34) << wire34))) : (^(($signed(wire32) ?
                              $signed((8'ha5)) : wire31) ?
                          wire33 : wire30[(4'hd):(4'hd)])));
  assign wire37 = (wire32[(2'h2):(1'h1)] != ((~(^(wire33 ?
                      (8'hbc) : wire34))) << $unsigned(wire30)));
  assign wire38 = $unsigned($unsigned(((~|((8'hbc) >>> wire30)) >= (~(!wire31)))));
  assign wire39 = $signed($unsigned(wire31));
  assign wire40 = $unsigned((^($unsigned($signed(wire37)) ?
                      (+(8'hb7)) : (~|(wire32 * (8'hbe))))));
  assign wire41 = (~|$signed({$signed(wire35), $signed({wire40})}));
  assign wire42 = {$signed((^((wire33 >> (8'haf)) ?
                          (wire39 != wire39) : $signed(wire36)))),
                      $signed(($unsigned($signed((7'h40))) ?
                          wire32 : {(-(8'hbc)), $unsigned(wire31)}))};
  assign wire43 = $signed((+{(wire38[(4'ha):(4'ha)] ?
                          $signed((8'hb7)) : $unsigned(wire38))}));
  module44 #() modinst98 (.wire46(wire35), .clk(clk), .wire45(wire34), .wire47(wire43), .wire48(wire31), .y(wire97), .wire49(wire40));
  assign wire99 = $unsigned($unsigned($unsigned(wire37[(2'h3):(2'h2)])));
  assign wire100 = (($unsigned({wire32[(1'h1):(1'h1)], $signed((8'hb2))}) ?
                           $unsigned(wire99[(1'h1):(1'h1)]) : (wire97 ?
                               $unsigned((wire41 ?
                                   wire43 : wire37)) : $unsigned(wire42[(4'h9):(4'h9)]))) ?
                       (-(wire31 <<< {$signed((7'h42))})) : (wire39[(1'h0):(1'h0)] ~^ (~wire43)));
  assign wire101 = (+$signed({wire36}));
endmodule

module module44
#(parameter param96 = {(((((8'hab) ? (8'ha8) : (8'hbb)) ? ((8'hae) ? (7'h42) : (8'hba)) : ((8'hba) ? (8'ha3) : (8'hb8))) == {(8'hae)}) ~^ {(~((8'hbd) ? (8'hb9) : (8'hb1)))}), ((~(-((8'h9e) != (8'hb4)))) ? ((((8'h9e) > (8'ha5)) | ((8'ha4) ~^ (8'ha3))) >= {{(8'ha1), (8'hbd)}, (^(8'haf))}) : {{((8'ha1) ^ (8'hbf))}, ((+(8'hb4)) ? ((8'hb5) ? (8'hb7) : (7'h43)) : (&(8'h9c)))})})
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire49;
  input wire signed [(5'h11):(1'h0)] wire48;
  input wire signed [(3'h4):(1'h0)] wire47;
  input wire [(2'h3):(1'h0)] wire46;
  input wire [(4'h8):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(3'h4):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire [(3'h7):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire71,
                 wire67,
                 wire66,
                 wire51,
                 wire50,
                 reg85,
                 reg84,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
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
                 (1'h0)};
  assign wire50 = ((wire45 ? wire46 : (~$signed(((8'ha0) ~^ wire49)))) ?
                      (wire45 ^~ (((|wire46) <= $signed(wire46)) ^ ($signed(wire48) > ((8'hb1) << wire48)))) : (|wire45[(3'h6):(1'h0)]));
  assign wire51 = ((wire49[(3'h6):(3'h6)] >>> (~^$signed(((8'had) >>> wire45)))) | ((+$signed($unsigned((8'hb1)))) < (|wire48)));
  always
    @(posedge clk) begin
      if (wire47)
        begin
          if ($unsigned({((-wire46) & wire50[(3'h5):(2'h3)]),
              (^~wire49[(1'h1):(1'h1)])}))
            begin
              reg52 <= (~^$unsigned(((+(!(8'hbb))) * (8'ha8))));
              reg53 <= ({($signed(wire46[(1'h1):(1'h0)]) ?
                      ({wire48} ?
                          (wire49 >> wire46) : wire49) : {$signed(wire51)})} == (~$signed((wire48 ?
                  (8'ha8) : $unsigned(wire45)))));
              reg54 <= {$signed($unsigned($signed(wire50[(2'h2):(2'h2)])))};
              reg55 <= (wire45 * ({{$unsigned(wire48), {wire46, wire50}},
                  {(reg53 ? reg54 : wire46)}} != (~((wire49 != wire49) ?
                  {(8'hb4)} : $signed((8'hbf))))));
            end
          else
            begin
              reg52 <= (wire48[(1'h1):(1'h1)] ?
                  (+(-((wire48 ?
                      reg52 : wire49) ^~ $signed(reg55)))) : $signed(reg53[(1'h0):(1'h0)]));
            end
          if ($signed((reg53[(1'h1):(1'h1)] ?
              $signed($unsigned((wire49 * wire46))) : (^reg53))))
            begin
              reg56 <= $signed((reg53[(1'h1):(1'h1)] != reg53[(2'h2):(1'h0)]));
              reg57 <= wire49[(4'h9):(3'h7)];
              reg58 <= (wire47[(1'h1):(1'h1)] & reg57[(1'h1):(1'h0)]);
              reg59 <= reg52[(1'h0):(1'h0)];
              reg60 <= (reg53[(3'h5):(3'h4)] | reg55[(4'hf):(3'h6)]);
            end
          else
            begin
              reg56 <= {(~reg56[(3'h7):(1'h1)])};
              reg57 <= wire50[(1'h1):(1'h0)];
            end
          reg61 <= ($unsigned($signed(wire45)) ?
              (wire46[(1'h1):(1'h0)] ?
                  wire47 : reg57) : $unsigned(wire51[(2'h2):(1'h0)]));
          reg62 <= reg61[(1'h1):(1'h1)];
          reg63 <= (^($unsigned(($unsigned(wire45) ?
                  $unsigned(wire49) : $unsigned(wire47))) ?
              reg57 : reg57[(3'h7):(2'h3)]));
        end
      else
        begin
          reg52 <= ($signed({reg60[(4'ha):(4'h9)]}) ?
              ($signed($signed(reg61)) ?
                  wire50 : (8'hba)) : {((^~(reg63 >= wire46)) == (7'h42)),
                  $unsigned((wire49[(1'h1):(1'h1)] & reg52[(1'h0):(1'h0)]))});
          reg53 <= reg59[(2'h2):(1'h0)];
          reg54 <= (($signed($signed(wire45)) <= reg58[(3'h6):(1'h0)]) ?
              ((~^reg60[(4'h8):(4'h8)]) + wire45[(3'h7):(1'h1)]) : (7'h40));
          reg55 <= (8'hbc);
        end
      reg64 <= ({$signed((|(reg52 ~^ reg52)))} ^~ (+wire51));
      reg65 <= (^~(^(-($signed(reg58) == (reg60 == wire48)))));
    end
  assign wire66 = (^~$unsigned({$signed((wire51 ? wire47 : reg65))}));
  assign wire67 = {((^~(&(|reg57))) ^ reg64),
                      $unsigned({($unsigned(reg56) ? (|reg57) : wire45)})};
  always
    @(posedge clk) begin
      reg68 <= $unsigned(($signed((!(~|reg60))) ? reg65 : reg61));
      reg69 <= $unsigned((8'ha2));
      reg70 <= ($signed({{(reg68 == wire45), $unsigned((8'hb0))},
              (reg62 || wire46)}) ?
          ($signed(reg56) ~^ $unsigned({(^reg55)})) : (!{$unsigned(((8'hbb) >= reg60)),
              {{reg57}}}));
    end
  assign wire71 = {reg55, (+(8'hac))};
  always
    @(posedge clk) begin
      reg72 <= (&$signed({$signed((reg61 ? reg55 : reg63)),
          ($unsigned(reg70) ? (+reg68) : $signed(wire48))}));
      reg73 <= reg65[(4'hc):(1'h0)];
      if ($signed($unsigned($unsigned((~&reg55)))))
        begin
          reg74 <= (+(^(+{(8'hbf), {reg63, wire51}})));
          reg75 <= (8'hb0);
        end
      else
        begin
          if (wire66[(3'h5):(1'h0)])
            begin
              reg74 <= wire47;
            end
          else
            begin
              reg74 <= $unsigned(wire49);
            end
          reg75 <= wire49;
          reg76 <= $signed(((^~$unsigned(wire67[(1'h0):(1'h0)])) ?
              {reg74[(4'ha):(3'h6)],
                  ((^~wire47) ?
                      (reg60 + wire45) : $signed(reg64))} : $signed(reg57[(1'h1):(1'h1)])));
          reg77 <= reg69[(2'h2):(2'h2)];
          reg78 <= ((!reg73) & (reg63[(3'h4):(1'h0)] ?
              (reg75 ? reg68 : reg77[(3'h4):(1'h0)]) : reg72));
        end
      reg79 <= $signed(wire45[(2'h3):(1'h0)]);
    end
  assign wire80 = (~^$unsigned($unsigned({(~^(8'had))})));
  assign wire81 = (|(^~wire66[(3'h5):(1'h0)]));
  assign wire82 = reg74[(4'ha):(3'h4)];
  assign wire83 = ((|reg74[(1'h0):(1'h0)]) <= (8'ha9));
  always
    @(posedge clk) begin
      reg84 <= $signed($signed(((8'hae) ?
          (|$signed(wire82)) : wire67[(1'h1):(1'h1)])));
      reg85 <= reg53;
    end
  assign wire86 = wire49;
  assign wire87 = $signed(wire71);
  assign wire88 = (($unsigned(((reg72 ? wire45 : wire82) <= $signed(reg77))) ?
                      $unsigned((reg63[(1'h0):(1'h0)] ^~ reg65[(4'h8):(3'h7)])) : {(wire83 ?
                              $signed(reg84) : (&wire87))}) >> $signed($signed(reg64)));
  assign wire89 = $unsigned(((~(!((8'hbe) || wire71))) ?
                      (-reg75) : ({(reg84 ? reg70 : wire80)} & (((8'hb9) ?
                              reg74 : reg65) ?
                          (reg57 <= wire45) : $unsigned(wire67)))));
  assign wire90 = $signed({{$signed(wire67), reg77[(2'h3):(2'h3)]},
                      ((reg53 ? reg62 : reg76) ?
                          wire51 : {reg70[(1'h1):(1'h1)]})});
  assign wire91 = ($signed((!(~(8'haa)))) - ((!$signed({reg53})) ?
                      wire66 : wire89[(1'h0):(1'h0)]));
  assign wire92 = $signed(reg74[(3'h5):(2'h3)]);
  assign wire93 = wire51;
  assign wire94 = (+((~&({wire51} ^ $unsigned((8'hab)))) ?
                      $signed(wire92) : $unsigned(($unsigned(reg73) + (|reg56)))));
  assign wire95 = ($signed(reg63[(4'h8):(2'h3)]) >> $signed($unsigned(((~reg60) && (reg68 ?
                      wire83 : reg53)))));
endmodule
