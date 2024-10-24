module top
#(parameter param194 = ((^~(((8'hae) | ((8'hb5) ^ (8'hbc))) ? (((8'ha0) ? (8'hb3) : (8'hb9)) ? ((8'hba) ? (7'h40) : (8'hae)) : ((8'hb3) ? (7'h41) : (8'hac))) : (((8'hb1) ? (8'hb0) : (8'ha4)) | (|(8'ha8))))) ? ({{(~|(8'ha5)), (|(8'h9c))}, (|(~&(8'hb8)))} ? (((~^(8'hb1)) ? ((8'hb8) ? (8'hbf) : (8'ha5)) : (^~(8'h9e))) * (~|((8'h9d) && (8'hbe)))) : {{((8'hbd) ^ (7'h41))}, ({(8'hb6), (8'hae)} ^~ (~^(8'h9c)))}) : (((-((7'h44) - (8'hac))) >> ((-(8'ha9)) == {(8'hb6)})) ? ({((8'hb1) ? (8'h9d) : (8'hb9))} ? (((8'hba) ? (8'h9e) : (8'hb1)) ? {(8'hb5), (8'hb7)} : ((8'hb6) ? (8'hb6) : (8'hac))) : ((^~(8'ha7)) == ((8'ha2) ? (8'haa) : (8'hae)))) : (|(^((7'h43) ? (8'hbb) : (7'h42)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h136):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire193;
  wire [(5'h15):(1'h0)] wire192;
  wire [(5'h10):(1'h0)] wire191;
  wire [(4'he):(1'h0)] wire190;
  wire [(2'h2):(1'h0)] wire189;
  wire [(4'hc):(1'h0)] wire188;
  wire [(4'hb):(1'h0)] wire187;
  wire [(2'h2):(1'h0)] wire186;
  wire [(5'h11):(1'h0)] wire185;
  wire [(3'h5):(1'h0)] wire168;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire170;
  wire signed [(5'h13):(1'h0)] wire178;
  wire [(3'h4):(1'h0)] wire179;
  wire signed [(4'hc):(1'h0)] wire180;
  wire [(5'h10):(1'h0)] wire181;
  wire signed [(4'he):(1'h0)] wire182;
  wire [(4'h8):(1'h0)] wire183;
  reg [(4'hb):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg signed [(4'he):(1'h0)] reg175 = (1'h0);
  reg [(4'hf):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg171 = (1'h0);
  assign y = {wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire168,
                 wire20,
                 wire18,
                 wire170,
                 wire178,
                 wire179,
                 wire180,
                 wire181,
                 wire182,
                 wire183,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 (1'h0)};
  module5 #() modinst19 (.wire10(wire3), .clk(clk), .wire8(wire1), .wire7(wire0), .wire9(wire4), .wire6(wire2), .y(wire18));
  assign wire20 = {wire0, (+wire3)};
  module21 #() modinst169 (wire168, clk, wire0, wire2, wire3, wire1, wire4);
  assign wire170 = ((^wire168) ?
                       {(~&$signed(wire168)), wire18} : (-($unsigned((wire0 ?
                               wire0 : wire1)) ?
                           $unsigned((wire3 | wire2)) : (~&(|wire1)))));
  always
    @(posedge clk) begin
      reg171 <= $unsigned($unsigned($unsigned(wire170)));
      reg172 <= $signed(wire168);
      reg173 <= wire168;
      if (($signed(wire0[(3'h5):(1'h1)]) ?
          $unsigned($unsigned(wire0)) : wire170))
        begin
          reg174 <= (^~(reg172 & (-wire0[(4'ha):(2'h3)])));
          reg175 <= wire2[(1'h0):(1'h0)];
          reg176 <= {({(wire20 ? {reg174, reg173} : (wire3 >>> reg172)),
                      $signed((reg173 >= wire170))} ?
                  wire3 : $unsigned((8'ha4))),
              $signed((wire1[(4'h8):(3'h6)] ? reg173 : wire0[(3'h4):(1'h0)]))};
          reg177 <= {$unsigned({$signed((wire168 ? reg175 : wire168)),
                  $unsigned((wire18 << wire3))}),
              {($unsigned(((8'had) ? (8'hb1) : wire18)) == {(^~wire1),
                      (wire170 != wire3)}),
                  (~^(~^{reg172, wire170}))}};
        end
      else
        begin
          reg174 <= $signed($signed($signed((8'ha7))));
          reg175 <= $signed(wire20[(1'h0):(1'h0)]);
          reg176 <= ($unsigned({$signed($unsigned(wire3)),
              (~(^~wire1))}) ^~ {wire2[(4'hf):(1'h1)]});
          reg177 <= reg171;
        end
    end
  assign wire178 = $unsigned(reg175[(1'h0):(1'h0)]);
  assign wire179 = (7'h44);
  assign wire180 = reg171;
  assign wire181 = (wire20 * $unsigned(wire20[(1'h1):(1'h0)]));
  assign wire182 = $signed((($unsigned($unsigned(wire4)) ?
                       (((8'h9f) ? wire1 : wire3) ?
                           $unsigned(wire18) : $unsigned(reg177)) : $unsigned((wire178 ?
                           (8'ha7) : reg176))) < reg176[(1'h1):(1'h1)]));
  module21 #() modinst184 (.wire25(wire2), .y(wire183), .wire23(wire180), .wire22(reg175), .wire24(reg174), .clk(clk), .wire26(wire182));
  assign wire185 = wire2;
  assign wire186 = ($signed((!($unsigned((8'haf)) ~^ $unsigned((8'ha3))))) ?
                       (~^($signed(wire0[(5'h11):(3'h5)]) >= (wire1 ?
                           (&(8'hb7)) : $unsigned(reg171)))) : ({$signed((wire3 ?
                                   reg177 : reg176)),
                               wire179} ?
                           ($signed($unsigned(reg173)) ?
                               $signed((wire179 && reg174)) : {(wire179 ?
                                       wire0 : (8'h9c)),
                                   (8'hb6)}) : wire18[(2'h3):(1'h1)]));
  assign wire187 = (((8'hbd) ^ (8'hac)) ?
                       ((~&wire182) <<< $unsigned(wire179)) : {($signed((~^(8'hae))) && ((~|wire2) ?
                               reg176[(1'h1):(1'h0)] : (wire2 ?
                                   reg176 : wire181)))});
  assign wire188 = $signed($unsigned({((wire168 << wire4) - (reg176 + wire170)),
                       (~&$signed(reg175))}));
  assign wire189 = wire183;
  assign wire190 = $unsigned((^wire20[(5'h11):(3'h4)]));
  assign wire191 = ((wire20[(4'hf):(4'hf)] ^ $unsigned((&$unsigned(wire189)))) >> $unsigned(((~(wire187 ?
                       wire0 : wire189)) && $unsigned($unsigned(wire182)))));
  assign wire192 = (8'hbb);
  assign wire193 = $signed((~wire0));
endmodule

module module21
#(parameter param167 = (|{((8'hb9) ? (~&((7'h41) ? (8'hb7) : (8'hbf))) : (~&{(8'hb1), (7'h44)})), ((&(!(8'h9c))) ? ((~(8'ha5)) <<< ((8'h9e) & (8'hab))) : {((8'hbf) ? (8'hb1) : (8'h9e))})}))
(y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire24;
  input wire [(4'h8):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire166;
  wire [(5'h14):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(3'h4):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire132;
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  assign y = {wire166,
                 wire163,
                 wire134,
                 wire47,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire111,
                 wire132,
                 reg165,
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
                 (1'h0)};
  module27 #() modinst48 (.wire31(wire24), .y(wire47), .wire30(wire25), .wire29(wire23), .wire28(wire22), .clk(clk));
  assign wire49 = wire26;
  assign wire50 = (8'h9d);
  assign wire51 = ($signed($unsigned((wire26 == {wire50, (8'ha6)}))) ?
                      (~|$signed($signed(wire47))) : (~^$unsigned((!$unsigned(wire47)))));
  assign wire52 = {(&$unsigned((wire51[(4'h9):(3'h4)] >>> (!wire25)))),
                      ((wire50[(3'h5):(1'h0)] ?
                              $unsigned($unsigned(wire47)) : wire26) ?
                          (((~&wire50) ^ wire24) ?
                              (wire47[(2'h2):(1'h1)] ?
                                  $unsigned(wire23) : (wire49 <<< wire50)) : $unsigned(wire51)) : wire49[(1'h1):(1'h0)])};
  assign wire53 = wire51;
  always
    @(posedge clk) begin
      reg54 <= $unsigned((wire25[(2'h2):(2'h2)] | $signed(($unsigned(wire24) >= ((8'had) == wire22)))));
      reg55 <= $unsigned(wire24);
      if (wire26)
        begin
          reg56 <= $unsigned(wire47);
          reg57 <= reg56;
          reg58 <= (&reg56);
          if ((+((reg55[(4'hc):(2'h3)] << $unsigned($signed(wire51))) < reg57[(2'h3):(2'h3)])))
            begin
              reg59 <= (|(($unsigned(reg55) ?
                      reg54[(1'h1):(1'h1)] : ((~|wire49) ?
                          wire25 : (^wire47))) ?
                  $signed($signed($signed(reg56))) : (((~|wire49) ?
                      $signed(reg55) : (~^wire23)) - $unsigned(wire26[(4'hd):(4'hc)]))));
              reg60 <= $unsigned(wire50[(3'h4):(1'h0)]);
              reg61 <= reg59;
              reg62 <= wire26;
            end
          else
            begin
              reg59 <= $unsigned(wire53);
              reg60 <= ((~|{{{wire49, (8'hb1)},
                      wire49[(3'h5):(2'h2)]}}) + (((wire22[(3'h7):(3'h7)] ?
                          reg54 : (~^wire52)) ?
                      $signed((reg56 ?
                          reg58 : (8'hb4))) : reg57[(3'h5):(1'h1)]) ?
                  (((wire52 * reg55) ?
                          reg60[(3'h4):(1'h1)] : reg58[(5'h13):(1'h1)]) ?
                      ((^(8'hb0)) != (wire51 ?
                          wire26 : wire49)) : ((~^reg59) <<< (8'ha1))) : $unsigned((((8'ha5) ~^ reg55) > $unsigned(reg57)))));
            end
        end
      else
        begin
          reg56 <= reg57;
          if (reg61[(4'ha):(2'h3)])
            begin
              reg57 <= reg56;
            end
          else
            begin
              reg57 <= wire51;
              reg58 <= (&wire24[(1'h0):(1'h0)]);
              reg59 <= $unsigned(wire26[(4'hc):(3'h4)]);
            end
          reg60 <= reg62[(3'h4):(3'h4)];
          reg61 <= (($signed($unsigned((reg56 ?
                  reg60 : reg56))) ^~ wire23[(3'h4):(2'h3)]) ?
              reg57[(2'h3):(2'h3)] : $signed(wire23[(3'h5):(2'h2)]));
        end
      reg63 <= $unsigned($signed(wire24[(4'hc):(4'hb)]));
      reg64 <= reg61;
    end
  module65 #() modinst112 (wire111, clk, wire51, wire52, wire50, wire22);
  module113 #() modinst133 (wire132, clk, wire51, reg62, reg64, reg60);
  assign wire134 = (8'hbd);
  module135 #() modinst164 (wire163, clk, wire22, wire49, reg62, reg64, reg54);
  always
    @(posedge clk) begin
      reg165 <= reg58[(5'h10):(2'h3)];
    end
  assign wire166 = reg57;
endmodule

module module5
#(parameter param17 = {(^~(-(!((8'hae) && (8'h9c))))), ((!{((8'ha8) < (8'haf)), {(8'hba), (8'hb7)}}) >= ({(|(8'hbb))} <= ({(8'hbd), (8'ha6)} ? ((8'h9d) > (8'ha3)) : {(8'hbe)})))})
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire13;
  wire [(3'h5):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $unsigned({wire7[(2'h2):(1'h0)]});
  assign wire12 = (~|$signed(wire8[(2'h3):(2'h2)]));
  assign wire13 = (wire7 > wire9[(3'h4):(2'h3)]);
  assign wire14 = ((wire8 << (({wire12, wire9} ^ (wire13 ?
                      wire6 : wire9)) & ((7'h40) ?
                      $unsigned(wire12) : (wire6 + wire9)))) <<< {wire8[(1'h1):(1'h0)],
                      $signed($unsigned($signed(wire13)))});
  assign wire15 = wire12;
  assign wire16 = $unsigned($signed((7'h42)));
endmodule

module module135  (y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire140;
  input wire signed [(5'h12):(1'h0)] wire139;
  input wire [(5'h10):(1'h0)] wire138;
  input wire [(4'hd):(1'h0)] wire137;
  input wire [(3'h6):(1'h0)] wire136;
  wire [(4'h8):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire155;
  wire [(5'h14):(1'h0)] wire154;
  wire signed [(2'h2):(1'h0)] wire145;
  wire [(5'h13):(1'h0)] wire144;
  wire signed [(5'h10):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire142;
  wire [(4'hd):(1'h0)] wire141;
  reg signed [(5'h14):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(5'h15):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(3'h6):(1'h0)] reg146 = (1'h0);
  assign y = {wire162,
                 wire155,
                 wire154,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire141 = $unsigned(((^(8'ha8)) ?
                       $unsigned(wire138[(4'hc):(3'h4)]) : wire140[(4'ha):(1'h1)]));
  assign wire142 = $signed((~^$signed((~|(wire136 ? (8'ha7) : (7'h44))))));
  assign wire143 = wire136;
  assign wire144 = wire137[(1'h0):(1'h0)];
  assign wire145 = $unsigned({((+{wire136}) < $signed((wire137 <<< (8'ha9)))),
                       ({((7'h41) <= wire140)} && $signed(((8'h9e) != wire140)))});
  always
    @(posedge clk) begin
      reg146 <= (!wire141);
      if ((+$signed(wire139)))
        begin
          reg147 <= $signed(wire145[(1'h0):(1'h0)]);
          reg148 <= $unsigned(((((~&wire139) <= (wire141 ?
              wire139 : wire144)) ~^ ((wire142 * wire137) ^~ $unsigned(wire145))) ^~ wire141[(3'h4):(1'h1)]));
          reg149 <= (wire144[(4'hb):(3'h6)] ? wire141 : reg147);
          if ($signed((((-(wire136 ? reg148 : wire140)) >> {reg147,
                  (wire141 ? wire144 : wire138)}) ?
              ({$unsigned(reg146)} ?
                  $signed($signed(reg148)) : (~&(wire138 <= (8'hb9)))) : wire143[(4'h9):(4'h9)])))
            begin
              reg150 <= (~^(^wire137));
              reg151 <= (8'ha2);
              reg152 <= ((8'h9f) ? $signed(wire139) : (8'ha0));
            end
          else
            begin
              reg150 <= $signed($signed({$signed((^reg148)),
                  wire140[(4'ha):(2'h3)]}));
            end
        end
      else
        begin
          reg147 <= $signed(wire137);
          reg148 <= reg146[(1'h0):(1'h0)];
        end
      reg153 <= ((wire138[(3'h5):(1'h1)] >>> $signed(reg149[(5'h11):(3'h7)])) != reg152[(1'h1):(1'h1)]);
    end
  assign wire154 = (&$unsigned((~wire140)));
  assign wire155 = ($unsigned(reg152[(2'h3):(2'h2)]) ?
                       reg153 : ($unsigned(reg150[(2'h2):(1'h0)]) ?
                           $signed(($signed((8'hbc)) ~^ $signed(wire137))) : wire154[(4'ha):(4'h9)]));
  always
    @(posedge clk) begin
      reg156 <= (~^$signed((+(&$unsigned(reg150)))));
      reg157 <= wire138;
      if ($signed($unsigned($unsigned(($unsigned(wire136) ?
          {reg156} : (-wire142))))))
        begin
          reg158 <= (wire138[(3'h4):(3'h4)] ?
              $unsigned(reg151[(3'h4):(2'h2)]) : wire139);
        end
      else
        begin
          reg158 <= wire145[(1'h1):(1'h0)];
          reg159 <= (wire137 ?
              (7'h41) : ($unsigned(((reg153 < reg146) << $signed(wire155))) + $signed($unsigned($unsigned(wire144)))));
          reg160 <= (($unsigned($unsigned(wire143)) >> (-($unsigned(reg158) != (reg146 ?
                  reg148 : (7'h42))))) ?
              {(((&reg158) ?
                      (wire155 ?
                          wire139 : reg152) : wire144[(3'h6):(2'h3)]) ~^ {(^~(8'hac)),
                      (!reg157)})} : (reg159 ? (8'hbe) : {reg159, wire154}));
        end
      reg161 <= wire139[(3'h5):(3'h5)];
    end
  assign wire162 = reg153;
endmodule

module module113  (y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire117;
  input wire [(3'h4):(1'h0)] wire116;
  input wire [(3'h6):(1'h0)] wire115;
  input wire [(5'h11):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire signed [(4'hc):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire123;
  wire [(5'h10):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire120;
  wire [(3'h5):(1'h0)] wire119;
  wire [(3'h5):(1'h0)] wire118;
  reg [(2'h2):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg124 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg131,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire118 = $unsigned((wire116[(3'h4):(3'h4)] && (~wire114)));
  assign wire119 = wire118;
  assign wire120 = wire118;
  assign wire121 = $signed(($signed(wire118[(3'h4):(2'h3)]) ?
                       (^~wire120) : (wire120 != $signed(wire116))));
  assign wire122 = (8'hbc);
  assign wire123 = ($signed(((^(^wire118)) << ((wire118 ? wire115 : wire119) ?
                       (+wire116) : (+wire116)))) ^ $signed(wire115[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg124 <= ($signed($signed((~$unsigned(wire116)))) ?
          (~&wire121[(3'h4):(3'h4)]) : ($signed({(~&wire120)}) | ((&(-wire117)) >>> wire119[(2'h2):(1'h1)])));
      reg125 <= ($signed(wire115[(3'h6):(1'h0)]) << (($unsigned((wire116 << wire119)) ?
          (wire115[(3'h6):(2'h2)] ?
              (+wire121) : (wire121 & wire115)) : wire121) <= $signed($signed((wire116 ?
          reg124 : (8'ha8))))));
      reg126 <= ($unsigned(wire115) ?
          {{{$signed(reg125)}}} : wire118[(2'h3):(2'h2)]);
    end
  assign wire127 = ($unsigned(wire117) <<< {(|$unsigned(wire115[(3'h5):(3'h5)]))});
  assign wire128 = $signed($unsigned($signed(wire115[(3'h4):(2'h2)])));
  assign wire129 = reg126[(3'h5):(2'h3)];
  assign wire130 = wire123[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg131 <= (~((&$signed($signed(wire122))) ?
          (($signed(wire121) >>> ((8'hab) == wire122)) >>> (+wire118[(3'h5):(2'h3)])) : (^reg126[(1'h0):(1'h0)])));
    end
endmodule

module module65
#(parameter param110 = (^~(((((8'hb6) ? (8'ha3) : (8'hae)) <= ((8'had) & (8'hba))) ? ({(8'ha5)} & ((7'h43) ? (8'hb4) : (8'hb4))) : {((7'h41) == (8'ha3))}) <= (((~|(8'hb6)) ~^ ((8'h9f) ? (8'hb1) : (8'hbb))) ? (-(^~(8'ha4))) : (((8'hac) >= (8'hb1)) ? (~|(8'h9c)) : ((8'hb0) ? (7'h40) : (8'hba)))))))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire69;
  input wire signed [(4'hb):(1'h0)] wire68;
  input wire [(4'he):(1'h0)] wire67;
  input wire [(3'h5):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire94;
  wire [(4'he):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire [(4'h9):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire70;
  reg [(5'h10):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(4'hf):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  assign y = {wire109,
                 wire94,
                 wire93,
                 wire92,
                 wire71,
                 wire70,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
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
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire70 = $unsigned((8'hbb));
  assign wire71 = wire68;
  always
    @(posedge clk) begin
      if ({(!$signed(wire70)),
          ($signed(($unsigned(wire69) ?
              $unsigned(wire69) : {wire68, wire66})) <= wire71[(4'h8):(4'h8)])})
        begin
          if (((wire68 ?
                  ((-$signed(wire70)) > $signed(wire69)) : $unsigned((&(~^wire66)))) ?
              $unsigned(((!wire66[(1'h0):(1'h0)]) >>> {$unsigned(wire71)})) : $unsigned($signed(((wire67 >> wire67) ?
                  (wire71 ? wire71 : wire67) : wire71[(3'h4):(2'h2)])))))
            begin
              reg72 <= $signed(wire70[(2'h3):(1'h0)]);
              reg73 <= {(({((8'ha5) << wire68)} <<< ((8'had) ?
                      $signed(wire68) : (8'hb4))) <<< {wire68[(1'h1):(1'h0)],
                      $unsigned($signed(wire69))}),
                  (~({(7'h41), (~^wire71)} >= ($unsigned(wire67) ?
                      $unsigned(wire67) : $signed((8'h9d)))))};
              reg74 <= (8'ha3);
              reg75 <= reg73;
            end
          else
            begin
              reg72 <= $unsigned($unsigned(((wire67[(4'h8):(2'h2)] ?
                      (wire67 ? wire69 : wire69) : reg73) ?
                  (~&$signed(reg75)) : (8'ha7))));
              reg73 <= (reg73[(2'h2):(1'h1)] ?
                  (~($unsigned($unsigned(reg75)) < reg72[(3'h6):(3'h5)])) : $signed(reg72[(3'h7):(3'h5)]));
              reg74 <= wire68;
            end
          reg76 <= (((8'ha8) || (~($signed(reg75) ?
                  (reg73 ? wire66 : (8'hae)) : ((8'hb7) ? reg74 : reg72)))) ?
              $signed($signed(((reg73 == (8'ha1)) <= (reg73 ?
                  wire70 : reg75)))) : wire71);
          reg77 <= reg72;
          reg78 <= $signed($signed(reg73[(4'hb):(3'h7)]));
          reg79 <= (wire69 ?
              (~|(^~(wire70[(1'h1):(1'h1)] ?
                  reg73 : reg76[(3'h7):(1'h1)]))) : (((wire70[(1'h0):(1'h0)] ?
                      reg74 : wire68[(1'h0):(1'h0)]) ?
                  wire71 : (^(^~reg73))) ^ wire69));
        end
      else
        begin
          reg72 <= (^~wire69);
          if (wire67[(3'h4):(1'h1)])
            begin
              reg73 <= reg73[(2'h2):(1'h0)];
            end
          else
            begin
              reg73 <= (&$unsigned((reg75 | (|wire70[(2'h3):(2'h2)]))));
              reg74 <= $signed($unsigned(({(reg72 > reg78),
                      wire67[(3'h5):(1'h1)]} ?
                  ($unsigned(reg73) & (reg76 ^ wire71)) : $signed((~&(8'ha0))))));
              reg75 <= $unsigned((reg75 ?
                  (-{$unsigned(wire69),
                      $unsigned(wire66)}) : (^$signed(wire67[(4'h9):(3'h7)]))));
            end
          reg76 <= (-$signed(reg76));
          if ($unsigned({$signed(reg75), (+reg74)}))
            begin
              reg77 <= (~|($unsigned(((reg78 ?
                  reg72 : (8'hbc)) < reg73[(4'h9):(4'h8)])) ^~ (wire68 ?
                  ((~|wire66) ~^ wire66[(3'h5):(2'h2)]) : (reg79 ?
                      (~&reg78) : $unsigned(wire70)))));
              reg78 <= $signed((wire71[(4'h8):(1'h0)] ?
                  (((&wire69) ?
                          (wire66 ? reg76 : reg73) : (wire71 <<< wire66)) ?
                      ({reg72, reg73} & (reg75 ?
                          wire70 : reg77)) : reg72[(1'h0):(1'h0)]) : $unsigned(reg76)));
            end
          else
            begin
              reg77 <= {$unsigned(wire68)};
              reg78 <= (|(reg76[(4'h8):(2'h2)] != $unsigned($unsigned($signed(reg72)))));
              reg79 <= $unsigned(reg76[(3'h7):(3'h6)]);
              reg80 <= reg78;
            end
        end
      if (({($unsigned((wire70 ^ wire67)) == wire68),
              (~^(reg74 == $unsigned(reg77)))} ?
          $signed($unsigned($unsigned((reg74 && reg74)))) : $signed(reg76)))
        begin
          reg81 <= $signed(({(!reg79)} ~^ wire67[(3'h4):(2'h3)]));
          reg82 <= ((reg75 ?
              (reg80[(2'h2):(1'h1)] ?
                  ($signed(wire66) ?
                      (+reg81) : $unsigned((8'ha9))) : wire66) : $unsigned(((^reg75) + $unsigned(reg79)))) ^~ reg80);
        end
      else
        begin
          if (((wire71 ?
              (reg72[(1'h0):(1'h0)] ?
                  reg75[(3'h7):(3'h6)] : (wire69 ?
                      (wire68 ?
                          reg82 : wire71) : (reg73 == wire67))) : (^($unsigned(reg79) ?
                  $unsigned((8'ha2)) : (8'hb9)))) ^ reg77[(3'h7):(3'h4)]))
            begin
              reg81 <= $unsigned(reg79[(4'hc):(1'h1)]);
              reg82 <= $signed(reg81[(3'h5):(3'h5)]);
            end
          else
            begin
              reg81 <= (^~((^(~&$signed(reg76))) - $unsigned($signed($signed((8'hb9))))));
              reg82 <= $unsigned(wire70[(2'h3):(1'h0)]);
              reg83 <= $unsigned($signed($signed(reg78[(3'h7):(1'h0)])));
              reg84 <= reg74[(1'h1):(1'h1)];
              reg85 <= $unsigned((reg80[(2'h3):(2'h2)] + wire66));
            end
        end
      if (($unsigned((~($signed(reg84) ? (+reg79) : reg82[(3'h7):(1'h1)]))) ?
          reg82 : $signed(((&(wire71 ?
              wire70 : wire70)) + wire67[(4'h9):(2'h3)]))))
        begin
          reg86 <= wire71;
          reg87 <= $signed(({reg75[(3'h6):(2'h3)], $signed($unsigned(reg72))} ?
              reg80 : wire68[(4'hb):(4'h8)]));
        end
      else
        begin
          reg86 <= wire68;
          reg87 <= ((({wire69, (reg85 < reg78)} ?
                  $signed(reg85[(4'ha):(1'h0)]) : (reg74 != {(8'hb4),
                      wire69})) ?
              $unsigned((^~(8'h9f))) : $signed((~|((8'hba) <= wire71)))) ^ $unsigned(reg81));
          reg88 <= $signed($unsigned((~(8'hbb))));
          if ($unsigned({({$signed((8'hb8))} && (|$unsigned(wire70))),
              reg72[(4'hc):(4'hc)]}))
            begin
              reg89 <= (~reg87);
              reg90 <= wire66;
              reg91 <= {$signed($signed(reg86)),
                  $signed(($signed(reg75[(3'h7):(3'h7)]) ?
                      (^~$unsigned(reg80)) : reg76[(3'h6):(1'h0)]))};
            end
          else
            begin
              reg89 <= wire68[(4'hb):(2'h2)];
              reg90 <= $signed((((((8'ha5) ? wire68 : wire69) ?
                  $unsigned(reg85) : (-reg87)) - reg85) <= $signed(wire69)));
            end
        end
    end
  assign wire92 = $signed(reg80[(2'h2):(1'h1)]);
  assign wire93 = $signed({(((-reg87) | $signed((8'ha4))) || $signed((reg86 ?
                          (8'hb8) : reg84))),
                      reg91[(3'h5):(3'h5)]});
  assign wire94 = reg79[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg95 <= $unsigned($unsigned($signed({$signed(reg75)})));
      if ((~|(!wire92[(1'h1):(1'h0)])))
        begin
          if ($unsigned(({(^~$signed(reg80))} ?
              {(reg86[(1'h0):(1'h0)] ?
                      reg82 : $signed(reg89))} : $unsigned((+$unsigned(reg80))))))
            begin
              reg96 <= $signed(reg80[(2'h2):(1'h1)]);
              reg97 <= reg87;
            end
          else
            begin
              reg96 <= $unsigned((~|(((reg82 ?
                      (8'hba) : reg81) <= $unsigned(reg88)) ?
                  (((8'hb2) < wire67) + (wire71 <= reg72)) : (~&(+wire94)))));
              reg97 <= (reg91[(1'h1):(1'h1)] & ($unsigned($unsigned((+reg79))) <<< {wire68}));
              reg98 <= (reg91 ? ({$signed((~^wire68))} | {reg83}) : wire68);
              reg99 <= (^$signed($unsigned(reg74)));
            end
          reg100 <= $signed(reg86[(3'h4):(2'h3)]);
        end
      else
        begin
          reg96 <= (8'hb3);
          reg97 <= {(&(&reg75[(3'h5):(2'h3)])),
              (reg98 * $unsigned(wire68[(4'h9):(4'h9)]))};
          reg98 <= wire67;
          reg99 <= (^~reg84[(4'he):(4'h8)]);
          reg100 <= $signed($signed($unsigned(reg79)));
        end
      if ($signed($unsigned({wire68[(3'h6):(1'h0)], reg72[(4'hb):(1'h1)]})))
        begin
          if (reg91[(3'h6):(2'h2)])
            begin
              reg101 <= (8'hb2);
            end
          else
            begin
              reg101 <= reg91;
              reg102 <= reg79[(4'hb):(4'h9)];
            end
          reg103 <= $signed((!wire68[(3'h7):(1'h1)]));
          reg104 <= reg95;
          reg105 <= reg81[(1'h0):(1'h0)];
          reg106 <= $signed({(~|(8'ha5))});
        end
      else
        begin
          reg101 <= {($signed($signed((reg72 ? reg100 : reg99))) ?
                  (^~$signed((reg80 <<< reg75))) : $signed(reg79[(1'h1):(1'h1)])),
              reg88[(2'h2):(2'h2)]};
        end
      reg107 <= reg73;
      reg108 <= $signed($unsigned({{{reg82}}}));
    end
  assign wire109 = (^~(wire70[(1'h1):(1'h1)] ?
                       {wire70, reg95} : (reg79 ?
                           ($unsigned(wire67) ?
                               reg78 : (reg85 >> reg105)) : (+(reg86 & reg91)))));
endmodule

module module27  (y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(4'h8):(1'h0)] wire29;
  input wire signed [(4'h9):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(2'h3):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire32;
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  assign y = {wire46,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire32,
                 reg45,
                 reg44,
                 reg43,
                 reg33,
                 (1'h0)};
  assign wire32 = $signed($unsigned(wire28[(3'h6):(2'h2)]));
  always
    @(posedge clk) begin
      reg33 <= $signed((~|(((wire28 ? wire28 : wire28) ?
          $signed(wire31) : wire32) < (~&(8'ha9)))));
    end
  assign wire34 = $signed(((~|{((7'h42) ? wire29 : wire32)}) ?
                      (!$unsigned(wire29)) : ($unsigned(wire31) ?
                          $signed(wire29) : ((~&wire28) & (wire29 ?
                              reg33 : wire28)))));
  assign wire35 = (|$unsigned(((((8'h9e) >> wire28) >> (wire29 ?
                          wire34 : reg33)) ?
                      wire28 : $unsigned(wire34[(2'h2):(1'h0)]))));
  assign wire36 = {({reg33[(4'ha):(1'h1)],
                          ((^~wire28) > $unsigned((8'h9e)))} || $signed({wire34[(4'h9):(2'h2)],
                          wire29[(2'h3):(1'h1)]})),
                      (&(($signed(wire30) >>> (wire32 ?
                          wire35 : (8'ha7))) >= $unsigned({wire29})))};
  assign wire37 = ($unsigned((((wire30 > reg33) ?
                              wire36[(4'hb):(4'h8)] : wire30) ?
                          wire32 : {(~&wire36), $signed(wire28)})) ?
                      ((((wire31 ? wire28 : reg33) ?
                                  $signed((8'hb0)) : (wire34 ^~ reg33)) ?
                              wire31 : ((~^wire28) ?
                                  (wire31 ?
                                      wire35 : wire34) : $unsigned((8'hba)))) ?
                          wire35 : wire36[(2'h2):(1'h1)]) : wire29);
  assign wire38 = {((7'h40) >> wire31[(4'ha):(3'h6)]),
                      ($signed(($unsigned(wire30) ?
                              (wire31 > wire35) : (reg33 == wire30))) ?
                          wire30 : {($signed(wire36) ?
                                  (&(8'hba)) : {wire34})})};
  assign wire39 = (-(^~((wire34[(3'h5):(3'h5)] >> (wire29 ? (8'hb7) : wire31)) ?
                      wire35[(3'h4):(1'h1)] : {$signed(wire36)})));
  assign wire40 = $unsigned({wire35[(3'h7):(3'h4)]});
  assign wire41 = ((~&wire37[(2'h2):(2'h2)]) || wire36);
  assign wire42 = ({(($unsigned(reg33) >>> (8'hb4)) | ((wire30 >>> wire38) ?
                              reg33 : (+wire36))),
                          (($unsigned(wire38) ?
                              ((8'ha7) ?
                                  wire29 : wire39) : $signed(reg33)) ^~ (wire37 ?
                              $unsigned(wire40) : $unsigned(wire34)))} ?
                      wire30[(1'h0):(1'h0)] : wire35[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg43 <= ((^wire29) ?
          (($signed((&wire32)) * (^$signed(wire39))) < $signed(wire30)) : ((8'h9e) && {wire30[(4'h8):(3'h7)],
              ($unsigned(wire30) ?
                  (wire38 << wire42) : (wire41 ? wire32 : wire29))}));
      reg44 <= $signed((|reg33));
    end
  always
    @(posedge clk) begin
      reg45 <= (wire30 && (wire42 * (~&((wire30 ? wire30 : wire34) ?
          ((8'h9d) ? reg33 : wire37) : {wire38}))));
    end
  assign wire46 = $unsigned($signed((~^((wire35 ? reg43 : wire31) ?
                      wire41 : (wire41 > wire29)))));
endmodule
