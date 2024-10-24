module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire139;
  wire [(4'hf):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire137;
  reg [(5'h15):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  assign y = {wire139, wire5, wire137, reg141, reg140, (1'h0)};
  assign wire5 = $signed(wire3);
  module6 #() modinst138 (wire137, clk, wire2, wire5, wire1, wire0, wire4);
  assign wire139 = wire0[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg140 <= wire3[(3'h7):(1'h1)];
      reg141 <= (8'hbd);
    end
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h19e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(4'hf):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire95;
  wire signed [(2'h2):(1'h0)] wire135;
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(3'h7):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg104 = (1'h0);
  reg [(3'h4):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  assign y = {wire55,
                 wire57,
                 wire69,
                 wire71,
                 wire82,
                 wire95,
                 wire135,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 (1'h0)};
  module12 #() modinst56 (wire55, clk, wire10, wire7, wire8, wire9);
  assign wire57 = (8'hb3);
  module58 #() modinst70 (.y(wire69), .wire60(wire57), .wire62(wire55), .wire59(wire11), .wire61(wire7), .clk(clk));
  assign wire71 = wire55[(4'h9):(3'h5)];
  always
    @(posedge clk) begin
      if ($unsigned(($unsigned(wire8[(3'h5):(1'h1)]) * wire8[(3'h5):(1'h1)])))
        begin
          reg72 <= ((wire8[(4'hd):(4'h9)] >= ((8'hab) ?
                  $unsigned({wire9, wire7}) : $signed((+wire71)))) ?
              $signed(($unsigned((wire11 ?
                  wire11 : wire57)) >> wire9)) : $unsigned((~((-wire69) ?
                  $signed(wire71) : $unsigned(wire57)))));
          reg73 <= reg72[(4'hd):(4'h9)];
          if (wire10[(4'ha):(2'h3)])
            begin
              reg74 <= ($signed((((reg73 ^~ reg73) ?
                      wire9 : wire57[(3'h7):(3'h6)]) ~^ $unsigned(wire10))) ?
                  wire10 : {((+$signed(reg73)) | wire10)});
              reg75 <= $unsigned($unsigned((|$signed((wire69 & wire57)))));
              reg76 <= (wire11[(1'h1):(1'h1)] || {reg72[(5'h10):(4'hc)]});
              reg77 <= ($signed($unsigned({$signed(wire8),
                  (wire9 >> wire9)})) != $signed((~&(reg72[(5'h14):(3'h4)] ?
                  (~^reg73) : (wire71 > wire8)))));
              reg78 <= {{wire8}};
            end
          else
            begin
              reg74 <= wire71;
              reg75 <= (($unsigned((wire55[(4'ha):(2'h3)] ?
                          $unsigned(wire10) : (wire9 ? reg78 : (8'hb0)))) ?
                      reg72 : $signed(reg78)) ?
                  $signed((reg73[(4'hd):(4'hb)] <= $signed({wire7,
                      (8'h9e)}))) : $unsigned(((reg73[(3'h5):(1'h0)] ?
                          (-wire57) : (+reg76)) ?
                      $signed($signed(wire71)) : (reg75 ?
                          $unsigned(reg76) : (wire7 >= wire9)))));
              reg76 <= reg73[(4'hd):(1'h1)];
              reg77 <= $unsigned((&((reg76[(4'h9):(2'h3)] << wire10) < (~|$signed((8'ha7))))));
              reg78 <= (wire55 <= $unsigned(wire7[(5'h12):(3'h6)]));
            end
        end
      else
        begin
          if (reg72[(3'h4):(1'h0)])
            begin
              reg72 <= {$signed(reg77),
                  $unsigned($unsigned($unsigned($unsigned(wire7))))};
              reg73 <= $unsigned(($signed($signed((reg73 & reg74))) >= wire9[(1'h1):(1'h1)]));
              reg74 <= (((~(reg76 ? (&reg77) : (reg74 >= (7'h44)))) ?
                  ({$unsigned((8'haf))} + $unsigned($signed(reg72))) : wire69[(5'h13):(4'h9)]) - (-$unsigned($unsigned((~reg73)))));
              reg75 <= wire57[(1'h0):(1'h0)];
            end
          else
            begin
              reg72 <= (((reg72[(5'h11):(4'hb)] ?
                  wire11 : (^(-(8'hbe)))) >= (((|reg74) << (reg75 >>> (8'hba))) ~^ reg75[(4'h8):(1'h1)])) - (|wire71));
              reg73 <= wire9;
              reg74 <= reg75[(3'h7):(2'h3)];
            end
        end
      reg79 <= reg74;
      reg80 <= wire57[(4'hf):(4'h9)];
      reg81 <= (reg77 + $unsigned(wire71[(2'h2):(1'h1)]));
    end
  assign wire82 = $unsigned(reg78);
  module83 #() modinst96 (.wire87(reg76), .wire84(wire7), .wire86(reg81), .y(wire95), .wire85(wire11), .wire88(reg75), .clk(clk));
  always
    @(posedge clk) begin
      if ((reg80[(2'h3):(1'h1)] ?
          (+(reg73 ?
              ({wire95,
                  wire95} ^~ $unsigned(reg73)) : reg80[(3'h6):(2'h3)])) : $signed((($signed(reg80) ?
              reg78[(1'h1):(1'h0)] : (~&wire95)) ^ ((~&wire7) >>> (&reg74))))))
        begin
          reg97 <= ($unsigned($signed((wire9 ?
                  reg75[(5'h11):(4'he)] : (wire71 ? (8'hae) : wire7)))) ?
              $unsigned(((reg81 ?
                  (reg77 ?
                      wire7 : reg81) : wire57[(4'he):(1'h1)]) < $unsigned({reg72}))) : (8'hb1));
          if (reg72[(1'h0):(1'h0)])
            begin
              reg98 <= reg72;
            end
          else
            begin
              reg98 <= reg73[(5'h11):(4'hc)];
              reg99 <= $unsigned((((wire82 ?
                      (^~wire71) : wire55[(3'h7):(1'h0)]) ?
                  ((8'haa) ^~ (reg97 ?
                      (8'hbd) : wire10)) : $unsigned(wire71[(2'h2):(2'h2)])) && ($unsigned($signed(wire8)) ?
                  wire9 : (wire57 ?
                      ((8'hb1) ? wire55 : wire55) : $unsigned((8'ha1))))));
            end
          reg100 <= $unsigned($signed(wire9));
          reg101 <= (($unsigned((reg97[(1'h1):(1'h1)] != $signed((8'hbf)))) ?
                  (^~wire7) : ((^~$unsigned((8'hb3))) ? (^{reg97}) : (7'h43))) ?
              wire71[(1'h0):(1'h0)] : ($signed((8'hab)) <<< $signed({(wire7 ?
                      (8'haf) : wire11),
                  wire11})));
        end
      else
        begin
          reg97 <= ($unsigned($unsigned({$signed(wire69)})) ?
              (^~wire7[(4'h9):(4'h9)]) : (wire9[(2'h3):(2'h3)] ?
                  reg101 : ((~(reg80 & reg80)) ?
                      $signed((reg98 || reg80)) : ((|(7'h43)) <= (wire55 ?
                          (8'hb0) : wire7)))));
        end
      reg102 <= $unsigned((~&$unsigned(reg73)));
      if ((~&($signed($signed((reg72 ? wire82 : reg74))) ?
          ($signed((reg102 ? reg78 : (8'ha5))) ?
              reg100[(1'h0):(1'h0)] : $unsigned(wire69[(3'h7):(3'h5)])) : reg102[(4'hb):(4'hb)])))
        begin
          reg103 <= {wire55, reg74[(3'h5):(2'h2)]};
          reg104 <= $signed($unsigned({reg73, wire11}));
          if ((^~(~^{((reg79 + wire95) ? (+wire7) : ((8'h9d) ^ reg80))})))
            begin
              reg105 <= (~{($signed((reg76 ? wire71 : reg100)) ?
                      {(reg74 ?
                              (8'ha3) : wire9)} : (wire95 ^~ wire9[(3'h6):(1'h0)]))});
              reg106 <= ((!(+$signed((wire55 ? reg75 : (8'h9e))))) - wire82);
              reg107 <= ($signed($unsigned((&$unsigned(wire7)))) & reg80[(3'h7):(3'h5)]);
              reg108 <= $unsigned((wire55[(5'h12):(4'ha)] >= (~&{reg98})));
              reg109 <= ($unsigned(reg107) & ($unsigned(reg74) ?
                  ($unsigned($unsigned((8'had))) >> reg98) : (8'hbb)));
            end
          else
            begin
              reg105 <= $signed({{(&reg73[(2'h3):(1'h1)])},
                  ((wire7 ?
                      reg97[(1'h1):(1'h0)] : (wire82 ?
                          wire95 : wire7)) ^ wire82)});
              reg106 <= (|reg100);
              reg107 <= $unsigned(($unsigned((reg97 ?
                  wire95 : $unsigned(reg78))) | $signed(((^~reg103) ~^ {(8'ha4)}))));
              reg108 <= reg104[(3'h5):(2'h3)];
              reg109 <= $unsigned({((^~wire9) ?
                      $unsigned(reg107) : reg104[(1'h1):(1'h1)]),
                  {(((8'hbd) ? reg75 : reg78) && (8'h9d))}});
            end
        end
      else
        begin
          reg103 <= (reg97[(1'h0):(1'h0)] >= $unsigned((((wire69 ?
              wire69 : reg72) >>> (~&reg97)) == $unsigned((wire8 ?
              (8'haa) : wire9)))));
        end
    end
  always
    @(posedge clk) begin
      reg110 <= reg105[(1'h1):(1'h0)];
      reg111 <= $unsigned($unsigned($unsigned(wire95)));
      reg112 <= (wire7 + ($signed($unsigned(wire82)) >>> ({(^~reg105)} ?
          $unsigned((!reg108)) : (^~reg108))));
      reg113 <= $signed($unsigned($signed((7'h44))));
    end
  module114 #() modinst136 (.clk(clk), .wire118(reg81), .y(wire135), .wire117(reg107), .wire116(wire55), .wire115(reg79));
endmodule

module module114  (y, clk, wire118, wire117, wire116, wire115);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire118;
  input wire signed [(5'h13):(1'h0)] wire117;
  input wire [(3'h4):(1'h0)] wire116;
  input wire [(5'h11):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire [(4'hf):(1'h0)] wire132;
  wire [(3'h6):(1'h0)] wire131;
  wire signed [(5'h15):(1'h0)] wire130;
  wire [(2'h2):(1'h0)] wire129;
  wire signed [(4'h8):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire122;
  reg signed [(5'h15):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg119 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire123,
                 wire122,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg121,
                 reg120,
                 reg119,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg119 <= $unsigned($unsigned(((wire116[(1'h1):(1'h1)] ?
              $signed(wire116) : $unsigned((8'haf))) ?
          $unsigned((^wire116)) : {(~wire115)})));
    end
  always
    @(posedge clk) begin
      reg120 <= wire116;
      reg121 <= (wire115 ?
          (((((8'hb6) ? wire115 : wire116) ? reg120 : $unsigned(wire118)) ?
              reg119[(3'h6):(3'h5)] : (8'h9e)) != $unsigned((8'hb6))) : $signed((!$unsigned((wire116 - wire117)))));
    end
  assign wire122 = {reg119,
                       (reg119 ?
                           (($unsigned(reg121) ?
                               wire115[(2'h2):(1'h1)] : (wire117 ?
                                   reg119 : wire116)) || {(wire118 ~^ wire117),
                               (^(8'hb2))}) : $unsigned({$signed((8'haf)),
                               wire116}))};
  assign wire123 = ($signed((^~(wire116 >= (wire117 ?
                       reg119 : (8'hb0))))) != reg120);
  always
    @(posedge clk) begin
      reg124 <= (wire116 >= ((8'hbf) < {wire117[(2'h2):(2'h2)],
          (~$signed(wire115))}));
      reg125 <= wire123[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg126 <= {(^~reg125)};
      reg127 <= wire118[(3'h5):(3'h4)];
      reg128 <= $signed(reg126[(1'h0):(1'h0)]);
    end
  assign wire129 = $signed($signed((({reg128} != {(7'h44)}) - {(+reg125)})));
  assign wire130 = $unsigned($signed($signed(((!wire129) ?
                       wire123 : (wire123 ~^ reg126)))));
  assign wire131 = wire116;
  assign wire132 = (((-wire123) ?
                       $signed((~wire123)) : wire123[(1'h1):(1'h0)]) == ((((wire130 + wire118) ?
                           wire115[(4'he):(4'he)] : $signed(wire129)) || wire130) ?
                       {(reg124[(1'h0):(1'h0)] ?
                               $unsigned(wire123) : (~&wire115))} : reg125[(1'h1):(1'h0)]));
  assign wire133 = ($unsigned({$unsigned(reg124)}) > wire117);
  assign wire134 = wire117[(5'h11):(3'h7)];
endmodule

module module83  (y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire88;
  input wire [(3'h4):(1'h0)] wire87;
  input wire signed [(3'h7):(1'h0)] wire86;
  input wire signed [(4'hb):(1'h0)] wire85;
  input wire [(3'h6):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire94;
  wire signed [(5'h15):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire signed [(4'hb):(1'h0)] wire91;
  wire [(2'h2):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  assign y = {wire94, wire93, wire92, wire91, wire90, wire89, (1'h0)};
  assign wire89 = $unsigned(($unsigned(wire88[(1'h0):(1'h0)]) ?
                      {((|wire86) ? (wire85 != (8'had)) : $unsigned((8'hb2))),
                          ((~|wire84) ?
                              $unsigned((8'ha3)) : (wire85 ?
                                  wire84 : wire84))} : ((wire87[(1'h1):(1'h0)] <= wire86[(1'h0):(1'h0)]) ?
                          (-(8'hac)) : ((~&(8'hbe)) != $unsigned(wire84)))));
  assign wire90 = (wire85 ? wire85 : $unsigned(wire89));
  assign wire91 = wire90[(1'h0):(1'h0)];
  assign wire92 = $signed(({$signed(wire89[(4'hf):(4'hf)])} >>> {({wire87,
                          wire85} == $unsigned(wire91)),
                      ($signed((7'h42)) - (wire89 ? wire86 : wire88))}));
  assign wire93 = (^~wire84[(1'h0):(1'h0)]);
  assign wire94 = $signed((!wire92));
endmodule

module module58
#(parameter param67 = ((-((~|((8'hac) ? (8'hba) : (8'ha6))) ? ((8'h9d) ? ((8'hbf) ? (8'ha4) : (8'ha4)) : ((7'h43) >>> (8'ha7))) : ({(8'ha8), (8'hb1)} ? ((8'ha0) > (7'h43)) : ((8'haa) > (7'h40))))) ? (((^(8'h9e)) ^~ (((8'h9e) | (8'hbe)) != ((8'ha9) ? (7'h44) : (7'h44)))) - {(~^{(8'h9d), (8'ha3)})}) : (^~(~((^~(8'hb5)) ? ((8'hb7) || (8'h9c)) : ((8'ha4) ? (8'hb3) : (8'ha0)))))), 
parameter param68 = (param67 + {(param67 ? param67 : (7'h43))}))
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire62;
  input wire [(5'h11):(1'h0)] wire61;
  input wire signed [(4'hf):(1'h0)] wire60;
  input wire [(5'h11):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  assign y = {wire66, wire65, wire64, wire63, (1'h0)};
  assign wire63 = wire61;
  assign wire64 = {wire63[(2'h3):(2'h2)], $signed(wire63)};
  assign wire65 = ((wire61[(2'h2):(1'h1)] & $unsigned($unsigned((wire59 - wire62)))) ?
                      $unsigned((((8'hb2) ? $signed((8'haa)) : (!wire60)) ?
                          wire62[(4'hf):(3'h7)] : ((8'hb7) ?
                              $signed(wire62) : wire60))) : $signed(((-(wire63 ^ wire59)) ?
                          wire60[(3'h6):(2'h3)] : ($signed(wire59) ?
                              $unsigned((8'hba)) : wire61[(3'h7):(1'h1)]))));
  assign wire66 = {((~|wire64) ^~ (^$signed($signed(wire61)))),
                      (~|$signed(wire65[(3'h6):(2'h2)]))};
endmodule

module module12
#(parameter param53 = (^(-(((^~(8'h9d)) - ((7'h41) ? (8'ha9) : (8'hbd))) <<< ((7'h42) ? ((8'hb4) < (8'hb7)) : ((8'hb9) || (8'ha7)))))), 
parameter param54 = ({param53, {(param53 ^ param53), param53}} ? (!(param53 ? param53 : {(param53 > param53)})) : (^(~(param53 ? (-param53) : (param53 ? param53 : param53))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire16;
  input wire [(4'hc):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire [(4'ha):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire38;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(4'h8):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire35,
                 wire34,
                 wire18,
                 wire17,
                 reg52,
                 reg51,
                 reg50,
                 reg47,
                 reg37,
                 reg36,
                 reg33,
                 reg32,
                 reg31,
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
  assign wire17 = wire16[(1'h0):(1'h0)];
  assign wire18 = $signed((^~(((~|wire17) ? wire14 : wire14) ?
                      $signed((wire15 ?
                          wire17 : (8'hbc))) : ((wire13 < wire16) ?
                          (-wire13) : $signed(wire13)))));
  always
    @(posedge clk) begin
      reg19 <= ({wire17[(1'h0):(1'h0)],
          wire13[(4'hd):(1'h0)]} - {(wire15 ^~ {{wire15}})});
      if (wire18)
        begin
          reg20 <= ((((^{wire15, wire15}) * wire15) ?
              $unsigned(wire13) : (-wire16[(1'h1):(1'h0)])) + $signed((-((wire14 ?
              wire14 : wire15) >> $signed(wire18)))));
          reg21 <= $unsigned((wire16[(2'h2):(1'h0)] ?
              $signed(wire14[(1'h0):(1'h0)]) : wire14));
        end
      else
        begin
          if ({wire14, wire17})
            begin
              reg20 <= (wire17[(1'h0):(1'h0)] <<< ($unsigned($signed((reg19 ?
                      (8'haa) : reg20))) ?
                  wire13[(4'hb):(3'h5)] : (((&reg21) ^ (wire17 ?
                          wire18 : wire16)) ?
                      $unsigned((wire14 ?
                          wire17 : wire13)) : {$signed(wire15)})));
              reg21 <= ({(~&$signed(reg20[(3'h5):(2'h2)])),
                      $signed(reg19[(3'h5):(2'h2)])} ?
                  ($unsigned($unsigned(wire14[(1'h1):(1'h1)])) ?
                      (((&wire15) ?
                          (~^wire14) : ((8'hbb) >>> reg21)) ^ ((~^reg21) ~^ $unsigned(reg19))) : (({wire14} ?
                          wire18[(2'h2):(2'h2)] : $signed(reg19)) + reg21[(5'h10):(4'hb)])) : $unsigned(wire15));
              reg22 <= $signed({((((8'hb0) ?
                          wire14 : wire17) ~^ $unsigned(wire13)) ?
                      ($signed(wire18) < $signed(wire17)) : wire16[(1'h0):(1'h0)]),
                  reg21[(4'hb):(3'h6)]});
              reg23 <= (8'hb2);
            end
          else
            begin
              reg20 <= ($signed((^~$unsigned((8'hba)))) - (~&(($unsigned(reg21) ?
                  reg19 : $signed(reg23)) == (^$signed(wire14)))));
              reg21 <= wire16[(1'h0):(1'h0)];
              reg22 <= $unsigned($unsigned((reg23 ?
                  (|(wire17 ?
                      reg23 : wire14)) : ((reg22 > wire16) + $unsigned((8'ha5))))));
            end
          reg24 <= (|((wire16 | {{wire16},
              ((8'hbd) != reg19)}) <= $signed({reg21[(4'h8):(3'h4)],
              (8'h9f)})));
        end
      reg25 <= ((^$unsigned((^~{wire14, reg22}))) ?
          wire13 : ((((&(8'ha2)) ?
              wire16 : $signed((8'h9e))) <<< $unsigned((^~(8'had)))) >>> reg22));
      reg26 <= {(^(wire16 ^ ($unsigned(wire15) < (7'h42)))),
          $signed($signed($unsigned(wire16)))};
      if ($unsigned((reg23 ?
          (-$signed({(8'h9c)})) : $signed(wire18[(3'h5):(3'h5)]))))
        begin
          reg27 <= (({reg19[(4'h8):(3'h7)]} ?
                  {reg20, $signed(wire18)} : (((^~reg21) ?
                      (reg21 ? reg19 : (8'hae)) : {reg24,
                          wire16}) | $unsigned((reg20 ? reg25 : (8'hb9))))) ?
              {reg22, $unsigned((+reg22))} : reg21[(4'hd):(4'hb)]);
          reg28 <= $signed((reg27 - $signed({reg23})));
          reg29 <= (reg26[(4'h8):(3'h4)] ?
              reg21[(4'hc):(2'h3)] : (^reg19[(4'ha):(3'h4)]));
          if (wire16[(1'h0):(1'h0)])
            begin
              reg30 <= (^$signed((((reg26 ? wire14 : wire15) ?
                      {reg20, reg26} : (reg26 ? reg19 : (8'h9f))) ?
                  (reg21 ?
                      (reg26 << wire16) : reg24) : (reg24 < $unsigned(wire18)))));
              reg31 <= (($unsigned($unsigned(reg30)) ?
                  $signed($unsigned((-wire18))) : reg23[(4'h9):(4'h9)]) ^ wire14);
              reg32 <= reg19;
            end
          else
            begin
              reg30 <= reg24;
              reg31 <= $signed(((wire14[(4'ha):(3'h7)] ?
                      reg20[(4'hd):(2'h2)] : $signed($unsigned((8'ha1)))) ?
                  reg25 : reg26));
              reg32 <= {(|($signed(reg32[(2'h3):(1'h1)]) >= $signed($signed(reg19))))};
            end
          reg33 <= (&(($unsigned($signed((8'hae))) <= (^~$signed((8'ha2)))) ?
              ((wire17[(1'h1):(1'h0)] == (reg29 ?
                  (7'h43) : (8'ha4))) ~^ (^wire17)) : $signed(wire18)));
        end
      else
        begin
          reg27 <= wire13[(3'h6):(3'h4)];
          reg28 <= $signed($unsigned(wire14[(4'ha):(3'h7)]));
          reg29 <= (((~&(+$unsigned(wire18))) ?
              wire13[(3'h4):(3'h4)] : reg21[(4'h8):(4'h8)]) > reg28);
          reg30 <= $signed($unsigned(reg21[(1'h0):(1'h0)]));
        end
    end
  assign wire34 = reg26;
  assign wire35 = ((reg31[(1'h1):(1'h1)] ?
                          ((~^(wire14 ? reg25 : wire15)) ?
                              {wire16[(2'h2):(2'h2)]} : $signed($signed(wire13))) : ($unsigned((reg30 ?
                                  reg31 : (7'h43))) ?
                              wire18[(1'h1):(1'h1)] : $signed($unsigned(reg19)))) ?
                      $unsigned((({(8'ha5)} ?
                          (reg21 ?
                              reg19 : reg29) : $unsigned(reg21)) <<< $unsigned($signed(reg20)))) : $unsigned($unsigned(((+wire18) ?
                          {(8'hab)} : (^~wire17)))));
  always
    @(posedge clk) begin
      reg36 <= (($signed(($unsigned(reg29) ? reg23 : $unsigned(wire18))) ?
          $signed({(+wire35)}) : reg24) >>> reg26[(3'h4):(1'h1)]);
      reg37 <= ((wire16 ?
              ((~&$signed((8'hb5))) == ($unsigned(reg19) ?
                  $signed(reg22) : (-wire35))) : (~reg27)) ?
          $signed({((8'ha2) + (&wire13))}) : (reg31 ?
              reg20 : (&{((8'hb9) || wire18)})));
    end
  assign wire38 = reg19;
  assign wire39 = {((+$unsigned(reg28)) ?
                          wire17 : {((~&wire35) >> (!(7'h41))),
                              ($unsigned(reg19) >> reg20)}),
                      ({(~^(reg23 ? wire16 : reg23)),
                          reg32[(2'h2):(1'h1)]} & reg24)};
  assign wire40 = (reg30 ?
                      $unsigned(reg36[(4'ha):(1'h0)]) : (+$unsigned(reg32)));
  assign wire41 = reg20;
  assign wire42 = reg30;
  assign wire43 = ((reg21[(3'h4):(1'h1)] <= $signed(wire17[(1'h0):(1'h0)])) ?
                      (8'hb7) : ($unsigned(wire15[(1'h1):(1'h1)]) ?
                          (($unsigned(wire42) ?
                              {reg19, (8'hbc)} : reg24) >> ((~reg31) ?
                              wire39[(4'hd):(4'hc)] : $unsigned((8'hbb)))) : (^reg19[(4'hc):(4'h9)])));
  assign wire44 = reg20;
  assign wire45 = (^~{(wire39 <= $signed((~|wire34))),
                      ($unsigned($signed(reg31)) == wire34[(3'h6):(1'h1)])});
  assign wire46 = ((((&(wire39 ? reg28 : (8'hbf))) ?
                          $signed({(8'hab)}) : reg29) != (^~((wire13 << reg29) == $signed(wire14)))) ?
                      ($signed(wire45) ?
                          (8'hab) : reg23[(3'h7):(3'h4)]) : $signed(($unsigned((~(8'hb8))) ?
                          wire40[(1'h0):(1'h0)] : ((!reg25) <= (reg32 >= reg23)))));
  always
    @(posedge clk) begin
      reg47 <= (~^$unsigned($unsigned($signed((wire16 ? (8'hbc) : reg23)))));
    end
  assign wire48 = $signed($unsigned($unsigned((8'hb9))));
  assign wire49 = ((reg19[(4'hc):(3'h7)] ?
                          {reg24[(3'h6):(2'h2)],
                              wire16} : $signed($signed($unsigned((8'hb4))))) ?
                      wire35 : wire41);
  always
    @(posedge clk) begin
      reg50 <= $signed($unsigned({((~^wire44) ?
              (~&reg24) : reg30[(3'h4):(1'h0)])}));
      if ((~(((((8'hb9) | reg33) || $unsigned((8'ha0))) ~^ wire35[(1'h1):(1'h1)]) ?
          reg21 : ((((8'ha4) ? reg27 : wire17) >= ((8'hbe) ?
              wire16 : wire35)) - ({reg32, (8'hae)} ?
              wire45[(4'he):(4'hb)] : reg24[(2'h3):(1'h1)])))))
        begin
          reg51 <= {$unsigned($unsigned(reg37)), wire17};
          reg52 <= wire18[(2'h2):(1'h0)];
        end
      else
        begin
          reg51 <= (+{reg20});
          reg52 <= $unsigned(({reg27[(2'h3):(1'h1)]} == ($signed(wire46) ?
              $signed((~&reg27)) : ((~reg31) ? (7'h42) : (&reg31)))));
        end
    end
endmodule
