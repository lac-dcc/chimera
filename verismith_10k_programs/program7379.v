module top
#(parameter param101 = (!((((^(8'ha7)) ? ((8'hb2) && (8'ha5)) : (~&(8'ha7))) >= ((~^(8'ha5)) ~^ ((8'hb3) ? (8'h9d) : (8'hbe)))) ? ((~(!(8'ha4))) ? (^((8'ha2) ? (8'ha4) : (8'haf))) : ({(8'ha5), (8'ha8)} ~^ (-(8'hb4)))) : ({((8'hba) ? (8'ha8) : (7'h43))} < {((8'hbc) > (8'hb3)), ((7'h43) >= (8'hba))}))), 
parameter param102 = (((((param101 & (8'hb3)) ? {param101, param101} : (param101 | (8'hb6))) ? (-(|param101)) : param101) == (({param101, param101} >> ((8'hb4) ? param101 : param101)) ? (^~((7'h44) ? param101 : param101)) : ((param101 ? param101 : param101) ? (param101 ^~ param101) : {param101}))) ? {((^~(param101 ? param101 : (8'hb8))) ~^ ((param101 ? param101 : (8'ha6)) ^~ (param101 ? param101 : param101)))} : ((((param101 ? param101 : param101) ? param101 : (param101 && param101)) & ((param101 ? param101 : param101) + (param101 && param101))) ? {param101, (&(param101 || param101))} : (((param101 ? param101 : (8'hbc)) << param101) ? ((^param101) ? (!param101) : (8'hb1)) : {{param101}, (param101 ? param101 : param101)}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire97;
  wire [(4'hc):(1'h0)] wire96;
  wire [(4'hf):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  assign y = {wire100,
                 wire97,
                 wire96,
                 wire94,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire5 = (~|{$signed($signed((wire4 <<< wire2)))});
  assign wire6 = $unsigned((wire1 * (wire1[(1'h1):(1'h0)] != ((~&(8'ha1)) ~^ wire0))));
  assign wire7 = wire5;
  assign wire8 = wire7;
  assign wire9 = $signed((wire8[(3'h6):(3'h4)] ?
                     (^~({wire2, wire7} >>> (wire2 ?
                         wire5 : wire2))) : (~&wire1[(3'h5):(2'h3)])));
  assign wire10 = $unsigned(wire7);
  module11 #() modinst95 (wire94, clk, wire6, wire1, wire3, wire7);
  assign wire96 = wire5[(4'hc):(2'h2)];
  assign wire97 = $unsigned((($signed({(8'ha9)}) ?
                          (8'hb4) : {((8'hb5) ? wire0 : wire0), (-(8'ha9))}) ?
                      wire4 : (~|((wire0 ^~ wire7) ?
                          ((8'h9f) >> wire6) : (wire5 ^ wire5)))));
  always
    @(posedge clk) begin
      reg98 <= $signed({$unsigned((~|$signed(wire2))),
          {($unsigned(wire97) ? $unsigned(wire8) : $unsigned(wire2)),
              $unsigned(wire97)}});
      reg99 <= (reg98[(2'h2):(1'h1)] + ((((|wire6) ?
              $signed(wire1) : (+wire7)) ?
          ((^wire2) ? {wire97, wire97} : (8'hb0)) : (^~{wire3,
              wire94})) ^~ wire5[(4'hf):(4'ha)]));
    end
  assign wire100 = $signed($unsigned(($signed(wire97) ?
                       ($unsigned(reg99) ?
                           {wire1} : wire9[(4'hd):(4'ha)]) : (wire94[(4'hb):(2'h3)] <<< $unsigned(wire6)))));
endmodule

module module11
#(parameter param93 = ((!(~^(((7'h42) * (8'hbe)) ? ((8'hae) >>> (7'h42)) : {(8'h9c), (7'h43)}))) ? {((~(+(8'hbf))) ? (((7'h40) ? (8'had) : (8'hae)) ? (8'hb5) : ((8'ha3) - (7'h41))) : (((8'ha9) ? (8'ha4) : (8'ha4)) ? ((8'hb7) <= (8'hb5)) : ((8'ha5) ? (7'h43) : (8'hba)))), ((((8'hb4) ? (7'h43) : (8'h9e)) ? {(8'ha2)} : {(8'ha5), (8'ha2)}) <= (&{(7'h41), (8'ha5)}))} : (((((8'hae) ? (8'hb5) : (8'hbd)) != (^~(8'hb4))) ? (8'ha4) : ((!(8'ha7)) + (8'hb9))) == ((^~((8'hab) ? (8'ha5) : (8'hb3))) ? {((8'ha4) ? (8'hba) : (8'h9d))} : (|((8'hb9) ? (8'ha9) : (8'ha8)))))))
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h223):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire [(3'h6):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire64;
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(5'h15):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  assign y = {wire85,
                 wire68,
                 wire16,
                 wire17,
                 wire18,
                 wire30,
                 wire43,
                 wire64,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
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
                 reg71,
                 reg70,
                 reg69,
                 reg67,
                 reg66,
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
                 (1'h0)};
  assign wire16 = $signed(($unsigned({(wire15 ? wire13 : wire15),
                          (wire14 ? wire12 : (8'hbf))}) ?
                      $signed(($unsigned(wire14) >> (wire15 >>> wire12))) : wire15));
  assign wire17 = (~&{(wire15[(1'h1):(1'h0)] ?
                          {(wire15 & wire12)} : $unsigned(wire13[(2'h2):(2'h2)]))});
  assign wire18 = wire14[(1'h1):(1'h0)];
  module19 #() modinst31 (.wire21(wire16), .wire20(wire15), .clk(clk), .y(wire30), .wire22(wire12), .wire23(wire18));
  always
    @(posedge clk) begin
      reg32 <= wire13[(4'hb):(3'h4)];
      if ($signed((wire30 ?
          ({wire14[(1'h0):(1'h0)]} ?
              (-$unsigned(wire18)) : ((wire30 ? wire13 : wire13) ?
                  wire14 : wire18)) : $signed(wire17))))
        begin
          reg33 <= wire15;
          reg34 <= {wire16[(2'h2):(1'h1)],
              $signed((((8'hbe) ? (8'hb2) : wire18) ?
                  $signed((7'h44)) : $signed((^~wire12))))};
        end
      else
        begin
          reg33 <= wire18;
          if ($signed($unsigned(($unsigned((!reg34)) <<< ((wire12 <<< reg34) & wire13[(4'he):(4'h8)])))))
            begin
              reg34 <= $signed(wire13);
              reg35 <= (reg33[(2'h2):(2'h2)] - (((wire30[(4'hc):(3'h7)] ?
                          wire18 : {reg32, reg32}) ?
                      $signed({wire18,
                          wire15}) : $unsigned((wire17 * wire30))) ?
                  wire12 : {wire18}));
            end
          else
            begin
              reg34 <= {(+$signed((&(wire14 >> wire15)))),
                  wire17[(3'h4):(2'h2)]};
              reg35 <= (wire15 < ($signed(wire30) + (+{$unsigned((8'hb2))})));
              reg36 <= $unsigned(wire17[(1'h0):(1'h0)]);
              reg37 <= (~&({reg33, wire15} ?
                  {$unsigned($unsigned(reg34))} : (($signed(wire12) ?
                      reg34 : (reg36 ?
                          reg35 : wire13)) >> wire14[(3'h5):(2'h3)])));
              reg38 <= reg35[(3'h5):(2'h3)];
            end
          reg39 <= wire17;
          reg40 <= $unsigned((({((8'hb1) ?
                      wire17 : wire17)} >= $signed(wire13[(4'hd):(3'h5)])) ?
              (wire15[(2'h2):(2'h2)] ? reg38[(2'h3):(2'h2)] : reg33) : reg37));
        end
      reg41 <= $unsigned((reg33[(4'ha):(3'h7)] ?
          wire13 : $unsigned($unsigned(reg37))));
      reg42 <= wire15[(1'h0):(1'h0)];
    end
  assign wire43 = {wire17, $unsigned((~{$signed((8'ha4)), $signed(wire14)}))};
  module44 #() modinst65 (.clk(clk), .wire47(reg37), .wire45(wire15), .wire46(wire43), .wire48(wire30), .y(wire64));
  always
    @(posedge clk) begin
      reg66 <= ((reg33 + $unsigned(reg36[(3'h5):(2'h2)])) && reg32[(2'h3):(1'h0)]);
      reg67 <= $signed($unsigned((wire64 ?
          (8'h9c) : ($signed(reg34) != $signed(reg32)))));
    end
  assign wire68 = $unsigned($signed((!($signed((8'hb6)) << $unsigned((8'ha0))))));
  always
    @(posedge clk) begin
      if ($unsigned({$signed($unsigned($signed(reg40))), reg40}))
        begin
          if (wire15[(1'h1):(1'h0)])
            begin
              reg69 <= $unsigned(reg32);
              reg70 <= (((^~reg36[(3'h7):(2'h2)]) >> (~^wire14[(3'h4):(2'h2)])) >> $signed(($signed($signed(reg39)) && wire18[(3'h6):(3'h6)])));
            end
          else
            begin
              reg69 <= reg35[(3'h5):(1'h0)];
              reg70 <= (^(|{((reg42 == (8'ha1)) > (reg35 & wire64)),
                  $signed((wire16 ? reg36 : reg69))}));
              reg71 <= (-({$signed($unsigned(reg40))} ?
                  $signed(wire18) : ($signed(reg67[(3'h5):(3'h5)]) && (8'ha5))));
              reg72 <= ($signed(($signed($signed(reg71)) ~^ (wire15[(2'h3):(1'h1)] ?
                      {wire18} : reg36[(4'hc):(4'hb)]))) ?
                  (-($unsigned((wire14 * (8'ha2))) + (+wire15[(3'h7):(1'h1)]))) : (reg70 ?
                      wire30[(3'h4):(3'h4)] : ($signed(reg36) ?
                          reg32 : {(~|reg39), (^~reg41)})));
              reg73 <= $unsigned(wire68[(1'h1):(1'h1)]);
            end
          reg74 <= (($unsigned((~^(&reg40))) ?
                  $signed((reg66 ^ $signed(reg34))) : ($unsigned((reg69 >> reg41)) ?
                      ($signed((8'h9f)) <<< (+reg34)) : reg34)) ?
              reg33[(3'h5):(2'h2)] : (~(&(~((8'hba) ^~ reg32)))));
          reg75 <= $unsigned($signed(((8'hae) ?
              (!(reg69 ? reg72 : (8'hab))) : wire13[(3'h5):(2'h2)])));
          reg76 <= $signed($unsigned(reg34));
        end
      else
        begin
          reg69 <= ($unsigned({(((8'haf) ? wire12 : reg40) ?
                      (~|reg76) : reg67[(4'he):(4'hb)])}) ?
              {$signed(wire13[(4'he):(4'he)]),
                  $unsigned({{reg42}})} : $signed((wire14 ?
                  (reg69 ?
                      ((8'hb0) ?
                          wire68 : wire16) : (wire12 ~^ reg36)) : $unsigned($signed(reg35)))));
          reg70 <= (8'hb7);
        end
      reg77 <= $signed($unsigned(wire68));
      reg78 <= $unsigned(wire30[(3'h4):(2'h2)]);
      if ((~&(reg37 ~^ wire14)))
        begin
          reg79 <= (~|$unsigned((&$signed({wire17, reg36}))));
          reg80 <= wire30[(3'h4):(1'h0)];
          reg81 <= {reg71,
              ({({wire13, reg39} && (|reg72)), reg70[(2'h3):(2'h3)]} ?
                  ($signed($signed((8'hab))) <= (reg36 >>> $unsigned(reg79))) : $unsigned(($signed(reg34) ?
                      (^~reg69) : {reg34, (8'ha9)})))};
          reg82 <= {{(8'hbe)},
              {{(reg32 ? reg72[(3'h4):(3'h4)] : ((8'hbb) ? reg79 : reg76))}}};
          reg83 <= $signed((reg78 != {(~^(reg39 ? reg32 : wire18))}));
        end
      else
        begin
          reg79 <= (wire68 | (($signed((&wire68)) ?
              (-(reg39 || (8'ha4))) : reg77[(3'h4):(2'h3)]) != reg36[(5'h10):(3'h7)]));
        end
      reg84 <= {((+$unsigned((~reg42))) != (reg81[(2'h2):(1'h0)] != wire12[(4'hf):(4'hf)]))};
    end
  assign wire85 = ($unsigned((reg33[(4'hb):(4'h8)] ?
                      wire64 : reg40)) < (((!$unsigned(reg73)) ?
                          $signed((+reg41)) : $signed(reg37[(2'h3):(1'h0)])) ?
                      ({(wire43 ?
                              reg41 : reg81)} ~^ wire30) : $signed({$unsigned(wire68),
                          (~reg69)})));
  always
    @(posedge clk) begin
      reg86 <= {reg72[(3'h5):(2'h3)], reg75[(3'h6):(1'h1)]};
      reg87 <= (reg71 == {$signed(((^(7'h42)) ?
              $unsigned(reg84) : (^~wire43)))});
      if ($unsigned(((reg34[(1'h1):(1'h0)] ^ {$signed(reg74),
              (wire18 <<< reg83)}) ?
          $signed($signed($unsigned(reg78))) : (((8'hb1) << $unsigned(reg34)) & ({reg41} ?
              {reg32, reg86} : (reg80 ? reg39 : wire64))))))
        begin
          reg88 <= reg40;
          reg89 <= $signed(reg81[(1'h0):(1'h0)]);
          reg90 <= $signed(((!reg40) ?
              (+wire15) : ($unsigned(wire16) ? reg74[(2'h2):(1'h1)] : reg32)));
          reg91 <= ((wire15[(3'h7):(3'h4)] <= $signed(($unsigned(wire43) ^ (wire43 ?
              reg90 : (8'ha6))))) ^~ $unsigned(reg76));
        end
      else
        begin
          reg88 <= (~&({{wire12[(5'h10):(1'h1)]}} * reg72));
          reg89 <= wire17[(3'h4):(2'h2)];
          reg90 <= (-($unsigned($signed((wire30 ? reg81 : wire17))) ?
              $signed(reg71[(5'h12):(3'h6)]) : $signed(reg69[(2'h2):(1'h1)])));
        end
      reg92 <= wire18;
    end
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire48;
  input wire [(4'hd):(1'h0)] wire47;
  input wire signed [(3'h7):(1'h0)] wire46;
  input wire signed [(5'h14):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  reg signed [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
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
                 (1'h0)};
  assign wire49 = {(+(^~$signed($unsigned(wire48))))};
  assign wire50 = (!(~(|$unsigned($signed(wire48)))));
  assign wire51 = ($unsigned((8'ha9)) ?
                      (!($unsigned(((8'hbf) * wire47)) >> $signed((+(8'h9d))))) : (~^{$unsigned(wire47)}));
  assign wire52 = wire50[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg53 <= $unsigned($signed($unsigned($unsigned((wire50 >>> wire51)))));
      if ((~&((~wire47) && (($unsigned((8'ha0)) > {wire47,
          wire52}) || $signed((~&wire48))))))
        begin
          reg54 <= wire51;
          reg55 <= $signed(reg54);
          if (((wire47[(4'hb):(3'h6)] > wire51[(3'h6):(1'h0)]) ?
              reg53[(4'hd):(2'h3)] : (&(~^wire46))))
            begin
              reg56 <= $signed({$unsigned(wire48[(3'h5):(2'h3)])});
              reg57 <= reg53;
              reg58 <= ((({(&(8'ha0)),
                      (wire45 > reg53)} || (|wire51)) <<< (reg56[(4'h8):(3'h7)] >> (wire47 & ((8'hab) ?
                      reg56 : reg55)))) ?
                  $signed($unsigned((wire52[(2'h2):(1'h0)] ?
                      (8'hb5) : (reg53 ^ (8'ha3))))) : wire46[(1'h1):(1'h0)]);
              reg59 <= $signed((&$signed(wire45)));
            end
          else
            begin
              reg56 <= $unsigned(({(8'ha3), (8'hbc)} ?
                  {wire49, wire48} : $unsigned(wire51[(4'h8):(3'h7)])));
              reg57 <= (^~{(wire51 <<< ((reg54 ? wire47 : wire51) ?
                      wire51[(1'h1):(1'h0)] : $unsigned(reg55)))});
              reg58 <= (($unsigned(((wire51 - wire49) ^~ ((8'hb1) | wire50))) || $unsigned($unsigned((reg56 ?
                  (7'h43) : (8'hae))))) << ($signed(((reg58 ? wire46 : wire50) ?
                  wire45 : (wire50 & wire45))) | (^{((8'hbb) ?
                      wire46 : wire47)})));
              reg59 <= $unsigned((+$unsigned(reg54[(4'hf):(2'h3)])));
              reg60 <= ($signed(wire46[(1'h0):(1'h0)]) ?
                  wire47[(1'h1):(1'h1)] : {(reg54 ?
                          {((8'ha7) ^~ (8'ha1)),
                              (~wire50)} : (+(wire48 >> wire51)))});
            end
          reg61 <= ({(((wire52 <<< wire47) - ((8'hb6) ? reg55 : reg55)) ?
                  wire45[(3'h6):(3'h5)] : {(8'hb2)})} ^ {wire47,
              $signed(reg58)});
          reg62 <= (^~($unsigned(reg57[(4'hb):(3'h4)]) ?
              (({reg61} >= $signed(reg54)) && wire49) : ($signed(reg56) ?
                  ((reg58 | wire49) <<< $signed(reg54)) : (8'ha1))));
        end
      else
        begin
          reg54 <= ((wire50[(1'h0):(1'h0)] ?
              (~&(~reg62[(4'hd):(3'h5)])) : reg53) ^ $unsigned(wire51));
          reg55 <= reg55;
        end
      reg63 <= {({(reg54 ?
                  $signed(wire52) : $signed(wire52))} && $unsigned(({wire47} < (wire45 + (8'had)))))};
    end
endmodule

module module19
#(parameter param28 = ((^~(~|(8'hba))) || (8'hbc)), 
parameter param29 = param28)
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(4'h8):(1'h0)] wire21;
  input wire [(2'h2):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(4'h9):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  assign y = {wire27, wire26, wire25, wire24, (1'h0)};
  assign wire24 = $signed(wire21[(3'h6):(3'h5)]);
  assign wire25 = $unsigned($signed(wire23[(3'h4):(3'h4)]));
  assign wire26 = (^~wire23[(3'h4):(2'h3)]);
  assign wire27 = ($signed(wire20[(2'h2):(1'h1)]) ?
                      wire22 : ((~^$unsigned({wire25, wire21})) ?
                          wire20[(2'h2):(2'h2)] : $unsigned(((wire24 - wire24) * ((8'hbe) >> wire24)))));
endmodule
