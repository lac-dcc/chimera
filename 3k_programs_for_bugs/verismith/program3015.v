module top
#(parameter param96 = (8'hbe), 
parameter param97 = (8'hb8))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire4;
  assign y = {wire94, wire8, wire7, wire6, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire3[(2'h3):(2'h3)]);
  assign wire5 = wire3[(3'h4):(2'h3)];
  assign wire6 = {(($unsigned(wire4) ? wire2 : $unsigned((wire0 + wire2))) ?
                         (^wire4) : wire3)};
  assign wire7 = (($unsigned(wire3[(3'h4):(3'h4)]) ?
                     wire5[(4'h9):(3'h4)] : ((-(wire1 || wire0)) ?
                         (wire2 ?
                             wire1[(4'h8):(3'h7)] : $unsigned(wire0)) : $signed((!wire3)))) > $signed((($unsigned(wire2) ?
                         (wire2 ? wire6 : (8'h9c)) : {(8'ha8)}) ?
                     ($unsigned(wire6) ?
                         (~wire4) : wire3[(3'h7):(3'h4)]) : wire5)));
  assign wire8 = wire6;
  module9 #() modinst95 (wire94, clk, wire3, wire2, wire4, wire6);
endmodule

module module9
#(parameter param93 = (^{(~(8'hb5))}))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(3'h6):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire89;
  assign y = {wire92,
                 wire91,
                 wire47,
                 wire14,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire89,
                 (1'h0)};
  assign wire14 = wire10[(1'h0):(1'h0)];
  module15 #() modinst48 (wire47, clk, wire10, wire12, wire13, wire11, wire14);
  assign wire49 = (((^(~&((7'h42) ^~ wire47))) | {{(8'ha4)},
                          $unsigned({wire12, wire10})}) ?
                      ($signed(((wire47 ? wire11 : wire11) ?
                          (wire12 <= wire11) : $unsigned((8'hb4)))) << (wire11 ?
                          (-wire10[(3'h4):(1'h1)]) : $signed((8'hbe)))) : {wire14[(3'h6):(3'h5)]});
  assign wire50 = wire10;
  assign wire51 = (($signed(($unsigned(wire12) ?
                      (~|wire12) : wire11[(1'h1):(1'h0)])) == ($signed(wire49) ?
                      wire11[(4'hb):(3'h5)] : ((wire12 ? wire50 : wire10) ?
                          (8'hbc) : $signed(wire10)))) < $unsigned($signed(($unsigned(wire50) >>> wire50))));
  assign wire52 = {wire14, $signed(wire10[(2'h2):(1'h0)])};
  module53 #() modinst90 (.wire55(wire52), .wire57(wire11), .y(wire89), .wire54(wire12), .wire56(wire13), .wire58(wire50), .clk(clk));
  assign wire91 = $signed((((^(wire47 <= wire12)) < ((|wire10) & $unsigned(wire52))) > wire11[(1'h0):(1'h0)]));
  assign wire92 = $unsigned($unsigned(wire12));
endmodule

module module53  (y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire58;
  input wire [(4'hf):(1'h0)] wire57;
  input wire signed [(3'h7):(1'h0)] wire56;
  input wire signed [(3'h6):(1'h0)] wire55;
  input wire [(5'h15):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire [(5'h12):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire [(5'h14):(1'h0)] wire59;
  reg [(3'h6):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire83,
                 wire82,
                 wire81,
                 wire59,
                 reg85,
                 reg84,
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
                 (1'h0)};
  assign wire59 = (~wire54);
  always
    @(posedge clk) begin
      reg60 <= wire57[(2'h2):(2'h2)];
      reg61 <= wire57[(3'h4):(1'h1)];
      reg62 <= $unsigned(wire58[(2'h2):(2'h2)]);
      if (reg61[(2'h3):(1'h0)])
        begin
          if ((~^((wire57 + (&(wire54 != (8'hbf)))) ?
              wire56 : ($unsigned((reg60 ?
                  (8'ha6) : wire59)) <<< (~|reg62[(2'h2):(1'h0)])))))
            begin
              reg63 <= (($signed(($unsigned(reg61) ?
                          $unsigned(wire54) : (|(8'hb6)))) ?
                      wire59[(5'h10):(3'h7)] : $unsigned(((wire58 ?
                          wire55 : wire57) & wire54[(5'h12):(3'h7)]))) ?
                  (wire58[(2'h2):(1'h0)] >>> ({$signed(wire58), {reg60}} ?
                      reg62[(1'h0):(1'h0)] : (^~(wire55 && reg60)))) : (8'hb3));
              reg64 <= $unsigned($signed($unsigned(reg63)));
              reg65 <= reg64[(3'h4):(2'h3)];
            end
          else
            begin
              reg63 <= (8'hb6);
              reg64 <= (reg62[(2'h2):(2'h2)] ?
                  ($signed((~(wire58 == reg63))) ?
                      wire56 : (~|{$unsigned(reg60),
                          $unsigned(wire56)})) : $unsigned(($signed(wire58[(3'h5):(3'h5)]) ?
                      reg63[(1'h1):(1'h1)] : (8'ha5))));
              reg65 <= $unsigned((reg64[(4'hd):(3'h4)] ?
                  (8'ha7) : reg61[(3'h6):(3'h6)]));
              reg66 <= $unsigned(wire57);
              reg67 <= ((reg60 ?
                      ((~^$unsigned(reg61)) - (~&(~wire54))) : (~^$unsigned((!wire56)))) ?
                  (((|reg62) && {$unsigned(wire58),
                      $signed(wire58)}) << $unsigned(reg64[(3'h6):(3'h5)])) : ($unsigned($unsigned(wire54[(5'h14):(4'ha)])) + (8'hbf)));
            end
          reg68 <= (reg67[(5'h10):(4'hd)] ?
              $signed($unsigned(((reg62 ? reg61 : wire56) ?
                  (~wire59) : (~reg64)))) : wire54[(3'h4):(2'h2)]);
          reg69 <= $unsigned($unsigned(reg65));
          reg70 <= {{wire54[(5'h11):(4'h8)]}};
          reg71 <= {$unsigned($signed((&(wire54 ? reg66 : reg67))))};
        end
      else
        begin
          if ($signed((reg69 ?
              (~^$signed($signed(reg69))) : (~&(~|$unsigned(wire54))))))
            begin
              reg63 <= ((((-(reg71 == reg71)) ?
                  $unsigned($unsigned(reg62)) : (^~(!wire54))) + reg71[(3'h6):(1'h0)]) <<< wire54[(4'hd):(4'hd)]);
            end
          else
            begin
              reg63 <= $unsigned((reg71[(3'h5):(2'h3)] - wire57));
              reg64 <= {reg64,
                  (wire56 >= {($unsigned(wire54) ? (8'hb2) : reg67),
                      ((reg66 << (7'h40)) & $signed(reg65))})};
              reg65 <= (((^$signed($unsigned(reg62))) ?
                      $unsigned((8'ha6)) : (~^wire55[(3'h5):(2'h3)])) ?
                  (reg67[(1'h0):(1'h0)] <<< $unsigned($unsigned(reg64[(4'hf):(4'he)]))) : ($signed((reg71 ?
                          (&(8'hb2)) : (wire56 != reg64))) ?
                      (((^~(8'hb2)) ?
                              ((8'hbf) ? wire55 : reg66) : $unsigned((8'ha4))) ?
                          $unsigned(wire54[(4'ha):(4'h8)]) : ((wire54 && (8'hb2)) ?
                              (^reg61) : $unsigned(reg66))) : $signed($unsigned((reg61 <<< wire57)))));
              reg66 <= reg63[(1'h0):(1'h0)];
            end
          reg67 <= $unsigned(((reg67 ?
                  reg60 : ($unsigned(reg65) ?
                      reg63[(1'h1):(1'h0)] : (~^reg64))) ?
              reg70[(2'h2):(1'h0)] : (-$unsigned({wire54}))));
          if (reg71[(1'h0):(1'h0)])
            begin
              reg68 <= ((reg70[(1'h1):(1'h1)] & $signed(reg68)) ?
                  $signed((8'hb5)) : (~&((((7'h43) - wire58) ?
                      $unsigned(wire56) : reg66) | ($signed(reg69) << reg71[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg68 <= ($unsigned(wire57) ?
                  {$unsigned(reg62[(2'h2):(1'h0)]),
                      (&(reg66[(2'h3):(2'h3)] ?
                          $signed(reg63) : $unsigned((8'ha9))))} : $unsigned($unsigned(reg65)));
            end
          reg69 <= (~|(~^$unsigned((~&reg67))));
        end
      if ($unsigned(wire54[(4'hf):(1'h0)]))
        begin
          reg72 <= $signed((~$unsigned($signed((wire56 ? (8'ha3) : reg64)))));
          reg73 <= wire59;
          reg74 <= $unsigned($signed(({(reg65 ? reg66 : reg64)} ?
              $unsigned((8'hb5)) : (^~{reg66}))));
          if ($unsigned(((~^($unsigned(reg71) ?
              reg72[(2'h3):(1'h0)] : $signed(reg62))) == {(|wire54[(4'hc):(2'h2)]),
              (reg66[(1'h0):(1'h0)] ? reg66[(1'h0):(1'h0)] : (8'hba))})))
            begin
              reg75 <= reg60[(1'h0):(1'h0)];
              reg76 <= ({$signed($unsigned((reg75 - wire59))),
                      $signed(wire57[(4'hd):(4'hd)])} ?
                  (wire58[(2'h2):(2'h2)] * {($signed((7'h44)) ?
                          (!wire59) : (wire58 ?
                              wire59 : wire57))}) : reg70[(1'h1):(1'h1)]);
              reg77 <= {(!(~reg62)), (|$unsigned($signed(reg64)))};
              reg78 <= (~|(~(((wire59 ? reg76 : reg69) ?
                      $signed(reg64) : (8'hb9)) ?
                  (8'ha3) : (7'h44))));
              reg79 <= (+$signed({((reg77 + wire55) <= (7'h40)),
                  (((8'haf) - wire55) ? $signed(reg60) : (reg75 >= wire58))}));
            end
          else
            begin
              reg75 <= reg65;
              reg76 <= (~^reg66[(2'h3):(2'h3)]);
              reg77 <= reg69;
            end
          reg80 <= ($signed(((^~((8'hbb) == reg65)) ?
              wire56 : ((reg78 > reg69) * (reg65 ^~ wire54)))) + reg67[(4'hb):(1'h1)]);
        end
      else
        begin
          if (wire54)
            begin
              reg72 <= $signed((~wire59[(4'hb):(3'h7)]));
              reg73 <= (-wire59);
            end
          else
            begin
              reg72 <= reg69;
              reg73 <= $unsigned(($signed($unsigned(reg80)) ?
                  (!$unsigned($signed(reg80))) : {(~|(^reg64)),
                      $unsigned({reg79, wire58})}));
              reg74 <= reg60;
            end
          reg75 <= (reg66 < (8'hac));
          if (((8'hb4) || reg64))
            begin
              reg76 <= (&$unsigned((&$signed((reg67 ? (8'ha7) : reg68)))));
              reg77 <= (~|($signed(($signed(wire58) * $unsigned((8'hbb)))) ?
                  (~^$signed((~^reg70))) : ((~&((8'hbe) ? reg62 : reg67)) ?
                      $unsigned(reg70) : {(~^reg64), (wire57 == reg62)})));
              reg78 <= ((^~$unsigned(($signed(reg68) ?
                      $unsigned(reg67) : $unsigned(reg75)))) ?
                  (((7'h42) * wire56[(2'h2):(1'h0)]) < reg74) : {({reg60,
                              $signed(wire54)} ?
                          (!$unsigned(reg71)) : (8'haf)),
                      (|(~|{wire57}))});
            end
          else
            begin
              reg76 <= (|(reg68 << $unsigned(reg76[(4'hb):(3'h4)])));
            end
        end
    end
  assign wire81 = (7'h44);
  assign wire82 = (reg78 ?
                      (wire54[(5'h13):(4'hc)] == (~|reg72[(3'h6):(3'h4)])) : (-((~|reg76) > ((|reg69) >> reg76))));
  assign wire83 = wire81[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg84 <= reg67[(4'he):(4'he)];
      reg85 <= $unsigned(($unsigned(((!reg80) ? reg60 : reg68)) != (!((wire59 ?
          reg62 : reg64) && $signed((8'h9d))))));
    end
  assign wire86 = {((8'haa) >= $unsigned(reg67[(3'h6):(1'h0)]))};
  assign wire87 = {(&(~^reg60)),
                      ((8'hae) ?
                          (reg64[(1'h0):(1'h0)] & {{reg69},
                              reg65}) : (^~reg72[(3'h7):(3'h6)]))};
  assign wire88 = reg80;
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire signed [(4'hf):(1'h0)] wire19;
  input wire [(2'h2):(1'h0)] wire18;
  input wire signed [(4'hd):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire21;
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire32,
                 wire28,
                 wire27,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 reg31,
                 reg30,
                 reg29,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire21 = ($signed(wire20[(2'h3):(2'h3)]) != wire18[(1'h1):(1'h1)]);
  assign wire22 = wire17;
  assign wire23 = (((^~(wire17[(4'h8):(3'h5)] ?
                          (|wire20) : (wire22 ? wire21 : wire22))) ?
                      {(wire16 ?
                              (wire21 ?
                                  wire16 : wire20) : ((8'hb8) <<< wire18)),
                          ((^~wire18) ?
                              (wire16 || wire19) : wire19)} : $signed($unsigned({(8'ha5),
                          wire22}))) + wire19[(4'hd):(3'h4)]);
  assign wire24 = wire21[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg25 <= {$signed({((wire16 >= wire23) ?
                  wire17[(3'h7):(3'h7)] : wire22[(4'h9):(1'h0)]),
              wire20[(2'h2):(1'h1)]}),
          (wire23 <= ((wire23 ?
              (wire24 ?
                  (8'hb8) : (8'hbb)) : $signed(wire24)) * $signed((wire19 ?
              wire24 : wire19))))};
      reg26 <= $signed({wire17, $signed(wire20[(1'h1):(1'h1)])});
    end
  assign wire27 = reg25[(3'h4):(1'h1)];
  assign wire28 = (($signed(({reg26,
                          wire18} || (wire20 == wire19))) && {$unsigned((wire18 + (8'hab))),
                          {(wire19 ? reg26 : wire27),
                              ((8'ha0) ? wire16 : wire19)}}) ?
                      $unsigned({($unsigned(wire23) ?
                              ((8'hb6) ?
                                  reg25 : wire20) : {wire27})}) : $signed((~^$unsigned((8'h9d)))));
  always
    @(posedge clk) begin
      if ((~($signed((wire18[(1'h0):(1'h0)] ?
          $unsigned((8'h9e)) : wire23[(3'h6):(3'h4)])) ^~ {$unsigned(wire18)})))
        begin
          reg29 <= (8'ha8);
        end
      else
        begin
          reg29 <= (7'h43);
          reg30 <= (^~$unsigned((~wire27)));
          reg31 <= reg30[(1'h0):(1'h0)];
        end
    end
  assign wire32 = {(wire19 >> wire17), reg30[(2'h2):(1'h1)]};
  always
    @(posedge clk) begin
      if (((+$signed($signed({wire27, wire28}))) > (~|reg25)))
        begin
          reg33 <= ($signed(wire27[(4'h9):(3'h4)]) | {(reg30 ?
                  (~|reg29) : ((wire28 ?
                      reg31 : reg29) - wire19[(4'h9):(1'h0)]))});
          reg34 <= ({reg26} + $unsigned(reg26[(1'h1):(1'h1)]));
          reg35 <= ((8'hbe) < $unsigned((wire16 ^~ $signed($signed(wire20)))));
          reg36 <= ($unsigned((&$signed(reg33[(1'h0):(1'h0)]))) >= $unsigned(({(~|wire20)} ?
              $unsigned(wire18) : ((-reg34) ?
                  (wire17 ? reg33 : reg34) : wire21))));
          reg37 <= wire27[(2'h2):(2'h2)];
        end
      else
        begin
          reg33 <= (7'h42);
          reg34 <= (8'h9d);
          if ($unsigned($unsigned(($unsigned(reg29[(1'h0):(1'h0)]) || $unsigned((reg34 ?
              wire32 : wire32))))))
            begin
              reg35 <= wire22;
              reg36 <= reg29;
              reg37 <= (reg25[(4'he):(4'hd)] < (({$unsigned(reg26)} > $unsigned((8'ha1))) ?
                  reg30[(2'h2):(1'h1)] : wire17));
            end
          else
            begin
              reg35 <= (~^(~&reg36));
              reg36 <= $unsigned(wire16[(4'hc):(3'h5)]);
            end
          if (reg29[(3'h4):(2'h3)])
            begin
              reg38 <= wire17;
            end
          else
            begin
              reg38 <= ($unsigned(wire23) | $signed((reg30 == (reg38[(3'h4):(3'h4)] >= $signed(wire18)))));
              reg39 <= (($signed($signed((wire27 ?
                  wire18 : reg25))) && $unsigned((!$signed(reg26)))) << $unsigned((($unsigned(reg33) ?
                  (reg26 ~^ wire19) : $unsigned((8'ha6))) && (reg29[(3'h4):(1'h1)] | wire28[(3'h4):(1'h0)]))));
              reg40 <= $unsigned((8'hb2));
            end
          reg41 <= ((~wire20) ?
              ($unsigned((reg40 ? $unsigned(wire23) : {wire17})) ?
                  $signed(((reg37 ^~ reg39) - wire21[(3'h5):(1'h1)])) : (((~reg40) <<< (reg34 ?
                          reg31 : wire27)) ?
                      $signed(((8'hac) < wire23)) : (~|(wire20 ?
                          wire28 : wire16)))) : wire21);
        end
      reg42 <= $signed(($unsigned($unsigned($signed(wire28))) ?
          (reg40 ? reg37 : $unsigned(((8'ha4) ? wire24 : wire24))) : wire24));
    end
  assign wire43 = ($unsigned(reg42[(3'h5):(2'h3)]) == ($signed(((reg40 | (8'ha5)) ?
                      $unsigned(wire23) : $signed(wire19))) || $unsigned($unsigned(wire17[(4'h8):(1'h0)]))));
  assign wire44 = reg35[(3'h6):(3'h4)];
  assign wire45 = reg35;
  assign wire46 = ((reg40 ?
                      (&wire20[(2'h3):(1'h0)]) : {$signed((reg40 ?
                              (8'h9d) : reg30)),
                          (~&(reg37 + reg26))}) > $unsigned((-$unsigned({reg35,
                      wire44}))));
endmodule
