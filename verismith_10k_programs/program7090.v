module top
#(parameter param80 = (&({(((8'hac) ? (8'ha6) : (8'hab)) ? {(8'hba)} : (~^(8'ha8)))} ~^ (~{((8'hba) ? (8'hb1) : (8'hbd))}))), 
parameter param81 = (({((param80 ? param80 : param80) >= param80)} >= (-param80)) ~^ ({(-(param80 ? param80 : param80))} ? {param80, ((param80 || param80) != ((8'hb4) ? param80 : param80))} : param80)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire79;
  wire signed [(4'h9):(1'h0)] wire78;
  wire [(4'h8):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(5'h10):(1'h0)] wire5;
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire22,
                 wire21,
                 wire20,
                 wire18,
                 wire5,
                 (1'h0)};
  assign wire5 = wire1[(3'h7):(3'h4)];
  module6 #() modinst19 (.y(wire18), .wire8(wire3), .wire7(wire1), .wire9(wire4), .clk(clk), .wire10(wire0));
  assign wire20 = $unsigned((|$unsigned((|wire3))));
  assign wire21 = ((8'hb2) ?
                      $signed(((~(|wire4)) ?
                          wire1[(4'h8):(3'h6)] : wire5[(3'h7):(2'h3)])) : {wire3});
  assign wire22 = $signed({(($signed(wire4) ^~ wire18) <= wire3),
                      $unsigned(($signed(wire2) ?
                          $unsigned(wire3) : $unsigned(wire20)))});
  module23 #() modinst76 (.wire26(wire20), .wire24(wire5), .wire27(wire0), .y(wire75), .wire25(wire22), .clk(clk));
  assign wire77 = wire20[(4'hd):(4'hb)];
  assign wire78 = $unsigned(wire4[(4'h8):(1'h0)]);
  assign wire79 = {(~^(wire21 ?
                          $signed(wire3[(1'h1):(1'h1)]) : ({wire22} ?
                              $unsigned(wire20) : $signed(wire1)))),
                      ($unsigned(($unsigned(wire21) ^~ ((8'hb0) == wire2))) ?
                          $unsigned(wire2[(2'h2):(2'h2)]) : (~^{{wire3}}))};
endmodule

module module23
#(parameter param74 = (-((8'ha0) & ({(^(7'h41))} ? ((+(8'hb8)) ? ((8'hb7) | (7'h42)) : (^(8'ha3))) : (~&(^(8'hac)))))))
(y, clk, wire24, wire25, wire26, wire27);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire24;
  input wire [(4'h9):(1'h0)] wire25;
  input wire [(5'h10):(1'h0)] wire26;
  input wire signed [(2'h2):(1'h0)] wire27;
  wire signed [(2'h3):(1'h0)] wire73;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire70;
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg53 = (1'h0);
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire45,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire70,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg28 <= $unsigned(wire24[(2'h3):(1'h1)]);
      reg29 <= reg28;
      if ({((($unsigned(wire24) ? wire27[(1'h1):(1'h1)] : (reg29 >= (8'hbb))) ?
              wire26[(1'h1):(1'h0)] : (^wire26[(3'h4):(1'h0)])) + {(8'hb5),
              wire27[(1'h0):(1'h0)]}),
          ((({reg29, wire26} ?
              (+wire24) : $unsigned(reg29)) >= (~reg28[(2'h2):(1'h1)])) == wire24[(1'h1):(1'h1)])})
        begin
          if ($signed($unsigned(($unsigned(wire24[(1'h1):(1'h0)]) ~^ ($signed(reg28) ?
              (wire26 ? wire24 : reg29) : (wire25 ? wire27 : reg29))))))
            begin
              reg30 <= (^reg29[(1'h1):(1'h0)]);
              reg31 <= $unsigned(reg28[(1'h0):(1'h0)]);
              reg32 <= (^reg29);
            end
          else
            begin
              reg30 <= wire25[(1'h1):(1'h0)];
              reg31 <= $signed(reg28[(1'h1):(1'h1)]);
            end
          if ((|$signed((^reg30))))
            begin
              reg33 <= $signed(wire25[(2'h3):(1'h0)]);
              reg34 <= (~^reg32);
              reg35 <= (8'hba);
              reg36 <= reg29;
            end
          else
            begin
              reg33 <= (((!((reg34 <<< reg29) ?
                      $unsigned(reg30) : {reg36, (8'hb8)})) ?
                  reg30 : ($signed($signed((8'h9d))) ?
                      (8'ha9) : reg34)) * $unsigned(wire27));
              reg34 <= wire25;
              reg35 <= (($signed(((8'hac) - (reg30 ? reg32 : reg34))) ?
                  reg32 : reg33) <= (~wire27[(2'h2):(1'h1)]));
            end
          if (reg31)
            begin
              reg37 <= $signed((~|$signed($unsigned((reg34 * wire27)))));
              reg38 <= ((~&wire26[(4'hf):(4'hd)]) & reg28);
              reg39 <= ({{$signed((-wire24)), $signed(reg29[(1'h1):(1'h1)])}} ?
                  reg38 : reg32[(1'h0):(1'h0)]);
              reg40 <= $unsigned({(($signed(wire24) ?
                          (reg33 | (8'hb4)) : (&reg35)) ?
                      $signed(reg34[(3'h7):(3'h6)]) : {(reg36 != reg35)}),
                  $unsigned((7'h40))});
              reg41 <= reg36;
            end
          else
            begin
              reg37 <= $signed((!$signed($unsigned($signed(reg38)))));
              reg38 <= {((reg33 ?
                      (reg36[(4'he):(4'hc)] | wire26) : $unsigned(reg36[(1'h0):(1'h0)])) ^ reg31[(3'h4):(1'h0)]),
                  {{((~|reg36) ? reg29[(3'h4):(1'h1)] : reg34[(3'h5):(1'h0)]),
                          reg32}}};
              reg39 <= {({reg34[(3'h6):(3'h5)],
                      ((reg29 ? reg29 : wire26) ?
                          $signed((8'hb1)) : reg37)} >> {reg32[(4'ha):(3'h5)],
                      reg37[(2'h2):(1'h1)]})};
              reg40 <= ($signed((wire24[(2'h3):(1'h0)] ~^ reg29)) ?
                  $signed((!$unsigned({wire26,
                      (8'hbe)}))) : reg32[(2'h2):(2'h2)]);
            end
          reg42 <= reg40;
          reg43 <= reg35;
        end
      else
        begin
          if ({(($signed(reg42[(2'h2):(1'h0)]) ?
                      ((8'ha3) >>> (reg28 >= reg28)) : reg43) ?
                  reg36[(4'he):(4'hd)] : reg41)})
            begin
              reg30 <= reg40[(1'h1):(1'h1)];
            end
          else
            begin
              reg30 <= $unsigned($signed(reg36));
              reg31 <= $signed(((reg41 ?
                  (-wire27[(1'h1):(1'h1)]) : reg29) || reg29));
              reg32 <= {(|(reg28[(1'h0):(1'h0)] ?
                      ((wire27 ? reg42 : reg39) ?
                          $signed(reg33) : reg40[(2'h2):(2'h2)]) : ((reg39 ?
                              reg32 : reg42) ?
                          (reg33 ? wire25 : wire26) : reg37))),
                  reg29};
              reg33 <= (-(wire25[(4'h9):(1'h0)] != $unsigned(reg32)));
              reg34 <= $signed($signed(($unsigned($signed(reg37)) < (+(~reg43)))));
            end
        end
      reg44 <= (reg40 & $signed((+((~(8'ha8)) ? (~wire27) : (^~reg38)))));
    end
  assign wire45 = reg29;
  assign wire46 = $unsigned($unsigned(reg39));
  assign wire47 = (reg33[(4'h8):(1'h1)] ~^ (($unsigned({reg32,
                          reg33}) != {(wire24 ? wire25 : reg34), wire46}) ?
                      (reg32 & (reg41[(2'h2):(1'h1)] ?
                          $unsigned((8'hbb)) : (reg41 ?
                              reg40 : (8'haa)))) : ($signed((reg28 ?
                          (8'hb8) : wire26)) ^~ $signed((~&(8'h9d))))));
  assign wire48 = (wire25[(1'h0):(1'h0)] ?
                      ((((reg44 ? wire27 : (8'hb7)) >>> (!wire26)) ?
                              (+(!reg33)) : ($signed(reg35) ?
                                  $unsigned(reg40) : reg35)) ?
                          reg31 : $unsigned(reg41[(1'h1):(1'h1)])) : reg29);
  assign wire49 = $signed($unsigned((|wire26)));
  assign wire50 = (&$signed((wire24[(2'h2):(1'h1)] >> $unsigned(reg32[(2'h3):(2'h2)]))));
  assign wire51 = ($unsigned(wire49) ?
                      (($unsigned($signed(reg42)) - (~|{wire47})) <= reg36[(4'hc):(4'h9)]) : wire26[(4'h9):(1'h0)]);
  always
    @(posedge clk) begin
      reg52 <= (~^((~^((reg31 < (8'hb9)) ? reg32[(4'hc):(1'h0)] : (~reg30))) ?
          $signed(reg42) : $signed((reg34 ? $unsigned(wire26) : {reg43}))));
      reg53 <= reg44;
      reg54 <= $unsigned((+{((reg42 ~^ reg30) - {reg53, wire46}),
          $signed(wire49[(1'h1):(1'h1)])}));
      reg55 <= {{(~|($signed(reg30) << (8'ha1)))},
          $signed(reg33[(4'h8):(3'h7)])};
    end
  module56 #() modinst71 (.wire61(reg38), .wire57(reg33), .wire60(reg31), .wire59(wire25), .clk(clk), .y(wire70), .wire58(reg44));
  assign wire72 = (~^$signed(reg54[(1'h1):(1'h1)]));
  assign wire73 = ($unsigned((^$unsigned((reg30 ?
                      reg38 : (8'hb8))))) < ($signed((((8'ha6) ?
                          reg33 : reg55) ?
                      reg44 : $signed(reg55))) >> $signed((reg41 | {(8'hb8),
                      (8'h9e)}))));
endmodule

module module6
#(parameter param16 = (({(((8'hb0) >> (8'ha8)) ? ((8'hab) ? (8'hb0) : (7'h40)) : ((8'hbe) >> (8'hbd))), (~((8'hb2) ? (8'hba) : (8'hb4)))} * (~^(~&((8'hbd) ^ (8'hbb))))) > ({(8'ha9)} ? (((~^(8'hb5)) + ((8'hb1) && (8'hb8))) ? (((8'hb8) == (8'hbe)) ~^ {(8'ha1)}) : (8'haa)) : ((((7'h42) ? (8'hae) : (8'hbf)) == (~^(8'ha4))) ? (((7'h43) >= (8'hb1)) * ((8'hae) < (8'h9f))) : (((8'h9d) ? (8'ha2) : (8'hbb)) ? (~|(8'hb0)) : (~&(8'h9c)))))), 
parameter param17 = ((({(param16 <= param16), (param16 | param16)} ^~ param16) ? ({(param16 > param16), (!param16)} || ((^~param16) ? (param16 & param16) : param16)) : param16) >> ({{(param16 ? param16 : param16)}} ? ((!param16) ? (&(8'had)) : ((param16 <<< param16) ? param16 : (param16 || param16))) : ((^{param16, param16}) ? {(param16 ? param16 : param16), param16} : param16))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  assign y = {wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $signed(wire9);
  assign wire12 = wire10;
  assign wire13 = $unsigned((wire11 <= (!wire10[(3'h7):(1'h0)])));
  assign wire14 = wire12[(3'h6):(3'h4)];
  assign wire15 = $signed($unsigned($unsigned($unsigned((wire7 ?
                      (8'haf) : wire9)))));
endmodule

module module56  (y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire61;
  input wire signed [(4'hd):(1'h0)] wire60;
  input wire signed [(3'h4):(1'h0)] wire59;
  input wire [(4'ha):(1'h0)] wire58;
  input wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg69,
                 (1'h0)};
  assign wire62 = (~^((-$unsigned(((8'haf) ? wire60 : wire59))) ?
                      $signed((wire61[(3'h5):(3'h5)] ?
                          $unsigned((8'ha7)) : ((8'ha0) ^ wire57))) : (~^(!$unsigned(wire57)))));
  assign wire63 = $unsigned($signed(({{wire61, (8'hab)}} ?
                      $unsigned((-wire61)) : (~(8'hbb)))));
  assign wire64 = wire59[(1'h1):(1'h0)];
  assign wire65 = (^(($signed(wire59[(1'h0):(1'h0)]) ^ $signed((wire63 < wire60))) || ({((8'hb9) ?
                          wire62 : wire57)} & $signed($unsigned((8'hab))))));
  assign wire66 = wire59;
  assign wire67 = $signed((wire62[(3'h6):(1'h0)] ^ (^~(+(wire61 ?
                      wire59 : wire64)))));
  assign wire68 = (-wire65);
  always
    @(posedge clk) begin
      reg69 <= $unsigned((wire62[(2'h3):(1'h1)] ?
          wire66[(3'h7):(3'h4)] : ((8'ha3) ?
              $unsigned($unsigned(wire66)) : ($unsigned(wire57) <= $signed(wire67)))));
    end
endmodule
