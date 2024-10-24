module top
#(parameter param155 = (~|(~^(~|(!((8'haa) + (8'ha2)))))), 
parameter param156 = param155)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire154;
  wire signed [(4'hf):(1'h0)] wire150;
  wire signed [(4'h8):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire143;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(2'h2):(1'h0)] wire152;
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg148 = (1'h0);
  reg [(4'hb):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg146 = (1'h0);
  assign y = {wire154,
                 wire150,
                 wire145,
                 wire143,
                 wire6,
                 wire5,
                 wire152,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 (1'h0)};
  assign wire5 = wire2[(5'h13):(4'hb)];
  assign wire6 = wire2;
  module7 #() modinst144 (.y(wire143), .wire10(wire5), .wire8(wire0), .wire9(wire1), .wire11(wire3), .clk(clk));
  assign wire145 = $unsigned(wire2);
  always
    @(posedge clk) begin
      reg146 <= $signed({(wire6 ^~ $unsigned((+wire1)))});
      reg147 <= wire145[(3'h4):(2'h3)];
      reg148 <= (~(wire3 ? ((8'ha9) << $signed((~&wire2))) : {$signed(wire0)}));
      reg149 <= (wire4[(1'h1):(1'h1)] ? wire0 : (8'ha5));
    end
  module56 #() modinst151 (wire150, clk, wire2, reg148, wire5, wire1);
  module13 #() modinst153 (wire152, clk, wire6, reg147, wire145, wire1);
  assign wire154 = ($signed((~^((wire0 > wire2) - $unsigned(wire0)))) ?
                       (8'hbd) : (wire150 << reg146));
endmodule

module module7
#(parameter param141 = (({(((8'h9f) ? (8'hb1) : (8'hb4)) || ((8'hae) < (8'ha8))), (~&((8'hae) || (8'hac)))} ? ((((8'hb1) ? (7'h44) : (8'ha5)) ? ((8'ha8) ? (8'ha0) : (8'h9e)) : ((7'h41) <<< (8'ha8))) != (8'hae)) : (8'ha3)) ? (+{((&(8'hbf)) ? ((8'ha0) != (8'hb7)) : ((8'ha7) * (8'hb0))), (!(^(7'h43)))}) : (((&{(8'ha8)}) ? ({(8'ha6)} >= ((8'ha6) ? (8'hac) : (8'h9f))) : {(~&(8'ha0)), ((8'hbc) + (8'ha2))}) ? (8'hae) : (|(((8'hac) ? (8'hab) : (8'ha2)) < (!(8'hb1)))))), 
parameter param142 = (((^~param141) * ((((8'hab) << param141) == (param141 >> param141)) ^~ (+(7'h44)))) ? (|{{(param141 ? param141 : (8'hb1)), (~^(8'hb7))}, (~&param141)}) : (&(^~((param141 ? param141 : param141) != {param141})))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire signed [(4'hc):(1'h0)] wire10;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire89;
  wire signed [(3'h4):(1'h0)] wire88;
  wire [(4'hd):(1'h0)] wire87;
  wire [(4'h9):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire54;
  wire signed [(4'hd):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire114;
  wire signed [(5'h15):(1'h0)] wire115;
  wire [(4'hd):(1'h0)] wire139;
  assign y = {wire112,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire12,
                 wire114,
                 wire115,
                 wire139,
                 (1'h0)};
  assign wire12 = ((~&$signed($signed(wire10))) ?
                      ({{(wire11 ? wire9 : wire11),
                              wire8}} - ($unsigned($unsigned(wire10)) ?
                          $unsigned($signed(wire9)) : ({wire10,
                              wire8} << $signed(wire8)))) : $signed({wire10[(3'h4):(2'h3)],
                          (~(wire10 ? wire10 : wire9))}));
  module13 #() modinst52 (wire51, clk, wire9, wire12, wire8, wire11);
  assign wire53 = wire9;
  assign wire54 = (7'h44);
  assign wire55 = $unsigned(wire11[(1'h0):(1'h0)]);
  module56 #() modinst85 (.y(wire84), .wire57(wire10), .wire58(wire9), .wire59(wire53), .clk(clk), .wire60(wire8));
  assign wire86 = (wire53[(1'h1):(1'h1)] ?
                      (~^{$unsigned(wire8[(3'h4):(2'h2)]),
                          ({wire12, wire10} * $signed(wire12))}) : (|{{(wire10 ?
                                  wire54 : wire53)}}));
  assign wire87 = $signed((7'h40));
  assign wire88 = (wire51[(1'h1):(1'h0)] ?
                      $signed(($unsigned((wire51 ? wire51 : wire9)) ?
                          ((~^wire11) ?
                              (wire84 & wire54) : ((8'ha8) ^ (8'hbc))) : (~wire51))) : (~^(($unsigned(wire53) ?
                          $unsigned(wire55) : (wire51 ^~ (8'ha5))) < wire11[(1'h0):(1'h0)])));
  assign wire89 = (wire9[(2'h2):(1'h0)] || (^~$signed(wire51)));
  module90 #() modinst113 (.wire91(wire11), .wire95(wire51), .wire92(wire9), .clk(clk), .y(wire112), .wire93(wire88), .wire94(wire10));
  assign wire114 = $signed(wire53[(4'hd):(3'h5)]);
  assign wire115 = (wire51 ?
                       ($signed((wire53 ? {wire8, (8'hb6)} : (^wire84))) ?
                           $unsigned((~(~|wire10))) : (~$signed((+wire84)))) : wire10);
  module116 #() modinst140 (wire139, clk, wire54, wire112, wire87, wire115, wire86);
endmodule

module module116  (y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire121;
  input wire [(5'h10):(1'h0)] wire120;
  input wire [(4'hb):(1'h0)] wire119;
  input wire [(4'hd):(1'h0)] wire118;
  input wire [(4'h9):(1'h0)] wire117;
  wire [(5'h14):(1'h0)] wire138;
  wire [(5'h15):(1'h0)] wire137;
  wire signed [(4'h8):(1'h0)] wire136;
  wire [(4'hd):(1'h0)] wire135;
  wire signed [(4'he):(1'h0)] wire134;
  wire [(4'hb):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire126;
  wire signed [(5'h13):(1'h0)] wire125;
  reg [(5'h14):(1'h0)] reg133 = (1'h0);
  reg [(3'h7):(1'h0)] reg132 = (1'h0);
  reg [(4'hb):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg122 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg122 <= wire120[(4'ha):(1'h1)];
      reg123 <= (~^wire117[(1'h1):(1'h1)]);
      reg124 <= reg123[(4'h8):(3'h7)];
    end
  assign wire125 = reg122;
  assign wire126 = ((~($signed($signed((8'ha8))) ?
                           (~&(+reg124)) : (!wire120))) ?
                       wire119[(1'h0):(1'h0)] : $unsigned($unsigned($signed(wire121[(4'hd):(1'h0)]))));
  assign wire127 = wire117;
  assign wire128 = wire121;
  assign wire129 = wire126;
  always
    @(posedge clk) begin
      reg130 <= ((8'h9c) ? $signed(wire126) : wire117);
      reg131 <= reg123[(4'hd):(4'hc)];
      reg132 <= ($unsigned($unsigned(wire126[(2'h2):(2'h2)])) ?
          wire118 : $unsigned({$signed(wire118)}));
      reg133 <= wire129[(4'h9):(3'h6)];
    end
  assign wire134 = $signed({{$unsigned(((8'haa) ? wire129 : wire120)),
                           (|$signed(reg122))},
                       $unsigned($signed(((8'hb2) ? (8'hb8) : (8'hab))))});
  assign wire135 = reg123;
  assign wire136 = (~&wire118);
  assign wire137 = ((($signed($unsigned(wire118)) ?
                           reg124[(1'h1):(1'h1)] : (reg131[(2'h2):(1'h0)] != $signed((8'hbf)))) && (((8'hb5) ?
                           (~&reg123) : wire135) - (wire118 ?
                           (^wire129) : (^wire117)))) ?
                       wire118 : $unsigned(($unsigned($unsigned(wire120)) ^ wire117)));
  assign wire138 = $unsigned($signed(wire126[(2'h2):(1'h1)]));
endmodule

module module90
#(parameter param110 = ((^(~((~&(8'hb6)) * ((8'h9c) ? (8'hb7) : (8'hbf))))) * (((!((8'hb0) != (8'hb2))) ? ((-(8'haf)) ? ((8'hb1) <= (8'hb7)) : (~^(8'h9c))) : (!((8'ha1) ^ (7'h40)))) ? (-({(8'h9c), (8'ha6)} ^~ (^~(8'hbe)))) : (~&(~(+(8'ha0)))))), 
parameter param111 = (~{(((param110 ~^ param110) ? (|param110) : (-param110)) ? param110 : param110)}))
(y, clk, wire95, wire94, wire93, wire92, wire91);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire95;
  input wire signed [(3'h4):(1'h0)] wire94;
  input wire signed [(2'h3):(1'h0)] wire93;
  input wire signed [(5'h11):(1'h0)] wire92;
  input wire [(5'h12):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire106;
  wire [(3'h7):(1'h0)] wire105;
  wire signed [(3'h5):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire96;
  reg [(2'h3):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg103 = (1'h0);
  reg [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire96,
                 reg109,
                 reg108,
                 reg107,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 (1'h0)};
  assign wire96 = wire95[(4'hd):(3'h6)];
  always
    @(posedge clk) begin
      reg97 <= (|({wire94} ?
          $unsigned(wire91[(1'h0):(1'h0)]) : (-$signed($signed(wire93)))));
      reg98 <= (wire95[(2'h3):(2'h2)] + (~wire94));
      if ((^~wire94))
        begin
          reg99 <= $signed((((~^wire91[(4'he):(2'h2)]) && (~wire94)) > reg97[(3'h5):(1'h0)]));
          reg100 <= $unsigned((^~($unsigned($unsigned(wire96)) ?
              ($unsigned(wire91) + (~&wire92)) : reg98)));
          reg101 <= reg99;
          reg102 <= wire92;
          reg103 <= ((((-wire93) ?
              reg101 : (~|reg98[(3'h7):(3'h4)])) > ($unsigned(reg100) < wire92)) || wire91[(4'h8):(2'h2)]);
        end
      else
        begin
          reg99 <= (-wire92);
          reg100 <= {$signed($signed((~$unsigned((8'ha4)))))};
        end
    end
  assign wire104 = wire93;
  assign wire105 = (&$unsigned((8'hae)));
  assign wire106 = reg99;
  always
    @(posedge clk) begin
      reg107 <= wire91[(5'h11):(5'h11)];
      reg108 <= {$signed(wire106[(5'h13):(1'h1)]),
          {(^((wire94 ? wire94 : reg107) ?
                  $unsigned(reg103) : $unsigned(wire94))),
              $unsigned((-{wire91}))}};
      reg109 <= ($signed(reg98) <= $signed(((&(reg103 ? reg99 : reg98)) ?
          $unsigned((~reg99)) : $unsigned((~^wire91)))));
    end
endmodule

module module56
#(parameter param82 = (((^~(-((8'hb8) ? (8'h9d) : (8'ha4)))) ^~ (8'hae)) ? (((((8'h9d) ^~ (8'hb3)) ? ((8'hb2) ? (8'hb0) : (7'h43)) : (8'h9d)) ? (!((8'ha6) + (7'h44))) : ((~|(8'ha7)) ? (~|(8'hac)) : {(7'h40)})) ? (((8'h9c) + (|(8'hbd))) < ((~&(8'hb0)) ^~ ((8'h9f) < (8'ha1)))) : (!(^{(7'h40), (8'ha6)}))) : (~&((!((8'had) || (8'hb3))) ? ((~&(8'haa)) ? ((8'ha5) ? (8'h9d) : (8'ha4)) : ((8'hac) == (8'hb8))) : ({(8'had)} & ((8'hbe) ? (7'h42) : (8'hb3)))))), 
parameter param83 = param82)
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  input wire [(4'hc):(1'h0)] wire58;
  input wire [(4'hc):(1'h0)] wire57;
  wire [(4'hc):(1'h0)] wire81;
  wire [(4'h9):(1'h0)] wire80;
  wire signed [(5'h14):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire75;
  wire [(4'he):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire68;
  wire [(5'h10):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire61;
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire68,
                 wire66,
                 wire65,
                 wire61,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg67,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire61 = $signed(wire59[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg62 <= (^wire58);
      reg63 <= {({wire60,
              {wire60, $signed(wire59)}} == (($unsigned(wire58) > (wire61 ?
              wire61 : reg62)) >>> wire58[(4'h9):(4'h8)])),
          ($unsigned($signed(wire61)) ?
              ($unsigned($signed(wire57)) ?
                  $signed($signed(wire58)) : (reg62 && $signed(reg62))) : $unsigned(((8'hb1) ?
                  $unsigned(wire59) : (wire58 ? reg62 : wire59))))};
      reg64 <= ((~((~wire57[(4'hb):(2'h2)]) | ($signed((8'hbb)) <= (8'ha5)))) >>> (!(($unsigned(wire57) >= wire58[(3'h4):(1'h1)]) ?
          ((-reg63) >>> wire60[(4'hb):(3'h5)]) : (wire57[(2'h3):(1'h0)] ?
              $unsigned(wire61) : (wire57 ? wire60 : (8'hb7))))));
    end
  assign wire65 = reg64;
  assign wire66 = reg62[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg67 <= $signed($signed((~|wire57[(1'h0):(1'h0)])));
    end
  assign wire68 = reg63[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg69 <= $unsigned($signed($unsigned($signed($unsigned(reg64)))));
      reg70 <= $signed(wire57[(1'h1):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg71 <= ({($signed((wire66 ? (8'hba) : wire59)) >>> $signed({reg69})),
              $signed($signed((!wire58)))} ?
          (&wire61[(2'h3):(1'h1)]) : (~&(({(8'haf), (8'h9e)} ?
              ((8'haa) ? reg62 : wire57) : wire66) <<< {$unsigned(wire61),
              (wire65 ? wire65 : reg70)})));
      reg72 <= $signed((((~(reg62 ?
              (8'ha5) : (8'haa))) <<< wire58[(3'h6):(3'h5)]) ?
          ($unsigned(((7'h44) ? wire61 : wire66)) ?
              $unsigned($unsigned(reg64)) : $signed(reg70[(1'h1):(1'h0)])) : ($unsigned({reg69}) >> reg63)));
    end
  assign wire73 = ((~&{$unsigned(reg71)}) ? wire61 : (wire60 <<< (|wire65)));
  assign wire74 = $unsigned({reg62, wire57});
  assign wire75 = (reg64 >>> reg70);
  assign wire76 = reg69[(1'h1):(1'h0)];
  assign wire77 = $signed({wire58[(3'h5):(1'h0)]});
  assign wire78 = ((wire65[(4'he):(4'h8)] ?
                          (($signed(reg71) ?
                              $unsigned(wire76) : (wire57 ?
                                  reg69 : reg67)) * ((!wire59) ^~ (wire74 + (7'h41)))) : wire60[(3'h5):(3'h4)]) ?
                      reg63[(4'hf):(4'ha)] : $unsigned((!reg64)));
  assign wire79 = {$signed(((8'h9d) ?
                          $signed((8'hbc)) : (reg62[(3'h5):(1'h0)] * reg72)))};
  assign wire80 = $unsigned((|(&{$signed(wire75)})));
  assign wire81 = (^(8'ha9));
endmodule

module module13
#(parameter param50 = (((((~|(7'h42)) ? (!(8'hb0)) : (8'hbe)) ? ((~^(8'hac)) <= ((8'hb0) ? (8'ha0) : (8'ha6))) : {(~&(8'haf))}) ? {((8'h9c) - (8'ha6)), ((8'ha3) ^~ ((8'hb9) == (8'hb8)))} : ((((8'hb7) * (8'hb0)) | ((8'hac) ? (8'hac) : (8'hbe))) * (((8'haf) && (8'h9c)) ^ ((8'ha0) ? (8'hbd) : (8'h9c))))) ? {(~{(!(8'h9f))}), (|(((8'hb3) <<< (8'ha2)) ? ((8'had) <= (8'hac)) : (~^(8'h9f))))} : (((((7'h40) ? (8'h9f) : (8'hbf)) * ((8'hab) ? (8'had) : (8'h9d))) - (((8'ha8) ? (8'hb7) : (8'ha1)) ^ ((8'haa) ? (8'hbf) : (7'h44)))) ~^ (((~(8'hbe)) ? ((8'ha6) ? (8'ha6) : (8'hab)) : ((8'ha8) ^ (8'ha5))) <= (!{(8'ha6)})))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h186):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(4'h8):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  wire [(4'hf):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire45;
  wire signed [(3'h5):(1'h0)] wire18;
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h14):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  assign y = {wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire18 = (-(+((~|$signed(wire16)) ?
                      wire17[(1'h0):(1'h0)] : {(8'ha1)})));
  always
    @(posedge clk) begin
      if ((~&(($unsigned($signed(wire17)) != {wire15[(3'h6):(1'h0)]}) ^ $signed(wire18[(2'h2):(2'h2)]))))
        begin
          reg19 <= ((~^$signed($unsigned((^wire17)))) ?
              wire17[(3'h5):(2'h3)] : $unsigned(wire17));
          reg20 <= ((8'hbf) >= (wire16[(2'h3):(1'h0)] ?
              $unsigned(wire15) : wire15[(3'h7):(2'h3)]));
        end
      else
        begin
          reg19 <= $signed($unsigned((((~^(8'h9d)) ?
                  {wire15, reg20} : $signed(wire18)) ?
              (8'hb7) : wire15[(3'h7):(3'h4)])));
          if (reg19)
            begin
              reg20 <= $unsigned((-$signed($signed($signed(wire17)))));
              reg21 <= wire18[(1'h0):(1'h0)];
            end
          else
            begin
              reg20 <= $unsigned($signed((^~$signed((wire18 && wire14)))));
              reg21 <= reg21;
            end
          reg22 <= ((~wire18[(2'h2):(1'h0)]) ^~ wire17);
        end
      if ((((|$signed($signed(reg19))) ?
              (~&(8'hb7)) : (((8'hbc) ^ reg22[(3'h5):(3'h5)]) < (!$unsigned(wire18)))) ?
          reg21 : $unsigned($unsigned($unsigned({wire18})))))
        begin
          reg23 <= (+(^$signed((&(reg21 ? wire17 : (8'hb7))))));
          reg24 <= $signed((8'ha6));
          reg25 <= ({$unsigned(((wire18 ? reg24 : (7'h44)) == wire14))} ?
              {$signed($signed($unsigned(wire16)))} : $unsigned($signed((reg23 ?
                  reg23[(1'h1):(1'h1)] : reg19))));
          reg26 <= $signed(wire16);
          reg27 <= ((8'ha5) ?
              $signed((({wire17, (8'hbc)} ?
                  $unsigned(wire16) : (reg25 ?
                      reg20 : reg24)) * $unsigned(((8'hb3) * wire17)))) : $signed(reg26[(2'h2):(1'h1)]));
        end
      else
        begin
          reg23 <= ($signed((~wire16[(1'h1):(1'h1)])) ?
              (~&$unsigned((~|(wire14 ~^ wire15)))) : reg23);
        end
      reg28 <= (($unsigned($unsigned($unsigned(wire16))) ?
              (!{$signed(reg22), {reg22}}) : (~|$unsigned(reg22))) ?
          wire18[(1'h0):(1'h0)] : reg21[(4'hf):(3'h4)]);
      reg29 <= $unsigned((wire15[(4'h8):(4'h8)] ?
          (~|(~(reg23 ^~ reg21))) : wire15[(4'h8):(3'h4)]));
    end
  always
    @(posedge clk) begin
      reg30 <= (^~$unsigned(({(reg19 ? reg26 : reg21),
          $signed(reg28)} * ($signed(reg28) ?
          (reg24 ? wire16 : wire17) : $signed(reg27)))));
      reg31 <= $signed($signed($unsigned(reg28)));
      reg32 <= (reg26[(3'h5):(2'h2)] ?
          (|(|{(~|reg29), $unsigned(reg23)})) : $signed(wire15));
      reg33 <= reg25[(2'h2):(1'h1)];
      if (wire18[(2'h3):(1'h1)])
        begin
          reg34 <= reg20[(4'ha):(3'h6)];
          reg35 <= ($signed(reg32) & wire17[(3'h5):(1'h1)]);
          reg36 <= $unsigned(reg23[(1'h1):(1'h1)]);
          reg37 <= ((|{reg31}) == ((+(!{reg34, reg28})) ?
              reg20[(4'h8):(3'h6)] : (-wire18[(3'h5):(3'h4)])));
        end
      else
        begin
          reg34 <= reg20;
          reg35 <= (reg33 * $unsigned({(&reg23[(1'h1):(1'h0)])}));
          reg36 <= ((|($signed($signed(reg31)) ?
                  ((reg33 + reg24) ?
                      {wire14,
                          reg27} : ((8'ha7) >> reg22)) : reg25[(4'hb):(1'h1)])) ?
              {$signed((-wire15[(3'h7):(2'h3)]))} : $signed($unsigned({(wire17 ?
                      reg30 : reg22),
                  wire16})));
          if ($signed($unsigned($unsigned((&reg22[(3'h7):(1'h1)])))))
            begin
              reg37 <= (reg32 ?
                  (wire17[(1'h1):(1'h1)] ?
                      ($unsigned((^~wire16)) != $signed($signed(reg34))) : ({(reg23 ?
                              reg19 : (8'hb0)),
                          wire18} >>> (reg34[(5'h11):(3'h7)] ?
                          reg25 : wire18))) : ((&$unsigned(reg20)) && {reg30,
                      reg27[(4'hd):(4'h9)]}));
              reg38 <= (~^(&((~$signed(reg19)) ?
                  {reg24[(2'h2):(1'h1)]} : {(~&(8'hb6))})));
              reg39 <= (((($unsigned(reg27) == {reg31, wire17}) ?
                  $signed((reg38 + (8'h9e))) : reg36[(5'h10):(3'h4)]) == (~&(8'hac))) ^ {(!wire14)});
              reg40 <= reg23;
            end
          else
            begin
              reg37 <= {(reg34[(2'h3):(1'h0)] >>> $signed(reg30[(5'h13):(2'h2)])),
                  wire14};
              reg38 <= (((wire14 ^~ (((8'hab) && reg31) ?
                          $signed(wire16) : (^~reg22))) ?
                      $unsigned((~|(wire16 ^~ reg26))) : (^($signed(reg33) ?
                          (wire15 ? reg28 : reg26) : $signed(reg21)))) ?
                  (^~(((wire17 != reg29) ? (|reg20) : {reg24, reg36}) ?
                      ({reg27,
                          reg37} <= (reg23 > reg35)) : wire17[(1'h1):(1'h0)])) : reg29[(2'h3):(2'h3)]);
              reg39 <= (reg27[(2'h3):(2'h3)] > $signed(($signed($unsigned(reg28)) == ($unsigned(reg20) ?
                  $signed(reg33) : (reg22 ? reg33 : wire14)))));
              reg40 <= $signed(reg26[(5'h10):(4'hb)]);
            end
          if ($signed({($unsigned(reg36[(4'hc):(3'h5)]) >= (8'hb7))}))
            begin
              reg41 <= (wire16 ? (+reg24) : (~|wire16[(3'h4):(2'h2)]));
              reg42 <= (reg40[(4'hc):(3'h6)] <<< $unsigned(reg34));
              reg43 <= (^(((~&(reg41 >>> (8'hba))) ?
                  reg41 : ((reg19 >> reg39) < $unsigned(reg35))) - (8'ha7)));
              reg44 <= (reg28[(1'h0):(1'h0)] <<< ({$unsigned((reg26 != reg34))} | $unsigned(($signed(reg20) >> $unsigned(reg37)))));
            end
          else
            begin
              reg41 <= $signed($signed($signed($unsigned(reg20))));
              reg42 <= ((8'hbb) * $signed(wire17));
            end
        end
    end
  assign wire45 = {($unsigned((|{reg28, reg44})) ?
                          reg32 : reg35[(4'h9):(3'h5)]),
                      $unsigned(wire17)};
  assign wire46 = reg28[(3'h4):(2'h2)];
  assign wire47 = (wire15[(4'h8):(3'h7)] ?
                      (~|reg24) : $signed(((8'hb7) == reg20)));
  assign wire48 = (reg23 ?
                      $unsigned(((&(8'hb2)) ?
                          $signed({(8'hbd),
                              reg36}) : $signed(wire47[(5'h13):(4'hf)]))) : $signed($unsigned($signed((8'hb4)))));
  assign wire49 = reg24;
endmodule
