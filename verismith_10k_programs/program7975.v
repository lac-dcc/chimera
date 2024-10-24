module top
#(parameter param111 = (((-(((8'hbe) == (8'hae)) > {(8'hb1), (8'ha5)})) <<< (~(((8'ha8) ? (8'hae) : (8'hbd)) ~^ ((8'hbd) ~^ (8'ha7))))) ^ (~|{(((8'h9c) ? (8'ha5) : (8'hb9)) == (~(8'hb7))), {((8'ha5) >> (8'hae))}})), 
parameter param112 = (&(((param111 ^ param111) && ((param111 ? param111 : param111) ? (param111 != param111) : param111)) >> param111)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(5'h11):(1'h0)] wire100;
  wire [(2'h2):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire98,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire4 = $unsigned({(wire0 ?
                         (|wire0[(4'hc):(1'h1)]) : wire3[(3'h5):(1'h0)])});
  assign wire5 = $signed((&{(&$signed(wire3))}));
  assign wire6 = wire3;
  assign wire7 = wire0[(1'h1):(1'h1)];
  assign wire8 = $unsigned($unsigned(({(wire3 ?
                         wire4 : wire1)} <<< {wire5[(1'h1):(1'h1)]})));
  assign wire9 = $signed((+((~|$signed(wire4)) >> wire3[(4'ha):(4'h9)])));
  module10 #() modinst99 (wire98, clk, wire0, wire6, wire8, wire4);
  assign wire100 = ((8'hba) ? wire4[(5'h11):(4'hd)] : wire4);
  assign wire101 = $unsigned((-(8'hb7)));
  always
    @(posedge clk) begin
      reg102 <= $unsigned($unsigned({wire3[(4'ha):(1'h1)], (!(^~(7'h40)))}));
      reg103 <= $unsigned((+(wire0 ?
          $unsigned((wire1 ? reg102 : (8'hb3))) : {{wire3}})));
      if (wire6[(4'hf):(3'h7)])
        begin
          reg104 <= ($unsigned($unsigned(((wire1 < wire2) ?
                  $unsigned(wire100) : wire9))) ?
              ($signed($unsigned((~wire6))) ~^ $signed(reg102)) : $unsigned({(~^((8'hb0) ?
                      wire9 : wire4))}));
          reg105 <= $signed(wire2);
        end
      else
        begin
          reg104 <= $signed(reg103);
          reg105 <= wire98;
          reg106 <= (^~(7'h40));
          reg107 <= (|(({wire6, (wire8 ^~ wire100)} ?
                  ((!(7'h42)) ? (~&wire0) : {wire7}) : wire4[(4'h8):(1'h1)]) ?
              reg102 : wire3));
          reg108 <= wire4;
        end
      reg109 <= (~&reg104[(4'h8):(2'h3)]);
      reg110 <= (^~$signed(wire100));
    end
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h169):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire97;
  wire signed [(4'h9):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  reg [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(4'hb):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  assign y = {wire97,
                 wire75,
                 wire74,
                 wire72,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
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
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire15 = $unsigned(wire11);
  assign wire16 = wire13;
  assign wire17 = (&(|(((wire13 ? wire13 : wire16) == wire13[(1'h1):(1'h1)]) ?
                      $signed({wire16}) : wire16[(2'h2):(1'h1)])));
  assign wire18 = $signed($unsigned($signed((wire16[(1'h0):(1'h0)] == (8'ha7)))));
  assign wire19 = (wire16 ?
                      wire18[(3'h5):(3'h4)] : {(7'h40),
                          (!{((8'hae) > (8'h9e))})});
  module20 #() modinst50 (.wire24(wire12), .wire23(wire14), .wire22(wire17), .y(wire49), .clk(clk), .wire21(wire13));
  assign wire51 = wire14[(5'h11):(4'h9)];
  assign wire52 = $signed(wire17[(2'h2):(1'h0)]);
  assign wire53 = ($unsigned(wire14) ?
                      wire13 : ($signed(((~(8'hba)) >= wire52[(3'h5):(1'h0)])) >>> (~|((wire15 ?
                          wire19 : wire17) < (wire11 ? (8'ha2) : wire51)))));
  assign wire54 = $unsigned($unsigned((($signed(wire15) + (~|wire13)) && {wire15[(1'h1):(1'h1)],
                      (-wire51)})));
  assign wire55 = ($unsigned((!($unsigned(wire52) | (^~wire52)))) ?
                      wire19[(4'hb):(3'h6)] : $signed({wire14[(3'h4):(2'h2)]}));
  module56 #() modinst73 (.wire60(wire18), .y(wire72), .wire57(wire11), .wire59(wire55), .clk(clk), .wire58(wire52));
  assign wire74 = ($signed((-($signed(wire53) ?
                      $signed(wire15) : $unsigned(wire54)))) > wire19[(3'h6):(2'h3)]);
  assign wire75 = (((&($signed(wire19) * wire52[(4'h8):(1'h1)])) ?
                          $unsigned({wire13[(4'hd):(4'h9)]}) : $signed(wire16)) ?
                      wire11 : {(~&((wire14 >> wire74) ?
                              (wire12 < wire14) : (-wire49)))});
  always
    @(posedge clk) begin
      reg76 <= (+$signed(wire74[(1'h1):(1'h0)]));
      reg77 <= $signed(wire75);
      if (wire49)
        begin
          if ($unsigned(wire19))
            begin
              reg78 <= (wire72 ? $signed(wire74[(3'h4):(2'h2)]) : (8'had));
              reg79 <= {$unsigned({wire53, $unsigned({(7'h43), (8'ha5)})}),
                  {({$unsigned(wire52), wire18} ?
                          {$unsigned(wire53),
                              $unsigned(wire75)} : ((wire14 || wire51) ^~ {wire72}))}};
            end
          else
            begin
              reg78 <= ((($unsigned(reg78) ?
                          (wire15 ?
                              $signed(wire15) : ((8'hbd) ?
                                  wire11 : wire13)) : (&$signed(wire14))) ?
                      $unsigned((~&reg78)) : {$unsigned(wire55[(5'h14):(4'h8)])}) ?
                  wire19[(3'h5):(2'h2)] : {wire13[(4'h8):(4'h8)],
                      $unsigned((~^wire12[(1'h1):(1'h1)]))});
              reg79 <= wire12[(2'h3):(1'h1)];
              reg80 <= {{reg77[(1'h1):(1'h1)]},
                  $unsigned(((wire15[(4'h8):(3'h5)] ~^ (+wire49)) ?
                      $signed($unsigned(wire54)) : (reg78[(4'h8):(1'h0)] ?
                          reg78[(3'h6):(3'h4)] : (wire12 == wire55))))};
              reg81 <= ($signed((wire13[(4'hc):(1'h0)] ?
                      (|(!(8'hb6))) : $unsigned((wire19 ? (7'h43) : wire16)))) ?
                  $unsigned(($unsigned((wire54 >> wire14)) | wire18[(3'h5):(1'h0)])) : wire54[(3'h4):(1'h1)]);
            end
          reg82 <= (^(^~reg81[(3'h6):(3'h6)]));
          if ((&wire17[(4'ha):(3'h7)]))
            begin
              reg83 <= wire11[(2'h2):(1'h1)];
            end
          else
            begin
              reg83 <= $unsigned((reg77 ?
                  (&$unsigned((wire55 ?
                      wire53 : wire49))) : $unsigned($signed((&wire49)))));
              reg84 <= $unsigned($unsigned(($unsigned((reg80 + wire49)) ?
                  wire17 : (!$unsigned(wire19)))));
              reg85 <= (wire53 ?
                  reg77[(3'h5):(3'h5)] : {wire54[(2'h3):(2'h2)]});
              reg86 <= {wire52};
            end
        end
      else
        begin
          reg78 <= ($unsigned($signed({wire19})) ?
              $signed($unsigned(wire13)) : $signed($signed(wire74)));
          if ($unsigned(reg86))
            begin
              reg79 <= (-(($unsigned({wire12,
                  reg76}) <= $unsigned($signed(reg83))) ~^ ($unsigned($signed(reg77)) ?
                  $signed(reg86) : {(wire12 & wire51), {wire19, wire51}})));
              reg80 <= $signed((((8'hb3) ?
                  $unsigned($signed(reg78)) : (reg80 ?
                      $signed(reg76) : (reg79 - reg85))) >= reg85));
              reg81 <= ((((wire51 ?
                  reg81 : $unsigned(wire19)) * wire74) ^ (wire74 <= (~^(wire49 ?
                  reg78 : wire14)))) >>> (~&wire16));
              reg82 <= $signed($signed({$signed(wire72)}));
            end
          else
            begin
              reg79 <= wire55[(4'hd):(2'h2)];
              reg80 <= (((-$unsigned($unsigned(wire55))) ?
                      $signed(reg77) : ($unsigned($unsigned(reg86)) ?
                          (reg78 | (~|reg77)) : $unsigned((!(7'h42))))) ?
                  ({(wire55 & (wire14 <<< reg79))} ~^ wire54) : $signed(((wire17 ?
                          $unsigned(reg85) : (^wire19)) ?
                      (wire13 ?
                          $unsigned(wire16) : $unsigned((7'h42))) : $signed(((8'ha9) ^~ wire12)))));
              reg81 <= reg76;
              reg82 <= $unsigned(reg79);
            end
          reg83 <= $unsigned($signed((+$unsigned((&wire19)))));
          reg84 <= ((~wire15[(3'h7):(3'h7)]) + wire19[(1'h1):(1'h0)]);
        end
      if (reg85)
        begin
          reg87 <= $unsigned(wire11[(4'hb):(1'h0)]);
          if (wire53[(2'h3):(1'h1)])
            begin
              reg88 <= ($unsigned(wire14) || (&($unsigned((wire75 ~^ wire72)) ?
                  wire13 : wire49[(1'h1):(1'h0)])));
              reg89 <= (8'ha0);
            end
          else
            begin
              reg88 <= reg80[(1'h1):(1'h0)];
            end
          reg90 <= $unsigned(wire74[(1'h1):(1'h1)]);
          if (wire75)
            begin
              reg91 <= (!(wire55 ?
                  $unsigned(reg87[(1'h1):(1'h0)]) : reg84[(2'h3):(2'h2)]));
              reg92 <= (reg82[(1'h0):(1'h0)] ? reg80 : reg88);
            end
          else
            begin
              reg91 <= (!$unsigned($signed(((+(8'hb9)) ?
                  $unsigned(wire19) : reg76))));
              reg92 <= reg84;
              reg93 <= reg81;
              reg94 <= wire72;
              reg95 <= (~(!$unsigned((~^{wire19, reg76}))));
            end
          reg96 <= ((wire16[(3'h4):(1'h1)] >= wire52[(4'hd):(3'h4)]) + (&$unsigned((~|(reg86 >> reg92)))));
        end
      else
        begin
          reg87 <= ($signed($signed(((wire19 < (8'haf)) ?
                  (reg80 ? reg94 : reg82) : reg86[(1'h1):(1'h0)]))) ?
              $signed(wire74[(3'h6):(2'h2)]) : (reg91 ?
                  (-reg89[(3'h4):(1'h1)]) : (wire18 <= (+(&(7'h44))))));
          reg88 <= $unsigned(((($unsigned((8'ha1)) ?
              $signed(reg79) : (!wire16)) ^~ ((wire11 < reg89) ?
              (~^reg88) : (reg87 ? reg76 : reg92))) ~^ reg81));
          reg89 <= reg90;
        end
    end
  assign wire97 = wire15[(1'h0):(1'h0)];
endmodule

module module56  (y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire60;
  input wire [(4'h8):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  input wire signed [(5'h12):(1'h0)] wire57;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg61 <= (wire59 ?
          (($unsigned($signed(wire59)) ?
              wire57[(3'h4):(2'h3)] : $unsigned(wire60[(1'h0):(1'h0)])) * ({(wire60 ^~ wire57)} ?
              {(wire59 <<< wire57),
                  $signed(wire59)} : wire60[(2'h2):(1'h1)])) : wire58[(3'h6):(3'h4)]);
      if (((+$unsigned(((wire57 >> (8'ha6)) ?
              {wire57} : (wire58 ? (8'hb3) : wire59)))) ?
          $unsigned(({{wire60}, wire60[(1'h1):(1'h1)]} ?
              $unsigned((wire59 ? wire60 : wire60)) : (7'h44))) : {(8'hb6),
              $unsigned(({wire60} ? $signed(wire59) : reg61))}))
        begin
          reg62 <= (7'h43);
          reg63 <= ({(((+wire60) ~^ $unsigned(reg61)) ?
                      $unsigned(((8'hb6) >> (8'ha1))) : (reg61 ?
                          (8'hb2) : reg62[(4'hb):(3'h7)])),
                  wire60} ?
              wire57[(4'hd):(4'hb)] : reg61);
          if ({$signed(wire57[(3'h7):(3'h6)]), reg62[(4'h8):(4'h8)]})
            begin
              reg64 <= wire60;
              reg65 <= (^((wire60 ?
                      ((&wire59) ? reg61[(1'h1):(1'h0)] : (8'hbd)) : (7'h44)) ?
                  (wire58 <= ($unsigned(reg64) ?
                      (reg64 ?
                          reg61 : wire58) : ((8'ha3) > (8'ha0)))) : (^~$signed((!reg61)))));
            end
          else
            begin
              reg64 <= (&($signed(reg64) > wire57[(5'h11):(4'he)]));
              reg65 <= $unsigned(wire59);
            end
        end
      else
        begin
          reg62 <= $unsigned($unsigned((8'hb2)));
          reg63 <= wire58[(3'h6):(2'h3)];
          reg64 <= ($signed(wire59) ?
              (!($signed($signed(reg65)) ?
                  $signed((wire57 ?
                      wire60 : wire58)) : reg61[(3'h5):(3'h5)])) : wire59);
          reg65 <= wire59;
        end
      reg66 <= (($unsigned($unsigned((|reg62))) ?
              $unsigned($signed($signed(reg61))) : $signed(reg64[(4'hf):(4'h8)])) ?
          $unsigned(($signed((~(8'hac))) ^~ ($unsigned(wire57) ?
              wire57 : reg63))) : $signed($unsigned((~|(wire59 >>> wire59)))));
      reg67 <= (((|wire57[(1'h0):(1'h0)]) >= $unsigned((~((8'ha9) * reg64)))) ?
          $signed(((&$signed(reg66)) ?
              $unsigned((8'hba)) : $signed(((8'ha2) + (8'hb8))))) : reg62);
      reg68 <= (^~reg62[(4'hb):(1'h1)]);
    end
  assign wire69 = (^wire60);
  assign wire70 = $signed($signed(($signed((wire57 ?
                      wire59 : reg62)) << $unsigned($unsigned(reg67)))));
  assign wire71 = (+$signed($unsigned((&$unsigned(reg64)))));
endmodule

module module20
#(parameter param48 = ((({((8'hb3) ? (8'hb3) : (8'hb2))} ~^ (|((8'hbf) < (8'hbc)))) ? (8'hbd) : ((^(+(8'h9f))) ? {((8'ha5) ? (8'hb9) : (8'ha9)), (~|(8'hb4))} : (((8'h9d) ? (8'hba) : (7'h42)) ? ((8'hac) ? (8'haa) : (8'hb1)) : {(8'h9d)}))) < ({{{(8'hbd)}}} ? ({((8'hb3) ? (8'hb1) : (8'ha6))} != (8'hb3)) : (((^(8'hb6)) >> {(7'h43)}) ? ({(8'hae)} - (8'hbe)) : (~|(~|(8'h9d)))))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h12a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire24;
  input wire [(5'h13):(1'h0)] wire23;
  input wire signed [(4'h9):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  assign y = {wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 reg47,
                 reg46,
                 reg45,
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
                 (1'h0)};
  assign wire25 = (^(((!wire23) ?
                          wire23[(5'h12):(3'h5)] : $signed($signed(wire22))) ?
                      (wire24 ?
                          $signed((|wire23)) : $signed(wire21)) : {($unsigned(wire22) || $signed(wire21)),
                          wire24[(4'he):(2'h2)]}));
  assign wire26 = $unsigned((~^($signed(wire25[(1'h1):(1'h1)]) || ({(8'h9d)} ?
                      $signed(wire21) : wire21[(5'h11):(4'ha)]))));
  assign wire27 = $unsigned($unsigned({$unsigned($unsigned(wire26)), wire24}));
  assign wire28 = $unsigned(($unsigned($signed((wire21 << wire27))) & {wire27[(3'h4):(2'h3)]}));
  assign wire29 = ($signed(wire25[(3'h7):(1'h1)]) != {({$unsigned((8'hb3)),
                          (wire28 ? wire21 : wire24)} >= (^~$signed(wire23)))});
  assign wire30 = $signed(($unsigned($signed($signed(wire23))) <<< $unsigned({wire27})));
  always
    @(posedge clk) begin
      if (($signed(wire27[(1'h0):(1'h0)]) ?
          wire28[(3'h5):(2'h2)] : $unsigned(wire25[(4'ha):(3'h4)])))
        begin
          reg31 <= $unsigned((($unsigned(wire22[(3'h4):(2'h3)]) << ((wire25 ~^ wire22) ?
                  $unsigned(wire30) : (wire22 ? wire28 : wire27))) ?
              ((-$unsigned(wire22)) ?
                  ($unsigned(wire30) ?
                      (8'ha9) : wire30) : (wire27[(1'h0):(1'h0)] ?
                      {wire26} : {wire23,
                          wire27})) : ($signed((wire25 < wire28)) ~^ $unsigned((!(8'h9c))))));
          if ((!($signed($unsigned($signed(wire30))) ?
              wire23 : {wire22, $signed($signed((8'hb4)))})))
            begin
              reg32 <= reg31;
              reg33 <= ((wire21[(4'he):(4'h9)] ?
                      (^{(~(8'hb8)), wire22}) : wire27[(1'h1):(1'h1)]) ?
                  wire22[(3'h4):(2'h3)] : $unsigned(reg31));
            end
          else
            begin
              reg32 <= ((^~((wire23[(4'hd):(1'h0)] ?
                  wire24 : $signed(wire21)) <= ((wire28 ~^ wire30) ?
                  (wire23 ~^ wire22) : $unsigned(wire23)))) >> wire27[(1'h0):(1'h0)]);
              reg33 <= wire22;
              reg34 <= ($signed((^wire29[(1'h1):(1'h0)])) | $unsigned((^~$signed(wire26[(4'h8):(3'h6)]))));
            end
          reg35 <= {reg32[(1'h1):(1'h1)]};
          reg36 <= ($signed($unsigned($signed((wire30 >= wire23)))) * wire23[(3'h6):(2'h3)]);
        end
      else
        begin
          if (reg34[(2'h3):(2'h2)])
            begin
              reg31 <= wire22;
            end
          else
            begin
              reg31 <= $unsigned($signed((&$unsigned($signed((8'hb9))))));
              reg32 <= (!((-{{wire29, wire24}}) ?
                  $signed(reg36[(5'h10):(4'he)]) : (wire22 ?
                      $signed(reg33) : wire27[(1'h1):(1'h0)])));
              reg33 <= wire26[(4'hc):(3'h4)];
              reg34 <= wire26;
            end
          reg35 <= wire29[(2'h2):(2'h2)];
          reg36 <= $signed((reg35 << (($unsigned(wire24) >>> $unsigned(wire30)) > wire26[(4'h8):(2'h3)])));
          if ({reg36[(4'hb):(3'h4)], $unsigned(wire26)})
            begin
              reg37 <= (^(reg32[(5'h14):(2'h2)] ?
                  $signed((|(~reg33))) : wire22[(3'h7):(3'h4)]));
              reg38 <= ($unsigned(reg31) ?
                  $unsigned(($signed((~&wire23)) ?
                      wire26 : {(reg35 ? wire29 : (7'h40)),
                          ((8'haa) ?
                              wire26 : wire22)})) : ((-(~^wire25)) & {(^~{wire22}),
                      ((wire30 ? (8'hb9) : wire24) ?
                          reg34[(4'hb):(3'h5)] : $signed((7'h44)))}));
            end
          else
            begin
              reg37 <= ((wire29[(2'h3):(2'h2)] ?
                      $unsigned(reg35) : $unsigned(wire24)) ?
                  (-((~^wire28) ?
                      $unsigned({reg33, (8'hba)}) : ((wire29 < reg36) ?
                          $unsigned((8'h9d)) : (&reg32)))) : $signed($unsigned(reg31)));
            end
        end
      if (wire25[(1'h1):(1'h0)])
        begin
          reg39 <= (~&reg33);
        end
      else
        begin
          reg39 <= ($signed(($signed($unsigned(wire24)) ?
              (7'h41) : $unsigned(wire26))) ^ ((^$signed((&(8'had)))) << {reg31,
              (reg32[(4'ha):(3'h6)] < (wire22 ? wire28 : wire21))}));
          reg40 <= (~^reg34[(4'ha):(2'h3)]);
          reg41 <= wire26;
          reg42 <= ($unsigned(($signed((reg37 > wire22)) ~^ ($signed(wire26) != ((8'had) || wire23)))) >>> $signed((({wire28} ?
              {wire28} : (wire29 > (8'ha0))) & reg38[(1'h1):(1'h0)])));
          if (($unsigned(({$signed(reg41), {wire28, reg36}} ?
              (8'hb2) : ($unsigned(reg34) ?
                  reg37 : $unsigned(wire22)))) == (7'h41)))
            begin
              reg43 <= ((($signed(reg31) ?
                      $signed(reg36) : ($signed(wire27) && (wire24 ^ wire22))) ?
                  ((7'h44) & {(reg41 & reg34),
                      $unsigned(reg39)}) : {reg37[(1'h0):(1'h0)]}) >> wire29[(3'h4):(2'h2)]);
              reg44 <= $signed(wire28[(4'he):(3'h7)]);
              reg45 <= (8'hae);
              reg46 <= (|$signed(wire25));
              reg47 <= wire27;
            end
          else
            begin
              reg43 <= $unsigned($unsigned($unsigned(((~|reg34) >> $unsigned(reg37)))));
              reg44 <= ({(reg46 ? (~$signed(wire26)) : (~|$unsigned(wire30))),
                      reg33[(3'h5):(1'h1)]} ?
                  reg37 : (wire29 ?
                      $unsigned((-wire23)) : reg32[(4'he):(4'ha)]));
              reg45 <= wire24[(3'h7):(1'h0)];
              reg46 <= $signed((~$signed(wire27[(3'h4):(2'h3)])));
            end
        end
    end
endmodule
