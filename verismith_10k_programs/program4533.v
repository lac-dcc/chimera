module top
#(parameter param106 = ((+({((8'hb9) ? (8'hbe) : (7'h42)), ((8'hb5) ^ (8'haa))} >= (-(^~(8'had))))) ? {(((^~(8'h9d)) & {(8'hb2), (8'ha7)}) ? ((~&(8'hb5)) > (~&(8'ha9))) : ((&(8'hb1)) ? ((8'h9f) < (8'ha8)) : {(8'ha1)})), ((|((8'ha3) >= (8'haf))) ? ((7'h42) ? ((8'hba) ^ (8'ha4)) : {(8'hb0), (8'hb5)}) : {((8'haf) != (8'hb6))})} : (((8'h9c) ? (~^(~|(8'hac))) : (8'ha8)) ? (-(((7'h43) - (8'ha2)) == ((8'ha9) ? (8'hae) : (8'hbf)))) : (^~({(8'hb0)} ? ((8'h9f) << (7'h40)) : ((8'ha0) != (8'hbb)))))), 
parameter param107 = ((~param106) ? ((&{(param106 ? param106 : param106)}) >> param106) : (param106 ? (param106 ? {param106} : ((param106 | param106) ? {param106} : (param106 ? param106 : param106))) : ((^~(param106 || (8'hb4))) ^~ (-((8'hbb) > param106))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(2'h2):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire91;
  wire signed [(3'h5):(1'h0)] wire89;
  wire signed [(4'he):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire58;
  reg signed [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire91,
                 wire89,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire58,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire4 = (wire3[(3'h4):(3'h4)] ?
                     $unsigned((wire0[(2'h2):(2'h2)] ^~ $signed(wire1))) : $unsigned($signed($unsigned((!wire1)))));
  assign wire5 = ($signed(((+(wire2 >> wire0)) ~^ $signed($unsigned(wire3)))) >> $unsigned(((wire0 >> wire0[(4'ha):(3'h4)]) ?
                     ($unsigned(wire3) ?
                         (8'hac) : wire0[(3'h4):(1'h0)]) : ($signed(wire3) ?
                         (8'hbb) : wire2[(4'hf):(4'hb)]))));
  assign wire6 = wire3[(2'h3):(1'h0)];
  assign wire7 = ((~|(wire2[(5'h12):(2'h3)] == (~(~^wire4)))) ?
                     (&$signed(($unsigned(wire2) ?
                         {wire2} : wire3))) : (wire6[(5'h13):(2'h3)] == (8'ha4)));
  assign wire8 = $unsigned(wire1[(4'hb):(3'h7)]);
  assign wire9 = wire6[(2'h2):(1'h0)];
  assign wire10 = ($unsigned(wire6[(4'h8):(1'h1)]) ?
                      (+$signed((8'hb4))) : {wire1});
  assign wire11 = (8'hbf);
  module12 #() modinst59 (wire58, clk, wire3, wire8, wire10, wire4, wire5);
  module60 #() modinst90 (wire89, clk, wire6, wire8, wire3, wire7);
  assign wire91 = {$unsigned((^wire4[(3'h6):(3'h6)]))};
  always
    @(posedge clk) begin
      if ($signed(($signed(wire89) < (wire0[(2'h3):(1'h1)] != {wire89,
          (wire7 + wire11)}))))
        begin
          if (($signed({(-wire58[(5'h15):(5'h11)]),
              wire91[(4'he):(4'hb)]}) ~^ (((wire11 << wire8) ?
                  wire2 : ($unsigned(wire91) ?
                      (wire91 <<< wire89) : $unsigned(wire0))) ?
              (wire5 * {(wire6 ? wire7 : wire1),
                  $unsigned(wire58)}) : $signed((wire5 ? wire5 : (^(8'ha8)))))))
            begin
              reg92 <= wire0[(4'ha):(3'h5)];
            end
          else
            begin
              reg92 <= wire9[(1'h1):(1'h0)];
            end
          if ((~|wire6[(4'hc):(1'h0)]))
            begin
              reg93 <= (reg92 + (^(&(~^$unsigned(wire3)))));
              reg94 <= wire7;
            end
          else
            begin
              reg93 <= $signed($unsigned((((~|reg94) << (~^wire1)) ?
                  wire10 : wire3)));
              reg94 <= wire8[(2'h2):(1'h0)];
              reg95 <= {wire6, (+{$signed((wire6 >> wire2))})};
              reg96 <= (-wire58);
            end
          reg97 <= (reg94[(3'h7):(3'h6)] ?
              (&{wire2, wire10[(4'ha):(3'h6)]}) : wire9[(2'h2):(1'h0)]);
        end
      else
        begin
          reg92 <= (({$unsigned($unsigned((7'h42)))} ?
              wire4 : (wire0 ?
                  wire1[(4'ha):(2'h2)] : wire91[(4'h9):(3'h6)])) | $signed(reg93[(1'h1):(1'h0)]));
          reg93 <= wire3;
          reg94 <= $unsigned((wire9[(2'h2):(1'h0)] ?
              $unsigned((^~$signed(wire3))) : wire6[(3'h4):(1'h0)]));
          reg95 <= $signed((~reg95[(4'hb):(4'h8)]));
          reg96 <= $signed($signed($signed((~|$signed(wire4)))));
        end
      reg98 <= ((reg92[(4'h9):(2'h3)] ^ {(+reg96), (&$unsigned(wire2))}) ?
          (-reg92[(4'hb):(3'h4)]) : $signed(reg93[(1'h1):(1'h0)]));
      reg99 <= $signed(wire89);
    end
  assign wire100 = (~($signed(((&wire91) ? (-reg98) : {wire58})) > {wire9}));
  assign wire101 = wire4[(1'h1):(1'h1)];
  assign wire102 = ({(~|(-$unsigned(wire9))), reg94[(1'h1):(1'h1)]} ?
                       reg93 : $unsigned((~|($signed(wire2) ?
                           wire7 : reg96[(3'h6):(2'h3)]))));
  assign wire103 = (((!wire8[(5'h14):(2'h3)]) >>> $unsigned(((~wire0) ?
                           wire101[(4'hc):(4'h8)] : {wire10, wire1}))) ?
                       $signed($unsigned($signed(wire10))) : wire102);
  assign wire104 = wire100[(2'h2):(1'h1)];
  assign wire105 = wire4[(4'h9):(1'h0)];
endmodule

module module60
#(parameter param87 = ((^~({((8'hbf) || (8'haa)), ((8'ha7) >> (8'h9e))} >= (|(~(8'hb4))))) >= {(~^{(~&(8'ha4))}), ((~|((8'hb6) || (8'hb0))) ? ((-(8'ha4)) ? (8'haf) : (-(8'hae))) : ({(8'h9c), (8'haf)} >= (+(8'hb2))))}), 
parameter param88 = (param87 | {(8'hb5)}))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire64;
  input wire signed [(5'h15):(1'h0)] wire63;
  input wire [(5'h15):(1'h0)] wire62;
  input wire [(3'h5):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire79;
  wire signed [(3'h7):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 (1'h0)};
  assign wire65 = (!(~&$unsigned($signed((wire63 ? wire64 : (8'ha6))))));
  assign wire66 = wire62[(4'h9):(3'h5)];
  assign wire67 = (~|$signed({(^~wire66[(4'he):(4'hc)])}));
  assign wire68 = ((!(7'h42)) ?
                      (wire62[(3'h4):(1'h1)] == wire62) : ($signed($unsigned($signed(wire62))) ?
                          wire64[(3'h6):(3'h6)] : {((wire62 | wire67) ~^ $signed(wire62))}));
  assign wire69 = (wire67 ?
                      (^($unsigned(wire62[(1'h0):(1'h0)]) >>> {$signed((8'ha3))})) : $signed((!($unsigned((8'ha1)) ?
                          wire68 : {wire67, wire65}))));
  module70 #() modinst80 (wire79, clk, wire64, wire63, wire68, wire62);
  assign wire81 = $signed(($signed($unsigned(wire68[(2'h3):(1'h0)])) ^ wire79));
  assign wire82 = ((^(^~$unsigned(wire81))) ?
                      (~{($unsigned(wire61) ?
                              (~(8'hb7)) : $signed(wire65))}) : {wire61[(3'h5):(3'h5)]});
  assign wire83 = $unsigned($signed($unsigned(wire66)));
  assign wire84 = (((((wire62 <= wire79) ?
                              (8'hb6) : $signed(wire62)) >> (wire81 >> ((7'h43) ^~ wire62))) ?
                          {((wire68 + (8'ha5)) >> (wire65 ?
                                  wire63 : wire65))} : ((7'h42) ?
                              (!(wire61 == (8'h9f))) : (&wire69))) ?
                      {$unsigned(wire82)} : ($signed(wire68[(4'ha):(3'h5)]) - $signed(wire82[(3'h7):(3'h7)])));
  assign wire85 = (wire62[(5'h15):(5'h15)] ?
                      $signed((($signed(wire62) * (wire65 ? wire63 : wire65)) ?
                          {wire62} : $signed(wire84[(1'h0):(1'h0)]))) : wire67[(4'ha):(2'h2)]);
  assign wire86 = (wire81[(2'h3):(2'h2)] ?
                      (^{($unsigned(wire79) ? wire63 : (~wire66)),
                          $unsigned($unsigned(wire81))}) : wire66);
endmodule

module module12
#(parameter param57 = (-{((-(^~(8'ha4))) ? (((8'hba) ? (7'h41) : (8'hb0)) ? (~^(8'hb9)) : ((8'ha3) >>> (8'hb2))) : (&(^(8'hb2))))}))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire [(4'he):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire52;
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  assign y = {wire56, wire55, wire52, reg54, reg18, (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= $signed({wire14[(3'h4):(1'h1)]});
    end
  module19 #() modinst53 (.y(wire52), .wire23(wire14), .wire24(wire17), .wire22(wire16), .wire21(wire15), .clk(clk), .wire20(reg18));
  always
    @(posedge clk) begin
      reg54 <= ({(+wire52[(3'h4):(2'h2)]),
          {wire13[(1'h0):(1'h0)]}} && ((-(~|wire15[(4'hc):(3'h4)])) ?
          reg18[(3'h4):(3'h4)] : (^(8'hbe))));
    end
  assign wire55 = wire17;
  assign wire56 = {$unsigned({(wire55 * wire17), {(|reg18)}}), (7'h43)};
endmodule

module module19  (y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(5'h14):(1'h0)] wire22;
  input wire [(4'hc):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(2'h2):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire [(4'hc):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire25;
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(2'h3):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire25,
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
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire25 = $signed(wire20[(4'hb):(3'h6)]);
  always
    @(posedge clk) begin
      reg26 <= ($unsigned((~&(wire21 ?
          (wire22 ?
              wire24 : (8'ha2)) : (wire25 != (8'hb9))))) ~^ ((wire23 || (8'hb4)) != (8'haa)));
    end
  always
    @(posedge clk) begin
      if (((-$unsigned($signed(wire24))) - ((^((~|(8'hb4)) ?
          wire22[(3'h7):(2'h3)] : (reg26 ?
              wire21 : wire23))) <= wire23[(1'h1):(1'h1)])))
        begin
          reg27 <= $signed({{wire25,
                  ($signed(wire20) ? ((8'hb7) ^ wire20) : wire25)},
              $signed(((!wire20) ? $unsigned(reg26) : wire22))});
          reg28 <= $signed((wire24 >>> $signed($unsigned((^wire25)))));
          reg29 <= wire20;
          reg30 <= $unsigned((wire23[(1'h0):(1'h0)] ?
              $signed((-$signed(wire25))) : $unsigned({wire22[(3'h7):(2'h3)]})));
          reg31 <= (wire24 << $unsigned(reg30));
        end
      else
        begin
          reg27 <= $unsigned($unsigned($unsigned($unsigned(reg31))));
          if (reg30)
            begin
              reg28 <= $unsigned($signed((-reg28)));
              reg29 <= (~(-(reg31 ? reg31[(3'h5):(2'h2)] : reg26)));
              reg30 <= (8'hab);
              reg31 <= (((8'hbd) != (^~reg28)) + (|{$signed($unsigned(wire24)),
                  $signed(wire21)}));
              reg32 <= (-$signed((wire23 ?
                  reg31[(2'h3):(1'h0)] : $signed(reg30))));
            end
          else
            begin
              reg28 <= $signed(wire21);
            end
          reg33 <= reg27;
          if (wire20[(1'h1):(1'h0)])
            begin
              reg34 <= (8'ha0);
              reg35 <= reg29;
              reg36 <= wire25;
            end
          else
            begin
              reg34 <= reg32;
              reg35 <= $signed(reg29[(5'h15):(4'ha)]);
              reg36 <= wire25;
            end
        end
      reg37 <= {$signed(wire20[(4'hc):(3'h4)]),
          (~|$unsigned(($unsigned(reg31) ?
              (reg28 ~^ wire24) : $signed((8'hb0)))))};
      reg38 <= (reg26 ?
          $unsigned((((reg31 ? wire24 : wire24) > (-reg32)) ?
              (((7'h43) ? reg36 : reg27) >= (wire21 ?
                  reg26 : reg33)) : (|(wire24 >>> (8'hbd))))) : (&((+wire21[(4'ha):(3'h6)]) - ($signed((8'h9e)) ^~ (reg33 == wire24)))));
    end
  assign wire39 = $unsigned((wire20 != (($unsigned(reg27) || wire22) != $unsigned((^reg32)))));
  assign wire40 = $signed(((~{{wire25, reg26}, ((8'h9e) || wire23)}) ?
                      ((~&wire20[(4'h8):(2'h3)]) >>> reg36[(4'ha):(1'h0)]) : ($unsigned(wire21) ?
                          ($signed(reg27) ?
                              (reg34 ?
                                  wire22 : (8'hae)) : wire20) : (^~wire22[(5'h14):(4'hd)]))));
  assign wire41 = $signed(reg35[(1'h1):(1'h1)]);
  assign wire42 = $signed($unsigned((^(!{(8'ha6)}))));
  assign wire43 = ($signed((reg31[(3'h7):(3'h7)] > (-(reg34 << wire41)))) ?
                      ($signed({{wire25,
                              (8'hac)}}) < wire25[(1'h1):(1'h1)]) : $unsigned($signed((wire24[(3'h5):(1'h1)] ?
                          $signed(wire39) : (wire41 ? (8'hbd) : wire20)))));
  assign wire44 = wire21[(3'h6):(1'h1)];
  assign wire45 = ((wire24 || (~^(reg33[(2'h2):(2'h2)] + $signed(reg34)))) ^ reg37);
  assign wire46 = ((&$unsigned(reg31[(2'h3):(2'h2)])) && (reg31 ?
                      (reg26 ?
                          ({wire44} <<< $signed((8'hb0))) : $unsigned((reg29 ?
                              wire45 : wire39))) : $signed((^~{wire43,
                          reg38}))));
  assign wire47 = (wire21 ?
                      (~^$unsigned($signed($unsigned(reg27)))) : ($signed(wire45[(4'hc):(1'h0)]) >>> reg30[(1'h0):(1'h0)]));
  assign wire48 = {wire43[(2'h2):(1'h0)], wire41[(5'h12):(4'hb)]};
  assign wire49 = $unsigned(($signed((wire43 > (reg35 ^ wire43))) ?
                      reg38[(2'h3):(2'h2)] : wire39[(4'ha):(3'h5)]));
  assign wire50 = (wire25[(1'h1):(1'h0)] ?
                      $signed(wire39[(3'h5):(2'h2)]) : wire40);
  assign wire51 = (wire50[(2'h3):(2'h2)] | {wire46});
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire74;
  input wire signed [(4'hd):(1'h0)] wire73;
  input wire signed [(4'ha):(1'h0)] wire72;
  input wire signed [(5'h15):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire78;
  wire [(4'hb):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(4'hb):(1'h0)] wire75;
  assign y = {wire78, wire77, wire76, wire75, (1'h0)};
  assign wire75 = wire74;
  assign wire76 = $signed((wire75 >>> (($unsigned(wire75) ?
                      $unsigned(wire73) : {wire71}) > (|(+wire72)))));
  assign wire77 = ((((8'hb2) <= wire72) >= $unsigned($unsigned((wire73 ?
                      wire73 : wire71)))) && (wire73[(1'h0):(1'h0)] ?
                      (wire74 * (&wire74[(5'h11):(2'h2)])) : $unsigned($signed((wire74 ?
                          (8'ha5) : wire74)))));
  assign wire78 = {$signed(($unsigned((!wire74)) ?
                          ((wire75 < wire74) ?
                              $unsigned((8'hb5)) : (wire74 ?
                                  (7'h41) : (8'had))) : $signed((wire75 ?
                              wire71 : (8'hbd))))),
                      {(wire77[(4'ha):(4'h8)] ?
                              (~&(+wire76)) : {$unsigned(wire73), (8'hb2)}),
                          wire76}};
endmodule
