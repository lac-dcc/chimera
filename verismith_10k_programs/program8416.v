module top
#(parameter param127 = {(((~^((7'h40) > (8'hb3))) ? ((8'ha3) > (~&(8'hb0))) : (-(^~(7'h41)))) + (~(~((8'ha4) ? (8'ha7) : (8'haa)))))}, 
parameter param128 = (param127 ? (~param127) : param127))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire126;
  wire [(5'h14):(1'h0)] wire125;
  wire [(4'hf):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire123;
  assign y = {wire126, wire125, wire5, wire123, (1'h0)};
  assign wire5 = (wire0[(4'hc):(4'h8)] ?
                     $signed((({wire0, wire0} != (wire0 ?
                         wire2 : (8'hb4))) || wire2[(4'h9):(3'h7)])) : (((wire3[(4'hc):(4'h8)] ?
                                 wire0[(4'hc):(3'h4)] : {wire3}) ?
                             {(!wire1), wire2} : (8'hac)) ?
                         (wire2 ?
                             ($signed(wire1) ?
                                 $signed(wire2) : $signed((8'hbd))) : (wire0[(1'h1):(1'h1)] ^~ $unsigned(wire3))) : $unsigned(($signed(wire3) | $unsigned(wire4)))));
  module6 #() modinst124 (wire123, clk, wire4, wire0, wire1, wire5, wire2);
  assign wire125 = (((wire2[(3'h6):(3'h6)] >= wire1[(2'h2):(1'h0)]) > wire2[(4'he):(4'he)]) >> (~&($unsigned(wire4) ?
                       wire5 : wire1[(2'h3):(2'h3)])));
  assign wire126 = (+(wire2[(2'h3):(1'h0)] | $signed($unsigned($signed(wire4)))));
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h22d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire122;
  wire signed [(4'ha):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire42;
  wire [(3'h7):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire91;
  wire signed [(4'he):(1'h0)] wire120;
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(2'h2):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  assign y = {wire122,
                 wire71,
                 wire54,
                 wire53,
                 wire52,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire73,
                 wire91,
                 wire120,
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
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 (1'h0)};
  module12 #() modinst38 (.wire15(wire10), .wire13(wire9), .wire17(wire7), .y(wire37), .wire14(wire8), .clk(clk), .wire16(wire11));
  assign wire39 = $unsigned({(wire9[(3'h7):(1'h1)] ?
                          wire37[(2'h3):(2'h3)] : $unsigned($unsigned(wire10))),
                      (|wire9[(3'h5):(3'h4)])});
  assign wire40 = {wire9};
  assign wire41 = $signed(wire39);
  assign wire42 = (((!{(wire9 <<< wire41)}) ?
                      $signed($unsigned(wire11[(4'hb):(3'h7)])) : $unsigned($signed($signed((8'hb7))))) || ($signed(wire11[(4'h9):(4'h9)]) ?
                      (((~wire40) ? $unsigned(wire10) : (8'hb0)) ?
                          (wire39 ? wire10 : wire37) : ({wire11,
                              wire11} >> $unsigned(wire7))) : $unsigned({wire7})));
  always
    @(posedge clk) begin
      reg43 <= ((wire40 != wire41) ?
          $signed((&(^~$unsigned(wire9)))) : ((+((~&wire9) ?
              {wire39, (7'h44)} : (wire10 ? wire7 : wire8))) ^ (+wire37)));
      reg44 <= (wire40 & wire11[(3'h5):(1'h0)]);
      if (($unsigned((^(wire10[(3'h4):(2'h2)] ^~ ((8'ha0) <<< wire37)))) != (wire41[(3'h4):(1'h1)] > $signed(wire41[(1'h0):(1'h0)]))))
        begin
          reg45 <= (~wire8);
          if (wire11[(1'h0):(1'h0)])
            begin
              reg46 <= {(((~|reg44[(1'h1):(1'h0)]) >> (-(wire40 ?
                      (8'hac) : wire11))) && (+(+wire40[(3'h4):(1'h0)])))};
              reg47 <= (!$signed(wire37[(4'hb):(3'h7)]));
            end
          else
            begin
              reg46 <= (~&(-($unsigned((~&wire9)) ?
                  ((reg44 <= wire10) ?
                      (8'haf) : (wire11 <= wire40)) : ($unsigned(reg46) ?
                      $signed(wire11) : (8'hb7)))));
              reg47 <= wire7;
              reg48 <= (($unsigned((~^((8'h9d) > wire8))) ?
                  $unsigned(((~(7'h40)) > $signed(wire39))) : {(~^$signed(wire41))}) || (~|wire37));
              reg49 <= $unsigned({wire10[(1'h0):(1'h0)],
                  ((8'hb7) ?
                      (&(wire39 ? wire9 : reg44)) : wire41[(2'h3):(2'h2)])});
            end
          reg50 <= $unsigned(wire37[(2'h2):(1'h0)]);
        end
      else
        begin
          reg45 <= (~&{$signed(($signed(reg44) ?
                  $signed(wire9) : (reg45 && wire40)))});
        end
      reg51 <= $unsigned(wire37[(3'h7):(1'h1)]);
    end
  assign wire52 = {((($unsigned(wire39) && (wire9 ? wire40 : (8'ha2))) ?
                          (~wire8[(3'h4):(1'h1)]) : ((|wire41) > (wire37 ?
                              wire37 : wire8))) ^~ (8'hba)),
                      $signed((reg51[(3'h5):(2'h2)] ?
                          wire11[(4'he):(2'h2)] : $signed($unsigned(wire42))))};
  assign wire53 = wire52;
  assign wire54 = $signed({(^~$signed(wire8)), wire10[(4'ha):(3'h7)]});
  always
    @(posedge clk) begin
      reg55 <= wire52;
      reg56 <= $unsigned((~^$unsigned((8'hb6))));
      reg57 <= $signed(wire42[(4'hb):(3'h7)]);
      reg58 <= $unsigned((~({wire54[(1'h1):(1'h1)],
              (wire10 ? (7'h43) : reg43)} ?
          ((reg51 ? reg55 : (8'h9d)) >> wire9) : ((wire39 * wire7) ~^ reg47))));
    end
  module59 #() modinst72 (wire71, clk, wire10, reg57, wire37, wire7);
  assign wire73 = (($signed(wire9[(4'h9):(1'h1)]) < $unsigned((8'hb5))) * $unsigned({reg55[(4'hb):(4'h8)],
                      {wire9, (~|reg51)}}));
  always
    @(posedge clk) begin
      reg74 <= $unsigned((wire10[(4'hb):(1'h1)] ^ (wire53[(5'h14):(4'he)] ^~ (~|$unsigned(wire53)))));
    end
  always
    @(posedge clk) begin
      if ($unsigned((7'h43)))
        begin
          if ((8'ha4))
            begin
              reg75 <= wire39;
              reg76 <= (reg44 == wire9);
            end
          else
            begin
              reg75 <= ($unsigned((((reg58 - wire52) * (wire71 && reg44)) ~^ (~{reg55,
                  reg43}))) | (reg46 ?
                  wire41[(2'h2):(1'h0)] : $signed({$signed(wire8)})));
              reg76 <= ({$unsigned(wire41)} ?
                  ((&$signed((!reg47))) ^ (((reg48 != wire53) ?
                      (~&(8'ha6)) : (~|wire54)) <<< ($signed(reg45) ?
                      $unsigned(wire40) : (wire9 ? wire8 : reg75)))) : reg50);
              reg77 <= ($unsigned(((!wire71) & $unsigned((&wire11)))) <<< (wire9[(4'hb):(4'h8)] + wire40[(2'h2):(2'h2)]));
              reg78 <= $unsigned($signed(($signed($signed(wire71)) >> $unsigned((wire52 != reg45)))));
            end
          reg79 <= ($unsigned(wire73) ?
              reg76[(4'he):(3'h4)] : ($unsigned(((wire52 ?
                      wire54 : reg78) == ((8'hb6) ? reg74 : reg57))) ?
                  {{(reg47 & reg48), {wire73, reg58}}, reg55} : (~reg45)));
          if (((reg77 ?
                  $unsigned(reg78) : (reg75[(3'h7):(3'h5)] ?
                      $unsigned({(8'hb9), reg45}) : reg43[(1'h1):(1'h0)])) ?
              ((~^$unsigned(wire7)) + ($unsigned(reg74) ?
                  $unsigned($unsigned((8'ha5))) : $unsigned($signed(wire73)))) : (-reg46[(2'h3):(1'h1)])))
            begin
              reg80 <= ((~^($signed({wire42}) ? wire7 : reg50)) ?
                  (~&wire9) : {(((wire37 >>> reg79) ?
                          $unsigned(reg50) : (7'h41)) & (^$unsigned(wire52))),
                      $signed(reg77[(4'hb):(2'h3)])});
              reg81 <= {$unsigned((~($signed((8'hac)) || $signed(wire10)))),
                  reg56};
              reg82 <= $signed($signed($unsigned($signed((wire52 ?
                  reg79 : reg74)))));
              reg83 <= wire54;
              reg84 <= (^~(reg50 >> {((wire53 ? reg80 : reg49) ?
                      wire8 : (reg58 ? wire10 : reg57))}));
            end
          else
            begin
              reg80 <= {(7'h44), $signed(reg76[(3'h6):(3'h4)])};
            end
          reg85 <= wire10;
          reg86 <= (((^$unsigned(reg45[(3'h4):(1'h0)])) ^ (~&(~|(~|(8'hb0))))) <= wire40);
        end
      else
        begin
          if ($unsigned(wire41[(3'h7):(1'h0)]))
            begin
              reg75 <= reg48;
              reg76 <= $signed((wire8 ?
                  (((wire52 ? wire39 : reg49) ? wire9 : $unsigned(reg44)) ?
                      ((!wire8) & reg47[(2'h2):(2'h2)]) : ($signed(reg45) ?
                          {wire73, wire37} : (reg85 ?
                              (8'ha0) : (7'h44)))) : $signed(reg46)));
            end
          else
            begin
              reg75 <= $signed(wire41);
              reg76 <= ((~&reg82[(4'h8):(1'h1)]) ?
                  wire8[(4'ha):(3'h6)] : (+reg76));
            end
          reg77 <= (^reg75[(4'h8):(2'h3)]);
          reg78 <= $unsigned(((8'ha6) || $unsigned((8'ha8))));
        end
      reg87 <= ((^~(({(8'hb6), reg74} ?
              (reg77 ~^ reg48) : (~&reg76)) << (+(wire52 ?
              (8'ha0) : (8'ha3))))) ?
          reg58[(1'h0):(1'h0)] : reg75);
      reg88 <= $unsigned((wire39 ?
          (((reg87 ? reg55 : reg43) ?
              (reg87 ?
                  wire11 : reg77) : (~|reg76)) | wire42[(3'h5):(1'h0)]) : reg81));
      reg89 <= wire11;
      reg90 <= wire9[(4'hd):(4'h9)];
    end
  assign wire91 = (-reg58);
  module92 #() modinst121 (wire120, clk, reg88, reg44, reg55, reg85, wire52);
  assign wire122 = $unsigned((reg84[(2'h2):(1'h0)] ?
                       (~$signed(reg74[(3'h6):(3'h4)])) : reg87));
endmodule

module module92  (y, clk, wire97, wire96, wire95, wire94, wire93);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire97;
  input wire [(2'h3):(1'h0)] wire96;
  input wire signed [(5'h15):(1'h0)] wire95;
  input wire signed [(5'h15):(1'h0)] wire94;
  input wire [(4'hd):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire119;
  wire signed [(4'ha):(1'h0)] wire118;
  wire [(3'h6):(1'h0)] wire112;
  wire [(4'ha):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire signed [(2'h3):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire signed [(3'h6):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire112,
                 wire111,
                 wire110,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire98 = $signed(wire96[(2'h2):(2'h2)]);
  assign wire99 = ($signed($signed({{wire97,
                          (8'hab)}})) - (^(wire96 < $unsigned((wire96 ?
                      wire95 : wire96)))));
  assign wire100 = wire96[(1'h0):(1'h0)];
  assign wire101 = wire99[(4'hb):(1'h0)];
  assign wire102 = wire99[(4'hc):(1'h0)];
  assign wire103 = $signed($unsigned(wire94[(2'h2):(1'h1)]));
  assign wire104 = $unsigned(wire96);
  assign wire105 = $signed(($signed((~^{wire102, (8'hae)})) ?
                       {((wire101 ? (8'haf) : wire94) ? (^~wire102) : wire96),
                           {wire100[(4'hb):(1'h0)],
                               $unsigned((8'hb4))}} : (wire100 ?
                           $signed($unsigned(wire102)) : {(wire102 ~^ wire98)})));
  assign wire106 = ((((8'hbc) >> {(^~wire93)}) ?
                           $unsigned(wire98) : $signed(wire104[(1'h1):(1'h1)])) ?
                       ((|wire102[(3'h7):(3'h5)]) ^~ ((&wire101[(1'h1):(1'h1)]) ?
                           ($unsigned((7'h40)) <= (^wire103)) : wire103)) : ({(!wire93)} ~^ $signed($unsigned((wire96 ?
                           (8'ha3) : wire101)))));
  assign wire107 = $unsigned(({wire104[(3'h5):(3'h4)],
                       (wire103[(4'hb):(4'h9)] || (wire100 <<< (8'hb7)))} < ((|$unsigned((8'ha7))) ?
                       $unsigned((wire101 >= wire106)) : (+$signed(wire93)))));
  always
    @(posedge clk) begin
      reg108 <= $signed($unsigned($signed((wire96[(1'h1):(1'h0)] < (wire93 >>> wire103)))));
      reg109 <= wire103;
    end
  assign wire110 = {wire106[(3'h7):(3'h7)],
                       $signed($signed($unsigned($unsigned((8'hb3)))))};
  assign wire111 = (wire94 - ({wire98,
                       wire106[(4'ha):(3'h4)]} != wire97[(3'h5):(1'h1)]));
  assign wire112 = ($unsigned($unsigned($signed(wire104))) ?
                       wire107[(2'h3):(2'h3)] : (8'hbd));
  always
    @(posedge clk) begin
      reg113 <= (((wire99[(4'hb):(3'h4)] <= ($unsigned(wire106) & (wire99 < wire97))) <<< wire99) - (wire97[(3'h4):(2'h2)] ?
          reg108[(4'he):(3'h5)] : (|$signed($signed(reg109)))));
      reg114 <= (($unsigned($signed((~^wire103))) * $signed((8'hab))) << (^~$signed(({wire94} ?
          wire105[(1'h0):(1'h0)] : wire102))));
      reg115 <= $unsigned(((wire105[(3'h5):(2'h2)] || ((^wire111) ?
              (wire97 ? wire103 : wire95) : {wire103})) ?
          $signed($signed(reg108[(5'h13):(5'h13)])) : wire110));
      reg116 <= ({(((wire98 ? wire106 : wire111) ?
                      (wire93 || wire95) : $unsigned(reg113)) ?
                  $unsigned((^~wire99)) : ((wire105 ?
                      reg113 : reg109) <<< (+wire103)))} ?
          ($signed($signed((~&wire93))) << $signed({$unsigned(wire103),
              (wire102 ? (8'ha8) : (8'ha7))})) : (8'hb9));
      reg117 <= ($signed(((~|$signed(wire101)) + wire107)) ?
          (+(($signed(reg116) ? $unsigned(wire93) : {wire99, wire106}) ?
              ($signed(wire111) ?
                  $unsigned(wire96) : $signed(wire95)) : wire105[(1'h0):(1'h0)])) : $signed(({reg108} ^~ reg108)));
    end
  assign wire118 = (8'hbb);
  assign wire119 = wire99[(3'h4):(2'h3)];
endmodule

module module59
#(parameter param70 = (~|(~^{(~^(~|(8'hba)))})))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h2d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire63;
  input wire [(5'h12):(1'h0)] wire62;
  input wire [(5'h14):(1'h0)] wire61;
  input wire [(3'h6):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg66 = (1'h0);
  assign y = {wire69, wire68, wire65, wire64, reg67, reg66, (1'h0)};
  assign wire64 = ((wire62[(4'hc):(4'hc)] >= ($unsigned(wire60[(3'h5):(2'h2)]) << $unsigned(((7'h44) * wire63)))) ?
                      (~|{wire60,
                          ($unsigned(wire62) ?
                              wire61[(4'hd):(3'h4)] : wire63[(1'h1):(1'h1)])}) : wire62);
  assign wire65 = {(($signed((~(8'ha2))) ?
                              wire61 : ($unsigned(wire61) ?
                                  wire62 : (wire60 > (7'h42)))) ?
                          wire61 : (~^(wire61 && (wire64 ? wire64 : wire63)))),
                      $unsigned($unsigned(wire60))};
  always
    @(posedge clk) begin
      reg66 <= wire61[(4'h8):(3'h5)];
      reg67 <= $signed(($signed(reg66) ?
          (wire64 ?
              (8'hb8) : (wire65 ^~ {wire64})) : (wire61[(1'h0):(1'h0)] + $unsigned(wire60))));
    end
  assign wire68 = $signed($unsigned(wire61));
  assign wire69 = wire64;
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  assign y = {wire36,
                 wire35,
                 wire21,
                 wire20,
                 reg34,
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
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg18 <= (~&$signed((!{(-wire14)})));
          reg19 <= (~&wire14[(4'hc):(4'ha)]);
        end
      else
        begin
          reg18 <= $unsigned(($unsigned($signed(wire17[(3'h6):(1'h1)])) ?
              (&(~^(reg18 ? wire13 : (7'h44)))) : (!((wire17 ?
                      wire14 : wire17) ?
                  wire15 : wire14))));
        end
    end
  assign wire20 = reg19[(3'h7):(3'h5)];
  assign wire21 = $unsigned({(((reg18 ~^ wire20) ?
                          ((8'hb4) | (8'hb7)) : $signed(reg18)) < ((-reg18) ?
                          (wire17 ? wire13 : (7'h41)) : (|wire17)))});
  always
    @(posedge clk) begin
      if ($unsigned($signed((wire21 ?
          wire21 : ((wire13 ? wire14 : reg19) || $signed((8'hb6)))))))
        begin
          reg22 <= (^{((&(^~wire14)) << $unsigned(wire20[(2'h3):(1'h1)]))});
          reg23 <= (~&wire20);
        end
      else
        begin
          reg22 <= wire21;
        end
      if ({((~^$unsigned((|reg22))) >> wire20)})
        begin
          reg24 <= {$unsigned(wire20[(2'h3):(1'h1)])};
          if (($unsigned($signed({$signed(wire21)})) ^~ wire20))
            begin
              reg25 <= wire17[(3'h5):(2'h3)];
            end
          else
            begin
              reg25 <= $unsigned((^~$unsigned({(|reg18)})));
              reg26 <= wire13;
              reg27 <= (wire16 ?
                  $signed($unsigned((((8'h9d) >> (8'hb2)) ?
                      (|reg22) : $signed(wire17)))) : $unsigned(reg22[(3'h6):(3'h4)]));
              reg28 <= (^{(&wire20[(1'h1):(1'h1)]),
                  $signed((~|reg19[(2'h3):(1'h1)]))});
              reg29 <= $signed($unsigned((8'ha5)));
            end
        end
      else
        begin
          if ((({(reg26[(3'h7):(1'h1)] <<< $unsigned(reg25))} ?
                  ({reg25[(2'h2):(1'h1)],
                      (reg22 && reg19)} || $signed((~^wire20))) : $signed($unsigned({(8'hb0)}))) ?
              wire16[(3'h7):(2'h2)] : reg22))
            begin
              reg24 <= (^$unsigned(wire14));
              reg25 <= {$signed($signed((wire15[(4'hb):(2'h2)] >>> ((8'hab) >> reg26)))),
                  (~|(((reg28 ^~ (8'hac)) <<< (-reg27)) > reg28[(4'h9):(3'h4)]))};
              reg26 <= ($unsigned($signed($unsigned(wire20))) != {reg25[(4'hf):(3'h4)],
                  wire16[(4'h8):(2'h3)]});
            end
          else
            begin
              reg24 <= {(&{(^(reg25 ? reg19 : reg18))}), (^~$unsigned(reg26))};
              reg25 <= {$unsigned($unsigned(($unsigned(reg27) ?
                      (!reg26) : wire14[(3'h5):(2'h3)])))};
              reg26 <= wire17;
              reg27 <= $unsigned($signed($signed($signed($signed(wire20)))));
              reg28 <= ($unsigned(wire15) << (wire15[(4'hd):(2'h3)] + wire13[(1'h0):(1'h0)]));
            end
          reg29 <= (!$unsigned($signed({(wire14 ? wire14 : (8'hba)),
              (reg18 ^ reg26)})));
          reg30 <= reg27;
          reg31 <= $signed($unsigned({((wire16 != wire13) - (~&(8'haa))),
              (~|$unsigned(reg25))}));
        end
      reg32 <= (^(8'hb1));
      reg33 <= wire17;
      reg34 <= reg31;
    end
  assign wire35 = $signed(($unsigned(($unsigned(reg31) >> $unsigned(reg18))) ?
                      ($unsigned((~^reg26)) - ((wire21 == reg26) >>> (8'ha2))) : $unsigned({(~&reg32)})));
  assign wire36 = $signed((~^{(8'haf), reg32[(2'h2):(1'h1)]}));
endmodule
