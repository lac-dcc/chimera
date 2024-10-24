module top
#(parameter param197 = (((&(+((7'h42) >>> (8'hbd)))) * (~(((8'ha6) != (8'hac)) ^ ((8'hb7) <<< (8'hb9))))) ? ((~^(^~((8'h9e) > (8'ha5)))) ? ((((8'h9e) != (7'h44)) < (8'ha9)) >>> (~|((8'hbe) >> (8'hb2)))) : {((!(8'hbe)) || (~|(8'h9f)))}) : (~^{((~(8'h9f)) <= (!(7'h42)))})), 
parameter param198 = param197)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h160):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire196;
  wire [(5'h12):(1'h0)] wire195;
  wire [(2'h2):(1'h0)] wire194;
  wire [(5'h12):(1'h0)] wire101;
  wire [(5'h10):(1'h0)] wire113;
  wire signed [(2'h2):(1'h0)] wire114;
  wire [(5'h13):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire116;
  wire [(4'h9):(1'h0)] wire117;
  wire signed [(3'h7):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire119;
  wire [(3'h4):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire123;
  wire signed [(4'ha):(1'h0)] wire124;
  wire signed [(2'h3):(1'h0)] wire125;
  wire [(5'h13):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire127;
  wire signed [(4'ha):(1'h0)] wire192;
  reg [(4'ha):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(5'h10):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(4'hd):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire101,
                 wire113,
                 wire114,
                 wire115,
                 wire116,
                 wire117,
                 wire118,
                 wire119,
                 wire122,
                 wire123,
                 wire124,
                 wire125,
                 wire126,
                 wire127,
                 wire192,
                 reg130,
                 reg129,
                 reg128,
                 reg121,
                 reg120,
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
                 (1'h0)};
  module4 #() modinst102 (.clk(clk), .wire7(wire0), .wire8(wire2), .wire5(wire1), .wire6(wire3), .y(wire101));
  always
    @(posedge clk) begin
      reg103 <= ($signed(wire1[(4'ha):(3'h7)]) & wire1[(4'h9):(2'h3)]);
      reg104 <= (~&{({$unsigned(wire3)} ?
              $unsigned((reg103 ? wire1 : wire3)) : (wire0 ?
                  $unsigned(reg103) : (wire0 > wire2)))});
      reg105 <= (($signed($unsigned({wire0})) ^~ {$signed($unsigned(reg103)),
          reg103}) && ($unsigned((wire1 ?
          {wire3, wire0} : $unsigned(reg104))) <= (~{wire0[(2'h2):(1'h0)]})));
      reg106 <= {($unsigned($signed((wire3 ^~ wire101))) - reg104[(4'h9):(1'h1)]),
          (~|$unsigned($unsigned(reg105)))};
      if ((({reg106[(4'h8):(4'h8)],
              $signed($signed(wire2))} > (|($unsigned(wire2) ?
              (wire2 << reg106) : (!(8'h9e))))) ?
          ($signed($unsigned({(8'ha1)})) ?
              (wire101[(3'h6):(3'h5)] ?
                  $signed($unsigned(reg103)) : (~^$signed((8'haf)))) : $signed($signed($unsigned(reg105)))) : reg105[(3'h5):(3'h4)]))
        begin
          reg107 <= (((reg103[(4'he):(4'h9)] * (~|(wire1 ?
              reg103 : wire101))) ~^ wire2) || wire1);
          if ((~|(reg107 ?
              ($signed((~|wire101)) ?
                  ((+wire3) < $signed(reg106)) : (^~$unsigned(wire2))) : $unsigned($unsigned((+wire3))))))
            begin
              reg108 <= reg104;
              reg109 <= $signed(wire0[(1'h1):(1'h1)]);
              reg110 <= reg109;
              reg111 <= wire2[(4'hc):(4'h9)];
              reg112 <= ((|wire101[(2'h2):(2'h2)]) == $unsigned((8'h9f)));
            end
          else
            begin
              reg108 <= $unsigned(reg112[(3'h5):(2'h2)]);
              reg109 <= reg110;
              reg110 <= {wire2[(5'h10):(4'h8)]};
            end
        end
      else
        begin
          reg107 <= (8'hbb);
          reg108 <= {(({{reg106, reg104}, {wire3, wire1}} & ({reg112} ?
                      (wire1 ? reg104 : reg112) : reg109[(1'h1):(1'h0)])) ?
                  reg104 : ((~|$signed(reg106)) ?
                      (^reg107[(4'ha):(4'ha)]) : (+reg107))),
              $signed(reg112)};
          reg109 <= (+wire101[(1'h0):(1'h0)]);
        end
    end
  assign wire113 = reg103;
  assign wire114 = {$unsigned(wire101), reg108};
  assign wire115 = (reg103 == {$signed((+(wire2 || (8'hb8)))),
                       $signed(reg111[(2'h2):(1'h1)])});
  assign wire116 = ((wire3[(4'h9):(1'h1)] ?
                       $signed(((!reg107) ?
                           reg109 : ((7'h41) ? reg111 : wire115))) : (reg107 ?
                           {(reg105 ?
                                   wire113 : reg109)} : ({wire2} ~^ (^wire0)))) - ((~^(reg108 ?
                           (reg103 & wire0) : reg108[(4'h9):(3'h4)])) ?
                       $signed(wire101) : $unsigned(reg109[(1'h1):(1'h1)])));
  assign wire117 = wire2[(5'h14):(4'h8)];
  assign wire118 = (~(-$unsigned($signed(reg107))));
  assign wire119 = ($unsigned((((reg109 ? wire113 : wire1) > {reg110, reg106}) ?
                       $unsigned(wire3) : wire1)) <<< wire115);
  always
    @(posedge clk) begin
      reg120 <= (~^$unsigned(wire113));
    end
  always
    @(posedge clk) begin
      reg121 <= $signed($signed((-wire3)));
    end
  assign wire122 = {$unsigned({($unsigned((8'h9f)) && {wire116, reg110})})};
  assign wire123 = wire118[(3'h5):(3'h4)];
  assign wire124 = wire0;
  assign wire125 = $unsigned(wire1);
  assign wire126 = ((($unsigned(reg110) * reg105[(3'h7):(3'h4)]) ~^ reg104[(3'h7):(3'h4)]) ?
                       (8'h9f) : wire2[(1'h0):(1'h0)]);
  assign wire127 = $unsigned(((($unsigned((8'hb5)) ?
                               (wire116 ?
                                   (8'hae) : (8'hbb)) : $signed(reg107)) ?
                           reg106[(4'hc):(2'h3)] : (~&reg106[(3'h6):(1'h0)])) ?
                       reg109[(2'h2):(1'h1)] : (reg107 * wire118)));
  always
    @(posedge clk) begin
      reg128 <= (({(reg109[(1'h1):(1'h1)] ? (&wire1) : wire116)} ?
              (wire1 ?
                  wire125[(2'h2):(1'h0)] : ($unsigned(wire114) >> (~|reg120))) : (({wire3,
                  (8'hb0)} >= (~|wire101)) - (~wire123))) ?
          $signed((8'ha6)) : wire122);
      reg129 <= reg121[(3'h5):(2'h2)];
      reg130 <= (~&((reg105[(2'h2):(2'h2)] * {$signed(wire117),
          wire119}) >> $unsigned(((wire119 >= (8'ha9)) ?
          $signed(wire115) : $signed((8'hb9))))));
    end
  module131 #() modinst193 (wire192, clk, wire117, reg106, reg104, reg120, reg105);
  assign wire194 = $signed(wire192);
  assign wire195 = reg128;
  assign wire196 = ((~&$signed($signed((wire3 ^ (8'ha6))))) ?
                       $signed($signed(reg130)) : $unsigned($signed(wire194[(1'h1):(1'h1)])));
endmodule

module module131
#(parameter param190 = ((~&(((!(8'hab)) <= ((8'hb6) ? (8'hb5) : (8'hb8))) != (-((8'haa) >= (8'ha2))))) ? (~({((8'hac) < (8'haa)), ((8'ha1) ? (8'ha5) : (8'h9f))} ~^ (((8'hab) ? (8'hae) : (8'h9c)) ^~ (~^(8'hbf))))) : ((8'hbf) ? ((!((8'h9f) << (8'hba))) + (-(!(8'haa)))) : ((+(8'hb4)) == (((8'hb9) ? (8'hb3) : (8'hb0)) ^~ {(8'ha8), (7'h41)})))), 
parameter param191 = (((((param190 ? param190 : param190) >= param190) || (-(param190 ? param190 : (8'ha8)))) ? param190 : (!{(param190 ? (8'hba) : param190)})) ? (param190 && {param190, (param190 ? (param190 ? param190 : param190) : (param190 ? (8'hbf) : param190))}) : (((~^param190) == param190) ? ((param190 <= (^~param190)) ? ((param190 + param190) ? param190 : {(8'haa)}) : (~^(param190 ? param190 : param190))) : (8'hbc))))
(y, clk, wire132, wire133, wire134, wire135, wire136);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire132;
  input wire [(3'h5):(1'h0)] wire133;
  input wire [(4'hf):(1'h0)] wire134;
  input wire [(2'h2):(1'h0)] wire135;
  input wire signed [(5'h11):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire189;
  wire [(3'h7):(1'h0)] wire188;
  wire [(5'h10):(1'h0)] wire171;
  reg signed [(4'h8):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg185 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg184 = (1'h0);
  reg [(4'ha):(1'h0)] reg183 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg182 = (1'h0);
  reg [(4'he):(1'h0)] reg181 = (1'h0);
  reg [(4'ha):(1'h0)] reg180 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg179 = (1'h0);
  reg [(3'h5):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg176 = (1'h0);
  reg [(3'h5):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(3'h6):(1'h0)] reg138 = (1'h0);
  reg [(4'he):(1'h0)] reg137 = (1'h0);
  assign y = {wire189,
                 wire188,
                 wire171,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
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
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg137 <= {wire134[(2'h3):(2'h3)], wire133};
      reg138 <= ($signed({$signed($signed((8'h9c)))}) ?
          $unsigned((((wire132 ? wire134 : wire134) ?
                  reg137 : $unsigned(wire135)) ?
              $signed((~&(8'h9f))) : $unsigned(reg137))) : $signed({$unsigned($unsigned(reg137)),
              wire132[(4'h9):(4'h8)]}));
      reg139 <= {wire135[(2'h2):(2'h2)]};
    end
  module140 #() modinst172 (wire171, clk, reg138, wire132, wire134, reg137, wire136);
  always
    @(posedge clk) begin
      if ($signed((wire134[(4'hd):(4'ha)] ?
          (wire133 ?
              ((|reg137) ?
                  $signed((8'hb2)) : $signed((8'hbc))) : (|$unsigned(wire171))) : ($signed({wire132,
              wire171}) | ((8'ha1) ^~ wire136)))))
        begin
          reg173 <= wire133;
          reg174 <= reg139;
          reg175 <= (~&wire132[(4'h8):(1'h0)]);
        end
      else
        begin
          if (((~(~^reg139)) ?
              wire135 : ($signed(((reg137 ~^ reg138) >= (8'hb0))) ?
                  wire135 : wire136)))
            begin
              reg173 <= (&((&wire171) - (($unsigned(wire171) || $unsigned(wire132)) * reg138[(3'h5):(3'h4)])));
              reg174 <= (^~$signed($signed($unsigned((!reg175)))));
              reg175 <= {$signed($signed(({reg137} ? {reg138} : (|reg175))))};
              reg176 <= ($unsigned($unsigned(wire132)) | wire136[(3'h6):(2'h2)]);
            end
          else
            begin
              reg173 <= ($unsigned(($unsigned(wire132[(3'h4):(2'h3)]) ?
                  (^$unsigned(wire133)) : $signed($signed(wire132)))) >= (reg173[(2'h2):(2'h2)] >>> $signed($unsigned(wire132))));
            end
          reg177 <= ((wire133 ?
              reg137[(3'h4):(2'h2)] : {(^~(reg138 ?
                      wire132 : wire133))}) >>> reg139[(4'hc):(3'h5)]);
          if (wire135[(1'h0):(1'h0)])
            begin
              reg178 <= $signed((reg173[(1'h0):(1'h0)] ^ wire171));
              reg179 <= ($unsigned((~^(8'h9c))) * ({($signed(wire135) >> $unsigned(wire136))} ?
                  ($unsigned((reg173 ?
                      (8'hbc) : reg176)) >> $unsigned(((8'hbd) ?
                      wire171 : wire134))) : wire132[(4'h9):(1'h0)]));
              reg180 <= reg173[(2'h2):(1'h0)];
              reg181 <= (($signed($signed($unsigned((8'hbb)))) & wire134[(4'h8):(3'h4)]) ?
                  reg180[(3'h6):(1'h1)] : wire171[(3'h4):(3'h4)]);
              reg182 <= ($unsigned((((reg176 != (8'h9d)) > $signed(reg178)) == (+(reg177 > reg179)))) != $signed(($unsigned(reg139[(4'hd):(4'hc)]) <= (!(wire171 ?
                  wire136 : reg175)))));
            end
          else
            begin
              reg178 <= $signed(reg177[(3'h5):(3'h4)]);
              reg179 <= (reg182[(2'h3):(1'h1)] ?
                  $signed(wire136[(4'he):(4'h8)]) : ($unsigned((8'hb9)) * {(~|$unsigned(reg177)),
                      (|{wire135})}));
            end
        end
      reg183 <= $unsigned($signed((wire134 ?
          wire136 : $unsigned($signed(wire134)))));
      reg184 <= (8'hba);
      if ({wire134[(1'h1):(1'h1)], reg179})
        begin
          reg185 <= wire133;
          reg186 <= ($unsigned((reg178[(2'h2):(1'h1)] ?
                  $unsigned((reg183 && wire171)) : $signed((^reg180)))) ?
              ((^~wire136) & ($signed(reg179[(2'h3):(1'h1)]) ?
                  {wire132[(2'h3):(2'h3)]} : (-reg182[(2'h2):(2'h2)]))) : reg180);
        end
      else
        begin
          reg185 <= {reg182, reg138[(2'h2):(2'h2)]};
        end
      reg187 <= (&{$signed($signed($signed((8'h9f))))});
    end
  assign wire188 = (reg179 ?
                       (wire136[(2'h3):(1'h1)] < {wire136[(4'ha):(3'h6)]}) : ($signed(($signed(reg187) ?
                           (reg177 ?
                               reg173 : (8'h9d)) : reg178)) ^~ reg185[(5'h12):(5'h10)]));
  assign wire189 = (^reg181[(3'h4):(3'h4)]);
endmodule

module module4
#(parameter param100 = {(8'h9c)})
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire5;
  input wire [(4'hc):(1'h0)] wire6;
  input wire [(4'h8):(1'h0)] wire7;
  input wire [(4'h9):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire99;
  wire [(5'h14):(1'h0)] wire97;
  wire [(4'hf):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire24;
  assign y = {wire99,
                 wire97,
                 wire84,
                 wire82,
                 wire28,
                 wire27,
                 wire26,
                 wire9,
                 wire10,
                 wire24,
                 (1'h0)};
  assign wire9 = (wire5[(2'h3):(2'h2)] ?
                     $signed(({{wire5, wire6}, wire7} ?
                         $signed($unsigned((8'h9f))) : wire8[(3'h4):(3'h4)])) : (wire5[(2'h2):(2'h2)] ?
                         $unsigned(((8'hb5) ?
                             wire6[(3'h6):(1'h1)] : ((8'hab) ?
                                 wire5 : wire8))) : (wire6[(3'h7):(2'h3)] ?
                             $unsigned((8'ha3)) : (^((8'ha7) >>> wire7)))));
  assign wire10 = wire8[(4'h8):(2'h2)];
  module11 #() modinst25 (.wire16(wire7), .wire12(wire6), .wire13(wire10), .clk(clk), .wire14(wire9), .y(wire24), .wire15(wire5));
  assign wire26 = {wire10, ((-$unsigned(wire7)) ~^ $signed(wire6))};
  assign wire27 = wire26[(4'h9):(3'h4)];
  assign wire28 = $unsigned((7'h41));
  module29 #() modinst83 (wire82, clk, wire24, wire9, wire28, wire10);
  assign wire84 = ((8'ha2) ?
                      (~|wire8) : ($signed(wire27) & (-$unsigned((-wire5)))));
  module85 #() modinst98 (.wire87(wire82), .wire88(wire27), .wire86(wire7), .clk(clk), .wire89(wire10), .y(wire97));
  assign wire99 = wire28[(1'h0):(1'h0)];
endmodule

module module85
#(parameter param95 = ((~&(((8'hbd) ? ((8'h9d) ? (8'haa) : (8'hba)) : ((8'h9e) ? (8'hbb) : (7'h42))) - ({(8'had), (8'ha9)} ? {(7'h42), (8'ha9)} : (!(8'h9c))))) && ({(-((8'ha3) ? (8'hbf) : (8'h9f))), (~((8'hb0) ? (8'hb9) : (8'ha8)))} && (^(((8'haf) ? (8'hb4) : (8'ha5)) >= (!(8'ha2)))))), 
parameter param96 = (param95 ? ((^(~(param95 << (8'hbf)))) < ((^param95) >>> ((param95 ? param95 : param95) < (param95 ? param95 : param95)))) : param95))
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire89;
  input wire [(5'h11):(1'h0)] wire88;
  input wire [(5'h13):(1'h0)] wire87;
  input wire [(2'h3):(1'h0)] wire86;
  wire signed [(3'h7):(1'h0)] wire94;
  wire signed [(4'he):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire90;
  assign y = {wire94, wire93, wire92, wire91, wire90, (1'h0)};
  assign wire90 = wire88;
  assign wire91 = $signed((-(8'hbb)));
  assign wire92 = {((~^(~|$signed(wire90))) == $unsigned(wire88[(2'h3):(2'h2)]))};
  assign wire93 = (~&wire88);
  assign wire94 = (!wire92[(2'h3):(2'h2)]);
endmodule

module module29  (y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h236):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire [(4'ha):(1'h0)] wire32;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire80;
  wire [(3'h5):(1'h0)] wire79;
  wire signed [(4'h8):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire signed [(4'he):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(5'h11):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire signed [(4'hb):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire [(2'h3):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg [(2'h3):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(5'h15):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire34 = ($signed({wire30}) >= (~&(~^{(wire33 > wire31)})));
  assign wire35 = $unsigned($signed(($signed($signed(wire32)) ?
                      wire32[(3'h4):(1'h1)] : (wire31[(3'h7):(1'h1)] ?
                          $unsigned(wire31) : (wire34 << wire31)))));
  assign wire36 = (((($signed(wire30) ?
                          (wire35 ?
                              wire31 : wire32) : $unsigned(wire33)) >> $unsigned(wire33)) ?
                      $unsigned(((wire33 == wire34) < (wire31 ~^ wire33))) : $signed(($unsigned((8'hac)) >> (wire35 > (8'ha5))))) << $signed($unsigned(($signed(wire33) ?
                      (wire33 <= wire30) : wire35))));
  assign wire37 = (~|(|$signed({wire30[(4'he):(1'h0)]})));
  always
    @(posedge clk) begin
      reg38 <= wire36;
      reg39 <= $signed((&$signed(wire37)));
      reg40 <= ((-$signed({wire35, $signed(wire37)})) - $signed((reg39 ?
          wire31[(3'h5):(1'h1)] : wire32)));
    end
  assign wire41 = $unsigned(($unsigned({(^wire31),
                      wire30[(3'h5):(3'h4)]}) + wire32[(2'h3):(2'h3)]));
  assign wire42 = (&({$unsigned($signed((7'h42))),
                          $unsigned((wire41 || (8'ha3)))} ?
                      (7'h42) : {((wire41 ? reg40 : wire35) ?
                              $unsigned(reg38) : $signed(wire34))}));
  assign wire43 = reg40[(3'h6):(2'h3)];
  assign wire44 = $unsigned($unsigned((-wire32[(3'h7):(2'h2)])));
  assign wire45 = $unsigned(((8'hbc) ?
                      (wire30[(2'h3):(1'h0)] ?
                          $unsigned((wire44 ?
                              reg38 : wire30)) : ($signed(wire43) | $unsigned(wire34))) : (wire31[(3'h4):(1'h0)] ?
                          wire31[(3'h6):(2'h2)] : (wire37[(2'h2):(1'h1)] ?
                              (wire30 ?
                                  reg39 : reg39) : wire42[(1'h0):(1'h0)]))));
  assign wire46 = $unsigned((8'h9f));
  always
    @(posedge clk) begin
      if ((&wire41[(3'h6):(1'h0)]))
        begin
          reg47 <= {($unsigned(wire32[(4'h8):(3'h4)]) || $unsigned((^$unsigned(wire42))))};
          reg48 <= $unsigned($unsigned((wire45 ?
              {(reg39 ? wire46 : wire37), (!(7'h41))} : wire32)));
          if (($signed(($signed((wire35 ?
              wire30 : wire33)) <= wire32[(4'ha):(4'ha)])) <= (7'h44)))
            begin
              reg49 <= $unsigned((~&((&{reg40, reg48}) ? wire37 : wire43)));
              reg50 <= wire46;
              reg51 <= (~|(wire36 | ($signed((8'hb7)) ?
                  $signed((wire45 ?
                      (8'hb6) : (8'ha8))) : $unsigned($unsigned(wire30)))));
              reg52 <= ((&$unsigned((wire37[(2'h2):(1'h0)] + wire46))) <<< $signed((~^((wire45 == wire33) ?
                  $unsigned(wire30) : (~wire32)))));
              reg53 <= (-wire43);
            end
          else
            begin
              reg49 <= $signed((!reg40));
            end
          reg54 <= $signed(wire34);
        end
      else
        begin
          reg47 <= reg51;
          reg48 <= (~&wire36[(3'h4):(1'h0)]);
          reg49 <= $unsigned((^reg51));
          if ((reg38[(1'h0):(1'h0)] ?
              {($signed($signed((8'ha6))) ?
                      $unsigned(((7'h41) ?
                          reg38 : wire44)) : wire35[(4'he):(4'h8)]),
                  {$signed((~reg40)),
                      $unsigned((reg38 ^ wire30))}} : $unsigned($signed(wire46[(1'h1):(1'h1)]))))
            begin
              reg50 <= $signed($unsigned(reg53));
            end
          else
            begin
              reg50 <= reg40[(5'h11):(4'ha)];
              reg51 <= ($unsigned(($signed((reg51 ? wire44 : (8'hb3))) ?
                  wire33 : (+{wire43}))) > wire37);
              reg52 <= $signed($unsigned(($unsigned($signed(reg54)) ?
                  (8'haf) : (~(wire33 >>> reg48)))));
            end
        end
      if ($signed({(!(wire33[(4'he):(4'hc)] ? {reg51, (8'hb2)} : wire41)),
          (reg50 + $signed(((8'hbf) ? wire41 : reg39)))}))
        begin
          reg55 <= $unsigned((~|((&wire44) <= $unsigned($signed(reg51)))));
          if (reg40[(3'h6):(2'h2)])
            begin
              reg56 <= wire44[(2'h2):(2'h2)];
            end
          else
            begin
              reg56 <= (8'hb9);
              reg57 <= $signed($signed(($signed(reg51[(4'hf):(4'hd)]) ?
                  reg54[(3'h7):(3'h7)] : (^(!reg56)))));
              reg58 <= wire37[(2'h3):(2'h3)];
            end
          if (reg58)
            begin
              reg59 <= ($signed($unsigned(reg47)) <<< (!$signed((wire34 ?
                  {reg40, reg48} : wire36))));
              reg60 <= ($signed($unsigned(wire41)) ?
                  $unsigned(((-reg48[(4'ha):(1'h0)]) ?
                      wire36 : (8'ha2))) : (~&{(~(!wire46)),
                      (((8'ha1) != reg50) >= (!(8'hb0)))}));
            end
          else
            begin
              reg59 <= ({wire42} & $signed(reg40[(1'h0):(1'h0)]));
              reg60 <= (8'had);
            end
          if (wire35[(1'h1):(1'h0)])
            begin
              reg61 <= reg52;
            end
          else
            begin
              reg61 <= ((($signed(reg50[(4'hb):(2'h2)]) ?
                      (wire45[(4'h8):(3'h4)] >>> $signed((8'h9e))) : {$unsigned(reg53)}) ?
                  wire30 : (8'ha3)) >>> reg47[(1'h1):(1'h1)]);
              reg62 <= $signed($signed((-(+{reg53}))));
            end
        end
      else
        begin
          if ($signed({$unsigned(((reg57 <<< wire30) || $unsigned(wire31))),
              {($unsigned((8'ha6)) << reg47[(2'h3):(2'h3)]),
                  ((wire43 || wire37) ^~ (^reg40))}}))
            begin
              reg55 <= wire42;
              reg56 <= reg48;
              reg57 <= reg51[(1'h0):(1'h0)];
              reg58 <= wire42;
            end
          else
            begin
              reg55 <= reg62[(3'h5):(3'h4)];
              reg56 <= (($unsigned($signed(wire33)) ?
                  $unsigned(((~wire32) ?
                      $unsigned(reg51) : $signed(reg39))) : ((&(^~reg50)) >> (8'hb6))) ~^ wire33[(4'hc):(3'h4)]);
              reg57 <= (((8'ha2) ? reg49 : reg40) ~^ reg54);
            end
          reg59 <= $signed($signed((8'hb5)));
          reg60 <= ({$unsigned(((reg47 | reg40) * $unsigned((8'haa)))),
                  wire31} ?
              reg52 : (reg47 ?
                  ((^~$signed(reg53)) ?
                      ((reg58 ? wire42 : reg50) ?
                          $signed(reg56) : (8'ha9)) : $signed((wire35 ?
                          (8'ha4) : wire46))) : wire32));
        end
      if ((+$unsigned(reg40[(4'hb):(4'h9)])))
        begin
          reg63 <= reg59[(5'h13):(5'h12)];
          if ((($unsigned((~$signed(reg58))) < $signed((|$unsigned((8'hbe))))) ?
              ({{wire33}} >> $unsigned(reg55[(1'h0):(1'h0)])) : $signed($signed(reg61))))
            begin
              reg64 <= {(~|{(|wire43[(1'h1):(1'h1)])})};
              reg65 <= reg47;
              reg66 <= $unsigned(reg49[(3'h5):(1'h0)]);
              reg67 <= ($unsigned(reg55[(2'h2):(1'h1)]) + ($unsigned($signed(wire33)) + $signed(($unsigned(reg61) ?
                  $signed(reg65) : $unsigned(reg39)))));
            end
          else
            begin
              reg64 <= $unsigned((~|reg40));
              reg65 <= ($signed((+wire31[(4'h9):(1'h1)])) ? reg60 : wire36);
              reg66 <= $unsigned($unsigned(((reg38 & (~|(8'hb3))) ?
                  (reg54[(5'h10):(2'h3)] + ((8'hac) ?
                      reg40 : wire41)) : reg54[(4'ha):(3'h5)])));
              reg67 <= (wire32 - $unsigned({(reg64 ?
                      $unsigned(reg39) : (reg40 | wire44))}));
            end
          reg68 <= (($signed((&(~|wire41))) << $unsigned(($unsigned(reg53) ?
                  ((8'ha3) ^ reg48) : $unsigned(reg59)))) ?
              $unsigned($unsigned((&$signed(reg52)))) : ({{$unsigned(reg61),
                      $unsigned(reg50)}} + (^(reg57[(3'h4):(3'h4)] ?
                  ((8'hb6) != reg40) : wire37))));
        end
      else
        begin
          reg63 <= reg61;
          if (($unsigned((8'hb2)) ~^ (reg50[(5'h10):(3'h5)] ~^ reg67[(1'h1):(1'h0)])))
            begin
              reg64 <= (($unsigned((~|(reg59 == reg51))) ?
                      $unsigned(($unsigned(wire35) && {reg60,
                          wire46})) : (7'h40)) ?
                  $unsigned(((reg62 && $unsigned(reg49)) <<< (&((8'hac) ?
                      reg39 : (8'ha0))))) : ((~&(~(reg48 - reg38))) ?
                      $unsigned((^~(wire44 ?
                          wire46 : reg58))) : ((reg58[(1'h1):(1'h0)] ?
                          ((8'ha9) >> wire44) : (wire45 ?
                              reg40 : reg50)) && reg52[(3'h4):(1'h0)])));
              reg65 <= (($unsigned((^(7'h44))) <= ($signed(wire45[(3'h6):(2'h2)]) ?
                  (reg56 ? $signed(reg51) : (~^reg50)) : ($unsigned(wire35) ?
                      wire34 : reg68[(4'h8):(1'h1)]))) ^ reg48[(1'h1):(1'h0)]);
              reg66 <= (8'ha7);
              reg67 <= reg65[(1'h0):(1'h0)];
              reg68 <= $signed(reg60[(2'h2):(2'h2)]);
            end
          else
            begin
              reg64 <= (wire46 && (wire31 ^ $signed($unsigned((^(8'hab))))));
              reg65 <= reg49[(4'hb):(3'h4)];
              reg66 <= (8'hbc);
            end
          reg69 <= $signed(reg67[(1'h1):(1'h0)]);
          reg70 <= (8'hbb);
          reg71 <= $unsigned({reg68});
        end
      reg72 <= (~|(^~((~^$signed(wire43)) <= ((reg48 ?
          reg40 : reg65) && $signed(wire44)))));
      reg73 <= (&$unsigned({$unsigned((~&reg65))}));
    end
  assign wire74 = ((reg57 - $unsigned(reg55)) - ($signed(reg49) ?
                      ((~|(wire34 ^ wire34)) >>> reg56[(3'h5):(2'h2)]) : {$signed($unsigned((8'hb2))),
                          ((reg56 ~^ (8'hbb)) ? (|(8'ha5)) : reg55)}));
  assign wire75 = (wire32 ?
                      wire43[(3'h7):(2'h3)] : (reg54[(2'h3):(2'h2)] >>> ((8'hb8) ?
                          (8'ha9) : (&wire30[(4'he):(2'h3)]))));
  assign wire76 = wire43[(2'h3):(1'h1)];
  assign wire77 = {$signed($signed(wire33)),
                      $signed($unsigned((+$signed((8'h9c)))))};
  assign wire78 = ($unsigned($unsigned((+reg66[(2'h3):(2'h2)]))) ?
                      reg50 : $unsigned(($unsigned((wire45 | wire44)) ?
                          (7'h41) : wire35)));
  assign wire79 = ($unsigned(($unsigned((wire45 ?
                      wire74 : reg73)) >> wire31)) ^~ $signed({(-reg60),
                      (wire30 ? $signed(wire44) : reg71[(1'h1):(1'h1)])}));
  assign wire80 = (wire31 | wire76[(1'h0):(1'h0)]);
  assign wire81 = (~$unsigned($signed((wire45 < wire42))));
endmodule

module module11
#(parameter param22 = (~^(~&(((!(8'ha3)) ? ((8'haa) ^~ (8'haa)) : (!(8'had))) ? ({(8'ha2)} ? ((8'hbb) <= (8'h9c)) : ((8'h9d) + (8'ha9))) : ((^~(8'hb5)) ? (+(8'ha9)) : ((8'hb9) ? (8'ha5) : (8'hb7)))))), 
parameter param23 = ({(((param22 ? (8'h9f) : (8'hab)) ? (param22 ? param22 : param22) : (param22 || (7'h40))) ? (((8'hb7) ? param22 : param22) ? (param22 ~^ param22) : (8'had)) : ((param22 ^ param22) ? param22 : (param22 && param22)))} ? (param22 ? (((param22 - (8'hba)) ? param22 : {param22, (7'h41)}) | (8'hb3)) : {((-param22) || (8'ha4))}) : ((((~param22) >>> (^param22)) <= ({param22} > (param22 * param22))) ~^ ({param22} <<< (^~param22)))))
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h38):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  assign y = {wire21, wire20, wire19, wire18, wire17, (1'h0)};
  assign wire17 = (wire12 ?
                      $signed((-$unsigned((wire13 ?
                          wire14 : wire12)))) : wire16[(1'h0):(1'h0)]);
  assign wire18 = {$unsigned($signed(((wire16 <<< wire17) * (wire14 ^~ wire13)))),
                      {wire16[(2'h2):(2'h2)]}};
  assign wire19 = $signed($unsigned($unsigned(((8'hb8) ?
                      (&wire13) : (wire14 ? wire16 : wire15)))));
  assign wire20 = $signed($signed($signed({wire13[(1'h1):(1'h1)],
                      $unsigned(wire19)})));
  assign wire21 = wire19[(4'h8):(1'h1)];
endmodule

module module140
#(parameter param169 = {((((^(8'hbb)) ? (~&(7'h44)) : ((8'ha8) < (8'hb6))) || (|{(8'ha7)})) ? (~|(+(^~(8'hbd)))) : (((8'hb1) ? ((8'ha0) ? (8'had) : (8'h9f)) : (&(8'hbd))) >>> ({(8'hb6), (8'hba)} ? ((8'hac) ? (8'hbf) : (8'ha5)) : (8'hb7))))}, 
parameter param170 = ((-(+(8'h9f))) * param169))
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h10c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire145;
  input wire [(2'h3):(1'h0)] wire144;
  input wire signed [(4'ha):(1'h0)] wire143;
  input wire [(4'he):(1'h0)] wire142;
  input wire signed [(4'h8):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire166;
  wire signed [(4'h9):(1'h0)] wire165;
  wire [(4'hb):(1'h0)] wire164;
  wire [(5'h13):(1'h0)] wire163;
  wire [(3'h4):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire161;
  wire [(5'h10):(1'h0)] wire160;
  wire signed [(4'hc):(1'h0)] wire159;
  wire signed [(5'h14):(1'h0)] wire158;
  wire signed [(5'h11):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire156;
  wire [(3'h6):(1'h0)] wire155;
  wire [(4'he):(1'h0)] wire154;
  wire [(3'h5):(1'h0)] wire153;
  wire [(4'h8):(1'h0)] wire146;
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg167 = (1'h0);
  reg [(4'h9):(1'h0)] reg152 = (1'h0);
  reg [(4'h9):(1'h0)] reg151 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg150 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg147 = (1'h0);
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire146,
                 reg168,
                 reg167,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire146 = ($signed($unsigned({wire144})) ^~ ($unsigned($unsigned({wire141})) >= $signed(wire144)));
  always
    @(posedge clk) begin
      if (($signed((((8'ha4) == (wire143 ?
          wire146 : wire142)) != $unsigned((+wire143)))) >>> (wire144 ?
          wire145[(2'h3):(1'h1)] : ((wire144 ~^ (wire142 ? wire142 : wire141)) ?
              ((wire141 << wire144) ?
                  (+(8'had)) : ((8'hb6) ?
                      (8'hb5) : wire142)) : ((+wire141) && wire141)))))
        begin
          reg147 <= $signed(($unsigned(wire145[(3'h4):(2'h3)]) ?
              $signed(wire141) : wire143));
        end
      else
        begin
          if ((~|$unsigned((~{(~wire143)}))))
            begin
              reg147 <= $unsigned((($signed(wire143[(3'h5):(2'h3)]) ?
                      {wire145[(3'h5):(3'h5)],
                          {wire143, wire145}} : {wire146[(3'h7):(1'h1)],
                          wire142}) ?
                  ((~^(reg147 != wire145)) >>> wire146[(3'h4):(1'h0)]) : (|((!wire145) <<< reg147))));
              reg148 <= $unsigned(((|wire143[(4'ha):(2'h2)]) ?
                  (((~wire141) ?
                      (|(8'hb3)) : wire143[(4'h9):(3'h6)]) <= {$signed(wire144)}) : {((~|wire143) ?
                          (+wire143) : (wire144 ? wire141 : (8'ha9)))}));
            end
          else
            begin
              reg147 <= ($unsigned($unsigned(reg147[(3'h5):(3'h5)])) ?
                  ((wire142 ?
                          $unsigned((wire146 << reg148)) : (&$unsigned(reg147))) ?
                      (((~reg147) <<< (~^wire143)) ?
                          $unsigned({reg148,
                              wire145}) : $unsigned((&reg147))) : reg148[(4'hb):(3'h4)]) : reg147[(1'h0):(1'h0)]);
              reg148 <= $signed((&wire141[(3'h5):(1'h0)]));
            end
          reg149 <= $unsigned(wire146);
          reg150 <= ((!wire141) ?
              wire142[(4'he):(4'h8)] : ($unsigned(wire143) & {$unsigned((wire142 ^~ wire143))}));
          reg151 <= ((^~(7'h41)) ?
              ($unsigned((((8'hb0) <= (8'hbc)) ^ $signed(reg149))) + wire146) : $signed((~^$signed(((8'ha9) >= wire145)))));
        end
      reg152 <= $signed(wire141[(3'h7):(1'h0)]);
    end
  assign wire153 = {$unsigned((!(wire146 ?
                           wire142[(4'h9):(3'h7)] : reg148[(3'h5):(2'h3)]))),
                       $signed($unsigned((|reg147[(3'h4):(3'h4)])))};
  assign wire154 = ((wire143 ?
                       wire141[(1'h1):(1'h0)] : $unsigned(reg152)) << $unsigned($unsigned($unsigned($signed(reg147)))));
  assign wire155 = reg149;
  assign wire156 = reg147;
  assign wire157 = ($signed(wire146) < wire156[(1'h0):(1'h0)]);
  assign wire158 = {$unsigned($signed(reg152[(3'h7):(3'h6)])),
                       $unsigned((wire155 ?
                           $unsigned($signed(reg147)) : ($signed((8'ha7)) - (-wire157))))};
  assign wire159 = ($unsigned(((-reg149[(3'h6):(1'h0)]) ?
                           $unsigned((^~wire144)) : (!wire146[(2'h3):(2'h2)]))) ?
                       wire143[(2'h3):(1'h1)] : {$signed($signed($unsigned(reg147)))});
  assign wire160 = (!wire145);
  assign wire161 = wire158;
  assign wire162 = (8'hac);
  assign wire163 = (8'hbb);
  assign wire164 = $unsigned(({wire157[(3'h4):(2'h2)]} ?
                       wire141 : wire143[(3'h7):(3'h7)]));
  assign wire165 = (~&(((wire157[(4'he):(1'h1)] ? wire164 : reg150) ?
                       {reg150[(3'h4):(1'h1)]} : ((^wire156) ?
                           wire154 : reg149[(3'h5):(2'h2)])) > wire163));
  assign wire166 = wire143[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg167 <= wire164;
      reg168 <= wire160;
    end
endmodule
