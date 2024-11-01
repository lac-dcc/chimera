module top #(parameter param291 = (8'hb3)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h292):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire278;
  wire signed [(4'hb):(1'h0)] wire277;
  wire signed [(4'hd):(1'h0)] wire276;
  wire [(5'h14):(1'h0)] wire275;
  wire signed [(5'h15):(1'h0)] wire274;
  wire [(3'h6):(1'h0)] wire245;
  wire [(5'h10):(1'h0)] wire244;
  wire signed [(4'hf):(1'h0)] wire243;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire241;
  wire [(5'h15):(1'h0)] wire267;
  wire [(5'h10):(1'h0)] wire268;
  wire [(4'hd):(1'h0)] wire270;
  wire signed [(3'h4):(1'h0)] wire272;
  wire [(5'h12):(1'h0)] wire280;
  wire signed [(4'hc):(1'h0)] wire281;
  wire signed [(4'h8):(1'h0)] wire282;
  reg [(5'h15):(1'h0)] reg290 = (1'h0);
  reg [(5'h15):(1'h0)] reg289 = (1'h0);
  reg [(3'h6):(1'h0)] reg288 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg287 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg286 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg285 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg284 = (1'h0);
  reg [(3'h7):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg248 = (1'h0);
  reg [(4'h8):(1'h0)] reg249 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg250 = (1'h0);
  reg [(5'h11):(1'h0)] reg251 = (1'h0);
  reg [(4'he):(1'h0)] reg252 = (1'h0);
  reg [(4'hf):(1'h0)] reg253 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg254 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg255 = (1'h0);
  reg [(3'h5):(1'h0)] reg256 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg257 = (1'h0);
  reg [(4'hf):(1'h0)] reg258 = (1'h0);
  reg [(5'h11):(1'h0)] reg259 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg260 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg261 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg262 = (1'h0);
  reg [(2'h2):(1'h0)] reg263 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg264 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg265 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg266 = (1'h0);
  assign y = {wire278,
                 wire277,
                 wire276,
                 wire275,
                 wire274,
                 wire245,
                 wire244,
                 wire243,
                 wire47,
                 wire4,
                 wire49,
                 wire50,
                 wire241,
                 wire267,
                 wire268,
                 wire270,
                 wire272,
                 wire280,
                 wire281,
                 wire282,
                 reg290,
                 reg289,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg284,
                 reg247,
                 reg248,
                 reg249,
                 reg250,
                 reg251,
                 reg252,
                 reg253,
                 reg254,
                 reg255,
                 reg256,
                 reg257,
                 reg258,
                 reg259,
                 reg260,
                 reg261,
                 reg262,
                 reg263,
                 reg264,
                 reg265,
                 reg266,
                 (1'h0)};
  assign wire4 = {((((wire3 ? wire0 : wire0) ?
                             (~|wire0) : $unsigned(wire0)) > wire1[(1'h0):(1'h0)]) ?
                         (wire3 >= (~^(~|wire2))) : wire0[(5'h13):(5'h12)]),
                     (((^(wire2 << wire3)) ?
                             ($unsigned((8'h9d)) <<< wire1[(1'h1):(1'h0)]) : $signed({wire1,
                                 wire0})) ?
                         wire0[(4'h9):(2'h3)] : {$unsigned(wire3[(3'h4):(1'h0)]),
                             ((~^wire3) <= $unsigned(wire0))})};
  module5 #() modinst48 (wire47, clk, wire4, wire2, wire3, wire0, wire1);
  assign wire49 = ({(wire3[(3'h4):(2'h2)] - {wire1[(4'he):(4'ha)],
                          $signed(wire2)})} <<< ($signed(($unsigned(wire0) < wire2)) ?
                      (wire4 ?
                          ((wire2 ?
                              wire47 : wire2) ^~ wire4) : $signed(((8'ha8) ?
                              wire1 : wire3))) : wire1[(4'h8):(3'h5)]));
  assign wire50 = ({wire0} << (wire2[(4'h8):(3'h4)] ?
                      ((~&wire47[(3'h5):(3'h4)]) <= ((~^wire47) == (wire2 ?
                          (8'hb3) : wire49))) : (7'h44)));
  module51 #() modinst242 (wire241, clk, wire50, wire47, wire0, wire1, wire3);
  assign wire243 = (~^((^($unsigned(wire0) ? wire4 : (+wire3))) ?
                       wire1 : $unsigned($unsigned((8'hba)))));
  assign wire244 = $unsigned($unsigned(((wire2[(4'ha):(3'h6)] <<< wire2[(4'h9):(1'h1)]) ?
                       (-((8'hb0) == (8'hb6))) : $signed({(8'ha3)}))));
  module51 #() modinst246 (.wire53(wire244), .y(wire245), .wire56(wire241), .wire55(wire4), .wire52(wire2), .clk(clk), .wire54(wire47));
  always
    @(posedge clk) begin
      reg247 <= {$unsigned((+wire0)),
          ((^~{wire1[(4'hb):(2'h2)]}) - ({(wire244 >= wire243)} < wire4[(3'h7):(1'h0)]))};
      if ($unsigned((-$signed(($signed(wire47) >= (wire244 >> (8'hb5)))))))
        begin
          reg248 <= wire50[(4'he):(1'h1)];
          reg249 <= ($signed($unsigned(((!(8'ha4)) ?
                  $unsigned(wire241) : wire1))) ?
              wire0[(4'h9):(2'h2)] : $unsigned(((((8'hb9) ^~ wire243) ?
                      ((8'hb0) ? wire245 : (8'hb2)) : (&wire47)) ?
                  wire50 : $unsigned((wire50 > wire47)))));
          if ((~wire3[(4'ha):(1'h1)]))
            begin
              reg250 <= ({(|$unsigned((wire244 >= reg249)))} ?
                  $unsigned($unsigned($signed(wire0))) : $signed(wire241));
              reg251 <= (reg250[(1'h1):(1'h0)] + (wire241 ?
                  $signed(wire2[(2'h2):(2'h2)]) : $unsigned($signed($signed(reg250)))));
            end
          else
            begin
              reg250 <= wire244;
              reg251 <= $unsigned($signed({wire243, (~^(+wire47))}));
            end
        end
      else
        begin
          if (((($signed((+reg248)) < ((~&wire50) + wire243[(4'hc):(4'hc)])) != (wire244 ?
                  $unsigned((wire241 >= wire50)) : (wire241[(4'hb):(3'h5)] ?
                      wire4[(1'h0):(1'h0)] : wire244[(2'h2):(2'h2)]))) ?
              $unsigned(wire245) : $unsigned(reg250[(2'h2):(1'h0)])))
            begin
              reg248 <= $signed($unsigned((((wire4 | reg248) < (~&wire1)) ?
                  wire0 : ((reg249 ^ wire1) ? (reg247 & reg248) : (~reg250)))));
              reg249 <= ($signed(((!$signed(wire241)) ?
                      wire244 : (!(wire0 > (8'hb9))))) ?
                  $signed(reg250[(3'h5):(2'h3)]) : $signed(wire3));
              reg250 <= $unsigned((wire2 & ($unsigned(wire50[(2'h3):(2'h3)]) ?
                  reg247[(2'h3):(1'h0)] : (((8'hbd) >>> wire241) ?
                      wire49 : wire50[(4'hc):(4'ha)]))));
              reg251 <= ($unsigned(wire243) ? wire0[(4'hc):(4'h8)] : reg250);
              reg252 <= wire1[(4'h9):(3'h4)];
            end
          else
            begin
              reg248 <= $signed((wire2 ?
                  ($unsigned((!wire50)) & ((reg252 ^ wire243) ^~ $unsigned(reg247))) : $unsigned(wire245)));
              reg249 <= reg250[(1'h1):(1'h0)];
              reg250 <= reg248;
              reg251 <= (wire50[(4'hf):(4'he)] ?
                  (8'h9f) : $signed((reg251 == ((&(8'ha4)) >> wire241))));
            end
        end
      if ({{wire0[(4'hb):(4'h9)],
              $unsigned((wire241 ? (wire4 ^ wire245) : wire3[(5'h13):(4'h9)]))},
          (+$unsigned(wire47))})
        begin
          reg253 <= (wire0[(5'h12):(5'h11)] ?
              (wire3 ?
                  (~^({(8'hb2)} ?
                      reg247 : (wire241 ? wire49 : wire1))) : reg252) : reg247);
          reg254 <= (wire2[(3'h4):(3'h4)] * (~&wire2[(2'h2):(2'h2)]));
          reg255 <= {$signed($unsigned(reg247))};
        end
      else
        begin
          reg253 <= $signed(reg255[(3'h7):(3'h7)]);
          reg254 <= $unsigned($unsigned($signed({$signed(wire1),
              ((7'h42) ? reg255 : wire241)})));
          reg255 <= (~wire245);
          reg256 <= $unsigned(({reg254[(4'ha):(3'h5)]} ?
              ($unsigned((wire3 - wire50)) || (wire1 ?
                  (+wire2) : {wire0})) : reg249[(2'h2):(1'h1)]));
          reg257 <= (reg254[(2'h3):(2'h2)] ?
              $signed((~^(~|(wire50 && reg249)))) : $unsigned(((~$signed(reg250)) << $signed({(8'haa)}))));
        end
      if ({$signed($signed(((reg248 && wire2) - {wire47}))),
          ($unsigned((^~{wire4})) ?
              (~&((^~wire0) ?
                  wire49[(2'h2):(1'h0)] : $unsigned(reg248))) : (&$signed(wire0)))})
        begin
          if ((-wire243[(4'hb):(4'ha)]))
            begin
              reg258 <= ($unsigned(reg256) && $unsigned(reg248[(4'hc):(2'h3)]));
              reg259 <= {wire3, reg249[(3'h5):(2'h2)]};
              reg260 <= (~reg253[(3'h6):(3'h6)]);
              reg261 <= reg252;
              reg262 <= reg259[(4'he):(3'h6)];
            end
          else
            begin
              reg258 <= reg259[(4'hf):(4'hb)];
              reg259 <= ((~|reg249[(3'h7):(3'h5)]) ?
                  (-(~^($unsigned(wire1) ?
                      (~reg250) : $signed((8'haa))))) : {wire50});
              reg260 <= $unsigned(reg256);
            end
          reg263 <= $unsigned(reg255);
          reg264 <= $signed(reg255);
          reg265 <= reg249;
        end
      else
        begin
          reg258 <= reg251;
          if ($unsigned(reg252))
            begin
              reg259 <= {$signed({(8'hbd)}), wire244[(5'h10):(5'h10)]};
              reg260 <= ((|$unsigned(((wire241 && wire243) ^ $signed((8'hab))))) ?
                  $unsigned($signed(reg265)) : reg248[(4'h8):(3'h4)]);
              reg261 <= (reg248[(1'h0):(1'h0)] ^ reg253);
            end
          else
            begin
              reg259 <= {((+reg259[(3'h5):(2'h2)]) ^ reg261)};
            end
        end
      reg266 <= ($signed((^~(-(wire243 ^ (8'ha6))))) >= ($signed(reg265) < (8'hb5)));
    end
  assign wire267 = reg258;
  module59 #() modinst269 (.y(wire268), .clk(clk), .wire63(reg258), .wire61(reg259), .wire62(wire243), .wire60(wire47));
  module59 #() modinst271 (wire270, clk, reg262, wire268, reg251, wire47);
  module11 #() modinst273 (.wire12(wire267), .y(wire272), .clk(clk), .wire14(reg253), .wire15(reg250), .wire13(reg251));
  assign wire274 = reg248;
  assign wire275 = reg260;
  assign wire276 = reg262[(4'ha):(1'h0)];
  assign wire277 = {$unsigned(wire2), $unsigned((8'ha2))};
  module5 #() modinst279 (wire278, clk, wire50, reg257, wire47, wire267, reg266);
  assign wire280 = {{$unsigned({{wire244}}),
                           {((reg261 ? wire275 : reg253) > (wire47 ?
                                   wire4 : (8'ha0))),
                               ((8'h9d) - wire243)}},
                       (^$signed({(reg259 ? reg259 : reg263), {wire275}}))};
  assign wire281 = (~($unsigned(((wire47 ? wire274 : wire50) << (reg252 ?
                           wire267 : wire275))) ?
                       $signed($unsigned((wire243 > wire267))) : (reg265[(2'h3):(2'h3)] & ((wire49 ?
                               reg260 : (8'hbe)) ?
                           (reg262 ?
                               wire245 : wire243) : ((8'ha6) ^ (8'hb4))))));
  module74 #() modinst283 (.wire78(reg248), .clk(clk), .wire76(wire49), .wire77(reg261), .wire79(wire281), .wire75(wire2), .y(wire282));
  always
    @(posedge clk) begin
      if (($signed({$unsigned(reg252[(2'h2):(1'h0)])}) - $unsigned(wire1)))
        begin
          reg284 <= (~|$signed(($unsigned(wire275[(2'h3):(2'h3)]) != (wire276[(2'h2):(2'h2)] && {wire0}))));
          reg285 <= $signed(reg260[(3'h5):(1'h0)]);
          reg286 <= wire2[(5'h11):(4'he)];
          reg287 <= $unsigned((^reg255));
          reg288 <= reg259;
        end
      else
        begin
          reg284 <= (|(({(~wire278)} * ((wire47 ?
              wire274 : reg247) > wire1)) * (!({wire3, (8'hb1)} ?
              (^~reg261) : (~reg248)))));
          if ($signed(($unsigned(reg288) ?
              ((reg288[(3'h5):(2'h3)] ? reg256 : (|wire243)) ?
                  $unsigned(reg251[(5'h10):(2'h3)]) : reg258) : $signed(wire2[(4'hf):(4'ha)]))))
            begin
              reg285 <= ((~|({{wire281, (8'ha4)}, (reg266 ^ wire245)} ?
                      (!$signed(reg255)) : (8'hba))) ?
                  $unsigned(wire270[(3'h6):(1'h0)]) : $signed((^~$unsigned($signed(wire276)))));
              reg286 <= wire277;
            end
          else
            begin
              reg285 <= (8'ha2);
            end
        end
      reg289 <= $unsigned((~&$unsigned((8'hb4))));
      reg290 <= wire243;
    end
endmodule

module module51
#(parameter param240 = (((8'hb3) - ((((8'hbf) <= (8'hbc)) >>> ((8'haf) & (7'h44))) * {((7'h42) >>> (8'hb6)), {(7'h42), (8'hba)}})) ? (((((7'h42) >> (8'h9d)) <<< (8'hb6)) ? (((8'ha2) ? (8'ha0) : (8'h9f)) ? (8'hb4) : (~&(8'hbc))) : (!((8'hae) && (8'h9f)))) ? (^(^((7'h41) <<< (7'h40)))) : ({((8'hae) ? (8'h9e) : (8'hb9)), ((8'hb3) ? (7'h40) : (8'had))} ? {{(8'hbf)}, ((8'hb0) || (8'hb9))} : (((8'ha9) ? (8'ha5) : (8'ha4)) * (|(8'hb5))))) : ({(8'hb6)} ? {(((8'hba) >> (8'hb2)) == ((8'hbe) ? (7'h43) : (8'hbd))), (~^((8'hb4) >>> (8'hac)))} : (({(8'hb7)} << (^~(8'hb1))) ? (((8'ha0) < (8'hb8)) && ((8'hb0) ? (8'ha4) : (8'hbc))) : ((|(8'hae)) ? {(8'ha4), (8'ha8)} : ((8'ha9) && (8'hb3)))))))
(y, clk, wire52, wire53, wire54, wire55, wire56);
  output wire [(32'h1c2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire52;
  input wire signed [(5'h10):(1'h0)] wire53;
  input wire [(4'he):(1'h0)] wire54;
  input wire signed [(5'h14):(1'h0)] wire55;
  input wire signed [(5'h14):(1'h0)] wire56;
  wire [(3'h6):(1'h0)] wire239;
  wire signed [(4'hf):(1'h0)] wire238;
  wire [(5'h14):(1'h0)] wire236;
  wire signed [(4'he):(1'h0)] wire199;
  wire [(5'h11):(1'h0)] wire198;
  wire signed [(5'h10):(1'h0)] wire197;
  wire [(4'h8):(1'h0)] wire196;
  wire [(2'h3):(1'h0)] wire194;
  wire [(4'hd):(1'h0)] wire105;
  wire [(4'h8):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire103;
  reg [(2'h2):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(5'h12):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(2'h3):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(5'h10):(1'h0)] reg120 = (1'h0);
  reg [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg [(4'he):(1'h0)] reg116 = (1'h0);
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg [(3'h5):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg108 = (1'h0);
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  assign y = {wire239,
                 wire238,
                 wire236,
                 wire199,
                 wire198,
                 wire197,
                 wire196,
                 wire194,
                 wire105,
                 wire57,
                 wire58,
                 wire72,
                 wire103,
                 reg134,
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
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire57 = $signed((|$signed((&wire54[(4'ha):(3'h5)]))));
  assign wire58 = (~^wire57);
  module59 #() modinst73 (.y(wire72), .clk(clk), .wire63(wire58), .wire62(wire56), .wire60(wire57), .wire61(wire52));
  module74 #() modinst104 (.wire76(wire58), .wire75(wire52), .wire77(wire53), .y(wire103), .wire79(wire55), .wire78(wire72), .clk(clk));
  assign wire105 = wire57;
  always
    @(posedge clk) begin
      if ($unsigned((-($signed((wire54 ^~ (8'hb2))) ?
          ((^~wire52) <= wire53) : {wire57, (wire72 ? wire52 : wire105)}))))
        begin
          reg106 <= $signed($signed((wire56[(5'h14):(3'h5)] ?
              $unsigned($signed(wire55)) : (^~$signed(wire58)))));
        end
      else
        begin
          reg106 <= $unsigned(((!(~(wire103 ? wire72 : wire72))) ?
              $unsigned((~|wire105)) : $signed(wire103[(2'h3):(2'h2)])));
          if ((wire54[(4'he):(4'hd)] != $signed((((wire52 << wire72) & {wire105,
                  wire54}) ?
              $unsigned((wire58 ?
                  (8'ha9) : wire53)) : $signed($unsigned(wire105))))))
            begin
              reg107 <= wire57;
              reg108 <= (($signed($unsigned($unsigned(wire53))) ^~ wire54[(4'hd):(4'hc)]) ?
                  wire58 : ({wire105[(1'h1):(1'h1)]} ?
                      (-(~^((8'ha7) ?
                          (8'hbc) : wire56))) : (!$signed(wire103))));
              reg109 <= $unsigned((~&{((wire105 & reg108) ?
                      (~&wire72) : (wire54 + (8'ha3))),
                  $unsigned($unsigned(reg106))}));
            end
          else
            begin
              reg107 <= reg108[(1'h1):(1'h1)];
              reg108 <= wire52[(1'h0):(1'h0)];
              reg109 <= ((+$signed($signed((reg108 ^ (8'hab))))) ?
                  $unsigned({(^$unsigned(wire56))}) : ({($unsigned(reg108) ?
                              reg108[(2'h2):(2'h2)] : $signed(reg108)),
                          $signed({(8'ha7), reg108})} ?
                      $signed(reg109) : ((~^(wire54 ? reg109 : wire56)) ?
                          ($unsigned(wire105) << $signed(wire56)) : wire58)));
              reg110 <= (^~wire57[(2'h3):(1'h1)]);
              reg111 <= ((wire57 << {$signed($signed(wire53))}) >>> ((((reg106 ?
                      reg108 : wire57) == {wire58, wire57}) << $signed((wire72 ?
                      wire56 : wire53))) ?
                  $signed($unsigned({reg109,
                      (8'ha2)})) : (-$unsigned(wire53[(4'h9):(1'h0)]))));
            end
          reg112 <= $unsigned(wire58);
          reg113 <= (($unsigned($signed((^(8'hab)))) ^ (|reg108)) == $signed($unsigned((((8'ha1) >> (8'hb6)) ?
              (reg107 * reg109) : $signed(reg107)))));
          reg114 <= reg111[(3'h4):(1'h0)];
        end
      reg115 <= $unsigned((8'hac));
      if ($signed((wire72[(4'ha):(4'h9)] <<< $unsigned({$unsigned(reg112),
          (wire54 ? reg112 : reg115)}))))
        begin
          reg116 <= reg109[(2'h2):(1'h0)];
          reg117 <= (reg114 >> ((((wire53 ?
                  wire57 : reg106) || reg108[(3'h4):(2'h3)]) > wire105) ?
              ($unsigned((wire53 ? reg113 : reg108)) ?
                  $signed($signed(reg114)) : wire55[(3'h6):(3'h4)]) : {wire103[(3'h7):(1'h0)]}));
          if ((^~$signed(reg107)))
            begin
              reg118 <= (8'hac);
              reg119 <= (~|{(reg116 ?
                      $signed(wire53[(3'h5):(3'h5)]) : (reg118 ?
                          reg106 : reg116))});
            end
          else
            begin
              reg118 <= ((~&wire58[(1'h0):(1'h0)]) ?
                  reg116[(1'h1):(1'h1)] : ({reg106[(1'h1):(1'h0)],
                          ((~|reg111) | (reg113 ? (8'hab) : (8'ha4)))} ?
                      reg109[(1'h0):(1'h0)] : $unsigned($signed((reg114 ?
                          wire56 : wire103)))));
            end
        end
      else
        begin
          reg116 <= wire55;
        end
      reg120 <= wire52;
    end
  always
    @(posedge clk) begin
      if (reg119[(2'h2):(1'h0)])
        begin
          if ({wire53[(4'hc):(3'h4)]})
            begin
              reg121 <= wire56;
            end
          else
            begin
              reg121 <= {wire54[(4'hd):(4'ha)],
                  $unsigned((^~((wire52 ? reg120 : (8'hab)) ?
                      (^wire57) : ((8'hb5) ? reg117 : (8'hb5)))))};
              reg122 <= (-(~$signed($unsigned($unsigned((8'ha8))))));
              reg123 <= ((^~{$signed({reg113})}) && (7'h42));
            end
          if ((wire56[(1'h0):(1'h0)] ~^ (wire54[(4'h8):(1'h0)] ?
              ((+(reg116 ? reg119 : reg117)) ?
                  $unsigned($unsigned(reg117)) : reg120[(4'he):(4'he)]) : $unsigned($unsigned((reg111 ?
                  reg109 : wire103))))))
            begin
              reg124 <= $signed({$unsigned($unsigned((reg121 >> reg113))),
                  wire58[(4'h8):(1'h0)]});
              reg125 <= (wire105[(4'hb):(4'h9)] ?
                  (~&(~{(~reg110)})) : reg120[(3'h7):(3'h7)]);
            end
          else
            begin
              reg124 <= {(-reg108[(3'h4):(2'h3)])};
              reg125 <= (-{($unsigned($unsigned(reg106)) ?
                      $unsigned((-reg121)) : reg117)});
              reg126 <= (~(7'h42));
              reg127 <= reg107[(1'h1):(1'h0)];
              reg128 <= ((^~reg112[(3'h5):(3'h5)]) ?
                  (^~reg110[(1'h1):(1'h1)]) : (~&($signed($unsigned(reg109)) ?
                      reg122[(4'hf):(3'h6)] : ((reg124 ? reg113 : reg125) ?
                          reg120 : reg121[(4'h8):(2'h3)]))));
            end
          if ((reg122 ? reg127 : $unsigned((-$signed(((8'ha7) ^~ (8'ha8)))))))
            begin
              reg129 <= (^~(reg108 ?
                  ({$unsigned(reg109),
                      (reg128 >> (8'hab))} | (~&wire55)) : (|($unsigned(reg107) ?
                      wire53 : (~^reg108)))));
              reg130 <= {reg126};
            end
          else
            begin
              reg129 <= $signed((((wire105 ? reg108[(1'h0):(1'h0)] : reg108) ?
                      reg118[(1'h0):(1'h0)] : ($signed(reg114) - {reg119,
                          reg107})) ?
                  $signed(reg125[(3'h5):(3'h4)]) : (~^((reg129 ?
                          reg113 : reg117) ?
                      (wire56 < reg118) : (reg118 << reg107)))));
            end
        end
      else
        begin
          reg121 <= (!reg127);
          reg122 <= (^~(|$unsigned((reg108 + $signed(wire57)))));
          if ($unsigned(((!reg130) ?
              $unsigned(($unsigned(reg116) * reg115[(2'h2):(2'h2)])) : reg130[(1'h1):(1'h0)])))
            begin
              reg123 <= wire55;
            end
          else
            begin
              reg123 <= (8'hb8);
              reg124 <= ((~|(^$unsigned($unsigned(reg108)))) | (^~$signed($signed((reg113 * reg124)))));
              reg125 <= wire52;
              reg126 <= (8'haa);
            end
        end
      reg131 <= ((((~^wire52) ?
          {reg110[(4'h9):(1'h0)], wire72} : (reg123[(1'h1):(1'h0)] ?
              (reg124 ?
                  reg118 : reg114) : (|reg127))) ~^ ($signed($unsigned((8'hae))) && ((reg107 <= wire52) ?
          reg111[(4'hc):(3'h7)] : wire58))) - {$unsigned((^~(reg124 <= reg111))),
          $signed(((^~reg129) ? (8'hb1) : (reg119 >> reg129)))});
      reg132 <= (wire58 ?
          $unsigned(({$unsigned(reg113), $signed(wire54)} ?
              ((reg110 <= wire103) ?
                  ((8'hb8) ?
                      wire52 : reg111) : $unsigned(reg114)) : {$unsigned(wire105),
                  (&(8'h9c))})) : (^(~&(&((7'h40) ? reg112 : reg118)))));
      reg133 <= reg110[(3'h7):(3'h4)];
      reg134 <= (~|$signed({(reg113[(2'h3):(1'h0)] ^~ (|reg123))}));
    end
  module135 #() modinst195 (.wire138(reg117), .wire136(reg121), .y(wire194), .clk(clk), .wire137(reg122), .wire139(reg111), .wire140(reg116));
  assign wire196 = (($unsigned((|wire58[(5'h12):(3'h6)])) | reg123[(2'h3):(2'h2)]) | wire105[(3'h6):(2'h3)]);
  assign wire197 = reg132[(3'h7):(1'h0)];
  assign wire198 = reg117[(2'h2):(2'h2)];
  assign wire199 = (-$unsigned(reg122[(4'h8):(1'h0)]));
  module200 #() modinst237 (wire236, clk, reg133, wire57, reg117, reg115, wire196);
  assign wire238 = reg106;
  assign wire239 = (!($unsigned((~|(^~reg119))) < (^~(~(^reg125)))));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire [(3'h6):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire31;
  reg signed [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  assign y = {wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire31,
                 reg42,
                 reg41,
                 (1'h0)};
  module11 #() modinst32 (wire31, clk, wire9, wire6, wire10, wire8);
  assign wire33 = wire10;
  assign wire34 = $signed($signed($unsigned(wire6[(5'h10):(1'h0)])));
  assign wire35 = wire31;
  assign wire36 = ($unsigned((^wire9)) ?
                      ($unsigned($signed({wire8})) ?
                          wire33 : ($signed(wire9) <<< (wire35 ?
                              $unsigned(wire6) : wire8))) : (8'ha1));
  assign wire37 = $unsigned((($signed(((8'hae) > wire36)) | (wire35 >>> $unsigned(wire7))) ?
                      $signed((wire7[(2'h3):(1'h0)] < wire35[(3'h4):(3'h4)])) : (8'hac)));
  assign wire38 = ({$unsigned(wire34)} ?
                      (~^{(~|((7'h44) ? wire37 : (8'ha8)))}) : (~wire6));
  assign wire39 = $signed((7'h43));
  assign wire40 = wire37[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg41 <= wire40[(4'h8):(3'h7)];
      reg42 <= wire8;
    end
  assign wire43 = ((|{(((8'ha3) ?
                          wire6 : wire34) != (^wire39))}) && wire33[(2'h3):(2'h2)]);
  assign wire44 = wire33;
  assign wire45 = ($unsigned((({(8'hb7)} | wire38[(2'h3):(1'h0)]) >> $unsigned($unsigned(wire43)))) ?
                      (8'ha6) : {($unsigned($signed(wire33)) ?
                              ((~^wire40) - $unsigned(reg41)) : $signed(wire36)),
                          $unsigned(((-wire10) ?
                              wire40[(5'h11):(3'h5)] : $signed(wire35)))});
  assign wire46 = (^wire31[(4'hc):(2'h3)]);
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire15;
  input wire [(4'hf):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'hb):(1'h0)] wire24;
  wire signed [(5'h12):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire20;
  wire signed [(3'h6):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire30,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire16 = wire15;
  assign wire17 = $unsigned((~wire16));
  assign wire18 = ((+{wire14[(4'he):(4'hc)]}) ?
                      ((7'h44) ?
                          {(wire13 ? (wire13 ? wire14 : (8'ha5)) : (^~wire14)),
                              $unsigned($unsigned(wire15))} : $unsigned(wire16[(3'h5):(1'h0)])) : wire14);
  assign wire19 = (wire14 ?
                      ((~^$signed((&wire12))) || $unsigned(($unsigned((8'ha3)) ?
                          (wire17 * (8'ha2)) : $signed((8'ha7))))) : $signed(wire13));
  assign wire20 = wire18[(4'ha):(3'h5)];
  assign wire21 = ((wire20 ?
                      wire19 : $unsigned((|(~&(8'hb6))))) ^~ ((wire15[(1'h1):(1'h0)] + {(wire20 ?
                          (8'ha8) : wire14)}) == wire18[(3'h7):(3'h6)]));
  assign wire22 = wire12;
  assign wire23 = ($unsigned((((wire20 ? (8'hbf) : wire21) ^~ (wire17 ?
                          wire22 : wire13)) ?
                      (wire17[(4'h8):(1'h1)] > (^~wire15)) : (~^wire14[(4'h9):(2'h2)]))) << {$signed($signed($unsigned(wire12)))});
  assign wire24 = wire17[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg25 <= wire12;
      reg26 <= ({$signed({$unsigned(wire15), (8'ha0)})} ?
          (!wire14) : ({$signed((8'hac)), (wire20 || (-wire17))} >= wire17));
      reg27 <= wire24[(1'h1):(1'h0)];
      reg28 <= ($signed((($signed(wire15) >> $signed(wire14)) ?
              wire13 : wire17)) ?
          (^~(wire20[(3'h7):(1'h0)] ?
              (^(^wire20)) : $signed(wire19[(2'h3):(1'h0)]))) : wire13);
    end
  always
    @(posedge clk) begin
      reg29 <= ($signed((((wire24 ? wire16 : reg26) ?
              (~&(8'ha2)) : wire18) ~^ ((wire15 << wire19) == {wire22,
              reg26}))) ?
          reg28 : wire17[(4'h8):(2'h2)]);
    end
  assign wire30 = reg26[(3'h7):(3'h7)];
endmodule

module module200  (y, clk, wire205, wire204, wire203, wire202, wire201);
  output wire [(32'h166):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire205;
  input wire signed [(4'h8):(1'h0)] wire204;
  input wire [(4'h8):(1'h0)] wire203;
  input wire signed [(5'h10):(1'h0)] wire202;
  input wire signed [(4'h8):(1'h0)] wire201;
  wire [(4'h8):(1'h0)] wire235;
  wire [(5'h12):(1'h0)] wire215;
  wire signed [(2'h2):(1'h0)] wire214;
  wire [(4'he):(1'h0)] wire213;
  wire [(3'h5):(1'h0)] wire212;
  wire [(4'hc):(1'h0)] wire211;
  wire [(3'h6):(1'h0)] wire210;
  wire signed [(3'h6):(1'h0)] wire209;
  wire signed [(5'h14):(1'h0)] wire208;
  wire [(5'h14):(1'h0)] wire207;
  wire [(2'h2):(1'h0)] wire206;
  reg signed [(4'he):(1'h0)] reg234 = (1'h0);
  reg [(4'hb):(1'h0)] reg233 = (1'h0);
  reg [(4'hb):(1'h0)] reg232 = (1'h0);
  reg [(4'ha):(1'h0)] reg231 = (1'h0);
  reg [(5'h13):(1'h0)] reg230 = (1'h0);
  reg [(5'h10):(1'h0)] reg229 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg228 = (1'h0);
  reg [(2'h2):(1'h0)] reg227 = (1'h0);
  reg [(4'ha):(1'h0)] reg226 = (1'h0);
  reg [(4'h8):(1'h0)] reg225 = (1'h0);
  reg [(5'h12):(1'h0)] reg224 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg223 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg222 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg221 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg220 = (1'h0);
  reg [(2'h3):(1'h0)] reg219 = (1'h0);
  reg [(5'h12):(1'h0)] reg218 = (1'h0);
  reg [(5'h10):(1'h0)] reg217 = (1'h0);
  reg [(2'h2):(1'h0)] reg216 = (1'h0);
  assign y = {wire235,
                 wire215,
                 wire214,
                 wire213,
                 wire212,
                 wire211,
                 wire210,
                 wire209,
                 wire208,
                 wire207,
                 wire206,
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
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 (1'h0)};
  assign wire206 = $signed(wire204[(3'h5):(2'h3)]);
  assign wire207 = (~^{($signed((|wire204)) ?
                           ((~&wire206) ?
                               ((8'ha4) ?
                                   (8'hac) : wire203) : (-(8'hb6))) : $unsigned({wire205})),
                       {$unsigned((wire205 ~^ wire202))}});
  assign wire208 = $unsigned(wire206[(2'h2):(1'h0)]);
  assign wire209 = $unsigned((~$signed($unsigned(wire201[(3'h5):(2'h3)]))));
  assign wire210 = wire205;
  assign wire211 = $signed(wire210[(1'h0):(1'h0)]);
  assign wire212 = $unsigned((&$signed((wire205[(3'h6):(1'h0)] ?
                       (wire210 ? wire205 : wire208) : (-wire203)))));
  assign wire213 = (wire212 != (((^{(8'ha2)}) ?
                           (8'ha5) : {$unsigned(wire207), $unsigned(wire202)}) ?
                       wire210[(1'h0):(1'h0)] : ($signed($signed(wire202)) ^~ wire212[(1'h0):(1'h0)])));
  assign wire214 = (~^((~&$unsigned((wire205 ? (7'h44) : (8'h9e)))) ?
                       wire204 : (~|$unsigned((~wire208)))));
  assign wire215 = ((($unsigned((&(8'hb8))) ?
                           wire205[(2'h3):(1'h1)] : $signed($unsigned(wire208))) >= $unsigned((wire211 <= $unsigned(wire208)))) ?
                       wire205 : ((wire208 ?
                           $unsigned(wire205[(3'h7):(3'h6)]) : (~^(wire212 ?
                               wire206 : wire212))) >= wire202));
  always
    @(posedge clk) begin
      reg216 <= (~wire203[(3'h6):(1'h1)]);
      reg217 <= {(+{(8'ha4), (8'haa)})};
      if ((8'hae))
        begin
          reg218 <= wire215[(1'h0):(1'h0)];
          reg219 <= wire210[(3'h6):(1'h0)];
          reg220 <= {$unsigned(({wire208, wire213} ?
                  {wire205,
                      (wire209 ?
                          (7'h42) : (8'ha1))} : (reg217[(4'h9):(4'h8)] > $unsigned(reg217)))),
              wire206[(2'h2):(2'h2)]};
          reg221 <= (wire202[(4'ha):(3'h4)] - (~^reg218));
        end
      else
        begin
          reg218 <= $signed(wire205[(4'h9):(1'h1)]);
          reg219 <= {{(8'ha1), wire206[(2'h2):(2'h2)]}, wire202[(4'h9):(3'h6)]};
          if ((wire215 ?
              wire212 : ((~(~&$unsigned((7'h44)))) ^~ reg217[(2'h3):(1'h0)])))
            begin
              reg220 <= $unsigned(($unsigned($unsigned(wire202[(4'he):(4'h8)])) <<< ($signed($signed(wire208)) ?
                  (~^(wire213 | wire211)) : $signed(wire210))));
              reg221 <= {$unsigned((8'hb3))};
              reg222 <= (^~{(wire207 != ((~|wire212) ?
                      $unsigned(wire208) : wire215)),
                  ({(~&reg218), (~^(8'hb4))} >>> reg219[(2'h3):(2'h2)])});
              reg223 <= $signed(((~|$signed(wire210[(3'h5):(2'h3)])) >= wire213[(4'ha):(4'h8)]));
            end
          else
            begin
              reg220 <= (($unsigned(({wire206} ?
                          (wire201 << wire211) : (~|(8'hb6)))) ?
                      reg223 : (wire205 <= (-(8'hac)))) ?
                  (reg218 != wire201[(3'h7):(3'h6)]) : wire214[(2'h2):(2'h2)]);
            end
          reg224 <= (!wire210);
          reg225 <= reg218;
        end
      if (((wire205 & {(!$signed(wire210))}) & $unsigned((~&((&reg216) || $signed(wire211))))))
        begin
          if ($unsigned((8'ha0)))
            begin
              reg226 <= ({(wire211[(3'h4):(3'h4)] ?
                      {reg225} : wire205[(3'h5):(2'h3)]),
                  ($unsigned($unsigned(wire209)) ~^ ($signed(wire211) ?
                      $unsigned(wire204) : (~reg216)))} <= $unsigned(wire207));
              reg227 <= (^~wire214[(1'h0):(1'h0)]);
            end
          else
            begin
              reg226 <= (~&(wire213 ?
                  wire210 : $unsigned(((wire209 ? wire202 : wire215) ?
                      (wire215 ? wire211 : reg227) : wire211[(4'hb):(3'h4)]))));
              reg227 <= (|wire214[(1'h0):(1'h0)]);
            end
          reg228 <= (&$signed($signed((((8'ha3) ? wire201 : reg224) ?
              {wire209} : (reg226 ~^ reg216)))));
          reg229 <= (-reg222);
          reg230 <= (~reg222);
        end
      else
        begin
          reg226 <= $unsigned(((+$unsigned($unsigned(reg220))) ?
              {wire206[(2'h2):(2'h2)],
                  {(!wire208),
                      $unsigned(wire210)}} : (((reg222 <= (8'haa)) && $signed(wire214)) * (&reg226))));
          reg227 <= (reg228 ?
              (+reg221[(5'h10):(4'hf)]) : (&(wire213 ?
                  (~wire203[(1'h1):(1'h0)]) : reg229[(1'h0):(1'h0)])));
          reg228 <= reg223[(4'hc):(4'hc)];
          reg229 <= reg224;
          if (wire201)
            begin
              reg230 <= reg226;
              reg231 <= $unsigned(((8'ha2) < $unsigned($signed(reg216[(2'h2):(2'h2)]))));
              reg232 <= {$unsigned(reg224[(4'he):(2'h2)]),
                  $signed($unsigned(wire205))};
              reg233 <= (reg221[(4'hb):(2'h2)] >> reg216);
              reg234 <= $signed($signed(($signed(wire209[(3'h6):(1'h0)]) ^~ reg224)));
            end
          else
            begin
              reg230 <= ((8'hbf) ?
                  ((($signed(reg223) ? $unsigned(reg217) : $unsigned(reg228)) ?
                      $unsigned((reg219 != reg234)) : (reg226 ?
                          (reg224 ?
                              reg223 : reg227) : reg228[(1'h0):(1'h0)])) ^ ($unsigned((wire206 ?
                      reg217 : (8'hac))) == (8'ha3))) : ($signed(reg217) * wire203[(2'h3):(2'h3)]));
            end
        end
    end
  assign wire235 = reg229;
endmodule

module module135  (y, clk, wire140, wire139, wire138, wire137, wire136);
  output wire [(32'h231):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire140;
  input wire [(4'hf):(1'h0)] wire139;
  input wire [(4'hb):(1'h0)] wire138;
  input wire signed [(5'h10):(1'h0)] wire137;
  input wire signed [(4'hd):(1'h0)] wire136;
  wire signed [(4'hb):(1'h0)] wire187;
  wire signed [(4'hb):(1'h0)] wire186;
  wire signed [(4'h8):(1'h0)] wire171;
  wire signed [(3'h7):(1'h0)] wire168;
  wire [(2'h2):(1'h0)] wire167;
  wire signed [(5'h11):(1'h0)] wire166;
  wire [(4'hd):(1'h0)] wire165;
  wire signed [(3'h6):(1'h0)] wire164;
  wire [(4'hf):(1'h0)] wire163;
  wire signed [(4'hb):(1'h0)] wire146;
  wire [(5'h13):(1'h0)] wire145;
  wire [(4'hd):(1'h0)] wire144;
  wire [(4'hd):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire [(3'h4):(1'h0)] wire141;
  reg [(5'h15):(1'h0)] reg193 = (1'h0);
  reg [(4'h8):(1'h0)] reg192 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg191 = (1'h0);
  reg [(4'ha):(1'h0)] reg190 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg188 = (1'h0);
  reg [(4'hc):(1'h0)] reg185 = (1'h0);
  reg [(5'h10):(1'h0)] reg184 = (1'h0);
  reg [(4'h8):(1'h0)] reg183 = (1'h0);
  reg [(5'h14):(1'h0)] reg182 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg181 = (1'h0);
  reg [(3'h6):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg179 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg178 = (1'h0);
  reg [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg175 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg172 = (1'h0);
  reg [(2'h3):(1'h0)] reg170 = (1'h0);
  reg [(4'h9):(1'h0)] reg169 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg162 = (1'h0);
  reg signed [(4'he):(1'h0)] reg161 = (1'h0);
  reg [(4'hb):(1'h0)] reg160 = (1'h0);
  reg [(5'h15):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg158 = (1'h0);
  reg [(4'hc):(1'h0)] reg157 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg156 = (1'h0);
  reg [(5'h15):(1'h0)] reg155 = (1'h0);
  reg [(2'h2):(1'h0)] reg154 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg153 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg151 = (1'h0);
  reg [(2'h2):(1'h0)] reg150 = (1'h0);
  reg [(4'he):(1'h0)] reg149 = (1'h0);
  reg [(4'hf):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire171,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
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
                 reg172,
                 reg170,
                 reg169,
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
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire141 = $signed((&(wire140 ? wire138 : wire136[(2'h3):(1'h0)])));
  assign wire142 = wire136[(4'hb):(4'h8)];
  assign wire143 = (({wire138[(1'h0):(1'h0)]} ?
                           (|$unsigned($unsigned(wire142))) : (wire139[(4'he):(4'hb)] ?
                               (~&wire142) : {wire136[(4'ha):(3'h7)]})) ?
                       wire137[(4'hf):(4'hb)] : wire142);
  assign wire144 = wire138[(4'hb):(1'h1)];
  assign wire145 = ($signed(wire139[(4'h8):(3'h4)]) | {wire139[(2'h2):(2'h2)],
                       wire141[(1'h0):(1'h0)]});
  assign wire146 = $signed($signed(wire142[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg147 <= (wire146[(4'h9):(2'h2)] & $unsigned((-(wire143[(3'h7):(3'h7)] ?
          $unsigned(wire138) : (|wire137)))));
      if ($signed((^(8'ha3))))
        begin
          if (((($unsigned((!wire143)) ?
                  wire138[(1'h0):(1'h0)] : $signed((wire138 ?
                      wire138 : wire138))) != $signed(($unsigned(wire136) >> (-(7'h42))))) ?
              $signed(wire141) : $unsigned(wire137)))
            begin
              reg148 <= $unsigned(wire141[(2'h2):(2'h2)]);
            end
          else
            begin
              reg148 <= reg147;
            end
          reg149 <= $unsigned(wire139[(3'h4):(3'h4)]);
          if ((wire140 ?
              $signed((wire138[(2'h3):(2'h3)] ?
                  (|$unsigned(wire142)) : wire138)) : wire141[(2'h2):(1'h1)]))
            begin
              reg150 <= ({wire138[(3'h4):(1'h0)],
                  {($signed(reg147) == wire140[(4'hc):(3'h4)]),
                      ($unsigned(reg148) ?
                          $signed(wire139) : (wire144 ?
                              wire136 : wire145))}} << (~|wire141[(2'h3):(1'h0)]));
              reg151 <= $signed($unsigned((((wire143 ?
                  reg150 : (8'ha5)) == wire141[(2'h3):(1'h0)]) | $signed((~|wire146)))));
              reg152 <= wire137;
              reg153 <= ((^~{wire137, $signed(wire142[(2'h3):(2'h3)])}) ?
                  $signed($signed(wire142[(3'h4):(2'h3)])) : reg152);
            end
          else
            begin
              reg150 <= $unsigned($unsigned({wire137}));
              reg151 <= wire137[(4'hf):(4'hb)];
              reg152 <= wire140[(3'h6):(3'h4)];
              reg153 <= ((^wire143[(4'h8):(4'h8)]) >> (($unsigned((+wire146)) ?
                      (~|$unsigned(reg152)) : (reg149 ?
                          (wire141 ? reg147 : reg153) : (8'ha2))) ?
                  (((&reg149) ?
                      ((8'hb1) ?
                          wire141 : reg153) : wire144[(2'h3):(2'h3)]) ~^ (wire140 >= $signed(wire140))) : (|($unsigned((8'hb6)) ?
                      {wire139, wire144} : wire139[(4'hb):(4'ha)]))));
              reg154 <= (wire144 > {$signed($signed((reg153 ?
                      wire141 : wire145))),
                  ({$signed(wire143), wire136[(1'h1):(1'h0)]} ?
                      wire140 : (reg152[(3'h5):(2'h3)] >> wire139[(3'h4):(1'h0)]))});
            end
          if ($unsigned((($unsigned(wire137[(4'he):(4'h8)]) ?
              wire139[(4'ha):(3'h5)] : (!reg150[(1'h1):(1'h0)])) ^~ ($unsigned({reg151}) != $unsigned(wire140[(4'ha):(2'h2)])))))
            begin
              reg155 <= wire140;
              reg156 <= (^($signed(reg153[(1'h1):(1'h1)]) ?
                  ((~|$unsigned(wire138)) ?
                      {(~^wire143),
                          {reg154}} : $unsigned($unsigned((8'ha3)))) : (((wire144 || wire144) ^ (wire137 ?
                      reg148 : wire140)) * (reg147[(3'h7):(3'h6)] * (wire141 ?
                      (8'ha0) : reg147)))));
              reg157 <= ({{($unsigned((8'hb4)) >>> reg150[(1'h0):(1'h0)]),
                          wire141[(1'h0):(1'h0)]},
                      ($unsigned((reg150 >> reg154)) >= wire142)} ?
                  ({wire138[(1'h1):(1'h1)]} ?
                      (~|(((8'ha7) ?
                          wire144 : wire145) >= reg154[(1'h1):(1'h1)])) : (((reg151 - wire146) + (&wire140)) ^ reg147[(3'h6):(3'h6)])) : (wire142[(3'h7):(1'h0)] <= wire143[(4'hd):(2'h2)]));
              reg158 <= (|{(({reg157} != reg154[(1'h0):(1'h0)]) ?
                      (~^reg149) : {(wire138 ? wire145 : (8'hbf)),
                          $signed(reg153)})});
              reg159 <= (~&wire137[(3'h5):(1'h0)]);
            end
          else
            begin
              reg155 <= {wire146[(3'h6):(3'h5)], wire139[(3'h6):(3'h5)]};
              reg156 <= wire140;
              reg157 <= reg156[(1'h1):(1'h1)];
            end
          reg160 <= ($signed($unsigned(reg152[(4'h9):(1'h0)])) ?
              $signed(reg153) : {(reg155[(4'hd):(1'h0)] > (^~{reg158,
                      wire146}))});
        end
      else
        begin
          reg148 <= reg159;
          if (reg154[(1'h0):(1'h0)])
            begin
              reg149 <= $signed($signed({$unsigned($signed(wire144))}));
              reg150 <= wire145;
              reg151 <= (((!reg150[(1'h1):(1'h0)]) | reg160) ?
                  (~^wire144[(4'h8):(3'h4)]) : ((reg155 << {wire143[(4'h8):(3'h6)],
                          $unsigned((8'hbd))}) ?
                      reg153 : $unsigned((^(wire139 ? wire141 : reg151)))));
              reg152 <= $unsigned((&($unsigned(wire146[(4'h9):(3'h7)]) < $unsigned(reg159))));
              reg153 <= $unsigned(((~&$signed((|wire138))) >> ((!wire140[(4'hb):(4'hb)]) ?
                  {(reg159 ? wire140 : reg153)} : {reg150[(1'h0):(1'h0)]})));
            end
          else
            begin
              reg149 <= (^~(8'hb8));
            end
          reg154 <= wire140[(1'h0):(1'h0)];
        end
      reg161 <= wire137;
      reg162 <= reg153;
    end
  assign wire163 = reg159;
  assign wire164 = (wire140 ^ (|({wire138} >> (+(^reg162)))));
  assign wire165 = (wire145 > $signed((reg162 ?
                       (~&$unsigned((8'ha4))) : reg157[(1'h0):(1'h0)])));
  assign wire166 = reg155[(3'h5):(3'h5)];
  assign wire167 = (reg155[(3'h4):(2'h2)] ?
                       reg158 : ((&((wire165 ? reg157 : (8'hae)) ^~ reg159)) ?
                           wire136[(1'h0):(1'h0)] : reg149[(4'h9):(4'h8)]));
  assign wire168 = ((($signed(reg147[(3'h4):(2'h2)]) ?
                               ({(8'h9d)} == wire137) : $unsigned({reg158})) ?
                           (($signed(wire167) ~^ wire164[(3'h6):(3'h5)]) ?
                               reg157 : (((8'haf) < reg156) ?
                                   $signed(wire136) : (wire144 ?
                                       reg162 : wire140))) : {$unsigned($signed((8'hb5))),
                               wire167[(1'h0):(1'h0)]}) ?
                       ((reg160[(3'h5):(1'h0)] != ((wire136 * wire165) ?
                           reg153 : (wire144 ?
                               (8'ha9) : reg162))) - (~^$signed((wire137 ?
                           reg155 : (8'ha2))))) : reg150[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg169 <= (7'h43);
      if ($unsigned($unsigned($unsigned((7'h44)))))
        begin
          reg170 <= $signed(((wire143[(3'h5):(2'h2)] ?
              (8'hbb) : {reg157}) >>> {(|reg162)}));
        end
      else
        begin
          reg170 <= (^~wire140);
        end
    end
  assign wire171 = (wire142 ?
                       $signed((8'hae)) : {(((wire140 & reg153) ?
                                   wire136[(4'h8):(2'h2)] : $unsigned(wire166)) ?
                               (8'ha3) : reg156),
                           ((wire139 >> $unsigned(wire163)) ?
                               reg147[(3'h7):(3'h6)] : ((7'h41) ?
                                   (wire146 & reg169) : ((8'h9e) - wire145)))});
  always
    @(posedge clk) begin
      reg172 <= reg147[(2'h3):(1'h0)];
      if ((reg155 ?
          $signed(($signed((wire165 ? (8'hb0) : wire164)) >> ({wire138,
                  wire171} ?
              (wire142 ?
                  (8'hac) : wire171) : $signed(wire140)))) : wire167[(1'h1):(1'h0)]))
        begin
          reg173 <= reg161;
          reg174 <= (~((reg153 ?
              (~^(reg147 ?
                  reg157 : reg156)) : reg150[(1'h1):(1'h0)]) | {(~&(reg160 ~^ reg161)),
              $unsigned((~|wire165))}));
          reg175 <= (wire163[(4'hc):(4'hc)] ? wire146[(2'h3):(1'h0)] : wire167);
          reg176 <= ((~(reg147[(3'h7):(1'h1)] ?
              $unsigned((reg174 <<< reg149)) : reg148)) <<< reg148[(1'h0):(1'h0)]);
          if (({$unsigned($signed({reg149, reg156}))} ?
              $signed((wire163[(3'h5):(3'h4)] <= $signed($signed((8'hbf))))) : wire139))
            begin
              reg177 <= wire143;
            end
          else
            begin
              reg177 <= ($unsigned((reg172 ?
                      $unsigned((wire168 ?
                          reg170 : wire146)) : (reg177[(2'h3):(1'h1)] ?
                          (~^reg174) : $signed((8'ha8))))) ?
                  $unsigned(wire137[(3'h7):(3'h6)]) : $signed({(+{wire165}),
                      $unsigned((wire166 ? wire142 : wire137))}));
              reg178 <= ((~&wire163) > reg169);
              reg179 <= (8'ha0);
              reg180 <= ((($unsigned(reg177) == $signed((wire167 ?
                      reg157 : wire163))) != wire141[(2'h2):(1'h0)]) ?
                  $unsigned((((reg175 ? reg169 : wire136) ?
                      (wire136 == wire166) : (^~wire164)) | (((8'ha0) ?
                      wire137 : reg173) >> {wire146}))) : $unsigned(reg170));
              reg181 <= {($unsigned(($unsigned(wire166) != wire139)) >>> {$unsigned($unsigned(wire138))})};
            end
        end
      else
        begin
          if (($unsigned(wire163) ?
              $unsigned((8'ha5)) : reg159[(5'h10):(4'he)]))
            begin
              reg173 <= ($unsigned(reg153) ?
                  {$unsigned(($unsigned(wire164) ?
                          (~^(8'hb0)) : $unsigned(wire144)))} : $signed({((wire139 ?
                              reg156 : reg181) ?
                          {reg150} : $signed((8'ha0))),
                      $unsigned($signed(reg147))}));
              reg174 <= reg160[(2'h2):(2'h2)];
              reg175 <= $unsigned((8'hba));
              reg176 <= wire137[(2'h2):(1'h0)];
              reg177 <= reg181[(1'h0):(1'h0)];
            end
          else
            begin
              reg173 <= $unsigned((wire167 ~^ (~^(-$signed((8'hb8))))));
              reg174 <= (7'h44);
              reg175 <= $unsigned(wire139);
              reg176 <= ($unsigned($signed(($unsigned(reg174) ?
                      (~&reg169) : reg153[(2'h2):(1'h0)]))) ?
                  (&(($signed(wire166) ? wire137 : (~reg180)) ?
                      (wire144 ?
                          (reg174 && reg179) : (~|wire140)) : (reg149 & (^reg169)))) : (({{reg170,
                              reg179}} ?
                      wire142 : reg153[(2'h2):(2'h2)]) > $unsigned((~(reg149 ?
                      reg174 : (7'h42))))));
            end
          reg178 <= $signed($signed(($signed((reg161 ? (7'h43) : reg162)) ?
              (-wire143[(2'h3):(2'h3)]) : ((!reg159) ?
                  (reg149 ? reg156 : reg177) : {reg169, wire141}))));
          reg179 <= $unsigned($unsigned(wire136[(1'h0):(1'h0)]));
          reg180 <= ({$unsigned({$signed(reg155)}),
                  ({(~(8'hab)), {reg175, (8'hac)}} - ((reg149 ?
                      wire168 : (8'ha1)) == (wire140 != reg179)))} ?
              wire165 : (((8'hb3) ? $signed($unsigned(reg147)) : reg154) ?
                  reg153[(1'h0):(1'h0)] : ({reg179, $signed(wire163)} ?
                      $signed(((8'hb2) ?
                          reg170 : wire140)) : $signed($signed((8'hac))))));
        end
      reg182 <= reg150;
      reg183 <= wire146[(4'h9):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg184 <= ($unsigned(reg176) >>> (reg159 <<< ($unsigned($signed((8'ha9))) ?
          reg161 : {(reg159 ? reg157 : reg155)})));
      reg185 <= ($signed($signed($signed((~wire146)))) || $signed(($unsigned($unsigned((8'hbd))) && $signed(wire163))));
    end
  assign wire186 = $signed($signed(($unsigned((+wire136)) ?
                       (~$unsigned(wire143)) : {(reg150 > reg154),
                           $unsigned((8'ha3))})));
  assign wire187 = $unsigned($signed(($signed(reg149) < $unsigned(reg158))));
  always
    @(posedge clk) begin
      reg188 <= $unsigned(reg152);
      reg189 <= reg176[(5'h11):(1'h0)];
      reg190 <= {(reg147 == (|wire186))};
      reg191 <= reg175[(2'h2):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg192 <= wire144;
    end
  always
    @(posedge clk) begin
      reg193 <= (({((reg158 ? reg170 : reg159) ?
                  (reg153 <= wire168) : wire165)} > {($unsigned(wire141) ?
                  {wire141} : reg152[(2'h3):(2'h2)]),
              ($unsigned(reg154) ? (~&reg181) : (wire164 >>> reg156))}) ?
          (~|(-reg161[(2'h2):(1'h1)])) : wire139);
    end
endmodule

module module74  (y, clk, wire79, wire78, wire77, wire76, wire75);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire79;
  input wire [(4'he):(1'h0)] wire78;
  input wire signed [(5'h10):(1'h0)] wire77;
  input wire signed [(5'h13):(1'h0)] wire76;
  input wire signed [(4'he):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire101;
  wire [(2'h2):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire97;
  wire [(4'hd):(1'h0)] wire96;
  wire signed [(5'h12):(1'h0)] wire95;
  wire [(2'h3):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire93;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(4'he):(1'h0)] wire88;
  wire signed [(3'h6):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire [(5'h10):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(3'h6):(1'h0)] wire80;
  reg signed [(5'h15):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg91 = (1'h0);
  reg [(4'hc):(1'h0)] reg90 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 reg92,
                 reg91,
                 reg90,
                 (1'h0)};
  assign wire80 = (~wire75[(2'h2):(1'h0)]);
  assign wire81 = $unsigned({$unsigned($unsigned(wire75[(1'h0):(1'h0)]))});
  assign wire82 = ((8'hbf) ? (!wire75[(3'h6):(3'h6)]) : wire75);
  assign wire83 = wire76;
  assign wire84 = $signed($signed($unsigned(wire75)));
  assign wire85 = wire84[(3'h4):(2'h2)];
  assign wire86 = wire75;
  assign wire87 = {($signed($unsigned(wire85[(2'h2):(2'h2)])) >= $unsigned(wire75)),
                      wire82[(3'h5):(1'h1)]};
  assign wire88 = (&((-(!(^~(8'hb0)))) ?
                      $signed($signed(wire83[(4'hf):(4'hb)])) : $signed((8'h9e))));
  assign wire89 = $unsigned($signed({((^~wire82) & wire82),
                      ((wire84 <<< wire80) ?
                          (-wire76) : wire80[(2'h3):(2'h3)])}));
  always
    @(posedge clk) begin
      reg90 <= wire81;
      reg91 <= (~{$signed(($signed(wire84) ?
              reg90[(4'h8):(1'h0)] : wire79[(3'h7):(1'h0)]))});
      reg92 <= reg90[(4'ha):(1'h0)];
    end
  assign wire93 = reg91;
  assign wire94 = (~|{$unsigned((((8'ha1) ?
                          (8'ha5) : wire80) >> (wire80 + wire88)))});
  assign wire95 = (!wire89);
  assign wire96 = (|{((~|{wire77, wire95}) ? (8'hac) : wire80),
                      $unsigned(wire85[(1'h0):(1'h0)])});
  assign wire97 = $unsigned((!(~&$unsigned($unsigned(reg92)))));
  assign wire98 = (8'h9c);
  assign wire99 = $unsigned(wire96[(2'h2):(1'h1)]);
  assign wire100 = {$signed(wire88),
                       ((wire77 ?
                           $signed({wire82,
                               wire93}) : $unsigned(wire94)) != {(wire98[(1'h1):(1'h1)] ?
                               {(8'h9d)} : (wire76 ^ wire81))})};
  assign wire101 = wire84[(1'h0):(1'h0)];
  assign wire102 = (|wire89);
endmodule

module module59
#(parameter param71 = (((^~(((7'h43) != (8'ha1)) ? (!(8'ha8)) : ((8'ha5) >= (8'hb7)))) >>> ((~^{(8'hbf)}) <<< ((!(8'hbe)) ? {(8'ha0), (8'ha2)} : (~|(8'hb1))))) ? (((((8'hbb) || (8'ha9)) ? ((8'ha4) <= (8'h9c)) : ((8'ha8) ? (8'hb4) : (8'hbd))) || ((8'had) | {(7'h41)})) ? (~|((!(8'hb2)) ? ((8'hb2) ? (8'hb0) : (8'ha2)) : (8'hac))) : ((((8'ha7) ? (8'hba) : (8'haa)) ? (~(8'hae)) : ((8'h9c) ? (8'hbd) : (8'ha9))) ? (((8'haf) != (8'ha9)) ? {(8'hb7)} : (!(8'hbd))) : (((8'hac) - (8'hb4)) >>> ((8'haf) ? (7'h44) : (8'haa))))) : {((~&(~&(8'h9d))) ? (((8'hbf) ? (8'had) : (8'hbf)) ? ((8'hbe) + (7'h41)) : ((8'hb8) | (8'ha8))) : (((8'haf) != (7'h41)) ? ((8'ha1) ? (8'h9f) : (7'h41)) : ((8'h9c) ^~ (8'haa))))}))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire63;
  input wire signed [(4'hf):(1'h0)] wire62;
  input wire [(5'h11):(1'h0)] wire61;
  input wire [(2'h3):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire70;
  wire [(2'h3):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(3'h4):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  assign y = {wire70, wire69, wire68, wire67, wire66, wire65, wire64, (1'h0)};
  assign wire64 = ((wire61 ?
                          {(wire63[(3'h5):(3'h5)] << $unsigned(wire62))} : wire62) ?
                      (wire61 <= (($unsigned(wire63) ?
                          wire63[(4'h8):(3'h4)] : (7'h43)) & {wire61[(1'h1):(1'h0)]})) : (~(+$unsigned((wire61 ?
                          wire62 : wire61)))));
  assign wire65 = {wire61[(5'h10):(4'hb)]};
  assign wire66 = $unsigned($signed((-wire60[(2'h2):(1'h0)])));
  assign wire67 = {((~$signed($signed(wire60))) ? $signed(wire62) : wire61)};
  assign wire68 = wire63;
  assign wire69 = wire62;
  assign wire70 = (-((&{$unsigned(wire61), (wire67 & wire65)}) ?
                      wire63 : $signed({(~|(8'ha1)), $unsigned(wire64)})));
endmodule
