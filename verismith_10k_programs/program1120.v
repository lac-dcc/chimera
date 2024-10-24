module top
#(parameter param129 = (~&(({((8'hb1) == (8'ha0))} ? (((7'h42) ? (8'ha6) : (8'had)) ? ((8'hbf) ? (8'ha1) : (8'ha6)) : (^~(8'h9d))) : {((8'hbf) - (8'hb1)), ((8'ha5) ? (8'ha6) : (8'had))}) & {(^((8'hb3) ? (8'hab) : (8'ha9))), ((|(8'hb2)) << ((8'had) && (8'hb1)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h12f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire signed [(4'h9):(1'h0)] wire128;
  wire signed [(4'h8):(1'h0)] wire111;
  wire signed [(5'h11):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire108;
  wire signed [(5'h11):(1'h0)] wire107;
  wire signed [(5'h15):(1'h0)] wire106;
  wire signed [(4'hd):(1'h0)] wire104;
  reg [(5'h15):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg126 = (1'h0);
  reg [(2'h3):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg120 = (1'h0);
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg112 = (1'h0);
  reg [(5'h13):(1'h0)] reg4 = (1'h0);
  assign y = {wire128,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire104,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed((&((wire3 ^~ (8'hb9)) + $signed(wire3)))) ?
          $signed((~&{$unsigned(wire1), wire3})) : wire0[(3'h7):(3'h5)]);
    end
  module5 #() modinst105 (.wire8(reg4), .wire6(wire2), .clk(clk), .wire9(wire3), .wire7(wire1), .y(wire104));
  assign wire106 = (&wire3);
  assign wire107 = wire1;
  assign wire108 = wire2[(1'h0):(1'h0)];
  assign wire109 = ((~^(^$signed($unsigned(wire108)))) ?
                       wire1[(4'he):(1'h0)] : $unsigned(wire1));
  assign wire110 = $unsigned((($unsigned($signed(wire3)) || $signed($unsigned(wire106))) && (($unsigned(wire108) ?
                           $unsigned(wire1) : (wire3 ? wire3 : wire0)) ?
                       (8'ha5) : wire106)));
  assign wire111 = wire106[(4'hf):(4'ha)];
  always
    @(posedge clk) begin
      reg112 <= (wire3[(1'h1):(1'h1)] ?
          (^~wire2[(3'h5):(3'h4)]) : (wire109 ?
              wire0[(4'hd):(4'hb)] : $unsigned($signed(wire109[(3'h6):(3'h6)]))));
      if ($unsigned((~|(((~wire108) * wire110[(1'h0):(1'h0)]) ?
          wire111[(3'h5):(3'h4)] : (wire109[(4'h9):(3'h6)] ~^ $unsigned(wire106))))))
        begin
          if (((((wire107[(3'h6):(3'h5)] >= $signed(wire108)) ?
              ((~wire0) ?
                  $signed(wire104) : $unsigned(wire0)) : $unsigned(wire108[(1'h1):(1'h0)])) | (~((wire107 ?
              wire107 : wire109) & $unsigned(wire3)))) <= (({wire110[(4'h9):(3'h5)]} ^~ $signed((~wire1))) ?
              reg4[(3'h7):(3'h5)] : (wire3 >>> {$signed(wire110),
                  (^~wire106)}))))
            begin
              reg113 <= (((((reg112 ?
                  wire3 : reg4) ^ $unsigned(wire1)) ^~ $signed(((8'ha1) ?
                  wire111 : reg112))) > (($unsigned(wire110) ?
                  {(8'ha2)} : (wire1 ?
                      wire0 : (8'hba))) >= (-wire107))) << wire104);
            end
          else
            begin
              reg113 <= wire109;
              reg114 <= (wire2[(2'h2):(1'h1)] ?
                  $unsigned($signed($unsigned((reg113 ?
                      wire1 : wire2)))) : $signed($signed($signed((wire109 ^ wire104)))));
              reg115 <= wire108[(2'h3):(2'h3)];
              reg116 <= (+(~^wire106));
            end
          if (wire2)
            begin
              reg117 <= ((!({$signed((8'ha5)), (|wire111)} || ((-reg4) ?
                  (~wire1) : $signed(wire0)))) >> (wire2 ?
                  wire104[(4'h9):(3'h5)] : ((~^(wire104 <= reg113)) >> $signed({wire107}))));
              reg118 <= {$signed($signed((^~(8'hae)))),
                  $signed((~|(wire109 <= wire3[(4'h9):(3'h5)])))};
              reg119 <= wire1[(1'h1):(1'h1)];
              reg120 <= (~|(((^(reg4 >> wire3)) ?
                  (^$unsigned(wire107)) : ((reg119 && wire2) ?
                      ((8'hb3) ?
                          (8'hb5) : wire106) : $signed((8'hb1)))) - ((^~wire106[(4'hc):(4'ha)]) ?
                  $signed((&(8'hbc))) : (|$unsigned(wire2)))));
              reg121 <= ($signed($signed(wire1[(3'h6):(3'h4)])) ?
                  wire2 : (8'h9c));
            end
          else
            begin
              reg117 <= wire108;
              reg118 <= wire3[(4'h8):(1'h0)];
              reg119 <= wire106[(4'h9):(3'h6)];
            end
          if ({(reg121[(4'h9):(4'h9)] << ((!reg118[(1'h1):(1'h0)]) ?
                  wire104 : $unsigned((reg4 + reg115)))),
              reg115[(2'h2):(2'h2)]})
            begin
              reg122 <= wire108[(3'h4):(1'h1)];
              reg123 <= wire0[(2'h3):(2'h3)];
            end
          else
            begin
              reg122 <= $signed(wire108);
              reg123 <= ({{($unsigned(reg120) ? $signed(reg122) : (&(8'ha2))),
                          (!$signed(reg123))}} ?
                  (reg119[(1'h0):(1'h0)] ?
                      ((^~reg112) >>> reg115[(3'h7):(1'h1)]) : wire106) : (|$signed($signed((reg122 ?
                      reg121 : reg115)))));
              reg124 <= (wire3[(2'h2):(1'h1)] ?
                  (8'h9d) : {$unsigned((reg120[(2'h3):(2'h3)] << ((8'hb2) << wire2)))});
            end
          reg125 <= wire109[(4'h9):(3'h7)];
          reg126 <= ($signed(reg119) ? (^~wire3) : wire3[(4'hd):(4'hc)]);
        end
      else
        begin
          reg113 <= (|$signed(reg4));
          reg114 <= {reg119, wire0};
          if ((wire3 & ({$unsigned(wire106[(5'h11):(3'h5)])} ^ (!((wire0 ?
                  reg123 : reg124) ?
              (wire111 && wire109) : $signed(reg115))))))
            begin
              reg115 <= $signed((((!(~|reg122)) ?
                      $signed(reg122) : (~^{reg114, reg119})) ?
                  (^((wire107 ?
                      wire108 : (7'h40)) - (reg115 && reg122))) : $unsigned((~|$unsigned(wire104)))));
              reg116 <= reg124;
            end
          else
            begin
              reg115 <= $signed((reg114[(3'h7):(3'h7)] ^ reg126[(1'h0):(1'h0)]));
              reg116 <= wire104[(4'hd):(4'hc)];
              reg117 <= reg114[(3'h4):(1'h0)];
              reg118 <= $unsigned($signed(wire2));
              reg119 <= $unsigned($unsigned($signed(wire111[(3'h5):(3'h4)])));
            end
          reg120 <= ($signed($signed((((8'hb6) ? wire107 : reg116) ?
              (reg121 ?
                  reg124 : reg4) : wire0[(3'h5):(1'h1)]))) + $signed(reg121[(4'h8):(3'h7)]));
          reg121 <= $signed(reg114);
        end
      reg127 <= $unsigned(wire111[(4'h8):(3'h6)]);
    end
  assign wire128 = wire111;
endmodule

module module5
#(parameter param102 = {(~^({{(8'ha7), (8'ha5)}, ((8'hb1) - (8'h9c))} ? (((8'h9f) ? (8'hbe) : (8'ha8)) & (-(8'hb5))) : (^((8'hb3) ? (8'hb0) : (8'h9f))))), (+(~&(-(!(8'hb4)))))}, 
parameter param103 = (~((&param102) ? ({((8'had) ? param102 : param102)} ? (((8'hb3) | param102) ? (param102 ? param102 : (8'hae)) : (^~param102)) : (7'h40)) : param102)))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(5'h13):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire101;
  wire signed [(3'h7):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire signed [(3'h6):(1'h0)] wire98;
  wire [(3'h4):(1'h0)] wire97;
  wire signed [(3'h4):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire94;
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire63,
                 wire27,
                 wire26,
                 wire23,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire65,
                 wire94,
                 reg25,
                 (1'h0)};
  assign wire10 = wire8[(4'h8):(3'h4)];
  assign wire11 = ({wire10[(4'ha):(1'h1)],
                      {(wire6 + ((8'hab) ?
                              wire9 : wire9))}} + (~{(~&{wire8})}));
  assign wire12 = wire9[(4'ha):(3'h5)];
  assign wire13 = wire12[(4'ha):(2'h3)];
  module14 #() modinst24 (wire23, clk, wire12, wire8, wire10, wire7);
  always
    @(posedge clk) begin
      reg25 <= (8'haf);
    end
  assign wire26 = (&(wire8[(4'hb):(4'ha)] || $signed($signed(wire12[(3'h4):(1'h1)]))));
  assign wire27 = wire11;
  module28 #() modinst64 (wire63, clk, wire8, reg25, wire13, wire26);
  assign wire65 = $unsigned(wire12[(4'hc):(3'h5)]);
  module66 #() modinst95 (.wire67(wire7), .wire71(wire23), .y(wire94), .wire70(wire63), .clk(clk), .wire68(wire6), .wire69(wire11));
  assign wire96 = $unsigned({($unsigned((^wire11)) ?
                          (&wire63[(4'hc):(3'h6)]) : (wire26 == $unsigned(wire23))),
                      (wire11 + {$unsigned((8'hb2)), wire8[(5'h13):(2'h2)]})});
  assign wire97 = $unsigned(wire26[(4'h8):(3'h4)]);
  assign wire98 = wire12;
  assign wire99 = $unsigned(wire8);
  assign wire100 = wire96[(2'h3):(2'h2)];
  assign wire101 = $unsigned($unsigned(($signed((^~wire65)) || ((~|wire12) ?
                       {wire63} : (wire94 <<< wire6)))));
endmodule

module module66
#(parameter param92 = ((^~(~^{(|(8'hba))})) + (^(+(-((8'hba) > (8'hb6)))))), 
parameter param93 = {(+(((param92 ? param92 : param92) ^~ (~^(7'h40))) >= param92))})
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire71;
  input wire signed [(4'he):(1'h0)] wire70;
  input wire signed [(4'h9):(1'h0)] wire69;
  input wire signed [(4'h8):(1'h0)] wire68;
  input wire [(4'hf):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(3'h5):(1'h0)] wire88;
  wire [(4'hc):(1'h0)] wire87;
  wire signed [(2'h3):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire [(4'he):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire74;
  wire signed [(5'h14):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  reg [(2'h2):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire72 = (^~((wire69 ?
                          $signed($signed(wire70)) : (|wire70[(4'ha):(4'ha)])) ?
                      wire67 : ((~^((7'h42) ?
                          (8'h9c) : wire68)) << ({wire70} > (~^wire69)))));
  assign wire73 = wire68[(3'h6):(3'h5)];
  assign wire74 = (~(wire73[(4'hf):(3'h7)] ?
                      $unsigned(((wire72 ?
                          wire73 : (8'ha1)) ~^ wire72)) : $unsigned($unsigned((wire73 ?
                          wire70 : (8'had))))));
  assign wire75 = wire68[(3'h4):(1'h0)];
  assign wire76 = {$signed((wire75 < wire73[(4'hd):(4'ha)])),
                      {(8'hbf), wire69}};
  assign wire77 = (8'hb5);
  always
    @(posedge clk) begin
      reg78 <= ({{(8'hb8), wire77}} | {wire77[(4'hc):(4'ha)]});
      reg79 <= wire69[(2'h2):(2'h2)];
      if ($unsigned($unsigned($signed(((wire69 ? wire71 : wire74) || (reg79 ?
          wire71 : wire69))))))
        begin
          reg80 <= $signed((wire68[(3'h6):(3'h4)] - {(8'hb4),
              wire67[(1'h1):(1'h1)]}));
          reg81 <= $unsigned(wire75);
          reg82 <= $unsigned(wire75);
          reg83 <= (+($signed((+$unsigned(reg79))) + (&wire70)));
          reg84 <= $unsigned($signed(reg79));
        end
      else
        begin
          reg80 <= $signed($unsigned($signed(wire70)));
        end
    end
  assign wire85 = reg80;
  assign wire86 = wire67;
  assign wire87 = $unsigned(wire72[(3'h5):(3'h4)]);
  assign wire88 = {wire75};
  assign wire89 = (^~(!(wire88[(3'h4):(3'h4)] - $signed((wire72 ?
                      reg78 : wire77)))));
  assign wire90 = $signed($signed((^$signed(wire89[(1'h1):(1'h1)]))));
  assign wire91 = (+{$signed(reg79),
                      (($signed(wire72) ?
                          (~^wire68) : (wire75 & wire85)) <<< ((wire69 ?
                              wire77 : wire85) ?
                          reg82 : reg79[(1'h0):(1'h0)]))});
endmodule

module module28
#(parameter param62 = ((~((((8'ha2) ^ (8'hba)) ? ((8'hb5) < (7'h40)) : {(8'hb7)}) ^~ (((8'hbc) ^~ (8'hb0)) ~^ ((8'hbf) ^ (8'hbb))))) != (((((7'h44) ? (8'haf) : (8'h9f)) ? (+(8'hb4)) : ((8'ha1) ? (8'hba) : (8'ha3))) ? (~|((8'hbe) != (7'h43))) : {(~^(8'h9d)), ((8'ha5) * (8'ha8))}) ? (({(7'h44), (7'h43)} ? (~|(8'hb2)) : ((8'hb0) <<< (8'haf))) ? ({(8'hb4)} ^ ((7'h40) * (8'ha8))) : ((~(8'hb2)) ? (^(8'haf)) : (-(7'h44)))) : (&(-((8'hbe) <= (8'ha4)))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire32;
  input wire [(5'h10):(1'h0)] wire31;
  input wire [(3'h6):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  assign y = {wire61,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg60,
                 reg59,
                 reg58,
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
                 (1'h0)};
  assign wire33 = wire31;
  assign wire34 = wire30[(3'h4):(2'h2)];
  assign wire35 = $unsigned((8'ha8));
  assign wire36 = $signed(wire29);
  assign wire37 = ((~&$signed($signed((^wire33)))) ?
                      (^((wire31 >> ((8'hb9) ?
                          (7'h44) : (8'hbf))) && wire29[(2'h3):(2'h3)])) : (((~wire35[(4'hc):(3'h5)]) << ($unsigned(wire36) ?
                          wire30 : (wire35 ?
                              wire34 : wire33))) ^ (|($signed(wire33) ?
                          (!wire33) : (wire35 * wire33)))));
  assign wire38 = wire30[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      reg39 <= (^(($signed($signed((8'hba))) ?
          $signed($signed(wire36)) : ($signed(wire34) & wire33)) ~^ $signed(wire36)));
      reg40 <= wire33;
      reg41 <= {$unsigned($unsigned(wire32[(4'hb):(1'h0)]))};
      reg42 <= $unsigned(reg40[(2'h3):(2'h2)]);
      if ($signed((-(!wire33))))
        begin
          if ($signed(((&reg40[(3'h6):(3'h4)]) ?
              $signed((wire33 ?
                  ((8'hbc) ?
                      reg42 : wire34) : reg42)) : (((~&wire31) == {wire37}) ?
                  $unsigned($unsigned(wire34)) : $unsigned($unsigned((8'hab)))))))
            begin
              reg43 <= $unsigned(($unsigned($unsigned($unsigned(reg42))) ?
                  $signed(((reg40 ?
                      wire32 : wire30) | $unsigned(wire29))) : $unsigned($signed(reg41[(1'h0):(1'h0)]))));
              reg44 <= {reg39[(1'h1):(1'h1)]};
              reg45 <= wire38;
              reg46 <= wire34;
              reg47 <= ($unsigned($signed(((reg40 ?
                      reg40 : (8'ha1)) ^ wire36))) ?
                  $unsigned(reg43[(1'h0):(1'h0)]) : wire33[(4'ha):(1'h0)]);
            end
          else
            begin
              reg43 <= ($signed({$signed((wire33 || reg47))}) ?
                  {$unsigned(reg46[(4'h9):(4'h8)]),
                      ((reg44[(4'ha):(1'h1)] ?
                              wire29[(2'h2):(1'h1)] : (-wire35)) ?
                          $unsigned(wire29[(3'h5):(3'h4)]) : (8'hb2))} : (^~reg40));
            end
        end
      else
        begin
          if (wire38[(3'h4):(1'h1)])
            begin
              reg43 <= (wire29[(3'h6):(3'h6)] ? reg46 : reg46);
              reg44 <= ({(((wire37 & wire32) ?
                          reg41[(2'h2):(1'h1)] : $unsigned((8'hb2))) ?
                      $unsigned((8'ha8)) : ($signed(reg42) ?
                          $unsigned(wire38) : (-wire31)))} << (!(~(wire34[(5'h11):(4'he)] ?
                  {reg39} : $signed((7'h43))))));
              reg45 <= $unsigned(($unsigned($unsigned($unsigned(reg39))) ^ (+reg44)));
            end
          else
            begin
              reg43 <= (($signed((-(reg47 ?
                  reg39 : reg43))) >>> (&wire36)) >> (wire34[(4'h9):(1'h0)] & $signed($unsigned((&reg43)))));
            end
          if (({{((8'haf) ? wire35 : $unsigned(wire36)), $unsigned((-reg39))},
              wire32[(3'h4):(1'h1)]} ^~ ($signed((~((8'hb1) ^ reg39))) == {$unsigned($signed(reg41))})))
            begin
              reg46 <= (($unsigned($signed((reg42 ? (8'ha9) : wire30))) ?
                  $unsigned(wire31) : wire35) | ((|(^~(wire38 ?
                  wire33 : reg39))) + $signed(wire30[(1'h0):(1'h0)])));
              reg47 <= $signed(wire29[(1'h0):(1'h0)]);
              reg48 <= reg42[(2'h2):(2'h2)];
              reg49 <= ((~($unsigned($signed(reg46)) ?
                      reg46[(3'h5):(3'h4)] : (|(wire29 <<< wire33)))) ?
                  ($unsigned(reg44) << $signed($unsigned((^(7'h41))))) : {{$signed($unsigned((8'h9c))),
                          $signed((8'hb0))}});
            end
          else
            begin
              reg46 <= $unsigned((reg47[(3'h4):(3'h4)] ?
                  (^$signed($unsigned((7'h42)))) : (wire38[(3'h5):(1'h0)] ?
                      wire38[(2'h3):(1'h0)] : ((~wire36) <= reg48[(1'h1):(1'h1)]))));
              reg47 <= wire31[(2'h3):(1'h1)];
            end
          reg50 <= ($signed($unsigned((^~{wire32}))) ?
              (~reg45[(4'h8):(3'h7)]) : ({{(reg49 ?
                          wire34 : wire34)}} <<< {wire36[(3'h4):(3'h4)],
                  wire32[(4'ha):(3'h5)]}));
        end
    end
  assign wire51 = wire30;
  assign wire52 = $signed($unsigned(reg45[(3'h4):(1'h0)]));
  assign wire53 = ($unsigned(reg50) & $signed($unsigned({(wire52 ?
                          (7'h42) : wire31),
                      (~^wire32)})));
  assign wire54 = wire34;
  assign wire55 = $signed($unsigned({($signed(reg49) ? wire54 : reg47)}));
  assign wire56 = {$signed(($signed($signed((8'ha3))) | $unsigned(((8'hb8) * (8'had)))))};
  assign wire57 = ((((~^(reg41 >> wire31)) ?
                              (&(wire34 ? (8'hab) : (8'hb9))) : (-(wire33 ?
                                  reg46 : wire30))) ?
                          (~wire33[(4'hf):(2'h3)]) : ((~&$signed(wire31)) ?
                              wire33[(4'ha):(2'h2)] : $unsigned((~&reg43)))) ?
                      {wire56[(1'h0):(1'h0)]} : $unsigned(reg48[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg58 <= $signed((&((((8'h9d) ? wire54 : wire36) ?
              ((7'h41) && wire29) : (!(8'hb1))) ?
          $unsigned($signed(wire29)) : (wire51 ?
              (wire32 ? wire57 : (8'ha2)) : $unsigned(reg50)))));
      reg59 <= wire57[(3'h6):(2'h2)];
      reg60 <= wire35;
    end
  assign wire61 = $signed(reg46[(3'h7):(1'h1)]);
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire18;
  input wire signed [(4'hb):(1'h0)] wire17;
  input wire [(3'h6):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire15;
  wire signed [(4'hb):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire21;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  assign y = {wire22, wire21, wire20, wire19, (1'h0)};
  assign wire19 = wire15[(3'h6):(3'h6)];
  assign wire20 = $signed((($unsigned((wire15 ? wire15 : (8'ha9))) ?
                          $unsigned($signed(wire19)) : wire17[(4'h9):(2'h3)]) ?
                      wire17 : (|($signed((8'hae)) ?
                          $signed(wire19) : {wire18}))));
  assign wire21 = $signed((8'h9e));
  assign wire22 = (~&(wire21[(2'h3):(1'h0)] ?
                      $unsigned(wire20) : $unsigned({wire21[(4'hb):(2'h3)],
                          wire15})));
endmodule
