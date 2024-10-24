module top
#(parameter param104 = ((((~^(8'hbb)) ^ (((8'h9f) || (8'h9e)) ? ((8'hbc) ? (8'hac) : (8'haf)) : (~&(8'haa)))) ~^ (({(7'h42), (8'ha3)} >> ((8'hb7) < (8'ha8))) >>> (-((8'hba) < (8'hb2))))) << (^~(|((|(8'hac)) << ((8'hb4) ? (8'hb9) : (8'ha4)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(4'hb):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire100;
  wire signed [(5'h15):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire98;
  wire [(3'h5):(1'h0)] wire96;
  wire signed [(4'hc):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire14,
                 wire13,
                 wire6,
                 wire5,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = wire0[(4'ha):(2'h2)];
  assign wire6 = $signed(((wire1 + ($unsigned(wire5) + (wire3 || wire5))) << $signed(wire5[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      if ((+{$signed(($signed(wire1) + $unsigned((8'hac))))}))
        begin
          reg7 <= (^~wire4);
          reg8 <= (~|$signed($unsigned($signed($unsigned(reg7)))));
          if (wire2)
            begin
              reg9 <= (wire4[(2'h2):(1'h0)] << (~^$unsigned($unsigned($unsigned(wire2)))));
              reg10 <= (+$signed($signed((~|wire5[(3'h7):(2'h2)]))));
            end
          else
            begin
              reg9 <= (((((wire3 ?
                      wire6 : reg10) && $signed(wire6)) >> (8'ha3)) ?
                  $signed(wire6) : $unsigned(((wire6 >> (7'h44)) ?
                      (+reg10) : (wire6 & wire0)))) >> ((($signed(reg8) || $unsigned(wire3)) ?
                      (wire5 < $unsigned(wire3)) : (8'ha0)) ?
                  $unsigned(($signed(wire6) ?
                      $signed(reg7) : {wire3})) : ($unsigned((~&reg8)) ?
                      ($unsigned(wire3) ?
                          (reg7 ? wire0 : wire2) : (reg8 ?
                              (8'hb4) : wire4)) : (reg9 - $signed((8'hab))))));
              reg10 <= (((~^wire3) ?
                  (+$unsigned(reg7[(3'h4):(2'h3)])) : wire4[(2'h2):(2'h2)]) * ($unsigned($signed({wire5})) ?
                  wire0 : ({(wire0 ? reg10 : reg10),
                      (~^wire2)} > $unsigned((^reg9)))));
            end
          reg11 <= $unsigned(wire6);
        end
      else
        begin
          if (reg9)
            begin
              reg7 <= (wire2[(2'h2):(2'h2)] ?
                  $signed($unsigned($unsigned($signed(wire6)))) : (7'h42));
              reg8 <= ((((&(+(8'hba))) ?
                  {$signed(wire2),
                      (!reg9)} : $signed((wire0 * reg9))) < ({$unsigned(wire4)} ^~ ((8'ha1) ~^ (~|wire2)))) != reg11[(1'h1):(1'h0)]);
              reg9 <= $unsigned(($signed((-(wire3 << wire5))) ?
                  $signed(wire6) : (~&($unsigned(wire1) + $signed(reg9)))));
            end
          else
            begin
              reg7 <= ($signed(reg7[(3'h4):(1'h0)]) * (reg10 ?
                  wire5[(1'h0):(1'h0)] : (8'h9c)));
              reg8 <= {wire6, $signed(wire6)};
              reg9 <= reg9[(1'h1):(1'h1)];
            end
          reg10 <= $signed($unsigned(((+$signed(wire6)) < (reg9 ?
              (!wire0) : reg9[(4'ha):(2'h2)]))));
        end
      reg12 <= wire0[(2'h3):(2'h2)];
    end
  assign wire13 = ($unsigned((&wire2[(1'h0):(1'h0)])) >= wire5[(2'h3):(2'h2)]);
  assign wire14 = wire0[(3'h4):(3'h4)];
  module15 #() modinst52 (.wire17(wire2), .wire19(reg8), .y(wire51), .wire20(wire1), .wire18(wire13), .clk(clk), .wire16(wire3));
  assign wire53 = {wire0[(1'h1):(1'h0)]};
  assign wire54 = $unsigned(({(!(8'ha9)), ((reg7 << wire0) - $signed(reg8))} ?
                      reg8[(3'h6):(3'h6)] : (($unsigned((8'ha5)) ?
                          $unsigned(reg10) : wire51[(4'hb):(2'h3)]) << {(wire51 ?
                              wire1 : wire14),
                          (wire51 ^~ wire51)})));
  assign wire55 = (~((reg7[(3'h7):(3'h5)] ?
                      wire6[(4'hf):(1'h1)] : $unsigned({reg12})) * (~$signed($unsigned((7'h44))))));
  module56 #() modinst97 (wire96, clk, wire4, reg12, wire51, wire14, wire53);
  assign wire98 = ($unsigned(reg9[(3'h5):(3'h4)]) * ((((wire96 && reg10) ?
                      ((7'h41) ? wire55 : wire1) : reg10) | ($signed(wire0) ?
                      wire96 : wire1)) & (reg9[(3'h4):(2'h2)] ?
                      ((reg8 | wire0) ?
                          $unsigned(wire2) : (^wire55)) : (wire2 && (wire96 == wire2)))));
  assign wire99 = ($signed($signed((((8'hb1) ?
                          (8'ha1) : wire2) <= (~wire98)))) ?
                      (~&(~|wire96[(3'h4):(2'h2)])) : $unsigned((wire0[(4'h9):(3'h6)] ?
                          (8'hba) : wire5)));
  assign wire100 = (wire2[(2'h2):(2'h2)] ?
                       (|(($unsigned(wire6) ^~ (reg12 && (8'hb8))) ?
                           ($unsigned(reg9) ^~ $signed(wire96)) : (^wire6[(5'h11):(2'h3)]))) : ({($unsigned(wire0) || wire53)} <<< $unsigned(($signed((8'ha2)) ?
                           (&wire0) : {reg9, (8'ha8)}))));
  assign wire101 = (((wire100[(2'h3):(1'h0)] - reg9) >= wire14[(2'h2):(2'h2)]) - $unsigned(reg11));
  assign wire102 = (~&(^($unsigned((~^reg10)) ? wire2 : (&$unsigned(wire14)))));
  assign wire103 = (~&(((|wire3[(4'h9):(1'h1)]) + ($signed(wire0) ?
                           (wire5 ? (8'hb9) : reg12) : $signed(wire3))) ?
                       wire4 : reg7[(4'ha):(2'h3)]));
endmodule

module module56
#(parameter param94 = (-((((^(8'hbd)) ? {(8'haf)} : (&(8'hb5))) && ((~(8'ha6)) ~^ ((8'ha4) + (8'hb3)))) & ((8'ha9) ? (((8'ha2) ~^ (7'h40)) ? ((8'ha3) ? (7'h44) : (8'ha8)) : ((8'haa) + (8'ha2))) : (~^(-(8'hb4)))))), 
parameter param95 = ((param94 ? (^((~param94) ~^ ((8'hb6) + param94))) : param94) ? ((param94 & param94) ? ({(^param94), param94} == param94) : (^(+(param94 - param94)))) : (8'hb8)))
(y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire61;
  input wire [(5'h14):(1'h0)] wire60;
  input wire [(4'ha):(1'h0)] wire59;
  input wire [(5'h15):(1'h0)] wire58;
  input wire signed [(5'h14):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire93;
  wire [(3'h7):(1'h0)] wire92;
  wire signed [(4'he):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire87,
                 wire86,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
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
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg62 <= (!(+wire60));
      reg63 <= (^(($signed(wire60[(4'hd):(4'hb)]) - reg62) + (^~$signed({wire58}))));
      reg64 <= reg63[(5'h14):(5'h11)];
      if (((((wire59 > ((8'hbb) ? wire61 : wire61)) ?
              reg63[(5'h10):(2'h3)] : ($unsigned(wire57) ?
                  reg64 : wire58[(3'h5):(2'h2)])) ^~ $unsigned($unsigned((wire60 ~^ reg62)))) ?
          $signed((wire57 ?
              {reg62[(2'h2):(1'h1)]} : {(wire58 ?
                      (8'ha9) : wire57)})) : (wire58[(5'h10):(4'hc)] <= reg64[(3'h6):(2'h3)])))
        begin
          reg65 <= (wire60 ^ (-$signed(((8'h9c) || (wire58 ~^ wire61)))));
          reg66 <= {((&(+reg62[(3'h7):(1'h1)])) | (~^reg63[(5'h11):(4'hf)]))};
          reg67 <= (&(+wire60[(5'h12):(3'h7)]));
          if ($unsigned(reg63))
            begin
              reg68 <= {$signed($unsigned($unsigned(reg65[(3'h7):(3'h7)])))};
            end
          else
            begin
              reg68 <= (~&$signed($signed((wire58[(5'h12):(3'h6)] ?
                  wire59 : (wire58 ? reg65 : reg67)))));
              reg69 <= (~&{reg66, $signed($unsigned(reg68))});
              reg70 <= $signed($unsigned({reg69}));
            end
        end
      else
        begin
          if (reg69)
            begin
              reg65 <= $unsigned(wire61[(3'h4):(1'h1)]);
              reg66 <= (~$signed(($signed(((8'hbb) & (8'ha6))) || $signed(reg63))));
              reg67 <= wire58[(1'h0):(1'h0)];
            end
          else
            begin
              reg65 <= (!(7'h43));
              reg66 <= reg69;
              reg67 <= reg69[(1'h1):(1'h1)];
              reg68 <= wire60[(2'h3):(1'h1)];
            end
          reg69 <= $signed((reg68[(3'h5):(2'h3)] != reg69));
        end
      reg71 <= $signed((~(&wire59[(3'h5):(3'h4)])));
    end
  always
    @(posedge clk) begin
      reg72 <= (+$signed({((reg65 << reg67) ^~ $signed(wire61)),
          ((wire60 ? wire59 : reg71) <<< reg71[(2'h3):(1'h0)])}));
      if ($signed((!reg64)))
        begin
          reg73 <= (($signed({$unsigned(reg69)}) ^~ reg69) != (reg70 >> reg63));
          if (reg71[(3'h4):(2'h2)])
            begin
              reg74 <= reg73[(2'h3):(2'h3)];
              reg75 <= $signed((({{reg69, reg73}} ?
                      wire60 : {reg71[(1'h1):(1'h0)],
                          (reg71 ? reg74 : reg71)}) ?
                  reg70[(2'h2):(2'h2)] : ({(reg63 ? (7'h41) : (8'hba))} ?
                      ((reg63 ? reg65 : wire60) ?
                          $unsigned((8'hbf)) : (wire61 >>> wire60)) : $unsigned((&reg63)))));
              reg76 <= (((+reg73) ? $unsigned((~&$unsigned(reg65))) : (7'h42)) ?
                  reg63[(5'h14):(5'h13)] : (8'h9c));
            end
          else
            begin
              reg74 <= {$signed((((reg66 ? (8'hb2) : wire57) ?
                          reg65[(2'h2):(1'h0)] : wire58[(4'hb):(3'h7)]) ?
                      (^~$signed(reg73)) : reg73[(3'h5):(3'h5)])),
                  $unsigned((-(-(!reg62))))};
              reg75 <= $signed(($unsigned(($unsigned(reg68) ?
                      ((8'hb6) ? reg72 : (8'hb3)) : $unsigned(reg65))) ?
                  (-reg65[(3'h6):(1'h1)]) : ((!(!reg72)) ?
                      reg62 : {(-reg71), ((8'hb3) == (8'hb0))})));
              reg76 <= (8'hac);
              reg77 <= (wire58 ?
                  $signed((reg75[(5'h13):(4'hf)] >> $unsigned((reg68 - reg71)))) : ((~|reg68[(3'h6):(3'h6)]) == wire57));
            end
          reg78 <= $unsigned(reg68);
          reg79 <= (7'h43);
        end
      else
        begin
          if (reg78[(4'hc):(3'h7)])
            begin
              reg73 <= {reg64[(3'h6):(3'h5)]};
              reg74 <= wire58[(5'h14):(4'hb)];
              reg75 <= $unsigned($unsigned($unsigned((!(reg70 ?
                  reg64 : reg79)))));
            end
          else
            begin
              reg73 <= $signed({$signed({reg64}), (-reg73)});
              reg74 <= $signed((~|$signed(wire61[(1'h1):(1'h0)])));
            end
          if ($unsigned(reg71[(1'h1):(1'h0)]))
            begin
              reg76 <= {($signed(((reg75 && reg79) << $unsigned(reg73))) + (!$unsigned((reg72 ?
                      wire58 : reg69)))),
                  (((wire59 & (reg71 ? wire60 : reg71)) ?
                          ((~|reg72) > (+reg71)) : ((wire58 != (8'hbf)) ?
                              reg68 : (-wire59))) ?
                      $unsigned(reg64[(1'h1):(1'h1)]) : (~^{(reg65 * reg76),
                          (wire59 > reg70)}))};
              reg77 <= $unsigned($unsigned((^~wire59[(3'h6):(1'h1)])));
              reg78 <= reg63;
              reg79 <= $unsigned((8'hb9));
            end
          else
            begin
              reg76 <= $signed(($unsigned(wire61) == ($signed($signed(reg76)) ?
                  reg71[(1'h0):(1'h0)] : reg66)));
              reg77 <= ({$signed((reg69 ^ reg71))} ?
                  $unsigned({$unsigned({(7'h41), reg70}),
                      {(reg68 ? reg70 : wire59)}}) : reg78);
              reg78 <= wire57[(5'h11):(5'h11)];
              reg79 <= {reg78};
            end
          reg80 <= ({(8'ha3)} * $unsigned((^$signed(reg69))));
          reg81 <= ((!$unsigned((~|(reg71 >= reg64)))) ?
              $signed(reg75[(5'h10):(3'h7)]) : wire59[(2'h3):(2'h3)]);
          reg82 <= reg77[(2'h2):(2'h2)];
        end
      reg83 <= reg75[(4'hb):(4'h8)];
      reg84 <= $unsigned(wire57);
      reg85 <= (((wire59 ? (^(|(8'ha0))) : (!(~&reg78))) ?
              reg69 : $signed($signed(reg66[(1'h0):(1'h0)]))) ?
          ($signed($signed((+reg81))) ?
              (^~(!(+reg69))) : $unsigned((reg67 ?
                  (reg63 < reg68) : (reg84 * wire57)))) : (($unsigned($signed((8'hbf))) - (reg63 && (~^(7'h41)))) >> reg65[(2'h2):(2'h2)]));
    end
  assign wire86 = (wire60 ^~ (reg78 ^~ $unsigned(reg76[(3'h4):(1'h0)])));
  assign wire87 = (reg76 >> (!({reg80} ?
                      $unsigned({reg70, wire60}) : reg63[(4'hc):(1'h0)])));
  always
    @(posedge clk) begin
      if ((reg83 == reg65))
        begin
          reg88 <= reg75;
        end
      else
        begin
          if ($unsigned(($signed((^~$unsigned(reg76))) ?
              $unsigned(reg71) : (~(8'ha9)))))
            begin
              reg88 <= $signed((|(|$signed(reg83[(3'h4):(3'h4)]))));
              reg89 <= (reg64 > $unsigned(reg64[(3'h5):(2'h2)]));
            end
          else
            begin
              reg88 <= (&$unsigned($signed($unsigned(reg78[(5'h11):(4'h9)]))));
              reg89 <= $signed($signed($unsigned(reg68[(4'h8):(1'h1)])));
            end
          reg90 <= reg76[(3'h5):(2'h3)];
        end
      reg91 <= (reg82[(3'h5):(3'h4)] ^~ $signed(wire58[(5'h15):(5'h12)]));
    end
  assign wire92 = (8'h9e);
  assign wire93 = $unsigned($signed(wire92[(2'h3):(2'h2)]));
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire21;
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire21,
                 (1'h0)};
  assign wire21 = $unsigned((-(wire19 ? $unsigned(wire16) : (8'hb8))));
  module22 #() modinst40 (wire39, clk, wire19, wire18, wire20, wire16);
  assign wire41 = wire39;
  assign wire42 = wire39;
  assign wire43 = {(8'ha9)};
  assign wire44 = ($signed($signed((&{wire19, wire43}))) ?
                      ($unsigned($unsigned(wire18)) ?
                          ($unsigned($unsigned(wire20)) ?
                              (~&(wire42 ? wire43 : wire42)) : ({wire43} ?
                                  (wire43 ?
                                      wire17 : wire18) : (!wire16))) : (8'hac)) : (~|(8'hb2)));
  assign wire45 = {($signed((wire44 ? {wire41} : wire20)) ?
                          ($unsigned(wire19) << $unsigned(wire18)) : ((+wire18[(4'h8):(1'h1)]) - $unsigned($signed(wire21)))),
                      $unsigned($signed(($unsigned(wire44) >>> $unsigned(wire44))))};
  assign wire46 = ($unsigned(((wire39 ^ (wire19 - wire21)) >>> wire43)) != {(wire43[(3'h7):(2'h2)] ?
                          ((wire41 ^ wire41) ~^ wire41[(4'hb):(2'h3)]) : $unsigned($unsigned(wire44)))});
  assign wire47 = wire16[(5'h15):(3'h6)];
  assign wire48 = (~&wire17);
  assign wire49 = $unsigned(wire48);
  assign wire50 = wire18;
endmodule

module module22
#(parameter param37 = (((((~(7'h42)) && {(8'hb1), (8'hb2)}) >>> ((~|(8'ha7)) || ((8'ha2) < (8'hbd)))) ? {(-{(8'ha2), (8'hbb)}), (((8'hba) + (8'hb5)) ~^ ((8'ha1) >>> (8'ha8)))} : ({((8'ha0) ? (7'h41) : (8'hbe)), (&(8'had))} + {((7'h40) ? (7'h42) : (8'hbf))})) & ((~|(&(&(8'hb2)))) ? (((+(8'ha9)) ~^ (~(8'hac))) ? (-{(8'ha2)}) : (~|{(8'hbf), (7'h41)})) : ({((8'hac) > (8'hbc))} ^ (!((8'hb4) ? (8'hbb) : (8'h9e)))))), 
parameter param38 = param37)
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire [(2'h3):(1'h0)] wire24;
  input wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire30;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg31,
                 (1'h0)};
  assign wire27 = $unsigned((^~wire26[(3'h7):(3'h4)]));
  assign wire28 = (($signed(wire26) ?
                          wire26[(4'ha):(4'h9)] : (~|($signed(wire27) ?
                              wire27[(2'h3):(2'h2)] : ((8'haf) ?
                                  wire25 : wire26)))) ?
                      wire25[(3'h4):(1'h0)] : wire24);
  assign wire29 = wire25;
  assign wire30 = $unsigned({$unsigned($signed(wire25[(3'h4):(2'h3)]))});
  always
    @(posedge clk) begin
      reg31 <= (($unsigned(wire23) <<< (^$signed((~wire23)))) ?
          wire26[(1'h0):(1'h0)] : wire30);
    end
  assign wire32 = {({$signed(wire25[(1'h1):(1'h0)]),
                          ($signed(wire23) ? (8'ha1) : (~^reg31))} && reg31),
                      $unsigned({$unsigned((wire26 - wire27)),
                          (wire24[(2'h3):(1'h0)] ?
                              wire25[(1'h1):(1'h1)] : $signed(wire23))})};
  assign wire33 = $signed(($signed(((wire23 ? reg31 : wire24) ^ wire29)) ?
                      {(8'ha4), $signed((~&wire28))} : {wire29[(4'he):(4'h8)],
                          (reg31 ? (wire30 || wire29) : $signed((8'ha3)))}));
  assign wire34 = $signed((^~($unsigned(((8'hb3) ^~ wire32)) ?
                      wire23[(1'h0):(1'h0)] : wire25)));
  assign wire35 = (~|{reg31[(4'hb):(4'h8)],
                      {wire23[(2'h2):(2'h2)],
                          {$signed(wire28), wire28[(3'h7):(3'h7)]}}});
  assign wire36 = {(8'hae),
                      $signed(((^~wire27) ?
                          $unsigned($unsigned(wire33)) : (wire35 * $signed(wire34))))};
endmodule
