module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire158;
  wire [(4'he):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire135;
  wire [(3'h5):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(4'hb):(1'h0)] wire83;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire139;
  wire signed [(5'h14):(1'h0)] wire140;
  wire [(5'h15):(1'h0)] wire141;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire143;
  wire [(2'h2):(1'h0)] wire156;
  reg signed [(4'he):(1'h0)] reg155 = (1'h0);
  reg [(4'ha):(1'h0)] reg154 = (1'h0);
  reg [(3'h7):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg152 = (1'h0);
  reg [(5'h13):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(3'h6):(1'h0)] reg148 = (1'h0);
  reg [(3'h6):(1'h0)] reg147 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg [(3'h5):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg144 = (1'h0);
  assign y = {wire158,
                 wire136,
                 wire135,
                 wire80,
                 wire82,
                 wire83,
                 wire84,
                 wire85,
                 wire86,
                 wire133,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 wire142,
                 wire143,
                 wire156,
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
                 (1'h0)};
  module5 #() modinst81 (.wire6(wire1), .wire8(wire2), .wire7(wire3), .y(wire80), .clk(clk), .wire9(wire4));
  assign wire82 = $signed(wire1[(2'h2):(2'h2)]);
  assign wire83 = $unsigned({$signed(wire4),
                      ($unsigned(wire1[(4'ha):(3'h6)]) ?
                          wire80 : $signed((^wire82)))});
  assign wire84 = wire3;
  assign wire85 = wire82[(4'h8):(1'h1)];
  assign wire86 = (wire84[(1'h1):(1'h1)] - $signed(($unsigned((wire82 ?
                          wire1 : (8'ha7))) ?
                      wire84 : {wire84[(3'h5):(3'h4)]})));
  module87 #() modinst134 (wire133, clk, wire3, wire2, wire83, wire1, wire84);
  assign wire135 = ((8'hbd) ? wire80[(1'h1):(1'h1)] : (|wire85[(2'h3):(2'h3)]));
  module87 #() modinst137 (wire136, clk, wire135, wire83, wire1, wire85, wire84);
  assign wire138 = $unsigned($signed({wire85}));
  assign wire139 = $unsigned(wire85);
  assign wire140 = (~|$unsigned(({{wire80}} <= wire135[(4'hc):(3'h4)])));
  assign wire141 = (($unsigned((wire140 ?
                               $unsigned(wire84) : (wire136 ?
                                   (8'ha6) : wire140))) ?
                           {({wire1} >>> (-wire2)),
                               ((^~wire84) != (wire136 ?
                                   wire139 : (8'hbf)))} : ((!$unsigned(wire84)) ?
                               (^~(wire136 ? wire80 : wire0)) : wire82)) ?
                       wire136[(3'h6):(2'h2)] : (-((^~wire1) ?
                           (wire133 ^~ wire2) : (~|$unsigned((7'h44))))));
  assign wire142 = $unsigned((!wire139[(3'h6):(1'h1)]));
  assign wire143 = $signed(wire85[(4'hd):(4'ha)]);
  always
    @(posedge clk) begin
      reg144 <= (!$unsigned(wire138[(2'h3):(2'h2)]));
      reg145 <= ((^wire4) || wire83[(3'h7):(1'h1)]);
      reg146 <= $signed($signed((|wire136)));
      if ((+wire143[(4'h8):(3'h4)]))
        begin
          reg147 <= ((($signed((wire82 ? wire82 : wire141)) ?
                  $signed($signed(wire136)) : (~&(7'h44))) ?
              (((^wire85) & ((8'ha3) ? (8'hbf) : wire138)) & ({wire142,
                      reg144} ?
                  (wire139 ^~ wire86) : $signed((8'hb8)))) : ($unsigned($signed((8'ha3))) ?
                  $unsigned((wire135 ?
                      wire80 : wire82)) : $signed($unsigned(wire86)))) & (wire141 <= $unsigned($unsigned((wire135 + wire80)))));
          reg148 <= wire0[(1'h0):(1'h0)];
          reg149 <= ((reg144[(4'ha):(3'h7)] ?
                  {{$unsigned(wire139), (wire2 & wire0)},
                      {wire138[(2'h2):(1'h1)]}} : wire136[(3'h6):(1'h0)]) ?
              (~|$signed($signed({reg144}))) : wire3[(5'h12):(2'h3)]);
          reg150 <= ((|wire139[(2'h2):(1'h1)]) & wire143[(4'ha):(2'h3)]);
          if ((wire4 ?
              wire1[(4'he):(3'h4)] : (wire84[(1'h0):(1'h0)] ?
                  $unsigned(reg145[(1'h0):(1'h0)]) : reg148[(3'h4):(2'h3)])))
            begin
              reg151 <= wire83;
            end
          else
            begin
              reg151 <= ((&$signed((~(wire3 >>> reg151)))) ?
                  $signed({($signed(reg145) - $signed(wire142))}) : (|$unsigned((8'ha5))));
              reg152 <= wire86[(2'h2):(2'h2)];
              reg153 <= $unsigned($signed($signed({{wire85}})));
              reg154 <= $unsigned($signed((wire140 ?
                  {(wire138 + wire86),
                      wire1[(4'h8):(3'h5)]} : ($unsigned(wire85) * (~^wire2)))));
              reg155 <= {$unsigned({((^reg145) == reg154[(4'ha):(4'ha)]),
                      (~wire3[(2'h3):(1'h1)])})};
            end
        end
      else
        begin
          reg147 <= wire140;
          reg148 <= $signed($signed(($signed((wire138 ? wire3 : reg151)) ?
              (((8'hb0) << wire1) ?
                  (wire4 ? wire83 : wire84) : (~^wire133)) : (8'hb0))));
          reg149 <= wire4;
          reg150 <= (((8'ha0) ?
              {(|(wire1 ^ wire1)),
                  $unsigned(wire139)} : (8'ha3)) != ((wire133[(2'h2):(1'h1)] ?
              {{wire83,
                      reg146}} : $unsigned($unsigned(wire3))) <= ($signed(reg145[(3'h5):(2'h2)]) ?
              ($unsigned(reg155) == $signed(wire82)) : (^~(-wire141)))));
          reg151 <= (wire3 << $signed(($signed($unsigned(wire135)) ?
              reg145[(2'h3):(1'h0)] : (8'hae))));
        end
    end
  module49 #() modinst157 (wire156, clk, reg154, reg151, reg149, wire82, reg144);
  assign wire158 = (8'h9c);
endmodule

module module87
#(parameter param131 = ((({(!(8'hbd)), {(8'ha3), (8'hba)}} ? (((8'ha3) ? (8'hb2) : (8'hab)) || ((8'hb3) ? (8'hb1) : (8'hbd))) : (((8'ha4) ? (8'hb3) : (8'haf)) ? ((8'hbb) * (8'ha6)) : ((8'h9e) | (8'h9c)))) ? ((((8'h9c) < (7'h42)) || ((8'hb6) ? (8'hb4) : (8'hac))) ? {(8'hae), (~^(8'ha8))} : ((|(8'haf)) <<< (-(8'ha8)))) : ({(~(8'h9d)), ((8'hbe) <<< (8'hb3))} << {((8'hb8) < (7'h40)), ((8'ha0) ? (8'hac) : (7'h44))})) ? ((((^(8'hbf)) || (~^(8'hb9))) ? (+(~|(8'h9e))) : (-((8'hbb) <= (8'h9d)))) ? {{((7'h40) + (7'h42))}} : ((((8'hac) * (8'ha8)) ^~ (~^(8'ha3))) ? {{(8'hb5)}, ((8'ha0) >> (8'h9f))} : (((7'h44) == (8'ha9)) ? ((8'h9d) ? (8'hba) : (8'ha5)) : (&(8'ha6))))) : (8'hb1)), 
parameter param132 = (~^{((param131 <= ((8'h9f) ? param131 : param131)) == (^~(8'hb2)))}))
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire92;
  input wire signed [(2'h2):(1'h0)] wire91;
  input wire [(3'h5):(1'h0)] wire90;
  input wire signed [(5'h12):(1'h0)] wire89;
  input wire [(4'h9):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire130;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire126;
  wire [(5'h12):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire100;
  reg [(3'h5):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg98 = (1'h0);
  reg [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(4'h8):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire126,
                 wire101,
                 wire100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= $unsigned({(|({wire89, wire88} + $signed((8'haa)))),
          (wire89 != $unsigned((wire88 + wire90)))});
      reg94 <= (wire91[(2'h2):(2'h2)] ?
          wire91 : $unsigned($unsigned($unsigned((wire90 ^ wire90)))));
      reg95 <= $signed(wire91);
      if ($signed($signed(wire89[(2'h2):(1'h0)])))
        begin
          reg96 <= ({{(!{(8'haf)}), wire88[(3'h5):(2'h3)]}} == (8'ha4));
          reg97 <= reg95[(3'h5):(2'h2)];
        end
      else
        begin
          if ($signed((|$signed($unsigned((reg94 ? reg94 : (8'hac)))))))
            begin
              reg96 <= ((|(+$signed((wire92 >>> reg97)))) & $unsigned($signed((wire91[(2'h2):(1'h0)] && (reg97 - wire90)))));
              reg97 <= wire89[(2'h2):(2'h2)];
            end
          else
            begin
              reg96 <= ({((wire92 << (wire92 ?
                      reg96 : wire89)) == ({reg94} >= $signed(reg97)))} & (wire89 ?
                  ($unsigned($unsigned(wire89)) << $signed((8'hbe))) : ((~&$signed(wire90)) * ($unsigned(wire88) ?
                      {(8'h9d)} : reg97[(5'h11):(3'h4)]))));
            end
          reg98 <= (+$unsigned($unsigned($unsigned((~|(7'h44))))));
        end
      reg99 <= $signed(reg98[(3'h4):(3'h4)]);
    end
  assign wire100 = (~^(($signed($unsigned(wire92)) & $unsigned($unsigned(reg93))) | reg99));
  assign wire101 = wire88;
  module102 #() modinst127 (.y(wire126), .wire104(wire92), .wire105(reg98), .clk(clk), .wire106(reg96), .wire103(wire100));
  assign wire128 = $signed((wire101 << {$signed((reg93 <= (8'hb6))),
                       $unsigned(wire126)}));
  assign wire129 = wire91[(1'h1):(1'h1)];
  assign wire130 = (+(wire90 >= ($unsigned(wire128) ?
                       (~|(reg95 ^~ wire91)) : {(-wire126)})));
endmodule

module module5
#(parameter param79 = (((!((~|(8'hb7)) ? ((8'ha6) >= (8'h9c)) : {(8'hac)})) ? ({((7'h43) ? (8'hab) : (8'hb5)), ((8'ha1) * (8'hac))} >>> (!((8'ha7) | (7'h41)))) : {(+(+(8'hbe))), (|(8'hbf))}) >= (((((8'hbd) ? (8'hb6) : (8'ha0)) ? ((8'haa) ? (8'had) : (8'ha9)) : ((8'haf) && (8'ha5))) == {(-(8'h9e))}) ? (-(((8'hbc) >= (8'ha3)) != ((8'hbc) & (8'ha3)))) : (({(8'hac)} ? (|(8'h9c)) : ((8'ha7) - (8'hb8))) ^ (((8'hb4) >> (8'hb3)) && (!(8'h9f)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire74;
  reg signed [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  assign y = {wire37,
                 wire11,
                 wire10,
                 wire39,
                 wire47,
                 wire48,
                 wire74,
                 reg78,
                 reg77,
                 reg76,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire10 = (wire8 ?
                      wire9[(2'h2):(1'h1)] : ($unsigned((wire8[(4'h8):(1'h0)] ?
                              $unsigned(wire6) : wire8[(3'h7):(3'h4)])) ?
                          $unsigned(((^~wire6) ?
                              $unsigned(wire8) : {wire9,
                                  wire8})) : wire6[(3'h4):(2'h2)]));
  assign wire11 = (+$unsigned(wire6[(3'h7):(3'h7)]));
  module12 #() modinst38 (.wire15(wire8), .wire16(wire9), .wire14(wire11), .clk(clk), .wire17(wire7), .wire13(wire10), .y(wire37));
  assign wire39 = wire11;
  always
    @(posedge clk) begin
      reg40 <= (wire7[(3'h5):(2'h3)] ?
          $unsigned($signed((+(wire8 && wire6)))) : {($signed(wire8) ?
                  wire9 : $unsigned((8'ha3))),
              (&$unsigned((~&wire9)))});
      reg41 <= $unsigned(wire39);
      reg42 <= $signed((^$unsigned(reg40)));
      if ((~&$signed((-wire7[(3'h5):(1'h1)]))))
        begin
          reg43 <= reg41;
        end
      else
        begin
          reg43 <= ((reg41[(3'h6):(2'h2)] ?
              wire10 : (reg42[(3'h6):(3'h6)] ?
                  $unsigned(reg41) : wire11)) > ($signed({(wire6 >>> wire8)}) ?
              (~^reg40) : $unsigned(($unsigned(wire6) >>> (wire37 ?
                  reg41 : reg43)))));
          reg44 <= $unsigned($signed((reg42 + ($unsigned((8'h9d)) ?
              (wire7 ? wire6 : wire39) : $unsigned(reg42)))));
          reg45 <= ((^(8'hb7)) - reg41);
        end
      reg46 <= (reg40 ?
          (((wire9 <= (~&(8'hbb))) ?
              reg44[(3'h4):(2'h2)] : {$unsigned(wire8)}) + $unsigned($signed(wire7))) : wire37);
    end
  assign wire47 = wire11;
  assign wire48 = reg42[(1'h0):(1'h0)];
  module49 #() modinst75 (.clk(clk), .y(wire74), .wire53(reg40), .wire51(reg45), .wire54(reg46), .wire50(reg43), .wire52(wire48));
  always
    @(posedge clk) begin
      reg76 <= (~|wire48[(4'h8):(3'h5)]);
      if (wire37)
        begin
          reg77 <= ($signed(reg43[(3'h6):(1'h1)]) ?
              ((~|wire9[(1'h1):(1'h1)]) ?
                  $signed($unsigned({(8'ha0)})) : (~&(^~wire6[(2'h2):(1'h1)]))) : ($unsigned((|(-(8'ha7)))) ^ $signed(((-reg44) * (reg41 ?
                  (8'hbb) : wire37)))));
          reg78 <= $signed(reg46[(3'h7):(2'h3)]);
        end
      else
        begin
          reg77 <= (reg77[(3'h4):(2'h2)] ?
              reg43[(1'h0):(1'h0)] : reg42[(1'h1):(1'h1)]);
        end
    end
endmodule

module module49
#(parameter param73 = (7'h42))
(y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire54;
  input wire signed [(4'hc):(1'h0)] wire53;
  input wire signed [(2'h3):(1'h0)] wire52;
  input wire [(4'hb):(1'h0)] wire51;
  input wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(4'hf):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'hf):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(3'h6):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
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
                 (1'h0)};
  assign wire55 = wire54[(2'h3):(1'h1)];
  assign wire56 = wire53;
  assign wire57 = (^~(wire53[(1'h1):(1'h0)] && wire56));
  assign wire58 = $signed((wire51[(1'h0):(1'h0)] ?
                      ($signed(wire55) ?
                          (^~(wire57 >= wire56)) : (((8'hbf) & (7'h42)) ?
                              (~^(8'hb6)) : (wire55 + (8'hbf)))) : wire52[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg59 <= (+(wire57[(3'h6):(3'h5)] > ((~|(wire53 ?
          wire53 : (8'ha5))) >> ($signed((8'ha2)) ?
          $signed(wire56) : wire56))));
      reg60 <= $unsigned($unsigned($unsigned(wire54)));
      if ((-$signed((wire58 >= $unsigned($unsigned(wire58))))))
        begin
          reg61 <= $signed(wire54[(1'h0):(1'h0)]);
          reg62 <= ((^~(!((wire50 ? wire52 : wire50) ^ (!wire55)))) ?
              $signed((8'hb9)) : {{$unsigned(wire53[(3'h5):(3'h4)])}});
          reg63 <= ($unsigned($signed((wire54 == (8'hbf)))) * (&wire56[(2'h3):(1'h0)]));
          reg64 <= (((($signed(reg63) >>> $signed(wire52)) ?
              $signed(((8'hbe) ~^ (8'h9d))) : $unsigned(((7'h42) ?
                  wire55 : wire52))) ~^ (-(wire53[(3'h5):(2'h2)] ^ $unsigned(reg62)))) < $signed(((wire54 ?
                  (reg60 ? reg63 : (8'h9e)) : {wire52, wire56}) ?
              $unsigned(reg59) : $signed($signed(wire58)))));
        end
      else
        begin
          reg61 <= $unsigned((({((8'hbb) | (8'hb9))} ?
                  (reg59 ~^ reg61[(4'hd):(3'h4)]) : (+wire53[(4'hc):(4'h9)])) ?
              (^($signed(wire57) ?
                  (-wire51) : (wire53 <= wire54))) : $unsigned(wire51)));
          reg62 <= (&(|$signed(((reg59 ?
              wire53 : reg63) & wire52[(1'h1):(1'h1)]))));
          reg63 <= $signed((reg59 | (8'ha0)));
        end
      if (wire51[(4'ha):(4'ha)])
        begin
          reg65 <= (^{(|reg64[(4'hb):(4'ha)]),
              ((wire57 == $unsigned(reg62)) ?
                  (^~(wire54 ?
                      wire54 : wire50)) : $unsigned($unsigned(reg62)))});
          reg66 <= $signed((~(wire50[(4'hc):(3'h5)] + $unsigned($unsigned((8'haa))))));
          reg67 <= ((-$unsigned((wire55[(1'h1):(1'h0)] & (reg61 ?
                  reg66 : wire52)))) ?
              $signed($signed((^(+reg66)))) : (~|reg61));
          if ({wire51[(4'hb):(3'h6)], wire55})
            begin
              reg68 <= reg64;
              reg69 <= $unsigned((reg59 ?
                  (~&(~^$unsigned(reg65))) : (((wire50 ? wire56 : reg65) ?
                      (^reg65) : wire57) << reg66[(2'h2):(2'h2)])));
              reg70 <= {$signed((reg67[(4'hb):(2'h2)] << $unsigned($unsigned(reg62))))};
              reg71 <= reg64;
            end
          else
            begin
              reg68 <= reg67[(4'hb):(4'h8)];
            end
          reg72 <= ({(wire54[(1'h0):(1'h0)] ? (~&$unsigned(reg70)) : (8'hb1)),
                  ({wire58} - $unsigned($unsigned(reg68)))} ?
              reg64[(4'hd):(2'h2)] : {(^(wire57[(1'h0):(1'h0)] ?
                      reg59 : (reg59 ? wire54 : (8'hac)))),
                  wire51[(3'h6):(3'h5)]});
        end
      else
        begin
          reg65 <= (^wire54[(2'h2):(1'h0)]);
          if ((~^wire50[(4'h8):(2'h3)]))
            begin
              reg66 <= $signed(($signed((+wire56)) + reg64[(4'hf):(4'hc)]));
              reg67 <= reg60[(2'h2):(1'h0)];
              reg68 <= $unsigned($unsigned((8'hb6)));
              reg69 <= {$unsigned(wire58),
                  $unsigned(((~(reg66 >>> reg65)) ?
                      $unsigned(wire52) : wire53))};
            end
          else
            begin
              reg66 <= reg72[(1'h1):(1'h0)];
            end
        end
    end
endmodule

module module12
#(parameter param35 = (((((~&(8'ha5)) || (|(8'ha1))) * (-(^~(8'hab)))) ? (~(!((8'ha4) >> (8'h9f)))) : (((!(7'h42)) << (8'hac)) ? {(-(7'h40)), ((8'hb0) ? (8'h9f) : (8'hae))} : (~^(~|(8'hb8))))) ? ((^~((~^(8'hab)) ? ((8'h9c) < (8'ha3)) : ((7'h40) ? (8'haa) : (8'h9c)))) ? (({(8'ha6), (8'ha2)} ~^ ((8'hb8) <= (8'ha2))) ? {((8'hb9) ? (8'ha5) : (8'hb7))} : (~&((8'ha2) <<< (8'hb3)))) : ((^~(~(8'haa))) - (8'ha3))) : {((~((8'hac) >>> (7'h43))) ? ((8'ha6) ^~ (~|(8'hb2))) : (((8'hb3) ? (8'hbe) : (7'h44)) << ((8'hb2) ? (8'ha0) : (8'h9e)))), (~^(&(8'hba)))}), 
parameter param36 = (&(param35 & param35)))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire17;
  input wire [(2'h2):(1'h0)] wire16;
  input wire signed [(2'h3):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hf):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire20;
  wire signed [(4'h8):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  assign y = {wire34,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg26,
                 (1'h0)};
  assign wire18 = (wire14[(5'h10):(2'h3)] == wire15);
  assign wire19 = $unsigned((~|$signed({(wire15 ? (8'haf) : wire15)})));
  assign wire20 = wire14[(2'h2):(1'h0)];
  assign wire21 = wire19;
  assign wire22 = (+((wire19 == $signed(((8'had) || (8'hac)))) ^ $unsigned($signed($unsigned(wire19)))));
  assign wire23 = wire17[(3'h5):(2'h2)];
  assign wire24 = (8'had);
  assign wire25 = wire18[(5'h10):(1'h0)];
  always
    @(posedge clk) begin
      reg26 <= wire14;
    end
  assign wire27 = $signed($signed((((^wire17) | (&reg26)) ?
                      $signed($signed(reg26)) : ((~&wire23) + (~^wire24)))));
  assign wire28 = wire21[(3'h7):(1'h0)];
  assign wire29 = wire20;
  always
    @(posedge clk) begin
      if ($signed((wire15 * wire25[(1'h1):(1'h0)])))
        begin
          reg30 <= (~(8'ha3));
        end
      else
        begin
          reg30 <= $unsigned(($unsigned($unsigned((~|wire24))) & {((wire17 + (8'ha5)) ?
                  {wire13, wire14} : $signed(wire19)),
              (wire29 ? wire19[(2'h3):(1'h0)] : (wire16 ? wire27 : wire13))}));
          reg31 <= reg30[(2'h3):(2'h3)];
          reg32 <= ({((^~(reg26 ? (8'hb1) : wire29)) ?
                  (~&(wire18 && wire21)) : wire25),
              wire28} << wire20[(5'h12):(4'h9)]);
          reg33 <= ($unsigned($signed((wire21[(1'h1):(1'h1)] ?
                  (!reg32) : {wire19, wire13}))) ?
              ((&((wire16 || wire23) != reg31)) == (|($signed(wire22) ?
                  (|wire22) : {wire22}))) : {$signed($unsigned(wire19[(1'h1):(1'h1)]))});
        end
    end
  assign wire34 = (-$unsigned(reg32[(2'h3):(1'h1)]));
endmodule

module module102
#(parameter param125 = (((8'hbf) ^~ (({(8'hb3), (8'ha6)} & (^~(8'ha8))) ^~ ({(7'h41)} & ((8'ha6) ? (8'hb9) : (8'had))))) ? (((&{(8'ha3), (8'hb8)}) & (^((8'hb9) ~^ (8'ha1)))) ? ((&((8'hb4) ? (8'hbd) : (8'hbb))) ? (((8'hab) == (7'h42)) ? ((8'hb1) ? (8'h9f) : (7'h44)) : (|(8'hac))) : (((8'hb6) ? (8'hb0) : (8'h9f)) >= ((8'had) >>> (8'hb9)))) : (~&(((8'hae) & (8'hb5)) | ((8'ha6) <= (8'hbe))))) : ({(((8'hb6) ? (8'ha8) : (8'hb8)) ? (&(8'haf)) : ((8'ha8) <= (8'hac))), (((8'hbf) == (7'h42)) ^ ((7'h40) && (8'hab)))} - {{((8'hae) && (8'hbf)), {(8'ha0), (8'hac)}}, (((8'h9d) + (8'ha7)) ~^ ((8'ha3) ? (8'hb8) : (8'h9f)))})))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire106;
  input wire [(5'h14):(1'h0)] wire105;
  input wire [(4'hd):(1'h0)] wire104;
  input wire signed [(4'hb):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire124;
  wire [(4'hd):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire122;
  wire signed [(5'h14):(1'h0)] wire120;
  wire [(2'h3):(1'h0)] wire119;
  wire [(2'h3):(1'h0)] wire118;
  wire [(4'hf):(1'h0)] wire117;
  wire signed [(3'h5):(1'h0)] wire116;
  wire signed [(4'h9):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire [(2'h2):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  reg [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg [(5'h10):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  assign y = {wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 reg121,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire107 = wire104;
  assign wire108 = $unsigned({(-(wire105[(5'h12):(2'h3)] ?
                           wire103[(4'hb):(1'h0)] : wire103)),
                       wire107});
  assign wire109 = wire107[(1'h1):(1'h1)];
  assign wire110 = wire104;
  always
    @(posedge clk) begin
      reg111 <= wire108[(1'h0):(1'h0)];
      reg112 <= wire105;
      reg113 <= (-($unsigned($unsigned(reg111)) >> $signed($unsigned({wire108}))));
      reg114 <= {((~&$signed(wire107[(3'h5):(1'h1)])) - $signed((wire105[(5'h14):(5'h11)] >> $signed(reg113))))};
      reg115 <= reg111;
    end
  assign wire116 = $signed(wire105);
  assign wire117 = $signed(($signed(reg115[(1'h1):(1'h1)]) * (~$unsigned(wire109[(4'h8):(1'h1)]))));
  assign wire118 = ($unsigned(wire117) < ((^~$unsigned((wire107 || reg114))) && $signed($signed({(8'hb5)}))));
  assign wire119 = $signed(reg113);
  assign wire120 = wire119[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg121 <= (+(&wire116));
    end
  assign wire122 = reg113[(2'h2):(2'h2)];
  assign wire123 = {reg112};
  assign wire124 = $signed(($signed((~(8'ha2))) ?
                       $unsigned({((8'ha9) >> wire108),
                           (reg113 ?
                               wire117 : reg115)}) : $signed(reg115[(1'h0):(1'h0)])));
endmodule
