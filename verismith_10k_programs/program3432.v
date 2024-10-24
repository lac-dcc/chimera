module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire219;
  wire signed [(5'h10):(1'h0)] wire216;
  wire [(5'h10):(1'h0)] wire215;
  wire [(4'hb):(1'h0)] wire214;
  wire signed [(4'hb):(1'h0)] wire213;
  wire [(5'h11):(1'h0)] wire211;
  wire signed [(4'he):(1'h0)] wire209;
  wire [(4'hc):(1'h0)] wire201;
  wire [(5'h11):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire207;
  reg [(2'h3):(1'h0)] reg218 = (1'h0);
  reg [(4'hb):(1'h0)] reg217 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg206 = (1'h0);
  reg [(4'hc):(1'h0)] reg205 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg204 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg203 = (1'h0);
  reg [(4'hb):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg80 = (1'h0);
  assign y = {wire219,
                 wire216,
                 wire215,
                 wire214,
                 wire213,
                 wire211,
                 wire209,
                 wire201,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire76,
                 wire207,
                 reg218,
                 reg217,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg78,
                 reg79,
                 reg80,
                 (1'h0)};
  assign wire4 = ({(|(7'h40)), $signed((^~wire3))} ?
                     $signed((~^wire1)) : ({wire1[(3'h5):(1'h0)],
                         wire0[(4'he):(4'h8)]} < (~|$signed(wire3))));
  assign wire5 = ($unsigned({wire2, $unsigned((wire0 ? wire1 : wire1))}) ?
                     wire1 : (^~wire0[(4'hb):(1'h0)]));
  assign wire6 = (wire5 ?
                     (wire0 ?
                         $unsigned($signed((~|wire0))) : wire3[(3'h6):(3'h5)]) : $signed(wire4));
  assign wire7 = wire4;
  assign wire8 = wire1[(3'h4):(2'h3)];
  assign wire9 = (({$unsigned($signed(wire1))} ?
                         (^~wire2) : $signed((-(+wire4)))) ?
                     {wire7} : (wire7 ^~ wire7));
  module10 #() modinst77 (wire76, clk, wire7, wire6, wire2, wire4, wire8);
  always
    @(posedge clk) begin
      if ((~&wire5))
        begin
          reg78 <= wire0[(2'h3):(2'h2)];
          reg79 <= (^~wire9[(2'h3):(1'h0)]);
        end
      else
        begin
          reg78 <= ((wire9[(2'h2):(1'h0)] ?
                  $unsigned((~wire1)) : ($unsigned((!(8'hab))) ?
                      $unsigned((wire6 ?
                          wire5 : reg79)) : $unsigned((wire8 == wire9)))) ?
              (~|wire6[(4'ha):(4'h8)]) : wire3[(4'hd):(4'ha)]);
          reg79 <= wire0;
        end
      reg80 <= (7'h42);
    end
  assign wire81 = ((((wire1[(4'h9):(3'h6)] ? $unsigned(wire4) : wire1) ?
                          (-$signed(wire7)) : ((wire4 ? reg79 : (8'ha8)) ?
                              (wire7 ?
                                  wire9 : reg80) : $unsigned(wire76))) * (&wire76[(4'hc):(2'h3)])) ?
                      $unsigned(wire76[(5'h11):(2'h3)]) : ({wire9[(4'hd):(3'h4)]} || ((8'ha3) ~^ ((wire2 >>> wire6) - ((8'ha3) ?
                          reg80 : wire3)))));
  assign wire82 = ((($unsigned(wire5[(5'h11):(2'h3)]) ?
                          wire9[(2'h2):(1'h0)] : $signed($unsigned(wire76))) || wire76[(4'h8):(2'h2)]) ?
                      $signed($unsigned(($signed((7'h43)) > (wire9 ?
                          (8'ha1) : wire5)))) : reg79[(3'h4):(1'h0)]);
  assign wire83 = $unsigned(((((&wire2) >= (wire1 ? (8'hb4) : wire3)) ?
                          wire8 : {(wire6 ? (8'hb5) : reg79)}) ?
                      (^wire82) : wire81[(3'h7):(3'h4)]));
  assign wire84 = ((($signed((wire4 ? wire5 : wire2)) ?
                      $unsigned(wire8[(4'h8):(3'h5)]) : {(&(8'haa)),
                          (wire2 ^~ reg78)}) < reg78[(4'h9):(3'h5)]) == (!(wire7 - (reg78 ?
                      (^~reg80) : wire1))));
  module85 #() modinst202 (wire201, clk, wire5, reg79, wire76, wire2);
  always
    @(posedge clk) begin
      reg203 <= wire1[(1'h1):(1'h0)];
      reg204 <= $unsigned({({(wire7 ? reg79 : wire9),
              $signed(reg79)} & $signed((wire2 ? reg78 : wire9))),
          $unsigned({(|wire3), (~&wire9)})});
      reg205 <= wire7[(3'h6):(2'h2)];
      reg206 <= (((!(wire76[(4'he):(4'hd)] ?
          wire7 : $unsigned((8'ha2)))) >> ((8'h9d) ?
          wire83 : (^reg80[(3'h7):(2'h3)]))) == (+(wire2[(4'hb):(4'h9)] == $unsigned((8'hbd)))));
    end
  module85 #() modinst208 (.clk(clk), .y(wire207), .wire89(wire83), .wire87(reg203), .wire86(wire82), .wire88(wire84));
  module16 #() modinst210 (.clk(clk), .wire17(wire82), .wire19(wire6), .wire18(reg79), .y(wire209), .wire20(reg78));
  module10 #() modinst212 (.wire15(wire5), .y(wire211), .wire14(wire1), .wire12(wire6), .clk(clk), .wire11(wire207), .wire13(reg204));
  assign wire213 = ((~^$signed((|$signed(wire84)))) != ({$signed(reg203),
                           wire3} ?
                       reg78[(3'h7):(3'h5)] : ((~^(8'hb2)) <<< (^~wire7))));
  assign wire214 = $unsigned((({(8'hb9), $signed((8'ha1))} ?
                       ({wire5,
                           wire7} ~^ wire4) : {wire84[(5'h10):(1'h0)]}) | (~(~|{wire209}))));
  assign wire215 = {(!(wire8 ? {(~(8'hbd))} : wire84[(4'ha):(2'h3)]))};
  assign wire216 = {(~|({wire201[(3'h6):(3'h5)]} ?
                           (+wire9) : ($signed(wire5) ^ {(8'ha2), wire213})))};
  always
    @(posedge clk) begin
      reg217 <= (8'hb5);
      reg218 <= (|$signed((+$unsigned((^~wire207)))));
    end
  assign wire219 = wire81[(2'h3):(1'h0)];
endmodule

module module85  (y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h23a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire89;
  input wire [(5'h11):(1'h0)] wire88;
  input wire [(5'h13):(1'h0)] wire87;
  input wire signed [(4'hd):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire198;
  wire signed [(5'h13):(1'h0)] wire155;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire102;
  wire [(5'h11):(1'h0)] wire101;
  wire [(5'h10):(1'h0)] wire100;
  wire signed [(2'h2):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire98;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  wire [(5'h14):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire91;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire157;
  wire [(4'h8):(1'h0)] wire158;
  wire signed [(4'hf):(1'h0)] wire196;
  reg [(3'h6):(1'h0)] reg200 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg199 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg [(4'he):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(4'he):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(5'h15):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg108 = (1'h0);
  reg signed [(4'he):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg97 = (1'h0);
  reg [(4'hd):(1'h0)] reg92 = (1'h0);
  assign y = {wire198,
                 wire155,
                 wire125,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire91,
                 wire90,
                 wire157,
                 wire158,
                 wire196,
                 reg200,
                 reg199,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg97,
                 reg92,
                 (1'h0)};
  assign wire90 = wire89;
  assign wire91 = wire88[(5'h10):(4'h9)];
  always
    @(posedge clk) begin
      reg92 <= ((~^$signed(wire88)) ?
          $unsigned((8'ha3)) : wire89[(1'h0):(1'h0)]);
    end
  assign wire93 = (^~$unsigned($unsigned($signed($signed(wire88)))));
  assign wire94 = $unsigned(((~(wire91[(3'h5):(1'h1)] != ((8'ha0) ?
                          wire87 : (8'hac)))) ?
                      reg92 : (($unsigned(wire88) ?
                          (wire88 && wire88) : wire88[(1'h1):(1'h1)]) <= wire87[(1'h1):(1'h0)])));
  assign wire95 = wire87[(3'h6):(3'h4)];
  assign wire96 = (~&wire88[(4'h8):(3'h7)]);
  always
    @(posedge clk) begin
      reg97 <= $signed({(({wire93} ? {wire87} : (wire90 ? wire95 : wire90)) ?
              {wire93, wire89[(1'h1):(1'h1)]} : $signed({reg92, wire87}))});
    end
  assign wire98 = ($unsigned(reg92) || wire91[(1'h1):(1'h1)]);
  assign wire99 = $unsigned(reg97);
  assign wire100 = wire91[(4'h8):(1'h0)];
  assign wire101 = $signed((wire99 ?
                       {((wire90 ? (8'hb7) : reg92) ?
                               reg92[(1'h1):(1'h0)] : wire90[(4'hd):(4'ha)])} : (wire87[(3'h5):(2'h3)] & $signed($unsigned(wire93)))));
  assign wire102 = {wire93[(2'h2):(1'h0)], wire86};
  always
    @(posedge clk) begin
      if ((|(((wire101 ? (wire88 ? wire90 : wire90) : $signed((8'hb5))) ?
              (+$unsigned((8'hbb))) : {$signed(wire86)}) ?
          (wire86 ? $signed((8'hba)) : {$unsigned(wire96)}) : {{(|wire87)}})))
        begin
          reg103 <= ($signed($unsigned((^(wire89 * wire102)))) ?
              reg92 : $signed((&((^wire88) ?
                  (^~wire99) : ((7'h44) >>> wire91)))));
          reg104 <= $unsigned(wire87[(3'h4):(2'h2)]);
          reg105 <= (($signed((wire96[(5'h14):(4'hc)] != $signed(wire101))) <<< ((&((8'ha4) ^~ wire88)) ~^ (wire98[(1'h0):(1'h0)] ~^ $signed(wire86)))) - (8'ha1));
        end
      else
        begin
          if ($signed({(reg97 ?
                  (wire89[(2'h2):(1'h0)] >>> $signed(wire89)) : reg97[(4'h9):(3'h6)])}))
            begin
              reg103 <= $unsigned((+wire86));
            end
          else
            begin
              reg103 <= (~&(reg92 + wire100));
              reg104 <= (8'h9c);
            end
          if ((($unsigned((|(8'ha8))) ?
                  $signed($signed(wire93)) : (wire87 & (wire95[(2'h3):(1'h1)] ^ (wire95 ?
                      wire94 : reg92)))) ?
              {$signed($unsigned(reg92[(2'h2):(1'h1)]))} : (((~$signed(wire90)) != wire87) == wire88[(4'h8):(3'h7)])))
            begin
              reg105 <= $signed((&(reg104 > $unsigned({reg97, wire96}))));
              reg106 <= wire95;
            end
          else
            begin
              reg105 <= ((~|reg97[(3'h6):(3'h5)]) ?
                  (wire91 ?
                      {$unsigned($unsigned(wire86))} : (wire88[(4'hf):(4'h9)] ?
                          ($signed(wire88) ?
                              (wire89 ?
                                  wire102 : wire88) : $signed(wire101)) : ((wire96 ?
                              wire88 : wire100) & (~^wire93)))) : $unsigned(wire89));
              reg106 <= wire87;
            end
          if (wire87)
            begin
              reg107 <= (wire100 ?
                  (~|{reg106[(3'h5):(1'h1)]}) : $unsigned(reg104));
              reg108 <= wire89;
              reg109 <= $signed($unsigned((8'hbc)));
              reg110 <= $signed($signed(reg104));
            end
          else
            begin
              reg107 <= (wire102 >>> ((~{reg104[(4'ha):(4'h9)]}) ?
                  reg105[(4'h9):(3'h4)] : $signed((^~$signed(wire88)))));
              reg108 <= (!(wire87[(2'h2):(1'h0)] ~^ wire98[(4'hd):(3'h7)]));
              reg109 <= (({reg109[(4'hb):(1'h1)]} == {$unsigned((&(8'hbb)))}) ?
                  (reg106 ?
                      {wire99} : (~$unsigned($signed(wire90)))) : {$unsigned((8'hbe)),
                      ({(-reg103), (wire91 ? wire96 : wire98)} ?
                          ((~|wire86) * wire99[(2'h2):(1'h0)]) : (^~(wire89 ?
                              reg104 : wire96)))});
              reg110 <= (reg105 | wire98[(4'hb):(2'h2)]);
              reg111 <= wire100[(4'h9):(4'h8)];
            end
          if (wire89[(1'h1):(1'h0)])
            begin
              reg112 <= (^(!(wire96 - (^(wire89 < reg111)))));
              reg113 <= $signed($unsigned(({reg112[(4'h8):(3'h5)]} ?
                  {(reg108 && reg110), reg107[(2'h3):(2'h3)]} : reg105)));
              reg114 <= ((|(^((~|reg103) | $unsigned(reg109)))) ^ reg97);
              reg115 <= ((!$unsigned(reg114[(3'h5):(1'h0)])) ?
                  ($unsigned($signed({reg112, wire86})) ?
                      reg97[(4'h8):(1'h1)] : $signed((^~(wire98 ?
                          wire86 : wire91)))) : $signed($signed(((^~(8'hba)) ?
                      reg108 : $signed(wire99)))));
            end
          else
            begin
              reg112 <= reg109;
              reg113 <= $unsigned(wire101);
              reg114 <= wire87;
            end
        end
      if ((8'hb2))
        begin
          reg116 <= $signed($unsigned($unsigned($unsigned((wire86 ?
              (8'hb0) : wire102)))));
          reg117 <= wire89;
          reg118 <= ((~|wire101) >>> reg107[(2'h2):(2'h2)]);
          reg119 <= {$signed($unsigned($signed((reg117 ? wire99 : reg113)))),
              (^reg118[(1'h1):(1'h0)])};
        end
      else
        begin
          if (($signed((((-wire96) == $signed(wire99)) ^~ $unsigned($unsigned(wire102)))) ^~ ($unsigned((((8'hb1) ?
                  reg118 : wire87) ?
              (+reg115) : (~^(8'hbb)))) > $unsigned((wire98 ?
              {reg106, reg92} : wire101)))))
            begin
              reg116 <= (($unsigned(($unsigned(wire93) ?
                      (8'ha1) : (reg109 - reg113))) ?
                  wire102 : wire96) <<< wire102[(2'h2):(2'h2)]);
              reg117 <= (+$unsigned(reg110[(4'hb):(2'h3)]));
            end
          else
            begin
              reg116 <= reg114[(2'h3):(1'h1)];
              reg117 <= (reg109 ?
                  (wire94[(4'ha):(1'h0)] ?
                      ((&wire102) >>> ($unsigned((7'h44)) >>> (^wire89))) : (|(&$unsigned(wire98)))) : $signed({$unsigned((reg114 < (8'ha9)))}));
              reg118 <= (&((~|(|(reg113 >= reg109))) ?
                  reg113 : (wire99 >>> (((7'h40) ?
                      reg116 : wire91) ~^ (-wire96)))));
              reg119 <= (((~|$signed({wire94})) == (((~reg111) ?
                      (+reg115) : ((7'h40) ? wire87 : wire91)) ?
                  ({reg118} ?
                      (wire94 >= wire87) : $unsigned(reg119)) : $unsigned((reg118 ?
                      reg108 : (8'ha0))))) || $signed($unsigned(reg106)));
              reg120 <= $signed((wire100 >> (({wire88, reg112} ?
                      $signed(reg114) : (~(8'h9e))) ?
                  ((8'ha5) - $unsigned(wire98)) : ((&(8'hbe)) ?
                      (^(8'hbb)) : (wire88 ? reg111 : reg97)))));
            end
          reg121 <= wire89[(2'h2):(1'h1)];
          reg122 <= (((8'hb8) ?
                  reg106[(3'h5):(2'h2)] : (^~((wire93 >= reg105) | (reg113 == (8'hbb))))) ?
              ((~&reg120) ?
                  ($signed((&reg111)) ?
                      reg92 : $unsigned($signed(wire94))) : (~^((reg117 != reg115) == (wire100 ?
                      reg119 : wire101)))) : $signed($unsigned(wire87)));
          reg123 <= ($signed($signed(((reg119 ~^ wire99) <<< $signed(reg112)))) * reg110[(3'h4):(1'h0)]);
        end
      reg124 <= wire90;
    end
  assign wire125 = (-({(8'ha5)} ?
                       $signed($signed($signed(wire93))) : ({reg116[(4'hc):(2'h2)]} | {(8'hbe)})));
  module126 #() modinst156 (wire155, clk, wire102, reg117, reg107, reg116, reg115);
  assign wire157 = {(reg119[(1'h1):(1'h0)] & (((^~(8'haf)) ?
                               reg103[(1'h0):(1'h0)] : (8'hbc)) ?
                           reg106 : {wire89[(1'h1):(1'h1)]})),
                       (reg108 ?
                           {(wire90 ~^ wire90[(3'h7):(1'h0)])} : (~|wire155[(3'h4):(3'h4)]))};
  assign wire158 = (^~wire95[(4'hb):(3'h6)]);
  module159 #() modinst197 (.wire162(reg111), .wire163(wire90), .y(wire196), .wire161(reg106), .wire164(reg107), .wire160(reg104), .clk(clk));
  assign wire198 = wire94[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg199 <= $unsigned($signed($signed(($signed(reg114) ?
          wire94 : (reg116 >= (7'h42))))));
      reg200 <= (~(!{($unsigned((8'ha4)) || reg112)}));
    end
endmodule

module module10
#(parameter param74 = ((({((8'hb5) ? (8'ha7) : (8'ha7)), (~|(8'ha6))} != (((7'h41) || (8'hab)) <= ((8'hb6) ? (8'hbf) : (8'ha9)))) ? ((((8'had) ? (8'hb2) : (8'haa)) ? {(8'had)} : {(8'hb5)}) ? ({(8'ha3), (8'hb3)} <= {(8'hbc)}) : ((^(8'hb0)) ~^ ((8'ha4) ^~ (8'hae)))) : ({((8'haa) ? (8'hba) : (8'hb8)), ((8'ha6) ? (8'ha6) : (7'h42))} | (((8'ha2) ? (8'h9d) : (8'hb3)) ? ((8'hb2) ? (8'hb1) : (8'ha3)) : {(8'hb3), (8'ha4)}))) ? ({(((8'hbc) <= (8'hb8)) ? (~|(8'h9e)) : ((8'h9d) ? (8'ha5) : (8'hae))), ({(8'had)} ? ((8'hbf) && (8'had)) : ((7'h43) & (8'hab)))} ? ({((8'had) > (7'h42)), ((8'h9c) && (8'hb8))} ? ({(8'hbf)} >> {(8'ha2)}) : (((8'hac) ^ (8'ha4)) ^ (-(8'h9d)))) : ((^(~^(8'ha0))) ~^ (|(+(8'hb8))))) : ((|(-((8'hbd) - (8'ha8)))) ^ (((~(8'ha9)) ? {(8'hb0), (8'haf)} : ((8'hb6) ? (8'hb9) : (8'hbe))) && ((&(8'hb7)) && (^(8'h9c)))))), 
parameter param75 = (((-(param74 <= (^param74))) ? (~|(-param74)) : (param74 + ((^(7'h42)) ? {param74} : (~|param74)))) ? param74 : ((((|param74) ? (param74 ? param74 : param74) : ((8'ha0) ? param74 : param74)) != (|(8'hb5))) <<< (((param74 >>> param74) > (|(8'hbd))) ? (param74 + (param74 ? (8'ha8) : param74)) : param74))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire69;
  wire [(2'h2):(1'h0)] wire68;
  wire signed [(4'ha):(1'h0)] wire66;
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  assign y = {wire73, wire72, wire71, wire69, wire68, wire66, reg70, (1'h0)};
  module16 #() modinst67 (wire66, clk, wire12, wire13, wire15, wire11);
  assign wire68 = {$signed($signed(wire15[(2'h2):(2'h2)]))};
  assign wire69 = wire68;
  always
    @(posedge clk) begin
      reg70 <= (((|((wire66 ? wire12 : wire14) != ((8'hab) || wire15))) ?
          wire69 : (!wire66)) & $signed((((-wire13) == wire66[(3'h6):(1'h1)]) <<< wire68)));
    end
  assign wire71 = wire68[(1'h0):(1'h0)];
  assign wire72 = $signed(({($signed(wire71) ? (~wire71) : ((8'hbc) < (7'h43))),
                      wire11[(2'h2):(1'h0)]} == wire14));
  assign wire73 = ((wire72[(3'h7):(3'h4)] << {wire13,
                          (wire15 ? $unsigned(wire12) : $unsigned(wire14))}) ?
                      ($unsigned($unsigned(wire71[(4'hc):(4'hc)])) ?
                          wire14[(2'h2):(1'h0)] : ($signed($signed(wire68)) ?
                              $signed((~&wire71)) : (wire69[(3'h7):(3'h7)] ?
                                  $unsigned(wire13) : {wire66,
                                      wire12}))) : ((wire69[(2'h2):(1'h0)] ?
                              $unsigned($signed(wire68)) : (wire71[(4'hb):(4'h9)] ?
                                  $signed(wire12) : (|reg70))) ?
                          (wire12[(4'h8):(2'h2)] ?
                              (&(wire14 | wire71)) : $signed(wire68[(1'h0):(1'h0)])) : wire12));
endmodule

module module16
#(parameter param65 = (^(!(|(((8'hb1) != (8'hac)) <= ((8'hab) & (8'hbb)))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(4'h8):(1'h0)] wire59;
  wire signed [(3'h7):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(5'h12):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire41;
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(3'h5):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire41,
                 reg61,
                 reg60,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire20[(3'h5):(3'h5)])
        begin
          reg21 <= (wire18 >> wire17[(1'h1):(1'h0)]);
          reg22 <= $unsigned((+reg21));
          if (($unsigned(reg21) <<< reg22[(4'he):(4'ha)]))
            begin
              reg23 <= wire20[(3'h4):(2'h3)];
            end
          else
            begin
              reg23 <= wire18;
              reg24 <= wire18[(3'h5):(2'h3)];
              reg25 <= (((^~reg21[(4'he):(4'he)]) ?
                      reg22[(4'hf):(1'h0)] : $unsigned($signed((-reg21)))) ?
                  (~&wire18) : (({((8'hb0) ? wire17 : reg21)} >>> (8'hb3)) ?
                      wire20 : $signed(reg24[(2'h3):(1'h1)])));
              reg26 <= reg22[(5'h10):(2'h2)];
            end
        end
      else
        begin
          if ({reg26})
            begin
              reg21 <= $signed(($unsigned((8'hb8)) <<< $unsigned(reg21)));
              reg22 <= {(($unsigned((wire18 ? wire17 : wire19)) ?
                      (^wire20[(3'h4):(3'h4)]) : wire18) != reg23)};
              reg23 <= reg24;
              reg24 <= (8'hb1);
            end
          else
            begin
              reg21 <= $unsigned(($unsigned(reg24) > reg24));
              reg22 <= (+$signed($unsigned((~wire20[(2'h3):(2'h2)]))));
            end
          reg25 <= (-wire17);
          reg26 <= $signed(({reg21[(4'hb):(4'hb)], (^{wire17})} ?
              wire20 : reg25));
          reg27 <= ((wire19 ?
              wire19[(4'h8):(3'h4)] : ((!wire18) ?
                  reg26[(2'h2):(1'h0)] : {(&reg25), {reg22}})) >>> wire19);
        end
      reg28 <= reg22;
      reg29 <= (~($signed($signed((reg22 ?
          (8'hac) : reg26))) != ((^~{reg27}) << {reg26[(4'h8):(2'h3)]})));
      if (($signed(reg29) ^ reg28))
        begin
          if ((^~$signed($unsigned($unsigned($unsigned(reg21))))))
            begin
              reg30 <= reg24[(2'h2):(1'h0)];
              reg31 <= (reg27 ?
                  $unsigned($unsigned(reg30)) : (((wire19 && (wire18 | reg29)) ?
                          (~$signed((8'hb9))) : ($unsigned((8'hab)) | (~|reg23))) ?
                      wire20 : $unsigned(($signed(wire17) ?
                          $signed((8'hbd)) : {reg25, reg28}))));
              reg32 <= wire18;
              reg33 <= {{wire18},
                  (((wire19 > (reg24 || wire17)) ^ $unsigned($unsigned(wire20))) >= ({(8'hb7),
                          (reg21 * reg21)} ?
                      $unsigned({(7'h42), wire17}) : reg28))};
              reg34 <= reg27;
            end
          else
            begin
              reg30 <= reg28[(5'h10):(2'h3)];
              reg31 <= {(reg34 <= $signed($signed($signed(wire19)))),
                  ((($signed(reg31) * $unsigned(reg32)) >= $signed($signed((8'hb2)))) ?
                      reg32 : $unsigned(reg24[(4'h8):(3'h7)]))};
              reg32 <= ($signed({((!wire20) | reg21[(2'h3):(1'h0)]), reg28}) ?
                  (($signed((reg31 + reg26)) ~^ $unsigned((-reg32))) ?
                      $unsigned(((^~reg22) ?
                          (wire17 || reg28) : wire18)) : (reg34 ?
                          {((8'hac) || wire20),
                              wire19} : $unsigned(reg33[(2'h3):(1'h1)]))) : {reg32,
                      {$signed((reg29 >= reg34))}});
              reg33 <= (reg33[(3'h4):(2'h2)] != reg25);
              reg34 <= (^reg24[(4'hc):(3'h7)]);
            end
          reg35 <= $signed(reg30[(4'he):(4'h8)]);
          reg36 <= reg27;
          if ($unsigned($signed(reg30)))
            begin
              reg37 <= (^~(^(reg34[(4'hd):(2'h2)] <= {{(8'hb1)},
                  $signed((8'h9e))})));
              reg38 <= $signed((|(wire19 ?
                  (+wire18) : ((reg26 <= reg37) ? (reg27 <= reg37) : reg23))));
            end
          else
            begin
              reg37 <= $signed($unsigned($signed(reg29)));
              reg38 <= (~$unsigned({((8'ha6) ?
                      (reg26 && reg25) : (reg24 <= reg29)),
                  ((~^reg34) > reg34)}));
            end
          reg39 <= reg22[(1'h1):(1'h1)];
        end
      else
        begin
          reg30 <= wire19[(3'h4):(1'h0)];
          reg31 <= {($signed($signed((reg33 ?
                  wire17 : reg21))) == (^{(reg33 * reg37)}))};
          reg32 <= $unsigned((8'h9c));
          reg33 <= reg37[(1'h0):(1'h0)];
        end
      reg40 <= {(|$unsigned((!$unsigned(reg25)))),
          ((~|((~^reg38) >= (8'had))) <= ((^$signed(reg21)) ?
              ((8'ha8) || (8'hbf)) : ((^~reg25) ?
                  $unsigned(reg32) : $unsigned(reg32))))};
    end
  assign wire41 = $signed($signed((+((-(8'haf)) > (wire20 ?
                      (8'ha3) : reg38)))));
  always
    @(posedge clk) begin
      reg42 <= ((($unsigned((~^(7'h43))) ?
                  $unsigned((reg29 <= reg28)) : reg37) ?
              ($signed((~|wire20)) || $unsigned($signed(reg33))) : $unsigned(reg39[(2'h3):(1'h0)])) ?
          (~|$unsigned((reg34 * (reg35 < reg38)))) : ($unsigned(((reg37 | reg34) ?
              {reg28,
                  reg32} : (^reg39))) && (($signed(reg22) + $unsigned(reg32)) >>> wire41)));
      if (wire19)
        begin
          reg43 <= $signed(reg30[(5'h10):(3'h5)]);
          reg44 <= $signed((^~(~&reg33)));
        end
      else
        begin
          if (reg40)
            begin
              reg43 <= (reg23[(2'h3):(1'h0)] - $unsigned(reg28[(4'hb):(3'h7)]));
              reg44 <= {reg38[(1'h0):(1'h0)]};
              reg45 <= wire17;
              reg46 <= {(((&(8'hb9)) ?
                          ((reg22 ? reg45 : wire17) ?
                              ((8'hba) | wire18) : (reg27 ?
                                  reg32 : reg27)) : ((reg32 | reg23) || $unsigned(reg24))) ?
                      {(((8'hb6) * (8'hb2)) >= $signed(reg30))} : (((reg34 >= reg44) == reg37[(1'h0):(1'h0)]) >>> (~&$unsigned(reg40))))};
            end
          else
            begin
              reg43 <= (^reg45[(4'hc):(3'h7)]);
              reg44 <= $unsigned((&reg36));
              reg45 <= ((^$signed(($signed(reg38) ?
                      reg42 : ((7'h44) >> reg34)))) ?
                  ($unsigned(reg44[(4'he):(3'h4)]) ?
                      ((8'h9f) << $signed((^reg43))) : (^~$unsigned(reg33))) : $signed(reg28));
              reg46 <= ($signed({reg45[(4'hc):(3'h5)]}) ?
                  $signed($unsigned((reg40[(1'h0):(1'h0)] ?
                      {wire19,
                          wire20} : (reg22 >= reg35)))) : reg34[(4'hd):(3'h5)]);
            end
          if ((~^($unsigned(((|reg24) ? wire41 : $signed(reg28))) ?
              (reg28 ?
                  $signed((+reg42)) : (reg23[(1'h1):(1'h0)] <= {reg34})) : $unsigned({{reg39,
                      (8'hb2)}}))))
            begin
              reg47 <= ($signed((^~reg29[(4'hc):(3'h5)])) >= {reg45[(2'h3):(1'h1)],
                  wire17[(4'h9):(3'h7)]});
              reg48 <= $signed((-(!(reg23 ~^ reg35[(5'h15):(5'h12)]))));
              reg49 <= (reg26 ?
                  ((($unsigned(reg48) ? reg29 : (reg43 | (8'ha3))) ?
                      ((reg37 ? reg25 : reg47) ?
                          (reg31 || reg42) : $unsigned(reg22)) : (8'haf)) + (($signed(reg48) > (|reg44)) ?
                      {(~^(8'ha8))} : $signed(reg43))) : (reg31[(3'h7):(2'h2)] <= ($unsigned(reg48[(3'h4):(2'h3)]) ?
                      reg24[(1'h0):(1'h0)] : $signed((reg31 == (8'h9f))))));
              reg50 <= {wire20};
            end
          else
            begin
              reg47 <= reg40[(2'h2):(1'h1)];
            end
          reg51 <= ($signed({{reg49}}) ?
              $signed(($signed((reg46 ?
                  reg45 : reg42)) || ($unsigned((8'hb0)) - wire17[(3'h5):(2'h2)]))) : {$unsigned(((&reg46) && reg27)),
                  reg50});
        end
    end
  assign wire52 = $signed($signed($unsigned((8'hb1))));
  assign wire53 = {{$unsigned({(8'hb7), (-reg34)}), (~|reg34)}};
  assign wire54 = reg27;
  assign wire55 = $signed(((($signed(reg42) ~^ $signed(reg31)) > $signed(((8'ha8) ?
                          reg51 : wire17))) ?
                      ($unsigned(reg23) & $unsigned(wire41[(2'h3):(2'h2)])) : $unsigned($unsigned($unsigned(reg24)))));
  assign wire56 = ((8'hae) == {reg26[(3'h4):(2'h3)],
                      ({$signed(reg21), {wire54, wire20}} ?
                          ((reg37 >>> wire20) ^ $unsigned((8'hac))) : reg25[(2'h3):(1'h0)])});
  assign wire57 = ((($signed(reg30) ?
                      (~^$unsigned(reg51)) : (reg29[(5'h12):(4'he)] ?
                          $unsigned((8'ha0)) : $signed(wire55))) == {((reg31 ?
                              wire53 : reg46) ?
                          reg42 : $signed(wire19))}) < {reg30[(4'hc):(3'h4)],
                      $unsigned($unsigned(reg37[(1'h1):(1'h1)]))});
  assign wire58 = {$unsigned($unsigned((~(!reg38))))};
  assign wire59 = $unsigned($unsigned(reg44[(4'hb):(4'h9)]));
  always
    @(posedge clk) begin
      reg60 <= {(^$signed(reg21[(4'hb):(3'h5)]))};
      reg61 <= reg21;
    end
  assign wire62 = $signed((!$signed($signed(((8'hb1) == wire58)))));
  assign wire63 = (($unsigned(reg29[(2'h3):(2'h2)]) <= {$signed($signed(reg43)),
                          ((8'hbc) >>> {wire57, reg27})}) ?
                      (^$unsigned(wire20[(3'h4):(1'h1)])) : reg43[(1'h0):(1'h0)]);
  assign wire64 = $signed((^(8'had)));
endmodule

module module159  (y, clk, wire164, wire163, wire162, wire161, wire160);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire164;
  input wire signed [(2'h3):(1'h0)] wire163;
  input wire signed [(3'h6):(1'h0)] wire162;
  input wire signed [(4'hb):(1'h0)] wire161;
  input wire signed [(5'h13):(1'h0)] wire160;
  wire [(5'h14):(1'h0)] wire195;
  wire [(4'hc):(1'h0)] wire182;
  wire [(5'h11):(1'h0)] wire181;
  wire [(5'h11):(1'h0)] wire180;
  wire signed [(4'h9):(1'h0)] wire179;
  wire signed [(5'h10):(1'h0)] wire177;
  reg [(5'h10):(1'h0)] reg194 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg192 = (1'h0);
  reg [(5'h12):(1'h0)] reg191 = (1'h0);
  reg [(3'h4):(1'h0)] reg190 = (1'h0);
  reg [(4'ha):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg188 = (1'h0);
  reg [(3'h5):(1'h0)] reg187 = (1'h0);
  reg [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg185 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg184 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg183 = (1'h0);
  reg [(3'h5):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg175 = (1'h0);
  reg [(5'h13):(1'h0)] reg174 = (1'h0);
  reg [(5'h11):(1'h0)] reg173 = (1'h0);
  reg [(4'hc):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(4'hb):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(4'he):(1'h0)] reg165 = (1'h0);
  assign y = {wire195,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire177,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg178,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg165 <= $signed(wire164);
      if (wire161)
        begin
          if ({$unsigned($unsigned(wire161[(4'h9):(4'h9)])),
              (wire164[(1'h0):(1'h0)] | wire164[(3'h5):(2'h2)])})
            begin
              reg166 <= wire162[(3'h6):(1'h1)];
              reg167 <= {$unsigned((^({wire160, wire164} ?
                      reg166[(1'h1):(1'h0)] : wire163[(2'h3):(2'h2)])))};
              reg168 <= (wire163[(2'h2):(1'h0)] ?
                  (+wire164) : {({(reg167 ?
                              (8'ha3) : wire162)} & $unsigned($unsigned(wire161))),
                      ($unsigned((wire164 ?
                          (8'h9c) : (8'ha8))) - (wire162[(1'h0):(1'h0)] ?
                          {(8'hbd), (8'ha4)} : wire162[(3'h6):(3'h5)]))});
              reg169 <= wire162;
              reg170 <= wire163[(2'h3):(2'h3)];
            end
          else
            begin
              reg166 <= $unsigned(reg169);
            end
          if ((reg166[(4'hd):(2'h3)] ? reg169 : wire160[(4'hf):(3'h6)]))
            begin
              reg171 <= ((^{reg170, $signed((reg170 ? wire163 : reg170))}) ?
                  reg168[(5'h10):(4'hb)] : (reg169 ^ $signed($unsigned((|(8'hbb))))));
              reg172 <= (reg166[(5'h12):(3'h7)] + (($unsigned((^wire160)) ?
                  $signed((^wire161)) : reg165[(4'hc):(4'ha)]) >> ((+{wire162,
                      reg170}) ?
                  reg170[(3'h4):(2'h3)] : ((8'hbe) ?
                      wire162[(1'h0):(1'h0)] : $signed((8'hac))))));
            end
          else
            begin
              reg171 <= reg171[(4'hc):(1'h0)];
              reg172 <= (wire164[(1'h1):(1'h0)] ?
                  reg170[(3'h4):(2'h3)] : (reg171 ?
                      (-$signed(reg170[(2'h2):(1'h1)])) : ($signed($signed(wire162)) == ({reg169,
                          reg167} >> (reg170 ? wire161 : wire161)))));
            end
          reg173 <= (-((|((reg166 ~^ reg167) ?
              (8'h9e) : reg169[(1'h1):(1'h0)])) - wire161[(4'ha):(3'h4)]));
          reg174 <= ($unsigned((((reg170 ? reg172 : reg170) ?
              reg165 : (reg168 <<< reg165)) != $unsigned(reg170))) && reg166);
        end
      else
        begin
          reg166 <= (wire160[(3'h7):(1'h0)] ?
              {(reg173[(4'hd):(3'h7)] | $signed((reg173 ?
                      wire164 : reg170)))} : (wire162 ?
                  reg171[(4'he):(4'he)] : reg174));
          reg167 <= ($signed((reg172[(4'hc):(4'hb)] ?
              wire160[(5'h13):(3'h4)] : reg168)) >= reg166);
          if (reg166[(5'h12):(3'h4)])
            begin
              reg168 <= $unsigned($unsigned((~&((reg166 ? reg171 : reg171) ?
                  (reg166 ? reg174 : reg169) : ((8'ha7) + (8'ha2))))));
            end
          else
            begin
              reg168 <= (|(~|((wire164[(3'h5):(3'h5)] ?
                  reg166 : $unsigned(reg168)) >> reg165)));
            end
          reg169 <= (wire161[(2'h3):(1'h0)] >> (8'hba));
          if (($unsigned($unsigned({$signed(reg173)})) >= (($unsigned((reg172 ?
                      reg170 : reg166)) ?
                  $unsigned((reg169 - wire162)) : {{wire161, reg173}}) ?
              (&reg174) : (((reg171 ? reg172 : reg173) > (reg167 || (8'haf))) ?
                  ((-(8'hbe)) <= reg171[(4'hb):(4'h8)]) : wire161[(4'hb):(2'h3)]))))
            begin
              reg170 <= (|wire160);
              reg171 <= {(&($unsigned((reg170 >> reg168)) > ({(8'hba)} - reg173[(4'h8):(3'h4)]))),
                  ($signed($unsigned((wire162 ?
                      (8'h9c) : reg168))) + reg166[(2'h3):(2'h2)])};
            end
          else
            begin
              reg170 <= reg174[(5'h11):(5'h10)];
            end
        end
      reg175 <= {(~|(reg169 ? reg171 : {(&wire161), {reg172, wire161}})),
          wire161};
      reg176 <= $signed(((reg173 >>> reg173[(4'hb):(2'h3)]) <<< reg165[(3'h7):(3'h4)]));
    end
  assign wire177 = $unsigned(((~&({wire161, (8'hb0)} ?
                       (reg170 ?
                           reg175 : reg165) : $signed(reg174))) >>> (((wire160 ?
                           reg172 : reg171) ?
                       (wire163 ^ wire161) : wire160) - $signed(wire160))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((reg170 >= reg176[(1'h0):(1'h0)]))))
        begin
          reg178 <= $signed(wire177);
        end
      else
        begin
          reg178 <= (~^({($signed((8'hbb)) ?
                  $unsigned(reg176) : $unsigned((8'hb4))),
              wire161} >= reg172[(2'h3):(2'h2)]));
        end
    end
  assign wire179 = reg174;
  assign wire180 = reg170;
  assign wire181 = reg165;
  assign wire182 = $unsigned(wire161[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire160)
        begin
          if ($signed((^$unsigned($unsigned($unsigned(wire164))))))
            begin
              reg183 <= (((^$signed($unsigned(wire163))) ?
                      wire162 : (!((reg172 && (7'h40)) ?
                          $signed((8'ha4)) : wire177))) ?
                  {$signed(wire179),
                      wire163[(2'h3):(2'h2)]} : $signed($signed($unsigned((^reg170)))));
              reg184 <= wire162[(1'h1):(1'h0)];
              reg185 <= $unsigned((&(^~(wire164[(1'h0):(1'h0)] << (wire179 ?
                  (7'h43) : reg184)))));
              reg186 <= ((^~((reg185[(1'h1):(1'h1)] >>> (wire162 < (8'haa))) ?
                  {reg165, $signed(reg172)} : wire181)) >= $unsigned(wire161));
              reg187 <= (|(~&wire161[(2'h2):(1'h1)]));
            end
          else
            begin
              reg183 <= ($signed(wire177) ?
                  reg172[(4'h8):(3'h5)] : {$unsigned($unsigned($unsigned(reg172))),
                      {reg176[(2'h2):(1'h1)]}});
              reg184 <= reg165[(3'h4):(2'h2)];
            end
          if ($unsigned(($signed(($signed(wire162) | $signed(wire177))) ?
              $signed(reg169) : reg172[(3'h4):(2'h3)])))
            begin
              reg188 <= ((reg185 ^ $unsigned(reg173)) == reg175[(2'h2):(2'h2)]);
              reg189 <= (|wire182);
            end
          else
            begin
              reg188 <= ($unsigned(($unsigned(reg170[(1'h1):(1'h1)]) ?
                  reg187 : ($unsigned(reg166) || (reg173 != wire182)))) != $unsigned((($signed(reg168) & (reg183 + wire161)) == {reg189,
                  $signed(wire161)})));
              reg189 <= $signed({$signed({$signed(reg183), {reg189}}),
                  {wire177[(4'he):(4'hb)]}});
              reg190 <= $unsigned(($unsigned(reg176[(1'h0):(1'h0)]) && $unsigned((8'hb7))));
            end
          reg191 <= (((((reg165 ? reg189 : wire177) ?
                  reg165 : reg173[(1'h1):(1'h1)]) ?
              (&(7'h44)) : ((reg184 ^ wire161) >= reg189[(4'ha):(2'h3)])) != ({reg186,
                  reg187[(1'h1):(1'h1)]} ?
              (|(8'ha1)) : $unsigned(reg189))) < $unsigned($signed(($unsigned(reg176) | {wire179,
              reg168}))));
          reg192 <= (~((reg187[(1'h1):(1'h0)] << (|(wire177 == reg169))) ?
              (+wire177) : (reg174[(1'h1):(1'h0)] ?
                  (reg178[(3'h4):(1'h1)] ?
                      $signed(reg184) : (8'had)) : $unsigned($unsigned(reg170)))));
          reg193 <= ($unsigned(reg191[(3'h6):(3'h5)]) ?
              reg167 : ($unsigned((((8'h9f) >> reg184) ?
                      $signed(reg186) : (~|reg176))) ?
                  reg192[(3'h4):(2'h2)] : ((~wire160[(4'hf):(4'hf)]) ?
                      (!$signed(reg186)) : reg165[(1'h0):(1'h0)])));
        end
      else
        begin
          reg183 <= (wire162 >> reg188[(4'he):(1'h1)]);
        end
      reg194 <= $unsigned(reg168[(1'h1):(1'h0)]);
    end
  assign wire195 = reg190;
endmodule

module module126
#(parameter param153 = (~(((&(8'ha2)) > ({(8'ha0), (8'h9f)} << ((8'hac) ? (8'hac) : (8'h9e)))) ? (7'h41) : (+(|(|(8'hb5)))))), 
parameter param154 = ({(8'hb4), ((~&(param153 ? param153 : param153)) && ((&param153) - (~^param153)))} ? (((^~{param153, (8'hb9)}) && (+param153)) | param153) : {(8'h9e)}))
(y, clk, wire131, wire130, wire129, wire128, wire127);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire131;
  input wire [(4'he):(1'h0)] wire130;
  input wire [(4'he):(1'h0)] wire129;
  input wire signed [(4'hd):(1'h0)] wire128;
  input wire [(5'h15):(1'h0)] wire127;
  wire signed [(3'h7):(1'h0)] wire152;
  wire signed [(3'h6):(1'h0)] wire151;
  wire signed [(5'h15):(1'h0)] wire150;
  wire signed [(4'hf):(1'h0)] wire149;
  wire signed [(4'h8):(1'h0)] wire148;
  wire [(4'h9):(1'h0)] wire147;
  wire signed [(5'h14):(1'h0)] wire142;
  wire signed [(4'hf):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire140;
  wire signed [(5'h11):(1'h0)] wire139;
  wire signed [(4'ha):(1'h0)] wire138;
  wire [(5'h12):(1'h0)] wire137;
  wire [(4'hb):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire [(4'hd):(1'h0)] wire134;
  wire [(5'h13):(1'h0)] wire133;
  wire [(5'h10):(1'h0)] wire132;
  reg [(3'h5):(1'h0)] reg146 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg145 = (1'h0);
  reg [(4'h8):(1'h0)] reg144 = (1'h0);
  reg [(4'h8):(1'h0)] reg143 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 (1'h0)};
  assign wire132 = wire128;
  assign wire133 = {(8'hbf)};
  assign wire134 = (~^{$unsigned(wire130),
                       (((wire132 ? wire127 : wire131) ?
                               wire128[(2'h2):(1'h1)] : $unsigned((8'hb5))) ?
                           ({wire130} << wire133) : (|(wire127 ?
                               (8'had) : wire130)))});
  assign wire135 = {wire129,
                       ((wire133 != {(wire130 ? wire132 : (8'h9e))}) ?
                           wire130 : $signed(wire132[(4'he):(4'h8)]))};
  assign wire136 = wire131[(4'hb):(3'h4)];
  assign wire137 = wire133;
  assign wire138 = {$signed(({wire129, (^~(8'h9d))} ?
                           $unsigned(wire137) : $signed((wire127 >= wire137))))};
  assign wire139 = wire127[(5'h13):(3'h4)];
  assign wire140 = wire138;
  assign wire141 = $unsigned((wire130[(4'h8):(3'h7)] & ($signed((wire136 | wire136)) ?
                       $unsigned(wire136[(1'h1):(1'h0)]) : (wire140 != $unsigned(wire135)))));
  assign wire142 = {$signed(wire137), wire134[(3'h6):(1'h0)]};
  always
    @(posedge clk) begin
      if ($signed(wire129))
        begin
          reg143 <= wire129;
          reg144 <= ($unsigned($signed($unsigned($unsigned(wire127)))) ~^ $signed((^$signed(wire137))));
        end
      else
        begin
          reg143 <= $unsigned(((^~(reg144[(4'h8):(3'h6)] ?
                  {wire140, (8'hb9)} : $unsigned(wire141))) ?
              wire138[(1'h0):(1'h0)] : (((wire131 + wire142) >= (wire136 < wire139)) ?
                  $unsigned(((8'ha0) >>> wire136)) : $signed((wire142 ?
                      wire128 : wire131)))));
          reg144 <= wire133[(2'h3):(1'h1)];
          reg145 <= (~|wire127[(4'hd):(1'h1)]);
        end
      reg146 <= $signed(($signed((-(reg145 <= wire129))) ?
          ((^~{wire140, wire135}) + wire127) : $signed(wire129)));
    end
  assign wire147 = ((~^reg144) >= wire142[(1'h0):(1'h0)]);
  assign wire148 = (((~^((&wire137) >> (wire137 != wire147))) >>> reg145) ?
                       $signed(wire140) : $unsigned(wire139));
  assign wire149 = {{$signed($signed($unsigned(wire132))),
                           $unsigned((wire140 == $unsigned(wire127)))},
                       ((wire140[(1'h1):(1'h1)] ?
                           $signed($unsigned((8'hbd))) : (-wire127[(5'h11):(4'h8)])) - ($signed({reg144,
                               wire139}) ?
                           $signed(wire137) : $signed($signed(wire132))))};
  assign wire150 = wire140[(2'h2):(2'h2)];
  assign wire151 = (-reg144[(1'h1):(1'h0)]);
  assign wire152 = (wire127 >>> {$signed($unsigned((wire128 ?
                           wire134 : wire132)))});
endmodule
