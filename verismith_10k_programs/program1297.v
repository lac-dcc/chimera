module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire151;
  wire signed [(3'h5):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire149;
  wire signed [(2'h2):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire147;
  wire signed [(3'h5):(1'h0)] wire146;
  wire signed [(5'h12):(1'h0)] wire145;
  wire signed [(4'he):(1'h0)] wire143;
  wire signed [(5'h15):(1'h0)] wire109;
  assign y = {wire158,
                 wire157,
                 wire155,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire143,
                 wire109,
                 (1'h0)};
  module5 #() modinst110 (wire109, clk, wire2, wire4, wire0, wire3);
  module111 #() modinst144 (wire143, clk, wire2, wire1, wire0, wire109);
  assign wire145 = ((wire4 & wire2) ? wire109 : (~|wire3[(1'h0):(1'h0)]));
  assign wire146 = ($signed($unsigned({(wire1 ? wire4 : wire1),
                           $signed((8'ha9))})) ?
                       wire4[(2'h3):(2'h3)] : (|$unsigned((wire1[(5'h11):(4'h8)] ?
                           (^~wire3) : $signed(wire1)))));
  assign wire147 = {wire2[(3'h6):(3'h6)]};
  assign wire148 = {($signed($unsigned($signed(wire147))) <= {wire3[(3'h5):(1'h0)]}),
                       (&(~(~^wire146)))};
  assign wire149 = wire3[(4'hf):(4'hc)];
  assign wire150 = (($signed(wire143) ?
                       $signed((!wire149)) : (wire109[(2'h3):(2'h3)] ^~ wire143[(4'hd):(4'hc)])) ^ ($signed(wire146) ?
                       wire109[(4'hd):(3'h4)] : wire1[(3'h4):(1'h1)]));
  assign wire151 = (8'hb7);
  assign wire152 = (~&wire3);
  module66 #() modinst154 (wire153, clk, wire150, wire4, wire149, wire147);
  module12 #() modinst156 (.y(wire155), .wire15(wire147), .clk(clk), .wire14(wire153), .wire16(wire4), .wire13(wire150));
  assign wire157 = $signed($signed({wire151[(1'h0):(1'h0)]}));
  module12 #() modinst159 (.wire15(wire153), .y(wire158), .wire16(wire152), .clk(clk), .wire14(wire155), .wire13(wire146));
endmodule

module module111
#(parameter param141 = (8'hb8), 
parameter param142 = param141)
(y, clk, wire112, wire113, wire114, wire115);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire112;
  input wire signed [(5'h13):(1'h0)] wire113;
  input wire signed [(5'h15):(1'h0)] wire114;
  input wire signed [(5'h15):(1'h0)] wire115;
  wire signed [(4'hf):(1'h0)] wire140;
  wire [(2'h3):(1'h0)] wire139;
  wire signed [(2'h2):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire signed [(4'h8):(1'h0)] wire117;
  wire signed [(4'hd):(1'h0)] wire118;
  wire [(5'h11):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire133;
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  assign y = {wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire117,
                 wire118,
                 wire119,
                 wire120,
                 wire133,
                 reg116,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg116 <= (~|((~&((wire115 == wire115) ?
          wire114 : wire113)) <<< (((wire112 ? wire113 : wire112) ?
              (wire115 ? wire112 : wire113) : (wire115 + wire115)) ?
          ($unsigned(wire114) < (wire114 ?
              wire112 : wire113)) : $signed((~&wire113)))));
    end
  assign wire117 = $unsigned(((!{$unsigned(wire112), {wire114}}) ?
                       ($unsigned((wire114 ?
                           (8'hba) : wire112)) >> $signed(wire112)) : ({(reg116 ?
                               reg116 : (8'ha8)),
                           $signed(wire114)} || $signed({wire114}))));
  assign wire118 = ($signed(wire113[(1'h0):(1'h0)]) ?
                       ($signed(((wire112 ? (8'h9e) : (8'hbc)) ?
                           ((8'haa) ?
                               wire117 : reg116) : wire113)) ^~ $signed((8'hac))) : wire114);
  assign wire119 = (((wire118 < wire117[(3'h6):(1'h1)]) ?
                           reg116 : $signed($unsigned(wire114))) ?
                       wire118 : $unsigned((((~&wire117) & $unsigned(wire115)) ?
                           $unsigned($unsigned(wire113)) : {wire112[(2'h2):(1'h0)]})));
  assign wire120 = $signed((~(!$signed((wire117 <= reg116)))));
  module121 #() modinst134 (.clk(clk), .wire124(wire120), .y(wire133), .wire125(wire119), .wire122(wire113), .wire123(reg116));
  assign wire135 = (8'hbd);
  assign wire136 = ((~^wire113[(2'h2):(1'h1)]) ?
                       ({$signed((wire118 || wire115))} ?
                           {(~(-wire114))} : wire112[(1'h0):(1'h0)]) : wire113[(4'he):(3'h6)]);
  assign wire137 = ((8'hbe) ?
                       $unsigned(wire118[(4'h9):(3'h4)]) : ($signed($unsigned($unsigned(wire118))) > (-$unsigned((~^reg116)))));
  assign wire138 = $signed((~wire117[(3'h5):(2'h2)]));
  assign wire139 = (|($unsigned(wire114) && (wire114[(3'h7):(1'h1)] ?
                       (~|wire118[(4'hb):(4'h8)]) : $unsigned((-wire112)))));
  assign wire140 = $unsigned(wire139[(1'h1):(1'h1)]);
endmodule

module module5
#(parameter param108 = (~(~|((((8'haf) ? (8'h9d) : (8'hb0)) ^ ((8'hba) & (8'hbf))) ? ((~|(8'hb7)) << ((8'hbc) ? (8'ha0) : (8'ha9))) : (~(~(8'h9d)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h13b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire103;
  wire signed [(3'h7):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire65;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  reg signed [(5'h10):(1'h0)] reg107 = (1'h0);
  reg [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire65,
                 wire53,
                 wire52,
                 wire50,
                 wire49,
                 wire47,
                 wire11,
                 wire10,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg51,
                 (1'h0)};
  assign wire10 = ((+wire6) ? wire7 : (+(^~$unsigned(wire8[(2'h2):(1'h1)]))));
  assign wire11 = (wire8 >>> (8'hb6));
  module12 #() modinst48 (.wire16(wire7), .wire14(wire8), .clk(clk), .y(wire47), .wire13(wire9), .wire15(wire6));
  assign wire49 = wire47;
  assign wire50 = (!$unsigned(((wire9 != (wire6 ? wire49 : wire6)) ?
                      $unsigned(wire6) : wire10)));
  always
    @(posedge clk) begin
      reg51 <= (8'hbe);
    end
  assign wire52 = $signed((-wire7[(1'h0):(1'h0)]));
  assign wire53 = ((wire52 ?
                      wire52 : wire52[(3'h4):(1'h0)]) & (~^(!$unsigned((wire47 << (8'ha6))))));
  always
    @(posedge clk) begin
      if ((!wire53[(3'h5):(1'h0)]))
        begin
          if ({($signed((|(wire6 && wire10))) ?
                  ($unsigned((|wire7)) ?
                      wire6[(4'hd):(4'h9)] : (!wire52)) : $signed($unsigned(wire7))),
              (($unsigned(reg51[(3'h4):(2'h3)]) ?
                  $unsigned((~wire8)) : (wire49 || {wire52})) >= ($signed($signed((7'h43))) ?
                  {(wire9 >>> wire7), wire52[(1'h1):(1'h1)]} : ({reg51,
                      (7'h43)} & (wire52 ? wire52 : reg51))))})
            begin
              reg54 <= (^({wire6[(5'h10):(4'hc)]} ?
                  (~&(+$signed(wire50))) : (^$unsigned(wire7[(4'hc):(2'h3)]))));
              reg55 <= ((~|({(-reg54)} ?
                  ((~wire6) ?
                      wire49 : wire10[(4'h9):(1'h0)]) : (wire8[(2'h2):(1'h1)] - $signed(wire6)))) == {$unsigned(($signed((8'h9e)) >>> wire52))});
            end
          else
            begin
              reg54 <= {$signed($signed($signed((wire49 ? (8'ha0) : reg54))))};
              reg55 <= wire7[(4'hf):(2'h2)];
            end
        end
      else
        begin
          reg54 <= $signed((+wire9[(5'h13):(2'h2)]));
          reg55 <= wire8;
        end
      if ($unsigned((8'hbe)))
        begin
          reg56 <= $unsigned((&$unsigned((wire49[(3'h7):(3'h7)] >= (8'ha2)))));
          reg57 <= {$signed($signed(wire53))};
          reg58 <= reg56;
          if ($unsigned($signed(((+$unsigned(wire10)) ?
              $unsigned(wire47) : reg54))))
            begin
              reg59 <= ((~^((((8'haa) & reg56) ?
                  $unsigned(reg51) : wire53) < ({wire50, wire10} ?
                  $unsigned(wire52) : ((8'hb5) ?
                      reg54 : wire10)))) * (($unsigned(wire50) ?
                  $signed(wire8[(3'h7):(3'h5)]) : ((-wire52) ?
                      $unsigned(wire9) : $unsigned(wire52))) <= (^~((reg51 != wire53) > (|(8'hbf))))));
              reg60 <= $signed((!$unsigned((^reg51))));
            end
          else
            begin
              reg59 <= reg58;
              reg60 <= wire11[(2'h3):(1'h1)];
            end
          reg61 <= reg60[(3'h4):(2'h3)];
        end
      else
        begin
          reg56 <= $signed(((^~((wire7 && reg55) ?
                  $signed(wire10) : $signed(reg60))) ?
              (reg56 ?
                  ((reg60 ? wire8 : wire10) | {reg61,
                      wire6}) : (-wire8[(2'h2):(1'h0)])) : (|$unsigned($unsigned(reg58)))));
          if (((($unsigned(reg57[(1'h1):(1'h1)]) ~^ $unsigned($unsigned((8'haa)))) ?
                  ($signed((&reg57)) != $signed((reg59 ?
                      (8'hbe) : reg51))) : $signed((~(reg58 ?
                      reg57 : reg61)))) ?
              $unsigned(wire11) : $signed({$unsigned(reg60[(2'h3):(1'h0)])})))
            begin
              reg57 <= (|(8'had));
            end
          else
            begin
              reg57 <= $unsigned({$signed($unsigned((wire8 ^ (8'hac)))),
                  wire50});
              reg58 <= wire9[(5'h13):(3'h6)];
              reg59 <= $unsigned(({({(8'hb4), reg54} ~^ (^wire47)),
                      ((reg61 ? wire8 : wire6) >> $unsigned(reg60))} ?
                  $signed((reg57 ?
                      (reg60 ?
                          reg61 : reg59) : (wire52 && wire8))) : ((~^reg59[(4'h9):(3'h6)]) <<< {((8'hb4) ^~ wire9)})));
            end
          reg60 <= $unsigned(wire47[(1'h0):(1'h0)]);
          if (($unsigned($unsigned((~$unsigned((8'hae))))) ?
              wire47[(2'h2):(1'h1)] : (8'ha6)))
            begin
              reg61 <= reg61;
              reg62 <= $unsigned($unsigned((7'h42)));
              reg63 <= ({$unsigned($signed(wire50))} >> wire11[(4'h9):(4'h8)]);
            end
          else
            begin
              reg61 <= ($signed(reg54) ^~ (+$unsigned((&$unsigned(reg63)))));
            end
        end
      reg64 <= ((~^{($unsigned(reg59) ? $unsigned(reg59) : (~^(8'hac))),
          (~^reg58)}) && {wire49});
    end
  assign wire65 = (wire10 ?
                      $unsigned({(wire11 - ((8'hbe) ?
                              reg55 : (7'h40)))}) : (wire49 ?
                          ((^(~wire49)) && $signed(wire53)) : reg59[(1'h1):(1'h1)]));
  module66 #() modinst100 (.wire69(wire50), .clk(clk), .wire67(reg64), .y(wire99), .wire68(reg55), .wire70(wire10));
  assign wire101 = ({wire11[(3'h5):(1'h1)],
                       {((~|reg54) < wire6[(5'h10):(1'h1)]),
                           wire49}} == wire53[(2'h2):(2'h2)]);
  assign wire102 = (~|(7'h42));
  assign wire103 = (-$unsigned((($unsigned(reg64) > (&wire11)) >>> reg63[(4'hc):(3'h4)])));
  always
    @(posedge clk) begin
      reg104 <= (!$unsigned((^(~^$unsigned(wire10)))));
      reg105 <= (~|$unsigned(($unsigned(wire103[(2'h2):(1'h1)]) ~^ ((wire10 ?
          wire99 : reg57) && {reg63, reg61}))));
      reg106 <= ($unsigned($signed((+$unsigned((8'hb8))))) ?
          wire65[(1'h1):(1'h0)] : ((reg60 || wire102[(2'h2):(1'h1)]) ?
              (&wire10) : $signed(($unsigned((8'ha3)) == (wire103 >> (8'hba))))));
      reg107 <= wire8[(2'h3):(1'h0)];
    end
endmodule

module module66
#(parameter param98 = {(((!(7'h42)) * (((7'h41) ? (8'ha3) : (7'h43)) ? ((8'hba) ? (8'h9f) : (8'hb7)) : (~^(8'ha8)))) ? {(((8'ha1) ? (8'h9f) : (8'h9d)) ? ((8'hb2) ? (8'ha8) : (8'hb0)) : {(8'hb5)})} : (~&(((8'ha5) & (8'hab)) ? ((8'hb7) ? (8'hae) : (8'h9e)) : (|(7'h41)))))})
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h146):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire70;
  input wire [(5'h11):(1'h0)] wire69;
  input wire signed [(3'h7):(1'h0)] wire68;
  input wire signed [(5'h13):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire97;
  wire signed [(5'h15):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire [(4'hb):(1'h0)] wire94;
  wire [(4'hc):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire [(4'hb):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(3'h7):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  reg [(2'h2):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
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
                 (1'h0)};
  assign wire71 = $signed(wire68[(2'h3):(1'h1)]);
  assign wire72 = $signed((8'ha9));
  assign wire73 = wire71;
  assign wire74 = (~&{wire67, wire68});
  assign wire75 = wire69;
  assign wire76 = (~&(&wire70[(2'h2):(1'h0)]));
  assign wire77 = (+$unsigned($unsigned(($signed(wire71) ^~ $unsigned(wire73)))));
  assign wire78 = wire70[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (wire68[(1'h1):(1'h1)])
        begin
          if (wire73)
            begin
              reg79 <= $signed((wire74 ^~ (8'haa)));
            end
          else
            begin
              reg79 <= $unsigned($signed((($signed(wire78) ?
                  wire72 : (~^wire70)) << $signed((!wire67)))));
              reg80 <= $signed((+wire73));
              reg81 <= (($unsigned((wire68 ?
                      (wire67 > wire70) : wire71[(3'h6):(1'h1)])) * wire70[(3'h4):(3'h4)]) ?
                  (~&wire78) : {(wire76 ~^ (wire67 || wire72))});
            end
        end
      else
        begin
          if ((wire76[(4'he):(4'he)] <<< wire73))
            begin
              reg79 <= (8'h9c);
              reg80 <= ((wire70[(2'h2):(2'h2)] ?
                  wire69[(2'h2):(1'h0)] : $signed(($unsigned(wire70) ?
                      (8'hb7) : wire67[(2'h3):(1'h1)]))) <= wire74[(3'h4):(1'h1)]);
              reg81 <= wire67;
              reg82 <= (wire67 ?
                  (wire71[(4'ha):(4'h9)] || (^~$unsigned($signed(wire75)))) : (^wire68));
              reg83 <= (((((&wire77) ~^ wire73[(5'h10):(4'h9)]) ?
                      $signed((reg82 >>> wire77)) : ($unsigned(reg80) ?
                          (wire67 ?
                              wire72 : wire73) : $unsigned((8'ha7)))) == {$signed(((8'ha8) >> wire72))}) ?
                  $unsigned({{((8'had) ? wire77 : reg81),
                          (~|reg79)}}) : ($signed(((wire77 ?
                      wire72 : wire72) != (~reg82))) ^ (|($unsigned(reg82) >= $unsigned((8'hb4))))));
            end
          else
            begin
              reg79 <= $signed(reg83[(1'h0):(1'h0)]);
              reg80 <= $signed(($unsigned((~^(wire72 ? (8'had) : wire74))) ?
                  {$unsigned((~|wire75))} : wire73));
              reg81 <= wire76[(1'h0):(1'h0)];
              reg82 <= $unsigned($signed(wire77));
              reg83 <= (~|wire70);
            end
          reg84 <= $unsigned($signed((~($unsigned(wire71) >> $signed(wire78)))));
        end
      reg85 <= $signed(wire77);
      reg86 <= (~&$unsigned($unsigned(reg80[(2'h3):(1'h1)])));
      reg87 <= {wire73, (~^$signed(wire78[(4'hb):(3'h5)]))};
      if (reg83)
        begin
          reg88 <= reg80;
          reg89 <= reg84;
          reg90 <= wire75[(2'h2):(1'h1)];
          reg91 <= wire71[(4'hc):(2'h2)];
        end
      else
        begin
          reg88 <= (reg80[(1'h0):(1'h0)] ^ wire69[(4'hd):(4'hc)]);
          reg89 <= (((-$unsigned(reg91[(1'h0):(1'h0)])) >> wire78) | $unsigned((~({reg81} ?
              $unsigned(wire70) : $signed(reg88)))));
          reg90 <= {reg91};
        end
    end
  assign wire92 = (wire69 + wire71[(3'h6):(1'h0)]);
  assign wire93 = ($unsigned($unsigned(reg80[(1'h0):(1'h0)])) ?
                      (7'h44) : (~^$signed((^(~|wire74)))));
  assign wire94 = wire93;
  assign wire95 = wire93;
  assign wire96 = ($unsigned($unsigned($signed($signed((8'hb7))))) ^ wire78);
  assign wire97 = (&(wire72 | $unsigned((~&{reg83, reg87}))));
endmodule

module module12  (y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h154):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire signed [(3'h5):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire45;
  wire [(2'h2):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire18;
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire46,
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
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire27,
                 wire18,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= $signed((~|(8'hbf)));
    end
  assign wire18 = ((&wire13) ? wire13 : wire15[(5'h10):(2'h3)]);
  always
    @(posedge clk) begin
      reg19 <= (~^wire16[(1'h0):(1'h0)]);
      if ((reg17[(4'ha):(1'h0)] <= {($signed((wire18 & wire14)) ?
              wire14 : $signed((wire18 ? wire16 : reg17))),
          wire13}))
        begin
          reg20 <= ($signed((wire15 != $signed(wire13))) | ($signed(reg17[(2'h3):(1'h1)]) & $signed(((wire16 ?
              wire18 : wire14) + (!wire15)))));
          reg21 <= ({wire16} ?
              $signed({(wire18 - $signed(wire14))}) : (!$unsigned((reg17[(5'h13):(2'h2)] | (wire13 ?
                  wire14 : reg20)))));
          reg22 <= ((|(!(8'haf))) ?
              (~^reg21) : ((+$unsigned((reg17 >> reg21))) >> wire18));
        end
      else
        begin
          reg20 <= ((^~(~|(reg20[(3'h4):(1'h0)] && wire16))) ~^ (~{{{wire18,
                      (8'hb7)}}}));
          reg21 <= wire16;
          if ({$unsigned((&reg21))})
            begin
              reg22 <= ((wire13[(2'h3):(2'h3)] ?
                  $unsigned((reg20[(3'h5):(3'h5)] ?
                      $signed(wire16) : (~reg20))) : $signed({wire14})) | wire16[(1'h1):(1'h0)]);
              reg23 <= (reg22 ?
                  (((reg22[(3'h4):(1'h0)] || (reg20 ? reg17 : wire15)) ?
                      $unsigned($signed(wire16)) : $unsigned(reg22)) ~^ (~|({reg19,
                          (8'ha4)} ?
                      (&reg21) : (~reg19)))) : (|((~&reg21[(4'ha):(3'h5)]) != {wire13,
                      wire15[(1'h0):(1'h0)]})));
              reg24 <= (wire18 ^~ (~^reg22[(4'h9):(3'h7)]));
              reg25 <= (($unsigned({(~&reg17),
                      reg22[(2'h2):(1'h1)]}) ~^ (^(((8'hbc) + reg22) ?
                      ((8'ha2) <<< wire15) : (~|reg19)))) ?
                  (!$unsigned({{reg24, (8'haf)}})) : (^~(&reg22)));
            end
          else
            begin
              reg22 <= ($signed(wire18) ?
                  $signed(wire16) : $signed($unsigned(wire13)));
              reg23 <= wire13;
            end
        end
      reg26 <= (~&((~&wire16) ?
          {($unsigned(reg22) ? reg20 : $signed(reg23)),
              $signed((~|reg24))} : ((reg25[(4'hf):(4'ha)] || (reg20 ?
              wire14 : reg24)) >= ($signed((8'hbe)) & $unsigned(wire16)))));
    end
  assign wire27 = (($unsigned($unsigned((reg23 && wire14))) > (8'had)) ?
                      reg20[(1'h1):(1'h1)] : wire14[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg28 <= $signed(reg26[(2'h2):(1'h0)]);
      reg29 <= {(!$signed(reg21))};
      reg30 <= $signed((+reg17[(4'hc):(4'ha)]));
      reg31 <= (wire15[(3'h7):(2'h2)] ^~ reg17[(3'h7):(1'h1)]);
    end
  assign wire32 = $unsigned(reg17[(4'ha):(3'h4)]);
  assign wire33 = (8'h9e);
  assign wire34 = (-wire27[(4'hb):(2'h3)]);
  assign wire35 = (8'hb8);
  assign wire36 = $unsigned(($signed({{reg17}, $signed(reg25)}) ?
                      $signed($signed(wire15[(3'h4):(3'h4)])) : $unsigned((+reg19))));
  assign wire37 = (wire13 * (wire33 ~^ reg22[(2'h2):(1'h0)]));
  assign wire38 = ((&$signed($signed((wire33 != wire36)))) ?
                      ($unsigned((8'hab)) < (~(wire14 <= (wire37 ?
                          wire33 : reg20)))) : ({$unsigned({reg26})} ?
                          (|{(wire35 ^~ reg19)}) : (wire33 ?
                              ($unsigned((8'hbf)) ?
                                  (reg24 ?
                                      wire34 : wire14) : (+(8'ha1))) : wire27)));
  assign wire39 = wire35;
  assign wire40 = (8'ha1);
  assign wire41 = (^~{({(reg25 ? wire14 : wire36)} > ((reg21 ?
                          (8'haf) : (8'hab)) * $unsigned(wire36)))});
  assign wire42 = (&(!{$signed($signed(wire18)), (wire41 ^ $signed(wire41))}));
  assign wire43 = wire38;
  assign wire44 = {(((~|{wire27, wire39}) ? wire33 : $signed(reg22)) ?
                          wire34 : $signed((~^(!reg17)))),
                      $signed((&wire38[(2'h3):(2'h2)]))};
  assign wire45 = (8'hba);
  assign wire46 = $unsigned(reg24);
endmodule

module module121
#(parameter param131 = ((((((7'h43) ? (8'ha9) : (8'hb4)) << ((8'hbe) & (8'haa))) ? (-{(8'hae), (8'hbb)}) : (((8'hb5) ^~ (7'h43)) ? ((8'hb1) ? (8'ha5) : (8'h9c)) : ((7'h43) ^ (8'hae)))) ? {(&((8'ha7) ? (7'h41) : (8'hba))), (&(^(8'hb6)))} : ({((8'had) | (8'ha4)), (8'hbf)} >>> (((8'h9c) - (7'h44)) ? ((8'hac) < (8'ha5)) : (|(8'h9e))))) ? (8'hbf) : (8'hb1)), 
parameter param132 = {((|(param131 - (8'h9c))) ? (param131 ? (param131 ? (param131 ? param131 : param131) : (+param131)) : param131) : ((((8'ha8) >>> param131) | param131) ^~ (~&(8'hbd)))), (((7'h41) == (^(|param131))) ? param131 : (^((param131 ? (8'hb2) : param131) & (|param131))))})
(y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire125;
  input wire [(4'he):(1'h0)] wire124;
  input wire signed [(4'hc):(1'h0)] wire123;
  input wire [(5'h13):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire130;
  wire signed [(4'hd):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire127;
  wire signed [(3'h5):(1'h0)] wire126;
  assign y = {wire130, wire129, wire128, wire127, wire126, (1'h0)};
  assign wire126 = wire123[(2'h2):(1'h1)];
  assign wire127 = wire122[(4'h9):(3'h7)];
  assign wire128 = $unsigned(wire122[(2'h3):(2'h2)]);
  assign wire129 = (({($unsigned(wire124) == $signed(wire125))} ?
                       (({wire123, wire123} - {wire128, wire128}) ?
                           $signed((wire123 << wire122)) : wire128) : (-wire123[(1'h1):(1'h0)])) < (wire127 ?
                       ($unsigned(wire124[(2'h3):(1'h0)]) && {(wire123 < (8'ha3)),
                           $signed(wire128)}) : $signed(((wire123 - wire125) >= (wire126 ?
                           wire122 : (8'hab))))));
  assign wire130 = (&((~{$unsigned(wire125), $unsigned(wire128)}) ?
                       wire128[(1'h0):(1'h0)] : wire126[(3'h5):(3'h5)]));
endmodule
