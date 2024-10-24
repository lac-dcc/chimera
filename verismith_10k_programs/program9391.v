module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire198;
  wire [(5'h10):(1'h0)] wire197;
  wire [(4'he):(1'h0)] wire196;
  wire signed [(4'hb):(1'h0)] wire195;
  wire [(2'h2):(1'h0)] wire193;
  wire signed [(4'h9):(1'h0)] wire192;
  wire signed [(3'h6):(1'h0)] wire191;
  wire [(5'h14):(1'h0)] wire190;
  wire signed [(4'hf):(1'h0)] wire189;
  wire signed [(4'hc):(1'h0)] wire187;
  wire signed [(5'h14):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  wire signed [(4'he):(1'h0)] wire129;
  wire [(4'he):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire4;
  assign y = {wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire187,
                 wire132,
                 wire131,
                 wire129,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned(($unsigned($signed((~&wire2))) ?
                     ((^(&wire2)) && wire1[(1'h0):(1'h0)]) : $unsigned((wire3[(2'h3):(2'h2)] ?
                         $unsigned(wire1) : wire0))));
  assign wire5 = wire2[(3'h5):(3'h5)];
  assign wire6 = ($signed(wire2[(2'h3):(2'h3)]) | wire1[(2'h2):(1'h1)]);
  assign wire7 = ((8'ha7) || (8'hb2));
  assign wire8 = $signed(((-((8'hb3) != $unsigned(wire7))) == (((wire2 ?
                     wire2 : wire2) >>> wire3[(1'h0):(1'h0)]) < (+$signed(wire0)))));
  assign wire9 = ($unsigned((($unsigned(wire2) - (&(8'ha3))) && $unsigned((wire1 | wire0)))) ?
                     wire5[(4'h8):(4'h8)] : wire1[(3'h4):(1'h1)]);
  assign wire10 = wire0;
  assign wire11 = $signed($signed({$unsigned($unsigned(wire4))}));
  module12 #() modinst130 (wire129, clk, wire3, wire0, wire11, wire5);
  assign wire131 = ($unsigned(($signed(wire6) ~^ wire3[(4'h9):(1'h0)])) ?
                       ($unsigned(wire129[(3'h6):(3'h4)]) ?
                           (wire129 ?
                               ($signed(wire3) ?
                                   wire9 : $unsigned(wire129)) : {wire0[(1'h0):(1'h0)],
                                   (wire10 ?
                                       wire1 : (8'hac))}) : wire2[(2'h2):(2'h2)]) : (wire1 ?
                           $unsigned(wire7[(4'hd):(3'h5)]) : $signed((|wire11))));
  assign wire132 = wire131;
  module133 #() modinst188 (.wire135(wire4), .wire134(wire0), .wire137(wire132), .clk(clk), .y(wire187), .wire136(wire10));
  assign wire189 = (-((wire5[(5'h13):(3'h6)] ?
                           $signed(wire132[(5'h14):(4'h9)]) : {wire131[(2'h2):(1'h1)],
                               (-wire187)}) ?
                       $signed((~^wire7[(4'h9):(2'h2)])) : $unsigned(wire10[(1'h0):(1'h0)])));
  assign wire190 = $signed(wire6);
  assign wire191 = (wire189[(3'h6):(3'h4)] || (-(^(!$unsigned(wire10)))));
  assign wire192 = (+wire3[(5'h10):(3'h4)]);
  module133 #() modinst194 (wire193, clk, wire132, wire131, wire11, wire6);
  assign wire195 = wire192[(1'h1):(1'h1)];
  assign wire196 = wire9[(2'h3):(2'h2)];
  assign wire197 = $unsigned($signed(wire11[(4'hd):(1'h1)]));
  assign wire198 = (wire190[(5'h12):(4'hc)] ^~ (~wire131[(2'h3):(2'h3)]));
endmodule

module module133
#(parameter param185 = ({{{(!(8'ha5))}}, (&{((8'ha5) + (8'hb2))})} ^ (|((((8'hb8) ? (7'h42) : (8'ha0)) ? (|(8'ha3)) : ((7'h43) <= (8'hb8))) == ((~&(8'ha9)) ? ((8'h9c) ? (8'haa) : (8'hac)) : {(8'hbf)})))), 
parameter param186 = param185)
(y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire137;
  input wire signed [(3'h4):(1'h0)] wire136;
  input wire [(4'ha):(1'h0)] wire135;
  input wire [(4'hf):(1'h0)] wire134;
  wire [(4'h9):(1'h0)] wire184;
  wire signed [(2'h2):(1'h0)] wire167;
  wire [(3'h4):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire138;
  reg signed [(3'h4):(1'h0)] reg183 = (1'h0);
  reg [(3'h4):(1'h0)] reg182 = (1'h0);
  reg [(4'hb):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg177 = (1'h0);
  reg [(5'h10):(1'h0)] reg176 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg175 = (1'h0);
  reg [(4'h8):(1'h0)] reg174 = (1'h0);
  reg [(5'h15):(1'h0)] reg173 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg172 = (1'h0);
  reg [(5'h10):(1'h0)] reg171 = (1'h0);
  reg [(5'h11):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg [(3'h5):(1'h0)] reg140 = (1'h0);
  reg [(5'h14):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg [(4'hc):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg [(4'hc):(1'h0)] reg149 = (1'h0);
  assign y = {wire184,
                 wire167,
                 wire151,
                 wire150,
                 wire138,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg139,
                 reg140,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 (1'h0)};
  assign wire138 = wire135[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg139 <= wire136[(2'h2):(1'h0)];
      reg140 <= wire137;
      reg141 <= (((~|$unsigned(((8'hbb) < reg139))) < ((wire138[(3'h7):(1'h0)] ^ $unsigned(reg139)) >> $unsigned(wire138))) ?
          ($signed(wire137) + wire134) : reg140);
      if ($signed((8'hb4)))
        begin
          if ((-wire138))
            begin
              reg142 <= $signed($signed(wire137[(4'hb):(3'h5)]));
              reg143 <= $signed(($unsigned(wire134[(4'hd):(4'hb)]) == ($signed($signed(reg139)) || (+$unsigned(reg141)))));
              reg144 <= (reg142 ?
                  ($unsigned($unsigned($signed(reg142))) ?
                      {((reg141 ?
                              wire137 : reg141) ^~ reg140)} : wire137) : (wire138[(2'h2):(1'h0)] - (7'h43)));
              reg145 <= {((^reg144[(2'h2):(2'h2)]) ?
                      wire138 : reg140[(1'h1):(1'h1)]),
                  ((-($unsigned(reg140) != (reg140 - wire135))) ?
                      wire137 : wire138[(2'h3):(1'h1)])};
              reg146 <= wire134[(3'h5):(1'h1)];
            end
          else
            begin
              reg142 <= wire137;
              reg143 <= $unsigned(reg140[(1'h0):(1'h0)]);
              reg144 <= reg146;
            end
          reg147 <= reg146;
          reg148 <= wire136;
          reg149 <= $unsigned($signed($signed((8'hab))));
        end
      else
        begin
          if ((~reg148[(1'h0):(1'h0)]))
            begin
              reg142 <= $signed(reg139);
            end
          else
            begin
              reg142 <= wire136[(2'h2):(1'h1)];
              reg143 <= $signed($signed(((reg149 ?
                      ((7'h43) ^~ wire135) : (reg146 - wire135)) ?
                  ({(7'h41), (8'ha7)} ?
                      (reg144 ?
                          wire137 : reg139) : reg142) : $signed(reg139[(2'h2):(2'h2)]))));
            end
          reg144 <= (reg147 ?
              $unsigned(({{(8'hb6), reg141}, reg146[(1'h0):(1'h0)]} ?
                  {{wire134, reg145}, (reg148 == wire137)} : {reg147,
                      wire136})) : (+wire135[(1'h1):(1'h1)]));
        end
    end
  assign wire150 = (-reg144[(1'h0):(1'h0)]);
  assign wire151 = ((reg149 ?
                       ($unsigned({(8'ha1)}) < (~&$signed(wire136))) : reg146[(1'h0):(1'h0)]) < (+wire138[(3'h7):(3'h7)]));
  module152 #() modinst168 (wire167, clk, wire134, reg144, reg142, wire150, reg146);
  always
    @(posedge clk) begin
      reg169 <= wire137[(3'h5):(2'h3)];
      if ($signed(reg145))
        begin
          if (reg140[(3'h4):(1'h1)])
            begin
              reg170 <= wire134;
              reg171 <= reg143;
              reg172 <= $signed($unsigned($signed((~^$signed(reg146)))));
            end
          else
            begin
              reg170 <= $unsigned((~|(((reg142 ? reg148 : wire138) ?
                  $unsigned(wire137) : $unsigned(wire151)) << wire151)));
              reg171 <= {reg146[(2'h3):(1'h0)], $unsigned(wire150)};
              reg172 <= (^~(~$signed({(&reg147)})));
            end
          reg173 <= ($unsigned((-$signed($signed((8'hbf))))) ^ reg171[(1'h1):(1'h0)]);
        end
      else
        begin
          reg170 <= {((wire151[(2'h3):(1'h0)] ?
                  $unsigned($unsigned(reg148)) : $signed((&wire138))) ^ reg140),
              (reg170[(4'h8):(1'h1)] ?
                  $signed($unsigned(reg143[(4'h9):(4'h9)])) : reg149)};
          reg171 <= $signed(wire151);
        end
      if ((reg148[(1'h0):(1'h0)] ?
          {reg140} : (|(&(reg147[(3'h4):(3'h4)] ?
              (wire137 && reg142) : wire167[(2'h2):(1'h1)])))))
        begin
          reg174 <= ($unsigned($unsigned(reg144[(1'h1):(1'h0)])) ?
              $unsigned($signed($unsigned((+reg170)))) : $signed(reg145));
          reg175 <= reg144;
          if (wire134)
            begin
              reg176 <= {{(!$unsigned(reg145[(2'h2):(2'h2)])),
                      $signed(reg143)}};
              reg177 <= (wire151 >= (wire150 != ($unsigned({wire167}) ^~ (wire134[(4'hc):(1'h1)] ?
                  $unsigned(wire134) : (wire150 ? reg170 : (8'hb5))))));
              reg178 <= $signed($unsigned(reg169[(3'h7):(1'h1)]));
              reg179 <= (!reg176);
            end
          else
            begin
              reg176 <= reg140[(1'h0):(1'h0)];
              reg177 <= $unsigned(reg149[(3'h7):(1'h1)]);
              reg178 <= (reg177 ?
                  $unsigned((^~wire136)) : wire137[(4'hc):(4'ha)]);
              reg179 <= wire134;
              reg180 <= (^($unsigned(reg139) ?
                  wire150[(1'h0):(1'h0)] : (((8'hb4) >> $signed(wire167)) ?
                      (~|wire137[(3'h7):(2'h2)]) : ($signed(reg140) ?
                          $unsigned(reg174) : reg172))));
            end
          reg181 <= (&reg177);
          reg182 <= reg180;
        end
      else
        begin
          reg174 <= (8'ha3);
        end
      reg183 <= wire136;
    end
  assign wire184 = $unsigned(((reg147[(3'h7):(2'h3)] ?
                       ($signed(wire151) ~^ (&reg169)) : $signed($signed(wire135))) << (+((~|reg182) ?
                       $unsigned(reg183) : reg141))));
endmodule

module module12
#(parameter param128 = ((((((8'hab) < (8'hb3)) == ((8'hb9) && (8'hbc))) ? (~^((8'h9c) <<< (8'ha7))) : (|(~&(8'ha4)))) < (((^~(8'hb5)) ? (-(8'hb9)) : ((8'hb3) ? (8'had) : (8'h9c))) & ((!(8'ha5)) - ((8'hb2) ? (8'h9c) : (8'hba))))) <<< (-(~|((~&(8'haf)) ? {(7'h43), (7'h40)} : ((8'hb7) ? (8'ha5) : (8'hba)))))))
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h110):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire15;
  input wire signed [(5'h12):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire127;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(4'hb):(1'h0)] wire99;
  wire signed [(5'h10):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire42;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(3'h6):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire96;
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  assign y = {wire127,
                 wire125,
                 wire99,
                 wire98,
                 wire17,
                 wire18,
                 wire42,
                 wire44,
                 wire49,
                 wire50,
                 wire51,
                 wire58,
                 wire96,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 (1'h0)};
  assign wire17 = (wire13 ^~ (^~$unsigned($unsigned($unsigned(wire14)))));
  assign wire18 = $signed((^((^~wire13[(3'h7):(2'h2)]) ?
                      wire16[(2'h2):(1'h0)] : $unsigned((|(8'had))))));
  module19 #() modinst43 (wire42, clk, wire17, wire14, wire13, wire15);
  assign wire44 = {$unsigned(wire18[(2'h2):(1'h1)]),
                      $unsigned(($signed({wire42,
                          wire16}) || ((wire15 + wire14) ?
                          $unsigned((8'ha7)) : (~&wire15))))};
  always
    @(posedge clk) begin
      reg45 <= $unsigned(((^~wire44[(1'h1):(1'h0)]) ?
          $unsigned((|$unsigned(wire16))) : wire14[(3'h6):(2'h3)]));
      if ({{(~|wire14[(4'ha):(3'h5)]), wire15[(4'hb):(2'h3)]},
          $unsigned((~$unsigned($signed(wire17))))})
        begin
          reg46 <= (&((wire13 ? wire18[(1'h1):(1'h1)] : {wire14}) ?
              (+wire15[(2'h2):(2'h2)]) : {{{wire18, reg45}, (|reg45)},
                  $unsigned($signed(wire17))}));
          reg47 <= wire42[(1'h1):(1'h0)];
          reg48 <= (reg46 <<< $signed(reg47[(3'h4):(2'h3)]));
        end
      else
        begin
          reg46 <= (^~(!wire17));
        end
    end
  assign wire49 = $signed((wire15[(4'hb):(2'h2)] || wire14[(4'hd):(2'h2)]));
  assign wire50 = $unsigned($unsigned(wire42[(4'hf):(4'h9)]));
  assign wire51 = wire44[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (((~|(wire18[(1'h0):(1'h0)] <<< $signed((wire49 | wire51)))) ^ $unsigned($unsigned(((8'hb1) * (wire17 & wire51))))))
        begin
          reg52 <= $unsigned($signed(({wire16} << {{(8'hba)}})));
          if (reg47[(3'h5):(3'h4)])
            begin
              reg53 <= reg47;
            end
          else
            begin
              reg53 <= $unsigned($unsigned(wire42));
              reg54 <= ((($unsigned({reg46, wire50}) ?
                      ((wire13 << reg46) <<< reg53[(2'h2):(1'h1)]) : $signed(wire13)) ?
                  wire42 : wire17[(2'h2):(1'h0)]) >= reg47[(1'h0):(1'h0)]);
            end
          reg55 <= reg48[(4'hf):(4'hd)];
        end
      else
        begin
          reg52 <= wire44;
          reg53 <= {($unsigned(wire42) ?
                  $signed((~$unsigned(reg55))) : (|(!wire16)))};
          reg54 <= reg45;
        end
      reg56 <= $unsigned($unsigned($unsigned({(wire15 ? reg45 : (7'h43)),
          (~reg52)})));
      reg57 <= ($unsigned((((~|wire51) ?
          ((7'h40) <<< reg45) : $unsigned(wire44)) != (((8'h9c) >> reg56) ?
          (reg48 <<< wire50) : (reg55 << wire44)))) ^~ $unsigned({wire50[(1'h0):(1'h0)]}));
    end
  assign wire58 = reg57[(3'h7):(3'h4)];
  module59 #() modinst97 (.clk(clk), .wire60(reg47), .y(wire96), .wire61(reg56), .wire62(reg46), .wire63(wire17));
  assign wire98 = $unsigned($signed($unsigned((wire14[(4'ha):(4'h8)] | (wire49 ^ (8'hab))))));
  assign wire99 = (wire44 + ($signed((8'ha4)) ?
                      (~^((wire15 * reg57) ?
                          (wire15 ? wire18 : reg48) : (reg55 ?
                              wire44 : wire51))) : wire49[(1'h1):(1'h1)]));
  module100 #() modinst126 (.wire103(reg47), .wire104(wire98), .wire102(reg48), .clk(clk), .y(wire125), .wire101(wire16));
  assign wire127 = ((^~wire13) != wire18[(2'h2):(1'h0)]);
endmodule

module module100
#(parameter param124 = {({({(8'hb2)} || (8'ha7))} ? (~&(((8'h9c) ? (8'hae) : (8'ha9)) != ((8'hbe) - (8'hba)))) : (-{{(8'haf), (8'hac)}, (&(7'h41))}))})
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire104;
  input wire [(5'h13):(1'h0)] wire103;
  input wire [(5'h10):(1'h0)] wire102;
  input wire signed [(5'h12):(1'h0)] wire101;
  wire signed [(3'h7):(1'h0)] wire123;
  wire [(4'hf):(1'h0)] wire119;
  wire [(4'h9):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire117;
  wire signed [(5'h14):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire109;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire107;
  wire signed [(5'h13):(1'h0)] wire106;
  wire signed [(4'hb):(1'h0)] wire105;
  reg [(4'hd):(1'h0)] reg122 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg [(3'h4):(1'h0)] reg114 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  assign y = {wire123,
                 wire119,
                 wire118,
                 wire117,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 reg122,
                 reg121,
                 reg120,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  assign wire105 = $signed($unsigned({$signed(wire103[(4'he):(4'hc)])}));
  assign wire106 = ($unsigned((-wire103[(3'h5):(3'h5)])) ?
                       wire102 : ({$signed(wire105),
                           wire103} ^ $unsigned($signed((wire105 <<< wire101)))));
  assign wire107 = ($signed(wire105) ?
                       {((wire102 ^ (^(8'ha0))) ?
                               ($unsigned((7'h41)) > $signed((8'hbc))) : (+(8'hbd))),
                           (-(~|(wire105 ^ wire106)))} : wire104);
  assign wire108 = {$unsigned(wire106[(5'h13):(4'hd)]),
                       ({$signed($signed(wire102))} ?
                           (&wire106[(4'he):(3'h7)]) : $unsigned((^$unsigned((8'hac)))))};
  assign wire109 = (^$signed({wire107}));
  assign wire110 = ((wire107 < (!wire105[(3'h7):(1'h1)])) <<< {wire103[(4'h9):(3'h4)]});
  assign wire111 = wire110;
  always
    @(posedge clk) begin
      reg112 <= wire105;
      reg113 <= wire101;
    end
  always
    @(posedge clk) begin
      reg114 <= wire108;
      reg115 <= (-wire105[(1'h0):(1'h0)]);
      reg116 <= {(~&(((reg113 ? wire110 : (8'hb3)) ?
              wire110[(3'h4):(2'h3)] : wire101) <= ((8'hbb) || ((8'haa) ?
              wire103 : reg113))))};
    end
  assign wire117 = (~&(wire102 < wire103));
  assign wire118 = ($signed(reg116[(1'h0):(1'h0)]) ?
                       $unsigned((8'hb9)) : $signed(wire104));
  assign wire119 = $signed($unsigned($signed({((8'hba) ? reg112 : wire106),
                       {wire104, wire110}})));
  always
    @(posedge clk) begin
      reg120 <= (~|(wire106 ? wire117[(4'h9):(3'h5)] : reg115));
      reg121 <= reg112[(4'hf):(3'h7)];
      reg122 <= reg121[(1'h0):(1'h0)];
    end
  assign wire123 = wire111;
endmodule

module module59
#(parameter param94 = (+(+{{(~(8'hb7)), ((8'hb0) ^ (8'ha2))}, ({(8'hb8), (7'h40)} ? ((8'ha3) ? (8'hbb) : (8'hae)) : (8'hbb))})), 
parameter param95 = ({{(((8'hb2) ? (8'ha1) : param94) ^ param94), {(param94 > param94)}}, ((8'hba) | (param94 + (param94 & (8'hb0))))} ? ({(param94 ? param94 : (param94 ? (8'ha3) : (8'ha8)))} ^ (param94 * (param94 == param94))) : (param94 ? (~|param94) : (((7'h42) != ((8'hb9) ? param94 : (8'hb7))) ? {((8'hbc) >= param94), (&param94)} : {param94}))))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire [(4'hc):(1'h0)] wire62;
  input wire [(4'hb):(1'h0)] wire61;
  input wire [(3'h6):(1'h0)] wire60;
  wire signed [(2'h2):(1'h0)] wire93;
  wire [(2'h3):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire [(5'h15):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire87;
  wire [(5'h10):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire67;
  wire signed [(4'he):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  reg signed [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg69 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire71,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
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
                 reg72,
                 reg70,
                 reg69,
                 (1'h0)};
  assign wire64 = wire61;
  assign wire65 = (wire61 ?
                      $signed(wire63) : $unsigned($unsigned(($signed(wire61) | $unsigned(wire64)))));
  assign wire66 = ($unsigned({wire65[(1'h0):(1'h0)]}) ?
                      (^~wire61[(4'hb):(1'h1)]) : $signed(wire64));
  assign wire67 = (((({wire62, wire63} > (&wire65)) ?
                              (^~wire62) : wire61[(3'h5):(3'h4)]) ?
                          $signed(wire66[(4'hb):(3'h4)]) : $unsigned($signed((wire61 & (8'h9c))))) ?
                      (((wire65[(2'h3):(1'h1)] ^~ (~^wire65)) ?
                              $unsigned(wire61[(4'h9):(1'h0)]) : $signed($signed((8'hbc)))) ?
                          ($signed((+(8'ha8))) >>> wire63) : (8'ha1)) : ($signed(((&wire60) ?
                          ((8'hb7) | wire66) : wire66[(4'hd):(2'h2)])) >= $unsigned($unsigned($signed(wire61)))));
  assign wire68 = $signed((wire64[(1'h1):(1'h0)] ?
                      $unsigned({(~^wire62), {wire61, wire66}}) : {((~|wire61) ?
                              $signed((8'ha1)) : wire60),
                          wire67}));
  always
    @(posedge clk) begin
      reg69 <= $signed(({$unsigned((wire60 ? wire64 : (8'hbe)))} ?
          (8'hb2) : $unsigned(($unsigned(wire65) <= $unsigned(wire63)))));
      reg70 <= $signed((wire63[(2'h2):(1'h1)] ?
          $signed($signed((wire67 ?
              wire68 : reg69))) : (~&wire64[(4'h9):(3'h4)])));
    end
  assign wire71 = (reg70 ?
                      $signed(reg70) : $signed($signed((^$signed(wire68)))));
  always
    @(posedge clk) begin
      if ($unsigned($signed((~$signed({wire67, wire67})))))
        begin
          if ($unsigned($unsigned(reg70)))
            begin
              reg72 <= (($signed(wire71) ?
                  $unsigned(reg69[(2'h2):(1'h0)]) : (&$unsigned((reg69 ?
                      reg69 : reg69)))) > wire61);
            end
          else
            begin
              reg72 <= (~^((($unsigned((8'hb2)) ?
                          {(8'ha6)} : (wire66 > wire60)) ?
                      $unsigned(wire66) : $signed((-wire62))) ?
                  (8'hab) : (($signed((8'ha6)) <= {(8'hba), (8'ha2)}) ?
                      reg70 : (reg70[(4'hc):(2'h2)] ?
                          (reg69 ? (8'hb0) : wire60) : (wire63 ?
                              wire62 : reg70)))));
              reg73 <= (((((wire67 ? wire62 : wire65) ?
                          (reg70 ?
                              (8'hba) : (8'hb5)) : $unsigned(wire67)) >> (wire65 >= $unsigned(wire71))) ?
                      $signed(wire64) : (+$signed((-reg70)))) ?
                  (^wire68) : (~(reg69 ?
                      ((wire68 ?
                          wire63 : (8'hb3)) || $unsigned(reg70)) : (((8'h9c) ?
                          wire60 : reg70) >> (-(8'h9e))))));
              reg74 <= ($unsigned($unsigned(wire61[(3'h4):(1'h1)])) ?
                  $unsigned({(8'hb5),
                      reg70[(2'h3):(2'h3)]}) : ($signed($unsigned((reg72 && wire71))) ?
                      $signed($unsigned(wire64)) : {$signed(wire66[(4'h8):(1'h1)])}));
              reg75 <= $unsigned(wire68[(4'ha):(1'h0)]);
            end
          if (($signed((({wire67} ^~ wire65[(1'h0):(1'h0)]) ?
                  $unsigned(wire68[(3'h7):(2'h3)]) : (((8'hb4) != (8'h9f)) ?
                      (wire68 ? wire65 : wire65) : {reg74, reg72}))) ?
              $unsigned({$signed(wire60)}) : wire61[(3'h6):(2'h3)]))
            begin
              reg76 <= (($signed($signed((reg69 ?
                      (8'hbd) : reg72))) && $signed(($signed((8'hb8)) | (~reg70)))) ?
                  reg70 : wire67[(4'h9):(4'h9)]);
              reg77 <= wire68;
            end
          else
            begin
              reg76 <= ((8'hb5) ~^ $signed(((reg73 ?
                      wire66[(2'h3):(1'h1)] : (wire67 ? reg75 : reg76)) ?
                  wire60[(2'h3):(1'h1)] : (~reg76))));
              reg77 <= wire60;
              reg78 <= wire68;
              reg79 <= $unsigned(reg74);
            end
          reg80 <= ({(~|reg79)} ?
              {(((wire60 ? wire62 : wire64) == ((7'h44) ~^ reg75)) ?
                      (^(reg72 ?
                          reg78 : wire64)) : $unsigned((~|wire65)))} : wire60);
          reg81 <= (&$unsigned(($unsigned(wire64) || $unsigned(wire71))));
          reg82 <= (wire64 == $signed((~((8'h9d) ^ wire68))));
        end
      else
        begin
          reg72 <= $unsigned({(~|($signed(wire60) ? reg78 : $signed(wire64)))});
          reg73 <= (wire64 ?
              (((+(wire68 ?
                  reg74 : (8'hbd))) >= reg73) << reg69[(3'h6):(3'h4)]) : $signed(($signed((+wire62)) || ($unsigned(reg81) && $unsigned(reg80)))));
          reg74 <= $unsigned(reg69);
          reg75 <= (($signed(($signed((8'had)) ^~ (!wire68))) ^ $signed($unsigned(wire68))) < ($signed($signed({(8'haf),
                  reg79})) ?
              wire61 : (~&(wire60[(1'h1):(1'h1)] ~^ wire66))));
        end
    end
  assign wire83 = (~^($unsigned(($signed(wire63) < (reg74 << (7'h40)))) ~^ (~&reg79[(4'h8):(1'h0)])));
  assign wire84 = reg69;
  assign wire85 = reg77[(3'h5):(1'h0)];
  assign wire86 = (wire71[(4'hd):(3'h5)] != ($unsigned(((~|reg81) > (wire61 ?
                          reg82 : reg79))) ?
                      {wire61} : (|$signed($unsigned(wire83)))));
  assign wire87 = reg76[(4'hb):(1'h1)];
  assign wire88 = reg79[(3'h7):(3'h5)];
  assign wire89 = $signed(wire87);
  assign wire90 = reg82[(1'h1):(1'h0)];
  assign wire91 = reg69;
  assign wire92 = wire66;
  assign wire93 = ((((wire86[(4'he):(3'h5)] ? $unsigned(wire63) : wire62) ?
                          ((wire67 & wire62) ?
                              {wire85} : (wire64 ?
                                  reg72 : (8'ha7))) : ($unsigned(wire62) << (wire62 - reg72))) | $signed($unsigned(reg70[(3'h7):(1'h0)]))) ?
                      ((({wire68, (8'hb3)} + (&wire83)) || ((wire83 > wire87) ?
                          ((8'ha4) ? wire67 : (8'ha2)) : (wire88 ?
                              wire65 : wire61))) < ((reg73[(4'he):(3'h5)] * $signed((8'ha2))) ?
                          wire84[(1'h0):(1'h0)] : wire88[(2'h2):(1'h0)])) : $signed(wire68));
endmodule

module module19
#(parameter param40 = (8'ha0), 
parameter param41 = (!(((&(param40 | param40)) ? param40 : (&(param40 || param40))) <= param40)))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  input wire signed [(5'h13):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(5'h14):(1'h0)] wire38;
  wire signed [(4'ha):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire24;
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire29,
                 wire24,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire24 = {(~^wire23[(3'h7):(3'h5)])};
  always
    @(posedge clk) begin
      reg25 <= wire20[(4'hc):(3'h5)];
      reg26 <= (reg25 ?
          wire24 : ($unsigned($unsigned($unsigned(wire21))) ?
              $unsigned((&(wire22 ^ (8'ha6)))) : wire23));
      reg27 <= reg26[(2'h3):(1'h1)];
      reg28 <= ({(-reg26[(3'h6):(2'h3)])} ?
          wire24[(4'hf):(4'hb)] : (~|($signed($signed(reg26)) ?
              (wire21[(1'h1):(1'h0)] ~^ (wire20 ? wire23 : reg26)) : wire24)));
    end
  assign wire29 = (reg25[(4'h9):(1'h1)] ?
                      ((~|$unsigned((wire24 <<< reg28))) ^ (($unsigned(wire22) >>> {wire23,
                              reg26}) ?
                          reg27 : (8'hb2))) : $signed((+(^$unsigned(wire23)))));
  always
    @(posedge clk) begin
      reg30 <= ($signed((&(-(~^reg26)))) ?
          $signed(reg26[(1'h0):(1'h0)]) : $signed(wire23[(3'h4):(2'h2)]));
      reg31 <= {($signed(wire22[(4'hd):(3'h7)]) ?
              (~^reg26) : $unsigned($unsigned((wire22 ? reg26 : wire23)))),
          wire24[(4'he):(4'he)]};
      if ((~$signed(wire29)))
        begin
          if ($unsigned(($signed(reg26) ~^ {({wire20} << (reg26 >= reg28)),
              $signed($signed(wire24))})))
            begin
              reg32 <= {$unsigned(wire22[(4'h8):(3'h5)])};
              reg33 <= wire22;
            end
          else
            begin
              reg32 <= $signed($signed((-wire22)));
            end
          reg34 <= ((~wire29) | (wire20 ?
              {$signed((reg31 ?
                      wire23 : wire20))} : (+$signed($unsigned(reg30)))));
        end
      else
        begin
          reg32 <= (((+reg32[(3'h7):(3'h6)]) ?
                  {($unsigned(reg34) ?
                          ((8'hbb) ^ reg31) : wire21[(4'he):(3'h4)]),
                      $signed($unsigned(reg34))} : reg32[(4'hb):(1'h0)]) ?
              reg31 : $unsigned({reg27}));
          reg33 <= wire20;
        end
      reg35 <= reg34;
      reg36 <= reg25;
    end
  assign wire37 = (((wire23 ?
                          {$unsigned(reg32),
                              wire23[(4'h9):(1'h0)]} : $signed({reg35,
                              wire24})) ?
                      (^~(!wire23)) : {({wire24} ?
                              $unsigned(reg33) : $unsigned((8'hb0)))}) >= $unsigned(reg25));
  assign wire38 = reg30[(1'h0):(1'h0)];
  assign wire39 = reg36[(4'ha):(3'h4)];
endmodule

module module152  (y, clk, wire157, wire156, wire155, wire154, wire153);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire157;
  input wire [(3'h6):(1'h0)] wire156;
  input wire [(3'h4):(1'h0)] wire155;
  input wire [(5'h12):(1'h0)] wire154;
  input wire signed [(5'h10):(1'h0)] wire153;
  wire signed [(4'hf):(1'h0)] wire166;
  wire signed [(3'h6):(1'h0)] wire161;
  wire [(2'h2):(1'h0)] wire160;
  wire [(4'hf):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire158;
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg signed [(4'he):(1'h0)] reg162 = (1'h0);
  assign y = {wire166,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire158 = {wire153[(2'h3):(1'h0)]};
  assign wire159 = $unsigned(wire157);
  assign wire160 = $unsigned(wire158[(3'h6):(3'h5)]);
  assign wire161 = (($unsigned(((8'h9f) ?
                           $unsigned(wire160) : wire154[(4'he):(1'h1)])) != $unsigned((wire157[(2'h2):(2'h2)] <<< wire157[(2'h2):(2'h2)]))) ?
                       ($signed(wire159[(4'hb):(2'h2)]) ?
                           wire159[(3'h5):(2'h2)] : (^$unsigned($signed(wire159)))) : ((+$unsigned($signed(wire156))) ?
                           wire157[(1'h0):(1'h0)] : wire156[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg162 <= $signed((($signed(wire153) + $signed(wire160)) ?
          $unsigned($signed($unsigned(wire154))) : wire157[(1'h1):(1'h1)]));
      reg163 <= {$signed(wire156)};
      reg164 <= $signed((~^reg163[(1'h1):(1'h0)]));
      reg165 <= ((-($signed($signed(wire154)) ?
          $signed((~^wire157)) : (+(wire158 + (8'h9e))))) >> reg163);
    end
  assign wire166 = wire161[(2'h3):(1'h1)];
endmodule
