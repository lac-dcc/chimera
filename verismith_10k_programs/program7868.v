module top
#(parameter param140 = {(~(!(((8'hbd) ? (7'h43) : (8'hbd)) ? ((7'h42) ? (8'hab) : (7'h42)) : (|(8'h9c))))), (^~{(~|((8'ha5) >= (7'h43))), (^{(8'ha2), (8'hbd)})})})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire138;
  wire signed [(5'h14):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire136;
  wire [(3'h6):(1'h0)] wire135;
  wire signed [(3'h6):(1'h0)] wire131;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire19;
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(4'he):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire131,
                 wire22,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire19,
                 reg134,
                 reg133,
                 reg21,
                 (1'h0)};
  assign wire4 = wire2[(1'h0):(1'h0)];
  assign wire5 = wire0;
  assign wire6 = $signed(($signed(wire4[(1'h1):(1'h0)]) >>> wire1));
  assign wire7 = wire5;
  module8 #() modinst20 (.wire11(wire4), .wire10(wire1), .wire9(wire6), .wire12(wire7), .wire13(wire0), .y(wire19), .clk(clk));
  always
    @(posedge clk) begin
      reg21 <= $unsigned(($unsigned($signed(((8'haa) | (8'hb0)))) ?
          $unsigned($unsigned($signed(wire6))) : (wire1[(4'hc):(4'h8)] == (wire4[(5'h12):(4'hd)] ?
              (wire19 ? wire19 : wire1) : $unsigned(wire7)))));
    end
  assign wire22 = (($unsigned((|(8'ha9))) && ((8'hac) ?
                      $unsigned(wire3[(2'h2):(1'h0)]) : ((wire4 > wire3) ?
                          wire7 : (^~wire1)))) > (wire6 ?
                      (|wire19) : ($signed(wire1[(3'h6):(3'h5)]) || wire6)));
  module23 #() modinst132 (.y(wire131), .wire25(wire0), .wire24(wire4), .clk(clk), .wire27(wire3), .wire26(wire2));
  always
    @(posedge clk) begin
      if ($signed(wire1[(4'he):(4'hd)]))
        begin
          reg133 <= ($unsigned((~^{$signed(wire0)})) > $signed(((wire0 ?
              (^reg21) : (wire4 ? wire0 : reg21)) ~^ (wire131[(1'h1):(1'h0)] ?
              wire19 : $signed(wire5)))));
          reg134 <= reg21;
        end
      else
        begin
          reg133 <= $unsigned({reg21[(1'h1):(1'h1)]});
          reg134 <= wire131;
        end
    end
  assign wire135 = ($signed($unsigned(wire3)) ?
                       $unsigned(reg133[(3'h4):(3'h4)]) : ((7'h41) ?
                           wire131[(3'h6):(1'h1)] : $signed({$signed(reg134),
                               wire4[(5'h14):(4'hb)]})));
  assign wire136 = $unsigned($signed($unsigned((^$unsigned(wire6)))));
  assign wire137 = (~$signed(((+{(7'h40), wire5}) ?
                       $unsigned(reg133) : wire2[(3'h5):(1'h0)])));
  assign wire138 = ($signed(wire6[(2'h2):(2'h2)]) + wire2[(1'h0):(1'h0)]);
  assign wire139 = $unsigned((~|wire136[(2'h2):(1'h0)]));
endmodule

module module23
#(parameter param129 = (((~(^~((7'h42) ? (8'hab) : (8'hb8)))) || (8'ha6)) >= ((8'h9d) && ({{(8'hae)}} ~^ (8'ha9)))), 
parameter param130 = param129)
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h9a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire27;
  input wire signed [(4'hd):(1'h0)] wire26;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire signed [(4'hd):(1'h0)] wire24;
  wire signed [(3'h5):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire91;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire53;
  wire [(3'h4):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(5'h12):(1'h0)] wire50;
  wire [(5'h15):(1'h0)] wire48;
  wire signed [(5'h10):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  assign y = {wire127,
                 wire91,
                 wire88,
                 wire68,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire48,
                 wire30,
                 wire29,
                 wire28,
                 reg90,
                 (1'h0)};
  assign wire28 = wire24[(1'h0):(1'h0)];
  assign wire29 = (^wire24[(3'h7):(1'h1)]);
  assign wire30 = ((^~(wire26 < (~|(wire29 - wire26)))) | ({wire24[(4'h9):(1'h0)],
                          {(|(8'had)), wire26}} ?
                      $signed({(wire27 ?
                              wire27 : (8'hab))}) : $unsigned((!(wire28 ?
                          wire24 : (8'haf))))));
  module31 #() modinst49 (wire48, clk, wire30, wire26, wire27, wire24);
  assign wire50 = wire26[(3'h5):(1'h1)];
  assign wire51 = (-wire50[(1'h0):(1'h0)]);
  assign wire52 = $signed((((&(~^(8'ha8))) + wire25) ?
                      wire50 : {$unsigned($unsigned(wire51))}));
  assign wire53 = $signed($unsigned($unsigned({(wire26 || wire29),
                      (~^wire24)})));
  module54 #() modinst69 (wire68, clk, wire50, wire52, wire26, wire53);
  module70 #() modinst89 (wire88, clk, wire53, wire50, wire68, wire27);
  always
    @(posedge clk) begin
      reg90 <= wire24;
    end
  assign wire91 = (wire51[(3'h6):(3'h5)] ?
                      $signed((^reg90[(2'h3):(2'h2)])) : wire28);
  module92 #() modinst128 (wire127, clk, wire25, wire48, wire88, wire51);
endmodule

module module8
#(parameter param18 = ({((((7'h42) ? (8'haa) : (7'h40)) <<< ((8'hae) ? (8'ha9) : (8'hb8))) ? (((8'hbf) ? (8'h9f) : (8'hab)) ^~ (!(8'hac))) : (((8'hbc) ? (8'had) : (7'h41)) ? {(8'h9e)} : ((8'h9f) ? (8'hb3) : (8'haa)))), ((((8'hb9) <= (8'hbe)) >>> ((7'h40) & (8'hbe))) == (((8'hb8) != (8'h9f)) != ((8'ha3) ? (7'h43) : (8'hb4))))} ~^ ({(8'hab), (((8'hab) > (7'h40)) ? ((8'ha0) * (8'ha4)) : ((8'haf) ? (8'hb8) : (8'ha6)))} << ((((7'h41) * (8'h9d)) && (^(7'h43))) ~^ {((8'hbf) | (8'ha4))}))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  assign y = {wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = (~(&$signed($signed((wire9 ? wire9 : wire10)))));
  assign wire15 = $signed(wire14[(4'h8):(2'h2)]);
  assign wire16 = (wire15 > wire13[(4'h8):(3'h7)]);
  assign wire17 = wire12;
endmodule

module module92
#(parameter param126 = (((8'hbb) & ({((8'had) ? (8'hbf) : (8'ha0)), ((7'h42) ? (8'ha7) : (8'hb2))} ? (((8'hb4) < (8'ha0)) >> (&(8'ha4))) : (^~(~|(8'hbc))))) ? ((~&(~&(!(8'hba)))) ? ((8'ha2) ? (((8'hb4) & (8'hb0)) ? {(8'ha2), (8'ha2)} : (~&(8'ha6))) : (~^((7'h41) ? (8'ha1) : (8'ha4)))) : ((((8'hbf) - (8'hb5)) ~^ ((8'haa) ^ (8'hb8))) ? (-((8'ha6) ^~ (8'ha3))) : (((8'hb1) ? (8'ha3) : (8'ha6)) ? ((8'hbd) ? (8'hba) : (8'ha4)) : ((8'hb1) != (8'ha7))))) : {{(((8'hb5) ? (8'hbd) : (8'hb0)) ? ((8'hb9) - (8'hbb)) : ((8'hae) ? (8'hae) : (8'hbe))), (~^(+(8'hbe)))}}))
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire96;
  input wire [(5'h12):(1'h0)] wire95;
  input wire [(2'h3):(1'h0)] wire94;
  input wire signed [(4'ha):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire121;
  wire [(4'he):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire113;
  wire [(4'he):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire signed [(5'h14):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire signed [(4'hc):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire [(3'h4):(1'h0)] wire99;
  wire [(5'h11):(1'h0)] wire98;
  wire [(3'h6):(1'h0)] wire97;
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  assign y = {wire121,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire109,
                 wire108,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg110,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire97 = (~^wire93[(2'h2):(1'h1)]);
  assign wire98 = wire97;
  assign wire99 = $signed($signed(wire97[(1'h1):(1'h0)]));
  assign wire100 = (((!(^{(8'haa)})) << (8'hbf)) ?
                       (wire98 ? wire93 : wire98[(4'he):(2'h2)]) : wire95);
  assign wire101 = $signed(wire100[(3'h5):(3'h4)]);
  always
    @(posedge clk) begin
      if ((((((|wire96) >>> (wire94 != wire98)) < ((wire97 ? wire94 : (8'hb2)) ?
          ((8'haf) ~^ wire98) : wire101)) ~^ ((wire101 >= (wire94 ^ wire93)) ?
          wire96 : (~^(8'hb5)))) <<< $signed($signed(wire94[(2'h3):(2'h2)]))))
        begin
          reg102 <= (8'ha5);
          if (wire98[(3'h4):(3'h4)])
            begin
              reg103 <= {$signed(wire98[(3'h6):(1'h0)]), wire93[(1'h1):(1'h0)]};
            end
          else
            begin
              reg103 <= $signed(wire101);
              reg104 <= reg102[(3'h4):(2'h2)];
            end
        end
      else
        begin
          if ((^~$signed((|reg103[(2'h2):(2'h2)]))))
            begin
              reg102 <= (+$signed((^(+(reg102 >> reg102)))));
              reg103 <= wire97;
              reg104 <= wire97;
            end
          else
            begin
              reg102 <= (7'h41);
              reg103 <= $unsigned(wire101);
            end
          if ((($signed(($unsigned(wire93) ?
                  wire95 : wire96)) == $signed(reg104)) ?
              reg103[(3'h7):(3'h7)] : wire100[(3'h6):(3'h4)]))
            begin
              reg105 <= (($unsigned((~&reg103[(3'h5):(1'h0)])) ?
                  (reg104 ?
                      wire99 : ((-wire97) ?
                          $signed(wire94) : (wire98 ^ wire96))) : (&(reg103 | $unsigned((8'hbd))))) | $signed($unsigned($signed((wire99 ?
                  wire101 : reg104)))));
              reg106 <= wire100;
            end
          else
            begin
              reg105 <= {wire96,
                  (reg104 ?
                      $signed(wire96) : $signed((reg105[(3'h7):(1'h0)] ?
                          wire93 : reg103)))};
            end
          reg107 <= ((+(wire99[(2'h2):(2'h2)] ?
              (8'hb3) : ($signed((8'hbd)) > wire94))) >>> (~|((!wire96[(3'h6):(1'h1)]) ?
              wire101[(4'h8):(2'h3)] : (~^{reg103}))));
        end
    end
  assign wire108 = $unsigned({((~&(wire99 != reg102)) ?
                           ($unsigned(wire101) ^ ((8'hb7) ?
                               (8'hab) : wire93)) : wire100)});
  assign wire109 = reg102[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg110 <= $unsigned(((|(~^$unsigned(wire93))) - {(^~wire99),
          (wire93[(3'h4):(2'h3)] ? (~wire101) : $unsigned((8'haa)))}));
    end
  assign wire111 = ({(&(!$signed(wire100)))} != (~^reg106[(3'h4):(1'h0)]));
  assign wire112 = reg104;
  assign wire113 = (8'hb6);
  assign wire114 = $unsigned($unsigned(wire98[(4'he):(4'hd)]));
  assign wire115 = wire112[(2'h3):(1'h1)];
  always
    @(posedge clk) begin
      reg116 <= reg107[(1'h1):(1'h1)];
      reg117 <= {(({reg105[(4'h8):(3'h5)],
              (reg116 ?
                  wire93 : (8'hb8))} <<< {reg102}) | (wire100[(3'h7):(1'h0)] ?
              reg106 : wire112[(4'h8):(2'h2)]))};
      reg118 <= $signed($unsigned((reg107 ?
          ((+wire96) ? (wire98 << wire100) : (8'ha3)) : reg102)));
      reg119 <= (|(+(wire115 ?
          wire114 : (reg110 ?
              $unsigned(reg118) : (reg110 ? wire112 : wire112)))));
      reg120 <= (((wire97[(3'h4):(3'h4)] & wire98[(4'hd):(3'h4)]) == reg102[(3'h5):(1'h1)]) || reg116[(3'h4):(3'h4)]);
    end
  assign wire121 = (($signed(wire108[(1'h1):(1'h1)]) ?
                           reg110[(1'h0):(1'h0)] : (((^wire111) ?
                               wire98 : (reg119 ?
                                   reg102 : wire93)) | ($unsigned(wire94) ?
                               (reg118 ?
                                   reg116 : (8'ha1)) : reg107[(1'h0):(1'h0)]))) ?
                       $signed({($unsigned(reg107) ?
                               $unsigned(wire93) : (reg118 >> (8'hbb))),
                           wire98}) : reg105[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg122 <= (8'haf);
      reg123 <= $unsigned(((reg122 ?
          $unsigned((&wire111)) : reg110[(3'h6):(1'h0)]) && ((wire99[(2'h3):(1'h1)] ?
          reg105[(4'h8):(1'h1)] : (~&reg106)) >> $signed($signed(wire111)))));
      reg124 <= ($unsigned(wire96[(4'h9):(2'h3)]) ^~ $signed(((|$signed(wire115)) ?
          $unsigned(wire100) : $unsigned((wire94 ? reg105 : wire114)))));
      reg125 <= (reg103[(2'h3):(1'h1)] && ($unsigned(reg117[(1'h0):(1'h0)]) <<< reg120[(3'h7):(1'h0)]));
    end
endmodule

module module70  (y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire74;
  input wire signed [(2'h2):(1'h0)] wire73;
  input wire signed [(3'h5):(1'h0)] wire72;
  input wire signed [(3'h4):(1'h0)] wire71;
  wire [(3'h6):(1'h0)] wire87;
  wire [(5'h15):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire79;
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire79,
                 reg82,
                 reg81,
                 reg80,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg75 <= {wire71};
      reg76 <= $unsigned({$signed((&{wire73, wire74})), wire71[(2'h3):(1'h1)]});
      reg77 <= ($signed(((~|$signed(wire71)) ?
          (+$unsigned(reg76)) : wire71)) + wire71);
      reg78 <= wire74;
    end
  assign wire79 = $signed(((^$unsigned((reg77 ? wire74 : wire72))) ?
                      $unsigned(({wire74} < $unsigned(reg75))) : ((!(wire74 ?
                              (8'hac) : wire71)) ?
                          $signed($unsigned(wire73)) : reg76[(4'hd):(2'h3)])));
  always
    @(posedge clk) begin
      reg80 <= reg78;
      reg81 <= (|(+$signed($signed((wire73 - wire73)))));
      reg82 <= wire73[(1'h0):(1'h0)];
    end
  assign wire83 = $signed($unsigned(reg82));
  assign wire84 = (reg80[(3'h5):(2'h2)] != (($unsigned((~^wire73)) >= ((&wire83) ?
                          reg82[(4'h8):(1'h0)] : wire74[(2'h3):(2'h3)])) ?
                      wire72 : (|reg81[(4'hc):(2'h3)])));
  assign wire85 = $unsigned(($signed((~^$unsigned(reg81))) ?
                      ($signed($signed(wire72)) - ((|wire83) ?
                          (wire72 - reg81) : reg76)) : reg76[(4'hd):(2'h2)]));
  assign wire86 = reg80[(1'h0):(1'h0)];
  assign wire87 = (wire71[(2'h2):(1'h1)] <<< (wire71 ?
                      $signed((8'hb9)) : {{$unsigned(reg82)}}));
endmodule

module module54
#(parameter param67 = ((8'hb3) * ((+(&((8'hba) | (7'h40)))) || (|(((8'ha2) ? (8'ha0) : (8'hb7)) ? ((8'haf) <<< (8'ha6)) : {(8'ha2)})))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire58;
  input wire [(3'h4):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire [(2'h3):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire66;
  wire signed [(5'h14):(1'h0)] wire65;
  wire [(2'h2):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 (1'h0)};
  assign wire59 = {({wire55[(1'h1):(1'h1)]} ?
                          ({(^~wire57), {wire57, (8'hb2)}} ?
                              ($unsigned(wire58) ?
                                  $unsigned(wire55) : (^~wire56)) : $unsigned((wire57 ?
                                  wire56 : wire55))) : $unsigned((+wire58)))};
  assign wire60 = wire58[(4'h8):(2'h3)];
  assign wire61 = $signed({(((^~wire58) ?
                          $signed(wire58) : $signed((8'hb1))) - {(8'hac),
                          (8'h9c)})});
  assign wire62 = wire60[(2'h2):(2'h2)];
  assign wire63 = (((($unsigned((8'ha8)) >= $signed(wire60)) ?
                              wire62[(1'h1):(1'h1)] : wire60[(4'h9):(3'h4)]) ?
                          $unsigned($unsigned((~|wire62))) : $unsigned(((-wire60) <<< (+wire59)))) ?
                      wire62 : ($unsigned(wire57) ?
                          $signed($unsigned(wire62[(1'h0):(1'h0)])) : (!$unsigned($signed(wire62)))));
  assign wire64 = $signed((~|($signed($unsigned(wire62)) + $signed(wire62[(1'h0):(1'h0)]))));
  assign wire65 = $unsigned((!wire61));
  assign wire66 = wire60[(2'h3):(1'h0)];
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire35;
  input wire [(4'hd):(1'h0)] wire34;
  input wire [(4'h8):(1'h0)] wire33;
  input wire [(4'hd):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire36;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 (1'h0)};
  assign wire36 = wire35;
  assign wire37 = (|wire36);
  assign wire38 = ($signed(wire37) < (~|(($unsigned(wire35) ^~ (wire36 && wire35)) ^~ {$signed(wire36)})));
  assign wire39 = wire37[(4'he):(3'h6)];
  assign wire40 = {(~^wire35[(4'hb):(1'h0)]), wire34[(4'ha):(4'ha)]};
  assign wire41 = $unsigned(((wire34[(3'h4):(2'h3)] > (((8'hbc) == wire33) ?
                          (&wire39) : $unsigned(wire37))) ?
                      (|$unsigned((~wire38))) : ($signed((wire40 ?
                          wire39 : (8'ha5))) ^~ wire32[(4'ha):(1'h1)])));
  assign wire42 = $unsigned(((((wire41 ? wire32 : wire34) ?
                              wire34[(3'h6):(3'h5)] : (wire32 ?
                                  wire35 : wire41)) ?
                          wire41[(1'h0):(1'h0)] : $unsigned(wire35)) ?
                      (8'ha3) : ((&$unsigned(wire37)) ?
                          $unsigned({wire37}) : wire41)));
  assign wire43 = ($signed($unsigned(((wire32 + (7'h44)) > wire36))) ?
                      $signed((~&wire32[(4'h9):(3'h7)])) : {wire36,
                          wire36[(3'h7):(1'h1)]});
  assign wire44 = wire34;
  assign wire45 = $signed(((wire34[(4'h9):(1'h0)] ?
                      wire37 : wire41[(2'h3):(1'h0)]) * wire41));
  assign wire46 = $signed(wire36);
  assign wire47 = $unsigned(wire40[(4'h9):(3'h6)]);
endmodule
