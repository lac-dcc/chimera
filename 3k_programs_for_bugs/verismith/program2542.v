module top
#(parameter param97 = (&(!({{(8'h9d), (8'hb3)}, {(7'h43), (8'hbf)}} ^ (((8'hba) == (8'hba)) ? {(8'h9f)} : {(8'hb8), (8'haf)})))), 
parameter param98 = ((8'h9d) ? ((((~|param97) ? {param97} : (param97 || param97)) ? ((param97 + param97) * param97) : ({param97, (8'ha1)} >= param97)) << (&(~&{param97}))) : param97))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(2'h3):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire53;
  reg signed [(4'hd):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
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
                 (1'h0)};
  module5 #() modinst54 (.wire7(wire2), .wire8(wire1), .wire10(wire4), .clk(clk), .y(wire53), .wire9(wire3), .wire6(wire0));
  assign wire55 = {$unsigned((~|wire2)),
                      $signed((wire2 && wire2[(3'h4):(1'h1)]))};
  assign wire56 = $unsigned((~&$signed($unsigned($unsigned(wire55)))));
  assign wire57 = wire56[(1'h1):(1'h1)];
  assign wire58 = $unsigned(($signed($unsigned($signed(wire55))) == $signed((~&{wire55,
                      (8'hb5)}))));
  always
    @(posedge clk) begin
      reg59 <= (wire0 >= (-((wire2[(1'h0):(1'h0)] ? wire0 : (7'h44)) ?
          ((wire53 > wire0) - (wire4 ? (8'hb0) : wire57)) : ((-wire57) ?
              $unsigned(wire57) : $signed((8'ha7))))));
      reg60 <= (7'h44);
      if ({wire53[(3'h7):(1'h0)], wire58})
        begin
          if ((wire1 ? wire56 : $signed(wire4[(4'hb):(3'h5)])))
            begin
              reg61 <= $unsigned(wire3);
              reg62 <= (wire56[(2'h2):(1'h1)] && wire3[(3'h7):(3'h5)]);
              reg63 <= $unsigned((|reg59));
              reg64 <= $unsigned($signed(wire58[(4'hb):(1'h1)]));
            end
          else
            begin
              reg61 <= $signed({({reg60} ? $unsigned((8'h9f)) : wire55),
                  (($signed(reg64) ?
                      wire58 : (-wire56)) ^ $signed((|wire55)))});
              reg62 <= ($unsigned(((8'hb6) ?
                  (wire58 ? $signed(wire57) : wire3) : ($signed((8'haa)) ?
                      wire3[(1'h0):(1'h0)] : (wire55 ?
                          wire4 : (8'hac))))) >> {$signed(wire56),
                  {(!(reg59 != reg61)), ((wire0 ^~ reg62) ^~ {reg60, wire4})}});
              reg63 <= {reg61[(3'h4):(2'h3)]};
              reg64 <= {wire55};
            end
          if (wire4)
            begin
              reg65 <= ($signed(reg59[(1'h0):(1'h0)]) | wire3);
              reg66 <= $unsigned(wire53);
              reg67 <= reg64[(2'h2):(1'h1)];
              reg68 <= ((reg59[(2'h3):(2'h2)] >>> (+$unsigned(reg59))) + (&((~$unsigned((8'hbf))) | wire3)));
              reg69 <= (wire0[(5'h11):(4'ha)] >>> reg62);
            end
          else
            begin
              reg65 <= (~{$unsigned(reg67[(2'h3):(2'h3)])});
              reg66 <= (($unsigned($signed((wire55 == wire4))) ?
                      $signed((~|wire56[(1'h1):(1'h0)])) : (&(8'hb0))) ?
                  $unsigned((|wire57)) : $unsigned($signed((^~(wire55 ?
                      reg65 : reg67)))));
              reg67 <= reg63[(3'h5):(2'h2)];
              reg68 <= {((($unsigned((8'h9d)) ?
                      (wire58 ? wire55 : wire4) : {(7'h42),
                          wire56}) <<< ($signed(reg61) ?
                      $signed(reg63) : ((8'ha6) ^ wire3))) >> ((wire3[(4'ha):(1'h1)] ?
                          (-wire0) : (wire55 ? (8'haf) : reg61)) ?
                      $signed((!wire58)) : reg62))};
            end
        end
      else
        begin
          reg61 <= reg66;
          if (((|((8'hac) ? reg65[(4'hf):(2'h3)] : $signed(wire57))) < reg61))
            begin
              reg62 <= ($unsigned(($signed($signed(reg67)) == {$unsigned(reg62)})) ?
                  wire57 : $signed($unsigned(wire2[(3'h6):(3'h5)])));
              reg63 <= wire56[(4'h8):(3'h6)];
            end
          else
            begin
              reg62 <= (wire0 ?
                  $unsigned(($unsigned((~^reg66)) + $signed($unsigned(reg64)))) : (^{{$signed((8'hbc))}}));
              reg63 <= (8'hbc);
              reg64 <= $signed({$signed((((8'hb3) + reg60) + $signed(reg69))),
                  wire56[(4'ha):(2'h2)]});
            end
        end
      reg70 <= ((wire4[(5'h10):(4'h9)] ?
              ($signed(reg60[(4'h8):(3'h4)]) ?
                  $signed((|(8'hbd))) : $unsigned((~^wire4))) : $signed((^(~&wire56)))) ?
          $unsigned(((wire57 >> (^wire53)) >= (~|(reg63 && reg62)))) : (wire56 ?
              ($unsigned($signed(reg69)) ?
                  $signed(wire56) : ($unsigned(wire53) == ((8'ha4) ?
                      reg67 : reg61))) : (wire1[(3'h4):(2'h2)] ?
                  wire56 : reg62[(3'h5):(3'h4)])));
      reg71 <= $signed(((wire53[(4'hc):(4'h9)] ?
          $signed((wire4 ^ reg70)) : (^reg64)) + ($signed($signed(reg61)) ^~ (|reg69))));
    end
  assign wire72 = reg60;
  assign wire73 = $signed(wire58);
  assign wire74 = $unsigned(wire3);
  assign wire75 = reg68;
  always
    @(posedge clk) begin
      reg76 <= (wire3 ?
          (+(reg61 ?
              {reg63} : ((wire3 ?
                  wire1 : wire3) && (wire55 != wire53)))) : ((($unsigned(wire74) ?
                      {wire74} : ((8'ha3) ? (8'ha4) : wire2)) ?
                  wire57[(2'h2):(1'h1)] : $signed((^reg66))) ?
              (~(~&(wire75 ~^ (8'hb7)))) : $unsigned(wire4[(5'h11):(2'h3)])));
      reg77 <= $unsigned(wire74[(4'h8):(3'h7)]);
      if ((reg68[(3'h5):(3'h4)] >> wire57))
        begin
          reg78 <= $signed(($signed(wire74[(2'h2):(2'h2)]) >>> reg62));
        end
      else
        begin
          reg78 <= wire56[(3'h4):(3'h4)];
          reg79 <= wire74[(4'h8):(2'h3)];
          reg80 <= ((reg71[(4'h9):(2'h3)] && $signed($signed((wire2 ?
                  reg70 : wire73)))) ?
              (~^(-$unsigned((reg69 & wire56)))) : (~($signed(reg77[(4'h8):(3'h4)]) ?
                  reg65[(2'h3):(2'h3)] : reg62)));
          reg81 <= reg68;
          reg82 <= reg60[(4'he):(4'h8)];
        end
      reg83 <= $unsigned((wire0[(4'h9):(3'h5)] ?
          $signed(((reg68 ?
              reg62 : (8'hbb)) & (reg79 & reg69))) : ((reg67[(2'h2):(1'h1)] ?
              $unsigned((8'ha8)) : $signed(wire56)) <<< $signed($unsigned((7'h44))))));
      reg84 <= wire56[(4'h9):(4'h8)];
    end
  assign wire85 = (-(|reg64));
  assign wire86 = $signed($signed($signed($signed((reg60 ?
                      wire74 : (8'hb6))))));
  assign wire87 = $unsigned(reg62);
  always
    @(posedge clk) begin
      if ($signed(reg82))
        begin
          if ($unsigned(reg59[(1'h0):(1'h0)]))
            begin
              reg88 <= {$unsigned($signed(((reg70 - reg77) | $signed((8'hbd)))))};
              reg89 <= (8'ha5);
            end
          else
            begin
              reg88 <= wire73[(1'h1):(1'h1)];
              reg89 <= reg67[(4'he):(2'h2)];
              reg90 <= ((($signed($unsigned(wire2)) ?
                      (!$unsigned(wire1)) : $signed(((8'ha0) && wire55))) ^ (~$signed(reg78[(3'h4):(1'h0)]))) ?
                  reg69[(4'hd):(3'h7)] : {$unsigned(($unsigned(reg77) >> reg83))});
            end
          if ($unsigned($unsigned(wire55[(1'h0):(1'h0)])))
            begin
              reg91 <= {reg59[(1'h0):(1'h0)]};
            end
          else
            begin
              reg91 <= ({$unsigned($unsigned((8'hab)))} ?
                  (~(reg80 <= reg63)) : wire72[(1'h1):(1'h0)]);
              reg92 <= ($unsigned(reg80[(4'hd):(3'h6)]) ~^ ((reg78 ?
                  ($unsigned(wire74) - wire53[(1'h0):(1'h0)]) : wire4[(4'hf):(3'h7)]) + reg82[(1'h1):(1'h1)]));
              reg93 <= reg71;
              reg94 <= $signed({reg78[(2'h3):(2'h3)]});
              reg95 <= ($signed(((-(wire2 <= reg71)) ?
                      wire87[(4'h9):(4'h8)] : reg63)) ?
                  {($signed(reg65[(4'h9):(2'h3)]) ?
                          ($unsigned((8'haa)) >>> ((8'ha6) <= (8'ha9))) : ((~^reg66) << (reg62 != reg91)))} : $signed({{(^~reg83)},
                      (~^$signed((8'hb2)))}));
            end
        end
      else
        begin
          reg88 <= (reg77[(4'ha):(3'h5)] <<< (~^$unsigned({{reg64},
              $unsigned(reg71)})));
          reg89 <= (($unsigned($signed($signed(wire86))) + {{$signed(reg94),
                      (8'ha0)}}) ?
              $signed($signed($unsigned((wire72 ?
                  wire56 : (8'hb2))))) : (reg81 > reg66));
          reg90 <= wire58;
        end
      reg96 <= wire1[(3'h4):(1'h0)];
    end
endmodule

module module5
#(parameter param51 = ({(((+(8'hb5)) * (&(8'haa))) ^ (((8'ha7) < (8'hbc)) ? (~|(8'hb2)) : ((8'ha1) - (8'hbf))))} & ((^(((8'ha5) >> (8'hb0)) & (~|(8'ha2)))) <= ({((8'h9c) ? (8'ha4) : (8'haf))} ? (-(~&(8'ha6))) : ({(8'ha0)} + ((8'ha2) & (8'ha5)))))), 
parameter param52 = ({(param51 ? ((param51 <= param51) ? (~|(7'h44)) : param51) : ((~param51) >= (param51 ? param51 : param51)))} ? (param51 ? {(((8'h9d) ? param51 : param51) ? (^param51) : (param51 ~^ (7'h41))), param51} : param51) : (({(param51 ? (8'hba) : param51), (param51 ~^ (8'h9d))} << (((8'hb2) ? param51 : param51) ? (+param51) : (param51 > param51))) ? (~&param51) : (^param51))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h51):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  assign y = {wire49,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg17,
                 (1'h0)};
  assign wire11 = wire10[(4'h8):(2'h3)];
  assign wire12 = ({wire6[(5'h12):(4'he)]} - wire6);
  assign wire13 = (^wire11[(3'h6):(3'h5)]);
  assign wire14 = (wire13 < $signed(wire13[(4'h9):(3'h5)]));
  assign wire15 = (({$signed($unsigned((8'ha6))),
                          ($signed(wire7) ?
                              $unsigned(wire12) : $unsigned(wire8))} << wire8[(4'h9):(3'h5)]) ?
                      $signed(wire12) : {$signed(wire12)});
  assign wire16 = $unsigned(((~&($signed(wire9) * (wire7 ?
                      wire9 : wire12))) & ((7'h42) ?
                      $signed($unsigned(wire11)) : wire13[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg17 <= wire15;
    end
  module18 #() modinst50 (.wire20(wire8), .wire21(wire9), .wire19(wire10), .clk(clk), .wire22(wire12), .y(wire49));
endmodule

module module18
#(parameter param48 = ((~{(+(~(8'ha2)))}) ^~ (((~((8'hbe) ? (8'had) : (8'hb4))) ? ((+(8'hbc)) <<< (~(8'ha1))) : (((8'ha8) ^~ (8'ha5)) <= ((8'hbc) ? (8'had) : (8'hb6)))) >>> (({(8'hb9), (7'h42)} ? ((8'ha3) << (8'ha0)) : (-(7'h40))) ? ((~(8'haa)) < ((8'had) ? (8'hab) : (8'ha5))) : (((7'h44) >>> (8'ha8)) - ((7'h44) & (8'h9d)))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire22;
  input wire [(4'he):(1'h0)] wire21;
  input wire [(4'hb):(1'h0)] wire20;
  input wire [(4'he):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire [(4'hb):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire signed [(4'hf):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'ha):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire24,
                 wire23,
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
                 reg25,
                 (1'h0)};
  assign wire23 = (^~wire22[(3'h5):(1'h0)]);
  assign wire24 = wire21[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg25 <= {{(|(!$unsigned((8'haf)))), (|wire24)},
          ((8'h9f) ? (^$signed(wire21)) : (|wire20))};
      reg26 <= (!$signed(reg25));
      reg27 <= $unsigned(((~&wire22[(1'h1):(1'h1)]) * {(wire22[(3'h5):(3'h5)] ?
              $unsigned((8'h9f)) : wire21[(3'h6):(2'h2)])}));
      reg28 <= ($signed(wire21) > ({(~|(wire23 ? reg26 : wire21))} ?
          ((wire22[(3'h5):(2'h3)] ?
              wire22[(2'h2):(1'h1)] : {reg25}) <= (^~(wire22 || wire20))) : wire20));
    end
  always
    @(posedge clk) begin
      reg29 <= (((^~(!(8'ha8))) - {$signed((wire22 ?
              wire23 : (8'hbb)))}) - $unsigned(wire24));
      reg30 <= wire20[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg31 <= ((!{($signed(reg25) == {reg28, wire20})}) ?
          $unsigned((reg28 ~^ ($unsigned(wire24) ^ $unsigned(wire21)))) : ((^{((8'ha5) ?
                  reg26 : wire22)}) && wire19[(1'h1):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg32 <= reg26[(4'h9):(2'h3)];
      reg33 <= (+$unsigned($unsigned(((reg32 >= wire21) ^~ (reg28 ?
          reg29 : reg29)))));
      reg34 <= $signed(($signed(($unsigned((8'hac)) ?
          $signed((8'hb7)) : reg28)) <= $unsigned((!(+reg30)))));
      if (wire19[(3'h4):(3'h4)])
        begin
          reg35 <= (~&$signed((~(&(reg32 ? (8'hb0) : wire22)))));
          if (reg33[(3'h6):(2'h2)])
            begin
              reg36 <= $unsigned($signed($signed($unsigned($signed(wire21)))));
              reg37 <= reg30;
              reg38 <= wire20[(2'h2):(2'h2)];
            end
          else
            begin
              reg36 <= ($unsigned((($unsigned(reg35) ?
                  $signed(reg31) : (~^reg32)) <= reg25[(1'h0):(1'h0)])) * (((((8'hbb) ?
                  (8'ha0) : (8'had)) != (wire21 ?
                  reg34 : wire24)) && (|$unsigned(reg28))) <= reg36[(3'h5):(3'h5)]));
              reg37 <= ((~&$unsigned($signed((~^wire24)))) ?
                  reg37[(2'h3):(1'h1)] : $unsigned($unsigned($signed((~|(8'hbe))))));
            end
        end
      else
        begin
          if (($unsigned($signed($signed(reg34[(1'h0):(1'h0)]))) ?
              (^(~|wire20[(1'h1):(1'h0)])) : reg29))
            begin
              reg35 <= reg35[(1'h0):(1'h0)];
              reg36 <= reg32[(3'h5):(1'h0)];
            end
          else
            begin
              reg35 <= (^~reg38[(1'h0):(1'h0)]);
              reg36 <= reg33[(2'h2):(1'h1)];
            end
        end
    end
  assign wire39 = (reg30 ?
                      (reg37 ~^ wire22[(3'h6):(1'h0)]) : ((($unsigned(reg34) ^ ((8'hb7) ?
                                  (8'hbb) : wire22)) ?
                              $signed((reg26 ?
                                  reg33 : (8'hb4))) : (^~$signed(wire21))) ?
                          {((reg34 ^ reg29) ?
                                  {(8'ha7)} : {reg34, wire22})} : (+({reg36} ?
                              $unsigned(reg25) : $unsigned((8'ha6))))));
  assign wire40 = reg36;
  assign wire41 = reg34;
  assign wire42 = $unsigned(reg32);
  assign wire43 = (($signed($signed(reg33[(2'h2):(2'h2)])) ?
                          $unsigned({$unsigned(reg37)}) : $unsigned((!$signed(reg28)))) ?
                      ((~$unsigned({wire19, (8'haa)})) ?
                          reg27 : $signed($unsigned((wire42 != reg33)))) : $unsigned(wire23[(1'h0):(1'h0)]));
  assign wire44 = $signed((^(-$signed(((7'h44) ? reg38 : reg36)))));
  assign wire45 = $signed((|$unsigned($unsigned((8'hbc)))));
  assign wire46 = reg32[(2'h3):(2'h3)];
  assign wire47 = $unsigned(($signed(wire40[(4'ha):(3'h6)]) ?
                      (^~(~^$unsigned((8'hb1)))) : $unsigned($unsigned((wire46 <= reg34)))));
endmodule
