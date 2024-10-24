module top
#(parameter param143 = (+(({((7'h44) >> (8'ha4)), (~&(8'hbe))} != (~|((8'hba) ? (8'ha0) : (8'hb7)))) ? (({(8'hb0)} >= {(8'hb4)}) ? (-((8'hab) ? (8'haf) : (7'h41))) : (!((8'hb0) ? (8'hab) : (8'h9d)))) : (((~^(8'hb4)) + (^(8'h9f))) ? (~((8'hb7) > (8'ha1))) : ((7'h40) <= ((8'hbd) ? (8'h9c) : (8'ha4)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire142;
  wire signed [(4'h9):(1'h0)] wire141;
  wire signed [(4'h9):(1'h0)] wire140;
  wire signed [(4'hc):(1'h0)] wire139;
  wire signed [(4'hc):(1'h0)] wire136;
  wire signed [(5'h13):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire134;
  wire signed [(4'hd):(1'h0)] wire110;
  wire [(4'h8):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg133 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg114 = (1'h0);
  reg [(4'hf):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(4'h8):(1'h0)] reg111 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire136,
                 wire135,
                 wire134,
                 wire110,
                 wire109,
                 wire107,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg138,
                 reg137,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
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
  assign wire5 = wire1;
  assign wire6 = {$signed((~^$signed($signed(wire3)))),
                     (($unsigned((wire4 || wire4)) ^~ $signed(wire4)) << ($unsigned(wire1) ?
                         $signed((wire5 - wire3)) : $signed($unsigned(wire5))))};
  assign wire7 = $signed($signed(wire6));
  assign wire8 = $signed(wire3);
  assign wire9 = wire7;
  module10 #() modinst108 (wire107, clk, wire8, wire1, wire0, wire4);
  assign wire109 = $unsigned({(-wire2), wire4[(3'h6):(2'h3)]});
  assign wire110 = ($unsigned($unsigned(wire9)) || wire0);
  always
    @(posedge clk) begin
      reg111 <= (-wire5[(3'h4):(2'h2)]);
      if ((&{(~^(wire8 || {wire3}))}))
        begin
          reg112 <= {(~wire0)};
          reg113 <= $unsigned($signed(wire1[(2'h3):(2'h3)]));
          reg114 <= (wire8[(4'ha):(3'h7)] ?
              wire0[(3'h5):(2'h2)] : wire110[(4'hd):(4'hd)]);
          if (wire109)
            begin
              reg115 <= $signed({$unsigned($unsigned((wire7 ?
                      wire5 : wire2)))});
              reg116 <= reg113[(4'he):(4'he)];
            end
          else
            begin
              reg115 <= $unsigned(({wire3[(4'hd):(2'h3)]} > wire4[(3'h5):(3'h4)]));
            end
          if ((~^$unsigned($signed(((wire110 ?
              reg111 : wire1) <= (wire9 ^~ (8'hb5)))))))
            begin
              reg117 <= (wire9 & $signed($unsigned({(wire8 ?
                      reg113 : (8'ha8))})));
              reg118 <= {$signed($unsigned(wire7)),
                  ((8'hb1) || reg112[(1'h1):(1'h1)])};
              reg119 <= $unsigned((-$unsigned({(wire110 >= reg112),
                  ((8'ha8) ? wire1 : wire5)})));
              reg120 <= {(!((wire8[(3'h6):(3'h6)] ~^ $unsigned(wire2)) && reg111)),
                  reg119};
              reg121 <= reg116[(1'h1):(1'h1)];
            end
          else
            begin
              reg117 <= $unsigned((+$unsigned(wire5)));
            end
        end
      else
        begin
          reg112 <= (~^$unsigned($unsigned((~(^~(8'hb7))))));
          reg113 <= (~|(((^{wire7, (8'hb4)}) ?
              reg114 : ((reg119 ? reg113 : (7'h40)) ?
                  ((8'ha6) >> wire109) : {wire107,
                      wire1})) || $signed((wire110 ?
              (reg116 >> wire107) : {(8'haa)}))));
          reg114 <= $unsigned((|$unsigned(({(8'hac)} >>> $signed(reg115)))));
        end
      reg122 <= (wire0[(2'h2):(1'h1)] != $unsigned(((wire109 <= $signed((8'ha2))) ?
          (wire3[(4'he):(4'h9)] ?
              {(7'h42)} : {wire107, reg111}) : reg118[(4'ha):(2'h2)])));
      reg123 <= reg117[(4'h8):(3'h7)];
      if ((reg114[(1'h0):(1'h0)] < $signed((((&wire8) ?
              (reg117 ? (8'h9f) : wire3) : $signed(wire0)) ?
          $signed($signed(wire6)) : reg117[(3'h5):(2'h3)]))))
        begin
          if ($unsigned({reg119}))
            begin
              reg124 <= $unsigned(reg117);
              reg125 <= $unsigned($signed((8'h9d)));
              reg126 <= wire4;
              reg127 <= reg116;
            end
          else
            begin
              reg124 <= (reg117 != {$signed((~^{wire2})),
                  $signed({$signed(reg116), (!reg122)})});
            end
        end
      else
        begin
          reg124 <= ((8'hbd) <<< (&((reg111 != reg127) ?
              reg126 : $signed($unsigned((8'ha5))))));
          if ($signed((reg120 ? wire1[(4'h8):(1'h1)] : $signed(reg116))))
            begin
              reg125 <= reg119;
              reg126 <= $unsigned($unsigned(wire2[(1'h0):(1'h0)]));
            end
          else
            begin
              reg125 <= (!wire1[(3'h5):(3'h4)]);
              reg126 <= (+$signed(($unsigned((8'hb9)) < ((~^reg113) > (reg120 - wire2)))));
              reg127 <= reg125[(1'h1):(1'h0)];
              reg128 <= $signed(((~|$signed($unsigned(reg111))) ?
                  $signed((^~(7'h40))) : $signed($unsigned((+reg112)))));
              reg129 <= (~&$signed(($unsigned((~reg115)) ?
                  ($unsigned(wire6) + {reg120,
                      reg125}) : $signed(reg121[(3'h6):(2'h3)]))));
            end
          reg130 <= {reg121};
          reg131 <= {$signed(reg121)};
          reg132 <= (reg126[(3'h7):(2'h3)] >>> reg125[(1'h0):(1'h0)]);
        end
    end
  always
    @(posedge clk) begin
      reg133 <= ($signed($unsigned((&(&reg129)))) <= wire6);
    end
  assign wire134 = (^~$unsigned((8'hbd)));
  assign wire135 = reg111;
  assign wire136 = (7'h42);
  always
    @(posedge clk) begin
      reg137 <= reg119[(1'h1):(1'h1)];
      reg138 <= ($unsigned(wire110) ?
          reg121[(4'h8):(2'h2)] : wire107[(1'h1):(1'h0)]);
    end
  assign wire139 = (wire2 ? $unsigned((reg131 <= (&reg128))) : wire7);
  assign wire140 = $unsigned((wire0 ^ (((~wire3) ?
                           $unsigned(reg126) : (~|wire3)) ?
                       (^(wire5 ? (8'hbc) : reg115)) : $unsigned((reg129 ?
                           wire9 : wire7)))));
  assign wire141 = (8'hb5);
  assign wire142 = $signed($unsigned($unsigned(reg133[(4'h8):(4'h8)])));
endmodule

module module10
#(parameter param105 = (^((!(-((8'ha0) >>> (8'hb0)))) >> {(((8'ha9) > (8'ha6)) >> {(8'haa)})})), 
parameter param106 = {(!{param105, {{param105, param105}}}), (~|(~&(~|(param105 ? (8'hac) : param105))))})
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h193):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire104;
  wire [(4'h8):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire102;
  wire [(5'h10):(1'h0)] wire101;
  wire [(5'h15):(1'h0)] wire100;
  wire signed [(4'ha):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire69;
  reg [(4'hb):(1'h0)] reg99 = (1'h0);
  reg [(5'h13):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(4'he):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(3'h5):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(3'h7):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg73 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire72,
                 wire71,
                 wire69,
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
                 reg73,
                 (1'h0)};
  module15 #() modinst70 (.wire16((8'h9e)), .y(wire69), .wire17(wire13), .clk(clk), .wire18(wire14), .wire19(wire11), .wire20(wire12));
  assign wire71 = $signed(({((wire69 ^ wire13) ?
                          (~&wire13) : wire12[(1'h0):(1'h0)])} & ($signed((~^wire14)) > ((|wire11) > $signed(wire14)))));
  assign wire72 = wire71;
  always
    @(posedge clk) begin
      if (((+(+($unsigned(wire11) - (wire69 ? wire11 : wire69)))) ?
          $signed((($signed(wire14) ^ $signed(wire69)) ?
              $unsigned((wire13 >>> (8'hb3))) : wire14[(4'hc):(3'h6)])) : ($signed($signed(((8'hac) > wire14))) ?
              $unsigned((wire12[(4'h9):(2'h3)] ?
                  {wire12,
                      wire13} : $unsigned(wire14))) : (~|wire72[(4'h9):(3'h7)]))))
        begin
          reg73 <= wire69[(2'h3):(1'h0)];
          reg74 <= $unsigned(wire13);
          reg75 <= ($unsigned(wire14) ?
              (+(-{(~&reg74), $unsigned(wire72)})) : (wire12 != (8'h9c)));
          reg76 <= wire13;
        end
      else
        begin
          reg73 <= ($unsigned(((&wire12[(4'ha):(3'h7)]) ?
              wire13[(3'h6):(1'h1)] : reg73)) & wire72);
          reg74 <= ((&$signed((~|reg75))) ?
              $unsigned($signed(wire69[(1'h1):(1'h1)])) : reg76[(4'h8):(1'h0)]);
          reg75 <= wire14;
          reg76 <= $unsigned($signed($unsigned(wire12)));
        end
      reg77 <= wire13[(4'h8):(4'h8)];
      reg78 <= reg74;
      if (((((reg77 ~^ reg74) & {$signed((8'ha7))}) ?
          wire72[(3'h7):(3'h7)] : $unsigned(((reg74 ~^ wire72) ?
              reg75[(1'h1):(1'h1)] : wire13))) ~^ (wire72[(3'h6):(1'h0)] ?
          wire12 : $signed(({wire71, (8'hb5)} | $unsigned((8'had)))))))
        begin
          if (($signed((wire11 ?
                  ((+wire14) == (+wire69)) : $unsigned($signed(wire13)))) ?
              wire13 : (($signed(reg76[(4'hb):(2'h2)]) || (^(^~reg73))) & ($unsigned(wire71[(4'h9):(1'h0)]) & {{wire11,
                      wire71},
                  wire72}))))
            begin
              reg79 <= reg78;
              reg80 <= wire12;
              reg81 <= ($signed($unsigned((^~reg79))) <<< reg76);
              reg82 <= wire69[(3'h4):(1'h0)];
              reg83 <= ((reg80 ~^ $signed((|$unsigned(wire11)))) ?
                  (8'hbf) : ({((reg74 ? (8'ha3) : reg75) << (wire71 || wire11)),
                          (~|(reg74 ? wire69 : reg75))} ?
                      ((wire14 ?
                              (wire13 ?
                                  reg81 : wire14) : reg82[(4'he):(4'h8)]) ?
                          reg82 : wire69) : (wire12 ? reg82 : reg75)));
            end
          else
            begin
              reg79 <= $signed((&reg82[(5'h11):(3'h5)]));
            end
          if ({$unsigned((~({reg79, (8'ha6)} ? (+reg82) : $signed((8'had)))))})
            begin
              reg84 <= $signed((|reg79[(3'h7):(3'h4)]));
            end
          else
            begin
              reg84 <= {reg79[(4'ha):(2'h3)], $signed(reg82[(3'h5):(1'h1)])};
            end
          if ((~&(~wire12)))
            begin
              reg85 <= $signed({($signed($signed(wire12)) ?
                      (8'hbe) : $unsigned(reg78[(4'ha):(3'h5)])),
                  (reg79[(3'h5):(3'h4)] ?
                      (reg77 ?
                          $unsigned(reg76) : (wire14 ~^ wire69)) : $signed(reg75))});
            end
          else
            begin
              reg85 <= (|({reg81[(3'h4):(1'h0)]} ?
                  ($unsigned((reg77 + wire71)) | {{reg76,
                          wire69}}) : ((~$unsigned(wire71)) ?
                      {((8'hb1) || wire11),
                          $signed((8'hb0))} : ($signed(reg77) ?
                          reg83[(3'h7):(3'h5)] : (reg80 ? reg73 : reg82)))));
            end
        end
      else
        begin
          reg79 <= (reg81[(1'h0):(1'h0)] ?
              (wire13 ~^ $unsigned({(~|wire71)})) : (+({(^~reg85)} ?
                  (reg78 << (!reg81)) : reg81)));
          reg80 <= {((|$signed(((8'ha8) ?
                  reg73 : reg76))) << reg85[(4'ha):(1'h1)]),
              reg81};
          reg81 <= (~&(&($unsigned((~&wire14)) ?
              ((wire71 ? reg83 : reg85) ?
                  (^(8'hb2)) : wire69) : (reg85[(4'h8):(3'h4)] & $unsigned((7'h40))))));
          if ($unsigned(reg84))
            begin
              reg82 <= $unsigned($unsigned($signed(((wire14 ?
                  reg84 : reg81) & ((8'ha4) || (8'hb9))))));
              reg83 <= reg79[(1'h1):(1'h0)];
              reg84 <= (|$unsigned($unsigned(wire14)));
            end
          else
            begin
              reg82 <= (^~$signed((&(|(&reg81)))));
              reg83 <= $unsigned(reg75[(3'h7):(3'h7)]);
              reg84 <= reg81;
              reg85 <= wire69[(3'h5):(3'h4)];
              reg86 <= (!$unsigned(reg81[(1'h0):(1'h0)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg87 <= $signed(($unsigned((^~(wire13 ? reg84 : reg83))) ?
          (&$signed({wire12, (8'haf)})) : (8'hb2)));
      if ((reg74[(2'h2):(2'h2)] ?
          $signed(((((8'h9f) ? wire69 : reg80) ?
              (reg78 ?
                  reg86 : reg78) : $unsigned(wire72)) * reg85)) : $unsigned((reg80[(1'h0):(1'h0)] >> reg85))))
        begin
          if ($signed(($signed((~$signed(reg80))) ?
              ($signed({reg75}) ?
                  $unsigned((^~reg75)) : reg87) : ($unsigned($signed(reg86)) ~^ $unsigned(reg80)))))
            begin
              reg88 <= $unsigned(reg80);
              reg89 <= $signed((~^$signed((7'h41))));
              reg90 <= ((!((|$signed((8'hbf))) ?
                  reg77 : reg80)) != $unsigned($signed(reg78[(2'h2):(1'h0)])));
              reg91 <= {$unsigned((((|reg73) ?
                          $signed(reg79) : (wire72 ~^ wire11)) ?
                      (~&wire12[(1'h1):(1'h1)]) : $unsigned(reg80[(1'h1):(1'h0)]))),
                  ($unsigned(wire13[(3'h4):(1'h1)]) && ($unsigned((~^wire12)) ?
                      ($unsigned(wire14) > $unsigned(wire14)) : ($unsigned(wire71) ?
                          ((8'ha3) ? reg81 : reg90) : (~reg85))))};
            end
          else
            begin
              reg88 <= wire72;
              reg89 <= reg76[(4'ha):(3'h5)];
              reg90 <= reg86;
              reg91 <= $unsigned(((~^wire13) ?
                  reg74[(1'h0):(1'h0)] : reg76[(2'h3):(2'h3)]));
              reg92 <= {(-wire14[(2'h3):(2'h3)])};
            end
          reg93 <= (reg78[(3'h4):(1'h0)] ^~ reg78[(1'h0):(1'h0)]);
          reg94 <= reg89;
          reg95 <= ((~^(|reg89)) > (7'h42));
          reg96 <= reg89;
        end
      else
        begin
          if (wire13)
            begin
              reg88 <= $signed(((~wire72) > (|($signed(reg80) ?
                  (reg93 ? (8'hb7) : reg77) : (reg83 ? reg80 : reg76)))));
              reg89 <= (&(^(8'haa)));
              reg90 <= reg82[(4'h8):(2'h2)];
              reg91 <= wire12;
              reg92 <= $unsigned((^($signed((wire72 ?
                  reg79 : reg95)) <= reg80[(3'h4):(1'h0)])));
            end
          else
            begin
              reg88 <= $unsigned((($signed($signed(reg92)) == reg81[(3'h5):(3'h5)]) ?
                  $unsigned($signed($unsigned(wire71))) : $signed((((8'had) ?
                          reg86 : reg90) ?
                      {wire11, (7'h41)} : reg82))));
              reg89 <= (reg77[(4'h8):(4'h8)] >= $unsigned(($unsigned(reg95) ?
                  ((~^wire11) ? {wire72} : (|reg77)) : reg91[(1'h0):(1'h0)])));
              reg90 <= (!$unsigned((((+(8'hb3)) ~^ (reg83 ?
                  reg85 : reg76)) >> reg75[(3'h4):(2'h3)])));
            end
          reg93 <= reg75[(3'h4):(2'h3)];
          reg94 <= reg89[(1'h1):(1'h1)];
        end
      reg97 <= reg93;
      reg98 <= (~^(8'ha8));
      reg99 <= (!$unsigned($signed(reg88[(2'h3):(2'h3)])));
    end
  assign wire100 = (~^reg91);
  assign wire101 = ($unsigned((^$unsigned((8'hae)))) ?
                       (!$signed(reg94[(3'h5):(2'h3)])) : (wire13[(1'h1):(1'h1)] >= ($signed($signed(reg91)) ?
                           wire100 : ((wire100 ? reg84 : reg94) ?
                               $signed(reg93) : reg75))));
  assign wire102 = (~((reg77[(4'h8):(1'h1)] ?
                       reg90 : ((^reg96) ?
                           reg79[(4'h8):(4'h8)] : $unsigned((8'hb8)))) + reg89));
  assign wire103 = (8'h9d);
  assign wire104 = reg89;
endmodule

module module15
#(parameter param68 = {(8'hb3)})
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h226):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  input wire signed [(3'h7):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  wire [(4'he):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hb):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  assign y = {wire67,
                 wire49,
                 wire43,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
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
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire21 = (~^(^wire16));
  assign wire22 = $signed($signed((wire20[(3'h7):(3'h6)] ?
                      (wire18 > wire21) : wire21)));
  assign wire23 = (^~(wire16[(2'h3):(2'h2)] ?
                      ((~|$unsigned((8'hb5))) ?
                          $unsigned($signed(wire16)) : wire17) : wire19));
  assign wire24 = (~wire21[(2'h2):(1'h0)]);
  assign wire25 = $unsigned(wire18[(2'h3):(1'h0)]);
  assign wire26 = {(wire24 ?
                          $unsigned(wire24) : (((~|wire16) ?
                              $unsigned(wire19) : wire25) * ((wire20 ?
                                  wire18 : (8'hba)) ?
                              $unsigned(wire18) : (wire20 > wire16))))};
  assign wire27 = wire22;
  assign wire28 = (wire18 ? wire19[(1'h1):(1'h1)] : wire20);
  assign wire29 = (^~$unsigned($signed(($signed(wire26) ?
                      $signed(wire21) : $signed(wire17)))));
  always
    @(posedge clk) begin
      reg30 <= ({wire24[(3'h5):(3'h5)]} ~^ {$signed($unsigned({wire17,
              (8'hae)}))});
      if (wire24[(4'h9):(3'h6)])
        begin
          if ((((^~wire19) ?
                  $signed($unsigned(wire18)) : ($unsigned($signed((8'hba))) || wire20)) ?
              $signed(({$signed(wire29)} != reg30)) : {($unsigned(wire25[(4'h8):(2'h2)]) > (^{(8'hb4)})),
                  reg30[(3'h4):(2'h3)]}))
            begin
              reg31 <= wire18;
            end
          else
            begin
              reg31 <= reg30[(1'h0):(1'h0)];
              reg32 <= $unsigned(reg31);
              reg33 <= $unsigned($unsigned((+reg30[(1'h0):(1'h0)])));
            end
          reg34 <= wire20;
        end
      else
        begin
          if ({(reg32 ~^ reg33)})
            begin
              reg31 <= $signed(wire21);
              reg32 <= ((|$unsigned(((wire19 | wire18) << (-(7'h41))))) ?
                  $unsigned(((~|{reg33, wire27}) ?
                      ($unsigned((8'ha3)) >>> ((8'h9d) ?
                          (8'hb5) : wire29)) : $signed((wire18 <= wire29)))) : (wire25 == (~wire26[(1'h0):(1'h0)])));
            end
          else
            begin
              reg31 <= reg34[(4'h8):(1'h1)];
            end
          reg33 <= $signed(wire18);
        end
      reg35 <= wire16[(3'h7):(2'h3)];
      reg36 <= $signed((^wire19[(2'h2):(2'h2)]));
      if (wire16[(3'h5):(2'h2)])
        begin
          reg37 <= ({wire22[(4'h8):(2'h3)]} >>> $signed($unsigned($signed(wire26[(3'h4):(2'h2)]))));
          reg38 <= $signed(($unsigned(wire22[(1'h1):(1'h1)]) <<< $signed($unsigned(wire16))));
        end
      else
        begin
          if (($signed(wire21) * reg35[(5'h15):(5'h15)]))
            begin
              reg37 <= $unsigned(reg33[(4'ha):(2'h3)]);
              reg38 <= $unsigned(((|({(7'h40), reg37} ?
                  wire28[(1'h1):(1'h0)] : (reg37 <<< reg37))) >> $signed({reg35[(4'h9):(2'h2)],
                  reg37})));
            end
          else
            begin
              reg37 <= (~&(wire23[(4'h8):(3'h6)] <<< reg37[(1'h1):(1'h0)]));
              reg38 <= wire29;
              reg39 <= (~^(wire29 ? wire21 : (~(8'haf))));
              reg40 <= $signed($unsigned($signed(wire19)));
            end
          reg41 <= (&{$signed((!((8'hab) ? reg38 : (8'hbc))))});
          reg42 <= reg32[(1'h1):(1'h0)];
        end
    end
  assign wire43 = $signed(reg39[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire21)
        begin
          if (((~^reg39[(4'h8):(4'h8)]) + $unsigned((&$signed(wire26)))))
            begin
              reg44 <= (&(reg30[(2'h2):(1'h0)] ^~ ((+$signed(wire20)) * (&{wire23}))));
              reg45 <= ($unsigned($signed(reg34)) ?
                  {((wire26 ? $unsigned(wire27) : (-wire20)) ?
                          $unsigned((reg38 ?
                              wire25 : reg42)) : $unsigned(reg37))} : wire29);
              reg46 <= $unsigned(reg32[(3'h7):(2'h3)]);
              reg47 <= (($unsigned((&(reg38 << reg33))) >= $unsigned((~^(wire21 != reg40)))) >= ((~(|$signed(wire23))) ?
                  $signed({(wire17 < reg35),
                      reg31[(4'hb):(4'h9)]}) : reg42[(4'hd):(3'h4)]));
            end
          else
            begin
              reg44 <= ($unsigned((^$signed((reg41 > reg37)))) ?
                  (^{((~&wire16) && reg47)}) : $signed((((^reg31) - (reg38 ?
                          reg31 : wire20)) ?
                      (|(~^(8'ha3))) : $signed((~^wire16)))));
              reg45 <= reg47[(3'h5):(2'h3)];
            end
          reg48 <= $unsigned($signed(wire22));
        end
      else
        begin
          reg44 <= ((wire17[(1'h1):(1'h0)] ?
                  (~|reg35[(5'h14):(1'h1)]) : reg32) ?
              $unsigned(wire28) : (8'hb7));
          reg45 <= {(+reg42), reg37};
        end
    end
  assign wire49 = (((~&($signed(reg32) > $unsigned(wire23))) ?
                          ($signed((&wire27)) == wire29) : $unsigned((+(~|reg40)))) ?
                      (wire43 < reg48) : ($signed((~^(-wire17))) ?
                          reg44 : (reg45 ?
                              {$unsigned((8'ha9))} : $unsigned(wire43))));
  always
    @(posedge clk) begin
      if (({reg40} ? reg33 : (^$signed((|(~reg34))))))
        begin
          reg50 <= $unsigned($unsigned((~^({wire18, reg36} ?
              {reg37} : (|reg33)))));
          reg51 <= wire24[(1'h0):(1'h0)];
          reg52 <= {(~&(($unsigned(reg36) ?
                  (wire20 ?
                      wire19 : (8'h9d)) : wire25[(2'h3):(2'h3)]) >= $signed((reg35 * wire26)))),
              (($signed((+wire22)) ?
                  reg34[(4'h9):(4'h9)] : ((|wire24) ?
                      (reg31 ?
                          wire29 : reg50) : (wire16 << wire18))) >>> reg44)};
        end
      else
        begin
          reg50 <= wire24;
          if ((reg35 ?
              ($signed((~(&wire20))) < $signed($signed($unsigned(reg48)))) : ((($unsigned(reg52) ?
                      (&reg50) : (|reg40)) >= $unsigned((reg41 ^ reg51))) ?
                  {reg36[(3'h6):(2'h2)]} : $unsigned(reg50))))
            begin
              reg51 <= reg42;
            end
          else
            begin
              reg51 <= ((((+(8'hbd)) ?
                  wire19[(2'h2):(1'h0)] : (reg37[(3'h7):(1'h1)] ?
                      reg30 : (reg41 ?
                          reg31 : (8'hbb)))) | (~|$unsigned($unsigned(wire18)))) - $signed(reg41[(3'h4):(2'h2)]));
              reg52 <= (|reg37);
              reg53 <= ($signed(wire27) * (($signed((|reg34)) ?
                  (8'hb7) : ($signed(wire17) ?
                      $unsigned(reg32) : $signed(reg42))) + $signed(reg50)));
              reg54 <= ((reg38[(4'hb):(4'hb)] + wire20) <= ((reg35 ?
                  {(~^(8'hb5))} : {reg37[(4'h8):(3'h6)]}) << ($unsigned((reg36 ?
                      wire49 : wire25)) ?
                  $signed(reg40[(2'h2):(2'h2)]) : ($unsigned(reg40) ?
                      (wire43 || wire26) : (reg42 > reg52)))));
            end
          reg55 <= $unsigned((wire23[(1'h1):(1'h0)] ?
              (^wire16[(1'h1):(1'h1)]) : $unsigned($signed((reg31 ^ reg37)))));
          if ($unsigned($unsigned($unsigned($unsigned(wire26)))))
            begin
              reg56 <= reg39;
            end
          else
            begin
              reg56 <= $unsigned((8'haf));
              reg57 <= (((($signed(wire19) ?
                              $signed(reg30) : $signed((8'hb9))) ?
                          $unsigned((reg44 ^~ reg35)) : wire24[(4'hc):(2'h2)]) ?
                      (&reg50) : reg48) ?
                  (wire17[(1'h0):(1'h0)] <= $signed((&$signed(wire25)))) : (&reg45));
              reg58 <= {$unsigned((~(wire26[(3'h5):(2'h3)] == (reg33 ?
                      reg50 : reg47))))};
              reg59 <= reg37[(4'h8):(4'h8)];
              reg60 <= ($unsigned({$unsigned(reg44),
                  ((wire25 <<< reg41) ?
                      (7'h41) : {reg42})}) != $signed((~&wire20)));
            end
        end
      reg61 <= ({$signed(reg32), wire28[(1'h0):(1'h0)]} ?
          reg33[(2'h3):(1'h1)] : {wire49[(1'h0):(1'h0)], reg40[(3'h4):(2'h3)]});
      if (reg48)
        begin
          reg62 <= $unsigned({wire16[(2'h2):(1'h0)]});
          if (wire18)
            begin
              reg63 <= $unsigned($signed({$signed($unsigned(reg35))}));
              reg64 <= reg41[(1'h1):(1'h0)];
              reg65 <= ((reg36 != (^(~$signed(reg39)))) < $signed((+$signed($signed((8'hb4))))));
            end
          else
            begin
              reg63 <= reg33;
              reg64 <= $unsigned(wire29);
              reg65 <= $signed((wire20[(3'h4):(3'h4)] & ((8'h9d) == {$signed((8'hbd)),
                  reg53})));
            end
        end
      else
        begin
          if ((|reg38[(4'hb):(3'h4)]))
            begin
              reg62 <= (wire26[(3'h6):(1'h0)] ?
                  reg54[(3'h4):(1'h1)] : (!{reg61}));
              reg63 <= (^wire24);
              reg64 <= (~reg33[(3'h5):(3'h4)]);
              reg65 <= $signed(((reg64[(1'h0):(1'h0)] | $signed(reg45)) < $signed({reg52})));
              reg66 <= ({(reg61 ?
                          $signed($signed(reg31)) : (reg32[(4'h8):(3'h4)] > {reg32}))} ?
                  (-reg34) : $unsigned((8'hbb)));
            end
          else
            begin
              reg62 <= (~$signed(((&(|reg65)) ?
                  $unsigned((wire20 || reg63)) : {(wire43 ?
                          reg52 : (8'hb6))})));
              reg63 <= wire26[(3'h4):(1'h0)];
              reg64 <= ((|(wire27 ?
                      (((8'hac) < reg54) ?
                          (^wire19) : (8'hae)) : $signed((reg31 + reg64)))) ?
                  (~&(((-reg62) >> (reg40 ?
                      (8'ha2) : reg57)) ~^ (+reg61[(1'h1):(1'h0)]))) : reg41);
              reg65 <= ((wire19 ?
                      (~$signed(((8'hb8) ^~ wire25))) : $signed(({reg53,
                          reg56} ^~ $unsigned((8'h9c))))) ?
                  (((wire16[(3'h4):(2'h3)] ?
                          (reg30 ? wire49 : (8'haf)) : $unsigned((8'hba))) ?
                      $signed(reg32) : {(reg64 ? wire27 : reg60),
                          (reg40 & (8'hbf))}) * (~^reg52[(4'he):(3'h6)])) : $signed(wire49[(2'h3):(1'h0)]));
              reg66 <= ((($unsigned((reg36 >> reg56)) ?
                  ((wire49 < wire22) <<< (reg33 >>> wire25)) : wire19) <= $signed((-$unsigned((8'ha9))))) ^ reg42);
            end
        end
    end
  assign wire67 = reg42;
endmodule
