module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire177;
  wire [(5'h14):(1'h0)] wire112;
  wire [(4'he):(1'h0)] wire111;
  wire signed [(2'h2):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire [(4'ha):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg101 = (1'h0);
  reg [(4'hb):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  assign y = {wire177,
                 wire112,
                 wire111,
                 wire110,
                 wire105,
                 wire104,
                 wire95,
                 wire5,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 (1'h0)};
  assign wire5 = $signed(((wire2 < ($signed(wire2) < $signed(wire4))) ^~ {$unsigned((wire1 * wire0))}));
  module6 #() modinst96 (.wire10(wire2), .y(wire95), .clk(clk), .wire7(wire5), .wire9(wire0), .wire8(wire4));
  always
    @(posedge clk) begin
      reg97 <= wire0;
      reg98 <= ((reg97 ?
              {(~&$signed(wire3))} : (-(wire5 ?
                  (~|wire4) : (wire5 ? wire3 : (7'h40))))) ?
          $signed(wire1) : $unsigned((wire2 < {wire4[(3'h7):(3'h6)]})));
      reg99 <= reg97[(4'hd):(4'h9)];
      if ($signed(wire4))
        begin
          reg100 <= ($unsigned($signed(reg99)) ?
              (reg98[(1'h0):(1'h0)] | (wire3 ^ $signed(((8'haf) ^~ (8'hb8))))) : wire5[(3'h4):(1'h1)]);
        end
      else
        begin
          if (reg99[(3'h6):(3'h5)])
            begin
              reg100 <= wire3;
            end
          else
            begin
              reg100 <= wire4[(5'h14):(4'ha)];
            end
          reg101 <= $unsigned((reg97 ?
              $signed($signed((reg98 ?
                  reg97 : reg98))) : $signed($unsigned((wire4 ?
                  reg99 : reg97)))));
          reg102 <= (^(+wire4[(2'h3):(1'h1)]));
        end
      reg103 <= (($signed(reg97[(2'h3):(1'h1)]) && (reg98 != {$signed(reg102),
          (wire5 ?
              wire0 : reg102)})) > ((reg97 <= ((+wire3) <<< (~^(8'haa)))) ^~ {(!{wire1,
              (7'h41)}),
          (&(wire5 ? reg99 : (8'h9c)))}));
    end
  assign wire104 = {($signed(((~^wire0) ~^ (wire95 >>> wire95))) ?
                           (((reg97 < wire95) >>> (reg97 ?
                               wire95 : reg101)) >= ((wire95 & reg98) == wire95[(4'ha):(3'h7)])) : reg100),
                       wire3[(3'h6):(3'h6)]};
  assign wire105 = (wire104 || (~((8'hb2) ?
                       $unsigned($unsigned(reg97)) : reg98)));
  always
    @(posedge clk) begin
      reg106 <= ((wire105 >>> reg97) >= ((^reg99[(3'h5):(2'h2)]) & ((~|{reg103,
          (8'hb8)}) * ({wire3} ? {wire1} : $unsigned(reg102)))));
      reg107 <= ((wire104 < (7'h41)) ^ {(-(wire1 ?
              wire95 : (wire95 ? reg98 : wire3)))});
      reg108 <= $unsigned($signed((wire4[(5'h13):(2'h2)] ?
          (&$signed(wire2)) : (+{(8'hac)}))));
      reg109 <= ((reg97[(4'ha):(1'h0)] >>> $signed($signed($unsigned(wire95)))) ?
          {(^~$signed((reg97 ? reg99 : wire0))),
              $signed($signed((wire105 ?
                  reg97 : wire3)))} : ($unsigned({reg102[(2'h3):(1'h0)],
                  (wire3 ? reg101 : wire105)}) ?
              {$unsigned((reg101 == reg100)), (+wire104)} : wire0));
    end
  assign wire110 = (($signed(wire4[(4'h8):(3'h5)]) ^ ($unsigned(wire4) >> (8'hb9))) >> wire105);
  assign wire111 = ((8'ha6) > $unsigned($signed(($unsigned(wire1) ?
                       $signed(reg103) : (wire4 - reg99)))));
  assign wire112 = $unsigned((~&$signed(((wire1 > wire1) ?
                       (wire104 <= wire2) : $unsigned(wire0)))));
  module113 #() modinst178 (wire177, clk, reg107, wire112, wire111, reg102, reg103);
endmodule

module module113  (y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire118;
  input wire signed [(5'h14):(1'h0)] wire117;
  input wire [(2'h2):(1'h0)] wire116;
  input wire signed [(4'hb):(1'h0)] wire115;
  input wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(4'h9):(1'h0)] wire167;
  wire signed [(5'h14):(1'h0)] wire166;
  wire [(4'hd):(1'h0)] wire165;
  wire signed [(5'h11):(1'h0)] wire163;
  wire [(4'hc):(1'h0)] wire119;
  reg signed [(5'h10):(1'h0)] reg176 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  reg [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg172 = (1'h0);
  reg [(5'h13):(1'h0)] reg171 = (1'h0);
  reg [(3'h6):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg169 = (1'h0);
  reg [(5'h14):(1'h0)] reg168 = (1'h0);
  assign y = {wire167,
                 wire166,
                 wire165,
                 wire163,
                 wire119,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 (1'h0)};
  assign wire119 = ($signed(wire118[(2'h2):(1'h0)]) != ($signed((^~$unsigned(wire117))) >= wire115));
  module120 #() modinst164 (.clk(clk), .y(wire163), .wire121(wire114), .wire123(wire119), .wire122(wire118), .wire124(wire117));
  assign wire165 = $unsigned((8'hbc));
  assign wire166 = $signed($signed((&(8'hb9))));
  assign wire167 = $signed(({((wire118 ? wire115 : wire166) ?
                               (~^wire119) : wire118),
                           $unsigned(wire119[(2'h2):(2'h2)])} ?
                       wire116[(1'h0):(1'h0)] : {wire114[(5'h12):(4'h9)],
                           $signed((&wire166))}));
  always
    @(posedge clk) begin
      reg168 <= (!((wire119 ?
              (^$unsigned((8'ha7))) : ((wire167 < wire163) ?
                  $unsigned(wire166) : {wire116})) ?
          {((wire115 ? wire163 : (8'haa)) == $signed(wire114)),
              (~{wire117, (8'hac)})} : wire114[(3'h4):(2'h3)]));
      if ((($unsigned($unsigned($signed((8'hbc)))) >> $unsigned(wire117)) ~^ wire119))
        begin
          reg169 <= (wire117 >= wire167[(2'h3):(2'h3)]);
          reg170 <= wire119[(3'h7):(2'h3)];
        end
      else
        begin
          reg169 <= ((($signed(reg170[(3'h4):(2'h3)]) ^~ ($unsigned(wire119) ?
                      $unsigned(reg169) : wire114[(3'h7):(2'h2)])) ?
                  (wire117 ?
                      ((wire119 + wire116) - $signed(wire166)) : ((wire114 & wire117) ?
                          $unsigned(wire163) : (8'hba))) : $signed(((wire166 ?
                      wire118 : wire163) >= $signed(wire116)))) ?
              wire163 : wire118);
          if ($unsigned(wire166))
            begin
              reg170 <= wire165;
              reg171 <= (-($signed($signed((reg170 ?
                  wire115 : reg168))) >>> $unsigned((~&(!(8'ha2))))));
            end
          else
            begin
              reg170 <= wire166[(2'h3):(1'h1)];
              reg171 <= (reg170 ?
                  $unsigned((~^$unsigned((wire119 ?
                      (8'ha7) : wire166)))) : wire118[(3'h4):(1'h0)]);
              reg172 <= ((reg170[(1'h0):(1'h0)] ?
                      wire119[(4'h8):(3'h6)] : $signed(wire117)) ?
                  $unsigned(reg170[(3'h4):(1'h0)]) : $signed((($unsigned(wire115) || (~|reg168)) ?
                      (wire114 ~^ (wire117 ?
                          reg170 : wire163)) : ($signed(wire166) >> wire118[(4'hc):(4'ha)]))));
              reg173 <= reg170[(3'h4):(2'h3)];
              reg174 <= $signed((&wire166));
            end
          reg175 <= (~(wire115 ?
              ($unsigned($signed(wire118)) ?
                  reg168 : (&(+wire167))) : $signed((|(reg171 ?
                  wire119 : wire118)))));
          reg176 <= (($unsigned(((wire163 + wire163) ^ wire118)) == (|$unsigned((wire166 ?
                  wire166 : wire114)))) ?
              $signed((8'hb1)) : wire115);
        end
    end
endmodule

module module6
#(parameter param94 = ((({((8'hb1) | (8'hb8))} & (((8'hab) ? (8'haf) : (8'hbd)) && {(8'ha7)})) & (7'h40)) >>> (({((8'hbb) ? (8'h9d) : (8'hbf))} ? (((8'had) ? (8'hbb) : (8'h9e)) * (8'hb8)) : ((8'hac) < ((8'hbe) > (8'h9e)))) | (8'hb7))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire84;
  wire [(4'h8):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire [(3'h6):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire [(5'h10):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire48;
  reg [(4'hf):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(5'h15):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire85,
                 wire84,
                 wire82,
                 wire81,
                 wire80,
                 wire78,
                 wire52,
                 wire51,
                 wire50,
                 wire11,
                 wire48,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg83,
                 (1'h0)};
  assign wire11 = wire9;
  module12 #() modinst49 (wire48, clk, wire10, wire7, wire8, wire11, wire9);
  assign wire50 = $signed($unsigned({$unsigned($unsigned(wire7))}));
  assign wire51 = ((^($signed((wire10 != wire7)) && (wire48[(5'h12):(5'h11)] ?
                      $signed(wire8) : wire48))) == wire48);
  assign wire52 = wire7[(4'he):(3'h4)];
  module53 #() modinst79 (wire78, clk, wire10, wire11, wire9, wire8);
  assign wire80 = (~&(8'hb2));
  assign wire81 = wire48[(4'he):(4'hb)];
  assign wire82 = $unsigned((|$signed(wire81[(4'h8):(3'h4)])));
  always
    @(posedge clk) begin
      reg83 <= {wire78};
    end
  assign wire84 = wire11[(4'h9):(2'h2)];
  assign wire85 = $unsigned(($signed($signed($unsigned(wire10))) < {($signed((8'hbe)) | wire8[(3'h5):(3'h5)])}));
  always
    @(posedge clk) begin
      reg86 <= $unsigned((~({(8'ha5), wire11} < ({(8'hac), wire7} ?
          (&wire82) : wire7))));
      reg87 <= (-$unsigned((&wire82)));
      if ((wire11[(4'h9):(4'h9)] ^~ ($signed(wire8[(1'h0):(1'h0)]) - $signed((8'hb2)))))
        begin
          if ({$unsigned(($signed(((8'hac) ? wire81 : wire50)) ?
                  (reg87[(1'h1):(1'h0)] ?
                      (~&wire11) : {wire7, wire8}) : {$unsigned(wire9)})),
              {wire51, wire80[(3'h5):(1'h0)]}})
            begin
              reg88 <= (($unsigned((!(wire7 << wire48))) ?
                      reg87[(1'h1):(1'h0)] : (+((reg83 ^~ (8'hbe)) ?
                          (^wire10) : wire80[(2'h2):(1'h0)]))) ?
                  (&{($unsigned((8'h9c)) ~^ (wire48 >>> wire50))}) : $unsigned(wire48[(2'h3):(2'h2)]));
              reg89 <= ($unsigned(wire8) >> ((wire80 ^ ({wire50} & wire9[(3'h4):(3'h4)])) ^~ $unsigned(wire11[(3'h5):(1'h0)])));
            end
          else
            begin
              reg88 <= wire82;
              reg89 <= (wire8[(4'ha):(4'ha)] ?
                  (&$signed(($signed(wire8) != (~wire52)))) : (-wire81[(1'h1):(1'h0)]));
            end
          reg90 <= (^{(~wire7), $unsigned(wire48[(1'h1):(1'h1)])});
        end
      else
        begin
          if (wire80[(1'h1):(1'h0)])
            begin
              reg88 <= wire51;
            end
          else
            begin
              reg88 <= (reg89 ? wire82[(3'h6):(3'h6)] : $unsigned(reg87));
              reg89 <= reg86[(3'h6):(1'h1)];
              reg90 <= ($unsigned(((-reg83) ?
                      reg83 : $signed(((8'ha5) + reg83)))) ?
                  ((wire7[(1'h1):(1'h0)] <= wire51[(4'h8):(1'h0)]) ?
                      wire52 : wire84) : wire51);
            end
        end
      reg91 <= wire7[(5'h10):(3'h7)];
    end
  assign wire92 = wire9[(5'h11):(4'he)];
  assign wire93 = $signed((!wire50[(4'he):(3'h7)]));
endmodule

module module53
#(parameter param77 = {(((((8'hb4) ? (8'hbd) : (8'hb6)) ? ((8'ha7) ? (8'ha1) : (8'hbb)) : ((8'ha2) && (8'ha8))) ? (+((8'ha5) ? (8'haa) : (8'hb7))) : ({(8'hb0), (8'hba)} ? (!(8'hb3)) : (&(8'ha6)))) ? (~(((8'hb3) ? (8'hac) : (8'hbd)) >> {(8'ha4)})) : {(((8'h9f) && (8'ha6)) ? (8'hb2) : (~(8'hb1)))}), ((~|(~|((8'hbf) ? (8'h9c) : (8'hb6)))) ? (8'haf) : {(((8'ha2) && (7'h42)) ~^ ((8'hb0) ? (8'hbc) : (8'hb7)))})})
(y, clk, wire57, wire56, wire55, wire54);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire57;
  input wire [(2'h2):(1'h0)] wire56;
  input wire signed [(3'h5):(1'h0)] wire55;
  input wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(5'h12):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire72;
  wire signed [(3'h6):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  assign y = {wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg58 <= {$unsigned(wire54)};
      if (wire56[(2'h2):(1'h1)])
        begin
          reg59 <= (wire55 < reg58);
          if (reg58)
            begin
              reg60 <= $unsigned(((|wire54) ?
                  ((~|(~wire56)) >= reg58[(3'h5):(3'h4)]) : $unsigned((~^(!(8'ha6))))));
              reg61 <= $signed((~(~|wire57[(1'h1):(1'h1)])));
              reg62 <= (8'haa);
              reg63 <= ((~($unsigned((|(8'ha1))) ^~ reg61[(4'hb):(4'h8)])) ~^ reg62[(1'h0):(1'h0)]);
            end
          else
            begin
              reg60 <= reg63[(3'h6):(3'h6)];
              reg61 <= $unsigned((-$unsigned((^~reg58))));
            end
          reg64 <= reg59;
          reg65 <= ($signed($unsigned(reg62)) ?
              wire56[(1'h1):(1'h0)] : {(-wire54),
                  $signed(reg63[(5'h11):(3'h7)])});
          reg66 <= ((^reg61[(4'h9):(3'h4)]) >> $signed((^($signed(reg59) || $signed(reg59)))));
        end
      else
        begin
          reg59 <= wire57[(2'h2):(1'h0)];
          if (reg61)
            begin
              reg60 <= {reg62[(2'h2):(1'h1)],
                  ({(^reg63[(1'h1):(1'h1)])} ?
                      ($signed(reg59) ?
                          $unsigned(reg61[(2'h3):(2'h2)]) : {$unsigned(reg63)}) : $unsigned($signed($signed((8'ha0)))))};
              reg61 <= reg66;
              reg62 <= $signed(($signed($unsigned($unsigned(wire55))) ?
                  {(8'hbd)} : $signed((~^wire54))));
              reg63 <= reg58[(3'h5):(3'h4)];
            end
          else
            begin
              reg60 <= $unsigned($unsigned(reg59[(1'h0):(1'h0)]));
              reg61 <= $signed(wire57);
              reg62 <= reg61[(3'h6):(3'h5)];
            end
          reg64 <= ((8'ha5) << (!($unsigned((8'haa)) <<< ($signed(wire56) & {wire57,
              wire56}))));
        end
    end
  assign wire67 = $unsigned({(reg61[(4'hd):(4'ha)] ?
                          (reg58 <= (8'hb3)) : reg62),
                      $unsigned($unsigned(reg59[(2'h3):(2'h2)]))});
  assign wire68 = $signed(reg65[(2'h3):(2'h3)]);
  assign wire69 = wire67;
  assign wire70 = (wire56 ^~ $unsigned($signed($signed((+wire67)))));
  assign wire71 = (^~$signed({{((7'h43) > wire68), reg65[(1'h0):(1'h0)]},
                      $signed(reg58)}));
  assign wire72 = reg65;
  assign wire73 = wire56[(1'h0):(1'h0)];
  assign wire74 = {$signed(wire56[(2'h2):(2'h2)])};
  assign wire75 = $signed({$signed($unsigned((wire72 ? wire54 : (8'hac)))),
                      (~|wire57)});
  assign wire76 = (({({reg64} ? reg65[(1'h1):(1'h1)] : $signed(reg58)),
                          wire73[(3'h4):(2'h2)]} ?
                      wire56 : $signed((^~wire74))) > (wire70 ?
                      {wire75} : wire68));
endmodule

module module12
#(parameter param46 = (({((~&(8'hba)) ? ((7'h40) >> (8'ha3)) : (~&(8'ha7)))} < {(8'hb8)}) >>> ((!(((8'hb3) ? (8'hbd) : (8'hbc)) ? ((8'hb8) != (8'had)) : (+(8'hb6)))) ? (((~|(7'h40)) - ((8'hba) ^ (8'hbf))) ? (^~{(8'had)}) : (8'ha4)) : (+(((8'hbb) == (8'h9f)) ? ((8'hb6) ? (8'ha3) : (8'haf)) : (7'h42))))), 
parameter param47 = param46)
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire17;
  input wire [(4'h9):(1'h0)] wire16;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(4'he):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  assign y = {wire45,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
                 reg27,
                 reg26,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= $signed(($signed($signed($signed((8'h9f)))) ?
          (^$unsigned((wire16 != wire15))) : $unsigned($unsigned($unsigned(wire15)))));
    end
  assign wire19 = (wire15 > wire14[(3'h4):(1'h0)]);
  assign wire20 = wire14;
  assign wire21 = $signed($signed($unsigned($unsigned({wire15}))));
  assign wire22 = (&wire19[(4'he):(3'h5)]);
  assign wire23 = (wire16 ? $unsigned(wire19[(4'ha):(3'h7)]) : wire14);
  assign wire24 = (wire16[(3'h4):(2'h3)] || $unsigned($unsigned({$unsigned(reg18),
                      wire16})));
  assign wire25 = $unsigned(wire15);
  always
    @(posedge clk) begin
      if ($signed($signed((((8'h9e) < $unsigned((8'hb1))) ?
          (wire13 ? (wire13 - wire19) : wire20) : ((wire22 << wire14) ?
              (wire17 < wire16) : $signed(wire24))))))
        begin
          reg26 <= ($signed($unsigned((wire17[(1'h1):(1'h1)] ?
                  wire16 : (^~wire20)))) ?
              (wire21 ?
                  wire15 : (8'h9c)) : (wire22[(3'h6):(3'h4)] >> reg18[(2'h2):(1'h1)]));
          if ((-reg18[(1'h1):(1'h1)]))
            begin
              reg27 <= ($signed({((^wire19) < wire22[(3'h4):(2'h2)])}) < ($unsigned($signed(wire20)) * wire17));
              reg28 <= (+$signed($unsigned($unsigned($signed(wire23)))));
              reg29 <= $unsigned($unsigned(wire16));
              reg30 <= ($unsigned((-{(+wire17)})) ?
                  $unsigned(wire14[(1'h0):(1'h0)]) : wire20[(4'ha):(4'ha)]);
            end
          else
            begin
              reg27 <= ((wire23 ?
                  $unsigned(wire20[(2'h2):(1'h1)]) : wire23[(4'hb):(4'h8)]) && (~$signed(wire14)));
            end
          reg31 <= wire19;
          reg32 <= reg28;
          reg33 <= ((|reg28) == $unsigned(((wire25[(5'h11):(3'h4)] & {wire14,
              (7'h44)}) <<< (+(reg26 & wire14)))));
        end
      else
        begin
          reg26 <= ({((!reg31[(1'h1):(1'h0)]) ?
                  ($unsigned(reg18) ?
                      (wire22 ? wire16 : (8'hab)) : {wire23,
                          reg18}) : wire16[(2'h3):(2'h2)]),
              wire24} > (~$signed(wire23)));
          reg27 <= wire19[(4'h8):(1'h0)];
        end
      if ($signed($signed(wire19)))
        begin
          reg34 <= $unsigned($signed(($unsigned(wire22[(2'h3):(1'h0)]) ?
              $signed((wire20 ? wire17 : reg18)) : {(|reg26)})));
          reg35 <= (~$signed($signed({$signed(wire14), (wire22 || wire15)})));
        end
      else
        begin
          if (reg31)
            begin
              reg34 <= ((8'hb1) <<< (~^$signed(wire16[(4'h9):(3'h7)])));
            end
          else
            begin
              reg34 <= (reg34 ^~ $signed((^~{$signed(wire22), (8'hae)})));
              reg35 <= ((wire23 || reg33) + reg35[(2'h2):(1'h0)]);
              reg36 <= (!reg35[(4'hb):(4'h8)]);
            end
          reg37 <= {$unsigned(({(7'h42)} < $signed((wire24 ?
                  wire19 : (8'hb8))))),
              ($unsigned(((~reg18) ? wire21 : wire23)) > reg18)};
        end
      reg38 <= $signed({(8'hb4)});
      if (wire14)
        begin
          if (((($unsigned($unsigned(reg32)) ^ wire13) ?
                  reg36[(3'h5):(1'h0)] : $signed($unsigned((&reg31)))) ?
              (-wire22[(3'h7):(3'h4)]) : wire19))
            begin
              reg39 <= $unsigned($signed($signed(reg27)));
              reg40 <= ($unsigned($unsigned(wire13[(4'hb):(3'h4)])) ~^ ($unsigned((reg27[(1'h1):(1'h0)] ?
                  (wire19 ? reg28 : reg28) : reg18)) >>> reg18[(4'hb):(3'h7)]));
              reg41 <= wire13[(3'h5):(1'h0)];
            end
          else
            begin
              reg39 <= $signed((reg27 && wire22));
              reg40 <= reg30[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg39 <= ((8'ha8) ?
              ((wire22 <= ($signed(reg40) && (reg33 ~^ reg37))) - $signed(({wire15,
                  reg35} <= {wire21,
                  reg36}))) : (-($signed((wire14 | (8'ha6))) ?
                  {(!reg32), $unsigned((8'ha4))} : (~^wire19[(3'h7):(3'h6)]))));
          reg40 <= (wire13[(4'h9):(4'h8)] ?
              {reg37[(5'h12):(3'h7)]} : (^(~&(((8'haa) < reg41) ?
                  (wire14 >= (8'ha9)) : $unsigned(wire25)))));
          reg41 <= reg33;
          reg42 <= ((~$unsigned({((8'hbb) + reg18),
              (wire25 < reg41)})) <= (~$unsigned(reg36[(4'h9):(2'h3)])));
          reg43 <= $signed(($signed($unsigned(((8'haa) >>> reg42))) == wire13[(1'h1):(1'h0)]));
        end
      reg44 <= $unsigned((8'hb6));
    end
  assign wire45 = reg27[(3'h5):(1'h1)];
endmodule

module module120
#(parameter param161 = {{(8'ha5), (8'hbf)}}, 
parameter param162 = {((param161 ? (^~(param161 ? param161 : param161)) : ((param161 ^ (8'ha9)) ? ((8'had) ? param161 : (7'h41)) : (param161 - (8'hb7)))) << param161), (+(^~((param161 & param161) ? (param161 ? param161 : param161) : {(8'had)})))})
(y, clk, wire124, wire123, wire122, wire121);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire124;
  input wire [(4'hc):(1'h0)] wire123;
  input wire [(4'he):(1'h0)] wire122;
  input wire [(4'ha):(1'h0)] wire121;
  wire signed [(4'hc):(1'h0)] wire160;
  wire [(5'h11):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire157;
  wire signed [(2'h2):(1'h0)] wire156;
  wire signed [(3'h6):(1'h0)] wire155;
  wire signed [(4'ha):(1'h0)] wire154;
  wire [(4'he):(1'h0)] wire150;
  wire signed [(5'h11):(1'h0)] wire149;
  wire [(5'h10):(1'h0)] wire148;
  wire signed [(5'h10):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire146;
  wire signed [(4'hd):(1'h0)] wire145;
  wire signed [(5'h15):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire141;
  wire signed [(3'h4):(1'h0)] wire140;
  wire [(4'hd):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire126;
  wire [(5'h10):(1'h0)] wire125;
  reg [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(2'h2):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg151 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(3'h4):(1'h0)] reg138 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg135 = (1'h0);
  reg [(4'he):(1'h0)] reg134 = (1'h0);
  reg [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg [(4'he):(1'h0)] reg131 = (1'h0);
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg127 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire126,
                 wire125,
                 reg153,
                 reg152,
                 reg151,
                 reg143,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  assign wire125 = {wire121};
  assign wire126 = {wire124, $unsigned($signed($signed((~^wire124))))};
  always
    @(posedge clk) begin
      reg127 <= {{(+wire124[(4'hf):(4'hb)]), $signed((~wire122))},
          $unsigned($signed(((wire125 >= wire122) ?
              (^~wire125) : wire123[(2'h3):(1'h1)])))};
      if ($unsigned(wire122[(4'hc):(4'h9)]))
        begin
          if ((~^$signed(wire121)))
            begin
              reg128 <= $unsigned((8'ha2));
              reg129 <= wire125;
              reg130 <= reg128;
            end
          else
            begin
              reg128 <= wire122;
              reg129 <= reg130;
              reg130 <= ($signed((((reg128 > reg127) - {wire121}) == $unsigned($unsigned(reg130)))) <= $signed($unsigned(reg127)));
              reg131 <= reg128[(3'h5):(3'h5)];
              reg132 <= (reg128[(1'h1):(1'h1)] ?
                  $unsigned(($signed($unsigned((7'h42))) >>> ((reg131 | wire122) ?
                      (^~reg128) : (wire122 <<< wire121)))) : $signed((wire121 ?
                      (~&(wire121 ~^ reg128)) : (wire123[(4'hc):(4'hc)] >> $signed(wire126)))));
            end
          reg133 <= (&wire125);
          reg134 <= {wire124};
          reg135 <= (+$signed($signed({$signed(reg132)})));
        end
      else
        begin
          reg128 <= ((wire126[(1'h1):(1'h1)] <<< ($unsigned($unsigned(wire122)) && (~^(^reg128)))) < reg132);
        end
      reg136 <= (($unsigned(reg135) >> (wire124 ?
          reg130 : (reg127[(1'h0):(1'h0)] << $signed(wire124)))) <<< (~&reg128));
      reg137 <= {({$signed($signed(wire121))} >>> (!$signed(wire126[(2'h2):(1'h1)])))};
      reg138 <= wire125;
    end
  assign wire139 = ($unsigned(wire123) <= (&$unsigned((reg133[(1'h0):(1'h0)] ?
                       $signed(reg132) : (|(8'hb8))))));
  assign wire140 = reg133[(1'h0):(1'h0)];
  assign wire141 = $unsigned($unsigned($unsigned(((reg127 && (8'hb7)) | wire139[(4'hb):(3'h5)]))));
  assign wire142 = (reg133 + reg130[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg143 <= (+(!(-{(reg130 * (7'h40))})));
    end
  assign wire144 = wire141[(2'h2):(1'h0)];
  assign wire145 = $signed((8'hb4));
  assign wire146 = (^~$signed(($signed($unsigned(reg133)) << $unsigned(reg134[(3'h7):(2'h3)]))));
  assign wire147 = (^reg129);
  assign wire148 = (wire140[(2'h2):(1'h0)] | (reg135 == $unsigned($signed($unsigned(reg138)))));
  assign wire149 = {reg135[(2'h2):(2'h2)], wire145};
  assign wire150 = $unsigned(reg128);
  always
    @(posedge clk) begin
      reg151 <= (reg128[(2'h3):(1'h1)] ?
          (8'ha5) : (!($signed(wire125) ^ {(|(8'hbe))})));
      reg152 <= $unsigned($signed({$unsigned((wire147 ? wire147 : reg136)),
          wire144}));
      reg153 <= (($unsigned(reg131) <= $unsigned(wire147)) ?
          (8'hb5) : $unsigned((^~$signed((&reg151)))));
    end
  assign wire154 = $unsigned((|(reg131 ?
                       wire150[(3'h5):(1'h0)] : (wire140 && (~&wire139)))));
  assign wire155 = {(^~$signed(wire147[(2'h2):(2'h2)])),
                       (($signed({(8'ha0), wire146}) ?
                           $unsigned($signed(reg152)) : wire139) ^~ ($signed($signed(wire123)) ?
                           {$signed(wire146),
                               (wire139 ?
                                   wire144 : (8'had))} : {(wire144 == reg133),
                               {(8'hb9), wire150}}))};
  assign wire156 = (^~$signed((((&wire146) ?
                       reg153 : $signed(reg152)) ^~ ($unsigned(reg137) ?
                       $unsigned(reg137) : (reg151 ? (8'hac) : reg137)))));
  assign wire157 = (~|(~^reg152[(1'h1):(1'h0)]));
  assign wire158 = $signed(wire140);
  assign wire159 = $signed(reg128[(1'h0):(1'h0)]);
  assign wire160 = {$signed({$signed((^reg131))}),
                       $unsigned((^$signed(reg134[(4'hb):(3'h5)])))};
endmodule
