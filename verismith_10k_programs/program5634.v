module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h134):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire174;
  wire signed [(5'h14):(1'h0)] wire173;
  wire [(2'h3):(1'h0)] wire172;
  wire [(4'hb):(1'h0)] wire171;
  wire signed [(5'h15):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire157;
  wire signed [(3'h5):(1'h0)] wire156;
  wire signed [(2'h2):(1'h0)] wire155;
  wire signed [(5'h13):(1'h0)] wire154;
  wire signed [(3'h6):(1'h0)] wire151;
  wire [(2'h3):(1'h0)] wire150;
  wire signed [(3'h5):(1'h0)] wire149;
  wire [(2'h2):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire147;
  wire [(5'h14):(1'h0)] wire145;
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg169 = (1'h0);
  reg [(4'h8):(1'h0)] reg168 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  assign y = {wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire161,
                 wire160,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg159,
                 reg158,
                 reg153,
                 reg152,
                 (1'h0)};
  module5 #() modinst146 (wire145, clk, wire2, wire3, wire0, wire4, wire1);
  assign wire147 = (!($signed($unsigned((~^wire4))) ?
                       ($signed(wire0[(1'h1):(1'h0)]) ?
                           (8'hb7) : $signed((wire145 == (8'ha1)))) : (~&wire145)));
  assign wire148 = (~&wire145);
  assign wire149 = $unsigned($signed($signed((8'hb0))));
  assign wire150 = wire149;
  assign wire151 = $unsigned((wire150[(1'h1):(1'h0)] | wire149[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg152 <= ((($unsigned((|wire148)) & $signed($signed(wire1))) ?
              $unsigned($unsigned($signed((8'ha2)))) : (8'hb7)) ?
          (wire149 ^ wire148) : (wire145 ?
              (^(8'h9e)) : ($signed((^wire147)) ^~ $signed(wire151[(3'h4):(2'h3)]))));
      reg153 <= ((-(wire3[(1'h1):(1'h0)] ~^ $signed($signed(wire1)))) ?
          $unsigned(wire147[(2'h3):(2'h2)]) : (($signed(wire0[(2'h2):(1'h0)]) ?
                  wire147[(4'h9):(3'h4)] : (~&$unsigned(wire147))) ?
              ($unsigned((^~wire0)) ?
                  (|$signed(wire148)) : $unsigned((wire151 == wire150))) : (^~((reg152 + wire0) - reg152[(3'h5):(3'h4)]))));
    end
  assign wire154 = (reg153 + ((|{wire2, (+(8'hbc))}) ^ (((wire3 >>> wire2) ?
                           wire2[(3'h4):(1'h0)] : reg152) ?
                       $signed(((8'hb8) + wire4)) : $unsigned(wire3[(2'h3):(1'h0)]))));
  assign wire155 = (wire0 | ($unsigned($signed((~&(8'ha4)))) ?
                       $unsigned((|wire145)) : $signed($unsigned({wire148}))));
  assign wire156 = ({wire145} ? (8'hb8) : (^reg153[(1'h0):(1'h0)]));
  assign wire157 = wire148[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg158 <= $signed($unsigned(({wire156} == wire149)));
      reg159 <= $unsigned($signed(({(!wire148)} == {(wire145 ? wire157 : wire3),
          (~|(7'h40))})));
    end
  assign wire160 = (~^(~|({$signed(wire150), ((8'hb4) >>> (8'hb6))} ?
                       (~^wire145[(5'h14):(2'h3)]) : (wire151 ?
                           $unsigned(wire155) : (wire156 ^~ wire151)))));
  assign wire161 = ((wire151[(3'h4):(1'h1)] - wire3[(3'h7):(3'h7)]) ?
                       (~^(^$unsigned((8'haf)))) : (8'hbe));
  always
    @(posedge clk) begin
      reg162 <= wire155[(2'h2):(1'h1)];
      if (($unsigned($unsigned($signed(((8'ha3) == wire1)))) ?
          (wire155[(1'h0):(1'h0)] ?
              $signed(($unsigned((8'hb4)) >>> wire157)) : reg158[(2'h3):(2'h2)]) : ((!(^~(wire151 ?
              (8'h9e) : wire2))) != (|$signed($unsigned(wire149))))))
        begin
          reg163 <= $unsigned($unsigned((8'h9d)));
          if (wire0)
            begin
              reg164 <= (wire147[(1'h0):(1'h0)] <<< $unsigned(wire157));
              reg165 <= (wire157 * ((($signed((8'hb4)) >>> $unsigned((8'ha3))) || (wire0 ?
                  (reg153 <= wire3) : $signed(wire0))) ^ {($unsigned(wire0) ?
                      ((7'h40) || wire149) : wire148),
                  ($unsigned(reg163) >>> wire1)}));
              reg166 <= (reg165 >= $unsigned($unsigned(reg152)));
              reg167 <= wire3[(5'h12):(4'hd)];
            end
          else
            begin
              reg164 <= (8'h9d);
              reg165 <= ($unsigned({wire154[(1'h1):(1'h1)],
                      wire155[(2'h2):(1'h1)]}) ?
                  wire2[(5'h15):(2'h3)] : (wire149 ?
                      $signed(((+reg166) ?
                          (reg164 ?
                              reg158 : reg159) : (reg167 | wire149))) : ((+$unsigned(wire149)) ?
                          {(wire155 ? wire145 : reg164)} : (8'ha8))));
              reg166 <= wire155[(1'h1):(1'h1)];
            end
        end
      else
        begin
          if ($signed(wire154))
            begin
              reg163 <= {(~^wire0),
                  $unsigned(((reg153[(4'hb):(4'hb)] ~^ reg159) ^~ $signed((wire151 + wire155))))};
            end
          else
            begin
              reg163 <= (^~wire155);
            end
        end
      reg168 <= wire147[(3'h4):(3'h4)];
      reg169 <= $signed(($signed((&{wire3, wire4})) - (({wire155, (8'hb2)} ?
              (wire148 ? wire148 : wire148) : reg166[(4'hb):(1'h1)]) ?
          wire150 : $signed(reg166))));
      reg170 <= wire156;
    end
  assign wire171 = {(~^(~reg170)), (^(~(~^$unsigned(wire157))))};
  assign wire172 = {$signed(reg165)};
  assign wire173 = $unsigned({reg165});
  assign wire174 = reg162[(4'h8):(1'h0)];
endmodule

module module5
#(parameter param143 = (-(~&((((8'hba) == (8'h9e)) ? ((8'ha6) ? (8'haa) : (8'hac)) : ((7'h43) * (8'ha4))) ? (8'ha7) : (~^{(8'h9f)})))), 
parameter param144 = ((8'hab) >= param143))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire123;
  wire signed [(5'h12):(1'h0)] wire141;
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg11 = (1'h0);
  assign y = {wire72,
                 wire74,
                 wire75,
                 wire76,
                 wire123,
                 wire141,
                 reg126,
                 reg125,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= $signed(($unsigned(((8'ha5) ^ $signed((8'hae)))) ^ wire7));
    end
  module12 #() modinst73 (.clk(clk), .wire14(reg11), .wire13(wire9), .wire16(wire6), .wire15(wire7), .y(wire72));
  assign wire74 = $unsigned((8'ha3));
  assign wire75 = wire74;
  assign wire76 = (&((^~$unsigned((wire8 ?
                      (8'ha3) : wire7))) >> (({(8'hbf)} != (8'ha7)) ?
                      (~^(wire9 >>> (8'had))) : (wire75 ?
                          (wire74 == reg11) : wire75[(4'hb):(4'h8)]))));
  module77 #() modinst124 (wire123, clk, reg11, wire72, wire9, wire76, wire8);
  always
    @(posedge clk) begin
      reg125 <= $signed(wire10[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg126 <= $unsigned((~^{(^~{wire75})}));
    end
  module127 #() modinst142 (wire141, clk, wire7, wire123, reg125, reg11, wire6);
endmodule

module module127  (y, clk, wire132, wire131, wire130, wire129, wire128);
  output wire [(32'h70):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire132;
  input wire [(2'h2):(1'h0)] wire131;
  input wire signed [(3'h7):(1'h0)] wire130;
  input wire [(2'h2):(1'h0)] wire129;
  input wire [(5'h12):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire139;
  wire [(2'h3):(1'h0)] wire138;
  wire [(4'ha):(1'h0)] wire137;
  wire signed [(5'h15):(1'h0)] wire136;
  wire signed [(4'hf):(1'h0)] wire135;
  wire signed [(4'hb):(1'h0)] wire134;
  wire [(5'h12):(1'h0)] wire133;
  reg [(4'hf):(1'h0)] reg140 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 reg140,
                 (1'h0)};
  assign wire133 = $unsigned(wire128);
  assign wire134 = ((wire128[(3'h4):(3'h4)] << $unsigned({wire131[(2'h2):(2'h2)],
                           wire131[(1'h1):(1'h1)]})) ?
                       {({(wire128 ?
                                   wire130 : (8'hb2))} | $unsigned($signed(wire128))),
                           $unsigned($unsigned((^~wire128)))} : (^$signed((~&$signed(wire133)))));
  assign wire135 = $unsigned(wire134);
  assign wire136 = $signed((~^(($unsigned(wire128) ?
                           (wire132 | wire130) : $unsigned(wire134)) ?
                       wire132 : $signed((wire130 == wire133)))));
  assign wire137 = wire132;
  assign wire138 = $unsigned($unsigned((wire135[(4'ha):(1'h1)] ?
                       {(wire135 ? (8'ha6) : wire129),
                           $unsigned(wire136)} : {(wire132 << wire136),
                           $signed(wire136)})));
  assign wire139 = (($unsigned($unsigned($unsigned(wire130))) ^ ((8'ha3) < wire131[(1'h0):(1'h0)])) ?
                       (^wire133) : (~wire129[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg140 <= (({$unsigned(wire131[(1'h1):(1'h1)]),
          wire133[(1'h1):(1'h1)]} == ((8'hbd) <= ($unsigned((8'hba)) > wire137[(1'h1):(1'h0)]))) >> $signed({(~(wire129 >>> wire128)),
          wire136[(5'h10):(3'h6)]}));
    end
endmodule

module module77
#(parameter param122 = ((((((8'hbe) ? (8'hbe) : (7'h42)) ? (|(8'ha9)) : ((8'ha0) ? (8'ha6) : (7'h42))) << (&(^~(8'ha8)))) * ({((8'hb4) & (8'hbd))} ? (((7'h41) >> (8'h9e)) ? ((8'hb0) ? (8'haa) : (8'hbe)) : {(8'hb3), (8'hab)}) : ((^~(8'h9f)) ? (~(7'h40)) : ((8'ha7) >= (8'hbc))))) ~^ (~&((((8'hb1) ? (8'ha9) : (7'h42)) == ((8'haf) ? (8'hbc) : (8'h9d))) ? {((8'ha5) ? (8'hac) : (8'hb5)), ((8'hba) ? (8'hb6) : (8'ha8))} : (~|((8'hbd) & (8'ha2)))))))
(y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire82;
  input wire [(2'h2):(1'h0)] wire81;
  input wire [(5'h12):(1'h0)] wire80;
  input wire [(4'hf):(1'h0)] wire79;
  input wire [(3'h4):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire121;
  wire [(2'h3):(1'h0)] wire120;
  wire signed [(5'h15):(1'h0)] wire119;
  wire signed [(5'h15):(1'h0)] wire118;
  wire signed [(4'ha):(1'h0)] wire117;
  wire signed [(4'h8):(1'h0)] wire116;
  wire [(4'hf):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire113;
  wire signed [(3'h5):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire101;
  wire signed [(2'h3):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  wire signed [(4'h9):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire83;
  reg [(4'ha):(1'h0)] reg112 = (1'h0);
  reg [(5'h11):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg105 = (1'h0);
  reg [(3'h6):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(3'h4):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire102,
                 wire101,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire84,
                 wire83,
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
                 reg100,
                 reg99,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire83 = $unsigned(((~|(~&(wire82 ?
                      wire79 : wire79))) > {$signed($signed(wire82)),
                      ((wire81 <<< wire78) * (wire82 - wire82))}));
  assign wire84 = (wire79 ?
                      $signed(($signed((wire82 - wire83)) <= {wire83,
                          wire82})) : (wire79[(1'h0):(1'h0)] ?
                          {{(wire80 + (8'hb9)),
                                  (wire82 >> wire81)}} : $signed((~^wire79))));
  always
    @(posedge clk) begin
      if ((|$unsigned((($unsigned(wire79) <<< {wire84}) ?
          $signed($signed(wire79)) : wire80))))
        begin
          reg85 <= ($signed($unsigned($signed({wire82,
              wire78}))) ^~ $signed((wire81[(2'h2):(1'h1)] ?
              ({wire83, wire82} ? (~wire78) : {wire78}) : {wire82, wire78})));
          reg86 <= (wire81 ?
              wire79[(4'he):(2'h2)] : $unsigned((((|wire83) ?
                      $signed(wire80) : (wire81 ? (8'hb5) : reg85)) ?
                  $unsigned((~wire83)) : (&(+wire81)))));
          reg87 <= $unsigned($unsigned(wire78[(1'h1):(1'h1)]));
        end
      else
        begin
          reg85 <= (8'hb1);
          reg86 <= wire84[(1'h0):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      if (wire84)
        begin
          reg88 <= $signed((^wire83[(4'h9):(3'h4)]));
        end
      else
        begin
          reg88 <= reg88;
        end
      reg89 <= ($signed($signed(reg86)) + $signed(((~^(^reg87)) ?
          $signed((+reg87)) : wire83)));
      reg90 <= $unsigned($signed({{(~|(8'ha1)), {wire84, reg86}},
          wire79[(4'hf):(4'ha)]}));
      reg91 <= (($signed(({reg90, reg88} >> (wire78 ?
          (8'hb2) : reg90))) & reg89[(3'h7):(3'h5)]) + $unsigned($signed((-wire83[(4'h8):(2'h2)]))));
      reg92 <= reg89;
    end
  assign wire93 = (reg89 ?
                      $signed($unsigned($unsigned(((8'hb9) ?
                          reg86 : wire82)))) : $unsigned(reg92[(4'h8):(2'h2)]));
  assign wire94 = (reg92[(3'h4):(2'h3)] ?
                      reg86[(1'h1):(1'h1)] : {reg90,
                          ($unsigned((reg86 <= (8'ha2))) ^ {(~reg89),
                              $signed(wire83)})});
  assign wire95 = (wire80[(2'h3):(2'h3)] ^~ $signed(reg92));
  assign wire96 = {{($signed(wire81[(1'h0):(1'h0)]) <<< wire78)}};
  assign wire97 = wire82[(3'h4):(2'h2)];
  assign wire98 = ((~&wire95[(2'h2):(2'h2)]) ?
                      {(wire79[(3'h6):(3'h5)] ?
                              (+$unsigned(wire96)) : $signed(((8'ha7) << wire95)))} : reg85[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg99 <= (~|$unsigned((($unsigned(wire83) ? (reg87 >> reg87) : wire81) ?
          (&wire97) : $unsigned(reg87[(1'h0):(1'h0)]))));
      reg100 <= $unsigned((+$unsigned({(reg91 ? wire94 : reg86), (^wire93)})));
    end
  assign wire101 = (8'hb1);
  assign wire102 = $unsigned(((&(!$signed(reg88))) ?
                       wire93 : {$unsigned({wire79}),
                           ((reg91 ? (8'hb7) : wire96) + (wire96 >= wire93))}));
  always
    @(posedge clk) begin
      reg103 <= ($signed($signed((wire93 ?
          (^~wire83) : $unsigned(wire78)))) + reg88[(1'h0):(1'h0)]);
      reg104 <= ($unsigned($signed($signed($unsigned(wire93)))) ?
          (8'h9e) : $unsigned(wire101));
      reg105 <= ($signed($unsigned(reg99)) ? wire82 : wire98[(1'h0):(1'h0)]);
      if ((reg104[(3'h5):(3'h5)] ?
          {(~|{reg105[(3'h6):(3'h6)], (^(8'hb4))})} : wire101))
        begin
          reg106 <= (reg88[(2'h3):(2'h3)] >> (reg87[(3'h6):(1'h1)] <<< wire97[(5'h14):(4'hb)]));
        end
      else
        begin
          reg106 <= wire83[(4'hb):(3'h4)];
          if ((!$unsigned(wire78[(3'h4):(3'h4)])))
            begin
              reg107 <= (^~(^~$unsigned(wire97)));
              reg108 <= $signed($signed(reg100[(2'h2):(1'h0)]));
            end
          else
            begin
              reg107 <= ((~^reg85[(1'h0):(1'h0)]) ?
                  ({$signed(wire93[(2'h3):(2'h3)])} != $signed($signed($signed(reg85)))) : {reg99,
                      ((~^{reg87, wire97}) ?
                          (+$unsigned(reg87)) : (wire94 ?
                              (8'hb9) : (wire98 ? wire97 : wire94)))});
              reg108 <= reg89[(4'h9):(4'h8)];
            end
          reg109 <= $unsigned((8'hb1));
          reg110 <= {((((8'hb5) ? $unsigned(wire98) : (^~(8'hb1))) ?
                  reg86 : $unsigned($signed(wire93))) ^ ((wire84 + reg89[(4'he):(1'h1)]) == $signed(wire96)))};
          reg111 <= $unsigned($signed({{(wire84 || (8'haf)),
                  (wire96 ^~ wire78)}}));
        end
      reg112 <= wire93;
    end
  assign wire113 = wire96[(4'hf):(4'ha)];
  assign wire114 = wire83[(4'hd):(2'h3)];
  assign wire115 = $signed({$signed(wire101[(1'h0):(1'h0)])});
  assign wire116 = (~&reg107);
  assign wire117 = (reg103 << reg92[(3'h4):(2'h2)]);
  assign wire118 = $unsigned($signed(reg90[(4'h8):(1'h0)]));
  assign wire119 = ((($signed($signed(wire84)) ?
                           $unsigned((~^reg86)) : $signed($unsigned(wire79))) == $signed((((8'hb0) << reg90) > $unsigned(reg104)))) ?
                       {$signed($signed((^~reg91)))} : reg91);
  assign wire120 = ({wire96} != ((wire94[(1'h1):(1'h0)] <<< (wire95[(1'h0):(1'h0)] ?
                       (~^reg104) : $unsigned(wire93))) * reg99[(2'h2):(1'h0)]));
  assign wire121 = $signed(wire115[(4'hd):(2'h3)]);
endmodule

module module12
#(parameter param70 = (((((+(8'hb3)) >= {(8'hab), (8'hb2)}) < (^(~&(8'ha1)))) ? ((8'ha9) ? ((|(8'hba)) ^~ ((8'hb3) ^ (8'had))) : ((~(8'haf)) ? ((7'h43) >= (8'hb3)) : ((8'had) <<< (8'hb3)))) : (~((&(7'h41)) ? ((8'hb6) ? (8'ha1) : (8'haa)) : (~(8'ha0))))) <<< (&((((7'h40) << (8'hbc)) ? ((8'ha9) || (8'ha0)) : ((8'hbc) ? (8'hae) : (8'haf))) ? {((8'haf) ? (8'hac) : (8'hbb))} : ((+(8'h9f)) ? ((8'hb2) >= (8'hb8)) : ((8'h9e) ? (8'ha9) : (8'ha6)))))), 
parameter param71 = (8'ha5))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(4'h9):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  wire signed [(3'h6):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(3'h5):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire21;
  wire signed [(4'h8):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  reg [(2'h3):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  assign y = {wire69,
                 wire52,
                 wire51,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
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
                 (1'h0)};
  assign wire17 = (({$signed((~^wire16))} && (~|wire15[(1'h1):(1'h1)])) == ((wire13[(1'h0):(1'h0)] ?
                          (!$unsigned(wire15)) : wire13) ?
                      (($unsigned((7'h44)) ?
                          $signed(wire15) : (wire15 ?
                              wire14 : wire13)) > ({wire14,
                          (8'haa)} == $signed(wire16))) : $signed(wire16[(4'ha):(2'h2)])));
  assign wire18 = $signed((8'ha6));
  assign wire19 = (|$unsigned($signed(((wire13 ? wire13 : wire15) ?
                      (wire18 + wire14) : wire15[(1'h1):(1'h1)]))));
  assign wire20 = wire17[(3'h6):(2'h3)];
  assign wire21 = (~&wire18);
  assign wire22 = $signed(((+(-wire21[(3'h4):(2'h2)])) ?
                      {$unsigned(wire13[(4'hf):(1'h0)])} : wire13[(1'h0):(1'h0)]));
  assign wire23 = wire19[(1'h1):(1'h0)];
  assign wire24 = wire20[(3'h6):(3'h4)];
  assign wire25 = (^(+(wire18 ^ wire15[(1'h0):(1'h0)])));
  assign wire26 = (((!wire23) ?
                      wire15 : (+$signed(((8'hbf) && (8'haf))))) ^ (~$unsigned({(wire18 ^~ wire17),
                      (~wire13)})));
  assign wire27 = $unsigned((^wire16[(2'h3):(2'h3)]));
  assign wire28 = ($signed((^$unsigned({wire24, wire13}))) ? wire23 : wire16);
  assign wire29 = (^~(($signed($unsigned(wire22)) ?
                      ({wire15, wire22} ?
                          $signed(wire28) : ((8'hbb) ?
                              wire17 : wire19)) : {wire22[(1'h1):(1'h0)]}) >> (($signed(wire21) ?
                      $signed(wire27) : (~|wire26)) ~^ wire13)));
  assign wire30 = $signed(({$unsigned((wire17 << wire15))} ?
                      (wire16[(1'h0):(1'h0)] ?
                          (~|{wire20}) : (~^$unsigned(wire16))) : (!$unsigned(wire26[(3'h5):(1'h0)]))));
  assign wire31 = ($signed(wire19) ?
                      {{$signed((wire28 << (7'h43))),
                              {$unsigned(wire21),
                                  ((8'h9c) ^ wire20)}}} : (-(+($unsigned(wire20) ?
                          (wire29 > wire30) : (wire28 ? wire24 : wire15)))));
  assign wire32 = {{((~|$unsigned(wire21)) ? wire16 : $signed((&wire25))),
                          ((~|wire20) || $unsigned(wire28[(1'h1):(1'h0)]))}};
  assign wire33 = (({$signed({wire21, wire17}),
                      ((7'h40) + (wire17 ?
                          wire28 : wire20))} >>> wire20) >= $signed(($unsigned((+wire13)) ~^ wire25)));
  always
    @(posedge clk) begin
      if (wire23[(2'h3):(2'h3)])
        begin
          reg34 <= $signed((wire21 ^ (wire27 ?
              ($signed(wire24) ?
                  (wire30 >> (8'hb1)) : (wire33 ? wire16 : wire15)) : ((wire29 ?
                      wire28 : wire30) ?
                  (wire26 ? wire31 : wire28) : wire16))));
          reg35 <= ($signed(reg34[(1'h1):(1'h1)]) ?
              wire27[(1'h1):(1'h1)] : {{(((7'h40) ? wire25 : wire24) ?
                          wire29[(1'h0):(1'h0)] : (wire14 ?
                              wire25 : wire17))}});
          reg36 <= $signed({wire15});
          reg37 <= wire33;
        end
      else
        begin
          reg34 <= (&wire25);
          reg35 <= ((((~|(-wire14)) ?
              $unsigned($signed(wire21)) : $unsigned(((8'h9d) ?
                  wire28 : wire14))) - {(wire31[(1'h0):(1'h0)] ?
                  wire15[(1'h0):(1'h0)] : (wire14 >> wire30))}) ^~ (wire29[(2'h3):(1'h1)] ^~ $unsigned(wire20[(3'h7):(1'h1)])));
          if (((8'ha7) + (|$unsigned(((wire33 ^ wire28) ?
              (reg34 ? wire30 : wire15) : {(8'hab), reg34})))))
            begin
              reg36 <= $unsigned({$signed(wire28[(3'h7):(3'h5)])});
              reg37 <= (wire23[(3'h7):(2'h3)] & (|$unsigned(wire32)));
              reg38 <= ($signed($signed(wire33[(2'h2):(1'h0)])) <= reg35[(2'h3):(2'h3)]);
            end
          else
            begin
              reg36 <= $signed(reg36);
            end
          reg39 <= ((|($signed(wire30) == reg38[(3'h4):(3'h4)])) ?
              wire16 : (~(|(!{wire13}))));
          reg40 <= ((wire17 ?
                  (|$unsigned($unsigned(wire22))) : $signed(((wire14 << wire14) ^~ wire33[(1'h1):(1'h1)]))) ?
              ($unsigned((!wire24)) ?
                  wire15[(3'h4):(2'h3)] : (8'ha8)) : $unsigned($signed(wire25[(3'h5):(1'h1)])));
        end
      if ($signed($unsigned(($unsigned(reg40[(3'h7):(2'h3)]) ?
          wire25[(3'h4):(1'h1)] : ((~|wire31) ?
              $unsigned(wire25) : (~^(8'hbc)))))))
        begin
          reg41 <= $unsigned((+wire25));
        end
      else
        begin
          if (reg37[(4'ha):(4'h8)])
            begin
              reg41 <= ($signed($signed($unsigned((wire14 ?
                      wire13 : wire14)))) ?
                  $signed($unsigned(($signed(wire19) | wire32[(3'h4):(3'h4)]))) : {$unsigned(wire14)});
              reg42 <= {$unsigned((8'hb4))};
              reg43 <= (~reg37[(4'h8):(3'h7)]);
            end
          else
            begin
              reg41 <= wire23[(2'h2):(1'h0)];
              reg42 <= $signed({(^($signed(wire13) ^ wire19)),
                  ($unsigned((wire13 ?
                      reg37 : wire24)) & $unsigned(wire15[(2'h3):(2'h3)]))});
              reg43 <= $unsigned(((wire13[(1'h1):(1'h0)] & {$signed(wire27),
                      $signed((8'hbc))}) ?
                  $unsigned((!$unsigned(wire29))) : ({(wire17 * wire22),
                      (~&wire29)} <= (wire26[(3'h6):(1'h1)] ?
                      (reg34 ? wire15 : wire25) : wire22))));
              reg44 <= (!(-(($signed(wire33) | $unsigned(wire21)) * wire33[(2'h3):(1'h1)])));
              reg45 <= (+({wire20[(2'h2):(2'h2)],
                  ((+wire28) ?
                      (reg44 ?
                          (8'hb6) : (8'ha8)) : wire16)} ^ reg36[(2'h2):(1'h0)]));
            end
          reg46 <= wire18[(2'h2):(1'h1)];
          reg47 <= $signed(((~&(~^reg44[(1'h1):(1'h1)])) ?
              wire16[(2'h3):(1'h1)] : (reg45[(1'h0):(1'h0)] ?
                  reg46 : (!(wire17 ? wire25 : wire24)))));
          reg48 <= {((reg43 <= wire14[(1'h1):(1'h0)]) ?
                  {$signed((^reg40)),
                      wire33} : $signed((wire22[(2'h3):(2'h3)] != (wire24 ?
                      (8'ha3) : (8'hb4)))))};
          reg49 <= reg41[(2'h2):(1'h0)];
        end
      reg50 <= wire17[(2'h2):(1'h0)];
    end
  assign wire51 = (reg48[(1'h1):(1'h1)] | reg36[(2'h3):(1'h1)]);
  assign wire52 = {$signed(reg49[(2'h2):(2'h2)]),
                      $signed(wire19[(1'h1):(1'h0)])};
  always
    @(posedge clk) begin
      if (reg36)
        begin
          reg53 <= {$unsigned(wire30[(3'h6):(2'h2)]),
              $unsigned($signed({(wire25 + reg40), {reg48, (8'haa)}}))};
          reg54 <= $unsigned(wire27[(2'h2):(2'h2)]);
          reg55 <= $signed(({$signed((~(8'ha4)))} >>> $unsigned($unsigned($unsigned(wire18)))));
          if ($signed((~|wire33)))
            begin
              reg56 <= wire19;
            end
          else
            begin
              reg56 <= $unsigned((^(~&($unsigned(reg45) << wire24[(3'h6):(3'h6)]))));
              reg57 <= ($signed(({(wire20 ? reg39 : reg49), (reg47 > reg50)} ?
                      $signed((-wire51)) : wire22[(3'h5):(1'h0)])) ?
                  $unsigned((({wire18} != (wire24 & wire13)) ?
                      ((|(8'ha9)) ?
                          (reg38 ?
                              reg47 : reg45) : wire25) : $signed($signed(reg47)))) : (~^$signed($signed(((8'ha9) ?
                      wire32 : wire33)))));
              reg58 <= (^{(wire32 ? reg35[(2'h2):(2'h2)] : (8'ha4)),
                  {$unsigned((8'hbb))}});
            end
          reg59 <= wire27;
        end
      else
        begin
          reg53 <= (&((8'hb5) ?
              $signed(reg58[(2'h2):(1'h1)]) : ($signed($unsigned((8'ha0))) >>> (|$signed(reg36)))));
        end
      reg60 <= ((^~$signed((~((8'hbf) >> wire51)))) ^~ $signed((|wire14)));
      reg61 <= wire51;
      if (reg61)
        begin
          reg62 <= wire21[(1'h1):(1'h0)];
          if (reg35)
            begin
              reg63 <= (!wire14);
              reg64 <= $signed(wire28[(4'hd):(4'h9)]);
              reg65 <= (reg45[(2'h2):(1'h0)] ?
                  reg44 : (reg64 | ((reg54[(3'h7):(3'h6)] || {reg48,
                      reg44}) < (8'hb5))));
              reg66 <= (|{$signed(((reg50 ?
                      wire18 : wire31) + $signed(wire32))),
                  $signed(($signed(wire17) <= (8'hbf)))});
              reg67 <= (-$signed(((^wire19[(1'h1):(1'h1)]) ?
                  ((&wire32) ?
                      ((8'ha4) ~^ reg34) : (reg56 ? wire15 : reg42)) : reg38)));
            end
          else
            begin
              reg63 <= (~&wire22[(3'h4):(2'h3)]);
            end
          reg68 <= ((($signed((wire30 ? wire25 : reg59)) == reg59) ?
              reg48 : (wire16[(3'h5):(2'h3)] <= (reg60[(4'h9):(3'h5)] << (reg63 <<< reg54)))) ~^ ($unsigned((+reg45)) ?
              (reg67 >= reg50[(2'h2):(1'h0)]) : reg49));
        end
      else
        begin
          reg62 <= (({(8'hbb)} | $signed({(wire15 ? reg43 : reg67),
              wire28[(4'hd):(3'h6)]})) >>> $unsigned($signed((~^wire13))));
        end
    end
  assign wire69 = $signed((($signed($signed(reg62)) ?
                      ($signed((8'hb9)) <<< (~^reg37)) : ({reg54, reg49} ?
                          reg40[(3'h7):(3'h7)] : reg36[(2'h3):(2'h3)])) ^ (&reg63[(3'h7):(1'h1)])));
endmodule
