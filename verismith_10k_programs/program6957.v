module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire124;
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  assign y = {wire126,
                 wire28,
                 wire30,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire79,
                 wire81,
                 wire124,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 (1'h0)};
  module4 #() modinst29 (wire28, clk, wire0, wire1, wire2, wire3, (8'hb2));
  assign wire30 = wire28[(5'h10):(3'h5)];
  always
    @(posedge clk) begin
      reg31 <= $signed((~wire3[(5'h10):(4'hb)]));
      reg32 <= (reg31[(2'h3):(1'h1)] ?
          $signed($unsigned($signed((reg31 < wire30)))) : $signed(((wire0[(4'ha):(4'ha)] ?
                  wire2[(2'h2):(1'h1)] : $signed(wire1)) ?
              {$unsigned(reg31)} : ((~^wire2) ? (7'h44) : (!wire3)))));
      if ({wire0, wire3})
        begin
          reg33 <= (+($unsigned({(~wire2),
              wire30[(2'h2):(1'h0)]}) && ($signed($unsigned(wire0)) ?
              $signed((reg32 ? wire30 : wire2)) : (^~$unsigned(wire3)))));
          if ($unsigned((~|wire0)))
            begin
              reg34 <= (8'ha4);
              reg35 <= reg32;
            end
          else
            begin
              reg34 <= $unsigned(wire30);
              reg35 <= reg31[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg33 <= (~^$unsigned($unsigned(((wire28 >> (8'h9f)) ^ (wire28 ?
              (8'hb5) : wire28)))));
          if (reg31)
            begin
              reg34 <= ($signed({reg34}) ^~ ($signed((&wire1[(4'h9):(3'h6)])) <= (reg33[(2'h2):(2'h2)] || {wire0})));
            end
          else
            begin
              reg34 <= {{wire3},
                  ({((reg31 * wire2) ? (wire1 ^~ reg31) : $signed(wire0)),
                          $unsigned(((8'haa) ? wire2 : wire30))} ?
                      ((-(&wire28)) ?
                          wire30[(1'h1):(1'h0)] : $unsigned($signed(reg33))) : (~^wire28[(4'hb):(2'h2)]))};
              reg35 <= $signed($unsigned(reg33));
              reg36 <= $unsigned($unsigned(reg31[(4'h8):(2'h3)]));
            end
        end
      reg37 <= ((^~(+(&reg35))) ~^ (^~reg31));
      if ((($unsigned($unsigned((wire0 || wire3))) ?
          (-reg37[(4'hc):(3'h4)]) : ($unsigned(wire3[(3'h4):(2'h3)]) ?
              reg34 : $signed((wire28 - wire28)))) * (^~$signed(wire0[(4'hd):(3'h4)]))))
        begin
          reg38 <= {$unsigned(reg32[(2'h2):(2'h2)]),
              $signed((reg37 != ((wire2 ? reg34 : wire0) ~^ (-wire3))))};
          reg39 <= {((^(^~reg34[(3'h4):(2'h3)])) ?
                  $signed({(reg33 << (8'haf)),
                      wire30[(1'h0):(1'h0)]}) : {wire0[(4'hc):(4'h9)],
                      reg36[(4'hb):(3'h5)]})};
          if ($signed(({$unsigned((reg37 >> reg33))} ~^ reg38)))
            begin
              reg40 <= wire1;
              reg41 <= (~|(8'hb2));
              reg42 <= (^((^~(&(reg38 ? (7'h41) : reg36))) ?
                  $signed((~(-(8'hb7)))) : ($signed(reg31) ?
                      (~^(~|reg37)) : $unsigned((^~wire3)))));
              reg43 <= $unsigned(($unsigned(($signed(wire30) ?
                  reg41[(3'h6):(3'h4)] : (wire3 ?
                      wire1 : wire30))) && $unsigned({(&wire2)})));
            end
          else
            begin
              reg40 <= $unsigned((wire28 ?
                  $signed((~reg36[(3'h7):(1'h1)])) : (reg37[(4'h8):(2'h2)] < (reg38[(2'h2):(1'h1)] ?
                      (wire30 ? reg38 : (8'hab)) : (&(8'ha1))))));
              reg41 <= $unsigned((&reg35));
            end
          reg44 <= $signed($signed({$signed(reg36[(4'h8):(2'h3)])}));
          reg45 <= reg44;
        end
      else
        begin
          if (reg34)
            begin
              reg38 <= ($signed(reg40[(2'h2):(1'h1)]) ?
                  reg41[(5'h10):(3'h4)] : (&(~&(^~{wire1, reg39}))));
              reg39 <= ($signed({({reg41,
                      wire0} >>> $signed(reg37))}) ~^ ($unsigned((~|{reg42})) ?
                  ((&{reg44}) <= {((8'h9d) != wire1),
                      {(7'h41), wire28}}) : (8'haf)));
              reg40 <= $unsigned(($signed($unsigned((-reg38))) ?
                  $signed($unsigned((reg32 < reg31))) : reg33[(1'h1):(1'h1)]));
              reg41 <= ($signed($signed($unsigned((~&reg31)))) >= reg35[(4'h9):(1'h1)]);
              reg42 <= $signed((^{reg44, (^(reg42 < reg42))}));
            end
          else
            begin
              reg38 <= (-$signed((&$signed($unsigned(wire2)))));
              reg39 <= ($signed(reg31) ?
                  ($unsigned({reg32,
                      reg43}) >>> reg38[(2'h3):(2'h3)]) : (|($unsigned(reg36) ?
                      reg43[(3'h6):(1'h1)] : wire2)));
              reg40 <= ((8'h9d) <= ($signed({$signed(reg33)}) ?
                  $unsigned(((reg38 >> reg33) + (~reg40))) : $signed((reg43[(3'h5):(2'h3)] >= (~reg45)))));
              reg41 <= $signed(reg44);
              reg42 <= (wire1[(4'h8):(1'h1)] >>> $signed($signed(((8'h9d) ?
                  (reg32 >> wire30) : wire28))));
            end
          reg43 <= $signed($signed({((wire28 ? reg36 : wire0) ?
                  wire1[(1'h0):(1'h0)] : $signed((7'h40))),
              (8'hba)}));
        end
    end
  assign wire46 = reg31;
  assign wire47 = reg39[(4'ha):(3'h5)];
  assign wire48 = $signed((wire3[(4'hc):(2'h2)] >> reg42[(2'h3):(1'h0)]));
  assign wire49 = $unsigned(reg33[(1'h1):(1'h1)]);
  assign wire50 = $signed(($signed($signed($unsigned(reg34))) <= (+{(wire28 ?
                          reg33 : (8'ha8)),
                      (~&wire49)})));
  assign wire51 = (-$signed($unsigned(((wire50 ? wire50 : reg42) <<< wire30))));
  always
    @(posedge clk) begin
      if ((-(reg32 + wire2)))
        begin
          reg52 <= wire46[(5'h11):(3'h5)];
          reg53 <= $unsigned(reg41);
          reg54 <= $unsigned($unsigned((+(^reg38[(2'h2):(2'h2)]))));
          reg55 <= reg38[(2'h2):(1'h0)];
        end
      else
        begin
          reg52 <= ((!reg52[(4'he):(2'h2)]) ?
              (wire0 && wire49[(4'h9):(3'h7)]) : reg43[(3'h7):(3'h5)]);
          reg53 <= reg54;
          if (wire0)
            begin
              reg54 <= (+reg43[(2'h2):(2'h2)]);
              reg55 <= wire49;
            end
          else
            begin
              reg54 <= reg40[(1'h0):(1'h0)];
              reg55 <= reg41;
              reg56 <= {reg54};
            end
        end
      reg57 <= $signed((({$signed(reg39), wire46[(3'h6):(3'h5)]} ?
          ((wire2 + reg32) && {reg56}) : $signed((reg39 >> wire48))) != reg42));
      reg58 <= reg35;
      if ((&(-wire51[(1'h0):(1'h0)])))
        begin
          reg59 <= ((+reg39[(2'h2):(1'h1)]) > {(&(wire28 | (reg33 ?
                  wire3 : (8'h9f))))});
        end
      else
        begin
          reg59 <= $signed({{{reg36[(2'h3):(1'h1)]}, $unsigned((~|(8'hb0)))},
              {$signed((wire3 >>> wire30))}});
        end
    end
  module60 #() modinst80 (.wire63(wire2), .wire64(reg37), .wire61(wire51), .y(wire79), .wire62(reg39), .clk(clk));
  assign wire81 = (-($signed((~|$signed((7'h41)))) ^~ ((^(!reg43)) >> $unsigned({reg35}))));
  module82 #() modinst125 (wire124, clk, reg43, reg42, wire3, reg45);
  assign wire126 = $signed(reg58[(4'hc):(4'h9)]);
endmodule

module module82  (y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire86;
  input wire signed [(5'h15):(1'h0)] wire85;
  input wire signed [(3'h5):(1'h0)] wire84;
  input wire [(5'h12):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire123;
  wire signed [(5'h10):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire121;
  wire signed [(4'hf):(1'h0)] wire120;
  wire [(4'h9):(1'h0)] wire118;
  assign y = {wire123, wire122, wire121, wire120, wire118, (1'h0)};
  module87 #() modinst119 (wire118, clk, wire85, wire86, wire83, wire84, (8'hb9));
  assign wire120 = wire84;
  assign wire121 = (wire118 << $unsigned(wire83[(3'h4):(3'h4)]));
  assign wire122 = ($unsigned((wire120 && ((8'ha7) ?
                       wire83 : $signed(wire118)))) && ((({wire85} << $unsigned((8'hbc))) ?
                           {{wire121},
                               (wire118 >> wire118)} : (wire120 == $unsigned(wire85))) ?
                       ((+$signed(wire85)) ?
                           wire85 : wire85[(5'h10):(3'h7)]) : wire120[(4'hb):(3'h6)]));
  assign wire123 = wire84;
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire64;
  input wire [(3'h7):(1'h0)] wire63;
  input wire [(2'h3):(1'h0)] wire62;
  input wire [(4'h9):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire78;
  wire [(5'h14):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire67;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire65 = (8'hbb);
  assign wire66 = (((((-wire65) ? wire65 : (^(8'ha9))) ?
                          wire62 : wire65[(4'h9):(3'h5)]) ?
                      $signed(((~&wire61) <= wire62[(2'h3):(1'h0)])) : ((~(!wire65)) != ($unsigned((8'ha6)) ?
                          $unsigned(wire61) : $unsigned(wire64)))) ~^ $unsigned((wire61 ?
                      ((wire65 < wire62) ?
                          {wire65, wire65} : {(7'h41)}) : $unsigned((8'hbe)))));
  assign wire67 = ($signed($unsigned($signed(wire65))) ?
                      ($unsigned($unsigned($signed(wire61))) ?
                          (~^$unsigned($signed(wire66))) : ($signed($unsigned(wire66)) ^~ wire63[(3'h5):(3'h5)])) : (wire61[(3'h6):(2'h3)] <= wire66[(1'h1):(1'h0)]));
  assign wire68 = ($unsigned((wire66 ?
                      (~&wire65[(2'h3):(1'h0)]) : wire65[(4'he):(4'hd)])) + wire65[(5'h13):(4'hc)]);
  assign wire69 = $unsigned(wire68);
  assign wire70 = ((-(~&wire68)) - $signed(wire65));
  always
    @(posedge clk) begin
      if ({(8'h9d), (8'hb1)})
        begin
          reg71 <= (($unsigned($signed(wire64)) == ((&wire66[(1'h0):(1'h0)]) ?
                  wire62 : wire68)) ?
              (($signed(wire70[(3'h4):(1'h0)]) == {(^wire63),
                      $signed(wire62)}) ?
                  ((wire70[(3'h6):(1'h0)] < (wire69 ? (8'hae) : wire61)) ?
                      wire65[(5'h12):(5'h10)] : $unsigned($signed(wire69))) : (wire62 ~^ wire66)) : (~$signed($unsigned($signed((8'ha4))))));
          if ($unsigned(wire62[(2'h2):(2'h2)]))
            begin
              reg72 <= $signed(wire69[(5'h12):(4'hf)]);
              reg73 <= $signed($unsigned($signed(wire69[(5'h11):(4'hb)])));
            end
          else
            begin
              reg72 <= ($unsigned($unsigned(wire65[(1'h1):(1'h0)])) * (&(((reg73 || reg73) ?
                      $unsigned(wire69) : (wire62 ? wire67 : wire69)) ?
                  ($unsigned(wire70) ?
                      wire63[(3'h6):(1'h1)] : (~wire68)) : wire65)));
              reg73 <= ((~(reg71 ?
                  wire70[(2'h3):(1'h1)] : ({wire62, wire69} ?
                      (8'hb3) : (wire64 ?
                          wire63 : reg71)))) ^~ $signed($unsigned(wire70[(3'h5):(2'h2)])));
              reg74 <= ((wire65 ?
                      reg71[(4'hd):(4'hc)] : ($unsigned(wire69) >= wire68)) ?
                  {{$signed({wire61}),
                          ($signed(wire64) - ((8'hb4) || wire65))}} : wire66[(2'h2):(2'h2)]);
            end
          reg75 <= reg71;
        end
      else
        begin
          reg71 <= $signed(reg74[(3'h5):(2'h3)]);
        end
    end
  always
    @(posedge clk) begin
      reg76 <= $unsigned(((&wire62) ?
          $unsigned((~|(wire69 ^ wire61))) : wire69));
    end
  assign wire77 = wire70;
  assign wire78 = {{$unsigned(($unsigned((8'h9c)) ?
                              ((7'h43) * wire62) : wire68[(1'h1):(1'h0)])),
                          (+(reg75[(1'h0):(1'h0)] ? wire77 : {wire64}))},
                      {{wire64}}};
endmodule

module module4
#(parameter param26 = ((~&{(((8'hb6) <= (7'h43)) >> ((8'ha6) >> (8'haf)))}) | ((|(|{(8'ha2)})) > ({(8'ha1), ((8'h9e) * (8'hbe))} ? {(|(8'hae)), ((8'hbd) ~^ (8'hbf))} : ({(8'hba)} || {(8'ha2), (8'hae)})))), 
parameter param27 = (~&(param26 < ((^~((8'ha6) ? param26 : param26)) <<< ({param26, param26} ? {param26} : param26)))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  input wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire10;
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire10 = wire6[(2'h3):(2'h2)];
  assign wire11 = $unsigned((wire6[(2'h3):(2'h3)] != $signed((~&$unsigned(wire5)))));
  assign wire12 = (((8'ha9) - ($signed((^~wire6)) > (~(wire6 ?
                      wire8 : wire8)))) > ($unsigned(((wire8 ? wire11 : wire6) ?
                      wire5[(3'h5):(1'h1)] : (8'ha4))) ^ {(&wire5[(3'h4):(3'h4)])}));
  assign wire13 = wire10[(3'h4):(3'h4)];
  assign wire14 = wire6;
  assign wire15 = ($signed(wire11) ?
                      {wire14, wire9[(2'h2):(2'h2)]} : $signed(wire9));
  always
    @(posedge clk) begin
      if (wire14[(5'h12):(1'h1)])
        begin
          if ($unsigned($signed($signed(wire8[(1'h1):(1'h0)]))))
            begin
              reg16 <= {wire8[(4'hd):(3'h7)], wire5};
              reg17 <= wire11[(2'h2):(1'h0)];
              reg18 <= (((wire6[(3'h6):(3'h6)] >= wire14) ?
                  (wire8 ?
                      {$unsigned(wire8)} : $signed(wire14)) : wire7) >> wire5[(1'h0):(1'h0)]);
            end
          else
            begin
              reg16 <= $signed((((wire8 < ((8'h9f) ?
                      reg18 : wire12)) <<< $unsigned(wire13[(4'h8):(2'h3)])) ?
                  ($unsigned($unsigned(wire7)) >>> wire8[(3'h5):(1'h0)]) : wire7[(4'ha):(3'h4)]));
              reg17 <= ($signed($unsigned(($unsigned(reg18) ?
                      $unsigned(wire5) : wire10))) ?
                  (8'ha2) : ($unsigned(($unsigned(wire5) == $signed((8'hbd)))) ?
                      reg17 : ($signed((wire15 ?
                          wire12 : wire8)) != ((~^(8'hb8)) >= (reg18 ?
                          wire10 : (8'ha0))))));
            end
        end
      else
        begin
          reg16 <= wire12;
          reg17 <= $unsigned(($signed($unsigned((~&wire7))) > ($signed((wire13 ?
              wire14 : (8'ha4))) || wire5)));
          reg18 <= reg16[(1'h1):(1'h0)];
          reg19 <= (($unsigned(wire14[(3'h6):(3'h6)]) != $unsigned(($unsigned(wire14) ?
              wire5 : (+wire12)))) ^~ ($unsigned($signed(wire14)) ?
              (((wire8 < (8'hbc)) ?
                  wire9 : $unsigned(wire11)) & wire9[(1'h1):(1'h1)]) : (^($unsigned(wire6) | (~|wire15)))));
        end
      reg20 <= (($unsigned(((reg16 & reg17) ?
          $signed(wire10) : (wire12 + (8'ha8)))) ~^ wire9[(1'h0):(1'h0)]) < $unsigned((&(reg17 && (~|wire8)))));
      reg21 <= (&$signed((wire9 ? (8'h9c) : wire11)));
    end
  assign wire22 = (reg18 + $signed((~&((|wire9) + $unsigned(wire9)))));
  assign wire23 = ($unsigned({wire7[(3'h4):(3'h4)]}) << (($unsigned($unsigned(wire10)) ~^ ((wire10 * wire9) ^ $signed(wire22))) ?
                      ($unsigned((reg16 ? (8'hb9) : wire6)) ?
                          $signed($unsigned(wire9)) : (~^(wire13 ?
                              reg21 : wire5))) : wire5[(4'ha):(1'h0)]));
  assign wire24 = $signed($unsigned({((wire13 ? wire12 : (8'hac)) ?
                          $signed(wire10) : $signed(wire23)),
                      ((wire12 < wire14) | (reg21 <= reg20))}));
  assign wire25 = ($signed((({wire24} && $signed(wire8)) >= (wire8 ?
                          wire23 : $unsigned((8'ha7))))) ?
                      ((wire22[(1'h0):(1'h0)] ?
                          $signed($signed(reg19)) : ((8'hb3) ?
                              (wire9 | wire22) : wire5[(1'h0):(1'h0)])) != (~$signed($signed(wire24)))) : ({wire23} ?
                          wire10 : (8'ha4)));
endmodule

module module87
#(parameter param116 = (8'hbf), 
parameter param117 = (param116 <<< (((param116 ? (~|param116) : (^param116)) ? (+param116) : ((param116 ? param116 : param116) || (param116 ? (8'ha4) : param116))) & param116)))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire92;
  input wire [(3'h7):(1'h0)] wire91;
  input wire signed [(2'h2):(1'h0)] wire90;
  input wire [(2'h2):(1'h0)] wire89;
  input wire [(5'h12):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire113;
  wire [(3'h7):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire104;
  wire signed [(3'h5):(1'h0)] wire103;
  wire [(5'h12):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire93;
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg94 = (1'h0);
  assign y = {wire113,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire101,
                 wire100,
                 wire93,
                 reg115,
                 reg114,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg102,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire93 = {wire90, $signed({$unsigned($signed(wire88))})};
  always
    @(posedge clk) begin
      reg94 <= ({wire88[(3'h5):(2'h3)],
          ($signed($unsigned(wire91)) >>> {$unsigned((8'ha9))})} | wire93[(5'h12):(5'h12)]);
      reg95 <= $signed(wire91);
      if ($signed($unsigned(((-(wire93 ? reg94 : wire92)) ?
          ((wire91 >= wire92) >>> wire92[(3'h4):(2'h2)]) : ($unsigned(reg95) ~^ $unsigned(reg94))))))
        begin
          reg96 <= (wire88[(5'h11):(3'h6)] ?
              (|$signed($unsigned((wire90 <= wire90)))) : (((wire93 ?
                      (wire92 ? wire91 : wire89) : (wire90 & reg94)) ?
                  (wire92[(5'h11):(1'h0)] << (~|wire91)) : (^(8'hae))) >>> wire89));
          reg97 <= wire90;
          reg98 <= wire91[(2'h3):(1'h1)];
        end
      else
        begin
          if ((8'hba))
            begin
              reg96 <= ((!(~|$signed(((8'hb3) ? wire92 : reg97)))) ?
                  $unsigned($signed(($signed(wire91) + (~reg94)))) : {$signed($signed((reg97 ^~ reg95)))});
            end
          else
            begin
              reg96 <= wire93;
            end
          reg97 <= wire93;
          reg98 <= ((wire88 ^~ $signed($unsigned($signed((8'ha1))))) * (reg97 ~^ ($unsigned($signed(wire91)) + (|(wire91 + reg95)))));
          reg99 <= (!wire89);
        end
    end
  assign wire100 = $unsigned($unsigned((reg98 ?
                       $signed($signed(wire89)) : (8'ha1))));
  assign wire101 = (^reg98);
  always
    @(posedge clk) begin
      reg102 <= wire101;
    end
  assign wire103 = (|((reg94 << wire100) ?
                       (~|((~&(8'hae)) ?
                           reg102 : (reg96 ?
                               wire89 : reg96))) : (((|(8'haf)) & (reg97 - reg94)) ?
                           ((wire91 >= wire88) > (~|wire88)) : (&wire90))));
  assign wire104 = $unsigned($signed({{$unsigned(reg95), (reg94 == reg95)},
                       (-reg94[(2'h3):(1'h1)])}));
  assign wire105 = reg97[(2'h3):(2'h3)];
  assign wire106 = (({reg97,
                           ((reg94 ?
                               wire89 : reg98) == reg97[(4'hb):(3'h4)])} < $signed(wire104[(3'h5):(2'h2)])) ?
                       reg99[(4'hd):(4'h9)] : {{wire100[(4'hb):(3'h6)]},
                           ({(reg96 ? (7'h40) : reg95),
                               $signed(reg95)} == ((wire104 ?
                               wire92 : reg98) && {wire90}))});
  always
    @(posedge clk) begin
      reg107 <= (+wire89[(2'h2):(1'h1)]);
      if ((((~reg98) ?
              $unsigned((reg107[(3'h4):(1'h1)] > wire103)) : {(8'ha6),
                  $signed($signed(reg97))}) ?
          $unsigned(((reg95 ?
              (wire93 ? wire93 : reg94) : {wire89}) == (((8'hb7) > wire103) ?
              ((7'h42) ? reg99 : wire89) : (!wire91)))) : reg99))
        begin
          reg108 <= $signed($unsigned(((7'h41) ?
              (reg96 ? (reg95 ? reg102 : reg94) : (reg94 + reg95)) : (8'hbc))));
        end
      else
        begin
          reg108 <= (8'h9d);
          reg109 <= $signed((~^reg99));
          reg110 <= (~(($unsigned((reg96 ? reg99 : reg102)) ?
              wire106 : $signed((reg109 <<< wire103))) - reg107));
          reg111 <= $unsigned($unsigned($signed(wire91[(1'h0):(1'h0)])));
          reg112 <= $unsigned(wire90);
        end
    end
  assign wire113 = reg99[(3'h6):(3'h6)];
  always
    @(posedge clk) begin
      reg114 <= {reg110[(4'hf):(1'h1)]};
      reg115 <= (wire88 ^ wire113);
    end
endmodule
