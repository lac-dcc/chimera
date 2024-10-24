module top
#(parameter param117 = (&(^((((8'hb9) ? (8'haa) : (8'ha7)) ? (~&(8'hb2)) : ((8'hb1) ? (7'h41) : (8'hb2))) ? ({(8'hbb)} ? ((8'hb6) && (7'h43)) : {(8'ha2), (8'hbe)}) : (((8'hb3) - (7'h43)) < ((8'h9c) >> (7'h42)))))), 
parameter param118 = {{param117, param117}, {((param117 || param117) + param117)}})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire116;
  wire [(5'h13):(1'h0)] wire115;
  wire signed [(4'hd):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire104,
                 wire7,
                 wire6,
                 wire5,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire5 = (wire1 <<< wire4[(4'hc):(3'h5)]);
  assign wire6 = ((^~wire2) ?
                     (+($signed((7'h40)) ?
                         ($signed(wire5) ?
                             ((8'hb5) ^~ wire2) : wire0) : wire3)) : ((~&wire4[(3'h7):(3'h6)]) ?
                         (($signed(wire4) - ((8'hb8) ?
                             wire4 : (7'h44))) ~^ (^~wire3[(4'h8):(3'h5)])) : (8'ha8)));
  assign wire7 = wire2;
  module8 #() modinst105 (.y(wire104), .wire10(wire6), .wire11(wire7), .wire12(wire3), .clk(clk), .wire9(wire2));
  always
    @(posedge clk) begin
      if ((($signed((&$unsigned(wire3))) ?
              (((^wire5) ^~ wire0) + wire104[(4'h8):(1'h0)]) : $unsigned($unsigned(wire7[(1'h1):(1'h0)]))) ?
          (($unsigned({wire2, wire6}) ?
                  ((wire3 * wire0) ?
                      ((8'hb2) ? wire5 : wire1) : wire2) : wire0) ?
              ((~&wire1[(4'ha):(3'h7)]) ?
                  $signed((wire5 ?
                      wire6 : (8'hac))) : $unsigned(wire0)) : ({(wire6 ?
                      wire0 : wire104),
                  {wire5,
                      wire2}} << wire5[(3'h4):(2'h2)])) : wire3[(2'h3):(2'h3)]))
        begin
          reg106 <= $unsigned($unsigned($signed(wire5)));
          reg107 <= $signed($unsigned((((wire7 >> wire4) > (~(8'hb9))) <= $signed((wire7 ?
              reg106 : wire2)))));
          reg108 <= $signed({((-wire0[(3'h4):(1'h1)]) ?
                  ((&wire0) - {wire0}) : wire6[(3'h6):(3'h6)])});
        end
      else
        begin
          reg106 <= $signed(wire6);
          reg107 <= (8'hb9);
          reg108 <= $signed((((reg108[(2'h2):(1'h1)] ?
                  $unsigned(wire5) : wire2) == $signed({(8'haf)})) ?
              reg107[(1'h0):(1'h0)] : reg106));
          reg109 <= reg107[(3'h4):(2'h2)];
        end
      if (($signed($unsigned(reg109)) >>> {wire5[(4'hc):(1'h1)]}))
        begin
          reg110 <= (&wire1);
          reg111 <= $unsigned(reg109[(1'h1):(1'h1)]);
        end
      else
        begin
          reg110 <= (wire5 ?
              $unsigned(($signed((wire2 ?
                  wire2 : wire7)) ~^ (+(wire6 + wire2)))) : reg110[(2'h3):(1'h0)]);
          reg111 <= (-(-(8'ha3)));
          reg112 <= reg106[(4'hb):(1'h0)];
          reg113 <= wire3;
          reg114 <= ($unsigned($unsigned((|$unsigned(reg107)))) == (~^(~&(-$unsigned(reg109)))));
        end
    end
  assign wire115 = (-reg113);
  assign wire116 = $signed(reg107);
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h1e3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire [(2'h2):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire102;
  wire [(5'h14):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(4'hb):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  assign y = {wire102,
                 wire83,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire47,
                 wire14,
                 wire13,
                 reg49,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire13 = (wire11[(1'h1):(1'h0)] ?
                      {$unsigned($signed($signed(wire12)))} : $unsigned($signed((~|wire11[(1'h0):(1'h0)]))));
  assign wire14 = ($unsigned((~&((wire13 ? (7'h41) : wire9) ?
                      wire12 : (wire10 ?
                          wire12 : wire9)))) >>> {($unsigned(wire13[(4'h8):(3'h5)]) <<< (wire11[(2'h2):(1'h0)] & {(8'hb6),
                          wire11})),
                      (wire13[(4'h9):(1'h1)] ?
                          $unsigned((wire10 ? (8'hb3) : (8'ha2))) : wire9)});
  module15 #() modinst48 (.wire18(wire14), .wire19(wire9), .wire16(wire12), .y(wire47), .wire17(wire13), .clk(clk));
  always
    @(posedge clk) begin
      reg49 <= $unsigned($unsigned((wire14[(1'h1):(1'h0)] <= ((8'ha6) ?
          wire13 : (~&wire10)))));
    end
  assign wire50 = {wire11[(3'h4):(1'h0)], wire13};
  assign wire51 = {$signed(($unsigned(wire11) | $signed(reg49))),
                      {$signed($signed(reg49[(5'h10):(4'h8)]))}};
  assign wire52 = {$signed({wire9, $signed($unsigned(wire47))}),
                      $unsigned((~&($unsigned(wire11) ?
                          wire9[(2'h2):(2'h2)] : $unsigned(wire47))))};
  assign wire53 = {({$signed(wire10),
                          (~^$unsigned(reg49))} + wire9[(1'h0):(1'h0)]),
                      {((wire14 <<< ((8'hb1) == wire50)) && $unsigned({wire52,
                              (7'h43)}))}};
  assign wire54 = {(^wire11), wire10[(1'h0):(1'h0)]};
  assign wire55 = wire54;
  assign wire56 = $signed((|(8'hb1)));
  assign wire57 = (-wire10[(1'h1):(1'h0)]);
  assign wire58 = wire53;
  assign wire59 = ((+wire55) == ((wire13[(5'h10):(4'h8)] != $signed($signed(wire57))) ?
                      (8'hbe) : ($unsigned(wire14[(3'h7):(3'h7)]) >> $unsigned((^~wire53)))));
  assign wire60 = wire50[(5'h11):(4'hd)];
  always
    @(posedge clk) begin
      reg61 <= (^(&(({wire59, wire54} != wire52) ?
          $signed(reg49) : wire14[(2'h2):(2'h2)])));
      reg62 <= reg61[(4'h8):(3'h5)];
      reg63 <= $signed(wire58);
      if (wire9[(2'h2):(1'h0)])
        begin
          reg64 <= wire59;
          reg65 <= (($signed({wire53, (reg64 ? wire12 : wire14)}) ?
                  (wire53[(2'h2):(1'h0)] ?
                      wire52 : wire58[(1'h1):(1'h0)]) : wire51) ?
              $signed(wire60[(3'h6):(3'h4)]) : $signed($signed(wire55)));
          reg66 <= (^wire12);
          reg67 <= {(~|(8'hb6)), wire52[(3'h7):(3'h4)]};
          if ({({{$signed(reg61), $unsigned(reg63)}} && reg63[(4'hd):(2'h3)]),
              wire10[(1'h1):(1'h0)]})
            begin
              reg68 <= (wire50[(3'h5):(2'h3)] ?
                  {{$unsigned(wire59[(4'h9):(2'h2)])}} : (wire60 ?
                      (wire52 <= wire51) : $signed($signed((wire51 && reg49)))));
              reg69 <= wire50[(4'ha):(1'h1)];
            end
          else
            begin
              reg68 <= (+wire53);
              reg69 <= $unsigned(wire52[(2'h3):(2'h2)]);
              reg70 <= $signed($signed((^wire14[(2'h2):(1'h1)])));
            end
        end
      else
        begin
          reg64 <= (wire12 ^~ reg65);
          reg65 <= reg64[(3'h7):(1'h1)];
          reg66 <= {wire55};
        end
      if ((wire51[(1'h0):(1'h0)] ? (+wire54) : reg67))
        begin
          reg71 <= (8'ha5);
          reg72 <= ({wire58,
              $unsigned((wire9 ?
                  ((7'h41) ?
                      wire13 : reg67) : {reg68}))} + $unsigned(($unsigned({(8'ha8),
                  wire58}) ?
              ((!wire57) ? $unsigned(reg71) : {wire11}) : (^reg71))));
          reg73 <= (-((wire12[(3'h6):(3'h6)] != (((8'ha7) ?
                  reg71 : reg70) & (&reg64))) ?
              {($unsigned(wire50) > wire14),
                  $unsigned((wire10 * reg72))} : (~&$signed(reg65[(4'hf):(4'hd)]))));
        end
      else
        begin
          if (wire58[(1'h0):(1'h0)])
            begin
              reg71 <= {$unsigned(($unsigned($unsigned(reg49)) ?
                      wire56 : $unsigned((|reg73)))),
                  reg49[(3'h6):(3'h5)]};
              reg72 <= (($unsigned(((8'hb3) < reg69[(3'h6):(3'h5)])) >> $unsigned($unsigned($unsigned(reg68)))) != $unsigned(reg49));
              reg73 <= $unsigned(wire47[(3'h5):(1'h0)]);
              reg74 <= (wire53 ? wire10 : (~|wire13));
            end
          else
            begin
              reg71 <= (^~(wire55 | wire54[(4'hb):(3'h7)]));
              reg72 <= wire55[(4'ha):(4'ha)];
              reg73 <= reg68;
              reg74 <= (wire11[(3'h4):(2'h3)] < reg49);
              reg75 <= wire51;
            end
          reg76 <= (+wire14);
          reg77 <= (wire55[(3'h6):(1'h0)] ?
              (({wire56, wire55[(2'h2):(2'h2)]} ?
                      wire14[(3'h7):(2'h3)] : wire58) ?
                  wire13[(4'hd):(4'h9)] : $unsigned($unsigned((~^reg72)))) : (($signed(wire52) <= (reg62[(2'h2):(2'h2)] ?
                      wire58[(1'h0):(1'h0)] : wire10)) ?
                  $unsigned(((!reg61) >>> (~^wire56))) : $unsigned(((reg63 ?
                      reg74 : reg74) == (~&wire56)))));
          if ((((wire59[(3'h5):(3'h4)] - $signed({wire10, reg75})) ?
                  $signed(((wire59 <<< reg61) ?
                      (wire57 < wire55) : (^reg74))) : $signed($unsigned(wire9[(2'h2):(2'h2)]))) ?
              {$unsigned(((reg64 <<< reg64) < $signed(wire10)))} : $signed($signed((reg70 <<< reg74[(2'h2):(1'h1)])))))
            begin
              reg78 <= (($unsigned({{reg65, wire14}}) * wire9) ?
                  reg63 : $signed($unsigned({(+wire56), (&reg61)})));
              reg79 <= reg75;
              reg80 <= wire59;
              reg81 <= (((&($unsigned(reg79) ?
                  reg73[(1'h0):(1'h0)] : (-reg69))) || wire54[(1'h0):(1'h0)]) - reg67);
              reg82 <= $unsigned($unsigned(($unsigned(reg66[(3'h6):(3'h5)]) << $unsigned(reg49[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg78 <= $unsigned($signed($unsigned((|$unsigned(wire14)))));
              reg79 <= ($unsigned(reg49) >>> $unsigned(($signed((!reg73)) ?
                  (&$unsigned(wire9)) : reg81)));
            end
        end
    end
  assign wire83 = ((!((wire12 ? (~&reg66) : $signed(reg80)) ?
                      ((reg72 ?
                          reg75 : reg71) && wire13) : wire47[(3'h7):(1'h0)])) == $signed(({reg65} || (~{wire9}))));
  module84 #() modinst103 (wire102, clk, reg63, wire50, reg66, wire47, reg77);
endmodule

module module84
#(parameter param100 = ({({((7'h42) | (8'hb3)), (^(8'h9d))} ? (-(~|(8'ha7))) : ((&(8'haf)) ? (+(7'h40)) : ((8'hb0) ? (8'hbd) : (8'ha1))))} || (^~{((!(8'hb1)) << ((8'ha7) | (8'hac))), (((7'h44) < (8'hae)) >> ((8'ha6) ? (8'hbb) : (8'ha5)))})), 
parameter param101 = ({(param100 ? ((param100 ? param100 : param100) ? param100 : (~param100)) : ((+param100) <= param100))} == ((param100 && (|(!param100))) ? param100 : ((+{(7'h43)}) >>> ((~param100) + (!param100))))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire89;
  input wire signed [(4'ha):(1'h0)] wire88;
  input wire signed [(2'h3):(1'h0)] wire87;
  input wire signed [(4'h8):(1'h0)] wire86;
  input wire [(2'h3):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire97;
  wire signed [(4'hd):(1'h0)] wire96;
  wire signed [(3'h5):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire94;
  wire signed [(5'h13):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire90;
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg91 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire90,
                 reg92,
                 reg91,
                 (1'h0)};
  assign wire90 = (|(~$signed($unsigned(wire86[(3'h7):(1'h0)]))));
  always
    @(posedge clk) begin
      reg91 <= $unsigned(wire88[(1'h0):(1'h0)]);
      reg92 <= wire90;
    end
  assign wire93 = reg91[(4'hd):(4'hb)];
  assign wire94 = wire89[(2'h3):(2'h3)];
  assign wire95 = (~wire87[(2'h2):(1'h0)]);
  assign wire96 = (!$signed(reg91));
  assign wire97 = ((wire89[(4'ha):(4'ha)] + reg92[(2'h2):(2'h2)]) ?
                      $unsigned({(wire85 ? wire86 : $unsigned(wire88)),
                          wire93[(1'h0):(1'h0)]}) : reg91);
  assign wire98 = $unsigned(((wire95 - (wire96 ?
                      $unsigned(wire97) : (wire95 ?
                          wire86 : wire94))) || $unsigned($signed(wire97))));
  assign wire99 = wire97[(3'h6):(2'h3)];
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire19;
  input wire signed [(5'h11):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  input wire [(5'h11):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(5'h14):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(4'hc):(1'h0)] wire20;
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire46,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire33,
                 wire32,
                 wire29,
                 wire28,
                 wire27,
                 wire22,
                 wire21,
                 wire20,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg36,
                 reg35,
                 reg34,
                 reg31,
                 reg30,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire20 = (^~($unsigned(((wire16 | wire16) ?
                      (wire18 ? wire18 : (8'ha8)) : wire17)) | (((wire17 ?
                      wire17 : wire18) + (wire16 || wire19)) | (wire17 ?
                      wire17[(3'h5):(2'h2)] : $signed(wire19)))));
  assign wire21 = $unsigned((~&wire17[(3'h5):(2'h2)]));
  assign wire22 = $unsigned($unsigned(wire18));
  always
    @(posedge clk) begin
      reg23 <= wire19[(1'h1):(1'h1)];
      reg24 <= ((&(8'hbd)) ?
          wire19[(1'h1):(1'h0)] : {wire22,
              (({wire17, (8'ha7)} ? {wire22} : $signed(wire20)) ?
                  $signed((wire19 ? wire17 : wire16)) : (^~$unsigned(reg23)))});
      reg25 <= $unsigned({wire19[(1'h1):(1'h0)],
          ($unsigned((wire22 ^ (8'ha7))) ?
              (&wire18[(4'he):(4'ha)]) : $signed({wire19, (8'ha6)}))});
      reg26 <= wire16;
    end
  assign wire27 = (!(((~&$unsigned(reg23)) ^~ $unsigned({wire20, (8'hb9)})) ?
                      (reg26[(3'h5):(2'h2)] ~^ $unsigned(((7'h41) >>> (8'hb2)))) : wire20));
  assign wire28 = {$signed((($unsigned((8'h9c)) | {(8'hb6), reg25}) ?
                          $signed((reg23 ?
                              wire21 : wire20)) : (reg25[(1'h1):(1'h1)] | (wire22 ?
                              wire19 : wire27)))),
                      $signed((wire17[(1'h0):(1'h0)] ?
                          $signed(wire17[(3'h5):(1'h1)]) : $unsigned(wire17[(3'h4):(2'h3)])))};
  assign wire29 = wire20;
  always
    @(posedge clk) begin
      reg30 <= (7'h41);
      reg31 <= $signed(wire28[(3'h5):(3'h4)]);
    end
  assign wire32 = ((~&$signed(((reg26 ? reg30 : reg31) ?
                          ((8'hb2) || wire18) : $signed(reg31)))) ?
                      (~(^reg23[(4'h8):(3'h5)])) : ($signed($unsigned($signed(reg25))) ?
                          reg30[(2'h3):(1'h0)] : wire27[(3'h7):(2'h2)]));
  assign wire33 = wire20[(4'hc):(1'h0)];
  always
    @(posedge clk) begin
      reg34 <= $signed(wire17);
      reg35 <= ((~&(8'hb7)) ^ {$signed(($unsigned(wire17) ?
              (~|(8'h9e)) : {wire16, (8'hb6)})),
          $unsigned((^~wire29[(1'h1):(1'h0)]))});
      reg36 <= wire28;
    end
  assign wire37 = ((~&$signed($signed($signed(wire19)))) <<< (wire33 ^ $unsigned(((reg30 ?
                      reg26 : (8'hb9)) * $unsigned(wire17)))));
  assign wire38 = $unsigned((~^{$unsigned((~wire21)),
                      $signed((wire37 == reg31))}));
  assign wire39 = (($unsigned($signed($signed(wire18))) >>> $unsigned((wire33 <= (|wire16)))) - (($unsigned(wire21) ^~ ((8'ha1) ^~ wire33)) | ((reg34[(4'h8):(3'h6)] ~^ $signed(wire19)) + $signed($unsigned((8'ha8))))));
  assign wire40 = reg30;
  assign wire41 = $unsigned(wire40[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg42 <= $signed((~$signed($signed(wire28[(2'h3):(1'h1)]))));
      reg43 <= reg23[(4'ha):(4'ha)];
      if (($unsigned(({(8'hbc)} != reg31)) ?
          {$signed((wire22[(3'h5):(3'h5)] * reg36[(4'ha):(3'h4)]))} : (^reg25)))
        begin
          reg44 <= (({((reg43 ? (8'hb8) : wire17) < $signed(reg26))} ?
                  $unsigned((reg43 - wire39)) : ((~&wire28) ?
                      ((wire17 ? reg34 : wire40) + {wire38}) : wire37)) ?
              wire38 : wire17);
        end
      else
        begin
          reg44 <= (wire18 ? (~^$unsigned(reg36)) : wire37[(4'hb):(3'h4)]);
        end
      reg45 <= $signed($unsigned(wire38[(3'h5):(1'h0)]));
    end
  assign wire46 = ((((~((8'hb6) ? reg42 : wire27)) ?
                              (~&$unsigned(wire28)) : ({reg25} ?
                                  (reg36 == wire17) : (reg25 - wire39))) ?
                          ($unsigned(reg35[(3'h7):(1'h0)]) ?
                              (~$unsigned((7'h40))) : (8'h9d)) : {{((8'hb6) ?
                                      reg24 : wire32),
                                  {reg43, reg26}},
                              wire18[(1'h1):(1'h1)]}) ?
                      (-({wire28[(2'h2):(1'h1)], (reg23 - reg26)} ?
                          wire41[(3'h5):(2'h3)] : ((|reg26) ?
                              (8'h9e) : (8'h9c)))) : (wire22 == reg23[(4'h8):(2'h2)]));
endmodule
