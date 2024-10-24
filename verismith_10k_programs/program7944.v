module top
#(parameter param180 = (+({((^(8'ha2)) ~^ ((8'ha0) == (8'hb6))), (8'ha0)} ? (~&{((8'hbd) ? (8'ha9) : (7'h41)), ((8'hb7) ~^ (8'ha8))}) : ((((8'hab) >> (8'had)) < {(8'hbd)}) ^ (((8'hb9) == (8'h9d)) << {(8'ha8)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire178;
  assign y = {wire17,
                 wire4,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire178,
                 (1'h0)};
  assign wire4 = wire2[(5'h13):(5'h13)];
  module5 #() modinst18 (.wire6(wire2), .wire7(wire3), .clk(clk), .wire9(wire4), .y(wire17), .wire10(wire1), .wire8(wire0));
  assign wire19 = wire0[(3'h5):(3'h4)];
  assign wire20 = $unsigned($unsigned($signed((&wire2[(3'h6):(2'h2)]))));
  assign wire21 = (!$signed(wire19[(1'h1):(1'h0)]));
  assign wire22 = (wire0 ? $signed((|(!wire19))) : (!wire20));
  assign wire23 = {wire17};
  module24 #() modinst179 (wire178, clk, wire2, wire19, wire17, wire21, wire0);
endmodule

module module24
#(parameter param176 = (((~^((-(8'hb1)) & ((8'ha8) * (8'ha5)))) >>> (+(((8'hb8) ? (8'ha7) : (8'ha5)) >>> ((8'ha0) ? (8'hb0) : (8'haf))))) ? {(((+(8'hb8)) | {(8'hab), (8'ha7)}) ? (~((7'h43) <<< (8'hb5))) : (((7'h42) | (8'hb9)) ? {(8'h9e)} : ((8'ha3) - (8'haa))))} : ((+{(^~(8'hbb))}) ? (8'hb8) : {(-{(8'hb5), (8'hb6)}), {(~&(8'hb2)), ((8'ha7) ? (8'hbc) : (8'hb3))}})), 
parameter param177 = (param176 != {{{(param176 ? param176 : param176)}}, param176}))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire29;
  input wire signed [(5'h12):(1'h0)] wire28;
  input wire [(5'h13):(1'h0)] wire27;
  input wire signed [(5'h10):(1'h0)] wire26;
  input wire [(5'h14):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire174;
  wire [(4'ha):(1'h0)] wire124;
  wire [(4'hb):(1'h0)] wire123;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(5'h13):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire121;
  assign y = {wire174,
                 wire124,
                 wire123,
                 wire96,
                 wire32,
                 wire31,
                 wire30,
                 wire98,
                 wire121,
                 (1'h0)};
  assign wire30 = (-$unsigned(wire29));
  assign wire31 = $unsigned((&wire27));
  assign wire32 = (((7'h44) >= (+($unsigned(wire28) ^~ wire27))) >>> $signed(wire25[(4'hc):(3'h6)]));
  module33 #() modinst97 (.wire35(wire28), .wire37(wire30), .y(wire96), .wire38(wire32), .clk(clk), .wire34(wire25), .wire36(wire27));
  assign wire98 = $signed((^~wire25[(4'h9):(2'h2)]));
  module99 #() modinst122 (.clk(clk), .wire104(wire32), .wire102(wire25), .wire103(wire98), .wire101(wire31), .wire100(wire29), .y(wire121));
  assign wire123 = wire25[(1'h1):(1'h0)];
  assign wire124 = $unsigned({wire25, wire25});
  module125 #() modinst175 (wire174, clk, wire27, wire96, wire26, wire25);
endmodule

module module5
#(parameter param15 = (((|(&(8'h9c))) ? (-((-(7'h41)) >= ((8'hab) <<< (8'h9f)))) : ((~^(|(8'hba))) - (((8'hbb) ? (7'h44) : (8'hb9)) - (+(8'ha5))))) ? ((^~((^~(8'ha2)) ? ((8'ha7) & (8'h9c)) : (&(8'ha9)))) ? (~|(^~((8'hb5) ^ (8'hbb)))) : {({(7'h41)} >= ((8'hb9) || (8'hbd)))}) : (+(((~&(8'hb6)) == {(8'hbf), (8'hb9)}) ? (((8'hb7) < (8'hae)) <<< ((8'h9d) ? (8'hb8) : (8'h9d))) : ({(8'ha9), (8'haf)} < (|(8'hb3)))))), 
parameter param16 = ((8'hae) >= param15))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  assign y = {wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = $signed(((wire10 ?
                      wire9[(4'ha):(2'h3)] : (~|wire8[(4'hb):(2'h3)])) == wire7[(3'h4):(2'h3)]));
  assign wire12 = ($signed(wire11[(4'ha):(3'h7)]) ?
                      (&$unsigned($signed($signed(wire10)))) : (|wire8[(4'h8):(3'h4)]));
  assign wire13 = wire9[(4'hb):(4'hb)];
  assign wire14 = wire6;
endmodule

module module125
#(parameter param172 = ((~((8'h9c) >>> ((~|(8'hbd)) >= (^(8'hbf))))) * (({{(8'hb2)}, ((8'ha6) & (8'ha2))} ? ({(8'hb9)} ? ((8'had) ^~ (8'hbe)) : ((8'hb6) ? (7'h41) : (8'ha3))) : ((~&(8'hb7)) >= ((8'ha9) ? (8'haf) : (8'h9f)))) ? (~&({(8'ha7), (8'haf)} ? ((8'hb1) ? (8'haa) : (8'hb6)) : (~&(8'hbf)))) : (((8'hac) ? ((8'ha3) ? (8'h9f) : (8'hb6)) : (~|(8'hbc))) && (((8'hbc) ? (8'h9e) : (8'hb4)) ^~ ((8'hac) != (8'ha5)))))), 
parameter param173 = {(param172 ? (8'hae) : param172), (param172 ? (!{(^~param172)}) : param172)})
(y, clk, wire129, wire128, wire127, wire126);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire129;
  input wire signed [(3'h4):(1'h0)] wire128;
  input wire signed [(5'h10):(1'h0)] wire127;
  input wire signed [(5'h10):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire161;
  wire [(4'hc):(1'h0)] wire160;
  wire signed [(4'hc):(1'h0)] wire159;
  wire signed [(4'hf):(1'h0)] wire158;
  wire [(5'h15):(1'h0)] wire157;
  wire [(4'hf):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire155;
  wire signed [(3'h4):(1'h0)] wire154;
  wire [(2'h3):(1'h0)] wire153;
  wire [(5'h11):(1'h0)] wire137;
  wire signed [(5'h12):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire [(3'h6):(1'h0)] wire134;
  wire signed [(4'h8):(1'h0)] wire133;
  wire signed [(3'h5):(1'h0)] wire132;
  wire signed [(4'hb):(1'h0)] wire131;
  wire [(4'hb):(1'h0)] wire130;
  reg signed [(5'h12):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(4'hc):(1'h0)] reg169 = (1'h0);
  reg [(4'hb):(1'h0)] reg168 = (1'h0);
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(3'h7):(1'h0)] reg166 = (1'h0);
  reg [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg163 = (1'h0);
  reg [(3'h7):(1'h0)] reg162 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg [(4'hf):(1'h0)] reg145 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(5'h12):(1'h0)] reg141 = (1'h0);
  reg [(3'h4):(1'h0)] reg140 = (1'h0);
  reg [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(5'h15):(1'h0)] reg138 = (1'h0);
  assign y = {wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 (1'h0)};
  assign wire130 = ($signed(((wire128 ?
                       (wire127 * wire126) : wire129[(2'h2):(1'h0)]) ~^ wire129[(2'h3):(1'h0)])) ^ wire126[(3'h6):(3'h6)]);
  assign wire131 = $signed((wire126[(3'h7):(3'h7)] ?
                       wire127 : $signed($signed((8'ha6)))));
  assign wire132 = wire131[(3'h6):(1'h1)];
  assign wire133 = wire132;
  assign wire134 = (8'ha5);
  assign wire135 = $signed((~|$unsigned($signed($signed((8'h9e))))));
  assign wire136 = $signed(($signed($unsigned(wire127[(4'hb):(2'h2)])) <= $signed((^~(~^wire129)))));
  assign wire137 = ({wire130[(4'ha):(3'h7)]} > ((~&$unsigned(wire131)) ?
                       $unsigned($unsigned((wire128 ?
                           wire132 : wire135))) : $unsigned({wire130,
                           wire130[(3'h6):(2'h2)]})));
  always
    @(posedge clk) begin
      if ((-((wire132[(3'h4):(3'h4)] ~^ wire133) ?
          wire136 : (wire126 <= ($unsigned(wire135) ?
              $unsigned(wire131) : $signed(wire130))))))
        begin
          reg138 <= (8'ha7);
          reg139 <= (^((~&(wire134 - (+(8'ha3)))) ?
              ((-$unsigned((8'h9f))) << $signed((wire132 ?
                  wire132 : wire128))) : $unsigned((wire135 ?
                  $unsigned(wire126) : (~|wire127)))));
          reg140 <= {($signed($signed(reg139)) ?
                  $unsigned($signed({wire133,
                      wire136})) : wire127[(4'hf):(4'ha)]),
              wire136};
          reg141 <= (-wire134);
        end
      else
        begin
          if (wire127[(4'hc):(3'h7)])
            begin
              reg138 <= (!(reg141 - (~(~((7'h43) ? wire134 : wire136)))));
              reg139 <= (8'hb4);
              reg140 <= ({reg139,
                  wire128} << $unsigned(($signed((8'haf)) <= $unsigned((^wire137)))));
              reg141 <= (($unsigned((8'hb6)) | wire127) >>> {(($unsigned(reg141) << $unsigned(wire134)) ^~ (~^(&wire129))),
                  ({wire134[(2'h2):(1'h1)], wire128[(1'h1):(1'h0)]} ?
                      $unsigned($signed(wire133)) : (^~{reg140, (8'hae)}))});
            end
          else
            begin
              reg138 <= wire127;
              reg139 <= reg139[(4'hd):(3'h6)];
              reg140 <= reg138[(4'hf):(4'he)];
              reg141 <= {wire131,
                  (((reg141[(4'hf):(2'h2)] ?
                          wire137 : $unsigned(wire130)) || (~|(8'ha9))) ?
                      (reg140[(3'h4):(3'h4)] & $unsigned(wire136[(4'hf):(4'h8)])) : (($unsigned(wire128) >> wire128[(2'h3):(2'h3)]) > (^(~|wire136))))};
            end
          reg142 <= (!(wire128 ?
              ($unsigned(wire129) ~^ wire130[(2'h2):(1'h1)]) : (|wire127[(4'hb):(1'h0)])));
        end
      reg143 <= $unsigned(wire126[(5'h10):(2'h3)]);
      if ((($unsigned(((!wire132) <<< (wire127 ?
              wire130 : wire134))) << ((((8'h9d) <= reg139) ?
              (wire130 - reg138) : reg141) << {(wire126 >>> wire131)})) ?
          $signed(wire126[(3'h6):(3'h5)]) : wire126))
        begin
          reg144 <= (wire128[(3'h4):(3'h4)] * ({((wire135 | wire129) ?
                  $unsigned(wire133) : (wire131 && wire129))} * {$signed($unsigned(wire130)),
              reg139[(3'h7):(2'h2)]}));
          if ((wire133[(1'h0):(1'h0)] + wire136))
            begin
              reg145 <= $signed($unsigned(wire133));
            end
          else
            begin
              reg145 <= wire136[(5'h10):(3'h4)];
              reg146 <= wire131[(1'h0):(1'h0)];
              reg147 <= wire128;
            end
        end
      else
        begin
          reg144 <= reg138[(1'h0):(1'h0)];
          reg145 <= ((8'hbc) > wire133);
          reg146 <= $unsigned(reg147);
          if ($unsigned($signed(wire131)))
            begin
              reg147 <= {((^((!reg143) ? $unsigned((8'h9e)) : reg146)) ?
                      (((reg146 ? wire135 : wire137) ?
                          $signed(wire137) : (+(8'ha0))) || $signed({reg138})) : (7'h41)),
                  reg141[(4'hb):(4'hb)]};
              reg148 <= (|($unsigned(wire133) - ($unsigned(wire127) ?
                  reg146 : wire135[(1'h0):(1'h0)])));
              reg149 <= (~^({{(8'hb1), reg142}} ?
                  (wire129 > $signed(wire135)) : {$signed($unsigned(wire130)),
                      reg144[(2'h3):(1'h1)]}));
            end
          else
            begin
              reg147 <= $signed($signed($unsigned(reg143)));
            end
          reg150 <= ($unsigned((((reg141 && wire126) ?
              ((8'ha1) | reg146) : reg140[(2'h2):(1'h1)]) && (~^{reg138,
              (8'hb4)}))) != ($signed(wire133[(3'h4):(3'h4)]) ?
              $signed(reg138) : ({$unsigned(reg143), {wire126, wire132}} ?
                  reg148 : reg145[(1'h1):(1'h0)])));
        end
      reg151 <= ($unsigned(($signed(reg144[(3'h7):(1'h0)]) ?
              wire131 : wire132[(1'h0):(1'h0)])) ?
          $signed(reg149[(3'h7):(3'h5)]) : ({(|reg139)} || reg138[(4'hd):(2'h3)]));
      reg152 <= $unsigned(reg144[(3'h6):(3'h6)]);
    end
  assign wire153 = (reg138 <<< (+wire127[(3'h7):(3'h4)]));
  assign wire154 = $signed((+(reg151 - (|reg138[(5'h10):(4'ha)]))));
  assign wire155 = $unsigned((wire135[(2'h2):(1'h0)] ?
                       (-(+reg152)) : (wire126[(4'hc):(2'h3)] ?
                           (wire130[(3'h5):(3'h4)] == {reg148}) : $signed($unsigned(reg141)))));
  assign wire156 = reg145[(3'h6):(2'h3)];
  assign wire157 = $signed((($signed(wire153) ?
                       ((reg140 > reg146) < (wire126 ?
                           wire135 : (8'hbf))) : reg149) < $unsigned(wire133)));
  assign wire158 = (+$unsigned(wire154[(2'h2):(2'h2)]));
  assign wire159 = (wire128 ?
                       $unsigned((~&(~^(7'h40)))) : wire137[(4'h9):(1'h0)]);
  assign wire160 = $unsigned((~&(~&$signed((-wire158)))));
  assign wire161 = (wire126 + reg140[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      if ({(wire127[(3'h7):(3'h5)] & {wire133})})
        begin
          reg162 <= (!reg142[(4'h9):(3'h7)]);
          reg163 <= wire136[(3'h6):(2'h2)];
          reg164 <= wire137;
          reg165 <= reg142[(4'h8):(3'h7)];
          reg166 <= reg138[(4'hc):(3'h4)];
        end
      else
        begin
          if (((+(reg139 >> {(8'ha7)})) ?
              $signed(($signed($signed(wire155)) * reg146)) : ((reg150 ?
                  $unsigned((8'haf)) : ((^wire135) & (|wire132))) - (reg166 == ((reg152 ?
                  wire153 : wire159) | (-reg166))))))
            begin
              reg162 <= wire128;
            end
          else
            begin
              reg162 <= (wire159[(4'hb):(2'h2)] ~^ $signed($signed(reg144)));
              reg163 <= reg138;
              reg164 <= (({reg147[(5'h12):(5'h10)],
                  ((wire128 ? wire127 : reg148) ?
                      (!wire153) : reg138)} == $unsigned((~&(-reg145)))) ~^ {reg139[(3'h5):(2'h3)]});
              reg165 <= reg166;
              reg166 <= ($signed((|(reg166 ?
                  (reg146 >= wire128) : (wire157 - reg145)))) ^~ (!wire126));
            end
          if (((~wire134) ? reg143 : (^~wire129)))
            begin
              reg167 <= {$signed($unsigned(((reg147 ? reg145 : reg147) ?
                      reg165 : {wire127})))};
              reg168 <= (^~wire153);
              reg169 <= $signed((^~$signed((8'hac))));
              reg170 <= (-wire133[(3'h4):(3'h4)]);
            end
          else
            begin
              reg167 <= {($unsigned((8'ha9)) ?
                      {(+(wire158 ? wire129 : (8'ha7))),
                          wire154} : (~|((^~reg164) + wire157))),
                  (((^(reg141 != wire135)) < reg167[(1'h1):(1'h1)]) < (reg142 ?
                      (wire131[(4'hb):(1'h1)] ^~ (~|wire135)) : $signed({reg149,
                          wire157})))};
              reg168 <= $signed($unsigned((reg143[(1'h1):(1'h1)] ?
                  wire135[(1'h0):(1'h0)] : (wire129[(1'h0):(1'h0)] ?
                      $signed(reg147) : {reg151, reg163}))));
              reg169 <= (wire137 ? wire154 : reg164);
              reg170 <= ((wire135[(2'h3):(2'h2)] ^~ $unsigned(wire158)) & reg150[(3'h6):(2'h2)]);
              reg171 <= wire158[(2'h3):(2'h3)];
            end
        end
    end
endmodule

module module99
#(parameter param119 = ((8'ha5) > ({(((8'hb0) ? (8'ha1) : (7'h43)) ? (8'hb5) : ((8'hb0) ? (7'h44) : (8'hbb))), {(+(8'ha5)), {(7'h41), (8'hb5)}}} <= (&{{(8'hb7), (8'hab)}, ((8'hae) ? (8'ha9) : (8'h9e))}))), 
parameter param120 = param119)
(y, clk, wire104, wire103, wire102, wire101, wire100);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire104;
  input wire signed [(5'h15):(1'h0)] wire103;
  input wire signed [(5'h14):(1'h0)] wire102;
  input wire [(3'h5):(1'h0)] wire101;
  input wire signed [(4'hc):(1'h0)] wire100;
  wire signed [(4'h9):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire signed [(5'h10):(1'h0)] wire116;
  wire [(5'h12):(1'h0)] wire115;
  wire signed [(5'h15):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(3'h7):(1'h0)] wire109;
  wire [(4'ha):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(2'h2):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  reg signed [(4'h9):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(3'h7):(1'h0)] reg112 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire105 = ((wire100[(3'h6):(3'h4)] ?
                       $unsigned(wire101) : wire103) << $unsigned(wire104[(3'h4):(1'h0)]));
  assign wire106 = $signed(wire101[(1'h1):(1'h0)]);
  assign wire107 = (~^($signed(wire101[(1'h0):(1'h0)]) ?
                       ((wire103 ? (~wire101) : $signed(wire105)) ?
                           {$unsigned(wire103),
                               wire100} : (^~$unsigned(wire105))) : {$unsigned(wire100[(2'h3):(2'h3)]),
                           $signed((wire106 ? wire105 : wire103))}));
  assign wire108 = (~&{((&(wire103 && wire107)) != {$unsigned((8'hbf))}),
                       ($unsigned(wire105[(2'h3):(1'h1)]) >> $signed($signed(wire106)))});
  assign wire109 = (~&(wire106 ?
                       wire100 : (((^~wire101) != wire101) ?
                           (~{(8'h9f)}) : wire100[(4'ha):(3'h4)])));
  assign wire110 = $unsigned(wire109);
  assign wire111 = $unsigned(wire110);
  always
    @(posedge clk) begin
      reg112 <= wire103;
      reg113 <= $unsigned($unsigned(wire108));
      reg114 <= ($signed(reg113) ^ $unsigned(($signed($unsigned(wire101)) + $signed($unsigned(wire102)))));
    end
  assign wire115 = (wire107[(2'h3):(1'h0)] ?
                       $signed(($signed((wire103 || wire110)) ?
                           wire103 : wire107[(1'h0):(1'h0)])) : ({((wire102 - wire106) == ((8'hbe) <= wire104))} ?
                           ((((8'haf) << wire101) ?
                                   (&wire109) : wire111[(5'h11):(4'he)]) ?
                               ((|wire103) >> ((8'ha8) ?
                                   wire106 : wire102)) : wire107[(1'h1):(1'h1)]) : $unsigned(wire108)));
  assign wire116 = $signed(((8'ha3) ?
                       $signed(($signed(reg114) >>> reg113[(1'h1):(1'h0)])) : $unsigned(($signed((8'ha9)) ?
                           {(8'hb2), wire107} : wire103[(2'h2):(1'h0)]))));
  assign wire117 = $signed(wire103);
  assign wire118 = wire117;
endmodule

module module33  (y, clk, wire38, wire37, wire36, wire35, wire34);
  output wire [(32'h27b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire38;
  input wire [(3'h4):(1'h0)] wire37;
  input wire [(5'h13):(1'h0)] wire36;
  input wire signed [(5'h12):(1'h0)] wire35;
  input wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire95;
  wire signed [(3'h6):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(4'h9):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire [(4'h8):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire signed [(3'h5):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(2'h3):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire39;
  reg signed [(5'h15):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hc):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire47,
                 wire46,
                 wire45,
                 wire39,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire39 = wire38[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      if ($signed({(8'hb2)}))
        begin
          reg40 <= (wire37 >= ((-$unsigned((~^wire34))) ~^ $unsigned(wire34[(1'h0):(1'h0)])));
        end
      else
        begin
          reg40 <= ($signed((^(~&$signed(wire38)))) ^ wire38);
          if ((~{(((reg40 <= wire37) ? (8'hac) : (~^wire34)) ?
                  (~^wire34[(1'h0):(1'h0)]) : (wire35[(3'h5):(3'h5)] << {(8'hba),
                      wire38}))}))
            begin
              reg41 <= wire39[(3'h7):(3'h6)];
              reg42 <= (&wire35);
            end
          else
            begin
              reg41 <= ($signed({wire38[(3'h5):(2'h3)]}) == ({{(~&reg41)},
                  {wire39[(3'h4):(2'h2)]}} + ((~|(wire37 ? (8'ha7) : wire35)) ?
                  reg42[(1'h0):(1'h0)] : wire37)));
              reg42 <= (7'h40);
              reg43 <= ((wire38 ?
                      {({wire38, reg42} ?
                              ((8'ha3) ?
                                  wire35 : wire39) : wire34[(1'h0):(1'h0)])} : {(&$signed(wire34)),
                          (&(&(8'hba)))}) ?
                  ((wire35 ?
                      $signed({(8'hbc)}) : wire39[(2'h3):(1'h0)]) ^~ wire38) : wire38);
            end
        end
      reg44 <= (^wire38);
    end
  assign wire45 = (wire39[(3'h4):(1'h1)] ?
                      reg44[(1'h0):(1'h0)] : reg42[(3'h5):(2'h3)]);
  assign wire46 = ((((~|wire45[(1'h0):(1'h0)]) * reg43) * ((^(reg41 ?
                      reg41 : reg40)) == ((wire35 ?
                      wire36 : reg40) >>> (wire37 && wire37)))) >>> ($signed((wire45[(1'h0):(1'h0)] ?
                          $unsigned(wire35) : {wire34})) ?
                      (reg41[(1'h0):(1'h0)] * (wire39[(4'ha):(4'h8)] ?
                          $unsigned((8'hae)) : wire38[(4'hc):(2'h3)])) : wire39[(4'h9):(1'h1)]));
  assign wire47 = $signed($unsigned(reg43));
  always
    @(posedge clk) begin
      if (($signed(wire35[(4'h9):(3'h7)]) ? wire35[(4'ha):(4'ha)] : {reg40}))
        begin
          reg48 <= wire37;
          if ($unsigned(wire34))
            begin
              reg49 <= $unsigned($unsigned(reg43));
              reg50 <= $unsigned($signed(((~reg43[(1'h1):(1'h1)]) >>> reg48)));
            end
          else
            begin
              reg49 <= $signed((reg41 ?
                  {(wire34 ? (~^reg42) : $signed((8'hbf))),
                      $signed($signed(wire45))} : {{wire46},
                      (^$unsigned(reg42))}));
              reg50 <= reg44[(1'h1):(1'h1)];
              reg51 <= (~wire39[(1'h0):(1'h0)]);
              reg52 <= $signed(reg40[(4'hc):(3'h7)]);
              reg53 <= wire34;
            end
          reg54 <= reg40;
          if ((-(wire35 < ((|(reg49 ?
              reg43 : (8'ha3))) + wire34[(1'h1):(1'h0)]))))
            begin
              reg55 <= (reg44 ? wire47 : reg49);
              reg56 <= (^~(((!(-wire34)) * (+(8'ha5))) >>> $signed({(reg52 ?
                      reg55 : wire39)})));
            end
          else
            begin
              reg55 <= reg41[(1'h0):(1'h0)];
              reg56 <= reg53[(3'h4):(1'h0)];
              reg57 <= $unsigned(($signed((8'ha4)) - wire45[(2'h3):(1'h1)]));
              reg58 <= $unsigned((^~$unsigned((-reg42))));
              reg59 <= reg52;
            end
        end
      else
        begin
          reg48 <= $signed((^(|reg56[(4'hc):(4'hc)])));
          if (((~^{$signed((reg50 ? wire47 : reg48))}) <<< reg59))
            begin
              reg49 <= reg43[(1'h0):(1'h0)];
              reg50 <= wire35;
              reg51 <= reg52;
              reg52 <= $signed((!wire39[(3'h6):(3'h5)]));
              reg53 <= (~^(|(^((-wire35) ? wire37 : (~&reg42)))));
            end
          else
            begin
              reg49 <= $unsigned((($signed((^~(7'h41))) ?
                      ((^reg50) ? (~&(8'ha5)) : (^reg53)) : reg52) ?
                  $unsigned(reg40) : reg59));
              reg50 <= (|(reg54 * $signed(((reg52 ? reg48 : reg56) ?
                  (reg50 << reg54) : {reg41, wire36}))));
              reg51 <= (8'hb2);
            end
          reg54 <= $signed($signed((wire34 ?
              (reg49 ?
                  (wire35 ~^ reg56) : (reg57 ?
                      reg42 : reg55)) : (&$signed(reg41)))));
          reg55 <= $unsigned((~$signed($signed({(8'hbb), reg53}))));
          reg56 <= ($unsigned(($unsigned($unsigned(reg52)) <<< (((8'ha8) >>> reg57) < (+reg43)))) ?
              $unsigned(reg49) : {(-reg56),
                  ($unsigned(wire46[(1'h0):(1'h0)]) < $signed({reg55,
                      reg58}))});
        end
      if (($unsigned(($signed(reg44) | ((^reg50) == $unsigned(reg48)))) ?
          ((!(reg44[(1'h1):(1'h1)] ? (~wire38) : reg48)) ?
              (&wire35[(1'h1):(1'h0)]) : {{reg56[(3'h5):(2'h2)]}}) : $signed(reg57)))
        begin
          reg60 <= reg57[(5'h10):(4'hc)];
          if ((reg59 ?
              ($unsigned(wire47) ?
                  $unsigned(reg43) : reg43[(2'h3):(1'h0)]) : wire38))
            begin
              reg61 <= reg58;
              reg62 <= $signed(reg48);
              reg63 <= {reg48};
            end
          else
            begin
              reg61 <= (reg63 ?
                  {($signed((reg43 ~^ reg62)) ?
                          $unsigned(wire47[(2'h2):(1'h1)]) : $unsigned((~reg60)))} : (($unsigned((^~reg58)) ?
                          (|(~&reg44)) : (~&(|(8'h9d)))) ?
                      ((&{(8'hb4)}) ?
                          ({reg54} ?
                              {wire47, wire47} : (wire35 ?
                                  (7'h42) : wire46)) : $unsigned(reg54[(3'h4):(3'h4)])) : reg62));
              reg62 <= $signed({((reg57 ?
                      reg41 : reg50[(5'h13):(5'h11)]) >= (((8'haf) ?
                      wire34 : (7'h41)) >= (+reg43)))});
              reg63 <= ((&(((^~(8'had)) ?
                      (reg48 ?
                          (8'hbf) : wire36) : (^~reg56)) ^ reg52[(1'h0):(1'h0)])) ?
                  (wire38[(4'he):(4'hd)] ?
                      (reg54 ?
                          $unsigned({reg44}) : $unsigned((-reg62))) : $unsigned($unsigned(reg55[(2'h3):(2'h2)]))) : wire34);
            end
        end
      else
        begin
          if (wire47)
            begin
              reg60 <= reg59[(3'h7):(3'h4)];
              reg61 <= {$signed($signed(reg61[(1'h0):(1'h0)]))};
              reg62 <= $unsigned((^~((wire36[(4'hb):(4'h9)] >> reg49) >> wire37)));
              reg63 <= $signed(({(-$signed(reg41))} << ((~^$unsigned((8'h9c))) >>> reg57)));
              reg64 <= ({(({wire34, wire47} ?
                          $unsigned((8'ha1)) : $unsigned(reg51)) > (-(wire35 ?
                          reg52 : reg56)))} ?
                  (~|wire47[(4'h9):(2'h2)]) : $signed((($signed(reg52) * (+reg57)) && ($unsigned(wire45) | reg52))));
            end
          else
            begin
              reg60 <= (~&($unsigned({$signed(reg43), (~|reg54)}) ?
                  reg61[(3'h4):(1'h1)] : $signed(reg56)));
              reg61 <= (reg49[(1'h0):(1'h0)] <= {$signed(reg40[(4'h8):(3'h4)]),
                  wire46[(1'h1):(1'h0)]});
              reg62 <= (~^$unsigned((~&({wire36, wire36} ?
                  $signed(reg51) : $signed(reg56)))));
            end
          reg65 <= {(reg54[(4'ha):(4'h8)] ? reg59[(3'h5):(3'h4)] : wire34),
              ($unsigned(wire47) || reg42)};
          reg66 <= wire38[(3'h6):(3'h6)];
        end
      reg67 <= (($signed((8'hb4)) ?
              (((reg49 * reg66) | (8'hbd)) >>> $signed((-reg66))) : $unsigned(reg59[(2'h3):(1'h1)])) ?
          $unsigned(reg44[(1'h1):(1'h0)]) : (+(wire38 ?
              ((reg44 ? reg42 : wire37) > reg51) : reg57[(4'h8):(2'h2)])));
    end
  always
    @(posedge clk) begin
      if ($unsigned((($unsigned(reg40) > (~&$signed(reg66))) ?
          $unsigned($unsigned((reg63 ^~ wire39))) : (8'ha9))))
        begin
          reg68 <= $unsigned(wire36);
          reg69 <= $unsigned(((7'h40) ?
              reg44[(1'h1):(1'h1)] : ((&wire34) ?
                  ($signed((8'hae)) ?
                      ((8'haf) < reg62) : (reg63 ~^ wire34)) : $unsigned((reg57 ?
                      wire34 : reg65)))));
          reg70 <= $signed(((+(-(reg64 ?
              reg60 : reg68))) << reg63[(2'h3):(1'h0)]));
        end
      else
        begin
          if ((~&reg62[(1'h1):(1'h0)]))
            begin
              reg68 <= {$unsigned(((~(&wire45)) <= ((-reg50) ?
                      (|reg50) : wire35)))};
              reg69 <= {$unsigned((reg59 ?
                      reg60[(3'h4):(1'h0)] : $signed(reg52[(1'h0):(1'h0)])))};
              reg70 <= (((reg40[(3'h6):(2'h3)] ? {reg63} : $signed((~^reg43))) ?
                  wire45[(2'h3):(1'h0)] : $unsigned(({wire46,
                      wire35} <= (!reg60)))) && (($signed((wire35 ?
                          wire45 : reg65)) ?
                      {$unsigned(wire46)} : reg51[(1'h0):(1'h0)]) ?
                  $signed((~|$signed((8'hba)))) : (8'h9f)));
            end
          else
            begin
              reg68 <= $signed((((~^reg57[(1'h0):(1'h0)]) ?
                  reg59[(3'h4):(2'h2)] : reg40) < (7'h42)));
              reg69 <= (^{{$signed($signed(wire37))}, reg50[(5'h12):(4'hf)]});
              reg70 <= $signed($signed({$signed(reg67)}));
              reg71 <= (reg44[(2'h2):(1'h0)] * {(-(+reg70[(5'h14):(4'hc)])),
                  $signed($unsigned(wire35[(3'h7):(2'h2)]))});
            end
          reg72 <= $signed(reg62);
          reg73 <= $signed((reg61 ?
              $signed((7'h41)) : $signed($unsigned($signed((8'ha3))))));
          if ((8'hae))
            begin
              reg74 <= $signed($signed((!$signed($unsigned(reg41)))));
              reg75 <= $signed($signed(reg53[(4'hc):(2'h3)]));
            end
          else
            begin
              reg74 <= ((~&reg65) == $signed((((reg71 + (8'hb7)) ?
                      reg51[(2'h3):(2'h3)] : $signed(reg53)) ?
                  ((~|reg71) >>> $unsigned((8'h9d))) : reg55[(2'h2):(1'h0)])));
              reg75 <= reg52;
            end
        end
      reg76 <= reg71;
      reg77 <= reg76[(4'ha):(1'h1)];
    end
  assign wire78 = {(~reg64),
                      {(+$signed((^~reg60))),
                          ($unsigned(reg43) ?
                              (reg68[(2'h3):(2'h3)] | ((7'h43) < reg77)) : (^$signed((8'ha5))))}};
  assign wire79 = {$signed($unsigned($unsigned((|reg64))))};
  assign wire80 = reg66;
  assign wire81 = ({((^~reg40[(3'h7):(3'h7)]) ?
                              (reg43 + ((8'hb3) ?
                                  reg70 : wire39)) : $unsigned((&wire45)))} ?
                      ((((wire35 ?
                          reg77 : wire79) < wire47[(3'h4):(3'h4)]) && ((wire45 >= reg72) == $signed(reg53))) <<< ((!$unsigned(reg62)) && (wire46[(2'h2):(2'h2)] == $unsigned(reg59)))) : ($unsigned($signed($signed(wire38))) ?
                          $signed($unsigned({(8'hb2),
                              reg50})) : $unsigned({$signed(reg43)})));
  assign wire82 = reg40;
  assign wire83 = reg49[(1'h1):(1'h0)];
  assign wire84 = $signed($signed(wire82));
  assign wire85 = wire38[(2'h3):(1'h1)];
  assign wire86 = ((wire35 ?
                      ({$signed((7'h43))} && reg44[(2'h2):(1'h1)]) : (~^((~^wire83) && (^reg49)))) ^~ (-$signed((^(~|reg76)))));
  assign wire87 = ($unsigned(reg76) ? $signed((+$signed((+reg44)))) : wire79);
  assign wire88 = (($signed((wire80[(3'h5):(3'h4)] ?
                              $signed(wire81) : (^~reg41))) ?
                          (8'hb8) : (~^{reg51[(2'h3):(2'h2)],
                              wire86[(2'h2):(2'h2)]})) ?
                      (^~({$signed(reg52), {(8'hb9)}} ?
                          (~^$unsigned(reg43)) : {$signed(wire79)})) : $signed(reg64));
  always
    @(posedge clk) begin
      reg89 <= (+(wire34[(1'h0):(1'h0)] || $signed(($unsigned((8'hb7)) ?
          reg62 : (reg56 ^~ reg57)))));
      if (reg49)
        begin
          reg90 <= (wire79 ?
              $signed((-(^{reg74}))) : {($unsigned((reg65 ~^ (8'ha9))) ?
                      ({wire84, wire84} ?
                          (reg69 == wire84) : $signed(reg63)) : $signed((reg65 ?
                          reg55 : reg89))),
                  ($signed($signed(reg73)) ?
                      {(wire45 ? wire88 : wire78),
                          wire46} : (~&$signed(reg48)))});
          reg91 <= {reg55[(4'h9):(2'h2)],
              (reg69 & ({reg89[(4'h9):(3'h4)]} >>> wire36[(4'hd):(3'h4)]))};
        end
      else
        begin
          reg90 <= $unsigned(reg61[(1'h1):(1'h1)]);
          reg91 <= reg56[(2'h2):(1'h1)];
        end
      reg92 <= {wire86};
      reg93 <= wire83;
    end
  assign wire94 = (~({$signed($signed(reg59))} ^~ (-{(8'ha7)})));
  assign wire95 = reg42;
endmodule
