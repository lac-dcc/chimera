module top
#(parameter param209 = ({(^(((8'hb3) * (8'hbe)) ? {(8'hae), (8'hb3)} : (&(7'h43)))), {(^((8'hbd) <= (8'hab))), ({(8'ha1), (8'hb8)} * (!(8'h9e)))}} ? ((~|(((8'hb1) ? (8'hba) : (8'hb3)) ? ((8'had) ? (8'hb7) : (8'hba)) : (^~(8'h9d)))) ? ((((8'had) ? (8'hac) : (8'haf)) > (!(8'ha7))) >> ((8'hb8) ? (^(8'h9f)) : ((8'hb9) ? (8'ha6) : (7'h40)))) : (8'hbe)) : (^({{(8'hb8)}} ? ((~|(8'hb3)) ? (-(8'hb6)) : (!(8'hac))) : {(^(8'hae)), ((8'ha0) != (8'hb1))}))), 
parameter param210 = {(+{{(param209 + param209)}, (param209 ? (param209 || param209) : (param209 ? param209 : param209))}), (((!(param209 >> param209)) * {(param209 ? param209 : param209)}) ? param209 : ((^~param209) ? param209 : (~param209)))})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire207;
  wire signed [(5'h14):(1'h0)] wire141;
  wire [(3'h4):(1'h0)] wire137;
  wire [(5'h14):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(4'hc):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire113;
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg140 = (1'h0);
  assign y = {wire207,
                 wire141,
                 wire137,
                 wire135,
                 wire115,
                 wire4,
                 wire5,
                 wire113,
                 reg138,
                 reg139,
                 reg140,
                 (1'h0)};
  assign wire4 = $unsigned(wire1);
  assign wire5 = (8'hb0);
  module6 #() modinst114 (.y(wire113), .wire11(wire1), .wire9(wire5), .wire8(wire4), .clk(clk), .wire10(wire3), .wire7(wire2));
  assign wire115 = wire2;
  module116 #() modinst136 (.wire120(wire2), .y(wire135), .wire117(wire113), .clk(clk), .wire118(wire0), .wire119(wire4));
  assign wire137 = (8'hbe);
  always
    @(posedge clk) begin
      reg138 <= $signed(({$unsigned(wire115[(1'h0):(1'h0)]),
              ((^~(7'h44)) ? wire2 : $unsigned(wire2))} ?
          (((wire0 < wire137) ?
              (wire137 <<< wire135) : $signed(wire0)) && (wire1 ^ $unsigned(wire115))) : (((wire5 * wire0) ?
                  $unsigned(wire113) : (~&wire113)) ?
              (~|$unsigned(wire2)) : ((!wire0) || wire137))));
      reg139 <= ($unsigned(wire0[(3'h4):(2'h3)]) == (^{$unsigned(wire1[(1'h0):(1'h0)]),
          {$signed(wire1)}}));
      reg140 <= (wire2[(3'h4):(1'h0)] ~^ (-((-wire0[(4'h8):(2'h2)]) + (wire115[(2'h2):(2'h2)] ?
          $signed((8'ha7)) : $unsigned(wire5)))));
    end
  assign wire141 = (7'h44);
  module142 #() modinst208 (.wire144(wire3), .wire147(wire141), .y(wire207), .clk(clk), .wire145(reg139), .wire143(wire1), .wire146(wire5));
endmodule

module module142  (y, clk, wire143, wire144, wire145, wire146, wire147);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire143;
  input wire [(5'h12):(1'h0)] wire144;
  input wire [(3'h6):(1'h0)] wire145;
  input wire signed [(4'he):(1'h0)] wire146;
  input wire [(4'he):(1'h0)] wire147;
  wire signed [(3'h4):(1'h0)] wire206;
  wire signed [(4'h9):(1'h0)] wire205;
  wire [(5'h13):(1'h0)] wire204;
  wire [(5'h11):(1'h0)] wire148;
  wire [(5'h15):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire150;
  wire [(2'h3):(1'h0)] wire183;
  wire signed [(5'h10):(1'h0)] wire202;
  reg [(5'h13):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg162 = (1'h0);
  reg [(5'h11):(1'h0)] reg161 = (1'h0);
  reg [(5'h14):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg159 = (1'h0);
  reg signed [(4'he):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(5'h14):(1'h0)] reg155 = (1'h0);
  reg [(5'h12):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg152 = (1'h0);
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  assign y = {wire206,
                 wire205,
                 wire204,
                 wire148,
                 wire149,
                 wire150,
                 wire183,
                 wire202,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 (1'h0)};
  assign wire148 = (wire145[(1'h0):(1'h0)] ?
                       $signed($unsigned(wire144)) : wire146[(3'h5):(1'h1)]);
  assign wire149 = ((~$signed(wire148)) ?
                       wire147[(4'ha):(1'h1)] : ((wire147 | ($unsigned(wire147) * wire147)) ^~ $unsigned((|(wire147 && wire143)))));
  assign wire150 = $signed((~&wire146[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      if (wire146)
        begin
          if (wire145[(1'h0):(1'h0)])
            begin
              reg151 <= wire150;
              reg152 <= ($signed(wire149[(5'h15):(3'h5)]) ~^ wire143);
              reg153 <= $unsigned(wire149);
              reg154 <= wire146[(3'h6):(3'h6)];
            end
          else
            begin
              reg151 <= wire145;
            end
          if ((reg152 ?
              reg153[(2'h2):(1'h0)] : ((-((^wire143) ?
                  (reg154 >>> reg154) : {reg154,
                      reg153})) - (wire144[(4'ha):(4'h8)] ?
                  (-wire144[(3'h6):(1'h1)]) : $unsigned(wire148)))))
            begin
              reg155 <= ($signed(wire150) ~^ $unsigned(wire147));
            end
          else
            begin
              reg155 <= {wire146[(3'h4):(2'h3)]};
              reg156 <= {{(wire146[(2'h2):(1'h1)] ?
                          ($signed(wire144) - wire144) : $unsigned((reg155 ?
                              reg151 : wire150))),
                      (^reg154[(3'h7):(1'h1)])}};
            end
          reg157 <= ((&(wire147[(1'h0):(1'h0)] ?
              wire143[(2'h2):(1'h0)] : $signed($unsigned(wire150)))) > $unsigned(($signed(reg152) + reg156)));
        end
      else
        begin
          reg151 <= reg153;
          if (((((&$unsigned(wire143)) >= (!$signed((8'hbc)))) == ($signed({wire145,
                  wire149}) ?
              wire144[(3'h7):(1'h0)] : wire150[(1'h1):(1'h0)])) >>> {({wire149[(3'h5):(3'h4)]} ^~ (~&reg157[(3'h4):(3'h4)])),
              $unsigned(reg151[(3'h4):(1'h1)])}))
            begin
              reg152 <= {(wire150[(4'hd):(3'h5)] ?
                      $signed((~&reg154)) : $unsigned(($signed((8'hb8)) || (wire144 & wire147))))};
              reg153 <= reg154[(4'hb):(1'h1)];
            end
          else
            begin
              reg152 <= $unsigned($signed($unsigned(($unsigned(reg157) ?
                  {(8'ha7)} : wire144[(1'h0):(1'h0)]))));
              reg153 <= (+(reg152[(3'h6):(1'h1)] * {reg153,
                  (wire145 * (wire147 < reg156))}));
            end
          if ($unsigned(wire149))
            begin
              reg154 <= reg156;
              reg155 <= ($signed((8'hbb)) <<< reg153[(1'h1):(1'h1)]);
              reg156 <= (reg151 < {$signed(wire149[(5'h12):(3'h5)])});
              reg157 <= (($signed($signed((reg155 ?
                      wire144 : wire146))) * wire150) ?
                  $unsigned(((reg154 ?
                      (reg154 ?
                          wire148 : reg151) : (wire143 >>> wire149)) < ((wire143 * reg154) ^ (reg155 ?
                      (8'hba) : (8'ha9))))) : reg157);
            end
          else
            begin
              reg154 <= reg155[(5'h13):(3'h7)];
              reg155 <= {wire143[(1'h0):(1'h0)],
                  ($signed(wire145[(1'h1):(1'h0)]) != wire147[(4'h8):(3'h6)])};
              reg156 <= reg154[(5'h10):(5'h10)];
              reg157 <= {$unsigned(($signed({reg151}) - reg154))};
              reg158 <= (($signed((~&(~&reg156))) ?
                      $unsigned(($unsigned(wire150) ?
                          wire148[(1'h1):(1'h0)] : (reg152 ?
                              wire148 : wire147))) : reg153[(3'h5):(1'h0)]) ?
                  ($signed((8'hb9)) ^~ reg152) : $signed($signed(((wire144 ?
                          reg151 : reg157) ?
                      (8'hbf) : (reg151 ^ reg155)))));
            end
          reg159 <= wire148[(4'h8):(3'h5)];
        end
      reg160 <= $signed(wire150);
      reg161 <= reg153[(1'h1):(1'h0)];
      reg162 <= reg160;
      reg163 <= (reg155 ^~ ((({wire143, reg161} <= {wire149, wire144}) ?
          wire150[(5'h11):(3'h5)] : (~&wire149[(3'h4):(2'h3)])) & (&(&(wire147 ?
          (7'h40) : wire146)))));
    end
  module164 #() modinst184 (.wire165(wire144), .wire166(reg153), .y(wire183), .wire168(wire147), .clk(clk), .wire167(reg157));
  module185 #() modinst203 (.clk(clk), .wire187(reg159), .wire189(wire146), .wire186(reg158), .y(wire202), .wire190(reg152), .wire188(reg162));
  assign wire204 = wire145;
  assign wire205 = (~|$unsigned((reg160[(4'he):(3'h7)] ?
                       $unsigned($signed(wire147)) : $signed($signed(wire149)))));
  assign wire206 = reg162[(4'hb):(3'h5)];
endmodule

module module116
#(parameter param134 = {{(({(8'had)} ? (&(8'h9c)) : (+(8'hb5))) ? {(~&(8'hbd)), ((8'ha0) ? (8'h9f) : (7'h42))} : (((8'hb9) ? (8'had) : (8'hb7)) ? ((7'h43) == (8'hbe)) : (~|(8'hb4)))), ({(|(8'ha3)), (~^(8'hac))} ? (~^(!(8'ha7))) : (~^((8'hae) ? (8'hac) : (8'ha2))))}, ((((~(8'hb2)) ? ((8'hab) ? (8'hb1) : (7'h42)) : (8'hac)) & {((8'hb3) > (8'hb4)), (8'hb7)}) ? (((~&(8'ha2)) ? ((7'h41) ~^ (8'ha3)) : {(8'ha8)}) >> (((8'ha7) | (7'h41)) ? ((8'h9f) <<< (8'ha6)) : ((8'ha6) | (8'hb6)))) : {(((8'had) << (8'hac)) ? ((8'hbb) << (8'hbb)) : (!(7'h40)))})})
(y, clk, wire120, wire119, wire118, wire117);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire120;
  input wire signed [(2'h2):(1'h0)] wire119;
  input wire [(4'hc):(1'h0)] wire118;
  input wire [(2'h2):(1'h0)] wire117;
  wire signed [(4'ha):(1'h0)] wire133;
  wire [(3'h7):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire131;
  wire [(5'h14):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire129;
  wire signed [(4'ha):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg [(4'h8):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(4'hb):(1'h0)] reg125 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg124 = (1'h0);
  assign y = {wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire123,
                 wire122,
                 wire121,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire121 = $unsigned({$signed((!wire117)), wire118});
  assign wire122 = wire121;
  assign wire123 = ((wire118 < (^~({wire119, wire122} ?
                           wire122[(4'ha):(3'h6)] : (wire122 ?
                               wire120 : wire118)))) ?
                       (~&((8'ha6) <<< (^$signed((8'ha1))))) : wire121);
  always
    @(posedge clk) begin
      reg124 <= ($unsigned($signed(wire123[(1'h1):(1'h1)])) ?
          wire120[(4'ha):(1'h0)] : ((~&($signed(wire117) <<< (wire118 * wire119))) != wire123));
      reg125 <= wire120;
      reg126 <= $signed($unsigned($signed((~^(wire118 ? reg125 : reg124)))));
      reg127 <= $signed(($signed((wire118[(4'h9):(1'h0)] > wire120[(4'h9):(3'h6)])) ?
          (((|(8'ha5)) ?
              (wire123 << wire120) : reg125) >>> wire119) : $unsigned(wire122)));
      reg128 <= (!$signed(wire123));
    end
  assign wire129 = $unsigned($unsigned((reg126 ?
                       (|(~^wire119)) : wire123[(2'h2):(2'h2)])));
  assign wire130 = wire119[(1'h1):(1'h1)];
  assign wire131 = (wire119 == $signed(((reg126[(1'h1):(1'h0)] ?
                           wire117 : $signed(wire117)) ?
                       reg128 : wire129[(1'h1):(1'h1)])));
  assign wire132 = (~^(~^{wire123, {(reg127 || (8'haa))}}));
  assign wire133 = {wire129, (wire131 > wire129[(3'h4):(2'h3)])};
endmodule

module module6
#(parameter param111 = {{((!(&(8'hbd))) ? ((|(8'hbf)) ? ((8'hb5) ? (7'h43) : (8'ha4)) : ((8'ha3) ? (8'hb1) : (8'ha6))) : (((7'h40) >> (8'hae)) ? (^(7'h41)) : (^(8'hbb)))), (!(-{(8'ha9), (8'hac)}))}}, 
parameter param112 = ({(param111 ? (~^(param111 ? param111 : param111)) : ((param111 >> param111) ? (~^(8'hac)) : (8'hb6)))} * (~|param111)))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire59;
  wire [(3'h4):(1'h0)] wire109;
  assign y = {wire12, wire57, wire59, wire109, (1'h0)};
  assign wire12 = (wire7 ?
                      $unsigned(($unsigned($unsigned(wire10)) ?
                          wire8[(3'h6):(1'h1)] : (((8'ha3) ?
                                  (8'ha8) : (8'hb1)) ?
                              $unsigned(wire11) : ((8'hb8) - (7'h43))))) : ((|wire11[(3'h7):(2'h3)]) ?
                          (wire10[(4'h9):(2'h2)] ?
                              ($signed((8'hb1)) - (wire7 | wire9)) : wire8) : ((~&(wire8 ?
                                  wire7 : wire10)) ?
                              wire10 : $unsigned(wire10))));
  module13 #() modinst58 (.wire15(wire10), .wire16(wire11), .wire14(wire7), .clk(clk), .y(wire57), .wire17(wire12));
  assign wire59 = $signed((8'haf));
  module60 #() modinst110 (wire109, clk, wire57, wire7, wire12, wire11, wire9);
endmodule

module module60
#(parameter param107 = ((~^{(((8'haf) < (8'hb2)) <= ((7'h44) ^ (8'hb0)))}) ? ((8'hb4) ? {({(8'hb0), (8'hb7)} ? {(8'hbb), (8'hbf)} : {(8'hbd), (8'h9d)}), ((~(8'had)) * (~|(8'hb8)))} : (^((~&(8'ha0)) >> (~&(8'hb0))))) : {(^{((8'ha7) ? (8'hbc) : (8'h9f)), ((8'hb2) ~^ (8'h9f))}), ((&((8'ha0) ? (8'ha6) : (8'ha2))) ? (~|((8'hab) ? (8'ha6) : (8'hbc))) : (((8'ha4) - (7'h43)) ? ((8'ha1) ? (8'ha5) : (8'ha1)) : ((8'ha7) != (8'ha3))))}), 
parameter param108 = param107)
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'h1c5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire64;
  input wire [(4'ha):(1'h0)] wire63;
  input wire [(3'h7):(1'h0)] wire62;
  input wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire106;
  wire signed [(5'h14):(1'h0)] wire105;
  wire signed [(2'h3):(1'h0)] wire104;
  wire [(3'h7):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire [(4'hf):(1'h0)] wire101;
  wire [(2'h3):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire signed [(4'hc):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  reg [(3'h4):(1'h0)] reg100 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(5'h12):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg [(4'h9):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire97,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 reg100,
                 reg99,
                 reg98,
                 reg96,
                 reg95,
                 reg94,
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
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire66 = (+(&$unsigned($signed($unsigned(wire64)))));
  assign wire67 = (+{(((!wire64) ^~ $signed((8'ha5))) != wire64),
                      $unsigned($signed($signed(wire66)))});
  assign wire68 = $signed((~(~&(-(wire63 ? wire63 : wire63)))));
  assign wire69 = (~|((-wire67) ?
                      ({wire64[(1'h1):(1'h0)]} ?
                          wire61[(3'h6):(1'h1)] : (wire65[(2'h2):(1'h1)] || wire63[(2'h3):(2'h2)])) : (wire67[(3'h4):(3'h4)] ?
                          ($unsigned(wire68) * (wire68 ?
                              wire61 : (8'hae))) : $signed(wire61[(4'h8):(3'h5)]))));
  assign wire70 = $signed((((^~(wire67 <= wire69)) ? wire63 : (~&(|wire64))) ?
                      $unsigned(wire62) : $signed((wire63 * (wire63 ?
                          (7'h40) : (8'had))))));
  assign wire71 = wire70[(4'ha):(3'h7)];
  assign wire72 = $signed($unsigned(((~|wire69[(1'h0):(1'h0)]) ?
                      $unsigned({(7'h42),
                          wire67}) : $signed($signed(wire61)))));
  always
    @(posedge clk) begin
      reg73 <= {(wire70 ?
              $unsigned(wire62[(3'h7):(3'h6)]) : $unsigned((^~(8'hb5)))),
          $unsigned(wire69)};
      reg74 <= (8'hbd);
    end
  always
    @(posedge clk) begin
      if ((+wire61[(2'h3):(1'h0)]))
        begin
          reg75 <= reg74[(2'h3):(1'h1)];
          reg76 <= $signed((~((~|{wire68}) ?
              ($signed(wire63) <= reg73[(4'h8):(1'h1)]) : (~^(wire69 ?
                  wire65 : reg73)))));
          if ((+($unsigned(wire63) ?
              $signed((8'had)) : $signed($unsigned($signed(wire69))))))
            begin
              reg77 <= (~((|wire62[(3'h4):(1'h0)]) ?
                  (($signed(wire65) > (reg74 ^ (8'ha8))) ?
                      wire62 : (wire63[(4'h9):(3'h4)] ?
                          $unsigned(wire65) : reg73[(3'h5):(1'h0)])) : (reg73 ?
                      ($signed(wire61) ?
                          $signed(wire62) : $signed(wire64)) : $unsigned({wire64}))));
              reg78 <= (^~({wire63[(2'h3):(2'h2)]} > wire62));
              reg79 <= ((8'ha3) ? wire70 : reg73[(4'hc):(3'h4)]);
              reg80 <= ((wire71 && reg78[(1'h1):(1'h1)]) ?
                  $unsigned($signed($unsigned((~(8'ha4))))) : $unsigned((-$signed($unsigned(wire67)))));
            end
          else
            begin
              reg77 <= {(-{$unsigned({wire70, wire70})})};
              reg78 <= $signed((|(~&((reg79 == reg78) - ((8'hbe) ?
                  wire71 : wire66)))));
              reg79 <= (~{$unsigned(wire61), (~wire69[(1'h1):(1'h1)])});
              reg80 <= $unsigned(((reg75[(3'h7):(1'h0)] ?
                  reg79[(1'h1):(1'h0)] : ((wire63 ^~ wire69) & {wire71})) && wire64));
              reg81 <= $signed($unsigned($signed((~wire69[(1'h1):(1'h1)]))));
            end
        end
      else
        begin
          reg75 <= $signed((((8'hb6) ?
                  (~^$unsigned(wire66)) : (^$signed(wire62))) ?
              $unsigned($signed($signed(reg74))) : ({(reg74 || reg77),
                  (-reg76)} || (|$unsigned(wire70)))));
          reg76 <= $unsigned($unsigned($signed($signed($unsigned(reg81)))));
          reg77 <= $unsigned((|({(reg76 ^ wire64)} ?
              (wire63 >>> {reg75}) : $signed($signed(wire71)))));
          reg78 <= wire62[(3'h4):(1'h1)];
        end
      if ($signed(reg77))
        begin
          reg82 <= (reg81[(3'h7):(3'h5)] ?
              (reg74 ?
                  $unsigned(wire64[(4'h9):(3'h7)]) : (&wire62)) : ($signed((8'ha5)) ?
                  wire71[(4'hb):(3'h5)] : reg76));
          reg83 <= wire69[(2'h3):(2'h2)];
          if ($unsigned(reg80))
            begin
              reg84 <= wire61;
              reg85 <= (((!($signed(wire67) ?
                  (wire69 == reg80) : wire66[(3'h6):(2'h3)])) - reg83[(5'h10):(4'hf)]) || (~|reg81));
              reg86 <= ({(((reg80 - (8'had)) ?
                      reg78 : wire62) - reg84[(3'h6):(3'h6)]),
                  reg77} != ({(wire64[(2'h3):(2'h3)] ?
                      reg83[(1'h0):(1'h0)] : wire67),
                  reg75[(4'he):(1'h1)]} >>> $unsigned((|reg78))));
              reg87 <= wire66[(3'h4):(2'h2)];
              reg88 <= $signed(wire72[(3'h6):(3'h4)]);
            end
          else
            begin
              reg84 <= reg80[(4'hb):(2'h2)];
              reg85 <= wire70[(4'ha):(1'h0)];
              reg86 <= $unsigned((|$signed(reg84[(4'hd):(2'h3)])));
            end
        end
      else
        begin
          reg82 <= wire62;
          if (wire66)
            begin
              reg83 <= ($unsigned($unsigned(reg77)) ?
                  (((|$unsigned(wire62)) >= (!$unsigned(reg74))) == reg88[(4'h9):(1'h1)]) : {$signed((|reg88[(5'h12):(3'h5)])),
                      reg80});
            end
          else
            begin
              reg83 <= (~(reg81[(3'h7):(3'h5)] > ((^(wire64 >>> wire67)) ^ (wire69[(2'h3):(2'h2)] ~^ reg76))));
              reg84 <= wire71;
              reg85 <= {((|$signed({reg85})) ?
                      (((reg78 ? wire66 : reg88) <= $signed((8'h9c))) ?
                          {(reg80 ? reg80 : wire66)} : (((8'hb9) ?
                                  wire72 : (8'haf)) ?
                              $signed(wire65) : wire62[(1'h0):(1'h0)])) : $signed(wire61)),
                  $unsigned($signed(reg88))};
              reg86 <= $unsigned((~|$unsigned(reg86)));
            end
        end
      if ((~|($signed($unsigned((reg88 ? reg85 : wire62))) ?
          {(((7'h44) ? wire69 : reg76) || (~^reg84))} : (((~wire65) ?
                  ((8'h9e) ? wire62 : reg75) : {reg78}) ?
              wire66[(3'h4):(1'h0)] : $unsigned($signed(reg80))))))
        begin
          reg89 <= $unsigned($signed($unsigned((reg84[(4'h9):(1'h0)] == {wire68}))));
        end
      else
        begin
          reg89 <= $unsigned($unsigned($signed((~|$unsigned((8'ha3))))));
          if (($unsigned(((~(wire67 ^~ wire72)) ?
              ((-reg80) ?
                  {wire69} : $unsigned(reg75)) : (!$signed(wire62)))) >>> $signed((reg85[(1'h1):(1'h1)] ?
              $unsigned($unsigned(reg88)) : $signed(reg80)))))
            begin
              reg90 <= (-wire72[(3'h5):(3'h4)]);
              reg91 <= $unsigned((reg88 ?
                  (reg77 & ((reg73 ? reg88 : reg77) ?
                      $unsigned(reg76) : (!wire68))) : $signed(((&wire68) ?
                      wire63 : ((8'ha0) ? wire65 : reg76)))));
              reg92 <= reg76;
              reg93 <= $unsigned((^~(~|{reg89[(4'hb):(4'hb)], reg81})));
            end
          else
            begin
              reg90 <= $signed(($unsigned($unsigned((reg92 ?
                      wire70 : wire70))) ?
                  (|(-$unsigned(reg79))) : reg85));
              reg91 <= wire70;
              reg92 <= (reg74 < (^~($unsigned((wire69 ? wire65 : reg85)) ?
                  ($unsigned(reg90) ?
                      $unsigned(wire66) : $signed(reg85)) : reg92)));
              reg93 <= $signed({$unsigned($unsigned(wire66[(3'h5):(3'h4)]))});
            end
          reg94 <= (reg81[(2'h3):(2'h3)] ?
              $signed($signed(reg90[(3'h4):(3'h4)])) : reg80[(3'h7):(1'h0)]);
          reg95 <= reg80[(4'hc):(4'hb)];
        end
      reg96 <= ($signed((~&((~|reg92) ?
              ((8'hb3) ? reg76 : reg83) : {reg87, reg94}))) ?
          {(^(~&reg73)), $signed($unsigned((+reg89)))} : wire72[(1'h1):(1'h0)]);
    end
  assign wire97 = $unsigned(wire69[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      if ($unsigned((!reg75)))
        begin
          reg98 <= (+wire97[(1'h1):(1'h0)]);
          reg99 <= wire61;
        end
      else
        begin
          reg98 <= (($unsigned($unsigned((|wire63))) ?
              ((+reg85[(1'h1):(1'h0)]) << $unsigned($unsigned(reg78))) : wire66) ^ wire63[(4'h8):(1'h0)]);
          reg99 <= (8'hb2);
          reg100 <= ({(~$signed({reg98,
                  wire66}))} ^~ $signed(($unsigned((reg84 * wire66)) ?
              $unsigned((~|wire63)) : ({reg74, reg89} ?
                  wire70[(3'h5):(2'h2)] : (reg74 ? wire62 : wire71)))));
        end
    end
  assign wire101 = (+wire63);
  assign wire102 = ($unsigned(reg86[(3'h6):(1'h1)]) == $signed((+((reg79 ?
                           wire72 : (7'h42)) ?
                       $signed(reg79) : reg80[(3'h7):(1'h1)]))));
  assign wire103 = $signed($unsigned($signed($unsigned(reg85))));
  assign wire104 = $unsigned({reg99[(2'h2):(2'h2)]});
  assign wire105 = ((-wire72) >> ($unsigned(((reg79 ? wire65 : wire104) ?
                           reg92[(2'h2):(1'h1)] : ((8'hbb) <<< reg83))) ?
                       ($signed({wire97}) + $signed(reg87)) : ((&(|wire62)) >>> (~wire70))));
  assign wire106 = $unsigned($signed($unsigned($signed({(8'ha2), wire69}))));
endmodule

module module13  (y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h1a2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire17;
  input wire signed [(5'h11):(1'h0)] wire16;
  input wire [(5'h11):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire signed [(4'hb):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(5'h14):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
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
                 (1'h0)};
  assign wire18 = (((^~$unsigned({wire16})) ?
                          ((wire14 ?
                                  (wire17 ?
                                      wire14 : wire14) : (wire15 != wire17)) ?
                              $unsigned((wire14 >> wire16)) : {(wire15 ^ wire17),
                                  wire17}) : wire14[(2'h2):(1'h0)]) ?
                      wire15[(4'h9):(3'h6)] : ({wire16[(4'hf):(4'he)]} > wire17[(3'h6):(3'h4)]));
  assign wire19 = $unsigned((wire16 ^ $unsigned({wire17, $unsigned(wire15)})));
  assign wire20 = $signed(($signed(wire17) >= (^{(~|wire14),
                      $unsigned((8'h9f))})));
  assign wire21 = wire16;
  assign wire22 = ((~((-(~wire17)) ?
                          ((wire21 ?
                              wire21 : (8'haf)) >> (!wire18)) : {$signed((8'hb3)),
                              (wire16 ? wire20 : wire15)})) ?
                      wire14[(2'h3):(2'h2)] : $signed(((wire20[(3'h7):(3'h6)] ?
                              wire16[(4'h8):(3'h7)] : $signed(wire19)) ?
                          wire21 : ((~|wire14) > wire21[(4'h9):(2'h3)]))));
  assign wire23 = $signed($signed((^wire21[(5'h12):(4'ha)])));
  assign wire24 = wire19[(5'h13):(1'h1)];
  assign wire25 = {wire16};
  always
    @(posedge clk) begin
      reg26 <= (8'ha8);
      if ($unsigned(wire16))
        begin
          reg27 <= ((8'hbc) ~^ (wire25[(4'h8):(1'h1)] ?
              {((wire22 * (8'ha5)) ?
                      (+wire21) : $unsigned(wire21))} : wire18[(2'h2):(2'h2)]));
        end
      else
        begin
          if ({({wire23[(1'h0):(1'h0)]} == (!(8'ha5))),
              (+((~$unsigned(reg27)) ?
                  $signed((wire22 | wire20)) : ((^~(8'hb5)) ^~ $signed(wire24))))})
            begin
              reg27 <= $unsigned((8'hb1));
              reg28 <= $signed($unsigned({$signed($unsigned(wire17))}));
              reg29 <= (^$unsigned((wire14 >> $unsigned($signed((8'hbc))))));
              reg30 <= ($signed(reg27) ?
                  reg29 : $unsigned((wire15 ? wire17[(3'h5):(3'h5)] : wire25)));
              reg31 <= reg28;
            end
          else
            begin
              reg27 <= ((~&$signed((-$unsigned(wire20)))) > reg30[(1'h1):(1'h1)]);
              reg28 <= $signed(((~(8'hb1)) | (((wire25 & wire22) != $unsigned(wire25)) >= (wire19 ?
                  wire23[(1'h0):(1'h0)] : wire20[(2'h3):(2'h2)]))));
              reg29 <= wire16[(3'h6):(1'h0)];
            end
          reg32 <= wire19[(4'h9):(4'h8)];
          reg33 <= reg28[(4'h9):(2'h2)];
          if (($signed((reg32 ?
              (8'hb5) : (!$signed(wire25)))) & ($unsigned(reg26[(2'h2):(1'h0)]) ?
              $unsigned((((8'ha2) ?
                  (8'ha7) : (8'h9d)) ^~ (~&reg29))) : $unsigned(($signed(wire20) | reg32)))))
            begin
              reg34 <= (reg28[(5'h10):(1'h0)] || $unsigned($signed({(wire15 != (8'ha0)),
                  (wire17 ? reg31 : wire20)})));
              reg35 <= reg30;
            end
          else
            begin
              reg34 <= ($signed(reg34) ?
                  ($signed((reg33 ? $unsigned(reg27) : {wire20})) ?
                      $signed((8'ha9)) : ($unsigned(reg27) ?
                          (^~$signed(wire16)) : (^~$unsigned((8'hb1))))) : wire16[(4'he):(1'h1)]);
              reg35 <= (($signed({wire17, $signed((8'hae))}) <= {({wire14,
                          wire24} ?
                      reg28 : $signed(reg33))}) * {(((wire15 || wire21) >>> (reg34 ?
                      (8'ha7) : (8'hb8))) ^~ wire19[(5'h13):(4'h9)]),
                  (&{(~^reg34), reg32[(4'ha):(3'h6)]})});
            end
          reg36 <= $unsigned(wire16);
        end
      if ($unsigned((wire19[(5'h10):(4'he)] ?
          reg32[(4'h8):(4'h8)] : (-((reg34 ? reg35 : wire19) ?
              (reg29 >> wire14) : $signed(wire20))))))
        begin
          if ($unsigned((&($unsigned((&reg28)) ?
              (wire15[(4'hd):(1'h0)] ?
                  wire22[(4'h9):(2'h2)] : (reg34 ?
                      (8'hae) : reg36)) : $unsigned((wire19 ?
                  reg28 : reg26))))))
            begin
              reg37 <= reg35[(3'h6):(3'h4)];
            end
          else
            begin
              reg37 <= $unsigned($signed(reg33));
              reg38 <= wire20[(4'h8):(3'h6)];
              reg39 <= (^~(wire19 >= {{{wire23, reg36}, $signed((8'ha5))}}));
              reg40 <= wire19[(4'he):(1'h0)];
              reg41 <= $unsigned(wire17);
            end
          reg42 <= $signed($unsigned($unsigned(reg35)));
          reg43 <= reg42[(2'h2):(1'h1)];
        end
      else
        begin
          reg37 <= {($signed(wire15) ^~ $signed((^wire18[(1'h1):(1'h0)])))};
        end
      reg44 <= $unsigned(($unsigned(reg34) >>> $unsigned(reg30)));
    end
  assign wire45 = wire17;
  assign wire46 = wire15[(4'hc):(4'hc)];
  assign wire47 = $unsigned((^~(reg31 <<< reg33)));
  assign wire48 = $unsigned(wire25[(4'h8):(2'h3)]);
  assign wire49 = (-(((!{wire15}) ?
                          $unsigned({(8'hb3)}) : $unsigned((!wire17))) ?
                      ((reg42 == (+reg28)) ?
                          (&(-wire47)) : $unsigned($signed(reg28))) : {reg28[(3'h6):(1'h0)],
                          ((reg39 >= reg37) ~^ ((7'h43) << wire15))}));
  assign wire50 = $signed($signed(reg38));
  assign wire51 = wire50[(2'h2):(2'h2)];
  assign wire52 = {wire51[(2'h2):(2'h2)], (&{(!$signed(wire23)), wire14})};
  assign wire53 = wire45[(1'h0):(1'h0)];
  assign wire54 = ((8'hb2) ?
                      ((~^reg26) ?
                          reg42 : ($signed((~wire46)) ?
                              $unsigned(wire18[(2'h2):(2'h2)]) : (((8'hab) > reg39) ?
                                  (-reg37) : $unsigned(reg30)))) : $unsigned(reg37[(5'h12):(3'h4)]));
  assign wire55 = wire50[(4'h9):(2'h3)];
  assign wire56 = reg27[(1'h1):(1'h1)];
endmodule

module module185
#(parameter param201 = (|(|(8'hb7))))
(y, clk, wire190, wire189, wire188, wire187, wire186);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire190;
  input wire signed [(4'he):(1'h0)] wire189;
  input wire [(4'h8):(1'h0)] wire188;
  input wire signed [(5'h10):(1'h0)] wire187;
  input wire [(4'hb):(1'h0)] wire186;
  wire [(2'h3):(1'h0)] wire200;
  wire signed [(4'h8):(1'h0)] wire199;
  wire signed [(4'h8):(1'h0)] wire198;
  wire signed [(4'hb):(1'h0)] wire197;
  wire [(4'hf):(1'h0)] wire196;
  wire [(4'h8):(1'h0)] wire195;
  wire [(5'h12):(1'h0)] wire191;
  reg [(3'h7):(1'h0)] reg194 = (1'h0);
  reg [(3'h7):(1'h0)] reg193 = (1'h0);
  reg [(5'h15):(1'h0)] reg192 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire195,
                 wire191,
                 reg194,
                 reg193,
                 reg192,
                 (1'h0)};
  assign wire191 = $unsigned((~wire186));
  always
    @(posedge clk) begin
      reg192 <= wire189[(4'hb):(1'h1)];
      reg193 <= reg192[(4'hc):(4'hb)];
      reg194 <= (wire186 ?
          $unsigned(reg192) : {($signed((wire188 ?
                  wire189 : reg192)) ^~ reg193)});
    end
  assign wire195 = $unsigned((7'h43));
  assign wire196 = {reg194[(3'h7):(3'h5)], (8'had)};
  assign wire197 = reg193[(3'h6):(3'h4)];
  assign wire198 = ((8'ha8) ?
                       wire196[(4'he):(4'ha)] : (-(wire195 ?
                           $unsigned($signed(wire196)) : {wire189})));
  assign wire199 = $signed((^~wire191));
  assign wire200 = (-(($unsigned($unsigned(reg192)) < (~{wire189, wire199})) ?
                       $signed(((wire188 << wire199) ?
                           $signed(wire197) : $signed((8'hb5)))) : (wire190[(4'hf):(2'h2)] ?
                           $unsigned((wire196 ?
                               wire196 : wire191)) : reg192[(3'h4):(2'h3)])));
endmodule

module module164
#(parameter param181 = {{((((8'hb8) << (8'h9d)) ? ((8'hb5) ? (8'hae) : (7'h41)) : (&(8'hba))) - ({(8'hb5)} ? {(8'ha2)} : ((8'hab) ? (8'hb5) : (8'ha7)))), ((((8'hbd) ? (8'h9d) : (7'h44)) ^ (|(7'h40))) && (((8'ha2) > (8'ha3)) <= {(8'hb4)}))}, (~|((|((7'h40) ? (7'h43) : (8'ha4))) ? (((8'ha6) ? (8'ha4) : (8'ha2)) ? ((8'hb1) == (8'hba)) : (!(8'ha4))) : ({(8'ha9)} ^~ ((8'hb9) ~^ (7'h40)))))}, 
parameter param182 = ((({param181} * param181) >= (~|((param181 <= param181) ? (param181 ? param181 : param181) : (-param181)))) ? ((7'h40) ^~ param181) : param181))
(y, clk, wire168, wire167, wire166, wire165);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire168;
  input wire [(4'hd):(1'h0)] wire167;
  input wire [(4'h8):(1'h0)] wire166;
  input wire signed [(5'h12):(1'h0)] wire165;
  wire [(5'h15):(1'h0)] wire177;
  wire signed [(5'h15):(1'h0)] wire176;
  wire [(3'h5):(1'h0)] wire175;
  wire signed [(5'h11):(1'h0)] wire174;
  wire [(2'h2):(1'h0)] wire173;
  wire signed [(5'h10):(1'h0)] wire172;
  wire [(3'h4):(1'h0)] wire171;
  wire signed [(4'h8):(1'h0)] wire170;
  wire [(4'hc):(1'h0)] wire169;
  reg signed [(2'h3):(1'h0)] reg180 = (1'h0);
  reg [(5'h14):(1'h0)] reg179 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg178 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire169,
                 reg180,
                 reg179,
                 reg178,
                 (1'h0)};
  assign wire169 = $unsigned($signed((~&wire165)));
  assign wire170 = wire168[(3'h5):(2'h3)];
  assign wire171 = $unsigned((~&(($signed((8'hbc)) + (wire170 ?
                       wire165 : wire170)) + ({wire167, (7'h43)} ?
                       wire169 : wire169[(2'h3):(1'h0)]))));
  assign wire172 = {(+$signed({wire170, (wire167 ? wire168 : wire166)})),
                       wire165[(2'h2):(1'h0)]};
  assign wire173 = (~^((wire165 >> (wire168[(3'h7):(1'h0)] >> $signed((8'hbc)))) ?
                       $signed(($signed((8'hab)) >>> wire165[(3'h7):(3'h7)])) : $unsigned(({wire166,
                               wire169} ?
                           (~&wire169) : wire165[(4'ha):(4'ha)]))));
  assign wire174 = wire169[(3'h6):(1'h1)];
  assign wire175 = $unsigned((+({(wire166 ? wire172 : wire172), wire169} ?
                       (~(wire173 ?
                           wire167 : (8'ha4))) : wire166[(3'h7):(3'h4)])));
  assign wire176 = ($unsigned((+{(~wire167),
                       wire166})) <= wire175[(1'h0):(1'h0)]);
  assign wire177 = {((&(8'hbe)) ^~ wire169[(3'h6):(3'h4)])};
  always
    @(posedge clk) begin
      reg178 <= $signed($unsigned(((-wire177) <<< ({(8'ha2), wire166} ?
          (wire174 ? wire168 : (7'h40)) : (wire175 ~^ wire166)))));
      reg179 <= $unsigned((reg178 ?
          ((wire169 ?
              wire168 : $signed(wire177)) & (~^$signed(wire168))) : wire171));
      reg180 <= (~&($unsigned($signed((wire171 == wire170))) * ((8'ha1) && ((wire172 ?
          wire167 : wire171) == wire177[(2'h3):(2'h3)]))));
    end
endmodule
