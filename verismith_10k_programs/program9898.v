module top
#(parameter param161 = {((~&(~^(8'hb5))) ^~ {(((8'hb3) && (8'hb2)) <= (~(8'ha9)))})}, 
parameter param162 = ((8'ha6) ^~ (|(^(((8'hb5) ? param161 : (8'ha2)) != (~param161))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire146;
  wire signed [(5'h11):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire152;
  wire signed [(2'h2):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire154;
  wire [(5'h14):(1'h0)] wire155;
  wire signed [(4'hb):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire157;
  wire [(4'he):(1'h0)] wire158;
  assign y = {wire160,
                 wire149,
                 wire148,
                 wire4,
                 wire5,
                 wire146,
                 wire151,
                 wire152,
                 wire153,
                 wire154,
                 wire155,
                 wire156,
                 wire157,
                 wire158,
                 (1'h0)};
  assign wire4 = (&(($unsigned((-wire3)) | wire2[(5'h14):(5'h14)]) != wire3));
  assign wire5 = $unsigned(((8'hab) + (~((wire2 ?
                     wire4 : wire1) ^ wire3[(4'h8):(2'h2)]))));
  module6 #() modinst147 (wire146, clk, wire2, wire1, wire4, wire5, wire0);
  assign wire148 = wire1[(4'h9):(1'h0)];
  module6 #() modinst150 (.wire8(wire0), .wire11(wire1), .y(wire149), .wire10(wire148), .clk(clk), .wire7(wire2), .wire9(wire146));
  assign wire151 = wire5;
  assign wire152 = wire2[(5'h12):(3'h5)];
  assign wire153 = wire4[(3'h7):(3'h6)];
  assign wire154 = $signed($signed($signed($signed($unsigned(wire3)))));
  assign wire155 = $signed(($signed($signed($unsigned(wire1))) ?
                       (((wire153 ? wire149 : wire146) ?
                               {wire148, wire148} : (~&wire3)) ?
                           (|(!wire153)) : $signed((wire3 ?
                               wire153 : wire148))) : (^~$signed($unsigned(wire3)))));
  assign wire156 = (~|wire3[(3'h7):(1'h0)]);
  assign wire157 = wire155[(5'h11):(3'h6)];
  module60 #() modinst159 (wire158, clk, wire146, wire0, wire151, wire4, wire152);
  assign wire160 = wire156;
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire145;
  wire signed [(2'h3):(1'h0)] wire144;
  wire signed [(4'h8):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire141;
  wire signed [(2'h3):(1'h0)] wire102;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire88;
  wire [(2'h2):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire100;
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg115 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire141,
                 wire102,
                 wire40,
                 wire42,
                 wire43,
                 wire83,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire100,
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
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 (1'h0)};
  module12 #() modinst41 (.wire15(wire9), .wire17(wire7), .clk(clk), .wire14(wire10), .wire13(wire11), .wire16(wire8), .y(wire40));
  assign wire42 = wire9;
  assign wire43 = wire40[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg44 <= ((~^wire7[(4'h9):(3'h6)]) ?
          $signed((~(8'haa))) : ($signed(wire8) ? {wire9} : (8'hb7)));
      reg45 <= wire40[(2'h2):(2'h2)];
      reg46 <= reg44[(1'h1):(1'h0)];
      reg47 <= ((wire10[(4'ha):(4'ha)] ?
          (({wire43, wire43} == $signed((8'ha6))) * (^reg44)) : {$signed(wire8),
              (wire40[(1'h1):(1'h0)] ?
                  reg45[(4'h8):(1'h1)] : (^(8'hac)))}) <= (((&reg46) ?
          $unsigned(wire8[(5'h14):(5'h12)]) : wire43) <<< (8'haa)));
      if ((-$signed(((8'h9f) ? reg44 : $unsigned(wire43)))))
        begin
          reg48 <= (((|(8'ha4)) & wire42[(2'h2):(1'h1)]) <= wire9[(2'h2):(1'h1)]);
          reg49 <= (wire10[(3'h4):(1'h0)] && (wire7 ?
              (({reg45, reg47} ?
                  $signed(wire43) : {reg48,
                      wire8}) ^ ($signed(wire10) != $unsigned(wire43))) : $signed($unsigned(reg48))));
        end
      else
        begin
          reg48 <= (~^((wire42[(2'h3):(2'h2)] ?
                  $signed(reg49[(1'h0):(1'h0)]) : (-(wire7 >>> wire7))) ?
              wire8[(4'hf):(2'h2)] : $unsigned($signed((8'ha2)))));
          reg49 <= {reg48[(2'h3):(1'h1)], (+wire9[(1'h0):(1'h0)])};
          reg50 <= (wire43[(4'he):(3'h4)] > (~|{$unsigned((wire43 | reg46))}));
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned(((!((-(8'hb0)) ?
          $unsigned(reg48) : reg48[(1'h0):(1'h0)])) << ((~{reg47,
          reg44}) << $signed($signed(wire8))))))
        begin
          if (reg45[(5'h12):(1'h1)])
            begin
              reg51 <= (^$signed($signed(reg50)));
              reg52 <= $signed(wire9);
              reg53 <= (^({((wire9 << wire42) ?
                      (wire7 <= reg51) : (reg50 < (8'hab))),
                  $unsigned((reg44 != wire10))} >= ((^wire8) < ($unsigned(reg44) ?
                  reg48[(2'h2):(2'h2)] : $signed(wire8)))));
              reg54 <= ((reg48[(1'h1):(1'h1)] && $signed(($signed(wire10) << (~reg49)))) ?
                  wire42[(3'h6):(3'h6)] : (({(reg53 ? reg47 : wire42),
                              {wire7, reg50}} ?
                          (reg52[(1'h0):(1'h0)] | reg45) : (+wire8[(5'h11):(4'hc)])) ?
                      wire11[(5'h13):(2'h2)] : $signed(wire9[(1'h1):(1'h1)])));
              reg55 <= wire42;
            end
          else
            begin
              reg51 <= $signed((({$signed(reg44)} ?
                      $signed($signed(wire9)) : (~reg54)) ?
                  $unsigned(reg52[(3'h6):(3'h5)]) : ({reg46} * wire42)));
            end
          reg56 <= $unsigned(reg50);
          reg57 <= (^$signed(reg52));
          reg58 <= ($signed(((reg52[(2'h2):(2'h2)] ?
              $unsigned(reg51) : reg47) < reg47)) >> wire7);
          reg59 <= (&reg53);
        end
      else
        begin
          reg51 <= (+reg59);
        end
    end
  module60 #() modinst84 (wire83, clk, wire40, reg47, wire7, reg57, reg48);
  assign wire85 = (8'had);
  assign wire86 = $unsigned((reg59 ? wire83 : $unsigned($unsigned(wire11))));
  assign wire87 = ($unsigned((~&(~$signed(reg55)))) >>> (wire40 ?
                      wire83 : ($signed(reg45) ?
                          $unsigned(wire9) : $signed((!reg48)))));
  assign wire88 = reg50;
  assign wire89 = $signed(reg45);
  module90 #() modinst101 (wire100, clk, reg44, wire11, reg52, reg57);
  assign wire102 = (~((-(reg50 ~^ {reg46, wire42})) ?
                       $unsigned(reg53[(2'h3):(1'h1)]) : $unsigned(((wire42 ?
                           (8'hbd) : reg55) != reg47[(2'h2):(1'h1)]))));
  always
    @(posedge clk) begin
      if (reg52[(3'h5):(2'h2)])
        begin
          if ({$unsigned($signed(reg59)),
              (((reg54[(1'h1):(1'h0)] * (reg55 - (8'hb6))) ?
                      (^(~^wire7)) : wire40[(3'h4):(2'h2)]) ?
                  $signed($unsigned(reg59)) : $signed((~{wire43, wire7})))})
            begin
              reg103 <= wire8;
              reg104 <= $signed((((wire85[(1'h0):(1'h0)] + wire40) ?
                      ((reg50 | reg52) ?
                          (~&(8'hb4)) : (!reg47)) : ((reg49 >> wire87) == (reg55 ^ reg48))) ?
                  ((8'ha8) ?
                      ($unsigned(wire100) ?
                          wire88 : ((8'hb5) ?
                              wire86 : reg44)) : $unsigned(wire85[(1'h1):(1'h0)])) : (8'ha6)));
            end
          else
            begin
              reg103 <= $signed((+($signed((reg51 ?
                  wire102 : wire7)) && ((!reg59) - (wire88 ?
                  wire8 : (8'h9d))))));
            end
          reg105 <= (!wire7[(3'h4):(1'h1)]);
          if (reg105)
            begin
              reg106 <= (~$unsigned($signed(reg105[(4'he):(2'h3)])));
              reg107 <= $signed(((~^wire7[(4'hb):(4'h9)]) << (^$signed((wire86 > reg59)))));
            end
          else
            begin
              reg106 <= (reg107[(1'h1):(1'h1)] ?
                  (^(8'ha3)) : (($signed($signed(wire7)) > reg46) * ($signed($unsigned(wire88)) - (~&$signed(wire9)))));
              reg107 <= wire102;
              reg108 <= reg58[(1'h1):(1'h0)];
              reg109 <= (!$signed(reg105));
            end
          if (($signed(wire100) ?
              wire83[(2'h2):(1'h1)] : (((&{(8'hb4)}) <= (~^reg44)) || (~^(((8'ha8) == reg58) ?
                  wire85 : reg56[(3'h4):(2'h2)])))))
            begin
              reg110 <= {$signed(($signed(reg49[(2'h2):(1'h1)]) ?
                      (~(+wire102)) : $signed({(8'hbb), wire85}))),
                  (~^(reg109[(1'h0):(1'h0)] ?
                      reg52[(4'h9):(1'h1)] : (|$unsigned(reg53))))};
              reg111 <= (wire43 != ((~^(|(reg51 ? wire10 : reg58))) ?
                  (~^($unsigned(reg56) + reg58[(3'h5):(1'h1)])) : ($unsigned((reg53 > (7'h42))) ?
                      ((~|wire42) * (~wire8)) : (wire89[(1'h1):(1'h0)] >> {wire42,
                          reg52}))));
            end
          else
            begin
              reg110 <= {wire83, reg103[(4'h8):(1'h0)]};
              reg111 <= reg50[(2'h3):(1'h1)];
            end
          reg112 <= reg59[(3'h4):(2'h2)];
        end
      else
        begin
          reg103 <= {($signed(reg57) != wire40), wire9[(3'h4):(1'h1)]};
          reg104 <= (^~(~($signed({(8'ha4), wire86}) ?
              ($unsigned(wire102) + {reg108, reg55}) : reg107)));
          reg105 <= $signed((wire10 > $unsigned(((reg103 ?
              reg59 : wire43) > $unsigned(reg47)))));
          if ($unsigned(reg46))
            begin
              reg106 <= (~^wire87[(2'h3):(2'h2)]);
              reg107 <= $signed((8'hb2));
              reg108 <= ($signed(wire100) && ($signed(reg59) ?
                  (-((wire100 ^~ (7'h42)) > (^wire100))) : {({reg56,
                          reg48} & (~^reg107))}));
            end
          else
            begin
              reg106 <= $signed(reg50[(1'h0):(1'h0)]);
              reg107 <= reg53[(3'h4):(3'h4)];
              reg108 <= $signed((reg103 ?
                  (+(&$unsigned(wire85))) : $signed(wire100)));
              reg109 <= $signed($unsigned({(-$signed(wire7)),
                  wire102[(2'h2):(1'h1)]}));
            end
          reg110 <= (8'ha5);
        end
      reg113 <= ((-(^~reg50[(1'h1):(1'h0)])) == reg108);
      reg114 <= (((^~$signed((!reg52))) >> wire43[(4'h8):(2'h3)]) ?
          $unsigned(((~&$signed((8'hbd))) ?
              $signed({wire89}) : wire10)) : reg48[(3'h5):(3'h5)]);
      reg115 <= reg112[(2'h2):(1'h1)];
    end
  module116 #() modinst142 (.wire117(reg103), .y(wire141), .wire119(wire88), .wire118(wire100), .wire120(reg53), .wire121(reg111), .clk(clk));
  assign wire143 = (($unsigned($unsigned((reg110 * reg52))) >= {(7'h44),
                       $signed($signed(reg57))}) <<< reg50[(1'h1):(1'h0)]);
  assign wire144 = $unsigned(reg110[(3'h4):(3'h4)]);
  assign wire145 = (wire144 ?
                       ({(~$unsigned((8'ha9)))} ?
                           wire141[(4'hd):(4'hb)] : (~^$signed((reg109 || reg54)))) : (&(&wire102[(1'h0):(1'h0)])));
endmodule

module module116  (y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire121;
  input wire signed [(4'hb):(1'h0)] wire120;
  input wire [(4'hf):(1'h0)] wire119;
  input wire [(4'ha):(1'h0)] wire118;
  input wire signed [(2'h2):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire140;
  wire signed [(5'h10):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire [(4'h9):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire129;
  wire [(4'h9):(1'h0)] wire126;
  wire [(5'h15):(1'h0)] wire125;
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire126,
                 wire125,
                 reg128,
                 reg127,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg122 <= (($unsigned((^~wire118)) ?
              (($unsigned(wire121) ?
                  (&wire119) : (wire117 ?
                      wire117 : (8'hb3))) ^~ (((8'ha5) | wire118) ?
                  $signed(wire117) : (wire121 ?
                      (7'h43) : (8'hbf)))) : (~|wire121[(2'h2):(1'h1)])) ?
          wire121 : (-(-$unsigned((^wire121)))));
      reg123 <= wire117;
    end
  always
    @(posedge clk) begin
      reg124 <= (wire117 >> $signed(wire117));
    end
  assign wire125 = wire119[(4'hc):(3'h7)];
  assign wire126 = $signed($unsigned($unsigned(($unsigned(reg123) && (wire121 & wire120)))));
  always
    @(posedge clk) begin
      reg127 <= (reg122[(4'hb):(3'h7)] ?
          wire125 : (~^$signed(reg124[(4'h8):(1'h1)])));
      reg128 <= (($unsigned($signed(wire125[(3'h6):(3'h4)])) <= $unsigned(wire120[(1'h0):(1'h0)])) ?
          ((!$signed($unsigned(wire126))) ?
              wire119[(3'h4):(2'h2)] : $signed({reg127,
                  wire118})) : $unsigned($signed((((7'h43) << (8'ha9)) ?
              wire125[(4'he):(3'h6)] : (wire120 * reg123)))));
    end
  assign wire129 = wire117[(2'h2):(1'h1)];
  assign wire130 = $unsigned(wire119[(2'h2):(2'h2)]);
  assign wire131 = (&wire126[(3'h5):(3'h4)]);
  assign wire132 = {$signed({({wire129, wire120} ?
                               (reg127 && (8'ha8)) : $signed((8'hb3))),
                           $signed($signed(wire130))}),
                       $unsigned((reg127 ?
                           ((wire118 && wire117) ?
                               $signed(wire117) : (|wire119)) : wire125))};
  assign wire133 = wire118[(2'h3):(2'h3)];
  assign wire134 = (~^({{(|wire130), (8'hb0)}, (^~(wire120 >= wire118))} ?
                       (wire133 ?
                           ($unsigned(wire130) << (reg124 ?
                               (8'hb3) : reg128)) : {(^~wire133),
                               wire131}) : reg122));
  assign wire135 = (($signed({((8'h9c) ? wire130 : wire120)}) ?
                       ($unsigned((wire132 - reg128)) != reg127) : (wire133 ?
                           $unsigned((wire117 & reg122)) : {$unsigned(reg124)})) != wire130[(4'h8):(3'h4)]);
  assign wire136 = {$signed((reg128 ~^ ((wire121 ?
                           wire118 : wire119) ^~ $unsigned(wire117)))),
                       wire129};
  assign wire137 = wire135;
  assign wire138 = wire137;
  assign wire139 = wire135;
  assign wire140 = wire131[(4'h9):(1'h0)];
endmodule

module module90  (y, clk, wire94, wire93, wire92, wire91);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire94;
  input wire signed [(2'h2):(1'h0)] wire93;
  input wire [(4'h9):(1'h0)] wire92;
  input wire signed [(3'h6):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  reg signed [(4'ha):(1'h0)] reg95 = (1'h0);
  assign y = {wire99, wire98, wire97, wire96, reg95, (1'h0)};
  always
    @(posedge clk) begin
      reg95 <= (~^wire92[(2'h3):(1'h1)]);
    end
  assign wire96 = reg95[(1'h1):(1'h1)];
  assign wire97 = (wire94[(1'h0):(1'h0)] ? wire92 : reg95[(3'h4):(3'h4)]);
  assign wire98 = $unsigned((wire93 ?
                      (({wire96} ?
                          (^~wire93) : ((8'ha6) ?
                              wire91 : wire91)) <<< (^$signed(reg95))) : $unsigned({(7'h42)})));
  assign wire99 = (8'haf);
endmodule

module module60
#(parameter param82 = {((+(^~((8'ha1) < (8'haa)))) * ((8'ha3) && (((7'h44) & (8'ha1)) ? (~(8'hb1)) : ((8'h9c) == (8'hb5))))), (({((8'ha5) & (8'h9e))} != (((8'ha2) ? (8'ha8) : (8'ha9)) << ((8'hbf) ? (7'h40) : (8'hbf)))) ? (^(!((8'hb8) + (8'ha1)))) : (((-(8'ha1)) + ((8'hba) <= (8'h9e))) <<< {(&(7'h43)), (|(8'hbf))}))})
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire65;
  input wire [(4'h8):(1'h0)] wire64;
  input wire [(4'h9):(1'h0)] wire63;
  input wire signed [(4'ha):(1'h0)] wire62;
  input wire [(3'h7):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(5'h11):(1'h0)] wire75;
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg66 <= $signed((~|(wire63[(3'h7):(3'h4)] ?
          ($unsigned(wire64) | {(8'hb5), wire62}) : wire62)));
      reg67 <= wire65;
      reg68 <= ((wire61[(2'h3):(2'h2)] == ($signed((~wire65)) + (wire65 && $signed(wire64)))) ?
          wire63 : wire65);
      reg69 <= $unsigned(((|wire64[(3'h6):(1'h1)]) == (^((wire63 ?
              wire61 : (8'haf)) ?
          $signed(reg68) : {wire62}))));
      if ($signed($unsigned(wire65[(3'h7):(2'h2)])))
        begin
          reg70 <= {{(!(!reg69[(2'h2):(1'h1)]))}, reg66[(4'ha):(3'h6)]};
          reg71 <= $signed(($unsigned($unsigned((reg68 ?
              reg68 : reg68))) >> $signed(wire65[(2'h2):(1'h1)])));
          reg72 <= (-wire63[(1'h0):(1'h0)]);
          reg73 <= reg68;
          reg74 <= ((({$unsigned((8'h9e))} <<< $unsigned($unsigned(reg68))) ?
              $signed(($signed(wire62) ?
                  reg66 : (8'ha4))) : wire61[(1'h0):(1'h0)]) > $signed($unsigned((^$signed(reg70)))));
        end
      else
        begin
          reg70 <= (!(+(((reg72 ? reg69 : wire61) ?
              (reg69 != reg72) : {reg67}) >= wire64)));
          reg71 <= $signed((reg67 ?
              $unsigned($unsigned($unsigned(wire63))) : (reg70[(3'h4):(2'h2)] ?
                  reg74 : $unsigned(wire61))));
        end
    end
  assign wire75 = (^~($unsigned((-(reg71 ?
                      reg72 : wire64))) != $unsigned(($signed(reg70) ?
                      (~^reg69) : {reg70, (8'hbd)}))));
  assign wire76 = {$unsigned($signed({wire64, (reg74 ? reg71 : reg74)})),
                      {$signed($signed((reg72 ? reg70 : wire65)))}};
  assign wire77 = $unsigned((~^$signed({reg73[(2'h2):(1'h0)],
                      (reg72 ? wire76 : wire61)})));
  assign wire78 = reg68;
  assign wire79 = $signed($signed($signed(((^reg70) * $unsigned(reg72)))));
  assign wire80 = ((((~|wire75) == $unsigned($unsigned(reg74))) | (8'had)) ?
                      (wire78[(1'h0):(1'h0)] ?
                          ($signed((8'ha6)) ?
                              $unsigned(reg68) : $signed(wire77)) : ((-$signed((8'ha2))) | ((reg70 ?
                                  wire76 : wire75) ?
                              wire77[(4'hb):(3'h5)] : (!wire79)))) : reg67[(4'h9):(2'h2)]);
  assign wire81 = $unsigned(reg69);
endmodule

module module12
#(parameter param39 = (~&((8'hb7) ? {(~|((8'hbf) == (8'hb2)))} : (+{((7'h44) & (8'hb5))}))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          reg18 <= {((({wire15} * (wire17 >> wire13)) ?
                      (!$unsigned(wire17)) : ($unsigned(wire15) ?
                          $signed(wire17) : wire15[(2'h2):(1'h1)])) ?
                  ((+(wire14 >>> wire15)) - (wire16 ?
                      wire15[(2'h2):(2'h2)] : $signed(wire17))) : wire14[(2'h2):(2'h2)])};
        end
      else
        begin
          reg18 <= ($unsigned($signed((8'ha2))) << $unsigned($signed(wire17)));
          if ($signed(((reg18[(3'h6):(2'h2)] ?
              $unsigned($unsigned((8'hbb))) : reg18[(4'h9):(2'h3)]) + (wire16[(5'h11):(4'ha)] | wire15[(3'h5):(2'h2)]))))
            begin
              reg19 <= (((wire15[(2'h3):(1'h1)] == $unsigned((^~wire15))) << reg18[(1'h1):(1'h0)]) ?
                  $unsigned(wire14[(3'h4):(2'h2)]) : $signed(($unsigned((!wire14)) * ({(7'h41)} ?
                      wire15[(1'h1):(1'h0)] : $signed(wire17)))));
              reg20 <= ((~|reg18) || reg18);
              reg21 <= wire17;
            end
          else
            begin
              reg19 <= $unsigned(reg19);
              reg20 <= $signed((^~{(~&wire17[(3'h4):(2'h2)]),
                  reg21[(1'h1):(1'h1)]}));
            end
          reg22 <= (+reg21);
          reg23 <= (~^({wire14[(2'h2):(2'h2)]} ?
              $signed((8'hbc)) : (+wire17[(1'h0):(1'h0)])));
        end
    end
  assign wire24 = (((wire13[(3'h6):(1'h0)] ~^ {(8'hac), (wire15 ^~ wire16)}) ?
                          (|reg22[(1'h1):(1'h0)]) : reg18[(2'h2):(2'h2)]) ?
                      reg22 : wire16[(4'hd):(2'h3)]);
  assign wire25 = ((8'ha6) ? wire17 : wire24);
  assign wire26 = $signed(wire15[(2'h3):(2'h3)]);
  assign wire27 = $signed(reg22[(5'h14):(5'h11)]);
  assign wire28 = $signed($signed(((8'hbe) + ((reg21 ? wire17 : (8'hb3)) ?
                      wire27 : ((8'h9f) != reg21)))));
  assign wire29 = $unsigned((({wire24} && ((wire17 ? wire13 : (8'hb8)) ?
                          {reg22} : reg18[(2'h2):(1'h0)])) ?
                      $unsigned({(wire14 ?
                              wire16 : wire14)}) : ($signed($unsigned(reg21)) <<< reg21)));
  assign wire30 = wire15[(2'h2):(1'h0)];
  assign wire31 = (($unsigned($signed((8'ha8))) >>> (wire29 ?
                          (|{wire15}) : (!(wire24 ? reg21 : wire15)))) ?
                      (($unsigned(wire15[(2'h2):(1'h1)]) | (!$signed(wire30))) ?
                          $unsigned($signed({wire16,
                              reg19})) : $unsigned(reg23)) : ((|$unsigned($signed(wire25))) <= (wire30[(2'h3):(1'h0)] - ($signed(reg21) | (reg19 ~^ wire14)))));
  assign wire32 = $signed(((((8'hb0) > wire17[(2'h3):(1'h0)]) * ($signed(wire27) <<< (wire27 ?
                      reg21 : reg19))) ^ wire31));
  assign wire33 = reg23;
  assign wire34 = (wire29[(1'h0):(1'h0)] | $signed({$signed({reg18, (8'ha1)}),
                      (^(reg19 ? wire17 : wire14))}));
  assign wire35 = $unsigned(($unsigned($unsigned(wire14)) || {{(!wire33)},
                      (!$signed(wire33))}));
  assign wire36 = wire26;
  assign wire37 = (^~wire27[(2'h2):(1'h0)]);
  assign wire38 = $unsigned(({{(|(8'ha1))}} ^~ wire15));
endmodule
