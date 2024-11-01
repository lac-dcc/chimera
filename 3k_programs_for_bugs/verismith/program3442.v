module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire192;
  wire signed [(3'h4):(1'h0)] wire191;
  wire signed [(5'h15):(1'h0)] wire189;
  wire [(5'h14):(1'h0)] wire188;
  wire [(3'h7):(1'h0)] wire187;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire10;
  wire [(5'h15):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire178;
  wire signed [(4'ha):(1'h0)] wire180;
  wire [(4'hf):(1'h0)] wire181;
  wire [(2'h2):(1'h0)] wire182;
  wire signed [(4'he):(1'h0)] wire183;
  wire [(3'h7):(1'h0)] wire184;
  wire signed [(2'h2):(1'h0)] wire185;
  assign y = {wire192,
                 wire191,
                 wire189,
                 wire188,
                 wire187,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire96,
                 wire131,
                 wire178,
                 wire180,
                 wire181,
                 wire182,
                 wire183,
                 wire184,
                 wire185,
                 (1'h0)};
  assign wire5 = (~|($signed(wire0) ? (8'haa) : wire0));
  assign wire6 = $signed(($unsigned((^(~wire2))) ?
                     $signed((&(~&wire3))) : $signed(((wire4 ~^ wire0) ?
                         (+wire3) : (!wire5)))));
  assign wire7 = wire1[(1'h1):(1'h1)];
  assign wire8 = wire3[(4'h8):(4'h8)];
  assign wire9 = ({(wire4 ?
                         $signed($unsigned(wire7)) : (&wire4))} | (|wire7[(4'hc):(1'h0)]));
  assign wire10 = ($signed((((~^wire3) * ((8'hbb) >>> wire8)) >>> (~((7'h42) > wire6)))) >> wire1[(1'h0):(1'h0)]);
  module11 #() modinst97 (.wire13(wire7), .wire15(wire8), .wire12(wire0), .y(wire96), .wire14(wire6), .clk(clk));
  module98 #() modinst132 (wire131, clk, wire96, wire4, wire8, wire7);
  module133 #() modinst179 (.clk(clk), .wire134(wire131), .wire135(wire5), .wire136(wire3), .wire137(wire96), .y(wire178));
  assign wire180 = {$signed({((wire9 ? wire0 : wire1) <= (wire7 ?
                               wire6 : wire9))}),
                       $signed(wire9[(1'h0):(1'h0)])};
  assign wire181 = wire1[(1'h0):(1'h0)];
  assign wire182 = (^~{$unsigned($signed($unsigned(wire10))),
                       (wire10 + wire131)});
  assign wire183 = wire180;
  assign wire184 = wire131;
  module34 #() modinst186 (wire185, clk, wire0, wire5, wire96, wire2, wire7);
  assign wire187 = (8'hb9);
  assign wire188 = $unsigned(({((~|wire187) ?
                           wire9[(3'h5):(1'h0)] : {wire96,
                               wire187})} >>> $signed({$unsigned(wire2)})));
  module98 #() modinst190 (wire189, clk, wire9, wire4, wire1, wire3);
  assign wire191 = {wire185};
  assign wire192 = wire5[(4'h9):(2'h2)];
endmodule

module module133
#(parameter param176 = ((((8'hab) ? (^~((8'ha3) ? (7'h41) : (8'hac))) : (((7'h44) > (8'hac)) ? ((8'ha0) <<< (8'hbb)) : {(8'h9e)})) ? ((((8'ha2) && (8'haf)) || ((8'hac) >> (8'hba))) & (((8'ha4) ~^ (8'ha3)) ? ((8'ha7) ? (8'ha3) : (8'hb4)) : (~&(7'h43)))) : {(((7'h41) ? (7'h40) : (8'h9f)) ? ((8'hb6) ? (7'h42) : (8'ha0)) : (+(8'hb4))), (((8'haa) >>> (8'hbc)) ? ((8'ha8) ? (8'ha5) : (7'h41)) : (^~(8'ha5)))}) ^ ((|{(~^(8'ha7))}) ? {{(~^(8'ha5))}} : (((~(8'haa)) + (!(8'ha0))) << (((8'hbc) <<< (8'ha0)) ? (~&(8'hba)) : ((8'ha4) ? (8'hae) : (8'ha6)))))), 
parameter param177 = (param176 == {param176, param176}))
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire137;
  input wire [(4'h8):(1'h0)] wire136;
  input wire [(5'h13):(1'h0)] wire135;
  input wire [(4'hf):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire175;
  wire [(3'h7):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire173;
  wire [(5'h11):(1'h0)] wire172;
  wire [(3'h6):(1'h0)] wire171;
  wire signed [(4'he):(1'h0)] wire170;
  wire signed [(4'h8):(1'h0)] wire169;
  wire [(3'h4):(1'h0)] wire167;
  wire signed [(4'h9):(1'h0)] wire154;
  wire signed [(5'h11):(1'h0)] wire138;
  reg [(4'hf):(1'h0)] reg139 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(4'ha):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  assign y = {wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire167,
                 wire154,
                 wire138,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
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
                 (1'h0)};
  assign wire138 = wire135;
  always
    @(posedge clk) begin
      reg139 <= {$signed(wire138)};
      reg140 <= wire136;
      reg141 <= wire136[(3'h7):(2'h2)];
    end
  always
    @(posedge clk) begin
      if ({({$signed((wire135 ^~ wire136))} ?
              $unsigned(({reg140, wire136} ^~ (reg141 ?
                  wire134 : wire134))) : (reg139 && ($signed(wire134) ^ $signed(reg140))))})
        begin
          reg142 <= (($signed(reg140) ?
              (8'hae) : ($unsigned((wire138 >> wire138)) >>> ({reg140} ?
                  wire138[(4'hb):(2'h2)] : $signed(reg139)))) != (wire137 ?
              $unsigned(reg140[(3'h5):(1'h0)]) : $signed($signed((wire137 <<< reg141)))));
          if ($signed($signed($unsigned((reg142[(5'h11):(3'h7)] ?
              {wire137} : wire136)))))
            begin
              reg143 <= (~&wire134[(4'hb):(4'hb)]);
              reg144 <= ({{((^~wire135) ?
                              (wire137 && reg142) : (wire135 ?
                                  reg139 : reg139)),
                          (-$signed(wire137))}} ?
                  reg140[(4'h8):(2'h2)] : {$signed(reg143[(4'ha):(4'ha)]),
                      (wire137 ?
                          {$signed(reg142), (~|reg141)} : ((wire135 != reg140) ?
                              $unsigned((8'hb3)) : $unsigned(reg142)))});
              reg145 <= $unsigned($signed($unsigned(wire137)));
            end
          else
            begin
              reg143 <= wire135[(3'h5):(1'h1)];
              reg144 <= {reg141[(3'h4):(2'h3)], (-reg139)};
              reg145 <= (~(~&$signed($signed((-wire138)))));
              reg146 <= (((((reg142 == wire137) <<< {reg145, reg141}) ?
                  (-(&reg143)) : (|$signed((8'hac)))) && {(~$signed(reg141))}) < $signed(($signed((-wire134)) + {$unsigned(wire134),
                  $signed(reg139)})));
              reg147 <= reg142;
            end
          reg148 <= reg144;
          reg149 <= ({($signed($unsigned(wire136)) ?
                      (~^$signed(wire134)) : $signed((reg141 ?
                          wire135 : reg144)))} ?
              (wire136 ?
                  (reg146 ?
                      {(-(8'hab))} : $signed({reg148,
                          (8'ha4)})) : $unsigned($unsigned($unsigned(reg148)))) : (reg148[(1'h1):(1'h1)] | reg145));
          reg150 <= {(^~(((wire134 ? reg141 : wire136) ^~ (wire134 <= reg141)) ?
                  ({reg146, wire137} ?
                      (wire135 ?
                          wire134 : reg149) : $signed(wire136)) : ((7'h43) == reg144)))};
        end
      else
        begin
          reg142 <= $signed(reg150);
        end
      reg151 <= reg144[(4'hf):(4'hf)];
      reg152 <= {wire136, wire137[(3'h5):(2'h3)]};
      reg153 <= (-($unsigned(wire136) && reg139[(2'h2):(1'h0)]));
    end
  assign wire154 = (wire138[(4'h8):(3'h6)] | reg150);
  module155 #() modinst168 (wire167, clk, reg140, wire135, reg151, reg139, wire138);
  assign wire169 = reg146;
  assign wire170 = reg147;
  assign wire171 = reg153;
  assign wire172 = ((wire167[(2'h3):(2'h2)] ^ ({reg147[(1'h1):(1'h0)]} >= $signed((-reg147)))) - ($signed((|(~reg148))) ?
                       {reg151,
                           $unsigned((reg150 ?
                               wire135 : (8'had)))} : $unsigned((|wire171))));
  assign wire173 = reg153[(4'hd):(4'h8)];
  assign wire174 = (reg150[(2'h2):(2'h2)] ^ $signed({wire135,
                       reg147[(3'h7):(1'h0)]}));
  assign wire175 = $signed((-$unsigned(wire174[(3'h4):(1'h1)])));
endmodule

module module98
#(parameter param129 = (+(&((^~(~&(8'hb0))) + (~|(^~(8'hb6)))))), 
parameter param130 = (|(^(!param129))))
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire102;
  input wire signed [(3'h4):(1'h0)] wire101;
  input wire [(4'h8):(1'h0)] wire100;
  input wire [(2'h2):(1'h0)] wire99;
  wire signed [(2'h3):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(4'he):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(3'h5):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(5'h11):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire105,
                 wire104,
                 wire103,
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
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire103 = wire101;
  assign wire104 = $signed($signed((!((wire99 ? (8'hb7) : wire102) ?
                       (wire102 ~^ wire103) : (~^wire103)))));
  assign wire105 = wire101;
  always
    @(posedge clk) begin
      reg106 <= wire102;
      reg107 <= $unsigned(wire99[(1'h0):(1'h0)]);
      reg108 <= (wire102[(2'h3):(2'h3)] ?
          (^~((wire101[(3'h4):(1'h1)] - (reg106 * wire105)) <<< ($unsigned(reg106) == {wire101,
              wire99}))) : $unsigned({$signed({reg106}),
              $unsigned($unsigned(wire101))}));
    end
  assign wire109 = wire99;
  assign wire110 = (wire104[(4'h8):(3'h4)] ?
                       $signed($unsigned((((8'hba) - reg106) ^ (wire101 * wire99)))) : reg108);
  always
    @(posedge clk) begin
      reg111 <= (&$signed($unsigned({$unsigned(reg108)})));
      reg112 <= (wire99 << $unsigned((wire100 >> ((~reg107) != wire102[(3'h6):(1'h0)]))));
      if ((reg108[(3'h7):(3'h6)] ?
          reg112 : $signed((^~(reg107 + wire110[(1'h1):(1'h0)])))))
        begin
          if ($signed(wire104))
            begin
              reg113 <= $unsigned((|{reg111[(1'h1):(1'h1)],
                  ($unsigned(wire101) ?
                      ((8'ha3) ? wire104 : reg111) : (~|wire102))}));
            end
          else
            begin
              reg113 <= (&reg111[(1'h0):(1'h0)]);
              reg114 <= wire109[(3'h7):(3'h5)];
            end
          reg115 <= (+wire100[(1'h0):(1'h0)]);
          reg116 <= (8'hb5);
          reg117 <= (({((wire103 ? reg114 : reg113) <<< (wire100 && wire100)),
                  (reg113[(4'hb):(4'h9)] ? (8'hba) : reg115)} ?
              (8'hbc) : reg114) < (8'hbc));
          reg118 <= ((|((!wire110[(1'h0):(1'h0)]) ?
              ((reg116 | wire100) ?
                  reg107[(4'h8):(2'h3)] : $unsigned((8'hbb))) : wire102)) << {(reg115 ?
                  wire102[(3'h5):(1'h1)] : (^~(wire101 ? wire99 : reg106)))});
        end
      else
        begin
          reg113 <= wire102;
          reg114 <= reg114;
          if ((reg115[(1'h1):(1'h1)] ? wire110 : reg113))
            begin
              reg115 <= reg107[(4'hc):(4'hb)];
              reg116 <= ($signed((wire109[(3'h4):(1'h0)] ?
                      reg111 : ((~wire109) && (~|(8'ha7))))) ?
                  reg108[(2'h3):(2'h3)] : (((+wire100[(1'h0):(1'h0)]) || (~&(reg118 ^ wire109))) >= (|(reg108[(3'h7):(2'h3)] < (|(8'h9c))))));
              reg117 <= reg108;
            end
          else
            begin
              reg115 <= reg116;
            end
        end
      if ($signed($signed($unsigned({reg113, (reg118 != wire109)}))))
        begin
          reg119 <= reg115[(1'h0):(1'h0)];
          if (wire105)
            begin
              reg120 <= $signed(((reg106[(3'h4):(3'h4)] <= ({wire99} ?
                  wire109[(4'ha):(3'h6)] : wire100)) ^~ (wire109[(1'h1):(1'h1)] <<< ((~^reg111) ?
                  (reg113 ? reg114 : wire100) : reg113[(1'h1):(1'h1)]))));
              reg121 <= reg108;
              reg122 <= $unsigned(((|(~^(reg116 * reg121))) ?
                  $signed($unsigned((7'h44))) : wire101));
              reg123 <= {wire99[(2'h2):(1'h0)]};
              reg124 <= $unsigned($signed(({((8'hbb) - reg114)} ?
                  ((&reg108) && {wire103, (8'hb0)}) : {(wire105 ?
                          wire100 : wire110)})));
            end
          else
            begin
              reg120 <= wire105;
              reg121 <= reg120;
              reg122 <= (~^$unsigned({(!$signed(wire101)),
                  $unsigned($signed(reg115))}));
              reg123 <= {($unsigned($signed(reg106)) ? reg106 : reg115)};
              reg124 <= $unsigned(wire110[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg119 <= ((!{$signed((reg108 ? wire99 : reg114)),
                  $unsigned((reg121 ~^ reg107))}) ?
              $signed((reg120 >= reg114)) : $unsigned(($unsigned($unsigned(reg114)) ?
                  $unsigned(reg107[(3'h6):(3'h5)]) : ($unsigned(wire102) ?
                      (reg111 ? (8'hb2) : reg123) : (wire102 ^~ wire103)))));
          reg120 <= wire100[(4'h8):(3'h6)];
          reg121 <= (~^reg120[(4'ha):(2'h2)]);
          reg122 <= $unsigned($unsigned((((-wire103) ?
              (reg123 ? reg122 : (8'ha4)) : (reg106 ?
                  reg111 : (8'ha9))) - ($unsigned(wire100) ?
              (reg111 >>> reg122) : $signed(wire105)))));
        end
      if ((-reg122))
        begin
          reg125 <= ({(~$signed(wire110[(1'h0):(1'h0)]))} ^~ $unsigned(reg112[(3'h4):(1'h1)]));
          if ($signed(reg121[(3'h7):(1'h1)]))
            begin
              reg126 <= $unsigned(($unsigned(reg120[(2'h3):(2'h2)]) ?
                  (|(~&$signed(reg124))) : (^((wire100 - reg122) & wire102))));
              reg127 <= (wire102 ?
                  (reg121[(3'h6):(3'h5)] <<< reg113) : reg123[(2'h3):(1'h1)]);
              reg128 <= (-(8'hb6));
            end
          else
            begin
              reg126 <= reg116[(2'h2):(2'h2)];
              reg127 <= ($signed($unsigned(($signed(reg114) ?
                      reg124 : $unsigned(wire109)))) ?
                  reg125[(3'h5):(3'h4)] : $unsigned(wire104[(3'h7):(3'h7)]));
            end
        end
      else
        begin
          reg125 <= (|((~|reg128[(3'h6):(1'h0)]) == $signed(reg111[(2'h2):(1'h1)])));
        end
    end
endmodule

module module11
#(parameter param94 = (~^({(((7'h41) > (8'ha2)) ? ((8'hbd) ? (8'ha1) : (8'hba)) : ((8'hae) ? (7'h42) : (8'ha1)))} * ((~|{(8'ha4)}) && ((-(8'hb8)) | {(8'hb5)})))), 
parameter param95 = {param94, (param94 ? param94 : {(-(param94 ? param94 : param94)), {{param94, param94}, param94}})})
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire92;
  wire signed [(4'hf):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire62;
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire64,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire62,
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
  assign wire16 = ((wire12 >= (+(8'had))) ^ (^~{($signed(wire12) != (wire13 || wire14))}));
  assign wire17 = (~^((+(~$unsigned(wire12))) ?
                      (-((wire15 + wire12) ?
                          $signed(wire14) : {wire14,
                              wire16})) : $signed((~&(wire14 ^~ wire14)))));
  assign wire18 = $signed(((!wire14[(4'hb):(3'h7)]) ?
                      wire17[(2'h2):(1'h1)] : wire13));
  assign wire19 = wire18[(4'h9):(4'h9)];
  assign wire20 = (~wire12[(4'ha):(3'h4)]);
  always
    @(posedge clk) begin
      if (($signed(wire20) ^~ wire18))
        begin
          if ($signed({(((wire16 >>> wire19) ? (~^wire19) : $unsigned(wire12)) ?
                  ((wire14 ?
                      wire15 : wire15) ~^ wire16[(3'h5):(1'h1)]) : {(~|wire16)}),
              $signed(wire19[(4'ha):(1'h0)])}))
            begin
              reg21 <= wire12;
              reg22 <= wire12[(1'h0):(1'h0)];
              reg23 <= (wire12[(5'h12):(3'h7)] ?
                  (((~^{wire12}) ?
                      (wire20[(2'h3):(1'h0)] ?
                          (wire20 | reg22) : (~|reg22)) : (wire13[(1'h1):(1'h1)] ~^ wire13)) <<< ($signed($unsigned(wire20)) ?
                      {$signed(wire17),
                          (wire12 || wire13)} : (+(~|wire15)))) : wire14);
            end
          else
            begin
              reg21 <= $unsigned(({$unsigned($unsigned(wire17))} ?
                  reg23[(1'h1):(1'h1)] : $signed(wire17[(2'h2):(1'h1)])));
              reg22 <= ((~|{$unsigned((~^wire17)),
                  $signed(wire14[(1'h1):(1'h0)])}) & wire18[(4'hd):(3'h7)]);
              reg23 <= $signed(reg21[(3'h6):(3'h4)]);
            end
          reg24 <= $signed(($unsigned(reg22[(2'h2):(1'h1)]) ?
              wire14 : (wire20 ?
                  ($unsigned(wire15) ?
                      ((8'ha0) ?
                          reg23 : wire12) : wire17[(2'h2):(1'h1)]) : ($signed(wire13) ?
                      (wire16 <= reg23) : {(8'h9e), wire19}))));
          reg25 <= ($signed((wire19[(2'h2):(1'h0)] ?
                  {wire18[(3'h5):(3'h4)]} : ({wire17,
                      reg21} >= (wire18 <<< wire14)))) ?
              ({$signed(wire16[(2'h3):(2'h3)]), $unsigned($unsigned(reg24))} ?
                  reg21 : {reg21[(4'hb):(1'h1)],
                      (~^(reg23 ?
                          wire14 : wire13))}) : $signed(($unsigned((wire20 ?
                      wire17 : wire12)) ?
                  {wire12, $signed(reg24)} : $signed(wire13[(1'h0):(1'h0)]))));
          reg26 <= ((reg24 ^~ $unsigned(wire19[(2'h3):(2'h2)])) ?
              wire14[(2'h3):(1'h1)] : $signed(wire12[(5'h12):(4'hc)]));
          reg27 <= $unsigned($unsigned($unsigned($unsigned(reg23))));
        end
      else
        begin
          reg21 <= ($signed({({reg26, wire13} ? (+(8'ha7)) : (|reg24))}) ?
              {$unsigned($signed($unsigned(reg25)))} : (((((8'haf) ?
                  wire20 : wire15) && $unsigned(reg21)) >> (~|{reg21})) <<< wire15[(4'ha):(1'h1)]));
          reg22 <= (reg21[(2'h3):(1'h1)] || {$unsigned($signed($unsigned((7'h44)))),
              wire17[(2'h2):(1'h1)]});
        end
      reg28 <= ({{($signed(reg21) <= reg22)}} ?
          $unsigned((8'hb0)) : wire16[(2'h2):(1'h0)]);
      if (($signed((&{$unsigned(wire13), (wire14 ? (8'hbc) : reg24)})) ^ reg26))
        begin
          reg29 <= wire17[(3'h4):(2'h2)];
          reg30 <= $signed(({{(~|(8'h9c)),
                  {wire14, reg23}}} == reg24[(2'h2):(1'h0)]));
          reg31 <= (reg30 ?
              {$signed(reg30)} : $unsigned((wire19[(2'h2):(1'h1)] > $signed($unsigned(reg29)))));
        end
      else
        begin
          reg29 <= ($unsigned(wire15) || (&$unsigned((^~reg27))));
        end
      reg32 <= (+wire16);
      reg33 <= {$signed(reg31), $unsigned({(&{reg21})})};
    end
  module34 #() modinst63 (.y(wire62), .wire36(reg30), .wire37(reg22), .wire39(reg21), .clk(clk), .wire38(wire14), .wire35(reg32));
  assign wire64 = ((reg27[(2'h3):(1'h0)] ? (8'hb3) : reg31[(1'h0):(1'h0)]) ?
                      $unsigned(({$signed(reg27),
                          (reg29 ?
                              reg21 : (8'hac))} <<< $signed($unsigned(reg31)))) : wire14);
  module65 #() modinst90 (wire89, clk, wire16, reg32, wire18, reg31);
  assign wire91 = $unsigned($signed(reg28));
  assign wire92 = $unsigned(wire12);
  assign wire93 = wire62[(2'h2):(2'h2)];
endmodule

module module65
#(parameter param88 = (((((|(8'hac)) ? {(8'hb6)} : ((8'ha3) | (8'ha3))) ? {((8'h9d) ? (8'ha2) : (8'hb1)), (!(8'hb3))} : ((^(8'had)) >>> (8'hb7))) ? (|(((8'ha2) ? (8'hb9) : (8'hb9)) ? ((8'h9c) ? (8'hab) : (8'ha4)) : ((8'h9c) << (8'hb5)))) : (|(((8'ha1) << (8'h9c)) > (!(8'hae))))) ? (-((~^((8'hac) ? (8'hb7) : (8'h9e))) ? (~((8'hb0) || (8'ha6))) : (~((8'hbd) > (8'hbb))))) : (((((7'h43) ? (8'ha0) : (8'hbd)) & (~(7'h42))) ? (((8'had) ? (8'hb3) : (8'hae)) <= (-(8'ha1))) : (|((7'h44) ? (8'ha3) : (7'h42)))) * {(~(~^(8'hbc)))})))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire69;
  input wire signed [(4'ha):(1'h0)] wire68;
  input wire signed [(5'h12):(1'h0)] wire67;
  input wire signed [(4'ha):(1'h0)] wire66;
  wire signed [(4'ha):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(5'h14):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire70;
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire76,
                 wire75,
                 wire74,
                 wire71,
                 wire70,
                 reg79,
                 reg78,
                 reg77,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire70 = ((wire68 || (~(wire67 >> $signed(wire68)))) * wire67);
  assign wire71 = (wire70[(1'h1):(1'h0)] && $unsigned((($signed(wire67) ?
                          (wire68 ? wire67 : wire68) : {(8'ha3), wire67}) ?
                      ({wire67,
                          wire68} <<< {wire67}) : wire70[(3'h5):(3'h5)])));
  always
    @(posedge clk) begin
      reg72 <= {(&(|wire67)),
          (wire66[(1'h1):(1'h0)] ?
              wire71[(2'h3):(1'h1)] : wire68[(1'h1):(1'h0)])};
      reg73 <= wire66;
    end
  assign wire74 = wire66;
  assign wire75 = (-(-(((wire68 == reg73) ? (~^wire71) : (~|reg72)) ?
                      $signed((wire74 ?
                          wire66 : wire70)) : (^~$unsigned((7'h41))))));
  assign wire76 = (~$unsigned((+{(-wire67)})));
  always
    @(posedge clk) begin
      reg77 <= wire74;
      reg78 <= reg72[(2'h3):(2'h3)];
      reg79 <= $signed((((+{(8'hb8)}) == $signed(reg72[(3'h4):(2'h2)])) - ((reg72[(1'h1):(1'h1)] ?
              $signed(wire68) : (~|reg77)) ?
          (^~wire70) : ($unsigned(wire71) ?
              (wire70 ? reg77 : wire74) : (8'hbe)))));
    end
  assign wire80 = $signed(wire67);
  assign wire81 = (~$unsigned((wire67[(4'hd):(4'hc)] ?
                      wire71 : wire80[(3'h6):(2'h2)])));
  assign wire82 = (wire75 <= ((|(~^wire69[(2'h3):(1'h1)])) <= $signed(wire70)));
  assign wire83 = $signed((!$unsigned($signed((+wire75)))));
  assign wire84 = (wire68[(3'h5):(1'h1)] && wire67);
  assign wire85 = ({$signed(reg78)} ?
                      (~^$signed($signed($unsigned(wire83)))) : (~^(8'hb1)));
  assign wire86 = (((((wire66 < wire69) != $unsigned(wire74)) * (~^wire84)) ?
                      $signed(($signed(reg73) ?
                          $unsigned(wire76) : $signed(wire69))) : (reg79 ?
                          ($unsigned(wire76) <= wire68[(4'ha):(2'h3)]) : {wire75})) + (7'h44));
  assign wire87 = $signed((({(wire81 ? (8'ha7) : reg79)} ?
                          $signed((wire75 ~^ wire66)) : $signed(reg77[(1'h1):(1'h1)])) ?
                      $signed((+(~&(8'hb2)))) : $signed(wire80)));
endmodule

module module34
#(parameter param60 = {(((!((8'ha4) >>> (8'haf))) ? (~(8'ha1)) : {(|(8'h9f))}) || ((~|((8'hba) & (7'h40))) >>> (~|((8'hb2) ? (8'ha6) : (8'hb0))))), (-(~(&((8'h9c) ? (8'ha4) : (8'hbe)))))}, 
parameter param61 = (((((param60 ? param60 : (8'h9e)) ? param60 : {param60, param60}) ? {param60, param60} : (&param60)) ~^ (&(^~(|param60)))) ? param60 : param60))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire39;
  input wire [(4'ha):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  input wire [(2'h2):(1'h0)] wire36;
  input wire [(3'h6):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire40;
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire41,
                 wire40,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = $unsigned(($unsigned(wire39) ?
                      $unsigned((wire38[(3'h6):(3'h4)] >= (8'haa))) : (-(((8'hbd) * wire35) < (~^wire38)))));
  assign wire41 = ($unsigned(((&$signed(wire39)) - $unsigned(wire37))) ?
                      (wire39[(4'he):(4'hb)] * wire40[(3'h7):(2'h2)]) : (|$signed((7'h42))));
  always
    @(posedge clk) begin
      reg42 <= (^~{($signed((~|wire36)) ?
              $unsigned({wire39}) : $unsigned(((8'hb4) ? wire36 : wire41))),
          wire37[(2'h2):(2'h2)]});
      reg43 <= reg42[(1'h0):(1'h0)];
      reg44 <= $unsigned(($signed((8'h9d)) ?
          $unsigned((8'ha4)) : $signed((~^wire39[(2'h2):(1'h0)]))));
      reg45 <= wire35;
      reg46 <= (wire41[(1'h0):(1'h0)] ^~ wire41);
    end
  always
    @(posedge clk) begin
      reg47 <= $signed({$signed(wire40)});
      if (wire37)
        begin
          reg48 <= ((wire37 != wire41[(1'h1):(1'h1)]) ?
              (~^(+{(&wire38), $unsigned(reg44)})) : (reg47 ?
                  $signed((wire38[(1'h0):(1'h0)] ?
                      wire40 : (wire36 ?
                          wire35 : reg47))) : $signed($signed($unsigned(wire35)))));
          if (((-(reg46[(3'h7):(3'h5)] ?
              wire40 : $unsigned($unsigned(reg44)))) <<< $unsigned((wire41 >= wire39[(5'h13):(4'he)]))))
            begin
              reg49 <= (!$signed({(~{reg47}), $signed((|wire37))}));
            end
          else
            begin
              reg49 <= reg49;
              reg50 <= $signed($unsigned(wire35[(2'h2):(1'h0)]));
            end
          if ({$unsigned($signed((-reg45[(3'h7):(2'h3)])))})
            begin
              reg51 <= $signed((((~^$signed(wire38)) ~^ (^$unsigned(reg43))) >> $unsigned(reg48)));
              reg52 <= $unsigned($unsigned(wire38));
              reg53 <= reg50[(2'h3):(2'h3)];
            end
          else
            begin
              reg51 <= ($unsigned($signed(wire35)) & $unsigned($unsigned((reg51 ?
                  (wire41 ? reg45 : reg49) : (wire36 << wire35)))));
            end
          reg54 <= reg42[(3'h5):(3'h5)];
        end
      else
        begin
          reg48 <= ({(reg43 ?
                  $unsigned($signed(reg51)) : ($signed(reg52) ?
                      (reg52 ? reg48 : reg49) : (&wire35))),
              $signed(reg49[(2'h3):(2'h2)])} - (($signed((~&wire40)) || ((^~reg49) ?
                  (wire39 ? reg53 : reg50) : (reg45 << reg52))) ?
              wire38[(3'h5):(1'h1)] : wire41[(4'hb):(4'h9)]));
          if (wire40)
            begin
              reg49 <= reg42[(2'h3):(1'h0)];
              reg50 <= $signed($unsigned($signed($unsigned((~^reg48)))));
              reg51 <= $signed(reg43);
              reg52 <= (wire39 ^ (reg52 ^~ reg52));
            end
          else
            begin
              reg49 <= (reg51[(2'h2):(1'h0)] < reg42[(3'h6):(3'h4)]);
              reg50 <= wire40[(4'h9):(3'h4)];
            end
        end
      reg55 <= (-(~&reg45));
    end
  always
    @(posedge clk) begin
      reg56 <= $unsigned((reg47[(4'h8):(1'h0)] ?
          {{(wire40 ? reg54 : reg47)}} : reg55));
      reg57 <= ((~^$signed(((&(8'ha6)) ?
          wire39 : $signed(reg54)))) * $signed($signed((!(wire40 >> reg51)))));
    end
  assign wire58 = {reg54[(1'h1):(1'h1)]};
  assign wire59 = $signed(wire36);
endmodule

module module155
#(parameter param166 = ((+((~^((8'hb6) ? (8'ha6) : (8'haf))) ? (((8'hb0) ~^ (7'h44)) <= {(8'ha7)}) : ((^(8'hae)) < ((8'had) ? (8'hab) : (8'ha3))))) | {(+({(8'ha0)} + ((7'h44) - (8'hab)))), ((&((8'h9c) ? (8'hbc) : (8'ha3))) ? (^~((8'ha1) | (8'hb8))) : (((8'hb6) && (8'ha7)) ^ ((8'haf) >> (8'hbd))))}))
(y, clk, wire160, wire159, wire158, wire157, wire156);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire160;
  input wire signed [(4'hc):(1'h0)] wire159;
  input wire signed [(4'he):(1'h0)] wire158;
  input wire [(4'hf):(1'h0)] wire157;
  input wire [(4'hb):(1'h0)] wire156;
  wire [(4'he):(1'h0)] wire165;
  wire [(4'he):(1'h0)] wire163;
  wire [(3'h6):(1'h0)] wire162;
  wire signed [(2'h2):(1'h0)] wire161;
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  assign y = {wire165, wire163, wire162, wire161, reg164, (1'h0)};
  assign wire161 = wire159[(4'hb):(3'h6)];
  assign wire162 = wire157;
  assign wire163 = $unsigned(((~$signed(wire157)) >> $unsigned($unsigned(wire158[(3'h5):(2'h2)]))));
  always
    @(posedge clk) begin
      reg164 <= wire163[(4'h8):(2'h2)];
    end
  assign wire165 = reg164[(2'h3):(1'h1)];
endmodule
