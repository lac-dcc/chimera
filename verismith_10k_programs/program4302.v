module top
#(parameter param218 = ({({{(8'haf), (8'ha4)}, ((8'hb6) && (8'ha1))} ? ({(8'hac)} ? (~^(8'ha8)) : (!(8'haa))) : (8'hb7)), ((((8'hb4) ? (8'hac) : (8'ha1)) | (^~(8'hb9))) ? (((8'ha4) ? (8'ha3) : (8'hb1)) < ((8'hb7) ? (8'h9e) : (8'hbd))) : {(~&(8'haa))})} ? ((8'hb9) ? {(((8'ha6) ~^ (8'hb8)) - ((8'hb1) ? (8'ha1) : (8'hba))), ((8'hb1) ^ {(8'ha0)})} : ((((8'hb9) ? (8'hb2) : (8'ha8)) >> (8'h9c)) << {((8'hba) ? (8'ha6) : (8'ha0))})) : (8'hb1)))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire217;
  wire [(5'h11):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire75;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(4'he):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire215;
  assign y = {wire217,
                 wire73,
                 wire75,
                 wire76,
                 wire77,
                 wire78,
                 wire79,
                 wire215,
                 (1'h0)};
  module5 #() modinst74 (.y(wire73), .wire7(wire3), .wire9(wire2), .wire8(wire0), .clk(clk), .wire6(wire4));
  assign wire75 = wire4[(4'h8):(2'h2)];
  assign wire76 = wire73;
  assign wire77 = wire0;
  assign wire78 = (((({wire75, (8'ha3)} ? $signed(wire77) : {wire1}) ?
                              wire4 : wire73[(1'h0):(1'h0)]) ?
                          {(&(wire75 ? wire3 : wire1))} : (wire2 ?
                              $signed(wire1) : ($signed(wire4) ?
                                  {wire73} : wire77))) ?
                      wire1[(4'hc):(4'ha)] : wire3[(3'h6):(3'h5)]);
  assign wire79 = {(+wire3[(3'h7):(3'h7)]),
                      $signed({$signed((wire1 <<< (8'hb0)))})};
  module80 #() modinst216 (wire215, clk, wire73, wire0, wire3, wire75, wire1);
  assign wire217 = wire2;
endmodule

module module80  (y, clk, wire81, wire82, wire83, wire84, wire85);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire81;
  input wire [(3'h7):(1'h0)] wire82;
  input wire [(4'hc):(1'h0)] wire83;
  input wire [(3'h6):(1'h0)] wire84;
  input wire [(5'h13):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire214;
  wire [(5'h12):(1'h0)] wire213;
  wire [(4'hf):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire108;
  wire [(5'h12):(1'h0)] wire141;
  wire [(5'h13):(1'h0)] wire173;
  wire [(4'hf):(1'h0)] wire211;
  assign y = {wire214,
                 wire213,
                 wire86,
                 wire87,
                 wire105,
                 wire107,
                 wire108,
                 wire141,
                 wire173,
                 wire211,
                 (1'h0)};
  assign wire86 = $signed(((wire82[(1'h1):(1'h0)] ?
                          wire84[(3'h4):(1'h1)] : ((wire83 - wire85) ?
                              (wire81 ? wire81 : wire82) : (wire81 + wire84))) ?
                      wire85 : $unsigned((wire82 ?
                          (~^wire83) : wire82[(2'h3):(1'h1)]))));
  assign wire87 = (8'hb6);
  module88 #() modinst106 (wire105, clk, wire85, wire83, wire86, wire82);
  assign wire107 = ((|wire86[(1'h0):(1'h0)]) ?
                       {(!$signed($unsigned(wire82))),
                           {(7'h44)}} : $signed(({(!wire81), (^wire83)} ?
                           ((wire85 ? wire85 : wire81) ?
                               ((8'hbc) ?
                                   wire87 : wire83) : wire84) : $signed((|wire84)))));
  assign wire108 = $signed((!(wire82[(3'h4):(1'h1)] ?
                       $signed($signed(wire107)) : $signed((^wire105)))));
  module109 #() modinst142 (wire141, clk, wire81, wire105, wire87, wire83);
  module143 #() modinst174 (wire173, clk, wire84, wire87, wire107, wire86);
  module175 #() modinst212 (.clk(clk), .wire179(wire81), .wire178(wire141), .wire177(wire83), .y(wire211), .wire180(wire107), .wire176(wire173));
  assign wire213 = {(!wire211), $signed(wire141)};
  assign wire214 = $unsigned(wire211[(2'h2):(1'h1)]);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire42;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire69,
                 wire46,
                 wire45,
                 wire44,
                 wire42,
                 wire23,
                 wire22,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire10 = (~$unsigned(({(wire9 << wire8),
                      $signed(wire6)} - ((wire6 - (7'h44)) >>> (wire7 >>> wire8)))));
  assign wire11 = $signed(wire9[(5'h14):(1'h1)]);
  assign wire12 = ($signed(wire11[(4'ha):(3'h6)]) ?
                      {(|wire9)} : ((((wire9 > (8'ha1)) + $signed((8'ha2))) + (~^{wire11})) ?
                          $signed($signed(wire10)) : ({{wire11, wire8}} ?
                              (~^(wire8 ?
                                  (8'ha4) : wire11)) : wire10[(1'h1):(1'h0)])));
  assign wire13 = wire6[(4'hf):(2'h3)];
  assign wire14 = wire10;
  assign wire15 = $unsigned((wire8[(2'h3):(2'h3)] ?
                      ({$unsigned(wire10), $signed(wire10)} ?
                          $signed(wire12[(1'h1):(1'h1)]) : (wire14[(2'h3):(1'h0)] ?
                              ((7'h42) ?
                                  wire12 : (8'hab)) : $signed(wire11))) : $unsigned(((8'h9f) ?
                          (wire6 ~^ wire8) : (wire12 - wire12)))));
  always
    @(posedge clk) begin
      if ($signed(({$unsigned(wire8), wire11[(3'h7):(3'h6)]} ?
          wire8[(3'h4):(1'h1)] : $signed(wire13[(4'hc):(3'h6)]))))
        begin
          reg16 <= ($signed($signed($signed(wire12))) >> $signed(({(8'h9c)} > (((8'hb1) ?
              wire11 : wire13) ~^ wire8))));
          reg17 <= (((!wire13[(3'h7):(1'h1)]) && wire12) ?
              wire9 : (wire6 ?
                  ($signed((wire7 & wire11)) >> $unsigned((wire6 ?
                      (7'h42) : reg16))) : $signed(wire6[(3'h5):(1'h1)])));
          reg18 <= ($signed((~^{$signed(wire13)})) >= wire7[(2'h2):(1'h0)]);
        end
      else
        begin
          reg16 <= {$signed(wire12), $signed(wire9)};
          reg17 <= reg17[(3'h6):(3'h6)];
          reg18 <= (^~(8'ha5));
        end
      reg19 <= wire8;
      reg20 <= wire7;
      reg21 <= wire11;
    end
  assign wire22 = (wire12[(2'h2):(2'h2)] ?
                      {$unsigned($signed(reg17)),
                          $unsigned((wire13[(1'h0):(1'h0)] ?
                              (&wire7) : $unsigned((8'ha6))))} : {(|((wire12 - wire12) ?
                              $signed(reg19) : $signed((8'ha3)))),
                          wire10});
  assign wire23 = {$unsigned($signed($unsigned(wire22))), reg18};
  module24 #() modinst43 (wire42, clk, wire12, wire13, wire22, wire6);
  assign wire44 = wire42[(2'h2):(1'h1)];
  assign wire45 = $unsigned($unsigned((~(^~(8'haa)))));
  assign wire46 = $unsigned({(+$signed((wire14 ? wire15 : reg19)))});
  module47 #() modinst70 (wire69, clk, wire9, reg17, wire7, wire13, wire14);
  assign wire71 = (~|(^~(($signed(wire14) ^ (reg19 >> wire13)) <<< reg19[(2'h2):(1'h1)])));
  assign wire72 = $unsigned(((7'h44) ?
                      $unsigned($unsigned($signed((8'hac)))) : (-{(reg18 ?
                              wire23 : reg17)})));
endmodule

module module47
#(parameter param67 = ((^~((((8'ha2) >>> (8'hbb)) && ((8'hbf) ? (8'h9c) : (8'h9c))) >= ((-(8'hb0)) ? {(8'hae)} : ((8'hb5) <<< (7'h41))))) ? (~&(&{(|(8'ha0)), ((8'hb5) - (8'h9f))})) : ({(((8'hb7) ? (7'h40) : (8'hb6)) ? (!(8'ha9)) : (-(8'h9f))), (((8'ha5) ? (8'ha1) : (8'hb2)) ? (~|(7'h41)) : ((8'hb9) ? (8'hbf) : (8'ha5)))} - (&(((8'hab) ? (8'hb1) : (7'h43)) ? {(8'ha0), (8'h9f)} : (~^(8'ha3)))))), 
parameter param68 = (8'hbd))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire52;
  input wire signed [(4'he):(1'h0)] wire51;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire [(4'h8):(1'h0)] wire49;
  input wire [(5'h10):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(3'h6):(1'h0)] wire62;
  wire signed [(4'he):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire [(4'hc):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire53;
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 (1'h0)};
  assign wire53 = wire51[(4'ha):(3'h4)];
  assign wire54 = ($signed(wire48) ^~ $signed(wire53[(2'h3):(1'h0)]));
  assign wire55 = (wire52 ^~ (&($unsigned((~|(8'had))) ?
                      {(wire52 <= (7'h43)),
                          wire51[(4'h9):(4'h8)]} : $signed($signed(wire54)))));
  assign wire56 = wire48[(1'h1):(1'h1)];
  assign wire57 = wire55;
  assign wire58 = {wire48[(5'h10):(1'h1)], wire56[(1'h0):(1'h0)]};
  assign wire59 = wire55;
  assign wire60 = $signed($signed((($signed(wire50) >>> $signed(wire49)) ?
                      (-(~&(8'haa))) : ((wire53 ?
                          wire56 : wire58) <= (8'ha0)))));
  assign wire61 = ($signed(wire60) ?
                      (($signed(wire49[(3'h6):(3'h6)]) ?
                              {((8'haf) || wire55),
                                  $unsigned(wire59)} : ((wire57 <= wire51) ?
                                  ((8'ha5) & (8'hbf)) : $unsigned(wire59))) ?
                          wire57[(3'h6):(3'h4)] : wire59[(4'hd):(4'hb)]) : wire50);
  assign wire62 = wire60;
  assign wire63 = $signed(wire52[(1'h0):(1'h0)]);
  assign wire64 = $unsigned(((+((&wire56) ?
                      (wire53 <<< wire53) : {wire57,
                          (8'h9f)})) && ($unsigned(wire60[(3'h4):(2'h2)]) ?
                      (^~$signed(wire54)) : (wire51[(4'h8):(4'h8)] ?
                          wire61 : ((8'ha0) ? wire61 : wire57)))));
  assign wire65 = $unsigned($unsigned(wire59[(1'h1):(1'h0)]));
  assign wire66 = wire53;
endmodule

module module24
#(parameter param41 = ({((((8'ha5) ? (8'h9e) : (8'hac)) ^~ ((8'hb5) ? (8'hab) : (8'hb6))) << {(+(8'ha0)), (&(8'ha6))})} ^~ (8'hbb)))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire27;
  input wire [(4'hd):(1'h0)] wire26;
  input wire signed [(4'h9):(1'h0)] wire25;
  wire signed [(5'h15):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire29;
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire29,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire29 = wire28;
  assign wire30 = wire29;
  always
    @(posedge clk) begin
      reg31 <= $signed(wire29);
      reg32 <= reg31;
    end
  assign wire33 = ((wire27[(4'h8):(2'h3)] < (reg31 <<< $signed($signed(wire29)))) <<< ((reg31[(4'hd):(4'h8)] ?
                          $signed((wire30 ? wire25 : wire25)) : (8'ha5)) ?
                      {$signed($unsigned(wire26))} : (((wire29 ?
                              wire29 : reg31) ?
                          (wire25 && wire28) : {wire25}) ^~ wire29[(1'h1):(1'h0)])));
  assign wire34 = wire33[(3'h5):(3'h5)];
  assign wire35 = {(($signed(reg32) <= ($unsigned((8'ha1)) ?
                          (-wire28) : (^~wire26))) < wire26),
                      ((^~((-wire30) + wire26[(3'h7):(3'h4)])) ^~ wire33)};
  assign wire36 = ($signed({(|wire28)}) <<< ((~&((wire28 ? wire33 : wire29) ?
                          (|(8'ha8)) : $signed(wire25))) ?
                      {reg32[(4'h8):(1'h0)], wire26[(2'h3):(1'h0)]} : reg31));
  assign wire37 = {(^~wire34[(4'hb):(2'h2)])};
  assign wire38 = (^$signed(wire29));
  assign wire39 = ((((wire38 ?
                      (wire25 ?
                          wire27 : wire28) : wire30) <= (+wire37[(2'h3):(2'h2)])) ^ $unsigned(wire29[(4'he):(4'hc)])) | reg31[(5'h13):(5'h12)]);
  assign wire40 = (wire39[(3'h4):(3'h4)] ?
                      (wire39 * (~&$signed($unsigned((8'hbf))))) : $signed(wire26[(3'h6):(3'h5)]));
endmodule

module module175
#(parameter param209 = (8'hba), 
parameter param210 = ((8'hb1) ? (~^(param209 ? {(-param209), (param209 * param209)} : (~&(~&param209)))) : (|((~|(~&param209)) ? (~|(param209 ? param209 : param209)) : {(param209 << param209), (^(8'h9d))}))))
(y, clk, wire180, wire179, wire178, wire177, wire176);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire180;
  input wire signed [(5'h10):(1'h0)] wire179;
  input wire signed [(4'h9):(1'h0)] wire178;
  input wire signed [(3'h7):(1'h0)] wire177;
  input wire signed [(4'he):(1'h0)] wire176;
  wire [(5'h14):(1'h0)] wire208;
  wire signed [(4'h8):(1'h0)] wire207;
  wire signed [(4'hb):(1'h0)] wire206;
  wire signed [(3'h5):(1'h0)] wire205;
  wire [(4'hc):(1'h0)] wire204;
  wire [(5'h12):(1'h0)] wire199;
  reg [(5'h10):(1'h0)] reg203 = (1'h0);
  reg [(4'hc):(1'h0)] reg202 = (1'h0);
  reg [(4'hc):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg200 = (1'h0);
  reg [(2'h3):(1'h0)] reg198 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg197 = (1'h0);
  reg [(4'h8):(1'h0)] reg196 = (1'h0);
  reg [(3'h6):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg193 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg192 = (1'h0);
  reg [(5'h12):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg190 = (1'h0);
  reg [(3'h5):(1'h0)] reg189 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg188 = (1'h0);
  reg [(5'h11):(1'h0)] reg187 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg185 = (1'h0);
  reg [(5'h15):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg182 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg181 = (1'h0);
  assign y = {wire208,
                 wire207,
                 wire206,
                 wire205,
                 wire204,
                 wire199,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg181 <= wire176[(4'hd):(3'h4)];
      if (reg181)
        begin
          reg182 <= $signed({$unsigned((8'hb4))});
          reg183 <= $signed(((~wire178) && (|wire180[(3'h4):(2'h3)])));
          if (($unsigned(({wire178, wire179} != wire177[(3'h5):(1'h1)])) ?
              wire179 : (wire178 ?
                  (+{$signed(wire180),
                      $signed(wire179)}) : (((-wire177) >= {wire176,
                      (8'hbd)}) + reg181[(1'h0):(1'h0)]))))
            begin
              reg184 <= wire176;
              reg185 <= {$unsigned(reg181)};
            end
          else
            begin
              reg184 <= reg185;
              reg185 <= (reg183[(3'h4):(3'h4)] ?
                  wire180[(2'h2):(1'h0)] : reg183);
            end
          if ((~$signed((reg183[(2'h2):(1'h1)] ?
              $unsigned(reg182[(2'h2):(2'h2)]) : $signed((|reg183))))))
            begin
              reg186 <= $signed($unsigned((wire180 ?
                  wire179[(4'h9):(1'h0)] : {((8'h9f) ? wire176 : wire178)})));
              reg187 <= ((reg186 ?
                  $unsigned(((reg182 | reg181) ?
                      reg182 : (~^(8'ha8)))) : (&($unsigned(reg182) >= reg183[(3'h5):(2'h3)]))) >> ($signed((reg181 >>> (-reg184))) ?
                  {(+(wire177 ? (8'had) : wire180)),
                      {reg184[(3'h4):(3'h4)], (~|reg185)}} : $signed(reg181)));
            end
          else
            begin
              reg186 <= {$signed($signed(reg184)),
                  (~|$unsigned($signed((wire176 || reg184))))};
              reg187 <= $unsigned((reg186[(1'h1):(1'h1)] ?
                  ($signed($signed(wire176)) & $unsigned((wire179 == wire180))) : ({(wire176 ?
                          reg185 : reg187),
                      reg185} >> $unsigned((reg186 ? reg187 : wire176)))));
              reg188 <= (((~(~|(&wire179))) - (~($unsigned(wire180) ?
                  (~wire179) : reg182))) < reg186[(1'h1):(1'h0)]);
              reg189 <= (!{(~&($signed(reg187) + $unsigned(reg184)))});
            end
          reg190 <= {$signed(reg188[(3'h6):(2'h3)])};
        end
      else
        begin
          reg182 <= reg188[(4'h9):(2'h3)];
          reg183 <= (~^(+(~&$signed(wire177))));
        end
      reg191 <= $unsigned(wire179);
      if (((8'h9e) & $unsigned((~|({(8'hb7), reg184} + (!reg187))))))
        begin
          reg192 <= ({$unsigned((((7'h40) != wire180) ~^ (+wire178))),
                  $signed((reg186[(1'h1):(1'h0)] << {reg184}))} ?
              $signed((((reg184 ~^ reg190) ?
                  $unsigned(reg181) : (~|(8'h9f))) != (reg184[(4'ha):(3'h6)] ?
                  reg187 : reg191[(3'h4):(1'h0)]))) : reg184[(5'h13):(5'h13)]);
        end
      else
        begin
          if ((wire178[(4'h8):(1'h0)] > ((8'haa) ?
              ($unsigned($signed(reg190)) ?
                  {{reg183}} : (!(reg187 ? wire176 : reg184))) : {(~^(^reg187)),
                  ($signed(reg191) ? {(8'haf), reg189} : reg183)})))
            begin
              reg192 <= $unsigned($signed(wire178[(3'h5):(1'h1)]));
              reg193 <= wire176[(4'h8):(3'h7)];
              reg194 <= $unsigned(reg185);
            end
          else
            begin
              reg192 <= $signed(reg189);
            end
          reg195 <= $unsigned($unsigned(reg190[(3'h7):(3'h5)]));
          reg196 <= $signed(wire178);
          reg197 <= reg184[(1'h0):(1'h0)];
          reg198 <= ((-($signed((reg183 ? reg183 : wire178)) ?
              $unsigned(reg194[(2'h2):(2'h2)]) : (^reg188[(4'h9):(4'h9)]))) >> ((reg188[(1'h1):(1'h0)] + $unsigned((~^wire179))) ?
              $signed($unsigned($unsigned(reg196))) : $unsigned((^wire178))));
        end
    end
  assign wire199 = (({$unsigned((-reg191))} ?
                       wire179 : reg194[(3'h4):(1'h0)]) >= ((((reg197 - reg182) ?
                               ((8'hac) * reg189) : $unsigned(reg195)) ?
                           $unsigned($unsigned((8'haf))) : wire177[(3'h7):(3'h6)]) ?
                       (!(+(wire179 > reg185))) : (reg190[(3'h5):(3'h5)] ?
                           ((reg191 ? (7'h43) : reg198) ?
                               (reg194 && reg193) : wire179) : $unsigned(reg184))));
  always
    @(posedge clk) begin
      reg200 <= (&(reg186[(1'h1):(1'h0)] | (!{$signed(wire180)})));
      reg201 <= (8'hac);
      reg202 <= (~^reg181[(3'h5):(2'h3)]);
      reg203 <= reg193[(4'he):(3'h5)];
    end
  assign wire204 = {(|(reg202 ?
                           ((reg202 ?
                               reg197 : (8'hbe)) >>> (~|reg194)) : ($unsigned(reg181) != (reg202 | reg198)))),
                       reg183};
  assign wire205 = $unsigned(((+((~reg202) * reg185)) * ({wire176,
                           reg195[(3'h6):(2'h2)]} ?
                       (reg189[(1'h1):(1'h0)] || {(8'haf),
                           reg184}) : wire179[(5'h10):(4'hb)])));
  assign wire206 = {$signed($signed({$signed(reg193)}))};
  assign wire207 = wire206;
  assign wire208 = $signed(((~reg181[(3'h7):(1'h1)]) <= ({$signed(reg198),
                       (-reg200)} <<< ((wire204 >>> reg182) <<< reg201[(4'h9):(1'h1)]))));
endmodule

module module143
#(parameter param172 = {({(~|((8'ha0) <<< (8'h9f))), (((8'h9c) ? (8'had) : (8'ha0)) >>> ((8'hba) && (8'ha6)))} ^~ ({((8'hbd) ^ (8'hbd))} ? ((|(8'ha5)) ? ((8'ha6) << (8'hac)) : ((8'hb8) ? (8'ha4) : (8'hbd))) : (-(~|(8'hb0)))))})
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire147;
  input wire [(3'h5):(1'h0)] wire146;
  input wire [(4'hb):(1'h0)] wire145;
  input wire [(4'hf):(1'h0)] wire144;
  wire [(4'h8):(1'h0)] wire171;
  wire [(5'h14):(1'h0)] wire170;
  wire signed [(4'hc):(1'h0)] wire156;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(5'h12):(1'h0)] wire151;
  reg [(5'h14):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg168 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg [(4'h8):(1'h0)] reg166 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(4'hd):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg161 = (1'h0);
  reg [(4'h9):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg154 = (1'h0);
  reg [(4'hf):(1'h0)] reg153 = (1'h0);
  reg [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(4'h8):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg148 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire156,
                 wire152,
                 wire151,
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
                 reg157,
                 reg155,
                 reg154,
                 reg153,
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg148 <= ($unsigned(wire147) && {wire145[(3'h7):(2'h2)]});
      reg149 <= {wire146};
      reg150 <= $unsigned(((($signed(wire144) ?
                  wire145[(4'h8):(2'h3)] : wire147[(1'h0):(1'h0)]) ?
              reg148 : {$signed(reg149), (wire145 ? wire147 : wire145)}) ?
          (^~(wire144[(3'h4):(2'h3)] ?
              (reg149 ? wire146 : wire146) : ((8'hb9) ?
                  wire146 : reg148))) : wire145[(3'h6):(2'h3)]));
    end
  assign wire151 = $unsigned(wire144);
  assign wire152 = (~reg150[(5'h11):(4'hb)]);
  always
    @(posedge clk) begin
      if (($unsigned(({(wire145 ? wire145 : wire152), wire152} ?
              $unsigned(wire147) : wire144[(4'hc):(2'h3)])) ?
          wire147 : (reg149[(4'h8):(3'h5)] ?
              (~^($signed(reg149) == ((8'hbc) ?
                  wire144 : reg150))) : wire151[(5'h11):(4'h9)])))
        begin
          reg153 <= $signed(reg150);
          reg154 <= ({wire151, $unsigned($unsigned(wire152))} >> reg153);
        end
      else
        begin
          reg153 <= wire152;
          reg154 <= wire147;
        end
      reg155 <= reg150;
    end
  assign wire156 = $signed(wire151[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg157 <= wire151[(5'h12):(3'h5)];
      if (wire152[(3'h4):(1'h1)])
        begin
          if (({$signed(wire147[(3'h4):(3'h4)]),
                  (($signed(wire156) == reg157) ?
                      $unsigned(wire152) : $unsigned((~|reg155)))} ?
              $signed((^wire156)) : ((^reg157[(3'h5):(1'h0)]) || reg155)))
            begin
              reg158 <= wire144[(4'he):(4'hd)];
              reg159 <= (wire147[(1'h1):(1'h1)] ^~ $signed($signed(({(8'hb4)} ?
                  ((8'hb1) ? (8'ha5) : wire151) : (reg158 ?
                      (8'ha1) : reg154)))));
              reg160 <= (reg155[(3'h4):(3'h4)] >> {((reg155 ^ reg157) >= $signed({(8'haf),
                      reg157})),
                  $unsigned(($signed(reg159) ? $unsigned(wire152) : (7'h40)))});
              reg161 <= $unsigned((^~$unsigned(wire146[(1'h0):(1'h0)])));
            end
          else
            begin
              reg158 <= {({(^$signed(reg154))} ?
                      wire144[(3'h5):(3'h5)] : {$signed((&wire145)),
                          (^~(8'hb8))}),
                  (~|(~&$unsigned(((8'hbf) ? reg159 : reg158))))};
            end
          if ($unsigned($unsigned(((((8'ha9) ? reg149 : reg161) ?
              (reg153 << reg150) : $signed(reg157)) ^ reg148))))
            begin
              reg162 <= $signed((!($signed(reg149[(4'h8):(3'h6)]) - ({reg150,
                      wire145} ?
                  (~|wire147) : reg159[(2'h2):(2'h2)]))));
              reg163 <= (~&wire144[(2'h3):(1'h0)]);
              reg164 <= (+$unsigned((((8'hb9) && $unsigned(wire152)) << $unsigned((!reg159)))));
              reg165 <= reg153[(4'h8):(1'h0)];
            end
          else
            begin
              reg162 <= $unsigned((^reg148[(1'h1):(1'h1)]));
              reg163 <= $unsigned((~&$signed($signed((wire156 > reg165)))));
              reg164 <= $signed({$unsigned((reg155[(3'h7):(1'h0)] ?
                      reg148 : (|wire147)))});
              reg165 <= (($signed(({reg165} ?
                  $signed(wire145) : reg162)) ^~ reg158) + reg160);
              reg166 <= reg165[(3'h4):(2'h3)];
            end
          if (reg166[(2'h2):(2'h2)])
            begin
              reg167 <= $signed(reg154[(3'h5):(3'h5)]);
              reg168 <= $unsigned(wire156);
              reg169 <= reg165;
            end
          else
            begin
              reg167 <= ({$signed($unsigned($unsigned(wire145)))} ?
                  (reg159[(4'h9):(2'h3)] ?
                      ($unsigned((wire147 & wire144)) ?
                          $unsigned($unsigned(reg154)) : reg166[(3'h4):(3'h4)]) : $signed($signed((reg149 || (8'haa))))) : reg162[(4'ha):(3'h7)]);
              reg168 <= reg165;
              reg169 <= $signed(wire147[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          if ((^$signed($unsigned($unsigned((wire146 ^~ reg162))))))
            begin
              reg158 <= $unsigned(((($unsigned(wire156) >= $unsigned((8'hbf))) ?
                      $unsigned($unsigned(reg162)) : (8'haf)) ?
                  reg155[(1'h0):(1'h0)] : (!reg164[(3'h7):(3'h6)])));
              reg159 <= wire156;
            end
          else
            begin
              reg158 <= wire147[(2'h3):(1'h1)];
              reg159 <= (~(^$signed((reg165[(1'h0):(1'h0)] ?
                  $unsigned(wire144) : reg157[(4'h9):(3'h5)]))));
              reg160 <= {reg162[(4'hd):(3'h6)],
                  $signed((reg168 >= $signed((reg155 & reg154))))};
            end
          reg161 <= (((-reg155[(3'h5):(1'h0)]) ?
                  (wire152[(4'hb):(4'hb)] ?
                      $signed({reg149}) : wire146[(1'h1):(1'h1)]) : ({(reg154 ?
                              wire156 : wire146)} ?
                      ((reg150 << reg159) ?
                          $signed(reg154) : reg158) : (~^((8'hbe) ?
                          wire147 : (8'hb3))))) ?
              (reg168[(3'h5):(1'h0)] ?
                  (^($signed(reg166) ?
                      (reg148 - reg159) : (^~(8'hbf)))) : $signed(((wire146 ?
                          reg159 : (7'h43)) ?
                      $unsigned((8'ha3)) : $signed(reg167)))) : wire147);
          if ((~|($unsigned(reg161) + $unsigned(reg153[(3'h7):(2'h3)]))))
            begin
              reg162 <= $unsigned($signed(($unsigned($signed(wire147)) & (~^(reg162 ?
                  reg163 : wire147)))));
              reg163 <= ((((wire146[(3'h4):(1'h1)] ?
                      reg169[(5'h10):(2'h3)] : (reg164 ?
                          reg158 : reg162)) == reg158) ?
                  reg155 : (&((reg157 | reg168) ?
                      {reg155, (8'hbb)} : (8'ha8)))) * {(+reg163),
                  $signed($unsigned(reg160[(3'h7):(3'h7)]))});
              reg164 <= reg149;
              reg165 <= reg153[(4'hb):(3'h7)];
              reg166 <= wire147[(2'h2):(1'h1)];
            end
          else
            begin
              reg162 <= reg160[(4'h9):(4'h9)];
              reg163 <= reg168[(4'hf):(4'hd)];
              reg164 <= $unsigned($unsigned(reg167[(2'h2):(1'h1)]));
              reg165 <= reg158[(3'h5):(2'h3)];
              reg166 <= $signed(reg169);
            end
          reg167 <= ((+reg166[(1'h0):(1'h0)]) ?
              ($signed((wire152[(4'he):(2'h2)] ?
                  (~^reg165) : $signed(wire145))) ^ {{(&reg148)}}) : ((((~&reg162) >= reg149[(2'h3):(1'h0)]) ?
                      (reg149 | reg162) : $unsigned((reg153 ^ (8'h9f)))) ?
                  (~^reg153) : ((~&(~|wire152)) == $unsigned(wire147))));
        end
    end
  assign wire170 = $signed($unsigned(((&{reg169, wire156}) ?
                       {$unsigned(reg164),
                           (reg166 ^ reg158)} : (reg163[(3'h6):(3'h5)] ?
                           reg160[(4'h9):(3'h7)] : wire156))));
  assign wire171 = (reg169 ?
                       wire151[(1'h0):(1'h0)] : $signed((reg162 ?
                           ($unsigned(wire147) ?
                               (8'ha6) : (reg150 + reg167)) : ((^~(7'h40)) ?
                               (reg158 && reg159) : ((8'hb7) ?
                                   reg169 : reg168)))));
endmodule

module module109
#(parameter param140 = (|((-({(8'hbd)} >>> ((8'hb2) ? (8'ha4) : (8'hae)))) ? (((8'ha3) <= (|(8'h9f))) * (8'hae)) : (&(+((8'ha9) ? (8'hb1) : (7'h44)))))))
(y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire113;
  input wire [(3'h7):(1'h0)] wire112;
  input wire signed [(4'hd):(1'h0)] wire111;
  input wire signed [(4'h9):(1'h0)] wire110;
  wire [(2'h2):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire137;
  wire [(3'h6):(1'h0)] wire136;
  wire signed [(5'h12):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire133;
  wire [(3'h5):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(2'h2):(1'h0)] wire125;
  wire [(4'hc):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'he):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  assign y = {wire139,
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
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire115,
                 wire114,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire114 = $unsigned((wire111 != (&(wire113 ?
                       (^wire111) : (wire110 ? wire110 : wire113)))));
  assign wire115 = wire111[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg116 <= wire115;
      reg117 <= $signed($unsigned($unsigned((|wire115[(4'ha):(2'h3)]))));
      if ($unsigned(wire115))
        begin
          reg118 <= ((~^(wire112 ?
              ($signed(reg117) ? wire112 : (^reg116)) : (!((8'hbe) ?
                  wire113 : reg117)))) << $signed((!$unsigned(wire110))));
          reg119 <= (~$signed((^~$unsigned($unsigned(reg117)))));
          if ($signed((reg116[(2'h2):(2'h2)] ~^ {reg116[(1'h1):(1'h0)]})))
            begin
              reg120 <= $unsigned($unsigned(wire111));
              reg121 <= (~&reg120[(1'h0):(1'h0)]);
              reg122 <= {(~{$signed((wire111 <<< wire113))})};
            end
          else
            begin
              reg120 <= $signed((reg121[(1'h1):(1'h1)] > (reg120[(3'h5):(3'h5)] >>> (wire114 | (reg121 ?
                  wire110 : reg122)))));
            end
          reg123 <= reg117;
        end
      else
        begin
          reg118 <= (8'ha9);
          if (wire113[(2'h2):(2'h2)])
            begin
              reg119 <= reg117[(5'h13):(5'h11)];
              reg120 <= (8'hb0);
              reg121 <= reg117;
              reg122 <= $signed((((8'hba) >> $signed($signed((8'hab)))) & $signed(($signed(reg118) ?
                  $signed(wire110) : reg122))));
            end
          else
            begin
              reg119 <= (8'hbc);
              reg120 <= ((({wire111,
                  $signed((8'hb6))} && reg122) + $signed(($signed(reg118) ^ (reg118 <<< (8'h9d))))) ^~ {{((~^(8'ha8)) ?
                          reg116 : reg119[(4'h8):(1'h0)]),
                      ((wire115 ? reg119 : wire112) ?
                          (reg118 ? wire112 : (7'h42)) : (~(8'hbc)))}});
            end
        end
      reg124 <= $unsigned(($unsigned((reg116[(1'h0):(1'h0)] ?
          wire115[(3'h6):(3'h4)] : (wire110 ?
              (8'ha4) : reg120))) >>> wire112[(3'h4):(2'h2)]));
    end
  assign wire125 = reg120;
  assign wire126 = ($signed(({(~|reg124)} ?
                           {$signed(reg119),
                               reg117[(1'h1):(1'h0)]} : (~|$unsigned((8'hb9))))) ?
                       (reg119 ?
                           $unsigned(({reg124} >> wire113)) : ($signed($unsigned((8'hbe))) ?
                               {$signed(wire111)} : {(~&(8'ha3))})) : ((~wire115) ?
                           ($unsigned((reg117 ^ reg121)) ?
                               $unsigned(reg123) : wire115) : (~|wire125)));
  assign wire127 = $signed(($unsigned(reg119[(3'h6):(3'h4)]) ?
                       reg116 : {({wire114} ? $unsigned(wire113) : (^wire114)),
                           (~|(wire114 ? reg117 : wire114))}));
  assign wire128 = ($unsigned((^~{$unsigned(wire126), $unsigned(reg121)})) ?
                       reg123 : $unsigned((^$signed($signed((8'haf))))));
  assign wire129 = reg123;
  assign wire130 = wire111[(4'hb):(2'h3)];
  assign wire131 = (^reg117);
  assign wire132 = wire114[(3'h5):(3'h5)];
  assign wire133 = $unsigned(wire110);
  assign wire134 = (|wire113[(2'h3):(2'h3)]);
  assign wire135 = ((wire132 == $signed(($unsigned(wire115) < (reg124 ~^ reg118)))) ?
                       wire128 : $signed((reg124[(1'h1):(1'h1)] < ((reg122 ?
                               wire132 : reg124) ?
                           {wire133, wire131} : {(8'hab)}))));
  assign wire136 = ($unsigned($signed((wire125[(1'h0):(1'h0)] ?
                           (wire111 ?
                               reg122 : (8'hbd)) : ((8'h9c) || wire114)))) ?
                       reg123[(1'h0):(1'h0)] : ($unsigned($unsigned((wire125 + (8'ha2)))) ?
                           $signed($unsigned((reg119 >> (8'hbb)))) : (+{wire126,
                               (wire113 == wire132)})));
  assign wire137 = ($signed(($unsigned($signed(wire130)) ?
                       $unsigned({wire115,
                           wire136}) : ((~^reg123) != reg119))) == reg123);
  assign wire138 = wire131[(2'h2):(1'h1)];
  assign wire139 = wire115[(1'h1):(1'h0)];
endmodule

module module88  (y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire92;
  input wire [(3'h4):(1'h0)] wire91;
  input wire [(4'hc):(1'h0)] wire90;
  input wire signed [(3'h7):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(4'hb):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(4'h8):(1'h0)] wire96;
  wire [(4'he):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  reg [(5'h15):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg102 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  assign y = {wire104,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= (!wire92[(4'h9):(4'h9)]);
    end
  assign wire94 = (((reg93 ?
                              $unsigned((wire91 <= wire92)) : $signed({reg93,
                                  wire89})) ?
                          $unsigned(($signed(reg93) ?
                              (wire91 != (8'h9f)) : (7'h40))) : {reg93[(4'h8):(1'h0)]}) ?
                      $signed(($signed((wire92 ? (7'h42) : reg93)) ?
                          (wire90[(4'h9):(3'h6)] ?
                              $unsigned(reg93) : wire90[(4'h8):(3'h4)]) : wire89)) : (wire91[(1'h0):(1'h0)] ?
                          ($unsigned(wire90) ? (8'haf) : wire90) : reg93));
  assign wire95 = (^(+(~&$unsigned($signed(wire90)))));
  assign wire96 = wire91;
  assign wire97 = (wire92 || (-((!$unsigned(reg93)) ?
                      (wire90 > ((8'hac) ?
                          wire90 : wire92)) : (wire94[(1'h1):(1'h1)] <<< (^wire96)))));
  assign wire98 = (~&(~^({reg93, wire90} ?
                      {(~|wire89), {wire95}} : $unsigned($unsigned((8'haf))))));
  assign wire99 = {wire95};
  always
    @(posedge clk) begin
      reg100 <= $signed($unsigned($unsigned({(wire96 <= (8'hb0))})));
      reg101 <= {$unsigned(($unsigned((+wire97)) ?
              wire97 : {reg93, $signed(wire94)})),
          wire91};
      reg102 <= (|wire89);
      reg103 <= {$unsigned(reg93[(4'ha):(4'h8)])};
    end
  assign wire104 = $signed({$signed(($unsigned(wire92) + (wire92 ?
                           wire89 : wire91)))});
endmodule
