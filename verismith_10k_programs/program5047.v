module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire161;
  wire [(5'h11):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire159;
  wire [(5'h12):(1'h0)] wire158;
  wire [(4'hb):(1'h0)] wire157;
  wire [(2'h3):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire155;
  wire [(4'ha):(1'h0)] wire154;
  wire signed [(5'h15):(1'h0)] wire153;
  wire signed [(4'h9):(1'h0)] wire152;
  wire [(4'he):(1'h0)] wire150;
  wire signed [(5'h14):(1'h0)] wire149;
  wire [(4'ha):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire145;
  reg [(5'h12):(1'h0)] reg151 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire150,
                 wire149,
                 wire148,
                 wire145,
                 reg151,
                 reg147,
                 (1'h0)};
  module4 #() modinst146 (.y(wire145), .wire7(wire3), .wire5((8'hb7)), .wire9(wire1), .wire6(wire0), .wire8(wire2), .clk(clk));
  always
    @(posedge clk) begin
      reg147 <= $unsigned(((^((~&(7'h42)) == $signed(wire3))) << wire0[(5'h12):(4'hf)]));
    end
  assign wire148 = wire0;
  assign wire149 = (wire1 ?
                       (+(&{((8'hac) ? wire145 : wire1),
                           (~|wire2)})) : $unsigned((($signed(reg147) ?
                               $signed(wire148) : {wire0}) ?
                           (wire148 > (reg147 << wire3)) : $unsigned((8'ha2)))));
  assign wire150 = $signed(wire149);
  always
    @(posedge clk) begin
      reg151 <= $unsigned(({reg147,
          ((wire149 ?
              wire1 : reg147) == $signed(wire149))} == (|wire149[(3'h7):(3'h5)])));
    end
  assign wire152 = wire2[(3'h4):(3'h4)];
  assign wire153 = wire2;
  assign wire154 = $unsigned(($signed({wire153}) >= wire148[(1'h1):(1'h1)]));
  assign wire155 = {$signed({$signed((wire153 >> wire150)), $signed({wire2})})};
  assign wire156 = $signed($unsigned({reg147, wire145[(4'h9):(4'h8)]}));
  assign wire157 = $signed((+wire155));
  assign wire158 = {wire157[(3'h5):(3'h4)]};
  assign wire159 = $signed(wire148);
  assign wire160 = $signed((~^wire2[(4'hc):(4'hb)]));
  assign wire161 = (wire152[(1'h1):(1'h1)] ?
                       (wire156 ?
                           (($signed(wire145) ?
                               $signed((8'had)) : $unsigned(wire152)) ^ (-(wire156 ?
                               wire2 : wire153))) : ($unsigned((wire150 ?
                                   (8'hbc) : wire152)) ?
                               $unsigned($signed(wire1)) : {(^~wire149)})) : (wire0 ?
                           $unsigned(((&wire145) ?
                               reg147[(2'h3):(2'h2)] : wire149[(5'h11):(1'h0)])) : $unsigned(((wire155 > wire2) + $unsigned(wire150)))));
endmodule

module module4
#(parameter param143 = (8'ha2), 
parameter param144 = param143)
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire142;
  wire signed [(3'h5):(1'h0)] wire141;
  wire [(5'h11):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire89;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire79;
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire139,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire88,
                 wire48,
                 wire79,
                 reg90,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 (1'h0)};
  module10 #() modinst49 (.wire11(wire6), .wire13(wire7), .clk(clk), .wire12(wire5), .wire14(wire9), .wire15(wire8), .y(wire48));
  module50 #() modinst80 (.y(wire79), .wire51(wire9), .wire54(wire6), .wire53(wire7), .wire52(wire8), .wire55(wire48), .clk(clk));
  always
    @(posedge clk) begin
      reg81 <= $signed({wire6[(2'h3):(2'h2)]});
      if ((-(~&{((+wire5) <<< (-wire79)), $unsigned($signed(wire48))})))
        begin
          reg82 <= (~&$unsigned(((&$signed((8'hbf))) ?
              ($unsigned(wire8) ?
                  (wire5 + (8'ha4)) : $unsigned(wire5)) : wire6)));
          reg83 <= wire6;
        end
      else
        begin
          if (({$unsigned((~|{wire79}))} >>> (((~(reg82 ? wire7 : wire79)) ?
              $signed((~reg83)) : reg83) >>> {(~&wire7[(4'h9):(4'h8)]),
              (wire79[(4'he):(1'h0)] ? (^(8'ha9)) : {reg82})})))
            begin
              reg82 <= wire9[(4'h9):(3'h7)];
              reg83 <= wire5[(1'h1):(1'h0)];
              reg84 <= {((($signed(wire6) ? (~&reg82) : {reg81, reg82}) ?
                          (~&wire5[(3'h4):(2'h3)]) : $signed((~wire6))) ?
                      ($signed((~^wire7)) ?
                          ($unsigned(wire5) ?
                              {wire79} : (&reg83)) : wire79[(1'h1):(1'h1)]) : $unsigned(($signed(wire7) ?
                          (reg81 || (8'hab)) : (8'haf))))};
            end
          else
            begin
              reg82 <= $unsigned((~|($signed((8'hbc)) ?
                  reg83 : (wire7[(4'h9):(2'h3)] - $signed(reg83)))));
            end
        end
      reg85 <= $signed(($signed({reg84}) ?
          ($unsigned((wire48 > wire6)) ?
              wire8[(4'h8):(1'h1)] : (wire6[(4'ha):(3'h5)] ?
                  (reg84 == wire48) : (reg81 ? (8'ha4) : wire9))) : reg84));
      reg86 <= $signed((|$signed(((wire6 == wire6) ?
          {(8'hbf)} : wire5[(1'h1):(1'h0)]))));
      reg87 <= (7'h43);
    end
  assign wire88 = {reg83[(3'h5):(3'h4)]};
  assign wire89 = ($unsigned($signed(reg86[(1'h1):(1'h1)])) <<< $unsigned({(reg83 ?
                          $signed(reg85) : wire79)}));
  always
    @(posedge clk) begin
      reg90 <= reg84[(4'ha):(2'h3)];
    end
  assign wire91 = wire88[(2'h2):(2'h2)];
  assign wire92 = ({reg81[(1'h0):(1'h0)],
                      (wire89 * (reg83[(3'h4):(1'h0)] ?
                          {wire91, wire9} : {(8'hb0),
                              reg82}))} >>> ((reg82[(1'h1):(1'h1)] ?
                          (7'h40) : $signed((reg87 ? reg81 : wire6))) ?
                      reg90[(1'h0):(1'h0)] : wire88));
  assign wire93 = reg86[(1'h1):(1'h0)];
  module94 #() modinst140 (wire139, clk, wire88, reg85, reg86, wire5);
  assign wire141 = (wire88[(4'ha):(4'h9)] <<< (^~wire5[(3'h7):(3'h7)]));
  assign wire142 = $signed($signed($signed(reg86[(3'h7):(1'h0)])));
endmodule

module module94
#(parameter param138 = (~|((~^(~^{(8'hb9), (7'h41)})) ? ((((8'had) << (8'haa)) ? (8'hab) : (~|(8'hb8))) > ({(8'hb0)} ? (&(8'hb5)) : (+(8'ha1)))) : ((~&((8'ha5) ? (8'hb9) : (8'hab))) < (~|(&(8'ha1)))))))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire98;
  input wire signed [(5'h15):(1'h0)] wire97;
  input wire signed [(5'h13):(1'h0)] wire96;
  input wire signed [(5'h10):(1'h0)] wire95;
  wire signed [(4'hf):(1'h0)] wire137;
  wire signed [(2'h2):(1'h0)] wire136;
  wire [(3'h7):(1'h0)] wire135;
  wire signed [(4'hc):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire signed [(5'h10):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire103;
  wire [(5'h10):(1'h0)] wire102;
  wire [(2'h2):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  reg signed [(5'h13):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(4'hc):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(4'hc):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire120,
                 wire119,
                 wire117,
                 wire116,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
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
                 reg118,
                 reg115,
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
                 (1'h0)};
  assign wire99 = (~|(~&$unsigned(($signed(wire95) == (&(8'hb0))))));
  assign wire100 = (~$signed(wire99));
  assign wire101 = {$unsigned(wire99[(1'h1):(1'h0)]),
                       $unsigned((((7'h40) ?
                               $unsigned((8'hb3)) : (wire98 <= (8'hb3))) ?
                           wire98 : ($signed(wire98) ?
                               {wire99, wire98} : wire99[(1'h1):(1'h1)])))};
  assign wire102 = wire97[(4'hc):(4'hb)];
  assign wire103 = wire99;
  always
    @(posedge clk) begin
      reg104 <= wire96[(3'h5):(1'h0)];
      reg105 <= $unsigned($signed(($unsigned(reg104[(2'h3):(2'h3)]) > $unsigned($signed(wire103)))));
      reg106 <= $signed((((~(wire96 ? wire100 : wire95)) && (&{(8'ha0),
              wire97})) ?
          $unsigned(wire95) : (wire100[(2'h3):(1'h1)] + wire100[(4'h8):(2'h2)])));
      if ((-reg105))
        begin
          if ($unsigned($unsigned(wire100[(4'hd):(2'h3)])))
            begin
              reg107 <= (^~(((~|wire100[(1'h1):(1'h0)]) ~^ wire103) ?
                  wire99[(4'hb):(3'h5)] : {(reg106 ?
                          (reg106 ? wire101 : wire99) : {(8'had), wire102})}));
              reg108 <= reg107;
              reg109 <= $unsigned($signed(wire101));
            end
          else
            begin
              reg107 <= (~&$unsigned((|$unsigned((^(7'h43))))));
              reg108 <= $signed(wire100);
            end
          reg110 <= $signed($unsigned($unsigned(wire98[(3'h7):(2'h2)])));
          reg111 <= {((+((wire96 ? (7'h40) : reg107) ?
                      $unsigned(reg106) : wire101[(1'h1):(1'h0)])) ?
                  ((~^$unsigned((8'hae))) ?
                      ({wire103} ?
                          wire103 : (^~reg107)) : $unsigned($signed(reg106))) : wire97[(5'h12):(2'h3)])};
          reg112 <= $signed((~|{(!(reg109 && wire102)), (~&(|wire96))}));
          reg113 <= wire103[(4'h9):(4'h8)];
        end
      else
        begin
          if ((8'hbb))
            begin
              reg107 <= $unsigned(wire101);
              reg108 <= $unsigned(((reg104[(3'h7):(2'h3)] <<< reg107) ?
                  (!({reg113, wire102} ?
                      $unsigned(wire96) : ((8'hb5) ^ (8'ha3)))) : {reg108[(3'h5):(1'h0)]}));
              reg109 <= wire102;
            end
          else
            begin
              reg107 <= (^{(+((wire97 & reg104) ?
                      reg105 : reg105[(2'h2):(1'h1)]))});
              reg108 <= reg113[(4'h9):(3'h4)];
            end
        end
      reg114 <= wire95[(3'h5):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg115 <= wire102;
    end
  assign wire116 = {(reg105 ~^ (~|($unsigned(reg108) > $signed(reg104)))),
                       {(~&(7'h41))}};
  assign wire117 = wire99[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg118 <= ($signed($unsigned(reg114[(1'h0):(1'h0)])) ~^ (~&($unsigned($unsigned(reg105)) ?
          (reg112 | (wire100 && reg104)) : {(reg108 ? reg104 : wire102),
              reg105})));
    end
  assign wire119 = $signed($unsigned($signed((wire96[(4'hd):(1'h1)] ?
                       reg109 : (wire95 ? reg110 : wire95)))));
  assign wire120 = $signed((|{$signed((wire97 ? reg107 : (8'hbe))),
                       $unsigned($signed(reg115))}));
  always
    @(posedge clk) begin
      reg121 <= (!{(8'ha2), $unsigned((&$unsigned(reg113)))});
      reg122 <= (($unsigned(((|(8'ha1)) ?
              $unsigned(reg115) : ((8'hb6) ?
                  reg104 : wire98))) || $unsigned({(reg104 + wire119),
              $signed((8'ha4))})) ?
          ((((+reg113) ? (8'had) : $unsigned(wire98)) >> ($unsigned(wire120) ?
                  $unsigned(wire103) : $unsigned(wire96))) ?
              {(wire120 ? wire119[(2'h2):(1'h0)] : $unsigned(reg118)),
                  $signed($unsigned((8'hab)))} : $signed((-(8'ha4)))) : {$unsigned($unsigned($signed(reg121))),
              $signed((+$signed(wire95)))});
      reg123 <= $signed((wire98 ?
          (wire98 ?
              $signed($unsigned(wire117)) : reg109) : $signed(reg108[(1'h1):(1'h1)])));
    end
  always
    @(posedge clk) begin
      if ((($unsigned(reg110[(3'h5):(3'h5)]) ?
              (|{$unsigned(wire116)}) : (reg110 ^ $signed(reg112[(3'h5):(3'h5)]))) ?
          $unsigned((($unsigned(reg104) ? (^reg114) : $signed(wire97)) ?
              (reg113[(4'h8):(3'h5)] * reg109) : wire99[(3'h7):(3'h6)])) : {{$signed((reg118 ?
                      wire117 : wire117))},
              (~&reg123)}))
        begin
          reg124 <= reg110[(4'h8):(1'h0)];
        end
      else
        begin
          reg124 <= $signed(({(+((8'ha9) >= wire103))} ?
              wire117[(1'h0):(1'h0)] : ((reg123 ?
                  wire95[(4'hf):(4'ha)] : (reg118 | wire98)) >= wire96)));
        end
      reg125 <= $signed(((!(8'ha4)) ? $signed({reg105, wire119}) : (8'hb9)));
      if ($signed((~|wire120[(2'h2):(1'h0)])))
        begin
          reg126 <= (~&reg108[(4'he):(4'hc)]);
          reg127 <= ((reg106 && wire102[(1'h0):(1'h0)]) - (((|((8'h9c) ?
                  (8'hb1) : reg124)) ?
              wire101 : wire116[(5'h13):(5'h11)]) ~^ (wire117 < ((reg123 >= wire100) ?
              reg108 : wire116[(4'hb):(4'h8)]))));
          reg128 <= (~&reg114[(2'h3):(2'h3)]);
          if ((((~^$unsigned(wire120)) ?
                  (~|((&reg124) ?
                      wire95[(4'h9):(1'h0)] : wire99[(3'h5):(3'h5)])) : ((|(reg121 >>> wire101)) >> reg124[(4'hf):(1'h0)])) ?
              ((&((+wire100) ?
                  {(8'haf), reg107} : (reg123 ?
                      wire120 : reg108))) >= {$unsigned((reg106 ?
                      reg118 : reg113))}) : (($signed({reg124}) < (reg121 ?
                      (reg114 >> (8'hbd)) : (&reg104))) ?
                  reg126 : ((((7'h44) && wire103) ?
                      (reg114 ?
                          wire119 : wire101) : $unsigned(reg118)) <= ({wire98} >>> $unsigned((8'ha7)))))))
            begin
              reg129 <= wire102;
              reg130 <= (|wire95[(4'h9):(4'h8)]);
              reg131 <= reg128[(3'h5):(1'h0)];
              reg132 <= ({(reg105[(2'h2):(1'h1)] ?
                          (|(wire100 * reg115)) : (reg124 >> (wire102 ?
                              wire119 : (7'h43)))),
                      $signed(((reg126 * reg115) ?
                          (wire97 ? wire97 : (8'h9f)) : $signed(reg127)))} ?
                  reg104 : (reg125 ?
                      wire102[(4'hb):(2'h3)] : {{reg108[(5'h12):(2'h2)]}}));
              reg133 <= {reg104[(1'h1):(1'h0)],
                  (reg127 ? reg131 : wire119[(1'h1):(1'h1)])};
            end
          else
            begin
              reg129 <= $signed($signed(reg114[(3'h4):(1'h1)]));
              reg130 <= ($unsigned($signed(reg118)) == ((wire100 * ((reg121 ^~ wire101) ^~ ((8'hbf) >>> reg128))) || ((^~$unsigned(reg132)) ?
                  (+$signed((8'hb7))) : (reg106[(1'h0):(1'h0)] ?
                      $signed(wire98) : $unsigned(reg118)))));
            end
        end
      else
        begin
          reg126 <= {$unsigned(($signed((~|reg106)) * (reg107 ?
                  (7'h41) : $signed(reg110)))),
              (reg118 == wire116[(4'hf):(4'ha)])};
          reg127 <= (~|(wire116[(3'h4):(2'h3)] ?
              (^~{wire102[(4'h9):(3'h4)]}) : reg121));
          reg128 <= $signed(reg115);
        end
      reg134 <= (reg115[(3'h6):(2'h2)] ^~ $unsigned(((reg125[(2'h3):(2'h2)] == reg129[(5'h10):(4'ha)]) ?
          (+{reg113}) : (reg125[(1'h0):(1'h0)] ?
              reg113[(3'h4):(1'h1)] : (-wire117)))));
    end
  assign wire135 = ((^~({{reg109,
                           reg114}} - reg112[(2'h2):(1'h0)])) != ($unsigned(reg129) >= reg124));
  assign wire136 = ($unsigned($signed((~(8'ha5)))) <= ($unsigned((^~$signed(reg118))) && reg106));
  assign wire137 = (^$unsigned(($signed($signed(reg132)) ?
                       $signed(((8'hb2) ?
                           wire135 : reg112)) : wire96[(5'h13):(5'h10)])));
endmodule

module module50
#(parameter param77 = (+(!(7'h40))), 
parameter param78 = {param77, ({(8'hbd), {(^param77)}} ? {((param77 > param77) ? (param77 < param77) : (param77 ? (8'had) : (8'hae))), ({param77} ? (~&param77) : (param77 & param77))} : ((&param77) ? {(param77 ? param77 : param77)} : param77))})
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire55;
  input wire [(2'h3):(1'h0)] wire54;
  input wire [(5'h13):(1'h0)] wire53;
  input wire signed [(5'h15):(1'h0)] wire52;
  input wire signed [(4'h9):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire signed [(4'he):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 reg76,
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
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire56 = $unsigned(($signed({$signed(wire55), (wire54 + (8'ha5))}) ?
                      wire51[(2'h2):(1'h1)] : (^~(wire52 < wire53))));
  assign wire57 = {$signed($unsigned(((^wire53) | wire54[(2'h2):(2'h2)])))};
  assign wire58 = ({($signed((wire54 ^ wire57)) ?
                          (wire54 >= (~wire51)) : (!wire56))} - $unsigned(wire52[(2'h2):(1'h0)]));
  assign wire59 = wire58[(4'hc):(3'h7)];
  assign wire60 = ($signed(wire53[(4'h9):(3'h4)]) ?
                      $signed(wire56[(5'h12):(3'h4)]) : (({wire58[(4'hc):(2'h2)],
                          wire57[(4'hd):(4'hd)]} <= wire51[(2'h3):(2'h2)]) >>> (wire51 != (wire57 ~^ ((8'h9c) >> wire57)))));
  assign wire61 = (wire53 | $signed($signed({wire51[(4'h9):(2'h3)],
                      (^~wire52)})));
  always
    @(posedge clk) begin
      if ((wire56[(5'h10):(3'h5)] >= (wire59 ^ (|wire54))))
        begin
          reg62 <= $signed(wire61);
          if ($signed(wire53))
            begin
              reg63 <= $unsigned(((wire56 & $signed((^wire55))) < wire55));
              reg64 <= wire58[(4'ha):(4'h8)];
              reg65 <= wire54[(2'h3):(2'h2)];
              reg66 <= (($signed(wire57) ~^ wire58) ?
                  $unsigned(wire58[(5'h13):(3'h5)]) : (~|$signed($signed((wire51 ?
                      wire61 : wire59)))));
            end
          else
            begin
              reg63 <= ((~wire52) ?
                  $signed(reg65[(1'h1):(1'h1)]) : (|wire58[(4'hc):(1'h0)]));
              reg64 <= reg64;
              reg65 <= $signed({($signed((reg63 << wire52)) && wire54[(2'h2):(1'h1)])});
              reg66 <= $signed(wire56);
              reg67 <= reg63[(2'h2):(1'h1)];
            end
          reg68 <= $unsigned(wire55[(3'h5):(1'h0)]);
        end
      else
        begin
          reg62 <= reg68[(1'h1):(1'h1)];
          if (wire55)
            begin
              reg63 <= $signed({wire51});
              reg64 <= ($signed((!($unsigned(reg63) ?
                  $unsigned(wire52) : ((8'hb2) || wire52)))) & reg64);
              reg65 <= wire52[(4'hb):(4'h8)];
              reg66 <= (|{(~|((wire59 ? wire55 : wire52) >> (reg67 ~^ reg65))),
                  ($unsigned((reg66 ? reg66 : wire59)) ?
                      ($unsigned((8'hb4)) + (wire58 <<< reg62)) : (reg62 <= (wire52 ?
                          wire53 : wire51)))});
            end
          else
            begin
              reg63 <= ({wire60} - wire52[(4'hf):(2'h2)]);
              reg64 <= $unsigned($unsigned((-(-reg65[(1'h0):(1'h0)]))));
              reg65 <= ($unsigned((wire57[(4'hf):(3'h7)] ?
                      wire51 : $signed($signed(reg68)))) ?
                  (wire61[(1'h1):(1'h0)] ?
                      (|$unsigned((wire60 ?
                          wire51 : (8'hb0)))) : $signed((((8'h9c) ?
                          (8'hb0) : reg62) ^ $signed((8'haa))))) : (|$unsigned($unsigned($unsigned(reg62)))));
              reg66 <= $signed(wire55);
            end
          if (reg65[(1'h1):(1'h0)])
            begin
              reg67 <= (reg66[(4'hd):(4'hb)] ?
                  wire52[(5'h11):(4'h9)] : ({$signed($signed(wire56)),
                      wire60} == reg65[(1'h0):(1'h0)]));
              reg68 <= (reg67[(1'h1):(1'h1)] ?
                  $signed(wire54[(2'h3):(1'h0)]) : (8'hb9));
              reg69 <= $unsigned($signed(wire51));
            end
          else
            begin
              reg67 <= reg67[(3'h4):(1'h0)];
              reg68 <= $unsigned(($unsigned($signed(reg68[(1'h1):(1'h0)])) ^~ (($signed(wire61) >= (wire59 ?
                      wire54 : wire55)) ?
                  wire61[(2'h3):(2'h2)] : reg68)));
              reg69 <= (((reg66 ?
                      (reg63[(3'h4):(1'h0)] + wire53) : $signed((^~reg67))) ?
                  {(reg64 ? reg66[(3'h5):(1'h0)] : {reg62}),
                      $unsigned((~(8'haf)))} : $signed($unsigned($signed(reg64)))) <= ($signed(wire52[(5'h10):(4'he)]) * (~|{(^(7'h41))})));
              reg70 <= ($unsigned((8'hb4)) - wire57[(4'he):(4'h9)]);
              reg71 <= ({{$unsigned((reg66 ? (8'hbb) : reg68)),
                          (~$signed(wire51))}} ?
                  $signed($signed({wire56, wire55})) : wire58[(4'hb):(3'h6)]);
            end
          reg72 <= (|reg67);
        end
      reg73 <= $unsigned(($unsigned(wire51) ?
          reg65 : $unsigned(($unsigned(reg66) | ((8'hb6) <<< (8'hbc))))));
      reg74 <= ($unsigned(reg64[(4'hd):(4'ha)]) ?
          reg72[(1'h0):(1'h0)] : (8'hb6));
      reg75 <= $unsigned((8'ha4));
      reg76 <= (+$signed(($signed(wire55) >>> $unsigned({wire58}))));
    end
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(3'h7):(1'h0)] wire29;
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  assign y = {wire47,
                 wire39,
                 wire29,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= {wire15[(3'h5):(1'h0)],
          $unsigned($signed($unsigned(wire12[(3'h4):(1'h1)])))};
      reg17 <= wire11[(4'h9):(4'h9)];
    end
  always
    @(posedge clk) begin
      reg18 <= (reg17[(2'h2):(1'h0)] > $signed($unsigned(((^~(8'hb7)) ?
          (&wire15) : (reg16 ? (8'h9d) : (8'hb8))))));
      if ($signed($signed((~|wire13[(5'h14):(4'ha)]))))
        begin
          reg19 <= ((8'hbc) ?
              $unsigned((&((-reg16) ?
                  $unsigned(wire13) : (wire11 ?
                      wire12 : wire13)))) : (~^reg16));
          reg20 <= $signed((~$unsigned(reg19)));
          if ($unsigned(reg16))
            begin
              reg21 <= {reg16[(3'h7):(3'h6)]};
              reg22 <= reg17[(3'h6):(2'h3)];
              reg23 <= (8'ha1);
            end
          else
            begin
              reg21 <= reg18;
            end
          reg24 <= ((wire12[(2'h3):(2'h3)] <= reg17[(5'h10):(1'h1)]) ?
              wire14 : $unsigned($signed({(!wire14), $signed(wire12)})));
          if ({{$signed(reg20[(3'h4):(3'h4)]), $signed($signed(reg23))}})
            begin
              reg25 <= reg20[(3'h4):(2'h2)];
              reg26 <= reg23;
              reg27 <= (reg23 - {(((reg18 ? reg25 : (8'hab)) ?
                          $unsigned(reg17) : reg24) ?
                      $unsigned((reg22 ?
                          reg20 : reg21)) : ($signed((8'hb7)) >> {reg19,
                          wire11}))});
              reg28 <= (reg25[(2'h3):(2'h2)] * wire15);
            end
          else
            begin
              reg25 <= reg21[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg19 <= reg19[(3'h6):(2'h2)];
          reg20 <= (reg28 >> wire15);
          if ($signed((wire14 ?
              reg26[(3'h7):(2'h3)] : ($signed(reg25) >= (+((8'hb5) == wire11))))))
            begin
              reg21 <= wire12;
              reg22 <= (~&{$signed(wire15), $signed((^$unsigned(reg23)))});
              reg23 <= reg17[(4'hd):(2'h3)];
            end
          else
            begin
              reg21 <= ((wire12[(1'h1):(1'h1)] + reg19) <<< wire13);
              reg22 <= $unsigned((-($unsigned($unsigned(reg26)) ?
                  $signed((reg21 == reg21)) : ((^~(8'ha8)) >= $unsigned(reg21)))));
              reg23 <= (reg21 ~^ wire13);
            end
        end
    end
  assign wire29 = (|(wire13[(5'h13):(5'h10)] ^~ $signed($unsigned((reg21 ?
                      (8'h9e) : reg20)))));
  always
    @(posedge clk) begin
      if (($signed((+reg19[(2'h2):(1'h1)])) ?
          {$unsigned(((~wire14) ^ (wire11 ?
                  reg22 : (8'hbe))))} : $signed($signed($unsigned((8'had))))))
        begin
          reg30 <= $unsigned(reg26);
          if (reg23[(3'h7):(2'h2)])
            begin
              reg31 <= ((|reg26) ^~ (|reg20));
              reg32 <= reg28[(2'h3):(1'h0)];
              reg33 <= (^(reg26 ?
                  $unsigned(reg22[(3'h6):(3'h4)]) : reg25[(1'h1):(1'h0)]));
            end
          else
            begin
              reg31 <= reg20[(4'h9):(2'h2)];
              reg32 <= $unsigned($unsigned(reg24[(2'h3):(1'h1)]));
            end
          reg34 <= reg17;
          reg35 <= ($signed(wire12) <= (8'hbb));
        end
      else
        begin
          reg30 <= reg16[(1'h0):(1'h0)];
        end
      reg36 <= $unsigned((^~(wire11[(4'h8):(4'h8)] & ($signed(wire15) <<< $signed(reg23)))));
      reg37 <= ($signed($unsigned((^reg21))) ?
          $signed((~|((reg24 || reg25) ?
              reg27 : (reg22 >= (8'haf))))) : $signed({(reg28 && reg17[(3'h5):(1'h1)]),
              wire12}));
      reg38 <= (|(({reg37[(2'h3):(2'h2)]} ?
              (reg23 && reg37[(3'h4):(2'h3)]) : reg27) ?
          $unsigned($signed((reg19 ^~ reg25))) : $unsigned(reg32[(3'h5):(3'h4)])));
    end
  assign wire39 = {$signed((reg18 ?
                          reg33[(5'h10):(5'h10)] : {$signed(reg23)}))};
  always
    @(posedge clk) begin
      if ($unsigned(wire14))
        begin
          reg40 <= $unsigned(wire15);
          reg41 <= reg37[(1'h1):(1'h1)];
          reg42 <= $signed(((({reg40} ?
                      (reg21 ? reg27 : wire15) : (reg36 ? reg28 : reg24)) ?
                  reg34[(5'h11):(4'hc)] : ((|wire29) + $signed(wire29))) ?
              {$unsigned(((8'hba) != (8'hb1)))} : ((^~$unsigned((8'haa))) <= (+(wire13 == reg40)))));
          reg43 <= $signed(({(~&(reg38 ?
                  wire14 : reg16))} && reg27[(1'h0):(1'h0)]));
          reg44 <= reg24[(4'hb):(3'h4)];
        end
      else
        begin
          reg40 <= {wire15,
              ($unsigned((+reg21)) < ((reg19 != wire12) ?
                  {reg43[(4'hd):(3'h5)]} : ($unsigned((8'hbf)) ?
                      reg21 : $signed(reg26))))};
          reg41 <= (((^$signed(reg20[(2'h3):(1'h0)])) || ($unsigned({(8'hba)}) ?
                  reg35 : (!((7'h44) ? wire39 : reg43)))) ?
              reg19[(2'h2):(1'h1)] : wire13[(4'hf):(3'h5)]);
          reg42 <= reg35;
          reg43 <= $signed($unsigned(wire14[(4'hb):(1'h0)]));
          reg44 <= $unsigned(wire14[(2'h2):(1'h1)]);
        end
      reg45 <= (~(reg23[(2'h2):(1'h1)] ?
          reg22 : {($unsigned((8'hb7)) ?
                  $unsigned(reg38) : (reg25 ? reg31 : reg26))}));
      reg46 <= $unsigned((reg43[(4'h8):(4'h8)] ?
          (8'hb7) : ({wire11[(4'h9):(3'h5)]} << $signed(reg42))));
    end
  assign wire47 = (($signed({reg36[(4'hc):(3'h6)]}) ?
                      ($signed((wire15 < reg23)) ?
                          $signed({reg28}) : ((^~wire29) ?
                              reg20[(1'h0):(1'h0)] : {reg31,
                                  reg37})) : ($signed((reg25 ?
                          reg42 : wire29)) != $unsigned((reg36 & reg27)))) ^~ ($signed((reg18[(3'h4):(1'h1)] & (wire11 && reg32))) ?
                      reg32 : $unsigned($unsigned((~^reg17)))));
endmodule
