module top
#(parameter param102 = (&(({((8'haa) ? (7'h40) : (7'h43))} == ({(8'hab), (8'hb3)} ? {(8'had)} : ((8'had) | (8'ha2)))) ? ((&((8'hab) ? (8'ha7) : (8'ha1))) == ((~(8'hb8)) ~^ {(8'hb0), (8'ha8)})) : (+((-(8'hbd)) ? (~(8'h9d)) : ((8'ha0) <<< (8'ha0)))))), 
parameter param103 = (~&param102))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire101;
  wire [(3'h6):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  assign y = {wire101, wire100, wire98, wire5, wire4, (1'h0)};
  assign wire4 = (wire1 ?
                     ((($unsigned(wire1) ?
                                 $unsigned((8'ha8)) : (wire0 <= wire1)) ?
                             $signed(wire1[(4'ha):(1'h1)]) : $signed((wire2 ?
                                 wire3 : (8'hb3)))) ?
                         {$signed($signed(wire3)),
                             (+wire0)} : (^wire1[(3'h6):(3'h6)])) : $signed((wire2 ?
                         wire3[(4'hf):(1'h1)] : (~|(wire0 ^ wire3)))));
  assign wire5 = wire1[(5'h10):(1'h0)];
  module6 #() modinst99 (.wire10(wire1), .y(wire98), .clk(clk), .wire8(wire5), .wire9(wire4), .wire7(wire2));
  assign wire100 = (~^(+wire5));
  assign wire101 = (8'hb2);
endmodule

module module6
#(parameter param96 = {(({((8'ha0) ? (8'had) : (8'hb4)), (&(8'haa))} | {((8'ha5) ? (8'ha4) : (8'haa)), ((8'hae) ? (8'hbf) : (8'hb1))}) ? ({((8'hbf) ? (8'h9e) : (8'ha5)), ((8'h9d) ? (8'hb9) : (8'ha6))} ? ((&(8'hac)) != {(7'h40), (8'h9d)}) : {((8'ha9) <<< (8'ha2))}) : (((-(8'hac)) ^~ {(8'hb1)}) * ({(8'ha1)} || ((8'hba) ? (8'ha0) : (8'had)))))}, 
parameter param97 = {param96, param96})
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire94;
  wire signed [(3'h7):(1'h0)] wire68;
  wire [(4'hb):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire71;
  wire signed [(5'h12):(1'h0)] wire92;
  reg [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire68,
                 wire23,
                 wire22,
                 wire17,
                 wire16,
                 wire13,
                 wire12,
                 wire11,
                 wire70,
                 wire71,
                 wire92,
                 reg14,
                 reg15,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  assign wire11 = wire10[(3'h4):(1'h0)];
  assign wire12 = $unsigned((wire9[(1'h0):(1'h0)] >>> ($unsigned((&(8'hbf))) - $unsigned((~|(8'hb4))))));
  assign wire13 = wire10[(4'he):(3'h4)];
  always
    @(posedge clk) begin
      reg14 <= ((+((~$signed(wire12)) ?
              $signed(((8'hb2) ?
                  wire9 : wire7)) : $unsigned($unsigned(wire9)))) ?
          $unsigned((wire8 ?
              $unsigned(((7'h42) ?
                  (8'ha1) : (8'hb0))) : wire13[(4'he):(3'h7)])) : wire10);
      reg15 <= (wire12 ?
          wire9[(1'h0):(1'h0)] : {wire11[(3'h4):(1'h1)],
              $unsigned((~|(wire12 ? wire10 : (8'h9f))))});
    end
  assign wire16 = reg15;
  assign wire17 = $unsigned({$signed($unsigned((wire7 * (8'h9d)))),
                      ((^~(-wire13)) >> ($unsigned(wire11) ?
                          $unsigned(wire10) : $unsigned((8'had))))});
  always
    @(posedge clk) begin
      reg18 <= wire10;
      reg19 <= $unsigned(wire9);
      reg20 <= wire16[(4'he):(2'h3)];
      reg21 <= $unsigned(((8'ha4) ?
          {(reg20[(3'h7):(3'h4)] >= $unsigned((8'hbd))), wire17} : wire17));
    end
  assign wire22 = $signed((((wire13[(4'hb):(4'hb)] ?
                          (wire10 - wire9) : (~|reg18)) & reg20[(3'h5):(1'h1)]) ?
                      $signed(($signed(wire7) ?
                          $signed(reg14) : reg21)) : ($signed(wire16) ?
                          ($unsigned(reg18) ?
                              (!wire16) : $unsigned(reg14)) : wire13[(4'ha):(3'h4)])));
  assign wire23 = reg19[(3'h6):(3'h4)];
  module24 #() modinst69 (.wire26(wire12), .wire28(wire22), .clk(clk), .wire27(wire8), .y(wire68), .wire29(wire11), .wire25(wire23));
  assign wire70 = (~|$unsigned(($signed((reg14 >= wire16)) ?
                      $signed($unsigned(wire16)) : wire22[(3'h4):(1'h0)])));
  assign wire71 = ((~|($unsigned((8'h9f)) || wire16[(4'ha):(4'ha)])) ?
                      (reg18[(1'h0):(1'h0)] ?
                          ($signed((|wire12)) ?
                              {wire13,
                                  $signed(wire13)} : (8'ha0)) : (~|$unsigned($signed((8'ha5))))) : $signed($signed($unsigned((reg18 ?
                          wire17 : reg14)))));
  module72 #() modinst93 (wire92, clk, wire11, wire22, wire23, reg20);
  assign wire94 = wire71;
  assign wire95 = $signed((wire12[(4'hb):(4'h8)] ?
                      wire7[(1'h0):(1'h0)] : (($signed(wire10) ?
                              wire23[(3'h5):(3'h4)] : (~&reg18)) ?
                          $unsigned({wire11}) : (~&$unsigned((8'hb3))))));
endmodule

module module72
#(parameter param91 = ({{(((8'hb1) ? (8'h9c) : (8'hb2)) ? (8'hbf) : ((8'hb3) ? (8'hb3) : (8'hbc))), (((8'ha9) ? (8'hb5) : (8'hb5)) ? {(8'h9f), (8'ha8)} : (&(8'hbf)))}} ? {(8'ha9)} : {((^((8'hac) ? (8'ha5) : (8'hb1))) >> ({(8'hb3)} ? (+(8'hbf)) : {(8'hb2), (8'hb7)}))}))
(y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire76;
  input wire signed [(4'hb):(1'h0)] wire75;
  input wire [(4'hb):(1'h0)] wire74;
  input wire signed [(5'h13):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(4'hb):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 (1'h0)};
  assign wire77 = wire76;
  assign wire78 = (+$unsigned((wire75[(3'h6):(3'h4)] ?
                      {(wire74 - wire73)} : {(wire74 + wire75)})));
  assign wire79 = (wire73[(2'h3):(2'h3)] + $signed($unsigned($signed((wire76 ?
                      wire78 : wire75)))));
  assign wire80 = $unsigned(wire73[(3'h6):(1'h0)]);
  assign wire81 = ((-$unsigned($signed((wire76 ? (8'ha2) : (7'h41))))) ?
                      (((&$unsigned(wire77)) ~^ {wire74, (8'ha0)}) ?
                          $signed({(wire75 & wire80),
                              wire79[(4'he):(4'ha)]}) : wire75) : {(!$unsigned(wire73[(4'hb):(3'h6)])),
                          wire77[(4'ha):(3'h5)]});
  assign wire82 = $signed(wire76[(3'h6):(2'h2)]);
  assign wire83 = $unsigned($signed((~$unsigned(wire80[(2'h3):(2'h3)]))));
  assign wire84 = (7'h44);
  assign wire85 = {$signed(((~^wire78) ?
                          $signed($unsigned(wire79)) : {(wire81 ?
                                  wire73 : wire76)})),
                      {({$unsigned(wire73), wire82} ?
                              ((wire78 == wire74) >> $signed(wire78)) : $unsigned(wire77[(2'h2):(1'h0)]))}};
  assign wire86 = $unsigned($unsigned((|(7'h41))));
  assign wire87 = wire85[(3'h6):(3'h5)];
  assign wire88 = (8'hac);
  assign wire89 = (wire75[(2'h2):(1'h0)] ?
                      $signed($unsigned($unsigned((wire82 ?
                          (7'h44) : wire74)))) : (wire77[(3'h5):(1'h1)] ^ (wire78[(5'h13):(2'h3)] << ((wire81 ?
                              wire83 : wire82) ?
                          wire85[(3'h5):(3'h4)] : wire76))));
  assign wire90 = $unsigned(($signed($unsigned((wire82 ?
                      (8'ha7) : wire89))) ~^ (+(wire73[(4'hf):(3'h4)] < wire76[(3'h7):(3'h7)]))));
endmodule

module module24  (y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire29;
  input wire [(4'hc):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  input wire [(2'h2):(1'h0)] wire26;
  input wire [(4'hb):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire30;
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire43,
                 wire31,
                 wire30,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg58,
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
                 (1'h0)};
  assign wire30 = (($unsigned(((!wire27) & (+wire29))) == wire27) ?
                      wire26 : $signed($signed(wire26)));
  assign wire31 = wire28;
  always
    @(posedge clk) begin
      reg32 <= $unsigned((-(7'h44)));
      if ((&wire30[(1'h0):(1'h0)]))
        begin
          reg33 <= wire28;
          if ($unsigned(wire28))
            begin
              reg34 <= $signed(($unsigned((^reg32)) | reg33));
              reg35 <= $signed(reg34[(1'h0):(1'h0)]);
            end
          else
            begin
              reg34 <= wire31;
              reg35 <= $unsigned(reg34[(3'h7):(1'h0)]);
            end
          if ($unsigned($unsigned($unsigned($unsigned(wire26[(1'h0):(1'h0)])))))
            begin
              reg36 <= reg32;
              reg37 <= $signed((($signed((&wire28)) ?
                  wire31 : ((wire31 ?
                      reg36 : reg32) & $unsigned(wire29))) < {(-(^~reg36)),
                  $unsigned({wire28, (8'ha8)})}));
            end
          else
            begin
              reg36 <= (($signed($unsigned((+reg36))) ?
                      (({reg33, (8'haa)} << $unsigned(reg34)) + ((wire25 ?
                              wire29 : (8'ha2)) ?
                          ((7'h43) ?
                              reg36 : (8'haf)) : $signed(wire25))) : ({$unsigned(wire30),
                              reg33} ?
                          $signed(wire27) : reg37)) ?
                  {$unsigned((wire26[(1'h0):(1'h0)] ?
                          wire30[(2'h2):(1'h1)] : $unsigned(wire27))),
                      $signed(wire28)} : (-(|(((8'ha0) < wire28) <= wire31[(3'h4):(1'h0)]))));
              reg37 <= $signed($signed((wire25[(4'hb):(3'h6)] ?
                  (^~(wire30 <<< reg35)) : (wire26 ?
                      (wire30 >>> reg33) : (reg34 ? reg34 : wire29)))));
              reg38 <= wire31[(1'h1):(1'h1)];
              reg39 <= wire27;
              reg40 <= $unsigned((|(8'hb8)));
            end
        end
      else
        begin
          reg33 <= reg35[(2'h2):(1'h1)];
          reg34 <= (wire31[(2'h2):(1'h0)] != (^wire25[(3'h7):(2'h3)]));
          reg35 <= reg40[(3'h6):(1'h1)];
        end
      reg41 <= reg39[(3'h4):(2'h3)];
      reg42 <= $unsigned({reg41[(2'h2):(2'h2)],
          (wire26 || $signed({reg39, reg39}))});
    end
  assign wire43 = ((|wire26[(2'h2):(2'h2)]) || wire26);
  always
    @(posedge clk) begin
      if ({wire25,
          ($unsigned($unsigned({reg38})) ?
              (reg40 ?
                  $signed((wire27 ?
                      reg39 : wire31)) : {$unsigned(wire29)}) : $unsigned(reg40))})
        begin
          if ($signed($unsigned(reg39[(3'h4):(3'h4)])))
            begin
              reg44 <= wire25;
            end
          else
            begin
              reg44 <= $signed({$signed($unsigned(reg40))});
              reg45 <= ($unsigned(reg39) ?
                  $signed(((&(+(8'ha2))) ?
                      ((reg40 ? reg42 : reg39) ?
                          reg41 : (wire25 ?
                              wire28 : wire31)) : $unsigned(reg40[(3'h6):(3'h5)]))) : (^$signed($unsigned({(8'hb3),
                      wire27}))));
              reg46 <= ((reg35[(4'ha):(1'h0)] && $signed(wire29)) >> $unsigned(reg41));
              reg47 <= reg46;
            end
          if ((~|$signed($unsigned($signed(reg32[(4'h8):(2'h2)])))))
            begin
              reg48 <= $signed($signed(reg42[(1'h1):(1'h1)]));
              reg49 <= $unsigned((~&(wire31[(2'h3):(2'h2)] && $signed((reg42 >= wire30)))));
              reg50 <= (|wire43);
              reg51 <= reg47;
              reg52 <= wire30;
            end
          else
            begin
              reg48 <= reg40;
            end
          reg53 <= wire43[(2'h2):(1'h0)];
          reg54 <= ($signed((((reg40 >> reg38) & reg39) || {reg53[(1'h0):(1'h0)],
                  $unsigned(wire43)})) ?
              (reg34[(3'h6):(1'h0)] ? reg37 : reg35) : (~|(^$signed(wire28))));
          if (reg50)
            begin
              reg55 <= ((~&({(reg53 == reg48)} ?
                      (reg41[(4'hc):(4'ha)] ?
                          (~&wire25) : (!wire25)) : $unsigned((~reg53)))) ?
                  $signed($unsigned($signed((reg52 ?
                      wire25 : reg46)))) : ((((reg35 ? (8'hae) : wire26) ?
                          reg35[(4'h9):(3'h6)] : ((8'hb2) ? wire30 : reg45)) ?
                      $signed((wire31 ?
                          (8'hb8) : wire29)) : (wire26[(1'h0):(1'h0)] ?
                          (reg34 ? reg40 : reg47) : (-(8'had)))) > wire31));
              reg56 <= $unsigned($unsigned((&{(wire30 ~^ reg34),
                  $signed(wire30)})));
            end
          else
            begin
              reg55 <= reg46;
              reg56 <= reg38;
              reg57 <= ((^(($signed(reg55) | wire27[(1'h1):(1'h1)]) ?
                      {$signed(wire25)} : {$unsigned(reg34), (~&wire27)})) ?
                  reg39[(1'h0):(1'h0)] : {wire28[(4'hc):(4'ha)]});
              reg58 <= ($unsigned($signed(wire25)) ?
                  {(!($signed(wire30) ? reg38[(1'h1):(1'h1)] : reg55)),
                      ((|((8'ha6) ?
                          wire25 : reg52)) || reg45[(4'h9):(3'h4)])} : {(~^wire25[(3'h7):(3'h4)])});
            end
        end
      else
        begin
          if ($signed(({((wire27 & reg41) ?
                      $unsigned(wire25) : (reg33 | reg48)),
                  wire31} ?
              (^((reg39 & reg40) && (reg41 ?
                  (8'hbe) : reg38))) : reg56[(3'h7):(3'h7)])))
            begin
              reg44 <= reg54[(4'ha):(1'h0)];
              reg45 <= ($signed({(~$unsigned(reg40)), wire28[(4'hb):(3'h7)]}) ?
                  $unsigned(($unsigned((^~reg42)) >> reg58)) : (8'hb9));
              reg46 <= $signed($signed(reg32));
              reg47 <= (wire28[(2'h3):(1'h1)] ? reg52 : $signed(reg37));
              reg48 <= $signed($unsigned({((8'ha0) ?
                      $unsigned(reg56) : $signed(reg54))}));
            end
          else
            begin
              reg44 <= {($unsigned($unsigned((8'hbe))) << wire29)};
              reg45 <= $unsigned(((~((wire43 ? reg58 : wire28) | reg48)) ?
                  (reg34[(3'h6):(3'h6)] ?
                      $signed((8'hbc)) : ((wire25 ^ reg53) ?
                          reg50[(4'hb):(3'h6)] : reg33)) : {($unsigned(reg54) <<< reg40[(4'hd):(4'hd)]),
                      (~^(&wire27))}));
              reg46 <= reg37;
              reg47 <= (|reg39[(3'h5):(2'h3)]);
              reg48 <= reg57[(4'hb):(1'h1)];
            end
          reg49 <= reg46;
        end
    end
  assign wire59 = ($unsigned(($unsigned(reg44) ~^ ($unsigned(reg52) < (reg47 < reg33)))) ?
                      reg35 : (reg35[(4'h8):(3'h7)] ?
                          (((reg44 > reg52) || $unsigned(wire31)) ?
                              ($signed(reg36) & $signed(wire27)) : (((8'hbb) <= reg47) | {reg39})) : reg51));
  assign wire60 = (~|wire59[(4'ha):(1'h0)]);
  assign wire61 = (reg52 ? reg54 : reg36[(3'h5):(3'h4)]);
  assign wire62 = ((reg53 ?
                          reg52[(3'h5):(1'h1)] : ((reg34[(3'h6):(2'h2)] < reg47) ?
                              $signed((reg34 ? reg39 : reg49)) : reg55)) ?
                      {(((|reg32) ?
                              ((8'hb8) ?
                                  reg50 : reg54) : (&reg34)) > wire59[(2'h2):(1'h1)])} : wire43);
  assign wire63 = ($signed(wire61) == $signed($unsigned((^$signed(wire43)))));
  always
    @(posedge clk) begin
      reg64 <= $signed(reg50[(4'ha):(4'ha)]);
      reg65 <= ((reg34[(1'h1):(1'h0)] > ((+(^~reg32)) ?
              ($unsigned(wire29) && (~|wire59)) : ((reg35 ?
                  reg52 : (8'hb1)) - (^reg42)))) ?
          $unsigned($signed(wire60)) : $unsigned($unsigned(wire43[(3'h6):(2'h2)])));
      reg66 <= reg37[(2'h2):(2'h2)];
      reg67 <= reg33[(3'h7):(2'h3)];
    end
endmodule
