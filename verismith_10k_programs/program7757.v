module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire [(3'h7):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire82;
  wire signed [(5'h10):(1'h0)] wire81;
  wire signed [(3'h7):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire79;
  reg signed [(5'h10):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg110 = (1'h0);
  reg [(3'h5):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(4'h9):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg [(3'h5):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg103 = (1'h0);
  reg [(4'hf):(1'h0)] reg101 = (1'h0);
  reg [(4'hd):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(3'h4):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  assign y = {wire102,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire5,
                 wire6,
                 wire79,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire5 = wire1[(1'h1):(1'h0)];
  assign wire6 = $signed((&(((~|wire4) << $unsigned(wire3)) == ((~wire1) ?
                     (wire5 ? wire2 : (8'hbc)) : (wire1 * wire3)))));
  module7 #() modinst80 (wire79, clk, wire0, wire1, wire2, wire3, wire5);
  assign wire81 = wire2;
  assign wire82 = wire3;
  assign wire83 = $unsigned({$signed(wire81)});
  assign wire84 = $signed(wire5[(1'h0):(1'h0)]);
  assign wire85 = $unsigned((-wire1[(4'hf):(4'hc)]));
  assign wire86 = wire0;
  assign wire87 = ($unsigned((wire83 || wire85[(2'h3):(1'h1)])) ?
                      {wire85[(4'h9):(2'h2)], (8'hb8)} : ((($signed(wire82) ?
                              $signed(wire84) : {wire84, wire81}) ?
                          $signed(((8'hbb) ? wire2 : wire79)) : (!(wire83 ?
                              (8'hb6) : wire85))) || wire2));
  assign wire88 = ($signed($unsigned({(wire5 >= wire83), $unsigned(wire83)})) ?
                      wire6 : $signed(wire6[(4'hd):(2'h2)]));
  always
    @(posedge clk) begin
      if ((^~(~|wire5)))
        begin
          reg89 <= (({((wire88 | wire87) ?
                      wire2[(4'hb):(2'h2)] : $signed(wire0))} ?
              wire84 : $signed($unsigned({(8'ha4),
                  wire87}))) == $unsigned(wire2[(2'h2):(2'h2)]));
          reg90 <= $signed((wire4 ? wire1 : $signed(wire85[(4'h9):(3'h7)])));
          reg91 <= $signed((wire82[(1'h0):(1'h0)] ?
              (({wire88, wire6} ? (|reg89) : wire4[(3'h7):(2'h2)]) ?
                  wire2 : ((+(8'ha5)) ?
                      (wire84 ?
                          wire81 : wire2) : $unsigned(wire83))) : wire79));
          reg92 <= ($signed(($unsigned(wire82) <= (-(wire88 ?
              wire86 : (8'ha3))))) && wire5);
        end
      else
        begin
          if (({(&(8'hb3)), ((-(!wire2)) > (^(wire2 << wire2)))} ?
              $signed(($signed((wire83 || wire88)) ?
                  (^((7'h40) && wire88)) : (wire4[(4'ha):(3'h4)] & wire3[(4'hc):(2'h3)]))) : wire5))
            begin
              reg89 <= $signed(wire85[(4'h8):(3'h5)]);
            end
          else
            begin
              reg89 <= $unsigned($unsigned($unsigned((&$signed(reg92)))));
            end
          if ($unsigned(({wire87[(3'h5):(1'h1)], (-wire6)} ?
              wire83[(4'hf):(4'hf)] : (((!wire83) != (&wire1)) ?
                  ((!(8'h9e)) ?
                      (^wire84) : (-wire1)) : (!(wire82 >>> reg92))))))
            begin
              reg90 <= $unsigned(wire82[(1'h0):(1'h0)]);
            end
          else
            begin
              reg90 <= $unsigned({$unsigned({wire87[(3'h6):(2'h3)]}), reg92});
            end
          reg91 <= wire84;
        end
      reg93 <= $unsigned(((wire5[(1'h0):(1'h0)] >= $signed($unsigned(wire85))) ?
          wire82[(4'h8):(3'h7)] : {(wire83[(3'h6):(3'h6)] | $unsigned((8'h9f)))}));
      if ((wire6 <<< ((!wire4) == $signed($signed((wire85 > wire82))))))
        begin
          reg94 <= $unsigned($unsigned($signed({(~^reg91)})));
          reg95 <= (({reg91} & (8'ha8)) ?
              wire86 : (~|({$signed(reg91)} < $signed($signed(reg94)))));
          if (reg92)
            begin
              reg96 <= (-(-wire6[(5'h10):(3'h7)]));
            end
          else
            begin
              reg96 <= wire6[(4'ha):(3'h5)];
              reg97 <= {wire0, wire3};
              reg98 <= reg91;
              reg99 <= ((&((reg94[(4'ha):(1'h0)] + (reg89 ~^ reg91)) ~^ reg95[(3'h4):(2'h3)])) ~^ $unsigned(wire88[(3'h4):(2'h2)]));
              reg100 <= $unsigned({wire6[(4'ha):(1'h0)], (7'h41)});
            end
          reg101 <= ((wire81 ^~ wire0) ?
              $signed(wire2[(5'h10):(2'h2)]) : $signed($signed(($signed(wire79) ?
                  reg98[(5'h14):(3'h7)] : $signed(wire3)))));
        end
      else
        begin
          reg94 <= reg97[(4'ha):(3'h4)];
        end
    end
  assign wire102 = (8'haa);
  always
    @(posedge clk) begin
      if (wire85)
        begin
          reg103 <= ($unsigned((reg97 >> $signed(wire88[(5'h15):(5'h14)]))) ?
              $signed($unsigned(($signed((8'ha1)) ?
                  (reg99 ^ wire87) : (+reg97)))) : ((reg94[(4'hb):(1'h0)] != ($signed(wire2) ?
                  (wire1 ^~ reg99) : ((8'hb9) >>> wire81))) <= wire85));
        end
      else
        begin
          if ((^(8'ha7)))
            begin
              reg103 <= $unsigned($unsigned($unsigned($unsigned((8'ha9)))));
              reg104 <= (8'ha3);
              reg105 <= ($signed((reg90[(5'h13):(5'h12)] * ({reg92, (8'hab)} ?
                      $unsigned(wire2) : reg95[(2'h2):(1'h1)]))) ?
                  reg98[(5'h11):(4'hb)] : (reg94 >>> $signed(reg91)));
            end
          else
            begin
              reg103 <= ($unsigned($unsigned(wire1[(3'h4):(2'h3)])) < $unsigned((|{reg92})));
              reg104 <= (reg95[(2'h2):(1'h1)] > $signed(wire2));
              reg105 <= ($unsigned({{$signed(wire83),
                      (reg97 ? reg92 : (8'ha8))},
                  $unsigned(wire0)}) >= ($signed(((&wire6) < $signed(wire82))) ?
                  reg101 : $signed((~|$signed(wire4)))));
              reg106 <= $unsigned($signed((~|wire2[(4'hc):(4'hb)])));
            end
          if ((|$unsigned({((wire88 ? reg104 : reg92) ?
                  reg94 : (reg99 ? (8'hb9) : wire2))})))
            begin
              reg107 <= reg99;
              reg108 <= (~^$unsigned(wire83[(3'h5):(1'h1)]));
              reg109 <= (($unsigned(((reg89 != wire102) >= reg99)) ?
                  $signed((-reg105[(2'h3):(2'h2)])) : ($unsigned($unsigned(wire5)) & $unsigned(reg99[(3'h6):(3'h5)]))) || (reg93[(3'h4):(2'h3)] ?
                  $unsigned($unsigned((reg99 ~^ wire79))) : ($signed(wire82[(1'h0):(1'h0)]) <= wire84)));
            end
          else
            begin
              reg107 <= ($signed((reg107 ?
                      $signed(reg105) : ((reg107 != wire6) ^~ (~^wire79)))) ?
                  reg96[(4'hc):(2'h3)] : $signed((+$signed(wire87))));
              reg108 <= (|{(wire86 ?
                      $signed((8'ha7)) : (((8'hb6) - reg96) + (^~reg101))),
                  reg92});
              reg109 <= $unsigned(reg103[(4'h9):(3'h6)]);
              reg110 <= (&$unsigned(({{reg90, wire2}, wire83[(3'h7):(3'h4)]} ?
                  {(reg108 && (8'ha2))} : {(+wire102)})));
            end
          reg111 <= reg100;
          reg112 <= {wire81[(3'h6):(3'h5)]};
          reg113 <= $signed(wire82[(1'h0):(1'h0)]);
        end
      reg114 <= wire6;
    end
endmodule

module module7
#(parameter param78 = ((&{(((8'hb8) | (8'ha8)) ? (|(8'haa)) : (-(8'had))), ((-(8'hb2)) ? (~(8'haa)) : ((8'hb2) * (8'ha1)))}) ? (&({(~(8'hbf))} && (((8'hb1) ? (8'ha2) : (7'h41)) ^ (|(8'ha9))))) : ((~(~^((7'h41) != (8'had)))) + {(8'h9f), (((8'ha5) ? (8'hb5) : (8'h9f)) ^ (^~(7'h41)))})))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(3'h7):(1'h0)] wire8;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire42;
  wire [(4'hd):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire45;
  wire signed [(5'h12):(1'h0)] wire75;
  assign y = {wire77, wire42, wire14, wire13, wire44, wire45, wire75, (1'h0)};
  assign wire13 = (~(~wire9));
  assign wire14 = $signed($unsigned(((wire8[(3'h7):(2'h2)] * wire13) << wire8)));
  module15 #() modinst43 (.wire17(wire9), .wire18(wire10), .wire19(wire12), .wire20(wire11), .clk(clk), .wire16(wire14), .y(wire42));
  assign wire44 = $signed($unsigned((&(wire10[(1'h1):(1'h1)] << ((8'ha6) ?
                      (8'hbf) : wire9)))));
  assign wire45 = wire44;
  module46 #() modinst76 (.wire51(wire10), .y(wire75), .clk(clk), .wire47(wire44), .wire50(wire13), .wire49(wire11), .wire48(wire12));
  assign wire77 = $unsigned(wire44);
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire51;
  input wire [(3'h6):(1'h0)] wire50;
  input wire signed [(5'h15):(1'h0)] wire49;
  input wire signed [(2'h3):(1'h0)] wire48;
  input wire [(2'h3):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire74;
  wire [(5'h11):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire52 = $unsigned(wire48);
  assign wire53 = (($signed($unsigned((wire50 < wire48))) ?
                      $unsigned(($unsigned(wire48) != $signed((7'h42)))) : (8'h9c)) || $unsigned(wire48));
  assign wire54 = wire51;
  assign wire55 = $unsigned($signed((~&(~^(wire50 == wire52)))));
  always
    @(posedge clk) begin
      if (((wire50 ?
              wire51[(3'h6):(1'h1)] : {(&$signed((8'hb0))),
                  ($unsigned(wire47) < (wire48 >>> wire54))}) ?
          (&(($unsigned(wire55) ?
                  $signed(wire52) : (wire49 ? (7'h42) : wire54)) ?
              wire47[(1'h1):(1'h1)] : (~|(wire54 ?
                  wire54 : wire52)))) : (wire47[(1'h1):(1'h0)] || $signed(wire49[(4'ha):(1'h0)]))))
        begin
          if (wire52[(3'h5):(3'h4)])
            begin
              reg56 <= ((wire47[(2'h2):(1'h1)] ^~ $signed($signed(wire47))) ?
                  wire55 : wire53);
              reg57 <= (~wire54[(1'h1):(1'h1)]);
              reg58 <= reg56;
              reg59 <= ({$signed(((wire52 != wire55) | $signed(wire55)))} + ($unsigned($unsigned(wire48)) ?
                  {(wire53[(4'hf):(4'h8)] ?
                          wire47 : $signed(wire53))} : $signed($unsigned(wire55[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg56 <= wire51;
              reg57 <= wire48;
            end
          if ((($unsigned(($unsigned(wire48) >= {reg57})) ?
                  {$signed((wire55 ? reg58 : wire53)),
                      wire53} : (($unsigned(wire52) - {wire54, wire47}) ?
                      ((reg56 ^ wire55) ?
                          $unsigned(reg57) : {wire47,
                              wire52}) : $unsigned(((8'hb2) ?
                          wire51 : reg56)))) ?
              ((&reg58[(1'h1):(1'h0)]) >> wire48[(2'h2):(2'h2)]) : $unsigned(((|(reg59 ?
                      reg57 : wire48)) ?
                  $signed(wire50) : ($unsigned(wire50) ?
                      reg56[(3'h5):(1'h0)] : wire53[(4'he):(4'ha)])))))
            begin
              reg60 <= $signed((~&$signed(($unsigned(wire52) << (~&reg56)))));
              reg61 <= ($signed((((wire52 ? wire51 : wire47) << {(8'haf),
                          wire53}) ?
                      (wire54[(1'h1):(1'h1)] + ((8'hb1) | (8'hb9))) : wire51[(1'h1):(1'h0)])) ?
                  (wire48 ?
                      wire48[(1'h1):(1'h1)] : $signed((-(wire54 ?
                          reg56 : wire52)))) : wire54[(1'h0):(1'h0)]);
              reg62 <= reg61[(2'h2):(2'h2)];
              reg63 <= $unsigned({($unsigned($signed(reg60)) << {(+wire51),
                      $unsigned(reg57)}),
                  reg61});
            end
          else
            begin
              reg60 <= ({wire49[(4'hc):(4'h9)]} - wire54);
              reg61 <= $unsigned(reg63);
            end
          reg64 <= $signed(reg57[(3'h7):(3'h5)]);
          if ((8'ha0))
            begin
              reg65 <= $signed({($signed((reg59 << wire54)) ?
                      $unsigned(reg56) : reg59[(2'h3):(1'h0)])});
              reg66 <= $signed((wire52 <= (wire48[(2'h2):(1'h0)] ?
                  ((+reg63) ?
                      (wire47 ?
                          reg65 : reg57) : reg59[(1'h0):(1'h0)]) : {reg60})));
              reg67 <= $signed(wire48);
            end
          else
            begin
              reg65 <= reg60;
              reg66 <= $unsigned((7'h43));
              reg67 <= (($unsigned((wire55 <= {wire49,
                      (8'ha1)})) && $signed(({reg56, reg63} ?
                      (reg65 == reg58) : {reg65, wire52}))) ?
                  $signed((~(&(&reg56)))) : $signed({($signed(reg67) & (reg62 ?
                          wire48 : wire48))}));
              reg68 <= reg60[(1'h0):(1'h0)];
            end
        end
      else
        begin
          if (((!(((reg65 ? (8'hb6) : reg68) ?
              (reg65 | wire47) : (~wire50)) ~^ (wire50 == $unsigned(reg63)))) << ({(~$unsigned(wire51))} & $unsigned(reg68[(4'hd):(1'h1)]))))
            begin
              reg56 <= reg59;
              reg57 <= $unsigned({wire52});
              reg58 <= reg64;
              reg59 <= (wire49 ?
                  (|(^($unsigned(wire52) + $signed((7'h40))))) : (((|$signed(reg57)) ?
                      ((^reg60) << {wire48}) : $signed((+(8'hbc)))) - {(^~wire52[(3'h7):(3'h5)])}));
              reg60 <= ((7'h41) ?
                  reg58[(3'h5):(3'h4)] : ($signed({{reg64, reg65}}) ?
                      wire53 : $unsigned($unsigned($signed(wire53)))));
            end
          else
            begin
              reg56 <= reg65[(3'h7):(2'h2)];
              reg57 <= reg56[(3'h4):(1'h0)];
            end
          reg61 <= (&$unsigned(reg58[(3'h4):(1'h0)]));
          if (((reg68 ^ $unsigned((-(reg62 * reg63)))) < $unsigned(($signed({reg59}) && reg67))))
            begin
              reg62 <= (8'hb6);
            end
          else
            begin
              reg62 <= (&$signed((^~(^$unsigned((8'ha4))))));
              reg63 <= ((^(((reg56 ? wire52 : reg58) ?
                      (reg58 ? reg65 : wire49) : {reg58, reg62}) ^~ {(reg56 ?
                          wire50 : reg68),
                      $unsigned(wire47)})) ?
                  wire52[(4'hf):(3'h7)] : wire50);
              reg64 <= reg61[(1'h1):(1'h1)];
              reg65 <= reg59;
              reg66 <= {(reg62[(2'h2):(1'h0)] ?
                      wire54 : ($unsigned((wire48 ? reg61 : wire50)) < reg67)),
                  (reg58 ^ reg63[(5'h12):(5'h10)])};
            end
        end
      reg69 <= (wire53 | reg60[(4'hb):(4'ha)]);
      reg70 <= ($signed($unsigned(reg64[(1'h1):(1'h0)])) ?
          $signed(({(reg68 | wire53),
              $signed(reg63)} > ($unsigned(reg57) >= $signed(reg62)))) : ((&$unsigned((reg57 ?
                  wire53 : wire48))) ?
              (wire49 ?
                  ((reg64 ? (8'hbc) : reg62) != (8'hb0)) : ({wire54, wire51} ?
                      reg68 : (~^reg67))) : ($signed({wire47, wire55}) ?
                  (-$signed(wire48)) : {reg56[(1'h1):(1'h1)],
                      $signed(reg68)})));
    end
  assign wire71 = $signed(((((^~reg57) >> (^reg59)) ?
                          $unsigned((|(8'ha7))) : ((reg67 || reg61) ?
                              (&wire52) : (reg59 ? (8'ha9) : wire50))) ?
                      (((reg69 ? reg62 : (8'ha5)) ?
                          {reg68,
                              wire49} : reg63[(4'he):(4'hc)]) * $signed($unsigned((8'hbd)))) : $signed((+(^~(8'h9d))))));
  assign wire72 = $signed(reg63[(1'h0):(1'h0)]);
  assign wire73 = ((-(7'h43)) >>> ($unsigned($signed((~&reg59))) ?
                      (7'h41) : ({reg64, (8'hb5)} ?
                          ((-wire48) ?
                              (wire52 ^ wire71) : $signed(reg68)) : {reg63,
                              (8'ha0)})));
  assign wire74 = wire49;
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire [(5'h14):(1'h0)] wire33;
  wire [(3'h7):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hb):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire21 = $signed($unsigned((((wire16 ^ wire19) ?
                          (wire20 ~^ wire16) : $unsigned(wire20)) ?
                      {{(8'hb3), wire20},
                          wire18} : ($unsigned(wire18) <<< $unsigned(wire20)))));
  assign wire22 = $signed(wire19);
  assign wire23 = $signed((^wire22));
  assign wire24 = (wire20 ?
                      (~^(8'hbb)) : (wire20 ~^ $unsigned(wire18[(3'h7):(3'h7)])));
  assign wire25 = $unsigned((-$signed($signed((~|(8'had))))));
  assign wire26 = $unsigned((&(($unsigned(wire19) < (wire23 ?
                          wire23 : wire16)) ?
                      wire17[(1'h0):(1'h0)] : $signed(wire19))));
  assign wire27 = (^((^~(~{wire24, wire19})) > $signed(($signed(wire17) ?
                      ((8'ha8) ? wire17 : wire18) : $unsigned(wire26)))));
  assign wire28 = (wire23 != (^~{wire26}));
  assign wire29 = wire16[(4'hd):(3'h6)];
  always
    @(posedge clk) begin
      if (((-$unsigned({wire28})) ?
          ((+(7'h43)) ?
              $unsigned((((8'hac) ? (8'ha2) : wire20) ?
                  {wire27, wire20} : wire16)) : (wire17 & $signed((wire26 ?
                  (7'h44) : wire20)))) : (wire29[(1'h1):(1'h1)] > $signed(wire19[(4'hb):(4'h8)]))))
        begin
          reg30 <= {$signed((~$signed((wire22 ^ wire29))))};
          reg31 <= $unsigned((~|$unsigned(wire17[(2'h2):(1'h1)])));
          reg32 <= $unsigned((8'hb5));
        end
      else
        begin
          reg30 <= (~|$signed(wire29[(3'h5):(2'h3)]));
        end
    end
  assign wire33 = ((reg30[(1'h0):(1'h0)] == ((~&((7'h40) ? reg30 : reg30)) ?
                          $signed(reg30[(2'h3):(2'h3)]) : $signed($unsigned((8'hb0))))) ?
                      wire19[(3'h6):(3'h6)] : $unsigned($signed(wire28)));
  assign wire34 = (($unsigned($unsigned($unsigned(wire28))) ?
                      {($unsigned(wire33) || (-wire26)),
                          ($signed(reg32) * $unsigned(reg30))} : ($signed((~&wire23)) ?
                          $signed($unsigned(wire17)) : $signed((reg31 == wire20)))) != (~^(8'hac)));
  assign wire35 = ($signed($signed({(~|wire25)})) ?
                      $unsigned(($signed({wire21}) ?
                          (!$signed((8'ha9))) : wire20[(1'h1):(1'h0)])) : wire16);
  assign wire36 = (+{wire19, {$unsigned($unsigned(wire29))}});
  assign wire37 = (8'hb2);
  assign wire38 = ((+{((wire25 ?
                          wire17 : reg31) ^ $signed(wire26))}) ~^ (wire36[(4'h8):(3'h7)] ?
                      wire33 : {{wire19[(4'he):(3'h5)], wire37},
                          $signed($unsigned(reg30))}));
  assign wire39 = (~^$signed($unsigned($signed((wire16 ? wire28 : wire20)))));
  assign wire40 = wire16[(4'h9):(3'h5)];
  assign wire41 = wire34[(4'h9):(3'h6)];
endmodule
