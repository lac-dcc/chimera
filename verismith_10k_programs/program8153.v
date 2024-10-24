module top
#(parameter param155 = ((((((8'ha1) ? (7'h40) : (8'hbc)) && (+(8'hac))) ? ((^~(8'hb6)) ? ((8'ha3) ? (8'hbe) : (8'ha7)) : (^~(8'hb0))) : (((7'h43) ^ (8'hbc)) ? (~|(8'h9d)) : ((8'hb3) ? (8'hbb) : (8'had)))) > ((-(~^(8'ha5))) != (~&(~&(8'ha5))))) ? ((((+(8'hb8)) >> ((8'h9f) ? (8'hb1) : (8'hbf))) < (8'had)) == {((~&(8'hb2)) >= {(8'hba), (8'ha2)})}) : ((((8'haa) ^ ((8'ha5) ? (8'hab) : (8'haf))) ? (((8'hb1) ? (8'haf) : (8'h9f)) ? (&(8'hb9)) : ((8'ha2) ? (8'hae) : (7'h42))) : (^~((8'h9d) ? (8'hb5) : (8'haa)))) ? (~^((8'ha5) ? ((8'hbf) ? (8'ha4) : (7'h44)) : ((8'hb0) < (8'hae)))) : ({(~|(8'ha6))} <<< (~(&(8'ha9)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire152;
  wire [(4'hd):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire150;
  assign y = {wire154, wire152, wire4, wire5, wire150, (1'h0)};
  assign wire4 = {(^(8'hbd))};
  assign wire5 = $unsigned(wire2[(1'h0):(1'h0)]);
  module6 #() modinst151 (wire150, clk, wire3, wire1, wire2, wire5, wire4);
  module134 #() modinst153 (wire152, clk, wire4, wire2, wire3, wire1);
  assign wire154 = wire5[(1'h0):(1'h0)];
endmodule

module module6
#(parameter param149 = ((((&(+(8'haf))) <= (((8'hb8) ^~ (8'hbf)) < ((8'ha7) && (7'h41)))) ? (^~((^(8'ha8)) ? (8'h9e) : (&(8'hb0)))) : ((~^((8'hb1) <<< (8'haa))) ? (((7'h44) ? (8'h9e) : (8'hb7)) ? (!(8'h9c)) : ((8'ha1) ? (7'h42) : (8'hb5))) : (~|((8'ha0) << (8'ha6))))) ? ((({(8'hb5), (8'ha2)} + (!(8'ha2))) != (((8'h9e) || (8'h9d)) ^ {(8'hb1), (8'had)})) > (-{((8'ha1) >> (8'h9f))})) : (((((8'hae) ? (8'hbf) : (8'hb4)) >> {(8'ha4)}) ? (((8'hb0) ? (8'hba) : (8'ha8)) + {(8'haf)}) : ({(8'ha3)} ? (!(8'hbb)) : ((8'h9c) ? (8'ha1) : (8'haf)))) ? {(((8'hb4) << (8'ha1)) ? {(8'haa), (7'h43)} : ((8'ha9) && (8'had))), (~|(+(8'hb9)))} : {(((8'ha6) ? (8'hb5) : (8'hb8)) ? {(7'h41)} : ((8'ha0) ? (8'ha8) : (7'h40)))})))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire147;
  wire signed [(5'h13):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire signed [(4'h8):(1'h0)] wire130;
  wire [(5'h14):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire122;
  reg [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  assign y = {wire147,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire41,
                 wire43,
                 wire44,
                 wire45,
                 wire69,
                 wire71,
                 wire72,
                 wire73,
                 wire122,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  module12 #() modinst42 (.wire17(wire11), .y(wire41), .wire16(wire7), .wire13(wire10), .wire14(wire8), .clk(clk), .wire15(wire9));
  assign wire43 = (8'hbc);
  assign wire44 = wire43;
  assign wire45 = $signed((~^(($signed(wire11) ?
                      (wire43 | wire7) : wire43) + ($unsigned(wire41) ^ {wire7}))));
  module46 #() modinst70 (.clk(clk), .wire49(wire41), .wire48(wire7), .wire47(wire44), .y(wire69), .wire50(wire9));
  assign wire71 = ((^(^~($unsigned(wire43) ?
                          wire43[(4'hc):(3'h4)] : (wire9 || wire11)))) ?
                      ((8'hbb) ^~ (~&$signed($unsigned((8'ha7))))) : (8'hbd));
  assign wire72 = $signed((($unsigned((|wire45)) ?
                          $signed((wire43 ? wire43 : wire8)) : wire7) ?
                      ((~|((8'ha3) != wire41)) ^ ($signed(wire9) ?
                          (~&wire71) : $unsigned(wire43))) : (~^((wire71 ?
                          wire11 : wire10) ^~ (wire7 ? wire7 : wire11)))));
  assign wire73 = $signed(({wire7[(3'h4):(1'h1)],
                      wire11[(4'h9):(3'h5)]} < $signed(((wire9 ?
                          wire71 : wire11) ?
                      (wire71 || wire8) : wire10[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($signed($signed(wire9)))
        begin
          reg74 <= wire11[(5'h14):(3'h5)];
          reg75 <= $signed(($signed(($unsigned(wire69) & $unsigned(wire10))) <<< $signed(($unsigned(wire71) ?
              wire9[(4'hd):(3'h6)] : (~&wire71)))));
          reg76 <= $unsigned((&$unsigned(reg75[(4'h9):(1'h1)])));
          if (wire10[(2'h2):(1'h0)])
            begin
              reg77 <= $unsigned({$signed($unsigned(wire45[(1'h1):(1'h0)])),
                  {$signed((reg75 ? wire11 : wire41)), wire44[(4'h8):(3'h5)]}});
            end
          else
            begin
              reg77 <= (~$unsigned({((wire72 <= (8'ha8)) ?
                      (wire43 ? (8'hb1) : wire45) : (reg76 < wire9)),
                  $signed($unsigned(wire11))}));
            end
          reg78 <= wire9[(1'h0):(1'h0)];
        end
      else
        begin
          reg74 <= reg75[(1'h0):(1'h0)];
          reg75 <= reg77;
        end
      reg79 <= reg77[(5'h13):(1'h1)];
    end
  module80 #() modinst123 (wire122, clk, wire72, reg76, wire69, reg77, wire71);
  always
    @(posedge clk) begin
      reg124 <= $signed(wire44[(4'he):(4'ha)]);
      reg125 <= $unsigned($signed($unsigned((wire73 ^ (|(8'ha1))))));
      reg126 <= wire10;
      reg127 <= (wire73 >>> $unsigned({(reg79 << (+wire9)),
          (wire73 ? reg74 : wire7[(1'h0):(1'h0)])}));
      reg128 <= $signed(reg77);
    end
  assign wire129 = (~((7'h44) && ($signed($signed(reg76)) ?
                       (wire73[(4'hf):(2'h2)] ?
                           $signed(wire69) : (~(8'hb7))) : $unsigned(reg75[(3'h6):(1'h1)]))));
  assign wire130 = wire45;
  assign wire131 = $unsigned(({wire72[(2'h3):(1'h1)]} ?
                       wire72 : {$unsigned(reg125),
                           ((wire122 << reg74) ?
                               ((8'ha4) ? (8'hbf) : wire44) : {(8'hb7)})}));
  assign wire132 = (8'hae);
  assign wire133 = ((&{(reg77 ~^ (wire41 ? reg125 : (8'hbc))),
                       $signed(reg76)}) * ((&{(reg126 >> reg76)}) ^ (~^$unsigned(reg124[(4'hc):(3'h4)]))));
  module134 #() modinst148 (wire147, clk, wire129, wire131, wire45, wire71);
endmodule

module module134
#(parameter param145 = ((&({(8'hbb)} - (((8'hb7) ? (8'hb2) : (8'had)) == (-(8'had))))) == ((8'haf) <<< {((+(8'hb2)) ? ((8'haa) & (7'h42)) : {(8'hba), (8'haa)})})), 
parameter param146 = (-((8'ha8) != {(!{param145})})))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire138;
  input wire signed [(5'h14):(1'h0)] wire137;
  input wire [(5'h13):(1'h0)] wire136;
  input wire [(3'h6):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire144;
  wire [(4'hc):(1'h0)] wire143;
  wire [(3'h7):(1'h0)] wire142;
  wire signed [(4'hd):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire140;
  wire [(5'h14):(1'h0)] wire139;
  assign y = {wire144, wire143, wire142, wire141, wire140, wire139, (1'h0)};
  assign wire139 = ($signed((((~|wire137) < $signed(wire137)) ?
                           wire138 : (((8'hb3) ? (8'hbd) : wire135) ?
                               $unsigned((8'hb6)) : $unsigned((8'haa))))) ?
                       {$signed(({(8'hab),
                               wire138} <= $unsigned(wire138)))} : wire137);
  assign wire140 = (wire137 ?
                       (~|$unsigned(wire139)) : {$signed($signed($signed(wire137))),
                           wire137[(5'h11):(4'hf)]});
  assign wire141 = wire135[(1'h1):(1'h0)];
  assign wire142 = $unsigned({$unsigned(((wire136 != wire140) == $unsigned(wire138)))});
  assign wire143 = (((($unsigned(wire142) ?
                           (wire135 ? wire138 : wire136) : (wire136 ?
                               (8'hb2) : wire137)) ?
                       wire138 : wire136[(1'h0):(1'h0)]) ^ $unsigned(wire141)) | (($signed((^wire141)) ?
                       {(wire140 + wire135),
                           wire142[(2'h2):(1'h1)]} : wire139) + $unsigned(wire135)));
  assign wire144 = ($signed(wire136) + (~|wire136));
endmodule

module module80
#(parameter param121 = {{((((8'ha8) | (8'hbd)) ? (|(7'h41)) : {(8'hb7)}) ? ({(8'hb7), (8'hac)} <= ((7'h43) ? (8'hb2) : (8'hb5))) : (^(~(8'hbe))))}, (({((8'hb5) ? (8'hb8) : (8'haf)), (|(8'hbc))} <<< (~&((8'haa) ? (8'ha6) : (8'hbc)))) ? ({((8'hb7) > (8'hbb)), (8'h9e)} != (7'h43)) : (+(^~((8'ha0) == (8'ha0)))))})
(y, clk, wire85, wire84, wire83, wire82, wire81);
  output wire [(32'h16e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire85;
  input wire signed [(4'hc):(1'h0)] wire84;
  input wire signed [(4'hd):(1'h0)] wire83;
  input wire signed [(3'h5):(1'h0)] wire82;
  input wire [(4'he):(1'h0)] wire81;
  wire signed [(4'hf):(1'h0)] wire120;
  wire signed [(4'h8):(1'h0)] wire119;
  wire signed [(3'h5):(1'h0)] wire118;
  wire signed [(4'h9):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire115;
  wire [(3'h6):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire111;
  wire signed [(2'h3):(1'h0)] wire110;
  wire [(4'hb):(1'h0)] wire109;
  wire signed [(3'h7):(1'h0)] wire108;
  wire signed [(5'h13):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire signed [(3'h7):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire102;
  wire signed [(5'h13):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg [(5'h13):(1'h0)] reg95 = (1'h0);
  reg [(5'h15):(1'h0)] reg94 = (1'h0);
  reg [(3'h6):(1'h0)] reg91 = (1'h0);
  reg [(3'h7):(1'h0)] reg90 = (1'h0);
  reg [(3'h7):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire103,
                 wire102,
                 wire101,
                 wire93,
                 wire92,
                 reg113,
                 reg112,
                 reg104,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg86 <= $signed(wire82[(3'h5):(2'h3)]);
      if ($signed($unsigned((wire83 < ({reg86, wire84} ?
          wire81 : $unsigned((8'haa)))))))
        begin
          reg87 <= {$signed((&{wire83}))};
        end
      else
        begin
          reg87 <= $unsigned(((+wire84[(2'h3):(1'h0)]) ?
              (!$signed(wire81[(1'h0):(1'h0)])) : {reg86[(4'h9):(2'h2)]}));
          reg88 <= ((|({(reg86 >> reg86)} ?
                  ((|wire81) ?
                      $unsigned(wire84) : $signed(wire83)) : (8'hac))) ?
              wire82[(2'h2):(2'h2)] : $signed((-(|$unsigned(reg86)))));
          reg89 <= (wire83 ? wire83[(4'hb):(2'h3)] : reg88);
          reg90 <= (~reg88);
          reg91 <= (((($unsigned((8'ha1)) ? wire84[(2'h3):(1'h1)] : (|wire85)) ?
                  ({(8'hae), wire82} > {wire81,
                      reg89}) : reg88[(3'h5):(2'h2)]) != (8'hab)) ?
              wire81 : $unsigned((+(!(~|reg86)))));
        end
    end
  assign wire92 = wire84[(1'h1):(1'h1)];
  assign wire93 = (7'h41);
  always
    @(posedge clk) begin
      reg94 <= $unsigned({(^reg91)});
      reg95 <= (reg94[(4'h9):(1'h0)] ?
          ((($signed(wire83) ? $unsigned(reg88) : wire93[(1'h0):(1'h0)]) ?
                  wire92 : reg89[(1'h1):(1'h0)]) ?
              wire84[(1'h1):(1'h0)] : reg87[(2'h3):(2'h3)]) : wire84);
      if (wire84)
        begin
          if ($signed($signed({reg87, reg87[(2'h3):(1'h0)]})))
            begin
              reg96 <= wire81[(4'hc):(3'h4)];
              reg97 <= $signed(wire85[(2'h2):(1'h0)]);
              reg98 <= (reg95 != ((((~|reg95) ?
                      reg95 : (wire82 << reg97)) ^~ reg87) ?
                  {(reg87 > reg91)} : (~&wire84[(4'hb):(4'h8)])));
              reg99 <= $signed(wire81[(4'he):(1'h1)]);
            end
          else
            begin
              reg96 <= (reg99 ?
                  (wire92 != $unsigned(reg91)) : (($signed((reg87 <= reg87)) | reg89) <<< ((^$unsigned(wire92)) * {(wire81 - reg91),
                      {reg87, reg87}})));
              reg97 <= $unsigned((~$unsigned($unsigned((^~reg87)))));
              reg98 <= ($unsigned(reg99) ?
                  reg86 : $unsigned($unsigned(wire83)));
              reg99 <= (~&($unsigned((~|$unsigned(wire85))) >> (!$unsigned((reg97 - wire92)))));
            end
        end
      else
        begin
          reg96 <= $signed((|reg96));
          reg97 <= $signed($unsigned(wire92));
          reg98 <= wire93;
          reg99 <= reg86;
          reg100 <= ($signed($signed(wire81)) | {(-($signed(reg89) <= wire85)),
              ((&((8'had) ? reg95 : (8'ha2))) ? reg99 : (8'ha3))});
        end
    end
  assign wire101 = $signed($unsigned($signed($signed((+reg96)))));
  assign wire102 = wire93;
  assign wire103 = $signed(reg87);
  always
    @(posedge clk) begin
      reg104 <= reg96;
    end
  assign wire105 = $signed(reg98[(3'h5):(2'h2)]);
  assign wire106 = (($signed(((wire85 ?
                           wire84 : reg96) ~^ reg97)) <= {((wire81 ?
                               reg90 : reg97) - {wire92, (8'h9c)})}) ?
                       (~$signed((|(8'h9d)))) : {(~|(reg96[(1'h0):(1'h0)] ?
                               (~^reg97) : (reg100 ^ wire84)))});
  assign wire107 = $signed(reg86);
  assign wire108 = (wire92 ? wire103[(2'h3):(1'h1)] : (|wire81[(3'h7):(3'h4)]));
  assign wire109 = $signed(((reg95 - (reg86 << reg99)) ?
                       (wire93[(1'h0):(1'h0)] ?
                           (reg98 >= (8'hbc)) : wire85[(2'h2):(2'h2)]) : $signed(wire101)));
  assign wire110 = ($unsigned({(~^(~&reg97))}) && $signed(reg98[(4'h8):(2'h2)]));
  assign wire111 = $signed(((^((wire93 ? reg87 : reg88) * reg94)) ?
                       wire101[(4'h8):(2'h3)] : {(reg87 ^ $unsigned(wire93))}));
  always
    @(posedge clk) begin
      reg112 <= wire81[(4'hc):(3'h6)];
      reg113 <= (-($unsigned(($unsigned(wire92) ?
              (reg89 ? (8'haf) : (8'ha5)) : reg104[(2'h2):(1'h0)])) ?
          reg98 : (^$signed(reg104[(3'h4):(2'h3)]))));
    end
  assign wire114 = {($unsigned(reg88) ?
                           reg98[(4'h9):(3'h4)] : ($unsigned(reg88[(4'ha):(1'h0)]) ^ wire83)),
                       reg89[(1'h0):(1'h0)]};
  assign wire115 = ((~&$unsigned(reg90)) | $signed(wire105));
  assign wire116 = wire110;
  assign wire117 = (8'hba);
  assign wire118 = (wire111[(2'h3):(1'h1)] - $unsigned((wire81[(2'h2):(2'h2)] != (~&$signed(wire85)))));
  assign wire119 = reg90;
  assign wire120 = $unsigned($signed(wire83[(2'h3):(1'h0)]));
endmodule

module module46
#(parameter param68 = (~^({((^(7'h40)) ? ((8'ha6) - (8'hbe)) : {(8'h9e), (8'hb9)}), (^((8'ha9) > (8'haf)))} << (~^(((8'ha7) <= (8'hb0)) ? (&(8'hbe)) : ((8'hba) ? (8'h9d) : (8'hac)))))))
(y, clk, wire50, wire49, wire48, wire47);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire49;
  input wire signed [(4'h9):(1'h0)] wire48;
  input wire signed [(4'he):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  assign y = {wire67,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  assign wire51 = wire50[(4'h9):(2'h3)];
  assign wire52 = $signed(wire49[(3'h4):(3'h4)]);
  assign wire53 = (-($unsigned($signed({wire48, wire49})) ^~ wire48));
  assign wire54 = (-$signed($signed((wire51 && (wire53 ? (8'ha2) : wire51)))));
  assign wire55 = wire54[(1'h0):(1'h0)];
  assign wire56 = wire50;
  assign wire57 = (-wire49);
  always
    @(posedge clk) begin
      if ($signed(((&wire56[(4'h9):(1'h1)]) < $signed(wire53))))
        begin
          reg58 <= wire53;
          reg59 <= (wire49 < {wire51[(3'h7):(2'h2)], wire47[(4'he):(1'h0)]});
        end
      else
        begin
          reg58 <= (reg58 != wire57[(4'h9):(3'h5)]);
          reg59 <= wire51[(3'h4):(2'h3)];
          reg60 <= wire54;
          reg61 <= $unsigned(($unsigned(wire55) + (wire47[(3'h6):(2'h2)] != $signed((+wire49)))));
          reg62 <= {$unsigned(reg60[(1'h0):(1'h0)])};
        end
      reg63 <= (|($unsigned(wire47[(4'h9):(1'h0)]) ~^ (8'ha1)));
      reg64 <= $unsigned((({{reg61, reg62}, wire54[(3'h5):(3'h5)]} ?
              (~&$unsigned(wire53)) : $signed($signed(wire53))) ?
          reg60 : $signed($signed({reg61}))));
      reg65 <= $unsigned($signed(wire52));
      reg66 <= (^($signed(reg63[(3'h5):(2'h3)]) > ((reg59 ?
          (wire51 != (8'h9e)) : wire51[(3'h5):(1'h0)]) != ((7'h44) ^~ wire52[(4'hd):(4'hd)]))));
    end
  assign wire67 = wire48[(4'h9):(3'h5)];
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire17;
  input wire [(3'h4):(1'h0)] wire16;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(3'h4):(1'h0)] wire31;
  wire signed [(4'hd):(1'h0)] wire18;
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire18,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = wire14[(5'h14):(5'h14)];
  always
    @(posedge clk) begin
      reg19 <= {$signed(wire17[(2'h3):(2'h3)])};
      reg20 <= ((!$unsigned($unsigned($signed(wire18)))) ?
          (^{$signed(wire18[(4'ha):(3'h6)])}) : wire18);
      if ((|(~&((&$signed(wire15)) <<< $signed(wire15)))))
        begin
          if (reg20)
            begin
              reg21 <= $unsigned((wire18[(4'h8):(2'h3)] ?
                  wire18[(3'h6):(1'h1)] : ({reg20[(5'h12):(4'he)]} * ($unsigned(wire17) ?
                      (wire16 >> wire14) : (!wire18)))));
            end
          else
            begin
              reg21 <= (-$unsigned($signed($signed(reg19))));
            end
          reg22 <= (reg20 ?
              ((~(&(-wire13))) >> $signed((+wire15[(2'h3):(1'h0)]))) : $unsigned({($signed(wire14) ?
                      (8'ha8) : {reg20, (7'h42)}),
                  $unsigned(((8'hb5) <<< (8'hbf)))}));
        end
      else
        begin
          reg21 <= reg22;
          reg22 <= wire13[(1'h0):(1'h0)];
          reg23 <= wire18;
        end
      reg24 <= (|(8'hb9));
      reg25 <= {(8'h9f), $signed({(reg21[(1'h0):(1'h0)] >> reg24)})};
    end
  always
    @(posedge clk) begin
      reg26 <= $unsigned(((reg25 >> $signed((wire17 + reg20))) <<< reg21[(4'hc):(4'h9)]));
      reg27 <= reg24;
      reg28 <= wire15;
      reg29 <= (wire15 ? wire18 : $signed($signed((^$signed(reg23)))));
      reg30 <= (((((wire14 ? reg21 : reg23) & $signed(reg23)) ?
                  reg27 : $signed(reg20)) ?
              $unsigned(wire15[(1'h1):(1'h0)]) : $unsigned((reg19 ?
                  reg24[(2'h2):(2'h2)] : wire18))) ?
          ((wire16 == ($unsigned(reg24) - (wire13 ? (8'hb8) : wire16))) ?
              wire13[(2'h3):(2'h2)] : (((reg29 ? wire13 : (8'hbe)) ?
                  {reg19, reg20} : reg29[(3'h6):(3'h4)]) >> ((8'hba) || {reg25,
                  wire16}))) : $unsigned((reg24[(3'h7):(3'h6)] < (((8'h9f) ?
              (8'h9e) : wire16) >= (reg24 * reg26)))));
    end
  assign wire31 = (reg21 && $signed(reg25));
  assign wire32 = ({$signed((reg26[(5'h10):(4'hb)] < $unsigned(wire18))),
                      (~$signed($unsigned(reg29)))} * $signed(wire14[(3'h4):(2'h2)]));
  assign wire33 = (~&((($signed((8'ha8)) ? (wire18 > wire31) : wire18) ?
                      $signed(wire18[(4'hc):(2'h3)]) : {reg23}) + (|({reg21,
                      reg25} ^ $signed(reg22)))));
  assign wire34 = (reg22 ?
                      wire16 : (~|({$signed(reg28),
                          (reg29 & reg23)} != $signed($unsigned(reg19)))));
  assign wire35 = {$signed(reg26)};
  assign wire36 = (~^reg27);
  assign wire37 = ((~&{$signed($unsigned(wire18))}) ^ $signed((({wire18,
                      wire18} >>> (-wire13)) - (!$unsigned(wire18)))));
  assign wire38 = $signed(reg28[(4'hb):(4'h8)]);
  assign wire39 = wire15;
  assign wire40 = wire37[(2'h3):(2'h3)];
endmodule
