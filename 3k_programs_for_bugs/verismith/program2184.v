module top
#(parameter param130 = (~&(|((7'h43) != (~{(8'ha0), (8'hbd)})))), 
parameter param131 = param130)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire129;
  wire signed [(5'h13):(1'h0)] wire128;
  wire [(4'he):(1'h0)] wire127;
  wire signed [(4'h9):(1'h0)] wire116;
  wire signed [(4'he):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire96;
  reg signed [(4'hf):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg120 = (1'h0);
  reg [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire116,
                 wire4,
                 wire5,
                 wire96,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire4 = $unsigned($signed((8'h9c)));
  assign wire5 = (($signed((wire0[(3'h6):(2'h3)] ?
                     (wire3 * wire2) : wire1[(1'h0):(1'h0)])) << wire0[(3'h6):(3'h4)]) && $signed(wire3));
  module6 #() modinst97 (wire96, clk, wire1, wire2, wire3, wire0, wire4);
  module98 #() modinst117 (wire116, clk, wire1, wire3, wire2, wire0);
  always
    @(posedge clk) begin
      reg118 <= wire0;
      reg119 <= $signed(wire3[(4'ha):(4'h8)]);
      if ((-$unsigned($unsigned($signed((reg118 ? wire4 : wire96))))))
        begin
          reg120 <= $signed(wire5[(1'h1):(1'h0)]);
          reg121 <= (($signed((reg119[(4'hb):(1'h1)] ~^ (8'h9d))) ?
              ({$unsigned(wire116),
                  $unsigned(wire0)} - $unsigned($unsigned(wire1))) : (~|(wire2[(4'h8):(4'h8)] ?
                  (wire3 ?
                      wire2 : wire96) : (-wire4)))) << $signed(wire2[(4'hb):(3'h6)]));
          if (((+{$unsigned(((8'hb6) <<< wire4)), {wire2[(1'h0):(1'h0)]}}) ?
              ((wire1[(4'he):(4'h9)] ?
                  {{wire1,
                          wire5}} : wire0) && (&wire5)) : (($unsigned($signed(wire4)) ?
                      $unsigned(((8'hbc) << reg118)) : $signed(reg119)) ?
                  (~|{$signed(reg118),
                      wire2[(2'h3):(2'h3)]}) : {$signed((8'hba))})))
            begin
              reg122 <= reg120[(3'h4):(1'h1)];
              reg123 <= {reg120[(4'ha):(2'h3)]};
              reg124 <= (reg118 ?
                  ((8'h9f) ?
                      (reg122[(4'hf):(4'h8)] >> {(~&reg120),
                          (^reg122)}) : ((reg120[(3'h6):(3'h4)] == (7'h40)) ?
                          ($unsigned((7'h40)) ?
                              $unsigned(reg123) : (wire2 <= wire1)) : wire2)) : (($unsigned((wire0 * reg122)) > $unsigned({wire116,
                      wire2})) == (7'h41)));
              reg125 <= (wire2[(4'hc):(3'h4)] && $signed(reg118[(3'h5):(2'h3)]));
              reg126 <= (&reg124);
            end
          else
            begin
              reg122 <= wire116[(2'h3):(2'h3)];
              reg123 <= ((reg123[(2'h2):(2'h2)] ?
                  $signed(reg120) : (-$signed((reg122 * wire0)))) ^~ wire2);
            end
        end
      else
        begin
          reg120 <= (~|wire0[(3'h7):(1'h0)]);
          reg121 <= wire0;
          reg122 <= reg118[(4'h8):(3'h7)];
          reg123 <= (8'hba);
          reg124 <= {wire96[(3'h4):(2'h3)]};
        end
    end
  assign wire127 = ((reg123 * $unsigned((+(~reg125)))) ^~ (reg121[(3'h4):(3'h4)] ^ reg126[(4'hf):(2'h2)]));
  assign wire128 = (((~|$signed({(8'ha5),
                           reg118})) > $signed(($signed(wire3) - (~&wire116)))) ?
                       ({(wire116[(1'h1):(1'h1)] ?
                               $unsigned(reg121) : (reg120 > reg120))} ^~ {$unsigned((~reg120))}) : $unsigned(reg120));
  assign wire129 = $unsigned({$signed(($unsigned((8'haa)) <= (wire2 > reg118))),
                       ({{wire4, reg126}} * ($unsigned(reg118) ?
                           (wire128 ^~ reg120) : (wire0 ? reg126 : wire5)))});
endmodule

module module98
#(parameter param115 = ({(7'h44), ((^((8'ha6) ? (8'ha2) : (8'hb2))) - ((8'h9e) < {(8'hb3), (8'h9f)}))} ? (&{(!((8'ha7) << (8'hbb))), {((8'hb0) ? (8'hbd) : (8'hbb)), {(8'ha1), (8'hae)}}}) : (|((~|(^(8'hbb))) < (((8'hab) > (8'hbc)) ? (&(7'h44)) : {(8'ha2)})))))
(y, clk, wire102, wire101, wire100, wire99);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire102;
  input wire signed [(4'ha):(1'h0)] wire101;
  input wire signed [(3'h6):(1'h0)] wire100;
  input wire signed [(2'h2):(1'h0)] wire99;
  wire signed [(5'h14):(1'h0)] wire114;
  wire [(3'h4):(1'h0)] wire113;
  wire [(4'hc):(1'h0)] wire112;
  wire signed [(3'h6):(1'h0)] wire111;
  wire signed [(4'h8):(1'h0)] wire105;
  wire [(4'hc):(1'h0)] wire104;
  wire signed [(5'h15):(1'h0)] wire103;
  reg signed [(4'hd):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire105,
                 wire104,
                 wire103,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire103 = wire100;
  assign wire104 = wire101;
  assign wire105 = ($unsigned(({$signed((8'hb5))} ?
                           (wire104[(4'hc):(4'hc)] == (8'ha9)) : (-wire104))) ?
                       ($unsigned((8'hb9)) ?
                           $signed(({wire104} && wire100[(1'h1):(1'h1)])) : $unsigned(wire100[(2'h2):(1'h0)])) : wire101[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg106 <= $unsigned(($unsigned((~|(8'ha9))) ? wire102 : wire105));
      reg107 <= wire103[(4'h8):(1'h1)];
      reg108 <= ((-((^(reg107 ? wire103 : wire99)) ?
              ((wire103 && wire101) ?
                  $signed(wire100) : wire102) : $unsigned(((8'ha0) ?
                  (8'hb2) : wire103)))) ?
          {(~^reg106[(5'h14):(5'h12)]),
              $unsigned(wire105[(3'h5):(3'h4)])} : $unsigned((-$unsigned((reg107 && wire102)))));
      reg109 <= $signed($unsigned($signed({wire102, {wire102, reg108}})));
      reg110 <= ((($signed($unsigned(reg109)) ? wire102 : $signed(reg108)) ?
              wire104 : wire103) ?
          (~&$signed($unsigned((reg107 >>> wire103)))) : $unsigned((($unsigned(wire102) + wire101) ?
              ($signed(wire100) ^ {wire100, wire103}) : (~|(wire105 ?
                  (8'had) : reg107)))));
    end
  assign wire111 = reg106;
  assign wire112 = ({$signed((8'hb1)),
                       $signed((wire104[(4'ha):(3'h5)] << $signed(reg108)))} <<< wire100[(1'h0):(1'h0)]);
  assign wire113 = {{$signed(wire105)}};
  assign wire114 = {((~{(^wire103)}) >>> $unsigned((+(reg108 ?
                           wire99 : (8'hbf))))),
                       ($unsigned((wire111 ~^ (&wire103))) ?
                           (reg106[(4'he):(4'hc)] ?
                               $signed(reg110[(4'h8):(3'h4)]) : $unsigned(reg106)) : (~reg109))};
endmodule

module module6
#(parameter param94 = (&((((~|(8'hb7)) & ((8'hbb) ~^ (8'hbb))) ? ((~(8'ha3)) && ((8'ha9) < (8'hb9))) : {((8'ha7) * (8'ha9)), ((8'hb7) + (8'hb4))}) ? ((8'hb5) && (-((8'ha2) ? (7'h43) : (7'h40)))) : (((|(8'h9d)) ? ((7'h44) >= (8'had)) : {(8'hbc), (8'ha7)}) ? (~&((7'h42) && (8'ha3))) : (((8'ha6) && (7'h42)) >>> ((7'h44) ? (8'ha7) : (8'ha8)))))), 
parameter param95 = ((-(param94 << (((8'h9d) ? param94 : param94) - (param94 - param94)))) - param94))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h109):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire93;
  wire signed [(5'h15):(1'h0)] wire92;
  wire [(5'h13):(1'h0)] wire91;
  wire signed [(4'ha):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire18;
  wire [(4'hd):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire21;
  wire [(4'ha):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire87;
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire12,
                 wire18,
                 wire19,
                 wire21,
                 wire38,
                 wire87,
                 reg20,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire12 = ({($signed(wire8) ?
                              wire11 : ((+wire11) << $unsigned((8'hba))))} ?
                      wire11[(3'h6):(3'h5)] : wire11[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg13 <= ((&$unsigned(((wire9 >>> wire8) ?
          $signed(wire10) : (wire7 >> wire12)))) >> $unsigned((8'had)));
      reg14 <= (&$signed($signed(wire8[(1'h0):(1'h0)])));
      reg15 <= (^~(~wire7[(3'h4):(1'h0)]));
      reg16 <= $unsigned($unsigned($signed((wire10[(4'h9):(3'h7)] << (reg14 < (7'h44))))));
      reg17 <= (-wire9);
    end
  assign wire18 = $signed(reg15[(2'h2):(1'h0)]);
  assign wire19 = $signed($signed($signed(reg16[(3'h5):(2'h3)])));
  always
    @(posedge clk) begin
      reg20 <= $signed(wire11[(1'h0):(1'h0)]);
    end
  assign wire21 = wire10;
  module22 #() modinst39 (wire38, clk, wire7, wire21, wire12, reg15, wire9);
  module40 #() modinst88 (wire87, clk, wire8, reg14, reg15, reg17);
  assign wire89 = ({wire18[(4'hd):(3'h6)],
                      $signed(((wire18 || (8'hb0)) ?
                          (+wire9) : $unsigned(wire18)))} | wire7[(5'h10):(4'h8)]);
  assign wire90 = {$signed($signed($signed(reg20))), $unsigned(wire11)};
  assign wire91 = ($signed(($signed((reg13 ? (8'ha3) : wire38)) ?
                      ((+wire11) ?
                          reg17[(4'ha):(4'ha)] : wire8) : ((wire11 >= wire9) ?
                          $unsigned(wire21) : $signed((7'h44))))) << reg15);
  assign wire92 = {wire7[(4'hd):(3'h4)]};
  assign wire93 = ((^~((^~$signed((7'h44))) ?
                          ($signed(wire10) > $signed((8'hb2))) : wire10[(3'h4):(1'h0)])) ?
                      $signed(($unsigned((8'hb2)) + {(~wire12)})) : $unsigned(((wire19 ?
                              {wire91} : (wire12 ? wire8 : wire38)) ?
                          $signed((^wire87)) : wire18)));
endmodule

module module40
#(parameter param86 = (&(((((8'ha5) ? (8'ha7) : (8'hb0)) ? (8'hb3) : {(8'haa), (8'ha9)}) ? (-(-(8'hab))) : ((^~(7'h41)) ? ((8'hb4) ? (7'h41) : (8'hb9)) : ((8'ha4) ? (7'h43) : (8'hb5)))) ? ((((8'h9d) | (8'hbf)) ^~ ((8'ha1) ? (8'hb1) : (8'ha0))) + (((8'ha0) || (8'hb2)) ? (8'hb5) : ((8'hb0) ? (8'hb4) : (8'ha1)))) : ((~&{(8'ha3), (8'ha8)}) ? (~|((8'hb1) | (7'h43))) : ((|(8'hb3)) ? ((7'h40) >= (8'hb7)) : (8'hb7))))))
(y, clk, wire44, wire43, wire42, wire41);
  output wire [(32'h1bd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire44;
  input wire signed [(4'h9):(1'h0)] wire43;
  input wire [(4'he):(1'h0)] wire42;
  input wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(3'h4):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire45;
  reg [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(5'h14):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire66,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire53,
                 wire47,
                 wire46,
                 wire45,
                 reg85,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg56,
                 reg55,
                 reg54,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire45 = wire41;
  assign wire46 = wire44;
  assign wire47 = $signed($signed($unsigned((8'haf))));
  always
    @(posedge clk) begin
      reg48 <= (((~^(&{wire42, wire44})) ?
          wire46[(3'h7):(1'h0)] : wire41) >> wire45);
    end
  always
    @(posedge clk) begin
      if ((wire47[(2'h2):(1'h0)] ? (8'hb7) : (!wire44)))
        begin
          reg49 <= (~|$unsigned(wire42[(1'h1):(1'h0)]));
        end
      else
        begin
          reg49 <= (wire46 & ($signed((~^((8'ha5) ? wire41 : wire43))) ?
              reg48[(3'h6):(3'h5)] : ((~(wire43 ? wire41 : wire41)) ?
                  {reg49, wire45} : ($signed((7'h40)) >>> {reg48}))));
          reg50 <= (7'h44);
        end
      reg51 <= {(wire41 != $unsigned((reg50[(3'h5):(3'h5)] ?
              wire41[(3'h7):(1'h1)] : wire42))),
          (-(8'hbb))};
      reg52 <= wire47[(1'h0):(1'h0)];
    end
  assign wire53 = $unsigned(($signed((reg49 ~^ {wire47})) ?
                      ((reg51 ?
                          (~^reg52) : $signed((8'h9c))) && wire45) : ((^(8'hb5)) ~^ reg50[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg54 <= $signed({($signed({wire41, (8'hb2)}) ? (~|reg51) : (8'haa))});
      reg55 <= reg49[(5'h12):(3'h6)];
      reg56 <= (^reg49);
    end
  assign wire57 = (wire47 ?
                      (($signed($signed(wire42)) ?
                          $signed((wire45 != reg52)) : {$unsigned(wire42),
                              $unsigned(wire46)}) || reg50) : ((reg51 << $unsigned((wire53 ^~ reg54))) <= {((reg50 ~^ wire42) << {wire43,
                              reg49}),
                          ((|wire44) <= (|wire46))}));
  assign wire58 = $unsigned((~&((7'h43) ?
                      ((8'hb2) ?
                          $unsigned(reg49) : {wire42}) : (wire53[(2'h2):(1'h0)] >>> wire46[(2'h2):(1'h0)]))));
  assign wire59 = (&(8'hba));
  assign wire60 = wire58;
  always
    @(posedge clk) begin
      reg61 <= reg49[(4'h9):(3'h6)];
      reg62 <= ((^~{(+(~reg55)),
              ($unsigned(wire58) ?
                  (wire44 ? (7'h44) : reg51) : $unsigned(reg48))}) ?
          wire45 : $signed(($signed((reg49 >>> reg52)) * ($signed(wire43) ?
              wire46[(3'h4):(2'h3)] : (~wire41)))));
      reg63 <= $signed((!$unsigned(wire47)));
      reg64 <= $unsigned(wire45[(4'h8):(1'h1)]);
      if ((~|(~^$unsigned(wire45))))
        begin
          reg65 <= $signed(reg56[(3'h4):(2'h3)]);
        end
      else
        begin
          reg65 <= wire44[(1'h0):(1'h0)];
        end
    end
  assign wire66 = $signed({(((^reg62) <<< reg50) <<< wire59[(3'h4):(2'h3)])});
  always
    @(posedge clk) begin
      if ($unsigned($signed({(-((8'hb0) << reg48)),
          (wire58 == $signed(reg54))})))
        begin
          if ({$unsigned($unsigned(wire46[(3'h5):(3'h4)])),
              wire59[(3'h5):(2'h3)]})
            begin
              reg67 <= wire44[(4'hc):(2'h3)];
            end
          else
            begin
              reg67 <= (reg56[(2'h3):(1'h1)] ?
                  ((reg65[(2'h2):(1'h1)] ?
                      $unsigned($signed(reg48)) : (reg56[(1'h0):(1'h0)] == (~reg48))) >> wire53[(1'h1):(1'h0)]) : $signed((wire66 ?
                      reg50[(2'h3):(1'h0)] : (8'hbc))));
            end
          if ((~&$signed($signed($signed(reg48[(3'h4):(1'h0)])))))
            begin
              reg68 <= wire46;
              reg69 <= (reg51 | {{$signed($unsigned(reg63))}, (~^{wire66})});
            end
          else
            begin
              reg68 <= ($unsigned(reg55) ~^ $signed((~$signed((~|reg68)))));
            end
          if ($signed(((~|reg56) ^~ reg48)))
            begin
              reg70 <= $unsigned($unsigned($signed($unsigned($signed(wire45)))));
              reg71 <= wire46[(2'h3):(1'h0)];
              reg72 <= ((($signed(((8'hb8) ?
                  reg50 : wire53)) | reg51) >>> {(&$unsigned(reg71)),
                  $signed($unsigned(reg50))}) ^ (((~&reg63) ?
                      reg61[(3'h4):(2'h2)] : (|$unsigned((8'hba)))) ?
                  ((reg64 < (wire44 - wire45)) & ((reg62 || reg51) < reg48)) : reg56[(4'h8):(2'h2)]));
            end
          else
            begin
              reg70 <= reg54;
              reg71 <= {(~$unsigned(((^~wire42) ? $unsigned(reg72) : wire60))),
                  (reg62[(2'h2):(1'h0)] ?
                      ({$signed(wire42)} ?
                          (wire57[(4'hc):(3'h4)] ?
                              wire66[(4'h8):(2'h3)] : reg72[(4'hc):(3'h6)]) : $signed(reg65[(1'h1):(1'h0)])) : {wire42[(4'hc):(1'h0)]})};
              reg72 <= $unsigned(wire47);
              reg73 <= wire46;
            end
          if (reg68[(3'h5):(3'h5)])
            begin
              reg74 <= ($unsigned(reg54) && (&{($signed(wire43) ?
                      {wire60} : (reg49 ~^ reg62)),
                  reg70[(2'h3):(1'h0)]}));
              reg75 <= (wire42[(4'ha):(1'h0)] ~^ (-wire45));
            end
          else
            begin
              reg74 <= ((wire53[(1'h0):(1'h0)] ?
                  wire43[(3'h7):(1'h0)] : reg63[(1'h1):(1'h1)]) == ($unsigned((reg64 ?
                      wire44 : (^reg73))) ?
                  (((|reg74) == wire53) ?
                      wire57 : $signed(reg51[(2'h3):(1'h0)])) : $unsigned(((reg64 >> wire60) ?
                      reg70 : $signed(wire66)))));
              reg75 <= (|$signed(reg63[(1'h0):(1'h0)]));
              reg76 <= ((~^((wire66 + $unsigned(reg55)) - $signed(wire60))) == (($unsigned((~&reg50)) & wire58) < (~|$signed($unsigned(reg70)))));
              reg77 <= $signed(reg76[(3'h6):(2'h3)]);
            end
        end
      else
        begin
          reg67 <= (~wire59[(2'h3):(2'h3)]);
          reg68 <= reg49;
          reg69 <= {reg70[(4'hd):(4'h9)], (|(8'hb8))};
          if (reg51[(1'h0):(1'h0)])
            begin
              reg70 <= reg65;
              reg71 <= (~$unsigned((wire45 > (reg52[(3'h4):(2'h3)] & reg62))));
            end
          else
            begin
              reg70 <= $signed(reg51);
              reg71 <= (reg56 >>> ($unsigned(reg69) ?
                  $unsigned((~^$unsigned(reg77))) : (reg61 ?
                      $unsigned(((8'hb6) ?
                          reg71 : reg71)) : {$unsigned(wire43)})));
              reg72 <= ($signed((~|$unsigned($signed(reg61)))) ^ (^~($signed((wire45 ?
                      wire42 : reg74)) ?
                  reg51[(2'h3):(2'h3)] : reg55[(3'h5):(1'h1)])));
            end
        end
    end
  assign wire78 = (((^~$signed(reg74[(2'h3):(2'h3)])) ^~ (&(~reg68))) ?
                      $signed((($unsigned(reg73) == reg50[(1'h1):(1'h0)]) >> $unsigned(reg48[(1'h0):(1'h0)]))) : reg51[(2'h2):(1'h1)]);
  assign wire79 = reg55;
  assign wire80 = wire44;
  assign wire81 = (((reg61[(3'h4):(1'h1)] ?
                      $unsigned(wire66) : reg70[(4'h8):(3'h4)]) >>> (8'hba)) || wire79);
  assign wire82 = wire41[(4'hb):(4'h8)];
  assign wire83 = $signed(((&reg68[(1'h0):(1'h0)]) ?
                      reg72 : ({((8'hbc) ? reg63 : reg54),
                          {wire43, reg69}} >>> $signed(((8'haf) ?
                          wire41 : wire60)))));
  assign wire84 = $unsigned($signed((~&(^~reg75[(4'hd):(4'ha)]))));
  always
    @(posedge clk) begin
      reg85 <= reg63[(3'h7):(2'h3)];
    end
endmodule

module module22
#(parameter param37 = ((((&(^(8'hba))) ? (((8'haf) ? (8'hb5) : (8'hbc)) ? (+(7'h42)) : (|(8'hb6))) : (&((8'haa) ? (8'hb7) : (7'h43)))) ? (({(8'ha1)} ^~ ((8'hb9) <<< (8'ha3))) ? {((8'ha0) ? (7'h44) : (8'haf))} : (((7'h43) * (7'h41)) ? ((8'hac) <= (8'ha9)) : ((8'hb3) ? (8'hba) : (8'had)))) : (-((~|(7'h41)) ? {(8'hbb)} : (~&(8'ha9))))) ? (|(|(((8'hbd) ? (7'h43) : (7'h42)) ? ((7'h43) + (8'hab)) : {(8'h9f), (8'ha2)}))) : ((!{(~&(7'h42)), (!(8'ha1))}) + ((+(|(7'h41))) ? (((8'haa) == (8'hb1)) == (~|(8'hbe))) : (~{(7'h43)})))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire27;
  input wire [(4'hb):(1'h0)] wire26;
  input wire signed [(3'h7):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire23;
  wire signed [(3'h4):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 (1'h0)};
  assign wire28 = {{wire24, $unsigned($unsigned((wire27 ? (8'ha3) : wire26)))}};
  assign wire29 = ($signed($signed($signed($signed(wire28)))) ?
                      ({((wire27 ^~ (8'hbb)) * $signed(wire23)),
                          ($unsigned(wire24) ?
                              {wire28,
                                  wire28} : wire25)} != (wire25[(3'h7):(1'h0)] ?
                          wire27[(2'h2):(1'h0)] : $signed($unsigned(wire25)))) : (-((wire28 ?
                          (+wire24) : $signed(wire27)) ~^ (wire26 >>> wire25[(3'h5):(2'h3)]))));
  assign wire30 = (((-($signed((8'hae)) ?
                              wire29[(3'h5):(1'h0)] : (wire28 > (8'h9f)))) ?
                          ((8'hb1) ?
                              (wire27 <<< $signed(wire24)) : {$signed(wire28)}) : (($signed(wire27) > ((8'hb0) && wire25)) ?
                              (~&{wire26, wire25}) : wire26[(4'hb):(1'h1)])) ?
                      ((8'h9d) < (wire28[(3'h6):(1'h0)] ^~ (!{(8'had)}))) : $signed(((8'hb5) * $signed($unsigned(wire26)))));
  assign wire31 = wire28;
  assign wire32 = ({(&(~$unsigned(wire26)))} || (8'hb5));
  assign wire33 = (wire29 ?
                      (wire24 ?
                          {$unsigned($unsigned(wire32))} : ((wire24 ~^ $signed(wire26)) & wire28[(3'h4):(3'h4)])) : wire31[(2'h2):(2'h2)]);
  assign wire34 = (8'hae);
  assign wire35 = wire29[(3'h4):(1'h0)];
  assign wire36 = (!{{{{wire28, wire30}}, wire35[(3'h5):(1'h0)]}});
endmodule
