module top
#(parameter param137 = ((8'h9f) ? ((~&{(^~(8'hb0))}) ^ ((((8'hb8) ? (8'hb0) : (8'hbd)) ? ((8'hba) ^ (8'hac)) : (^~(8'ha2))) + (|((8'hb5) ? (7'h41) : (7'h40))))) : (&(((8'ha3) ? {(8'hae), (8'haf)} : ((8'ha0) >>> (8'h9e))) >= (((8'ha8) ? (8'h9d) : (8'hbb)) ? ((8'hb5) | (8'h9c)) : (~|(8'had)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire135;
  wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg14 = (1'h0);
  assign y = {wire135,
                 wire16,
                 wire15,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
                 reg6,
                 reg7,
                 reg8,
                 reg13,
                 reg14,
                 (1'h0)};
  assign wire4 = wire1[(3'h4):(2'h2)];
  assign wire5 = $signed($signed($signed($unsigned((8'ha1)))));
  always
    @(posedge clk) begin
      reg6 <= (wire1[(3'h6):(3'h6)] ?
          ($signed(wire3[(2'h3):(1'h1)]) ?
              (((wire4 ? wire1 : wire1) <= $signed(wire5)) ?
                  $unsigned(wire1[(3'h4):(1'h1)]) : wire1) : wire5) : wire1);
      reg7 <= (^~reg6[(4'hd):(3'h4)]);
      reg8 <= wire5;
    end
  assign wire9 = (reg7 ?
                     ($signed((~^(wire5 ?
                         wire0 : wire5))) || wire5[(2'h2):(1'h0)]) : reg8);
  assign wire10 = (&((wire2 ?
                      $unsigned((wire3 ? wire0 : (7'h43))) : $unsigned((reg7 ?
                          wire4 : wire0))) < reg8));
  assign wire11 = $unsigned(($unsigned($unsigned($unsigned(wire0))) >> wire4));
  assign wire12 = wire1;
  always
    @(posedge clk) begin
      reg13 <= ($unsigned(($signed((wire11 ? wire5 : (8'hab))) ?
          reg7[(1'h0):(1'h0)] : $unsigned((~|reg8)))) || $unsigned((!wire9)));
      reg14 <= ((8'hb3) >= reg8);
    end
  assign wire15 = ((-wire4[(1'h1):(1'h0)]) ?
                      $signed(($signed({wire2, wire2}) ?
                          $signed((~|reg13)) : ((reg14 ? wire5 : (8'h9e)) ?
                              (|wire11) : ((8'hb3) ?
                                  (7'h43) : wire3)))) : $signed($signed(((reg6 * (8'hb4)) ?
                          {wire5} : $signed(wire0)))));
  assign wire16 = $unsigned((+($unsigned(reg13[(5'h10):(1'h1)]) ?
                      wire0[(4'hd):(1'h1)] : (~^$unsigned(reg14)))));
  module17 #() modinst136 (.wire19(wire11), .wire20(wire0), .wire21(reg8), .clk(clk), .y(wire135), .wire18(wire12), .wire22(wire5));
endmodule

module module17  (y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'h1d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(4'h9):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire134;
  wire [(3'h5):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire95;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(4'h8):(1'h0)] wire97;
  wire [(3'h4):(1'h0)] wire98;
  wire signed [(4'hb):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire131;
  reg signed [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire93,
                 wire69,
                 wire23,
                 wire24,
                 wire67,
                 wire95,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire100,
                 wire108,
                 wire111,
                 wire131,
                 reg110,
                 reg109,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire23 = $signed({(((&(8'ha3)) ?
                              wire18 : (wire22 ? (7'h43) : wire22)) ?
                          ((wire21 < wire21) ~^ (8'h9e)) : $signed((wire21 ?
                              wire21 : wire22))),
                      (|$signed(wire20[(3'h7):(3'h5)]))});
  assign wire24 = (wire22[(3'h6):(1'h1)] ?
                      wire23 : ($unsigned(wire20[(4'ha):(3'h7)]) ?
                          (((wire20 >> wire22) ?
                              $unsigned(wire22) : (wire23 <<< (8'hab))) || $unsigned(wire18[(2'h2):(2'h2)])) : wire21[(3'h7):(3'h7)]));
  always
    @(posedge clk) begin
      reg25 <= wire19[(1'h0):(1'h0)];
      reg26 <= {((((wire20 == (8'hae)) ?
                      $unsigned((8'h9c)) : {wire24, wire18}) ?
                  $unsigned(wire21[(4'he):(3'h5)]) : {(^~wire20)}) ?
              (($signed((8'hb7)) >> wire24) == (wire20[(4'he):(4'ha)] ?
                  {wire20,
                      wire20} : wire20[(4'h9):(3'h7)])) : (^~(wire19 * $unsigned(wire22))))};
      reg27 <= wire21[(4'hb):(4'h9)];
      if (wire23)
        begin
          if ($unsigned($unsigned(wire24)))
            begin
              reg28 <= (!reg26);
              reg29 <= (($signed($signed($signed(reg27))) + {(-reg27),
                  (-(wire21 ?
                      reg27 : reg27))}) >>> (wire21[(2'h3):(1'h1)] < (~^$unsigned(wire22))));
              reg30 <= {(wire22[(3'h6):(3'h5)] ?
                      wire18[(3'h4):(3'h4)] : reg26)};
            end
          else
            begin
              reg28 <= reg27;
              reg29 <= (+(reg25 != ($signed((&reg28)) | ((wire24 == wire19) ?
                  $unsigned(wire21) : (reg30 <= (8'hbe))))));
              reg30 <= wire22[(4'h9):(4'h9)];
              reg31 <= $unsigned(wire18);
              reg32 <= ((!reg30[(2'h2):(1'h1)]) ?
                  $unsigned((wire22 ?
                      (~|(wire19 ?
                          reg25 : reg30)) : wire18[(3'h6):(1'h1)])) : ((^(wire24[(2'h2):(1'h0)] && $signed(wire22))) ?
                      (!reg30) : reg30));
            end
          reg33 <= {(|reg26[(4'hd):(4'h9)]), (+wire23)};
          if ($signed(wire18))
            begin
              reg34 <= $unsigned(wire21[(4'hd):(4'ha)]);
              reg35 <= {(7'h42)};
              reg36 <= ($unsigned(reg29[(3'h6):(1'h0)]) ?
                  $signed((^~(~|{reg25}))) : (~&wire20));
            end
          else
            begin
              reg34 <= $unsigned(reg25[(2'h3):(2'h2)]);
              reg35 <= reg28;
            end
        end
      else
        begin
          if ($unsigned($unsigned(reg29)))
            begin
              reg28 <= (reg32[(4'h9):(3'h4)] ?
                  ((8'h9f) && $unsigned((-reg26))) : {{({reg28, wire24} ?
                              $signed(reg32) : (reg30 * wire22)),
                          $unsigned(reg28)},
                      $signed(($signed(reg35) ?
                          $unsigned(wire20) : (|reg35)))});
            end
          else
            begin
              reg28 <= (($unsigned($signed((wire23 - reg35))) ?
                  (|(+(^~reg33))) : {wire19[(3'h6):(2'h3)]}) == {$unsigned(((reg36 ?
                          reg36 : wire19) ?
                      (^~wire19) : $unsigned(reg27))),
                  wire24[(1'h0):(1'h0)]});
              reg29 <= wire18;
              reg30 <= {(reg25 <= $unsigned($unsigned($signed((8'ha8))))),
                  ((reg32 ? reg31 : wire19) << ((-reg30) <<< (~wire22)))};
              reg31 <= wire20[(1'h1):(1'h0)];
            end
          reg32 <= {(!reg27),
              (reg34[(4'hd):(2'h3)] ?
                  (reg27 ?
                      $signed($unsigned(wire20)) : reg31[(1'h0):(1'h0)]) : $signed(reg31[(3'h4):(2'h3)]))};
          reg33 <= $unsigned((~reg29[(1'h0):(1'h0)]));
        end
    end
  module37 #() modinst68 (wire67, clk, wire21, wire24, wire18, reg36);
  assign wire69 = ((reg28[(4'ha):(2'h3)] ?
                      {reg34[(5'h11):(4'hf)],
                          ($signed((8'hbb)) + (wire18 >= wire18))} : $unsigned($unsigned(wire67[(4'h8):(3'h7)]))) ~^ (+(($unsigned(reg25) <<< $unsigned(reg34)) ?
                      $unsigned($signed(reg27)) : (8'ha4))));
  module70 #() modinst94 (wire93, clk, wire19, wire23, reg34, reg31, wire67);
  assign wire95 = $unsigned((reg31[(3'h6):(2'h3)] ^ reg34));
  assign wire96 = ({$unsigned($unsigned(wire69)),
                      (~|$signed({reg32}))} <<< (($signed(wire22) ?
                      ($signed(wire93) ^~ (reg31 + reg27)) : (wire67[(3'h5):(2'h2)] ^ (wire21 != (8'ha5)))) ~^ reg35[(1'h0):(1'h0)]));
  assign wire97 = (+$unsigned(wire69));
  assign wire98 = $unsigned(((^wire20[(3'h4):(1'h1)]) > {$unsigned({wire97,
                          reg35}),
                      (+(~&reg31))}));
  assign wire99 = (((reg30 >> {reg31[(4'h9):(4'h9)], wire98}) ?
                          ({wire18, wire93} & {reg28,
                              (+(8'hbe))}) : $signed($unsigned(((8'hbd) < reg26)))) ?
                      (({{(8'hbf),
                              wire23}} >>> $unsigned($unsigned(reg25))) << $signed($signed($unsigned((7'h44))))) : (((~|wire21[(4'h8):(3'h7)]) ?
                              (~^reg29[(3'h4):(2'h2)]) : {wire23,
                                  {reg26, reg25}}) ?
                          (^~($signed(reg34) < wire18[(4'h9):(2'h2)])) : wire20[(2'h3):(2'h2)]));
  assign wire100 = wire18;
  always
    @(posedge clk) begin
      if (($unsigned(reg27[(3'h4):(1'h0)]) * (&$signed($signed($signed(reg32))))))
        begin
          if (($unsigned((reg34 ?
                  $unsigned((wire96 < wire20)) : (((8'ha3) >>> reg32) ?
                      wire100[(4'he):(2'h2)] : $unsigned(wire67)))) ?
              (!(&wire69[(4'h8):(1'h1)])) : (+(-{{wire22, wire18},
                  (reg33 + wire18)}))))
            begin
              reg101 <= $signed((reg29 <= $signed(({wire22} ?
                  (reg33 ? wire19 : wire22) : (~|wire95)))));
              reg102 <= $unsigned((reg32[(3'h7):(1'h1)] > (|{(&wire100),
                  $unsigned((8'ha9))})));
              reg103 <= wire23;
              reg104 <= $unsigned(((^~reg35) >>> ($unsigned(((8'had) - reg28)) != wire97)));
            end
          else
            begin
              reg101 <= ((($signed((reg34 ? wire18 : reg31)) ?
                      $unsigned({reg29}) : (|$signed(wire24))) ?
                  $unsigned($signed($unsigned(reg27))) : ($unsigned(reg27[(2'h2):(2'h2)]) <<< $signed((|wire96)))) == (!$signed($signed((reg104 * (7'h40))))));
              reg102 <= $signed((wire69 ?
                  $signed(wire21) : (reg26[(5'h11):(1'h0)] != {{(8'ha5), reg36},
                      $signed(reg101)})));
              reg103 <= (((~|reg103[(1'h1):(1'h1)]) ?
                      $unsigned((reg25[(4'he):(2'h3)] ?
                          wire19 : $signed(wire67))) : $signed($unsigned((~&wire18)))) ?
                  (wire95 <= $signed(wire18[(3'h7):(3'h5)])) : (^~$signed($unsigned((reg34 <<< (8'h9d))))));
              reg104 <= (($signed(wire22[(3'h4):(1'h0)]) ~^ (|wire23[(2'h3):(2'h2)])) ?
                  wire93 : $unsigned(wire24[(1'h0):(1'h0)]));
              reg105 <= wire19;
            end
          reg106 <= $unsigned({(wire69 && $signed(wire96))});
        end
      else
        begin
          reg101 <= reg26;
          reg102 <= (reg104[(2'h3):(1'h1)] != {{{(8'ha2), $unsigned(reg33)},
                  {(reg29 > (8'hb4))}}});
          reg103 <= $signed((8'hbf));
          reg104 <= wire18[(3'h6):(3'h4)];
        end
      reg107 <= reg103;
    end
  assign wire108 = reg107[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg109 <= $unsigned({{wire19[(4'h9):(3'h5)]},
          ((reg27[(2'h3):(2'h3)] >> reg33[(2'h3):(2'h2)]) ?
              ((wire97 >= reg33) ~^ (^reg26)) : $signed({reg31, reg27}))});
      reg110 <= $signed((~^$signed((~|$unsigned(wire69)))));
    end
  assign wire111 = $unsigned(((((wire69 != reg110) >> {(8'ha9), reg30}) ?
                       wire108 : $unsigned(wire67)) << (~$unsigned({(8'hb9)}))));
  module112 #() modinst132 (wire131, clk, reg29, reg103, reg110, reg105, wire95);
  assign wire133 = $unsigned({(wire67[(2'h3):(2'h3)] ^ ((-reg109) == $unsigned(wire67)))});
  assign wire134 = reg31[(5'h12):(1'h1)];
endmodule

module module112  (y, clk, wire117, wire116, wire115, wire114, wire113);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire117;
  input wire signed [(4'hf):(1'h0)] wire116;
  input wire signed [(4'hf):(1'h0)] wire115;
  input wire signed [(4'he):(1'h0)] wire114;
  input wire signed [(5'h12):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire130;
  wire [(3'h6):(1'h0)] wire129;
  wire signed [(5'h15):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire signed [(4'hd):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire123;
  wire [(3'h4):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire [(2'h2):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 (1'h0)};
  assign wire118 = (^wire114[(2'h3):(1'h1)]);
  assign wire119 = $unsigned(wire117);
  assign wire120 = wire117;
  assign wire121 = {wire117[(4'hd):(4'hd)], $signed(wire114)};
  assign wire122 = ($unsigned((-(~{wire113, wire121}))) ?
                       (($unsigned(wire117) ?
                               {(wire116 >= (8'hbe))} : wire113) ?
                           (((wire114 ? wire116 : wire120) ?
                                   (&(8'ha3)) : $signed(wire114)) ?
                               wire115[(2'h2):(2'h2)] : $unsigned($unsigned(wire116))) : $signed(({wire119} ?
                               wire120 : $signed(wire118)))) : wire121);
  assign wire123 = wire113;
  assign wire124 = ($unsigned((|$signed(wire121))) * (wire113 < wire115[(4'hc):(3'h6)]));
  assign wire125 = $unsigned((!$unsigned((+(wire124 ? wire115 : wire115)))));
  assign wire126 = wire118;
  assign wire127 = (~^$signed((&wire125)));
  assign wire128 = wire121;
  assign wire129 = $unsigned({({(wire121 >>> wire117)} >> ((wire127 << wire120) >> $unsigned(wire123))),
                       $signed($signed(wire116))});
  assign wire130 = (^~wire117);
endmodule

module module70  (y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire75;
  input wire [(5'h13):(1'h0)] wire74;
  input wire [(5'h15):(1'h0)] wire73;
  input wire signed [(5'h11):(1'h0)] wire72;
  input wire signed [(5'h12):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire89;
  wire signed [(2'h2):(1'h0)] wire88;
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg86 = (1'h0);
  reg [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
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
  always
    @(posedge clk) begin
      if ($signed($unsigned((~&($unsigned(wire75) ~^ (wire72 > wire72))))))
        begin
          reg76 <= $signed(($unsigned($signed((^~wire73))) ^ (~((~&(8'hb8)) ?
              (wire72 < wire73) : (~&(8'hb2))))));
          reg77 <= reg76[(2'h3):(1'h0)];
          reg78 <= (wire74[(4'he):(3'h7)] ?
              (|(^~reg77[(4'hc):(3'h4)])) : reg77);
        end
      else
        begin
          reg76 <= (!$signed((wire75 ?
              $unsigned((wire73 ? reg78 : wire71)) : {((8'hb4) ?
                      wire75 : (8'haa)),
                  (wire71 <= (8'ha2))})));
          reg77 <= wire71;
          reg78 <= (-$unsigned($unsigned((wire74[(2'h3):(2'h2)] << {wire73}))));
          reg79 <= {{wire74[(3'h5):(1'h0)],
                  ((^~(-reg78)) ?
                      reg78[(1'h1):(1'h0)] : (|wire72[(4'ha):(4'h8)]))}};
          reg80 <= ((wire73[(3'h4):(1'h1)] ?
              $signed((reg76[(1'h0):(1'h0)] ^ reg78[(2'h2):(1'h0)])) : (|wire74)) >= $unsigned(($unsigned($signed(wire73)) < ((wire72 && (8'hbb)) ?
              wire72[(4'hf):(3'h6)] : (reg79 ? wire73 : wire75)))));
        end
      reg81 <= wire71[(3'h6):(3'h4)];
      reg82 <= (!wire74);
      reg83 <= (-wire71[(4'ha):(3'h7)]);
      if (($unsigned($signed(reg80[(1'h1):(1'h0)])) ?
          reg83 : ($signed($signed($unsigned(wire75))) ?
              wire71 : {($unsigned(reg79) ? (wire73 == reg82) : wire72)})))
        begin
          reg84 <= (($unsigned(wire73) << $unsigned(reg80)) > ($signed({{wire72},
              {reg83}}) << {reg78}));
          reg85 <= {(~^reg77)};
          reg86 <= $unsigned($signed(($unsigned((~^reg79)) + $unsigned(((8'haa) ?
              (8'hbd) : reg80)))));
        end
      else
        begin
          if ($signed(($unsigned((((8'hb2) > reg85) << (reg76 ?
                  reg78 : reg81))) ?
              wire74 : ($signed((~^reg81)) > ((reg81 < reg77) ?
                  {reg83} : reg84[(5'h14):(3'h6)])))))
            begin
              reg84 <= wire74[(2'h3):(1'h0)];
              reg85 <= (~|reg85[(3'h5):(2'h3)]);
              reg86 <= ($unsigned(reg86[(1'h0):(1'h0)]) & $signed($unsigned((!$signed(wire72)))));
              reg87 <= ($signed(reg83) ?
                  $signed($signed($unsigned($signed(reg82)))) : reg83[(4'h9):(3'h6)]);
            end
          else
            begin
              reg84 <= (~^{($unsigned({reg82}) | (reg82[(5'h11):(2'h2)] ?
                      {reg86, reg84} : (!reg83))),
                  wire72[(2'h3):(2'h3)]});
            end
        end
    end
  assign wire88 = ({$unsigned($signed(reg76)),
                      (~^(+(reg81 | wire71)))} - reg85[(4'hf):(4'hc)]);
  assign wire89 = $unsigned(reg84);
  assign wire90 = (~|($signed((^{reg76})) ?
                      $signed((^~reg77[(3'h4):(3'h4)])) : reg82[(5'h12):(3'h7)]));
  assign wire91 = wire75;
  assign wire92 = wire91;
endmodule

module module37
#(parameter param65 = (~{(~^(((8'hb3) ? (8'ha8) : (8'hac)) ? ((7'h44) > (8'hac)) : {(8'ha3)})), {({(8'hbb), (7'h40)} ^~ {(8'h9c)})}}), 
parameter param66 = ({((8'h9f) << (param65 ? (param65 ? (8'hb9) : param65) : (param65 ^ (8'ha9))))} ? (param65 ? (&(~(!param65))) : (((param65 ? param65 : param65) | param65) - ((param65 ? param65 : param65) ? (param65 & param65) : ((8'hb4) | param65)))) : {({param65, (&param65)} | param65)}))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire41;
  input wire signed [(3'h5):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire [(3'h6):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire48;
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(4'h9):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire48,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed({($unsigned(wire39[(3'h6):(3'h6)]) ?
              $signed(wire40[(1'h1):(1'h1)]) : $unsigned(wire40[(2'h3):(1'h1)])),
          ((((8'h9f) ? (8'ha6) : wire38) ?
              $signed(wire39) : $unsigned(wire41)) >= (!(wire41 ?
              wire41 : wire41)))}))
        begin
          reg42 <= ((+($signed({wire38, wire39}) ?
                  $signed($unsigned(wire39)) : (^$signed(wire38)))) ?
              $signed({({wire38, wire40} ? {wire41} : (+wire39)),
                  {$signed(wire40), wire40}}) : ((({wire39} >> (wire41 ?
                          (8'ha3) : wire41)) ?
                      wire41[(3'h4):(1'h0)] : wire41) ?
                  {wire40[(1'h1):(1'h1)],
                      wire39[(3'h5):(3'h5)]} : $signed(({wire38,
                      wire40} >= (wire39 ? (8'h9c) : (8'ha8))))));
          if ({wire38[(1'h0):(1'h0)]})
            begin
              reg43 <= $unsigned((reg42 ?
                  ($unsigned(((8'ha1) > reg42)) - $signed($signed(wire39))) : ($signed($unsigned(wire38)) <= {((8'h9e) || wire39)})));
              reg44 <= {$unsigned({$unsigned((wire40 | (8'hac)))})};
              reg45 <= $signed({((reg44[(4'h8):(3'h7)] * $unsigned(wire41)) ?
                      {reg44, (~^wire40)} : wire38[(3'h6):(1'h0)])});
            end
          else
            begin
              reg43 <= wire39;
            end
          reg46 <= ($unsigned(reg42[(3'h4):(1'h0)]) ?
              $unsigned(wire40[(3'h4):(1'h0)]) : wire41);
          reg47 <= (~&$unsigned($signed((-$unsigned((8'hb6))))));
        end
      else
        begin
          reg42 <= ($signed($unsigned(reg45[(2'h2):(1'h1)])) ?
              ($signed((~^$signed((8'hb5)))) ?
                  {reg45[(1'h0):(1'h0)],
                      ((reg45 ? reg45 : (8'hb0)) ?
                          reg47[(1'h1):(1'h1)] : $signed(reg42))} : ((~&reg42) | (reg43[(1'h1):(1'h1)] ?
                      $signed((8'hb6)) : wire39))) : (reg45 | wire41[(4'h9):(2'h2)]));
          if ((reg44[(1'h0):(1'h0)] < (|($unsigned(wire40) ?
              wire39[(3'h6):(3'h6)] : reg46[(4'h9):(3'h4)]))))
            begin
              reg43 <= $unsigned($signed($unsigned(reg47[(3'h5):(3'h5)])));
              reg44 <= $unsigned((^~(~|$signed(reg47))));
            end
          else
            begin
              reg43 <= wire39;
              reg44 <= $signed(wire38[(3'h6):(2'h2)]);
              reg45 <= reg44;
            end
          reg46 <= (((($unsigned(wire38) * (wire41 ? reg42 : wire39)) ?
                  $unsigned((~(8'ha4))) : wire38[(2'h3):(2'h3)]) <= (wire39 * wire40[(1'h1):(1'h1)])) ?
              $signed(({reg46, (|reg42)} | reg44[(4'h8):(1'h0)])) : (reg47 ?
                  $unsigned(reg46) : reg42[(2'h3):(2'h2)]));
          reg47 <= $unsigned($unsigned($signed($signed(reg43[(2'h3):(2'h2)]))));
        end
    end
  assign wire48 = {reg42, wire41[(3'h7):(3'h4)]};
  always
    @(posedge clk) begin
      reg49 <= wire40;
      reg50 <= {(&wire39)};
      if (reg49[(2'h3):(2'h3)])
        begin
          reg51 <= (~&(~|(($signed(reg42) <<< reg49) ?
              {(|wire40)} : ((8'ha5) >= (|reg44)))));
          reg52 <= ((wire40[(2'h2):(1'h0)] < (^(&(wire48 == reg47)))) | (8'ha4));
        end
      else
        begin
          if (((((-(reg49 ?
              reg51 : wire41)) < wire40) << (~|(~|(reg51 < reg50)))) ~^ ($signed($unsigned($signed(reg46))) - $unsigned((reg47 != reg52[(1'h0):(1'h0)])))))
            begin
              reg51 <= {($signed({$signed(wire38), (reg44 >>> (7'h42))}) ?
                      ({{wire38, reg43},
                          {wire41,
                              (8'hb2)}} ~^ $signed(reg44[(2'h2):(1'h0)])) : {reg47})};
              reg52 <= {reg49[(3'h4):(1'h0)],
                  $signed($unsigned(wire40[(1'h1):(1'h1)]))};
              reg53 <= (8'hb7);
            end
          else
            begin
              reg51 <= reg47[(2'h3):(1'h1)];
              reg52 <= ({{((~&wire38) ? reg43 : ((8'ha9) != reg52))},
                  ((reg42[(4'h8):(3'h6)] ?
                          (wire48 ? wire38 : (7'h41)) : (wire38 ?
                              wire38 : (7'h41))) ?
                      ((reg53 ? wire40 : reg44) | (wire39 ?
                          reg52 : reg49)) : reg44[(3'h6):(2'h2)])} * $signed((8'h9e)));
              reg53 <= $signed((((~&(reg50 >>> (8'ha0))) ^ $unsigned((reg47 ?
                      (8'hb2) : wire41))) ?
                  $signed(wire40[(1'h1):(1'h1)]) : reg42[(3'h7):(2'h2)]));
            end
          reg54 <= (&{(reg49[(3'h4):(1'h0)] < (&(~&reg43))), reg46});
          if ($unsigned((|(8'h9d))))
            begin
              reg55 <= wire40[(3'h4):(1'h0)];
            end
          else
            begin
              reg55 <= (~|(7'h44));
              reg56 <= $signed($signed(reg45[(2'h2):(1'h1)]));
              reg57 <= reg49[(1'h0):(1'h0)];
            end
          reg58 <= $signed({(($unsigned(wire41) ?
                      (reg52 + reg50) : $signed(reg42)) ?
                  ((8'ha3) - reg43[(2'h3):(2'h3)]) : (8'hbc))});
          if ((^~$signed($signed((+{reg47, reg58})))))
            begin
              reg59 <= ((^reg44[(3'h5):(1'h0)]) ?
                  (reg43[(3'h6):(3'h5)] < ($signed((+wire40)) ?
                      reg55[(4'ha):(4'h9)] : wire38[(3'h5):(3'h5)])) : {(!((reg51 ?
                          reg54 : reg52) - reg51))});
              reg60 <= (~reg54);
            end
          else
            begin
              reg59 <= ($signed((8'h9e)) ? reg42 : reg59[(5'h11):(3'h7)]);
            end
        end
      reg61 <= reg42[(1'h1):(1'h0)];
      reg62 <= reg53;
    end
  assign wire63 = ((+(((|(7'h44)) << {reg53}) ?
                          reg61 : (wire40 ?
                              reg62[(3'h5):(1'h0)] : ((8'hae) >>> (8'ha7))))) ?
                      $unsigned($signed(((reg43 ? reg51 : reg55) + (reg43 ?
                          reg57 : wire38)))) : ({((reg42 || reg58) ?
                                  $signed(reg43) : $signed((8'ha8)))} ?
                          reg58 : (+$signed(reg42[(4'ha):(3'h6)]))));
  assign wire64 = (reg58 >>> ($unsigned(reg53[(1'h1):(1'h0)]) ?
                      reg53[(3'h7):(3'h5)] : $unsigned((reg60 && (~|reg53)))));
endmodule
