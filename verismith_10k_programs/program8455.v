module top
#(parameter param92 = {{(~&(((7'h42) ? (8'hac) : (8'h9e)) <<< ((8'h9e) ? (8'had) : (8'hb2)))), ((^~(7'h42)) ? (((8'hb6) ^ (8'hbb)) == ((7'h40) | (8'ha3))) : {(~(8'ha6)), (|(8'h9c))})}, (~^(8'hb4))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(2'h2):(1'h0)] wire89;
  wire [(5'h10):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire85;
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire85,
                 (1'h0)};
  assign wire5 = $signed({wire2});
  assign wire6 = $unsigned(wire5[(4'h8):(2'h2)]);
  assign wire7 = (($signed(wire2) ? wire2 : wire1[(1'h1):(1'h1)]) ?
                     (wire4 <<< wire2[(4'he):(3'h5)]) : $signed({wire6}));
  assign wire8 = (~|(~|wire6[(4'h9):(1'h0)]));
  assign wire9 = wire8[(2'h2):(1'h1)];
  assign wire10 = (((((wire7 >= wire1) ? wire2[(4'hb):(4'ha)] : (!(8'hac))) ?
                              wire9[(2'h2):(1'h0)] : (((8'h9f) ?
                                  wire2 : wire7) >>> {wire1, wire0})) ?
                          $signed({(wire4 | wire4),
                              $unsigned((8'ha7))}) : $unsigned(wire3[(1'h1):(1'h0)])) ?
                      ($unsigned(wire3) + ((+(~|wire9)) ^ wire0)) : wire7);
  assign wire11 = $unsigned($signed(wire9[(2'h3):(2'h2)]));
  assign wire12 = wire1;
  assign wire13 = wire3;
  assign wire14 = $signed($signed(wire11[(1'h0):(1'h0)]));
  module15 #() modinst86 (wire85, clk, wire11, wire9, wire2, wire0, wire5);
  assign wire87 = wire2;
  assign wire88 = (^~(8'ha1));
  assign wire89 = $signed((~|(+$unsigned({wire85}))));
  assign wire90 = wire0;
  assign wire91 = $signed((wire9[(3'h4):(1'h0)] ?
                      wire14[(4'hb):(4'hb)] : wire2[(1'h0):(1'h0)]));
endmodule

module module15
#(parameter param84 = ({{(((8'hb6) == (8'ha9)) ? (+(8'ha6)) : {(8'hba), (8'h9e)}), (~&{(8'hbc)})}, {{((8'had) + (7'h44)), ((8'hba) != (8'hbb))}}} ? ({(+((7'h41) == (8'ha1))), (|{(7'h43)})} ? (|{(-(7'h41)), ((8'hbf) ? (8'h9f) : (8'h9e))}) : ((((8'hbe) ? (8'hb2) : (8'hb0)) ? ((7'h42) <= (8'hb3)) : (8'ha3)) > {((8'hb1) ? (8'had) : (8'hb8)), ((8'h9c) <<< (8'hb8))})) : (((7'h41) ? (-(-(8'hb0))) : (|((7'h40) ? (8'hae) : (7'h43)))) && {({(8'hba), (8'hb7)} || (8'h9f))})))
(y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire signed [(4'ha):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire63;
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire65,
                 wire21,
                 wire22,
                 wire23,
                 wire63,
                 (1'h0)};
  assign wire21 = $unsigned(($unsigned(((7'h42) ^ wire17)) ?
                      {wire19,
                          (wire17[(3'h4):(2'h3)] ?
                              (8'ha7) : (~|(8'hbf)))} : wire16[(2'h2):(1'h1)]));
  assign wire22 = ((wire18 & (wire19 << (~^wire20[(4'h9):(2'h3)]))) - (~|($unsigned($unsigned(wire16)) <= {(~wire17)})));
  assign wire23 = ($signed((^$signed(wire18))) ?
                      $signed((wire22 + wire22)) : (wire16[(3'h4):(1'h0)] ~^ wire21));
  module24 #() modinst64 (wire63, clk, wire19, wire17, wire22, wire18, wire23);
  assign wire65 = $signed($unsigned(($unsigned($unsigned(wire18)) ?
                      {wire19[(2'h3):(2'h3)]} : ((wire63 ? wire17 : wire17) ?
                          (wire22 * wire63) : {wire23}))));
  module66 #() modinst80 (wire79, clk, wire65, wire19, wire17, wire20);
  assign wire81 = wire17;
  assign wire82 = wire18[(5'h11):(4'ha)];
  assign wire83 = (((|wire23[(4'hc):(3'h5)]) ?
                      $signed(wire23[(1'h1):(1'h1)]) : (^wire20)) >= {(wire21 ?
                          (~&(wire17 ?
                              wire82 : wire81)) : $unsigned((wire23 == wire16))),
                      ($unsigned((wire19 & wire17)) >> $signed(wire18))});
endmodule

module module66  (y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire70;
  input wire signed [(5'h14):(1'h0)] wire69;
  input wire [(4'ha):(1'h0)] wire68;
  input wire [(4'hd):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire78;
  wire [(2'h3):(1'h0)] wire77;
  wire [(5'h12):(1'h0)] wire76;
  wire [(2'h2):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(4'hd):(1'h0)] wire71;
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 (1'h0)};
  assign wire71 = {$unsigned(wire68)};
  assign wire72 = (((~wire68) ?
                      $unsigned($signed($unsigned(wire71))) : (8'hab)) & (+wire68[(4'h8):(2'h2)]));
  assign wire73 = (+(($signed((wire72 > wire70)) ^ $signed((wire68 ?
                          (8'hbc) : wire67))) ?
                      $signed(wire69[(1'h1):(1'h0)]) : (((wire70 > (7'h44)) ?
                          (wire69 | wire70) : $signed(wire67)) ^~ ((wire72 ?
                          wire69 : (8'ha9)) || wire72))));
  assign wire74 = $unsigned((^(((wire68 && wire67) || (wire67 ?
                          wire72 : wire72)) ?
                      $unsigned((wire69 ? wire69 : (7'h44))) : ((8'hab) ?
                          (wire70 ? wire71 : wire73) : (wire73 ?
                              wire71 : wire72)))));
  assign wire75 = ((wire71 || $signed($signed($unsigned((8'h9c))))) ?
                      wire71[(2'h3):(2'h2)] : wire70);
  assign wire76 = ($unsigned(((wire75 ?
                          wire71 : (-wire68)) >>> wire68[(3'h4):(1'h0)])) ?
                      ((~^wire69) ?
                          (~|$unsigned((~wire71))) : (wire69 == {(wire75 ?
                                  wire72 : wire75)})) : ({wire73[(2'h2):(2'h2)],
                              wire67[(1'h0):(1'h0)]} ?
                          $signed(wire72) : ({(wire70 > (8'haa)),
                              wire70[(4'hd):(3'h7)]} ^ {$signed(wire73)})));
  assign wire77 = (8'ha1);
  assign wire78 = (+wire68);
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire29;
  input wire [(3'h7):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(5'h12):(1'h0)] wire26;
  input wire signed [(3'h5):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire30 = wire29[(1'h0):(1'h0)];
  assign wire31 = (|wire25[(1'h1):(1'h0)]);
  assign wire32 = wire29;
  assign wire33 = (($signed($unsigned((wire32 ^~ wire27))) ~^ $signed(wire28[(3'h6):(3'h6)])) - $signed((wire28 ?
                      $signed($unsigned(wire30)) : {wire28[(3'h7):(3'h4)],
                          (wire32 ? wire32 : wire29)})));
  assign wire34 = ({wire32,
                      $unsigned((7'h40))} >> $unsigned($signed($signed((wire30 ?
                      (8'ha4) : wire28)))));
  assign wire35 = $unsigned({$signed((~(wire34 <= wire28))), wire28});
  assign wire36 = (-wire29[(1'h0):(1'h0)]);
  assign wire37 = $signed({(|$signed($signed((8'hbc)))),
                      $unsigned(($unsigned(wire25) ^~ (^wire27)))});
  assign wire38 = wire29[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg39 <= ((~((8'ha2) ?
          (!wire31[(3'h7):(2'h3)]) : ({wire34, wire33} ?
              ((8'ha8) & wire27) : wire32))) ^~ (~&$unsigned($unsigned(wire38[(2'h2):(1'h1)]))));
      reg40 <= ({(~&wire27),
              ($unsigned((7'h44)) ?
                  (~^$signed(wire30)) : ((+wire29) ?
                      wire27[(4'hc):(3'h7)] : {wire32, wire26}))} ?
          ($unsigned(wire36[(4'ha):(3'h4)]) || reg39) : $unsigned(wire36[(4'hb):(3'h7)]));
      if ((({{wire28[(3'h5):(1'h0)], $signed(wire34)},
              {wire38[(1'h1):(1'h0)], (+wire34)}} ?
          wire26[(4'hc):(1'h0)] : wire30) == wire25))
        begin
          reg41 <= $unsigned($signed(wire34));
          if ((|(((8'hbb) ? (~&$signed(wire29)) : (wire31 >= {wire30})) ?
              (~&(!((8'hb6) != wire31))) : ($signed(wire29[(2'h2):(1'h1)]) - wire28[(3'h6):(3'h6)]))))
            begin
              reg42 <= wire26[(5'h12):(5'h12)];
            end
          else
            begin
              reg42 <= wire25[(1'h1):(1'h1)];
            end
          reg43 <= ((wire29[(1'h1):(1'h1)] ?
              (8'hb5) : {(7'h44), (~|wire28)}) == $signed($signed((|reg41))));
          reg44 <= {((+(~^$signed(wire30))) ?
                  ($unsigned({wire34}) * (~|(reg39 && (8'hb6)))) : wire37)};
          reg45 <= wire36[(1'h0):(1'h0)];
        end
      else
        begin
          reg41 <= $signed(((((wire35 >>> (8'ha7)) ?
                      (wire31 ? wire36 : wire25) : (wire27 ? wire26 : wire34)) ?
                  (wire31[(3'h7):(3'h4)] ?
                      $signed(wire35) : $unsigned(wire28)) : {(wire25 ?
                          wire25 : (8'hb1)),
                      $signed(wire33)}) ?
              reg45[(2'h2):(2'h2)] : (reg43 >> $signed($signed(reg40)))));
          reg42 <= $unsigned($unsigned((((reg41 << reg44) ?
                  reg40[(4'hb):(3'h4)] : $signed((8'haf))) ?
              $unsigned(reg40[(1'h1):(1'h0)]) : $signed((|reg41)))));
          reg43 <= ((($signed($unsigned(wire27)) ?
                  ($unsigned(wire27) ?
                      wire28 : (wire30 ? (8'hb7) : wire31)) : (~&(|reg41))) ?
              wire33[(1'h0):(1'h0)] : (~|(^~(8'hb5)))) <<< $signed($signed((-$signed(wire36)))));
          reg44 <= wire37;
        end
    end
  assign wire46 = $unsigned($signed(wire35));
  assign wire47 = ($unsigned(wire25) - ((~|((wire27 >> wire37) ?
                      (wire35 && wire37) : wire28[(3'h4):(2'h2)])) + wire37));
  assign wire48 = reg39;
  assign wire49 = ((wire38[(1'h0):(1'h0)] ?
                          reg44 : $unsigned($unsigned((reg45 ?
                              (8'h9d) : reg40)))) ?
                      $signed(($signed({wire34, reg43}) ?
                          wire48[(3'h7):(2'h2)] : wire32)) : {(wire27 > ($unsigned(wire47) ?
                              (^~wire27) : (~wire33))),
                          wire26[(4'ha):(2'h3)]});
  assign wire50 = wire28[(3'h6):(1'h0)];
  assign wire51 = (wire35[(2'h2):(1'h1)] >>> {(~|((reg39 << wire49) ?
                          (wire30 ? wire35 : wire35) : ((8'ha0) - wire36))),
                      ($signed($signed(reg39)) ?
                          (+wire48) : (wire33 && {wire37}))});
  assign wire52 = reg43;
  assign wire53 = reg40;
  always
    @(posedge clk) begin
      reg54 <= {$signed(wire50[(1'h1):(1'h1)])};
      if ((($signed({(^wire25), wire29}) ?
          (^wire36[(4'hd):(4'h8)]) : $unsigned(wire49[(1'h1):(1'h0)])) ^ (8'ha7)))
        begin
          reg55 <= ($unsigned(wire50[(3'h7):(3'h6)]) ?
              $signed(($signed((8'hb0)) && wire30)) : {(wire30[(4'hc):(1'h0)] ?
                      (~&(|reg43)) : $unsigned(((8'hb5) ? reg43 : (8'had)))),
                  $unsigned($unsigned($unsigned(reg54)))});
          if ((-$unsigned(reg45[(2'h3):(1'h0)])))
            begin
              reg56 <= (~&$unsigned(reg54));
            end
          else
            begin
              reg56 <= $unsigned(wire52);
              reg57 <= (-{(($unsigned((7'h42)) ?
                          (wire36 ? wire37 : wire51) : wire28) ?
                      wire36 : ((wire32 || wire49) >= $unsigned((8'ha5)))),
                  $signed((~^$unsigned((8'hbd))))});
              reg58 <= $signed(reg57[(3'h5):(2'h2)]);
              reg59 <= $signed((reg57 ? reg45 : (8'ha5)));
            end
          reg60 <= {(&wire34)};
          reg61 <= $unsigned($signed((reg57[(2'h3):(2'h2)] + reg56[(3'h7):(2'h2)])));
          reg62 <= reg45[(2'h2):(1'h0)];
        end
      else
        begin
          reg55 <= $unsigned(({reg42[(1'h0):(1'h0)],
              reg43[(3'h6):(2'h3)]} <<< $unsigned($unsigned((wire29 ?
              reg59 : reg59)))));
        end
    end
endmodule
