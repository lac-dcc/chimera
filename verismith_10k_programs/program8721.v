module top
#(parameter param140 = {(({((8'hac) ~^ (8'ha5)), (7'h40)} ? ((|(8'ha7)) * ((8'ha2) ? (8'hb5) : (8'ha5))) : {(~|(8'hb5)), (~(8'hb2))}) ? (+(+((8'hac) && (8'hae)))) : ((&(^(8'hb0))) ? {{(8'hbe), (7'h42)}} : (((8'ha2) < (8'ha2)) ^~ {(8'h9e), (8'hae)})))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire139;
  wire [(4'he):(1'h0)] wire132;
  wire [(5'h15):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire89;
  wire [(5'h14):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire130;
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire139,
                 wire132,
                 wire87,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire89,
                 wire90,
                 wire91,
                 wire130,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= ($unsigned($unsigned({(~|wire0),
          $signed(wire1)})) + (^~wire0[(4'h9):(3'h5)]));
    end
  assign wire6 = ((8'haf) | reg5[(1'h0):(1'h0)]);
  assign wire7 = {(&$unsigned({$unsigned(wire4)})), $signed((8'hbe))};
  assign wire8 = $unsigned($signed($unsigned($signed($unsigned(reg5)))));
  assign wire9 = $unsigned($signed($signed($unsigned(wire1))));
  assign wire10 = wire2[(1'h1):(1'h0)];
  assign wire11 = wire3[(2'h3):(1'h1)];
  assign wire12 = wire8[(4'ha):(2'h3)];
  assign wire13 = wire6;
  assign wire14 = $signed(wire2);
  module15 #() modinst88 (.clk(clk), .wire17(wire3), .y(wire87), .wire16(wire4), .wire19(wire8), .wire20(wire1), .wire18(wire2));
  assign wire89 = wire7[(4'h8):(2'h3)];
  assign wire90 = $unsigned(({$unsigned((wire3 >= wire9)),
                          $signed((wire8 ? reg5 : (8'ha3)))} ?
                      $signed((wire9[(4'hc):(3'h4)] ?
                          (~&wire8) : $signed(reg5))) : (8'hb3)));
  assign wire91 = (($unsigned($signed((!wire90))) ~^ wire6[(1'h0):(1'h0)]) <= $unsigned($unsigned($unsigned($unsigned(wire8)))));
  module92 #() modinst131 (wire130, clk, wire2, wire89, wire9, wire3, wire7);
  assign wire132 = ($signed($signed(wire14[(2'h3):(2'h3)])) ?
                       $unsigned(wire10[(4'hc):(4'hc)]) : {$signed((wire90 ?
                               (^~wire130) : (wire9 ^~ wire13))),
                           (8'ha8)});
  always
    @(posedge clk) begin
      reg133 <= wire1;
      if (wire13[(4'hc):(3'h4)])
        begin
          reg134 <= $signed(wire6[(2'h3):(2'h2)]);
          reg135 <= $signed(((wire132[(1'h0):(1'h0)] & ($signed((8'ha2)) ?
                  wire9 : $unsigned(wire6))) ?
              ((|reg134) ?
                  ({wire11,
                      wire14} + $signed(wire1)) : ((~&wire2) == (wire6 || wire89))) : wire6[(1'h1):(1'h1)]));
        end
      else
        begin
          reg134 <= $unsigned({((((8'ha5) ? wire89 : wire12) ?
                  (wire14 ?
                      reg5 : wire90) : (wire132 > wire2)) != ((~&(8'ha6)) | wire90))});
        end
      reg136 <= (~^$unsigned({$unsigned(wire87[(4'h9):(4'h8)]),
          $unsigned((8'hb6))}));
      reg137 <= wire10;
      reg138 <= (~|$unsigned((wire8[(5'h11):(3'h5)] ?
          wire132[(4'hb):(3'h7)] : $signed(wire7[(4'h8):(3'h5)]))));
    end
  assign wire139 = (8'ha2);
endmodule

module module92
#(parameter param128 = (8'ha4), 
parameter param129 = (^{((~&{param128}) | ((param128 ? param128 : param128) ? (param128 ? param128 : param128) : (param128 ? param128 : param128)))}))
(y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire97;
  input wire [(4'hb):(1'h0)] wire96;
  input wire signed [(3'h5):(1'h0)] wire95;
  input wire [(5'h14):(1'h0)] wire94;
  input wire signed [(4'h9):(1'h0)] wire93;
  wire signed [(3'h5):(1'h0)] wire127;
  wire [(4'h8):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire123;
  wire [(3'h7):(1'h0)] wire122;
  wire signed [(3'h5):(1'h0)] wire121;
  wire [(4'hb):(1'h0)] wire106;
  wire signed [(4'hf):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(4'hb):(1'h0)] wire102;
  wire [(3'h5):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire100;
  wire signed [(4'hc):(1'h0)] wire99;
  wire [(4'hc):(1'h0)] wire98;
  reg signed [(4'he):(1'h0)] reg120 = (1'h0);
  reg [(4'hf):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg108 = (1'h0);
  reg [(3'h4):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  assign y = {wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire106,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg105,
                 (1'h0)};
  assign wire98 = $unsigned($signed(wire94[(5'h13):(5'h13)]));
  assign wire99 = wire94[(4'hd):(3'h4)];
  assign wire100 = ($signed({(8'hb2)}) <= {(((~&wire93) > (-(8'ha3))) ?
                           wire93[(4'h8):(1'h1)] : ($unsigned(wire94) ?
                               ((8'hbf) <= (8'hac)) : $signed(wire93)))});
  assign wire101 = $signed((wire93 ~^ wire98));
  assign wire102 = {(~&$signed((~{(8'hac), wire96}))),
                       {{(~(-wire101)), wire97}, wire101}};
  assign wire103 = wire101[(2'h2):(1'h1)];
  assign wire104 = $signed((wire100[(1'h0):(1'h0)] ?
                       ((wire98 ?
                           ((8'hae) ?
                               wire100 : wire94) : $signed(wire100)) <= ($signed(wire95) ^~ {wire98,
                           wire96})) : wire94));
  always
    @(posedge clk) begin
      reg105 <= (wire96[(3'h7):(1'h0)] == wire97);
    end
  assign wire106 = (~|((8'hb0) | (((wire99 ? wire100 : wire101) + (wire102 ?
                       wire99 : wire101)) * $unsigned((8'h9e)))));
  always
    @(posedge clk) begin
      reg107 <= {$unsigned($unsigned($signed((~wire93))))};
      reg108 <= wire97;
      if (reg107)
        begin
          reg109 <= (~|{wire94, wire93});
          reg110 <= wire103[(4'h9):(2'h3)];
          reg111 <= wire99;
          if (wire94)
            begin
              reg112 <= wire93[(3'h7):(1'h0)];
            end
          else
            begin
              reg112 <= $unsigned($signed(($signed(wire104[(2'h3):(1'h0)]) ?
                  ($signed(wire98) & ((8'hb9) >>> reg108)) : (~&wire100[(2'h2):(1'h1)]))));
              reg113 <= reg111;
            end
          if (((((+((8'ha8) ? reg109 : (8'hb9))) | ({wire99} ?
                  $signed(reg112) : (reg110 & wire96))) >> ($unsigned(reg111[(4'h8):(4'h8)]) ?
                  wire100 : reg110)) ?
              reg109 : $unsigned($unsigned($unsigned((^~reg109))))))
            begin
              reg114 <= (^wire102[(3'h4):(2'h2)]);
              reg115 <= $signed(({$signed($signed(wire95))} ?
                  (!($signed(reg110) ?
                      (wire102 ? (8'hbc) : wire94) : (^wire95))) : reg108));
              reg116 <= $unsigned(($signed((wire94 || reg115[(4'h9):(2'h2)])) ?
                  $unsigned((-wire94[(4'hf):(4'ha)])) : {reg109[(1'h0):(1'h0)],
                      (~|$signed(reg113))}));
              reg117 <= ($signed(reg105) << reg109[(3'h7):(3'h7)]);
              reg118 <= $unsigned($signed($unsigned((((8'hb9) ^~ wire99) != wire104[(4'hc):(3'h5)]))));
            end
          else
            begin
              reg114 <= {$unsigned(((!{reg108}) || ($unsigned(wire102) != (8'hb4)))),
                  $unsigned(wire104[(4'h8):(2'h3)])};
              reg115 <= $signed(((reg114 ?
                      wire96[(4'hb):(4'h9)] : $signed($unsigned(reg114))) ?
                  $unsigned((wire101 ?
                      (reg110 ? reg105 : reg113) : (reg107 ?
                          reg105 : reg111))) : wire93));
              reg116 <= wire98[(3'h4):(2'h3)];
            end
        end
      else
        begin
          reg109 <= (($unsigned($unsigned(reg113[(4'hb):(4'h9)])) ^~ {(~&wire98)}) ~^ ($signed((8'hb1)) ?
              wire95 : ((wire99[(4'hc):(4'hb)] ?
                  $signed((8'ha7)) : wire103) ^~ $unsigned(wire103[(4'hd):(2'h3)]))));
          reg110 <= {((8'hb4) ?
                  reg105[(1'h1):(1'h0)] : $signed(wire102[(4'hb):(1'h1)])),
              reg115};
          reg111 <= $signed(((+({wire95} - (!(7'h42)))) >>> ({(wire99 ?
                  reg111 : (8'had)),
              wire96[(1'h0):(1'h0)]} + $signed($unsigned(wire95)))));
          reg112 <= (wire97[(1'h0):(1'h0)] ?
              ($unsigned({(~&wire101), $signed(reg112)}) ?
                  reg109 : (wire96 | ((!(8'hba)) ?
                      wire104[(4'hf):(2'h2)] : {wire103}))) : wire98[(4'h9):(4'h8)]);
          reg113 <= {reg109};
        end
      reg119 <= (wire100[(1'h0):(1'h0)] ?
          $signed(reg111) : {wire97[(2'h2):(2'h2)],
              (((reg115 ? wire94 : wire96) ^ (reg110 | wire96)) > wire93)});
      reg120 <= ($signed($unsigned(($unsigned((8'hbb)) ?
              (^~reg109) : wire104[(1'h0):(1'h0)]))) ?
          $unsigned(((-reg108[(4'he):(4'ha)]) ?
              $signed(reg107) : {$unsigned((8'hb9)),
                  {reg116}})) : $unsigned(({{reg108}} - (reg105[(2'h2):(1'h1)] && ((8'hbc) ?
              reg117 : wire97)))));
    end
  assign wire121 = $unsigned(wire100[(2'h2):(1'h0)]);
  assign wire122 = (8'hb8);
  assign wire123 = ((reg110 * {wire95}) ?
                       wire122[(2'h3):(2'h2)] : (-$unsigned({$signed(wire98),
                           (|reg119)})));
  assign wire124 = ({$signed(((reg112 ? reg109 : reg120) ?
                               $signed(wire101) : {wire123}))} ?
                       ($signed(wire96) ?
                           wire104 : wire99[(3'h4):(3'h4)]) : wire106[(3'h7):(3'h4)]);
  assign wire125 = (~(8'ha0));
  assign wire126 = ($signed((|wire101)) ? (~^wire99[(2'h3):(1'h1)]) : reg117);
  assign wire127 = $unsigned((~^(!reg119)));
endmodule

module module15
#(parameter param86 = ((~^((((8'hbc) ? (8'h9e) : (8'hbd)) <<< ((8'h9f) ? (8'h9e) : (8'hb6))) << (((8'hb3) ? (8'haf) : (8'hb5)) << ((7'h41) ~^ (8'ha1))))) ? (((&(~&(8'hbc))) ? ((~|(8'hbc)) || ((8'hb4) >> (8'hb3))) : ((8'ha5) ? ((8'h9e) ^ (8'hb1)) : {(8'hb1)})) ? {((&(8'hb7)) || (~(8'hac)))} : ({((8'hb9) == (8'ha0)), ((8'hb6) ? (8'ha3) : (8'h9e))} & (((8'hb2) ? (8'h9c) : (8'hbc)) ? ((7'h44) >>> (8'ha5)) : ((8'ha4) && (8'haa))))) : ((~^(((8'ha3) ? (8'ha9) : (8'h9d)) <= ((8'ha2) <= (8'hbf)))) ? (^(((8'hb1) - (8'hae)) ~^ ((8'hbd) + (8'ha6)))) : (~&({(8'ha6)} >>> {(8'hb7)})))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h1ed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire25;
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire76,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire25,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
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
                 reg40,
                 reg41,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= wire18;
      reg22 <= (wire20[(1'h0):(1'h0)] | (~(((~wire17) != wire18[(2'h3):(1'h0)]) ?
          wire19 : ((-wire19) ^ $unsigned(wire18)))));
      reg23 <= {($unsigned($unsigned({reg22})) << (~wire16))};
      reg24 <= wire16;
    end
  assign wire25 = $unsigned($unsigned($signed((^(~reg21)))));
  always
    @(posedge clk) begin
      reg26 <= ((wire25 ?
          (((!wire25) + (wire16 != wire16)) ?
              (((8'ha7) - wire17) >> wire20) : $signed(wire25[(2'h3):(1'h0)])) : $unsigned((~{wire20,
              wire19}))) >> wire20);
      if (reg23[(4'he):(3'h7)])
        begin
          reg27 <= reg21[(3'h7):(1'h0)];
          reg28 <= {$unsigned($unsigned(({(7'h42), wire16} ?
                  {wire17, (8'h9c)} : $unsigned((8'hba))))),
              $unsigned($unsigned(wire18[(2'h2):(1'h0)]))};
          reg29 <= $signed($signed((((~|wire25) ?
              (reg27 ? reg26 : reg28) : (-(8'hbf))) || ((^~wire25) ?
              {wire18} : wire17))));
          if (reg23)
            begin
              reg30 <= $signed($unsigned(reg26[(3'h7):(3'h4)]));
              reg31 <= $signed({$signed($signed((reg21 != reg28)))});
            end
          else
            begin
              reg30 <= (reg24[(1'h0):(1'h0)] ?
                  reg29[(4'h8):(2'h3)] : wire20[(1'h0):(1'h0)]);
              reg31 <= reg24;
              reg32 <= $unsigned((reg26[(4'hc):(1'h1)] << $unsigned(wire20[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          if ($signed((reg32[(4'hb):(1'h1)] ?
              wire17[(4'hb):(2'h2)] : (|$unsigned((reg31 ? wire18 : wire19))))))
            begin
              reg27 <= reg32;
              reg28 <= (^$unsigned($signed((~&$signed(reg29)))));
              reg29 <= (reg23 ? $signed(reg21) : $unsigned(reg31));
            end
          else
            begin
              reg27 <= reg28[(5'h12):(4'hb)];
              reg28 <= ((wire19[(3'h6):(1'h0)] ~^ {reg31[(1'h1):(1'h0)],
                  reg24[(1'h0):(1'h0)]}) >>> (^~((^~$unsigned(wire16)) << $unsigned((|wire18)))));
              reg29 <= (($unsigned(reg21[(3'h6):(2'h2)]) ?
                      $signed($signed($signed(reg23))) : $signed((wire18 ?
                          {wire20, wire25} : (~&reg26)))) ?
                  reg21 : (reg29 ~^ $signed(wire18[(4'ha):(4'ha)])));
              reg30 <= ($signed($unsigned(reg23)) ?
                  reg30[(2'h3):(2'h2)] : (!$signed(reg29[(3'h5):(1'h0)])));
              reg31 <= $signed($signed($signed(((&wire16) && (reg23 ?
                  wire25 : wire25)))));
            end
          reg32 <= $signed({reg26[(3'h5):(2'h2)]});
          reg33 <= wire25[(4'h8):(2'h2)];
        end
      if (reg31)
        begin
          reg34 <= $unsigned((((8'hbb) - $signed($signed(reg23))) ?
              $signed((((8'hb3) + reg29) ?
                  $unsigned((8'hbb)) : reg22[(1'h1):(1'h0)])) : ($unsigned((~^reg27)) || ((wire25 ?
                      (7'h40) : reg22) ?
                  (~(8'ha6)) : $signed(wire19)))));
        end
      else
        begin
          reg34 <= ({(wire17[(4'ha):(3'h5)] > ((reg30 - reg34) ?
                  wire17[(2'h3):(2'h2)] : $unsigned(reg33))),
              reg34} >>> reg29);
          if ((({{wire19}} <<< reg34[(3'h4):(2'h2)]) != $unsigned({$unsigned(reg29[(3'h7):(3'h6)])})))
            begin
              reg35 <= (~|$signed((($unsigned(reg31) ?
                  reg29[(1'h0):(1'h0)] : reg24) & ({reg29,
                  reg26} ^ (reg32 > reg22)))));
              reg36 <= reg33;
              reg37 <= $signed((($unsigned((wire17 ^ wire16)) ?
                  $unsigned($unsigned((8'ha0))) : reg34[(3'h7):(3'h5)]) <<< $unsigned((+$signed(wire18)))));
              reg38 <= (~^($unsigned($signed(reg27[(1'h0):(1'h0)])) ?
                  (8'hb6) : reg36[(5'h11):(4'he)]));
            end
          else
            begin
              reg35 <= $unsigned({wire20,
                  ($unsigned($signed(wire18)) ?
                      $unsigned(reg21[(3'h6):(3'h5)]) : reg27[(3'h7):(3'h4)])});
              reg36 <= (-(($signed((reg32 * reg32)) ?
                      (&{reg28, (8'ha9)}) : {reg26, reg24}) ?
                  ({(reg27 | reg31), (~&reg26)} ?
                      $signed($signed(reg26)) : (+reg36)) : (~|wire19[(2'h2):(1'h0)])));
            end
          reg39 <= {($unsigned({(reg30 ? reg26 : (8'had)),
                      reg29[(1'h1):(1'h1)]}) ?
                  ($signed(reg31) & {$signed((8'ha8))}) : $signed(reg29[(5'h11):(4'hf)])),
              wire16};
          if (reg39[(5'h15):(5'h15)])
            begin
              reg40 <= {(reg35[(1'h1):(1'h1)] >= $signed((((8'h9d) ?
                      reg28 : reg35) | $unsigned(wire20)))),
                  wire17[(3'h4):(3'h4)]};
              reg41 <= reg30[(3'h4):(2'h2)];
            end
          else
            begin
              reg40 <= $signed($signed($unsigned((reg23 ?
                  reg21[(5'h14):(4'hf)] : $unsigned((8'ha6))))));
              reg41 <= reg23[(4'ha):(4'ha)];
            end
          reg42 <= reg26;
        end
    end
  assign wire43 = $unsigned((reg33[(3'h6):(3'h5)] ?
                      (reg42 ?
                          (~&reg28) : $unsigned(((8'h9d) & reg42))) : reg42));
  assign wire44 = (|$unsigned(wire25));
  assign wire45 = $unsigned(($signed(($signed((8'haf)) ?
                          (reg36 ^ (8'hb6)) : $signed(reg40))) ?
                      $unsigned(reg39[(1'h1):(1'h0)]) : wire44));
  assign wire46 = $unsigned($signed(({(wire44 * reg28)} != $unsigned({reg22,
                      (8'haf)}))));
  assign wire47 = {$signed($signed((reg38 ?
                          $unsigned(wire16) : $unsigned(reg34)))),
                      wire19};
  module48 #() modinst77 (.clk(clk), .wire50(reg38), .y(wire76), .wire52(reg35), .wire51(reg37), .wire53(wire19), .wire49(wire17));
  always
    @(posedge clk) begin
      reg78 <= (~&$signed(reg42[(4'hd):(4'h9)]));
      reg79 <= $signed((-(8'hb6)));
      if ((((~&(^(+wire44))) ?
          $unsigned({$signed(reg41)}) : (8'hae)) <<< (|(^~reg79[(4'he):(2'h3)]))))
        begin
          reg80 <= (($unsigned($unsigned($signed(reg35))) ?
                  (~reg22) : {((reg32 <= (8'h9f)) ?
                          (wire43 ? wire45 : wire20) : (reg39 >>> reg28)),
                      reg29}) ?
              $unsigned(reg42) : (+($signed(reg36[(3'h5):(1'h1)]) >>> $signed($unsigned(wire45)))));
          reg81 <= $unsigned((8'hb4));
        end
      else
        begin
          if ($signed($unsigned((($signed((8'ha1)) ?
              $unsigned(reg80) : $unsigned(reg80)) ~^ reg41))))
            begin
              reg80 <= reg35;
              reg81 <= $signed({$unsigned(((wire20 ?
                      wire17 : (8'ha4)) ~^ (reg32 ? reg42 : reg81))),
                  reg34[(3'h4):(1'h0)]});
              reg82 <= ($signed(reg26[(1'h0):(1'h0)]) >= {{$unsigned($signed(reg21))},
                  ((^~$signed(wire46)) + $signed(reg22[(3'h7):(3'h5)]))});
            end
          else
            begin
              reg80 <= $signed($signed({{(wire45 ? (8'hbb) : (8'hb3))},
                  $signed((&wire46))}));
            end
          reg83 <= ((+reg41) ?
              ((($signed(reg78) && reg79) ? wire47 : (~reg40[(4'hb):(1'h0)])) ?
                  ({(wire18 | reg22)} && (+(reg38 ?
                      reg34 : wire25))) : $signed(reg36[(5'h12):(4'he)])) : $unsigned($unsigned({((8'hb2) <= reg29)})));
        end
    end
  assign wire84 = $unsigned({wire25});
  assign wire85 = ($signed($unsigned(wire16)) ~^ reg28);
endmodule

module module48
#(parameter param74 = (^~(|{((8'ha6) * (8'h9c)), ({(8'ha5)} ? (~(8'hba)) : (|(8'hab)))})), 
parameter param75 = (((((param74 ? param74 : param74) >> (param74 <= (8'hae))) > {param74}) ? (8'ha4) : param74) ? (({(~^param74), (|param74)} ? param74 : ((param74 ? param74 : param74) ? (^param74) : param74)) ? (param74 ? (param74 ? (^~param74) : (-param74)) : (param74 * (&param74))) : (param74 * (~(8'ha0)))) : (+((7'h43) ? ((~|param74) ~^ (param74 > param74)) : (!param74)))))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire53;
  input wire signed [(4'hb):(1'h0)] wire52;
  input wire [(4'ha):(1'h0)] wire51;
  input wire [(4'h8):(1'h0)] wire50;
  input wire signed [(4'h9):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(4'h8):(1'h0)] wire54;
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'hf):(1'h0)] reg57 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire56,
                 wire55,
                 wire54,
                 reg71,
                 reg70,
                 reg69,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire54 = $signed(wire49);
  assign wire55 = $signed((wire49[(3'h6):(1'h0)] * $unsigned($signed({wire49}))));
  assign wire56 = $unsigned((wire52[(1'h0):(1'h0)] < (^~((wire50 <= wire53) > $unsigned(wire53)))));
  always
    @(posedge clk) begin
      reg57 <= ((~|$signed(wire52)) ?
          {{$unsigned((wire53 >= wire56)),
                  {$unsigned(wire53),
                      {wire49}}}} : $unsigned((wire49[(3'h7):(3'h6)] ?
              ($unsigned(wire53) || (wire51 ?
                  wire53 : wire54)) : $unsigned((wire49 ? wire54 : wire56)))));
      reg58 <= (^wire50);
      reg59 <= (-(|wire49[(1'h0):(1'h0)]));
      reg60 <= (&({reg58[(3'h4):(3'h4)]} ?
          $signed((reg58[(1'h0):(1'h0)] ?
              $signed(reg57) : $signed(wire51))) : (($unsigned((8'hb5)) ?
                  (+wire53) : (&(8'ha8))) ?
              reg59[(1'h1):(1'h1)] : $unsigned(wire53[(3'h5):(1'h1)]))));
      reg61 <= ((&wire56[(2'h2):(1'h1)]) ~^ ($signed(($unsigned(wire56) ^ wire51)) <<< reg57[(4'hd):(3'h5)]));
    end
  assign wire62 = (+wire54[(4'h8):(2'h3)]);
  assign wire63 = ((|(~(8'hb8))) ?
                      ((~&($signed(wire53) < wire52)) ?
                          ((~(!reg59)) >= $signed(((8'hb3) ?
                              wire52 : reg61))) : ((~^{(7'h41)}) ?
                              $unsigned((^wire50)) : $signed({reg60,
                                  wire54}))) : (wire54 ?
                          $signed($unsigned((~&(8'hb1)))) : wire55));
  assign wire64 = ($unsigned(wire63[(4'hd):(3'h6)]) - $signed($signed((wire62 ?
                      wire50 : {wire51, wire49}))));
  assign wire65 = (|(($unsigned($unsigned(wire55)) ?
                      $unsigned(wire52[(1'h0):(1'h0)]) : (|wire51[(1'h1):(1'h0)])) + ($signed((reg60 ?
                      reg59 : wire63)) | $signed((-(8'ha3))))));
  assign wire66 = (~(^(+wire50)));
  assign wire67 = $unsigned({({(reg58 * reg60)} ^ $signed($signed(wire52)))});
  assign wire68 = ((-(wire51[(1'h0):(1'h0)] & $signed($signed(wire53)))) ?
                      $unsigned(wire66) : reg59[(5'h12):(4'he)]);
  always
    @(posedge clk) begin
      reg69 <= ($signed(wire54) ?
          wire62 : {wire50[(3'h4):(1'h1)], $unsigned({reg57})});
      reg70 <= ($unsigned($unsigned($signed($signed(wire67)))) ?
          $signed($unsigned(($unsigned(wire53) ?
              $signed(wire63) : (wire68 ?
                  (8'ha2) : wire64)))) : wire66[(1'h0):(1'h0)]);
      reg71 <= wire54[(3'h4):(3'h4)];
    end
  assign wire72 = (($unsigned(($unsigned(wire67) != (|wire62))) ^ {reg70}) == (((+(reg71 ?
                              wire63 : wire68)) ?
                          $unsigned((-reg61)) : wire55[(4'hf):(3'h5)]) ?
                      wire53[(1'h1):(1'h0)] : $unsigned($signed(wire63[(4'hc):(4'hc)]))));
  assign wire73 = ((~|wire52) ^~ $signed((wire52 < $unsigned(reg70[(1'h1):(1'h0)]))));
endmodule
