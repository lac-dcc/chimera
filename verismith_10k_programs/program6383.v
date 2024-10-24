module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire240;
  wire [(4'h9):(1'h0)] wire154;
  wire signed [(5'h12):(1'h0)] wire153;
  wire [(5'h14):(1'h0)] wire152;
  wire signed [(4'hb):(1'h0)] wire151;
  wire [(4'hc):(1'h0)] wire149;
  assign y = {wire240, wire154, wire153, wire152, wire151, wire149, (1'h0)};
  module5 #() modinst150 (wire149, clk, wire2, wire1, wire3, wire4, wire0);
  assign wire151 = wire3;
  assign wire152 = $signed($signed(wire4));
  assign wire153 = wire0;
  assign wire154 = wire1;
  module155 #() modinst241 (wire240, clk, wire152, wire149, wire3, wire4);
endmodule

module module155
#(parameter param238 = (((&(((8'hbb) <<< (8'ha8)) ^~ ((8'ha1) & (8'hb9)))) > ((^~{(7'h44), (8'ha1)}) > (((8'ha7) << (8'hba)) ? ((8'h9c) ? (8'hbe) : (8'had)) : ((8'hab) > (8'h9e))))) | ((~((~(8'hb2)) ? (8'hb7) : ((8'hbd) ? (8'ha0) : (8'h9c)))) ? (7'h44) : (({(8'hab)} | ((8'ha5) && (8'haf))) << ((8'had) ~^ ((8'hab) ? (8'had) : (8'ha9)))))), 
parameter param239 = (({param238, (!(&param238))} - (!((param238 ? param238 : param238) | (~|param238)))) ? param238 : ((param238 ^~ param238) <<< (param238 ~^ (param238 ? (~&param238) : (param238 ^~ param238))))))
(y, clk, wire159, wire158, wire157, wire156);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire159;
  input wire signed [(4'hc):(1'h0)] wire158;
  input wire signed [(5'h12):(1'h0)] wire157;
  input wire signed [(5'h15):(1'h0)] wire156;
  wire signed [(2'h3):(1'h0)] wire219;
  wire [(5'h15):(1'h0)] wire218;
  wire signed [(4'hf):(1'h0)] wire217;
  wire [(5'h10):(1'h0)] wire192;
  wire signed [(5'h11):(1'h0)] wire162;
  wire signed [(5'h15):(1'h0)] wire161;
  wire [(4'ha):(1'h0)] wire160;
  wire [(3'h5):(1'h0)] wire198;
  wire [(4'hd):(1'h0)] wire199;
  wire signed [(4'h9):(1'h0)] wire200;
  wire signed [(3'h5):(1'h0)] wire215;
  reg signed [(4'hf):(1'h0)] reg237 = (1'h0);
  reg [(3'h5):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg235 = (1'h0);
  reg [(4'ha):(1'h0)] reg234 = (1'h0);
  reg [(4'hc):(1'h0)] reg233 = (1'h0);
  reg [(4'hb):(1'h0)] reg232 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg231 = (1'h0);
  reg [(3'h4):(1'h0)] reg230 = (1'h0);
  reg [(5'h14):(1'h0)] reg229 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg226 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg225 = (1'h0);
  reg [(4'he):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg221 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg220 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg194 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg196 = (1'h0);
  reg [(5'h15):(1'h0)] reg197 = (1'h0);
  reg [(3'h4):(1'h0)] reg201 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg202 = (1'h0);
  reg [(4'hc):(1'h0)] reg203 = (1'h0);
  assign y = {wire219,
                 wire218,
                 wire217,
                 wire192,
                 wire162,
                 wire161,
                 wire160,
                 wire198,
                 wire199,
                 wire200,
                 wire215,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg201,
                 reg202,
                 reg203,
                 (1'h0)};
  assign wire160 = $unsigned(wire158);
  assign wire161 = wire159[(1'h0):(1'h0)];
  assign wire162 = {wire157[(5'h11):(3'h4)]};
  module163 #() modinst193 (.wire167(wire159), .wire166(wire160), .wire164(wire162), .wire165(wire161), .y(wire192), .clk(clk), .wire168(wire156));
  always
    @(posedge clk) begin
      reg194 <= (wire160 ~^ $signed((8'ha7)));
      reg195 <= ((^~$unsigned($signed((-wire160)))) ?
          $unsigned($unsigned((~^{wire156}))) : {$signed(((7'h41) ?
                  (wire158 << reg194) : wire192)),
              ($unsigned((wire161 + reg194)) ?
                  $unsigned((~^reg194)) : ((wire158 << wire192) ?
                      wire192[(4'h9):(4'h9)] : $signed(wire192)))});
      reg196 <= wire192[(4'hb):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg197 <= $signed($signed($signed(((reg196 ?
          wire162 : wire157) && (~^wire158)))));
    end
  assign wire198 = wire161[(4'hc):(2'h3)];
  assign wire199 = (8'haa);
  assign wire200 = (reg196 ?
                       wire157 : (($signed((reg194 < wire162)) || wire199[(4'h8):(3'h4)]) > (!wire198)));
  always
    @(posedge clk) begin
      reg201 <= wire199[(3'h4):(1'h0)];
      reg202 <= reg201[(2'h3):(2'h3)];
      reg203 <= $unsigned(reg197);
    end
  module204 #() modinst216 (wire215, clk, wire162, wire158, reg195, wire199);
  assign wire217 = (8'hbd);
  assign wire218 = wire158[(3'h6):(2'h3)];
  assign wire219 = $unsigned(($signed({reg194[(3'h7):(1'h0)]}) >= (wire199[(3'h7):(1'h1)] != {{reg195},
                       $signed(reg202)})));
  always
    @(posedge clk) begin
      if (wire198[(3'h4):(1'h0)])
        begin
          reg220 <= $signed(wire156[(5'h11):(4'h9)]);
          reg221 <= ((~^{(~(!wire217))}) <= wire198);
          reg222 <= {(+{{wire200, $signed(wire161)}, wire160}),
              reg220[(2'h2):(1'h0)]};
          reg223 <= $signed((wire156 || ($unsigned($unsigned(wire156)) ^~ ((wire159 ?
              wire158 : wire192) << wire160[(3'h7):(3'h7)]))));
          reg224 <= wire160;
        end
      else
        begin
          reg220 <= {reg220[(4'hc):(4'hb)],
              $signed($unsigned(reg202[(1'h0):(1'h0)]))};
        end
      if (reg221[(3'h5):(1'h0)])
        begin
          reg225 <= (~^(&reg224));
          reg226 <= {$unsigned((8'hb9)), reg194[(3'h5):(3'h5)]};
        end
      else
        begin
          reg225 <= $unsigned(((((~&wire160) ?
                      (wire160 >> (8'hab)) : (-reg220)) ?
                  $unsigned(((8'hb6) || (8'hb9))) : (7'h41)) ?
              wire217[(4'hd):(4'hb)] : reg201));
          if ((~&((($signed(reg222) ? {wire218} : reg223) ? wire192 : reg203) ?
              ({wire217} <<< {(reg220 ?
                      reg225 : reg221)}) : wire198[(3'h4):(1'h0)])))
            begin
              reg226 <= (~&wire156[(5'h14):(5'h14)]);
              reg227 <= $signed($signed((((wire156 ?
                  wire215 : wire160) & wire218) * wire215)));
              reg228 <= wire218[(2'h3):(1'h1)];
              reg229 <= $unsigned({($signed(wire157[(4'hc):(3'h4)]) != ((~&reg201) ?
                      wire198[(3'h4):(3'h4)] : reg224)),
                  (reg222[(2'h2):(2'h2)] + (reg197 || {reg197}))});
            end
          else
            begin
              reg226 <= $unsigned((wire159 <= wire200[(3'h5):(3'h5)]));
              reg227 <= ((((~|(&reg226)) ? wire199[(1'h1):(1'h0)] : wire161) ?
                      (!reg202) : {$unsigned($unsigned(reg222)),
                          (!(|reg224))}) ?
                  {reg229, (|(^{reg220}))} : wire159[(2'h3):(2'h3)]);
              reg228 <= $signed((~$signed($unsigned((wire218 ?
                  (8'hb6) : reg223)))));
              reg229 <= (~wire217[(2'h2):(2'h2)]);
            end
          reg230 <= reg195[(4'hd):(3'h4)];
          if (reg222)
            begin
              reg231 <= (+$signed((~|(&(|wire162)))));
              reg232 <= reg196;
              reg233 <= $unsigned($unsigned(((^((8'ha8) ?
                  reg229 : wire215)) && wire157[(3'h7):(2'h2)])));
              reg234 <= wire218;
            end
          else
            begin
              reg231 <= $unsigned(reg229[(4'ha):(3'h4)]);
              reg232 <= ({$signed(reg229[(3'h7):(3'h7)]), (^reg232)} ^ reg197);
              reg233 <= $signed($signed((((!reg197) >>> (reg223 ?
                  reg203 : reg222)) | $signed(reg224[(3'h4):(3'h4)]))));
              reg234 <= reg202;
              reg235 <= wire157[(5'h10):(5'h10)];
            end
        end
      reg236 <= $signed((!($unsigned($unsigned(reg232)) ^ ($unsigned(wire217) ?
          reg201 : (reg228 > (8'hb9))))));
      reg237 <= {(|(+{(wire200 > (8'h9f))})),
          (|(($signed((8'ha0)) >>> (8'h9e)) != $signed($signed(reg194))))};
    end
endmodule

module module5
#(parameter param147 = (~|(+(((^~(8'ha6)) != ((8'hbd) != (8'hb2))) ? (7'h43) : (8'hb0)))), 
parameter param148 = ({(param147 ? {(8'had)} : param147), (param147 + (&param147))} * param147))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(3'h5):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire146;
  wire signed [(5'h13):(1'h0)] wire145;
  wire signed [(4'h9):(1'h0)] wire144;
  wire signed [(5'h14):(1'h0)] wire103;
  wire signed [(3'h4):(1'h0)] wire35;
  wire signed [(5'h10):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire105;
  wire [(3'h7):(1'h0)] wire142;
  assign y = {wire146,
                 wire145,
                 wire144,
                 wire103,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire105,
                 wire142,
                 (1'h0)};
  assign wire11 = (((|wire6) >> (-$unsigned($unsigned(wire7)))) ?
                      ($unsigned($signed($signed(wire9))) ?
                          $signed(wire8) : ($unsigned(((8'hbf) + wire7)) ^~ $signed(wire10))) : wire9);
  assign wire12 = (wire11[(2'h2):(1'h1)] ?
                      ($unsigned((8'hb3)) >> wire6[(4'hf):(2'h3)]) : {{$signed((wire7 || (8'h9c)))},
                          ($signed((wire6 >> wire7)) ^ (~|(~|wire7)))});
  assign wire13 = $unsigned(wire10[(5'h13):(4'hb)]);
  assign wire14 = wire12[(4'h8):(3'h6)];
  module15 #() modinst30 (wire29, clk, wire9, wire8, wire13, wire11);
  assign wire31 = (($signed($signed((wire9 ? wire8 : wire7))) ?
                          wire12 : $signed({wire14,
                              (wire10 ? wire9 : wire29)})) ?
                      ((~|(8'h9c)) * wire6[(5'h15):(4'hd)]) : ((8'hb3) ?
                          ((8'hae) ^ wire6[(1'h0):(1'h0)]) : (|wire11[(4'hd):(3'h6)])));
  assign wire32 = $signed((&wire31));
  assign wire33 = $signed($unsigned(wire32));
  assign wire34 = $unsigned($signed(wire32[(2'h3):(1'h0)]));
  assign wire35 = wire8;
  module36 #() modinst104 (.wire37(wire9), .wire40(wire11), .wire41(wire10), .y(wire103), .clk(clk), .wire39(wire7), .wire38(wire13));
  assign wire105 = $signed($signed(((!wire103[(4'hc):(3'h7)]) ?
                       $unsigned(wire31[(1'h1):(1'h0)]) : (-(^wire31)))));
  module106 #() modinst143 (.clk(clk), .wire111(wire105), .wire109(wire34), .y(wire142), .wire108(wire9), .wire110(wire103), .wire107(wire35));
  assign wire144 = wire14[(1'h1):(1'h1)];
  assign wire145 = wire11[(4'hd):(3'h7)];
  assign wire146 = (wire7 ?
                       $signed($unsigned((&$unsigned((8'ha0))))) : ($signed((!$unsigned(wire6))) ?
                           $signed((~&wire142)) : wire105));
endmodule

module module106
#(parameter param140 = ((((~|((8'hb4) << (8'haa))) ^ ({(8'hae)} != ((8'h9c) ? (8'hb9) : (8'ha0)))) - {(((8'ha1) ? (8'haa) : (7'h43)) < ((8'hae) ? (8'ha0) : (8'hb1))), {(8'ha1), (8'haa)}}) ? {((~^(&(8'hba))) ? (^~(~^(8'ha0))) : {(~|(8'ha3)), {(8'hbe)}})} : (+(((~(8'haf)) ? {(8'h9f), (8'hab)} : (8'hba)) ? {{(8'haa)}, {(8'h9f), (8'hb1)}} : (((8'hba) << (8'h9d)) | ((8'hb8) != (8'h9f)))))), 
parameter param141 = (param140 << ((((8'ha2) >= (^param140)) << {(~|param140)}) ? (|param140) : (-((param140 >>> (8'h9e)) ? (~^param140) : param140)))))
(y, clk, wire111, wire110, wire109, wire108, wire107);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire111;
  input wire signed [(4'h8):(1'h0)] wire110;
  input wire signed [(3'h5):(1'h0)] wire109;
  input wire signed [(4'he):(1'h0)] wire108;
  input wire [(2'h3):(1'h0)] wire107;
  wire [(5'h11):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire134;
  wire [(3'h7):(1'h0)] wire133;
  wire signed [(4'h8):(1'h0)] wire123;
  wire [(5'h14):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire121;
  reg signed [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(3'h4):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg117 = (1'h0);
  reg [(5'h15):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  assign y = {wire139,
                 wire134,
                 wire133,
                 wire123,
                 wire122,
                 wire121,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg112 <= {$signed($signed(wire107))};
      if (((|wire108) ? reg112 : wire110[(3'h7):(1'h1)]))
        begin
          if ($signed(wire111))
            begin
              reg113 <= ($unsigned((^$signed($signed(wire110)))) && {wire110,
                  (^$unsigned(wire109))});
              reg114 <= ($unsigned(wire108) ?
                  (~^$unsigned(wire108)) : wire108[(1'h1):(1'h0)]);
              reg115 <= (-{$unsigned(reg113[(2'h3):(2'h2)])});
            end
          else
            begin
              reg113 <= ({(reg113[(1'h1):(1'h0)] & $signed({reg113})),
                  ($signed($signed(wire111)) == ($signed(wire108) ~^ {reg113}))} >>> (+wire111));
              reg114 <= {$unsigned($unsigned(wire107))};
            end
          reg116 <= wire107;
          reg117 <= ($unsigned($unsigned((wire111[(3'h7):(3'h6)] >= wire109[(2'h2):(1'h0)]))) ?
              (-({{wire108, reg112}, $signed(reg113)} ?
                  ((reg112 >>> wire107) ?
                      $unsigned(wire110) : wire111[(4'hb):(4'h8)]) : $signed((wire111 ~^ wire109)))) : (!$unsigned(wire109)));
          reg118 <= (^(reg117[(1'h1):(1'h1)] ?
              $signed($unsigned((~|(7'h40)))) : $signed($unsigned({reg112,
                  wire110}))));
        end
      else
        begin
          reg113 <= (reg117[(1'h0):(1'h0)] | wire110);
          reg114 <= wire110;
        end
      reg119 <= wire109;
      reg120 <= $unsigned(reg115[(4'h8):(1'h1)]);
    end
  assign wire121 = $unsigned(((!$unsigned(reg120)) ?
                       (reg115 ?
                           {(|reg120),
                               $unsigned(reg114)} : reg117) : $unsigned(reg113)));
  assign wire122 = reg113;
  assign wire123 = (~wire121[(4'hf):(4'hf)]);
  always
    @(posedge clk) begin
      reg124 <= $unsigned(((!$signed(reg118)) ?
          {reg117, reg113} : (+$unsigned(wire108))));
      reg125 <= $signed($unsigned({($unsigned(reg117) >>> $signed(reg124)),
          reg113}));
      reg126 <= reg124[(1'h0):(1'h0)];
      if ($unsigned(wire109))
        begin
          reg127 <= ($signed(wire122) >= ((wire111[(4'hb):(4'h8)] > (8'haf)) ^ $unsigned((wire110[(2'h3):(2'h3)] ?
              (|wire122) : wire122))));
        end
      else
        begin
          reg127 <= $signed((8'ha6));
          reg128 <= $unsigned(reg115[(3'h4):(2'h3)]);
          reg129 <= (reg128 ?
              (wire110[(3'h7):(2'h3)] ?
                  (8'hbe) : {(reg112 ^~ wire123[(2'h2):(1'h0)])}) : reg114[(4'ha):(2'h3)]);
          reg130 <= (8'ha8);
          reg131 <= (~$unsigned($signed($unsigned(reg130))));
        end
      reg132 <= ({reg115[(4'h8):(1'h0)]} ?
          {$unsigned(wire121[(4'h9):(1'h0)]),
              (+$unsigned((wire109 ?
                  reg116 : wire107)))} : $unsigned((((reg125 <= wire107) ?
              reg116[(5'h14):(4'hc)] : (+(8'hb1))) && (((8'hb5) ?
                  reg120 : (8'ha5)) ?
              reg128 : reg119[(3'h5):(2'h2)]))));
    end
  assign wire133 = {(reg112[(3'h5):(3'h5)] != ((+(wire107 * reg130)) ?
                           (|(reg130 && (8'ha7))) : wire110[(2'h3):(2'h3)])),
                       ($signed(({reg117} * $unsigned(wire110))) <= $signed(($unsigned(reg128) ?
                           ((8'ha1) ? reg120 : reg117) : $signed(reg127))))};
  assign wire134 = ((reg114 && ((|{reg120}) ?
                           $signed(reg117) : (-reg126[(2'h2):(1'h0)]))) ?
                       $signed(wire123) : $unsigned($unsigned(({wire123,
                               reg115} ?
                           (wire133 ? (8'hb8) : wire122) : (^~reg129)))));
  always
    @(posedge clk) begin
      reg135 <= reg119[(3'h5):(3'h5)];
      reg136 <= (!(&(wire123[(3'h6):(2'h3)] != ({reg126, wire107} ?
          wire123 : $signed(reg126)))));
      reg137 <= reg124;
    end
  always
    @(posedge clk) begin
      reg138 <= (reg118[(4'ha):(3'h4)] ?
          $unsigned($signed(($signed((8'had)) ?
              reg135[(1'h1):(1'h1)] : $unsigned(wire122)))) : $signed((&$unsigned($unsigned(wire121)))));
    end
  assign wire139 = ((~|((~|$signed(reg130)) >= (reg117 ?
                       reg117 : $unsigned(wire133)))) == $signed($unsigned($signed((reg117 ?
                       reg118 : reg112)))));
endmodule

module module36
#(parameter param101 = (((((&(8'hb6)) ? ((8'hb3) || (8'h9e)) : (-(8'hbe))) ? (((8'hb2) != (7'h41)) ? {(8'ha0)} : (8'ha4)) : (((7'h42) ? (8'ha9) : (8'hbd)) ^~ ((8'hb3) >>> (8'ha9)))) ? (~^(((8'hb1) ? (8'hb2) : (8'haf)) ? ((8'hbe) != (8'haa)) : {(8'hb5)})) : (8'hbc)) ? ((+(((8'ha9) >= (8'ha2)) ? (|(8'hb6)) : (~|(8'h9c)))) ? ((8'hb8) ? (^((8'hb0) ? (8'hb6) : (8'had))) : (((8'hab) >>> (8'ha3)) || {(8'ha4), (8'h9e)})) : ((((8'hb3) ? (8'ha5) : (8'hae)) ? ((8'hbb) ? (8'hb3) : (8'ha6)) : {(8'hbf), (8'haf)}) != (((8'hbb) || (8'h9c)) ^ {(8'h9c)}))) : ((~&({(8'hbe), (8'ha1)} ? ((7'h43) ? (8'hbc) : (8'ha0)) : {(7'h40), (8'ha6)})) ? (~&{((8'ha2) ? (8'hbd) : (8'hbf)), ((8'ha8) ~^ (8'ha3))}) : ((~&(-(8'hbe))) ? ({(8'hb5)} ? (&(8'hbb)) : (~&(8'hb2))) : (^((8'hbe) ? (8'hb3) : (8'haa)))))), 
parameter param102 = param101)
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h2b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire41;
  input wire [(4'h9):(1'h0)] wire40;
  input wire signed [(4'hf):(1'h0)] wire39;
  input wire signed [(5'h14):(1'h0)] wire38;
  input wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  wire signed [(4'hc):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire97;
  wire [(4'he):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire [(4'he):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire76;
  wire signed [(5'h14):(1'h0)] wire75;
  wire [(5'h13):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire [(4'h9):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire50;
  reg signed [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(4'hd):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire77,
                 wire76,
                 wire75,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire51,
                 wire50,
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
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg53,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned(wire37))
        begin
          reg42 <= (wire40[(4'h8):(3'h7)] == {$unsigned($signed((wire38 ?
                  wire37 : (8'ha2)))),
              (~$unsigned((8'ha7)))});
          if ((&(wire41[(3'h4):(3'h4)] ?
              ((wire37 ^ (^~wire39)) <= wire37) : wire41)))
            begin
              reg43 <= $unsigned($signed($unsigned(((wire37 >= (8'haa)) ?
                  reg42[(5'h12):(2'h2)] : {wire37, wire40}))));
              reg44 <= $signed(wire40);
            end
          else
            begin
              reg43 <= wire38;
              reg44 <= (reg43 || wire38);
              reg45 <= (wire39 != ((~$signed($unsigned(wire37))) ?
                  ((|(wire41 ~^ (8'hb5))) == (-(wire37 ?
                      wire37 : wire37))) : $signed(wire40)));
              reg46 <= (8'hbb);
            end
        end
      else
        begin
          reg42 <= $unsigned(reg42[(3'h6):(1'h0)]);
          if ($signed(wire38[(3'h5):(1'h1)]))
            begin
              reg43 <= {wire38[(1'h0):(1'h0)]};
              reg44 <= (^(wire40 >>> wire41));
              reg45 <= wire39;
            end
          else
            begin
              reg43 <= $unsigned($signed($signed((^~(~|wire41)))));
              reg44 <= $signed({(|reg44)});
              reg45 <= wire38[(4'hb):(2'h3)];
              reg46 <= ((wire39 | (-($unsigned(reg42) ?
                      wire38[(4'hb):(4'ha)] : $signed(reg46)))) ?
                  $signed($unsigned(reg46)) : (^(reg42 ~^ (~&(&reg45)))));
              reg47 <= (8'hbb);
            end
          reg48 <= $unsigned(($unsigned((^~{reg47, reg43})) ?
              $unsigned((wire40 | (wire41 ? reg43 : wire41))) : wire40));
          reg49 <= {reg45};
        end
    end
  assign wire50 = (|reg46);
  assign wire51 = wire40[(3'h4):(2'h2)];
  assign wire52 = ($unsigned($unsigned($unsigned($unsigned(reg45)))) ?
                      $signed($signed($unsigned((-wire37)))) : $signed($unsigned({{(8'hb9),
                              wire41}})));
  always
    @(posedge clk) begin
      reg53 <= $signed(reg43[(1'h0):(1'h0)]);
    end
  assign wire54 = wire37[(1'h0):(1'h0)];
  assign wire55 = (^~$signed($unsigned(((wire41 ? reg45 : wire39) ?
                      reg47 : (+wire38)))));
  assign wire56 = {$signed(reg47)};
  assign wire57 = wire55[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg58 <= (+{$signed(reg53)});
    end
  always
    @(posedge clk) begin
      reg59 <= wire40;
      if (wire50)
        begin
          reg60 <= reg43;
          reg61 <= reg47;
          reg62 <= $unsigned(((((8'ha9) ? (!reg60) : $unsigned(reg59)) ?
                  (reg49 ?
                      $signed((8'ha6)) : reg45[(3'h5):(1'h1)]) : (((8'hb1) ?
                      (8'hb6) : (8'hb0)) ~^ reg44[(4'hd):(1'h0)])) ?
              (8'ha5) : $signed($unsigned((wire57 ? wire54 : wire56)))));
          if ($signed($unsigned($unsigned(wire38))))
            begin
              reg63 <= {(!wire40[(3'h4):(2'h3)])};
              reg64 <= ($unsigned({({wire38, reg47} ?
                      (wire50 == wire55) : (!reg42)),
                  (&wire37[(2'h2):(1'h0)])}) <= (+$unsigned(($signed(reg61) ?
                  (wire40 <= reg58) : ((8'ha1) <<< reg42)))));
            end
          else
            begin
              reg63 <= reg45;
              reg64 <= (8'hab);
              reg65 <= ((!$signed($signed({wire38, reg42}))) <<< reg63);
              reg66 <= $signed({reg65[(2'h3):(2'h2)]});
            end
        end
      else
        begin
          reg60 <= (8'hbb);
          if ((reg64[(1'h0):(1'h0)] ?
              reg59[(3'h6):(3'h6)] : $signed($signed($signed((reg63 ?
                  reg47 : wire54))))))
            begin
              reg61 <= $unsigned(reg43[(1'h1):(1'h0)]);
              reg62 <= reg49[(3'h5):(2'h2)];
              reg63 <= (((((reg44 ? wire54 : reg42) ?
                      $unsigned((7'h44)) : $signed(reg61)) && ((~^wire50) ?
                      {reg53} : (reg49 ? wire54 : (8'ha1)))) ?
                  wire55 : wire54[(3'h7):(2'h2)]) ^~ reg58[(2'h2):(2'h2)]);
              reg64 <= ((!{$unsigned(reg48)}) ?
                  reg58[(1'h1):(1'h0)] : reg59[(2'h3):(1'h0)]);
              reg65 <= reg48;
            end
          else
            begin
              reg61 <= (8'hae);
              reg62 <= reg62[(4'he):(4'h8)];
            end
        end
      if (wire52)
        begin
          reg67 <= ($unsigned(($signed((reg64 >> (8'had))) ?
              wire54[(4'ha):(2'h2)] : (&reg42))) > $signed((8'hba)));
          reg68 <= $unsigned({$unsigned($unsigned(reg46[(3'h5):(3'h5)])),
              (reg60 ? (~(reg43 | reg46)) : (~^$unsigned(reg53)))});
        end
      else
        begin
          reg67 <= $unsigned((((^~wire38) < (~(|wire54))) >= ($unsigned((|(8'hb5))) ?
              wire40[(3'h5):(1'h0)] : {$unsigned(reg46)})));
          reg68 <= $unsigned((((wire51 ? reg66 : (reg68 == reg67)) ?
              ((wire50 ?
                  wire55 : wire51) & reg53[(3'h6):(3'h6)]) : $signed($signed(reg53))) > (reg58 ?
              $unsigned((+reg47)) : ($unsigned(reg66) ^~ wire37[(1'h1):(1'h0)]))));
          reg69 <= (wire51[(2'h3):(2'h2)] ?
              $signed(reg61[(5'h12):(4'hf)]) : {(((wire57 || wire41) ^ {reg59,
                      wire38}) >= $signed($signed(wire50)))});
          if (reg60[(3'h6):(3'h6)])
            begin
              reg70 <= $signed(((^$unsigned({wire39,
                  reg42})) ~^ $unsigned($signed((&reg53)))));
            end
          else
            begin
              reg70 <= (reg69 ?
                  reg63[(1'h1):(1'h1)] : (&(~(reg62 & (~wire50)))));
              reg71 <= (|reg43[(1'h1):(1'h0)]);
              reg72 <= (^$unsigned(($signed($unsigned((8'ha7))) ?
                  $signed({wire56, reg70}) : $unsigned(wire41))));
              reg73 <= ((wire41 ?
                      $unsigned((8'hbf)) : $signed(({(8'hb2)} * $signed(reg64)))) ?
                  (reg45 ^ reg68[(4'h8):(3'h7)]) : ((-$unsigned($unsigned(reg60))) ?
                      (wire52[(4'h8):(2'h3)] ?
                          (^(-reg48)) : (&{reg58})) : $unsigned(wire52[(3'h7):(3'h7)])));
            end
        end
      reg74 <= reg65;
    end
  assign wire75 = wire57;
  assign wire76 = wire50;
  assign wire77 = $signed(reg61);
  always
    @(posedge clk) begin
      reg78 <= $unsigned({($unsigned(wire41[(3'h4):(3'h4)]) ?
              $unsigned(reg67[(3'h4):(3'h4)]) : $signed($signed(wire76)))});
      reg79 <= {((^~{(~^reg62)}) ?
              reg62[(3'h6):(3'h5)] : ({reg78, reg63[(2'h2):(1'h1)]} ?
                  ($signed(reg70) | $signed(reg63)) : $signed($signed(reg62)))),
          (^~wire50)};
    end
  always
    @(posedge clk) begin
      if ({(^~(reg73[(1'h1):(1'h0)] | (^reg63[(1'h0):(1'h0)]))),
          wire50[(3'h6):(3'h6)]})
        begin
          reg80 <= (((({reg68} ? $unsigned(wire57) : $unsigned((8'haf))) ?
                  (!reg42) : $signed((reg44 + reg72))) ?
              {{$signed(reg70)}} : $unsigned($unsigned(wire37))) == reg43[(1'h1):(1'h0)]);
          if (($signed(reg66) ?
              ($unsigned($signed((wire54 >>> reg66))) && (reg79[(1'h0):(1'h0)] ~^ ((+reg49) ?
                  wire50 : (~^wire76)))) : $signed({{(reg42 ?
                          wire57 : (8'haa))},
                  reg65})))
            begin
              reg81 <= wire56;
            end
          else
            begin
              reg81 <= ($unsigned($signed(($unsigned(reg69) && (reg66 <= reg42)))) - ($signed($signed($unsigned(reg81))) ?
                  reg45[(2'h3):(1'h1)] : reg80));
              reg82 <= (7'h42);
              reg83 <= (^~(+reg59));
              reg84 <= ((({(~reg68), (!(8'hbd))} ?
                          $signed($unsigned(reg63)) : wire57[(4'ha):(4'h8)]) ?
                      (wire56[(1'h0):(1'h0)] ?
                          wire55 : reg73) : $unsigned($signed(((8'h9d) ?
                          reg72 : reg61)))) ?
                  reg71[(1'h0):(1'h0)] : {((reg44[(5'h12):(4'hc)] >= (7'h40)) ?
                          (~&(+reg64)) : (~^$unsigned(wire52)))});
            end
          if ($signed($unsigned(reg62)))
            begin
              reg85 <= ((wire75 != ($unsigned((^reg74)) ^~ ((reg42 <<< (8'h9e)) ?
                  (~^reg81) : $unsigned(reg44)))) == $signed(reg80[(3'h5):(1'h0)]));
              reg86 <= (+$unsigned(($unsigned((~|reg45)) >= $unsigned(reg44[(5'h13):(4'h9)]))));
              reg87 <= (~|((((wire54 ?
                      reg48 : reg47) >>> $unsigned((7'h42))) >>> ($signed(reg45) ?
                      (~|wire56) : wire52[(3'h6):(2'h3)])) ?
                  (+reg42[(1'h0):(1'h0)]) : wire39));
              reg88 <= $signed(((reg78 != $signed({wire52})) ?
                  ($unsigned($signed(reg86)) * {$signed(reg78)}) : wire55[(2'h3):(1'h1)]));
              reg89 <= (reg68[(3'h4):(1'h0)] | $signed($unsigned({$signed((8'h9f))})));
            end
          else
            begin
              reg85 <= reg59[(4'h8):(2'h2)];
              reg86 <= (wire77[(4'hb):(3'h7)] >= (!(~&((!(8'hb1)) >= {wire50,
                  reg73}))));
              reg87 <= ($signed(wire56) > $signed((reg70[(2'h3):(1'h0)] ?
                  $signed((reg89 || reg45)) : (+wire40))));
              reg88 <= $signed($unsigned((((reg74 <= reg60) ?
                      (|reg84) : (wire39 ? reg49 : reg68)) ?
                  $signed((~&reg83)) : {$unsigned(reg73)})));
            end
          if ($unsigned({wire56[(3'h7):(3'h5)],
              $unsigned(reg88[(3'h6):(3'h5)])}))
            begin
              reg90 <= $unsigned(({(~reg85),
                      ((wire50 ^ reg74) != reg81[(4'h9):(3'h7)])} ?
                  ((8'h9c) * (~&{wire37})) : $unsigned(((8'hb7) ^ reg59[(4'hb):(2'h2)]))));
            end
          else
            begin
              reg90 <= ($unsigned(reg59[(3'h6):(2'h3)]) ?
                  $unsigned($unsigned(((reg64 ? reg80 : wire77) ?
                      (8'ha7) : $signed((8'hbb))))) : wire76[(4'ha):(3'h4)]);
              reg91 <= ((reg71 ? reg69 : reg85[(3'h6):(3'h4)]) ?
                  $signed(reg64[(2'h2):(2'h2)]) : $signed($unsigned((^~$unsigned(reg83)))));
              reg92 <= reg65;
            end
        end
      else
        begin
          if (reg84)
            begin
              reg80 <= $signed(($unsigned(reg92) ?
                  ($signed(wire76) >> $signed(((8'hbb) ^ (8'ha9)))) : (+(wire57[(3'h4):(1'h1)] | reg82[(4'ha):(4'h8)]))));
              reg81 <= $signed(reg44);
              reg82 <= reg69[(4'hf):(3'h6)];
            end
          else
            begin
              reg80 <= wire57[(5'h13):(3'h4)];
              reg81 <= reg83;
            end
        end
      reg93 <= reg64[(2'h2):(1'h0)];
    end
  assign wire94 = reg80[(3'h5):(2'h3)];
  assign wire95 = reg93;
  assign wire96 = reg79[(4'hd):(4'h8)];
  assign wire97 = reg69[(3'h7):(3'h7)];
  assign wire98 = {(reg91[(2'h3):(2'h2)] >>> $signed(reg86)),
                      (~(~|((8'ha7) ? ((8'hb2) ? reg46 : wire40) : (8'hb3))))};
  assign wire99 = (($signed(((wire56 >>> reg90) ?
                          reg86[(2'h2):(2'h2)] : wire56[(4'hb):(4'ha)])) <<< reg68) ?
                      reg74 : wire94);
  assign wire100 = $unsigned(((~$signed((wire38 < reg81))) ?
                       reg42[(2'h3):(2'h3)] : (!$unsigned($signed(wire54)))));
endmodule

module module15
#(parameter param27 = (~({{((7'h44) > (8'hac))}, (^~((8'hbf) ? (8'hbf) : (8'hba)))} >> (^~((^(8'ha9)) * ((8'h9e) && (8'hb2)))))), 
parameter param28 = param27)
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire [(4'h9):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'h8):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  assign y = {wire22, wire21, wire20, reg26, reg25, reg24, reg23, (1'h0)};
  assign wire20 = (((!((wire18 ~^ wire18) ?
                              (&wire19) : wire16[(4'h9):(4'h8)])) ?
                          (wire19 ?
                              ($unsigned(wire19) ^ wire19[(1'h1):(1'h0)]) : wire17) : ((wire16[(4'he):(2'h3)] - $unsigned((8'ha5))) - $signed(wire16[(1'h1):(1'h0)]))) ?
                      wire18[(1'h1):(1'h0)] : (({$signed(wire18),
                              (wire19 ? wire17 : wire19)} ?
                          {(&wire17),
                              (wire18 ^ wire16)} : (8'hbd)) ^ ($unsigned(wire19) > wire18[(1'h0):(1'h0)])));
  assign wire21 = $unsigned(wire19[(3'h5):(1'h1)]);
  assign wire22 = (($unsigned($unsigned(((8'h9f) ? wire21 : (8'ha5)))) ?
                          (~|(wire19 ?
                              $unsigned(wire20) : $signed((8'ha4)))) : (-wire17[(4'h9):(3'h7)])) ?
                      $signed({(wire19 >> (wire16 ?
                              wire19 : wire21))}) : $signed((({wire20} ?
                              wire20 : ((8'had) ? (8'h9d) : wire19)) ?
                          wire19[(3'h6):(1'h0)] : $signed($unsigned(wire16)))));
  always
    @(posedge clk) begin
      reg23 <= (({wire16[(2'h2):(1'h1)],
          $signed((wire20 ? wire16 : wire16))} >> ($unsigned({wire18}) ?
          ($unsigned(wire18) ?
              wire18[(1'h1):(1'h0)] : ((8'hac) || wire17)) : ((wire16 || wire20) ~^ wire17[(4'h9):(4'h9)]))) ^~ ((8'hbd) ?
          wire16 : (wire19 ?
              (((8'hac) <<< wire18) <= wire19[(3'h4):(1'h1)]) : wire21[(4'h8):(2'h3)])));
      reg24 <= {(8'hb4),
          (wire18 ? wire20[(3'h6):(3'h6)] : (|{{wire22, (7'h44)}}))};
      reg25 <= ((reg23[(3'h5):(1'h0)] ?
          {(~&(wire21 ? wire22 : wire16)),
              $signed((wire18 ~^ wire16))} : (wire19[(3'h4):(1'h1)] + ($signed(wire18) * wire21[(2'h3):(1'h0)]))) >>> reg24);
      reg26 <= (wire20 ? wire21[(4'hb):(3'h7)] : $signed(wire18));
    end
endmodule

module module204
#(parameter param213 = (~((^~(~&((8'ha5) ? (8'haf) : (8'hba)))) ? {{(~|(8'h9d))}, (((8'ha3) == (8'hb8)) && ((8'hbe) ^~ (8'h9d)))} : ((~&(^~(8'hba))) || (~&((8'haa) || (8'had)))))), 
parameter param214 = ((^~(((+param213) && (param213 || param213)) ? (^(8'hb6)) : {(param213 ? param213 : (8'hb1)), (param213 ? param213 : param213)})) <= (^~(((^~param213) ? {param213, param213} : param213) ? (-{param213, param213}) : ({param213} ? (~|param213) : (param213 < param213))))))
(y, clk, wire208, wire207, wire206, wire205);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire208;
  input wire signed [(4'hc):(1'h0)] wire207;
  input wire [(3'h7):(1'h0)] wire206;
  input wire signed [(4'hc):(1'h0)] wire205;
  wire [(4'hc):(1'h0)] wire212;
  wire [(4'hd):(1'h0)] wire211;
  wire signed [(3'h5):(1'h0)] wire210;
  wire signed [(4'hc):(1'h0)] wire209;
  assign y = {wire212, wire211, wire210, wire209, (1'h0)};
  assign wire209 = (8'hb8);
  assign wire210 = (wire206 * ((|(wire205[(4'h9):(3'h4)] ?
                           $signed(wire206) : wire206[(1'h0):(1'h0)])) ?
                       (^~$unsigned($signed(wire206))) : ({$signed(wire209),
                               (-(8'ha3))} ?
                           wire209 : (wire206 <<< wire206[(3'h6):(3'h4)]))));
  assign wire211 = ((!$signed($unsigned(wire209))) ?
                       ($unsigned(wire208) ?
                           $unsigned($unsigned($unsigned(wire205))) : (((wire206 >= wire208) ~^ ((8'haf) ^ wire208)) ?
                               wire206 : (!{wire210,
                                   wire206}))) : (~&$signed(wire206)));
  assign wire212 = wire208;
endmodule

module module163  (y, clk, wire168, wire167, wire166, wire165, wire164);
  output wire [(32'h119):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire168;
  input wire signed [(5'h14):(1'h0)] wire167;
  input wire [(4'ha):(1'h0)] wire166;
  input wire signed [(5'h15):(1'h0)] wire165;
  input wire signed [(4'ha):(1'h0)] wire164;
  wire [(4'hc):(1'h0)] wire191;
  wire signed [(3'h4):(1'h0)] wire190;
  wire [(4'hb):(1'h0)] wire189;
  wire signed [(5'h15):(1'h0)] wire188;
  wire signed [(4'h8):(1'h0)] wire187;
  wire [(5'h13):(1'h0)] wire177;
  wire [(5'h12):(1'h0)] wire176;
  wire signed [(3'h4):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire174;
  wire [(4'h8):(1'h0)] wire173;
  wire signed [(2'h3):(1'h0)] wire172;
  wire signed [(4'ha):(1'h0)] wire169;
  reg [(2'h2):(1'h0)] reg186 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg185 = (1'h0);
  reg [(4'h8):(1'h0)] reg184 = (1'h0);
  reg [(5'h11):(1'h0)] reg183 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg signed [(4'he):(1'h0)] reg180 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg178 = (1'h0);
  reg signed [(4'he):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  assign y = {wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire169,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg171,
                 reg170,
                 (1'h0)};
  assign wire169 = $unsigned(wire165);
  always
    @(posedge clk) begin
      reg170 <= $signed(($unsigned((&((8'hae) ? wire166 : wire166))) ?
          $unsigned($signed(wire167)) : $signed(wire165[(4'he):(3'h4)])));
      reg171 <= $signed((~&$signed(((-wire168) ?
          (wire166 ? (8'hb4) : wire167) : $unsigned(wire165)))));
    end
  assign wire172 = $signed(wire165);
  assign wire173 = (!$unsigned($unsigned($signed((wire167 < wire165)))));
  assign wire174 = (|$signed((~^wire165[(5'h10):(3'h6)])));
  assign wire175 = $signed((wire169[(2'h2):(1'h0)] ~^ wire173[(3'h4):(2'h3)]));
  assign wire176 = reg170;
  assign wire177 = ($signed(reg171) ?
                       ($signed($unsigned(wire176[(3'h5):(2'h2)])) ?
                           ($signed({wire176,
                               wire166}) && wire174) : wire164[(3'h4):(1'h0)]) : (wire164 ~^ $unsigned((~(wire174 == wire167)))));
  always
    @(posedge clk) begin
      reg178 <= wire165[(4'hc):(4'hb)];
      reg179 <= (-$signed((((wire174 ? reg171 : wire164) ?
          $unsigned(wire168) : wire164) >>> reg170[(3'h5):(3'h4)])));
      if (wire177[(4'h9):(2'h2)])
        begin
          reg180 <= ((&wire176) > ((|((wire164 < reg179) * ((8'hb1) ?
              wire164 : wire175))) >= ((((8'ha7) + wire172) ?
              wire172[(1'h0):(1'h0)] : $unsigned(reg179)) * (wire165[(4'hc):(2'h3)] && {(8'hbc)}))));
          reg181 <= wire168;
          reg182 <= (~(~^$unsigned({$signed(reg178), (wire175 >>> wire169)})));
        end
      else
        begin
          reg180 <= (-(-reg178));
          if ($unsigned($unsigned((^($unsigned(reg180) ?
              $unsigned(wire174) : $signed((8'h9f)))))))
            begin
              reg181 <= wire167;
              reg182 <= (&{wire164[(3'h7):(3'h6)]});
              reg183 <= (^reg171);
              reg184 <= $unsigned((!reg182));
            end
          else
            begin
              reg181 <= ((wire173[(1'h0):(1'h0)] && wire166[(4'ha):(1'h1)]) ?
                  $signed(($unsigned($unsigned(reg181)) >> wire164)) : ($unsigned($unsigned((wire172 > reg171))) >>> wire165[(4'hb):(3'h6)]));
              reg182 <= $signed((|($signed((+(8'hab))) || reg179[(3'h5):(1'h0)])));
              reg183 <= (wire172 ?
                  wire164[(2'h3):(2'h2)] : (|wire175[(3'h4):(3'h4)]));
              reg184 <= {(&wire169[(3'h7):(3'h4)]),
                  (-($signed((~|(8'hbd))) <<< $signed($unsigned(wire177))))};
            end
          reg185 <= $unsigned({$signed(wire173[(4'h8):(3'h7)]),
              ({wire174[(3'h7):(3'h7)]} != (~^reg178[(4'hc):(4'hc)]))});
          reg186 <= wire174;
        end
    end
  assign wire187 = (8'ha8);
  assign wire188 = {(8'h9c),
                       $signed(((reg179[(2'h2):(1'h0)] & (reg183 ?
                               reg183 : (8'hb7))) ?
                           {reg181} : $signed($signed(wire172))))};
  assign wire189 = wire169[(3'h6):(2'h3)];
  assign wire190 = ($unsigned(reg179[(2'h3):(1'h0)]) ?
                       (((7'h43) ?
                               $unsigned($signed(reg185)) : (reg170[(3'h7):(2'h2)] ?
                                   (^~(8'hb1)) : (|wire168))) ?
                           wire165 : (($unsigned(reg181) ?
                                   (reg180 >> wire169) : (|reg180)) ?
                               $unsigned({reg178,
                                   wire172}) : wire166)) : $signed($unsigned($unsigned(reg181))));
  assign wire191 = ((~($signed($unsigned(wire174)) ?
                       ((wire176 ?
                           reg171 : wire190) || (^wire189)) : (8'ha4))) ^ $signed($signed($unsigned((reg171 ?
                       wire175 : wire174)))));
endmodule
