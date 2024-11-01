module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire192;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire190;
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire192, wire9, wire10, wire190, reg5, reg6, reg7, reg8, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire0;
      reg6 <= $unsigned(reg5);
      reg7 <= wire4[(3'h6):(1'h1)];
      reg8 <= $unsigned((~^(($signed(wire1) >= $unsigned((8'had))) & wire1[(2'h3):(1'h0)])));
    end
  assign wire9 = (^({(|(wire2 ? reg6 : reg8)),
                     $signed(reg6[(4'h9):(3'h7)])} & wire1));
  assign wire10 = (-(reg7 ^ $signed((~^$signed(wire2)))));
  module11 #() modinst191 (wire190, clk, reg8, wire3, wire2, wire4);
  assign wire192 = (!(~&(($unsigned(reg6) <= reg6[(4'ha):(3'h4)]) ^~ $unsigned((~&wire2)))));
endmodule

module module11
#(parameter param189 = {((^(|((8'hb4) + (8'hb3)))) ? (8'hac) : (|({(8'ha9)} ? (~(8'had)) : (^~(8'hb0))))), ((~|(~{(8'hbd), (8'h9e)})) ? {(~|((8'hb3) ? (8'hac) : (8'ha3)))} : ((((8'ha5) ? (8'haf) : (8'hb4)) | ((8'ha1) ? (8'ha8) : (8'hb1))) >> (((8'hbd) >>> (7'h44)) ? (~(8'ha0)) : ((8'hbb) ? (8'hb4) : (7'h44)))))})
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'hec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire188;
  wire [(4'ha):(1'h0)] wire186;
  wire signed [(4'hf):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire145;
  wire [(2'h2):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire82;
  wire [(5'h11):(1'h0)] wire81;
  wire [(4'he):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire43;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire113;
  wire signed [(5'h10):(1'h0)] wire143;
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  assign y = {wire188,
                 wire186,
                 wire147,
                 wire145,
                 wire111,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire43,
                 wire45,
                 wire76,
                 wire113,
                 wire143,
                 reg146,
                 reg83,
                 (1'h0)};
  module16 #() modinst44 (wire43, clk, wire15, wire12, wire14, wire13);
  assign wire45 = wire15;
  module46 #() modinst77 (.wire47(wire15), .wire49(wire14), .y(wire76), .wire50(wire43), .wire51(wire12), .clk(clk), .wire48(wire45));
  assign wire78 = (~|($signed($unsigned($unsigned(wire45))) ~^ {wire45}));
  assign wire79 = (wire78 ?
                      (((!wire78[(2'h3):(2'h3)]) ?
                          wire76 : (wire43[(2'h3):(1'h0)] ?
                              wire12[(2'h3):(2'h2)] : wire15[(4'h9):(3'h5)])) ^ {(+((8'ha6) ?
                              wire78 : (8'h9f))),
                          $signed((|wire12))}) : $unsigned(wire43[(4'h9):(4'h8)]));
  assign wire80 = wire15;
  assign wire81 = wire14;
  assign wire82 = wire78;
  always
    @(posedge clk) begin
      reg83 <= ($unsigned(($unsigned(wire81) ?
          $signed((wire14 * wire15)) : (8'hae))) || wire15[(3'h6):(2'h3)]);
    end
  module84 #() modinst112 (.wire88(wire13), .y(wire111), .wire85(wire78), .wire87(reg83), .wire86(wire45), .clk(clk));
  assign wire113 = (wire43 ?
                       (wire82 ?
                           (~|(~^$unsigned(wire15))) : reg83) : ($signed(reg83[(1'h0):(1'h0)]) ?
                           (^~wire14[(1'h0):(1'h0)]) : ((&wire80) ?
                               wire79 : wire81)));
  module114 #() modinst144 (wire143, clk, wire81, wire13, wire45, wire43, wire14);
  assign wire145 = $signed(wire80);
  always
    @(posedge clk) begin
      reg146 <= wire113[(1'h0):(1'h0)];
    end
  assign wire147 = ((!$signed(($signed(wire43) && $signed(wire15)))) ?
                       {wire82,
                           (~^((wire14 >> wire43) ?
                               $signed(wire82) : (8'ha9)))} : wire111);
  module148 #() modinst187 (.wire150(wire79), .y(wire186), .wire151(wire143), .wire152(wire113), .clk(clk), .wire149(wire147));
  assign wire188 = ($signed({$signed((wire81 ^~ (8'hb5))),
                           wire78[(2'h2):(1'h0)]}) ?
                       $signed((wire79[(1'h0):(1'h0)] ?
                           {(wire43 <<< (8'ha1)), {wire111}} : ((^wire80) ?
                               (reg146 == wire186) : {wire186}))) : ($unsigned(wire80[(3'h5):(3'h4)]) ?
                           $signed({(reg146 ?
                                   wire143 : wire76)}) : (wire82[(4'hb):(3'h5)] ?
                               $signed((wire43 ?
                                   wire111 : wire145)) : $unsigned({wire76}))));
endmodule

module module148
#(parameter param184 = (~((~|(((8'ha2) ? (8'h9f) : (8'h9e)) & ((8'ha2) ? (8'haf) : (8'ha0)))) && ((((7'h41) ? (8'ha7) : (7'h42)) >= {(8'ha2), (7'h41)}) ? ((~(8'hac)) ? (^(8'hab)) : ((8'ha1) <= (8'hb6))) : (+(~^(8'hbf)))))), 
parameter param185 = param184)
(y, clk, wire152, wire151, wire150, wire149);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire152;
  input wire [(5'h10):(1'h0)] wire151;
  input wire [(4'h8):(1'h0)] wire150;
  input wire signed [(4'hf):(1'h0)] wire149;
  wire signed [(2'h2):(1'h0)] wire176;
  wire signed [(2'h3):(1'h0)] wire175;
  wire [(2'h3):(1'h0)] wire174;
  wire signed [(3'h6):(1'h0)] wire173;
  wire signed [(5'h10):(1'h0)] wire172;
  wire [(5'h11):(1'h0)] wire171;
  wire signed [(4'hb):(1'h0)] wire170;
  wire [(4'ha):(1'h0)] wire169;
  wire [(3'h6):(1'h0)] wire168;
  wire [(5'h11):(1'h0)] wire167;
  wire signed [(3'h7):(1'h0)] wire166;
  wire signed [(5'h14):(1'h0)] wire155;
  wire signed [(2'h2):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire153;
  reg signed [(5'h13):(1'h0)] reg183 = (1'h0);
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg180 = (1'h0);
  reg [(5'h15):(1'h0)] reg179 = (1'h0);
  reg [(5'h15):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(4'h9):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg164 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg162 = (1'h0);
  reg [(4'hb):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg160 = (1'h0);
  reg [(4'hf):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg158 = (1'h0);
  reg [(2'h3):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg156 = (1'h0);
  assign y = {wire176,
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
                 wire155,
                 wire154,
                 wire153,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
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
                 (1'h0)};
  assign wire153 = wire150;
  assign wire154 = ((((!$signed(wire153)) != (~|(wire152 > wire151))) ?
                       (^~wire153[(3'h6):(3'h6)]) : ($unsigned((^~(7'h44))) + ((wire151 ?
                               wire152 : wire150) ?
                           wire150 : wire150))) < (((8'hb2) ?
                       $unsigned(wire149[(2'h2):(2'h2)]) : $unsigned({wire150})) | wire153[(3'h6):(2'h2)]));
  assign wire155 = ((wire151 ?
                       ($unsigned({wire153}) >= $signed($unsigned(wire154))) : (~&(~(wire149 ?
                           (8'ha9) : wire152)))) > (wire153[(4'hd):(3'h7)] ?
                       ((+{wire150,
                           wire152}) << wire152) : $signed(wire151[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg156 <= ($signed((-wire152[(3'h4):(3'h4)])) ?
          ((($signed(wire153) && (wire151 || wire153)) >= ({wire153, wire152} ?
                  wire149 : $unsigned(wire151))) ?
              {$unsigned((wire149 ?
                      wire154 : wire152))} : wire153[(4'hd):(4'hc)]) : wire155[(3'h7):(3'h7)]);
      if (wire151)
        begin
          if (wire155[(4'he):(4'hb)])
            begin
              reg157 <= ({$signed($unsigned($signed(wire151)))} ~^ (^(^($unsigned((8'hbd)) ?
                  (wire152 ^ wire151) : wire149[(4'hb):(3'h7)]))));
              reg158 <= $unsigned(wire151);
            end
          else
            begin
              reg157 <= wire153[(3'h7):(3'h6)];
              reg158 <= $unsigned({wire150,
                  (($unsigned((8'ha1)) & $unsigned(wire150)) ?
                      ($signed((7'h41)) < (reg156 < wire152)) : reg157)});
            end
          reg159 <= (-(wire153 > $signed((wire150 ?
              wire154[(2'h2):(1'h1)] : wire149))));
          reg160 <= (wire149 ?
              $unsigned(reg157[(1'h1):(1'h1)]) : wire151[(3'h6):(3'h4)]);
          if (wire152[(3'h4):(2'h3)])
            begin
              reg161 <= (~reg157[(2'h3):(1'h1)]);
              reg162 <= $signed({$signed(wire152[(3'h7):(3'h6)])});
              reg163 <= wire150;
              reg164 <= ((&$unsigned(reg159[(1'h1):(1'h1)])) << reg158);
            end
          else
            begin
              reg161 <= (reg162 && ($signed(reg158) != ($signed((~|reg162)) | $unsigned(wire153[(2'h3):(2'h3)]))));
              reg162 <= {((((~^(8'hac)) ?
                              $unsigned(wire151) : $unsigned(reg157)) ?
                          wire153[(2'h2):(1'h0)] : (8'hb7)) ?
                      {$unsigned((8'hb1))} : wire152[(4'he):(2'h3)]),
                  (~^wire152)};
              reg163 <= (^~reg163);
              reg164 <= $signed(reg160[(4'hb):(1'h0)]);
            end
        end
      else
        begin
          reg157 <= ($unsigned(($signed($unsigned(reg157)) >= {(^~(8'h9f)),
                  $signed(wire150)})) ?
              ((^wire153) ?
                  $unsigned($signed(reg164)) : reg158[(5'h10):(3'h6)]) : ($signed($signed((reg159 ?
                  reg158 : reg159))) != reg162));
          reg158 <= ($signed((reg159[(2'h3):(2'h3)] << $unsigned($unsigned(reg157)))) ?
              ($unsigned($unsigned({reg162})) ?
                  $signed((((8'hbe) ^ reg164) ?
                      reg157[(2'h2):(1'h1)] : (wire152 && wire150))) : $unsigned((^{wire153}))) : ($signed($unsigned((reg157 || reg159))) - {(8'ha7),
                  ({reg158, reg157} ?
                      reg162[(3'h4):(2'h2)] : wire154[(2'h2):(2'h2)])}));
        end
      reg165 <= reg157[(1'h0):(1'h0)];
    end
  assign wire166 = $signed(wire149[(1'h1):(1'h0)]);
  assign wire167 = {{($unsigned($unsigned((7'h42))) ?
                               wire152[(5'h13):(4'hf)] : $unsigned({reg158,
                                   reg165})),
                           (reg164 ~^ (reg161[(3'h7):(1'h1)] ^~ {(8'hab),
                               reg162}))},
                       reg164[(1'h1):(1'h0)]};
  assign wire168 = (((($signed(reg164) ?
                                   (reg164 ?
                                       (8'hae) : wire155) : $signed(wire152)) ?
                               {(!reg163),
                                   (wire153 <= wire152)} : {(reg161 + wire150)}) ?
                           $signed(($unsigned((8'ha0)) ~^ (|reg159))) : $signed($unsigned((-reg158)))) ?
                       ((reg157 ~^ $unsigned($signed(wire152))) != (^~(reg160[(4'he):(4'hd)] != $signed(wire149)))) : wire149[(2'h2):(1'h1)]);
  assign wire169 = reg165;
  assign wire170 = $unsigned((8'haa));
  assign wire171 = reg164[(4'hf):(4'h9)];
  assign wire172 = reg158[(4'he):(4'ha)];
  assign wire173 = reg162[(3'h4):(3'h4)];
  assign wire174 = wire166[(2'h3):(1'h0)];
  assign wire175 = ((~^$signed(((reg156 || wire169) ?
                           $signed((8'ha9)) : {wire155, wire170}))) ?
                       {($unsigned($signed((8'hb0))) ?
                               ($unsigned(wire166) ?
                                   wire149 : (+reg160)) : {{wire174}})} : wire151[(1'h0):(1'h0)]);
  assign wire176 = ({({reg165} * wire155[(1'h1):(1'h0)]),
                       $unsigned((8'ha2))} >>> reg165);
  always
    @(posedge clk) begin
      reg177 <= ((({(|reg158), reg160} || ({wire167,
              wire155} != $unsigned(reg157))) > $signed(reg162[(3'h4):(2'h2)])) ?
          wire150 : ($unsigned({(wire168 >>> wire152),
              $signed((8'hb2))}) << $unsigned($unsigned((wire152 >= reg160)))));
      reg178 <= ((^~(~$signed(((8'hb7) ? reg158 : (8'ha7))))) ?
          (+$unsigned((|(reg162 ?
              wire149 : wire176)))) : $unsigned($unsigned(((wire168 || reg160) ?
              (~^wire176) : wire166[(1'h1):(1'h0)]))));
      if ((^$signed(wire149[(1'h1):(1'h1)])))
        begin
          reg179 <= (8'hae);
          reg180 <= ($unsigned(reg158[(5'h11):(5'h11)]) >> $signed((wire175[(1'h1):(1'h1)] * (reg157 ?
              $unsigned((8'hab)) : (wire155 ^ reg161)))));
          reg181 <= reg163[(1'h1):(1'h1)];
          reg182 <= (wire166 ?
              ((&$unsigned($unsigned((7'h41)))) ?
                  ((^~(&(8'hb3))) * (~&$unsigned(reg158))) : $signed($signed((reg163 ?
                      reg164 : wire170)))) : $signed({wire170}));
          reg183 <= wire154;
        end
      else
        begin
          reg179 <= $signed((~|$signed(reg160)));
          reg180 <= wire167;
        end
    end
endmodule

module module114
#(parameter param142 = (~{{(~^((8'hba) >> (7'h40))), {(7'h44)}}, ((((8'ha3) ? (8'h9f) : (8'hb1)) ? (8'had) : (~^(8'h9c))) ? ((+(8'hab)) & (-(8'hbe))) : ((~^(8'hbd)) ? (8'ha4) : ((7'h41) || (8'hab))))}))
(y, clk, wire119, wire118, wire117, wire116, wire115);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire119;
  input wire signed [(3'h7):(1'h0)] wire118;
  input wire [(5'h15):(1'h0)] wire117;
  input wire [(5'h11):(1'h0)] wire116;
  input wire [(4'hd):(1'h0)] wire115;
  wire [(4'h8):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire130;
  wire [(5'h10):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire124;
  wire [(2'h2):(1'h0)] wire123;
  wire [(4'hc):(1'h0)] wire122;
  wire signed [(4'hc):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(4'hc):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg [(4'hc):(1'h0)] reg131 = (1'h0);
  assign y = {wire141,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 (1'h0)};
  assign wire120 = $signed((~|{$unsigned(((8'haf) ~^ wire117)),
                       wire117[(4'hb):(3'h7)]}));
  assign wire121 = wire120;
  assign wire122 = {$signed(((&(wire115 | (8'haa))) <= ($signed(wire120) ?
                           wire121[(3'h4):(3'h4)] : $unsigned(wire119))))};
  assign wire123 = (8'hab);
  assign wire124 = wire121[(4'hc):(4'hc)];
  assign wire125 = wire116[(3'h4):(1'h1)];
  assign wire126 = wire125;
  assign wire127 = (!(wire123[(1'h1):(1'h1)] ?
                       ({$unsigned(wire122),
                           (wire121 ? wire121 : wire118)} <<< $signed(((8'hab) ?
                           wire125 : wire124))) : $signed($signed((wire122 ?
                           wire124 : (8'h9f))))));
  assign wire128 = (^$unsigned($signed(wire125[(1'h0):(1'h0)])));
  assign wire129 = $unsigned(((wire126 ? $signed((+wire119)) : wire128) ?
                       ($signed((wire115 ? (7'h40) : wire119)) ?
                           {$unsigned(wire125)} : wire124[(5'h13):(4'hc)]) : $signed($unsigned((~&wire121)))));
  assign wire130 = {{(~|wire115), (!(8'haa))}};
  always
    @(posedge clk) begin
      if ($unsigned($signed(((wire119[(3'h7):(3'h4)] || (wire118 ?
          (8'hbd) : wire127)) == {(~&wire128), (+wire122)}))))
        begin
          reg131 <= wire127[(2'h2):(1'h0)];
        end
      else
        begin
          if (wire117[(4'hf):(4'he)])
            begin
              reg131 <= $signed((^~($unsigned({wire127, wire126}) ?
                  (wire120[(1'h0):(1'h0)] ?
                      wire129 : wire118[(3'h5):(3'h5)]) : (wire123 ?
                      (8'hbe) : (wire122 ? wire121 : wire127)))));
            end
          else
            begin
              reg131 <= $unsigned(reg131[(1'h0):(1'h0)]);
              reg132 <= $signed($unsigned(((wire122[(4'hc):(2'h2)] ?
                      wire129[(1'h1):(1'h1)] : {wire121, wire116}) ?
                  (^$unsigned(wire118)) : $signed(wire115))));
            end
          if ((-wire115))
            begin
              reg133 <= $unsigned(wire122);
            end
          else
            begin
              reg133 <= $signed({wire119[(1'h0):(1'h0)]});
              reg134 <= reg131;
              reg135 <= reg132[(5'h10):(4'hd)];
              reg136 <= {($signed($unsigned($unsigned(wire123))) > ((+$unsigned(wire126)) ?
                      $signed((wire130 ?
                          wire127 : reg133)) : (reg131[(1'h0):(1'h0)] << $unsigned(reg134))))};
            end
          reg137 <= wire119[(4'hb):(2'h2)];
          reg138 <= wire116[(4'h8):(3'h7)];
        end
      reg139 <= ((wire117[(3'h5):(2'h3)] > reg134) ~^ (((&$unsigned(wire128)) ?
          {wire130} : (wire128[(2'h3):(1'h0)] ?
              $signed(reg137) : (^(8'hb2)))) << $unsigned(wire117[(5'h14):(3'h6)])));
      reg140 <= ((wire120[(3'h7):(1'h1)] < $signed(wire128)) | (7'h43));
    end
  assign wire141 = $unsigned(wire128);
endmodule

module module84
#(parameter param109 = (~^(((((8'h9d) ? (7'h41) : (8'hac)) ? {(8'hb7)} : (&(8'ha2))) ? (((8'hb5) << (7'h42)) ? ((8'ha9) ? (8'hb4) : (8'hbe)) : ((8'ha3) ? (8'hb3) : (8'h9e))) : {((7'h44) != (8'h9d)), ((8'hb9) ? (8'ha3) : (8'hb6))}) <<< (((~^(8'hbb)) >= ((8'ha3) ~^ (8'hbb))) ? {(^(8'hb5))} : {(~|(8'hb3)), {(8'hb8), (8'hb3)}}))), 
parameter param110 = {{param109}, ((~|param109) ? (~|(-((7'h42) * (8'hb5)))) : {param109})})
(y, clk, wire88, wire87, wire86, wire85);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire88;
  input wire signed [(3'h4):(1'h0)] wire87;
  input wire signed [(4'h8):(1'h0)] wire86;
  input wire [(2'h2):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire102;
  wire signed [(3'h6):(1'h0)] wire101;
  wire signed [(4'hc):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire signed [(4'ha):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire95;
  wire [(4'hc):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire91;
  reg signed [(3'h6):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(3'h5):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg90,
                 reg89,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg89 <= (wire85 ? wire85 : $unsigned(wire86[(2'h3):(1'h1)]));
      reg90 <= wire88[(1'h1):(1'h0)];
    end
  assign wire91 = (8'hb3);
  assign wire92 = (8'hb0);
  assign wire93 = ($signed(wire92[(1'h0):(1'h0)]) ?
                      (reg89 + (($signed(reg89) ?
                          (~wire88) : $unsigned(reg89)) != $signed((!reg90)))) : ((reg89 ?
                          wire91[(2'h2):(1'h0)] : ((wire86 <<< wire85) + wire88[(5'h12):(1'h0)])) <= $signed((^((7'h43) < (8'h9e))))));
  assign wire94 = wire88;
  assign wire95 = (~|($signed(((wire88 >>> wire85) ?
                      $unsigned((8'ha8)) : wire86[(1'h0):(1'h0)])) > (((wire92 ?
                          wire86 : wire94) ^~ (reg90 >> (8'hbb))) ?
                      {reg90[(4'h8):(3'h6)],
                          {(8'hbc),
                              wire85}} : $signed(wire88[(5'h14):(2'h2)]))));
  assign wire96 = wire91[(4'hb):(4'h8)];
  assign wire97 = (~&reg89[(5'h11):(3'h4)]);
  assign wire98 = $unsigned((wire88 < ($unsigned($signed(wire87)) != wire96)));
  assign wire99 = ((-wire95) >= (($signed($signed(wire91)) == (-(wire94 ?
                          wire98 : wire98))) ?
                      (-((wire92 & wire96) + $signed(wire95))) : $signed({(wire96 ?
                              wire96 : (8'hb0))})));
  assign wire100 = wire95;
  assign wire101 = {(reg89[(3'h5):(2'h2)] - wire95[(4'hb):(1'h1)])};
  assign wire102 = $signed((^~$unsigned(((wire101 == wire99) - wire101[(3'h5):(1'h0)]))));
  always
    @(posedge clk) begin
      reg103 <= (8'h9f);
      reg104 <= ($unsigned((~|(8'hb3))) | $unsigned($unsigned(reg90[(3'h7):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg105 <= ($signed({($signed((8'hb6)) ?
                  reg104[(2'h3):(1'h1)] : $signed(wire88)),
              wire87}) ?
          {$unsigned($signed(wire92[(1'h1):(1'h1)])),
              $signed($unsigned((&wire100)))} : reg89);
      reg106 <= wire95[(3'h6):(2'h3)];
    end
  assign wire107 = wire88;
  assign wire108 = wire86;
endmodule

module module46
#(parameter param75 = (({(^~(&(8'hbb))), (~|((8'ha8) ^ (8'hab)))} ? (!{((8'hb8) ? (8'hb8) : (8'hb1))}) : (((~|(8'haa)) ? {(8'haa), (8'hb9)} : ((7'h40) & (8'hb8))) ? ((8'ha6) ? ((8'hb4) ? (7'h43) : (8'hb9)) : {(8'hbd)}) : ((&(8'haa)) >= (8'hb0)))) & ((({(8'ha3), (8'ha6)} < {(8'hb3), (7'h41)}) ? ((&(8'h9d)) ? {(8'h9e), (8'had)} : ((8'ha0) && (8'hb6))) : (^~((8'ha6) ? (8'h9e) : (8'hb7)))) == ((((8'had) | (8'hb9)) ? ((8'hbb) && (8'haf)) : ((8'hac) * (7'h41))) && (8'ha2)))))
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire51;
  input wire signed [(4'h8):(1'h0)] wire50;
  input wire signed [(4'h9):(1'h0)] wire49;
  input wire signed [(4'h8):(1'h0)] wire48;
  input wire [(4'hd):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire67,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire54,
                 wire53,
                 wire52,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire52 = ($signed($unsigned(wire47)) & ((&$signed((wire49 - wire49))) & wire47[(3'h6):(2'h2)]));
  assign wire53 = wire50;
  assign wire54 = (((wire52[(2'h2):(2'h2)] > (~&(wire53 ? wire48 : wire50))) ?
                          wire53 : wire49[(2'h2):(1'h0)]) ?
                      (wire47 | (^wire52[(3'h6):(3'h4)])) : wire47[(4'hb):(1'h0)]);
  always
    @(posedge clk) begin
      reg55 <= $signed($signed(wire51));
      reg56 <= $unsigned($unsigned((8'hb2)));
      reg57 <= (($unsigned(($signed(wire49) ?
              (^~(8'ha2)) : $signed(reg56))) >>> wire52) ?
          $signed($signed(reg56[(1'h1):(1'h0)])) : (~^wire50));
    end
  always
    @(posedge clk) begin
      reg58 <= $unsigned(wire54);
    end
  assign wire59 = $unsigned(({($unsigned(wire50) ^ ((8'ha4) ? reg55 : wire51)),
                      wire48[(3'h4):(2'h2)]} != wire52[(3'h5):(2'h2)]));
  assign wire60 = $signed(wire59);
  assign wire61 = $signed((($signed((8'h9c)) ?
                          $signed(wire49[(4'h9):(2'h3)]) : wire47) ?
                      $signed((wire54 << (wire53 >>> (8'ha0)))) : (($unsigned(wire60) * (8'ha0)) ?
                          (wire50 ? (8'hb0) : wire48) : (wire47[(3'h7):(3'h4)] ?
                              ((8'hb1) ?
                                  wire52 : (7'h40)) : wire53[(2'h2):(2'h2)]))));
  assign wire62 = (~((!(!$unsigned(reg55))) != (wire49 ?
                      ($signed(reg56) ?
                          $signed(reg55) : wire60[(4'hb):(3'h4)]) : wire54[(3'h7):(1'h1)])));
  always
    @(posedge clk) begin
      reg63 <= (8'hae);
      reg64 <= reg63;
      reg65 <= (wire53 < $signed(wire54[(4'he):(3'h5)]));
      reg66 <= (|wire51);
    end
  assign wire67 = (~|reg55);
  always
    @(posedge clk) begin
      reg68 <= (wire54[(4'hc):(4'hc)] || ((~|$signed((!(8'ha5)))) > reg55[(1'h0):(1'h0)]));
      reg69 <= ((~reg63) ?
          $unsigned(reg64[(2'h2):(1'h1)]) : $unsigned((reg63[(1'h0):(1'h0)] ?
              $unsigned(reg66) : (~&(reg57 <<< reg56)))));
      reg70 <= (8'hbc);
      reg71 <= $unsigned(reg55);
      reg72 <= reg71[(2'h3):(2'h2)];
    end
  assign wire73 = wire54;
  assign wire74 = ((~reg63[(4'he):(4'h8)]) ?
                      {(^wire67[(3'h6):(2'h2)])} : wire67);
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire20;
  input wire [(4'hd):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(3'h5):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire38;
  wire signed [(5'h11):(1'h0)] wire37;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire [(5'h14):(1'h0)] wire23;
  wire [(4'h9):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg29,
                 (1'h0)};
  assign wire21 = $signed($signed($unsigned((wire18 ?
                      $unsigned(wire20) : (wire20 <= wire17)))));
  assign wire22 = $signed((^(~((wire18 >= wire18) & (wire17 ?
                      wire17 : (7'h42))))));
  assign wire23 = wire18[(4'h9):(3'h7)];
  assign wire24 = (wire17[(3'h7):(3'h5)] ?
                      $signed(($unsigned((~wire20)) ?
                          wire22[(3'h6):(1'h0)] : (~|$signed(wire17)))) : wire18[(4'h9):(3'h7)]);
  assign wire25 = (~|$signed(wire24[(4'hb):(2'h2)]));
  assign wire26 = ({wire20[(1'h1):(1'h0)]} == $signed({$unsigned($unsigned(wire18)),
                      wire23}));
  assign wire27 = ($signed($signed({(wire23 > wire23)})) <= (|wire19));
  assign wire28 = $signed((^~$unsigned(wire21[(3'h6):(2'h2)])));
  always
    @(posedge clk) begin
      reg29 <= wire19[(3'h4):(1'h1)];
    end
  assign wire30 = wire20;
  assign wire31 = $signed($signed(wire26));
  assign wire32 = ($signed(({{wire20, wire17}, wire31[(1'h1):(1'h1)]} ?
                          $unsigned($signed(wire26)) : $unsigned({wire22}))) ?
                      ($unsigned(wire25) ?
                          (~|$signed(wire21[(4'hb):(1'h1)])) : (~^{wire23[(4'h9):(1'h0)]})) : $unsigned((((8'hbc) ?
                              $unsigned(wire21) : wire20) ?
                          ((wire18 ?
                              (8'haa) : wire26) >>> wire26) : (~((8'hb2) >>> wire30)))));
  assign wire33 = $unsigned(wire20);
  assign wire34 = wire20[(3'h6):(2'h3)];
  assign wire35 = $unsigned(wire21[(4'hd):(4'hd)]);
  assign wire36 = ($signed($signed({$unsigned(wire25)})) <= (wire26[(4'hd):(4'hb)] ?
                      $unsigned((wire19[(2'h3):(1'h0)] - (~^wire21))) : ((~|$unsigned(reg29)) ?
                          (reg29[(4'hd):(4'hd)] ?
                              (^~reg29) : (wire25 ?
                                  wire24 : wire27)) : $signed((~|wire27)))));
  assign wire37 = {wire18,
                      ((~^wire32) ?
                          (&$unsigned(wire28)) : wire24[(3'h4):(3'h4)])};
  assign wire38 = ((wire30 >> {{$signed(wire22)}}) ?
                      (8'hb7) : (&wire30[(2'h3):(2'h2)]));
  assign wire39 = ($signed(wire30) < ((wire21 < (wire20[(3'h5):(1'h0)] ?
                      (wire34 ?
                          wire17 : wire23) : $signed((8'hbc)))) << (((wire24 ^ wire21) ?
                      wire34[(3'h7):(1'h0)] : wire30) & $signed((wire32 * wire18)))));
  assign wire40 = wire33;
  assign wire41 = (~&(~|(((wire31 & wire36) << (wire26 == wire32)) ?
                      $signed((+(8'h9f))) : wire37[(4'hb):(1'h0)])));
  assign wire42 = $signed(((~^$unsigned((+wire32))) ?
                      (~|$unsigned($unsigned(wire25))) : (-(8'had))));
endmodule
