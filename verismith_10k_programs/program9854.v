module top
#(parameter param167 = (!(^~(^~(~^(|(7'h41)))))), 
parameter param168 = {param167})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(5'h10):(1'h0)] wire154;
  wire [(3'h4):(1'h0)] wire153;
  wire signed [(4'hb):(1'h0)] wire150;
  wire [(5'h14):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire148;
  wire [(2'h3):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire145;
  reg signed [(4'hf):(1'h0)] reg166 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg160 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg [(5'h14):(1'h0)] reg156 = (1'h0);
  reg [(4'ha):(1'h0)] reg155 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg [(5'h11):(1'h0)] reg151 = (1'h0);
  assign y = {wire154,
                 wire153,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire145,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire4 = wire3[(2'h2):(1'h1)];
  assign wire5 = ({((-$signed(wire2)) ?
                             (!(&wire2)) : ({wire1} ?
                                 (wire4 ? wire3 : wire4) : $unsigned(wire3)))} ?
                     {(wire3[(4'hd):(3'h5)] >> ($signed(wire0) > (wire4 >= wire3)))} : wire4);
  assign wire6 = {$unsigned((~$unsigned(wire1[(3'h4):(2'h3)]))),
                     ($signed($unsigned((8'hbc))) | $unsigned($signed($unsigned(wire0))))};
  assign wire7 = ({(~|($signed(wire2) & wire0[(2'h3):(1'h0)]))} + ((-($signed(wire3) ^ $signed(wire0))) | wire6[(4'hc):(3'h7)]));
  assign wire8 = ((wire0[(1'h1):(1'h0)] ?
                     wire1[(1'h1):(1'h0)] : ($unsigned({wire7,
                         wire5}) ~^ $signed($unsigned(wire6)))) * ($signed(($unsigned(wire4) < wire4)) ?
                     (^$signed((wire6 ?
                         wire0 : wire6))) : (!$signed($unsigned(wire7)))));
  assign wire9 = $signed((8'ha9));
  assign wire10 = (((wire3 ^ ($unsigned((8'had)) ?
                      wire8[(2'h3):(2'h2)] : (wire1 ?
                          wire0 : wire8))) ~^ (~^wire9[(4'h9):(3'h4)])) * {wire4[(2'h3):(1'h1)],
                      (wire1 ? wire5 : wire2[(3'h6):(3'h5)])});
  assign wire11 = $signed(wire8[(3'h6):(2'h2)]);
  module12 #() modinst146 (wire145, clk, wire4, wire5, wire10, wire3, wire0);
  assign wire147 = ({wire8[(4'h8):(2'h2)]} - {$signed((~|$signed(wire4)))});
  assign wire148 = ((wire145[(2'h3):(1'h0)] * (-wire8[(3'h4):(2'h3)])) > wire10);
  assign wire149 = (~|(!(($signed((8'hba)) ^ {wire145, (8'hb8)}) ?
                       wire6 : wire2)));
  assign wire150 = (($signed(($signed(wire9) ?
                       (~wire4) : $signed(wire2))) >> $unsigned((8'haa))) << {wire7[(1'h1):(1'h0)],
                       ($unsigned((wire8 ? wire4 : wire148)) ?
                           (~wire3) : ((wire145 ? wire11 : (8'ha3)) ?
                               (wire5 ? wire147 : wire4) : (~&wire8)))});
  always
    @(posedge clk) begin
      reg151 <= (~|(!wire8));
      reg152 <= $unsigned(($unsigned($unsigned($unsigned(wire9))) ^ (((wire4 >= (7'h43)) ?
          $signed(wire145) : reg151[(4'ha):(3'h4)]) ^~ {(wire8 > wire9),
          (^wire150)})));
    end
  assign wire153 = $unsigned(wire147);
  assign wire154 = $signed(($unsigned(wire6[(2'h2):(1'h0)]) ?
                       (!$signed((-(8'haf)))) : ((wire148 ?
                               wire0 : (wire147 <<< (8'hb6))) ?
                           $signed(wire6) : ($signed(wire1) < (|wire148)))));
  always
    @(posedge clk) begin
      reg155 <= wire2;
      if ((~reg155[(2'h3):(2'h3)]))
        begin
          reg156 <= (8'ha0);
          if ({$unsigned($unsigned((|wire2)))})
            begin
              reg157 <= wire10;
              reg158 <= reg152;
              reg159 <= ($signed(({$signed(wire145)} ?
                  (~^$unsigned(wire1)) : (~&reg158))) * $unsigned((8'hae)));
              reg160 <= wire154[(4'h8):(1'h1)];
            end
          else
            begin
              reg157 <= $unsigned(reg159);
              reg158 <= $signed(wire9);
              reg159 <= (+(((reg160 ?
                  (wire147 ? reg152 : wire5) : (wire5 ?
                      reg157 : (8'hb7))) < ((reg159 >= wire149) ?
                  $unsigned(wire153) : (wire149 >= reg160))) != $unsigned({{reg156,
                      reg157}})));
            end
          if (wire8[(4'h9):(1'h1)])
            begin
              reg161 <= wire8[(4'hb):(4'h8)];
            end
          else
            begin
              reg161 <= wire8;
            end
          if ({(((reg158 <<< $signed(reg155)) ?
                      wire11[(4'h8):(4'h8)] : $unsigned((wire4 ?
                          reg151 : reg152))) ?
                  ($unsigned(wire9) <<< $unsigned($signed(wire2))) : $unsigned(wire3[(5'h12):(4'hd)]))})
            begin
              reg162 <= {$signed($unsigned((~^(^(8'ha3)))))};
              reg163 <= (-(reg157[(2'h3):(2'h2)] >>> ((+{wire10}) ?
                  {wire1[(2'h3):(1'h1)],
                      (wire8 & wire149)} : $signed(reg157[(1'h0):(1'h0)]))));
              reg164 <= {{({wire0[(1'h1):(1'h1)],
                          reg156[(3'h5):(2'h2)]} != $unsigned((wire150 ^~ (7'h41)))),
                      ((~|$unsigned(wire1)) <= (wire8 ?
                          $signed((7'h40)) : wire6[(3'h4):(2'h2)]))},
                  wire0[(1'h0):(1'h0)]};
              reg165 <= (wire10[(2'h3):(1'h1)] << reg155[(3'h4):(3'h4)]);
              reg166 <= $unsigned(($unsigned($signed($signed(reg155))) != wire3[(3'h5):(1'h0)]));
            end
          else
            begin
              reg162 <= reg151;
              reg163 <= (+(({wire6, wire3} >> wire9) ?
                  (+reg151) : $unsigned((|(wire145 ? (8'haf) : wire9)))));
              reg164 <= {(&$signed(((wire148 ^ (8'hba)) ?
                      reg156 : {(8'hb1)})))};
              reg165 <= (wire9 != (~wire149));
              reg166 <= ((^~($unsigned(wire7[(3'h4):(2'h3)]) | $signed($signed(reg157)))) ?
                  reg152[(3'h7):(3'h4)] : (wire147 != (~^wire145[(3'h6):(3'h4)])));
            end
        end
      else
        begin
          reg156 <= ($unsigned({{(wire145 ? reg163 : reg164)},
              $signed($signed(reg158))}) & reg162[(4'h8):(4'h8)]);
          if (wire149)
            begin
              reg157 <= (+$unsigned((wire9[(4'h9):(3'h7)] ?
                  reg159 : ((+wire149) && wire7))));
              reg158 <= ((&({{wire1, (7'h44)}, $signed(reg151)} ?
                  {reg156[(4'hf):(4'he)],
                      $signed(wire3)} : ($unsigned(wire147) << wire147))) & ($signed(((~|reg165) ?
                      (wire153 ? wire11 : reg166) : $unsigned(wire3))) ?
                  $unsigned($signed((~wire3))) : ($unsigned(wire7) ?
                      ((wire149 + wire0) <= $unsigned(wire6)) : (8'hb2))));
            end
          else
            begin
              reg157 <= (~($unsigned(((wire6 & (8'ha8)) + (~^wire7))) ?
                  wire154[(1'h0):(1'h0)] : wire148));
            end
          reg159 <= wire10[(4'hf):(3'h6)];
          if ($signed($unsigned(wire9)))
            begin
              reg160 <= wire5;
              reg161 <= $signed(($unsigned($unsigned($unsigned(reg160))) ?
                  wire8 : $signed(($unsigned(wire154) ?
                      (~reg151) : (wire5 ? reg152 : wire147)))));
              reg162 <= wire3[(5'h11):(2'h3)];
            end
          else
            begin
              reg160 <= $signed($signed((wire147 >>> (&$unsigned((8'hbb))))));
              reg161 <= (!$signed({wire6[(4'ha):(3'h7)],
                  (wire11[(5'h11):(3'h4)] < wire6[(4'h9):(3'h5)])}));
              reg162 <= (+((8'ha0) == wire4));
            end
        end
    end
endmodule

module module12
#(parameter param143 = {(((((8'hab) ? (8'hb0) : (7'h43)) >> (^(7'h42))) - ((|(7'h42)) ~^ (~^(8'hb4)))) ? ((((8'had) ? (8'hbe) : (8'haa)) >= ((8'had) ? (8'hb8) : (8'ha8))) ^~ ({(8'hb3)} ^ (~(8'ha1)))) : {(|((8'hb5) ~^ (8'hae))), ({(8'ha6), (8'ha8)} != ((8'ha6) ? (8'hb5) : (8'ha1)))}), {(~|(~(~(7'h40))))}}, 
parameter param144 = (8'h9d))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire117;
  wire [(4'hb):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire120;
  wire signed [(2'h2):(1'h0)] wire121;
  wire signed [(4'he):(1'h0)] wire122;
  wire [(3'h4):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire141;
  assign y = {wire84,
                 wire86,
                 wire87,
                 wire88,
                 wire117,
                 wire119,
                 wire120,
                 wire121,
                 wire122,
                 wire123,
                 wire124,
                 wire141,
                 (1'h0)};
  module18 #() modinst85 (.wire21(wire15), .y(wire84), .clk(clk), .wire23(wire17), .wire22(wire13), .wire20(wire16), .wire19(wire14));
  assign wire86 = (($unsigned((((8'hba) < wire13) ?
                      $signed((8'hac)) : (~(8'h9e)))) && (+(~&wire84[(4'h8):(2'h2)]))) * wire13);
  assign wire87 = wire86;
  assign wire88 = $unsigned(($signed(($signed(wire15) ?
                      {wire15,
                          wire16} : (wire16 >> wire87))) + (wire84[(4'h8):(1'h1)] ~^ ($unsigned(wire87) + wire17))));
  module89 #() modinst118 (wire117, clk, wire17, wire13, wire84, wire86);
  assign wire119 = wire13[(2'h3):(2'h2)];
  assign wire120 = (wire86 ? $signed(wire16) : ((^~(8'hac)) > wire14));
  assign wire121 = $signed($signed({wire117[(2'h3):(1'h1)]}));
  assign wire122 = $unsigned(($unsigned(((!wire84) <<< (&wire86))) ?
                       wire15[(4'hd):(4'hc)] : (((wire14 ? wire120 : wire121) ?
                           wire121[(1'h0):(1'h0)] : wire121[(1'h0):(1'h0)]) << (~^$unsigned((8'ha4))))));
  assign wire123 = ($unsigned(((7'h42) ?
                       wire119[(4'h8):(3'h5)] : wire121)) ~^ ((^~(^{wire87})) ?
                       (wire122[(1'h1):(1'h1)] + ((^wire13) * (!wire84))) : ({wire117[(3'h4):(1'h1)],
                           (8'h9d)} ^ ({wire17, wire86} != (wire15 ?
                           wire16 : wire119)))));
  assign wire124 = wire87[(2'h3):(1'h1)];
  module125 #() modinst142 (.clk(clk), .wire127(wire122), .wire126(wire14), .wire129(wire119), .wire128(wire17), .wire130(wire16), .y(wire141));
endmodule

module module125
#(parameter param139 = {((+({(8'ha2)} ? (~|(8'hb1)) : {(7'h44), (8'hb2)})) ? ((((8'hac) ? (8'hb1) : (8'ha3)) ? (+(8'hac)) : (!(8'haa))) + ((~|(8'ha7)) ? ((8'hbb) - (8'hb0)) : ((8'ha8) <= (8'hbb)))) : {(8'hb8)}), {({((8'hb2) && (8'ha1))} & {((8'ha1) ? (8'ha3) : (8'hac)), {(8'h9d), (8'ha1)}})}}, 
parameter param140 = ((^{(^~(param139 - param139))}) - (8'hab)))
(y, clk, wire130, wire129, wire128, wire127, wire126);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire130;
  input wire signed [(3'h5):(1'h0)] wire129;
  input wire [(2'h2):(1'h0)] wire128;
  input wire signed [(4'he):(1'h0)] wire127;
  input wire signed [(5'h15):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire137;
  wire [(4'hc):(1'h0)] wire132;
  wire [(3'h7):(1'h0)] wire131;
  reg [(4'hf):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg [(4'h9):(1'h0)] reg134 = (1'h0);
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  assign y = {wire137,
                 wire132,
                 wire131,
                 reg138,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire131 = wire129;
  assign wire132 = (^wire126);
  always
    @(posedge clk) begin
      reg133 <= (wire132 ? (~&$unsigned(wire129)) : wire128);
      reg134 <= ($unsigned(wire129) < wire131[(1'h1):(1'h1)]);
      if (($signed((~(+{wire130}))) ? reg133 : (|(~^wire132[(1'h0):(1'h0)]))))
        begin
          reg135 <= wire126[(4'hc):(4'hb)];
        end
      else
        begin
          reg135 <= $signed($unsigned($signed($unsigned(wire128[(2'h2):(1'h1)]))));
        end
      reg136 <= $unsigned(((&(&$unsigned(reg135))) ?
          ($signed($unsigned((8'ha0))) <= wire129) : ((8'hba) ?
              ((wire126 ? wire128 : wire128) ?
                  reg133[(4'hd):(2'h2)] : (8'hb9)) : (wire127 == ((8'ha4) ?
                  reg135 : wire128)))));
    end
  assign wire137 = $signed((reg134 || (8'ha2)));
  always
    @(posedge clk) begin
      reg138 <= wire137[(1'h1):(1'h1)];
    end
endmodule

module module89
#(parameter param116 = (~^(^({((8'h9f) ? (8'ha0) : (7'h44))} ^~ (((8'h9f) ? (8'had) : (8'hae)) ? ((8'hb5) & (7'h42)) : ((8'hab) ? (8'hae) : (8'h9e)))))))
(y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire93;
  input wire signed [(4'hd):(1'h0)] wire92;
  input wire [(2'h2):(1'h0)] wire91;
  input wire [(5'h11):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  wire [(3'h5):(1'h0)] wire113;
  wire [(5'h12):(1'h0)] wire112;
  wire signed [(4'he):(1'h0)] wire111;
  wire signed [(3'h6):(1'h0)] wire110;
  wire signed [(4'hf):(1'h0)] wire109;
  wire signed [(4'hc):(1'h0)] wire108;
  wire signed [(4'hf):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire [(3'h7):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  wire [(3'h7):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire99;
  wire signed [(5'h13):(1'h0)] wire98;
  wire [(2'h2):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire [(3'h4):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire94;
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 reg100,
                 (1'h0)};
  assign wire94 = (~($signed(((~&wire90) ?
                          wire91 : (wire92 ? wire90 : wire93))) ?
                      {$signed(wire91[(2'h2):(1'h0)]),
                          wire92[(4'hb):(2'h2)]} : $unsigned(wire91[(1'h1):(1'h1)])));
  assign wire95 = $signed($unsigned(wire91[(2'h2):(1'h0)]));
  assign wire96 = (wire94[(4'hc):(3'h5)] < wire94[(4'h8):(3'h7)]);
  assign wire97 = wire90;
  assign wire98 = $unsigned(wire90);
  assign wire99 = $unsigned(($signed((8'hab)) ?
                      wire97[(1'h0):(1'h0)] : (((wire93 >= wire95) ?
                          ((8'hac) ?
                              wire95 : wire91) : wire98[(5'h13):(4'hb)]) << ((wire90 ?
                          wire98 : wire90) != (~^wire97)))));
  always
    @(posedge clk) begin
      reg100 <= (&wire94[(1'h0):(1'h0)]);
    end
  assign wire101 = ($signed(wire94) ? (8'h9e) : wire94[(4'hd):(2'h3)]);
  assign wire102 = {$signed(wire91[(2'h2):(1'h1)]),
                       (wire98 >>> ((wire99[(2'h2):(1'h0)] | (wire96 >> wire97)) == $signed((!wire90))))};
  assign wire103 = $unsigned((~|wire91));
  assign wire104 = $signed($unsigned(({wire101} ?
                       $signed({wire93,
                           (7'h40)}) : (wire93[(1'h1):(1'h0)] | (wire98 < wire99)))));
  assign wire105 = wire91;
  assign wire106 = $signed($unsigned(wire94[(4'ha):(2'h3)]));
  assign wire107 = ((({$signed(wire90)} ?
                           (wire97 ?
                               {reg100,
                                   wire90} : $signed((8'hba))) : wire102[(3'h5):(1'h0)]) ?
                       wire103[(1'h1):(1'h1)] : (((^wire91) > wire104) ?
                           (wire95[(3'h4):(3'h4)] ?
                               ((8'hbe) + (8'ha5)) : $signed((8'hab))) : $signed({reg100,
                               wire102}))) << wire103);
  assign wire108 = $unsigned(((wire91[(1'h1):(1'h1)] ?
                       (((8'ha3) ? wire93 : wire91) ?
                           (wire93 <= wire92) : wire95) : (-$signed(wire93))) >> {$signed($signed(wire103)),
                       (wire105 ?
                           wire101[(2'h3):(2'h3)] : (wire93 ?
                               wire104 : wire107))}));
  assign wire109 = $unsigned({reg100[(1'h0):(1'h0)],
                       $unsigned(wire102[(3'h4):(2'h3)])});
  assign wire110 = $signed((|(~^((&(8'ha5)) >= $signed(wire96)))));
  assign wire111 = wire109;
  assign wire112 = ((^~{{$unsigned(wire91)}}) ?
                       (~((!(~^wire111)) ?
                           (~&wire91[(1'h1):(1'h0)]) : wire102[(1'h1):(1'h0)])) : ($unsigned($unsigned(wire103)) ?
                           (^~wire95[(2'h3):(2'h2)]) : $signed($signed((wire111 >> wire104)))));
  assign wire113 = ($signed({$unsigned($signed(wire105)),
                       ($signed(wire98) ?
                           wire97 : reg100[(4'hb):(2'h3)])}) - wire91[(1'h1):(1'h0)]);
  assign wire114 = {$unsigned(wire112[(3'h5):(1'h0)]), (^wire95)};
  assign wire115 = $unsigned((wire92 ? $signed((8'hac)) : wire92));
endmodule

module module18
#(parameter param83 = (((~&{((8'ha6) ? (8'hb3) : (8'hb3)), ((8'hbf) ? (8'hba) : (7'h42))}) >>> (~&((~&(8'hb9)) ? ((7'h43) << (8'hb5)) : (~&(8'had))))) & (((((8'hb5) ? (8'hbd) : (8'hb9)) | ((8'hb6) ? (8'hb8) : (8'hba))) ? (8'h9e) : (~(!(7'h42)))) ^ ((((8'ha8) != (8'hb5)) ? {(7'h43)} : ((8'hb9) + (8'hb7))) > (((8'hbc) ? (8'ha8) : (8'hae)) ? (|(8'ha2)) : ((8'hb3) <= (8'hb5)))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h291):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire23;
  input wire signed [(4'h9):(1'h0)] wire22;
  input wire [(4'he):(1'h0)] wire21;
  input wire [(2'h2):(1'h0)] wire20;
  input wire signed [(4'hc):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(2'h3):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire69;
  wire signed [(3'h4):(1'h0)] wire68;
  wire signed [(3'h6):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire24;
  reg [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg51 = (1'h0);
  reg [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire56,
                 wire24,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg70,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire24 = wire19;
  always
    @(posedge clk) begin
      if ($signed($unsigned($signed(($signed((7'h42)) <<< (wire21 ?
          wire23 : (8'ha0)))))))
        begin
          reg25 <= $signed($signed($unsigned($signed($unsigned(wire21)))));
          reg26 <= $unsigned($signed(wire24));
          reg27 <= ($unsigned((+((-(8'haa)) ^ $unsigned(wire19)))) ?
              (((~(wire22 ? reg26 : reg26)) | reg25) ?
                  (((wire22 ?
                      wire24 : reg25) | reg26) != ($unsigned(wire23) | wire24[(2'h2):(1'h0)])) : {wire24[(3'h5):(2'h3)],
                      (&((8'hb5) >>> reg26))}) : ((~&((wire21 | wire24) ?
                  $unsigned(wire23) : $signed(reg26))) >= wire23));
          reg28 <= wire20;
          reg29 <= reg25[(2'h3):(1'h1)];
        end
      else
        begin
          reg25 <= wire19;
          reg26 <= (8'ha2);
        end
      if (($signed(reg27[(3'h5):(3'h5)]) ^~ ($unsigned(($unsigned(wire21) & (~^wire19))) ?
          (-($signed(reg29) ?
              {(8'hb3), wire24} : (reg27 ?
                  reg29 : wire22))) : (-(~^(~reg27))))))
        begin
          reg30 <= $signed(wire24);
          if (reg29)
            begin
              reg31 <= (reg26 >>> ((~^((+wire19) >>> $unsigned(wire21))) && (wire20[(1'h0):(1'h0)] & (reg26 - ((8'hae) || wire21)))));
              reg32 <= $unsigned($unsigned({($unsigned((8'ha2)) == $unsigned(reg31))}));
            end
          else
            begin
              reg31 <= (((~|{reg32, (reg25 + reg32)}) ?
                      (reg30 < $unsigned(wire21[(1'h0):(1'h0)])) : ($signed(((8'hae) ?
                          reg28 : reg30)) <= ((~&wire23) & (8'hbf)))) ?
                  ((reg32 ?
                          $signed(wire23[(2'h3):(2'h3)]) : reg25[(4'he):(4'h9)]) ?
                      reg25 : (wire21 - ({reg28, wire19} ?
                          {reg27} : $unsigned(wire24)))) : ($unsigned(reg27[(5'h10):(5'h10)]) ?
                      wire22[(1'h1):(1'h1)] : wire20[(2'h2):(1'h1)]));
            end
          if (wire20)
            begin
              reg33 <= {((~($unsigned(reg28) || wire20)) ?
                      $signed((~$unsigned(wire23))) : ((~wire19[(2'h2):(1'h0)]) ?
                          wire23 : $unsigned(wire23[(2'h3):(1'h1)]))),
                  (~&(wire21[(3'h7):(1'h1)] >>> (~|$unsigned(reg32))))};
            end
          else
            begin
              reg33 <= ($signed($unsigned((wire20[(1'h1):(1'h0)] ?
                  reg33[(3'h4):(2'h2)] : (reg27 ?
                      reg25 : wire22)))) && $signed((wire23[(1'h1):(1'h0)] ?
                  $signed($signed(reg25)) : (~(-reg26)))));
            end
          if (((wire23[(3'h6):(2'h3)] ?
              (wire20 ^~ (reg31[(1'h0):(1'h0)] ?
                  reg27[(4'hf):(4'hd)] : reg29)) : (~&($unsigned(wire24) ?
                  reg29[(3'h4):(3'h4)] : wire24))) ^ $unsigned(reg30[(4'hc):(3'h7)])))
            begin
              reg34 <= wire22[(3'h7):(3'h4)];
              reg35 <= $signed($unsigned((^$signed(reg31[(3'h4):(2'h3)]))));
              reg36 <= (~|$unsigned(wire24[(3'h6):(1'h1)]));
              reg37 <= {$signed(wire24), $signed(reg32[(1'h1):(1'h0)])};
            end
          else
            begin
              reg34 <= $unsigned(reg33);
              reg35 <= wire20[(1'h1):(1'h1)];
              reg36 <= $signed(reg34);
              reg37 <= reg25[(5'h10):(3'h4)];
            end
        end
      else
        begin
          if ((~&$unsigned($signed((^(+reg32))))))
            begin
              reg30 <= reg25[(2'h3):(1'h1)];
              reg31 <= ($unsigned($unsigned(wire23[(1'h0):(1'h0)])) ?
                  reg30[(4'h9):(1'h1)] : reg26);
              reg32 <= (^{$signed(reg25), (wire22 > (-(7'h40)))});
            end
          else
            begin
              reg30 <= ((~reg30[(3'h5):(2'h2)]) != reg25[(2'h2):(1'h1)]);
              reg31 <= $unsigned(((reg26[(4'h9):(3'h7)] <<< (reg26 ?
                      $signed(wire24) : $unsigned(reg37))) ?
                  (wire20 > ((reg36 + reg29) == (wire20 ?
                      reg30 : wire21))) : (8'hb9)));
              reg32 <= {{(!({wire24} ? {(8'ha3)} : reg26))},
                  ((8'hab) ?
                      reg31[(4'hc):(2'h3)] : (^~(reg29 ?
                          reg27 : $signed((7'h42)))))};
            end
          reg33 <= (~|((^~((reg35 && reg35) ?
                  ((8'haa) ? reg34 : reg36) : reg29[(1'h0):(1'h0)])) ?
              reg37[(3'h7):(2'h3)] : $unsigned($unsigned({wire22}))));
          if (reg29)
            begin
              reg34 <= $signed(reg36[(2'h3):(1'h1)]);
              reg35 <= wire23[(4'h9):(1'h1)];
              reg36 <= $unsigned((+wire24[(1'h1):(1'h0)]));
            end
          else
            begin
              reg34 <= {$unsigned((+(reg35[(4'ha):(4'ha)] ?
                      (reg32 + reg29) : reg25))),
                  $unsigned(wire19)};
              reg35 <= $signed(((8'hb3) ?
                  {reg26[(2'h3):(1'h0)]} : (~$unsigned((&reg35)))));
            end
          reg37 <= ((!$unsigned(((reg34 <<< (8'haf)) ~^ (reg31 + reg30)))) ?
              (reg32[(4'hf):(2'h3)] << (~^$signed(wire24))) : reg29[(2'h2):(2'h2)]);
        end
      if (wire19[(4'hb):(4'h8)])
        begin
          reg38 <= $signed(wire19);
          reg39 <= (reg35[(2'h3):(1'h0)] ?
              ((&wire24[(4'hb):(3'h6)]) ? $unsigned(reg26) : reg34) : ((7'h42) ?
                  $signed((~((8'ha2) || (8'haf)))) : $unsigned($signed((reg29 ?
                      wire20 : reg34)))));
        end
      else
        begin
          reg38 <= ((($unsigned($signed((7'h42))) ?
                  wire23 : $unsigned({reg39})) ?
              (^reg32) : $unsigned((reg39 > $signed(reg29)))) & (8'hbf));
          reg39 <= (8'hab);
          reg40 <= (+{(((reg34 ? reg26 : (8'h9c)) ?
                  (wire19 << reg32) : $signed(reg28)) * reg35[(1'h1):(1'h1)])});
        end
      reg41 <= (!(reg37[(2'h3):(2'h2)] ?
          (^~wire21) : $signed((reg35 << wire23))));
    end
  always
    @(posedge clk) begin
      reg42 <= reg26;
      if ({reg27, wire24})
        begin
          if (reg40[(4'h9):(2'h2)])
            begin
              reg43 <= {(~&(^(+{reg31, wire22})))};
              reg44 <= $signed((~&(~^({reg27} ? $signed(reg30) : (~wire21)))));
            end
          else
            begin
              reg43 <= {((~$signed($signed(reg40))) + wire21[(4'h8):(4'h8)]),
                  $unsigned($unsigned(reg27))};
              reg44 <= $signed(((^~(!(+reg40))) ?
                  wire22[(3'h5):(2'h2)] : reg26));
              reg45 <= (&$unsigned(reg32));
              reg46 <= ($unsigned($signed((&(^wire21)))) * wire24[(4'h9):(1'h0)]);
              reg47 <= $signed($signed(((~reg28) ?
                  reg36[(3'h4):(2'h3)] : (wire21 & (8'hb6)))));
            end
          reg48 <= (reg43[(3'h4):(1'h0)] ?
              ((reg47 ?
                  reg44 : $signed($signed((8'hb9)))) << wire19) : (~wire19));
          reg49 <= (~&reg44[(3'h6):(2'h3)]);
          reg50 <= ({(reg39 >> ((~wire24) ?
                      (reg42 ? reg49 : (8'ha0)) : (wire23 << reg38))),
                  (8'had)} ?
              reg42[(3'h4):(2'h2)] : reg26);
        end
      else
        begin
          reg43 <= $unsigned(wire23);
          reg44 <= $signed(((reg29[(2'h2):(1'h1)] != ((reg46 ^~ reg36) ~^ reg50[(3'h6):(3'h4)])) ?
              wire24 : (reg40 == (wire24[(4'ha):(3'h5)] & reg34))));
          reg45 <= (((8'hbc) == $signed({reg49[(2'h2):(1'h1)],
                  reg30[(4'h8):(3'h4)]})) ?
              reg39 : $signed($unsigned((^reg48[(2'h2):(1'h1)]))));
          reg46 <= $signed(($signed($unsigned((reg35 & reg43))) <= $unsigned(({reg45,
                  reg30} ?
              ((8'hb5) ? wire24 : wire24) : (-reg35)))));
        end
      if (reg50)
        begin
          reg51 <= (~|$signed((!reg25)));
          if (reg42[(3'h4):(3'h4)])
            begin
              reg52 <= wire24[(1'h0):(1'h0)];
              reg53 <= (^wire22);
            end
          else
            begin
              reg52 <= {({$unsigned(reg44[(4'hb):(3'h7)]),
                          $unsigned({(8'h9e)})} ?
                      $signed((+$unsigned(reg33))) : reg30),
                  $signed({((reg31 ? reg50 : reg31) & (wire21 < reg26))})};
            end
        end
      else
        begin
          reg51 <= reg49[(1'h1):(1'h0)];
        end
      reg54 <= ($unsigned(($unsigned((reg26 - reg30)) ?
          $signed(reg25[(4'ha):(3'h7)]) : ($unsigned((8'ha4)) ?
              $signed(reg42) : {wire23, reg36}))) ^~ (~|$unsigned((~^{wire21,
          reg30}))));
      reg55 <= reg52[(3'h5):(2'h2)];
    end
  assign wire56 = reg25[(4'hf):(4'h9)];
  always
    @(posedge clk) begin
      if ($signed(reg29[(1'h1):(1'h1)]))
        begin
          reg57 <= ((~$unsigned((^$signed((8'h9d))))) ?
              {(({reg36, reg44} <<< reg40) == $signed({reg50})),
                  $unsigned(reg40)} : reg49);
          if ((wire24[(3'h7):(2'h3)] << reg57))
            begin
              reg58 <= $unsigned($unsigned(reg27));
              reg59 <= (~(^(($unsigned((8'haf)) ?
                      $unsigned(reg51) : $signed(reg54)) ?
                  (reg29 ^~ reg52) : ((reg48 - reg40) ?
                      (reg48 ? reg58 : (8'hba)) : reg36[(3'h6):(2'h2)]))));
              reg60 <= reg40[(3'h5):(3'h5)];
              reg61 <= {reg47,
                  (^~{$unsigned($signed(wire22)), reg30[(2'h3):(1'h0)]})};
              reg62 <= (({$signed($signed(reg27)),
                      (reg27 < wire22)} & (8'ha8)) ?
                  $signed($unsigned({reg43,
                      wire23[(4'h8):(2'h2)]})) : reg44[(4'hf):(3'h5)]);
            end
          else
            begin
              reg58 <= reg30;
              reg59 <= (8'hb9);
              reg60 <= reg35;
              reg61 <= {reg38[(2'h2):(1'h0)],
                  $signed((~({reg49} ? (^~reg43) : {reg41, reg47})))};
            end
          reg63 <= ((~^reg34[(3'h7):(3'h4)]) && $signed((8'hb1)));
          reg64 <= reg57;
        end
      else
        begin
          reg57 <= reg43[(1'h0):(1'h0)];
          if (((reg25 ?
              (^{(wire56 ?
                      reg52 : (8'haf))}) : (reg30 == wire21[(2'h3):(2'h2)])) || $signed(((^~(|wire21)) << reg43[(2'h2):(2'h2)]))))
            begin
              reg58 <= reg54[(3'h6):(2'h3)];
            end
          else
            begin
              reg58 <= $unsigned(($signed($signed(reg55[(3'h6):(3'h4)])) ?
                  (~^$signed((reg54 <<< reg43))) : reg39));
              reg59 <= $unsigned(((^~$signed(wire21)) ?
                  $unsigned((((8'ha8) ? wire22 : reg31) & wire20)) : ((~^{reg42,
                      (7'h41)}) <= reg58[(1'h1):(1'h0)])));
            end
          reg60 <= reg48[(1'h1):(1'h1)];
        end
    end
  assign wire65 = $signed(reg60[(2'h2):(2'h2)]);
  assign wire66 = ((reg34 ?
                          (&(+$unsigned(reg31))) : (!((reg55 ? reg32 : wire65) ?
                              ((8'ha7) <<< reg55) : (reg31 ?
                                  reg62 : wire23)))) ?
                      reg60[(2'h2):(1'h1)] : (8'ha7));
  assign wire67 = (-wire65[(1'h0):(1'h0)]);
  assign wire68 = reg45[(1'h0):(1'h0)];
  assign wire69 = $signed($signed($signed($signed($unsigned(reg36)))));
  always
    @(posedge clk) begin
      reg70 <= reg48;
    end
  assign wire71 = wire23[(3'h4):(3'h4)];
  assign wire72 = reg30;
  assign wire73 = ({$unsigned(((reg50 ? reg50 : reg60) >> $signed(reg42))),
                      (8'hb8)} <<< (((((7'h44) == reg59) ?
                          (^wire68) : $signed(wire23)) ?
                      reg28[(2'h2):(1'h0)] : {(reg26 ? reg59 : (8'ha2)),
                          {(8'ha2)}}) | reg33[(2'h2):(1'h1)]));
  assign wire74 = $signed((^~$signed((((8'h9c) >= reg36) ~^ $signed(reg35)))));
  assign wire75 = ((+$signed($signed((reg49 ? (8'ha9) : (8'hb7))))) ?
                      $signed((8'h9d)) : wire67);
  assign wire76 = wire75[(3'h7):(1'h1)];
  assign wire77 = $unsigned($signed(reg37));
  assign wire78 = (!reg29);
  always
    @(posedge clk) begin
      reg79 <= $signed(($signed((reg53 ? (reg30 + reg61) : (|reg61))) ?
          reg31[(2'h3):(2'h2)] : wire69));
      reg80 <= ($unsigned(($unsigned((reg47 ^ reg39)) >>> ((~^reg64) != (!reg31)))) ^ (8'hb6));
      reg81 <= ((~&(~|(-reg36))) ?
          (reg52 << reg51[(1'h1):(1'h0)]) : (reg27 << ((^$unsigned(wire65)) * ((wire65 ?
              wire19 : wire19) == $unsigned(wire24)))));
      reg82 <= (reg80 && $unsigned($signed((^$unsigned(reg50)))));
    end
endmodule
