module top
#(parameter param177 = (7'h43), 
parameter param178 = (8'ha2))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire4;
  wire [(5'h11):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire175;
  wire signed [(5'h13):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire signed [(4'he):(1'h0)] wire163;
  wire signed [(4'hd):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire161;
  wire signed [(3'h7):(1'h0)] wire160;
  wire [(3'h6):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire44;
  wire [(4'hf):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire158;
  reg [(5'h13):(1'h0)] reg174 = (1'h0);
  reg [(5'h11):(1'h0)] reg173 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg172 = (1'h0);
  reg [(3'h5):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  assign y = {wire176,
                 wire175,
                 wire166,
                 wire165,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire5,
                 wire44,
                 wire46,
                 wire47,
                 wire158,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire5 = wire3[(4'hf):(4'h8)];
  module6 #() modinst45 (.clk(clk), .wire9(wire2), .y(wire44), .wire7(wire1), .wire8(wire0), .wire10(wire4));
  assign wire46 = wire3;
  assign wire47 = (((($unsigned(wire2) || wire44[(3'h5):(3'h5)]) ^~ wire4) <<< $unsigned(wire5)) ?
                      $signed((wire2 << (8'ha5))) : $signed($signed((wire46[(2'h2):(1'h1)] == $signed(wire4)))));
  module48 #() modinst159 (wire158, clk, wire3, wire46, wire2, wire1, wire47);
  assign wire160 = ((~$unsigned($unsigned((wire44 ?
                       (8'hbf) : wire44)))) == $signed((~|wire158)));
  assign wire161 = wire160;
  assign wire162 = {(+wire2), wire46[(4'h9):(2'h2)]};
  module138 #() modinst164 (.wire139(wire0), .wire140(wire161), .clk(clk), .wire142(wire162), .wire141(wire44), .y(wire163));
  assign wire165 = ($unsigned(wire5) ~^ $signed(wire44[(4'ha):(4'ha)]));
  assign wire166 = $unsigned(($unsigned((~|(~&wire3))) < ({((8'hb3) ?
                           wire46 : wire5)} ~^ $unsigned({wire47}))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire3[(3'h5):(1'h1)])))
        begin
          reg167 <= wire3[(4'ha):(4'h8)];
          if ((&((-$signed($signed(wire2))) + wire163[(3'h5):(3'h4)])))
            begin
              reg168 <= $unsigned(wire0);
              reg169 <= $signed($signed((wire5 < wire3[(4'h9):(2'h3)])));
              reg170 <= $unsigned((($unsigned(wire1[(5'h10):(4'hf)]) ^~ $unsigned($signed((8'hac)))) && ((wire44 >= (&wire161)) >> wire165[(1'h1):(1'h1)])));
            end
          else
            begin
              reg168 <= wire160;
              reg169 <= ((~&{($unsigned(reg167) < (&(8'hbf)))}) ^~ (~|wire44[(3'h6):(1'h1)]));
              reg170 <= $unsigned($unsigned(wire162[(2'h3):(1'h1)]));
              reg171 <= ((($unsigned($signed(wire46)) ?
                      (^~(wire161 ?
                          (8'ha7) : wire1)) : wire47[(1'h1):(1'h0)]) >>> (wire5 ?
                      (((8'hb0) << wire162) * wire160) : wire163[(4'h9):(2'h3)])) ?
                  wire158 : $unsigned(((|wire160) & ((~|wire5) ^ (7'h42)))));
            end
        end
      else
        begin
          if ((^$unsigned((((!wire166) ?
                  $unsigned((8'hbf)) : $signed((7'h40))) ?
              {wire1} : wire0[(5'h11):(5'h10)]))))
            begin
              reg167 <= ((-wire3) ?
                  {$signed(({wire161, wire2} ?
                          $signed(wire158) : (wire1 || wire162))),
                      ($unsigned((reg168 > wire160)) ?
                          (^$unsigned(wire165)) : (((8'haa) ~^ wire163) - (wire163 ?
                              (8'hbe) : (8'hb2))))} : ({$signed((^~wire166))} <= $unsigned({(~&(8'hb3))})));
              reg168 <= wire5[(2'h3):(1'h1)];
              reg169 <= (&((^{(-reg168)}) ?
                  wire44[(4'hc):(3'h5)] : {{(wire2 ? wire161 : wire158)},
                      ($unsigned(wire5) || $signed((8'hac)))}));
              reg170 <= (8'h9e);
            end
          else
            begin
              reg167 <= ($unsigned(wire165[(2'h3):(2'h3)]) - reg170);
              reg168 <= wire46[(4'ha):(3'h6)];
              reg169 <= ((8'ha4) || wire158);
            end
        end
      reg172 <= wire47;
      reg173 <= ((^~reg172) >>> $signed(($signed((~|wire1)) ?
          $signed({wire165, wire1}) : {(~^wire163)})));
      reg174 <= (($unsigned(((wire47 == (8'h9d)) + (8'hb3))) && (~&(-reg169))) ^~ (reg171 << (~&((wire2 >> wire5) ?
          reg173[(3'h5):(3'h4)] : $signed(wire0)))));
    end
  assign wire175 = {$signed(($unsigned($unsigned(reg173)) ?
                           (wire46 <= wire166) : (7'h42))),
                       (wire47 << ((|(wire161 ? wire3 : wire160)) ?
                           wire160 : reg172[(3'h6):(1'h1)]))};
  assign wire176 = (-wire161[(4'hb):(3'h6)]);
endmodule

module module48
#(parameter param157 = ((8'hbc) << (8'hbd)))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire53;
  input wire signed [(4'hf):(1'h0)] wire52;
  input wire [(5'h15):(1'h0)] wire51;
  input wire [(5'h11):(1'h0)] wire50;
  input wire [(4'hc):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire156;
  wire signed [(4'h9):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire130;
  wire signed [(3'h6):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(4'hd):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire136;
  wire signed [(3'h7):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire154;
  reg signed [(5'h10):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  assign y = {wire156,
                 wire81,
                 wire83,
                 wire128,
                 wire130,
                 wire131,
                 wire134,
                 wire135,
                 wire136,
                 wire137,
                 wire154,
                 reg132,
                 reg133,
                 (1'h0)};
  module54 #() modinst82 (wire81, clk, wire50, wire53, wire52, wire49, wire51);
  assign wire83 = (wire81 != $signed($signed(($signed(wire53) == wire52[(2'h3):(1'h0)]))));
  module84 #() modinst129 (wire128, clk, wire83, wire50, wire81, wire52);
  assign wire130 = (wire49[(4'ha):(2'h3)] >>> $signed(wire83));
  assign wire131 = $unsigned(wire50[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      if ($signed($signed(wire83[(3'h4):(1'h1)])))
        begin
          reg132 <= {$signed((wire50[(4'hf):(4'hb)] ?
                  (+wire81[(3'h4):(3'h4)]) : (^(wire83 <= wire49)))),
              $unsigned((({wire51} <= wire49) ?
                  wire50[(3'h6):(3'h6)] : (-$unsigned(wire53))))};
        end
      else
        begin
          reg132 <= (wire52[(4'hd):(4'hb)] ?
              $unsigned($signed($unsigned((-wire128)))) : wire50[(4'h9):(1'h0)]);
        end
      reg133 <= ($signed((-{wire81})) ?
          ($unsigned(((8'hb0) ?
                  (wire53 ? wire128 : wire49) : wire83[(4'h9):(4'h9)])) ?
              ({$unsigned((8'hb0)), $signed((8'ha3))} ?
                  $signed((reg132 > wire83)) : wire51) : (($unsigned((8'ha0)) ?
                      $unsigned(wire130) : $unsigned((8'hbc))) ?
                  {$unsigned(wire128), $unsigned(wire52)} : wire83)) : wire51);
    end
  assign wire134 = $signed(((reg133[(3'h5):(2'h3)] ~^ reg133[(2'h3):(1'h0)]) != (~|$unsigned($signed(wire52)))));
  assign wire135 = (~|$signed($signed(wire49[(2'h3):(2'h3)])));
  assign wire136 = $signed(wire130[(1'h0):(1'h0)]);
  assign wire137 = ((({wire83[(3'h6):(2'h2)], (~wire128)} & $unsigned(wire52)) ?
                           {wire49[(2'h2):(1'h1)],
                               wire134} : (wire134[(5'h11):(4'hf)] ?
                               wire52 : (^wire134[(4'h9):(3'h7)]))) ?
                       (8'ha0) : wire50);
  module138 #() modinst155 (.wire142(wire135), .wire139(wire83), .y(wire154), .wire140(reg132), .clk(clk), .wire141(wire130));
  assign wire156 = (~^(wire128[(3'h5):(3'h5)] == (8'hb4)));
endmodule

module module6
#(parameter param43 = ((((!((8'hb0) & (8'hb9))) ? (+(+(7'h42))) : ((^~(8'hac)) ? (8'h9f) : (-(8'h9d)))) ? {((+(8'ha7)) ? {(8'ha0)} : (~&(8'hbc)))} : (((8'haa) ^~ ((8'hb9) >> (7'h44))) << {(+(8'hb0)), ((8'hb3) ? (7'h44) : (8'h9e))})) + (&((((8'ha6) * (7'h44)) ^ ((8'ha6) + (8'hbc))) ^ {{(7'h42), (8'haf)}}))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire11;
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  assign y = {wire38, wire13, wire12, wire11, reg42, reg41, reg40, (1'h0)};
  assign wire11 = $signed((!(wire7[(1'h0):(1'h0)] ?
                      $unsigned((7'h42)) : wire7)));
  assign wire12 = ($signed(((~wire11) | (((7'h41) ?
                          wire11 : wire8) != (^~wire7)))) ?
                      $signed(wire11) : ((+(7'h40)) ?
                          (~^(~|wire8[(1'h0):(1'h0)])) : (7'h44)));
  assign wire13 = (!{$signed(((wire8 ? wire12 : wire8) >= {wire12})),
                      wire12[(2'h2):(1'h1)]});
  module14 #() modinst39 (.wire17(wire12), .y(wire38), .wire15(wire9), .clk(clk), .wire18(wire10), .wire16(wire8));
  always
    @(posedge clk) begin
      reg40 <= $unsigned((wire13[(4'hc):(4'hb)] == wire7[(2'h3):(2'h3)]));
      reg41 <= (+$unsigned($signed((~|(wire12 ~^ wire10)))));
      reg42 <= $unsigned(((~^$signed((8'haa))) >>> (((wire13 < reg41) << ((8'ha4) | (8'h9e))) ?
          (&wire11) : (wire11 >>> $unsigned(wire8)))));
    end
endmodule

module module14
#(parameter param37 = ((({((7'h42) ? (7'h40) : (7'h42)), ((8'hb8) ? (8'hbd) : (8'ha2))} ? (~^((8'ha1) ? (8'h9c) : (8'hbe))) : ((!(8'hb3)) ? ((8'hb5) + (8'h9e)) : ((8'hb5) ? (8'h9e) : (8'ha4)))) | (+(((7'h41) + (8'hac)) ? (8'ha0) : (~(8'hbd))))) ? (+(+(^(|(8'ha8))))) : ((({(8'hb1), (8'haa)} ? ((8'haa) <= (8'hb9)) : ((8'hb9) ? (8'h9d) : (8'hab))) + (^((8'h9e) > (8'hba)))) ? (|(((8'ha3) ? (8'haa) : (8'hb6)) ? ((8'ha8) > (8'ha9)) : ((8'ha3) ? (8'hb0) : (8'hb9)))) : ((7'h41) ? ({(8'hba), (8'ha2)} ? ((8'hbf) ? (8'hab) : (8'h9f)) : (&(8'hac))) : ({(7'h44)} != ((8'hb3) <= (7'h41)))))))
(y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
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
  assign wire19 = wire18;
  assign wire20 = $signed((~|wire16[(2'h2):(1'h0)]));
  assign wire21 = {{(^~((wire17 ? wire15 : wire20) ?
                              $signed(wire17) : {wire18}))},
                      wire19};
  assign wire22 = wire19;
  assign wire23 = $unsigned(wire22[(1'h0):(1'h0)]);
  assign wire24 = $signed((wire23[(3'h6):(2'h3)] ~^ wire16[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (wire24[(4'ha):(2'h3)])
        begin
          reg25 <= ($unsigned((wire21 ?
                  ((wire23 & wire21) == (~&wire21)) : wire21[(2'h3):(1'h1)])) ?
              $signed(wire24) : wire19);
          reg26 <= wire15[(2'h2):(1'h1)];
          if (wire24)
            begin
              reg27 <= {((~|$signed((wire18 ?
                      reg25 : wire20))) > ($unsigned($unsigned(wire23)) ?
                      $signed((wire20 || reg26)) : ($signed(wire21) ?
                          (wire15 ? reg26 : wire15) : (~wire22)))),
                  (+wire22[(3'h7):(3'h5)])};
              reg28 <= wire15[(1'h1):(1'h0)];
              reg29 <= $signed(((!((^wire21) != (wire24 ?
                  wire23 : wire20))) >>> wire21[(2'h3):(2'h3)]));
              reg30 <= {reg26[(1'h0):(1'h0)],
                  ((~&{(reg29 <<< (8'ha3))}) ?
                      $signed({(wire17 ? reg26 : reg29),
                          $unsigned(wire15)}) : $signed(($unsigned(reg29) ^~ $unsigned(wire18))))};
            end
          else
            begin
              reg27 <= wire17;
              reg28 <= wire15[(1'h1):(1'h0)];
              reg29 <= ((|((~|$signed(wire19)) >= $signed({wire18, reg27}))) ?
                  $signed((~{$unsigned(reg30)})) : $signed($signed(($signed(reg28) ?
                      $unsigned(wire24) : (reg25 << reg30)))));
              reg30 <= wire20[(5'h13):(4'hf)];
            end
        end
      else
        begin
          reg25 <= $unsigned((8'hbf));
          reg26 <= ($unsigned($signed(((wire21 ?
                  wire16 : reg25) == (wire24 || wire23)))) ?
              (wire24 ?
                  (((wire19 ? reg27 : wire18) ?
                      (wire19 && reg29) : (8'hb3)) & ($signed((8'hae)) - (wire22 ?
                      wire24 : wire17))) : $unsigned(reg29[(4'hb):(4'h9)])) : $signed($unsigned((reg27[(3'h6):(3'h5)] && {wire16}))));
        end
      reg31 <= (((($signed(wire16) && (wire22 | (7'h44))) ?
              (((8'hb5) ? (8'hb4) : (8'ha3)) < {wire21, wire18}) : reg28) ?
          (~|((~^reg26) > (wire18 <<< wire19))) : (!((^wire21) != $signed((8'hb8))))) != $unsigned({wire17,
          wire17[(1'h0):(1'h0)]}));
      reg32 <= reg30;
      reg33 <= ($signed((wire23[(4'he):(4'ha)] | $unsigned(wire23))) ?
          reg32 : wire17);
    end
  assign wire34 = wire21;
  assign wire35 = $signed((~^$signed(reg31[(3'h5):(3'h4)])));
  assign wire36 = ($signed((wire21 ~^ $unsigned((wire22 ?
                      reg33 : reg30)))) >> $signed($unsigned($unsigned($signed((8'hbc))))));
endmodule

module module138  (y, clk, wire142, wire141, wire140, wire139);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire142;
  input wire signed [(5'h12):(1'h0)] wire141;
  input wire signed [(5'h10):(1'h0)] wire140;
  input wire signed [(4'hf):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire153;
  wire [(4'h9):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire [(5'h10):(1'h0)] wire143;
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg150 = (1'h0);
  reg [(3'h4):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  assign y = {wire153,
                 wire145,
                 wire144,
                 wire143,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire143 = $unsigned((^~wire140));
  assign wire144 = $unsigned({(((&wire139) >> wire140) ?
                           $unsigned(wire142[(4'h8):(2'h3)]) : (wire140 > (wire140 ?
                               wire140 : wire140)))});
  assign wire145 = wire139;
  always
    @(posedge clk) begin
      reg146 <= ((($unsigned((wire141 - wire141)) + (|$signed(wire140))) ?
          ((~|{wire139}) + $unsigned(wire143)) : {wire143,
              $unsigned($unsigned(wire142))}) * wire141[(1'h1):(1'h0)]);
      if ((($unsigned(((wire142 >= wire139) ?
                  (8'haa) : (wire145 ? wire144 : (8'hba)))) ?
              (~|wire140) : wire141[(4'hc):(4'ha)]) ?
          ($signed(((~&(8'hb1)) ?
                  (wire139 ^~ wire141) : (reg146 ? wire141 : wire145))) ?
              (-wire144[(4'he):(1'h1)]) : wire145) : {({(wire141 || wire143),
                  wire144[(5'h10):(3'h6)]} <<< $unsigned((~&(8'ha3))))}))
        begin
          if ((((8'hb9) ?
              ({{reg146}, ((8'ha1) > wire143)} ?
                  {(~reg146),
                      wire139} : ($signed(wire144) != (wire142 | reg146))) : reg146) ~^ {$unsigned(wire141[(1'h1):(1'h1)]),
              $unsigned((~&wire143[(2'h2):(1'h1)]))}))
            begin
              reg147 <= (+$unsigned($unsigned(wire143)));
            end
          else
            begin
              reg147 <= ((-($signed($signed(wire140)) ?
                  $signed(wire141) : $signed($unsigned(wire143)))) && $signed($signed({$signed(wire144),
                  (~|reg146)})));
            end
          reg148 <= (wire140[(1'h1):(1'h0)] ^~ $signed(wire139[(4'hc):(1'h0)]));
          reg149 <= (^wire142);
          reg150 <= $unsigned(reg146[(2'h3):(1'h0)]);
          reg151 <= wire143;
        end
      else
        begin
          reg147 <= {{$unsigned({wire145, (wire141 ? wire140 : (8'h9e))}),
                  {(~&reg149), reg151[(2'h2):(1'h1)]}}};
          reg148 <= (~$signed(((reg147 ?
              (wire140 - reg151) : reg151[(2'h2):(2'h2)]) & ((8'ha2) >> {wire140,
              reg150}))));
        end
      reg152 <= $unsigned(wire141);
    end
  assign wire153 = (($signed(wire140) * $signed(reg148[(3'h4):(2'h3)])) ?
                       wire142[(4'hc):(4'hc)] : (^(^~(8'h9d))));
endmodule

module module84  (y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h1a1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire88;
  input wire [(5'h11):(1'h0)] wire87;
  input wire [(3'h7):(1'h0)] wire86;
  input wire [(3'h6):(1'h0)] wire85;
  wire [(4'ha):(1'h0)] wire127;
  wire [(2'h3):(1'h0)] wire125;
  wire signed [(2'h2):(1'h0)] wire124;
  wire signed [(4'hd):(1'h0)] wire123;
  wire signed [(3'h6):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire signed [(5'h10):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(5'h11):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(2'h2):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire100;
  wire [(4'h9):(1'h0)] wire99;
  wire [(4'he):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire89;
  reg [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg120 = (1'h0);
  reg [(3'h4):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(5'h14):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(3'h7):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  assign y = {wire127,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire117,
                 wire116,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire100,
                 wire99,
                 wire90,
                 wire89,
                 reg126,
                 reg120,
                 reg119,
                 reg118,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire89 = $signed((8'hae));
  assign wire90 = $unsigned($unsigned({wire85, $unsigned($signed(wire86))}));
  always
    @(posedge clk) begin
      if (wire87)
        begin
          if ((8'hbd))
            begin
              reg91 <= (~|(wire88 ? $unsigned(wire90[(3'h5):(1'h0)]) : wire90));
              reg92 <= {(wire85 ?
                      (~^{(+wire87)}) : {{$unsigned(wire90),
                              wire85[(2'h3):(1'h0)]}}),
                  $unsigned((8'haa))};
              reg93 <= (wire88 < ((!((8'ha2) ? wire89 : wire87)) & ((^~wire88) ?
                  {(~(8'hb0)), $unsigned(wire87)} : $signed($signed(reg92)))));
              reg94 <= ($signed((8'h9d)) ?
                  reg92 : (+($unsigned(reg91[(5'h10):(3'h7)]) ?
                      $unsigned((~|reg93)) : $signed((^~wire89)))));
            end
          else
            begin
              reg91 <= reg92[(2'h2):(1'h1)];
            end
          reg95 <= reg91[(4'hf):(3'h6)];
        end
      else
        begin
          reg91 <= (((8'hb7) ?
              ($signed(wire89[(1'h0):(1'h0)]) ?
                  $signed(wire89[(4'ha):(2'h3)]) : reg91) : (|$unsigned($signed(reg93)))) - $signed($signed((((8'hae) >> wire86) * (reg93 ~^ wire90)))));
          reg92 <= reg94[(2'h3):(2'h2)];
          reg93 <= (wire88[(1'h0):(1'h0)] ?
              wire88[(1'h1):(1'h0)] : (wire88 ^ wire85));
          if (($signed(({$unsigned(reg95), (reg93 ? (8'h9d) : wire87)} ?
              $signed($signed(wire89)) : $unsigned({reg91}))) <<< wire89[(4'hd):(3'h7)]))
            begin
              reg94 <= ((~^((~&wire88[(3'h4):(2'h2)]) ?
                  ($unsigned(wire86) ^ $signed(wire87)) : $signed((8'hbd)))) != $signed(wire89[(3'h7):(3'h5)]));
              reg95 <= $signed({($unsigned(reg92[(3'h5):(3'h5)]) ?
                      wire85 : wire85[(3'h6):(3'h5)])});
              reg96 <= wire85[(1'h0):(1'h0)];
            end
          else
            begin
              reg94 <= ($unsigned(reg91[(4'hc):(4'hb)]) == (((reg95 ?
                  $unsigned(wire87) : reg94[(2'h3):(1'h0)]) ^ ($unsigned(reg96) ?
                  $signed((8'hb8)) : {reg94,
                      wire87})) || reg94[(3'h6):(3'h6)]));
              reg95 <= (wire86 ?
                  ($signed(reg93[(2'h3):(2'h2)]) & $signed(((wire88 ?
                          wire90 : reg95) ?
                      (wire88 + wire87) : $unsigned(wire89)))) : $unsigned($signed($signed(wire86[(3'h6):(2'h3)]))));
              reg96 <= $unsigned($signed($signed(reg96)));
              reg97 <= $unsigned($signed((^~$signed(reg91))));
            end
        end
      reg98 <= $unsigned(wire88[(3'h5):(3'h4)]);
    end
  assign wire99 = (((!(8'hac)) - (~^$signed($unsigned((8'hb5))))) ?
                      ((|$unsigned($signed(wire87))) ~^ (&$signed(wire85))) : ($unsigned(reg95) ?
                          $signed($unsigned((wire86 < reg95))) : $unsigned({$signed(wire89),
                              (~reg92)})));
  assign wire100 = $signed($unsigned(reg92[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      reg101 <= (reg94[(2'h3):(1'h1)] ?
          ($signed($unsigned($unsigned(reg97))) ^ (reg95[(1'h0):(1'h0)] ?
              (reg95[(3'h6):(3'h6)] ?
                  (reg93 ?
                      (8'hbb) : wire88) : (~&reg93)) : (^wire99))) : reg92);
      reg102 <= (7'h42);
      reg103 <= wire87;
      reg104 <= wire89;
    end
  assign wire105 = wire88;
  assign wire106 = (&({$signed(wire88)} < $unsigned((-$unsigned((7'h40))))));
  assign wire107 = wire89[(1'h1):(1'h1)];
  assign wire108 = (($signed($unsigned(reg97)) ?
                           (wire107 <<< reg103) : $unsigned($signed(reg103[(1'h1):(1'h0)]))) ?
                       reg94 : $signed(({(wire99 ? reg104 : wire87)} ?
                           (^$signed(reg96)) : (~^(+wire89)))));
  always
    @(posedge clk) begin
      reg109 <= (wire88 > ((^$signed((wire107 ? reg104 : reg92))) ?
          wire89[(3'h4):(2'h3)] : reg101));
      if (wire106[(4'hb):(3'h5)])
        begin
          reg110 <= ($signed((($signed(reg95) > reg93) != ((wire107 && wire106) * wire107[(3'h4):(1'h1)]))) ?
              (~^($signed((-wire89)) || $unsigned($signed(wire107)))) : $signed((reg98 ?
                  ($unsigned((8'ha6)) ?
                      $unsigned(reg95) : wire106[(3'h4):(2'h2)]) : ((reg102 + reg104) ^~ $unsigned((8'ha7))))));
        end
      else
        begin
          reg110 <= (|$signed(reg92));
          reg111 <= $signed(($signed(reg110) ?
              $unsigned({reg109, $signed(reg101)}) : wire105));
          reg112 <= {wire85};
          reg113 <= wire86;
        end
      reg114 <= $signed($unsigned($unsigned($signed((reg95 ~^ (8'hbf))))));
      reg115 <= wire100[(3'h4):(2'h2)];
    end
  assign wire116 = (({{$signed(wire99), (reg92 ? reg97 : wire87)}} ?
                       ({(reg103 == reg115)} ?
                           $unsigned(reg104) : wire87[(4'hc):(4'h9)]) : wire89[(3'h5):(2'h3)]) || wire87);
  assign wire117 = $unsigned($unsigned((~($unsigned(reg96) > (reg91 ?
                       (8'hbd) : reg102)))));
  always
    @(posedge clk) begin
      reg118 <= (~&(8'hab));
      reg119 <= reg114[(3'h5):(2'h2)];
      reg120 <= (reg101[(3'h4):(2'h3)] ^ ({(wire87 ?
                  {reg103, reg97} : $signed(reg111))} ?
          reg92 : (($unsigned(reg111) >>> (reg118 >= reg112)) ?
              $signed((~reg114)) : $unsigned(reg110))));
    end
  assign wire121 = (~|(~&(reg92[(3'h4):(2'h3)] ?
                       $unsigned((reg114 - reg97)) : reg95)));
  assign wire122 = $unsigned(reg95[(3'h5):(2'h3)]);
  assign wire123 = reg93[(3'h5):(3'h5)];
  assign wire124 = wire106[(1'h0):(1'h0)];
  assign wire125 = reg103;
  always
    @(posedge clk) begin
      reg126 <= $signed(reg93);
    end
  assign wire127 = ($signed((-$unsigned(wire117))) ?
                       $signed(($unsigned((reg110 ?
                           wire85 : reg95)) ~^ {(wire106 ? wire86 : reg93),
                           $signed(wire90)})) : (reg126 ?
                           (^~reg104[(3'h5):(3'h4)]) : ($unsigned({reg109}) * $unsigned(wire85))));
endmodule

module module54
#(parameter param80 = ({((((8'hbb) ? (8'had) : (8'hab)) >= ((7'h41) ? (8'ha3) : (8'ha1))) <<< (~^{(8'haf)}))} < (((((8'ha3) >> (8'hb7)) | (^~(8'hbd))) >>> (8'hab)) ? (-(((8'ha1) ? (8'h9e) : (8'hb6)) ? ((8'hb2) ? (8'hb8) : (8'ha7)) : (+(8'h9c)))) : (~|(((8'ha1) ? (8'haa) : (8'hb4)) ? ((8'haf) >>> (8'ha4)) : ((8'ha1) != (8'ha3)))))))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire59;
  input wire [(3'h4):(1'h0)] wire58;
  input wire signed [(4'ha):(1'h0)] wire57;
  input wire [(4'hc):(1'h0)] wire56;
  input wire signed [(5'h14):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  wire signed [(3'h7):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire60;
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg68 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
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
                 (1'h0)};
  assign wire60 = ($unsigned(wire56) ?
                      wire58[(3'h4):(1'h1)] : $unsigned((!(^~(~|wire55)))));
  assign wire61 = wire58;
  assign wire62 = (({wire56} ?
                      ($unsigned($signed(wire60)) & ($signed(wire59) ?
                          ((8'ha0) ?
                              wire58 : wire60) : wire56[(4'hc):(3'h5)])) : $signed(((wire57 ?
                          wire60 : wire60) * {wire55,
                          wire55}))) | $unsigned($signed($signed((wire59 && wire59)))));
  assign wire63 = ((((+{wire62, wire59}) || wire62) <= $unsigned(wire60)) ?
                      {({(wire56 ? wire58 : wire61)} ?
                              (~|{(8'had), wire58}) : {(wire59 * wire59),
                                  (&(8'ha2))}),
                          wire58[(2'h2):(1'h0)]} : $signed($signed(({(8'hbb)} ?
                          (^(8'ha9)) : ((8'hb5) <<< wire58)))));
  assign wire64 = (wire55 ?
                      $signed((~{(8'ha7),
                          wire58[(1'h1):(1'h1)]})) : (($signed(wire61[(3'h4):(1'h1)]) ?
                          {wire60, ((8'hb2) ? wire55 : wire57)} : (wire60 ?
                              wire63 : (~|wire60))) ~^ (&$unsigned((+wire61)))));
  assign wire65 = ($signed(wire63[(3'h6):(2'h3)]) & $unsigned({wire56[(4'hb):(4'h9)]}));
  assign wire66 = wire64[(3'h7):(3'h6)];
  assign wire67 = {$unsigned($unsigned($signed(wire64[(1'h1):(1'h0)]))),
                      ({(-(wire64 & wire59))} ?
                          {wire61, $signed($unsigned(wire66))} : wire57)};
  always
    @(posedge clk) begin
      if ((wire65 & $unsigned(wire59)))
        begin
          if ($signed((~|$unsigned(({wire59, wire58} > (wire55 || wire58))))))
            begin
              reg68 <= $unsigned($unsigned(((wire58 ?
                      (+wire55) : wire67[(3'h6):(3'h4)]) ?
                  {(wire66 ? wire64 : wire61),
                      wire62} : (&$unsigned(wire56)))));
              reg69 <= (~(8'ha1));
              reg70 <= wire61[(2'h3):(2'h2)];
            end
          else
            begin
              reg68 <= (wire58[(2'h2):(1'h1)] * (wire61[(2'h2):(2'h2)] ~^ $signed($unsigned((~&(8'hb9))))));
            end
          if (wire60)
            begin
              reg71 <= (($unsigned(wire66[(3'h4):(3'h4)]) > $signed(wire59)) ?
                  (wire58 ?
                      ($unsigned($unsigned(wire56)) ?
                          $unsigned($signed(wire59)) : ((~|wire57) ?
                              $unsigned(wire60) : (~|wire63))) : ((-{wire64}) ?
                          (wire59[(2'h3):(2'h2)] ^~ (wire55 ?
                              (8'hb9) : wire61)) : $unsigned(((8'ha9) ?
                              wire59 : reg68)))) : $unsigned(((~|wire63) < $unsigned((wire66 || wire55)))));
              reg72 <= wire55[(5'h11):(2'h3)];
            end
          else
            begin
              reg71 <= {$unsigned(wire65)};
              reg72 <= $unsigned((+reg69[(2'h3):(1'h1)]));
              reg73 <= {wire64[(3'h5):(2'h3)], $signed(wire62)};
              reg74 <= wire65;
            end
          reg75 <= $signed($unsigned((~&$signed((wire66 ^~ wire58)))));
          reg76 <= (wire58[(1'h1):(1'h1)] ?
              (wire60 ^~ (reg74 | (+(wire62 ?
                  wire57 : reg70)))) : ($signed(wire57) <= $signed((|(-wire61)))));
          reg77 <= (wire55[(4'hf):(2'h3)] ?
              {(~&$signed((wire63 == wire62)))} : {wire56});
        end
      else
        begin
          if (wire67[(3'h6):(1'h1)])
            begin
              reg68 <= reg68;
              reg69 <= wire58;
              reg70 <= $signed((~&$unsigned(($signed((8'hac)) * (wire67 ?
                  reg73 : wire60)))));
              reg71 <= ({(~^reg73)} ?
                  $unsigned($signed($unsigned((reg68 ^~ (8'hbb))))) : (~$unsigned($unsigned({wire58}))));
            end
          else
            begin
              reg68 <= (($signed($unsigned((wire66 << reg77))) >> ((~&$signed(reg72)) && $signed((reg72 ^ wire60)))) & (8'ha9));
              reg69 <= (+({wire57[(3'h5):(1'h1)]} || wire60));
              reg70 <= ((((wire55 ? (reg76 ^~ reg77) : wire57) ?
                      (~^(wire65 ? wire61 : wire58)) : (&{reg74, (8'hb1)})) ?
                  wire59 : $unsigned(reg77)) == {{wire63[(4'hd):(3'h4)],
                      reg70[(2'h3):(2'h2)]}});
            end
          reg72 <= ($unsigned($signed((wire66 ?
                  ((8'ha4) ? wire63 : wire57) : (8'had)))) ?
              wire55 : (wire66[(2'h2):(1'h1)] && reg71[(3'h5):(2'h2)]));
          reg73 <= wire63;
          reg74 <= $signed(wire55);
        end
      reg78 <= $unsigned($signed($signed(reg75[(1'h1):(1'h0)])));
      reg79 <= ($signed(reg73[(4'he):(3'h4)]) <= ((!(wire56[(1'h1):(1'h1)] ?
          (wire64 >> reg71) : {(8'hbd)})) <= reg70));
    end
endmodule
