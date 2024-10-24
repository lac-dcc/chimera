module top
#(parameter param116 = (~&(((|(8'hae)) >> (((8'hb9) ? (8'hba) : (8'ha2)) ? ((8'hbb) >>> (7'h40)) : ((8'ha9) & (8'haa)))) | ((((7'h44) ? (8'hbc) : (8'haf)) * {(8'hb4)}) >>> ((-(8'hac)) ? ((8'ha9) ^~ (8'ha0)) : {(8'hab), (8'hb1)})))), 
parameter param117 = (+(|{(param116 + (!param116)), (-(param116 & param116))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire115;
  wire signed [(4'hc):(1'h0)] wire114;
  wire [(4'h8):(1'h0)] wire113;
  wire [(5'h11):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire109;
  assign y = {wire115, wire114, wire113, wire112, wire111, wire109, (1'h0)};
  module4 #() modinst110 (.wire5(wire0), .clk(clk), .y(wire109), .wire9((8'hb1)), .wire6(wire1), .wire8(wire3), .wire7(wire2));
  assign wire111 = wire0;
  assign wire112 = $signed($unsigned((|$unsigned(wire0))));
  assign wire113 = (^wire109);
  assign wire114 = (!wire113);
  assign wire115 = wire3;
endmodule

module module4
#(parameter param107 = ((((!(^~(8'hb4))) ? (((8'hb8) | (8'ha5)) <<< ((8'ha0) ? (8'hab) : (8'h9f))) : (^((8'ha6) ? (8'hbe) : (7'h43)))) ? {(8'hb7)} : (~(((8'hab) ? (8'ha2) : (8'ha4)) >> {(8'hbd), (8'h9e)}))) >= ((^({(8'ha2)} ? (~|(7'h43)) : ((7'h42) || (8'hb1)))) * ((8'hb0) ? ((7'h44) ? (^~(8'hba)) : (8'ha4)) : (((8'hb1) | (8'hba)) & (-(8'hb8)))))), 
parameter param108 = param107)
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire5;
  input wire signed [(5'h13):(1'h0)] wire6;
  input wire [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(4'ha):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire103;
  wire [(3'h4):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire40;
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(5'h12):(1'h0)] reg42 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire10,
                 wire40,
                 reg106,
                 reg105,
                 reg104,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 (1'h0)};
  assign wire10 = wire5[(4'hf):(1'h1)];
  module11 #() modinst41 (.y(wire40), .wire15(wire6), .wire16(wire9), .wire12(wire5), .wire13(wire10), .wire14(wire7), .clk(clk));
  always
    @(posedge clk) begin
      reg42 <= $unsigned((!(&(+(wire5 ? wire7 : wire40)))));
      if ((-{wire10[(4'hd):(3'h6)], (&(^((8'hb0) ? wire5 : wire6)))}))
        begin
          reg43 <= wire10[(3'h4):(3'h4)];
          if ($unsigned(reg43[(4'h9):(2'h2)]))
            begin
              reg44 <= (!{(reg43 ^ $unsigned(((8'hb8) && (7'h42)))),
                  $unsigned($signed($signed(wire5)))});
              reg45 <= ($signed($signed($signed((&wire5)))) ?
                  wire6 : {(~^(^~wire6))});
              reg46 <= (wire5 ? reg44 : $signed(reg42[(3'h5):(2'h3)]));
              reg47 <= (wire40[(3'h4):(1'h1)] >> reg43);
            end
          else
            begin
              reg44 <= wire7;
              reg45 <= wire10[(4'hc):(1'h1)];
              reg46 <= ($unsigned($signed(reg47[(4'hb):(3'h5)])) ?
                  ({$unsigned($unsigned(wire10)),
                      ((wire10 >>> wire8) ? (&wire5) : reg42)} <= {(wire10 ?
                          $signed(reg44) : (!wire5))}) : (($unsigned({wire5}) ?
                      wire6 : (~(7'h44))) >= (8'hb6)));
              reg47 <= wire6;
            end
        end
      else
        begin
          if ((~reg46[(4'h8):(4'h8)]))
            begin
              reg43 <= reg45[(2'h3):(1'h0)];
              reg44 <= wire5;
            end
          else
            begin
              reg43 <= wire40;
              reg44 <= (~^wire5[(4'hc):(3'h7)]);
              reg45 <= ($unsigned($signed($unsigned($unsigned(reg42)))) & $signed($unsigned($unsigned(reg45))));
              reg46 <= $signed((!(8'h9f)));
            end
          reg47 <= $signed((reg43[(3'h4):(2'h3)] ?
              $signed((wire7 ^ (8'hb4))) : $signed($unsigned((reg43 ~^ (8'hb4))))));
          if ((-($unsigned((reg43 != ((8'hb8) ?
              wire8 : reg43))) <<< $signed({$unsigned(reg46), (^(8'hb6))}))))
            begin
              reg48 <= (($signed(wire40[(2'h2):(1'h1)]) ?
                  $unsigned(($unsigned((8'ha8)) ?
                      $signed(reg47) : $unsigned(wire8))) : $signed({(~^reg42)})) == wire8[(4'hd):(3'h6)]);
              reg49 <= reg47;
              reg50 <= reg42[(4'hf):(4'h8)];
              reg51 <= (((($unsigned(reg42) != {reg45}) ?
                          (-$signed(wire5)) : (reg48 == reg42[(3'h5):(3'h5)])) ?
                      ((~&(~^reg48)) ?
                          reg50[(3'h4):(1'h1)] : $unsigned((wire7 <= reg50))) : (8'ha5)) ?
                  (~|(reg49 ?
                      (8'h9e) : (reg47[(4'hc):(1'h0)] ?
                          $signed(reg44) : $signed((8'hb9))))) : ((reg45 >>> reg44[(3'h5):(1'h0)]) << ({(wire7 ?
                              (8'hbc) : wire40),
                          (wire9 >> wire9)} ?
                      (8'ha7) : ((wire5 & reg49) ?
                          wire9[(4'ha):(2'h2)] : (wire7 ? reg46 : wire8)))));
            end
          else
            begin
              reg48 <= (wire40[(3'h7):(3'h4)] ?
                  ($unsigned((reg48[(1'h1):(1'h1)] <= (reg44 + reg51))) ^~ ($unsigned((wire8 ?
                          reg48 : wire5)) ?
                      $signed((|wire7)) : reg47)) : (~{wire6[(4'h8):(3'h5)]}));
              reg49 <= $unsigned(reg44);
              reg50 <= (|$signed((^$unsigned(reg42))));
            end
          reg52 <= $unsigned((wire8 & (reg46 > reg51)));
          reg53 <= $unsigned($signed(reg46));
        end
      if ((($signed((!$unsigned(reg51))) == (~|$signed(reg48[(2'h2):(2'h2)]))) <= reg45[(4'h8):(2'h3)]))
        begin
          if (($signed(((~(reg48 ? reg43 : reg52)) - ((reg43 ? reg49 : reg43) ?
              $signed(wire6) : (~^wire5)))) >> (wire7[(4'h9):(2'h3)] ~^ (^(-(|wire5))))))
            begin
              reg54 <= reg49;
              reg55 <= $unsigned($signed((reg53[(2'h3):(1'h0)] ?
                  ($signed(reg43) & (reg54 ? reg48 : wire9)) : (&(+reg43)))));
              reg56 <= reg55;
            end
          else
            begin
              reg54 <= {$signed((~&((~&(8'hab)) ^ (reg45 ? wire6 : reg55))))};
              reg55 <= $signed($unsigned(reg53));
              reg56 <= (+($unsigned((&(wire5 ^ wire9))) ^ ($signed($unsigned(wire10)) > (reg54[(4'ha):(2'h2)] ?
                  $signed(wire5) : wire9))));
              reg57 <= {reg52[(3'h4):(2'h3)]};
              reg58 <= $unsigned((((8'h9e) ?
                      ($unsigned(reg56) ?
                          $signed(wire9) : (^~reg48)) : ((reg53 ?
                          reg52 : reg42) && $signed((8'hb9)))) ?
                  (wire7[(3'h4):(3'h4)] ^ (~^reg44[(4'h8):(2'h3)])) : wire10));
            end
          reg59 <= (({$unsigned(reg42),
                  reg47[(4'hb):(1'h0)]} + (^(&(&reg56)))) ?
              ({(reg47 ? (reg52 ? wire5 : reg54) : (~^wire7))} >>> {{(reg44 ?
                          reg48 : reg57)},
                  (-wire8)}) : (wire9[(3'h7):(2'h2)] ?
                  ((|$signed((8'hbf))) || {(!wire40)}) : reg54));
          reg60 <= ($signed(wire40) + $unsigned(((((8'hac) * reg52) ?
              wire6[(4'hb):(1'h0)] : (~&(8'h9c))) * $unsigned((&wire7)))));
        end
      else
        begin
          reg54 <= (reg56[(2'h2):(2'h2)] - ((^~$signed(wire10)) <= reg59[(1'h0):(1'h0)]));
          reg55 <= reg46[(4'h9):(2'h3)];
        end
      reg61 <= ($unsigned(wire9[(2'h3):(2'h3)]) ?
          reg48[(1'h0):(1'h0)] : (reg50 * ({((8'ha3) ? (8'haf) : reg55)} ?
              reg53 : wire7[(3'h7):(3'h4)])));
    end
  always
    @(posedge clk) begin
      if (reg52)
        begin
          reg62 <= ($signed(reg42) ? wire8 : $unsigned(wire6));
          reg63 <= (~&{reg48[(3'h4):(3'h4)],
              ((reg44 ? $signed(reg46) : wire8) ?
                  (reg56 ?
                      $unsigned(wire5) : (wire7 ^~ reg43)) : (reg47[(4'he):(2'h3)] ?
                      $unsigned(reg44) : (wire8 ? wire9 : reg43)))});
        end
      else
        begin
          if ($signed(reg61[(4'h9):(3'h6)]))
            begin
              reg62 <= reg45[(3'h6):(3'h4)];
              reg63 <= (&reg50[(2'h2):(1'h1)]);
              reg64 <= (&(^~{$signed({reg45, (8'hbf)}), reg54}));
              reg65 <= $signed(reg64);
            end
          else
            begin
              reg62 <= (^~wire6);
              reg63 <= reg64;
            end
          if ($unsigned((8'hb2)))
            begin
              reg66 <= reg53;
              reg67 <= $signed((((reg49[(5'h10):(4'he)] ?
                  (reg66 ? reg51 : reg65) : (reg57 ?
                      reg63 : reg48)) == ((reg43 ?
                  reg58 : wire6) >> $signed(reg44))) + (+reg66[(2'h3):(2'h2)])));
              reg68 <= reg52;
            end
          else
            begin
              reg66 <= (wire6 <= reg64);
              reg67 <= (~{$signed(reg60), reg52});
              reg68 <= {(reg46[(4'h9):(4'h9)] ?
                      (({wire40} - $signed(reg45)) == $unsigned((reg59 && reg58))) : reg43[(4'hd):(1'h1)]),
                  $unsigned(reg56)};
              reg69 <= ((8'h9f) ?
                  (reg65[(3'h5):(3'h4)] ?
                      (&({(8'ha5), reg65} ?
                          $unsigned(reg68) : reg58)) : $signed(reg48[(1'h1):(1'h1)])) : wire8);
              reg70 <= $unsigned((reg57 << $unsigned(($signed(reg57) && (wire6 ^~ (8'hb5))))));
            end
          if (reg66)
            begin
              reg71 <= ((-(^(8'h9c))) ? reg70 : (^{$unsigned($signed(reg53))}));
            end
          else
            begin
              reg71 <= ($signed(reg51) <<< reg62[(1'h0):(1'h0)]);
              reg72 <= reg53;
              reg73 <= reg47;
            end
          reg74 <= reg60;
        end
    end
  module75 #() modinst100 (.wire76(reg55), .wire77(reg50), .wire79(reg60), .clk(clk), .y(wire99), .wire80(reg67), .wire78(reg64));
  assign wire101 = $signed((wire9 >= (reg70[(2'h2):(1'h0)] ^~ ((&(8'ha2)) <= (reg44 || wire7)))));
  assign wire102 = ($signed($signed($unsigned((!reg73)))) <<< (|{(^(^wire99)),
                       {$signed(reg67), wire5[(4'hf):(4'he)]}}));
  assign wire103 = {{$signed(reg74[(2'h3):(1'h0)])},
                       $unsigned(reg50[(4'h9):(3'h6)])};
  always
    @(posedge clk) begin
      reg104 <= ((|((reg73[(2'h3):(1'h1)] > (+reg45)) ?
              $signed(reg59[(4'hb):(2'h2)]) : ((+reg74) ?
                  (8'hb7) : $unsigned(reg66)))) ?
          reg43[(4'ha):(3'h5)] : wire103);
      reg105 <= ($unsigned($unsigned({(^reg67),
          wire99})) ^ reg52[(2'h2):(1'h0)]);
      reg106 <= (~|wire102[(3'h4):(2'h2)]);
    end
endmodule

module module75
#(parameter param98 = ({(((~|(8'hab)) ? ((8'hb4) ? (8'h9d) : (8'hbf)) : (!(8'haf))) != ((8'hb6) ? ((8'hb0) >= (8'had)) : ((8'hb4) ~^ (8'ha7)))), (((~|(8'h9d)) ? ((8'ha2) ? (8'h9c) : (7'h43)) : ((8'hb3) && (8'hae))) ? (((8'haf) ? (8'ha7) : (8'h9e)) < ((7'h43) * (8'hb2))) : (8'ha2))} < (({((7'h43) ? (8'hbc) : (8'ha8)), ((8'hba) <= (8'ha4))} | (((8'hbd) ? (8'ha5) : (8'hb3)) != (-(8'ha0)))) ? (8'hac) : ((!((8'hb5) ? (8'ha3) : (8'haf))) ^ (8'hae)))))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'hcb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire80;
  input wire [(4'h9):(1'h0)] wire79;
  input wire signed [(5'h15):(1'h0)] wire78;
  input wire [(4'ha):(1'h0)] wire77;
  input wire signed [(5'h11):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire signed [(2'h3):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(2'h3):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire82,
                 wire81,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  assign wire81 = wire78;
  assign wire82 = (((((8'hb2) ?
                          (-wire80) : (wire79 ?
                              wire78 : wire81)) > (+(~^(8'ha6)))) << ((~^(wire77 ?
                          wire78 : wire77)) ~^ wire80)) ?
                      $unsigned($unsigned(((~&wire78) ^~ $unsigned(wire80)))) : wire77);
  always
    @(posedge clk) begin
      reg83 <= $unsigned(($unsigned(($unsigned((8'hbe)) - (wire76 >>> wire79))) ?
          (~&wire78[(5'h14):(5'h11)]) : $unsigned($signed((wire78 << wire79)))));
      reg84 <= (8'hbb);
      reg85 <= ({wire77[(1'h1):(1'h1)],
          $unsigned({(wire78 ?
                  (8'haa) : wire80)})} <= $signed(wire78[(3'h6):(2'h3)]));
      if ((^~wire80))
        begin
          if ({(-($unsigned(wire77[(4'h8):(2'h2)]) == wire76[(4'hd):(2'h3)])),
              wire80})
            begin
              reg86 <= (($signed({wire79}) || wire76[(4'ha):(3'h6)]) >>> wire81);
              reg87 <= reg85;
              reg88 <= wire81;
              reg89 <= {$unsigned($unsigned(wire78[(3'h4):(1'h1)])),
                  reg88[(4'h8):(1'h0)]};
            end
          else
            begin
              reg86 <= (|(~|((~$signed(wire77)) ?
                  wire76[(4'hc):(3'h7)] : ($unsigned(wire78) ?
                      (|wire78) : $signed(wire80)))));
            end
        end
      else
        begin
          reg86 <= (wire80 ?
              $signed($unsigned(($signed(reg89) ?
                  (&(8'ha0)) : (reg88 ?
                      reg86 : wire78)))) : ($unsigned($unsigned((wire80 ?
                      reg86 : wire76))) ?
                  (|((^~reg83) ?
                      (wire81 ?
                          (8'ha7) : reg85) : $unsigned(reg83))) : {reg86[(2'h3):(1'h1)]}));
          reg87 <= $unsigned((((((8'hac) & reg89) <<< wire80) ?
                  $signed(wire78) : ((reg85 - (8'hb2)) < wire81[(4'ha):(1'h0)])) ?
              ((!$unsigned(wire76)) ?
                  ($unsigned(wire79) >= $unsigned(wire77)) : reg89[(2'h3):(1'h1)]) : reg88[(4'hb):(4'h9)]));
          reg88 <= $unsigned(reg84);
          reg89 <= (reg89[(3'h4):(1'h1)] ?
              wire82[(4'hf):(4'hd)] : $signed($signed(reg88)));
          reg90 <= (!$unsigned(reg83));
        end
      reg91 <= ({({wire76, $unsigned((8'hb8))} ?
                  (wire82 - $unsigned(reg89)) : wire80[(1'h1):(1'h0)])} ?
          reg88 : $unsigned((~^($unsigned(wire76) ? (^reg85) : (!wire82)))));
    end
  assign wire92 = {$signed((($signed(reg91) <= reg91) * ($signed((8'had)) ?
                          ((8'hb6) ? wire80 : (8'hbf)) : wire79))),
                      {(wire80 >> reg87[(4'h8):(3'h6)]), (7'h40)}};
  assign wire93 = (reg86 == reg91[(3'h4):(2'h3)]);
  assign wire94 = (wire93 == reg89);
  assign wire95 = ((((^(reg86 >= wire77)) ?
                          ((wire94 ? wire77 : reg90) ^ (reg90 ?
                              reg84 : wire79)) : (|$unsigned((8'h9c)))) | ($signed(reg85[(3'h7):(1'h0)]) == reg89[(3'h4):(3'h4)])) ?
                      $unsigned({$unsigned(((8'haa) ?
                              (7'h41) : reg90))}) : wire93[(3'h5):(3'h5)]);
  assign wire96 = wire93;
  assign wire97 = {(!$unsigned(reg84[(4'hb):(4'h8)])),
                      (wire95 != reg90[(4'ha):(4'h8)])};
endmodule

module module11
#(parameter param38 = (~|(~&{(!(8'hb8))})), 
parameter param39 = {{(param38 ? ((!param38) <= (8'h9c)) : ((param38 <= param38) && ((8'h9e) ? param38 : (8'hab)))), (+param38)}, param38})
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire16;
  input wire [(4'h9):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire [(5'h11):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(5'h15):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire22;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire17 = {(($unsigned((8'hbb)) ?
                          wire15[(3'h7):(3'h5)] : ((~wire15) < $unsigned(wire13))) * (8'ha1))};
  assign wire18 = $signed((&(~(^(wire15 * wire14)))));
  assign wire19 = $signed($signed($signed($signed({wire12}))));
  assign wire20 = ($signed($signed((wire18 ?
                      (wire12 <<< wire12) : (!(8'ha6))))) ~^ $unsigned($signed({((8'h9d) ?
                          wire12 : (8'hbf))})));
  assign wire21 = wire18[(1'h0):(1'h0)];
  assign wire22 = wire20[(1'h1):(1'h0)];
  assign wire23 = {wire15[(2'h2):(2'h2)]};
  assign wire24 = (|((wire16 <<< (wire14[(2'h3):(1'h0)] ?
                      $signed(wire20) : wire23)) >>> $unsigned({$signed(wire13)})));
  assign wire25 = wire18;
  assign wire26 = $unsigned($unsigned($unsigned($signed(wire20))));
  assign wire27 = (wire26 ?
                      {($unsigned(wire12[(2'h2):(1'h0)]) ?
                              $unsigned($signed((8'hb7))) : ((wire21 ?
                                  wire15 : wire20) == $signed(wire22))),
                          $signed(wire16[(4'h8):(3'h5)])} : ((+$unsigned($unsigned(wire16))) << $unsigned(wire12)));
  always
    @(posedge clk) begin
      reg28 <= $unsigned((~&($signed((8'hac)) ?
          ((wire25 ? wire13 : wire14) ?
              wire14[(3'h6):(3'h5)] : wire16) : wire27)));
      reg29 <= $unsigned({$signed(wire21), (^$signed($signed(reg28)))});
      reg30 <= (wire21 ?
          (&((~^reg29) ?
              {wire20,
                  wire22} : $unsigned((wire22 > wire14)))) : ($unsigned(($unsigned(wire19) - (+wire13))) & $signed(wire23)));
    end
  assign wire31 = $unsigned((~^$unsigned($signed((wire18 ? wire20 : wire23)))));
  assign wire32 = {(wire14[(4'h9):(4'h9)] != wire12),
                      ({(wire20[(2'h2):(1'h1)] ?
                              (!wire31) : (&wire17))} < wire15)};
  assign wire33 = ($signed(wire13) ~^ (wire27 << ((^~(wire19 == wire20)) || wire15)));
  assign wire34 = wire15[(3'h5):(2'h2)];
  assign wire35 = $unsigned((8'ha8));
  assign wire36 = $signed((~&wire35[(1'h1):(1'h1)]));
  assign wire37 = {wire36,
                      ((((&wire31) ?
                                  {wire32, (8'hbf)} : wire22[(2'h2):(2'h2)]) ?
                              ($signed(wire32) ?
                                  wire34 : wire20) : $unsigned($signed(reg29))) ?
                          (|(~^{wire14})) : (~(7'h42)))};
endmodule
