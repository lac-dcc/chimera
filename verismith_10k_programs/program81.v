module top
#(parameter param111 = ((~|{(+((8'hbf) ? (7'h44) : (8'hbb))), {((8'hbb) != (8'hb8))}}) * (((^(!(7'h40))) <= ((!(8'had)) ? ((8'h9d) ? (8'hb0) : (8'hbd)) : (8'hbe))) <<< ((~&((8'hbc) ^~ (7'h40))) << (&((8'hb8) ? (8'ha3) : (8'hb3)))))), 
parameter param112 = (((|param111) ? (~|param111) : ({(+param111)} - param111)) ? (+(^{param111})) : (~&(8'hb6))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire110;
  wire signed [(2'h2):(1'h0)] wire22;
  wire signed [(3'h7):(1'h0)] wire23;
  wire [(2'h2):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire108;
  reg signed [(4'h8):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  assign y = {wire110,
                 wire22,
                 wire23,
                 wire56,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire108,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed((^(((wire2 ?
          (8'hb5) : wire0) >> {wire3}) != $signed({wire4}))));
      reg6 <= ($unsigned((((reg5 ? wire0 : wire4) == (^wire3)) ?
          wire3 : $signed((wire2 >>> reg5)))) ^~ (+$unsigned(((wire0 && wire4) ?
          $signed(wire3) : reg5[(2'h3):(2'h3)]))));
    end
  always
    @(posedge clk) begin
      reg7 <= wire1[(1'h0):(1'h0)];
      reg8 <= (reg6[(4'h8):(4'h8)] ?
          ((+$signed($signed((8'hbf)))) >= $signed({$unsigned(wire4)})) : (8'h9f));
      if (((8'hbf) <<< $unsigned((reg6 ^~ $unsigned((^~reg6))))))
        begin
          reg9 <= reg7[(3'h4):(1'h0)];
          if ({((wire1[(3'h5):(2'h2)] || $signed(wire3)) ?
                  reg9[(2'h2):(1'h1)] : (~($unsigned(reg6) && $signed(wire2))))})
            begin
              reg10 <= $unsigned({($signed({reg5,
                      wire1}) ^~ wire4[(3'h7):(3'h7)])});
              reg11 <= (($unsigned($unsigned($unsigned(wire1))) | $signed(((8'hbd) * reg10))) >> (((reg8 >> {wire3}) ?
                  $unsigned($unsigned(reg6)) : $unsigned({wire2,
                      wire4})) == ((reg5[(4'h8):(3'h7)] >> reg7[(1'h0):(1'h0)]) ?
                  (reg7[(1'h1):(1'h1)] <<< reg9[(3'h5):(2'h2)]) : wire4)));
              reg12 <= wire3[(5'h12):(3'h6)];
              reg13 <= (8'had);
              reg14 <= $signed(wire1[(4'he):(2'h3)]);
            end
          else
            begin
              reg10 <= $unsigned(((({reg14, reg12} ?
                      $signed(wire0) : $unsigned(wire3)) ?
                  $signed((reg9 ? reg6 : wire2)) : wire2) >= (~wire4)));
              reg11 <= $unsigned(((~^$unsigned($signed(reg9))) ?
                  {$signed(reg11[(1'h0):(1'h0)])} : {$signed({reg13})}));
              reg12 <= (^reg10);
              reg13 <= $unsigned(reg5);
            end
          if (reg12)
            begin
              reg15 <= wire4;
              reg16 <= (8'ha3);
              reg17 <= reg5[(3'h7):(2'h3)];
              reg18 <= reg7;
            end
          else
            begin
              reg15 <= ($signed(($signed($unsigned(wire1)) ?
                  ($signed((8'hae)) ?
                      $unsigned(reg6) : {(8'ha5),
                          wire0}) : {wire2})) - ($unsigned(reg13[(4'hb):(3'h4)]) ?
                  $signed(wire4) : ($signed((reg18 <= reg12)) ?
                      $unsigned((7'h42)) : {reg11[(1'h1):(1'h0)]})));
            end
          reg19 <= ($signed(($unsigned((reg13 ? reg12 : (8'hb5))) ?
                  $unsigned({(8'ha3), reg18}) : ((reg10 ?
                      wire4 : wire4) && $signed(reg14)))) ?
              {reg14[(1'h1):(1'h1)], (8'ha2)} : (($signed((reg14 >>> reg17)) ?
                      reg11 : (+(wire3 <<< reg13))) ?
                  reg8 : reg15));
        end
      else
        begin
          reg9 <= reg17[(3'h4):(1'h1)];
          reg10 <= reg10[(1'h0):(1'h0)];
          reg11 <= $unsigned((reg5 | (-$unsigned($unsigned(reg16)))));
        end
      reg20 <= {$signed((8'h9c))};
      reg21 <= $signed((~^{$unsigned((reg19 + reg20))}));
    end
  assign wire22 = $signed((|$signed({(~^(8'hbd)), (-(8'hb2))})));
  assign wire23 = ($unsigned(($unsigned(reg10) ?
                          reg5 : $unsigned($unsigned(reg13)))) ?
                      $unsigned(reg14) : reg11[(2'h2):(1'h1)]);
  module24 #() modinst57 (.y(wire56), .clk(clk), .wire26(wire4), .wire29(reg11), .wire27(wire0), .wire25(reg10), .wire28(reg6));
  assign wire58 = {(~|$unsigned(((~^reg18) ?
                          $unsigned((8'hbb)) : (reg20 >> reg7)))),
                      $signed(reg7)};
  assign wire59 = $unsigned({(({reg20} ?
                          $signed(reg19) : reg6[(4'h8):(3'h7)]) >> (wire58 ?
                          (reg6 ? reg9 : reg17) : $unsigned(wire23))),
                      (((+wire23) >> $unsigned(reg19)) ~^ $signed(wire4))});
  assign wire60 = wire0[(2'h3):(2'h2)];
  assign wire61 = wire3[(4'hc):(2'h2)];
  module62 #() modinst109 (wire108, clk, wire60, wire0, reg13, reg6, wire23);
  assign wire110 = ((((^{wire4}) ?
                       ({reg12} > (reg9 <= (8'hb8))) : reg21) ^ $signed(((+wire58) ?
                       $unsigned(reg11) : wire59[(1'h0):(1'h0)]))) < (+($unsigned((reg14 * wire4)) ?
                       ($signed(reg8) ?
                           {reg14} : wire0[(5'h15):(5'h12)]) : wire2[(1'h0):(1'h0)])));
endmodule

module module62
#(parameter param107 = (~(+({{(8'ha0)}} && (~|(!(8'ha2)))))))
(y, clk, wire63, wire64, wire65, wire66, wire67);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire63;
  input wire [(5'h12):(1'h0)] wire64;
  input wire signed [(3'h7):(1'h0)] wire65;
  input wire [(3'h6):(1'h0)] wire66;
  input wire signed [(3'h7):(1'h0)] wire67;
  wire signed [(4'h9):(1'h0)] wire106;
  wire signed [(2'h3):(1'h0)] wire105;
  wire signed [(5'h13):(1'h0)] wire104;
  wire signed [(5'h10):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire77;
  wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire102;
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire76,
                 wire77,
                 wire81,
                 wire84,
                 wire102,
                 reg78,
                 reg79,
                 reg80,
                 reg82,
                 reg83,
                 (1'h0)};
  assign wire68 = {wire66[(2'h3):(2'h2)], wire66[(3'h5):(2'h3)]};
  assign wire69 = $signed(wire63[(3'h5):(1'h1)]);
  assign wire70 = (~|$unsigned($signed(wire63[(4'h8):(3'h4)])));
  assign wire71 = $signed((|$signed(wire64)));
  assign wire72 = $signed((wire65 ? wire70 : $signed({$signed((7'h44))})));
  assign wire73 = $unsigned(wire72[(1'h1):(1'h0)]);
  assign wire74 = {(!((!wire70[(2'h2):(1'h0)]) ^~ ($signed((8'hab)) ?
                          wire66[(3'h5):(3'h4)] : (!wire71))))};
  assign wire75 = wire63;
  assign wire76 = ({(~&$signed((wire69 | wire63))),
                          {(wire74[(1'h1):(1'h0)] ? wire73 : wire74),
                              (wire67[(3'h4):(1'h0)] ?
                                  $signed(wire66) : $signed((7'h42)))}} ?
                      wire68 : (wire64 && {($signed(wire66) < (wire69 != wire69)),
                          {$unsigned(wire65)}}));
  assign wire77 = ((-$unsigned((^~$unsigned(wire65)))) | $unsigned($signed($signed((-wire76)))));
  always
    @(posedge clk) begin
      reg78 <= (wire74[(2'h3):(1'h1)] * wire69);
      reg79 <= ((wire65 && (&(~^wire74[(1'h0):(1'h0)]))) ^~ (wire64[(4'he):(4'h9)] ?
          ($unsigned((wire71 ? wire74 : (8'hbb))) ?
              ({wire66, wire76} ?
                  wire75[(5'h14):(4'hc)] : (~^wire65)) : ((wire64 + reg78) ?
                  (&wire75) : $unsigned(wire66))) : (^(|(wire74 != (8'ha8))))));
      reg80 <= (7'h42);
    end
  assign wire81 = {$signed(reg78)};
  always
    @(posedge clk) begin
      reg82 <= ({$signed(wire74)} < (wire63 ?
          $signed((wire64 ? (~&wire67) : $signed(wire66))) : $signed((8'hb0))));
      reg83 <= wire67;
    end
  assign wire84 = (~^reg83[(4'hb):(3'h4)]);
  module85 #() modinst103 (wire102, clk, wire73, wire69, wire76, reg82);
  assign wire104 = (~|$signed($signed(($signed((8'ha6)) ?
                       $signed(wire65) : ((8'ha4) >>> wire77)))));
  assign wire105 = $unsigned($signed({$signed((wire77 | wire63)),
                       (wire76 ? wire76 : $unsigned(wire84))}));
  assign wire106 = (+wire75[(1'h0):(1'h0)]);
endmodule

module module24
#(parameter param54 = (((({(8'hac), (8'ha6)} ~^ (|(7'h41))) ? (~(-(8'hbd))) : (~|((7'h44) ? (8'h9d) : (8'ha3)))) & (7'h43)) ? ((({(8'hb2), (8'hbb)} ? (~(8'ha0)) : (~|(8'hb2))) | {{(7'h44), (8'hb7)}, (^(8'had))}) == (8'ha0)) : (!(!(-{(8'ha5), (7'h42)})))), 
parameter param55 = param54)
(y, clk, wire25, wire26, wire27, wire28, wire29);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire25;
  input wire [(4'hc):(1'h0)] wire26;
  input wire [(5'h15):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire28;
  input wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire49;
  assign y = {wire53, wire52, wire51, wire49, (1'h0)};
  module30 #() modinst50 (.wire34(wire26), .y(wire49), .wire31(wire25), .wire32(wire27), .wire35(wire29), .clk(clk), .wire33(wire28));
  assign wire51 = ({(~(^~$unsigned(wire29))),
                      wire25[(3'h7):(1'h0)]} ~^ (({{wire28}} ?
                      (~wire49[(4'hf):(3'h6)]) : wire49) && ($unsigned((wire28 ?
                          (8'ha8) : wire49)) ?
                      (^wire28) : wire28)));
  assign wire52 = wire51;
  assign wire53 = (-((~^(^$signed((8'ha7)))) ?
                      (|wire27) : $unsigned($unsigned($signed((8'ha3))))));
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire35;
  input wire [(3'h7):(1'h0)] wire34;
  input wire signed [(4'hc):(1'h0)] wire33;
  input wire signed [(4'h9):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 (1'h0)};
  assign wire36 = $unsigned(wire32[(4'h8):(3'h6)]);
  assign wire37 = $signed(wire31);
  assign wire38 = $unsigned($unsigned({(wire35 <<< (~wire37))}));
  assign wire39 = {((^~$unsigned(wire31)) >= ($signed((~^wire35)) <= $unsigned((&wire33)))),
                      (~wire32)};
  assign wire40 = (^$unsigned((($unsigned(wire31) | $signed(wire36)) == $unsigned((~|wire39)))));
  assign wire41 = (~&(wire37[(2'h3):(1'h0)] < wire37[(2'h3):(2'h2)]));
  assign wire42 = (((+($unsigned(wire38) ~^ $signed(wire31))) ?
                      wire41[(1'h1):(1'h1)] : $unsigned((^$signed(wire38)))) ~^ ($signed(wire38) << {(wire31[(4'he):(4'h9)] && (wire36 || wire38))}));
  assign wire43 = wire37;
  assign wire44 = (~^wire34[(2'h2):(1'h0)]);
  assign wire45 = {{$unsigned((~^wire43[(3'h5):(2'h3)])),
                          {$signed($signed(wire32))}},
                      ((wire35[(2'h3):(2'h3)] <= wire40) >= {(|$signed(wire44)),
                          $unsigned((wire32 | wire40))})};
  assign wire46 = (8'hab);
  assign wire47 = wire41;
  assign wire48 = wire39[(4'hd):(1'h0)];
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire89;
  input wire [(5'h14):(1'h0)] wire88;
  input wire [(4'hf):(1'h0)] wire87;
  input wire [(4'ha):(1'h0)] wire86;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(4'h9):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire99;
  wire [(4'hb):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(4'ha):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(4'hf):(1'h0)] wire92;
  wire [(3'h4):(1'h0)] wire90;
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire90,
                 reg91,
                 (1'h0)};
  assign wire90 = wire87;
  always
    @(posedge clk) begin
      reg91 <= {({($signed(wire88) && wire86[(3'h7):(3'h6)]),
                  (+(wire87 != wire89))} ?
              ((&{wire89}) >>> (wire89 ~^ wire90)) : wire89),
          wire87[(4'hc):(4'hb)]};
    end
  assign wire92 = wire87[(4'he):(3'h4)];
  assign wire93 = (wire87[(2'h2):(1'h0)] ?
                      wire86 : (~^($unsigned(wire90[(3'h4):(2'h2)]) ?
                          ($signed(reg91) ?
                              $signed(wire87) : $signed(reg91)) : (~|(~|(8'hb4))))));
  assign wire94 = wire90[(2'h2):(1'h1)];
  assign wire95 = wire93[(4'ha):(3'h4)];
  assign wire96 = $unsigned(($unsigned(wire89[(4'h8):(4'h8)]) < ($signed($signed(wire88)) >>> ({(8'hb4),
                      wire86} * wire88[(5'h14):(2'h2)]))));
  assign wire97 = $signed(wire87);
  assign wire98 = ({({(!wire96)} || $signed((8'hba)))} ?
                      (($unsigned(((8'hb1) ^ wire93)) >= wire97) ?
                          $signed((^{wire86})) : wire97) : {wire97});
  assign wire99 = wire92[(4'hc):(1'h1)];
  assign wire100 = $unsigned(wire93[(4'hb):(4'hb)]);
  assign wire101 = reg91[(3'h7):(1'h0)];
endmodule
