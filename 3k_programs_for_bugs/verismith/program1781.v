module top
#(parameter param172 = (({{((8'ha7) >>> (8'h9c))}} >= ((8'hb7) ? (((8'hb6) != (8'hb6)) ? ((8'hbc) <= (8'ha2)) : {(8'had)}) : (((8'ha8) ? (8'ha8) : (8'hba)) < ((8'hb4) ^~ (8'hb7))))) >= (-{(|(|(8'ha3)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire171;
  wire [(5'h12):(1'h0)] wire170;
  wire signed [(5'h10):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire167;
  wire [(4'hf):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire47;
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire167,
                 wire51,
                 wire50,
                 wire47,
                 reg49,
                 (1'h0)};
  module4 #() modinst48 (.wire7(wire2), .wire6(wire0), .y(wire47), .clk(clk), .wire8(wire3), .wire9(wire1), .wire5((8'h9f)));
  always
    @(posedge clk) begin
      reg49 <= (&((!(wire2[(3'h4):(1'h1)] >= $unsigned((8'ha1)))) || ($signed(wire1[(4'he):(2'h2)]) ?
          $unsigned(wire0[(2'h2):(2'h2)]) : (wire0 ?
              $signed((8'hb5)) : (wire0 ? wire2 : wire1)))));
    end
  assign wire50 = wire3[(3'h5):(1'h1)];
  assign wire51 = $unsigned($unsigned(wire47));
  module52 #() modinst168 (.wire55(wire47), .wire53(wire3), .clk(clk), .wire54(wire2), .wire56(wire51), .y(wire167));
  assign wire169 = (~reg49[(4'h8):(3'h5)]);
  assign wire170 = $unsigned($unsigned($unsigned($signed((wire0 ?
                       wire0 : wire0)))));
  assign wire171 = {{(wire170[(4'ha):(3'h4)] * (((8'hb5) == wire170) ?
                               (wire47 < wire1) : (wire47 ? wire50 : wire47)))},
                       $signed(wire1[(4'h9):(2'h2)])};
endmodule

module module52
#(parameter param166 = (((+(((8'hb1) && (8'hbd)) ? {(8'hae)} : {(7'h43)})) | {(((8'hb9) ? (8'hb5) : (7'h42)) >> ((7'h41) ? (7'h40) : (7'h41)))}) ? {({{(8'ha5), (8'h9c)}} ? (^(~(8'ha0))) : (~(~|(8'hae)))), (((~(8'hb3)) ~^ (8'hb3)) - (&{(7'h40), (7'h42)}))} : (~|(-(((7'h42) ? (8'ha4) : (8'hb5)) + ((8'hb7) >= (8'h9e)))))))
(y, clk, wire53, wire54, wire55, wire56);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire53;
  input wire signed [(4'hd):(1'h0)] wire54;
  input wire signed [(5'h11):(1'h0)] wire55;
  input wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire165;
  wire [(3'h4):(1'h0)] wire164;
  wire signed [(2'h3):(1'h0)] wire163;
  wire signed [(3'h5):(1'h0)] wire162;
  wire signed [(3'h5):(1'h0)] wire161;
  wire [(5'h14):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire59;
  wire signed [(5'h12):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(4'h8):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire117;
  wire [(3'h5):(1'h0)] wire119;
  wire signed [(3'h5):(1'h0)] wire120;
  wire signed [(5'h11):(1'h0)] wire121;
  wire [(4'hc):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire159;
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  assign y = {wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire57,
                 wire58,
                 wire59,
                 wire75,
                 wire77,
                 wire78,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire117,
                 wire119,
                 wire120,
                 wire121,
                 wire127,
                 wire159,
                 reg83,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 (1'h0)};
  assign wire57 = $unsigned(wire55);
  assign wire58 = $unsigned((wire53 ?
                      $signed((wire53 ~^ $signed(wire56))) : $unsigned({(~&wire53),
                          $unsigned(wire55)})));
  assign wire59 = (8'hb5);
  module60 #() modinst76 (.wire64(wire54), .wire63(wire57), .wire61(wire59), .wire62(wire55), .clk(clk), .y(wire75));
  assign wire77 = $unsigned(wire56[(2'h3):(2'h3)]);
  assign wire78 = (~&$signed($unsigned(((wire59 && wire59) ?
                      $unsigned(wire58) : (wire55 | wire56)))));
  assign wire79 = (|(~|($unsigned((&wire75)) ?
                      (^~(wire75 ? wire55 : wire77)) : {$unsigned(wire58),
                          $signed(wire78)})));
  assign wire80 = $unsigned(wire56[(3'h4):(1'h1)]);
  assign wire81 = $unsigned((|(({(8'hbb),
                      wire78} ~^ wire56) * $signed((wire54 <<< wire54)))));
  assign wire82 = (wire79 ?
                      wire77[(3'h5):(2'h3)] : ((!wire54[(3'h7):(3'h6)]) ^~ $signed($signed((wire53 ?
                          wire81 : wire56)))));
  always
    @(posedge clk) begin
      reg83 <= (((^({wire55} > (wire53 > (8'hb2)))) ? (^wire77) : (8'hb7)) ?
          $signed(wire54[(1'h0):(1'h0)]) : wire78[(2'h3):(2'h2)]);
    end
  module84 #() modinst118 (.y(wire117), .wire88(wire78), .wire85(wire80), .clk(clk), .wire86(wire56), .wire87(wire81));
  assign wire119 = {wire58[(2'h3):(2'h3)]};
  assign wire120 = wire80[(4'hf):(4'hf)];
  assign wire121 = $signed((~(~($unsigned(wire80) ?
                       $unsigned(wire59) : wire56[(4'hb):(1'h0)]))));
  always
    @(posedge clk) begin
      reg122 <= {(~&(7'h41)),
          $signed(({(8'hb7)} ? wire80 : ((wire77 < wire78) >> wire120)))};
      reg123 <= wire119[(1'h1):(1'h1)];
      reg124 <= ($unsigned({$signed(wire121), wire75}) >>> wire121);
      reg125 <= $signed(wire81[(4'hd):(1'h0)]);
      reg126 <= reg123;
    end
  assign wire127 = ((8'hb7) ?
                       wire117[(2'h2):(1'h0)] : $signed($unsigned(reg124[(4'ha):(3'h7)])));
  module128 #() modinst160 (wire159, clk, wire81, wire53, wire59, reg126);
  assign wire161 = ($unsigned((7'h44)) ?
                       $unsigned(wire56) : ((({reg83, wire75} ?
                               wire127 : wire53[(4'hb):(2'h2)]) ~^ (~wire58)) ?
                           {(~^(reg83 ? wire77 : wire82)),
                               $signed(wire55[(4'hc):(1'h0)])} : ((reg122[(4'hc):(2'h3)] | (~&wire120)) ?
                               ($unsigned(wire159) > reg124) : (8'hb9))));
  assign wire162 = {(~^$unsigned(reg83[(2'h3):(2'h3)]))};
  assign wire163 = (&$unsigned({$unsigned(reg124)}));
  assign wire164 = wire77[(4'h9):(3'h7)];
  assign wire165 = wire75;
endmodule

module module4
#(parameter param45 = {(((((7'h41) ^~ (8'ha0)) ? (-(8'hb5)) : (8'hb1)) ^~ ((8'h9f) && ((8'ha0) ? (8'hb5) : (8'h9c)))) ? ((8'hba) ~^ ({(8'ha4), (8'hba)} ? (!(8'haf)) : ((8'hbc) ? (8'hb5) : (8'hae)))) : ({((7'h44) + (8'ha7))} <<< (&(~(8'hbf))))), ((~((~|(8'h9f)) ? (!(7'h41)) : ((7'h42) - (8'hb6)))) ^ (((^(8'hab)) ? ((8'hae) >= (8'ha2)) : ((8'ha9) ? (8'ha0) : (8'hb6))) ? (((8'hb8) ? (8'ha4) : (8'h9d)) ? (^~(7'h44)) : ((8'hac) <<< (8'hab))) : {((8'ha3) ? (8'hab) : (8'ha3))}))}, 
parameter param46 = {(8'hbf)})
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire25;
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  assign y = {wire44,
                 wire32,
                 wire25,
                 reg43,
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
                 reg28,
                 reg27,
                 (1'h0)};
  module10 #() modinst26 (wire25, clk, wire8, wire5, wire9, wire7);
  always
    @(posedge clk) begin
      reg27 <= (-(~^$signed(wire7)));
      reg28 <= ((wire25[(3'h5):(2'h3)] ^ (({reg27, wire5} ?
              (&wire7) : wire5[(5'h11):(3'h5)]) ^ $signed($unsigned(wire5)))) ?
          (!(7'h42)) : $unsigned(($signed(wire6[(5'h14):(3'h7)]) ?
              $unsigned(((8'ha0) ^~ (8'ha8))) : $signed(wire5[(4'h9):(3'h7)]))));
      reg29 <= ($signed(((~^(^~(7'h41))) ?
              {(&wire8), $signed(wire25)} : wire9[(5'h10):(4'hf)])) ?
          ((-$signed({reg27})) >= {wire25[(4'ha):(3'h7)],
              wire6[(3'h4):(1'h0)]}) : (wire7[(4'h8):(1'h1)] <<< (8'hb9)));
      reg30 <= reg27[(3'h4):(1'h0)];
      reg31 <= {(~&(^~(8'hae)))};
    end
  assign wire32 = ((-$unsigned(reg28)) ?
                      wire6[(4'hc):(2'h3)] : ($unsigned((|(8'haf))) ?
                          $signed((~|(8'h9d))) : (((reg30 ?
                                  (8'haf) : reg27) >>> {reg29}) ?
                              $signed($signed(reg27)) : (wire8 >> ((8'haf) >>> (8'hae))))));
  always
    @(posedge clk) begin
      reg33 <= (8'ha1);
      reg34 <= ($signed($signed((^~(reg27 ? wire32 : reg33)))) >> (((reg33 ?
          $signed(wire9) : {wire5, reg28}) > {(!reg31),
          $unsigned((7'h41))}) || {(~$signed(wire25))}));
      if ($signed((~&(~^wire7[(3'h4):(3'h4)]))))
        begin
          reg35 <= $unsigned(wire9);
          if (((-(wire7[(4'hc):(4'hc)] == (wire25 ?
                  $unsigned(wire7) : {wire9}))) ?
              (~^(reg28[(4'h8):(3'h5)] <= $signed($signed(wire8)))) : ((wire7 < $signed((wire7 ?
                  reg31 : reg30))) <= (((~reg28) ?
                  reg28 : (-reg28)) >= reg31))))
            begin
              reg36 <= reg28;
              reg37 <= wire6;
              reg38 <= {($signed(reg29[(2'h2):(2'h2)]) >>> ((7'h42) >= reg37[(1'h0):(1'h0)]))};
            end
          else
            begin
              reg36 <= ($signed($signed((^~reg33[(2'h2):(1'h1)]))) ?
                  (reg27[(3'h6):(2'h2)] ?
                      (wire7[(3'h4):(2'h2)] ?
                          reg37 : (~^reg37)) : $unsigned($unsigned({reg35,
                          reg36}))) : ((((~^wire32) > (+reg28)) >> $unsigned($unsigned(wire32))) ?
                      ({$unsigned(reg33)} >= ($unsigned((8'h9e)) >= $unsigned((7'h41)))) : wire5[(4'he):(4'he)]));
              reg37 <= (8'h9f);
              reg38 <= wire32[(3'h6):(3'h5)];
              reg39 <= (reg34 ?
                  (wire5 < $signed($unsigned(reg36[(2'h2):(2'h2)]))) : ((reg28 ?
                          (((8'h9c) * reg31) ?
                              (reg37 ?
                                  wire7 : reg31) : (reg28 == (7'h43))) : reg36[(3'h6):(2'h3)]) ?
                      (-(^$unsigned(reg38))) : $unsigned(($unsigned(wire6) ?
                          $signed(wire5) : reg35[(4'h9):(3'h6)]))));
            end
        end
      else
        begin
          if ($unsigned((~(~^reg36))))
            begin
              reg35 <= ((^~$unsigned((8'hac))) ?
                  $unsigned((^~$signed((~wire6)))) : (-wire32[(3'h7):(3'h5)]));
              reg36 <= $signed(reg30[(1'h1):(1'h1)]);
              reg37 <= $signed($unsigned(((!$unsigned(reg38)) - reg36[(4'hb):(3'h4)])));
            end
          else
            begin
              reg35 <= (|reg27);
            end
          if ($unsigned(wire5))
            begin
              reg38 <= ((~$signed($unsigned({reg31, reg37}))) - wire25);
            end
          else
            begin
              reg38 <= ($signed({$unsigned(reg27),
                      $signed((reg37 ? reg33 : reg39))}) ?
                  ({(-((8'haa) - reg31)),
                      $unsigned({(8'hb3)})} ^ $signed((((8'hb5) == reg31) ?
                      $unsigned(reg30) : (wire6 | reg29)))) : wire7[(2'h3):(1'h0)]);
              reg39 <= reg31;
              reg40 <= reg37[(4'h9):(3'h5)];
            end
          reg41 <= ($signed({$signed(reg40[(3'h6):(2'h2)])}) ?
              (8'hba) : ($unsigned($signed($unsigned(wire8))) >>> (|($unsigned(reg27) ?
                  (wire25 ? (8'hb1) : wire32) : ((8'ha7) ? wire9 : reg27)))));
          reg42 <= (+reg31);
          reg43 <= {reg36[(3'h6):(1'h0)],
              (($unsigned(wire25[(3'h6):(3'h4)]) ?
                      $signed((reg30 ?
                          wire32 : (8'ha7))) : $signed($signed(reg29))) ?
                  reg40 : (~|$signed($unsigned(reg33))))};
        end
    end
  assign wire44 = wire25[(1'h0):(1'h0)];
endmodule

module module10
#(parameter param24 = ((~^(((+(8'hb6)) >>> {(8'hb9)}) > (((8'ha5) && (8'hbf)) ? ((8'ha8) ? (8'haf) : (8'ha7)) : ((8'hb7) << (8'hbf))))) & (^~(8'ha5))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire18,
                 wire17,
                 reg21,
                 reg20,
                 reg19,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg15 <= $unsigned((^~(wire14[(2'h3):(1'h0)] ?
          ((wire12 ? wire13 : wire11) ?
              (wire12 ? wire12 : wire13) : {wire12}) : $signed(wire11))));
      reg16 <= $unsigned(wire13);
    end
  assign wire17 = wire14[(1'h0):(1'h0)];
  assign wire18 = $unsigned(wire11);
  always
    @(posedge clk) begin
      reg19 <= $unsigned(wire11);
      reg20 <= ((reg15[(1'h1):(1'h0)] ?
              $unsigned($signed(reg19[(2'h2):(1'h1)])) : wire13) ?
          $unsigned((8'hbf)) : $unsigned((((wire13 ?
              (8'ha3) : wire12) + (reg19 < wire13)) & wire11)));
      reg21 <= $signed(((&$unsigned($signed(reg15))) ?
          $unsigned((8'hbd)) : ((^~(~&wire12)) && (+wire17))));
    end
  assign wire22 = ((($signed((~|reg21)) ?
                              ((&reg19) ?
                                  reg16 : $unsigned(reg19)) : ((&(8'ha5)) ?
                                  wire11 : ((8'hb6) ~^ reg16))) ?
                          (wire12[(4'hc):(3'h5)] << (reg20[(3'h6):(1'h0)] ?
                              reg20 : reg16[(1'h1):(1'h1)])) : $signed({wire13})) ?
                      {reg19,
                          ($signed({wire13}) ?
                              reg21 : $unsigned(reg20[(3'h5):(1'h0)]))} : $signed({$unsigned(wire17[(3'h7):(3'h4)]),
                          $signed((wire12 & reg20))}));
  assign wire23 = $signed($signed((7'h42)));
endmodule

module module128
#(parameter param157 = (({((|(8'hb5)) ? ((8'hb2) ? (8'h9c) : (7'h41)) : ((8'ha8) ? (8'hb9) : (8'hb1))), (|{(8'hb6)})} ? ((((8'ha1) == (7'h42)) ? (^(8'hb9)) : {(8'hb7), (8'ha4)}) ? ((~&(8'hbb)) * ((8'hb5) > (8'hbd))) : (8'hb4)) : ({((8'hbc) || (8'ha1))} >= (((8'ha2) ? (8'hb5) : (8'ha6)) <= {(8'h9f), (8'hbf)}))) ? (^((&((8'hbd) ? (8'ha5) : (8'ha9))) ^~ {(~(8'hab)), (&(8'h9f))})) : (((((8'hbf) ? (8'had) : (8'ha9)) == (^(8'hbc))) ? (((8'hb9) ? (8'ha0) : (8'hb4)) <= (8'hbc)) : ((|(8'hb4)) ? (^~(8'hb6)) : ((8'ha9) >> (8'ha1)))) ? ((^~((8'haa) >>> (8'ha2))) ? (((8'h9c) ? (8'hb3) : (8'ha0)) ? (~^(8'hbd)) : ((8'hb6) ^~ (8'h9f))) : (((8'haa) ? (8'haa) : (8'hbb)) && ((8'hb2) ? (8'ha2) : (8'hb6)))) : ((((8'hba) ? (8'hae) : (8'ha7)) | ((8'ha4) ? (7'h40) : (8'hbb))) | (((8'hba) ? (8'hab) : (8'hb5)) >>> (-(8'ha7)))))), 
parameter param158 = {(~&(+(param157 << ((8'hab) >>> param157)))), (8'ha7)})
(y, clk, wire132, wire131, wire130, wire129);
  output wire [(32'h117):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire132;
  input wire signed [(2'h3):(1'h0)] wire131;
  input wire [(5'h15):(1'h0)] wire130;
  input wire signed [(4'he):(1'h0)] wire129;
  wire [(5'h15):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire133;
  reg [(5'h10):(1'h0)] reg156 = (1'h0);
  reg [(3'h6):(1'h0)] reg155 = (1'h0);
  reg [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(3'h5):(1'h0)] reg144 = (1'h0);
  reg [(5'h10):(1'h0)] reg143 = (1'h0);
  reg [(4'h9):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(4'hc):(1'h0)] reg140 = (1'h0);
  reg [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(3'h7):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg136 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire133,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
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
                 reg137,
                 reg136,
                 (1'h0)};
  assign wire133 = (!($unsigned(wire131) & wire132[(1'h1):(1'h0)]));
  assign wire134 = wire131[(2'h2):(1'h0)];
  assign wire135 = (((wire132 ?
                           (wire132 ?
                               (wire129 ^~ (7'h40)) : (wire130 < wire133)) : $unsigned(wire130[(5'h11):(1'h0)])) > wire131) ?
                       (wire133 ? wire134 : wire132) : ((({wire134, wire132} ?
                               $signed(wire133) : $signed(wire130)) ?
                           ({wire130,
                               wire130} >> $unsigned(wire134)) : (~&wire131[(2'h3):(2'h3)])) | wire131));
  always
    @(posedge clk) begin
      if (((^~(^((!wire129) ?
          (8'hbf) : wire134[(3'h4):(2'h3)]))) & {$signed({(8'h9c)}),
          ((^(~^wire132)) ?
              wire130[(5'h12):(1'h0)] : $signed(((8'ha7) ?
                  (8'hb5) : wire129)))}))
        begin
          reg136 <= wire132[(3'h4):(2'h2)];
          reg137 <= $unsigned(wire130);
          reg138 <= (~|($signed($unsigned((8'h9e))) ?
              (wire130 ^ wire131) : {wire129[(3'h5):(2'h2)]}));
        end
      else
        begin
          reg136 <= (reg136 <= $unsigned(((wire132[(2'h2):(1'h1)] < $unsigned(reg138)) ?
              wire133[(2'h3):(1'h0)] : ($unsigned(reg136) ^ $signed(wire135)))));
          reg137 <= ($signed(reg137) ^~ reg136);
          if ($signed(((+$unsigned((!(8'haf)))) ~^ (^~((8'ha0) >= (wire132 ?
              reg138 : reg136))))))
            begin
              reg138 <= ($unsigned(reg138) ?
                  ($signed($unsigned(wire130)) ?
                      (wire133[(3'h5):(2'h3)] ?
                          $unsigned($unsigned(wire132)) : ((reg137 - wire131) ?
                              {wire134, wire129} : ((8'hb9) ?
                                  wire131 : wire133))) : ({wire133[(4'h9):(3'h4)]} ?
                          ($signed((8'ha9)) ?
                              $unsigned(wire130) : wire129) : (^~(+wire135)))) : (+$unsigned($unsigned((wire130 << (8'hb3))))));
              reg139 <= $signed($signed((~&$unsigned((wire129 ?
                  wire131 : reg138)))));
              reg140 <= ($unsigned((wire129[(4'hc):(3'h6)] >>> wire130)) <<< (8'hbc));
              reg141 <= reg136;
              reg142 <= reg141[(1'h1):(1'h0)];
            end
          else
            begin
              reg138 <= $signed(($unsigned(wire135[(4'ha):(1'h1)]) >>> (^reg141[(3'h7):(1'h1)])));
            end
          reg143 <= (reg139 <<< (8'ha8));
        end
      reg144 <= reg137;
      reg145 <= $unsigned((wire133 ?
          $unsigned(wire129) : ((8'haf) >= $unsigned($unsigned(reg143)))));
      reg146 <= $unsigned((&(^~((!reg140) ^~ reg144))));
      if (((reg143[(4'h9):(4'h8)] ?
              (8'h9d) : ($signed(reg140) ? (~^reg139) : (~^(+reg139)))) ?
          (8'ha5) : reg136[(3'h6):(1'h0)]))
        begin
          reg147 <= (~|reg137[(3'h4):(1'h0)]);
        end
      else
        begin
          reg147 <= reg144;
          if ((^(-(reg146[(3'h5):(3'h5)] ?
              (+$signed(reg136)) : (reg144 * (wire132 ? reg138 : reg136))))))
            begin
              reg148 <= {(!wire135)};
              reg149 <= (((^~{reg136[(5'h10):(4'he)]}) ?
                      ($signed((reg147 < wire130)) * ((&wire134) && reg143[(1'h1):(1'h0)])) : reg138) ?
                  {{{reg136},
                          (8'had)}} : (($signed((&reg136)) >= wire133) - {{reg137,
                          $unsigned(wire135)}}));
              reg150 <= (!reg148[(1'h0):(1'h0)]);
              reg151 <= (|$signed(((wire135 ?
                  ((8'hba) ~^ reg141) : ((8'hac) ?
                      reg142 : reg149)) == ((reg148 ? wire134 : reg137) ?
                  {reg146} : (^wire131)))));
            end
          else
            begin
              reg148 <= ((wire130 || {wire129[(1'h0):(1'h0)]}) ?
                  {$unsigned((-reg138[(3'h6):(3'h6)]))} : $signed(reg137));
              reg149 <= (reg147[(3'h6):(3'h6)] ?
                  {reg151[(4'hd):(4'ha)], (~wire133)} : $signed((^~reg136)));
              reg150 <= (~|$unsigned((({wire130} ?
                      (reg146 + wire130) : {reg139, reg141}) ?
                  {(8'h9c), {(8'hb3)}} : ($unsigned(reg136) <= (8'had)))));
            end
          reg152 <= (reg147[(3'h4):(3'h4)] ~^ $unsigned($unsigned(wire131[(2'h3):(2'h3)])));
          if ($signed((8'ha4)))
            begin
              reg153 <= ($signed((8'hae)) >>> ($signed(reg152) > reg149));
              reg154 <= wire134;
            end
          else
            begin
              reg153 <= $unsigned({(&($unsigned((8'ha3)) && reg144[(1'h0):(1'h0)])),
                  $unsigned({$signed(reg147)})});
              reg154 <= $unsigned((wire133[(4'ha):(4'h9)] << reg148));
              reg155 <= reg145;
            end
        end
    end
  always
    @(posedge clk) begin
      reg156 <= $unsigned($unsigned(reg138));
    end
endmodule

module module84
#(parameter param115 = (^~{(~|{((8'hb8) * (8'h9c)), ((8'hb5) <<< (8'ha3))})}), 
parameter param116 = param115)
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire88;
  input wire [(5'h15):(1'h0)] wire87;
  input wire [(4'hf):(1'h0)] wire86;
  input wire [(4'he):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire114;
  wire [(4'hd):(1'h0)] wire113;
  wire signed [(3'h4):(1'h0)] wire112;
  wire [(2'h2):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire89;
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire106,
                 wire89,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire89 = $signed((8'ha8));
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed($unsigned(wire85[(2'h2):(1'h1)])))))
        begin
          reg90 <= ($unsigned(($signed(wire89) < {wire88,
              wire86[(4'hb):(4'hb)]})) + wire87);
          reg91 <= $signed(((!wire85[(4'hc):(4'ha)]) ?
              (wire85[(4'h9):(3'h5)] - (&(~&wire89))) : $signed(wire87[(4'hb):(1'h0)])));
          reg92 <= {(&({$unsigned(wire87)} ? reg90 : wire88))};
        end
      else
        begin
          reg90 <= (reg92 ? reg90[(3'h5):(2'h3)] : (8'hb3));
          if (((&wire88[(3'h7):(3'h6)]) ?
              reg92[(1'h1):(1'h1)] : wire88[(2'h3):(1'h0)]))
            begin
              reg91 <= (wire89[(1'h1):(1'h1)] ?
                  wire86[(3'h7):(1'h0)] : (~|$signed((~&(7'h44)))));
              reg92 <= (reg91 ?
                  (($unsigned({reg90}) < (~^wire85)) ?
                      (-($signed(wire87) ?
                          (7'h40) : wire85[(3'h5):(3'h5)])) : (wire85 ?
                          ($unsigned((8'haf)) ?
                              (8'hb8) : $unsigned(wire88)) : $unsigned((8'hae)))) : ({(~^(wire89 * wire85)),
                          wire87[(3'h6):(3'h5)]} ?
                      (reg90 > wire86) : wire86));
              reg93 <= (|((~wire87) ?
                  reg90 : $signed({$unsigned(reg91),
                      (wire85 ? wire86 : wire89)})));
              reg94 <= $signed($unsigned(reg92));
              reg95 <= $signed(((^~{$signed((8'hb8)),
                  reg92}) >>> (reg94 || $unsigned(wire87))));
            end
          else
            begin
              reg91 <= ($unsigned({{(reg95 ? reg94 : reg92),
                          (wire85 << wire86)}}) ?
                  {$unsigned(($signed(wire88) ?
                          (reg94 ?
                              reg94 : wire89) : $signed(reg94)))} : (reg91[(5'h10):(2'h2)] != $signed(reg95[(4'h9):(4'h9)])));
              reg92 <= (!wire85);
              reg93 <= wire86;
              reg94 <= $signed($signed((!(-wire86))));
            end
          reg96 <= reg94[(1'h1):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg97 <= ($unsigned(($unsigned($unsigned(reg95)) ?
              $signed(reg92[(4'hb):(1'h0)]) : ({(8'hb2)} ?
                  (wire87 ? reg96 : reg93) : {reg95, wire87}))) ?
          reg96 : ({(!$signed(reg91)), {(wire85 ? (8'ha0) : reg93)}} > reg95));
      if (reg93[(2'h2):(1'h1)])
        begin
          reg98 <= (!{((reg91 < reg94[(5'h13):(3'h6)]) ?
                  $signed((wire89 ?
                      wire89 : reg95)) : $signed(((8'hb5) && wire87))),
              {(&(reg95 >>> (8'ha7))), $unsigned((reg95 ? (8'ha6) : wire86))}});
          if ((&(((~|(reg97 ? wire87 : (7'h40))) ?
              $signed((wire87 ?
                  reg90 : reg91)) : $unsigned(reg92[(4'h9):(1'h0)])) | $signed(((wire86 ^~ wire89) ?
              wire87[(4'h8):(2'h2)] : {reg98, (8'hb4)})))))
            begin
              reg99 <= ((($signed({reg92}) || reg96[(1'h1):(1'h1)]) ?
                      wire87 : (&($unsigned(reg93) ?
                          $signed(wire85) : {reg91}))) ?
                  $unsigned($signed((~(!reg95)))) : $signed(($signed((&reg95)) || $signed(reg92))));
              reg100 <= (reg98[(2'h3):(1'h0)] ?
                  $signed($unsigned((reg98[(3'h5):(2'h3)] + reg98[(3'h7):(3'h5)]))) : (-$unsigned(reg92)));
            end
          else
            begin
              reg99 <= ((&wire86[(2'h2):(2'h2)]) & $signed(reg100[(5'h14):(4'hd)]));
            end
          reg101 <= $unsigned((~$unsigned(reg91)));
          reg102 <= (reg91 ?
              (^~$signed($unsigned(wire87))) : (($signed(((8'h9f) ?
                      reg96 : wire87)) ?
                  $signed(reg98) : {$unsigned(wire88),
                      $unsigned((8'hb3))}) - ((~|(-wire85)) << {(wire87 ?
                      reg97 : reg95),
                  $unsigned(reg95)})));
          if ($unsigned($signed(wire87)))
            begin
              reg103 <= {($unsigned($signed($unsigned(reg90))) <= reg93[(4'h9):(2'h3)])};
              reg104 <= ($signed($unsigned(reg98[(3'h6):(1'h1)])) ~^ ((reg92[(1'h1):(1'h1)] ?
                      (reg103[(5'h10):(4'ha)] ? wire87 : {reg96}) : {((7'h42) ?
                              reg90 : reg99)}) ?
                  reg93[(3'h7):(1'h0)] : reg95[(3'h5):(1'h1)]));
              reg105 <= {(((reg100[(5'h12):(3'h7)] ~^ (reg100 & wire89)) ^~ $signed($signed(reg104))) && reg96[(1'h0):(1'h0)]),
                  (8'ha8)};
            end
          else
            begin
              reg103 <= $signed(({$unsigned((wire88 * reg95)),
                      $unsigned(reg95[(4'h8):(2'h2)])} ?
                  ((|$unsigned(reg94)) ?
                      (+$signed(reg91)) : $signed(((8'haf) ^~ wire87))) : $signed($unsigned((reg101 && (8'hac))))));
            end
        end
      else
        begin
          reg98 <= $unsigned(wire89[(4'h8):(1'h1)]);
          reg99 <= ($signed($unsigned((reg102 * (~&reg91)))) ?
              ($unsigned((|reg101)) ?
                  (8'haa) : reg104[(3'h4):(1'h0)]) : $signed(wire85));
          reg100 <= $unsigned(reg91[(4'hd):(4'hd)]);
          if (reg99[(4'hf):(4'hd)])
            begin
              reg101 <= $unsigned(reg101[(3'h7):(3'h5)]);
              reg102 <= wire87[(4'hc):(4'h9)];
              reg103 <= (~(8'h9c));
            end
          else
            begin
              reg101 <= {(((reg99[(3'h4):(1'h0)] <= (~^reg103)) << reg104) ?
                      $signed((-$signed((8'hb7)))) : wire86[(4'h9):(1'h0)]),
                  ((((reg100 << reg98) | reg97[(4'h9):(4'h8)]) || (~|wire88)) >> (~|reg100[(2'h3):(1'h1)]))};
              reg102 <= reg100[(4'hf):(4'he)];
            end
        end
    end
  assign wire106 = $signed($unsigned($unsigned(((reg97 ^~ reg94) ~^ ((8'hb6) ?
                       reg103 : reg96)))));
  always
    @(posedge clk) begin
      reg107 <= $signed(((!$signed(reg100)) ?
          (reg92[(1'h0):(1'h0)] ?
              reg91 : wire87[(5'h12):(4'ha)]) : ($signed($unsigned(wire87)) >>> ((reg94 != wire88) ?
              (reg99 & reg101) : {wire87}))));
      reg108 <= $unsigned((+$unsigned(($unsigned(wire88) ^~ (~reg95)))));
      reg109 <= reg99;
      reg110 <= ((~|$signed(reg95[(1'h1):(1'h0)])) | ($unsigned(({reg92,
              wire86} ~^ {reg94, wire89})) ?
          (reg91 ?
              (~&reg100) : $signed(reg92[(4'hf):(1'h1)])) : reg107[(3'h6):(2'h2)]));
      reg111 <= $unsigned((((~|$unsigned((8'hb8))) == $unsigned($unsigned(wire85))) ^ reg107[(2'h2):(2'h2)]));
    end
  assign wire112 = $unsigned($unsigned(($unsigned({reg95,
                       wire86}) & $unsigned($unsigned((8'ha3))))));
  assign wire113 = (reg104[(4'h8):(1'h0)] ?
                       reg100[(4'he):(4'ha)] : {({reg111[(3'h5):(1'h1)],
                               (|wire106)} << $signed(reg108)),
                           {wire88[(3'h7):(3'h5)]}});
  assign wire114 = reg111[(3'h4):(1'h0)];
endmodule

module module60  (y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire64;
  input wire signed [(5'h14):(1'h0)] wire63;
  input wire signed [(5'h11):(1'h0)] wire62;
  input wire [(5'h13):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire67;
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'he):(1'h0)] reg65 = (1'h0);
  assign y = {wire74,
                 wire71,
                 wire67,
                 reg73,
                 reg72,
                 reg70,
                 reg69,
                 reg68,
                 reg66,
                 reg65,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg65 <= (8'ha0);
      reg66 <= $signed(wire64[(3'h6):(1'h0)]);
    end
  assign wire67 = (reg65 << (+reg66));
  always
    @(posedge clk) begin
      reg68 <= $unsigned($signed($unsigned({$unsigned(wire63)})));
      reg69 <= wire61[(4'h9):(1'h1)];
      reg70 <= $signed((reg66[(4'hd):(1'h0)] ?
          ($signed((wire67 ? wire64 : wire64)) ?
              (8'haf) : ($signed(reg68) - (reg65 && wire67))) : (wire64 ?
              (7'h40) : reg65)));
    end
  assign wire71 = (-(^~(reg68 != reg70)));
  always
    @(posedge clk) begin
      reg72 <= reg65;
      reg73 <= (8'hab);
    end
  assign wire74 = $unsigned(wire67[(4'he):(2'h2)]);
endmodule
