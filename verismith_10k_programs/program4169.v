module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire138;
  assign y = {wire5, wire6, wire7, wire138, (1'h0)};
  assign wire5 = {(8'ha2),
                     ({{(wire4 ? wire1 : wire4)}} ?
                         wire4[(4'he):(2'h2)] : wire1)};
  assign wire6 = $signed((~&((8'hb2) ?
                     $signed((wire5 == wire0)) : $signed({wire2, wire1}))));
  assign wire7 = $unsigned(wire5[(2'h2):(1'h1)]);
  module8 #() modinst139 (wire138, clk, wire7, wire3, wire6, wire2, wire0);
endmodule

module module8
#(parameter param137 = (((&(((8'ha7) ? (8'h9d) : (8'hb9)) ? ((8'hb2) - (8'hac)) : ((8'hbb) ? (8'ha0) : (8'ha9)))) ? (8'ha0) : ((((8'hb9) & (8'hb1)) ? (~^(8'hb1)) : ((8'haf) >>> (8'ha6))) ? {((8'h9e) < (7'h40)), {(8'hab), (8'ha6)}} : (~^(^~(8'hbc))))) | (|((((8'ha7) ? (8'h9e) : (8'h9e)) || (~&(8'hb2))) * (7'h43)))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire136;
  wire [(5'h11):(1'h0)] wire135;
  wire signed [(5'h11):(1'h0)] wire133;
  wire [(5'h11):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire [(4'hb):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  wire signed [(4'hf):(1'h0)] wire92;
  wire [(3'h7):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire49;
  reg signed [(2'h2):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire133,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire85,
                 wire83,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire14,
                 wire15,
                 wire49,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg55,
                 reg56,
                 (1'h0)};
  assign wire14 = ((|($signed((~wire9)) ?
                          $unsigned((~(8'ha9))) : (~&$signed(wire12)))) ?
                      wire12[(3'h6):(2'h2)] : (~&wire11[(3'h4):(2'h3)]));
  assign wire15 = (~|(wire10[(5'h11):(2'h2)] ?
                      $unsigned((((8'ha9) ?
                          wire10 : wire14) < wire14[(4'hb):(1'h1)])) : $unsigned({{wire11,
                              wire14},
                          $unsigned(wire11)})));
  module16 #() modinst50 (.wire17(wire14), .clk(clk), .y(wire49), .wire18(wire15), .wire20(wire12), .wire19(wire9), .wire21(wire13));
  assign wire51 = (wire11[(4'ha):(2'h3)] <<< $signed({(^$unsigned((8'hb5)))}));
  assign wire52 = wire15[(4'ha):(3'h7)];
  assign wire53 = wire51[(1'h0):(1'h0)];
  assign wire54 = $unsigned((~|(~|((!wire12) ? (wire11 >>> wire53) : wire13))));
  always
    @(posedge clk) begin
      reg55 <= (($unsigned(((wire14 || wire53) ?
              (wire52 ? wire52 : wire53) : wire15)) ?
          $unsigned(((8'ha2) ?
              wire10[(4'h8):(3'h4)] : $signed(wire54))) : {(8'ha4),
              (wire15[(4'h9):(3'h6)] ? wire9 : (~&wire12))}) == wire11);
      reg56 <= wire54[(2'h2):(1'h1)];
    end
  module57 #() modinst84 (.wire60(wire11), .wire59(reg56), .wire62(wire49), .y(wire83), .clk(clk), .wire61(wire54), .wire58(wire51));
  assign wire85 = reg55[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if (($unsigned(wire52[(2'h3):(2'h3)]) ? wire52[(5'h12):(1'h0)] : (8'hbe)))
        begin
          reg86 <= ($unsigned(($signed(wire54) ?
                  ($signed(wire53) ?
                      (wire51 + wire11) : (wire52 != reg55)) : ($signed(wire9) >= wire51[(4'h9):(1'h1)]))) ?
              ((($unsigned(reg56) ?
                      wire9 : wire52) > $signed($unsigned((8'h9c)))) ?
                  $signed(($unsigned((8'ha4)) ?
                      (wire83 || wire54) : (wire14 >= (8'hae)))) : (~|wire49[(3'h6):(1'h1)])) : wire52);
          reg87 <= $signed((~|{(&((8'hbf) < reg55)),
              (wire85[(1'h1):(1'h1)] ?
                  wire53[(4'hb):(2'h3)] : $unsigned(wire10))}));
          reg88 <= $unsigned($signed((~^$signed(wire9))));
          reg89 <= $unsigned((|($signed((8'hae)) < {$unsigned(wire9)})));
        end
      else
        begin
          reg86 <= (~{(reg88 * (~&(|(8'hbc)))),
              ($unsigned((wire54 <<< wire54)) ?
                  wire51 : $signed((reg86 + wire10)))});
          reg87 <= {$unsigned(wire15),
              {reg86[(4'ha):(4'ha)], $signed((reg55 <= $signed((8'ha8))))}};
          reg88 <= wire10;
          reg89 <= wire10;
        end
      reg90 <= $unsigned($unsigned((((^~wire11) - $unsigned(wire11)) ?
          reg87[(2'h2):(2'h2)] : (~^{wire11}))));
      reg91 <= $signed({$signed($signed($unsigned(wire9)))});
    end
  assign wire92 = (+$unsigned($unsigned({wire14, wire83[(5'h11):(3'h5)]})));
  assign wire93 = ({($unsigned((!wire92)) || wire54)} ?
                      $unsigned((^(~wire15))) : wire14);
  assign wire94 = {$unsigned(wire12)};
  assign wire95 = reg87[(2'h2):(1'h0)];
  assign wire96 = ((8'hac) + wire11[(1'h1):(1'h1)]);
  assign wire97 = (~$unsigned($signed($signed({wire51, reg88}))));
  module98 #() modinst134 (wire133, clk, wire14, wire83, reg88, reg90);
  assign wire135 = (|(($signed((&reg55)) || ((wire133 != wire92) ?
                       $unsigned(reg90) : wire10[(4'h8):(2'h3)])) << reg91[(1'h0):(1'h0)]));
  assign wire136 = $signed(wire94[(4'h9):(3'h7)]);
endmodule

module module98
#(parameter param131 = (({(((8'ha5) ? (8'had) : (7'h42)) ? ((8'h9f) ? (8'haf) : (8'hb4)) : (~|(8'hb9))), ({(8'ha5)} ? ((8'ha6) >> (8'haf)) : ((8'hb9) == (8'hb6)))} <<< (~^{{(8'hb7), (8'ha0)}, {(8'ha0), (8'h9f)}})) <= (~((~^((8'ha3) ? (8'haf) : (8'hb3))) && ((~(8'hb8)) >>> ((8'ha2) ? (8'hbd) : (7'h40)))))), 
parameter param132 = {param131})
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire102;
  input wire [(4'h8):(1'h0)] wire101;
  input wire [(4'h8):(1'h0)] wire100;
  input wire signed [(5'h12):(1'h0)] wire99;
  wire signed [(2'h2):(1'h0)] wire130;
  wire signed [(4'hc):(1'h0)] wire110;
  wire signed [(3'h4):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  wire signed [(4'h9):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire106;
  wire [(5'h14):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  reg [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg125 = (1'h0);
  reg [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(5'h10):(1'h0)] reg112 = (1'h0);
  reg signed [(4'he):(1'h0)] reg111 = (1'h0);
  assign y = {wire130,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 reg129,
                 reg128,
                 reg127,
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
  assign wire103 = {{(8'ha4)}, $unsigned($signed((~wire99)))};
  assign wire104 = wire103;
  assign wire105 = {{($unsigned((wire99 < wire101)) ?
                               ($signed(wire100) ?
                                   (wire99 >= wire100) : wire100[(3'h5):(1'h1)]) : (!wire103[(3'h4):(1'h1)])),
                           {(^~{wire99})}}};
  assign wire106 = (~(^~($unsigned(wire101[(4'h8):(3'h7)]) <<< wire103[(2'h2):(2'h2)])));
  assign wire107 = ((-$unsigned(((wire106 ? (8'ha7) : wire103) ?
                           $signed(wire99) : (^wire105)))) ?
                       $signed(((&{wire102}) ?
                           $signed($unsigned(wire101)) : $signed(((8'haf) ?
                               wire103 : (8'hb4))))) : (($signed((+wire104)) ?
                               $signed(((8'hbf) ?
                                   wire102 : wire105)) : (wire99[(5'h12):(2'h3)] == wire101)) ?
                           $unsigned(wire99[(3'h4):(1'h0)]) : wire106[(3'h4):(2'h2)]));
  assign wire108 = ($unsigned(wire107[(2'h2):(1'h0)]) <<< {wire100,
                       ({(|wire103), wire103} ?
                           $unsigned(wire107) : {wire107[(2'h2):(2'h2)]})});
  assign wire109 = $unsigned(wire101);
  assign wire110 = (8'ha6);
  always
    @(posedge clk) begin
      reg111 <= $signed($signed($unsigned((~((7'h40) ? wire110 : wire102)))));
      reg112 <= wire105;
      reg113 <= reg112[(4'ha):(4'h8)];
      reg114 <= $signed($unsigned(($unsigned((8'hb9)) ?
          $unsigned((wire99 ? wire102 : (8'ha6))) : wire103)));
      reg115 <= wire107;
    end
  always
    @(posedge clk) begin
      if (wire104)
        begin
          reg116 <= $signed({{$unsigned($signed(wire99)),
                  ($unsigned((8'hb5)) * (wire105 >>> wire106))},
              ((|wire108[(4'ha):(3'h5)]) ?
                  wire101[(2'h2):(1'h0)] : (|$unsigned(wire101)))});
          reg117 <= wire110;
        end
      else
        begin
          reg116 <= $unsigned($signed(wire109));
          reg117 <= (~&$unsigned(wire101[(3'h4):(2'h2)]));
          reg118 <= (((8'ha3) * wire108[(2'h2):(1'h1)]) ^~ $signed($signed(wire108[(1'h0):(1'h0)])));
        end
      if ({$unsigned(({((8'haf) || reg117), (wire101 ? wire106 : wire103)} ?
              ((wire102 + reg115) ?
                  $signed(wire110) : wire107[(4'h8):(2'h3)]) : ($signed((8'hb0)) ^~ (wire105 * wire104))))})
        begin
          reg119 <= {($signed((8'ha0)) > ((8'hb2) ?
                  ((reg118 ^~ (8'ha1)) >= (wire110 ?
                      (7'h42) : wire109)) : (~|(8'h9e))))};
          if (reg111)
            begin
              reg120 <= {reg115};
              reg121 <= (8'hb3);
              reg122 <= wire100[(4'h8):(1'h0)];
              reg123 <= ($unsigned($unsigned($signed((reg120 ?
                  reg112 : (8'hae))))) == reg121[(1'h1):(1'h1)]);
            end
          else
            begin
              reg120 <= (wire108[(2'h3):(1'h0)] * reg122);
              reg121 <= $signed($signed(reg114));
              reg122 <= $signed(wire106);
            end
          reg124 <= ($signed(wire99[(4'h8):(3'h7)]) >= $unsigned((8'hb7)));
          reg125 <= $unsigned(reg111);
          reg126 <= {({$signed(reg120[(1'h1):(1'h0)])} < reg119[(3'h7):(1'h1)])};
        end
      else
        begin
          if (reg122)
            begin
              reg119 <= ($unsigned($unsigned(({wire106, (8'ha3)} << reg124))) ?
                  ($unsigned(wire99[(1'h1):(1'h1)]) >> ($unsigned(reg118[(1'h0):(1'h0)]) << {(wire101 ?
                          wire109 : wire101),
                      $signed(wire104)})) : wire109[(3'h4):(2'h3)]);
            end
          else
            begin
              reg119 <= ($signed((((~&reg118) ? (|reg120) : (|reg111)) ?
                  wire104 : reg117)) && (($unsigned(((7'h40) & (7'h40))) ?
                  (!$unsigned(wire108)) : reg126) | $signed((&reg113[(3'h5):(3'h4)]))));
              reg120 <= $signed((((8'haf) ?
                  ($signed(wire99) ?
                      (~^reg122) : (reg114 ?
                          wire101 : (8'hb4))) : (!(reg111 ^~ reg118))) - $unsigned((|reg111[(3'h4):(2'h3)]))));
            end
        end
      reg127 <= $signed($signed((~|(^~$signed(wire99)))));
      reg128 <= $signed($signed((($signed(wire102) <= reg117[(4'hf):(3'h6)]) >>> reg126)));
      reg129 <= reg118;
    end
  assign wire130 = reg127;
endmodule

module module57
#(parameter param81 = (((^{{(8'hbf), (8'haa)}, ((8'ha1) & (8'h9e))}) != (~(((8'ha0) ? (8'hbf) : (8'h9c)) ? (8'hb1) : ((7'h42) ? (8'ha3) : (8'haf))))) || ((((-(8'h9f)) ? (+(8'haa)) : ((8'ha9) ? (8'hbb) : (7'h41))) > (^~(~|(8'hab)))) <= ((-(|(8'hb6))) ? (((8'ha3) ^~ (8'ha9)) ? ((8'ha3) ? (8'hb4) : (8'ha3)) : (-(8'hbd))) : ({(8'haf)} ? ((8'h9e) >>> (8'hb3)) : (8'h9e))))), 
parameter param82 = ((((param81 > (param81 ? param81 : param81)) <= (^((8'hab) <= param81))) ? (+(~&(param81 ? param81 : param81))) : param81) & param81))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'hd1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire62;
  input wire signed [(3'h7):(1'h0)] wire61;
  input wire signed [(4'hf):(1'h0)] wire60;
  input wire [(4'he):(1'h0)] wire59;
  input wire [(4'hb):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(5'h11):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire63;
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  assign y = {wire80,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire63,
                 reg79,
                 reg78,
                 reg77,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 (1'h0)};
  assign wire63 = (((wire59 >>> {$signed(wire62)}) != (8'hb9)) & $unsigned(wire62[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      if ({(+$unsigned($unsigned($signed((7'h40)))))})
        begin
          reg64 <= (~&(8'ha8));
        end
      else
        begin
          reg64 <= $unsigned(wire60);
          reg65 <= (^wire60[(3'h5):(3'h5)]);
          reg66 <= ((((reg64[(3'h6):(1'h0)] ? {wire59} : $unsigned(reg65)) ?
              {(reg65 ?
                      wire63 : wire60)} : ((reg64 && reg64) >= wire61)) != reg65[(5'h10):(3'h7)]) >> $signed(((8'ha8) ?
              (wire62 ?
                  $unsigned((8'h9d)) : $unsigned(wire60)) : {$unsigned(wire58),
                  (wire61 >> reg64)})));
          reg67 <= ((($unsigned(((8'ha2) ?
                  wire59 : (8'ha0))) ^ (reg64 <<< $signed(wire58))) ?
              ($signed(wire61[(2'h3):(1'h0)]) ?
                  ((reg64 < wire62) - reg64) : ($signed((8'hb7)) ?
                      $unsigned(wire63) : (~&reg66))) : (reg64 ?
                  (~{(8'hb0),
                      wire61}) : {wire62[(3'h7):(2'h2)]})) - {(reg64[(2'h2):(1'h1)] ?
                  reg66[(1'h0):(1'h0)] : (wire58[(2'h2):(1'h1)] & $signed((8'hba))))});
          reg68 <= $signed(((~&($unsigned(wire58) ?
                  {wire63} : {wire63, wire62})) ?
              (~^(((8'hb2) ?
                  wire63 : (8'ha7)) ~^ wire60)) : $signed(($signed((8'had)) != $unsigned((8'haf))))));
        end
      reg69 <= reg65;
      reg70 <= reg64[(3'h6):(2'h2)];
    end
  assign wire71 = $unsigned(reg64);
  assign wire72 = {wire60[(4'h8):(3'h4)]};
  assign wire73 = $signed($signed({($unsigned(wire61) ~^ (wire72 && reg69)),
                      $signed($unsigned(reg66))}));
  assign wire74 = wire62;
  assign wire75 = {(((+wire72[(1'h1):(1'h0)]) ?
                          $unsigned((&reg64)) : (8'hb0)) || wire58)};
  assign wire76 = (8'ha6);
  always
    @(posedge clk) begin
      reg77 <= $signed(((wire59[(3'h5):(3'h4)] ?
              (((8'h9d) & (8'ha7)) ?
                  (8'ha3) : $unsigned(wire63)) : (!(~wire61))) ?
          $signed((8'ha8)) : $unsigned(({wire72, reg69} ? wire75 : wire73))));
      reg78 <= ({wire75[(3'h4):(2'h2)]} ?
          wire62[(4'hb):(1'h0)] : $signed($unsigned(((!wire76) ?
              (reg77 - wire71) : $signed(wire61)))));
      reg79 <= {($signed(($unsigned(wire73) ?
                  (!reg78) : ((8'hac) ? wire71 : wire71))) ?
              $signed($unsigned((^reg68))) : ($unsigned({reg77}) ?
                  ((wire63 ?
                      reg77 : (8'h9d)) < $signed((8'ha9))) : $signed({wire62,
                      wire75}))),
          (8'ha6)};
    end
  assign wire80 = $signed({$signed(($unsigned(wire74) >= $unsigned(wire74)))});
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire signed [(4'hb):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(3'h7):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire signed [(3'h7):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire39,
                 wire38,
                 wire37,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire24,
                 wire23,
                 wire22,
                 reg41,
                 reg40,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire22 = {wire17};
  assign wire23 = wire21;
  assign wire24 = (~^(($signed({wire17}) ?
                          $unsigned((wire22 - wire21)) : wire18[(1'h0):(1'h0)]) ?
                      wire18 : (wire18 ? $signed($signed(wire18)) : wire20)));
  always
    @(posedge clk) begin
      reg25 <= $unsigned($unsigned((wire19[(4'ha):(4'h8)] ?
          (~^{wire23}) : wire18[(1'h1):(1'h1)])));
      reg26 <= ((~^$signed((8'ha0))) != wire23[(1'h0):(1'h0)]);
      reg27 <= reg26;
    end
  assign wire28 = wire22;
  assign wire29 = $signed($unsigned({((wire17 ? wire22 : wire19) ?
                          reg26[(1'h0):(1'h0)] : (&wire23))}));
  assign wire30 = (^~(^~(reg27 ?
                      wire18[(3'h6):(1'h1)] : $signed((reg25 | wire23)))));
  assign wire31 = (wire22 != ((!wire29) ?
                      wire24[(1'h0):(1'h0)] : $signed(($signed(wire28) ?
                          (reg26 ? wire22 : wire21) : wire18[(2'h3):(1'h0)]))));
  assign wire32 = (wire17[(3'h6):(2'h3)] > $signed((((reg25 >= wire20) ~^ (~|wire29)) && $signed(wire29[(2'h3):(2'h3)]))));
  always
    @(posedge clk) begin
      reg33 <= {wire17[(1'h1):(1'h0)],
          $unsigned(($unsigned((^wire24)) ? {wire18} : {(wire23 * wire18)}))};
      reg34 <= ($unsigned(((|$unsigned(wire17)) ?
          (reg26 ? $unsigned(reg27) : wire31) : ($signed(wire28) ?
              wire20 : ((8'hb0) | reg26)))) | reg33);
      reg35 <= ((((wire23[(1'h1):(1'h1)] ^ $unsigned(wire22)) ?
                  (8'haa) : wire23) ?
              {wire19[(3'h5):(2'h2)]} : (~^((~^(8'ha0)) ?
                  reg26[(1'h1):(1'h1)] : (8'h9f)))) ?
          {(^~(wire30 ? (wire29 ? wire28 : (7'h42)) : ((8'hbd) << (8'hb8)))),
              wire17} : wire19[(5'h11):(5'h11)]);
      reg36 <= wire30[(2'h2):(1'h1)];
    end
  assign wire37 = {$unsigned($unsigned(wire32))};
  assign wire38 = wire21;
  assign wire39 = reg34[(4'h9):(3'h6)];
  always
    @(posedge clk) begin
      reg40 <= $signed(($signed(reg35[(3'h4):(1'h0)]) ^ reg36[(3'h4):(1'h0)]));
      reg41 <= (((^(8'ha3)) + $unsigned($signed($unsigned(wire18)))) ?
          wire24[(4'h9):(3'h6)] : {{($unsigned(wire18) ?
                      $signed(wire21) : wire20)},
              (8'hba)});
    end
  assign wire42 = (&{$signed((wire38 << $unsigned((8'ha2)))),
                      wire19[(3'h7):(1'h0)]});
  assign wire43 = $signed((reg27[(2'h3):(2'h2)] ?
                      reg33[(2'h2):(2'h2)] : $unsigned($unsigned((reg36 ?
                          wire17 : reg40)))));
  assign wire44 = $signed(wire39[(1'h1):(1'h0)]);
  assign wire45 = wire32;
  assign wire46 = wire39[(3'h6):(3'h5)];
  assign wire47 = (&(wire39 ? wire17 : wire39[(2'h3):(2'h2)]));
  assign wire48 = $unsigned((8'ha1));
endmodule
