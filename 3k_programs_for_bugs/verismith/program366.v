module top
#(parameter param97 = (^((((^~(7'h44)) >= ((8'hac) ? (8'hb8) : (8'had))) ? ((~(8'h9c)) && ((8'ha4) ? (8'haf) : (8'ha6))) : {{(8'ha8)}}) == ((^((8'hb8) && (8'hb4))) ? ({(8'hb1)} == ((8'hb1) + (8'hb1))) : {((8'ha7) ? (8'hb8) : (8'hb0)), (~(8'hbe))}))), 
parameter param98 = (((+((param97 << param97) >> (8'ha0))) ? ({(param97 ? param97 : param97)} << ((param97 ? param97 : param97) ? {param97} : (param97 ? param97 : param97))) : ((^~((8'hae) >>> param97)) < (^~(param97 ? param97 : param97)))) ? (|((~^(param97 ? param97 : param97)) ? (param97 | (~^param97)) : (param97 - (param97 != param97)))) : (~|(~|({param97, param97} ^~ (-param97))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire96, wire94, wire6, wire5, wire4, (1'h0)};
  assign wire4 = ($signed($unsigned($unsigned($signed(wire0)))) - {$signed(wire3[(4'hc):(3'h6)]),
                     wire0[(3'h6):(3'h4)]});
  assign wire5 = (8'hb1);
  assign wire6 = (8'hb0);
  module7 #() modinst95 (.wire9(wire4), .clk(clk), .wire11(wire5), .y(wire94), .wire10(wire0), .wire8(wire3));
  assign wire96 = {((wire0 - ((wire94 ?
                          wire0 : wire1) < ((8'h9d) == wire2))) <= wire94[(3'h6):(1'h0)])};
endmodule

module module7
#(parameter param92 = ((8'hb3) ? ((&(((8'hbd) ? (8'hae) : (8'hab)) < ((8'h9f) - (8'ha7)))) - (~&(8'hbf))) : ({{(&(8'hb3)), {(7'h41)}}, {((8'ha4) && (8'hbc))}} >= ({(8'haa), (~&(8'hb4))} ? ({(8'ha9)} << (&(8'ha0))) : {(8'hb0), ((8'hb8) ? (8'ha3) : (8'h9f))}))), 
parameter param93 = {param92, ((((param92 >> (8'hb8)) && param92) ? (~param92) : ((param92 >= param92) <= (param92 ? param92 : param92))) >>> (param92 ? ({param92, param92} < (param92 ? param92 : param92)) : param92))})
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h180):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire11;
  wire signed [(4'he):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire36;
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(3'h4):(1'h0)] reg85 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(3'h5):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  assign y = {wire82,
                 wire55,
                 wire38,
                 wire12,
                 wire36,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
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
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire12 = $signed(wire10);
  module13 #() modinst37 (wire36, clk, wire11, wire12, wire10, wire9, wire8);
  assign wire38 = $signed($signed(wire36));
  module39 #() modinst56 (wire55, clk, wire10, wire8, wire36, wire11);
  always
    @(posedge clk) begin
      reg57 <= {wire11};
      reg58 <= $signed((~^((wire38 ^~ {wire8}) ?
          ((!wire12) >>> $signed(wire9)) : $signed((!wire9)))));
      if (($unsigned(($unsigned(wire36[(1'h1):(1'h1)]) + (!((8'ha9) ?
          wire10 : wire55)))) == $unsigned((~|(~|wire55[(2'h3):(1'h0)])))))
        begin
          if ($signed(wire55))
            begin
              reg59 <= (($signed($signed((wire55 ?
                      wire11 : wire9))) * (-(wire12[(3'h7):(3'h5)] >>> (wire12 ~^ wire8)))) ?
                  (wire8 == $signed((wire11[(3'h6):(2'h2)] ?
                      (^wire9) : $signed(wire38)))) : $unsigned(wire38));
              reg60 <= wire10[(5'h14):(4'he)];
              reg61 <= $signed($signed(((wire12[(1'h0):(1'h0)] ?
                  (~wire9) : (wire9 >> wire11)) + $signed((wire12 == wire10)))));
              reg62 <= ((~($signed(((8'ha7) <<< wire36)) ?
                  wire10[(5'h13):(2'h3)] : {(^~wire8),
                      reg59[(3'h4):(1'h0)]})) ^ $unsigned(((reg59[(1'h0):(1'h0)] != wire12) >= reg58[(4'h9):(4'h8)])));
              reg63 <= wire36;
            end
          else
            begin
              reg59 <= ({($unsigned($signed(reg59)) ?
                      {$signed(wire12),
                          $signed(wire38)} : (!$unsigned(reg57)))} || $unsigned($signed(((!wire10) ~^ (wire9 ?
                  reg63 : wire8)))));
              reg60 <= (^reg60);
              reg61 <= $signed(((reg60[(3'h4):(2'h3)] == $unsigned(wire9)) ?
                  {$signed(wire9[(3'h7):(3'h4)])} : reg58[(3'h4):(1'h0)]));
              reg62 <= ((^$signed({(~^reg57)})) ?
                  $unsigned($signed({(wire12 <<< wire36),
                      (+wire10)})) : wire12);
              reg63 <= reg59[(1'h0):(1'h0)];
            end
          reg64 <= $unsigned($signed(reg62));
          reg65 <= $unsigned((((8'ha2) ~^ reg60) < wire11[(2'h3):(1'h0)]));
        end
      else
        begin
          reg59 <= {wire10[(4'hf):(3'h4)]};
          if (((wire38[(5'h12):(5'h12)] ?
                  (((!reg61) ^ (reg62 ? (8'ha3) : (8'ha1))) ?
                      $unsigned((reg62 ?
                          reg60 : (8'hb3))) : wire10) : (wire55 ^ ((|wire38) >> $signed(reg62)))) ?
              reg65 : reg58))
            begin
              reg60 <= ((wire9 ?
                  ($unsigned($unsigned(wire11)) != reg64) : ($unsigned(wire38[(5'h12):(4'ha)]) ^~ reg57)) > (({reg59[(3'h5):(2'h3)],
                  ((8'h9c) ?
                      reg57 : reg62)} << reg57[(4'h9):(4'h8)]) | ((8'hb6) ?
                  reg58[(4'hb):(3'h7)] : ((^~wire38) <<< $signed(wire10)))));
            end
          else
            begin
              reg60 <= $signed({wire10});
              reg61 <= $unsigned((~^wire8));
            end
          reg62 <= wire10;
          reg63 <= $signed(reg60[(4'ha):(3'h7)]);
        end
      reg66 <= reg63[(1'h1):(1'h0)];
      if (reg64[(1'h1):(1'h0)])
        begin
          if ($unsigned($signed((((8'hb9) ?
                  $unsigned(wire38) : reg61[(3'h5):(3'h4)]) ?
              (-(^~reg61)) : {(~&wire9), (^~wire12)}))))
            begin
              reg67 <= $unsigned((!($unsigned($signed(wire8)) ?
                  reg61 : $signed($signed(reg59)))));
              reg68 <= {((~|((reg63 ?
                          wire36 : wire55) >= reg62[(2'h2):(1'h0)])) ?
                      (8'h9e) : reg62),
                  reg67[(3'h4):(2'h3)]};
            end
          else
            begin
              reg67 <= (~&(!(($unsigned((8'ha4)) ?
                  (&reg59) : (~&reg62)) <<< (^~$signed(wire9)))));
              reg68 <= reg66;
              reg69 <= (($unsigned(reg65[(3'h4):(1'h0)]) ?
                  $unsigned((~^$unsigned(wire38))) : wire12[(2'h2):(2'h2)]) < (($unsigned(reg59) ?
                      $signed(wire8) : reg58) ?
                  (&reg58[(4'hf):(4'hf)]) : reg63));
              reg70 <= reg63[(2'h3):(1'h0)];
              reg71 <= ((~|((!(reg58 << reg62)) ?
                      ($unsigned(wire38) ^ reg64) : (|(8'hbd)))) ?
                  (((!wire11[(3'h4):(3'h4)]) ?
                      $signed({wire8}) : {$unsigned(wire9)}) >= ((+(&reg66)) >= reg57[(3'h6):(3'h4)])) : $signed(reg60[(4'hc):(4'ha)]));
            end
          if ($unsigned(reg66))
            begin
              reg72 <= reg59[(3'h5):(3'h5)];
            end
          else
            begin
              reg72 <= reg58[(3'h7):(1'h1)];
              reg73 <= reg62[(1'h1):(1'h1)];
            end
          if (((wire36[(5'h11):(4'h9)] < $unsigned(wire12[(3'h5):(3'h4)])) + ({reg57,
              $signed(reg72)} <<< wire10[(2'h3):(2'h3)])))
            begin
              reg74 <= {wire11};
              reg75 <= reg71;
              reg76 <= ($unsigned((~({reg68} >> (reg68 ? wire11 : reg65)))) ?
                  $unsigned((($unsigned(reg57) <<< (reg72 ? wire55 : wire12)) ?
                      {(wire8 && reg58),
                          $unsigned((8'ha7))} : $signed($unsigned(reg75)))) : {$unsigned((!reg67)),
                      {(8'ha3), reg70}});
              reg77 <= ((8'ha1) > $signed($signed(((wire11 ?
                  reg61 : (8'hbb)) >= (reg69 ? reg61 : wire55)))));
            end
          else
            begin
              reg74 <= (($signed((reg77[(1'h0):(1'h0)] ?
                      wire10[(2'h3):(2'h2)] : (reg61 ? (8'hb0) : (8'hb8)))) ?
                  $signed(reg64) : reg71[(1'h1):(1'h1)]) ^~ $signed(((7'h44) ?
                  ($unsigned(reg66) ?
                      $signed(reg77) : ((8'hbf) & reg69)) : ((~&reg60) >= reg77))));
              reg75 <= ({reg70[(4'hc):(3'h4)],
                      ({$unsigned((8'ha6)), (wire55 ? reg76 : reg70)} ?
                          reg69[(2'h2):(1'h1)] : reg66)} ?
                  reg57[(3'h6):(1'h1)] : {reg74[(1'h0):(1'h0)]});
              reg76 <= (wire9 ?
                  reg74[(2'h3):(2'h3)] : $unsigned($unsigned($signed(reg76[(3'h4):(1'h1)]))));
              reg77 <= (wire8[(4'hc):(4'hb)] ? reg62 : reg63[(4'hd):(4'h8)]);
            end
          if (wire12)
            begin
              reg78 <= reg63[(3'h6):(3'h6)];
              reg79 <= {reg59,
                  $signed((-($signed(reg60) && reg75[(2'h2):(1'h1)])))};
            end
          else
            begin
              reg78 <= wire38;
              reg79 <= ((((wire36 ?
                      reg63 : $signed(reg60)) * wire36[(4'h9):(1'h0)]) ?
                  (~|((8'ha8) ?
                      $unsigned(reg66) : (wire38 ?
                          (8'hb2) : (8'hae)))) : $unsigned($unsigned($unsigned(reg58)))) || reg76[(4'hd):(4'h8)]);
              reg80 <= ($unsigned((wire10[(4'he):(1'h0)] ?
                  (~(reg73 ? reg66 : (8'hb8))) : {reg60,
                      {(8'hb8), reg66}})) && reg78);
              reg81 <= (reg72[(1'h1):(1'h1)] ? reg65[(1'h1):(1'h0)] : reg74);
            end
        end
      else
        begin
          reg67 <= $signed((^{reg69,
              (reg59 ? $unsigned(wire8) : (reg57 ^~ reg81))}));
          if (reg78[(1'h0):(1'h0)])
            begin
              reg68 <= $unsigned(wire9[(1'h0):(1'h0)]);
            end
          else
            begin
              reg68 <= ($unsigned((reg62[(2'h3):(1'h1)] - wire10)) ?
                  $unsigned(reg81[(2'h2):(2'h2)]) : reg62[(3'h4):(1'h0)]);
              reg69 <= ((((8'hb2) && {wire12[(1'h0):(1'h0)],
                  (reg81 && (8'ha1))}) && $signed(((reg80 >= reg61) ^~ (+reg74)))) * $unsigned($unsigned(reg63[(5'h10):(5'h10)])));
              reg70 <= ($unsigned({$unsigned(((8'hb7) * (8'hb5)))}) ?
                  $unsigned((~^reg65[(3'h4):(2'h2)])) : $signed($signed(reg57)));
              reg71 <= ((-$unsigned($unsigned(reg65))) ^ $signed((~^($unsigned((8'hb4)) <<< (reg66 < reg63)))));
              reg72 <= $signed(reg66);
            end
          reg73 <= $signed((&reg70));
          reg74 <= $signed((wire12[(2'h2):(1'h0)] ?
              reg57[(2'h2):(2'h2)] : (-wire55[(1'h0):(1'h0)])));
          reg75 <= (-$signed(reg69[(1'h0):(1'h0)]));
        end
    end
  assign wire82 = (~^(((reg61[(2'h3):(2'h3)] ? (-(8'hb1)) : (8'h9f)) ?
                          reg76 : ($unsigned(reg62) ?
                              reg78 : (reg67 <= reg61))) ?
                      $signed($signed($unsigned(reg66))) : (((reg58 ?
                                  wire9 : reg78) ?
                              (wire36 ~^ (8'hb8)) : $signed(wire8)) ?
                          reg57 : ((reg79 << reg64) ?
                              $signed(reg59) : (wire38 && wire36)))));
  always
    @(posedge clk) begin
      if ((reg74[(3'h4):(1'h0)] - ((7'h42) ?
          $signed($unsigned($signed((7'h42)))) : reg58)))
        begin
          if ($unsigned((reg58[(4'hd):(4'h9)] ?
              (((reg80 && wire11) ?
                  wire12 : ((8'ha4) ?
                      (8'hbf) : reg65)) == ($signed((8'ha3)) >= $unsigned(wire38))) : (~&wire11))))
            begin
              reg83 <= $signed($signed((((reg63 <<< reg76) ?
                  wire9[(5'h13):(3'h7)] : {reg69,
                      reg80}) > (reg69[(1'h1):(1'h0)] ?
                  ((8'ha5) * reg65) : (^wire10)))));
              reg84 <= (&reg66[(4'h8):(1'h1)]);
              reg85 <= (~|(reg81[(1'h0):(1'h0)] ?
                  (reg59 ?
                      reg84 : reg81[(2'h2):(1'h1)]) : $unsigned($unsigned(reg64[(2'h2):(2'h2)]))));
              reg86 <= (~|({{$signed(reg59)}} ?
                  $signed({{(7'h44)}}) : $unsigned(wire12[(3'h6):(3'h4)])));
            end
          else
            begin
              reg83 <= wire10[(4'ha):(3'h5)];
              reg84 <= $unsigned((~^(reg86[(4'hd):(4'h9)] - $signed(((8'h9f) >= reg85)))));
              reg85 <= $unsigned(reg75);
              reg86 <= reg78[(2'h2):(1'h1)];
              reg87 <= $unsigned((reg61[(2'h2):(1'h0)] ?
                  $signed((~{wire11, wire11})) : reg59[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          reg83 <= $signed(wire12);
        end
      reg88 <= $unsigned(reg79[(2'h2):(1'h0)]);
      reg89 <= $signed($signed((reg72[(1'h1):(1'h1)] ~^ ({reg65, (8'ha7)} ?
          reg75[(1'h0):(1'h0)] : (reg74 ? reg72 : reg85)))));
      reg90 <= reg75;
      reg91 <= (^~$unsigned(((reg62 ?
          ((7'h43) * wire12) : reg79[(3'h6):(3'h6)]) || reg88[(3'h4):(1'h0)])));
    end
endmodule

module module39
#(parameter param53 = {((^~(8'hb1)) ? (|(!(~(8'had)))) : ({((8'h9e) < (8'hab))} ? {{(8'hba)}} : {(~&(8'hb6))})), ((~(((8'hb5) >= (8'ha7)) ? (~|(8'hb8)) : {(8'hbc), (8'h9f)})) >= ((-((8'hb3) ? (8'hbe) : (8'hab))) ? (&((8'ha9) ? (8'hb4) : (8'ha7))) : (|((8'had) ~^ (8'ha7)))))}, 
parameter param54 = (|(!param53)))
(y, clk, wire43, wire42, wire41, wire40);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire43;
  input wire [(4'hb):(1'h0)] wire42;
  input wire [(4'he):(1'h0)] wire41;
  input wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire44 = wire43[(3'h7):(3'h7)];
  assign wire45 = wire44[(2'h2):(2'h2)];
  assign wire46 = $signed({wire41, $signed((8'ha1))});
  assign wire47 = wire41[(3'h4):(3'h4)];
  assign wire48 = $signed(({wire44[(4'hb):(4'hb)]} + $unsigned($unsigned(((7'h40) ?
                      wire43 : wire46)))));
  assign wire49 = (|wire42);
  assign wire50 = {wire44, $signed(((7'h41) || wire40))};
  always
    @(posedge clk) begin
      reg51 <= $unsigned((wire47 ? wire46 : $unsigned((^~$signed(wire44)))));
      reg52 <= $unsigned(wire42[(2'h3):(2'h2)]);
    end
endmodule

module module13
#(parameter param35 = ({({(~|(7'h44))} ~^ (((8'hb5) ? (8'haf) : (8'h9d)) ? ((8'hbe) * (8'haf)) : ((8'hac) ? (8'hb5) : (8'hbc))))} ? ((((^(8'hb1)) ? ((8'hbc) || (8'hb2)) : ((8'hbb) ? (8'h9f) : (7'h40))) ? (^(~^(7'h42))) : (~|{(8'hb1), (8'hb3)})) <<< (~|(((8'ha1) ~^ (8'hba)) ? ((8'had) - (8'hbf)) : ((8'hb2) ? (8'hb6) : (8'hbd))))) : (^~((((8'hb1) > (8'hb9)) ? {(7'h40), (8'hbc)} : (&(8'hb2))) ? ((8'h9c) ? ((8'ha1) ? (7'h43) : (8'ha9)) : {(8'h9c)}) : (+((8'hab) ? (8'hac) : (8'hb1)))))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(2'h2):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire15;
  input wire [(3'h6):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire signed [(4'h9):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg26,
                 (1'h0)};
  assign wire19 = wire14;
  assign wire20 = wire16[(5'h10):(5'h10)];
  assign wire21 = (~|(wire16[(5'h11):(3'h7)] ^ ($unsigned($signed(wire14)) >>> ($signed(wire17) > wire19))));
  assign wire22 = $signed((8'ha3));
  assign wire23 = wire22;
  assign wire24 = wire15;
  assign wire25 = ({$signed(($unsigned(wire14) ? wire15 : {wire21}))} ?
                      (8'hbc) : $unsigned($signed(((8'ha4) ?
                          $signed(wire19) : wire18[(4'hb):(2'h2)]))));
  always
    @(posedge clk) begin
      reg26 <= wire21;
    end
  assign wire27 = $unsigned(wire14);
  assign wire28 = ((^~$unsigned(wire20[(5'h12):(4'hc)])) ?
                      $unsigned($unsigned($signed(wire23))) : wire16);
  assign wire29 = (~wire18);
  assign wire30 = wire16;
  assign wire31 = (8'hac);
  assign wire32 = wire17[(1'h0):(1'h0)];
  assign wire33 = wire14[(3'h4):(3'h4)];
  assign wire34 = {$signed((&(+wire16)))};
endmodule
