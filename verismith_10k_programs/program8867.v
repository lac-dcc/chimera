module top
#(parameter param137 = ((((7'h42) ^~ ((^~(8'hbf)) | ((8'hb7) & (8'hb4)))) * ((8'hb9) ? (!(~&(8'h9e))) : {((8'ha9) ~^ (8'ha4))})) ? (({{(7'h44)}} <= (|(8'ha6))) ? (+(((8'ha2) >= (8'ha3)) < (~^(7'h42)))) : {(((8'hbe) >>> (8'hbe)) >>> ((8'hbd) > (8'hb8))), (&(8'ha2))}) : (^{(((8'had) ? (7'h42) : (8'hb8)) ? {(7'h44)} : ((7'h41) ? (8'ha9) : (8'ha2)))})), 
parameter param138 = (|((((^param137) ? (param137 ? param137 : param137) : (!param137)) != ((param137 ? param137 : param137) ? (param137 ? (8'haf) : param137) : (~^param137))) ? ((param137 ? param137 : {param137, param137}) << (param137 ? param137 : param137)) : (((~|param137) + ((8'hb8) | param137)) | (param137 << param137)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire135;
  wire [(3'h4):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire129;
  wire [(5'h13):(1'h0)] wire127;
  wire signed [(4'h9):(1'h0)] wire125;
  wire [(5'h15):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire132;
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire129,
                 wire127,
                 wire125,
                 wire68,
                 wire67,
                 wire58,
                 wire56,
                 wire36,
                 wire35,
                 wire33,
                 wire4,
                 wire131,
                 wire132,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 (1'h0)};
  assign wire4 = $unsigned(({(&wire0[(1'h0):(1'h0)])} ?
                     $unsigned((wire2[(1'h0):(1'h0)] ?
                         (+wire2) : wire3[(3'h4):(1'h0)])) : (~&(wire1[(4'hb):(4'h8)] ?
                         wire0[(2'h2):(2'h2)] : wire2[(4'h8):(3'h4)]))));
  module5 #() modinst34 (.wire7(wire0), .wire8(wire2), .y(wire33), .clk(clk), .wire9(wire4), .wire6(wire1));
  assign wire35 = ((!wire1[(1'h1):(1'h1)]) ?
                      wire4 : {(((8'hbd) ?
                              (wire0 ~^ (7'h40)) : $signed(wire0)) >> $signed(wire2[(4'h8):(1'h0)]))});
  assign wire36 = $signed({(wire35 >>> wire33)});
  module37 #() modinst57 (.wire38(wire1), .wire39(wire3), .clk(clk), .wire41(wire36), .y(wire56), .wire40(wire35));
  assign wire58 = $signed({(^$signed((wire35 ? wire2 : (7'h41)))), wire35});
  always
    @(posedge clk) begin
      if (wire2)
        begin
          if (wire58)
            begin
              reg59 <= wire56;
              reg60 <= (((($unsigned(wire58) ^~ $signed(wire56)) ?
                      reg59 : wire1[(1'h1):(1'h1)]) <<< {$signed($signed(wire1))}) ?
                  $signed((wire56[(1'h0):(1'h0)] && $unsigned((wire2 ?
                      wire1 : wire33)))) : (^$signed($unsigned(wire33[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg59 <= wire1[(3'h6):(2'h2)];
              reg60 <= (-wire35[(3'h7):(1'h0)]);
              reg61 <= {(~^(wire35[(5'h10):(4'h9)] >= (+{wire2})))};
              reg62 <= wire35;
            end
        end
      else
        begin
          reg59 <= $unsigned((^~(($unsigned((8'hb6)) ^ {reg59}) ^ reg59[(3'h4):(2'h3)])));
          reg60 <= $unsigned(wire58);
          if (reg59[(1'h0):(1'h0)])
            begin
              reg61 <= {$unsigned($unsigned(wire56[(3'h4):(2'h2)])),
                  wire33[(3'h5):(1'h1)]};
              reg62 <= wire36[(4'ha):(3'h5)];
              reg63 <= $unsigned({(^~(~&(wire0 || wire3)))});
              reg64 <= $signed(((|$signed($signed(wire1))) ?
                  wire4[(4'he):(2'h2)] : {((|wire36) ? wire0 : reg62)}));
            end
          else
            begin
              reg61 <= (((^(reg64[(3'h4):(2'h3)] ?
                  ((8'h9c) ? wire4 : wire56) : (reg59 ?
                      wire4 : wire35))) | (($unsigned(wire2) <<< (&(8'ha9))) ?
                  ($unsigned((8'hbd)) ?
                      wire3[(1'h0):(1'h0)] : $signed(wire2)) : (&((8'hb7) >= wire1)))) * ((~^reg63) ?
                  (!((8'h9f) ?
                      wire1[(3'h6):(1'h0)] : {reg59})) : (|wire33[(3'h6):(2'h3)])));
            end
          reg65 <= wire56;
        end
      reg66 <= $signed(wire1);
    end
  assign wire67 = ($unsigned($unsigned(reg60)) ?
                      {{wire56,
                              (wire36[(2'h3):(1'h1)] ?
                                  $unsigned(reg62) : wire3[(4'hf):(1'h1)])},
                          (&(~|(wire58 || wire1)))} : reg65[(4'he):(4'ha)]);
  assign wire68 = wire3[(4'he):(3'h5)];
  module69 #() modinst126 (wire125, clk, wire4, wire68, reg63, wire0, wire58);
  module5 #() modinst128 (wire127, clk, wire58, reg64, reg59, wire33);
  module69 #() modinst130 (.wire70(reg64), .wire71(wire2), .y(wire129), .wire73(reg65), .wire72(wire4), .clk(clk), .wire74(wire3));
  assign wire131 = (^reg60);
  module76 #() modinst133 (.wire77(wire127), .clk(clk), .wire79(wire35), .wire80(wire56), .wire81(wire129), .y(wire132), .wire78(wire4));
  assign wire134 = $unsigned($unsigned(wire131));
  assign wire135 = reg60[(4'h9):(3'h6)];
  assign wire136 = (-{$unsigned($unsigned((~(8'hb0))))});
endmodule

module module69
#(parameter param124 = ({((((8'hb8) ? (7'h43) : (8'hbb)) ^~ {(8'haa)}) << {((8'hbc) >= (8'ha4)), ((8'ha1) ? (8'haf) : (8'hbb))}), (((8'haf) >> ((8'hbe) ^ (8'haa))) ? {{(8'had)}, (&(8'hba))} : (((8'hb1) ~^ (8'hb1)) ? {(8'ha0)} : (+(8'hac))))} ? ({(((8'ha5) && (8'ha8)) * ((8'hbb) ? (8'hab) : (7'h44))), {(~(8'ha8))}} & {{(~&(8'hb4))}}) : ((^~((~^(8'had)) ? ((8'ha4) <= (8'hbb)) : (~|(8'ha1)))) != (~(((8'ha5) > (8'hba)) & (~(8'h9d)))))))
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire74;
  input wire [(5'h15):(1'h0)] wire73;
  input wire signed [(3'h4):(1'h0)] wire72;
  input wire [(5'h11):(1'h0)] wire71;
  input wire signed [(5'h13):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire122;
  wire [(4'h8):(1'h0)] wire121;
  wire [(2'h2):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire119;
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire97,
                 wire75,
                 wire99,
                 wire100,
                 wire101,
                 wire119,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire75 = ($unsigned((wire72[(2'h2):(1'h1)] ?
                          $signed($unsigned(wire74)) : {{wire70}})) ?
                      $unsigned($unsigned((+$signed(wire74)))) : {wire70[(3'h4):(1'h0)],
                          (wire72[(1'h0):(1'h0)] ?
                              {{wire70, wire72}} : ((wire74 ?
                                      (7'h41) : wire72) ?
                                  (|wire71) : $signed(wire73)))});
  module76 #() modinst98 (wire97, clk, wire74, wire71, wire73, wire75, wire70);
  assign wire99 = (8'ha1);
  assign wire100 = (^($signed($unsigned(wire97[(2'h2):(2'h2)])) ?
                       wire99[(3'h4):(2'h2)] : {((wire71 << wire71) || $unsigned(wire75))}));
  assign wire101 = (wire73 ? wire97 : {$signed((|(8'hbb)))});
  always
    @(posedge clk) begin
      reg102 <= wire71;
      reg103 <= $unsigned((+wire73[(4'hc):(1'h0)]));
      reg104 <= (wire100 ?
          (wire97[(1'h0):(1'h0)] ?
              ($signed((|wire97)) ^ wire73[(3'h6):(2'h3)]) : wire100) : wire71);
      reg105 <= wire71[(4'hb):(1'h1)];
    end
  module106 #() modinst120 (.wire110(wire99), .wire107(wire100), .wire109(reg103), .y(wire119), .wire111(wire101), .clk(clk), .wire108(reg104));
  assign wire121 = $signed({wire99, $signed(wire119[(2'h2):(1'h0)])});
  assign wire122 = $unsigned($signed((reg102[(5'h13):(5'h12)] & ($signed(reg105) + wire73[(4'he):(2'h2)]))));
  assign wire123 = (reg105 ? $unsigned((~^wire121[(4'h8):(4'h8)])) : wire122);
endmodule

module module37
#(parameter param54 = (~^(((&(^~(8'hac))) ? (((8'hac) ? (8'hbd) : (8'hb2)) ^~ ((8'h9c) ? (8'hbc) : (7'h44))) : ((+(8'ha4)) ? ((8'ha6) == (8'ha4)) : {(8'hbe)})) * ((((8'hb3) ? (8'ha4) : (8'hb2)) * ((8'hb4) <<< (8'hbe))) ~^ {((8'ha0) ? (8'hb0) : (8'ha9))}))), 
parameter param55 = (((param54 ? ((~|param54) ? param54 : param54) : param54) ? param54 : (~((param54 ? (8'hb0) : param54) ~^ ((8'hb7) ? param54 : param54)))) == (~|(((param54 && param54) ? ((8'ha4) ^ param54) : (8'hbf)) < (param54 || (param54 ? param54 : param54))))))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire41;
  input wire [(3'h5):(1'h0)] wire40;
  input wire [(5'h10):(1'h0)] wire39;
  input wire [(4'hc):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire43,
                 wire42,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire42 = (|$unsigned($unsigned(((|(8'hbc)) ?
                      ((8'hbe) ? wire38 : wire40) : (+wire41)))));
  assign wire43 = (|$unsigned($unsigned({(8'h9c)})));
  always
    @(posedge clk) begin
      reg44 <= $unsigned(wire38);
      reg45 <= ((~&wire43[(3'h7):(3'h7)]) + (^wire40[(3'h5):(3'h4)]));
      reg46 <= ((reg45 ?
          {wire39} : ((!reg44) ?
              reg45 : ((wire39 ? (8'ha9) : reg45) ?
                  {wire39} : {reg44, reg44}))) > wire39);
      if ($signed(((wire40 ?
          wire43 : (reg46 ?
              wire38[(3'h5):(1'h1)] : (wire41 >= reg46))) && ((8'hab) ?
          ((wire38 ? wire38 : (8'ha9)) ?
              $unsigned(wire39) : $signed(reg45)) : (~(wire40 ?
              wire41 : wire39))))))
        begin
          reg47 <= ((~|wire41) ?
              $signed({($unsigned(reg46) ? reg45 : $signed(wire39)),
                  ((wire40 << (8'ha1)) ?
                      $signed(wire39) : wire43)}) : ((~((wire43 == reg44) - reg44)) ?
                  {(|reg46[(4'ha):(1'h1)]),
                      reg44[(3'h5):(2'h3)]} : (($signed(wire38) || wire38[(2'h3):(1'h0)]) ?
                      ((|wire38) <= (-wire42)) : $unsigned(wire38))));
          if (reg46[(5'h10):(3'h5)])
            begin
              reg48 <= (-$unsigned({wire39, $signed($signed(reg45))}));
              reg49 <= $unsigned($signed($unsigned(((^~reg45) <= $signed(reg47)))));
              reg50 <= ($unsigned($unsigned($signed($signed(reg46)))) & $unsigned(wire40[(3'h5):(3'h5)]));
            end
          else
            begin
              reg48 <= $signed((|(|$unsigned(wire40[(1'h1):(1'h1)]))));
              reg49 <= wire40[(2'h2):(2'h2)];
              reg50 <= $unsigned($unsigned({wire41,
                  ($signed(wire38) ? $signed(wire39) : $unsigned((8'hbd)))}));
            end
        end
      else
        begin
          reg47 <= reg46[(5'h10):(4'hb)];
          reg48 <= (({((~|reg48) ^ $unsigned(reg50)),
              {(reg47 | reg50)}} == (wire40[(2'h3):(1'h1)] ?
              $signed((wire41 != wire42)) : {(!wire39),
                  (+reg44)})) ^~ {$unsigned(($signed(wire39) >= wire41)),
              {wire43[(4'he):(4'he)], reg50[(2'h3):(2'h3)]}});
        end
    end
  assign wire51 = wire41;
  assign wire52 = reg44;
  assign wire53 = $unsigned((8'hbc));
endmodule

module module5
#(parameter param31 = ((8'hb0) & {((-((8'ha2) ^ (8'ha8))) + (((8'hb2) <= (8'ha1)) || (~(8'hb3))))}), 
parameter param32 = ((((param31 ? (|param31) : (param31 ^~ param31)) ? {(~^param31), (param31 ? param31 : param31)} : (param31 ? (param31 ? param31 : param31) : {param31})) ? (~{(param31 >>> param31)}) : (((|param31) <= (param31 ? param31 : param31)) + param31)) > ((((param31 ? param31 : param31) && param31) ? (^~(-(8'hb8))) : (~&{param31, param31})) <= (~{{(8'haa)}, (+param31)}))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire10;
  assign y = {wire30, wire29, wire27, wire10, (1'h0)};
  assign wire10 = (wire8[(3'h7):(3'h6)] ?
                      $unsigned(wire8) : $unsigned($unsigned($signed((wire8 <<< wire8)))));
  module11 #() modinst28 (wire27, clk, wire8, wire9, wire7, wire10);
  assign wire29 = wire6[(4'hd):(4'h8)];
  assign wire30 = (8'hba);
endmodule

module module11
#(parameter param26 = ((((8'ha4) ? {(&(8'hb3))} : ((!(8'haf)) | ((8'ha1) ? (7'h44) : (8'haf)))) ? (^({(7'h43)} >= ((7'h40) < (8'ha8)))) : (^(~((8'ha3) ? (8'ha9) : (8'hb3))))) ? ((8'h9c) ? ((|{(8'hbc), (8'hb0)}) ? ((|(7'h44)) ? ((8'ha2) ? (8'haa) : (8'ha4)) : (-(8'hbf))) : ({(8'ha5)} ? ((8'ha7) ? (8'hb7) : (8'ha0)) : {(8'h9e), (8'had)})) : {(((7'h43) ? (8'h9d) : (8'ha8)) + ((8'hb7) ? (8'hb5) : (8'ha8)))}) : {(!((+(8'ha7)) ? {(8'hbf)} : ((8'hb0) ? (8'hb6) : (8'ha8))))}))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire [(4'ha):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire [(2'h3):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 (1'h0)};
  assign wire16 = $unsigned((((wire14 <= $signed(wire12)) ?
                          wire15 : {wire15[(3'h7):(1'h0)], (&wire12)}) ?
                      $unsigned($signed($unsigned(wire12))) : $unsigned({$signed(wire12),
                          (wire14 > wire15)})));
  assign wire17 = $signed($unsigned((^~{$signed((8'ha8))})));
  assign wire18 = (^wire16[(2'h2):(2'h2)]);
  assign wire19 = (^wire12);
  assign wire20 = (({(^((8'hb4) ? wire12 : wire18)), (^~wire19)} ?
                      wire18 : (^$signed(wire16[(3'h4):(2'h3)]))) < ((wire18 > wire13[(3'h6):(2'h3)]) ?
                      (~^($signed(wire13) >>> $unsigned(wire12))) : wire12));
  assign wire21 = (((((wire16 * wire19) ?
                          $signed(wire20) : $signed(wire13)) << wire17) ?
                      (~$unsigned($signed(wire14))) : (($signed((8'h9c)) ?
                              (!wire15) : (wire20 ? wire15 : wire16)) ?
                          $unsigned((+wire19)) : (&(wire19 + wire14)))) < $unsigned($signed(((wire17 ?
                      wire18 : wire12) <<< (~&wire14)))));
  assign wire22 = ((+({(^~wire14), (wire13 >>> wire18)} ?
                          wire18 : ($signed(wire19) || (-wire18)))) ?
                      wire21[(4'hc):(4'hb)] : {wire16[(1'h1):(1'h0)],
                          wire20[(4'hb):(4'h9)]});
  assign wire23 = (!(wire16[(2'h3):(1'h0)] ?
                      ({wire12[(3'h5):(3'h5)], (wire20 <<< wire12)} ?
                          $signed($unsigned(wire19)) : (~^(~&wire22))) : (wire20 << wire15[(3'h7):(1'h1)])));
  assign wire24 = (wire15[(3'h6):(2'h2)] <<< $unsigned((((wire19 ?
                      (8'had) : wire17) >>> (wire14 + wire14)) || ((wire16 <<< wire18) && $unsigned(wire14)))));
  assign wire25 = (^~wire15);
endmodule

module module106
#(parameter param118 = (~^((({(7'h44)} - (!(8'h9c))) ? (((8'h9c) + (8'ha3)) ? {(8'ha3), (8'ha7)} : ((8'ha1) | (8'had))) : (((8'ha3) != (8'hb7)) ? (8'hae) : (8'haa))) ? ((((8'ha2) ? (8'haf) : (8'hb9)) ? ((8'hb4) ? (8'hb8) : (8'hb5)) : ((8'ha7) >>> (8'h9f))) != (((8'hb4) || (8'ha2)) ? ((8'hb5) <= (8'hb8)) : (-(8'haf)))) : ((((8'hba) >>> (8'hb9)) ? (~|(8'hac)) : ((8'hb8) >> (7'h43))) * (((8'hab) >= (8'h9e)) <= (-(7'h40)))))))
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire111;
  input wire signed [(2'h2):(1'h0)] wire110;
  input wire [(5'h14):(1'h0)] wire109;
  input wire [(5'h15):(1'h0)] wire108;
  input wire [(4'hc):(1'h0)] wire107;
  wire signed [(3'h4):(1'h0)] wire117;
  wire [(5'h10):(1'h0)] wire116;
  wire signed [(4'ha):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  assign y = {wire117, wire116, wire115, wire114, wire113, wire112, (1'h0)};
  assign wire112 = $unsigned($signed($signed((~|$signed(wire110)))));
  assign wire113 = wire108[(4'hb):(4'hb)];
  assign wire114 = (!(wire107[(2'h2):(1'h1)] ?
                       $signed($unsigned(((7'h40) < wire109))) : wire112));
  assign wire115 = ({wire113[(4'hb):(2'h3)]} ^ wire109);
  assign wire116 = $signed(($signed(((wire115 + wire109) ?
                       (wire115 ?
                           wire112 : wire111) : ((8'hb3) != (8'hbe)))) & wire107[(2'h3):(1'h0)]));
  assign wire117 = (^~(($signed((+wire111)) - ($signed(wire109) ?
                           {wire108, wire107} : (wire116 <= wire107))) ?
                       (8'hba) : (~&$signed(wire112))));
endmodule

module module76
#(parameter param95 = {(8'hb0), (8'hac)}, 
parameter param96 = {(((8'hbd) ? param95 : param95) << ({param95} ? ((param95 ? (8'hb2) : param95) ~^ param95) : ((param95 ? param95 : (8'hb8)) ? param95 : (param95 <<< param95)))), param95})
(y, clk, wire81, wire80, wire79, wire78, wire77);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire81;
  input wire [(3'h4):(1'h0)] wire80;
  input wire signed [(4'h8):(1'h0)] wire79;
  input wire signed [(3'h6):(1'h0)] wire78;
  input wire [(5'h13):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(4'h8):(1'h0)] wire89;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg86 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg94,
                 reg87,
                 reg86,
                 (1'h0)};
  assign wire82 = wire81;
  assign wire83 = ($unsigned((~((^wire82) <<< {wire82, wire82}))) ?
                      (wire77[(4'hd):(3'h5)] + wire77) : wire78);
  assign wire84 = ($signed(((~&wire77) ? (!wire78) : (^$unsigned(wire79)))) ?
                      wire82 : $signed(wire79[(3'h5):(3'h4)]));
  assign wire85 = {(((^((8'hb6) << wire84)) ?
                              $signed({wire83}) : ($signed(wire78) ?
                                  {(8'hbd), wire81} : wire80[(2'h2):(1'h1)])) ?
                          wire80[(3'h4):(3'h4)] : {(^(wire78 && wire79))}),
                      $signed(wire83)};
  always
    @(posedge clk) begin
      reg86 <= (~|($unsigned((~wire84[(1'h1):(1'h1)])) == wire80[(2'h3):(2'h3)]));
      reg87 <= (wire79 ?
          $unsigned((~^($unsigned(reg86) ?
              {wire83, (8'had)} : wire79))) : $unsigned((~((wire78 ?
              wire78 : wire82) + wire84[(1'h0):(1'h0)]))));
    end
  assign wire88 = $signed((($signed($unsigned(reg87)) ?
                      {$unsigned(wire82), $signed((8'ha3))} : (wire80 ?
                          $signed(wire85) : (wire83 * wire81))) & $unsigned(wire84[(3'h6):(3'h6)])));
  assign wire89 = $signed({(wire78[(2'h2):(1'h0)] ?
                          {(reg87 > (8'hae)),
                              $signed((8'hb0))} : wire78[(2'h3):(2'h3)])});
  assign wire90 = ($signed(wire83) ?
                      {wire78[(3'h4):(2'h3)]} : wire82[(1'h0):(1'h0)]);
  assign wire91 = {(reg86 ?
                          (8'ha2) : ($signed($signed(reg87)) ?
                              wire82[(1'h0):(1'h0)] : wire78[(3'h5):(3'h5)])),
                      wire85};
  assign wire92 = (|$unsigned((wire82[(2'h3):(2'h2)] ?
                      wire78[(2'h3):(2'h3)] : (^(8'hac)))));
  assign wire93 = (({wire80, wire80} + wire89) ?
                      (^($signed(wire82) ?
                          (wire92 ?
                              (~reg87) : reg86) : wire90)) : wire84[(4'hb):(3'h6)]);
  always
    @(posedge clk) begin
      reg94 <= $unsigned(reg87);
    end
endmodule
