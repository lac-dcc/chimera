module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire149;
  wire [(4'hd):(1'h0)] wire151;
  wire [(5'h13):(1'h0)] wire152;
  wire [(4'hc):(1'h0)] wire153;
  assign y = {wire4, wire149, wire151, wire152, wire153, (1'h0)};
  assign wire4 = (wire0[(3'h6):(3'h4)] + $signed(wire1));
  module5 #() modinst150 (.y(wire149), .wire6(wire0), .wire8(wire2), .wire7(wire4), .wire9(wire3), .clk(clk));
  assign wire151 = wire0;
  assign wire152 = $unsigned((wire1 <<< wire2));
  module133 #() modinst154 (wire153, clk, wire2, wire152, wire3, wire0, wire151);
endmodule

module module5
#(parameter param148 = (!(~|((^~(!(7'h44))) ? (!((8'h9e) != (8'hbb))) : (((7'h42) ? (8'hae) : (8'h9c)) ? ((8'h9f) >= (8'hbf)) : ((8'h9e) | (8'ha7)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h1e2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire146;
  wire [(4'ha):(1'h0)] wire68;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire [(4'hc):(1'h0)] wire28;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire25;
  wire [(3'h5):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'ha):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(4'hf):(1'h0)] wire131;
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  assign y = {wire146,
                 wire68,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire96,
                 wire97,
                 wire98,
                 wire131,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  module10 #() modinst26 (.clk(clk), .wire13(wire8), .wire12(wire7), .y(wire25), .wire11((8'h9e)), .wire14(wire6), .wire15(wire9));
  assign wire27 = $signed(wire8[(4'h8):(3'h6)]);
  assign wire28 = wire6;
  assign wire29 = wire25;
  assign wire30 = (~(|wire25));
  assign wire31 = {($signed($unsigned($signed((8'hbb)))) ?
                          $unsigned((wire25 - (wire30 ?
                              (8'hbe) : wire9))) : ((wire8 == wire9) ?
                              wire30[(4'hc):(1'h0)] : (^(wire27 - wire7))))};
  module32 #() modinst69 (.clk(clk), .wire36(wire27), .y(wire68), .wire35(wire6), .wire34(wire29), .wire37(wire28), .wire33(wire8));
  assign wire70 = ((^(((8'hab) ^ wire9[(2'h3):(1'h1)]) ?
                      wire7[(1'h0):(1'h0)] : $unsigned((8'ha5)))) & (+wire30));
  assign wire71 = (wire27[(4'h9):(3'h5)] >= $signed((+wire9)));
  assign wire72 = $unsigned($unsigned(((!(wire28 == wire71)) ^~ $unsigned((~|wire28)))));
  assign wire73 = $unsigned($signed($signed(($unsigned(wire70) >>> (wire29 ?
                      (8'hb3) : wire70)))));
  always
    @(posedge clk) begin
      if ((^wire68[(3'h4):(2'h3)]))
        begin
          reg74 <= $unsigned({$signed(((wire6 ? wire31 : wire73) ?
                  wire72 : (wire30 || wire28)))});
        end
      else
        begin
          reg74 <= (+(wire29 ?
              ($signed((wire6 | wire30)) ?
                  ((wire31 >> wire31) ?
                      (wire73 ? wire27 : (8'hb2)) : wire72) : $signed({wire25,
                      wire8})) : ((-{wire30, wire72}) ?
                  wire73 : $signed(((8'h9d) ^~ wire27)))));
          if (($signed({(~|wire29)}) < $unsigned(wire27[(4'h8):(1'h1)])))
            begin
              reg75 <= (wire30 << (8'had));
              reg76 <= $unsigned(wire30[(4'ha):(2'h2)]);
              reg77 <= ($signed(((wire27 ?
                          (wire72 ^~ reg76) : wire73[(3'h7):(3'h4)]) ?
                      {$signed((8'hb7))} : ((^~wire8) ?
                          $unsigned(wire25) : wire25[(3'h6):(2'h2)]))) ?
                  (-$unsigned((wire7 < $unsigned((8'hb6))))) : wire31);
            end
          else
            begin
              reg75 <= $unsigned(($unsigned(wire8[(1'h1):(1'h1)]) == ($unsigned((^wire30)) ?
                  reg75[(3'h6):(3'h6)] : ((wire7 ? wire31 : reg77) ?
                      (~^wire8) : wire6[(3'h4):(2'h3)]))));
              reg76 <= $signed(reg77);
              reg77 <= $signed(wire71);
            end
          reg78 <= (~&$unsigned((!wire30)));
          reg79 <= $unsigned(($unsigned($signed(wire25[(2'h3):(1'h0)])) <= {($unsigned((8'ha6)) - (wire8 <<< wire28))}));
        end
      reg80 <= ((&$signed(wire7[(3'h7):(2'h2)])) ?
          ((wire29 * ({wire70} >= {reg74})) ?
              wire9[(3'h4):(2'h2)] : $unsigned((-wire30))) : (wire31 | (wire6 == $unsigned($signed(wire31)))));
      if (wire73[(3'h5):(1'h1)])
        begin
          reg81 <= $signed(reg78[(4'h9):(3'h4)]);
        end
      else
        begin
          reg81 <= (~|reg76);
          reg82 <= (|$unsigned(((8'ha1) + ($signed(wire73) << $signed(wire30)))));
          reg83 <= (($unsigned(((wire71 & wire72) ?
                  wire27[(4'hc):(3'h7)] : $signed(wire31))) & $signed(reg81[(1'h0):(1'h0)])) ?
              reg75[(1'h1):(1'h0)] : wire72);
        end
      if ($signed($signed((-$unsigned(((8'hba) ? wire9 : (8'hb6)))))))
        begin
          reg84 <= $signed($unsigned((($unsigned(wire72) ?
                  wire71 : wire30[(3'h7):(3'h4)]) ?
              (^(~&(8'ha7))) : $unsigned(((7'h40) <<< reg80)))));
          reg85 <= ({($unsigned((wire68 & wire28)) | (~&$unsigned((8'ha9))))} != reg80[(4'h9):(3'h5)]);
          reg86 <= (-$unsigned(wire72[(3'h7):(3'h5)]));
          reg87 <= {(wire72 ? $unsigned($unsigned({(8'hb7)})) : wire73)};
          reg88 <= $signed($unsigned(wire29[(4'hf):(4'ha)]));
        end
      else
        begin
          reg84 <= $unsigned($signed((({wire68} <= (reg82 ? wire31 : (8'hae))) ?
              reg78[(1'h1):(1'h1)] : ($unsigned(wire72) ?
                  reg78[(2'h2):(2'h2)] : reg83[(4'ha):(4'h8)]))));
          reg85 <= ($signed(($signed(wire70[(3'h5):(3'h5)]) ?
              (8'h9c) : {$signed(wire30), (~&reg76)})) < ({reg74} ?
              reg77 : {$signed((reg86 ? wire29 : wire70)),
                  $signed(reg85[(2'h2):(1'h0)])}));
          if ((~|((reg74 >> ($signed(reg75) ?
                  (reg87 && reg76) : (wire28 ~^ reg83))) ?
              $signed(reg76[(3'h4):(2'h3)]) : $unsigned(($unsigned(reg78) >> wire25)))))
            begin
              reg86 <= (~wire29);
              reg87 <= {($signed(wire31[(2'h2):(1'h0)]) ?
                      $signed((wire73[(3'h4):(2'h3)] ?
                          (wire70 ?
                              wire31 : (8'hbc)) : (+reg77))) : (((wire70 - wire31) ?
                              (wire7 ? wire6 : wire27) : $signed((8'hb1))) ?
                          reg80 : $unsigned($unsigned((8'hb7))))),
                  ($unsigned((wire29[(4'hc):(4'h9)] >>> (reg74 ?
                      wire31 : wire6))) | (~^$signed((8'ha0))))};
              reg88 <= wire68[(2'h3):(1'h0)];
            end
          else
            begin
              reg86 <= {wire30[(3'h4):(2'h3)]};
              reg87 <= wire6[(4'h9):(1'h0)];
              reg88 <= $unsigned({((~(&wire71)) << (~&{wire29, wire71})),
                  ($signed((~^wire71)) < ((wire72 ?
                      reg83 : reg78) && (~(8'h9c))))});
              reg89 <= reg78[(3'h7):(1'h0)];
              reg90 <= reg84;
            end
          reg91 <= $signed(reg81);
          if ($signed((~(+$signed({reg76})))))
            begin
              reg92 <= (wire27 ?
                  $unsigned((^~{(wire71 + wire71),
                      $signed(reg91)})) : (wire30[(1'h1):(1'h0)] ?
                      ($unsigned(wire68[(3'h5):(3'h5)]) ?
                          reg91[(5'h15):(4'hd)] : wire73[(4'ha):(3'h4)]) : wire70[(3'h4):(1'h0)]));
              reg93 <= reg79[(3'h4):(2'h3)];
              reg94 <= wire72;
              reg95 <= (reg77 & $signed(reg87[(4'hb):(4'hb)]));
            end
          else
            begin
              reg92 <= $unsigned($signed(reg78[(3'h7):(2'h3)]));
            end
        end
    end
  assign wire96 = ((reg82 ?
                      (($signed(wire6) ?
                              $unsigned(reg94) : (reg74 ? wire73 : wire72)) ?
                          ($signed(reg85) ?
                              (reg90 ?
                                  wire29 : reg77) : ((7'h44) ^ reg80)) : reg94) : $signed(wire73)) ^~ $signed(wire70));
  assign wire97 = {wire73[(4'h9):(2'h3)]};
  assign wire98 = reg84;
  module99 #() modinst132 (wire131, clk, wire6, reg85, wire28, wire71);
  module133 #() modinst147 (.clk(clk), .wire138(wire8), .wire135(reg78), .y(wire146), .wire137(wire29), .wire134(wire28), .wire136(wire131));
endmodule

module module133
#(parameter param144 = (!(((((8'hb4) & (8'h9c)) >= ((8'ha5) ~^ (8'ha7))) * ({(8'hac)} <= {(8'ha0), (8'hbd)})) ? {(((8'ha9) + (8'ha1)) < ((8'hb3) ? (8'hb6) : (8'hb6))), ({(8'had)} & (-(8'hbc)))} : {{((8'haf) ? (8'hbf) : (7'h44))}, (((8'ha7) ? (8'hbf) : (8'h9c)) ? ((8'hac) ? (7'h41) : (8'hae)) : ((8'hab) ? (7'h44) : (7'h40)))})), 
parameter param145 = (~(!((|param144) ? (^(param144 - param144)) : param144))))
(y, clk, wire138, wire137, wire136, wire135, wire134);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire138;
  input wire signed [(5'h11):(1'h0)] wire137;
  input wire signed [(4'hf):(1'h0)] wire136;
  input wire signed [(4'h9):(1'h0)] wire135;
  input wire signed [(3'h5):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire signed [(5'h13):(1'h0)] wire141;
  wire signed [(5'h15):(1'h0)] wire140;
  wire [(3'h5):(1'h0)] wire139;
  assign y = {wire143, wire142, wire141, wire140, wire139, (1'h0)};
  assign wire139 = $unsigned(wire138);
  assign wire140 = ((({$unsigned((8'haa)),
                       (wire135 ?
                           wire135 : wire136)} <<< wire135[(4'h8):(2'h3)]) >>> ({$unsigned(wire135)} ?
                       $signed($signed(wire134)) : ($signed((8'ha5)) ?
                           wire138[(4'ha):(3'h4)] : (wire135 ?
                               wire136 : (8'h9e))))) < ((((wire134 ?
                           wire135 : wire138) <<< wire134[(3'h5):(1'h0)]) ^ (8'ha4)) ?
                       $signed((&(wire134 ^ wire138))) : $signed((~$unsigned(wire139)))));
  assign wire141 = (+wire134);
  assign wire142 = (|({$unsigned((wire138 ? (8'hac) : wire138))} ?
                       {wire137[(4'he):(2'h3)]} : $signed({$signed((8'hbb))})));
  assign wire143 = wire136[(2'h3):(1'h1)];
endmodule

module module99
#(parameter param130 = ((|(~(7'h43))) ? (^({((8'ha2) ? (8'ha1) : (8'hb2))} <= ((~&(7'h41)) ? ((8'haf) | (8'hb5)) : ((7'h40) ? (8'ha4) : (8'ha4))))) : ((~^((~(8'ha3)) >= (~&(8'hb2)))) ? (~^(8'hb0)) : ((((8'hb1) || (8'ha5)) ? ((8'ha4) ? (8'hb1) : (8'hbf)) : ((8'hb1) ? (8'h9d) : (8'hb9))) ? (+((8'hb0) >> (8'hb4))) : (8'hbb)))))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire103;
  input wire [(2'h3):(1'h0)] wire102;
  input wire signed [(3'h5):(1'h0)] wire101;
  input wire signed [(5'h10):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire113;
  wire signed [(4'h8):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire signed [(5'h13):(1'h0)] wire109;
  wire signed [(5'h14):(1'h0)] wire108;
  wire [(5'h10):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire [(5'h11):(1'h0)] wire104;
  reg signed [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg120 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg [(4'hf):(1'h0)] reg117 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg114 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
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
                 (1'h0)};
  assign wire104 = $unsigned(({$unsigned((~&wire103))} ^~ ($signed(wire103[(4'hb):(3'h4)]) ?
                       wire103 : (~|wire102[(1'h1):(1'h0)]))));
  assign wire105 = ($signed(wire102) ?
                       (wire104 << (({wire104} > $unsigned(wire101)) + wire101[(1'h1):(1'h1)])) : wire101);
  assign wire106 = $unsigned({wire100, (-wire102)});
  assign wire107 = $unsigned(wire103);
  assign wire108 = {((((wire104 ? wire106 : wire101) << (wire101 ?
                               wire104 : wire102)) ?
                           wire101 : (wire102[(2'h3):(1'h1)] - (wire103 * wire107))) < wire105)};
  assign wire109 = (((wire103[(4'h8):(2'h3)] ?
                               (-$unsigned((8'ha4))) : ($unsigned((8'hb8)) != (wire104 ?
                                   wire106 : wire108))) ?
                           ($unsigned($unsigned(wire106)) - (7'h40)) : $signed((|(~&wire108)))) ?
                       wire101 : $unsigned($signed(wire106)));
  assign wire110 = $signed((~|{(!$signed((8'hb2)))}));
  assign wire111 = $unsigned(((((wire100 == wire108) <= $signed((8'ha2))) ?
                       ($signed((8'hac)) * $signed(wire101)) : wire101[(2'h3):(2'h2)]) & wire105));
  assign wire112 = (wire106[(4'ha):(1'h0)] && ((&(|$unsigned(wire100))) ^ (^(8'ha4))));
  assign wire113 = wire112;
  always
    @(posedge clk) begin
      if ((~($signed(wire111[(1'h1):(1'h1)]) ~^ {wire103})))
        begin
          if ({$signed((($unsigned(wire112) >= $unsigned(wire106)) ?
                  wire108[(3'h6):(1'h1)] : wire109)),
              (wire102[(2'h3):(1'h0)] << wire108[(4'h9):(3'h5)])})
            begin
              reg114 <= wire105;
              reg115 <= wire100;
            end
          else
            begin
              reg114 <= wire107[(3'h7):(3'h5)];
            end
          reg116 <= wire105[(5'h11):(4'h8)];
          if ((&(^~(|(((8'haf) ^ wire106) ?
              $signed(wire106) : $unsigned(wire101))))))
            begin
              reg117 <= (~&(^(-$unsigned(wire103[(4'he):(3'h4)]))));
              reg118 <= ((|(wire100[(4'hc):(3'h6)] ~^ {(|wire101)})) ?
                  $unsigned($signed($signed((reg114 >>> wire102)))) : (~wire104[(3'h6):(2'h3)]));
              reg119 <= ((^~((8'h9c) ?
                      (reg117 ?
                          reg114[(3'h4):(2'h3)] : $signed(wire103)) : ((7'h42) <<< (reg114 ?
                          wire112 : wire110)))) ?
                  (wire109[(2'h3):(2'h2)] ?
                      $unsigned(((wire113 ^ wire105) ?
                          {wire109,
                              reg117} : $signed(wire110))) : $unsigned($unsigned((-wire106)))) : {wire103[(3'h5):(2'h3)],
                      wire107});
              reg120 <= $unsigned(((-reg116[(2'h2):(1'h1)]) | $unsigned($unsigned((wire104 ^ (7'h43))))));
            end
          else
            begin
              reg117 <= wire103[(2'h3):(2'h3)];
              reg118 <= wire104[(4'he):(4'h9)];
              reg119 <= wire108;
              reg120 <= (~|($unsigned(((-wire103) ?
                  $unsigned(wire107) : (wire112 ?
                      reg116 : wire100))) << wire105[(4'hf):(2'h3)]));
            end
          reg121 <= reg116[(1'h0):(1'h0)];
          if (wire108)
            begin
              reg122 <= (~wire103[(5'h10):(4'hc)]);
              reg123 <= (-($unsigned({(+(8'ha9))}) == $signed($signed($unsigned(reg116)))));
              reg124 <= (8'hb4);
            end
          else
            begin
              reg122 <= ($signed($signed((reg122[(3'h5):(3'h5)] <<< {wire111,
                      wire102}))) ?
                  ($unsigned((~&$unsigned(reg121))) >= reg122) : (wire103 ?
                      (!(reg123[(4'hb):(4'hb)] ?
                          $unsigned(reg118) : $unsigned(reg124))) : $unsigned(($signed(wire112) | (wire101 << wire110)))));
              reg123 <= $signed($unsigned($signed((8'haf))));
              reg124 <= reg121[(3'h4):(1'h0)];
              reg125 <= $unsigned(wire103[(4'hc):(4'hc)]);
            end
        end
      else
        begin
          reg114 <= (7'h44);
        end
      reg126 <= (^~(^~$unsigned(reg125[(3'h7):(2'h2)])));
      if (wire101[(1'h1):(1'h0)])
        begin
          reg127 <= $signed({(~&reg122[(3'h4):(1'h1)]), $unsigned(wire103)});
          reg128 <= $unsigned($signed(($unsigned($unsigned((8'hb7))) && (((8'ha4) ^~ wire108) ?
              reg125 : (+wire113)))));
        end
      else
        begin
          reg127 <= (&reg114);
        end
      reg129 <= (^~$signed(reg122[(4'ha):(4'ha)]));
    end
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire37;
  input wire [(4'hf):(1'h0)] wire36;
  input wire [(5'h13):(1'h0)] wire35;
  input wire [(5'h11):(1'h0)] wire34;
  input wire signed [(4'he):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire59,
                 wire58,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 reg62,
                 reg61,
                 reg60,
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
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire38 = ((!(-$unsigned({(8'hb6)}))) >= $signed(wire36));
  assign wire39 = (~^(-wire34[(2'h2):(1'h1)]));
  assign wire40 = $signed($unsigned((((wire37 + wire34) > wire35[(2'h2):(1'h0)]) == wire33[(1'h0):(1'h0)])));
  assign wire41 = (&wire36);
  assign wire42 = wire35;
  always
    @(posedge clk) begin
      reg43 <= (($signed(($unsigned(wire35) << wire39)) * $unsigned(wire38)) > {$signed((wire35[(5'h10):(4'hc)] - {wire38,
              (8'hbb)})),
          (($unsigned(wire42) ? wire39[(1'h0):(1'h0)] : $signed(wire38)) ?
              $unsigned(wire41[(1'h0):(1'h0)]) : ($signed(wire42) * wire38))});
      reg44 <= $unsigned(wire35[(1'h0):(1'h0)]);
      if ((wire39[(1'h1):(1'h0)] ?
          $unsigned(wire41) : ($signed($unsigned(reg44)) == $signed(reg43[(2'h3):(1'h1)]))))
        begin
          reg45 <= $unsigned(wire33[(3'h4):(1'h1)]);
          if ((~^wire42[(1'h1):(1'h0)]))
            begin
              reg46 <= ((wire35[(5'h12):(4'hc)] ?
                  wire41[(4'hb):(1'h0)] : {$signed($signed(reg45))}) || reg45);
              reg47 <= {reg45[(3'h5):(1'h1)]};
              reg48 <= wire42;
            end
          else
            begin
              reg46 <= $unsigned(($unsigned({(&(8'hb7)), (reg46 ^~ reg46)}) ?
                  (8'hac) : $unsigned((wire33 ?
                      reg48[(4'h8):(2'h2)] : wire39[(1'h1):(1'h1)]))));
              reg47 <= (($unsigned(({reg46, wire37} ?
                  (wire36 >>> reg43) : $signed(wire40))) == (((8'hb4) ?
                  (^wire39) : wire39[(1'h0):(1'h0)]) || (|wire35[(2'h3):(1'h1)]))) + $signed({$signed((-wire37)),
                  ((&wire38) || $unsigned(reg47))}));
            end
          if (wire40)
            begin
              reg49 <= (reg45 ?
                  wire38 : ($signed(($unsigned(wire40) == (-(8'ha1)))) ?
                      reg45 : wire42[(4'hd):(3'h5)]));
              reg50 <= (8'hb7);
              reg51 <= wire38[(4'hc):(1'h1)];
            end
          else
            begin
              reg49 <= $unsigned((8'h9c));
            end
        end
      else
        begin
          reg45 <= wire37[(3'h6):(3'h4)];
          reg46 <= reg47[(5'h10):(4'ha)];
          if ($unsigned(($unsigned(wire35[(4'hd):(4'ha)]) >= $signed($unsigned($unsigned(wire35))))))
            begin
              reg47 <= ((-{reg47}) >> (^(^{wire41})));
              reg48 <= ((($unsigned(reg51) <= $unsigned(wire33)) ?
                  $unsigned({{wire42}, $unsigned(reg46)}) : (((8'ha8) ?
                          reg43[(2'h2):(2'h2)] : (reg48 ? wire36 : (8'hba))) ?
                      $signed($unsigned(wire39)) : (~wire37[(4'ha):(4'h9)]))) & {wire34[(3'h4):(1'h1)],
                  (($signed(wire34) ?
                      (reg44 ?
                          wire42 : wire41) : $unsigned(wire36)) ~^ reg44[(1'h0):(1'h0)])});
              reg49 <= {{reg48[(3'h4):(2'h2)]}};
              reg50 <= $signed(wire37[(1'h0):(1'h0)]);
              reg51 <= ($signed($unsigned((wire39 <= wire36))) ?
                  reg48[(3'h5):(3'h4)] : {(!$unsigned($unsigned(reg49))),
                      $signed((+(~reg47)))});
            end
          else
            begin
              reg47 <= reg50;
            end
        end
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire33[(4'ha):(4'ha)])))
        begin
          reg52 <= wire42;
          if (wire39[(2'h2):(1'h1)])
            begin
              reg53 <= $signed(reg43);
              reg54 <= {(|$signed($unsigned((!reg46))))};
              reg55 <= $signed($unsigned(($signed((+reg47)) ?
                  $signed($signed(reg51)) : $unsigned((wire36 != wire34)))));
            end
          else
            begin
              reg53 <= ((~|(((&wire34) | (~^reg51)) ?
                  (!(reg51 ? (8'h9e) : reg52)) : wire41)) << reg55);
              reg54 <= (+reg46[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          if (reg55[(2'h3):(1'h0)])
            begin
              reg52 <= ((((|$signed(reg44)) - {$signed((8'hb2)), (!wire34)}) ?
                      ({(reg50 ? reg47 : reg49), (|reg50)} ?
                          reg49 : $signed((reg49 ? reg48 : reg48))) : reg51) ?
                  $signed((((wire41 >= wire35) >> reg44[(4'hb):(3'h7)]) ?
                      (reg49 ? (reg43 == reg44) : $unsigned(wire35)) : (reg53 ?
                          wire36 : {wire37}))) : (~&reg48[(3'h5):(2'h3)]));
              reg53 <= reg46[(2'h2):(2'h2)];
              reg54 <= $signed(reg44[(3'h4):(2'h3)]);
              reg55 <= $signed({wire42[(3'h5):(3'h5)]});
              reg56 <= reg53;
            end
          else
            begin
              reg52 <= wire38[(1'h0):(1'h0)];
              reg53 <= reg44;
              reg54 <= {((+$unsigned((8'hb8))) > reg45),
                  ((~^($unsigned(reg48) - (8'ha7))) >> ((|((8'ha8) || reg44)) + reg55[(1'h0):(1'h0)]))};
            end
          reg57 <= (($signed(wire40[(1'h1):(1'h0)]) ? wire37 : (+wire35)) ?
              $signed($unsigned((|(reg44 ? (8'ha1) : reg48)))) : wire38);
        end
    end
  assign wire58 = reg46;
  assign wire59 = $unsigned(reg44[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg60 <= $unsigned(((8'ha7) + ($unsigned((wire40 ? wire35 : wire37)) ?
          ((reg56 > wire36) + $unsigned(wire33)) : ($signed((8'hb2)) < {wire40,
              (8'hbb)}))));
      reg61 <= wire39;
      reg62 <= ((((reg50[(1'h1):(1'h0)] != (|wire40)) ?
              (wire39 ?
                  (reg54 != reg51) : (reg49 ?
                      reg43 : (8'ha1))) : (&reg43)) < $unsigned((~(&reg55)))) ?
          $signed(wire41[(1'h0):(1'h0)]) : reg54);
    end
  assign wire63 = (!$unsigned(wire35[(3'h5):(1'h1)]));
  assign wire64 = (($unsigned($unsigned($signed(reg48))) ?
                          $signed((~&wire35[(3'h5):(2'h2)])) : $signed({wire40[(3'h4):(3'h4)]})) ?
                      $signed((wire42[(2'h3):(2'h3)] ?
                          $unsigned(wire35) : $signed((~&(8'ha2))))) : (!$unsigned(($signed((8'hab)) ^~ (wire41 ?
                          wire37 : reg52)))));
  assign wire65 = reg46;
  assign wire66 = reg53[(4'h8):(4'h8)];
  assign wire67 = $unsigned((wire39[(2'h3):(2'h3)] ?
                      ((~&$signed(reg60)) ?
                          (8'hb4) : reg46) : wire64[(3'h6):(2'h2)]));
endmodule

module module10
#(parameter param23 = ((~|{(((8'haa) ? (7'h41) : (8'ha2)) ? (+(8'hb9)) : (~^(8'hbf))), (^~((8'hb9) - (8'hb8)))}) ? (8'hb4) : {(~^(((8'hb9) ? (8'h9d) : (8'hb0)) > (~(8'haa)))), {(((8'ha9) ? (8'ha6) : (8'ha6)) ? (&(8'hb9)) : ((8'had) || (8'ha0)))}}), 
parameter param24 = (({{(param23 | param23)}} ? (8'hb5) : ((param23 ^~ {param23}) | ((param23 ? param23 : param23) ? param23 : (8'h9d)))) ? param23 : (~&param23)))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire15;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(3'h7):(1'h0)] wire13;
  input wire [(4'h9):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire16;
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire22, wire20, wire19, wire18, wire17, wire16, reg21, (1'h0)};
  assign wire16 = (!{((wire11[(4'hb):(3'h7)] ?
                          (wire15 << wire11) : {wire12}) != (7'h41)),
                      wire13});
  assign wire17 = $signed($signed($unsigned((((8'hb6) ? wire12 : wire12) ?
                      (wire15 ~^ wire15) : (wire12 ? wire14 : wire15)))));
  assign wire18 = (~^(~wire14[(3'h4):(3'h4)]));
  assign wire19 = (wire12 ?
                      $signed({(wire13[(3'h6):(1'h1)] - (wire17 ^~ wire14))}) : (($unsigned($signed(wire15)) ?
                          (wire14[(1'h1):(1'h1)] << (|wire12)) : $signed((wire15 ?
                              wire18 : wire16))) || wire18[(5'h10):(4'hc)]));
  assign wire20 = (($unsigned(wire12[(3'h7):(3'h7)]) ~^ (($unsigned(wire17) - wire19) ?
                          ({wire12,
                              wire17} <<< wire14[(4'ha):(3'h7)]) : ((wire16 ?
                                  wire18 : wire17) ?
                              (wire13 ? wire16 : wire19) : (|wire12)))) ?
                      wire15[(2'h2):(1'h1)] : ((($signed(wire11) ?
                          $unsigned(wire15) : $unsigned(wire14)) && {wire12}) - $signed($signed($signed(wire14)))));
  always
    @(posedge clk) begin
      reg21 <= $unsigned((wire12[(2'h3):(2'h2)] ? $signed(wire19) : wire15));
    end
  assign wire22 = (8'hb0);
endmodule
