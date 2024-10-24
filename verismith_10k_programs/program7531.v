module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire3;
  wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire8;
  wire [(4'hc):(1'h0)] wire178;
  assign y = {wire4, wire5, wire6, wire7, wire8, wire178, (1'h0)};
  assign wire4 = $signed(wire3);
  assign wire5 = {{$unsigned($unsigned((~&wire0))), wire2},
                     wire0[(3'h5):(1'h0)]};
  assign wire6 = ((wire1[(3'h4):(1'h1)] ?
                         (&(wire0[(3'h7):(3'h6)] >>> (|wire5))) : (+$signed($signed(wire4)))) ?
                     wire0 : {(~|$signed(wire4))});
  assign wire7 = (wire4[(4'ha):(3'h7)] ?
                     (wire2[(3'h7):(2'h2)] ?
                         ($unsigned($unsigned((8'h9c))) ?
                             {$unsigned(wire1)} : ({wire1} ?
                                 $signed((8'h9c)) : (7'h41))) : wire1) : {$unsigned((~^$unsigned(wire2)))});
  assign wire8 = {($unsigned($unsigned((wire1 ?
                         wire3 : wire5))) || ($unsigned($unsigned(wire3)) <= wire5)),
                     {wire7[(1'h1):(1'h0)]}};
  module9 #() modinst179 (.wire12(wire8), .clk(clk), .wire14(wire5), .wire10(wire1), .y(wire178), .wire11(wire7), .wire13(wire2));
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire177;
  wire [(4'hb):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(5'h14):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(2'h2):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire146;
  wire signed [(4'ha):(1'h0)] wire175;
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  assign y = {wire177,
                 wire115,
                 wire64,
                 wire63,
                 wire62,
                 wire60,
                 wire33,
                 wire32,
                 wire31,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire143,
                 wire145,
                 wire146,
                 wire175,
                 reg148,
                 reg147,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire15 = (wire12 == (~^{wire12, (+$unsigned(wire12))}));
  assign wire16 = ($signed(((^(+wire14)) ?
                      ((wire13 ?
                          wire11 : (8'hb4)) | wire15[(3'h6):(1'h0)]) : wire10)) | $unsigned($signed(wire13)));
  assign wire17 = (8'hbd);
  assign wire18 = (8'ha7);
  assign wire19 = $unsigned(wire15[(3'h6):(2'h3)]);
  assign wire20 = $signed({wire19[(1'h1):(1'h0)],
                      ((wire11[(2'h2):(1'h0)] ?
                              $unsigned((8'hae)) : (wire12 >> wire11)) ?
                          wire19 : ((wire17 ?
                              wire10 : wire16) == $unsigned(wire15)))});
  assign wire21 = $unsigned($unsigned({wire13, wire17}));
  assign wire22 = (!$signed($unsigned((wire10[(2'h3):(1'h1)] + ((8'hbe) ?
                      wire12 : wire15)))));
  always
    @(posedge clk) begin
      reg23 <= (^~$unsigned(wire12[(2'h3):(1'h1)]));
      reg24 <= wire10;
      reg25 <= ($unsigned(($unsigned((8'hac)) ?
              wire12 : ((~wire19) ~^ (reg24 != wire22)))) ?
          ($signed((|(wire19 ?
              wire20 : wire20))) >>> $unsigned({((8'hb8) | wire12),
              wire18[(1'h1):(1'h1)]})) : (((|wire13[(1'h1):(1'h1)]) | ((wire14 >= wire22) + reg24[(1'h0):(1'h0)])) < $signed($unsigned($unsigned(wire17)))));
      if ($unsigned(($unsigned((wire16[(1'h0):(1'h0)] ? wire13 : (!reg24))) ?
          wire11[(1'h1):(1'h1)] : wire11[(3'h4):(3'h4)])))
        begin
          reg26 <= {(reg24 + $signed($unsigned({wire18})))};
          reg27 <= reg23;
          reg28 <= ((~&(^wire15[(2'h3):(1'h1)])) && (($signed(wire17) >= ((~|(8'had)) == (~&wire17))) ?
              (reg26[(3'h4):(2'h2)] ?
                  wire13[(2'h2):(1'h1)] : (wire10[(4'hc):(1'h0)] ?
                      $signed(wire16) : $unsigned((7'h44)))) : ($unsigned((wire19 ?
                  reg25 : wire22)) ^~ $unsigned((reg26 <= wire13)))));
          reg29 <= (8'hb3);
          reg30 <= (reg24[(3'h6):(2'h3)] && (wire17[(2'h2):(2'h2)] ?
              wire17[(2'h2):(1'h0)] : (~$signed($signed(reg23)))));
        end
      else
        begin
          reg26 <= {wire13[(1'h1):(1'h1)], reg30[(1'h0):(1'h0)]};
        end
    end
  assign wire31 = $unsigned(((^$unsigned(wire20)) ?
                      $unsigned(reg25) : $unsigned((~&(wire11 > reg28)))));
  assign wire32 = (wire11 && $unsigned($unsigned((((8'hb4) + wire13) - reg27[(5'h11):(4'hb)]))));
  assign wire33 = $signed($unsigned((reg24 < ({(8'ha0)} != (~&wire32)))));
  module34 #() modinst61 (.wire38(wire33), .wire39(wire14), .wire37(wire22), .wire36(reg28), .wire35(wire32), .y(wire60), .clk(clk));
  assign wire62 = (+(-$signed($unsigned({reg27, wire13}))));
  assign wire63 = (((!({wire22} && (-reg29))) - reg25[(4'hd):(3'h7)]) ?
                      $signed($signed((!(wire12 | wire22)))) : wire21[(5'h10):(3'h6)]);
  assign wire64 = (^~$unsigned($unsigned((~|wire16))));
  module65 #() modinst116 (wire115, clk, wire31, wire64, wire14, wire13, wire20);
  module117 #() modinst144 (.wire119(wire62), .wire120(wire60), .wire122(wire21), .y(wire143), .wire121(wire22), .clk(clk), .wire118(reg25));
  assign wire145 = {$signed(({$unsigned(wire64), (reg27 ^ wire60)} != ((wire16 ?
                               reg26 : wire32) ?
                           (wire17 > wire17) : wire19[(1'h1):(1'h1)])))};
  assign wire146 = ($signed((~&$unsigned((+wire31)))) ?
                       reg29 : $signed((+wire13[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg147 <= (wire14[(1'h1):(1'h0)] ?
          $unsigned((~|(-$signed(wire11)))) : wire13[(3'h6):(3'h6)]);
      reg148 <= (&({{$unsigned(wire62)}, $signed((wire18 ? wire22 : wire13))} ?
          wire21 : (wire22 * $unsigned(wire15))));
    end
  module149 #() modinst176 (wire175, clk, wire64, wire33, reg28, reg23, wire22);
  assign wire177 = ({reg23[(4'ha):(4'ha)]} ^~ (^$unsigned($signed((~&wire17)))));
endmodule

module module149
#(parameter param173 = ((8'hbe) ^ ((((~&(8'hb9)) ? ((8'hb4) - (8'ha4)) : {(8'hbe), (8'h9d)}) ^~ {((8'hae) >>> (8'hbb)), ((8'hac) ~^ (8'h9e))}) ? ((8'ha9) ? ((-(8'h9e)) || {(8'ha4), (8'hac)}) : {(~(8'ha6)), ((8'ha9) ? (8'h9f) : (8'ha4))}) : {{((8'hbe) >>> (8'ha1))}, {(+(8'hbe)), {(8'ha2), (8'haf)}}})), 
parameter param174 = {((+param173) ? (^~(-(+param173))) : ((^(param173 ? param173 : param173)) ? (~^(param173 ? (7'h44) : param173)) : (~param173)))})
(y, clk, wire154, wire153, wire152, wire151, wire150);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire154;
  input wire signed [(2'h3):(1'h0)] wire153;
  input wire signed [(3'h7):(1'h0)] wire152;
  input wire [(4'hd):(1'h0)] wire151;
  input wire signed [(5'h10):(1'h0)] wire150;
  wire signed [(3'h6):(1'h0)] wire170;
  wire signed [(5'h15):(1'h0)] wire157;
  reg signed [(5'h13):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg171 = (1'h0);
  reg [(4'hf):(1'h0)] reg169 = (1'h0);
  reg [(2'h3):(1'h0)] reg168 = (1'h0);
  reg [(5'h13):(1'h0)] reg167 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg166 = (1'h0);
  reg [(4'hc):(1'h0)] reg165 = (1'h0);
  reg [(4'ha):(1'h0)] reg164 = (1'h0);
  reg [(5'h10):(1'h0)] reg163 = (1'h0);
  reg [(5'h11):(1'h0)] reg162 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg161 = (1'h0);
  reg [(4'hf):(1'h0)] reg160 = (1'h0);
  reg [(4'ha):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg155 = (1'h0);
  assign y = {wire170,
                 wire157,
                 reg172,
                 reg171,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg156,
                 reg155,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg155 <= (8'ha0);
      reg156 <= $signed({$signed(wire151), wire154[(1'h0):(1'h0)]});
    end
  assign wire157 = (({$signed((reg156 ? reg155 : wire154)),
                           $unsigned(wire150)} ?
                       $unsigned(((wire151 ?
                           wire153 : (8'ha8)) ^ $unsigned((8'hba)))) : wire152[(1'h0):(1'h0)]) + wire151[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg158 <= ({(((~|wire150) ?
                  wire150[(3'h6):(3'h6)] : (reg156 ? wire157 : wire151)) ?
              ($unsigned(reg155) ?
                  $unsigned(wire157) : wire153) : ((wire154 || reg155) ?
                  ((8'h9c) ?
                      wire157 : wire150) : reg155))} && ($signed((!$unsigned(wire153))) + wire150[(4'h9):(4'h9)]));
      if (reg156[(2'h2):(1'h1)])
        begin
          if ((($unsigned({$signed((8'hb1))}) ?
              reg156[(3'h5):(2'h3)] : wire151) <<< $signed({reg156,
              $signed(wire152[(3'h6):(3'h6)])})))
            begin
              reg159 <= (+((8'ha7) != (&((wire157 < wire157) ?
                  ((8'hb2) >> reg155) : {reg158, wire154}))));
              reg160 <= wire151[(4'hd):(4'h9)];
              reg161 <= ((!reg159) >> reg156);
              reg162 <= wire150[(3'h5):(3'h4)];
            end
          else
            begin
              reg159 <= reg155;
              reg160 <= (|$signed(reg161[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg159 <= ($signed(($signed((reg158 ? reg158 : wire152)) ?
              ({reg161, reg159} ?
                  $unsigned(wire152) : $unsigned(reg159)) : {reg156})) || wire157[(3'h7):(3'h7)]);
          reg160 <= ((reg155[(2'h2):(1'h1)] << $signed($unsigned($unsigned(wire153)))) ?
              wire150[(2'h2):(2'h2)] : ((~^reg155[(5'h10):(4'hb)]) * $unsigned((+$unsigned(reg161)))));
          reg161 <= wire151[(3'h6):(3'h5)];
          if (wire153[(1'h1):(1'h0)])
            begin
              reg162 <= wire150;
              reg163 <= (8'ha3);
              reg164 <= ((+((-$signed((8'hae))) ?
                      $unsigned((wire150 ^ (8'hb8))) : reg158)) ?
                  wire152[(2'h3):(2'h2)] : $unsigned($signed(({wire154} > wire151[(3'h7):(3'h6)]))));
            end
          else
            begin
              reg162 <= wire151[(3'h4):(3'h4)];
              reg163 <= wire152[(3'h7):(1'h1)];
              reg164 <= (-(($signed((~|wire150)) ?
                  $unsigned($signed(reg156)) : {$unsigned(wire154),
                      wire153[(2'h2):(1'h0)]}) * $unsigned(({wire151} ?
                  (reg159 > reg162) : $unsigned(wire154)))));
              reg165 <= $unsigned(({wire154} - reg158[(2'h3):(1'h0)]));
            end
          if ({$unsigned($signed({$unsigned(reg164), $signed((8'hb6))}))})
            begin
              reg166 <= ($unsigned($unsigned($unsigned((+wire151)))) ?
                  ({reg159[(2'h2):(2'h2)]} <= (~^(-$signed(wire157)))) : $unsigned($signed(wire154)));
              reg167 <= $unsigned((reg155 <= (((reg162 | wire150) ?
                      wire151 : $unsigned((7'h44))) ?
                  $unsigned($unsigned((8'ha5))) : reg156[(3'h6):(1'h0)])));
              reg168 <= (8'ha5);
              reg169 <= (~|(reg159[(1'h1):(1'h0)] ?
                  (!wire152) : wire154[(2'h3):(1'h0)]));
            end
          else
            begin
              reg166 <= $unsigned(reg160);
              reg167 <= reg167[(5'h11):(4'hf)];
              reg168 <= (8'ha3);
              reg169 <= wire154[(1'h1):(1'h1)];
            end
        end
    end
  assign wire170 = reg166[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg171 <= (reg168[(2'h3):(2'h3)] ?
          reg164[(3'h6):(3'h6)] : reg167[(4'h8):(2'h2)]);
      reg172 <= ((!reg169[(2'h3):(1'h0)]) - ((reg156 >>> $unsigned((!(8'hac)))) ?
          $signed(wire152) : $signed((reg158 ? reg168 : {reg169}))));
    end
endmodule

module module117
#(parameter param141 = ({(|(((8'hbf) + (8'hb9)) ? ((8'hac) ? (8'hbd) : (8'hba)) : (|(8'hb1)))), (^(^{(8'hac), (8'hac)}))} ? {({((8'hbb) ? (8'hbf) : (8'hbb)), ((8'hbb) ? (8'hba) : (8'hac))} ? ((8'ha8) * (~|(8'hb2))) : (8'hba)), {(^~((7'h43) ? (8'hb4) : (7'h44))), (((8'h9c) && (8'hbd)) | (+(8'hba)))}} : (8'hbf)), 
parameter param142 = param141)
(y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire122;
  input wire [(4'ha):(1'h0)] wire121;
  input wire [(4'h9):(1'h0)] wire120;
  input wire [(5'h15):(1'h0)] wire119;
  input wire [(5'h15):(1'h0)] wire118;
  wire signed [(4'hb):(1'h0)] wire140;
  wire [(4'ha):(1'h0)] wire134;
  reg signed [(3'h7):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg136 = (1'h0);
  reg [(5'h12):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg131 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg123 = (1'h0);
  assign y = {wire140,
                 wire134,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg123 <= (8'ha4);
      if (reg123[(1'h0):(1'h0)])
        begin
          reg124 <= (($unsigned((~&{wire118})) ?
              (wire121[(4'h9):(1'h0)] ?
                  wire119[(4'h9):(3'h6)] : ((8'h9f) + ((8'hb4) <<< wire121))) : (wire119 << wire119)) | $unsigned(((8'ha1) ?
              $unsigned((wire122 ?
                  reg123 : reg123)) : $unsigned($signed((8'ha4))))));
        end
      else
        begin
          reg124 <= $unsigned((wire120 ?
              (($unsigned(reg123) ?
                  (~|wire121) : ((8'hb9) ?
                      (8'hba) : wire120)) == $signed((reg123 ?
                  wire119 : wire122))) : (&(8'ha4))));
          reg125 <= (reg124 ?
              (wire119[(5'h12):(4'hd)] || (wire120 ?
                  $signed($signed(wire120)) : {$signed(wire120)})) : (reg124 == (8'had)));
          reg126 <= reg125[(3'h4):(3'h4)];
          if (wire119[(3'h4):(3'h4)])
            begin
              reg127 <= $unsigned(wire120);
              reg128 <= $unsigned((($signed((reg127 ~^ (8'h9f))) || (wire119 ?
                      (wire118 ~^ reg127) : reg124)) ?
                  (8'h9e) : ((reg124[(2'h2):(2'h2)] <= $signed(reg127)) ?
                      wire119[(5'h11):(3'h5)] : ((wire119 ? wire118 : wire121) ?
                          (|wire120) : reg127[(4'h9):(1'h0)]))));
              reg129 <= (+reg126[(3'h5):(3'h5)]);
            end
          else
            begin
              reg127 <= reg124;
              reg128 <= (~&($unsigned(reg129) == $signed(({reg128,
                  reg127} >= {reg123}))));
              reg129 <= ((reg126 ?
                  {$signed(wire122)} : wire120) & ((+((&(7'h41)) ?
                      (+reg128) : (!wire120))) ?
                  $unsigned($signed((reg123 >> reg125))) : {($unsigned(reg125) ?
                          (wire118 & wire122) : (wire118 ? reg123 : reg125))}));
            end
        end
      reg130 <= reg125;
    end
  always
    @(posedge clk) begin
      reg131 <= (!(^~((reg125[(4'h9):(4'h9)] ?
              reg129[(4'ha):(1'h0)] : $signed(reg123)) ?
          ((wire121 < reg125) - (wire122 ? (8'hbe) : (8'ha6))) : wire118)));
      reg132 <= reg131[(1'h0):(1'h0)];
      reg133 <= {reg126,
          ((reg129 ?
              $unsigned(reg127[(1'h1):(1'h1)]) : $signed((^~reg123))) || ($unsigned(wire122) ?
              $signed((reg128 <= wire121)) : $signed((!(7'h44)))))};
    end
  assign wire134 = reg128;
  always
    @(posedge clk) begin
      reg135 <= wire122;
      reg136 <= (reg124 >>> reg127);
      reg137 <= reg133;
      reg138 <= $signed((((reg123 || (reg126 >>> reg123)) + reg130) ?
          {(8'ha8)} : $signed(((reg126 ? reg137 : reg127) ?
              {(8'ha7), reg136} : (wire121 ? (8'hbf) : reg130)))));
      reg139 <= reg130;
    end
  assign wire140 = $signed({(reg133[(4'he):(2'h3)] & reg132)});
endmodule

module module65
#(parameter param114 = ((((((8'ha9) < (8'hbd)) < ((8'hb7) ? (8'haa) : (8'haf))) << (((8'hb9) ? (8'ha5) : (8'ha2)) ? ((8'hae) || (8'ha7)) : (^(7'h42)))) ? ((8'hb5) ? {{(8'hbd), (8'hb1)}, (^(8'hb0))} : (-(&(8'h9c)))) : ((&((8'hb7) ? (8'ha9) : (8'ha9))) ^~ (((8'hb5) ? (8'had) : (8'hbc)) ? ((8'haf) ? (8'h9e) : (8'hbc)) : ((8'ha9) ~^ (7'h42))))) - ((8'had) ? (|{(|(8'hbb))}) : ((((8'hbf) ? (8'hb9) : (8'h9c)) ? ((8'hb6) ? (8'ha0) : (8'hae)) : (|(7'h40))) ? (~^(!(8'h9e))) : (((8'ha5) ? (7'h44) : (8'hab)) || (~|(8'hba)))))))
(y, clk, wire70, wire69, wire68, wire67, wire66);
  output wire [(32'h1f4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire70;
  input wire signed [(4'hd):(1'h0)] wire69;
  input wire signed [(3'h6):(1'h0)] wire68;
  input wire signed [(5'h11):(1'h0)] wire67;
  input wire [(4'hf):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire93;
  wire signed [(3'h6):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(4'hf):(1'h0)] wire89;
  wire [(3'h6):(1'h0)] wire88;
  wire [(4'h9):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(3'h4):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(4'h9):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire71;
  reg signed [(5'h10):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg109 = (1'h0);
  reg [(4'he):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(3'h6):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'hb):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  assign y = {wire113,
                 wire98,
                 wire93,
                 wire92,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
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
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg91,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 (1'h0)};
  assign wire71 = (|$unsigned(wire66));
  assign wire72 = ((8'hb9) ?
                      $unsigned(($unsigned($signed(wire71)) ?
                          (((7'h42) ? wire68 : wire66) ?
                              wire69[(1'h0):(1'h0)] : (8'hb1)) : ($signed((8'hb6)) ?
                              $signed(wire67) : (wire67 ?
                                  wire69 : (8'ha6))))) : (^$signed((wire70 | wire68[(2'h2):(2'h2)]))));
  assign wire73 = wire68[(3'h5):(3'h4)];
  assign wire74 = $unsigned(wire71[(3'h6):(1'h0)]);
  assign wire75 = (wire69 ? {wire70} : (~^$unsigned(wire68)));
  assign wire76 = (wire69 ?
                      (^~$signed(($signed(wire75) <<< wire68[(2'h3):(1'h0)]))) : {wire72[(2'h3):(1'h0)]});
  assign wire77 = wire74[(3'h4):(3'h4)];
  assign wire78 = wire77;
  always
    @(posedge clk) begin
      reg79 <= ($signed(wire72) ?
          (~&$unsigned(wire73[(5'h11):(2'h3)])) : $unsigned($signed($unsigned((wire77 ?
              wire71 : (8'ha0))))));
      if (wire68)
        begin
          reg80 <= (~((wire68[(1'h0):(1'h0)] > ((^wire77) <= wire72[(3'h4):(1'h0)])) || wire72));
          reg81 <= $unsigned(wire71[(4'hd):(4'h9)]);
          reg82 <= ({wire68[(3'h5):(3'h5)]} << $unsigned({(~^reg80[(1'h0):(1'h0)]),
              $signed((^~wire72))}));
          reg83 <= $unsigned($signed($signed((|$unsigned(reg80)))));
        end
      else
        begin
          reg80 <= wire72[(3'h5):(2'h2)];
          if (reg79)
            begin
              reg81 <= $signed($unsigned((((wire73 || wire73) ?
                      (wire77 ? reg82 : wire73) : $unsigned((8'hb8))) ?
                  $unsigned((^~wire75)) : (&(~&wire67)))));
            end
          else
            begin
              reg81 <= wire67;
              reg82 <= $signed(wire74);
              reg83 <= (((($unsigned((7'h40)) ?
                      wire72[(3'h4):(2'h3)] : $unsigned(reg79)) ^~ $unsigned((&wire78))) >>> $signed(((wire73 ?
                      wire74 : wire69) <<< wire75[(1'h1):(1'h1)]))) ?
                  ($signed((8'hbe)) ^~ wire66[(4'he):(4'hb)]) : reg80[(3'h6):(1'h0)]);
              reg84 <= $unsigned(($unsigned(wire68[(2'h2):(2'h2)]) ?
                  (!$unsigned((~^wire75))) : $signed($signed($unsigned(wire77)))));
              reg85 <= (^(|({$signed(reg84)} ? wire74 : reg79[(2'h2):(1'h1)])));
            end
          reg86 <= wire78;
        end
    end
  assign wire87 = (8'hb6);
  assign wire88 = {($unsigned((reg83[(4'hf):(4'hb)] && $signed(reg86))) ?
                          ((|(reg83 ? reg83 : wire77)) ?
                              ((reg82 ?
                                  wire68 : wire67) >= $unsigned(wire75)) : ($unsigned(reg79) ?
                                  {reg82,
                                      (8'hb8)} : $signed((8'hb4)))) : wire68[(1'h1):(1'h1)]),
                      ((!$signed(wire73[(4'h8):(2'h2)])) ?
                          (~({reg80, (8'ha9)} ?
                              ((8'hbe) >= wire75) : (~|wire75))) : $signed(({reg85} ^~ wire76[(4'hd):(4'ha)])))};
  assign wire89 = ($signed((8'hbb)) ?
                      $signed($signed((-((8'hb6) + (8'h9f))))) : ((^$unsigned(wire76[(3'h6):(1'h0)])) ?
                          ((^~((7'h42) ? wire74 : reg81)) ?
                              $unsigned(wire67[(4'h8):(3'h6)]) : $signed(reg80)) : wire69[(4'hd):(4'hc)]));
  assign wire90 = (~|$unsigned({$signed((wire70 ? reg83 : reg86))}));
  always
    @(posedge clk) begin
      reg91 <= ($signed((~&$signed({wire74}))) ?
          (8'hab) : $unsigned($unsigned($signed((wire68 <= (8'ha8))))));
    end
  assign wire92 = {(-wire90[(4'h9):(2'h2)])};
  assign wire93 = $signed($unsigned((^~{(reg85 ? reg86 : wire77),
                      (reg91 ? (8'ha9) : wire87)})));
  always
    @(posedge clk) begin
      reg94 <= wire74;
      reg95 <= reg94;
      reg96 <= reg80;
      reg97 <= (($signed((wire87[(2'h2):(2'h2)] && wire87[(2'h2):(1'h0)])) ?
          ((~|$unsigned(wire76)) != reg79[(1'h0):(1'h0)]) : $signed(((wire68 && wire76) + {wire90}))) <= wire88);
    end
  assign wire98 = $unsigned($signed({$signed($unsigned(reg81))}));
  always
    @(posedge clk) begin
      if ((reg84 | $unsigned($signed(wire78))))
        begin
          reg99 <= wire90;
        end
      else
        begin
          if ({$unsigned(wire71), wire87})
            begin
              reg99 <= $unsigned(wire77);
              reg100 <= (wire88[(1'h0):(1'h0)] >> $signed(reg86[(3'h7):(3'h7)]));
            end
          else
            begin
              reg99 <= ($signed($unsigned(($signed(wire90) ?
                      (reg79 <= wire72) : ((8'h9f) ? reg80 : reg96)))) ?
                  $unsigned((-$unsigned((&reg81)))) : $signed(reg96));
              reg100 <= $signed($signed($unsigned((reg80[(3'h5):(2'h2)] <<< wire75))));
              reg101 <= $signed(wire75);
            end
          if ($unsigned((((^~reg85) ~^ $unsigned($unsigned((8'hb8)))) ?
              reg96 : reg97)))
            begin
              reg102 <= ((reg79 && {(^~(wire72 ? (8'h9d) : wire68)),
                      ((wire77 <<< wire69) && wire87)}) ?
                  reg97 : ((reg83[(1'h0):(1'h0)] ^~ (reg101 >> (+reg83))) - ($signed($unsigned(wire75)) ?
                      reg94[(3'h4):(1'h1)] : ($signed((8'hba)) ?
                          $unsigned(reg94) : reg101))));
              reg103 <= (wire72[(3'h4):(1'h0)] ?
                  (!wire75[(2'h3):(2'h3)]) : ($unsigned(reg86[(3'h6):(3'h5)]) ?
                      $signed((wire66 ?
                          $signed(wire69) : (reg80 <<< wire73))) : (8'ha6)));
              reg104 <= wire77;
              reg105 <= reg81[(1'h0):(1'h0)];
              reg106 <= $signed((~&$unsigned($unsigned((~&wire88)))));
            end
          else
            begin
              reg102 <= (8'ha3);
              reg103 <= ($signed((^~($signed((8'ha4)) != reg82[(4'h8):(3'h4)]))) >> (^~($signed(wire74) == $signed($signed(reg91)))));
              reg104 <= reg101[(2'h2):(1'h0)];
              reg105 <= ($signed((^~(wire87[(4'h9):(3'h7)] ?
                      (&reg100) : {wire93, (8'hb2)}))) ?
                  (!$signed((|(reg91 ?
                      (8'ha5) : reg106)))) : ((~^$unsigned((wire76 ?
                      reg100 : reg94))) - $signed((((7'h40) ? reg86 : (8'hab)) ?
                      (reg96 ? wire72 : (8'hbc)) : (!wire93)))));
              reg106 <= (~&reg91[(3'h4):(2'h2)]);
            end
          reg107 <= (~|($signed($signed((|wire93))) * (8'ha5)));
          reg108 <= reg105;
          reg109 <= $unsigned((+$unsigned((reg108 ^ {(8'h9e)}))));
        end
    end
  always
    @(posedge clk) begin
      reg110 <= reg91[(3'h4):(2'h2)];
      reg111 <= reg109[(1'h0):(1'h0)];
      reg112 <= (^~(reg95 ?
          $unsigned($signed({wire78, reg91})) : {((!wire92) << wire98)}));
    end
  assign wire113 = reg83[(2'h3):(2'h3)];
endmodule

module module34
#(parameter param58 = (~^((8'hbc) != (&(~|((8'haf) ? (8'hae) : (8'h9d)))))), 
parameter param59 = (!param58))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire39;
  input wire signed [(2'h3):(1'h0)] wire38;
  input wire [(4'h9):(1'h0)] wire37;
  input wire [(3'h6):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire signed [(4'h9):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire40;
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire46,
                 wire42,
                 wire41,
                 wire40,
                 reg50,
                 reg49,
                 reg48,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire40 = $signed((~|wire39[(3'h7):(1'h0)]));
  assign wire41 = (!$signed({((wire39 ? wire36 : wire37) ?
                          (~wire38) : {wire36, wire38})}));
  assign wire42 = ((~wire38) ?
                      wire37[(3'h4):(2'h3)] : {{(wire35[(3'h5):(3'h4)] | (wire36 ~^ wire40)),
                              $signed(wire37)}});
  always
    @(posedge clk) begin
      reg43 <= wire36;
      reg44 <= wire40[(4'hf):(4'ha)];
      reg45 <= wire40;
    end
  assign wire46 = {$signed(reg43),
                      ($signed($signed((wire42 ?
                          wire40 : wire39))) > (&(~^wire41[(4'h9):(1'h1)])))};
  assign wire47 = wire35[(4'hd):(4'ha)];
  always
    @(posedge clk) begin
      reg48 <= wire42;
      if (wire40[(4'h8):(2'h2)])
        begin
          reg49 <= (~|wire39);
        end
      else
        begin
          reg49 <= reg43[(4'hd):(4'hb)];
          reg50 <= $signed($signed($unsigned((wire37[(1'h0):(1'h0)] ^~ $unsigned(wire36)))));
        end
    end
  assign wire51 = $signed(($unsigned((~^{reg48})) ?
                      {(^~(wire35 ~^ wire47))} : (~(~&(|reg44)))));
  assign wire52 = $unsigned(wire47[(3'h6):(2'h3)]);
  assign wire53 = $unsigned(($unsigned($unsigned($signed(wire42))) < {reg45[(5'h12):(4'hb)],
                      $unsigned($unsigned(wire39))}));
  assign wire54 = (|$unsigned(wire39));
  assign wire55 = $signed(((~|({wire38} ? wire47[(1'h0):(1'h0)] : {wire39})) ?
                      $unsigned((|$signed(wire39))) : wire54[(1'h0):(1'h0)]));
  assign wire56 = $unsigned($unsigned(wire36));
  assign wire57 = (&(^($signed($unsigned(wire46)) != ((^wire51) ~^ (^wire42)))));
endmodule
