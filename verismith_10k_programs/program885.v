module top
#(parameter param114 = ((8'hae) >> (!({((8'hae) || (8'h9d)), {(8'ha5)}} ? (((8'hb1) + (8'ha2)) < (-(8'hb4))) : {((8'hb1) > (7'h43)), {(8'hba)}}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire113;
  wire signed [(2'h3):(1'h0)] wire112;
  wire [(5'h12):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(4'hd):(1'h0)] wire110;
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire35,
                 wire37,
                 wire110,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned((wire1[(2'h2):(1'h0)] ?
          wire2 : (wire1[(5'h13):(4'hc)] ?
              $signed($unsigned(wire1)) : ((wire3 | wire3) * (wire1 ?
                  wire4 : wire4))))))
        begin
          reg5 <= ($signed(wire1) < (wire4[(2'h3):(2'h2)] ?
              wire4 : $unsigned(wire4)));
        end
      else
        begin
          reg5 <= ((!(|{reg5[(2'h2):(1'h0)],
              $unsigned(reg5)})) ^ $signed(wire2));
          reg6 <= $unsigned((^(8'hbb)));
        end
      reg7 <= (|$unsigned(wire1[(3'h7):(2'h2)]));
      reg8 <= $unsigned((-$signed($signed((~|reg7)))));
      reg9 <= (-(((wire3[(2'h3):(2'h2)] >> reg7[(1'h0):(1'h0)]) << reg7[(2'h2):(2'h2)]) ?
          ({(+reg5), (8'h9d)} <<< (~^(^wire2))) : {((reg8 | wire1) >= (reg6 ?
                  reg5 : wire4)),
              reg8[(2'h2):(2'h2)]}));
      if ($unsigned(reg7[(1'h0):(1'h0)]))
        begin
          reg10 <= $unsigned($signed($unsigned($signed((wire4 ?
              wire0 : (7'h44))))));
          reg11 <= ($unsigned((~|$unsigned((wire4 ?
              (8'ha4) : reg6)))) + (-((&wire4) & reg9[(4'h9):(3'h5)])));
          reg12 <= (({((~|reg5) ? $signed((8'hab)) : $unsigned(wire2))} ?
                  ($signed(wire2[(3'h6):(3'h4)]) < reg6) : $unsigned(((reg11 <<< (8'ha8)) ?
                      (8'ha5) : (-reg7)))) ?
              ((+{$unsigned(reg11)}) ?
                  wire3 : (wire4[(2'h2):(2'h2)] <= reg5)) : (~({(reg5 ?
                          reg7 : reg10),
                      $signed(wire4)} ?
                  (-(-wire2)) : $unsigned((!(7'h41))))));
        end
      else
        begin
          if ($unsigned(((~^reg12[(2'h2):(2'h2)]) ?
              (|(wire1[(3'h5):(1'h1)] ?
                  (reg5 ? reg8 : reg10) : (reg6 ? reg5 : reg11))) : wire3)))
            begin
              reg10 <= $unsigned($unsigned(wire0));
              reg11 <= $unsigned(reg12);
              reg12 <= (~&(^~$signed((~{reg6}))));
            end
          else
            begin
              reg10 <= wire2;
              reg11 <= ({(~$signed((~|reg7))),
                  reg8[(1'h1):(1'h0)]} == reg12[(4'hd):(3'h7)]);
              reg12 <= (reg11 > wire3);
              reg13 <= (^~($signed((reg8 - $signed(wire3))) ~^ (wire2 ?
                  $signed(reg12[(2'h3):(1'h1)]) : reg6[(3'h5):(2'h2)])));
            end
        end
    end
  always
    @(posedge clk) begin
      reg14 <= {reg13[(1'h0):(1'h0)]};
      reg15 <= $unsigned($signed(reg9));
    end
  module16 #() modinst36 (wire35, clk, reg5, reg7, wire4, wire1);
  assign wire37 = reg8;
  always
    @(posedge clk) begin
      if (((^~(8'ha0)) != {((reg8[(1'h1):(1'h0)] | reg15[(2'h3):(2'h2)]) ?
              {$unsigned(wire1),
                  (reg6 ? (8'hac) : (8'hb6))} : ((wire35 | reg10) ?
                  (~|wire4) : (+reg9)))}))
        begin
          if (wire1)
            begin
              reg38 <= reg14;
              reg39 <= $signed({$unsigned((~&$signed(reg7))),
                  (~^((~|(8'h9c)) <= $unsigned(reg9)))});
              reg40 <= $unsigned($signed((wire35[(3'h7):(3'h4)] | {(wire37 ?
                      reg9 : reg39)})));
              reg41 <= wire4[(2'h2):(2'h2)];
            end
          else
            begin
              reg38 <= $unsigned(reg12[(4'hc):(3'h4)]);
              reg39 <= (&reg12[(4'hf):(4'ha)]);
              reg40 <= {$signed((!(~^$signed((7'h43))))),
                  (&reg11[(3'h6):(2'h3)])};
              reg41 <= wire4;
              reg42 <= (+reg10[(5'h15):(3'h7)]);
            end
        end
      else
        begin
          reg38 <= reg40[(3'h7):(2'h3)];
          reg39 <= {$unsigned((+$signed($unsigned(reg14)))),
              (^~(reg10[(1'h1):(1'h1)] > ((wire37 ? reg6 : reg7) ?
                  $unsigned(reg39) : (reg10 ? (8'h9d) : (7'h43)))))};
        end
      if ($unsigned((~($unsigned($unsigned(wire0)) ?
          (^~(wire1 && reg39)) : $signed({reg10, wire35})))))
        begin
          reg43 <= (reg41 == reg7);
          reg44 <= {$signed($signed(wire4[(2'h2):(1'h1)])),
              $signed(reg10[(5'h10):(4'h8)])};
        end
      else
        begin
          reg43 <= (^reg15[(2'h2):(2'h2)]);
          reg44 <= reg9[(3'h4):(2'h2)];
          if ({(|(((reg6 >= reg14) ?
                  reg40[(2'h3):(1'h1)] : {(8'hbe)}) ~^ (7'h42)))})
            begin
              reg45 <= ((|reg10) >> $signed(((~^reg11) ?
                  ((wire2 ~^ reg7) != reg14) : wire0[(3'h4):(1'h1)])));
              reg46 <= $signed({(8'haf)});
            end
          else
            begin
              reg45 <= wire35;
              reg46 <= $signed($signed($signed(reg39)));
              reg47 <= {reg43[(3'h4):(2'h2)],
                  ($signed(((reg5 && (8'h9c)) ?
                          $unsigned((7'h44)) : (~^reg40))) ?
                      {({reg39, reg9} ?
                              wire1 : reg41[(2'h3):(1'h1)])} : $signed(reg46[(4'h8):(4'h8)]))};
              reg48 <= reg40;
              reg49 <= reg42[(4'h8):(4'h8)];
            end
          reg50 <= reg47;
        end
    end
  module51 #() modinst111 (.wire53(reg6), .wire55(wire1), .y(wire110), .wire52(reg42), .clk(clk), .wire54(reg44));
  assign wire112 = reg8;
  assign wire113 = {{(~|$unsigned(reg15[(1'h0):(1'h0)]))},
                       {$signed(reg13[(3'h6):(2'h3)]), wire3}};
endmodule

module module51  (y, clk, wire55, wire54, wire53, wire52);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire55;
  input wire signed [(5'h15):(1'h0)] wire54;
  input wire signed [(4'ha):(1'h0)] wire53;
  input wire [(3'h6):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire108;
  wire signed [(4'ha):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire90;
  wire [(3'h5):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(2'h3):(1'h0)] wire87;
  wire signed [(4'ha):(1'h0)] wire85;
  reg signed [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg106 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(5'h14):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire85,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 (1'h0)};
  module56 #() modinst86 (.wire60(wire55), .wire59(wire52), .wire57((8'hb6)), .y(wire85), .wire58(wire54), .clk(clk), .wire61(wire53));
  assign wire87 = ($unsigned({({wire55, wire54} != (wire54 ? wire53 : wire53)),
                          (wire55[(4'ha):(2'h3)] ?
                              {wire53, (8'had)} : $unsigned(wire55))}) ?
                      $signed(({wire52[(1'h1):(1'h1)],
                          $unsigned(wire52)} && $signed((wire54 ?
                          wire53 : wire55)))) : wire53[(1'h1):(1'h1)]);
  assign wire88 = $unsigned((({wire55[(2'h3):(2'h3)],
                      $unsigned(wire87)} * (~&$unsigned((8'ha7)))) <= wire85));
  assign wire89 = ((wire54[(2'h2):(1'h0)] && {((~^(8'hb4)) ?
                              $unsigned((8'hbf)) : (wire88 > wire53)),
                          $unsigned(wire87[(1'h0):(1'h0)])}) ?
                      (^$unsigned($signed((7'h41)))) : $signed(wire54[(5'h13):(4'hf)]));
  assign wire90 = (|($unsigned(($unsigned(wire85) ?
                          $signed(wire52) : (~^wire54))) ?
                      (~&($signed(wire55) <= wire52)) : wire52));
  assign wire91 = $signed(wire90[(3'h6):(1'h0)]);
  always
    @(posedge clk) begin
      if ((!$signed(wire53[(4'ha):(3'h6)])))
        begin
          reg92 <= ({wire85,
                  (((wire90 ?
                      wire91 : (8'hb8)) ~^ $signed(wire85)) ^ $signed($signed(wire88)))} ?
              {wire54[(4'he):(4'he)],
                  $signed((wire89 ?
                      (wire52 ?
                          wire53 : wire87) : wire85))} : wire55[(2'h3):(1'h1)]);
          if (($unsigned((8'ha2)) ?
              wire85[(3'h5):(1'h1)] : $unsigned(wire88[(3'h6):(3'h4)])))
            begin
              reg93 <= $unsigned((wire85[(4'h9):(2'h2)] ?
                  wire91 : $signed((-$unsigned((7'h42))))));
            end
          else
            begin
              reg93 <= $unsigned($unsigned(wire87));
              reg94 <= ((wire88[(5'h12):(1'h0)] <= (+(~&wire53))) != $signed(wire85));
            end
          reg95 <= reg94[(3'h4):(2'h2)];
        end
      else
        begin
          reg92 <= $unsigned($signed($unsigned((+$signed((8'ha1))))));
          reg93 <= ($unsigned((-$unsigned(wire55[(2'h3):(2'h2)]))) >> (^wire91[(4'ha):(3'h5)]));
          reg94 <= ({(wire55[(2'h2):(1'h0)] >> (~&(wire87 + (8'ha5))))} ?
              ((((8'h9d) ? wire52[(1'h1):(1'h1)] : (wire52 ? wire52 : wire53)) ?
                  ((wire55 ?
                      wire88 : wire85) > $signed((8'h9e))) : wire55[(4'ha):(1'h0)]) <= (wire53[(3'h4):(1'h1)] ?
                  $unsigned($signed(wire89)) : wire87)) : (8'ha6));
          reg95 <= ((($unsigned((~&wire87)) || {$signed((8'haa)),
                      reg94[(3'h5):(1'h1)]}) ?
                  wire55[(3'h4):(1'h1)] : (wire87[(2'h3):(2'h3)] ?
                      wire91[(4'ha):(2'h3)] : (8'ha0))) ?
              wire88[(5'h13):(3'h6)] : wire89);
          reg96 <= wire54[(4'hf):(3'h4)];
        end
      reg97 <= $unsigned($unsigned((&(^$signed(reg95)))));
      if ($signed((-(~&(~^wire88[(1'h1):(1'h0)])))))
        begin
          reg98 <= $signed((|$unsigned((8'hb2))));
          if (wire54[(5'h15):(4'ha)])
            begin
              reg99 <= wire54;
            end
          else
            begin
              reg99 <= reg94[(3'h6):(1'h1)];
              reg100 <= $unsigned((~&$signed(($unsigned((8'h9f)) ?
                  $unsigned((8'h9c)) : $unsigned((8'hb3))))));
              reg101 <= ((+reg96) ?
                  (-(~&wire55)) : ({((reg96 * reg93) ?
                          (wire87 + wire55) : (reg96 && wire91))} >> $signed((~&$unsigned((7'h44))))));
              reg102 <= ((8'hbe) ?
                  (~&$unsigned(wire52[(3'h4):(2'h3)])) : wire85);
            end
          reg103 <= {$unsigned($signed(($signed(wire90) == $signed(reg100)))),
              $signed(({{reg98}} ~^ (~|wire85)))};
          reg104 <= (^~reg96);
        end
      else
        begin
          reg98 <= wire54;
        end
      reg105 <= (8'h9f);
      reg106 <= reg94[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg107 <= reg96[(4'hf):(4'h9)];
    end
  assign wire108 = (reg107[(4'h8):(4'h8)] ?
                       (+$unsigned($unsigned(reg95[(4'h8):(3'h4)]))) : wire87);
  assign wire109 = wire88;
endmodule

module module16
#(parameter param33 = (({(((8'hb0) || (8'h9e)) ? (^(8'ha2)) : ((8'haa) ? (8'hbb) : (8'h9c))), (^~((8'h9e) | (8'ha3)))} ? (~^(^~(&(8'h9f)))) : ((((8'hbc) < (7'h41)) << (~|(8'hb8))) ? (~|((8'hbc) ? (8'hab) : (8'h9c))) : {{(8'ha1), (8'ha8)}})) < ((({(8'hb9)} ? (^~(8'ha6)) : {(8'ha4), (8'hbc)}) ? {((8'ha1) ? (8'ha2) : (8'h9c)), ((7'h41) >= (8'hbf))} : (|((8'hae) ? (8'h9c) : (8'ha5)))) && (!(+(8'ha6))))), 
parameter param34 = (((((param33 * param33) ? (-(8'hb0)) : param33) + {param33, (param33 ? param33 : (8'haa))}) ? ((~&(param33 | param33)) >>> ((~|(8'ha7)) << (~^(8'hae)))) : param33) ? ((~^(((8'h9f) < (8'hac)) ? {param33} : param33)) ? (param33 || param33) : ((((8'hb7) <= param33) | param33) ^~ param33)) : ((|((8'ha6) ? ((8'ha4) ? param33 : param33) : (param33 + (8'ha0)))) >= (((param33 ? param33 : param33) ~^ (|param33)) ? (param33 ? (8'h9d) : (param33 <= param33)) : ((param33 >> param33) <<< (param33 ? param33 : (8'hb9)))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire20;
  input wire signed [(3'h6):(1'h0)] wire19;
  input wire signed [(3'h4):(1'h0)] wire18;
  input wire signed [(5'h13):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire32;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(3'h7):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(5'h12):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire21;
  assign y = {wire32,
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
                 (1'h0)};
  assign wire21 = wire19;
  assign wire22 = {$signed(wire18[(1'h1):(1'h1)]), wire20[(2'h3):(2'h3)]};
  assign wire23 = $unsigned($unsigned(wire19[(1'h0):(1'h0)]));
  assign wire24 = $unsigned(($unsigned($signed((wire18 ? wire21 : wire22))) ?
                      $unsigned(wire21[(3'h4):(2'h3)]) : ((wire17[(4'hc):(3'h7)] - wire23) & {wire21})));
  assign wire25 = (($unsigned({{wire23}}) || $signed($signed((wire23 > wire17)))) <<< {(8'ha2)});
  assign wire26 = $unsigned(wire20);
  assign wire27 = wire26[(3'h5):(1'h1)];
  assign wire28 = ($unsigned(($unsigned($unsigned(wire17)) ?
                      ($unsigned(wire23) ?
                          $unsigned(wire23) : {(8'hb6),
                              wire24}) : $unsigned($unsigned(wire17)))) > wire20);
  assign wire29 = $unsigned((|$signed((~wire19))));
  assign wire30 = wire21[(3'h4):(2'h2)];
  assign wire31 = (wire21[(2'h2):(1'h1)] ?
                      wire22 : {wire18[(1'h1):(1'h1)],
                          ($signed((wire29 <<< wire19)) ?
                              $unsigned(wire20[(1'h1):(1'h0)]) : $unsigned($signed(wire26)))});
  assign wire32 = $unsigned(($signed(wire23) > wire18));
endmodule

module module56  (y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire61;
  input wire [(4'hd):(1'h0)] wire60;
  input wire signed [(2'h3):(1'h0)] wire59;
  input wire signed [(5'h15):(1'h0)] wire58;
  input wire [(2'h2):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(5'h10):(1'h0)] wire83;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'hf):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire66;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(2'h3):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire signed [(4'ha):(1'h0)] wire62;
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'hc):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire62 = wire57;
  assign wire63 = (^~(|$unsigned((wire57 ? $unsigned(wire58) : wire59))));
  assign wire64 = $signed($unsigned((((wire62 > wire62) >> (|(8'hb9))) ?
                      $signed($signed(wire60)) : $unsigned($unsigned(wire63)))));
  assign wire65 = wire60;
  assign wire66 = $signed(wire60[(4'ha):(3'h7)]);
  assign wire67 = wire64;
  assign wire68 = (~^((&(!$unsigned(wire60))) ?
                      $signed((wire66[(2'h2):(2'h2)] > wire64[(2'h2):(1'h1)])) : $unsigned($signed((wire61 ^ wire64)))));
  assign wire69 = wire67;
  assign wire70 = {((((wire69 >>> (7'h43)) ^ wire58) <<< ((wire68 + wire59) ?
                              $signed((8'ha3)) : ((8'ha1) & wire65))) ?
                          ((~|$unsigned(wire64)) ^~ (wire67[(1'h1):(1'h1)] ?
                              (8'hb7) : (^~wire67))) : wire66),
                      wire60[(4'h8):(3'h4)]};
  assign wire71 = wire59[(2'h3):(2'h2)];
  assign wire72 = wire66;
  assign wire73 = (8'h9f);
  always
    @(posedge clk) begin
      reg74 <= ($unsigned((~^(wire59[(1'h1):(1'h0)] ?
              wire62[(3'h4):(1'h0)] : {wire62, (8'hb8)}))) ?
          $unsigned((((wire68 && wire73) - {wire58}) ?
              wire70 : $signed(wire60))) : $unsigned(wire67));
      reg75 <= $signed(((((wire63 >>> wire73) ? {wire61, wire59} : (8'ha3)) ?
              $unsigned($unsigned(wire64)) : wire63) ?
          $unsigned(({wire73} ? wire63 : wire61[(2'h2):(1'h1)])) : wire64));
      if ($unsigned($unsigned(wire62[(4'h8):(3'h5)])))
        begin
          reg76 <= wire59;
          if ((^wire57[(1'h1):(1'h0)]))
            begin
              reg77 <= ($signed((wire73 ?
                  {(~&wire57), $signed((8'ha5))} : ($unsigned(wire59) == {reg74,
                      (8'hb5)}))) ^~ reg76);
              reg78 <= $unsigned((-reg76));
              reg79 <= wire67[(2'h2):(1'h1)];
              reg80 <= ({($unsigned({wire64}) >= $unsigned(wire59))} ?
                  (!$signed(((wire63 ?
                      wire60 : (7'h41)) || (reg76 <<< wire70)))) : {($unsigned($unsigned(wire64)) ?
                          ((wire59 ? wire66 : reg75) ?
                              (~&wire73) : ((8'hbb) == reg75)) : reg74[(4'ha):(1'h1)]),
                      (reg78 <= $unsigned(wire64[(1'h1):(1'h0)]))});
            end
          else
            begin
              reg77 <= {{wire68[(1'h0):(1'h0)]},
                  ($unsigned({(reg74 >>> wire59), ((8'ha2) ? reg78 : wire67)}) ?
                      reg77 : wire65)};
            end
        end
      else
        begin
          if (((((~^$unsigned(wire64)) <= ($signed(wire61) + ((8'hb3) * wire59))) ^ $unsigned(reg80)) || (7'h42)))
            begin
              reg76 <= {wire65};
              reg77 <= (~|$signed((reg78[(2'h3):(1'h0)] <<< $signed($unsigned(wire60)))));
              reg78 <= $unsigned(wire60[(3'h5):(2'h2)]);
            end
          else
            begin
              reg76 <= (~&((wire70[(4'hb):(3'h7)] - (~(wire59 ?
                  wire58 : reg76))) << $signed(wire59)));
              reg77 <= (wire66[(2'h2):(1'h1)] >>> $unsigned($unsigned(reg80)));
              reg78 <= $signed((wire73 <<< {$signed({wire71})}));
              reg79 <= wire70;
            end
          reg80 <= ($signed(($unsigned($signed(reg79)) ?
              reg80[(4'ha):(2'h3)] : $signed($unsigned(wire67)))) << {(8'hb4)});
          reg81 <= {$unsigned((8'hbc)),
              (wire69 ?
                  (((~wire57) ? (wire59 ? wire67 : wire64) : wire57) ?
                      ((8'hbc) && reg78[(4'h8):(2'h3)]) : (((8'ha6) ^~ reg75) >> {wire67,
                          reg74})) : $signed((+$signed(wire68))))};
        end
      reg82 <= (+(({(!(8'haf)), (!(8'ha3))} ~^ ($unsigned(reg79) <<< (wire68 ?
          wire70 : wire72))) ^~ $unsigned(reg78)));
    end
  assign wire83 = ($unsigned(reg81) ?
                      {reg82[(4'ha):(4'ha)]} : ({(wire67 != (wire62 ?
                                  wire61 : wire63)),
                              $unsigned((reg74 != wire67))} ?
                          $unsigned($unsigned((wire72 ?
                              reg79 : reg82))) : (wire63[(2'h3):(1'h1)] ?
                              ((&reg74) ^ (+(8'haf))) : wire60[(4'hc):(1'h1)])));
  assign wire84 = (~^(wire70[(3'h6):(3'h6)] ?
                      (wire69[(4'hc):(3'h7)] ?
                          $unsigned((wire83 ?
                              wire64 : reg81)) : wire62) : $unsigned($signed(wire65[(4'ha):(2'h3)]))));
endmodule
