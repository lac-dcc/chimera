module top
#(parameter param200 = ({((((8'haf) ? (8'ha7) : (8'ha9)) ? ((8'hae) ? (8'hbd) : (7'h43)) : ((8'hb9) ? (8'ha2) : (8'ha8))) - (8'hbb)), (&(+(^(7'h44))))} ? ((({(8'hbe), (8'ha6)} ? (8'hbe) : ((8'ha3) ? (8'hb2) : (8'hb3))) < (((7'h41) >>> (8'hb0)) ? (!(8'hb7)) : ((8'hb8) >= (8'hb8)))) ? (~&(~((8'hb6) ? (8'ha8) : (7'h44)))) : (({(8'hb0), (8'hb3)} ? ((8'h9c) ? (8'haf) : (8'haf)) : ((8'hbe) ~^ (8'ha3))) ^ (|((8'hbb) ? (8'hae) : (7'h44))))) : (^(~|(((8'h9d) >> (8'ha1)) ? (-(8'hb2)) : (8'hb1))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h288):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire198;
  wire signed [(4'he):(1'h0)] wire188;
  wire signed [(5'h10):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire156;
  wire [(4'hf):(1'h0)] wire155;
  wire [(5'h10):(1'h0)] wire154;
  wire [(5'h15):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire190;
  wire [(3'h7):(1'h0)] wire191;
  wire signed [(3'h7):(1'h0)] wire192;
  wire [(4'hb):(1'h0)] wire193;
  wire [(5'h10):(1'h0)] wire194;
  wire [(3'h6):(1'h0)] wire195;
  wire [(4'hf):(1'h0)] wire196;
  reg signed [(5'h12):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg161 = (1'h0);
  reg [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg165 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg167 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg170 = (1'h0);
  reg [(4'hb):(1'h0)] reg171 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg [(4'hc):(1'h0)] reg173 = (1'h0);
  reg [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg175 = (1'h0);
  reg [(5'h11):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg179 = (1'h0);
  reg [(3'h4):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg182 = (1'h0);
  reg [(2'h2):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg184 = (1'h0);
  reg [(5'h13):(1'h0)] reg185 = (1'h0);
  reg [(4'hf):(1'h0)] reg186 = (1'h0);
  reg [(4'he):(1'h0)] reg187 = (1'h0);
  assign y = {wire198,
                 wire188,
                 wire158,
                 wire156,
                 wire155,
                 wire154,
                 wire152,
                 wire94,
                 wire6,
                 wire5,
                 wire190,
                 wire191,
                 wire192,
                 wire193,
                 wire194,
                 wire195,
                 wire196,
                 reg157,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 (1'h0)};
  assign wire5 = $unsigned((-((+wire3[(4'hd):(3'h7)]) ~^ $unsigned(wire0[(4'hd):(4'ha)]))));
  assign wire6 = wire2;
  module7 #() modinst95 (wire94, clk, wire2, wire3, wire4, wire0);
  module96 #() modinst153 (wire152, clk, wire4, wire5, wire94, wire3);
  assign wire154 = {($signed($unsigned((wire0 + wire6))) ~^ {wire152,
                           (~{wire0, wire2})}),
                       wire3};
  assign wire155 = $signed((wire1[(4'h9):(2'h3)] || (($signed(wire5) ?
                       (wire154 * wire1) : ((8'hb0) || wire154)) ^~ $unsigned($signed(wire4)))));
  assign wire156 = $signed($unsigned(($unsigned($unsigned(wire152)) || (wire2 >>> wire152))));
  always
    @(posedge clk) begin
      reg157 <= $signed({(!wire154)});
    end
  assign wire158 = (wire154 ?
                       $signed((~((wire94 ?
                           wire155 : wire0) ^~ $unsigned(wire6)))) : (((wire4[(5'h14):(1'h1)] > (wire1 ?
                                   reg157 : (8'ha6))) ?
                               ((reg157 || reg157) ?
                                   $unsigned(wire5) : wire152[(5'h11):(4'ha)]) : $unsigned((wire1 ?
                                   (8'hb5) : wire1))) ?
                           ({wire154} ?
                               wire94[(1'h0):(1'h0)] : ($signed(wire152) < $unsigned(wire6))) : reg157[(3'h4):(3'h4)]));
  always
    @(posedge clk) begin
      if ({(+(({wire0,
              wire154} == (wire5 >>> wire5)) && $signed(wire6[(1'h1):(1'h1)]))),
          {wire154, wire152}})
        begin
          reg159 <= ($unsigned($unsigned(((wire4 >> wire154) <= wire154[(4'h9):(4'h8)]))) ?
              wire0[(4'hc):(2'h3)] : wire1[(5'h11):(4'he)]);
          if (((($signed(wire0[(4'h8):(3'h6)]) ?
              {((8'hbe) ?
                      wire2 : wire4)} : {$unsigned(wire156)}) >> $unsigned($signed({wire6,
              reg157}))) ^~ wire3[(3'h5):(1'h0)]))
            begin
              reg160 <= wire152[(2'h3):(1'h1)];
              reg161 <= wire155[(4'hc):(4'hc)];
              reg162 <= (|{(^~((8'ha7) >>> (~|wire3))), wire94});
            end
          else
            begin
              reg160 <= (reg162 >>> $unsigned(wire158[(2'h2):(2'h2)]));
              reg161 <= (~|((wire3 ?
                      $signed($signed(reg157)) : reg157[(3'h5):(1'h1)]) ?
                  ($unsigned((reg157 & (8'hbc))) >>> wire152[(5'h15):(4'he)]) : ($unsigned((wire4 ?
                          wire6 : reg161)) ?
                      (&wire1) : reg160)));
              reg162 <= (~&({((wire155 <= wire3) < (8'h9d))} ^ ((^(reg161 & wire154)) ^~ $signed($signed(wire0)))));
              reg163 <= (reg162[(4'ha):(3'h5)] ?
                  (|((wire94 ? $signed(wire6) : $unsigned((8'hbb))) ?
                      $unsigned((wire152 ^ wire3)) : wire1[(4'ha):(2'h3)])) : $unsigned($signed(({(8'hbd)} ?
                      wire4[(4'hf):(2'h3)] : $signed(reg157)))));
              reg164 <= (-($signed((wire152 ?
                  (8'had) : (+(8'hb5)))) == (reg162[(4'hc):(3'h4)] ?
                  (wire3 <= (!(8'hb4))) : ((wire0 ~^ (8'hbb)) << (8'h9c)))));
            end
          reg165 <= wire152;
          if ({wire155[(4'h8):(3'h6)]})
            begin
              reg166 <= ($unsigned(wire2) ^ reg164[(1'h1):(1'h1)]);
              reg167 <= ((~&wire152) ?
                  $signed(wire156[(3'h7):(3'h4)]) : reg159);
            end
          else
            begin
              reg166 <= ({wire4} ?
                  $signed(wire2) : $signed($signed(((reg161 ?
                      (7'h43) : wire152) >>> (wire1 ? wire156 : wire155)))));
              reg167 <= (|{reg161});
              reg168 <= $signed(wire6);
            end
          reg169 <= {((^(reg168[(1'h0):(1'h0)] > wire152[(4'hb):(3'h4)])) != {(~(reg165 ?
                      reg165 : (8'hb4))),
                  (8'hb3)})};
        end
      else
        begin
          if ((~&reg160[(4'hb):(2'h2)]))
            begin
              reg159 <= $unsigned(reg164);
              reg160 <= {wire94};
            end
          else
            begin
              reg159 <= wire154[(3'h7):(2'h2)];
              reg160 <= wire3;
            end
          reg161 <= reg165;
        end
      if (((reg161[(3'h5):(2'h3)] ~^ wire0) | wire156))
        begin
          if (wire4)
            begin
              reg170 <= ($unsigned((8'ha1)) ^~ (wire94[(4'he):(4'he)] ?
                  (~^wire6) : ($unsigned($signed(wire94)) >>> ((^reg164) <<< ((8'haa) && reg163)))));
            end
          else
            begin
              reg170 <= ((((^$unsigned(reg161)) << $unsigned((~wire0))) & $signed(reg164)) > $unsigned(wire1));
              reg171 <= (($signed(($unsigned(reg168) | (reg161 * wire6))) ?
                      $unsigned(wire156) : $unsigned(($unsigned(reg166) & (wire94 + reg165)))) ?
                  ($signed($unsigned($signed((8'hbe)))) ~^ (-$unsigned($unsigned(wire158)))) : (8'hbf));
              reg172 <= ((wire0 ?
                  reg171[(4'h8):(1'h1)] : (wire4[(3'h5):(2'h2)] ?
                      $signed((8'hb5)) : $signed((wire0 ?
                          reg166 : (7'h43))))) - reg164);
              reg173 <= (reg159[(3'h7):(2'h3)] ?
                  reg164[(3'h6):(1'h0)] : wire152);
            end
          reg174 <= (reg164[(1'h0):(1'h0)] && (wire4[(4'h8):(3'h7)] ?
              $unsigned($signed(wire2[(4'ha):(1'h1)])) : (!$signed({reg173,
                  wire3}))));
          if (reg166)
            begin
              reg175 <= wire158;
              reg176 <= reg164[(1'h1):(1'h1)];
              reg177 <= (reg169[(5'h13):(4'h8)] < ((^~(wire5[(5'h11):(3'h7)] == ((8'ha4) * reg175))) < wire4[(3'h7):(2'h3)]));
              reg178 <= $unsigned(reg173);
              reg179 <= reg173;
            end
          else
            begin
              reg175 <= $unsigned($unsigned(reg157[(4'ha):(3'h7)]));
            end
          if ((~|(($signed((wire158 + reg162)) ^~ $unsigned(reg164)) ?
              wire5[(1'h0):(1'h0)] : reg172)))
            begin
              reg180 <= wire6;
              reg181 <= wire1;
              reg182 <= ((reg163[(4'he):(4'hd)] >> $unsigned($unsigned((reg161 ?
                  reg162 : (8'hb5))))) & $signed((reg164 ?
                  {reg159[(1'h1):(1'h1)], $unsigned(reg176)} : (|reg176))));
              reg183 <= $signed($signed((&reg165[(3'h7):(1'h1)])));
            end
          else
            begin
              reg180 <= {{$signed(((wire155 ?
                          reg172 : wire156) + reg177[(1'h1):(1'h0)])),
                      reg168}};
              reg181 <= reg180[(3'h4):(3'h4)];
              reg182 <= reg161;
              reg183 <= (!(reg174 > reg166[(1'h1):(1'h1)]));
            end
          reg184 <= ({reg168} + reg176[(3'h6):(2'h2)]);
        end
      else
        begin
          reg170 <= (wire2 ?
              $signed($unsigned($signed((reg162 >= reg169)))) : $signed($signed((wire1[(3'h6):(1'h1)] ?
                  (reg168 ? reg164 : reg161) : reg162[(4'he):(4'ha)]))));
          reg171 <= (reg160 ^ $signed($unsigned(((~^wire155) ?
              (wire0 ~^ reg165) : {reg168}))));
        end
      reg185 <= (|{(!(8'h9e)),
          $unsigned((reg179 ? reg162[(4'hd):(4'hb)] : (!wire94)))});
      reg186 <= wire1;
      reg187 <= {reg186[(1'h0):(1'h0)]};
    end
  module96 #() modinst189 (wire188, clk, reg167, wire1, reg157, reg186);
  assign wire190 = (($unsigned(((reg167 ?
                           reg187 : wire5) ~^ $signed((8'ha5)))) < reg161) ?
                       (|wire94) : ($signed((+(reg163 ?
                           wire2 : reg171))) == {($unsigned(wire5) ?
                               (reg185 ? reg171 : reg166) : {(7'h43)}),
                           $signed((~|reg177))}));
  assign wire191 = (reg178 ?
                       ({wire1[(4'hc):(4'hb)], (8'hb2)} ?
                           reg184 : $unsigned({reg175[(2'h3):(2'h3)],
                               $signed(reg175)})) : (($unsigned((^~reg174)) >> $unsigned($signed(reg182))) - $unsigned(((wire152 ?
                           wire6 : (8'hb8)) > $signed((8'hbe))))));
  assign wire192 = ((reg187 ?
                       wire191[(3'h6):(3'h4)] : $unsigned(wire1[(4'h9):(1'h0)])) >> $unsigned({reg185}));
  assign wire193 = (((&$unsigned($unsigned(reg170))) ?
                       $signed((|wire2)) : reg173[(1'h1):(1'h1)]) == $signed(($unsigned($signed(reg170)) << ({reg161} ?
                       ((8'ha4) ? reg175 : reg182) : (reg172 ?
                           reg164 : reg166)))));
  assign wire194 = $unsigned($signed(reg165[(4'h9):(3'h4)]));
  assign wire195 = $signed(wire94);
  module7 #() modinst197 (.wire8(wire158), .wire10(wire155), .clk(clk), .wire11(wire1), .y(wire196), .wire9(reg176));
  module17 #() modinst199 (wire198, clk, reg171, reg168, reg169, wire152, wire190);
endmodule

module module96  (y, clk, wire100, wire99, wire98, wire97);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire100;
  input wire [(4'hc):(1'h0)] wire99;
  input wire [(5'h10):(1'h0)] wire98;
  input wire [(4'hf):(1'h0)] wire97;
  wire signed [(2'h2):(1'h0)] wire151;
  wire [(2'h3):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire148;
  wire [(4'ha):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire signed [(4'hf):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire123;
  wire signed [(4'h9):(1'h0)] wire122;
  wire [(4'ha):(1'h0)] wire120;
  wire signed [(5'h13):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire114;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire101;
  reg signed [(5'h14):(1'h0)] reg121 = (1'h0);
  reg [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg117 = (1'h0);
  reg [(4'hf):(1'h0)] reg116 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire148,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire120,
                 wire119,
                 wire114,
                 wire103,
                 wire102,
                 wire101,
                 reg121,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire101 = (8'h9d);
  assign wire102 = {($unsigned({$unsigned((7'h44)), ((8'hbb) || wire101)}) ?
                           $signed((wire97[(4'hd):(4'hb)] < $signed(wire100))) : wire100)};
  assign wire103 = wire101[(2'h2):(1'h1)];
  module104 #() modinst115 (wire114, clk, wire101, wire99, wire100, wire97);
  always
    @(posedge clk) begin
      if ((~|wire101))
        begin
          if ((-{$unsigned((~&wire103)), wire99}))
            begin
              reg116 <= $signed((wire100[(1'h0):(1'h0)] ?
                  ($signed((&wire101)) ?
                      wire114[(4'hb):(3'h5)] : $signed((wire97 ?
                          wire101 : wire98))) : (wire97 ^ $signed(wire101))));
            end
          else
            begin
              reg116 <= {(8'ha1), wire102};
              reg117 <= {(^$signed($unsigned($unsigned(wire101))))};
              reg118 <= reg117;
            end
        end
      else
        begin
          if ($signed($unsigned(reg116)))
            begin
              reg116 <= ({($signed($signed(wire99)) ?
                          wire98[(4'hd):(3'h5)] : {wire98[(1'h0):(1'h0)],
                              (reg116 ? wire99 : reg116)})} ?
                  ((~|((8'hb5) ? (~&wire101) : wire101[(1'h1):(1'h1)])) ?
                      reg116[(2'h3):(1'h0)] : ((-(wire101 >> wire97)) ?
                          ((7'h44) ^~ (reg117 ^~ wire97)) : ((reg118 == reg117) & $unsigned(wire99)))) : (8'ha5));
              reg117 <= (wire97[(4'hd):(4'h8)] ?
                  (^{((&wire101) && {(8'ha8)})}) : (wire100 <= $unsigned(reg116)));
            end
          else
            begin
              reg116 <= (-$signed($signed($signed(wire100[(3'h6):(2'h2)]))));
              reg117 <= (~(^$signed(((+wire101) > {wire114, wire103}))));
              reg118 <= reg116[(3'h5):(1'h1)];
            end
        end
    end
  assign wire119 = (^~wire100);
  assign wire120 = wire99[(3'h6):(1'h1)];
  always
    @(posedge clk) begin
      reg121 <= ($signed((8'ha2)) > wire97[(2'h2):(1'h1)]);
    end
  assign wire122 = $unsigned($unsigned($signed(wire103)));
  assign wire123 = wire119;
  assign wire124 = wire120[(3'h5):(3'h5)];
  assign wire125 = (^wire124[(4'h8):(4'h8)]);
  assign wire126 = (|$signed({((reg116 ? reg117 : wire119) ?
                           (wire124 ? wire102 : wire99) : wire114),
                       ((&wire119) & (wire98 ? wire120 : reg117))}));
  module127 #() modinst149 (wire148, clk, wire101, wire98, wire125, wire124);
  assign wire150 = (~&wire103[(1'h1):(1'h0)]);
  assign wire151 = ((~|$signed($unsigned((wire102 && reg117)))) | wire123[(3'h4):(1'h1)]);
endmodule

module module7
#(parameter param93 = {(((((8'ha5) ? (8'hbc) : (8'hb7)) == {(8'ha6)}) ? {((8'h9f) ? (8'ha0) : (8'hac)), ((8'hbb) > (8'hb5))} : (-((8'h9e) - (8'hbd)))) == ((&((7'h42) ? (8'ha8) : (8'hbd))) ^~ ((~|(8'haf)) <= {(8'haa)})))})
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire92;
  wire [(4'hd):(1'h0)] wire91;
  wire [(3'h6):(1'h0)] wire90;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(4'hb):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire12;
  wire [(5'h11):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire82;
  assign y = {wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire82,
                 (1'h0)};
  assign wire12 = wire10;
  assign wire13 = ($signed(((~$signed(wire10)) ?
                      ((wire9 ? wire8 : wire12) ?
                          (wire8 ?
                              wire8 : wire10) : (^wire12)) : {(8'ha1)})) > ({$unsigned(wire9[(1'h0):(1'h0)])} && wire9));
  assign wire14 = (8'hb9);
  assign wire15 = $signed($unsigned(wire9[(1'h0):(1'h0)]));
  assign wire16 = (|{$signed(wire14[(1'h1):(1'h1)]),
                      ((^wire12) >>> wire9[(1'h1):(1'h0)])});
  module17 #() modinst83 (wire82, clk, wire9, wire16, wire10, wire8, wire12);
  assign wire84 = {(|$unsigned(wire12))};
  assign wire85 = (^~(&$signed($signed({wire84, wire12}))));
  assign wire86 = ((-(wire13 && {{wire84, wire16}, $unsigned(wire11)})) ?
                      wire14 : wire8[(5'h10):(3'h5)]);
  assign wire87 = wire16[(4'ha):(1'h1)];
  assign wire88 = wire16[(3'h7):(1'h0)];
  assign wire89 = ($unsigned($signed(wire13)) || $unsigned(((~|$signed(wire16)) ?
                      wire13 : wire11)));
  assign wire90 = (wire88 ?
                      $signed($unsigned($unsigned((wire9 ^~ (8'hbd))))) : (&$signed(wire85)));
  assign wire91 = ({(8'ha0), wire88} <= (((~|(8'hac)) | (-(~wire90))) ?
                      wire90[(1'h1):(1'h1)] : $unsigned((-{wire89, wire15}))));
  assign wire92 = $unsigned({((~^$unsigned(wire82)) ?
                          wire8[(4'hb):(3'h6)] : wire87)});
endmodule

module module17
#(parameter param81 = (^((^({(8'hb0), (8'h9c)} ? {(8'ha9), (8'ha7)} : ((8'ha9) ? (8'hb0) : (8'ha7)))) ? ((((8'hbf) ? (8'ha1) : (8'hb0)) ? ((8'ha4) ? (7'h42) : (8'hb3)) : ((8'hb6) ? (8'hb8) : (7'h40))) ? (-((8'ha6) ? (8'ha0) : (8'h9c))) : (+((7'h41) <= (8'ha9)))) : (^~(((8'hbb) ? (8'ha5) : (8'hb1)) ? (~(8'h9c)) : (8'haa))))))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h266):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire22;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  input wire [(5'h10):(1'h0)] wire19;
  input wire [(4'hb):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire69;
  wire [(2'h3):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(2'h2):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  reg [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire24,
                 wire23,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
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
  assign wire23 = $unsigned(wire19);
  assign wire24 = wire22[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg25 <= wire21;
      reg26 <= wire22[(4'h9):(1'h0)];
      reg27 <= (|wire24);
    end
  always
    @(posedge clk) begin
      if ({((!(((8'ha7) ^~ reg27) ^~ wire21)) <<< wire22),
          wire22[(3'h5):(1'h0)]})
        begin
          reg28 <= (wire18 ^ $unsigned(wire21));
          reg29 <= wire20;
          if (wire18[(3'h5):(3'h4)])
            begin
              reg30 <= $unsigned($unsigned((reg26[(3'h6):(3'h6)] >> $unsigned($signed(reg26)))));
              reg31 <= reg26;
              reg32 <= ($unsigned(((8'h9f) ?
                  $unsigned((^~wire19)) : $unsigned(reg28))) & (reg26 == $unsigned($signed(reg31[(1'h1):(1'h0)]))));
              reg33 <= (wire22 << (~^{$signed($unsigned(reg28))}));
              reg34 <= ($unsigned((~^($unsigned(reg27) + {reg31,
                  reg30}))) || reg27[(3'h5):(1'h0)]);
            end
          else
            begin
              reg30 <= wire21[(3'h5):(2'h3)];
              reg31 <= $signed($unsigned($signed(wire18[(2'h2):(1'h0)])));
              reg32 <= wire22[(4'ha):(3'h4)];
              reg33 <= reg32[(2'h3):(2'h2)];
              reg34 <= ((wire21 ?
                      reg33[(1'h0):(1'h0)] : ((!$unsigned((7'h42))) ?
                          $signed(reg34) : (wire24 + (reg34 ?
                              wire18 : wire21)))) ?
                  (reg28 ?
                      ($unsigned({wire19, (8'hba)}) ?
                          $unsigned(wire20) : $signed($unsigned((8'h9d)))) : $unsigned(reg32)) : reg32);
            end
          if (reg28)
            begin
              reg35 <= reg30[(4'hc):(4'hc)];
              reg36 <= (reg31[(2'h2):(2'h2)] < reg27[(1'h1):(1'h0)]);
              reg37 <= $signed(((((~^reg28) ? reg31 : (~|(7'h40))) - wire20) ?
                  $unsigned($unsigned((&(8'hb8)))) : (wire20[(3'h7):(3'h5)] >>> wire24)));
            end
          else
            begin
              reg35 <= (8'hae);
            end
          reg38 <= $signed((+(wire21[(3'h5):(1'h0)] < reg36)));
        end
      else
        begin
          reg28 <= $unsigned($unsigned((((^~wire18) == wire23[(2'h3):(2'h3)]) | $signed((8'h9d)))));
          reg29 <= $unsigned($signed($unsigned($signed(reg31))));
          reg30 <= reg34;
        end
      reg39 <= $unsigned({((~|reg26[(4'hc):(4'ha)]) ?
              (-(^~(8'ha8))) : $signed((reg29 ? reg25 : reg38)))});
      reg40 <= $unsigned(($unsigned($unsigned({(8'hac)})) >>> (|$signed(((8'hbb) ?
          wire21 : wire19)))));
      if ({wire20[(3'h5):(2'h2)]})
        begin
          reg41 <= (&(reg34[(3'h5):(3'h4)] ?
              wire24[(3'h5):(1'h0)] : (reg28[(1'h1):(1'h1)] ?
                  reg32[(4'hd):(3'h6)] : $unsigned($unsigned(reg33)))));
          reg42 <= ({({$signed(reg40)} ~^ reg26[(1'h1):(1'h1)]),
                  (^~$unsigned((reg28 <= wire21)))} ?
              ($unsigned(reg38[(4'hd):(1'h1)]) <= $signed(reg28[(2'h2):(2'h2)])) : (reg40 << (+((reg38 != wire24) ?
                  (reg33 ? reg29 : reg39) : reg30))));
          reg43 <= $unsigned(reg26[(3'h7):(3'h5)]);
        end
      else
        begin
          reg41 <= ((reg40[(2'h2):(2'h2)] == {reg30[(4'h9):(3'h5)],
                  $unsigned(((8'hae) ^~ wire19))}) ?
              wire24 : (($unsigned(reg31) <= ($unsigned(reg38) < (reg26 ?
                      reg33 : reg37))) ?
                  (&reg35[(1'h0):(1'h0)]) : (((reg40 ? wire21 : reg34) ?
                          wire22 : reg32[(3'h4):(1'h1)]) ?
                      reg37[(4'hc):(4'h8)] : (reg26[(4'h9):(1'h0)] ?
                          reg39[(2'h3):(2'h3)] : (8'ha0)))));
          reg42 <= reg25[(2'h2):(2'h2)];
          reg43 <= (wire19[(3'h5):(2'h3)] ?
              reg35[(1'h0):(1'h0)] : (($signed((reg33 - reg37)) - $unsigned($signed(reg32))) == (~(reg42 >> $signed(wire20)))));
          reg44 <= (-($unsigned({(8'haf)}) ?
              (!(reg37 ^~ $signed(reg34))) : $unsigned(reg38)));
        end
      if (($unsigned(wire20) ? {reg33, $unsigned((^~reg37))} : reg36))
        begin
          if ((&reg27))
            begin
              reg45 <= $unsigned({$unsigned(reg26[(4'ha):(3'h7)]),
                  (!wire20[(2'h3):(1'h0)])});
              reg46 <= $signed({{reg37, (~^$unsigned(reg26))}});
              reg47 <= $signed({reg43, (8'hb3)});
            end
          else
            begin
              reg45 <= wire22[(2'h3):(1'h1)];
              reg46 <= reg31[(2'h2):(1'h0)];
            end
          reg48 <= (reg42[(3'h7):(3'h4)] == (reg43 << $unsigned((reg29[(1'h0):(1'h0)] ?
              {(7'h43)} : $signed(reg43)))));
          reg49 <= {((-(-wire21)) >> ($unsigned($unsigned(reg45)) * $signed(reg30[(2'h2):(1'h1)]))),
              (reg43 ?
                  reg28 : (($signed(wire21) | (^(8'hb7))) ?
                      ((~&(8'ha9)) + {reg47, reg26}) : ((^reg42) ?
                          ((7'h44) ^ reg33) : reg46[(1'h1):(1'h1)])))};
          if ((&$unsigned($signed(wire21[(1'h0):(1'h0)]))))
            begin
              reg50 <= (($signed(reg35) >= wire22) ?
                  {(($unsigned(reg27) + $signed(wire24)) ?
                          ($unsigned(reg33) ?
                              reg32 : (reg33 != (8'hb7))) : $unsigned(wire20[(4'hb):(2'h2)]))} : (|(8'hb6)));
              reg51 <= $signed((reg33 * reg48));
              reg52 <= ({($signed((reg32 || wire23)) | reg34)} ?
                  wire18 : {reg49[(4'h8):(1'h0)]});
            end
          else
            begin
              reg50 <= (^~(^~$signed($signed($unsigned(reg36)))));
              reg51 <= (~|reg41);
              reg52 <= (!(&$unsigned($unsigned((reg39 ? reg41 : reg50)))));
              reg53 <= {$unsigned(($unsigned(reg34[(3'h7):(1'h0)]) ^~ (reg25[(2'h2):(1'h0)] ?
                      $signed(reg42) : reg26))),
                  {$unsigned(((~|reg30) ? reg26 : (reg36 ^~ reg31))),
                      (reg34[(4'ha):(1'h1)] | reg44)}};
              reg54 <= (((($unsigned(wire23) >>> reg46) ?
                      reg53[(4'h9):(3'h6)] : ({(8'hb0), reg38} || (!reg34))) ?
                  ((reg35 * $signed(reg29)) ?
                      (reg39 | ((8'haa) ?
                          wire19 : reg37)) : $unsigned($unsigned(reg30))) : $unsigned($signed((8'hab)))) | $signed((-reg27[(3'h7):(1'h0)])));
            end
        end
      else
        begin
          reg45 <= wire23[(1'h0):(1'h0)];
          reg46 <= $signed(reg31);
          reg47 <= (&(reg48 >>> reg25[(3'h7):(2'h2)]));
          reg48 <= (wire18 ?
              $unsigned($signed($unsigned((reg42 ?
                  reg26 : reg46)))) : $signed({reg26[(2'h3):(2'h3)]}));
        end
    end
  assign wire55 = $signed(reg31);
  assign wire56 = reg48;
  assign wire57 = {$signed((wire56[(1'h0):(1'h0)] ?
                          wire19[(3'h5):(3'h4)] : (^(reg50 ? reg53 : wire23)))),
                      $unsigned(((8'hae) ?
                          ((reg42 ? reg36 : reg32) ?
                              $unsigned(wire21) : wire23) : $signed((reg29 >> wire18))))};
  assign wire58 = ((reg34[(1'h1):(1'h0)] ?
                      ((8'haa) ?
                          ($signed(reg33) ^ (reg46 ?
                              (7'h40) : wire55)) : wire22[(3'h4):(1'h1)]) : (&($unsigned(reg25) ?
                          $unsigned(reg29) : reg42))) || {$unsigned({$unsigned(reg48),
                          (reg34 ? reg46 : (8'hbb))}),
                      $signed(($unsigned(wire19) ?
                          (reg28 ? reg26 : wire56) : ((8'hbe) ?
                              reg37 : reg31)))});
  assign wire59 = $signed(reg39[(3'h5):(3'h4)]);
  assign wire60 = $unsigned(((($unsigned(wire59) ?
                      $signed((7'h41)) : $unsigned(reg27)) >= (reg40 ?
                      {wire59} : (reg31 >>> reg42))) <<< (((!(8'haa)) ?
                          (wire20 != reg49) : {wire57, reg51}) ?
                      ((~^reg50) ~^ reg46[(3'h7):(1'h1)]) : $signed($unsigned(wire21)))));
  assign wire61 = (^$unsigned((!wire59[(2'h3):(1'h1)])));
  assign wire62 = $unsigned((($signed($signed(reg45)) ?
                          $signed((reg36 <<< wire21)) : ({wire23} ?
                              (8'hb3) : (wire21 == reg40))) ?
                      wire24 : (^~(~|$unsigned(wire60)))));
  assign wire63 = ((((^wire55) >> $signed({wire61,
                      (8'hb3)})) <<< (8'ha3)) ^ $unsigned(wire22));
  assign wire64 = (+(~^$unsigned($unsigned(((8'ha4) ? reg48 : wire57)))));
  assign wire65 = $signed((wire22 && reg42));
  assign wire66 = (|((~&$unsigned((8'haa))) >> ((wire62[(4'hc):(4'h9)] == $unsigned(reg47)) ?
                      $signed((~reg32)) : $signed((reg51 == wire57)))));
  assign wire67 = (&(reg30 ?
                      $signed(wire18[(1'h1):(1'h1)]) : (($unsigned(reg26) | (reg35 ?
                          reg52 : (8'hae))) ~^ reg49[(4'h8):(3'h5)])));
  assign wire68 = (wire24 != ((({reg41, reg54} | {wire63, reg41}) ?
                      (~wire20[(1'h1):(1'h1)]) : ((reg51 ?
                          reg33 : wire63) ^ reg35)) != wire61));
  assign wire69 = (8'hb1);
  assign wire70 = ((reg44[(4'h9):(3'h4)] ? (8'had) : reg26[(4'hd):(3'h4)]) ?
                      ({($unsigned(wire61) ?
                              reg31[(3'h5):(1'h0)] : wire23[(4'h9):(3'h6)])} == reg34) : ($unsigned((reg27 ?
                              $unsigned(reg33) : reg49[(2'h3):(1'h1)])) ?
                          ({{reg26, wire69}} == (^~{wire18,
                              (8'hac)})) : wire63[(2'h2):(1'h1)]));
  always
    @(posedge clk) begin
      reg71 <= $unsigned(wire61);
      reg72 <= {(((^$unsigned(reg43)) ?
              ((+(8'hbe)) | $signed(wire23)) : (7'h40)) >> ($unsigned($unsigned(reg38)) ?
              ((reg37 ~^ reg29) ?
                  (^wire57) : $unsigned(wire22)) : (wire61[(4'hd):(4'hb)] ?
                  $signed(wire59) : (reg46 ? reg54 : reg28)))),
          $unsigned((wire69 ? (~&reg71) : reg32[(4'hf):(4'h8)]))};
      reg73 <= $signed(reg29[(1'h0):(1'h0)]);
      if ((((!$unsigned($unsigned(wire64))) ^~ reg52[(3'h6):(3'h5)]) == wire56[(4'h8):(3'h6)]))
        begin
          if ((&reg30[(2'h3):(2'h3)]))
            begin
              reg74 <= (-reg41[(1'h0):(1'h0)]);
              reg75 <= {reg44[(1'h0):(1'h0)]};
              reg76 <= ((~|$signed($signed($signed(reg53)))) ?
                  (&{$signed((wire64 ^~ (8'h9d)))}) : wire18[(1'h1):(1'h1)]);
              reg77 <= wire69;
            end
          else
            begin
              reg74 <= wire24;
              reg75 <= (($unsigned($unsigned(reg72[(1'h0):(1'h0)])) ?
                      ($signed($unsigned(wire56)) != (^((8'h9d) || reg25))) : (~^$unsigned(reg54[(3'h6):(3'h4)]))) ?
                  reg33[(4'he):(3'h7)] : wire59);
              reg76 <= ((+(^~$unsigned((wire21 ?
                  (8'hac) : wire18)))) ^ $unsigned((($unsigned(reg34) != (|wire70)) >= reg77[(3'h5):(1'h0)])));
              reg77 <= $signed(wire65[(1'h1):(1'h0)]);
              reg78 <= {(!($unsigned({wire62, reg40}) ?
                      ({reg44} != (reg46 < reg33)) : ((+reg76) || (-wire69)))),
                  ({reg47[(4'hf):(3'h6)]} * $unsigned((!$signed((8'h9c)))))};
            end
          reg79 <= ((~|$signed((^(reg48 ?
              wire65 : reg31)))) >>> ($unsigned(reg49[(2'h3):(2'h3)]) ^~ wire21[(3'h4):(2'h2)]));
        end
      else
        begin
          reg74 <= $signed(wire65);
          if (reg30[(3'h7):(3'h4)])
            begin
              reg75 <= {($unsigned(reg77) != $signed(reg40)), (~|(-reg53))};
              reg76 <= reg39[(4'h8):(1'h1)];
            end
          else
            begin
              reg75 <= (wire63[(1'h0):(1'h0)] <<< ({{reg35},
                  $unsigned((reg27 ?
                      wire58 : reg42))} != ((reg29 - $signed(reg72)) ?
                  ({reg28} ? reg71 : $signed(reg76)) : wire57[(3'h5):(3'h4)])));
            end
          reg77 <= (8'hb5);
          reg78 <= reg32[(5'h12):(3'h4)];
          reg79 <= $unsigned($signed($unsigned((wire18[(4'h8):(4'h8)] ^~ ((8'hb0) ?
              wire69 : reg37)))));
        end
      reg80 <= ($unsigned(wire59[(1'h1):(1'h0)]) ^~ $signed(($unsigned($signed(wire70)) ?
          (7'h43) : {(reg36 ? (8'haa) : wire65)})));
    end
endmodule

module module127  (y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire131;
  input wire signed [(3'h5):(1'h0)] wire130;
  input wire [(5'h10):(1'h0)] wire129;
  input wire [(2'h2):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire147;
  wire signed [(2'h3):(1'h0)] wire146;
  wire signed [(4'hc):(1'h0)] wire145;
  wire signed [(5'h14):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire141;
  wire [(3'h6):(1'h0)] wire140;
  wire signed [(5'h12):(1'h0)] wire139;
  wire signed [(4'hb):(1'h0)] wire138;
  wire [(3'h6):(1'h0)] wire137;
  wire signed [(5'h12):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire132;
  reg [(3'h6):(1'h0)] reg134 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire133,
                 wire132,
                 reg134,
                 (1'h0)};
  assign wire132 = wire130;
  assign wire133 = (~^wire129);
  always
    @(posedge clk) begin
      reg134 <= ((8'haf) <= (($unsigned((wire131 ?
              (8'hae) : wire128)) ^ $unsigned(wire132)) ?
          $unsigned((wire132[(4'h8):(2'h2)] > wire133[(1'h0):(1'h0)])) : $unsigned(((+(7'h40)) ?
              (wire129 ? wire133 : wire128) : (wire131 && wire131)))));
    end
  assign wire135 = ({$signed(wire130)} ?
                       (~^{$signed({wire128,
                               reg134})}) : (+$unsigned($signed(((8'ha3) ?
                           wire131 : (8'hbb))))));
  assign wire136 = (!(reg134[(2'h3):(2'h3)] * $signed(wire130[(2'h3):(1'h1)])));
  assign wire137 = wire129[(3'h5):(2'h2)];
  assign wire138 = wire136[(2'h3):(1'h1)];
  assign wire139 = (((|{$unsigned((8'hae)), (^wire129)}) ?
                           wire129[(2'h3):(1'h1)] : ((~|(wire131 == reg134)) ?
                               $unsigned($signed((7'h42))) : $unsigned((wire128 ?
                                   wire130 : reg134)))) ?
                       wire138[(1'h1):(1'h0)] : $unsigned((((~|wire128) ?
                               wire137[(3'h5):(3'h5)] : (~wire136)) ?
                           wire131[(5'h11):(3'h6)] : ($signed(wire137) ?
                               {wire133, (8'hbc)} : wire129))));
  assign wire140 = ($unsigned((^~{wire136[(4'ha):(1'h1)],
                       wire129[(4'he):(3'h5)]})) <= (wire135[(5'h12):(2'h2)] ^ wire139[(4'hd):(3'h7)]));
  assign wire141 = ((-(!{(wire138 - (8'hb5))})) ?
                       wire131[(4'hd):(3'h6)] : wire130);
  assign wire142 = ($unsigned((wire129[(2'h2):(1'h0)] * $signed($signed(wire139)))) >> wire133[(1'h0):(1'h0)]);
  assign wire143 = {$unsigned($unsigned($unsigned((wire135 != wire140)))),
                       (^~($signed(wire139) > (wire128[(1'h0):(1'h0)] ?
                           {wire139} : wire142[(3'h6):(1'h1)])))};
  assign wire144 = wire128[(2'h2):(2'h2)];
  assign wire145 = (~|$unsigned($unsigned($signed({wire137, wire142}))));
  assign wire146 = wire136;
  assign wire147 = ((~&wire130) - (8'had));
endmodule

module module104
#(parameter param113 = (((7'h42) == (8'ha9)) ? (((((8'ha4) * (8'hb3)) * ((8'h9d) & (8'hac))) ? {((7'h41) <<< (8'hb5))} : ({(8'ha4), (8'h9e)} ? (!(8'ha7)) : ((8'hb0) || (8'ha8)))) * ((~(|(8'had))) & ((~^(8'ha0)) ^ ((8'hac) || (8'had))))) : {(~|{((8'hb0) && (7'h42))}), (((^(8'ha9)) & ((8'hbc) ? (8'hb1) : (8'hbf))) | (((8'hab) ? (8'hb8) : (8'ha1)) + (^(7'h42))))}))
(y, clk, wire108, wire107, wire106, wire105);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire108;
  input wire [(4'ha):(1'h0)] wire107;
  input wire [(5'h11):(1'h0)] wire106;
  input wire [(4'h9):(1'h0)] wire105;
  wire [(5'h14):(1'h0)] wire112;
  wire signed [(4'ha):(1'h0)] wire111;
  wire [(3'h7):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  assign y = {wire112, wire111, wire110, wire109, (1'h0)};
  assign wire109 = $signed(wire106);
  assign wire110 = (+(((|$signed(wire109)) ?
                       {(~&wire105)} : wire109[(5'h11):(1'h1)]) & ((wire107[(4'ha):(3'h5)] ?
                           $unsigned(wire107) : (wire105 ? wire105 : wire107)) ?
                       (+{wire106}) : (wire108 ?
                           (wire109 ? wire107 : (8'h9f)) : ((7'h42) ?
                               (8'had) : wire109)))));
  assign wire111 = $unsigned($unsigned(((-wire105[(2'h2):(1'h1)]) ?
                       (^~$signed(wire109)) : ((wire108 ? wire108 : wire107) ?
                           (8'hb4) : wire108))));
  assign wire112 = (~|($signed(((8'hb9) ? wire106[(4'h8):(2'h2)] : (7'h40))) ?
                       wire106[(4'h9):(4'h8)] : ($signed($signed(wire111)) ?
                           wire110[(1'h1):(1'h1)] : wire109[(3'h4):(3'h4)])));
endmodule
