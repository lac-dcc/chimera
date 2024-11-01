module top
#(parameter param228 = (((((^~(8'ha7)) || (&(8'hb4))) * ((!(8'ha7)) & ((8'h9c) ? (8'ha5) : (8'ha0)))) ? (~^{((8'h9f) * (8'hb0)), (~(8'hac))}) : (({(8'hab), (8'hb4)} * (&(8'hac))) | {(!(8'ha5))})) ? ((~(((8'h9d) ? (8'ha7) : (8'h9d)) - (~^(8'hb0)))) >= (((~|(8'ha4)) ? (|(8'h9e)) : {(8'hb3), (8'hb1)}) ? (|((8'hb9) << (8'hb1))) : (((8'ha7) ? (8'hab) : (8'had)) || ((7'h44) ? (8'hbc) : (8'hb9))))) : ((({(8'h9d), (8'hb2)} >= (+(8'ha5))) ? (((8'ha8) ? (8'hb9) : (8'hb3)) > (~(8'hab))) : (8'ha3)) ? {{((8'hab) ? (8'hb6) : (8'h9f))}} : {(((8'hb8) - (8'h9c)) ? ((8'hb5) ? (8'hb2) : (8'hb1)) : {(8'h9f), (8'h9d)})})), 
parameter param229 = ({{param228}} ? ((((param228 ? param228 : (8'hb9)) ? {param228, param228} : (param228 << param228)) ? param228 : ((~&(8'hbe)) ? param228 : param228)) ? (((+param228) << param228) ^~ ({param228} < (~|param228))) : (^(param228 ? (^param228) : (-param228)))) : (~^{{param228, param228}})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(4'he):(1'h0)] wire227;
  wire [(2'h2):(1'h0)] wire226;
  wire signed [(3'h6):(1'h0)] wire225;
  wire signed [(5'h13):(1'h0)] wire224;
  wire [(4'hb):(1'h0)] wire223;
  wire [(4'hd):(1'h0)] wire222;
  wire signed [(3'h4):(1'h0)] wire221;
  wire signed [(4'hf):(1'h0)] wire219;
  wire [(3'h6):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire4;
  wire [(4'hf):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire75;
  reg signed [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg5 = (1'h0);
  assign y = {wire227,
                 wire226,
                 wire225,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire219,
                 wire79,
                 wire78,
                 wire77,
                 wire4,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire75,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($signed(wire3) <= (|(wire2 & wire1[(3'h6):(1'h0)])));
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= wire3;
      reg7 <= $signed((reg5 ?
          (&$signed(reg6)) : (wire4[(1'h1):(1'h1)] ?
              $signed($unsigned(reg5)) : $signed(wire0))));
    end
  assign wire8 = (reg6[(1'h0):(1'h0)] ?
                     wire2 : $unsigned($unsigned((wire3 < (wire4 >= wire4)))));
  assign wire9 = (wire0 <= $unsigned((|(wire8[(3'h6):(3'h4)] ~^ (|reg5)))));
  assign wire10 = $signed($signed($unsigned($signed($signed(wire3)))));
  assign wire11 = reg5;
  assign wire12 = reg7[(4'hb):(2'h2)];
  assign wire13 = (wire11[(4'h9):(3'h4)] ? reg5 : reg6[(1'h0):(1'h0)]);
  module14 #() modinst76 (.wire19(wire2), .wire16(wire9), .wire18(wire1), .clk(clk), .wire17(wire10), .y(wire75), .wire15(wire11));
  assign wire77 = ({((~^$signed(wire8)) ?
                          wire8 : (|(reg5 ^~ reg6)))} + ($unsigned({{wire75,
                          wire10}}) != $unsigned($unsigned((reg5 && (7'h44))))));
  assign wire78 = (&wire3);
  assign wire79 = (({wire9[(4'h8):(3'h5)],
                              (wire11[(1'h1):(1'h0)] ?
                                  (reg7 ? wire8 : (8'hac)) : ((8'haf) ?
                                      (7'h44) : wire1))} ?
                          (((~|wire4) <<< wire4[(3'h4):(1'h0)]) | $unsigned(wire8)) : ({wire75[(4'hb):(3'h4)],
                              $signed((8'hbc))} ^~ ($signed(wire13) <= (reg7 > wire77)))) ?
                      {($signed((wire8 ^ wire78)) ? $signed(wire75) : wire4),
                          (wire11 && ($signed(wire11) || wire13[(1'h0):(1'h0)]))} : (reg5 ?
                          ($signed(wire4) > $unsigned({wire75})) : (((&(8'h9d)) + (wire11 ?
                              reg5 : wire1)) >> (wire13 ?
                              wire2[(3'h5):(2'h2)] : (wire13 ?
                                  reg6 : wire0)))));
  module80 #() modinst220 (wire219, clk, reg6, wire9, wire10, reg7);
  assign wire221 = ((~(!reg5[(5'h10):(4'hb)])) ?
                       (wire4 ?
                           ((^(^wire8)) ?
                               $unsigned(((8'hb6) ?
                                   (8'hbf) : wire1)) : {(+wire3),
                                   wire77[(3'h4):(3'h4)]}) : (wire11 ?
                               ((|(8'hb2)) | (~&(8'hac))) : wire79)) : wire4[(2'h2):(2'h2)]);
  assign wire222 = wire10;
  assign wire223 = ($unsigned((((wire0 ? wire8 : wire12) ?
                               {wire2, wire8} : $signed(wire75)) ?
                           wire9[(4'h9):(3'h6)] : $signed((reg7 + reg6)))) ?
                       (|(8'ha0)) : $unsigned((8'hbf)));
  assign wire224 = ((~&(reg5 <<< (~|(~|(8'ha6))))) ?
                       (|((+{wire0, wire79}) >= $signed((^reg5)))) : (7'h42));
  assign wire225 = wire8;
  assign wire226 = $signed($signed((+(wire219 ?
                       (8'h9c) : (wire222 != (8'hb7))))));
  assign wire227 = $unsigned((wire226 ?
                       (({wire79} > wire79) ?
                           {(wire12 ^ reg6),
                               {wire223,
                                   wire10}} : wire2) : (~wire223[(2'h2):(2'h2)])));
endmodule

module module80
#(parameter param217 = (((~&(-((8'hbb) >>> (8'hb8)))) & ((~^((8'hb3) || (8'hac))) << (((8'hac) != (8'ha1)) ? (8'ha4) : ((8'hab) ~^ (8'hbc))))) * (~((((8'ha5) ? (8'h9e) : (8'h9d)) < ((8'hb1) ? (8'hb3) : (7'h40))) ? {(^(8'hb3)), ((8'hbf) << (8'hb7))} : (-(~^(8'ha1)))))), 
parameter param218 = ({(~^((param217 >= param217) ? (param217 ? param217 : param217) : (8'ha3)))} ? param217 : param217))
(y, clk, wire81, wire82, wire83, wire84);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire81;
  input wire signed [(5'h13):(1'h0)] wire82;
  input wire signed [(4'hf):(1'h0)] wire83;
  input wire [(5'h11):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire216;
  wire signed [(4'ha):(1'h0)] wire190;
  wire signed [(5'h14):(1'h0)] wire154;
  wire [(4'h9):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire152;
  wire signed [(5'h15):(1'h0)] wire195;
  wire [(5'h14):(1'h0)] wire214;
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg [(5'h15):(1'h0)] reg122 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(5'h11):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg130 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg134 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg192 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg193 = (1'h0);
  reg [(5'h12):(1'h0)] reg194 = (1'h0);
  assign y = {wire216,
                 wire190,
                 wire154,
                 wire112,
                 wire152,
                 wire195,
                 wire214,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 reg129,
                 reg130,
                 reg131,
                 reg132,
                 reg133,
                 reg134,
                 reg192,
                 reg193,
                 reg194,
                 (1'h0)};
  module85 #() modinst113 (wire112, clk, wire84, wire82, wire81, wire83);
  always
    @(posedge clk) begin
      if ((|wire82[(3'h7):(2'h3)]))
        begin
          reg114 <= (8'hbd);
          reg115 <= (!(&$signed(((-wire112) ?
              $unsigned(wire112) : $signed(wire81)))));
          reg116 <= ((((^wire112[(1'h0):(1'h0)]) <= ((wire81 ?
                  wire81 : wire81) == (~reg115))) ?
              $unsigned(reg115) : (reg115 & {((8'hb4) ?
                      wire82 : wire82)})) ~^ $signed($signed(reg114)));
          reg117 <= wire84[(4'hd):(4'ha)];
        end
      else
        begin
          if (reg114)
            begin
              reg114 <= {($signed($unsigned($signed(wire83))) ?
                      {((reg114 ?
                              wire112 : (7'h41)) <<< $signed(wire83))} : ($unsigned(reg116) ?
                          {wire112[(2'h2):(2'h2)],
                              $signed(wire84)} : ($unsigned((8'ha9)) ?
                              (wire112 < (8'ha7)) : (^wire112)))),
                  $unsigned(wire84)};
              reg115 <= (&$signed(((8'ha1) <<< {(reg116 * (8'hb2))})));
              reg116 <= reg114[(4'h8):(2'h3)];
            end
          else
            begin
              reg114 <= (+$unsigned($signed($signed((wire82 ?
                  reg115 : reg116)))));
              reg115 <= (~(-wire82));
              reg116 <= wire84[(4'he):(2'h3)];
            end
          reg117 <= ($signed($signed(wire84[(4'hb):(4'ha)])) ?
              ($unsigned(wire83) < (($unsigned(wire82) ?
                      reg115[(4'ha):(2'h2)] : wire84) ?
                  $unsigned($signed(wire81)) : $unsigned(reg117[(4'h8):(3'h4)]))) : (wire112 ?
                  wire83 : {reg114[(1'h0):(1'h0)],
                      $unsigned($unsigned(wire84))}));
        end
      if ((~|{reg116[(2'h3):(1'h0)],
          {(wire83[(4'hf):(4'hc)] ? (reg114 ^ wire82) : reg114[(3'h5):(2'h3)]),
              reg115}}))
        begin
          if (reg115[(4'hd):(4'h8)])
            begin
              reg118 <= reg114[(1'h0):(1'h0)];
              reg119 <= (+((($unsigned(reg115) ?
                          (reg117 | reg114) : (reg115 && wire83)) ?
                      (~$unsigned(reg115)) : $unsigned((^~reg114))) ?
                  $unsigned(($unsigned((8'hb5)) ~^ $signed(reg117))) : $unsigned(({wire82,
                          (8'hb8)} ?
                      {wire82} : $unsigned(wire112)))));
              reg120 <= $signed((&$signed(((^~reg119) ?
                  wire81 : $unsigned(wire84)))));
              reg121 <= $unsigned((^wire82[(4'hf):(4'h9)]));
              reg122 <= (-reg120[(4'hb):(2'h3)]);
            end
          else
            begin
              reg118 <= $signed({(((8'ha3) ?
                      (~&reg119) : wire83[(3'h4):(1'h0)]) + ((reg115 == reg121) ?
                      $signed(wire83) : (wire83 ? wire112 : (8'hbb)))),
                  (!((wire83 ? reg119 : (8'h9c)) == (reg119 != reg118)))});
              reg119 <= $unsigned((~$signed(({wire82} > $signed(wire112)))));
              reg120 <= wire82;
            end
        end
      else
        begin
          reg118 <= $signed(({$signed(reg118[(2'h2):(2'h2)])} ?
              wire83 : reg118[(3'h5):(3'h4)]));
        end
      if ((wire81 ^ wire112))
        begin
          reg123 <= $signed((wire84[(4'h8):(1'h1)] - (+(~|wire81))));
          if (reg119[(4'ha):(2'h3)])
            begin
              reg124 <= {($signed((wire81 <= (wire112 ~^ reg117))) || (^~wire112)),
                  ($unsigned((!$unsigned(reg115))) ?
                      reg121[(2'h2):(1'h1)] : $signed(($signed(reg118) ?
                          {reg116} : (reg123 >>> wire82))))};
              reg125 <= (~(wire82 >> $signed({(^reg124), {reg115}})));
            end
          else
            begin
              reg124 <= (~^((^(^~(reg123 >> wire112))) << $unsigned((8'ha9))));
              reg125 <= (((wire112 - {reg119[(4'hb):(1'h0)],
                          (wire84 ? reg114 : reg114)}) ?
                      $signed(reg119) : $unsigned(({reg124,
                          reg116} ~^ ((8'hbc) <<< reg122)))) ?
                  $unsigned($signed(((~^reg117) ?
                      (~&reg122) : wire112))) : reg121);
              reg126 <= (~reg116[(2'h3):(2'h3)]);
              reg127 <= wire83;
            end
          reg128 <= $signed((reg121 ^~ $signed(reg123[(3'h7):(3'h5)])));
          if (((8'hab) ?
              ((($signed(wire83) <= reg123) >> $signed($signed(reg121))) <= (reg121 ?
                  (reg115[(3'h7):(1'h0)] ^~ reg114[(3'h5):(1'h0)]) : (~|reg114))) : wire81[(3'h7):(2'h3)]))
            begin
              reg129 <= wire83;
              reg130 <= {$unsigned((7'h42))};
              reg131 <= reg121[(1'h0):(1'h0)];
              reg132 <= (wire112[(2'h2):(2'h2)] ?
                  $signed($signed(reg126)) : $unsigned(reg117));
            end
          else
            begin
              reg129 <= (wire83 + (((reg126[(5'h12):(5'h12)] ?
                  reg132 : (~&reg127)) ^ ($unsigned(reg132) && ((8'hae) || reg129))) + $signed(($signed(reg131) < (reg119 ?
                  reg121 : reg124)))));
              reg130 <= (~|{(($signed(reg117) != reg122[(3'h4):(1'h0)]) ?
                      $unsigned((reg128 | reg124)) : (8'ha6))});
              reg131 <= $signed($unsigned($unsigned(((reg127 ?
                  wire112 : reg119) <= (reg130 < (8'ha1))))));
              reg132 <= $unsigned($signed((7'h40)));
            end
        end
      else
        begin
          reg123 <= {((~$signed(reg120[(4'hb):(3'h7)])) < wire83)};
        end
      reg133 <= (-(($unsigned((reg129 ? reg129 : reg116)) ?
          reg125 : ($unsigned(wire112) ^ (reg117 ?
              (8'hb5) : (8'hb0)))) < ((~reg121[(3'h4):(3'h4)]) > reg116[(3'h5):(1'h1)])));
      reg134 <= reg133;
    end
  module135 #() modinst153 (.y(wire152), .wire137(reg129), .wire136(reg123), .clk(clk), .wire138(reg128), .wire139(wire83));
  assign wire154 = $unsigned(reg122[(2'h3):(1'h1)]);
  module155 #() modinst191 (wire190, clk, reg117, reg115, wire84, reg133);
  always
    @(posedge clk) begin
      reg192 <= ($signed(reg129) <<< (^(&($unsigned(reg129) ?
          reg122 : reg131))));
      reg193 <= reg115[(4'he):(2'h2)];
      reg194 <= reg130[(1'h0):(1'h0)];
    end
  assign wire195 = $unsigned(((^~(8'hb8)) < $unsigned(reg134)));
  module196 #() modinst215 (wire214, clk, reg114, reg194, reg115, wire83);
  assign wire216 = (!(~|$unsigned($signed((~|reg114)))));
endmodule

module module14
#(parameter param73 = {(-(^({(8'hba), (8'ha5)} || (^(8'hb5)))))}, 
parameter param74 = (((&(~&(~^param73))) << (((param73 | param73) < ((7'h44) ? (8'hbd) : param73)) ? ((param73 && param73) + (param73 ? param73 : param73)) : ((param73 ? param73 : param73) | (&(8'hbd))))) <= param73))
(y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire signed [(5'h15):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire41;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire68;
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire20,
                 wire21,
                 wire22,
                 wire41,
                 wire43,
                 wire68,
                 (1'h0)};
  assign wire20 = wire18[(4'he):(3'h7)];
  assign wire21 = wire19[(1'h1):(1'h0)];
  assign wire22 = $signed(wire19);
  module23 #() modinst42 (wire41, clk, wire19, wire21, wire22, wire16);
  assign wire43 = (-$unsigned(wire20[(1'h0):(1'h0)]));
  module44 #() modinst69 (.y(wire68), .wire46(wire15), .wire49(wire18), .clk(clk), .wire45(wire21), .wire47(wire20), .wire48(wire16));
  assign wire70 = wire19[(1'h0):(1'h0)];
  assign wire71 = $unsigned(wire41[(3'h4):(2'h3)]);
  assign wire72 = (-(^~$unsigned((&$signed(wire22)))));
endmodule

module module44  (y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire49;
  input wire [(3'h7):(1'h0)] wire48;
  input wire [(4'he):(1'h0)] wire47;
  input wire signed [(4'hc):(1'h0)] wire46;
  input wire signed [(2'h2):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(4'he):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire signed [(4'hb):(1'h0)] wire62;
  wire signed [(4'hd):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire51,
                 wire50,
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
                 (1'h0)};
  assign wire50 = (($signed(wire46[(3'h4):(2'h2)]) ?
                      $signed(wire45[(1'h1):(1'h0)]) : (!$signed(wire46[(2'h3):(2'h2)]))) + $signed(wire47[(4'hb):(3'h4)]));
  assign wire51 = $signed($unsigned(wire47[(4'h9):(3'h7)]));
  always
    @(posedge clk) begin
      if (wire48[(2'h2):(1'h0)])
        begin
          if (({(|wire47[(1'h1):(1'h1)])} - (-wire51)))
            begin
              reg52 <= $signed($unsigned($signed(((|(8'hb6)) ?
                  wire50 : wire51))));
              reg53 <= $signed(((~|(7'h42)) | {$signed($unsigned(wire46)),
                  reg52[(5'h12):(2'h3)]}));
            end
          else
            begin
              reg52 <= wire50[(2'h3):(2'h3)];
              reg53 <= $unsigned(reg52[(4'hb):(3'h7)]);
            end
          reg54 <= (~|($signed(((~&(8'h9c)) ?
              (wire45 ?
                  wire45 : (8'hbf)) : (wire48 >> (8'hb8)))) ^~ $signed(((~^reg52) <= $signed(wire51)))));
          reg55 <= (wire46[(1'h0):(1'h0)] ?
              $signed(reg54[(3'h7):(3'h7)]) : (-({$signed((8'h9c))} <<< $unsigned(((8'ha1) ?
                  wire49 : reg54)))));
          reg56 <= (wire48[(1'h1):(1'h0)] * ((wire45[(1'h0):(1'h0)] ?
                  $unsigned($signed(wire51)) : wire47) ?
              ((reg54 - wire50[(3'h4):(1'h1)]) <<< $unsigned((reg52 ?
                  (8'hbb) : wire49))) : (($signed(wire46) ?
                      wire45[(1'h0):(1'h0)] : (wire50 ? wire46 : reg54)) ?
                  ({(8'hba), wire46} ?
                      (wire51 == (8'hb4)) : wire48) : $signed((wire45 ?
                      reg55 : wire46)))));
          if ((((8'h9f) ?
                  (|wire51) : ({$unsigned(reg54), reg52[(3'h6):(1'h1)]} ?
                      ((reg56 ?
                          reg55 : (8'ha8)) << $unsigned(reg56)) : (8'hb6))) ?
              (^((8'hac) ?
                  (|wire48[(2'h3):(2'h2)]) : ((7'h43) ?
                      (reg52 ? (8'hbb) : wire49) : $signed(reg54)))) : reg54))
            begin
              reg57 <= $unsigned(({$unsigned($unsigned(reg52)),
                  reg52} >= (+$unsigned(wire50[(4'h8):(3'h6)]))));
              reg58 <= (!{(&wire45[(1'h0):(1'h0)]), $signed((8'ha1))});
              reg59 <= wire51[(3'h5):(3'h4)];
              reg60 <= $signed(wire45);
            end
          else
            begin
              reg57 <= reg53[(3'h6):(1'h1)];
              reg58 <= wire47;
              reg59 <= {reg57};
              reg60 <= $signed(($unsigned(((reg54 < reg57) ?
                  ((8'ha1) ?
                      wire45 : reg58) : reg53)) + wire48[(1'h0):(1'h0)]));
            end
        end
      else
        begin
          reg52 <= reg52[(5'h15):(4'ha)];
          reg53 <= (($signed(((reg57 & wire50) >>> (reg58 != reg55))) ?
                  {$unsigned($unsigned((8'hbc)))} : $unsigned({(wire48 & reg58)})) ?
              (^~reg60[(3'h7):(3'h6)]) : (~^($unsigned($unsigned(reg59)) ?
                  {(wire46 ? reg55 : reg54)} : wire49)));
          reg54 <= reg57[(3'h6):(2'h2)];
          reg55 <= wire47;
        end
      reg61 <= reg59;
    end
  assign wire62 = (reg53[(3'h4):(2'h2)] ?
                      ((|$unsigned(reg53[(3'h5):(2'h2)])) ?
                          (8'hbd) : wire46[(4'hb):(2'h2)]) : reg61);
  assign wire63 = {$signed((wire49[(4'h9):(2'h3)] ?
                          $unsigned(wire47) : (|{wire49})))};
  assign wire64 = wire62;
  assign wire65 = $unsigned(wire64);
  assign wire66 = {wire65[(2'h3):(1'h1)]};
  assign wire67 = $unsigned(wire64[(4'h9):(3'h5)]);
endmodule

module module23
#(parameter param39 = (8'h9d), 
parameter param40 = (((((param39 <<< (8'ha4)) >> (param39 >>> param39)) != (^(param39 ? param39 : param39))) | {(&{param39, param39}), ((param39 ? param39 : (8'had)) ? (param39 ? param39 : param39) : (8'hbd))}) ? (&((-param39) ? ((|(8'hbd)) >> {param39}) : {(param39 ? param39 : param39)})) : (~(param39 ? (^{param39}) : param39))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire27;
  input wire signed [(3'h7):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  wire signed [(3'h7):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h10):(1'h0)] wire28;
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = wire25;
  assign wire29 = $unsigned((^$signed($unsigned({wire28}))));
  assign wire30 = wire29[(1'h0):(1'h0)];
  assign wire31 = {$signed($unsigned($signed($signed(wire28)))),
                      $unsigned($unsigned((^~wire24[(3'h4):(1'h0)])))};
  assign wire32 = (&$unsigned($signed(wire28[(4'hf):(2'h2)])));
  assign wire33 = $unsigned(wire27);
  assign wire34 = wire28[(4'ha):(3'h5)];
  assign wire35 = ((wire29 >= wire25) <= $signed((((~^wire26) ?
                          $signed(wire28) : (+wire27)) ?
                      $signed(wire32) : wire28)));
  assign wire36 = $unsigned($signed({wire28}));
  assign wire37 = wire24;
  assign wire38 = (|$signed(wire36[(3'h5):(2'h3)]));
endmodule

module module196  (y, clk, wire200, wire199, wire198, wire197);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire200;
  input wire signed [(5'h10):(1'h0)] wire199;
  input wire signed [(2'h3):(1'h0)] wire198;
  input wire signed [(4'he):(1'h0)] wire197;
  wire [(4'hc):(1'h0)] wire213;
  wire signed [(4'hd):(1'h0)] wire212;
  wire [(3'h6):(1'h0)] wire211;
  wire [(5'h12):(1'h0)] wire209;
  wire signed [(5'h12):(1'h0)] wire208;
  wire [(4'he):(1'h0)] wire207;
  wire [(3'h4):(1'h0)] wire204;
  wire [(4'h9):(1'h0)] wire203;
  wire signed [(5'h15):(1'h0)] wire202;
  wire [(4'ha):(1'h0)] wire201;
  reg [(5'h14):(1'h0)] reg210 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg206 = (1'h0);
  reg [(4'hd):(1'h0)] reg205 = (1'h0);
  assign y = {wire213,
                 wire212,
                 wire211,
                 wire209,
                 wire208,
                 wire207,
                 wire204,
                 wire203,
                 wire202,
                 wire201,
                 reg210,
                 reg206,
                 reg205,
                 (1'h0)};
  assign wire201 = (-(+wire199));
  assign wire202 = $unsigned((8'h9d));
  assign wire203 = $signed(((wire201[(3'h7):(1'h1)] << wire199) ?
                       wire202[(3'h5):(3'h4)] : wire198[(2'h3):(2'h3)]));
  assign wire204 = $signed(wire197[(3'h5):(1'h0)]);
  always
    @(posedge clk) begin
      reg205 <= (wire200[(2'h3):(2'h2)] != $signed({($unsigned((7'h40)) >= wire200[(1'h1):(1'h1)]),
          $unsigned((~|wire202))}));
      reg206 <= {$signed(wire203[(4'h8):(3'h7)])};
    end
  assign wire207 = $unsigned(reg205);
  assign wire208 = (~reg205);
  assign wire209 = ({(-(8'hbd)),
                       $unsigned(reg206)} | (($unsigned(wire204[(1'h1):(1'h1)]) ?
                       ((wire202 && wire201) ?
                           $unsigned(wire200) : $unsigned(wire208)) : ((^~wire200) & (wire202 ?
                           wire202 : wire199))) && wire197));
  always
    @(posedge clk) begin
      reg210 <= wire202[(5'h11):(4'h9)];
    end
  assign wire211 = {wire208[(3'h7):(1'h0)], reg206};
  assign wire212 = (reg210 ? reg205[(1'h0):(1'h0)] : wire208[(4'ha):(3'h5)]);
  assign wire213 = (7'h43);
endmodule

module module155
#(parameter param188 = ((&{(~&((8'hbb) ? (7'h44) : (8'hb8)))}) < (({((8'hb1) << (7'h44)), {(8'hbe), (8'ha1)}} ? (((7'h44) ? (8'hb1) : (8'hb1)) + ((7'h43) || (8'hbd))) : (((8'hb3) ? (8'h9f) : (8'hb4)) ? ((7'h40) ? (8'ha4) : (8'h9c)) : ((7'h43) ? (8'hb4) : (8'had)))) > ((~&((8'hb0) ? (8'hb7) : (7'h42))) ? (((8'ha6) - (8'hb8)) ? {(8'h9f)} : ((8'hab) < (7'h41))) : ({(8'haa)} || ((8'hb2) ^~ (8'hab)))))), 
parameter param189 = (!((+param188) || (!(param188 ? (!param188) : {(8'hbe), param188})))))
(y, clk, wire159, wire158, wire157, wire156);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire159;
  input wire [(5'h14):(1'h0)] wire158;
  input wire signed [(3'h4):(1'h0)] wire157;
  input wire signed [(4'hf):(1'h0)] wire156;
  wire signed [(3'h4):(1'h0)] wire187;
  wire signed [(4'hb):(1'h0)] wire186;
  wire [(2'h2):(1'h0)] wire185;
  wire [(4'he):(1'h0)] wire166;
  wire [(5'h10):(1'h0)] wire165;
  wire signed [(4'hc):(1'h0)] wire164;
  wire [(4'hc):(1'h0)] wire163;
  wire [(5'h13):(1'h0)] wire162;
  wire signed [(3'h7):(1'h0)] wire161;
  wire [(3'h5):(1'h0)] wire160;
  reg signed [(5'h14):(1'h0)] reg184 = (1'h0);
  reg signed [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg181 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg179 = (1'h0);
  reg [(4'hd):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg177 = (1'h0);
  reg [(5'h15):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg [(2'h2):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg171 = (1'h0);
  reg [(5'h12):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg168 = (1'h0);
  reg [(4'hb):(1'h0)] reg167 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire185,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
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
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 (1'h0)};
  assign wire160 = $signed($signed(wire157));
  assign wire161 = ($signed($signed((8'ha7))) == $signed((wire160 != $signed(wire158))));
  assign wire162 = {$unsigned((wire156 >>> (!(~&wire158)))),
                       wire157[(2'h3):(2'h3)]};
  assign wire163 = $unsigned($signed(wire160[(2'h2):(2'h2)]));
  assign wire164 = {($unsigned($signed((wire159 != wire158))) ?
                           $signed($signed((wire157 < (8'ha7)))) : ($signed(wire156[(3'h6):(2'h2)]) ?
                               ((&wire162) | wire161[(3'h5):(3'h5)]) : $unsigned(wire159))),
                       ((~$unsigned(wire160[(1'h0):(1'h0)])) || $signed((wire159[(3'h5):(1'h1)] ?
                           $signed(wire156) : wire158[(1'h1):(1'h1)])))};
  assign wire165 = (($unsigned(((wire158 > wire162) ?
                           $signed(wire159) : $signed((8'hb8)))) > (|$signed((wire161 ~^ wire157)))) ?
                       $signed(wire158[(4'h8):(2'h2)]) : $signed($unsigned({(wire156 >= wire158),
                           (wire162 & wire164)})));
  assign wire166 = wire162[(3'h5):(1'h1)];
  always
    @(posedge clk) begin
      reg167 <= (8'haa);
    end
  always
    @(posedge clk) begin
      if (wire156[(3'h5):(3'h4)])
        begin
          if (wire161)
            begin
              reg168 <= {(8'had)};
            end
          else
            begin
              reg168 <= {(({$signed(wire164)} >>> wire163) + wire164)};
              reg169 <= wire158[(4'hb):(3'h5)];
              reg170 <= {$unsigned(wire161[(3'h7):(1'h1)])};
              reg171 <= (wire156 ~^ ((((reg169 ?
                          (8'hae) : wire156) | (wire159 & wire159)) ?
                      $signed((wire165 ~^ wire162)) : (~|reg167[(4'h8):(3'h5)])) ?
                  ((8'hb9) ?
                      ($signed(wire159) ^~ wire161) : wire163[(2'h3):(2'h3)]) : (reg169[(1'h1):(1'h1)] || (+$unsigned(reg170)))));
            end
          if (reg167[(1'h1):(1'h0)])
            begin
              reg172 <= ($signed(wire161) ?
                  $signed($signed((((8'h9f) ? wire164 : wire159) ?
                      (8'hb8) : reg171[(3'h6):(2'h2)]))) : $signed(wire157[(3'h4):(2'h3)]));
              reg173 <= $unsigned($unsigned(((|{wire158}) != (~&wire160[(1'h1):(1'h1)]))));
              reg174 <= ((^~wire157) ?
                  $unsigned($unsigned((^~(^~reg173)))) : wire161[(3'h7):(1'h1)]);
              reg175 <= wire158[(5'h13):(5'h12)];
              reg176 <= reg172[(3'h5):(1'h0)];
            end
          else
            begin
              reg172 <= (+(wire156 <= $signed((!reg170))));
              reg173 <= wire162[(5'h13):(1'h0)];
            end
          reg177 <= ({{reg176, reg174[(3'h7):(3'h7)]},
                  $signed((reg175 >>> (|wire162)))} ?
              $unsigned($unsigned($signed($signed((8'hb4))))) : $signed($signed((~(&reg176)))));
          if ($signed(((wire156 ?
              {$unsigned(wire157), $signed((8'hab))} : reg176) * ({(!(8'ha4))} ?
              (~^$signed(reg174)) : wire165))))
            begin
              reg178 <= $signed((((-(|wire156)) ?
                      $unsigned(wire159[(1'h1):(1'h1)]) : $signed(((8'ha6) <= reg174))) ?
                  ({$unsigned(reg167), (&(8'hbd))} | ($unsigned(wire166) ?
                      reg172[(3'h4):(1'h1)] : $unsigned((8'h9c)))) : {$signed(reg174[(3'h6):(3'h5)]),
                      $unsigned($unsigned(reg169))}));
              reg179 <= {$signed(($unsigned((^reg173)) ? reg174 : {wire162}))};
              reg180 <= $signed((($unsigned({(8'hab)}) ?
                  $signed($signed((8'h9d))) : {(8'ha5),
                      (wire162 ?
                          (8'h9d) : reg178)}) != $unsigned($unsigned($signed((8'hb3))))));
              reg181 <= {$signed(reg167), reg170[(4'hb):(3'h6)]};
            end
          else
            begin
              reg178 <= ((reg176 ?
                  (7'h42) : (reg176[(4'h9):(2'h2)] ?
                      ((wire159 ? wire160 : reg171) ?
                          (reg170 > reg180) : $unsigned(reg179)) : $unsigned((8'hbb)))) <<< wire160[(1'h0):(1'h0)]);
              reg179 <= (+((~^(|(wire166 >>> reg181))) ?
                  $signed((-$unsigned(wire163))) : $signed((reg171[(4'hd):(3'h7)] ?
                      (~reg175) : (wire165 ? reg181 : wire159)))));
              reg180 <= (8'h9e);
              reg181 <= ({$unsigned(reg170),
                      ((wire165 ?
                          $signed(reg168) : $unsigned((8'ha3))) & $signed(wire160[(3'h5):(1'h1)]))} ?
                  (^{(~&$unsigned(reg179))}) : wire162[(4'h8):(1'h1)]);
              reg182 <= (-(+$signed($unsigned($signed(reg177)))));
            end
        end
      else
        begin
          if ($unsigned({$unsigned($unsigned((^reg168))),
              ($unsigned($unsigned(reg167)) & reg173[(2'h2):(2'h2)])}))
            begin
              reg168 <= reg174[(4'h8):(4'h8)];
              reg169 <= reg168[(3'h6):(3'h6)];
              reg170 <= (~^$signed($signed(reg179[(1'h0):(1'h0)])));
            end
          else
            begin
              reg168 <= {$unsigned($signed({wire166}))};
              reg169 <= reg168[(3'h5):(3'h4)];
              reg170 <= (((wire160[(3'h4):(2'h3)] ?
                          ((~|reg179) ?
                              reg171 : $unsigned(wire164)) : (|$unsigned((8'ha3)))) ?
                      $signed({$unsigned(reg182)}) : reg170) ?
                  $signed($unsigned({$signed((8'ha1))})) : $unsigned(reg181));
              reg171 <= wire163;
              reg172 <= ((-$unsigned($unsigned((reg182 ?
                  wire166 : reg175)))) * {$signed($unsigned(((8'hae) ?
                      (8'h9e) : (8'h9f))))});
            end
          reg173 <= (8'ha6);
          reg174 <= (~(~^$unsigned(reg182)));
          reg175 <= wire157[(1'h0):(1'h0)];
        end
      reg183 <= $signed((($signed($signed(wire164)) ?
              reg176 : $signed(reg167[(4'h8):(2'h2)])) ?
          (~&(reg178 == $signed(wire165))) : ($signed($signed(reg175)) < $unsigned(reg178))));
      reg184 <= wire161[(1'h0):(1'h0)];
    end
  assign wire185 = $signed($signed($signed({wire159, $signed(wire160)})));
  assign wire186 = $signed(reg172[(2'h2):(1'h1)]);
  assign wire187 = (~^($signed({$signed(reg167)}) ?
                       $signed((reg170 < reg181[(4'h9):(3'h6)])) : reg168));
endmodule

module module135
#(parameter param150 = ((^~((-((8'hbf) ? (7'h43) : (8'ha4))) | (8'hb2))) ? {((|((8'ha7) ? (8'had) : (8'hb5))) ^ (((8'hae) == (7'h43)) ? ((8'hba) != (8'hbe)) : ((8'h9d) >> (8'hab))))} : (~^((&((8'h9e) | (8'hb2))) || ({(7'h42)} ? ((8'haa) ~^ (8'hbe)) : (|(8'hba)))))), 
parameter param151 = ((8'hb2) ? param150 : (((-param150) + ((param150 ? param150 : (8'ha7)) ? (param150 ? param150 : param150) : (param150 >>> param150))) - param150)))
(y, clk, wire139, wire138, wire137, wire136);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire139;
  input wire signed [(4'hf):(1'h0)] wire138;
  input wire [(5'h11):(1'h0)] wire137;
  input wire [(2'h2):(1'h0)] wire136;
  wire [(5'h15):(1'h0)] wire149;
  wire signed [(3'h5):(1'h0)] wire148;
  wire signed [(4'hd):(1'h0)] wire147;
  wire [(4'he):(1'h0)] wire146;
  wire [(3'h7):(1'h0)] wire145;
  wire signed [(5'h12):(1'h0)] wire144;
  wire [(3'h4):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire140;
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(2'h2):(1'h0)] reg141 = (1'h0);
  assign y = {wire149,
                 wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire140,
                 reg142,
                 reg141,
                 (1'h0)};
  assign wire140 = $unsigned(wire139);
  always
    @(posedge clk) begin
      reg141 <= $signed($signed((-$unsigned(((8'ha2) ? (8'h9d) : wire139)))));
      reg142 <= (wire140 * wire136[(1'h1):(1'h1)]);
    end
  assign wire143 = (wire138 ?
                       {({{(8'had)}} ?
                               wire138[(4'h9):(4'h8)] : reg142[(4'h8):(3'h4)]),
                           (wire137 - ((wire139 ? wire136 : wire136) ?
                               wire138[(4'hc):(4'ha)] : (~&(7'h44))))} : $signed(wire140[(2'h3):(1'h1)]));
  assign wire144 = (reg142[(2'h2):(1'h1)] & ($unsigned($unsigned((reg142 == wire139))) <= ($unsigned(wire136[(2'h2):(1'h1)]) * (~|(wire136 ?
                       reg142 : reg142)))));
  assign wire145 = reg142[(1'h1):(1'h1)];
  assign wire146 = wire137;
  assign wire147 = wire145[(3'h4):(2'h3)];
  assign wire148 = $signed($signed($unsigned(($unsigned(wire145) ?
                       wire140[(3'h4):(1'h0)] : {wire143}))));
  assign wire149 = ({(wire140[(2'h2):(1'h1)] - $signed($unsigned(wire144)))} ?
                       {wire136[(2'h2):(2'h2)]} : wire146[(3'h5):(3'h4)]);
endmodule

module module85
#(parameter param111 = ((-((((8'hbf) ? (7'h41) : (8'had)) != {(8'h9f)}) >= (-(8'ha9)))) << (((((8'ha6) && (8'ha3)) ? ((8'hbe) ? (8'ha9) : (8'hb6)) : ((8'ha3) && (8'hb2))) ~^ ((^(8'ha8)) ? {(8'hbf)} : ((8'ha7) ? (8'hbd) : (8'hba)))) != ((8'haa) <<< (((8'haf) ~^ (8'ha4)) + ((8'hb2) | (8'ha2)))))))
(y, clk, wire89, wire88, wire87, wire86);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire89;
  input wire [(5'h13):(1'h0)] wire88;
  input wire [(4'hd):(1'h0)] wire87;
  input wire signed [(4'hf):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire110;
  wire [(4'ha):(1'h0)] wire109;
  wire signed [(2'h3):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire signed [(5'h14):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire signed [(5'h10):(1'h0)] wire101;
  wire signed [(4'ha):(1'h0)] wire100;
  wire [(2'h3):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(5'h11):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  wire [(3'h5):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire90;
  reg signed [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg93 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire108,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire92,
                 wire91,
                 wire90,
                 reg107,
                 reg106,
                 reg93,
                 (1'h0)};
  assign wire90 = $signed(wire88);
  assign wire91 = (&(~^$signed(wire86)));
  assign wire92 = (&(wire86[(4'hb):(1'h0)] ?
                      (wire87[(1'h0):(1'h0)] ?
                          wire90[(4'hf):(1'h0)] : $signed($signed(wire87))) : $unsigned(wire87[(4'h8):(3'h7)])));
  always
    @(posedge clk) begin
      reg93 <= $signed((&($unsigned(wire91) ?
          $signed($signed(wire87)) : ((wire89 << wire92) * wire87[(4'h8):(3'h5)]))));
    end
  assign wire94 = wire86;
  assign wire95 = $signed($unsigned((wire87[(4'hd):(4'hc)] ?
                      $signed(wire87[(2'h2):(1'h1)]) : $signed((wire89 ?
                          wire89 : reg93)))));
  assign wire96 = ((8'hb3) + (((wire92[(3'h4):(2'h2)] && wire92) ?
                          (wire89 ?
                              (!wire87) : (wire92 ?
                                  wire90 : wire91)) : ((-wire94) == $unsigned(wire87))) ?
                      $unsigned(wire91[(3'h5):(3'h5)]) : {wire90[(3'h5):(3'h4)]}));
  assign wire97 = $signed((|(!wire91[(3'h4):(3'h4)])));
  assign wire98 = $signed((|$unsigned($unsigned(wire92[(3'h7):(3'h5)]))));
  assign wire99 = (8'hae);
  assign wire100 = (8'hb7);
  assign wire101 = (^~wire95[(1'h0):(1'h0)]);
  assign wire102 = (^~{($signed(wire99) ?
                           wire88[(4'h8):(4'h8)] : {(reg93 <= wire90),
                               wire101}),
                       (((wire94 | (8'ha9)) ? (^~wire94) : wire99) ?
                           (wire99[(2'h2):(1'h0)] ~^ $signed((8'hb4))) : $signed(wire86))});
  assign wire103 = (wire102[(5'h10):(3'h5)] ?
                       wire101 : ($signed($signed({(8'hbc), wire91})) ?
                           wire102 : wire99[(2'h2):(1'h0)]));
  assign wire104 = wire103;
  assign wire105 = $unsigned($unsigned($signed(($unsigned(wire101) ?
                       wire97 : {(8'h9e)}))));
  always
    @(posedge clk) begin
      reg106 <= {({$unsigned(wire90[(5'h10):(3'h7)])} ?
              (((-wire98) ?
                  wire95 : wire90) && wire87[(3'h5):(2'h3)]) : (((8'ha4) ?
                      $unsigned(wire89) : (wire99 ? wire95 : wire96)) ?
                  ((+wire87) ? wire99 : wire102) : wire101))};
      reg107 <= $unsigned((((~^$signed(reg93)) >= wire103) ?
          (~$signed($signed((8'hb7)))) : (((~|wire100) ?
                  wire91 : {wire98, wire98}) ?
              (((8'hbf) > wire92) ?
                  (8'ha4) : wire101[(1'h1):(1'h1)]) : (wire92 && $signed(reg106)))));
    end
  assign wire108 = {wire90[(4'hf):(1'h1)],
                       ((wire88 ?
                           wire89[(1'h1):(1'h1)] : wire97[(3'h6):(2'h2)]) * $signed(reg107[(3'h4):(2'h2)]))};
  assign wire109 = $unsigned(wire87[(4'hd):(3'h5)]);
  assign wire110 = ((|$signed(((~^wire88) <<< reg106[(4'hd):(4'ha)]))) ?
                       reg106 : ((!($unsigned((8'hb3)) != (|wire87))) ?
                           reg106 : (~^({wire100} ~^ $unsigned(reg106)))));
endmodule
