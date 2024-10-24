module top
#(parameter param122 = (&{(^~(~&{(8'hbe), (8'hb9)}))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire120;
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'hc):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire13,
                 wire20,
                 wire21,
                 wire22,
                 wire24,
                 wire25,
                 wire120,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((~&wire3[(2'h2):(2'h2)]) ? (7'h40) : wire1[(4'h9):(1'h0)]))
        begin
          reg4 <= (|wire3[(2'h2):(1'h1)]);
          reg5 <= wire2;
        end
      else
        begin
          if ($unsigned(reg5))
            begin
              reg4 <= (+wire0);
              reg5 <= wire0[(4'hf):(4'h8)];
              reg6 <= {$signed($signed(((reg5 ? (8'hbe) : reg4) ?
                      (8'ha5) : wire0[(2'h3):(2'h3)]))),
                  (^(~|wire3))};
              reg7 <= $unsigned($unsigned($unsigned($signed(wire2))));
            end
          else
            begin
              reg4 <= (((8'hbf) ?
                  ((wire1[(3'h4):(1'h1)] ?
                      $unsigned(wire3) : (reg6 ? reg4 : reg5)) >> (-(reg7 ?
                      reg4 : wire2))) : $signed(($unsigned(wire2) ?
                      reg5[(3'h7):(2'h2)] : wire0[(3'h7):(2'h3)]))) | $signed(wire0[(1'h1):(1'h1)]));
              reg5 <= ((((~(wire1 ? wire0 : reg6)) > {(reg5 ? wire0 : reg7),
                          (wire1 ? reg6 : reg4)}) ?
                      (~&((7'h41) <= reg7[(2'h3):(2'h3)])) : ($signed(wire0) ?
                          (&wire3) : {(wire3 <= wire0)})) ?
                  ($signed($unsigned({reg4})) ?
                      (~^(reg4[(4'hb):(2'h2)] ^~ {reg5})) : ($signed((|wire0)) & (+$signed(reg6)))) : $unsigned((&$signed((reg5 ~^ reg6)))));
              reg6 <= $signed((-reg5[(2'h3):(2'h3)]));
            end
          reg8 <= (((($unsigned(wire2) ? $unsigned(wire0) : (~wire0)) ?
              (~^wire1) : $unsigned((reg5 ^ reg7))) && ({wire0,
                  (wire0 ? reg5 : reg7)} ?
              $unsigned($signed(wire2)) : wire1)) ^ (~^{$unsigned((reg4 ?
                  wire1 : reg7)),
              $unsigned(reg7[(1'h0):(1'h0)])}));
          reg9 <= $unsigned(wire3);
          reg10 <= wire1;
        end
      reg11 <= (~&$unsigned((($signed(wire0) - (~reg6)) < $unsigned(reg4))));
      reg12 <= $unsigned(($signed($unsigned((~|(8'hbd)))) < wire1));
    end
  assign wire13 = $signed({($unsigned((reg5 - wire1)) ?
                          $signed($unsigned(reg10)) : reg11),
                      {$unsigned(((8'hae) || reg10))}});
  always
    @(posedge clk) begin
      reg14 <= {(reg6[(3'h7):(3'h5)] ?
              $signed(wire3) : {$unsigned((reg9 >>> wire1))})};
    end
  always
    @(posedge clk) begin
      reg15 <= reg7;
      if (wire2[(5'h12):(5'h10)])
        begin
          reg16 <= (reg11[(4'hd):(3'h5)] ?
              $signed($unsigned(wire3[(1'h1):(1'h0)])) : reg8);
          reg17 <= wire13[(3'h4):(1'h1)];
          reg18 <= $signed(reg10[(2'h3):(1'h1)]);
        end
      else
        begin
          reg16 <= reg9;
        end
      reg19 <= (~|((reg18 ? wire2 : {(reg4 ? reg10 : wire1)}) ?
          $unsigned(reg11[(3'h4):(2'h2)]) : reg15));
    end
  assign wire20 = {{wire13[(3'h6):(2'h3)]}};
  assign wire21 = $unsigned((|reg4));
  assign wire22 = $unsigned((((7'h43) ?
                      $unsigned(((8'ha7) ? reg8 : reg11)) : (((7'h41) + wire3) ?
                          {reg16, reg14} : {reg5})) * (reg14 ?
                      $signed(reg17[(3'h4):(1'h1)]) : ($unsigned(reg17) - $signed(reg5)))));
  always
    @(posedge clk) begin
      reg23 <= {(~^(reg17[(3'h4):(1'h0)] ?
              ($signed(reg11) ?
                  ((8'ha0) * reg14) : $signed(wire1)) : wire3[(2'h3):(2'h2)]))};
    end
  assign wire24 = reg10;
  assign wire25 = $signed(reg19[(3'h4):(2'h2)]);
  module26 #() modinst121 (.wire28(reg12), .y(wire120), .clk(clk), .wire27(wire2), .wire30(reg23), .wire29(reg8));
endmodule

module module26
#(parameter param118 = ((&((~&(^(8'hba))) ? (!(&(8'ha9))) : (((8'hab) ^~ (8'ha0)) ? {(8'ha9)} : (-(8'hb3))))) ? (((^(~^(8'hbf))) + (~|(^(8'h9e)))) ? {((~^(8'ha5)) >> (8'hbe))} : ((((8'ha7) << (8'h9d)) ? ((8'hb8) ? (8'hae) : (7'h40)) : ((8'hbb) * (7'h40))) ? (((8'ha5) ? (8'hb1) : (8'ha3)) ? {(8'ha7), (8'ha8)} : ((8'ha0) && (8'haf))) : {(!(8'ha9))})) : (((~|((8'hab) ? (8'hbc) : (8'ha3))) ? ((!(8'ha8)) | {(8'ha9), (8'hac)}) : ({(8'haa), (8'hb1)} ? ((8'h9e) << (8'hb9)) : (-(8'hb6)))) >= (~&{((7'h40) ? (8'ha3) : (7'h41))}))), 
parameter param119 = (param118 ? ((^param118) ? (^{param118}) : param118) : ((param118 <= (+{param118, param118})) ~^ param118)))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire30;
  input wire signed [(4'h9):(1'h0)] wire29;
  input wire [(5'h15):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire117;
  wire signed [(5'h15):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire111;
  wire signed [(3'h7):(1'h0)] wire110;
  wire signed [(3'h6):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire54;
  reg [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire54,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  module31 #() modinst55 (.wire32((8'hb3)), .wire36(wire30), .wire34(wire29), .wire33(wire28), .clk(clk), .y(wire54), .wire35(wire27));
  module56 #() modinst108 (wire107, clk, wire54, wire27, wire29, wire28);
  assign wire109 = (|{$signed((^~$unsigned((8'hb5))))});
  assign wire110 = wire54;
  assign wire111 = wire54[(5'h14):(1'h1)];
  always
    @(posedge clk) begin
      if ((({(8'h9c), $unsigned($signed(wire28))} << {$unsigned({wire28,
              wire107}),
          $signed((wire30 * (8'hbf)))}) + $signed((wire107 & {$signed(wire28)}))))
        begin
          reg112 <= (($unsigned(($signed(wire30) ?
                      wire110[(1'h0):(1'h0)] : wire107)) ?
                  $signed({wire110[(3'h7):(3'h7)]}) : wire29) ?
              wire110 : (({((8'hbf) & wire29), $unsigned(wire111)} + (wire107 ?
                  (~|wire111) : $signed(wire54))) >> $signed(wire30)));
        end
      else
        begin
          reg112 <= wire29[(2'h3):(1'h1)];
          reg113 <= (&$signed($unsigned($unsigned({(8'hbf)}))));
          reg114 <= $signed(({$signed((&wire27))} && ($unsigned($unsigned(reg112)) ?
              ($signed(wire54) ? reg113 : wire28) : wire30[(1'h1):(1'h0)])));
        end
    end
  assign wire115 = ((~|({wire54} ?
                           (~^$unsigned(wire29)) : (-$unsigned(wire110)))) ?
                       ($signed(wire111) ?
                           $signed($signed((&wire111))) : wire54) : $signed(wire107));
  assign wire116 = wire30[(4'h8):(2'h3)];
  assign wire117 = wire111[(1'h0):(1'h0)];
endmodule

module module56
#(parameter param105 = ((~&{(((8'hbc) << (8'h9e)) << ((8'h9c) ? (7'h40) : (8'hb5))), (((8'hbb) & (8'had)) * {(8'h9d), (8'ha3)})}) <<< {((~|((7'h40) ~^ (8'hbb))) - (&(&(8'hb4)))), ((((8'hb9) + (8'hb0)) ~^ ((8'haa) ? (8'ha2) : (8'ha2))) ? {((8'ha2) ? (8'hbb) : (8'hb6))} : (((8'ha2) ~^ (8'hbc)) ? ((8'ha8) && (8'h9c)) : (~|(7'h43))))}), 
parameter param106 = ((({(^~(8'hbb))} >> {((8'hbe) < param105)}) ? param105 : ({(-param105)} > (^param105))) >= {({(~|param105), {param105, param105}} ? (+(param105 ? (8'hba) : param105)) : param105)}))
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h252):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire60;
  input wire signed [(3'h5):(1'h0)] wire59;
  input wire signed [(2'h3):(1'h0)] wire58;
  input wire [(3'h4):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire103;
  wire [(5'h14):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  wire [(5'h11):(1'h0)] wire98;
  wire signed [(5'h15):(1'h0)] wire97;
  wire signed [(4'he):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire signed [(3'h5):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire91;
  wire [(4'h8):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire [(4'hb):(1'h0)] wire61;
  reg signed [(5'h13):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire75,
                 wire74,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 reg99,
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
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 (1'h0)};
  assign wire61 = (8'ha6);
  assign wire62 = wire61[(4'ha):(3'h5)];
  assign wire63 = $signed(($unsigned(wire61) ?
                      $unsigned(wire57[(2'h3):(2'h2)]) : $signed((wire58 - (~(8'hbd))))));
  assign wire64 = (-((~&(&(8'hac))) ? $unsigned(wire57) : wire60));
  always
    @(posedge clk) begin
      if (wire62)
        begin
          reg65 <= wire63[(5'h12):(3'h4)];
        end
      else
        begin
          reg65 <= wire61[(3'h6):(3'h6)];
          reg66 <= wire59;
          reg67 <= wire61;
          reg68 <= $unsigned(wire61);
        end
      reg69 <= ({((+wire60) >>> {$signed(reg66), $signed(wire64)}),
              $unsigned(wire61)} ?
          (wire60 - (~((wire61 ? reg65 : wire64) ?
              (!reg66) : $unsigned(reg68)))) : $unsigned($signed($signed($signed((8'hb2))))));
      reg70 <= (8'hbb);
      reg71 <= $signed(wire57[(2'h2):(1'h1)]);
      if ((^$signed({$signed(reg67)})))
        begin
          if ($signed($unsigned((reg69 >>> $signed(((8'ha5) | wire64))))))
            begin
              reg72 <= ($unsigned(wire63[(5'h13):(4'he)]) ?
                  wire62[(3'h4):(2'h3)] : reg70[(4'hc):(3'h6)]);
            end
          else
            begin
              reg72 <= (reg65 ?
                  reg67[(4'hb):(4'h8)] : ({$signed((wire57 ?
                          (8'ha3) : reg72))} >>> (reg67 ?
                      (((8'hbe) ?
                          reg65 : reg72) && reg68[(3'h7):(2'h2)]) : (wire60 ?
                          $unsigned(wire58) : (^~wire60)))));
            end
          reg73 <= $unsigned($unsigned((((wire62 >= reg69) ?
              (~&(8'hac)) : ((8'ha0) & reg66)) & (^$unsigned(reg69)))));
        end
      else
        begin
          reg72 <= (~$signed(reg73[(4'ha):(3'h7)]));
          reg73 <= wire57[(1'h0):(1'h0)];
        end
    end
  assign wire74 = reg72[(1'h0):(1'h0)];
  assign wire75 = (^~wire64);
  always
    @(posedge clk) begin
      reg76 <= wire60;
      reg77 <= wire60;
      reg78 <= $unsigned($signed(($signed(reg77[(5'h13):(3'h7)]) || {reg72,
          reg70[(3'h5):(1'h1)]})));
      if (((-(((~^wire61) ? $unsigned(reg71) : {(8'h9e), reg67}) ?
          wire58 : ($signed(wire60) >= {reg72}))) ^~ $signed({wire75})))
        begin
          reg79 <= ((7'h42) ?
              reg69[(3'h5):(3'h5)] : {(wire59 >> ($signed(wire57) ?
                      wire63[(4'hc):(4'hc)] : reg73))});
          if ((^((^(8'hb1)) ?
              reg68 : ($signed((reg70 ? reg68 : wire61)) >> ((+reg65) ?
                  (reg66 < reg70) : wire63)))))
            begin
              reg80 <= (reg66 ?
                  wire74[(1'h1):(1'h0)] : (-(wire62 ?
                      reg71 : wire61[(4'h8):(4'h8)])));
              reg81 <= (((~|{wire62[(1'h0):(1'h0)],
                      ((8'hb0) ?
                          wire63 : wire74)}) <= $signed(($unsigned(wire64) || (reg79 << reg80)))) ?
                  ((&({wire75, wire59} ?
                      wire63[(4'hf):(4'h8)] : reg67[(3'h6):(2'h2)])) * $signed(wire64[(3'h6):(1'h1)])) : (reg73[(2'h2):(2'h2)] ?
                      reg77 : ($unsigned({(8'hbb)}) != {((7'h42) ?
                              reg80 : reg68)})));
              reg82 <= ($signed(reg67) > $signed((-$unsigned({wire64,
                  wire75}))));
            end
          else
            begin
              reg80 <= $unsigned((^reg80[(4'h9):(3'h5)]));
            end
          if ((^~(((+(reg73 ? reg72 : reg82)) * wire61) ?
              (^~wire62[(1'h0):(1'h0)]) : wire64)))
            begin
              reg83 <= reg80[(4'h9):(3'h4)];
            end
          else
            begin
              reg83 <= {reg72};
              reg84 <= reg65[(3'h6):(3'h4)];
              reg85 <= (((^$unsigned($signed(reg84))) ?
                      {$signed((~&wire74))} : ($signed((reg65 ?
                              reg78 : reg65)) ?
                          {(reg83 + reg79),
                              (wire62 ^ (8'haf))} : $unsigned((+wire74)))) ?
                  {$unsigned(((wire61 >> (8'ha7)) ?
                          (wire63 ? reg76 : reg73) : $signed(wire61))),
                      ($unsigned(((8'h9d) ? wire61 : wire57)) ?
                          reg65 : (^(~&wire61)))} : ({$signed(wire57[(3'h4):(1'h0)])} ?
                      (reg65[(3'h6):(1'h1)] != reg80) : $signed((&$signed(reg81)))));
              reg86 <= (~^$unsigned($unsigned(reg82[(4'h9):(2'h3)])));
            end
          reg87 <= (-reg84[(2'h3):(1'h0)]);
        end
      else
        begin
          if (((^~$unsigned(($signed(reg76) <<< (^(8'had))))) ?
              $signed($unsigned({(wire63 ? reg80 : reg84)})) : (8'ha4)))
            begin
              reg79 <= reg72;
              reg80 <= reg86;
              reg81 <= ({$signed(wire63)} > (8'hb2));
            end
          else
            begin
              reg79 <= ((-($unsigned($unsigned(reg65)) | {$unsigned(wire60),
                  $unsigned(wire75)})) ^~ (~^wire59[(1'h1):(1'h1)]));
              reg80 <= (-(reg72 ?
                  wire64[(3'h5):(1'h1)] : ((8'hbd) ?
                      reg76[(1'h0):(1'h0)] : reg77)));
            end
          reg82 <= ((8'hb9) & ($signed((!$unsigned(reg80))) ?
              reg68 : {$unsigned((8'hb1))}));
          reg83 <= $unsigned(((~|((^(8'hb2)) ?
              (reg67 ?
                  reg66 : wire62) : reg73[(3'h6):(3'h4)])) >= $unsigned((reg67[(4'hb):(4'h8)] ?
              $unsigned(wire61) : $unsigned((8'hac))))));
          reg84 <= reg78[(2'h2):(1'h1)];
          if ((wire61 ?
              reg72[(3'h7):(3'h6)] : ($unsigned({reg76}) ?
                  $unsigned($unsigned((~^reg66))) : reg84[(2'h3):(2'h2)])))
            begin
              reg85 <= $signed((^~($unsigned((reg80 ~^ reg76)) ?
                  wire57[(1'h0):(1'h0)] : $signed((wire63 ? reg83 : reg70)))));
              reg86 <= ($unsigned(({(reg73 ? reg84 : reg85)} ?
                  reg84[(3'h5):(1'h0)] : (((8'haa) >> reg76) ?
                      (reg83 + reg72) : (|reg79)))) | reg73[(1'h0):(1'h0)]);
              reg87 <= $signed(wire61);
              reg88 <= (8'h9c);
            end
          else
            begin
              reg85 <= $unsigned({$signed((~&(reg69 ? (8'hb2) : reg68))),
                  ($signed((reg78 ? wire63 : (8'ha2))) ?
                      reg84[(2'h3):(2'h3)] : ($signed(reg66) <= $signed(reg70)))});
              reg86 <= ((reg76[(1'h0):(1'h0)] ?
                      ((!$signed(reg83)) ?
                          (^~$signed(wire74)) : reg69[(2'h2):(2'h2)]) : reg81[(5'h13):(4'h9)]) ?
                  $signed($unsigned((wire59[(2'h3):(1'h1)] ?
                      reg73[(4'hb):(1'h0)] : $unsigned(reg78)))) : $unsigned((8'hb6)));
              reg87 <= wire62;
            end
        end
      if (({$signed(reg86[(4'hb):(4'ha)])} | (^~$signed($unsigned((wire64 != wire58))))))
        begin
          reg89 <= wire57[(2'h2):(1'h0)];
          reg90 <= ($signed((({wire57, reg83} ?
                      (wire61 >>> (8'ha3)) : $unsigned((8'ha4))) ?
                  reg79[(5'h10):(1'h1)] : wire61)) ?
              reg84 : (^~($unsigned({reg89, wire59}) + ((reg65 ?
                  (8'hb9) : (8'ha2)) ~^ (reg81 ? reg88 : reg76)))));
        end
      else
        begin
          reg89 <= (((~|((^reg84) ?
                      $unsigned(reg89) : (wire74 ? reg87 : reg76))) ?
                  ((wire61 ?
                      $unsigned(wire58) : wire62) && $unsigned((!(8'ha3)))) : $unsigned($unsigned({reg76,
                      (8'h9d)}))) ?
              $unsigned(((reg81 * (wire57 ?
                  (8'ha4) : reg81)) + (+reg76))) : ({wire57[(2'h3):(1'h0)],
                  (8'haf)} || $signed(((-wire58) ?
                  (wire75 != reg65) : (reg81 | wire61)))));
          reg90 <= reg67;
        end
    end
  assign wire91 = $unsigned((&((wire58 ?
                      wire59[(3'h5):(3'h4)] : (reg65 ?
                          wire58 : reg90)) >= ((reg87 & (7'h41)) ^~ ((8'hac) ?
                      reg65 : reg71)))));
  assign wire92 = (~&reg71[(1'h1):(1'h0)]);
  assign wire93 = $signed(($signed($unsigned($signed(reg78))) ?
                      reg82 : (wire64[(1'h0):(1'h0)] * ($signed(reg89) < (&(8'ha1))))));
  assign wire94 = $signed(((&(wire93[(1'h0):(1'h0)] ? (-wire59) : (~reg77))) ?
                      $signed(reg81) : $signed(reg73)));
  assign wire95 = ((reg72 <= (((+reg70) ?
                          reg80[(4'h8):(1'h0)] : $signed(reg71)) ?
                      ((wire58 ? reg68 : reg69) ?
                          (~|(8'hac)) : reg81) : (+(^~reg76)))) - (wire60 - (~((reg65 >> reg69) ?
                      (~|wire63) : $signed((8'hba))))));
  assign wire96 = ($signed((reg69 != (reg70 ^ reg84[(2'h3):(1'h0)]))) || ($signed((~|(reg79 - wire58))) ?
                      reg87 : $unsigned(($unsigned((8'ha6)) ?
                          $signed(wire59) : {wire63}))));
  assign wire97 = ({{$signed($unsigned((7'h44)))}} ?
                      ({reg80[(1'h0):(1'h0)]} ?
                          {wire91[(1'h0):(1'h0)]} : $unsigned((reg76[(3'h5):(2'h2)] >> $signed(reg88)))) : ((~&reg88[(1'h1):(1'h0)]) ?
                          $unsigned((~^{reg85,
                              wire74})) : ((~wire58[(1'h0):(1'h0)]) >= (~^(wire91 ^~ reg70)))));
  assign wire98 = $signed((&($unsigned($signed((8'ha5))) < (~&wire57[(2'h3):(2'h2)]))));
  always
    @(posedge clk) begin
      reg99 <= ($signed(((~^(wire93 <= reg70)) || wire74)) <= ({((~&reg72) && (~|wire58)),
              (~|$unsigned((8'ha2)))} ?
          reg69[(3'h5):(3'h5)] : {{{wire62, reg86}, reg67[(3'h6):(2'h3)]}}));
    end
  assign wire100 = ((!(reg81[(5'h14):(4'h8)] && wire97)) ?
                       ((reg80 ? reg73[(4'ha):(3'h7)] : $unsigned(reg82)) ?
                           ($signed((8'hb9)) ?
                               wire58[(1'h1):(1'h0)] : (8'hb2)) : (({reg71} ~^ $signed(wire98)) & ({reg68,
                                   wire59} ?
                               wire95 : wire75))) : wire93);
  assign wire101 = reg85[(2'h2):(1'h1)];
  assign wire102 = {($signed(reg99) ?
                           (&($unsigned(wire64) ?
                               wire101[(4'he):(4'h9)] : (wire74 ?
                                   reg79 : wire57))) : wire101),
                       $signed(reg68)};
  assign wire103 = ((((wire57 ?
                           {wire57,
                               wire94} : reg83[(2'h2):(1'h0)]) | $signed((reg83 ?
                           (8'ha0) : reg89))) ?
                       $unsigned({(&wire94)}) : (wire96[(3'h6):(3'h6)] ?
                           (+(reg67 ? wire101 : (8'haf))) : ($signed(reg90) ?
                               wire57 : reg66))) | reg77);
  assign wire104 = $unsigned($signed(($unsigned($signed(reg86)) && reg67)));
endmodule

module module31
#(parameter param52 = ((({{(8'ha9), (8'ha1)}} ? (8'hab) : ((~^(7'h44)) <<< ((8'haa) > (7'h43)))) ? (!(~^((8'hb6) ? (8'hba) : (8'ha8)))) : ((|((8'ha9) * (7'h40))) ? ((~^(8'ha7)) <= ((8'ha4) | (8'h9c))) : (((8'ha6) & (8'hb7)) ? ((8'hbc) ? (7'h40) : (8'hb5)) : ((8'hb5) ? (8'ha4) : (8'haf))))) >>> ((^((~^(8'ha7)) < ((8'ha0) ? (8'had) : (7'h44)))) ? (({(8'hbe)} <<< (^(8'hbd))) ^ (~|(^(8'hb8)))) : (|((^~(8'ha1)) && {(8'h9e), (8'ha8)})))), 
parameter param53 = ((^param52) > ((~^(^{param52})) - (((param52 >= param52) >>> {param52}) ? ({param52} - (!param52)) : ({param52} ? (param52 == param52) : (param52 <<< param52))))))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  input wire [(4'h9):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  input wire [(3'h5):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire47;
  wire signed [(5'h15):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  assign y = {wire47,
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
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire37 = $unsigned(($unsigned(wire36) != wire32));
  assign wire38 = (+(+$unsigned(((wire36 ?
                      wire34 : wire34) > $signed(wire34)))));
  assign wire39 = {wire37[(1'h1):(1'h0)], wire36[(3'h6):(3'h6)]};
  assign wire40 = (wire35 <<< ((~(wire38[(4'h9):(4'h8)] ?
                          (~^(7'h42)) : wire35)) ?
                      wire38 : $signed($signed((wire37 ? wire37 : wire35)))));
  assign wire41 = $signed($signed($signed(((^wire40) ?
                      (wire37 ? (8'ha1) : wire36) : $signed(wire37)))));
  assign wire42 = ($signed((^~wire40)) & ($signed(wire35[(5'h13):(5'h12)]) | wire40));
  assign wire43 = $unsigned((~wire39[(3'h7):(3'h4)]));
  assign wire44 = wire43[(2'h2):(2'h2)];
  assign wire45 = ((&wire41) ?
                      $signed((-((wire33 ?
                          (8'h9f) : wire33) + (wire43 != (8'hbd))))) : ($unsigned($unsigned(((8'hac) < wire38))) ?
                          (&$unsigned({wire34, wire40})) : wire44));
  assign wire46 = wire34[(1'h0):(1'h0)];
  assign wire47 = ((($signed((wire42 ~^ (8'hb6))) >= wire37) <<< ($unsigned(wire38) ?
                      $unsigned($unsigned(wire45)) : ((wire37 ?
                              wire43 : wire36) ?
                          (7'h44) : $signed((8'had))))) <= ($signed($unsigned(wire39[(3'h6):(3'h5)])) ?
                      $unsigned(((wire46 <= wire46) ?
                          ((8'ha1) ? wire43 : wire32) : (wire32 ?
                              wire32 : wire37))) : wire35));
  always
    @(posedge clk) begin
      reg48 <= ($unsigned((&(((8'haf) & wire39) ?
              (wire34 && wire40) : (wire35 ? wire45 : wire39)))) ?
          $signed((~$signed((wire41 & wire44)))) : ((^~(~|$unsigned(wire37))) ?
              wire46[(4'h9):(3'h6)] : wire35));
      reg49 <= $signed($signed((((wire32 ? wire38 : wire38) ?
          wire44 : $signed(wire46)) != $unsigned((wire32 ? wire42 : wire43)))));
      reg50 <= reg49;
      reg51 <= (wire38 || wire32);
    end
endmodule
