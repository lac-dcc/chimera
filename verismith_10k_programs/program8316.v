module top
#(parameter param185 = ((((((7'h40) & (8'ha1)) >>> ((8'hb6) <= (8'haa))) ? (-((8'hbe) <= (8'ha3))) : (((8'hb3) ? (8'hb5) : (8'hbc)) || ((8'ha3) ? (8'h9d) : (8'hb4)))) ? ((((8'hb2) * (8'hbf)) ? (~|(8'h9d)) : ((8'hb6) ? (8'ha3) : (8'ha7))) ? (~^(8'hac)) : {((8'hb9) | (8'hbe)), ((8'h9e) ~^ (8'hb9))}) : ((!((8'hab) ? (8'hb1) : (8'had))) >> ((+(8'h9f)) ^ ((8'ha1) ? (8'hb3) : (8'hb1))))) ? ((&(((8'ha4) ? (8'hb4) : (8'hbf)) ? ((8'hb3) ? (7'h44) : (8'haf)) : {(8'hb3)})) == (+(((8'hb0) ? (7'h40) : (8'hbb)) ? ((8'ha2) > (8'hb1)) : (~|(8'hbb))))) : (((((7'h42) && (8'h9c)) ? ((8'hae) ? (8'haf) : (8'hb1)) : (&(8'ha5))) < (((8'hbf) * (8'ha2)) ? ((8'hab) + (8'hb9)) : ((8'h9c) ? (8'hac) : (8'ha6)))) <= (|(((8'hae) ^ (7'h40)) ? {(8'ha1)} : ((8'ha3) ? (8'ha8) : (8'hb0)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire183;
  wire signed [(3'h5):(1'h0)] wire124;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  assign y = {wire183, wire124, wire5, wire4, (1'h0)};
  assign wire4 = ($unsigned($signed($signed(wire2))) ^ (-{wire0[(3'h4):(3'h4)]}));
  assign wire5 = (($signed($unsigned((wire3 ? wire0 : wire2))) ?
                         $signed(wire3[(2'h3):(2'h3)]) : (+((wire2 ?
                                 (8'ha5) : (8'ha4)) ?
                             (~&wire1) : $unsigned(wire4)))) ?
                     $unsigned($signed(((wire4 ?
                         wire1 : (8'ha2)) & $signed(wire0)))) : $signed((~^({wire3} ?
                         (wire4 && wire0) : wire3))));
  module6 #() modinst125 (wire124, clk, wire0, wire3, wire1, wire2);
  module126 #() modinst184 (.wire128(wire1), .wire130(wire3), .wire129(wire2), .wire127(wire4), .clk(clk), .y(wire183));
endmodule

module module126  (y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire130;
  input wire signed [(3'h6):(1'h0)] wire129;
  input wire signed [(5'h15):(1'h0)] wire128;
  input wire [(3'h6):(1'h0)] wire127;
  wire [(4'ha):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire181;
  wire signed [(2'h3):(1'h0)] wire179;
  wire signed [(5'h13):(1'h0)] wire153;
  wire [(5'h15):(1'h0)] wire152;
  wire [(5'h15):(1'h0)] wire151;
  wire signed [(3'h7):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire149;
  wire [(3'h5):(1'h0)] wire147;
  wire signed [(3'h7):(1'h0)] wire136;
  wire signed [(2'h2):(1'h0)] wire135;
  wire [(5'h12):(1'h0)] wire134;
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(5'h13):(1'h0)] reg146 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg144 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg140 = (1'h0);
  reg [(5'h10):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg133 = (1'h0);
  reg [(4'hb):(1'h0)] reg132 = (1'h0);
  reg [(3'h7):(1'h0)] reg131 = (1'h0);
  assign y = {wire182,
                 wire181,
                 wire179,
                 wire153,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire136,
                 wire135,
                 wire134,
                 reg148,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((wire130 + (+wire127[(3'h5):(2'h2)])) != (wire127[(2'h3):(1'h0)] ?
          ($unsigned(wire128[(2'h3):(2'h3)]) ?
              $signed(wire129) : (~wire129)) : (wire127 << ($signed(wire129) ?
              (|wire127) : wire127[(3'h6):(2'h3)])))))
        begin
          reg131 <= ((&($signed({wire128, wire128}) ?
                  (wire130[(2'h3):(1'h0)] - (wire128 ?
                      wire127 : wire127)) : ($signed(wire129) ?
                      (!wire129) : wire128[(3'h7):(3'h5)]))) ?
              {wire129[(3'h6):(3'h6)]} : wire128[(5'h10):(3'h5)]);
          reg132 <= $unsigned(wire128[(4'hd):(1'h0)]);
        end
      else
        begin
          reg131 <= (-(|(8'hbd)));
        end
      reg133 <= reg132[(4'h8):(2'h2)];
    end
  assign wire134 = wire130;
  assign wire135 = $signed(wire134);
  assign wire136 = $unsigned(({wire134} ?
                       {((~|reg131) == wire129)} : {$signed($signed(wire127))}));
  always
    @(posedge clk) begin
      if (({{$unsigned(wire136)}, reg131[(3'h6):(3'h6)]} + wire136))
        begin
          if ((!(|wire128[(4'ha):(4'ha)])))
            begin
              reg137 <= (^(+$unsigned((8'hba))));
              reg138 <= $unsigned(wire127);
            end
          else
            begin
              reg137 <= wire127[(2'h2):(2'h2)];
              reg138 <= $unsigned($signed((8'ha0)));
              reg139 <= ($unsigned(((^$unsigned(wire129)) <= $unsigned(reg131))) - reg131);
              reg140 <= (^reg133[(1'h1):(1'h0)]);
            end
          reg141 <= {reg132[(3'h4):(3'h4)]};
          reg142 <= (wire128[(5'h10):(2'h2)] ?
              ((~((wire134 > reg133) ?
                  wire129[(3'h6):(3'h5)] : $unsigned((8'ha8)))) <<< (|reg138)) : $signed({{reg131[(3'h6):(2'h3)]}}));
          if (reg137[(5'h12):(4'h8)])
            begin
              reg143 <= (wire128 <= ((~|{(!reg140),
                  ((8'hb7) ^ wire134)}) * ((reg137[(4'h9):(3'h6)] ^ (!reg141)) & (-$unsigned((7'h43))))));
              reg144 <= (reg142 ?
                  reg137[(2'h3):(2'h3)] : $signed(((&{(8'hb1)}) ?
                      ((reg132 ?
                          reg137 : reg139) + (~&(7'h42))) : $signed(((8'hb3) != reg139)))));
              reg145 <= reg132[(1'h0):(1'h0)];
            end
          else
            begin
              reg143 <= $unsigned(reg142);
              reg144 <= $unsigned({wire130[(3'h7):(3'h6)], $signed(reg131)});
              reg145 <= (!$signed($unsigned((((8'hba) && reg138) ?
                  reg144 : (~&reg132)))));
            end
        end
      else
        begin
          reg137 <= ($signed($signed($unsigned($signed(wire129)))) ?
              wire127[(2'h2):(1'h0)] : wire128);
          reg138 <= (reg132[(4'h9):(2'h3)] ?
              reg144 : ($signed((|reg144)) | $unsigned(wire130[(2'h2):(1'h1)])));
        end
      reg146 <= $unsigned($signed($signed($signed({reg139}))));
    end
  assign wire147 = (~^$signed(reg144[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg148 <= $signed($signed($signed(wire130[(4'ha):(3'h7)])));
    end
  assign wire149 = (^~(~|(8'hb5)));
  assign wire150 = (reg146[(4'h8):(1'h1)] ?
                       (reg143 ?
                           (8'hb8) : $unsigned({reg133,
                               (wire136 ?
                                   wire147 : reg139)})) : (^~$unsigned(($signed((8'hac)) ?
                           $signed(reg133) : reg141))));
  assign wire151 = reg148[(3'h7):(3'h6)];
  assign wire152 = {{(((wire151 ^ wire129) - {reg144}) ^~ wire129),
                           (!(^~$unsigned(reg139)))},
                       reg140};
  assign wire153 = wire134[(4'h9):(3'h4)];
  module154 #() modinst180 (wire179, clk, reg139, wire151, reg145, wire149);
  assign wire181 = ((($signed((wire147 && wire129)) ?
                               wire152 : $signed($unsigned(wire128))) ?
                           wire150[(3'h6):(3'h6)] : (!(~&{reg132}))) ?
                       ((($signed((8'hba)) ?
                               wire130[(4'hd):(4'ha)] : (reg143 + (8'hb7))) ?
                           $unsigned(reg132[(3'h6):(3'h4)]) : $unsigned(reg137)) != ($signed($unsigned(wire128)) ?
                           ((~reg146) ?
                               $unsigned(wire130) : (wire134 ?
                                   reg141 : reg138)) : $unsigned($unsigned((8'hb0))))) : {$unsigned((wire152 ^~ (reg142 == wire128)))});
  assign wire182 = reg143;
endmodule

module module6
#(parameter param123 = ((((((8'hb6) ? (8'hac) : (8'ha4)) && (~^(8'hab))) ? ({(8'ha8)} ^ (|(8'hb7))) : (~(^~(7'h43)))) ? ((((8'ha9) || (8'ha1)) ? {(8'haa)} : ((8'haa) ? (8'ha1) : (8'h9e))) ? (((8'hba) ? (8'ha6) : (8'hac)) - ((8'hab) ? (8'hbc) : (8'ha3))) : (((8'hab) ? (8'hb5) : (8'hac)) ? ((8'hb5) ^~ (8'ha2)) : (!(8'hb6)))) : ((^~((8'ha6) != (7'h41))) <= {((8'hb8) - (8'h9f)), (^~(8'hb2))})) & (((((8'ha8) ? (8'hb2) : (8'hac)) ? (!(8'haf)) : {(8'hbd), (8'h9e)}) ? (((8'hb9) == (7'h41)) ? ((8'hbd) ? (8'hae) : (8'ha3)) : ((8'ha9) == (8'ha6))) : ({(7'h41), (8'h9e)} ? (!(8'h9e)) : (8'ha2))) ? ((~((8'ha0) | (8'ha2))) >> ({(8'ha1), (8'hae)} ~^ (|(8'ha3)))) : (({(8'hba), (8'hba)} != ((8'haa) ^ (8'hb9))) ? (((7'h43) ^~ (8'hbd)) & ((8'ha3) ? (8'h9e) : (8'ha8))) : ((!(8'hae)) + ((7'h41) ? (8'haa) : (8'h9c)))))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'hb):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire122;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire21;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(4'h8):(1'h0)] wire120;
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  assign y = {wire122,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire21,
                 wire40,
                 wire84,
                 wire86,
                 wire120,
                 reg11,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire9[(3'h5):(3'h4)];
    end
  assign wire12 = (^~$signed(($signed({wire10}) * (^~wire7[(4'hd):(4'hc)]))));
  assign wire13 = $unsigned(wire12[(3'h6):(3'h4)]);
  assign wire14 = {$signed((~^wire13)),
                      $signed(((8'hbd) ? wire13[(2'h2):(1'h0)] : (-(+wire7))))};
  assign wire15 = $unsigned(wire12[(3'h6):(1'h1)]);
  assign wire16 = $unsigned({(|{(-wire15), $signed(reg11)}), {(8'ha8)}});
  assign wire17 = wire13;
  assign wire18 = {{(wire12 ? (^{wire17}) : $signed(wire9[(2'h2):(2'h2)]))},
                      ($unsigned(wire10) ? (~wire13) : wire10)};
  always
    @(posedge clk) begin
      reg19 <= wire7[(4'hd):(4'hc)];
      reg20 <= wire13[(1'h0):(1'h0)];
    end
  assign wire21 = (&$signed({reg19}));
  module22 #() modinst41 (.wire27(wire18), .wire26(reg20), .wire25(wire10), .clk(clk), .wire23(wire8), .wire24(wire13), .y(wire40));
  module42 #() modinst85 (wire84, clk, wire21, wire8, reg19, reg20);
  assign wire86 = (^~{$unsigned(wire84[(2'h2):(2'h2)]), wire21});
  module87 #() modinst121 (wire120, clk, wire7, wire17, reg11, wire21, reg20);
  assign wire122 = (wire12 + $unsigned($unsigned($signed((wire16 - wire21)))));
endmodule

module module87
#(parameter param118 = ((((^~{(7'h41), (8'ha5)}) != (((8'hbe) ? (8'hac) : (8'hb6)) ? (!(8'hb2)) : ((8'had) ? (8'hb6) : (8'ha2)))) & ((((8'hb1) >> (8'hb4)) ? (+(8'h9d)) : ((8'ha5) && (8'ha9))) ? (+((8'ha8) ? (8'ha4) : (8'hb4))) : (((8'ha4) ? (8'ha1) : (8'hbe)) == (8'h9d)))) > {(8'hbe)}), 
parameter param119 = param118)
(y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire92;
  input wire signed [(3'h5):(1'h0)] wire91;
  input wire [(4'hd):(1'h0)] wire90;
  input wire signed [(5'h15):(1'h0)] wire89;
  input wire [(4'hf):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire signed [(2'h3):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire101;
  wire [(4'hf):(1'h0)] wire100;
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg [(4'he):(1'h0)] reg114 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg107 = (1'h0);
  reg [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
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
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned($signed(($unsigned(wire91) ?
              (wire90 ? wire89 : (8'hbd)) : (wire90 <<< wire91)))) ?
          wire88[(2'h3):(1'h1)] : $signed($signed((&wire88)))))
        begin
          reg93 <= ({(wire92 ?
                  ($signed(wire89) ?
                      $unsigned(wire92) : $unsigned(wire89)) : $unsigned(wire92)),
              wire88[(1'h0):(1'h0)]} & wire90[(4'hd):(4'hc)]);
          reg94 <= $signed({$signed(($signed(wire92) <<< (wire91 == wire92))),
              (((wire89 < (8'hb2)) ? $signed(wire89) : wire88[(4'hd):(3'h7)]) ?
                  {wire90[(1'h0):(1'h0)], (-wire91)} : ((wire88 ?
                          wire90 : wire88) ?
                      wire90[(3'h7):(1'h1)] : (wire90 & wire90)))});
          reg95 <= (wire92 != ({reg94, (wire90 - reg94)} ?
              (wire91[(1'h0):(1'h0)] ?
                  wire90[(1'h0):(1'h0)] : (!(reg94 >> (8'haa)))) : $unsigned(wire92[(4'hf):(4'hd)])));
        end
      else
        begin
          reg93 <= (^~($signed(((wire91 ? wire92 : wire90) ?
              (reg94 ? wire88 : reg95) : {wire89, reg93})) >> reg95));
          reg94 <= (reg93 >> reg94[(2'h2):(1'h1)]);
        end
      reg96 <= wire92[(3'h7):(3'h7)];
      reg97 <= reg93;
      reg98 <= ({(reg93[(4'ha):(2'h2)] >>> ((^reg96) ^~ ((8'ha0) ^ wire92)))} ?
          $unsigned(($unsigned($unsigned(wire91)) == reg95[(2'h2):(1'h0)])) : $signed({(~(~^wire90))}));
      reg99 <= ((|(~&reg94[(2'h3):(1'h1)])) < wire90[(1'h1):(1'h0)]);
    end
  assign wire100 = (((^~$unsigned({reg98, reg95})) ? (8'ha0) : reg94) ?
                       reg94 : $unsigned($signed(reg93)));
  assign wire101 = reg97;
  assign wire102 = $signed(reg94[(5'h11):(4'hb)]);
  assign wire103 = reg93;
  assign wire104 = ($signed(($unsigned((&reg96)) ^~ {{reg94},
                           $signed(wire103)})) ?
                       (8'hb4) : $signed($unsigned(reg95[(1'h0):(1'h0)])));
  assign wire105 = wire88;
  always
    @(posedge clk) begin
      reg106 <= (((reg97[(3'h5):(1'h0)] ?
              (|reg99) : wire101) && (($signed(wire91) ?
                  $signed(wire103) : $signed((7'h40))) ?
              wire103 : reg95)) ?
          (~((wire102 ?
              reg97 : $unsigned(wire89)) ^ $unsigned((!wire88)))) : wire101);
    end
  always
    @(posedge clk) begin
      reg107 <= $signed($unsigned(((8'haf) ? (&{wire90, wire102}) : wire100)));
      if (({(~|$signed((~&reg96))), ($signed(wire103[(2'h2):(1'h0)]) + reg97)} ?
          $signed(wire104[(2'h3):(2'h2)]) : reg106))
        begin
          reg108 <= {((({wire103} ?
                  (~wire90) : (^~wire91)) ~^ ((~|reg106) ^~ reg107)) >>> (!$unsigned(reg99[(4'hd):(4'hb)])))};
        end
      else
        begin
          reg108 <= (reg96[(4'h8):(3'h6)] & $signed((~&(+(^wire103)))));
          reg109 <= wire91[(1'h1):(1'h1)];
        end
      reg110 <= (^$signed($unsigned(wire88[(3'h6):(3'h6)])));
      reg111 <= ($unsigned($signed(((~^reg95) ?
          $signed(wire88) : reg94))) >= wire104);
      if ({(({(wire105 ~^ wire91), {wire101, reg95}} < (~|{reg106, reg111})) ?
              $signed((!reg97[(3'h5):(3'h5)])) : reg111[(5'h15):(3'h6)])})
        begin
          reg112 <= wire90[(3'h7):(1'h0)];
          reg113 <= reg99[(4'hc):(4'h8)];
          if ((-reg99[(2'h2):(2'h2)]))
            begin
              reg114 <= $unsigned(reg112);
            end
          else
            begin
              reg114 <= reg96[(2'h3):(1'h0)];
              reg115 <= (7'h43);
              reg116 <= (+reg109);
            end
          reg117 <= $signed(((|$signed($signed(reg108))) ?
              (((reg107 ^~ wire104) ?
                  $signed(wire90) : (!reg108)) ~^ reg106) : (~{wire105[(2'h3):(1'h0)],
                  wire89[(4'h9):(1'h1)]})));
        end
      else
        begin
          reg112 <= $unsigned($unsigned({((reg111 ? wire100 : reg107) ?
                  (~|(8'hab)) : {reg112}),
              (reg97 <= (reg98 ? reg98 : wire104))}));
          reg113 <= $unsigned($unsigned(reg109));
        end
    end
endmodule

module module42
#(parameter param83 = {(~&((^((8'hb9) ? (8'ha9) : (8'hb4))) || (((8'ha2) == (8'ha5)) ? (~^(8'haa)) : {(8'hb6), (8'ha8)})))})
(y, clk, wire46, wire45, wire44, wire43);
  output wire [(32'h19a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire46;
  input wire [(4'ha):(1'h0)] wire45;
  input wire [(4'hd):(1'h0)] wire44;
  input wire [(4'hf):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire81;
  wire [(2'h2):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(5'h13):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire49,
                 wire48,
                 wire47,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 (1'h0)};
  assign wire47 = ((!{($unsigned((8'had)) ^~ $unsigned(wire43)),
                      wire44}) - {wire44,
                      (($signed(wire44) ?
                          {wire45} : $signed(wire46)) ^ wire45[(4'ha):(1'h0)])});
  assign wire48 = wire43;
  assign wire49 = wire45;
  always
    @(posedge clk) begin
      reg50 <= (wire45 >>> wire48[(3'h7):(2'h2)]);
      if ((wire48 ?
          {wire44[(1'h1):(1'h0)]} : (~&$unsigned(wire48[(3'h7):(3'h7)]))))
        begin
          reg51 <= $unsigned((wire48 ^~ $unsigned((wire44[(2'h3):(2'h2)] ?
              $signed((8'hb8)) : (wire43 ? wire45 : wire43)))));
          reg52 <= wire45[(3'h7):(3'h7)];
          reg53 <= (($signed(wire44) ?
              (reg51 ?
                  (~^wire45) : $signed(reg50[(3'h5):(2'h3)])) : (+(8'hb8))) < reg50[(1'h1):(1'h0)]);
        end
      else
        begin
          if ($signed((^($unsigned((wire46 ^~ reg52)) <= wire48[(2'h3):(2'h2)]))))
            begin
              reg51 <= wire46;
              reg52 <= $unsigned((&wire47));
              reg53 <= ($unsigned(wire44) & wire48);
            end
          else
            begin
              reg51 <= $signed($unsigned($signed(wire43[(4'hc):(2'h3)])));
              reg52 <= $signed((~^reg51[(3'h7):(3'h7)]));
              reg53 <= $signed(wire47[(3'h7):(3'h6)]);
            end
          if ($unsigned($signed({$unsigned($unsigned(wire48))})))
            begin
              reg54 <= ((wire48 ?
                  ($unsigned(reg50[(2'h3):(1'h0)]) ?
                      ((wire49 == wire43) ?
                          (wire44 ?
                              (8'hbe) : reg51) : reg51[(3'h7):(1'h1)]) : ((wire46 ^ wire48) > wire44[(4'h9):(3'h4)])) : wire43) - reg50[(1'h0):(1'h0)]);
              reg55 <= wire48[(3'h4):(2'h3)];
              reg56 <= (reg51[(4'h8):(2'h3)] ^~ (8'hbe));
              reg57 <= $signed(($unsigned($signed($signed((7'h42)))) != reg54));
            end
          else
            begin
              reg54 <= wire49;
              reg55 <= (!(reg54 ?
                  (8'hae) : (^({reg55, reg52} >= ((8'ha3) << reg57)))));
            end
          reg58 <= wire49[(4'h9):(3'h5)];
          reg59 <= wire44;
          reg60 <= reg53;
        end
      reg61 <= ($signed(reg51) ? $unsigned((8'hb3)) : (8'hbf));
    end
  assign wire62 = (reg51 && $unsigned($signed(({wire43, (8'hbc)} ?
                      reg57 : (^~reg59)))));
  assign wire63 = $signed(((reg51[(2'h3):(1'h1)] * $signed((reg51 ?
                          (7'h40) : reg50))) ?
                      reg60[(1'h0):(1'h0)] : wire46));
  assign wire64 = reg60[(3'h6):(3'h4)];
  assign wire65 = $signed(reg60[(3'h6):(3'h4)]);
  assign wire66 = reg57[(3'h5):(2'h2)];
  assign wire67 = wire47;
  assign wire68 = $signed(wire44[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg69 <= reg59;
      reg70 <= (+reg56[(3'h4):(2'h3)]);
      reg71 <= (|$unsigned(((~|$signed(wire63)) ?
          (^reg53) : ($signed(wire47) | wire66))));
      if (($signed((~^{wire43})) ? reg60 : reg53))
        begin
          reg72 <= $unsigned((reg53[(1'h0):(1'h0)] ?
              reg70 : (wire64[(3'h6):(3'h5)] == (~&(8'hac)))));
          reg73 <= ($signed(($signed({(8'hbc)}) ?
                  wire65 : ((wire45 ?
                      wire45 : wire43) >>> wire48[(2'h2):(2'h2)]))) ?
              $signed(($signed($signed(reg60)) ?
                  (~^$unsigned(reg72)) : {$signed(wire65)})) : wire47[(4'ha):(2'h2)]);
          reg74 <= (($signed(reg72[(2'h2):(1'h0)]) - reg57) | (!(wire47[(4'ha):(3'h6)] + $signed($signed(reg59)))));
          reg75 <= reg53[(2'h2):(2'h2)];
          reg76 <= (~$signed(reg74[(3'h7):(2'h2)]));
        end
      else
        begin
          reg72 <= $unsigned(reg57);
        end
      reg77 <= $unsigned($signed(reg61));
    end
  assign wire78 = reg70;
  assign wire79 = (~&reg59[(4'hb):(4'h9)]);
  assign wire80 = ($unsigned($unsigned(wire46)) - (reg59 ?
                      (~&wire46) : reg53[(2'h3):(1'h1)]));
  assign wire81 = (+(&$unsigned(($unsigned(wire64) ?
                      (&wire63) : reg56[(2'h3):(2'h2)]))));
  assign wire82 = wire45[(4'ha):(2'h3)];
endmodule

module module22
#(parameter param38 = ({{{((8'hb1) ? (8'ha6) : (8'hbe)), (~&(8'hb8))}}, (({(8'hba)} ? (8'ha5) : ((8'ha3) ? (8'hb2) : (8'hb5))) ? ((+(8'ha0)) ? ((8'haa) * (8'ha3)) : ((8'ha9) != (8'ha8))) : (((8'hac) >>> (8'hb2)) ? ((8'hb8) == (8'hb2)) : (~(8'hbb))))} == ((-({(8'ha0), (8'ha5)} ? {(8'hb1)} : {(8'hbb), (8'ha5)})) ? ((!((8'hbc) ? (8'hbb) : (8'h9c))) ? (((8'ha4) ? (8'hb1) : (8'ha0)) == {(8'hbc), (7'h41)}) : ((^(8'h9e)) ? ((8'hb7) > (8'h9c)) : (~(8'hae)))) : (7'h44))), 
parameter param39 = (|(~^(&param38))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire27;
  input wire signed [(5'h11):(1'h0)] wire26;
  input wire signed [(4'hb):(1'h0)] wire25;
  input wire [(3'h4):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire28,
                 reg30,
                 (1'h0)};
  assign wire28 = {$signed($unsigned({(~|wire27), $unsigned(wire23)})),
                      $signed(((&wire27) << ((-(8'ha3)) * $unsigned(wire23))))};
  assign wire29 = wire25;
  always
    @(posedge clk) begin
      reg30 <= ($unsigned((~&wire24)) ?
          ((^$signed((8'hb8))) * $unsigned($signed(wire27[(2'h3):(2'h2)]))) : wire25);
    end
  assign wire31 = wire28[(4'he):(4'hd)];
  assign wire32 = $unsigned(((+$unsigned((wire24 ?
                      wire31 : wire24))) & $signed(({wire27, wire26} ?
                      $signed(wire25) : reg30[(3'h6):(2'h3)]))));
  assign wire33 = $signed($unsigned((wire32[(1'h0):(1'h0)] | ((-(8'ha0)) ?
                      (wire28 >= wire26) : wire23))));
  assign wire34 = reg30[(4'ha):(3'h4)];
  assign wire35 = ($signed((~&$unsigned(wire25[(4'h9):(2'h2)]))) ?
                      wire23 : wire33[(3'h6):(2'h2)]);
  assign wire36 = $unsigned($unsigned($signed($unsigned($unsigned(wire32)))));
  assign wire37 = (wire24 ? wire32 : (+wire27[(2'h2):(1'h1)]));
endmodule

module module154
#(parameter param178 = (({(8'hbb), ({(8'h9d), (7'h43)} ? ((8'hb6) ? (8'haf) : (8'ha3)) : ((7'h44) * (7'h40)))} ? (^((|(8'ha2)) ? ((8'h9d) << (8'ha0)) : (8'hbe))) : {(7'h43)}) ? (-(((~&(7'h41)) ? (!(8'hbc)) : ((8'haa) ~^ (8'hb5))) ? (((7'h41) ? (8'ha0) : (8'ha4)) <= {(7'h44)}) : (~|((8'hb4) ? (8'hb7) : (8'hbc))))) : (8'hb3)))
(y, clk, wire158, wire157, wire156, wire155);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire158;
  input wire [(5'h15):(1'h0)] wire157;
  input wire signed [(4'ha):(1'h0)] wire156;
  input wire signed [(4'he):(1'h0)] wire155;
  wire signed [(5'h12):(1'h0)] wire177;
  wire signed [(5'h12):(1'h0)] wire176;
  wire [(3'h7):(1'h0)] wire175;
  wire signed [(4'h8):(1'h0)] wire174;
  wire signed [(5'h10):(1'h0)] wire173;
  wire [(4'hc):(1'h0)] wire172;
  wire [(4'hd):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire170;
  wire [(4'hd):(1'h0)] wire169;
  wire [(3'h7):(1'h0)] wire168;
  wire [(4'he):(1'h0)] wire167;
  wire [(3'h4):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire signed [(4'ha):(1'h0)] wire164;
  wire [(2'h2):(1'h0)] wire163;
  wire [(5'h11):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire160;
  reg [(5'h13):(1'h0)] reg159 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 reg159,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg159 <= wire157;
    end
  assign wire160 = (((+(!(~(8'hb1)))) ?
                       ((^~wire158) >>> (~$signed(reg159))) : (((-(8'h9f)) <= $signed(wire156)) ?
                           {wire155[(3'h6):(1'h1)]} : wire155)) || reg159);
  assign wire161 = $unsigned((($unsigned($signed((8'hb9))) <<< wire157[(5'h15):(4'h9)]) ?
                       (wire155[(4'hb):(4'ha)] ?
                           $signed(reg159) : $unsigned((&(8'ha2)))) : $signed(reg159[(4'ha):(4'h8)])));
  assign wire162 = $signed(wire156[(4'h8):(3'h6)]);
  assign wire163 = wire161;
  assign wire164 = $unsigned($unsigned($signed(wire161[(4'he):(3'h6)])));
  assign wire165 = $unsigned($signed(((~^$unsigned(wire157)) ?
                       $signed(reg159) : ($signed((8'h9d)) ?
                           $signed(wire160) : wire158[(3'h4):(3'h4)]))));
  assign wire166 = (~^$unsigned(wire157[(4'he):(3'h5)]));
  assign wire167 = ({(wire162[(4'hd):(3'h6)] ?
                           {(~^wire156),
                               $signed(wire156)} : reg159)} + (^wire160));
  assign wire168 = $signed(wire163);
  assign wire169 = $signed(((($signed(reg159) ? $signed((8'hb9)) : wire167) ?
                           $signed($signed(wire164)) : wire167) ?
                       (wire155[(4'hc):(2'h2)] ? wire158 : wire165) : reg159));
  assign wire170 = wire168;
  assign wire171 = (!(~&($signed({reg159, (8'hbc)}) * (8'ha9))));
  assign wire172 = (((-(-(8'h9e))) << {{wire160, (^~wire165)},
                           ((!wire166) <<< wire155[(3'h6):(3'h4)])}) ?
                       wire166 : (^~$unsigned(wire170)));
  assign wire173 = (!((((wire170 ? wire172 : wire170) ?
                               {(8'hbb), wire169} : (8'ha7)) ?
                           $unsigned(((8'haa) ^~ wire170)) : $unsigned(((8'hbb) ?
                               (8'hb2) : wire172))) ?
                       $unsigned(wire161) : wire171[(3'h6):(1'h0)]));
  assign wire174 = {wire167, wire173[(3'h5):(3'h5)]};
  assign wire175 = (({($unsigned(reg159) ?
                               wire166[(3'h4):(2'h3)] : $unsigned(wire165)),
                           $signed(wire157)} > wire168) ?
                       $unsigned((wire161[(4'hd):(3'h5)] + ($unsigned(wire166) >>> (wire167 ?
                           wire169 : wire165)))) : (^wire164[(3'h6):(1'h0)]));
  assign wire176 = ({wire173[(1'h0):(1'h0)]} <<< wire157[(4'hb):(1'h0)]);
  assign wire177 = ((8'ha5) ?
                       (wire163 ?
                           ($signed((wire174 ?
                               wire167 : wire157)) | (~^$unsigned(wire172))) : {$unsigned($unsigned(wire170))}) : (~^{(-(8'hbb))}));
endmodule
