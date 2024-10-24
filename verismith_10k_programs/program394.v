module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire318;
  wire [(2'h3):(1'h0)] wire317;
  wire [(3'h4):(1'h0)] wire316;
  wire signed [(4'ha):(1'h0)] wire314;
  wire signed [(5'h14):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire141;
  wire signed [(4'hd):(1'h0)] wire139;
  reg [(3'h5):(1'h0)] reg143 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg157 = (1'h0);
  reg [(5'h10):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  assign y = {wire318,
                 wire317,
                 wire316,
                 wire314,
                 wire142,
                 wire141,
                 wire139,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 (1'h0)};
  module4 #() modinst140 (.wire5(wire3), .wire6(wire1), .y(wire139), .clk(clk), .wire8(wire0), .wire7(wire2));
  assign wire141 = {$unsigned(wire139[(3'h5):(2'h2)]),
                       $unsigned((wire2[(4'h8):(3'h7)] ?
                           wire2 : $signed((|wire1))))};
  assign wire142 = ($unsigned((8'hbd)) ?
                       $signed($unsigned($unsigned((wire139 > wire1)))) : (&(+$signed(wire0))));
  always
    @(posedge clk) begin
      if ((~^(wire141[(3'h5):(2'h3)] ?
          (+$unsigned((wire3 ?
              wire2 : wire3))) : (wire141[(3'h4):(3'h4)] || $unsigned(wire142[(5'h13):(3'h4)])))))
        begin
          reg143 <= (8'hb9);
          reg144 <= $signed($unsigned($signed((wire1 ?
              (wire3 ? wire2 : wire3) : (reg143 ? reg143 : wire142)))));
        end
      else
        begin
          if ((^~((-wire139[(3'h5):(2'h3)]) ?
              ({wire139[(4'hb):(3'h6)]} && (-wire141)) : wire1[(3'h5):(3'h5)])))
            begin
              reg143 <= ($unsigned({(wire141[(4'h8):(3'h7)] ?
                          $signed(wire2) : reg144)}) ?
                  (($unsigned((wire139 > wire2)) <<< wire1[(3'h7):(3'h4)]) ^ (^~reg143[(2'h2):(2'h2)])) : $unsigned({wire3,
                      (^~$signed(reg144))}));
              reg144 <= reg143[(3'h5):(1'h1)];
              reg145 <= (~wire142[(4'he):(4'hc)]);
            end
          else
            begin
              reg143 <= (^((((reg144 ? wire139 : reg144) >> (+wire3)) ?
                      $unsigned((wire2 ?
                          reg144 : (8'ha4))) : $signed(wire1[(3'h7):(3'h6)])) ?
                  ({{(8'hb2)}, ((8'hba) ? (8'hab) : wire141)} ?
                      ($unsigned((8'had)) ?
                          (wire3 || wire3) : (wire2 < reg143)) : wire0) : $signed((^(wire1 > reg145)))));
              reg144 <= $signed(wire139);
              reg145 <= {($signed(((wire0 ?
                          wire2 : reg144) ~^ $unsigned((8'hb9)))) ?
                      (((reg143 ? (8'ha2) : (8'hb0)) <<< $unsigned(reg144)) ?
                          reg145 : $signed((wire141 ?
                              wire139 : (8'ha1)))) : ({(!wire139),
                          wire142} << wire142)),
                  {wire1,
                      (wire139 ?
                          ((reg145 ?
                              wire3 : wire1) * (reg143 * wire141)) : ($unsigned(wire0) * $unsigned(wire0)))}};
            end
          if ((&($unsigned($unsigned($unsigned(reg145))) ?
              {{reg143[(1'h0):(1'h0)]},
                  (|$unsigned((8'hb2)))} : ($signed(wire141) ?
                  $unsigned($unsigned(wire0)) : $signed($unsigned(wire2))))))
            begin
              reg146 <= $signed(((~^$signed($signed(reg145))) || ($unsigned($signed(reg145)) | ($signed((8'hab)) || reg143))));
              reg147 <= (($unsigned(reg144[(2'h3):(1'h1)]) ^ (({wire3,
                  wire139} + reg143) ^~ ($unsigned(wire139) ?
                  $unsigned(wire3) : (reg144 ?
                      wire1 : wire141)))) >= $signed((^~($signed((8'ha9)) == (~&wire0)))));
            end
          else
            begin
              reg146 <= (reg144[(1'h1):(1'h1)] < reg147[(2'h2):(1'h0)]);
              reg147 <= $signed($signed(wire139));
              reg148 <= $signed(reg146[(2'h2):(1'h0)]);
              reg149 <= ($signed(reg148) ^ (((^reg144[(2'h3):(1'h1)]) ?
                  $unsigned($signed(wire139)) : $unsigned((wire3 ~^ wire139))) ^ ({$signed(reg146)} ?
                  {$unsigned(reg144), (~^reg146)} : {(~(8'h9d))})));
            end
          reg150 <= (!reg147);
        end
      if (reg147)
        begin
          reg151 <= reg150[(2'h2):(2'h2)];
          reg152 <= (&$signed((~&wire1)));
        end
      else
        begin
          if (reg151[(2'h3):(1'h1)])
            begin
              reg151 <= (((($unsigned(reg150) > reg148) ?
                  wire142[(5'h13):(3'h7)] : {reg143,
                      (reg144 ?
                          wire1 : (7'h40))}) <<< $signed((~&(|wire0)))) < $unsigned($unsigned($signed((&(8'ha8))))));
              reg152 <= wire139;
            end
          else
            begin
              reg151 <= (!(wire1 + $unsigned(reg145[(4'h9):(3'h5)])));
            end
          reg153 <= (8'hb0);
          if ((-{$unsigned((~^reg148[(2'h2):(1'h1)]))}))
            begin
              reg154 <= (~&(7'h44));
              reg155 <= ({wire2} ?
                  reg152 : ($signed(reg145) - $unsigned((((8'haa) >= wire142) | wire2))));
              reg156 <= $signed((reg148 & $unsigned((wire1[(4'h8):(2'h3)] >> $signed(reg147)))));
              reg157 <= {reg154[(4'ha):(3'h4)],
                  $signed($signed({wire2[(4'hb):(3'h6)], (~wire0)}))};
              reg158 <= wire142;
            end
          else
            begin
              reg154 <= (-reg144);
            end
          reg159 <= (&((^~({wire2,
              wire2} > (reg154 << reg151))) == $signed((reg144[(4'h8):(1'h1)] ?
              (reg156 ? wire141 : reg157) : (reg157 ? wire0 : reg146)))));
        end
      reg160 <= $signed(($signed($unsigned($signed(reg156))) >> ($unsigned((reg144 == reg150)) ?
          (~|{reg150, wire1}) : (wire141[(3'h4):(3'h4)] ?
              {wire2, reg151} : wire141))));
    end
  module161 #() modinst315 (.wire162(reg156), .wire163(reg157), .wire165(reg152), .wire164(reg158), .y(wire314), .wire166(reg153), .clk(clk));
  assign wire316 = $unsigned((((~&(reg145 << wire314)) != $signed((reg150 >= wire142))) ?
                       ((~&(reg159 ? reg159 : reg155)) ?
                           $signed((&reg148)) : wire2) : $signed($unsigned($signed(reg154)))));
  assign wire317 = (reg150 ?
                       $unsigned($unsigned(({wire139,
                           (8'hbb)} - $signed(wire139)))) : $signed(reg147[(3'h6):(2'h2)]));
  assign wire318 = reg151[(2'h3):(1'h0)];
endmodule

module module161  (y, clk, wire166, wire165, wire164, wire163, wire162);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire166;
  input wire signed [(3'h7):(1'h0)] wire165;
  input wire signed [(5'h10):(1'h0)] wire164;
  input wire [(4'hf):(1'h0)] wire163;
  input wire [(4'ha):(1'h0)] wire162;
  wire signed [(4'hc):(1'h0)] wire313;
  wire signed [(3'h7):(1'h0)] wire311;
  wire signed [(4'h9):(1'h0)] wire266;
  wire [(4'hb):(1'h0)] wire265;
  wire [(4'hb):(1'h0)] wire264;
  wire signed [(5'h13):(1'h0)] wire263;
  wire signed [(2'h2):(1'h0)] wire262;
  wire [(5'h13):(1'h0)] wire261;
  wire [(5'h10):(1'h0)] wire260;
  wire [(5'h10):(1'h0)] wire254;
  wire signed [(4'h9):(1'h0)] wire253;
  wire [(4'hf):(1'h0)] wire252;
  wire signed [(4'hb):(1'h0)] wire251;
  wire signed [(5'h11):(1'h0)] wire249;
  wire [(5'h10):(1'h0)] wire199;
  wire [(4'hb):(1'h0)] wire170;
  wire [(5'h15):(1'h0)] wire169;
  wire signed [(5'h10):(1'h0)] wire168;
  wire signed [(3'h7):(1'h0)] wire167;
  reg signed [(5'h15):(1'h0)] reg255 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg256 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg257 = (1'h0);
  reg [(5'h12):(1'h0)] reg258 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg259 = (1'h0);
  assign y = {wire313,
                 wire311,
                 wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire254,
                 wire253,
                 wire252,
                 wire251,
                 wire249,
                 wire199,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 reg255,
                 reg256,
                 reg257,
                 reg258,
                 reg259,
                 (1'h0)};
  assign wire167 = {$unsigned({((wire165 + wire165) ?
                               $unsigned(wire165) : (wire166 ?
                                   wire162 : wire164))})};
  assign wire168 = {$signed({(+(~^wire162)), wire164}), (8'hb2)};
  assign wire169 = {$signed(wire164[(2'h2):(1'h0)]), wire162};
  assign wire170 = $unsigned($unsigned(({{wire163}, $unsigned(wire167)} ?
                       {{wire167},
                           (wire168 ?
                               wire167 : wire167)} : wire164[(1'h0):(1'h0)])));
  module171 #() modinst200 (wire199, clk, wire168, wire170, wire162, wire163);
  module201 #() modinst250 (.y(wire249), .clk(clk), .wire204(wire163), .wire203(wire165), .wire205(wire166), .wire202(wire169));
  assign wire251 = (wire167[(1'h1):(1'h0)] ?
                       $unsigned(((8'hbc) ?
                           wire168[(3'h4):(2'h3)] : (^((7'h43) <= wire166)))) : {wire164[(4'hf):(1'h1)],
                           {(~&(|wire199)), (~^wire165)}});
  assign wire252 = (^~(wire166[(3'h6):(2'h3)] <<< wire169));
  assign wire253 = $signed($signed(wire167[(2'h3):(1'h0)]));
  assign wire254 = ((((&((8'haa) < wire165)) ^ (((8'ha1) ? wire162 : (8'hba)) ?
                           wire162[(4'h9):(4'h9)] : (wire199 ^~ wire166))) | (8'haf)) ?
                       (^{(~^$unsigned(wire162)),
                           $signed($unsigned((8'ha8)))}) : (($signed(wire251) ~^ $signed((wire253 ?
                           (7'h43) : wire164))) * $signed($unsigned(wire164))));
  always
    @(posedge clk) begin
      reg255 <= $signed($unsigned(wire254[(4'h9):(3'h6)]));
      reg256 <= $signed((+{($unsigned(wire166) ?
              $signed((8'ha8)) : wire164[(4'h8):(2'h2)]),
          wire163[(1'h1):(1'h1)]}));
      reg257 <= $unsigned($signed((|$signed((wire170 || wire167)))));
      reg258 <= wire252;
      reg259 <= (+(-$unsigned(wire162)));
    end
  assign wire260 = (-((8'hb1) << wire167[(3'h4):(3'h4)]));
  assign wire261 = wire163;
  assign wire262 = (wire261[(5'h11):(3'h5)] ?
                       {($signed({wire260, reg258}) ? (!(|wire254)) : wire199),
                           $signed(((wire162 & (8'ha8)) + wire260))} : reg257);
  assign wire263 = wire167;
  assign wire264 = $signed($signed($unsigned($unsigned({wire254}))));
  assign wire265 = wire166[(4'ha):(1'h1)];
  assign wire266 = wire167;
  module267 #() modinst312 (.wire272(wire199), .wire271(wire261), .wire270(wire163), .clk(clk), .wire268(wire249), .y(wire311), .wire269(reg256));
  assign wire313 = wire262;
endmodule

module module4
#(parameter param137 = {(^~((~&((8'hb9) | (8'hbd))) ? ((^~(8'ha1)) ^ (~(8'ha1))) : (8'h9c)))}, 
parameter param138 = param137)
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h271):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire5;
  input wire signed [(5'h11):(1'h0)] wire6;
  input wire [(3'h6):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire136;
  wire signed [(4'he):(1'h0)] wire135;
  wire [(4'ha):(1'h0)] wire115;
  wire signed [(4'ha):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire [(2'h3):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire70;
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(3'h5):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(3'h6):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire91,
                 wire9,
                 wire25,
                 wire70,
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
  assign wire9 = $signed(((+wire7) >= (wire7[(3'h4):(2'h2)] ?
                     ($signed((8'ha8)) && (wire8 ?
                         wire6 : wire7)) : $signed((wire5 ? wire6 : wire7)))));
  module10 #() modinst26 (.wire13(wire6), .wire12(wire7), .wire14(wire8), .clk(clk), .wire11(wire5), .y(wire25));
  module27 #() modinst71 (wire70, clk, wire7, wire8, wire25, wire9, wire5);
  always
    @(posedge clk) begin
      if (wire9[(4'h8):(3'h6)])
        begin
          if (($signed((((wire7 ^~ (8'h9d)) << (wire70 ? wire7 : wire9)) ?
              wire8[(2'h2):(1'h0)] : ((wire7 ? wire8 : wire9) ?
                  (-wire25) : wire5[(1'h1):(1'h1)]))) < $signed($unsigned(wire25[(1'h1):(1'h0)]))))
            begin
              reg72 <= $unsigned((+({$signed(wire9),
                  $unsigned(wire7)} - $signed(wire9))));
              reg73 <= $signed((~$unsigned($unsigned(wire8[(3'h5):(2'h3)]))));
              reg74 <= wire9;
            end
          else
            begin
              reg72 <= {reg73[(3'h7):(2'h3)],
                  ({($unsigned(reg74) | reg72[(4'hc):(4'ha)]),
                          $unsigned($unsigned(wire9))} ?
                      $signed($unsigned((wire8 ?
                          (8'had) : (8'hb6)))) : (~{{wire7, wire8},
                          $unsigned((8'had))}))};
            end
          if (({$unsigned(wire70[(3'h4):(2'h2)])} >> (wire5[(4'h8):(4'h8)] << $unsigned((^~wire7[(2'h3):(1'h0)])))))
            begin
              reg75 <= {reg72[(1'h0):(1'h0)],
                  $unsigned($unsigned(({wire5, wire7} ?
                      reg74[(1'h1):(1'h0)] : (wire9 ? (8'hbe) : (7'h41)))))};
              reg76 <= (wire6 == (($unsigned($unsigned(wire70)) ?
                      ((wire5 & wire9) > $signed(wire5)) : wire6[(4'hb):(1'h1)]) ?
                  ((8'hb0) ?
                      reg74 : reg72) : ($unsigned(wire9[(1'h1):(1'h1)]) > (reg73[(3'h6):(3'h4)] ?
                      (8'hb2) : reg74))));
              reg77 <= wire5[(1'h0):(1'h0)];
              reg78 <= $unsigned(wire6[(2'h2):(1'h0)]);
            end
          else
            begin
              reg75 <= (8'had);
              reg76 <= (|(~&(&$signed((wire70 ? reg77 : wire8)))));
              reg77 <= reg74;
              reg78 <= {{(^~({reg78, reg76} ?
                          $unsigned(reg75) : $unsigned((8'hb7))))}};
            end
          if (reg72[(4'hd):(3'h6)])
            begin
              reg79 <= (8'ha6);
              reg80 <= reg79[(3'h4):(1'h0)];
              reg81 <= $signed($signed($signed(reg74[(1'h1):(1'h1)])));
              reg82 <= reg80[(5'h14):(4'he)];
              reg83 <= (wire25 ?
                  ((($unsigned((8'hbf)) ^ $signed(reg76)) ?
                          $unsigned($unsigned(reg78)) : (+$signed(reg81))) ?
                      $unsigned((reg81 > {reg79})) : $signed($unsigned(reg79))) : ((reg80[(2'h3):(1'h0)] ?
                      wire6 : wire9[(1'h1):(1'h1)]) >> $unsigned(({reg78,
                          wire5} ?
                      {wire8} : $unsigned(wire25)))));
            end
          else
            begin
              reg79 <= ($unsigned(((+(wire70 ?
                      wire5 : (8'hbd))) <= {reg79[(1'h0):(1'h0)],
                      (reg79 != wire7)})) ?
                  {($unsigned(reg79) & $signed($unsigned(wire7))),
                      (^$unsigned(reg77[(1'h0):(1'h0)]))} : (^$unsigned($signed($unsigned(reg79)))));
              reg80 <= reg82;
              reg81 <= reg78[(4'he):(2'h3)];
              reg82 <= reg80;
              reg83 <= ((!((reg81[(3'h5):(2'h3)] == (wire8 > wire8)) == $unsigned($unsigned(reg78)))) ?
                  reg77 : ($signed($unsigned($signed(wire5))) ?
                      (8'ha2) : $unsigned($unsigned((~|wire8)))));
            end
          reg84 <= $unsigned((~^(((~|reg76) ?
              (wire8 ^ reg77) : (reg78 ? (8'h9f) : (8'hb8))) + ((reg77 ?
              reg80 : wire25) * (^~reg81)))));
          reg85 <= $unsigned(((~|wire7[(2'h2):(2'h2)]) <<< $signed((8'hb0))));
        end
      else
        begin
          reg72 <= {(|reg75)};
          reg73 <= (~wire7[(3'h4):(2'h2)]);
          reg74 <= reg82;
          if ((&$unsigned($unsigned(((~|reg78) ?
              $signed(wire5) : (wire6 >= (8'hb2)))))))
            begin
              reg75 <= $signed((reg72 <= $unsigned(wire6[(2'h2):(1'h0)])));
              reg76 <= ($unsigned(reg74[(2'h2):(1'h0)]) ?
                  wire9 : $unsigned(reg77));
            end
          else
            begin
              reg75 <= $signed(reg73);
              reg76 <= reg84;
              reg77 <= (+reg79[(4'h8):(1'h1)]);
              reg78 <= $unsigned($unsigned(($unsigned($signed(wire70)) >= ((wire70 || wire8) ?
                  $unsigned(reg75) : (reg83 ? wire9 : reg83)))));
            end
        end
      reg86 <= (reg77 + (^~$unsigned(reg75[(2'h3):(1'h0)])));
      reg87 <= $unsigned(($signed(reg75[(1'h1):(1'h0)]) ?
          (|$unsigned(reg79)) : {(!reg80[(4'h9):(2'h2)]), reg84}));
      if ((reg75 ?
          {(8'ha6),
              ((reg82 ?
                  $signed((8'hba)) : wire25[(2'h3):(1'h0)]) < $signed((reg81 <= reg83)))} : ((wire9[(3'h5):(2'h2)] ?
              ((~&(7'h40)) ? $signed(reg83) : (7'h43)) : ({(8'hbf),
                  wire5} <<< wire25[(1'h1):(1'h1)])) > (wire70 ?
              (~^$unsigned(wire6)) : (reg73[(4'ha):(4'h8)] <<< $signed(reg73))))))
        begin
          reg88 <= (reg73 ?
              {(((reg79 ? reg75 : (8'hb2)) ?
                      (-reg84) : $signed((8'hac))) && reg81[(3'h6):(3'h6)]),
                  (8'hbb)} : ($unsigned(((~&reg83) | (&(8'hb8)))) <= (({wire9} ?
                  (reg83 ?
                      reg81 : (8'h9c)) : $unsigned(reg72)) >> (+$unsigned(reg72)))));
          reg89 <= (reg72[(3'h4):(3'h4)] <= reg81);
        end
      else
        begin
          reg88 <= (^~$signed($unsigned((8'hb6))));
        end
      reg90 <= ($unsigned(wire6) ?
          $unsigned($unsigned((((8'hbf) | reg74) < (wire5 ?
              reg84 : reg86)))) : ($signed($signed(wire7)) ?
              (((^~wire7) != $unsigned(reg83)) ?
                  $signed((wire25 ?
                      reg86 : (8'hba))) : $unsigned($signed(reg85))) : ((wire5 ?
                      $signed(reg86) : reg85[(2'h2):(1'h1)]) ?
                  reg78 : wire70)));
    end
  assign wire91 = {(~&$signed(reg72))};
  module92 #() modinst108 (wire107, clk, reg90, reg72, reg74, reg76);
  assign wire109 = (reg81 ? wire9[(1'h0):(1'h0)] : reg77[(2'h3):(1'h0)]);
  assign wire110 = (~|{($unsigned($unsigned(reg76)) ?
                           reg85 : ($unsigned(reg73) ?
                               $unsigned(reg81) : reg75))});
  assign wire111 = (~(wire7 ?
                       ($unsigned((+wire91)) ? wire91 : wire109) : (|{(|reg86),
                           $unsigned(reg75)})));
  assign wire112 = $unsigned(reg86);
  assign wire113 = reg80;
  assign wire114 = ((!(&$signed(reg74))) ?
                       {{((reg87 * (8'h9f)) ?
                                   $signed(reg72) : (reg79 != wire70)),
                               $signed((8'hba))},
                           $unsigned(reg72)} : wire25);
  assign wire115 = (($unsigned(((8'ha0) ~^ (wire8 <= wire25))) & (8'hb5)) == $signed({(~|(reg72 ^ reg87))}));
  always
    @(posedge clk) begin
      reg116 <= $signed($signed(reg85));
      if (wire70)
        begin
          reg117 <= $unsigned($signed(((wire9 ? wire114 : reg86) ?
              reg87 : wire9)));
          reg118 <= (!$signed((~^((reg77 ? reg76 : reg74) ?
              (reg86 < wire7) : reg117[(3'h6):(2'h3)]))));
          reg119 <= {reg80[(1'h1):(1'h0)], reg87[(1'h1):(1'h1)]};
          reg120 <= $unsigned((|(8'hb9)));
          if (($unsigned(reg88) <= wire110))
            begin
              reg121 <= reg89[(5'h14):(4'hb)];
              reg122 <= reg86[(4'ha):(4'h9)];
              reg123 <= {$signed($unsigned(reg82[(3'h4):(3'h4)]))};
              reg124 <= ((($signed((wire7 ? reg79 : wire109)) ?
                          {$signed(reg83)} : (^((8'hbf) - reg90))) ?
                      reg117[(1'h1):(1'h1)] : (wire107[(3'h7):(2'h2)] == $signed($signed(reg77)))) ?
                  (~&(((^~(8'ha2)) <<< $unsigned(wire9)) ?
                      ($unsigned(reg76) + ((8'hbc) ?
                          reg80 : reg84)) : (((8'h9d) ?
                          reg80 : wire9) <= (wire25 ?
                          reg77 : reg86)))) : (reg81 != (((reg123 << (8'had)) ?
                          (^~wire110) : (+reg76)) ?
                      ($signed(reg122) ?
                          ((8'hb4) << wire107) : (reg75 ?
                              reg72 : wire111)) : reg76[(2'h3):(1'h1)])));
            end
          else
            begin
              reg121 <= $unsigned(((reg78 != wire91[(2'h3):(1'h0)]) ?
                  reg117 : $unsigned(reg87)));
              reg122 <= wire70[(3'h7):(2'h2)];
              reg123 <= ($unsigned(($unsigned(reg122) ?
                  (|(^reg82)) : ((wire9 ? reg82 : (8'hb9)) ?
                      $signed(reg80) : (^~reg82)))) ^ {reg119});
              reg124 <= ((8'ha9) ?
                  $unsigned((((wire115 ? wire110 : reg75) ?
                          (reg74 + wire25) : $unsigned(reg119)) ?
                      reg83[(3'h7):(3'h4)] : $signed(wire70))) : $unsigned((|(~^(+reg124)))));
            end
        end
      else
        begin
          if ($signed(wire115[(3'h4):(2'h3)]))
            begin
              reg117 <= $signed($unsigned((~^reg117)));
            end
          else
            begin
              reg117 <= $unsigned(($signed($signed((reg124 ?
                      reg121 : wire91))) ?
                  (reg116[(3'h4):(2'h3)] ?
                      wire107[(3'h6):(3'h6)] : ($signed(reg85) ?
                          ((8'hb2) ?
                              wire8 : wire70) : (reg119 >> wire111))) : $unsigned(wire6)));
              reg118 <= (wire115[(3'h6):(1'h0)] <<< $signed({reg116[(3'h5):(3'h5)]}));
              reg119 <= (reg120 ?
                  reg123 : (~|$unsigned($unsigned(reg79[(4'hf):(3'h7)]))));
              reg120 <= (8'hbd);
            end
          reg121 <= (~|(+((+$unsigned(reg76)) >= (&$unsigned(reg117)))));
          reg122 <= {{wire113, $unsigned((&$unsigned(wire112)))},
              ($signed(reg121) >= wire111[(1'h1):(1'h0)])};
        end
      if ((reg87 ?
          (~{$unsigned(reg123[(3'h5):(3'h4)])}) : $signed({{(reg77 <= reg120)},
              ($unsigned(wire109) ~^ $signed((8'hae)))})))
        begin
          reg125 <= $unsigned({wire5[(5'h10):(1'h0)], wire8});
        end
      else
        begin
          if (((&((reg78[(4'h8):(3'h5)] && (reg118 + reg82)) ?
                  (wire8[(3'h6):(2'h2)] && $signed(wire6)) : ($signed((8'hb6)) <= $unsigned(wire5)))) ?
              reg86[(3'h5):(2'h3)] : ((~&$signed(reg72[(4'hd):(3'h4)])) ?
                  $unsigned(((reg78 ? reg118 : wire7) ?
                      $signed(reg117) : (reg84 ~^ wire70))) : reg79)))
            begin
              reg125 <= $unsigned(reg124);
              reg126 <= (({(reg75 ? (7'h41) : reg122)} ?
                      $signed(reg119[(3'h6):(3'h4)]) : (~&({reg120} & $signed(reg74)))) ?
                  reg87[(1'h0):(1'h0)] : wire70[(4'h8):(4'h8)]);
              reg127 <= $unsigned(((((8'hbe) ?
                      {(8'hb3)} : $unsigned(reg74)) << (~{wire8, (8'hbe)})) ?
                  {$unsigned((reg77 << (8'h9f))),
                      wire114} : reg120[(1'h1):(1'h1)]));
            end
          else
            begin
              reg125 <= {(~(-$unsigned(reg117))),
                  {(~(reg75 ? (8'ha1) : reg127)), reg124}};
              reg126 <= ((($unsigned($signed(reg82)) && ((~|reg88) ^~ reg124)) ?
                  $signed(reg77[(2'h3):(1'h0)]) : ($signed($unsigned((8'hb3))) + $unsigned((!reg116)))) ~^ reg90[(3'h5):(3'h5)]);
              reg127 <= $signed((reg79[(3'h6):(1'h0)] <= ((~wire109) ?
                  ((~|reg119) < $signed(reg90)) : $signed($signed(wire8)))));
            end
          reg128 <= (wire114[(3'h7):(3'h7)] - ($signed($signed((reg88 ?
                  wire114 : reg123))) ?
              reg120[(3'h7):(2'h2)] : reg82));
          if ((wire111[(4'hb):(3'h4)] ?
              $unsigned(wire8) : reg78[(3'h5):(1'h1)]))
            begin
              reg129 <= {((reg84 ?
                          ({(8'hb7)} ?
                              (~reg77) : {reg124}) : (reg117[(1'h1):(1'h1)] ?
                              (wire7 ^ wire70) : (reg76 ? reg118 : reg77))) ?
                      ((7'h40) - reg86) : wire70[(3'h7):(1'h1)]),
                  $unsigned(wire110[(2'h2):(1'h0)])};
              reg130 <= $signed($signed((8'ha0)));
              reg131 <= $unsigned(reg79[(4'he):(4'hd)]);
              reg132 <= (reg124 ? reg118 : reg125[(4'h9):(1'h0)]);
            end
          else
            begin
              reg129 <= $unsigned(wire109);
              reg130 <= (wire8[(5'h10):(4'hd)] && ($unsigned(reg128[(2'h2):(1'h0)]) ?
                  ((+$unsigned(reg84)) ?
                      ($signed(reg121) >= {(8'haf),
                          reg80}) : reg116) : $unsigned((((8'ha8) ?
                      reg124 : reg131) < (wire6 ? reg126 : (8'ha2))))));
              reg131 <= (~|wire6);
              reg132 <= (reg73 ? reg76[(3'h5):(1'h1)] : wire115);
              reg133 <= reg87[(3'h7):(1'h0)];
            end
          reg134 <= $unsigned((!(({reg130, reg123} - (wire112 ?
              reg77 : (8'hbe))) > ((wire8 << reg131) << $unsigned(reg76)))));
        end
    end
  assign wire135 = $signed(({{$unsigned(reg89)},
                       $unsigned(wire107[(1'h0):(1'h0)])} - reg84));
  assign wire136 = wire7;
endmodule

module module92
#(parameter param105 = (((((~|(8'hb6)) && {(8'hba), (8'hb5)}) ? (~|(^(8'ha8))) : (((8'haf) ? (8'h9f) : (8'ha5)) ? ((8'hb5) == (8'hab)) : ((8'hb5) ? (8'hbb) : (8'haf)))) != ((|((8'hae) ? (7'h42) : (8'ha5))) ? (((8'hb8) ? (8'hb5) : (8'hb5)) ? ((7'h42) ? (8'hbf) : (8'hb6)) : ((8'haa) <<< (8'ha9))) : (|{(8'hb0)}))) - {{(|((8'ha0) | (8'ha9))), (^((8'ha8) ? (8'hbd) : (8'h9c)))}}), 
parameter param106 = {((((param105 > param105) ? param105 : (!param105)) ? (|(param105 ? param105 : param105)) : ((~param105) > param105)) ~^ {param105})})
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire96;
  input wire signed [(5'h14):(1'h0)] wire95;
  input wire [(3'h6):(1'h0)] wire94;
  input wire signed [(4'hf):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire98;
  wire [(4'hb):(1'h0)] wire97;
  reg [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  assign y = {wire104,
                 wire98,
                 wire97,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 (1'h0)};
  assign wire97 = (({(~|wire95[(1'h1):(1'h1)])} ?
                          (-(^~wire93[(1'h0):(1'h0)])) : ((~$signed(wire94)) * $unsigned((!wire93)))) ?
                      ((+{$signed((8'h9c)),
                          $unsigned(wire96)}) ^~ wire96) : (wire96 ?
                          ((-wire95) ?
                              $unsigned(wire93) : (~^wire96)) : (-$unsigned($unsigned(wire95)))));
  assign wire98 = $signed((!$unsigned(($signed(wire97) <= $signed(wire97)))));
  always
    @(posedge clk) begin
      reg99 <= (~(wire94 ? wire97 : $unsigned((-(~&wire95)))));
      reg100 <= $signed((wire96 <<< reg99[(1'h1):(1'h0)]));
      reg101 <= (wire93[(2'h2):(1'h0)] & ((8'ha6) >>> $signed(wire94)));
      reg102 <= wire97;
      reg103 <= ($unsigned(wire94[(3'h4):(2'h2)]) == wire97);
    end
  assign wire104 = $signed(wire98[(1'h1):(1'h0)]);
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h1b0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  input wire [(4'ha):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire [(3'h7):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire [(4'ha):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire33;
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire33,
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
                 reg51,
                 reg50,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = $unsigned((wire29 <<< {$unsigned({wire31}), wire29}));
  always
    @(posedge clk) begin
      if ($unsigned(wire33))
        begin
          reg34 <= $signed($unsigned((8'hb7)));
          reg35 <= {wire29};
          if ((wire30 != $signed((8'ha6))))
            begin
              reg36 <= (reg34 ?
                  reg34 : ($unsigned(((wire31 ? wire31 : wire30) >= (8'haf))) ?
                      wire32[(1'h0):(1'h0)] : (-wire32[(3'h4):(1'h1)])));
            end
          else
            begin
              reg36 <= $unsigned((7'h41));
              reg37 <= {{(wire31 << (reg34 ? $unsigned(reg34) : (~&reg35)))}};
            end
        end
      else
        begin
          if ((reg34 ? wire32 : wire32))
            begin
              reg34 <= {$unsigned((&$unsigned(wire31)))};
              reg35 <= reg37;
              reg36 <= ($signed($signed($unsigned((reg36 <<< wire31)))) ?
                  wire31[(3'h4):(3'h4)] : (reg36[(2'h2):(2'h2)] ?
                      $unsigned((wire31[(3'h6):(3'h5)] ?
                          (^~wire31) : wire32)) : (-{$unsigned((8'hbc))})));
            end
          else
            begin
              reg34 <= $signed((($unsigned($signed(wire29)) ?
                      $unsigned((+wire30)) : {$unsigned(wire31),
                          {reg34, reg34}}) ?
                  {((~^reg35) != {reg34, wire31}),
                      $signed($unsigned(wire29))} : wire29[(1'h1):(1'h0)]));
            end
          reg37 <= (~&wire33[(2'h3):(2'h3)]);
        end
      reg38 <= {(($unsigned((~|reg34)) ?
                  (wire28 ? ((8'ha9) <= reg35) : $unsigned(wire31)) : wire31) ?
              (($unsigned((8'hb1)) >> {(8'h9d), reg35}) ?
                  (wire32 >> wire31) : $signed((reg34 ?
                      wire32 : wire30))) : ($unsigned({(7'h41)}) - ((wire30 ?
                      wire31 : wire29) ?
                  (reg36 && wire33) : ((8'hac) ? wire31 : wire30)))),
          wire29[(1'h1):(1'h0)]};
      reg39 <= $unsigned($unsigned(reg35[(3'h5):(1'h1)]));
    end
  assign wire40 = ($unsigned(((reg39 ^~ $signed(wire31)) ?
                      ((~&(8'hbe)) ?
                          (reg37 & (8'hbd)) : (wire28 & reg38)) : reg38)) ~^ (&reg37[(3'h4):(3'h4)]));
  assign wire41 = ((8'ha6) ?
                      (reg36[(3'h7):(2'h2)] ?
                          ($unsigned($unsigned(reg35)) ~^ wire30[(2'h3):(1'h1)]) : (reg38[(5'h11):(3'h5)] ?
                              ($signed(reg36) ?
                                  $unsigned((8'hae)) : $signed(reg38)) : reg36)) : (~|{({reg37,
                              reg35} >>> reg37[(3'h4):(3'h4)])}));
  assign wire42 = $unsigned((~reg37));
  assign wire43 = $unsigned(wire31);
  assign wire44 = (-$unsigned(($unsigned($signed(wire40)) ?
                      ($unsigned(wire43) ?
                          reg34[(1'h0):(1'h0)] : (^wire31)) : wire42)));
  assign wire45 = (wire31 ?
                      $unsigned($unsigned($unsigned($unsigned(reg39)))) : {(^~((reg37 ^ reg37) ^~ reg37[(3'h5):(1'h0)]))});
  assign wire46 = wire32[(1'h0):(1'h0)];
  assign wire47 = $unsigned(wire42);
  assign wire48 = (&$signed(($signed((reg37 ?
                      wire31 : reg35)) && (wire41[(2'h2):(1'h1)] ~^ $unsigned(wire40)))));
  assign wire49 = reg35;
  always
    @(posedge clk) begin
      reg50 <= wire45[(3'h6):(3'h5)];
      reg51 <= reg39[(2'h3):(2'h3)];
      if ((wire46[(4'hf):(3'h5)] | (((^~(8'hbe)) ?
              (!(wire47 ? wire49 : reg34)) : (+wire49)) ?
          (+((wire44 >> wire33) ?
              (~wire33) : (wire28 >> wire32))) : (((wire28 != wire32) >= wire43) ?
              wire42 : $signed((~^reg39))))))
        begin
          reg52 <= ($signed(($signed((-reg50)) == ({(8'haa)} ?
                  wire48[(3'h6):(2'h3)] : $unsigned((8'h9d))))) ?
              wire49[(3'h4):(1'h0)] : (~|(8'hb4)));
        end
      else
        begin
          reg52 <= ((^~reg39[(1'h0):(1'h0)]) ?
              (8'h9f) : ((-reg51[(4'h9):(1'h1)]) ?
                  $signed($signed(wire47)) : {$signed(reg35[(1'h1):(1'h1)])}));
          if (({((^~(wire45 | reg39)) ?
                  {(~&wire46),
                      reg38[(1'h0):(1'h0)]} : wire49[(1'h1):(1'h1)])} <= ($unsigned((&$unsigned(wire31))) && ($signed($unsigned(wire30)) >> {(&wire46)}))))
            begin
              reg53 <= $signed($signed((wire29[(4'ha):(3'h4)] ?
                  wire33[(1'h1):(1'h0)] : (~&$signed((8'ha1))))));
              reg54 <= ({wire46[(3'h4):(3'h4)]} ?
                  ($unsigned((reg35[(1'h1):(1'h1)] ?
                      $unsigned(wire46) : wire31)) ^ $unsigned(reg34)) : $signed(wire40));
            end
          else
            begin
              reg53 <= {wire42};
              reg54 <= wire33;
              reg55 <= (~$signed((^$signed($signed((8'hb9))))));
              reg56 <= wire46;
            end
          if ($unsigned(reg56))
            begin
              reg57 <= (wire32 ~^ $unsigned((wire29[(1'h1):(1'h0)] & (^(7'h40)))));
            end
          else
            begin
              reg57 <= (((((wire29 * reg52) ?
                          wire29 : (wire42 + wire48)) ^ (8'h9f)) ?
                      wire43 : $signed((reg56[(1'h1):(1'h1)] >= $signed(wire43)))) ?
                  $unsigned((8'ha0)) : ((~^wire48) ^~ (($signed(reg54) ?
                      $unsigned(wire49) : (~wire48)) ^ wire33)));
              reg58 <= $signed(((((+wire29) ?
                      (8'hb1) : ((8'ha3) ?
                          wire41 : wire49)) || ((reg34 <= wire47) ?
                      (|(8'h9c)) : (~(8'h9d)))) ?
                  $signed(((wire46 >> reg37) == (wire28 & wire49))) : (~^{wire32,
                      wire41})));
              reg59 <= $unsigned(wire45[(4'h8):(3'h6)]);
              reg60 <= (8'hb0);
            end
        end
      if (reg58[(4'h9):(2'h3)])
        begin
          reg61 <= $signed(((-wire28[(4'hc):(3'h4)]) ?
              (|$signed({reg60, (8'hb2)})) : $unsigned(wire48[(2'h3):(2'h3)])));
          if (wire30)
            begin
              reg62 <= ($unsigned(($signed($unsigned(wire42)) ?
                      (8'h9e) : $signed({(8'ha9), reg59}))) ?
                  wire47 : (reg53[(4'he):(4'hd)] ^ ($signed($unsigned(reg36)) ~^ $unsigned(reg60))));
            end
          else
            begin
              reg62 <= (~|{(~&reg39),
                  (&(reg56 ? (8'hb1) : reg51[(3'h4):(3'h4)]))});
              reg63 <= (~$signed((|wire45[(4'he):(4'hc)])));
              reg64 <= reg63;
            end
          reg65 <= wire32;
        end
      else
        begin
          reg61 <= (((8'hbd) < (wire40 ?
                  (wire31 < $unsigned((8'hb9))) : reg36[(5'h14):(5'h14)])) ?
              wire33 : {(!wire30[(1'h1):(1'h0)]), $signed((~&(8'ha2)))});
          reg62 <= $unsigned((8'hb2));
        end
    end
  assign wire66 = wire48;
  assign wire67 = wire46[(2'h3):(2'h3)];
  assign wire68 = (^~(!$unsigned({{wire31, wire40}})));
  assign wire69 = (~^{$signed(reg34), reg60});
endmodule

module module10
#(parameter param23 = (8'ha9), 
parameter param24 = (~param23))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire signed [(2'h3):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 (1'h0)};
  assign wire15 = (8'hbd);
  assign wire16 = wire12[(2'h3):(2'h2)];
  assign wire17 = (|wire16[(4'hd):(3'h5)]);
  assign wire18 = wire12;
  assign wire19 = wire13[(1'h1):(1'h0)];
  assign wire20 = ({$unsigned(wire11),
                      $signed(wire12[(2'h2):(1'h0)])} >>> (&wire14[(2'h2):(1'h0)]));
  assign wire21 = $unsigned((^(+(~$unsigned(wire18)))));
  assign wire22 = {wire12[(1'h0):(1'h0)]};
endmodule

module module267
#(parameter param310 = ({((((7'h41) && (8'ha9)) ? (+(8'hbd)) : ((8'hb4) ? (8'hbd) : (7'h40))) ? ({(8'hbd)} ~^ {(8'ha0)}) : {((8'hb2) ? (8'had) : (8'hbd))}), ((((8'ha3) ? (8'hac) : (8'hbb)) ? {(8'ha8)} : {(8'hb2), (8'hab)}) > (~((8'h9d) && (8'ha1))))} >= (~(8'h9d))))
(y, clk, wire272, wire271, wire270, wire269, wire268);
  output wire [(32'h1c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire272;
  input wire [(5'h13):(1'h0)] wire271;
  input wire signed [(4'hb):(1'h0)] wire270;
  input wire signed [(4'hc):(1'h0)] wire269;
  input wire [(5'h11):(1'h0)] wire268;
  wire signed [(4'he):(1'h0)] wire309;
  wire [(5'h13):(1'h0)] wire308;
  wire [(5'h13):(1'h0)] wire307;
  wire [(4'he):(1'h0)] wire290;
  wire signed [(4'h8):(1'h0)] wire289;
  wire [(4'hd):(1'h0)] wire288;
  wire [(5'h12):(1'h0)] wire287;
  wire signed [(2'h3):(1'h0)] wire286;
  wire [(5'h13):(1'h0)] wire285;
  wire signed [(5'h13):(1'h0)] wire284;
  wire [(2'h3):(1'h0)] wire283;
  wire [(5'h11):(1'h0)] wire280;
  wire [(4'ha):(1'h0)] wire279;
  wire signed [(4'hd):(1'h0)] wire274;
  wire signed [(3'h6):(1'h0)] wire273;
  reg [(4'ha):(1'h0)] reg306 = (1'h0);
  reg [(2'h2):(1'h0)] reg305 = (1'h0);
  reg [(5'h15):(1'h0)] reg304 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg303 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg302 = (1'h0);
  reg [(5'h10):(1'h0)] reg301 = (1'h0);
  reg [(3'h7):(1'h0)] reg300 = (1'h0);
  reg [(5'h15):(1'h0)] reg299 = (1'h0);
  reg [(2'h3):(1'h0)] reg298 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg297 = (1'h0);
  reg [(4'hb):(1'h0)] reg296 = (1'h0);
  reg [(4'ha):(1'h0)] reg295 = (1'h0);
  reg [(5'h15):(1'h0)] reg294 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg293 = (1'h0);
  reg [(3'h6):(1'h0)] reg292 = (1'h0);
  reg [(3'h6):(1'h0)] reg291 = (1'h0);
  reg [(2'h2):(1'h0)] reg282 = (1'h0);
  reg [(4'h9):(1'h0)] reg281 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg278 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg277 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg276 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg275 = (1'h0);
  assign y = {wire309,
                 wire308,
                 wire307,
                 wire290,
                 wire289,
                 wire288,
                 wire287,
                 wire286,
                 wire285,
                 wire284,
                 wire283,
                 wire280,
                 wire279,
                 wire274,
                 wire273,
                 reg306,
                 reg305,
                 reg304,
                 reg303,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg282,
                 reg281,
                 reg278,
                 reg277,
                 reg276,
                 reg275,
                 (1'h0)};
  assign wire273 = $signed((~&(~&($unsigned(wire272) ?
                       (~^wire271) : $unsigned(wire268)))));
  assign wire274 = (&wire272);
  always
    @(posedge clk) begin
      if ((~^wire271[(4'hf):(4'he)]))
        begin
          reg275 <= (~&$unsigned(($unsigned(wire270) ?
              wire274 : $signed((wire274 + wire270)))));
        end
      else
        begin
          reg275 <= $signed(wire273[(3'h5):(2'h2)]);
          reg276 <= (~&wire274);
          reg277 <= wire268;
        end
      reg278 <= {reg275[(4'h8):(1'h0)]};
    end
  assign wire279 = $signed((^~reg278[(4'ha):(4'h9)]));
  assign wire280 = ((($unsigned(wire279) ?
                           reg277 : (((8'hb4) ? (7'h43) : reg275) > wire269)) ?
                       $unsigned(wire274) : (~|wire271[(4'he):(4'h8)])) >= (wire274[(1'h1):(1'h0)] ?
                       (!$signed(wire273[(3'h4):(3'h4)])) : wire268));
  always
    @(posedge clk) begin
      reg281 <= ((wire270[(1'h1):(1'h1)] >= ((~&(wire270 - wire272)) == wire280)) >= $signed($unsigned(({wire269} >> {reg278}))));
      reg282 <= {reg275[(2'h2):(1'h0)], {reg276[(3'h5):(3'h4)]}};
    end
  assign wire283 = ((!(^reg275)) ?
                       (wire274 ?
                           $unsigned(reg275) : wire272[(2'h3):(1'h0)]) : (-((reg276 ?
                               reg282 : $signed(wire269)) ?
                           {(~^wire273)} : (^~((8'ha4) * wire269)))));
  assign wire284 = ((~|$signed(($unsigned(wire269) != (&(8'h9c))))) ^~ reg282);
  assign wire285 = wire280;
  assign wire286 = $unsigned((~((wire270[(3'h4):(1'h0)] ?
                           wire273[(2'h3):(1'h0)] : wire283) ?
                       reg282 : $unsigned($signed((7'h43))))));
  assign wire287 = ((wire286[(1'h0):(1'h0)] ?
                       ((^~(wire274 ?
                           wire270 : (7'h43))) * (~|(-(8'hba)))) : wire273[(2'h3):(1'h1)]) < $signed(($unsigned(wire271[(1'h1):(1'h1)]) <= ((reg275 <<< wire285) ?
                       (wire272 | reg282) : wire274))));
  assign wire288 = (reg275 ?
                       wire268 : $unsigned($unsigned({(wire274 ^ wire285)})));
  assign wire289 = (~((wire287[(4'h8):(2'h3)] ?
                           ((reg281 >> reg281) ~^ (wire286 <<< wire268)) : (wire286 + {wire269})) ?
                       $signed($signed(wire271)) : wire280));
  assign wire290 = wire284[(5'h10):(1'h0)];
  always
    @(posedge clk) begin
      reg291 <= $unsigned($unsigned($signed(wire284)));
      reg292 <= reg276;
      reg293 <= ((-($signed((wire285 ?
          wire290 : wire286)) <<< wire284)) * (reg292[(3'h5):(1'h0)] ?
          ($signed($signed(reg281)) ?
              ((wire270 || wire287) ?
                  wire284 : ((8'hb4) * reg278)) : ((wire289 ?
                  reg292 : wire269) & $unsigned(wire288))) : reg292));
      reg294 <= $signed((($unsigned((wire284 ? wire288 : wire286)) ?
              ({(8'hb2)} >>> wire280) : {reg276}) ?
          $signed((reg293 << $unsigned((7'h43)))) : (~(-$signed(reg275)))));
      if (reg292[(1'h0):(1'h0)])
        begin
          reg295 <= {$unsigned($signed($unsigned((^(8'ha7)))))};
          reg296 <= (wire285[(4'hd):(2'h2)] ? reg292 : reg295);
          if ($unsigned(reg295))
            begin
              reg297 <= (+(7'h43));
              reg298 <= (wire286 ?
                  $unsigned($signed($signed((!reg281)))) : (8'hbf));
              reg299 <= reg278;
              reg300 <= $signed(wire287);
            end
          else
            begin
              reg297 <= ((8'ha2) ?
                  $unsigned(reg297[(4'h9):(4'h8)]) : (~($unsigned((8'h9f)) ?
                      $signed((~reg297)) : (reg275[(4'h8):(1'h1)] ?
                          $unsigned(reg282) : (~(8'hb3))))));
              reg298 <= wire290;
              reg299 <= ((!(wire289[(1'h1):(1'h0)] ?
                      reg293[(3'h4):(1'h0)] : ((~&(8'hae)) | $signed((8'hbb))))) ?
                  (($signed($unsigned(reg298)) >>> $unsigned($signed(wire285))) ~^ ({(|reg295)} ?
                      {wire268[(4'he):(3'h7)],
                          wire274[(3'h5):(2'h3)]} : wire268)) : {((+(+reg299)) ?
                          reg299[(4'hc):(3'h7)] : reg296),
                      wire284});
              reg300 <= $signed(($signed((wire285[(5'h12):(3'h7)] && (8'hb8))) ?
                  ($signed(wire270[(3'h6):(1'h0)]) << reg296) : (($signed((8'hb3)) > ((8'hbf) ?
                          wire279 : wire279)) ?
                      $signed((+wire271)) : ($unsigned(reg296) ?
                          (reg282 & reg292) : {reg297, (8'h9e)}))));
              reg301 <= $unsigned($signed(((~{wire268,
                  (8'hbf)}) & $signed((wire283 ? wire284 : wire272)))));
            end
          reg302 <= $unsigned(wire287[(4'h9):(3'h4)]);
          if (((wire288[(3'h6):(3'h6)] >> $unsigned({(&(8'hb2)),
                  $unsigned(reg291)})) ?
              {$signed(reg299[(2'h3):(2'h3)])} : (~^(+$unsigned(wire271)))))
            begin
              reg303 <= wire287;
            end
          else
            begin
              reg303 <= {((|$unsigned(reg298[(1'h1):(1'h1)])) ?
                      (reg302[(4'h8):(1'h0)] || wire268) : (($unsigned(reg281) || (reg276 ?
                          wire272 : reg278)) & (wire290 ?
                          $signed(wire287) : (8'hb4))))};
              reg304 <= wire270[(4'h8):(3'h4)];
              reg305 <= $unsigned((8'hb9));
              reg306 <= (($signed($signed(wire268[(4'hc):(3'h6)])) > $unsigned((|$unsigned(wire290)))) ~^ reg291);
            end
        end
      else
        begin
          if (wire285)
            begin
              reg295 <= $signed((~|wire284[(3'h6):(3'h4)]));
            end
          else
            begin
              reg295 <= {$signed(((-$signed(wire284)) >>> (!{reg305,
                      wire274}))),
                  (-$unsigned($signed(reg278)))};
              reg296 <= wire279[(1'h1):(1'h0)];
              reg297 <= (((wire274 >= $signed($signed(reg277))) ?
                  {(+$unsigned(wire287)),
                      reg276[(1'h0):(1'h0)]} : ($unsigned(((8'hae) ?
                          reg291 : reg282)) ?
                      (~|(wire268 ~^ reg295)) : $unsigned(reg304[(4'ha):(3'h5)]))) + wire283[(2'h3):(2'h2)]);
            end
          reg298 <= (^~wire271);
          reg299 <= ((8'h9f) ?
              (|(~&(~&(wire287 ? (8'hb0) : wire269)))) : ({(^(reg297 ^ reg304)),
                      $unsigned((wire285 | wire268))} ?
                  (~&$signed($signed(reg292))) : (^$signed((wire283 ?
                      wire270 : (8'hb1))))));
          if ((wire280 * {(((wire272 ? wire269 : wire287) ?
                      (reg276 ? wire288 : (7'h43)) : $signed(reg306)) ?
                  wire280[(3'h5):(1'h1)] : (reg282 ?
                      $signed(wire270) : (reg306 > reg277))),
              $unsigned($signed((^wire269)))}))
            begin
              reg300 <= (&({(8'hb6), (|(^wire274))} ?
                  (($signed(wire279) ^~ wire268[(4'he):(2'h3)]) && ((-wire269) ?
                      $signed(reg300) : $signed(wire290))) : {reg281[(3'h7):(2'h3)]}));
              reg301 <= ((|wire273) ?
                  (reg302 ?
                      (reg292 - (reg303[(3'h4):(1'h1)] + wire272)) : $unsigned($unsigned(reg281))) : (-({reg282[(2'h2):(1'h0)],
                      (reg278 >>> reg291)} * ((wire271 ?
                      (7'h43) : wire287) != wire285))));
            end
          else
            begin
              reg300 <= (reg298[(2'h3):(1'h1)] ?
                  ($signed($signed(((8'hbe) ? reg281 : wire273))) ?
                      {($signed((8'ha4)) ?
                              wire270 : ((8'hb3) ?
                                  (7'h42) : (8'hac)))} : (&wire271[(1'h1):(1'h1)])) : (reg295[(4'h8):(1'h1)] != {reg278}));
              reg301 <= reg277[(3'h4):(3'h4)];
              reg302 <= $unsigned((^~($signed((-wire288)) > (wire287 <= wire284[(4'hf):(3'h6)]))));
              reg303 <= reg296[(1'h0):(1'h0)];
              reg304 <= (~^reg305);
            end
        end
    end
  assign wire307 = $unsigned({reg292[(1'h0):(1'h0)]});
  assign wire308 = $unsigned(reg305[(1'h1):(1'h1)]);
  assign wire309 = $signed(wire286);
endmodule

module module201  (y, clk, wire205, wire204, wire203, wire202);
  output wire [(32'h1f0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire205;
  input wire [(4'hb):(1'h0)] wire204;
  input wire signed [(3'h7):(1'h0)] wire203;
  input wire [(5'h15):(1'h0)] wire202;
  wire [(5'h11):(1'h0)] wire248;
  wire signed [(4'hd):(1'h0)] wire247;
  wire [(3'h5):(1'h0)] wire246;
  wire [(3'h7):(1'h0)] wire245;
  wire signed [(3'h7):(1'h0)] wire244;
  wire [(3'h4):(1'h0)] wire243;
  wire [(4'hf):(1'h0)] wire236;
  wire signed [(4'h9):(1'h0)] wire223;
  wire [(3'h6):(1'h0)] wire222;
  wire [(2'h3):(1'h0)] wire221;
  wire signed [(5'h12):(1'h0)] wire220;
  wire signed [(4'he):(1'h0)] wire210;
  wire [(5'h14):(1'h0)] wire209;
  wire [(5'h11):(1'h0)] wire208;
  wire signed [(4'hf):(1'h0)] wire207;
  wire signed [(5'h12):(1'h0)] wire206;
  reg signed [(5'h13):(1'h0)] reg242 = (1'h0);
  reg [(4'hc):(1'h0)] reg241 = (1'h0);
  reg [(5'h12):(1'h0)] reg240 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg239 = (1'h0);
  reg [(5'h15):(1'h0)] reg238 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg237 = (1'h0);
  reg [(4'h8):(1'h0)] reg235 = (1'h0);
  reg [(4'h8):(1'h0)] reg234 = (1'h0);
  reg [(4'h8):(1'h0)] reg233 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg232 = (1'h0);
  reg signed [(4'he):(1'h0)] reg231 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg229 = (1'h0);
  reg [(4'hc):(1'h0)] reg228 = (1'h0);
  reg [(2'h3):(1'h0)] reg227 = (1'h0);
  reg [(4'he):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg225 = (1'h0);
  reg [(5'h10):(1'h0)] reg224 = (1'h0);
  reg [(3'h4):(1'h0)] reg219 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg218 = (1'h0);
  reg [(5'h15):(1'h0)] reg217 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg216 = (1'h0);
  reg [(4'ha):(1'h0)] reg215 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg213 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg212 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg211 = (1'h0);
  assign y = {wire248,
                 wire247,
                 wire246,
                 wire245,
                 wire244,
                 wire243,
                 wire236,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg235,
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
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 (1'h0)};
  assign wire206 = (((+(wire205[(3'h5):(1'h0)] - wire204)) ?
                       (($signed(wire204) ?
                           {wire204} : wire205) | wire205) : (8'hb0)) <<< {$signed($signed($signed(wire204))),
                       {($unsigned((8'hbd)) ?
                               (wire202 ? (8'haa) : wire203) : ((8'had) ?
                                   wire205 : wire202)),
                           (~(-wire202))}});
  assign wire207 = $unsigned(wire206);
  assign wire208 = ((8'h9c) ?
                       ($unsigned(($signed(wire205) <<< wire204[(4'ha):(3'h5)])) ?
                           $unsigned($unsigned($unsigned((8'haa)))) : (+$unsigned((wire202 << wire206)))) : ((wire207 < wire203[(1'h1):(1'h0)]) >>> (8'hb6)));
  assign wire209 = $signed($signed(($signed(wire203[(3'h6):(3'h5)]) ?
                       ({wire203, wire203} <<< (wire206 ?
                           wire203 : wire206)) : ((wire205 & wire206) ~^ (wire202 ?
                           wire206 : wire202)))));
  assign wire210 = (^((wire208[(2'h3):(2'h3)] ?
                       wire207 : wire208[(3'h5):(2'h3)]) + {((^wire204) ?
                           $unsigned(wire207) : (wire202 ?
                               wire205 : (8'hbd)))}));
  always
    @(posedge clk) begin
      if ((wire210[(1'h1):(1'h0)] ?
          $unsigned($signed(wire206[(5'h11):(3'h5)])) : $signed((~^(-$unsigned(wire208))))))
        begin
          reg211 <= $signed(wire204[(4'h8):(4'h8)]);
          if (wire204)
            begin
              reg212 <= wire202;
              reg213 <= (reg211[(2'h3):(1'h1)] > (~^(8'hb8)));
              reg214 <= wire203;
            end
          else
            begin
              reg212 <= ($signed(($signed($unsigned(reg213)) + wire203[(2'h3):(1'h1)])) | (((((8'hae) ?
                              wire206 : reg212) ?
                          $signed(wire203) : ((7'h41) >= reg214)) ?
                      reg211[(3'h5):(1'h1)] : (!(reg214 ^ wire206))) ?
                  wire203 : ((^~$unsigned(reg213)) ?
                      wire208 : (~&{reg211, reg211}))));
              reg213 <= (wire205[(4'hb):(2'h3)] ?
                  wire206[(3'h7):(2'h2)] : wire203);
            end
          reg215 <= wire203;
          if ($signed($unsigned(wire208)))
            begin
              reg216 <= $unsigned((+reg214));
              reg217 <= wire202[(3'h7):(3'h5)];
            end
          else
            begin
              reg216 <= $unsigned((^~(reg215 - ((~|reg217) ?
                  wire210[(1'h0):(1'h0)] : (&wire206)))));
              reg217 <= ({(~|($signed(wire207) | (wire207 ?
                      wire203 : wire208)))} <<< reg214[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg211 <= $signed($unsigned({($signed(reg211) ?
                  wire204 : (reg213 << reg216)),
              wire209[(4'hc):(2'h3)]}));
          reg212 <= reg214[(1'h1):(1'h0)];
          reg213 <= $unsigned($unsigned((((reg216 << (7'h42)) ?
                  (wire202 ? reg212 : wire209) : (~^reg215)) ?
              ((~wire204) ~^ {reg215}) : (^~{wire205}))));
          reg214 <= $unsigned((~&{(wire208[(4'hb):(3'h7)] ~^ (^~reg216))}));
          reg215 <= wire207;
        end
      reg218 <= wire208;
      reg219 <= ({reg213} == $signed(reg217[(4'h8):(3'h4)]));
    end
  assign wire220 = reg217;
  assign wire221 = (((+({wire204} && (-wire220))) != wire205) ?
                       $unsigned($signed($signed({reg212,
                           reg217}))) : ({(wire204[(3'h6):(2'h3)] ?
                                   $signed(reg211) : reg219[(1'h1):(1'h0)])} ?
                           wire202 : $unsigned($signed(wire202[(3'h5):(1'h0)]))));
  assign wire222 = reg218[(1'h0):(1'h0)];
  assign wire223 = ($unsigned((&($unsigned(wire204) < wire206[(4'hf):(4'hc)]))) ?
                       (($signed(((8'hb4) > wire220)) ?
                           ((~(8'haf)) ?
                               (~(8'hb5)) : $unsigned(reg212)) : {(~&reg215)}) <<< (+(|reg218[(4'h8):(3'h5)]))) : $unsigned(($unsigned($signed(reg218)) != (~(reg219 ?
                           reg217 : reg218)))));
  always
    @(posedge clk) begin
      reg224 <= ($unsigned(($signed(wire210[(3'h5):(1'h1)]) ?
              $signed($signed(wire209)) : ((^reg217) ?
                  (^~wire208) : wire207))) ?
          ((reg216[(1'h0):(1'h0)] ?
                  $signed((wire223 ? wire202 : wire202)) : (+(+(8'hb5)))) ?
              (($signed(wire207) || $unsigned(reg216)) ?
                  {$unsigned(reg219)} : ((~^wire205) ?
                      (!wire223) : (wire210 >> reg217))) : (~|reg217)) : $unsigned($signed($signed(((8'ha6) ?
              (7'h41) : (8'hbf))))));
      if ((^$unsigned((~{wire205}))))
        begin
          reg225 <= (&$unsigned(wire223[(3'h5):(2'h2)]));
          reg226 <= reg213;
          reg227 <= {(^~(~&$unsigned(reg211)))};
        end
      else
        begin
          if ($signed($unsigned((wire204 <<< $signed(reg216[(2'h2):(2'h2)])))))
            begin
              reg225 <= wire204;
              reg226 <= wire202;
            end
          else
            begin
              reg225 <= wire206[(3'h7):(3'h4)];
              reg226 <= {(^~reg219[(2'h3):(1'h1)])};
              reg227 <= wire221;
            end
          reg228 <= ($unsigned($signed(($signed(reg218) | (8'hbe)))) >>> {(({reg219,
                  reg219} >>> (reg227 >= reg218)) <<< wire222)});
          if (((|{(!$unsigned(wire205)), $signed((+reg211))}) ?
              $unsigned(((8'ha2) * (~&{(8'hb8)}))) : reg227))
            begin
              reg229 <= $unsigned((reg212 * $signed($signed((wire205 <= reg224)))));
              reg230 <= $signed(reg216);
              reg231 <= $unsigned($signed($unsigned((reg227 + $signed(reg213)))));
              reg232 <= reg227;
            end
          else
            begin
              reg229 <= reg231[(1'h1):(1'h1)];
              reg230 <= ($unsigned({(~$unsigned(reg214)), wire210}) ?
                  (~(|wire210[(2'h3):(2'h3)])) : wire204[(3'h4):(2'h3)]);
              reg231 <= (~&(wire207 + wire208[(4'hf):(3'h6)]));
            end
          reg233 <= (reg213[(4'hd):(1'h1)] | reg214);
          reg234 <= (^$unsigned(((reg219 + reg232[(3'h7):(2'h2)]) ?
              $unsigned(((8'hae) ? reg230 : reg226)) : reg217)));
        end
      reg235 <= reg225[(1'h0):(1'h0)];
    end
  assign wire236 = reg218;
  always
    @(posedge clk) begin
      if ($unsigned((reg225[(3'h7):(1'h0)] && (&$unsigned((-reg216))))))
        begin
          reg237 <= (^~$signed($unsigned($unsigned(((8'ha9) ?
              reg228 : (8'ha2))))));
          reg238 <= (wire204[(2'h3):(1'h1)] | wire221[(1'h0):(1'h0)]);
          reg239 <= (~^wire208);
          reg240 <= {wire208, wire203};
        end
      else
        begin
          reg237 <= ($signed((&$unsigned($unsigned(wire222)))) ?
              (wire208[(1'h0):(1'h0)] & wire220[(4'h8):(3'h6)]) : $unsigned({reg233}));
          reg238 <= reg211[(2'h3):(1'h0)];
          reg239 <= $unsigned((~($unsigned((+wire204)) || $signed((~|wire208)))));
          reg240 <= reg219[(3'h4):(3'h4)];
        end
      reg241 <= $signed(reg226[(3'h7):(2'h2)]);
      reg242 <= reg224;
    end
  assign wire243 = wire209;
  assign wire244 = (({(~(^reg241)),
                       ((+wire202) ?
                           (^~reg211) : $unsigned(reg238))} && {reg240[(3'h6):(2'h2)]}) - reg228[(3'h7):(1'h1)]);
  assign wire245 = ((reg228 ^ (wire221 || wire221)) <<< ((~|$unsigned((wire204 != (8'hb5)))) ?
                       ((~|$signed(wire204)) ?
                           (^{reg217}) : (((8'hb7) ?
                               (8'hb1) : wire206) && (reg224 <<< reg225))) : (-($signed(wire223) & wire204))));
  assign wire246 = reg229;
  assign wire247 = {reg214};
  assign wire248 = reg242;
endmodule

module module171
#(parameter param197 = ({((((8'hb9) - (8'hb7)) ? {(7'h44), (7'h44)} : (!(7'h41))) >> (~(+(7'h43))))} + ({{((8'ha2) ? (8'ha6) : (7'h41)), ((8'ha8) ? (8'hbe) : (8'ha0))}} == (((~&(8'hbf)) ? ((8'hae) ? (7'h42) : (8'hb5)) : {(8'hba), (7'h42)}) >> ((~^(7'h40)) ? ((8'hb0) ? (8'ha2) : (8'hb5)) : (-(7'h44)))))), 
parameter param198 = (({param197, {(param197 ? param197 : (8'hb2)), (param197 ? param197 : (8'ha1))}} > (param197 > (param197 ? param197 : (param197 <= param197)))) || (~&({((8'ha2) ? param197 : param197)} ? (^~(~param197)) : {(param197 ? param197 : param197)}))))
(y, clk, wire175, wire174, wire173, wire172);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire175;
  input wire signed [(3'h5):(1'h0)] wire174;
  input wire signed [(4'h9):(1'h0)] wire173;
  input wire signed [(4'hf):(1'h0)] wire172;
  wire [(4'h8):(1'h0)] wire196;
  wire [(4'h8):(1'h0)] wire195;
  wire [(4'hd):(1'h0)] wire194;
  wire [(4'hd):(1'h0)] wire193;
  wire [(4'ha):(1'h0)] wire192;
  wire signed [(5'h13):(1'h0)] wire191;
  wire signed [(5'h10):(1'h0)] wire190;
  wire signed [(5'h12):(1'h0)] wire189;
  wire signed [(5'h10):(1'h0)] wire188;
  wire [(4'he):(1'h0)] wire187;
  wire signed [(4'ha):(1'h0)] wire186;
  wire signed [(5'h13):(1'h0)] wire185;
  wire [(2'h3):(1'h0)] wire184;
  wire signed [(4'hb):(1'h0)] wire183;
  wire signed [(3'h5):(1'h0)] wire182;
  wire [(3'h5):(1'h0)] wire181;
  wire signed [(3'h7):(1'h0)] wire180;
  wire signed [(3'h7):(1'h0)] wire179;
  wire signed [(3'h4):(1'h0)] wire178;
  wire [(2'h3):(1'h0)] wire177;
  reg signed [(3'h4):(1'h0)] reg176 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire178,
                 wire177,
                 reg176,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg176 <= $signed(({wire175[(3'h5):(1'h0)]} <<< {$signed($unsigned(wire174))}));
    end
  assign wire177 = $unsigned(((8'ha6) ?
                       $signed(((reg176 + wire175) ?
                           $signed(wire173) : $unsigned(wire173))) : {($signed((8'hb3)) ?
                               $unsigned(wire172) : (reg176 >> wire173))}));
  assign wire178 = reg176[(1'h0):(1'h0)];
  assign wire179 = $signed($signed((-$signed((7'h42)))));
  assign wire180 = ((~{({reg176, wire172} ? {wire178} : $unsigned((8'ha8)))}) ?
                       $unsigned((&reg176)) : $unsigned($unsigned($signed((!(8'hab))))));
  assign wire181 = ({wire172[(4'hc):(4'hc)]} ?
                       $unsigned((&(|wire173[(4'h9):(1'h0)]))) : wire174);
  assign wire182 = $signed($unsigned(wire180));
  assign wire183 = (wire181 && {$unsigned(wire181[(3'h5):(3'h5)]),
                       $unsigned($signed($unsigned(wire180)))});
  assign wire184 = wire183;
  assign wire185 = (~|(($unsigned($unsigned((8'hb9))) ?
                           $unsigned(wire181[(3'h5):(1'h1)]) : $signed(wire182)) ?
                       $unsigned((wire177[(2'h3):(2'h2)] ?
                           $unsigned((8'hb1)) : wire180)) : $signed($signed((~^wire174)))));
  assign wire186 = wire174[(2'h2):(1'h0)];
  assign wire187 = $unsigned(($unsigned({(wire183 ? wire178 : wire172),
                       (^~wire174)}) > ((wire179[(1'h1):(1'h1)] ?
                       $signed(wire181) : $unsigned(wire184)) << ((reg176 << wire173) >>> (wire182 ?
                       wire172 : wire185)))));
  assign wire188 = {(+$unsigned(((wire177 ? wire187 : reg176) ~^ {wire180,
                           (8'hb6)}))),
                       wire180};
  assign wire189 = (8'hb7);
  assign wire190 = wire178[(3'h4):(1'h0)];
  assign wire191 = $signed($unsigned((wire185 ?
                       wire182[(1'h0):(1'h0)] : $unsigned((wire173 > wire187)))));
  assign wire192 = $unsigned($signed(wire182[(2'h3):(2'h2)]));
  assign wire193 = (^~$signed($unsigned({(wire177 ^ wire179),
                       (wire189 + wire177)})));
  assign wire194 = ($signed(wire179) - wire184);
  assign wire195 = $unsigned((wire183 || (wire186[(4'h8):(2'h2)] ?
                       (wire191[(3'h4):(2'h3)] ?
                           (-(8'hb6)) : wire186[(1'h1):(1'h1)]) : ((wire178 | (7'h43)) != (wire183 ^ wire191)))));
  assign wire196 = wire183;
endmodule
