module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h4):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire153;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire13;
  assign y = {wire158, wire157, wire155, wire153, wire15, wire13, (1'h0)};
  module4 #() modinst14 (.wire5(wire3), .y(wire13), .wire7(wire2), .wire6(wire1), .wire8(wire0), .clk(clk));
  assign wire15 = ((((8'hab) ~^ ($unsigned(wire2) ?
                          (&wire2) : (wire13 + wire1))) < {((wire2 ?
                              wire13 : wire3) < {wire1})}) ?
                      wire2[(3'h6):(3'h4)] : $unsigned(({wire1[(3'h4):(2'h3)]} ?
                          $signed((wire2 * wire1)) : {(wire0 ?
                                  wire3 : wire3)})));
  module16 #() modinst154 (.wire19(wire13), .wire17(wire2), .y(wire153), .wire20(wire3), .clk(clk), .wire18(wire0));
  module22 #() modinst156 (wire155, clk, wire2, wire13, wire3, wire153);
  assign wire157 = (wire155[(4'ha):(4'ha)] ?
                       {(^wire3),
                           ($unsigned(wire153[(3'h6):(2'h3)]) ?
                               $signed((wire153 ?
                                   wire15 : wire155)) : (^~$unsigned(wire3)))} : $unsigned($unsigned(wire0[(3'h7):(3'h4)])));
  assign wire158 = wire0[(3'h7):(3'h6)];
endmodule

module module16  (y, clk, wire17, wire18, wire19, wire20);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(5'h15):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire67;
  wire [(5'h11):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire103;
  wire [(5'h11):(1'h0)] wire149;
  reg [(5'h12):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  assign y = {wire21,
                 wire50,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire60,
                 wire61,
                 wire67,
                 wire68,
                 wire98,
                 wire102,
                 wire103,
                 wire149,
                 reg152,
                 reg151,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg100,
                 reg101,
                 (1'h0)};
  assign wire21 = wire17;
  module22 #() modinst51 (wire50, clk, wire20, wire18, wire19, wire21);
  assign wire52 = (($unsigned($unsigned(wire19)) <= (~^wire18[(2'h3):(1'h0)])) ?
                      wire50 : {$signed($signed((wire50 ^~ wire21)))});
  assign wire53 = (($unsigned(wire19) ?
                      ($signed(wire18[(1'h0):(1'h0)]) ?
                          (!{wire18,
                              wire17}) : wire50[(2'h3):(1'h0)]) : $signed({$unsigned(wire18)})) ~^ wire52);
  assign wire54 = $unsigned($signed(wire53));
  assign wire55 = $signed(wire21);
  always
    @(posedge clk) begin
      reg56 <= wire53;
      reg57 <= (^~wire53);
      reg58 <= (reg57[(1'h0):(1'h0)] ?
          ((^~$unsigned((~^wire21))) <= wire54[(3'h7):(2'h3)]) : ({$unsigned((^~wire20)),
              wire17[(2'h3):(2'h2)]} || ($unsigned((wire54 ?
              wire21 : reg57)) << reg57)));
      reg59 <= wire19;
    end
  assign wire60 = reg56[(3'h4):(1'h0)];
  assign wire61 = $signed(($signed($unsigned((8'ha9))) && ({$unsigned((8'hae)),
                          {(8'hb5), wire55}} ?
                      $unsigned($unsigned(reg58)) : $unsigned($signed(wire18)))));
  always
    @(posedge clk) begin
      reg62 <= (!wire53[(2'h2):(1'h0)]);
      reg63 <= wire54;
    end
  always
    @(posedge clk) begin
      reg64 <= wire52[(2'h2):(1'h1)];
      reg65 <= $signed((~&reg63));
      reg66 <= $signed(($signed((8'h9c)) ?
          $unsigned($signed(wire54[(2'h3):(2'h3)])) : $signed((reg64 ?
              (wire20 < (8'hbe)) : (^~wire55)))));
    end
  assign wire67 = (&reg58);
  assign wire68 = wire61;
  module69 #() modinst99 (wire98, clk, reg59, wire54, wire50, reg63);
  always
    @(posedge clk) begin
      reg100 <= {$signed((($signed((8'ha2)) > $unsigned(reg57)) >>> ($unsigned(reg62) ^ wire68))),
          $unsigned(((reg63[(3'h4):(2'h3)] ?
                  $signed(wire68) : $signed((8'ha1))) ?
              {$signed(reg56), (^wire17)} : wire67))};
      reg101 <= wire19;
    end
  assign wire102 = $unsigned(((~^reg57[(1'h0):(1'h0)]) - (reg66[(3'h6):(1'h1)] ?
                       {$unsigned(reg66)} : ($unsigned(wire60) * reg65))));
  assign wire103 = $unsigned((8'h9d));
  module104 #() modinst150 (.wire106(reg63), .y(wire149), .wire107(reg58), .wire105(wire103), .clk(clk), .wire108(reg101));
  always
    @(posedge clk) begin
      if ($signed((~reg64)))
        begin
          reg151 <= ({(((-(8'ha9)) >= $signed(reg56)) ?
                  $unsigned(wire67[(1'h0):(1'h0)]) : (8'hbf))} << reg62[(1'h0):(1'h0)]);
        end
      else
        begin
          reg151 <= $signed(((~&wire20) ?
              $unsigned({reg66}) : (+wire68[(4'hf):(4'h8)])));
        end
      reg152 <= (^wire21[(3'h7):(3'h4)]);
    end
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  input wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  reg [(4'hd):(1'h0)] reg11 = (1'h0);
  assign y = {wire12, wire10, wire9, reg11, (1'h0)};
  assign wire9 = wire5[(3'h6):(3'h4)];
  assign wire10 = ((~^$signed({wire7[(1'h0):(1'h0)]})) >>> $unsigned(wire7[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg11 <= wire9;
    end
  assign wire12 = ($signed($signed({{wire8},
                      (wire8 == (8'hbe))})) >>> wire7[(3'h6):(3'h6)]);
endmodule

module module104
#(parameter param148 = (((({(8'hba)} ? ((8'hb5) ? (8'hac) : (8'hb2)) : ((8'hbe) >>> (8'ha3))) || (((8'hab) ^~ (8'ha7)) & ((8'hb9) ? (8'ha6) : (8'ha8)))) * (~(!((7'h40) ? (8'haa) : (8'hb7))))) >>> {(&(((8'hb2) ? (8'ha6) : (8'hb8)) & ((8'ha4) ? (7'h44) : (8'hab)))), (8'h9c)}))
(y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h175):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire108;
  input wire [(5'h15):(1'h0)] wire107;
  input wire signed [(3'h7):(1'h0)] wire106;
  input wire [(4'hb):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire145;
  wire signed [(5'h14):(1'h0)] wire144;
  wire signed [(3'h5):(1'h0)] wire143;
  wire [(3'h5):(1'h0)] wire142;
  wire [(3'h6):(1'h0)] wire141;
  wire signed [(5'h12):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire138;
  wire signed [(3'h7):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire136;
  wire signed [(3'h7):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire [(4'ha):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire109;
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg133 = (1'h0);
  reg [(4'hf):(1'h0)] reg132 = (1'h0);
  reg [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'he):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg119 = (1'h0);
  reg [(3'h6):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire125,
                 wire124,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  assign wire109 = $unsigned($signed((wire106 ?
                       $unsigned(wire107) : (wire107 ?
                           $signed((7'h40)) : wire106))));
  assign wire110 = (((^((wire105 ? (8'ha8) : wire105) & $signed(wire107))) ?
                       (wire105[(3'h4):(2'h3)] ?
                           (((8'hb5) ? wire109 : wire107) ?
                               {wire105,
                                   wire107} : (~|wire106)) : wire105[(3'h4):(2'h2)]) : $unsigned(((wire109 ?
                               wire106 : wire108) ?
                           wire109[(1'h1):(1'h1)] : (|wire105)))) >>> (wire109[(3'h6):(2'h3)] < wire106[(3'h6):(3'h5)]));
  assign wire111 = wire107[(5'h13):(4'hf)];
  assign wire112 = (((^~(~^(|wire111))) ~^ ($signed((wire107 ?
                           wire111 : wire111)) & $unsigned(((8'h9d) ?
                           wire105 : (8'hb9))))) ?
                       ((8'hbf) + (~^((^~wire111) || wire107))) : $unsigned((8'ha8)));
  assign wire113 = $unsigned((~^wire105));
  always
    @(posedge clk) begin
      reg114 <= ($unsigned(($signed($signed(wire111)) ?
              (+(^wire106)) : (|wire110[(4'h8):(3'h7)]))) ?
          ((8'hbb) ?
              (((-wire110) >= $signed(wire109)) ?
                  $unsigned((wire113 ?
                      (8'h9e) : wire109)) : (&wire109)) : $unsigned(wire111)) : ((^~wire105) ?
              wire111 : (7'h40)));
      reg115 <= $unsigned($signed((wire113[(2'h3):(2'h2)] > (wire113[(2'h2):(2'h2)] & $unsigned(wire112)))));
    end
  always
    @(posedge clk) begin
      if ((&$signed(wire105[(1'h1):(1'h1)])))
        begin
          if ((~|(~(wire109 | ((+wire113) * wire106[(2'h2):(1'h1)])))))
            begin
              reg116 <= $signed(wire112);
              reg117 <= $signed((^{(~(+(8'hbb)))}));
              reg118 <= (^((~^wire105[(3'h7):(1'h0)]) ?
                  (~&$signed({reg117})) : $unsigned((^wire107))));
              reg119 <= $unsigned(($unsigned(((~wire108) ~^ (reg115 ?
                      (8'hb6) : wire113))) ?
                  (wire107 ?
                      ($unsigned(reg115) ?
                          (!reg114) : (wire111 < reg115)) : (-(~^(8'hb4)))) : ($unsigned($unsigned((8'ha5))) ?
                      {reg116[(2'h2):(1'h0)],
                          (&wire109)} : $signed((&(8'hbe))))));
              reg120 <= $signed($signed($unsigned(wire110[(4'ha):(3'h4)])));
            end
          else
            begin
              reg116 <= ((~(&wire112)) ?
                  {$unsigned(wire112[(1'h0):(1'h0)])} : (reg118[(1'h0):(1'h0)] ?
                      {reg117[(3'h7):(2'h3)]} : ({wire112,
                          $signed(reg120)} ^ (&wire107))));
              reg117 <= ($signed($unsigned((wire105[(1'h1):(1'h0)] ?
                  (wire109 | (7'h44)) : (reg116 == wire113)))) & wire109);
            end
          reg121 <= (^~($unsigned((^~reg118)) - ($unsigned($signed(reg119)) ?
              $signed(wire112[(2'h3):(2'h2)]) : $signed(reg118[(3'h6):(1'h1)]))));
        end
      else
        begin
          reg116 <= reg120;
          if ($unsigned(wire106))
            begin
              reg117 <= $unsigned(($signed(((wire105 ? wire111 : reg116) ?
                      (wire106 == wire109) : reg121)) ?
                  $unsigned($unsigned(reg119)) : ($unsigned($unsigned((7'h41))) ?
                      wire109 : reg118[(3'h6):(3'h5)])));
              reg118 <= $signed(reg115);
              reg119 <= ({$unsigned((wire111[(1'h1):(1'h1)] << (reg116 < wire105))),
                      reg115[(3'h5):(1'h1)]} ?
                  (|{($signed(reg119) ?
                          (reg120 ? reg116 : reg117) : {reg118,
                              wire108})}) : reg116[(1'h0):(1'h0)]);
            end
          else
            begin
              reg117 <= $unsigned(reg116[(1'h1):(1'h1)]);
              reg118 <= (&wire107[(3'h6):(3'h6)]);
              reg119 <= reg115[(3'h5):(2'h2)];
              reg120 <= (~($unsigned((wire105 - $signed(reg115))) - ($signed($unsigned(wire113)) ?
                  wire110 : ((^wire106) ?
                      {wire111} : ((8'hb2) ? reg121 : reg117)))));
            end
        end
      reg122 <= $unsigned((~^$unsigned($signed({wire108}))));
      reg123 <= ((~|((~|$unsigned(reg117)) >>> $signed((~&reg120)))) | (({(8'hbe)} * ((~|reg114) ?
              (reg121 ? (7'h42) : reg114) : $unsigned(reg121))) ?
          $unsigned({(~|wire109)}) : (wire113[(1'h1):(1'h0)] ?
              {(~^reg118), $signed(wire105)} : wire111[(3'h4):(1'h0)])));
    end
  assign wire124 = ($signed((!(|$unsigned((7'h44))))) * (~$unsigned(({reg118} ?
                       wire108[(3'h5):(3'h4)] : $unsigned(wire108)))));
  assign wire125 = wire106;
  always
    @(posedge clk) begin
      reg126 <= (~^$signed(((((7'h40) >= wire109) || wire107) + reg122[(1'h0):(1'h0)])));
      if ((^~$unsigned(wire112)))
        begin
          reg127 <= ((-({(wire112 << wire112)} > (~wire107))) ^ {wire109[(1'h1):(1'h1)],
              (-((!reg120) <<< {wire107}))});
          if ($unsigned(($signed((-$signed(wire113))) ?
              reg126 : $signed($unsigned(wire108)))))
            begin
              reg128 <= ((~|($signed((^reg123)) ?
                  ({(8'hab)} ?
                      (^~wire109) : $unsigned(reg122)) : wire105[(3'h4):(2'h2)])) << $signed((reg120 ^~ $signed((reg120 > wire112)))));
              reg129 <= (!reg117);
              reg130 <= $signed($unsigned((~&reg126[(4'hc):(3'h5)])));
              reg131 <= (($signed(wire111) + (($signed((7'h40)) ?
                          wire108[(3'h6):(1'h0)] : reg115) ?
                      wire111 : (((8'hac) ?
                          (8'h9f) : wire113) ~^ (wire125 << wire108)))) ?
                  (8'ha6) : wire107[(3'h7):(3'h4)]);
              reg132 <= wire125[(1'h0):(1'h0)];
            end
          else
            begin
              reg128 <= (((reg115[(3'h4):(2'h3)] ?
                          (~(wire111 >>> (7'h43))) : $unsigned((wire107 == wire105))) ?
                      ($signed((^~reg114)) < $unsigned((^wire105))) : $signed({$signed(reg119),
                          reg119})) ?
                  ($unsigned(({(8'hb2)} ? (!(8'haf)) : $signed(wire113))) ?
                      $unsigned(wire106) : reg118[(3'h5):(1'h0)]) : (reg116[(2'h2):(2'h2)] || (($unsigned((8'ha9)) << reg127) ^~ $unsigned(wire106[(2'h3):(1'h1)]))));
              reg129 <= $signed(reg129);
              reg130 <= reg116[(2'h2):(1'h0)];
              reg131 <= ($signed($unsigned((^~{wire105,
                  reg129}))) ~^ $signed(($unsigned($unsigned(reg130)) ^ {{wire113},
                  $signed((8'h9e))})));
            end
        end
      else
        begin
          reg127 <= reg131;
          reg128 <= (($signed(reg127) * (wire106[(3'h7):(3'h7)] + wire112[(1'h0):(1'h0)])) ^ (!(^~wire107)));
          reg129 <= reg123[(2'h3):(2'h2)];
          reg130 <= (+{(((reg114 ? reg116 : reg114) ?
                  {(8'hac), wire112} : reg118) && reg130[(3'h4):(1'h0)])});
          reg131 <= reg115;
        end
      reg133 <= ($signed($unsigned($unsigned(reg128))) & $unsigned(({(wire124 << wire105),
          reg132} || (~$signed((8'hae))))));
      reg134 <= (~|$signed((~(reg121 > (8'hae)))));
      reg135 <= $unsigned((~|$signed((reg128[(3'h6):(2'h2)] ?
          $unsigned(wire105) : (wire110 ? wire106 : wire111)))));
    end
  assign wire136 = reg133[(4'hd):(3'h5)];
  assign wire137 = reg131[(1'h0):(1'h0)];
  assign wire138 = (^$signed($unsigned(wire137)));
  assign wire139 = $signed((~(-{$unsigned(wire106), reg116})));
  assign wire140 = $signed($signed((&(reg127 >>> (wire136 ^~ wire105)))));
  assign wire141 = ($signed(((wire138[(5'h10):(4'h8)] ?
                       reg127[(1'h0):(1'h0)] : $unsigned(wire105)) ^ {(reg132 >> (8'hb6)),
                       (reg118 ?
                           wire111 : (7'h44))})) - ({$unsigned((reg115 & reg129)),
                           (|$signed(reg132))} ?
                       $unsigned(reg135[(3'h6):(3'h4)]) : (|$signed((reg117 ?
                           wire110 : wire107)))));
  assign wire142 = $unsigned($unsigned((~|wire138[(3'h7):(3'h4)])));
  assign wire143 = $unsigned(reg122);
  assign wire144 = (wire106[(2'h3):(2'h2)] | $signed(reg127[(3'h6):(1'h1)]));
  assign wire145 = wire141;
  assign wire146 = $unsigned(wire142);
  assign wire147 = $unsigned(((8'hbc) ?
                       wire146[(4'hd):(4'hc)] : ((reg130 ?
                               (wire124 - (8'haa)) : (&wire124)) ?
                           ((wire105 ? (8'hab) : reg118) ?
                               $signed(wire138) : wire106[(2'h2):(1'h1)]) : (reg133[(3'h6):(3'h4)] != reg118[(1'h0):(1'h0)]))));
endmodule

module module69
#(parameter param97 = (!(((((8'hb9) * (8'h9c)) << ((8'hb7) && (8'hbc))) ? (-(~&(8'hb1))) : {((8'hbc) ? (7'h42) : (8'ha2)), (8'hbe)}) ? (({(8'hbc)} ? {(8'h9e), (8'hb2)} : ((7'h44) ? (8'hb2) : (8'ha8))) ? {((8'hb7) * (8'hb9))} : ((+(8'h9c)) ? (~(8'hb1)) : (~|(8'ha3)))) : (&(((8'h9d) ? (8'h9c) : (8'hb4)) < {(8'ha1)})))))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire73;
  input wire signed [(4'h9):(1'h0)] wire72;
  input wire [(5'h14):(1'h0)] wire71;
  input wire signed [(3'h4):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire95;
  wire signed [(4'h8):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire92;
  wire signed [(3'h6):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(3'h6):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire74;
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire74,
                 reg96,
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
                 (1'h0)};
  assign wire74 = ((|wire73[(2'h2):(1'h0)]) >> ($signed($unsigned({wire73,
                          wire73})) ?
                      (!wire73[(1'h0):(1'h0)]) : wire73[(4'ha):(1'h1)]));
  always
    @(posedge clk) begin
      reg75 <= wire72;
      if ($unsigned(wire74[(1'h0):(1'h0)]))
        begin
          if (reg75[(3'h7):(3'h7)])
            begin
              reg76 <= wire71;
              reg77 <= reg76;
              reg78 <= $unsigned((reg77 > $signed(reg75[(3'h7):(1'h0)])));
              reg79 <= {({wire70[(1'h0):(1'h0)],
                      $signed($unsigned(reg75))} ~^ {wire71[(1'h1):(1'h0)]}),
                  (($signed($unsigned(reg76)) + reg76) ?
                      {$signed($unsigned(reg77))} : {($signed(wire71) ?
                              ((7'h40) != (8'haf)) : $signed((8'hbe))),
                          ($signed(wire71) <<< $unsigned(reg78))})};
              reg80 <= wire70[(2'h2):(1'h0)];
            end
          else
            begin
              reg76 <= ($unsigned(reg75[(2'h2):(1'h1)]) ?
                  (&((wire71[(5'h11):(4'hf)] >= $signed(wire72)) ^~ wire73[(2'h3):(2'h3)])) : (~reg78[(2'h2):(2'h2)]));
              reg77 <= ((wire74[(3'h4):(1'h1)] ?
                      $unsigned(reg79) : (reg76[(2'h3):(1'h1)] > $unsigned($signed(reg75)))) ?
                  (~&reg76) : ($unsigned(reg76[(5'h11):(4'hb)]) > reg79));
              reg78 <= {{{reg80},
                      ((8'hb3) ?
                          $unsigned((~wire73)) : (reg75 || {reg75, (8'ha5)}))},
                  (!$signed(reg78))};
              reg79 <= $unsigned((~^{$signed((^reg75))}));
            end
          reg81 <= (&($signed((~&((8'hbe) ?
              wire70 : reg75))) << ({$unsigned(reg80)} ?
              $signed((reg75 ~^ reg77)) : $unsigned($unsigned((7'h44))))));
          reg82 <= ((-$signed((reg80 ? reg80 : (wire74 ? wire72 : (8'hbf))))) ?
              {{($unsigned(reg78) << (reg78 ? reg79 : wire70)),
                      $unsigned(reg76)},
                  $unsigned(reg80)} : {$unsigned($signed(reg77[(3'h4):(1'h1)])),
                  (wire72[(1'h0):(1'h0)] <<< reg80)});
          reg83 <= reg79[(4'ha):(3'h5)];
          reg84 <= (!wire70[(2'h3):(2'h3)]);
        end
      else
        begin
          reg76 <= $unsigned(reg78);
          if ((8'haa))
            begin
              reg77 <= ((({(reg84 ? reg78 : reg75),
                  reg75} <= {$unsigned((8'ha2))}) + $signed((+(~reg76)))) <= (reg78[(3'h4):(2'h3)] ?
                  $unsigned(((~&reg83) || {(8'hb0)})) : $unsigned({reg77})));
              reg78 <= (({($signed(reg77) ^~ wire71)} ?
                      reg75[(4'h9):(3'h5)] : (reg78 ?
                          (-reg84) : (^$unsigned(reg75)))) ?
                  $signed(((|(wire72 ? reg79 : reg75)) ?
                      $signed((reg79 - reg78)) : (&reg78))) : (reg84[(2'h2):(2'h2)] != (8'ha7)));
              reg79 <= (($signed(((~|reg78) != (+reg78))) << $unsigned({{wire72,
                          reg80},
                      (reg76 && (8'hb7))})) ?
                  wire70[(2'h3):(2'h2)] : {(!$signed((reg82 ?
                          wire74 : wire74)))});
              reg80 <= (&((((~&wire71) ?
                      $unsigned((7'h42)) : (reg76 ?
                          wire70 : reg79)) * {$signed(reg84)}) ?
                  (!$signed(reg80[(3'h6):(3'h6)])) : $signed($unsigned(reg78))));
              reg81 <= $unsigned(wire70);
            end
          else
            begin
              reg77 <= $signed(((8'h9c) >> ((^reg77[(5'h10):(4'h9)]) + ((wire70 > wire73) ?
                  $signed(reg84) : ((8'ha3) ^~ reg79)))));
              reg78 <= ($unsigned(reg81[(3'h4):(2'h2)]) <= reg80[(3'h4):(3'h4)]);
              reg79 <= wire73[(3'h6):(2'h3)];
              reg80 <= $signed(reg79);
              reg81 <= (-($signed(((reg75 ? (8'ha6) : reg76) ?
                      (~|reg77) : $signed(wire74))) ?
                  reg81[(4'ha):(2'h3)] : $signed($unsigned({(8'h9d)}))));
            end
          reg82 <= $unsigned(wire71);
        end
    end
  assign wire85 = reg78;
  assign wire86 = wire71;
  assign wire87 = (^reg77);
  assign wire88 = $unsigned(wire72);
  assign wire89 = $signed(wire88[(4'hd):(4'h8)]);
  assign wire90 = (^(-((~&reg82[(1'h1):(1'h0)]) | $unsigned((reg76 >>> wire87)))));
  assign wire91 = reg78;
  assign wire92 = ((wire90[(1'h1):(1'h0)] ?
                          ((&$unsigned(reg84)) >> {(^reg82),
                              $unsigned(reg75)}) : reg80) ?
                      {$signed($signed({(8'h9d)}))} : (~&(8'hbf)));
  assign wire93 = $signed((^((wire88 != (reg76 ? reg83 : wire73)) < {wire86,
                      reg83})));
  assign wire94 = wire71;
  assign wire95 = (|(7'h41));
  always
    @(posedge clk) begin
      reg96 <= ((((wire74[(2'h3):(2'h2)] ?
                  (wire85 >= (8'ha0)) : (wire72 & (8'hb2))) ?
              $signed((reg82 ? wire88 : wire92)) : $unsigned((wire90 ?
                  reg83 : wire74))) < ((~&wire71[(4'hf):(4'h8)]) + $signed($signed(wire73)))) ?
          (wire94[(4'h8):(3'h7)] ?
              {wire89} : $signed((8'ha9))) : ($signed((7'h43)) ?
              (~|(&$signed(wire91))) : (~^(((8'haf) ^~ wire89) | wire74[(3'h6):(1'h1)]))));
    end
endmodule

module module22
#(parameter param49 = ((7'h43) ? (((((8'hb7) ? (7'h44) : (8'ha8)) ? ((8'haa) ~^ (8'hbe)) : ((8'hbf) ? (8'hb1) : (8'ha1))) >= (~^(8'ha2))) ? {{(^~(8'ha4)), {(8'h9e), (8'hb4)}}, ((~^(8'h9d)) - ((8'ha0) & (8'hbe)))} : (~^(((8'hb9) != (8'hbb)) <= (!(8'hbf))))) : (!((((8'hb5) >> (8'haa)) <= (+(8'hb3))) * (((8'hae) ? (7'h41) : (8'hbe)) * ((8'hb8) ? (8'ha9) : (8'hbc)))))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire26;
  input wire [(2'h3):(1'h0)] wire25;
  input wire [(3'h4):(1'h0)] wire24;
  input wire signed [(5'h11):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire [(5'h11):(1'h0)] wire27;
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire38,
                 wire37,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire27 = $unsigned($signed((&wire25[(1'h0):(1'h0)])));
  assign wire28 = wire24;
  assign wire29 = {(&$signed({{wire28, wire25}, (~wire28)}))};
  assign wire30 = $signed(wire29[(2'h3):(1'h0)]);
  assign wire31 = wire29;
  always
    @(posedge clk) begin
      reg32 <= wire28;
      reg33 <= ((^wire23[(3'h4):(1'h1)]) & $unsigned($signed(($unsigned(wire26) & (~|wire30)))));
      reg34 <= (-$unsigned((reg32 - (~^(~wire24)))));
      reg35 <= $signed({(^reg33[(2'h2):(2'h2)])});
      reg36 <= (reg32 ?
          wire24 : {wire30, (~|(wire30 >>> reg34[(4'ha):(3'h4)]))});
    end
  assign wire37 = wire24;
  assign wire38 = (((^(((8'ha7) ? wire37 : reg32) ?
                          $unsigned((8'ha9)) : (wire23 <<< (8'hbc)))) && reg34) ?
                      wire25[(2'h2):(2'h2)] : $unsigned((((+wire23) - $unsigned((8'hb7))) ?
                          $signed(wire25) : $unsigned((reg35 != reg33)))));
  always
    @(posedge clk) begin
      if ($signed(wire26))
        begin
          reg39 <= $unsigned(wire30[(5'h13):(1'h1)]);
          reg40 <= ((wire37 ? {reg35} : $signed(wire26)) ^ ($unsigned(wire25) ?
              reg36 : $signed($unsigned(reg35))));
          reg41 <= (8'hbc);
          reg42 <= reg33[(3'h6):(3'h5)];
        end
      else
        begin
          reg39 <= ((-$unsigned($signed((reg39 ?
              wire23 : wire31)))) ^~ wire28[(1'h1):(1'h1)]);
        end
      reg43 <= {({$signed(wire37)} <<< (8'hbc))};
      reg44 <= (~^{(&$signed((reg34 >>> wire38))),
          ((8'hb6) + (reg42[(3'h7):(2'h3)] > reg35))});
    end
  assign wire45 = ((^~(wire31[(4'h9):(3'h4)] != (~&(~wire23)))) == {wire27[(3'h5):(3'h4)]});
  assign wire46 = $unsigned((|$unsigned(reg34)));
  assign wire47 = {reg39[(3'h4):(2'h2)]};
  assign wire48 = {(({$unsigned(wire31)} + $unsigned(wire46)) ^ ((wire45[(4'hc):(4'h9)] ?
                          (reg44 ?
                              wire27 : wire30) : wire30[(5'h13):(5'h13)]) & ({wire24,
                          wire47} >>> wire37[(3'h5):(3'h4)])))};
endmodule
