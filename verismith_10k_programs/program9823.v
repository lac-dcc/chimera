module top
#(parameter param117 = ((-{(+((8'hbf) ? (7'h44) : (8'hb7)))}) & {((+((8'hb1) ? (7'h44) : (8'ha8))) ? {((8'ha0) >> (8'h9e))} : (+(8'hb0))), {(~&(|(8'h9d))), (~(+(8'h9e)))}}), 
parameter param118 = {(~|(param117 ? ((param117 ? param117 : param117) <<< (param117 ? param117 : param117)) : ({param117} ? (7'h40) : param117)))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire115;
  wire signed [(5'h11):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'h8):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire39;
  assign y = {wire115, wire42, wire41, wire4, wire39, (1'h0)};
  assign wire4 = wire2;
  module5 #() modinst40 (wire39, clk, wire0, wire3, wire1, wire4, wire2);
  assign wire41 = ($unsigned(wire39) ?
                      (^~$unsigned(wire1)) : $unsigned({wire2[(3'h7):(1'h0)],
                          $signed(wire39[(3'h5):(2'h3)])}));
  assign wire42 = {(^~(&wire0)), wire41[(1'h1):(1'h1)]};
  module43 #() modinst116 (.wire46(wire0), .clk(clk), .wire45(wire4), .y(wire115), .wire47(wire1), .wire44(wire42));
endmodule

module module43
#(parameter param114 = (((8'hbc) >= ((^~((8'hbd) ? (8'ha8) : (8'hbf))) ? (((8'had) ? (7'h41) : (8'hab)) ? (~^(7'h44)) : (~|(8'h9e))) : (~|((8'ha7) | (7'h44))))) ? {{(((8'haf) ? (8'hab) : (8'h9e)) ? ((8'hbf) ? (8'hbe) : (8'ha4)) : ((8'hb1) ? (8'hb7) : (7'h42))), ((8'hb8) * {(8'hbb)})}, ((!((8'hb8) ? (8'had) : (8'hab))) ? (&((8'hab) ? (8'h9c) : (8'ha0))) : ({(8'hb9)} ? (&(8'hb1)) : ((8'hab) << (8'hb7))))} : (((+{(8'hb5), (8'h9f)}) < {((8'h9c) << (8'hbf))}) ? ((((7'h43) ^~ (8'hac)) ? ((8'hba) ^~ (8'hb5)) : (&(8'ha3))) + {((8'ha3) != (8'ha6))}) : ((((8'hb0) ? (8'hbb) : (8'hbe)) == ((8'hbd) & (8'ha0))) ? (-((8'ha2) ? (8'hae) : (8'hba))) : (((8'hb0) > (8'hb9)) & (&(8'hbd)))))))
(y, clk, wire47, wire46, wire45, wire44);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire47;
  input wire signed [(4'ha):(1'h0)] wire46;
  input wire signed [(4'h8):(1'h0)] wire45;
  input wire [(4'hb):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire69;
  wire [(5'h13):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire102;
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  assign y = {wire113,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire67,
                 wire53,
                 wire52,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire102,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg48 <= ((wire45[(3'h5):(2'h2)] ?
          {wire44[(2'h3):(2'h2)],
              wire45} : $unsigned(wire46)) - $signed(wire45[(3'h4):(1'h0)]));
      reg49 <= $unsigned({((~|(wire46 | (8'ha9))) ?
              (&(wire47 >= wire45)) : ($signed(reg48) ?
                  reg48[(4'hc):(1'h0)] : (wire47 ? wire47 : wire46)))});
      reg50 <= ($unsigned($signed(($signed(wire44) || $signed(wire45)))) < wire46);
      reg51 <= reg50[(4'hf):(3'h4)];
    end
  assign wire52 = {wire45,
                      ({{{wire46, wire47}, wire45}} ^ {wire47[(1'h1):(1'h1)],
                          {reg49[(3'h6):(1'h0)], $unsigned((8'h9e))}})};
  assign wire53 = $unsigned((8'ha7));
  module54 #() modinst68 (wire67, clk, reg49, reg48, wire53, wire44, wire47);
  assign wire69 = (~|(+({(wire46 | reg51),
                      wire47[(4'hf):(2'h3)]} < $unsigned((&reg49)))));
  assign wire70 = wire46[(1'h0):(1'h0)];
  assign wire71 = $unsigned($signed((!(reg50[(5'h10):(4'hd)] - $unsigned(reg48)))));
  assign wire72 = $signed((~reg51));
  module73 #() modinst103 (wire102, clk, wire47, reg50, wire69, wire67);
  assign wire104 = $signed($signed(wire102[(5'h12):(4'hc)]));
  assign wire105 = $unsigned(($signed((!(wire69 ?
                       wire72 : wire45))) != ($unsigned((reg49 + wire47)) ?
                       $signed((wire45 ?
                           wire69 : wire71)) : $signed(wire104[(4'hb):(2'h3)]))));
  assign wire106 = $signed($signed(wire47));
  assign wire107 = ((wire70[(3'h4):(1'h1)] == $unsigned(($signed(wire104) ?
                           $unsigned(reg49) : (~|wire72)))) ?
                       (^((wire44 + {(8'hb3)}) - wire46[(2'h3):(2'h3)])) : (+($unsigned((~reg48)) & ((wire72 ?
                               reg49 : reg48) ?
                           (reg50 ? wire47 : (8'hb0)) : {wire44}))));
  always
    @(posedge clk) begin
      reg108 <= (wire70 ?
          ((!wire106[(3'h6):(3'h4)]) ?
              {wire70[(5'h12):(3'h5)]} : ((wire104[(1'h0):(1'h0)] > reg50[(4'h9):(3'h4)]) ?
                  wire47 : {wire46[(3'h7):(2'h3)]})) : {((^(wire107 ?
                  wire52 : wire102)) || ({wire102, wire71} ?
                  wire46 : $unsigned(wire70)))});
      reg109 <= (wire69 >> $signed((8'hb0)));
      reg110 <= $signed(($signed((~(reg51 ? wire52 : wire53))) ?
          $signed(wire104) : ((~^$signed(wire69)) ?
              (|$unsigned(wire45)) : ((wire45 >= wire53) ?
                  {(8'had), wire52} : (wire52 ^ wire70)))));
      reg111 <= (-(wire45 ?
          $signed($signed($signed(reg108))) : (wire69 ?
              $unsigned((~|wire72)) : reg50)));
      reg112 <= $signed(($unsigned($signed(reg50[(2'h3):(2'h3)])) ?
          {$signed($unsigned(wire52)),
              ($signed(reg49) ? reg50 : $unsigned(reg109))} : reg109));
    end
  assign wire113 = $signed(($signed(((reg109 ? wire105 : reg110) ?
                       (reg48 ? wire67 : (8'hb1)) : (8'hb4))) >= wire104));
endmodule

module module5
#(parameter param38 = (((((!(8'h9c)) ? ((8'h9d) <= (8'h9d)) : ((8'hb8) ? (8'haf) : (7'h44))) ? (!((8'ha7) == (8'ha0))) : (|((8'hb7) >= (8'h9c)))) ? (((~&(8'hb7)) >> ((8'hbe) & (8'ha0))) == {((8'hb5) <= (8'hb6))}) : (~((^(8'hb1)) || ((8'h9e) ? (8'h9c) : (8'hbe))))) >> (((~|((8'ha7) || (8'hbc))) ? (((8'ha2) & (8'ha5)) ^~ ((8'hb0) ? (7'h41) : (7'h40))) : {((8'hab) <<< (8'hb5)), (~^(8'hae))}) ^ (-(~|(|(8'hac)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h151):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'hb):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire signed [(5'h14):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  assign y = {wire37,
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
                 wire15,
                 wire14,
                 wire12,
                 wire11,
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
                 reg13,
                 (1'h0)};
  assign wire11 = wire7;
  assign wire12 = ((~|($unsigned($signed(wire8)) == ($signed(wire11) ?
                      wire11 : (wire7 ?
                          (8'hb2) : wire6)))) - wire11[(3'h5):(3'h5)]);
  always
    @(posedge clk) begin
      reg13 <= wire9[(2'h2):(1'h1)];
    end
  assign wire14 = ((^~{$signed($signed(reg13))}) ?
                      {wire11[(5'h10):(3'h5)]} : ({{wire10[(3'h4):(2'h3)]}} ?
                          wire12[(2'h3):(1'h0)] : $signed($signed($unsigned(wire6)))));
  assign wire15 = (wire8[(4'h8):(3'h7)] ?
                      wire11 : (($signed((wire7 || wire12)) ~^ wire12) ?
                          wire14[(4'h8):(3'h5)] : wire8[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (((((~^((8'hb1) ? wire7 : reg13)) ?
              wire14[(4'hc):(3'h5)] : $signed({(8'hb8), (8'ha2)})) ?
          $signed($unsigned($unsigned((8'hae)))) : ($unsigned($unsigned(wire15)) ?
              $signed(wire10) : ((wire7 ? wire7 : wire14) ?
                  (+wire10) : $signed(wire12)))) ^ (wire11[(3'h4):(2'h3)] - ($signed($unsigned(wire6)) <= wire11))))
        begin
          if ($signed($signed($unsigned(({(7'h44),
              wire15} << wire9[(1'h1):(1'h1)])))))
            begin
              reg16 <= (8'hb4);
              reg17 <= $unsigned(((|wire6[(4'hb):(2'h3)]) < ($unsigned(wire6) ?
                  {(wire6 && reg16)} : $unsigned($signed((8'hae))))));
            end
          else
            begin
              reg16 <= wire14;
              reg17 <= reg13;
            end
          if ((($unsigned((~&(~(7'h43)))) ?
              wire11 : reg17[(4'h8):(2'h2)]) + $unsigned(((8'hb7) <= reg16[(1'h1):(1'h0)]))))
            begin
              reg18 <= (($unsigned((^~$signed((8'hb9)))) >= $signed(((wire15 ?
                  reg17 : wire9) + (wire14 ?
                  (7'h40) : reg13)))) << $unsigned(wire7));
              reg19 <= (wire9 >>> wire10);
              reg20 <= $signed({({(wire11 ?
                          wire10 : reg17)} & $signed($unsigned(reg17)))});
              reg21 <= ($unsigned(wire7) <<< reg19[(3'h5):(1'h1)]);
              reg22 <= {reg17};
            end
          else
            begin
              reg18 <= (reg20[(3'h4):(2'h2)] | reg22);
              reg19 <= $signed($unsigned($signed($unsigned((reg17 ?
                  wire14 : wire15)))));
              reg20 <= (&wire10[(3'h5):(2'h2)]);
              reg21 <= ({($unsigned((~wire9)) ?
                      reg13[(1'h1):(1'h1)] : (wire12 ?
                          $signed(wire9) : wire7[(1'h0):(1'h0)])),
                  wire12[(1'h0):(1'h0)]} > (~|(|$signed((reg20 <<< wire9)))));
              reg22 <= ($signed($signed(reg13[(2'h2):(2'h2)])) < ($unsigned((((8'ha0) ~^ (8'hb1)) ?
                      wire10[(2'h2):(1'h1)] : {wire11})) ?
                  {(!(-wire6)), $signed(wire11)} : wire6[(4'hb):(3'h4)]));
            end
          reg23 <= $unsigned(reg16[(1'h0):(1'h0)]);
          reg24 <= $unsigned(wire10[(4'h8):(1'h1)]);
        end
      else
        begin
          reg16 <= (~|reg19);
          reg17 <= (8'hba);
          reg18 <= reg19;
          reg19 <= (reg22[(1'h1):(1'h1)] ^~ wire8);
        end
      reg25 <= reg23;
      reg26 <= wire8;
    end
  assign wire27 = $signed((wire7[(2'h2):(2'h2)] <<< ($signed((wire6 >>> (8'hbb))) ?
                      {(reg25 ? reg21 : reg24)} : reg26[(1'h0):(1'h0)])));
  assign wire28 = $unsigned((+(wire15[(4'h8):(3'h7)] ?
                      wire6[(3'h5):(2'h3)] : reg16)));
  assign wire29 = (+(wire28[(3'h6):(1'h1)] && $unsigned(((reg18 ?
                          reg17 : wire8) ?
                      $unsigned(wire28) : reg19[(1'h0):(1'h0)]))));
  assign wire30 = {((+reg18) + wire11[(4'h8):(4'h8)]), reg17[(4'h8):(3'h7)]};
  assign wire31 = wire30;
  assign wire32 = ($unsigned($unsigned($unsigned({reg21}))) + $signed((8'hbb)));
  assign wire33 = $signed(wire29[(2'h2):(1'h0)]);
  assign wire34 = ({$signed(reg23[(4'ha):(4'h8)]), {(+{(8'hb4), wire12})}} ?
                      $unsigned((~|$signed(((8'haa) ?
                          wire9 : wire27)))) : wire15);
  assign wire35 = (!$signed(($unsigned(reg17) - {(wire6 > wire7),
                      (wire12 ? wire30 : wire15)})));
  assign wire36 = {wire12,
                      $unsigned((^(wire27[(3'h5):(2'h3)] ?
                          wire28 : $signed(wire35))))};
  assign wire37 = wire29[(1'h1):(1'h1)];
endmodule

module module73
#(parameter param101 = ((((8'ha7) | ({(8'h9d), (7'h44)} ? (!(8'hb4)) : (^~(8'hb8)))) <<< {((~^(8'h9e)) ^ (~&(8'hb0))), (8'had)}) <= (((((7'h40) ? (7'h40) : (7'h40)) != {(7'h41), (8'ha1)}) > (((8'h9d) | (7'h40)) ? {(8'ha4), (8'ha6)} : (~^(8'ha1)))) ? (+(~|((8'h9f) <<< (8'hac)))) : ({((8'ha3) && (8'h9c))} ? (!(~(8'had))) : ((~&(8'had)) && (~|(8'hb5)))))))
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire77;
  input wire [(5'h12):(1'h0)] wire76;
  input wire signed [(5'h11):(1'h0)] wire75;
  input wire [(4'hf):(1'h0)] wire74;
  wire signed [(5'h13):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire99;
  wire signed [(5'h15):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire [(5'h12):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire signed [(3'h7):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire78;
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire78,
                 reg96,
                 reg91,
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
                 (1'h0)};
  assign wire78 = $signed((~|(-$signed($unsigned(wire77)))));
  always
    @(posedge clk) begin
      reg79 <= $unsigned(((8'hbb) ?
          $signed((8'hbb)) : ($unsigned($unsigned(wire76)) ?
              wire75[(4'hc):(4'ha)] : ((&(8'h9d)) ~^ (~&wire75)))));
      reg80 <= (&$signed((!wire78[(3'h5):(3'h4)])));
      if ($unsigned(((({wire74, wire75} ?
                  (wire78 ? wire74 : (7'h44)) : (wire77 > reg79)) ?
              wire74[(4'hf):(1'h1)] : wire74[(3'h4):(2'h3)]) ?
          $unsigned(wire74[(4'h8):(4'h8)]) : wire76)))
        begin
          if ((^~(wire76 || ($unsigned((8'hbc)) | $unsigned(reg79[(2'h3):(2'h2)])))))
            begin
              reg81 <= (((((wire76 ? (8'hb6) : wire78) ?
                          (~^wire75) : (reg79 <<< reg80)) ?
                      (reg79[(1'h0):(1'h0)] ?
                          $unsigned((8'ha4)) : $signed(wire74)) : reg80) ?
                  wire76 : $signed(((8'haf) >>> (~^wire75)))) <= (^~$unsigned($unsigned(wire74[(2'h3):(2'h2)]))));
              reg82 <= (~|(reg80 != $unsigned($unsigned((wire76 ?
                  reg80 : (7'h43))))));
              reg83 <= {(((~|(~^wire78)) ?
                      $signed({wire78,
                          reg82}) : {reg81[(1'h1):(1'h0)]}) * $signed(((reg81 ?
                          reg82 : reg81) ?
                      $signed(reg81) : (wire77 ? wire74 : wire78)))),
                  $signed($signed($unsigned((reg81 ? wire77 : reg82))))};
              reg84 <= $signed(reg82);
            end
          else
            begin
              reg81 <= $unsigned(({$signed((reg79 ? wire74 : wire76)),
                  (reg83 ?
                      {(8'ha2),
                          wire77} : $unsigned(wire78))} && reg84[(1'h0):(1'h0)]));
              reg82 <= (&reg82);
              reg83 <= wire77[(4'ha):(3'h7)];
            end
          if ((!reg84))
            begin
              reg85 <= ({({$unsigned(wire76)} > $unsigned($signed(wire76)))} ?
                  (-wire77[(2'h3):(2'h3)]) : ((~(&$unsigned(wire76))) ?
                      (~^$unsigned(reg81)) : ($signed(wire76) ?
                          reg83 : $signed(wire78))));
              reg86 <= reg81[(2'h2):(1'h1)];
              reg87 <= (wire78[(4'h8):(1'h0)] ?
                  (^~({reg79, (reg82 ? wire78 : reg83)} ?
                      (~|(wire74 ?
                          (7'h42) : reg81)) : (^~(wire75 ~^ reg79)))) : $unsigned((reg86[(5'h10):(1'h0)] ?
                      (8'hb9) : ((wire76 <<< reg84) << (reg82 <<< reg79)))));
              reg88 <= (~^(wire76 << ($unsigned(reg81[(3'h5):(2'h3)]) <= (~reg79))));
              reg89 <= (($signed($signed((-reg82))) != wire76) >= $signed(reg87[(1'h1):(1'h1)]));
            end
          else
            begin
              reg85 <= ($signed(((reg80 | ((8'hb3) >> wire75)) ?
                      ((reg81 - wire77) != reg89) : $unsigned($signed(reg86)))) ?
                  (&wire76[(3'h6):(1'h0)]) : $signed(reg84[(3'h7):(1'h0)]));
              reg86 <= ((wire78 >>> ({(reg86 > wire77)} ?
                      ($unsigned((8'hbd)) > reg87) : (!(reg89 > (8'ha1))))) ?
                  reg84 : (($unsigned(reg88[(5'h11):(4'hd)]) ^~ wire76[(1'h1):(1'h0)]) - {($unsigned(reg87) ?
                          (+wire76) : reg88[(3'h4):(1'h1)]),
                      wire75}));
            end
        end
      else
        begin
          reg81 <= $signed(($signed((~(reg80 ?
              (8'ha3) : wire76))) ~^ (!(~|(wire76 ? reg82 : reg79)))));
          if ($signed(reg86[(4'hb):(1'h0)]))
            begin
              reg82 <= (((wire74[(4'hf):(2'h3)] == (wire78 ?
                          (wire75 ? reg85 : reg89) : (reg80 ?
                              reg85 : (8'hba)))) ?
                      reg85[(2'h3):(2'h2)] : $unsigned($unsigned($unsigned(reg79)))) ?
                  $unsigned($unsigned((!$signed(reg87)))) : $unsigned((|$signed(reg84[(4'hf):(4'hb)]))));
              reg83 <= ($unsigned(({(!(8'hbc)), $signed(wire76)} ?
                  (~^(reg86 ?
                      reg84 : wire77)) : ((8'hbf) ^ $signed(reg87)))) >> $unsigned(($unsigned($unsigned(wire78)) ?
                  $unsigned($signed(reg89)) : ($unsigned(reg85) ?
                      (8'hb0) : reg79[(3'h4):(2'h3)]))));
              reg84 <= $signed($unsigned(reg83[(1'h0):(1'h0)]));
            end
          else
            begin
              reg82 <= {$signed(wire78),
                  $unsigned($signed(((reg84 <<< reg82) | (8'hb2))))};
            end
        end
      reg90 <= wire75[(5'h10):(4'h8)];
      reg91 <= $signed(wire78[(3'h7):(2'h2)]);
    end
  assign wire92 = reg87[(4'h9):(4'h9)];
  assign wire93 = (wire78[(4'hb):(4'h9)] ?
                      $signed($unsigned($unsigned(wire75))) : $unsigned($unsigned((+reg81))));
  assign wire94 = wire93;
  assign wire95 = (^wire77[(4'h9):(1'h0)]);
  always
    @(posedge clk) begin
      reg96 <= wire94[(2'h3):(1'h0)];
    end
  assign wire97 = $unsigned($unsigned($signed($unsigned(wire76[(3'h4):(1'h0)]))));
  assign wire98 = wire75[(3'h7):(2'h3)];
  assign wire99 = ({(wire75[(1'h0):(1'h0)] ?
                          reg89 : wire93[(4'hd):(2'h3)])} >>> (($unsigned((wire78 ?
                          wire74 : (8'hb3))) ?
                      reg81[(2'h2):(1'h1)] : wire94) <= (^wire77[(4'h8):(1'h1)])));
  assign wire100 = ($unsigned({{(wire75 ? reg87 : reg80), $unsigned(wire75)},
                           reg82}) ?
                       (reg86 <<< $signed((reg79[(3'h6):(2'h2)] != $signed(reg89)))) : $signed(($unsigned(reg96[(3'h6):(3'h4)]) ^ wire74)));
endmodule

module module54  (y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  input wire [(5'h11):(1'h0)] wire57;
  input wire signed [(4'ha):(1'h0)] wire56;
  input wire [(4'hd):(1'h0)] wire55;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire62;
  wire signed [(3'h5):(1'h0)] wire61;
  wire [(4'hd):(1'h0)] wire60;
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  assign y = {wire66, wire65, wire64, wire62, wire61, wire60, reg63, (1'h0)};
  assign wire60 = $signed((^$unsigned($signed(wire58))));
  assign wire61 = (&(~|((8'hb5) ?
                      (8'ha7) : (wire59 != (wire57 ? wire55 : wire59)))));
  assign wire62 = ((~|$unsigned(((wire56 ? wire59 : wire55) ?
                      $unsigned((8'h9c)) : wire60[(1'h1):(1'h0)]))) && ((({wire61,
                          wire57} > {wire61}) ?
                      $signed((!(8'ha4))) : wire59[(3'h5):(2'h2)]) - (($unsigned(wire55) >>> (wire60 ?
                          wire61 : wire60)) ?
                      $unsigned({wire57, (8'ha7)}) : {(^wire58)})));
  always
    @(posedge clk) begin
      reg63 <= $signed(($unsigned(((~|wire59) ?
          (wire62 ?
              (8'ha3) : wire55) : wire56[(4'h8):(4'h8)])) || wire58[(3'h6):(2'h2)]));
    end
  assign wire64 = {reg63};
  assign wire65 = $unsigned($signed(($signed($unsigned((8'h9f))) < $unsigned((wire57 ^ wire61)))));
  assign wire66 = ($unsigned($signed((!$signed(wire58)))) ^~ (^((^~((8'ha0) && (7'h44))) ?
                      (+(~&(8'ha3))) : wire55[(1'h0):(1'h0)])));
endmodule
