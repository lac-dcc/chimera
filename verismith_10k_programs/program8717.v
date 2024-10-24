module top
#(parameter param146 = ((+((^~{(8'hb3)}) >> (~^((8'haa) ? (8'haa) : (8'hb7))))) ~^ ({(~&(~|(8'ha1))), (^(~(8'ha6)))} || (~^((^(8'hb9)) != (&(8'hb4)))))), 
parameter param147 = ((param146 ^~ {((param146 || param146) ? (8'h9c) : (param146 ? param146 : param146))}) & {(~(((8'h9e) <<< param146) <<< (~|param146))), ((((8'ha2) | param146) && (param146 <= param146)) - (~|param146))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire145;
  wire signed [(3'h6):(1'h0)] wire144;
  wire signed [(4'h8):(1'h0)] wire143;
  wire signed [(4'hd):(1'h0)] wire142;
  wire signed [(5'h10):(1'h0)] wire140;
  wire [(4'hd):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire signed [(5'h14):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(4'ha):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire135;
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire73,
                 wire18,
                 wire16,
                 wire75,
                 wire76,
                 wire77,
                 wire133,
                 wire135,
                 (1'h0)};
  module4 #() modinst17 (wire16, clk, wire0, wire2, wire1, wire3);
  assign wire18 = $unsigned(({$unsigned($signed(wire0)), wire3[(4'he):(3'h5)]} ?
                      {wire16[(1'h0):(1'h0)],
                          $unsigned((wire16 != wire0))} : $unsigned({wire16})));
  module19 #() modinst74 (.wire21(wire2), .wire22(wire3), .y(wire73), .clk(clk), .wire24(wire18), .wire23(wire0), .wire20(wire16));
  assign wire75 = wire18;
  assign wire76 = (wire1 ~^ {wire2});
  assign wire77 = wire1;
  module78 #() modinst134 (wire133, clk, wire3, wire76, wire2, wire1);
  module19 #() modinst136 (wire135, clk, wire0, wire3, wire16, wire77, wire18);
  assign wire137 = $unsigned($unsigned($signed(wire18)));
  assign wire138 = $unsigned(((&(~&(&wire1))) ?
                       $unsigned(wire135[(1'h0):(1'h0)]) : wire73[(3'h7):(3'h5)]));
  assign wire139 = (wire0[(4'h9):(3'h6)] ?
                       (wire133[(1'h1):(1'h0)] ^~ (wire138[(3'h4):(3'h4)] >> ($unsigned(wire137) << {wire1}))) : (&{wire73[(4'h8):(2'h3)]}));
  module78 #() modinst141 (.wire80(wire139), .wire81(wire18), .y(wire140), .wire79(wire135), .wire82(wire75), .clk(clk));
  assign wire142 = wire140[(1'h0):(1'h0)];
  assign wire143 = $signed(($unsigned({wire138}) ?
                       (wire76 ?
                           {wire135,
                               $unsigned(wire137)} : wire133) : {$signed(wire139)}));
  assign wire144 = $unsigned((wire140[(4'he):(2'h3)] ?
                       (!wire3[(3'h7):(3'h6)]) : ({wire133[(3'h4):(1'h0)],
                           (wire2 ?
                               wire16 : wire143)} != wire2[(3'h6):(3'h5)])));
  assign wire145 = wire138[(1'h1):(1'h1)];
endmodule

module module78
#(parameter param132 = (~|({(^{(8'ha2)})} > ({((8'hac) ~^ (8'h9e))} && ({(8'h9c)} ? (^~(8'ha2)) : ((8'ha8) != (8'hb6)))))))
(y, clk, wire82, wire81, wire80, wire79);
  output wire [(32'h15b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire82;
  input wire signed [(5'h14):(1'h0)] wire81;
  input wire [(4'hd):(1'h0)] wire80;
  input wire [(5'h11):(1'h0)] wire79;
  wire [(5'h13):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire130;
  wire [(5'h13):(1'h0)] wire129;
  wire signed [(5'h10):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire127;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire109;
  wire signed [(4'hf):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire105;
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg121 = (1'h0);
  reg [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(4'hb):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  assign y = {wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire105,
                 reg126,
                 reg125,
                 reg124,
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
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  module83 #() modinst106 (.y(wire105), .clk(clk), .wire87(wire81), .wire85(wire82), .wire86(wire80), .wire84((8'ha0)), .wire88(wire79));
  assign wire107 = {{{$unsigned((wire80 ? wire82 : wire80)),
                               $signed($unsigned(wire79))},
                           ((((8'hb5) ? wire81 : wire79) ?
                               $unsigned(wire81) : (~|wire80)) >= (~(wire81 ~^ wire80)))},
                       wire79};
  assign wire108 = $signed(($signed(((wire81 ? wire107 : wire105) ?
                           $unsigned((8'h9f)) : (wire81 >> wire81))) ?
                       wire105 : (($signed(wire105) ^ (wire79 + wire81)) ?
                           wire105[(4'hc):(3'h5)] : $unsigned(wire81[(4'ha):(2'h3)]))));
  assign wire109 = (~^(-(&{$signed((8'hbe)), {(8'hb5), wire81}})));
  assign wire110 = $signed(wire82[(4'h8):(3'h7)]);
  always
    @(posedge clk) begin
      if ($signed(wire82))
        begin
          if ({wire81[(3'h7):(1'h1)]})
            begin
              reg111 <= wire79;
              reg112 <= wire107;
              reg113 <= $signed(wire82);
            end
          else
            begin
              reg111 <= $signed($unsigned((reg113[(2'h2):(1'h0)] ?
                  wire82[(1'h0):(1'h0)] : ($unsigned(reg112) ?
                      wire81 : {wire79, reg113}))));
              reg112 <= $signed(wire81);
              reg113 <= (&$signed((wire105[(4'hb):(2'h3)] >= ((8'hb5) != (8'haf)))));
              reg114 <= wire79[(2'h3):(1'h0)];
            end
          reg115 <= wire81;
          reg116 <= wire107;
          reg117 <= $signed($signed((^{$unsigned((8'ha8))})));
        end
      else
        begin
          reg111 <= {wire107, (wire79 ^ wire105[(4'h8):(1'h0)])};
          reg112 <= (!(wire107 && $unsigned({wire105,
              (wire109 ? wire105 : reg114)})));
          reg113 <= $unsigned(wire79);
        end
      reg118 <= reg113;
      if ((wire110 ?
          (reg114[(4'h8):(4'h8)] ?
              wire82 : (+$unsigned((-wire79)))) : {(((wire108 ?
                      wire81 : wire79) + $unsigned((8'hb2))) ?
                  $unsigned((7'h42)) : (!wire108[(3'h5):(2'h2)]))}))
        begin
          reg119 <= ((|$unsigned($signed((~&reg115)))) << $unsigned(reg115[(5'h11):(2'h2)]));
          reg120 <= ($unsigned((reg111 ?
              $unsigned((reg115 * (8'ha9))) : $unsigned($signed(reg112)))) ~^ (~&reg114[(2'h3):(2'h3)]));
          if (wire81)
            begin
              reg121 <= wire109;
              reg122 <= (!$unsigned($signed(wire80[(3'h5):(1'h0)])));
              reg123 <= (8'hb6);
              reg124 <= reg111;
              reg125 <= {(((|(reg121 && reg123)) ?
                      $signed((reg114 ?
                          wire108 : reg118)) : wire107) * (8'haf)),
                  $signed($unsigned(reg113[(2'h2):(1'h0)]))};
            end
          else
            begin
              reg121 <= ($unsigned(((~reg113[(2'h2):(1'h0)]) != ((^(8'haa)) ?
                      (~^reg116) : reg122[(4'hb):(4'hb)]))) ?
                  (|wire81) : $signed(reg123[(3'h5):(2'h2)]));
            end
          reg126 <= {(|(reg124[(1'h0):(1'h0)] ?
                  $signed(wire107[(3'h5):(1'h1)]) : wire81[(4'ha):(1'h0)]))};
        end
      else
        begin
          reg119 <= reg126;
          reg120 <= (((reg112[(1'h1):(1'h0)] ?
                  ((8'hb7) || (!wire105)) : (reg121[(3'h7):(2'h2)] ?
                      $unsigned(reg119) : reg116)) ?
              reg119[(4'hf):(4'h9)] : {reg126}) > $signed($signed($signed($signed(reg114)))));
        end
    end
  assign wire127 = wire81[(5'h14):(4'he)];
  assign wire128 = reg122;
  assign wire129 = (~|{((7'h40) >>> $signed(reg116)), $unsigned(reg120)});
  assign wire130 = (-(~|{$unsigned((reg118 >= (8'ha1))),
                       wire128[(3'h7):(3'h6)]}));
  assign wire131 = (~(wire80[(3'h7):(3'h5)] ^ reg124[(3'h5):(2'h3)]));
endmodule

module module19
#(parameter param71 = ((((((8'hae) >> (8'hb3)) || ((8'ha4) ? (8'hb5) : (7'h42))) == (((8'hae) >>> (8'ha4)) ? ((8'had) ? (8'hba) : (8'ha9)) : ((8'hbc) ? (8'hb2) : (7'h40)))) ? ((((8'ha7) ? (8'h9f) : (8'ha8)) ? {(8'hba), (7'h40)} : ((8'hac) ? (8'hb1) : (8'hbb))) ? (((8'hae) == (8'h9c)) ? ((8'hbc) ? (8'hb6) : (8'hab)) : (^(8'hb0))) : {((8'hb2) || (8'ha7)), (!(8'hac))}) : (~&(^((7'h42) >> (8'hb1))))) & ((+({(8'h9e)} ? {(8'hb5), (8'hb0)} : (~&(8'ha5)))) ? ((^~(!(8'hac))) ? (|((8'hb0) || (8'hb4))) : (~&{(8'hb3)})) : (!(~&((8'ha9) << (8'hb5)))))), 
parameter param72 = {(^{(|((8'hb1) ? param71 : (8'h9c))), (7'h40)}), (({param71} ? {(param71 ? param71 : param71)} : param71) != (&((8'ha9) >> (param71 - param71))))})
(y, clk, wire20, wire21, wire22, wire23, wire24);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire21;
  input wire signed [(3'h6):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire23;
  input wire [(4'h8):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(4'hc):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire55;
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire25,
                 wire26,
                 wire34,
                 wire35,
                 wire55,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire25 = $signed(wire24);
  assign wire26 = (!$signed($unsigned($signed(wire22))));
  always
    @(posedge clk) begin
      if (((&$unsigned((^$signed(wire20)))) ?
          $unsigned(($signed(wire24) <= $signed((~&wire26)))) : (wire20[(4'h9):(1'h1)] >> ({(wire25 <= wire22),
              (wire24 << wire23)} >>> wire20))))
        begin
          reg27 <= ((({wire20} <= $unsigned(((8'ha4) <<< wire26))) | ((~wire21[(3'h5):(1'h0)]) ?
              $unsigned($signed(wire22)) : (!(8'hb0)))) == ($signed({(!wire23),
                  (wire24 >> wire21)}) ?
              (^$signed((~|wire22))) : $signed(((wire25 ^ wire24) > wire23))));
        end
      else
        begin
          reg27 <= wire22;
          if ((reg27[(3'h7):(2'h3)] ?
              {((~$signed(wire22)) | $unsigned($signed(wire23)))} : wire23))
            begin
              reg28 <= wire21[(3'h4):(3'h4)];
              reg29 <= (~|wire24[(4'h8):(1'h0)]);
            end
          else
            begin
              reg28 <= $unsigned((&$signed(wire25)));
              reg29 <= $signed(($signed((wire23[(2'h3):(2'h2)] ^ {(8'h9f),
                  wire20})) ~^ ($unsigned($unsigned(wire23)) >= ({reg28,
                      (8'ha5)} ?
                  reg27 : (!wire26)))));
              reg30 <= (8'hbc);
              reg31 <= {(&{{$signed(wire21), ((7'h44) ? reg29 : reg27)},
                      $unsigned($signed(reg27))})};
              reg32 <= ($signed($signed(reg28[(4'h9):(1'h1)])) ?
                  (($unsigned((~|wire20)) ^~ $signed($signed(wire23))) << ($signed($unsigned(reg30)) ?
                      ((wire22 ? wire26 : reg29) ?
                          $signed(wire22) : {reg27}) : ((wire23 == wire26) ^ $signed(wire21)))) : ((8'hac) - wire24[(4'h8):(4'h8)]));
            end
          reg33 <= wire24[(3'h4):(1'h1)];
        end
    end
  assign wire34 = wire23[(2'h3):(2'h3)];
  assign wire35 = (~|(+($signed((wire34 || (8'hbf))) ?
                      $signed($signed(reg27)) : $signed({wire24}))));
  module36 #() modinst56 (.wire38(reg28), .clk(clk), .wire41(wire22), .wire39(wire26), .wire37(reg33), .y(wire55), .wire40(wire20));
  assign wire57 = wire24;
  assign wire58 = (~|{$signed($unsigned($unsigned(wire26))),
                      $signed($signed($signed(wire34)))});
  always
    @(posedge clk) begin
      if ($unsigned(wire57[(4'hc):(1'h0)]))
        begin
          if ((^$signed((wire57[(3'h7):(1'h0)] ^~ ($signed(reg31) ?
              (wire26 ? (8'h9f) : reg31) : $unsigned(wire55))))))
            begin
              reg59 <= (({{wire55}} <<< (8'hb2)) | (+$signed($signed($unsigned(reg32)))));
              reg60 <= ((^~(^($unsigned(wire23) - $unsigned(reg59)))) + reg59);
            end
          else
            begin
              reg59 <= $signed({(reg30 ?
                      ($signed(reg31) <= $unsigned(reg31)) : reg32[(4'ha):(1'h1)])});
              reg60 <= wire58;
              reg61 <= ($unsigned(($unsigned((reg30 ?
                      wire21 : reg30)) ^~ $signed($signed(reg33)))) ?
                  $signed(wire21) : wire22);
              reg62 <= ($unsigned(reg32[(1'h1):(1'h0)]) ?
                  (-$unsigned(($unsigned(reg30) ?
                      (~|wire24) : (reg29 | wire24)))) : ($signed(($unsigned(wire22) ?
                      wire24 : (^~(8'h9e)))) >>> ((8'haf) < wire34)));
            end
          if (((reg30 ? $unsigned(reg61) : $unsigned(((|reg30) || (&reg61)))) ?
              reg31 : $signed((~(&wire22[(2'h3):(1'h0)])))))
            begin
              reg63 <= (&reg30);
              reg64 <= reg28[(2'h2):(1'h0)];
              reg65 <= $unsigned($signed(reg31[(4'h8):(3'h6)]));
            end
          else
            begin
              reg63 <= {(8'hb7)};
            end
          reg66 <= $unsigned((&(-((8'h9d) ? $unsigned(wire23) : (~reg27)))));
          reg67 <= (reg66[(1'h1):(1'h0)] != {($signed(reg31[(3'h5):(3'h5)]) ?
                  reg32 : wire26)});
        end
      else
        begin
          reg59 <= $unsigned($signed((reg29[(3'h7):(3'h7)] ?
              (wire26 << $unsigned(wire25)) : ($signed(wire20) ?
                  reg60[(2'h3):(2'h3)] : reg33[(4'he):(4'ha)]))));
          reg60 <= reg67;
          reg61 <= reg64[(1'h1):(1'h0)];
          reg62 <= ($signed($signed($signed((wire25 ?
              wire26 : reg61)))) && reg62);
          if ($signed(((wire57 ?
              $signed(wire22[(1'h0):(1'h0)]) : $unsigned($signed(reg32))) <= $unsigned(((reg66 ?
              reg64 : reg32) ^ $signed(reg61))))))
            begin
              reg63 <= $unsigned((7'h43));
              reg64 <= $unsigned((wire21 ?
                  $signed(reg33) : $unsigned(reg59[(2'h3):(1'h0)])));
              reg65 <= $signed({$unsigned((reg61 ?
                      (7'h44) : $unsigned(wire57))),
                  $signed($unsigned((wire20 < wire57)))});
              reg66 <= (|$unsigned($unsigned((-(reg65 ? wire58 : (8'had))))));
            end
          else
            begin
              reg63 <= (wire34[(2'h2):(1'h1)] ^~ $unsigned($signed(reg29[(1'h1):(1'h0)])));
              reg64 <= reg29[(1'h1):(1'h1)];
              reg65 <= $signed((reg65 ~^ (-wire58)));
              reg66 <= ($signed($signed(((reg64 << reg33) == $signed(reg63)))) < $unsigned($signed(reg59)));
            end
        end
      reg68 <= $signed((&$signed((|{reg30}))));
      reg69 <= wire26[(4'hc):(2'h2)];
      reg70 <= ((~&($signed((reg66 ^ reg62)) ?
          reg65 : (-{(8'ha2)}))) <= (~^(~^(reg31 ?
          reg67 : ((8'h9c) ? (7'h41) : reg66)))));
    end
endmodule

module module4
#(parameter param14 = (((^~(~^((8'haf) ? (8'hb3) : (8'ha5)))) ? (({(8'ha4)} > (~|(8'h9e))) - ((^~(8'hb1)) ? (~(8'h9e)) : ((7'h43) ? (8'hbc) : (8'hbe)))) : ((8'ha8) ? (&(8'hb5)) : ((&(8'hbf)) ? ((8'hb5) + (7'h44)) : ((8'hbd) ? (8'hac) : (8'ha1))))) >>> (({(~^(8'hae)), ((8'ha2) << (8'hba))} << {((8'hbf) ? (8'hac) : (8'hab))}) ? {(-((8'hab) <= (8'hb5))), (^~(7'h42))} : (&(+(~&(8'hba)))))), 
parameter param15 = (~^(~&(param14 ? ((&(8'hb0)) == (8'hbf)) : (~^(param14 && param14))))))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire6;
  input wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire9;
  assign y = {wire13, wire12, wire11, wire10, wire9, (1'h0)};
  assign wire9 = (~^wire8[(2'h3):(1'h1)]);
  assign wire10 = wire6;
  assign wire11 = $unsigned((wire9[(3'h4):(1'h1)] ?
                      (~wire10) : $unsigned($signed($signed(wire7)))));
  assign wire12 = wire7;
  assign wire13 = $unsigned(wire11);
endmodule

module module36
#(parameter param54 = ((~((8'hb1) ? (~|(~&(8'hb9))) : (~|((8'hb0) ? (7'h42) : (8'hb2))))) <= (((((8'hbd) ? (8'hab) : (8'hbd)) ? (^(8'hb9)) : ((8'hb4) ? (8'ha9) : (8'ha7))) ? (((8'ha6) == (8'haf)) ? (8'h9d) : ((7'h42) ^~ (8'hb2))) : ((-(8'h9c)) < ((8'ha8) ^~ (8'hbe)))) && ({((8'hba) <= (8'ha4)), {(8'hb0), (8'haf)}} ? ({(8'ha1), (8'hb5)} <<< (!(8'hbc))) : {{(8'ha5), (8'ha5)}}))))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire signed [(5'h13):(1'h0)] wire39;
  input wire [(5'h14):(1'h0)] wire38;
  input wire [(5'h11):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 (1'h0)};
  assign wire42 = wire40;
  assign wire43 = $unsigned((+$signed($unsigned(wire41))));
  assign wire44 = wire41[(1'h0):(1'h0)];
  assign wire45 = ((wire41 ?
                      (((&(8'hb7)) | (~^wire43)) ^~ (~|$unsigned(wire38))) : (~|wire39[(3'h4):(2'h3)])) && $signed(wire42[(3'h4):(1'h0)]));
  assign wire46 = wire43;
  assign wire47 = {wire46, (^wire43[(2'h3):(1'h1)])};
  assign wire48 = $signed((&($unsigned((-wire45)) ? (8'had) : wire44)));
  assign wire49 = wire43[(3'h5):(2'h2)];
  assign wire50 = wire46;
  assign wire51 = {{wire37, $signed(({wire43} ? $unsigned(wire40) : wire38))}};
  assign wire52 = (~(!$signed(wire51)));
  assign wire53 = $unsigned($unsigned((^($signed(wire42) ?
                      {wire45, wire37} : wire41))));
endmodule

module module83
#(parameter param103 = ((|(~|(~|((8'hbf) << (8'ha8))))) ? ((({(8'hbd), (8'haf)} ^~ ((8'h9e) && (8'hb3))) ? (~&((8'h9f) ? (8'h9d) : (8'hb1))) : (|(&(8'hbb)))) ? {(((8'hb5) * (8'hb0)) ? ((8'hb3) || (8'hb6)) : ((8'hbb) ? (8'hbc) : (8'hb5)))} : {{(~^(8'ha2))}}) : {{(-(8'h9c)), ((^(8'h9d)) ~^ {(8'ha7)})}}), 
parameter param104 = (|(~|param103)))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire88;
  input wire signed [(4'ha):(1'h0)] wire87;
  input wire signed [(4'hd):(1'h0)] wire86;
  input wire signed [(4'ha):(1'h0)] wire85;
  input wire signed [(3'h4):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(4'h8):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire97;
  wire signed [(5'h13):(1'h0)] wire96;
  wire [(5'h13):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(4'hc):(1'h0)] wire89;
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg [(2'h2):(1'h0)] reg94 = (1'h0);
  reg [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire91,
                 wire90,
                 wire89,
                 reg102,
                 reg101,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  assign wire89 = (~&$signed((((wire88 < wire87) ?
                      {wire87} : wire87[(3'h6):(3'h6)]) + {$signed(wire88),
                      (~wire84)})));
  assign wire90 = $unsigned((~|($signed(wire89[(1'h1):(1'h1)]) + ((wire89 ?
                      wire89 : wire89) < wire85[(2'h2):(2'h2)]))));
  assign wire91 = (wire90[(4'hf):(4'hf)] <<< wire89[(4'hc):(3'h7)]);
  always
    @(posedge clk) begin
      reg92 <= ((((~^{wire86}) < (^wire87[(3'h7):(3'h5)])) >= (wire90[(5'h10):(1'h1)] ?
          ($unsigned(wire88) - {(8'hb4),
              (8'ha8)}) : wire91[(4'h9):(4'h8)])) > wire84[(1'h1):(1'h1)]);
      reg93 <= wire91;
      reg94 <= (&({wire87[(3'h5):(3'h5)]} <<< (wire90[(3'h4):(2'h2)] ?
          (!wire88) : ($signed(wire87) ? (^wire91) : {reg93}))));
      reg95 <= wire91;
    end
  assign wire96 = $signed(wire91);
  assign wire97 = (8'hb8);
  assign wire98 = $unsigned($unsigned(wire89[(3'h6):(2'h2)]));
  assign wire99 = (reg94 & $signed((((|wire90) ?
                      (~^(8'ha1)) : (wire88 ~^ wire97)) ~^ $signed(wire84))));
  assign wire100 = wire88[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg101 <= ((reg95 < wire100) ?
          (~&{wire100[(4'hc):(4'hb)],
              ({reg92} - (wire86 - wire98))}) : ($signed($unsigned((wire84 >> (8'ha1)))) ?
              ((wire100[(1'h0):(1'h0)] ?
                  (~&reg93) : (reg93 ?
                      reg95 : wire98)) == reg92[(1'h1):(1'h1)]) : (8'hbc)));
      reg102 <= (((wire91[(3'h7):(2'h2)] >> $unsigned((8'hb9))) ?
          $unsigned(((+reg101) << $unsigned(wire88))) : (8'hab)) + wire86);
    end
endmodule
