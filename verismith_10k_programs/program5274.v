module top
#(parameter param168 = {((8'ha5) ? ((~^((8'ha5) <= (8'h9e))) ? (((8'hba) ? (8'haf) : (8'hba)) ? ((7'h40) ? (8'haa) : (7'h42)) : ((8'ha4) * (8'hb0))) : (~&((8'h9c) ~^ (8'ha3)))) : (~&(-{(8'ha6)})))}, 
parameter param169 = (8'ha4))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h27a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire0;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire160;
  wire [(4'hd):(1'h0)] wire142;
  wire signed [(3'h4):(1'h0)] wire140;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire51;
  reg signed [(5'h12):(1'h0)] reg167 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg166 = (1'h0);
  reg [(2'h2):(1'h0)] reg165 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg143 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg [(2'h3):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg [(5'h14):(1'h0)] reg149 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg151 = (1'h0);
  reg [(5'h15):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg155 = (1'h0);
  reg [(3'h7):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg157 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg158 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg159 = (1'h0);
  assign y = {wire162,
                 wire160,
                 wire142,
                 wire140,
                 wire54,
                 wire53,
                 wire14,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire40,
                 wire51,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg22,
                 reg23,
                 reg24,
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
                 reg37,
                 reg38,
                 reg39,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 (1'h0)};
  module4 #() modinst15 (wire14, clk, wire3, wire0, wire1, wire2, (8'ha2));
  assign wire16 = wire3[(4'hf):(2'h3)];
  assign wire17 = ($signed((&wire0)) ?
                      ($signed(wire0) ?
                          wire1 : (-wire2[(1'h1):(1'h0)])) : {(wire14 != wire3),
                          ($unsigned($signed(wire1)) ?
                              $unsigned($signed(wire1)) : ((-wire2) ?
                                  (8'ha0) : (wire2 << wire16)))});
  assign wire18 = (((8'hb8) ^~ $signed($signed((wire2 ~^ wire0)))) && wire3);
  assign wire19 = wire14;
  assign wire20 = (~wire0[(1'h1):(1'h0)]);
  assign wire21 = (wire0[(4'h8):(3'h7)] >= $signed(wire14));
  always
    @(posedge clk) begin
      if ((8'ha1))
        begin
          reg22 <= (|$signed($unsigned($signed({wire2}))));
          reg23 <= wire14[(1'h1):(1'h1)];
        end
      else
        begin
          if (reg23)
            begin
              reg22 <= wire19;
            end
          else
            begin
              reg22 <= wire17;
              reg23 <= ($signed(reg22[(3'h6):(3'h6)]) ?
                  $signed({{wire17[(4'ha):(4'h8)]},
                      ((~(8'h9c)) ?
                          {wire3,
                              wire21} : $unsigned(wire2))}) : $unsigned(reg22));
              reg24 <= wire3[(4'hf):(4'hb)];
            end
          if ((&$signed(wire19)))
            begin
              reg25 <= $unsigned($signed($signed((+wire2[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg25 <= (wire0[(3'h5):(1'h1)] ^~ (~^$signed($signed(reg24[(2'h3):(1'h1)]))));
              reg26 <= (($unsigned(($unsigned(wire1) ?
                      {(8'hbc), wire3} : (-wire19))) ?
                  wire16 : ($signed((-(8'hb6))) ?
                      (8'hae) : wire2)) <<< {$signed(wire0), wire18});
              reg27 <= $signed((&$signed(wire14[(2'h2):(1'h0)])));
              reg28 <= (!((|$signed(wire2)) ?
                  ((~^$unsigned(wire21)) <= {wire16[(5'h11):(4'hc)],
                      $signed(wire21)}) : (!{reg23[(2'h2):(2'h2)], wire18})));
            end
          if (reg26[(3'h6):(2'h2)])
            begin
              reg29 <= wire21[(1'h0):(1'h0)];
              reg30 <= (reg25[(5'h12):(5'h12)] >> $signed((($signed((8'ha3)) | $unsigned(wire14)) ?
                  reg26[(4'ha):(4'h8)] : reg26)));
              reg31 <= ((~^wire14) > (^wire0[(2'h2):(2'h2)]));
            end
          else
            begin
              reg29 <= ($unsigned(({(wire0 ? reg29 : reg27),
                          (wire3 ? reg23 : wire1)} ?
                      $signed(reg26) : ($unsigned(wire18) ?
                          (wire20 != wire2) : {reg26}))) ?
                  $unsigned((((7'h41) != (wire2 ? reg23 : reg27)) ?
                      wire1[(3'h4):(1'h0)] : (reg22 ?
                          reg31 : (reg26 < reg30)))) : $unsigned(wire2[(3'h5):(1'h0)]));
              reg30 <= $signed((~&{$unsigned($signed((8'hb6))),
                  wire0[(3'h5):(2'h2)]}));
              reg31 <= ($signed(((((8'ha8) ? wire21 : (8'hbd)) ?
                          (wire18 ^ wire14) : reg28) ?
                      $unsigned($signed(reg26)) : wire2)) ?
                  ($unsigned({(^wire20)}) ?
                      reg22 : (~|{(reg25 ? (8'hb9) : (8'hb7)),
                          $signed((8'hb4))})) : ($unsigned(wire17[(2'h2):(2'h2)]) <= (wire20 ^~ $signed($unsigned((8'hbb))))));
              reg32 <= $unsigned((+reg26[(4'hb):(3'h5)]));
              reg33 <= reg31[(4'hd):(3'h5)];
            end
          reg34 <= wire1;
          reg35 <= {(wire20 <<< {wire14, reg23[(2'h3):(2'h3)]})};
        end
      reg36 <= (8'hba);
      reg37 <= ($unsigned(wire2[(3'h5):(3'h4)]) ?
          ((~|(((8'hbc) ?
              reg28 : reg26) + reg23[(1'h0):(1'h0)])) | ({wire14[(2'h2):(2'h2)],
                  (wire21 ? wire21 : (8'hbc))} ?
              $unsigned($unsigned((8'h9f))) : reg32[(4'h8):(4'h8)])) : (^~{(~&wire18),
              (^wire21)}));
      reg38 <= (^~$unsigned(reg33[(1'h1):(1'h1)]));
      reg39 <= reg29;
    end
  assign wire40 = reg27[(3'h6):(2'h3)];
  module41 #() modinst52 (.y(wire51), .wire42(wire14), .wire44(reg29), .clk(clk), .wire45(reg30), .wire43(reg26));
  assign wire53 = $unsigned(reg30[(2'h3):(2'h3)]);
  assign wire54 = reg39;
  module55 #() modinst141 (wire140, clk, reg32, wire17, reg29, wire18, reg28);
  assign wire142 = $signed((~(wire17 >= ($unsigned(wire16) ?
                       $signed(reg28) : reg28))));
  always
    @(posedge clk) begin
      reg143 <= $unsigned(wire140[(2'h2):(2'h2)]);
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((|(wire2 ?
          wire17[(2'h3):(2'h3)] : $unsigned(reg26))))))
        begin
          reg144 <= $signed((reg24[(3'h4):(1'h0)] ?
              {(~&(wire14 ? wire1 : reg22))} : reg143));
        end
      else
        begin
          reg144 <= (~&wire54[(4'hd):(4'hc)]);
          reg145 <= ((|$signed(((reg31 & wire19) ? (!(8'hb3)) : reg29))) ?
              $signed(wire1[(3'h4):(1'h0)]) : $signed($signed(reg144[(3'h5):(3'h4)])));
          reg146 <= $unsigned(reg34[(3'h7):(1'h1)]);
        end
      reg147 <= wire3[(4'h9):(4'h8)];
      reg148 <= {(8'hb2)};
      reg149 <= ($unsigned((^{{wire2, wire16},
          wire18[(4'h8):(2'h3)]})) > wire142[(1'h0):(1'h0)]);
      reg150 <= (~^(7'h40));
    end
  always
    @(posedge clk) begin
      if ({(reg24[(4'h9):(1'h0)] ?
              (|$unsigned((^~wire19))) : $unsigned((!(reg27 >>> reg147))))})
        begin
          reg151 <= ($unsigned(($signed((wire19 ?
              reg22 : wire142)) ^ (-wire40[(1'h1):(1'h1)]))) ^ reg147);
          if (reg25)
            begin
              reg152 <= ((wire16[(3'h4):(1'h0)] ?
                  reg23[(1'h0):(1'h0)] : reg36) << wire19);
              reg153 <= $unsigned({(($signed(wire3) ?
                      wire3 : reg39) ^ {wire20[(2'h2):(1'h0)]}),
                  ($signed((wire54 && reg148)) != $unsigned((~|wire2)))});
            end
          else
            begin
              reg152 <= (7'h44);
              reg153 <= reg36[(3'h5):(3'h5)];
              reg154 <= $signed(reg148);
              reg155 <= {$unsigned(wire40[(2'h2):(1'h1)]),
                  {(~&(|(reg24 ? reg39 : (8'ha8)))), wire21}};
            end
          reg156 <= $unsigned($signed($unsigned($signed((~reg38)))));
          reg157 <= (~&{$signed({{reg154, reg156}, reg32[(4'h9):(4'h9)]}),
              ({((8'hbb) ? wire19 : reg149), (-reg37)} >= (wire0 ?
                  {(8'ha8), reg30} : (~^reg38)))});
          reg158 <= (^(reg156 ?
              ((reg144 >>> (!reg154)) & {(^reg23),
                  $signed(reg153)}) : reg29[(4'hc):(3'h6)]));
        end
      else
        begin
          reg151 <= $signed(($unsigned(reg37) ?
              $signed(wire19[(1'h1):(1'h0)]) : $unsigned($signed((reg144 << (8'hb2))))));
          reg152 <= $signed($signed($unsigned(((reg39 ? (7'h42) : wire19) ?
              (wire3 != reg34) : $unsigned(wire3)))));
          if (reg23[(3'h5):(3'h5)])
            begin
              reg153 <= $signed((+reg155));
              reg154 <= (8'h9f);
              reg155 <= (!wire17[(3'h4):(2'h3)]);
              reg156 <= reg27;
              reg157 <= reg157[(1'h0):(1'h0)];
            end
          else
            begin
              reg153 <= $signed(wire21[(4'ha):(4'ha)]);
              reg154 <= (|((&wire40) == $unsigned(reg153)));
            end
          reg158 <= (|(wire142 ?
              ($unsigned(reg148[(2'h3):(2'h3)]) && (~|$unsigned(wire17))) : ((-(reg38 > reg147)) + ($unsigned(wire14) ?
                  $signed((8'ha6)) : (wire53 ? reg26 : reg30)))));
          reg159 <= (({($unsigned((8'ha7)) ? (^wire53) : $unsigned(reg26)),
                      wire53} ?
                  reg25[(4'hf):(4'h8)] : reg25[(4'h9):(4'h9)]) ?
              $unsigned($signed($signed((~reg34)))) : wire16);
        end
    end
  module4 #() modinst161 (.wire9(reg33), .y(wire160), .clk(clk), .wire8(wire3), .wire5(wire51), .wire7(reg158), .wire6(reg27));
  assign wire162 = ((~&{(+{(8'haf), reg143}),
                       wire16}) * ((reg35[(4'hc):(4'h9)] << (wire21[(4'h9):(1'h0)] ?
                           (-(8'ha2)) : reg25[(2'h2):(1'h1)])) ?
                       wire20[(1'h1):(1'h1)] : $unsigned(($signed(reg29) ?
                           (reg35 < (8'hbd)) : reg29[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      if ((+reg22[(3'h7):(3'h7)]))
        begin
          reg163 <= (~^(reg149[(3'h4):(2'h2)] << ((reg32 ?
                  (wire1 ? reg143 : reg143) : (!(8'ha7))) ?
              ((+reg159) ? (-reg150) : (reg31 + reg153)) : {(wire53 ?
                      reg150 : (8'haf)),
                  (^reg154)})));
          reg164 <= (($signed((reg31[(4'ha):(3'h6)] | ((7'h40) < (8'ha2)))) ?
                  (8'hab) : ($signed({reg38,
                      wire160}) - ($unsigned(reg158) ^~ (reg152 ?
                      reg147 : (8'hae))))) ?
              (reg29 ?
                  $unsigned({wire17[(4'he):(4'h8)]}) : reg24) : ($unsigned($unsigned((~&wire18))) ?
                  $unsigned((~reg38)) : ((~^$unsigned(reg146)) ^~ $unsigned({wire162,
                      reg26}))));
        end
      else
        begin
          reg163 <= reg145;
          reg164 <= reg23;
          reg165 <= (8'hbf);
          reg166 <= wire20[(2'h3):(1'h0)];
          reg167 <= wire2;
        end
    end
endmodule

module module55
#(parameter param139 = (~&((({(7'h44), (7'h41)} ? {(7'h40), (8'ha3)} : {(8'hb5), (8'h9f)}) ? (((8'h9c) ? (8'hb3) : (8'hae)) ? ((8'had) ? (8'hb8) : (8'haf)) : ((8'haf) ? (8'hb0) : (8'hb7))) : (((8'haf) ? (8'h9e) : (7'h44)) & (~&(8'ha2)))) ~^ ({(-(8'hb0)), ((8'h9d) ? (8'hab) : (8'hb4))} ? (((8'ha6) ? (8'ha6) : (8'hb3)) << {(8'hbe), (8'h9e)}) : ((8'ha6) ? ((8'ha6) | (8'haf)) : (+(8'ha5)))))))
(y, clk, wire60, wire59, wire58, wire57, wire56);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire60;
  input wire signed [(4'hb):(1'h0)] wire59;
  input wire signed [(5'h13):(1'h0)] wire58;
  input wire [(5'h13):(1'h0)] wire57;
  input wire [(5'h14):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire138;
  wire signed [(2'h3):(1'h0)] wire137;
  wire [(5'h12):(1'h0)] wire135;
  wire signed [(5'h14):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire [(4'hc):(1'h0)] wire99;
  wire signed [(4'he):(1'h0)] wire97;
  wire [(5'h11):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  assign y = {wire138,
                 wire137,
                 wire135,
                 wire101,
                 wire100,
                 wire99,
                 wire97,
                 wire62,
                 wire61,
                 (1'h0)};
  assign wire61 = wire56;
  assign wire62 = (~|wire60[(2'h2):(1'h1)]);
  module63 #() modinst98 (.wire64(wire62), .wire67(wire56), .clk(clk), .y(wire97), .wire65(wire57), .wire66(wire61));
  assign wire99 = wire60;
  assign wire100 = wire56;
  assign wire101 = (8'hbb);
  module102 #() modinst136 (wire135, clk, wire57, wire101, wire97, wire58);
  assign wire137 = wire62[(5'h10):(3'h4)];
  assign wire138 = wire99[(3'h5):(2'h2)];
endmodule

module module41  (y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire45;
  input wire [(3'h4):(1'h0)] wire44;
  input wire [(4'ha):(1'h0)] wire43;
  input wire [(4'hf):(1'h0)] wire42;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  assign y = {wire50, wire49, wire48, wire47, wire46, (1'h0)};
  assign wire46 = wire44;
  assign wire47 = $signed((($unsigned((wire46 ^ wire43)) >>> $unsigned(((8'ha8) >>> wire42))) <<< wire45[(1'h0):(1'h0)]));
  assign wire48 = ($signed(wire47[(1'h1):(1'h1)]) ?
                      $signed((-wire43)) : wire47[(4'hb):(3'h5)]);
  assign wire49 = wire47;
  assign wire50 = wire49[(2'h2):(2'h2)];
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(3'h5):(1'h0)] wire6;
  input wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  assign y = {wire13, wire12, wire11, wire10, (1'h0)};
  assign wire10 = $signed((|wire9));
  assign wire11 = (wire10[(3'h5):(3'h4)] >>> (wire9 ?
                      wire6 : (($signed((7'h41)) >= (+wire9)) != ($unsigned((8'hb6)) ?
                          $unsigned(wire10) : $unsigned(wire9)))));
  assign wire12 = (($signed($unsigned({wire11})) ?
                      {((~&wire10) ? (8'hac) : (wire11 ? wire7 : wire5)),
                          ((wire10 ? wire9 : wire7) ?
                              $unsigned(wire7) : (!wire7))} : $unsigned((wire10[(3'h6):(2'h2)] ~^ (wire5 ?
                          wire10 : wire5)))) != (&wire9));
  assign wire13 = ((^~wire9[(2'h2):(1'h0)]) | wire12);
endmodule

module module102
#(parameter param133 = {{((((8'ha5) <<< (8'h9e)) ? ((8'haa) ? (8'haf) : (8'ha5)) : ((7'h41) + (8'hab))) - (((8'had) ? (7'h42) : (8'hb5)) ? (-(8'hb0)) : {(8'ha7)})), (({(8'hb8)} ? ((8'hae) >> (8'h9e)) : ((7'h43) ? (8'hac) : (8'ha8))) && (((8'h9f) ? (8'hac) : (8'hb0)) & ((7'h42) ? (8'hb3) : (7'h40))))}}, 
parameter param134 = ((param133 ? (-param133) : (-((param133 >> param133) ? ((8'hbe) ? param133 : param133) : (param133 ? param133 : param133)))) > (((^~(param133 ? param133 : param133)) ? param133 : ({(8'hb4)} ? (param133 <<< param133) : (param133 < param133))) ? (({param133, (8'ha0)} < param133) ? (param133 ? param133 : param133) : {param133}) : param133)))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire106;
  input wire signed [(5'h13):(1'h0)] wire105;
  input wire [(4'he):(1'h0)] wire104;
  input wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(2'h2):(1'h0)] wire132;
  wire signed [(4'hf):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire114;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire110;
  wire [(4'hf):(1'h0)] wire109;
  wire signed [(5'h12):(1'h0)] wire108;
  wire [(3'h4):(1'h0)] wire107;
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(2'h3):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  assign y = {wire132,
                 wire125,
                 wire124,
                 wire123,
                 wire114,
                 wire113,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire107 = wire106;
  assign wire108 = (^~($signed($unsigned((|(8'had)))) + {$unsigned(wire106)}));
  assign wire109 = (-wire107[(2'h3):(2'h3)]);
  assign wire110 = {(wire106[(4'h8):(2'h3)] ?
                           $unsigned(wire105) : ($signed({wire106}) ?
                               $unsigned((wire109 ?
                                   wire103 : wire109)) : $unsigned($signed((8'hb2)))))};
  always
    @(posedge clk) begin
      reg111 <= $unsigned((wire108[(4'he):(3'h5)] ^ (($unsigned(wire104) >= $unsigned(wire109)) ?
          ((^wire109) ?
              wire108[(1'h1):(1'h0)] : wire103[(5'h13):(3'h7)]) : ((wire106 ?
                  wire104 : wire106) ?
              (wire108 ? wire107 : wire104) : (wire105 ? wire106 : wire103)))));
      reg112 <= wire110;
    end
  assign wire113 = ($signed(reg111) == $unsigned(reg112[(3'h5):(3'h4)]));
  assign wire114 = wire109[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg115 <= (-reg111);
      reg116 <= $unsigned($unsigned(wire113[(3'h5):(2'h3)]));
      reg117 <= wire108;
      reg118 <= wire104[(3'h5):(3'h4)];
      if ($signed(reg118))
        begin
          if (($signed($signed(wire109[(3'h5):(2'h3)])) ?
              ((~&$unsigned({reg115, reg115})) == $unsigned(($unsigned(reg112) ?
                  (wire110 + wire105) : wire106))) : wire103))
            begin
              reg119 <= wire107;
              reg120 <= wire114;
              reg121 <= (^~($unsigned(($signed(wire114) >= wire108)) ?
                  $unsigned(((&wire106) ?
                      (~&wire114) : ((8'ha8) ?
                          reg111 : reg116))) : $unsigned(wire103[(4'he):(1'h1)])));
              reg122 <= $signed($unsigned(((-wire114) <<< wire113)));
            end
          else
            begin
              reg119 <= (&{((&reg111) << $unsigned($unsigned(wire104))),
                  wire110[(2'h2):(2'h2)]});
              reg120 <= reg122[(1'h0):(1'h0)];
              reg121 <= {((({reg119} && (reg111 * reg122)) || ((reg122 ?
                          reg118 : reg118) ?
                      $unsigned(reg117) : (~&(8'hbb)))) != (!$signed($signed(reg115))))};
              reg122 <= $signed(((~&((&reg112) ?
                  $signed(reg117) : wire114[(4'hb):(4'h9)])) && ((~&$signed(reg122)) >> (~^{reg111,
                  (8'ha1)}))));
            end
        end
      else
        begin
          reg119 <= (^~(reg122 + (8'hb6)));
          reg120 <= reg115;
          reg121 <= (wire110 ?
              {$signed($signed((^~reg120)))} : {({reg115[(1'h0):(1'h0)]} ?
                      (wire104[(4'he):(4'ha)] | reg111[(3'h7):(2'h2)]) : (~|(+wire108))),
                  (((wire113 ~^ (8'hb3)) != (&reg120)) & $unsigned(wire113[(4'h8):(2'h3)]))});
        end
    end
  assign wire123 = {$unsigned((8'hb2))};
  assign wire124 = wire104[(2'h2):(1'h0)];
  assign wire125 = (reg112[(3'h5):(2'h3)] ? wire106 : $unsigned((8'hb0)));
  always
    @(posedge clk) begin
      if (reg122[(3'h4):(1'h0)])
        begin
          if (wire114[(4'he):(4'hd)])
            begin
              reg126 <= {wire106,
                  (~|(~{(wire123 ? reg115 : wire123), wire110}))};
              reg127 <= wire108;
            end
          else
            begin
              reg126 <= wire109[(4'he):(3'h7)];
              reg127 <= $unsigned(($signed(reg116[(3'h5):(2'h2)]) << ((8'hbb) < wire109[(3'h5):(3'h5)])));
              reg128 <= wire107;
              reg129 <= ((~&{wire103[(5'h13):(1'h1)]}) ?
                  ($signed($unsigned({reg121})) ^~ ($signed((wire103 ?
                      reg119 : reg119)) > (^wire105[(4'hd):(1'h0)]))) : (($unsigned(reg117) >= $unsigned((wire123 ?
                          wire125 : wire109))) ?
                      $unsigned({$signed((8'hba)),
                          wire108[(4'hf):(4'hf)]}) : reg116));
              reg130 <= ($signed(reg118) ?
                  {(&$signed($unsigned(wire113)))} : (wire107[(1'h0):(1'h0)] ?
                      (~$signed($unsigned(reg129))) : $signed((~reg122))));
            end
        end
      else
        begin
          reg126 <= $signed($unsigned({{{reg111}, $unsigned(reg130)}}));
          reg127 <= $signed(((8'hbb) == (&$signed($signed(reg130)))));
        end
    end
  always
    @(posedge clk) begin
      reg131 <= wire125;
    end
  assign wire132 = wire108;
endmodule

module module63
#(parameter param96 = ((^~((((7'h40) ? (8'hb2) : (8'hb7)) ? {(8'hbb), (8'ha9)} : (8'ha9)) ? (!(&(8'hbc))) : ((|(8'hb6)) ? {(7'h40), (7'h42)} : ((8'hb9) ? (8'hba) : (7'h40))))) != {(^~(((8'hbe) ? (8'hb5) : (8'hbc)) ? ((8'ha4) >> (8'hbd)) : (+(8'hba)))), (8'ha8)}))
(y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h16a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire67;
  input wire [(4'hc):(1'h0)] wire66;
  input wire [(4'ha):(1'h0)] wire65;
  input wire signed [(3'h5):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire95;
  wire signed [(4'ha):(1'h0)] wire94;
  wire signed [(3'h5):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire80;
  wire signed [(2'h3):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(3'h7):(1'h0)] wire74;
  wire [(4'h8):(1'h0)] wire73;
  wire signed [(4'he):(1'h0)] wire72;
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'hf):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg93,
                 reg92,
                 reg85,
                 reg84,
                 reg78,
                 reg77,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg68 <= (((!wire65) | wire64[(1'h0):(1'h0)]) && wire67[(4'hb):(3'h4)]);
      reg69 <= wire66[(4'h8):(3'h4)];
      reg70 <= reg68[(3'h5):(2'h3)];
      reg71 <= ((|(&(reg70 <<< wire66[(1'h1):(1'h0)]))) ?
          (wire64 ?
              (((+reg69) || $unsigned(reg70)) ?
                  $signed((wire66 ? reg68 : (7'h44))) : $signed((reg70 ?
                      wire67 : wire64))) : wire67) : wire67);
    end
  assign wire72 = wire66;
  assign wire73 = (^((wire64 > (^~wire65)) >> {$unsigned(reg68)}));
  assign wire74 = (^wire64);
  assign wire75 = (!(wire74[(3'h7):(1'h0)] ? reg69[(3'h7):(3'h4)] : (^reg69)));
  assign wire76 = wire73[(3'h6):(1'h0)];
  always
    @(posedge clk) begin
      reg77 <= wire76;
      reg78 <= $signed(wire64[(1'h1):(1'h1)]);
    end
  assign wire79 = wire76;
  assign wire80 = $unsigned($unsigned(wire73[(1'h0):(1'h0)]));
  assign wire81 = (({reg78} && (wire67 ^ ({reg70} ?
                          $signed((8'hb1)) : (wire64 == wire80)))) ?
                      (($signed(wire80) ^~ (^$unsigned(wire75))) ?
                          reg78 : wire66[(3'h4):(2'h2)]) : (($unsigned((wire67 | reg69)) ?
                              {wire80} : reg68) ?
                          (|wire76) : (~(^wire65[(3'h4):(2'h2)]))));
  assign wire82 = {({$signed((8'hb3))} ?
                          wire66[(2'h2):(2'h2)] : $signed((&{reg69})))};
  assign wire83 = (wire82[(4'hb):(3'h5)] ?
                      $signed(wire66) : (wire76[(2'h2):(1'h0)] ?
                          $signed(((+reg71) > (reg68 ^~ (8'hb9)))) : wire65[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg84 <= $signed((wire79[(1'h0):(1'h0)] ?
          wire72 : (+$unsigned(wire80[(4'ha):(4'ha)]))));
      reg85 <= ((((!{reg68}) ?
          (-{(8'hb9), wire80}) : $unsigned((wire82 ?
              reg68 : wire72))) | ({$signed(wire83)} - ((|(8'hac)) >= (wire75 ?
          reg84 : reg68)))) << (!(~&($signed(reg68) ?
          {(8'ha5), reg77} : $signed(wire75)))));
    end
  assign wire86 = wire82;
  assign wire87 = $unsigned(((reg69[(4'hc):(4'h9)] ?
                      (-$signed((8'ha8))) : $unsigned($signed(reg68))) - wire64));
  assign wire88 = reg78;
  assign wire89 = reg71;
  assign wire90 = reg85[(3'h5):(1'h0)];
  assign wire91 = {(!(^(!wire82[(3'h6):(1'h0)])))};
  always
    @(posedge clk) begin
      reg92 <= ({(&reg85)} ?
          reg84[(3'h7):(1'h0)] : (-(reg68 ?
              ((8'hb9) && reg77) : wire81[(5'h10):(1'h1)])));
      reg93 <= {wire79};
    end
  assign wire94 = ($signed(($signed($signed(wire83)) - wire64)) ?
                      $unsigned((($unsigned(reg92) == $unsigned(wire90)) <= (wire64[(3'h4):(1'h0)] ^ (|wire80)))) : wire82);
  assign wire95 = reg92;
endmodule
