module top
#(parameter param207 = (((({(8'had), (8'hb8)} <<< ((8'h9f) ? (8'ha1) : (8'hba))) ? (((8'ha8) < (7'h41)) ? ((7'h42) + (8'ha7)) : (~|(8'ha9))) : ((^~(8'hbb)) << (+(8'ha5)))) ~^ (((^~(8'hbf)) ? (~&(8'hb2)) : {(8'h9c), (8'ha7)}) ? (~|((8'ha8) ? (8'hbb) : (8'h9c))) : ((+(8'ha7)) ? {(7'h44), (8'haa)} : (^(8'h9e))))) * ((((~&(8'ha6)) ? (~(8'hbf)) : ((7'h44) & (8'hb4))) ? (~(~&(8'hbf))) : (8'ha0)) ? (((~^(8'haa)) && ((8'h9d) ? (8'ha3) : (8'ha1))) > (((8'ha6) > (8'ha4)) < (^(8'haa)))) : ({((8'hb6) >= (8'ha0)), ((8'hb9) ? (8'hb0) : (8'ha3))} ? (((8'ha0) ? (8'ha5) : (8'hbd)) > ((8'hb2) ? (8'had) : (8'hba))) : (^~((8'hac) * (8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h14e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire205;
  wire [(3'h4):(1'h0)] wire204;
  wire [(4'hc):(1'h0)] wire203;
  wire signed [(4'hf):(1'h0)] wire200;
  wire signed [(3'h4):(1'h0)] wire199;
  wire signed [(3'h5):(1'h0)] wire198;
  wire [(2'h2):(1'h0)] wire197;
  wire [(5'h15):(1'h0)] wire196;
  wire [(4'h8):(1'h0)] wire195;
  wire signed [(5'h14):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire190;
  wire signed [(5'h12):(1'h0)] wire192;
  wire signed [(3'h4):(1'h0)] wire193;
  reg signed [(5'h15):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg201 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  assign y = {wire205,
                 wire204,
                 wire203,
                 wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire61,
                 wire13,
                 wire12,
                 wire11,
                 wire4,
                 wire190,
                 wire192,
                 wire193,
                 reg202,
                 reg201,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 (1'h0)};
  assign wire4 = (|((&(^(wire1 ? (8'ha3) : wire3))) ?
                     (^($signed(wire1) - wire0[(4'h8):(3'h4)])) : $signed(wire0)));
  always
    @(posedge clk) begin
      reg5 <= (~&$unsigned(((wire4 ?
          ((8'hb0) * wire0) : (~wire0)) << $unsigned(wire4[(2'h2):(1'h0)]))));
      if (wire0[(2'h2):(1'h1)])
        begin
          reg6 <= (wire4 >> (^~(!wire0[(2'h2):(2'h2)])));
          reg7 <= wire3;
        end
      else
        begin
          if (wire4)
            begin
              reg6 <= $unsigned((reg6[(4'hb):(2'h2)] ?
                  wire2[(1'h1):(1'h0)] : ((8'hb4) & $signed(wire1))));
            end
          else
            begin
              reg6 <= {($signed(reg5) ?
                      wire0[(4'h8):(4'h8)] : $signed((+(reg7 ~^ reg6)))),
                  reg6};
              reg7 <= reg7[(4'hd):(4'h9)];
              reg8 <= (-wire2);
              reg9 <= (+(-(reg8 ^ reg8[(4'h9):(3'h5)])));
              reg10 <= {(^reg9), reg8};
            end
        end
    end
  assign wire11 = {wire3};
  assign wire12 = ($unsigned((($unsigned(reg7) ?
                      $unsigned(reg6) : wire11) << ($signed((8'hbe)) > (-reg7)))) <<< $unsigned($unsigned(wire0)));
  assign wire13 = ($unsigned(reg5[(1'h1):(1'h0)]) && {$signed((|$signed(wire12))),
                      {$unsigned($unsigned(wire3))}});
  module14 #() modinst62 (wire61, clk, wire3, wire11, reg5, wire13);
  module63 #() modinst191 (.clk(clk), .wire65(wire61), .wire67(reg10), .wire68(wire12), .y(wire190), .wire66(wire11), .wire64(wire3));
  assign wire192 = (~|wire13);
  module137 #() modinst194 (wire193, clk, wire11, wire3, reg9, wire2);
  assign wire195 = (!(!(((~^reg8) ? (~wire61) : (7'h44)) ?
                       (((8'ha1) ~^ wire0) ?
                           $signed(wire61) : reg9[(3'h7):(1'h0)]) : wire12)));
  assign wire196 = $signed(({{(wire4 ? reg6 : wire192)}} ~^ wire12));
  assign wire197 = (^$signed((+((7'h42) ^ wire190))));
  assign wire198 = (+(wire195 | (~(wire61 ? wire4 : wire195))));
  assign wire199 = wire192[(3'h4):(3'h4)];
  assign wire200 = wire4;
  always
    @(posedge clk) begin
      reg201 <= $signed($unsigned((!reg7)));
      reg202 <= (wire11[(4'he):(3'h6)] ?
          (~|$unsigned($signed((wire11 != wire4)))) : (~&(($unsigned(wire2) ?
              (^wire13) : wire1) + (wire61 ?
              $unsigned((7'h43)) : reg7[(3'h6):(1'h1)]))));
    end
  assign wire203 = reg10;
  assign wire204 = wire2[(1'h1):(1'h1)];
  module77 #() modinst206 (wire205, clk, wire200, wire2, wire0, wire1);
endmodule

module module63
#(parameter param188 = ((((((8'hb1) ? (8'ha3) : (8'h9f)) >>> ((8'ha2) ? (8'hac) : (8'hb6))) ? (!((8'hab) ? (8'ha8) : (8'h9c))) : (((8'hb0) == (8'h9f)) ~^ ((8'hbf) * (8'hae)))) <<< ((((8'ha4) && (8'hb5)) ? (!(7'h44)) : {(8'ha8)}) ? ({(8'ha6), (8'hbd)} == {(8'hbe), (8'hba)}) : (+((7'h41) - (8'ha6))))) ? {((!((8'haa) >>> (8'hbb))) ? {(~&(8'h9d)), (!(8'hb9))} : {(+(7'h40)), {(8'ha5)}}), ({(^~(8'ha4))} != (((8'hb0) ~^ (8'hbb)) == ((8'hb3) ? (8'hbb) : (8'hbb))))} : {(^~((~&(8'hae)) ? ((8'hbd) > (8'haf)) : {(8'ha7)}))}), 
parameter param189 = {param188})
(y, clk, wire68, wire67, wire66, wire65, wire64);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire68;
  input wire signed [(4'h8):(1'h0)] wire67;
  input wire signed [(4'hc):(1'h0)] wire66;
  input wire signed [(5'h14):(1'h0)] wire65;
  input wire [(4'hf):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire187;
  wire [(4'he):(1'h0)] wire186;
  wire [(4'hd):(1'h0)] wire181;
  wire [(4'ha):(1'h0)] wire179;
  wire [(4'he):(1'h0)] wire136;
  wire [(4'hc):(1'h0)] wire135;
  wire [(4'h8):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire133;
  wire [(5'h12):(1'h0)] wire131;
  wire signed [(2'h2):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire [(4'he):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire69;
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg184 = (1'h0);
  reg [(5'h14):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg182 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire181,
                 wire179,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 (1'h0)};
  assign wire69 = (wire65[(3'h7):(1'h0)] * wire68[(4'he):(4'hc)]);
  assign wire70 = $signed(wire67);
  assign wire71 = {((!wire66[(4'h8):(3'h5)]) <= wire65),
                      (wire64[(4'hb):(1'h0)] && (((-wire68) ?
                          (wire69 ?
                              wire66 : wire65) : $unsigned((8'haa))) - $signed($signed(wire67))))};
  assign wire72 = (wire71 ? ((|(~wire70)) ^~ wire67[(1'h1):(1'h0)]) : wire67);
  assign wire73 = $signed((&$unsigned({$unsigned((8'ha0))})));
  assign wire74 = wire72[(3'h4):(2'h2)];
  assign wire75 = (wire64 ?
                      ((&$signed(wire67[(1'h0):(1'h0)])) ?
                          ($signed((wire66 > wire66)) < wire72) : (~|wire71)) : $signed($unsigned((-{wire69}))));
  assign wire76 = {wire67,
                      (wire64 <<< $unsigned(((wire67 ? wire71 : wire67) ?
                          $unsigned(wire75) : $unsigned(wire64))))};
  module77 #() modinst132 (wire131, clk, wire69, wire67, wire65, wire68);
  assign wire133 = (($signed({$unsigned(wire64),
                       $unsigned(wire74)}) >= $signed(({(8'h9e),
                       (8'hae)} + {wire68,
                       wire68}))) && $signed($unsigned(wire73[(2'h3):(2'h3)])));
  assign wire134 = wire64;
  assign wire135 = {(wire68 ?
                           $unsigned(($signed(wire70) | (+(8'h9d)))) : (8'hb5)),
                       $unsigned(wire67[(3'h4):(2'h2)])};
  assign wire136 = (wire64[(4'he):(3'h6)] >>> ($signed(wire69) ?
                       wire71 : ((wire71[(1'h1):(1'h1)] ?
                               $unsigned(wire66) : (wire68 ?
                                   (8'hab) : wire73)) ?
                           $unsigned((wire72 ~^ wire76)) : {$signed(wire131)})));
  module137 #() modinst180 (wire179, clk, wire70, wire66, wire64, wire73);
  assign wire181 = $signed(((~&{(wire74 ? wire69 : wire67),
                           ((8'ha0) ? wire69 : wire135)}) ?
                       $signed(($signed(wire66) != (!wire65))) : $unsigned(wire68[(4'he):(4'ha)])));
  always
    @(posedge clk) begin
      if ((~|(+wire135[(4'h9):(1'h0)])))
        begin
          reg182 <= {$unsigned(wire71[(1'h0):(1'h0)])};
          reg183 <= (&(^(7'h43)));
          if ((+wire181))
            begin
              reg184 <= {wire65[(1'h0):(1'h0)]};
            end
          else
            begin
              reg184 <= wire135[(3'h5):(3'h5)];
            end
          reg185 <= reg183;
        end
      else
        begin
          if (((wire64 + wire134[(3'h5):(2'h2)]) | (!$signed(((~&wire66) ?
              (8'hb5) : wire70[(4'h9):(3'h4)])))))
            begin
              reg182 <= (8'hb8);
              reg183 <= {wire71[(1'h0):(1'h0)]};
            end
          else
            begin
              reg182 <= wire179;
            end
          reg184 <= ((~&(wire133[(4'h8):(3'h5)] || (~$unsigned(wire65)))) ?
              (($signed((reg182 ? (8'h9c) : reg184)) & ((|reg184) != wire133)) ?
                  wire69[(4'h9):(1'h1)] : wire72) : {{(((8'hbd) ?
                          reg184 : reg184) * (wire131 ? wire76 : wire64))},
                  (&(((8'hab) ? (8'hbd) : wire64) ?
                      $unsigned(wire134) : (7'h44)))});
          reg185 <= (8'hb7);
        end
    end
  assign wire186 = (!reg183);
  assign wire187 = ($unsigned($signed((~&(wire76 | wire65)))) << reg183);
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(5'h15):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire53,
                 wire52,
                 wire50,
                 wire26,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg24,
                 (1'h0)};
  assign wire19 = ((wire16[(1'h0):(1'h0)] + wire15[(3'h4):(2'h3)]) ?
                      ({$signed(wire18)} ?
                          $signed(({wire16} ?
                              $unsigned(wire18) : $signed(wire17))) : $signed((!wire18))) : (|$unsigned($unsigned(wire15))));
  assign wire20 = (8'hb6);
  assign wire21 = wire15[(3'h4):(1'h1)];
  assign wire22 = $signed(($unsigned(wire20) | $unsigned($signed((wire16 ?
                      wire17 : (8'hba))))));
  assign wire23 = ($unsigned((+wire22[(3'h7):(1'h1)])) ?
                      {wire16} : {$unsigned(wire21[(3'h7):(3'h4)])});
  always
    @(posedge clk) begin
      reg24 <= (~^$unsigned($signed((^wire18[(1'h0):(1'h0)]))));
    end
  assign wire25 = $signed($unsigned(wire23));
  assign wire26 = $signed((wire21[(5'h13):(4'hb)] - ($unsigned((wire17 ?
                          reg24 : wire16)) ?
                      {$unsigned((8'hb4))} : (^wire25))));
  module27 #() modinst51 (wire50, clk, wire19, wire26, wire22, wire25);
  assign wire52 = $unsigned((wire17[(3'h7):(3'h4)] ?
                      ($unsigned($signed((7'h41))) ?
                          ($signed(wire18) ?
                              (wire19 ?
                                  (8'h9c) : reg24) : wire20) : wire19[(4'hb):(3'h6)]) : $unsigned($signed((~|(8'hbf))))));
  assign wire53 = wire23[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg54 <= (8'h9c);
      reg55 <= (({($signed(wire25) - wire19)} > $unsigned(wire15[(3'h4):(3'h4)])) ?
          $unsigned({(wire18 ^~ (wire19 > wire19))}) : wire19[(5'h14):(4'he)]);
      reg56 <= (~(reg55[(4'hc):(4'ha)] ?
          ((|(wire16 + (8'hb5))) ?
              ((wire53 == reg55) ?
                  $signed(wire50) : {wire21,
                      reg54}) : wire26[(2'h3):(1'h0)]) : (~|wire22[(4'h9):(4'h8)])));
      reg57 <= (&((~&($signed(wire23) && (+(8'had)))) | (|wire15[(2'h2):(1'h1)])));
    end
  assign wire58 = (((~&{wire17}) ^~ $signed($unsigned(wire26[(5'h12):(3'h4)]))) ?
                      ($signed(((~^(7'h40)) ? wire26 : $signed(wire22))) ?
                          (8'hba) : ({(wire16 ? reg55 : wire16), {wire22}} ?
                              $unsigned((wire23 > wire16)) : ({wire50} ?
                                  (wire22 ? reg57 : wire22) : (reg56 ?
                                      wire25 : wire16)))) : (wire25 ?
                          $signed($unsigned(((8'hb7) ?
                              wire23 : wire20))) : ($signed((wire16 ?
                                  wire19 : wire19)) ?
                              (^$signed(wire20)) : $signed($signed((8'ha5))))));
  assign wire59 = wire16;
  assign wire60 = $signed(((|($unsigned((8'h9f)) ^ (+wire18))) - reg57[(2'h2):(1'h1)]));
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire30;
  input wire [(2'h2):(1'h0)] wire29;
  input wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(5'h10):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire32,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire32 = {wire31};
  assign wire33 = $unsigned($unsigned(wire30));
  always
    @(posedge clk) begin
      reg34 <= ($unsigned(($signed($signed(wire28)) ?
          ($unsigned(wire31) >= (-(8'hb9))) : {wire32})) != (^{{wire28[(4'hd):(4'h8)],
              $unsigned(wire33)}}));
      reg35 <= $signed(wire31);
      reg36 <= {{$unsigned(((wire30 ? (8'h9c) : (8'ha8)) ?
                  $unsigned(wire32) : wire33[(4'hc):(1'h0)])),
              $signed(reg34)}};
    end
  assign wire37 = reg36;
  assign wire38 = (!$unsigned(wire37));
  assign wire39 = (-(^{$signed((^reg35)), ($unsigned(wire32) <<< (7'h42))}));
  assign wire40 = $signed(reg34);
  assign wire41 = {((~|((reg35 ? wire40 : wire37) ^ (&reg35))) ?
                          ((^(wire29 <= wire33)) && (~|$unsigned((8'ha8)))) : $signed(reg35))};
  assign wire42 = wire30[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      reg43 <= wire38;
      reg44 <= $unsigned(($unsigned((~{reg36, (8'ha7)})) <<< wire28));
      reg45 <= (~&((+(wire41 ?
          (~^reg44) : $unsigned(reg36))) ^~ $unsigned((reg44 ~^ (~wire37)))));
      reg46 <= wire31[(4'h8):(4'h8)];
    end
  assign wire47 = reg36[(3'h7):(3'h5)];
  assign wire48 = $signed((-(+wire39)));
  assign wire49 = reg45[(2'h3):(1'h0)];
endmodule

module module137
#(parameter param177 = ((!((-((8'ha0) ? (8'ha3) : (8'hb5))) ? (((8'h9f) << (7'h42)) ? (~^(8'h9e)) : ((7'h43) ? (8'h9d) : (8'hb5))) : ({(8'had), (8'hb0)} >>> {(8'hbe)}))) ? ((((+(8'ha2)) ? ((8'hbc) >= (7'h41)) : (8'hb9)) ? (((8'ha9) > (8'h9c)) ? ((8'h9d) ? (8'ha3) : (8'hbc)) : ((8'hbf) << (8'ha3))) : (((8'ha2) ? (8'ha1) : (8'hae)) ^ ((7'h41) >> (8'h9c)))) ^ ((((8'h9f) ? (8'ha3) : (8'hb0)) * ((8'hb5) ? (7'h44) : (7'h44))) < ({(8'hbf), (8'hbc)} ^ ((8'hb0) ? (7'h41) : (8'ha2))))) : (((7'h40) + (((8'hbb) < (8'hb6)) >>> (~(8'hbc)))) | ((8'ha1) ? (+((8'hb5) < (8'hab))) : ((7'h42) ? ((8'hbf) ? (8'hab) : (7'h40)) : (&(8'hb8)))))), 
parameter param178 = (param177 >> (param177 <<< (~&(param177 < (~param177))))))
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire141;
  input wire signed [(2'h3):(1'h0)] wire140;
  input wire [(4'hc):(1'h0)] wire139;
  input wire signed [(5'h15):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire176;
  wire signed [(5'h15):(1'h0)] wire175;
  wire signed [(4'h9):(1'h0)] wire174;
  wire [(4'hf):(1'h0)] wire173;
  wire signed [(5'h12):(1'h0)] wire172;
  wire signed [(5'h13):(1'h0)] wire171;
  wire [(4'hd):(1'h0)] wire170;
  wire signed [(3'h5):(1'h0)] wire157;
  wire signed [(2'h3):(1'h0)] wire156;
  wire [(5'h13):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire143;
  wire signed [(3'h5):(1'h0)] wire142;
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(4'hf):(1'h0)] reg167 = (1'h0);
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(5'h15):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg161 = (1'h0);
  reg signed [(4'he):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire157,
                 wire156,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 (1'h0)};
  assign wire142 = $signed($signed(($signed(wire139) == $signed({wire141}))));
  assign wire143 = (~&$signed({wire138[(1'h0):(1'h0)]}));
  assign wire144 = ($unsigned(wire140[(1'h0):(1'h0)]) ?
                       (8'ha3) : $unsigned(wire139));
  assign wire145 = {(wire139 ?
                           $unsigned(wire139) : (^~$unsigned((wire141 ?
                               wire139 : wire141))))};
  always
    @(posedge clk) begin
      if ((8'ha2))
        begin
          if (wire139)
            begin
              reg146 <= ({(|$signed(wire140[(1'h1):(1'h0)]))} ?
                  wire143[(1'h1):(1'h1)] : (!$signed((-$signed(wire144)))));
              reg147 <= ((8'hba) <<< ({wire144, wire143} ?
                  ($signed((wire139 <= wire143)) | ((wire145 ?
                      wire144 : reg146) && {wire143,
                      wire141})) : $unsigned(wire143[(4'hb):(2'h3)])));
            end
          else
            begin
              reg146 <= ({wire144[(5'h13):(4'ha)],
                  ((wire143[(4'h9):(4'h8)] > {wire141}) | wire139[(4'h9):(4'h9)])} <<< $signed(wire142));
              reg147 <= $unsigned($signed($unsigned(reg146[(5'h14):(5'h13)])));
              reg148 <= wire144;
              reg149 <= $signed($unsigned(wire144[(5'h10):(2'h3)]));
            end
          if ({wire139[(1'h1):(1'h1)]})
            begin
              reg150 <= ((reg146[(2'h3):(2'h3)] || ((((8'h9e) ^ wire138) <= (^~wire145)) >= reg149)) ^~ wire139[(1'h1):(1'h0)]);
              reg151 <= (((($unsigned((8'ha7)) * (wire139 - wire144)) ?
                          $unsigned((reg147 ? reg146 : wire139)) : wire138) ?
                      {({reg147} ? (|wire141) : wire139)} : reg150) ?
                  $signed($unsigned(wire139)) : (^~(wire141[(1'h0):(1'h0)] & ((&wire141) ?
                      wire138[(1'h1):(1'h0)] : {wire143, wire138}))));
              reg152 <= {(~(~^reg148))};
              reg153 <= reg150[(1'h0):(1'h0)];
            end
          else
            begin
              reg150 <= wire142[(2'h3):(1'h0)];
              reg151 <= reg146[(4'ha):(2'h2)];
              reg152 <= reg153[(4'hc):(3'h7)];
              reg153 <= reg149[(4'ha):(4'h8)];
            end
          reg154 <= {$unsigned($signed((+wire142[(3'h5):(3'h5)]))),
              $unsigned($unsigned($signed(reg152[(2'h3):(1'h0)])))};
        end
      else
        begin
          reg146 <= wire139[(2'h3):(1'h1)];
          reg147 <= (wire140[(1'h1):(1'h1)] > wire145[(4'hb):(3'h5)]);
          reg148 <= reg150;
          if (reg150)
            begin
              reg149 <= reg148[(3'h5):(2'h2)];
            end
          else
            begin
              reg149 <= (&$unsigned($unsigned(((wire141 <<< wire138) ?
                  (8'hba) : wire143[(1'h0):(1'h0)]))));
              reg150 <= reg152;
              reg151 <= ($signed(wire138[(5'h10):(4'hd)]) <= wire145[(2'h2):(1'h1)]);
            end
        end
      reg155 <= ((~^reg148) & (|$signed({(~&(8'hb6))})));
    end
  assign wire156 = reg146[(2'h3):(2'h2)];
  assign wire157 = ((~$unsigned(($signed(wire143) | {wire140}))) ?
                       $signed(($unsigned($unsigned(reg150)) == $unsigned($signed(wire138)))) : wire140);
  always
    @(posedge clk) begin
      if ($signed((wire144 ^~ $signed(($signed(reg148) || (^~wire157))))))
        begin
          reg158 <= wire156[(2'h3):(2'h3)];
          if ($signed($signed((~|((&reg154) * (wire142 ? reg153 : wire144))))))
            begin
              reg159 <= (-$signed(((8'ha5) ?
                  ($unsigned(reg153) ?
                      {(8'ha9),
                          wire138} : $signed(reg150)) : (&wire140[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg159 <= wire138;
              reg160 <= (reg158[(2'h2):(1'h0)] ?
                  (!((-(|(8'ha4))) ?
                      (8'hb7) : (reg150 ?
                          $unsigned(reg154) : $signed(wire145)))) : $signed((reg159[(3'h4):(1'h1)] ^~ $unsigned($signed(reg154)))));
              reg161 <= $signed((^~$signed((-$signed((7'h40))))));
            end
          reg162 <= ($signed($signed($unsigned(reg158[(1'h0):(1'h0)]))) >>> ({(~$signed(reg154)),
                  ((8'h9c) ~^ (^wire145))} ?
              (((wire143 ? wire139 : wire145) >> (reg149 ? (8'hb6) : wire139)) ?
                  wire141[(4'ha):(3'h7)] : $unsigned($unsigned(reg153))) : wire142[(2'h3):(2'h3)]));
          reg163 <= ((^~(&((wire142 ^ reg161) ?
                  wire145 : wire142[(1'h1):(1'h0)]))) ?
              $signed(((~^(~|(8'had))) ?
                  $signed(((8'hb1) << wire143)) : $signed(reg150))) : (!{(!wire144[(5'h11):(4'hf)])}));
        end
      else
        begin
          reg158 <= wire141;
          reg159 <= wire144[(4'h9):(4'h9)];
          if (({{(~(~|wire144))}, {reg160, (~(8'ha3))}} <<< ($signed(reg163) ?
              $signed(reg160[(3'h6):(3'h6)]) : (-reg152[(3'h7):(3'h4)]))))
            begin
              reg160 <= (($unsigned(wire140) ?
                      (($unsigned(wire142) ?
                              $unsigned(reg146) : $signed((8'ha5))) ?
                          {(8'ha9),
                              ((8'h9c) ~^ reg153)} : (((7'h44) >> wire140) ?
                              (~reg163) : {wire138})) : {(~&reg153[(2'h3):(1'h0)]),
                          wire144}) ?
                  ((wire157[(3'h4):(2'h2)] >> wire145[(3'h5):(1'h0)]) <<< reg153[(4'h8):(3'h4)]) : $signed($unsigned(reg158[(2'h2):(1'h0)])));
            end
          else
            begin
              reg160 <= reg162;
              reg161 <= reg158[(2'h2):(1'h1)];
              reg162 <= reg148[(3'h5):(2'h3)];
              reg163 <= $signed($unsigned({reg155}));
            end
          reg164 <= (^~{$unsigned(reg163[(4'hb):(2'h3)])});
          reg165 <= $signed(wire141);
        end
      reg166 <= (+$unsigned((wire139[(3'h7):(3'h6)] ~^ ($signed(reg146) ^~ $unsigned(wire140)))));
      reg167 <= $signed((~{(reg147 ? (^~reg160) : (reg166 ? reg163 : reg150)),
          (&(~&(8'ha2)))}));
      reg168 <= ($signed($signed($unsigned({reg163}))) ^ {$signed(($signed(wire140) * (reg162 ?
              reg167 : reg162)))});
      reg169 <= wire142[(2'h3):(1'h0)];
    end
  assign wire170 = (~$signed($signed($signed(reg147[(4'h8):(3'h7)]))));
  assign wire171 = (($signed(wire170) ^ reg146[(4'hc):(4'h9)]) ?
                       wire139[(4'hc):(4'h9)] : ($unsigned((+$unsigned(reg154))) ?
                           reg161 : $signed(((reg155 & reg146) > reg166))));
  assign wire172 = wire156;
  assign wire173 = (({(~(8'hbf)), $signed(wire145[(4'h9):(3'h7)])} ?
                       reg153 : (~&(8'had))) == (reg153[(4'hd):(1'h1)] * reg153));
  assign wire174 = (-reg152[(3'h5):(1'h0)]);
  assign wire175 = (reg165[(2'h2):(2'h2)] ?
                       $unsigned((^~((reg160 ~^ (8'had)) >>> (~&wire174)))) : (^(8'hac)));
  assign wire176 = $unsigned((^~wire174));
endmodule

module module77
#(parameter param130 = ((-(+(8'hba))) | (((((8'hb1) > (8'had)) ? ((8'hb7) ? (8'hb3) : (8'hb8)) : ((8'ha5) < (8'hbc))) >>> ((~(8'hb7)) ? ((8'h9e) & (8'hb4)) : (-(8'hbe)))) ? ((((8'hba) == (8'hb5)) <= ((8'ha9) ? (8'hb5) : (8'hb0))) <= (((8'hbd) == (8'ha1)) - ((7'h42) ? (7'h41) : (8'ha3)))) : ((((8'ha4) < (8'hbe)) ^~ (^~(8'ha7))) != (((8'hb5) ? (8'hb4) : (8'hb2)) ? ((8'hab) ? (8'hb2) : (8'hb2)) : ((8'hbc) ? (8'hbc) : (8'ha0)))))))
(y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h27e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire81;
  input wire signed [(2'h3):(1'h0)] wire80;
  input wire signed [(5'h14):(1'h0)] wire79;
  input wire [(3'h5):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  wire signed [(4'hd):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire86;
  wire [(3'h6):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(4'h9):(1'h0)] reg119 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(3'h4):(1'h0)] reg117 = (1'h0);
  reg [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(4'hd):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(5'h10):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg95 = (1'h0);
  reg [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire113,
                 wire112,
                 wire111,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg129,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
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
                 (1'h0)};
  assign wire82 = {$unsigned(wire79),
                      (($unsigned((~&wire81)) ?
                              (~|(wire80 ^ wire78)) : {$unsigned(wire79)}) ?
                          wire80[(1'h1):(1'h0)] : (wire78 ?
                              $unsigned((wire81 >>> wire79)) : $signed((7'h40))))};
  assign wire83 = {((({wire78, wire81} ^~ $unsigned(wire80)) ?
                          wire78 : (wire81[(4'hc):(2'h3)] ?
                              $unsigned(wire81) : (wire79 >= wire80))) > ((~(wire80 ^~ (8'ha2))) ?
                          wire82 : $unsigned((~&wire79)))),
                      wire82[(4'ha):(4'ha)]};
  assign wire84 = ($signed(wire81) ?
                      (8'hab) : ((8'hb9) <<< $signed(wire79[(4'hb):(2'h2)])));
  assign wire85 = (^$unsigned($unsigned((wire78[(1'h1):(1'h0)] && (wire84 & wire83)))));
  assign wire86 = ($unsigned(wire81[(4'h8):(1'h1)]) >> ($signed(wire80[(1'h0):(1'h0)]) >> (&wire85[(1'h1):(1'h0)])));
  assign wire87 = (7'h44);
  assign wire88 = wire87[(2'h2):(2'h2)];
  assign wire89 = wire80;
  assign wire90 = ((wire80 ~^ $signed($unsigned({wire82}))) ?
                      ((!wire89) ?
                          ((+wire81) << ((wire83 ?
                              wire82 : wire88) > $signed(wire80))) : $signed({$unsigned(wire84)})) : ((8'hb3) ?
                          (8'haf) : $unsigned((~$unsigned((8'hab))))));
  always
    @(posedge clk) begin
      reg91 <= $unsigned((^~($unsigned((wire83 ? wire88 : wire89)) ?
          (&(-wire88)) : {(wire82 ? wire87 : wire78)})));
      reg92 <= reg91;
      reg93 <= (^$unsigned((~((wire89 * wire88) ^ {wire90}))));
      if ((8'hbb))
        begin
          reg94 <= wire80;
          if ({(wire83[(2'h2):(1'h0)] != $signed(($unsigned(wire86) ?
                  $signed(wire86) : reg93))),
              reg92})
            begin
              reg95 <= $signed($unsigned($signed((reg92[(2'h2):(1'h0)] | (8'had)))));
              reg96 <= wire87[(1'h0):(1'h0)];
            end
          else
            begin
              reg95 <= reg96[(1'h0):(1'h0)];
              reg96 <= reg96;
              reg97 <= wire87[(1'h1):(1'h1)];
              reg98 <= $signed((wire87 && (reg96 ? {{reg97}} : wire84)));
              reg99 <= (((~$unsigned({reg98,
                      wire82})) && ((^wire88) ^~ {(^~wire79)})) ?
                  ((($signed(wire86) ? reg98 : $signed(reg97)) | (wire78 ?
                          reg98[(4'ha):(2'h2)] : $signed(wire79))) ?
                      {$unsigned({reg91, wire80}),
                          ({reg91, wire84} ?
                              $unsigned(reg96) : $unsigned((7'h43)))} : (^~$unsigned($unsigned(reg96)))) : ({reg96,
                      wire88[(4'he):(4'hc)]} <<< ((~^$signed(wire81)) ?
                      (8'hb0) : (&reg95[(4'ha):(1'h1)]))));
            end
          reg100 <= $unsigned((reg95[(3'h5):(1'h0)] ?
              reg94 : (~{{wire81, wire86}, (wire81 >>> reg97)})));
          if ($unsigned($unsigned({reg94})))
            begin
              reg101 <= (&(!$unsigned(reg100)));
              reg102 <= ($signed($signed(wire80)) + wire89);
            end
          else
            begin
              reg101 <= reg96;
              reg102 <= ((({((7'h44) ?
                          reg98 : reg91)} ^~ reg99) >>> reg91[(5'h12):(4'hb)]) ?
                  $signed($unsigned((reg98 ?
                      ((8'hb1) >>> wire83) : wire87))) : reg101[(4'h8):(3'h7)]);
            end
          reg103 <= reg96[(2'h2):(1'h1)];
        end
      else
        begin
          if (reg100[(4'hc):(4'hc)])
            begin
              reg94 <= (!wire84[(2'h2):(1'h1)]);
              reg95 <= ((8'hbc) ?
                  reg102[(1'h0):(1'h0)] : (wire78[(2'h3):(1'h0)] && wire87));
              reg96 <= (wire87[(2'h2):(2'h2)] ?
                  (((-$signed(wire80)) ?
                          ((reg98 < reg100) <= wire78[(2'h2):(1'h1)]) : $unsigned(wire89)) ?
                      {($signed(reg101) ?
                              reg95[(4'h8):(1'h1)] : $signed(wire79)),
                          wire89} : reg93[(3'h7):(2'h3)]) : wire88[(4'h9):(3'h4)]);
              reg97 <= $signed(($unsigned(wire78) ?
                  reg97[(4'hc):(1'h1)] : ((reg91 ?
                      ((8'hb3) == (8'hab)) : ((8'h9c) ?
                          reg100 : wire78)) && reg94)));
            end
          else
            begin
              reg94 <= {wire87};
            end
        end
      if ({wire87, wire85})
        begin
          reg104 <= reg97[(4'hb):(3'h6)];
        end
      else
        begin
          if (({({wire84[(4'h9):(3'h6)]} ?
                  wire83[(4'h9):(4'h8)] : $unsigned((wire86 ^ reg91))),
              ($signed(reg101) & $signed($signed(reg91)))} || ($signed(({reg99} + (^~reg92))) >> $signed($signed((wire81 - (8'hac)))))))
            begin
              reg104 <= (8'hbd);
              reg105 <= {{$signed((8'haa)), (reg104 != $signed(reg92))},
                  ((reg95[(4'he):(4'hd)] ^~ ({(8'hb5)} ^ reg102)) ?
                      ((7'h40) ?
                          $signed((+wire79)) : wire79) : (~&$signed((~|wire79))))};
              reg106 <= (-reg92[(4'h9):(4'h9)]);
              reg107 <= $signed(wire79);
              reg108 <= (+reg95[(2'h2):(2'h2)]);
            end
          else
            begin
              reg104 <= wire89[(2'h3):(1'h1)];
              reg105 <= reg102;
              reg106 <= reg104[(1'h1):(1'h1)];
            end
          reg109 <= (~|wire83[(3'h4):(2'h3)]);
          reg110 <= $unsigned((^{reg109,
              ((reg103 >= reg106) || $signed(reg94))}));
        end
    end
  assign wire111 = $unsigned(reg108);
  assign wire112 = {$signed($signed($signed(reg92)))};
  assign wire113 = $signed($signed(($unsigned((~^reg105)) <= (reg94 || $signed(wire111)))));
  always
    @(posedge clk) begin
      reg114 <= $signed($signed((((|wire87) - reg101[(4'hf):(4'h9)]) ?
          $unsigned($signed((8'hb0))) : (&$signed(reg95)))));
      if ($signed({$unsigned(($unsigned(wire112) ?
              reg108[(2'h3):(2'h2)] : $unsigned(wire83))),
          {reg114}}))
        begin
          if ($signed((((reg92[(3'h5):(3'h4)] <= wire90[(1'h1):(1'h0)]) ?
                  {(reg91 ? reg101 : reg108), (!reg93)} : (!$signed(wire87))) ?
              wire85[(3'h4):(2'h3)] : wire79[(4'h9):(4'h9)])))
            begin
              reg115 <= (~&$unsigned(reg94[(4'hb):(4'hb)]));
              reg116 <= ($signed((((wire84 == (8'hba)) ?
                      (wire82 ? wire84 : reg104) : {reg94}) ?
                  $signed((~|(8'ha0))) : ((^~reg93) ^ $signed(reg105)))) >= $signed(reg106));
              reg117 <= ((-reg97) ?
                  {$unsigned($unsigned((~^wire80)))} : ($signed({$signed(reg93),
                          $signed(reg106)}) ?
                      wire85[(3'h5):(3'h4)] : (&wire112)));
              reg118 <= reg94;
              reg119 <= ($signed(((~^reg93[(4'he):(1'h0)]) ?
                      (~^{(8'hbd), (8'hb1)}) : $unsigned({wire89}))) ?
                  (((8'hab) >>> (wire83[(4'hb):(3'h6)] > $signed(wire84))) && $unsigned((~&$unsigned(reg108)))) : ((reg99[(3'h5):(1'h0)] ?
                      reg99[(4'he):(4'h9)] : reg106) == reg95));
            end
          else
            begin
              reg115 <= wire80;
              reg116 <= reg103;
            end
          reg120 <= $unsigned(wire113);
          reg121 <= ($unsigned({((reg101 ? reg99 : reg114) ?
                      (8'hab) : $unsigned(wire78))}) ?
              reg115[(4'h9):(3'h4)] : $signed($unsigned(reg107[(2'h3):(2'h3)])));
          reg122 <= reg91[(4'hb):(4'ha)];
        end
      else
        begin
          reg115 <= ($unsigned((((reg107 ?
              wire81 : reg107) | (reg116 && (8'hbc))) * $unsigned((&reg107)))) - $signed((!$unsigned($unsigned((8'ha8))))));
          reg116 <= $signed($signed(wire84[(4'h8):(4'h8)]));
          reg117 <= (^$signed($unsigned(wire82)));
          reg118 <= (&wire84);
        end
      if (reg105)
        begin
          if (($signed(((^~(|reg100)) ?
                  ({reg102, (8'hba)} ?
                      $unsigned(wire84) : $signed(wire90)) : {{wire111},
                      $unsigned(wire88)})) ?
              ({(reg93 ? {wire81, reg100} : reg91[(5'h11):(4'ha)])} ?
                  (reg92[(4'h9):(4'h9)] ?
                      ((reg120 ?
                          reg107 : reg99) == reg97[(2'h3):(1'h0)]) : wire88[(3'h6):(3'h5)]) : reg120) : wire83))
            begin
              reg123 <= ($signed($unsigned((wire80 ?
                  $signed((8'h9e)) : $unsigned(reg100)))) << (($signed((wire80 ?
                          reg93 : reg122)) ?
                      $signed((reg98 <= (8'hb5))) : reg92[(1'h1):(1'h1)]) ?
                  $signed($signed($unsigned((8'hb8)))) : (~$signed((+reg91)))));
              reg124 <= {wire83[(4'h8):(4'h8)]};
              reg125 <= (~|wire85[(2'h2):(1'h0)]);
            end
          else
            begin
              reg123 <= reg109;
              reg124 <= $unsigned((($unsigned((-(7'h44))) ?
                      (-wire111) : reg106) ?
                  wire83[(4'h9):(4'h9)] : $unsigned($signed((~^reg106)))));
              reg125 <= (-(+wire88));
            end
        end
      else
        begin
          reg123 <= reg101;
        end
    end
  assign wire126 = wire88;
  assign wire127 = $signed((reg92 >> (~^$signed($unsigned(wire78)))));
  assign wire128 = $signed($unsigned((reg105[(3'h5):(3'h4)] - ($signed(reg102) >= reg94))));
  always
    @(posedge clk) begin
      reg129 <= reg96;
    end
endmodule
