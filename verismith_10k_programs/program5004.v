module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire119;
  wire [(4'hf):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire112;
  wire [(4'h8):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire109;
  wire signed [(5'h11):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(5'h10):(1'h0)] wire97;
  wire [(5'h13):(1'h0)] wire96;
  wire [(5'h12):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire94,
                 wire5,
                 wire4,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 (1'h0)};
  assign wire4 = $signed(($unsigned({((8'hb1) ? wire0 : (8'h9d)), wire3}) ?
                     wire2[(3'h5):(1'h0)] : wire1[(1'h0):(1'h0)]));
  assign wire5 = {$signed(($signed((wire3 ?
                         wire3 : wire4)) | (-((8'hb2) ~^ wire4))))};
  module6 #() modinst95 (wire94, clk, wire2, wire3, wire1, wire4);
  assign wire96 = ((~&{(wire0[(2'h2):(1'h1)] ?
                          $signed(wire4) : $unsigned(wire94)),
                      wire1}) & $unsigned((~|wire4[(2'h2):(1'h1)])));
  assign wire97 = (($unsigned($unsigned($unsigned(wire5))) ~^ $signed((~^(wire5 ?
                      wire96 : wire3)))) == (wire1 ? wire3 : wire96));
  assign wire98 = wire3[(1'h1):(1'h1)];
  assign wire99 = $unsigned((-((~{wire1}) ? wire96 : wire94)));
  assign wire100 = (($signed($signed((~^(8'hb5)))) - (wire3[(2'h3):(1'h1)] ?
                       ((wire94 < wire96) != ((8'hba) == wire1)) : wire4[(2'h2):(1'h0)])) & ((|$unsigned({wire2,
                           wire96})) ?
                       $signed($signed(((8'ha2) ~^ wire97))) : (wire94 ?
                           (^~(-wire4)) : (wire4[(3'h5):(1'h1)] ?
                               (~^wire96) : $unsigned(wire5)))));
  assign wire101 = (-wire4);
  assign wire102 = ($unsigned((+$signed(wire4[(1'h0):(1'h0)]))) ?
                       (wire3[(4'hb):(1'h1)] == {wire98[(2'h2):(1'h1)]}) : ({(wire5[(1'h1):(1'h0)] ?
                               (&(8'hab)) : wire0[(1'h0):(1'h0)]),
                           (^wire2[(4'hf):(4'hc)])} >> $unsigned($signed($unsigned(wire3)))));
  assign wire103 = $unsigned((^~(($unsigned(wire96) <= wire97[(1'h0):(1'h0)]) ?
                       wire100[(3'h4):(1'h1)] : (!(wire3 == wire98)))));
  assign wire104 = wire102[(4'hd):(3'h4)];
  assign wire105 = {($signed((+$unsigned(wire2))) >= (($signed(wire103) ?
                               wire102 : (~wire98)) ?
                           $signed($signed(wire3)) : ({wire104} && {wire103,
                               (8'hbf)})))};
  assign wire106 = $signed((((~&wire102) | wire4[(4'h9):(2'h3)]) ?
                       $signed($unsigned(wire1)) : (^$unsigned((wire1 ?
                           wire96 : wire98)))));
  assign wire107 = $unsigned($unsigned(wire105));
  assign wire108 = $signed((&$signed($unsigned($unsigned(wire107)))));
  assign wire109 = $signed((~^wire99));
  assign wire110 = $unsigned((({wire108} ?
                       wire3 : wire4[(3'h5):(1'h0)]) >> $signed(((wire106 || wire108) ?
                       (~(8'hb6)) : wire99))));
  assign wire111 = wire101[(3'h6):(3'h6)];
  assign wire112 = {((wire99 ?
                               $signed({wire1, wire102}) : $unsigned((wire106 ?
                                   (8'ha8) : wire99))) ?
                           wire96[(5'h12):(4'hb)] : $unsigned({(wire103 > wire107)}))};
  always
    @(posedge clk) begin
      reg113 <= (($unsigned(wire96[(5'h10):(4'ha)]) + {wire4[(3'h5):(3'h5)]}) + $unsigned(wire0));
      reg114 <= $unsigned($unsigned((wire112 != ($unsigned(wire101) ?
          (reg113 ? wire96 : wire111) : wire108[(2'h3):(2'h3)]))));
      reg115 <= $signed(wire112[(1'h1):(1'h0)]);
      reg116 <= ($signed(($unsigned($unsigned(wire106)) > (|(wire108 >>> (8'h9f))))) << (~{(~^$unsigned(reg114))}));
      reg117 <= (~&((~^(8'hba)) ? $unsigned(wire5) : $unsigned((8'h9d))));
    end
  assign wire118 = ($unsigned((|$signed((&wire3)))) | (wire97 >= (&((wire103 ?
                       wire110 : (8'hb1)) <<< $unsigned(wire1)))));
  assign wire119 = wire5;
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire90;
  reg [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire40,
                 wire12,
                 wire46,
                 wire90,
                 reg11,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $unsigned(((!{wire10[(3'h6):(1'h0)],
          $signed((8'hb2))}) <= (((+wire10) ? $unsigned(wire7) : wire10) ?
          wire9[(1'h1):(1'h0)] : ($signed(wire8) ?
              (!wire9) : (wire7 ? wire7 : wire7)))));
    end
  assign wire12 = (wire8[(3'h7):(1'h0)] ~^ ($signed(($signed((8'hbd)) ?
                      wire9 : ((8'hb2) ?
                          wire8 : wire8))) != ({$signed((8'hb0))} ?
                      $signed(wire8) : wire7)));
  module13 #() modinst41 (.clk(clk), .wire16(reg11), .wire14(wire12), .wire15(wire8), .y(wire40), .wire17(wire9));
  always
    @(posedge clk) begin
      reg42 <= {wire12,
          ({(8'had)} ?
              (wire12 ?
                  (~&{(8'ha5),
                      wire40}) : (wire10 > wire40)) : $unsigned($unsigned($unsigned(wire7))))};
      reg43 <= wire8;
      reg44 <= (({$unsigned(wire40[(3'h4):(1'h1)]),
              ($signed(wire40) ? $signed(wire12) : (+wire10))} ?
          $unsigned((reg43[(3'h4):(3'h4)] ?
              $unsigned(wire7) : (!wire40))) : {((~^wire9) ?
                  wire12[(2'h3):(2'h2)] : (wire40 != wire10))}) >>> ((reg11[(1'h1):(1'h0)] ?
              wire10 : wire7[(3'h7):(1'h1)]) ?
          ((((8'hbf) ? (8'h9e) : reg42) ?
              $unsigned(wire8) : (wire8 ?
                  wire7 : wire7)) != wire40) : $unsigned(wire40)));
      reg45 <= wire12[(4'h8):(1'h1)];
    end
  assign wire46 = (wire12 ?
                      ((wire12[(1'h1):(1'h1)] & reg45[(1'h0):(1'h0)]) > (~((wire12 <<< wire7) ?
                          wire9[(5'h10):(4'hd)] : $signed(reg45)))) : (({wire12[(3'h6):(1'h1)]} ?
                          {{(7'h41), reg45},
                              ((8'had) != reg42)} : wire7) ^ (!((wire12 ?
                          (8'hb1) : reg11) && reg42[(3'h4):(1'h0)]))));
  module47 #() modinst91 (wire90, clk, wire40, wire8, reg45, wire10);
  assign wire92 = $unsigned($unsigned(reg42));
  assign wire93 = reg11[(3'h6):(3'h5)];
endmodule

module module47
#(parameter param88 = (~^(((^((8'hb0) ? (7'h42) : (8'ha9))) ^~ (^{(8'had)})) ? {(((8'hae) <= (8'ha9)) == ((8'haa) ? (8'hbb) : (8'h9d))), (8'ha7)} : (((^(8'ha9)) ? ((8'ha5) ? (8'hb0) : (8'hb1)) : ((8'haa) ? (8'ha4) : (8'hb7))) >>> ((~(8'haf)) ? ((8'hb5) ? (8'hbb) : (8'h9d)) : (^~(8'h9c)))))), 
parameter param89 = (&((!((^param88) ? {param88, param88} : (param88 ? param88 : param88))) ~^ (+(param88 ~^ {param88, param88})))))
(y, clk, wire51, wire50, wire49, wire48);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire51;
  input wire signed [(4'he):(1'h0)] wire50;
  input wire [(3'h7):(1'h0)] wire49;
  input wire [(5'h11):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire87;
  wire [(2'h3):(1'h0)] wire86;
  wire signed [(3'h6):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire71;
  wire [(3'h5):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire [(3'h4):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire72,
                 wire71,
                 wire70,
                 wire66,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
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
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire52 = (-wire48[(5'h10):(4'h8)]);
  assign wire53 = $signed($unsigned((-wire50[(1'h0):(1'h0)])));
  assign wire54 = (!wire52);
  assign wire55 = (wire50 ?
                      $unsigned($unsigned((~^(wire54 << (7'h42))))) : $unsigned(wire54[(2'h2):(2'h2)]));
  assign wire56 = wire54;
  always
    @(posedge clk) begin
      reg57 <= ((!(wire51[(1'h0):(1'h0)] ? wire56 : wire52[(1'h1):(1'h1)])) ?
          wire51[(4'h9):(3'h7)] : (!{(~wire55[(1'h1):(1'h0)]), wire48}));
      reg58 <= $signed((~&($unsigned($unsigned(wire54)) ?
          ((wire53 * wire55) ?
              $unsigned(wire49) : $signed((8'hac))) : $signed((wire51 ?
              (8'ha2) : wire56)))));
      if (wire53)
        begin
          reg59 <= wire52[(2'h2):(1'h0)];
          reg60 <= (8'hb1);
          reg61 <= wire55;
          if ($signed($signed(wire49)))
            begin
              reg62 <= {(!((^wire55[(1'h1):(1'h1)]) < (~&(8'hbc))))};
            end
          else
            begin
              reg62 <= wire53;
              reg63 <= wire53;
            end
        end
      else
        begin
          if ((+$unsigned((wire48[(4'h9):(4'h8)] <<< wire50[(4'hd):(1'h0)]))))
            begin
              reg59 <= (8'hb2);
              reg60 <= reg57[(3'h6):(1'h1)];
              reg61 <= $signed((({$unsigned(wire53)} ?
                      $signed(((8'hbf) ? reg61 : reg57)) : $signed((+wire49))) ?
                  {reg60[(4'ha):(2'h2)],
                      wire56[(3'h5):(3'h5)]} : reg59[(1'h0):(1'h0)]));
              reg62 <= (({(reg61[(4'hc):(2'h3)] ?
                          $unsigned((7'h40)) : $unsigned((8'hb2))),
                      reg57[(2'h3):(1'h1)]} ?
                  wire48[(4'hd):(4'ha)] : $unsigned((~^reg60))) || ($unsigned((|$unsigned(reg58))) ^~ wire48[(4'hb):(4'ha)]));
              reg63 <= ($unsigned(((reg61[(5'h11):(1'h1)] ?
                      reg59[(1'h1):(1'h0)] : (!(8'had))) * (reg59[(3'h6):(3'h6)] <<< {(8'h9d)}))) ?
                  $signed((|reg58)) : reg59);
            end
          else
            begin
              reg59 <= (~{(wire54 ?
                      $signed((~&wire54)) : $unsigned($unsigned(wire52))),
                  $unsigned(reg58[(4'hf):(1'h1)])});
              reg60 <= $signed((~^$signed((~&(reg58 >= (8'had))))));
              reg61 <= reg60;
            end
          reg64 <= $unsigned($signed({wire50[(4'hd):(4'h8)]}));
        end
      reg65 <= (8'hac);
    end
  assign wire66 = $signed(reg57[(3'h6):(2'h2)]);
  always
    @(posedge clk) begin
      reg67 <= $unsigned((reg65 ?
          ((!(+wire54)) ?
              $unsigned(reg65[(3'h5):(1'h1)]) : (8'hb7)) : ({(wire50 <<< reg63),
              (wire56 ^~ reg61)} & $unsigned((wire54 ? wire51 : reg57)))));
      reg68 <= $unsigned((|(~^$unsigned(wire50[(1'h1):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg69 <= $signed($unsigned($signed(($signed(reg68) ^~ $unsigned(wire53)))));
    end
  assign wire70 = $signed($signed(reg64[(3'h6):(3'h4)]));
  assign wire71 = wire54[(2'h2):(1'h1)];
  assign wire72 = $signed((reg59[(4'he):(2'h3)] >> reg59));
  always
    @(posedge clk) begin
      reg73 <= (|$unsigned($signed((!(reg63 > wire71)))));
      if (wire72[(1'h1):(1'h0)])
        begin
          reg74 <= $signed($signed(((|$unsigned(wire51)) != (~$signed(wire51)))));
          reg75 <= (+{$signed($signed(((8'hb9) >> (8'hbd))))});
          reg76 <= (($signed(((+wire53) != $signed((8'haf)))) ?
              $signed($unsigned($signed(wire71))) : reg62) > ({((reg64 ?
                  wire53 : wire56) <<< wire66),
              reg68[(3'h4):(1'h1)]} << wire48[(4'hf):(4'ha)]));
          reg77 <= $unsigned($signed(((|$signed(reg73)) << reg57)));
        end
      else
        begin
          reg74 <= (($signed($signed(wire71)) | ($signed(reg76[(4'he):(4'h9)]) ~^ reg63[(3'h6):(3'h6)])) > ($unsigned((|(reg75 <= reg62))) ?
              reg73 : reg58));
          reg75 <= reg57[(3'h5):(3'h5)];
          reg76 <= reg68[(3'h4):(2'h3)];
          reg77 <= reg57[(2'h3):(1'h0)];
        end
      reg78 <= ($signed((~|{reg65, (reg67 | (8'hb7))})) ?
          $signed($signed((|wire66[(2'h2):(1'h1)]))) : ((~^reg63) ?
              (~^$unsigned((7'h43))) : $unsigned({wire53[(4'hd):(2'h2)],
                  reg63})));
      if (reg68)
        begin
          reg79 <= ((8'hb2) & (reg57 ?
              $unsigned((^{wire53, wire52})) : $signed(($signed(reg68) ?
                  (^(8'hb4)) : $unsigned((8'hae))))));
          reg80 <= (~|({(&wire56)} ?
              (8'haf) : (reg77[(1'h1):(1'h1)] ? reg67 : ((8'ha7) ^ reg79))));
        end
      else
        begin
          reg79 <= ({($unsigned((reg61 ?
                      reg78 : reg58)) <<< $signed((!reg67)))} ?
              wire66[(2'h3):(1'h1)] : (8'ha8));
          reg80 <= $signed({(^~(+$unsigned(reg74)))});
          reg81 <= wire55;
          reg82 <= (($unsigned(((reg59 ? reg59 : wire71) ?
                  (~^wire71) : (wire53 ? reg69 : reg68))) > $unsigned({{reg65,
                      wire55},
                  (reg78 ? wire48 : reg65)})) ?
              (~^({wire52, (wire51 ? reg60 : wire51)} * ((wire49 >> reg65) ?
                  (reg79 ? wire50 : reg63) : $signed(wire52)))) : (!(({reg67,
                          reg59} ?
                      (reg79 >>> reg57) : wire53) ?
                  ((wire50 ? reg74 : (8'hbe)) ?
                      (reg64 ?
                          reg62 : reg57) : reg74[(2'h2):(2'h2)]) : reg80)));
        end
      reg83 <= (8'ha6);
    end
  assign wire84 = $signed(reg77[(1'h0):(1'h0)]);
  assign wire85 = (~($signed(wire50) ?
                      $signed($unsigned((reg83 ? wire50 : wire55))) : reg63));
  assign wire86 = ({(~|(|(^wire66))), (~|$signed((reg67 >= reg69)))} || reg60);
  assign wire87 = wire66[(2'h2):(2'h2)];
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(4'hc):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'ha):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire25;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(4'he):(1'h0)] wire19;
  wire [(2'h3):(1'h0)] wire18;
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'hd):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg36,
                 reg35,
                 reg34,
                 reg28,
                 (1'h0)};
  assign wire18 = (+wire14);
  assign wire19 = $signed((wire18 > (^$signed(wire16[(4'hc):(4'h8)]))));
  assign wire20 = (wire15[(1'h0):(1'h0)] != $unsigned($signed($unsigned(wire18[(1'h1):(1'h1)]))));
  assign wire21 = wire17[(5'h12):(4'hb)];
  assign wire22 = wire15;
  assign wire23 = (wire18[(2'h2):(1'h0)] ?
                      ($unsigned($signed((^~wire18))) & ($unsigned(wire15[(3'h4):(3'h4)]) & $unsigned((^wire16)))) : ({(wire15 ?
                              wire20[(2'h2):(1'h1)] : (wire14 ?
                                  wire19 : wire18))} >>> (7'h43)));
  assign wire24 = (wire14 - (wire19 ?
                      ($signed(wire16) ?
                          $unsigned(((8'hae) ^~ wire20)) : $signed(wire22[(1'h1):(1'h0)])) : (($signed((8'hac)) & {(8'h9e),
                          wire17}) <= $unsigned(wire20[(2'h3):(2'h2)]))));
  assign wire25 = (~^wire21);
  assign wire26 = wire18[(2'h3):(1'h1)];
  assign wire27 = $signed($unsigned((~&(~$signed((8'hb7))))));
  always
    @(posedge clk) begin
      reg28 <= ({$unsigned($unsigned((+wire17))),
          $unsigned(wire23[(1'h1):(1'h0)])} < wire24[(3'h7):(3'h6)]);
    end
  assign wire29 = (wire14 ? (+wire23) : {$unsigned($signed((^~wire27)))});
  assign wire30 = (((wire23[(2'h3):(1'h0)] ?
                              $unsigned(wire25[(2'h3):(1'h0)]) : ((wire17 ?
                                      (8'hab) : wire27) ?
                                  (wire18 ? (8'hbe) : wire25) : (wire15 ?
                                      wire23 : wire24))) ?
                          (+$unsigned((wire26 ?
                              wire25 : reg28))) : ((!$signed(wire19)) ?
                              {{wire16}} : (wire25 ?
                                  wire22[(3'h4):(1'h1)] : (^wire19)))) ?
                      (^~(~|$unsigned(wire19[(2'h2):(1'h0)]))) : ((^~wire26[(1'h0):(1'h0)]) ?
                          ((~^(wire24 ? wire27 : wire29)) ?
                              $signed($unsigned(wire16)) : {(wire24 ^~ wire24)}) : wire21[(2'h2):(2'h2)]));
  assign wire31 = (8'hbc);
  assign wire32 = ({((8'hab) ? {(8'hb1)} : ((-wire30) && $signed((8'ha8))))} ?
                      (^reg28) : ({((wire27 ? wire20 : wire15) ?
                              (wire18 && wire21) : (wire19 ?
                                  (8'hbb) : wire31))} | {wire26,
                          {wire29, wire16}}));
  assign wire33 = (!(wire27 > wire16[(3'h7):(1'h0)]));
  always
    @(posedge clk) begin
      reg34 <= $signed($unsigned((&$unsigned((wire24 * (8'ha9))))));
      reg35 <= $unsigned($unsigned($unsigned(($unsigned(wire18) ?
          {wire21} : $signed(wire18)))));
      reg36 <= (&(wire32[(2'h2):(1'h0)] ?
          (+(~|{wire16, wire16})) : wire16[(4'ha):(2'h2)]));
    end
  assign wire37 = (((~^(reg35[(1'h0):(1'h0)] + $unsigned(reg28))) ?
                      wire26 : ($signed({wire31}) != ((wire15 ^ (7'h42)) ?
                          {(7'h43)} : wire20[(1'h1):(1'h0)]))) < ({(&{reg35,
                          wire20}),
                      wire14} == (8'hb9)));
  assign wire38 = ($unsigned(((reg28[(3'h5):(2'h2)] || (wire15 ?
                              wire30 : (8'ha6))) ?
                          reg28[(1'h1):(1'h0)] : ($unsigned((8'ha7)) ?
                              ((8'h9d) ? wire24 : wire25) : $signed(wire26)))) ?
                      wire20 : reg36[(3'h6):(3'h4)]);
  assign wire39 = wire14[(3'h7):(2'h3)];
endmodule
