module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire3;
  wire signed [(5'h11):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire109;
  reg signed [(4'hd):(1'h0)] reg6 = (1'h0);
  assign y = {wire4, wire5, wire109, reg6, (1'h0)};
  assign wire4 = {{$unsigned((wire0[(3'h6):(3'h6)] ~^ (wire0 ^~ (8'ha5)))),
                         (wire0 ? wire3 : wire3[(1'h0):(1'h0)])},
                     $signed(wire1[(3'h5):(2'h3)])};
  assign wire5 = wire2;
  always
    @(posedge clk) begin
      reg6 <= wire3;
    end
  module7 #() modinst110 (wire109, clk, wire4, reg6, wire0, wire5);
endmodule

module module7
#(parameter param107 = {(((((8'hb3) >>> (8'hbc)) ? ((8'ha4) ? (8'hbe) : (8'hbb)) : ((8'ha8) ? (8'h9f) : (8'hb0))) >>> ((~^(8'ha5)) ^~ ((8'hbc) ? (8'hbb) : (7'h40)))) ? (8'haf) : ((^((8'h9f) ? (8'hb0) : (8'hbf))) && ((&(8'h9c)) ? {(8'h9c)} : (+(8'haa))))), (!(((~^(8'hab)) >= ((8'ha3) > (8'hbb))) ? (|((8'hba) >> (8'h9c))) : {((8'h9d) ? (8'h9f) : (8'h9e)), {(8'ha8)}}))}, 
parameter param108 = param107)
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire11;
  input wire [(3'h6):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire35;
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire55,
                 wire53,
                 wire40,
                 wire39,
                 wire35,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg38,
                 reg37,
                 reg12,
                 reg13,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg12 <= (8'hbd);
    end
  always
    @(posedge clk) begin
      reg13 <= wire9[(4'h9):(3'h5)];
      reg14 <= (~&wire8);
    end
  module15 #() modinst36 (.y(wire35), .wire19(reg14), .wire17(wire11), .wire16(reg13), .clk(clk), .wire18(reg12), .wire20(wire8));
  always
    @(posedge clk) begin
      reg37 <= $signed(((~(wire10 >> wire35[(2'h2):(2'h2)])) == $signed(((wire8 ?
              wire11 : reg13) ?
          {reg13} : (~^reg14)))));
      reg38 <= (|wire35);
    end
  assign wire39 = (((($unsigned(wire35) != $signed(reg14)) >>> wire11) ?
                          wire10[(3'h6):(2'h2)] : wire8[(1'h0):(1'h0)]) ?
                      (|((+(reg12 << wire11)) ?
                          reg13[(3'h5):(3'h4)] : (reg13 <<< {wire35}))) : wire10[(2'h2):(1'h1)]);
  assign wire40 = ($signed((!wire39)) ?
                      ($signed((-reg37)) <<< {((-wire39) >= {wire10,
                              wire11})}) : $unsigned((((^wire9) ^~ $signed((8'hb4))) ?
                          ((reg13 > (7'h44)) ?
                              wire8 : $signed((8'hb1))) : (&((8'h9f) <= reg13)))));
  module41 #() modinst54 (.wire43(reg14), .wire44(reg13), .wire45(wire9), .y(wire53), .clk(clk), .wire42(wire39));
  assign wire55 = reg37;
  always
    @(posedge clk) begin
      reg56 <= reg14;
    end
  always
    @(posedge clk) begin
      reg57 <= ($unsigned((!wire35[(4'he):(3'h6)])) + wire40[(3'h7):(3'h4)]);
      if ($unsigned((^{$unsigned((^~reg56)), wire8})))
        begin
          reg58 <= reg14[(5'h11):(5'h10)];
          reg59 <= $signed((|$unsigned($unsigned(((8'hae) ?
              wire35 : wire40)))));
          reg60 <= $unsigned(wire11);
          reg61 <= (&wire55);
        end
      else
        begin
          reg58 <= $unsigned(({(8'hab)} - (~^($signed(reg57) != (wire11 ?
              wire39 : reg37)))));
          reg59 <= $signed(($unsigned(wire55) > (8'hb5)));
          reg60 <= $unsigned(($unsigned($unsigned((+wire53))) << reg56[(4'hc):(2'h2)]));
          reg61 <= $unsigned(wire53[(3'h5):(2'h3)]);
        end
      reg62 <= (^$signed(reg60[(4'hb):(2'h3)]));
      reg63 <= $unsigned(reg38);
      reg64 <= (($unsigned((|reg62[(4'hc):(2'h3)])) ?
              $unsigned(wire53[(4'hc):(4'h9)]) : (~reg37[(3'h6):(3'h4)])) ?
          $unsigned((^~$unsigned((wire53 ?
              reg57 : reg13)))) : ((-(~|(+reg13))) ?
              (((reg61 ? reg37 : reg63) ?
                  $unsigned(reg37) : wire55[(1'h1):(1'h0)]) & reg37[(2'h2):(1'h1)]) : {$signed((reg58 << wire9))}));
    end
  module65 #() modinst103 (.wire67(wire53), .y(wire102), .clk(clk), .wire69(reg62), .wire66(wire9), .wire68(reg38));
  assign wire104 = reg57;
  assign wire105 = (reg60 & (($signed(reg56) * (wire35[(2'h2):(1'h0)] << wire102)) <= ({wire9,
                       (wire102 ? wire11 : reg60)} & $signed((wire11 ?
                       reg38 : reg61)))));
  assign wire106 = wire53;
endmodule

module module65  (y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'h14b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire69;
  input wire [(4'h8):(1'h0)] wire68;
  input wire signed [(3'h5):(1'h0)] wire67;
  input wire signed [(2'h3):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire101;
  wire signed [(4'he):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  wire signed [(3'h4):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire89;
  wire signed [(5'h10):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire86;
  wire [(5'h13):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire70;
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire94,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire72,
                 wire70,
                 reg97,
                 reg96,
                 reg95,
                 reg93,
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
                 reg71,
                 (1'h0)};
  assign wire70 = ((~(&$signed($unsigned(wire69)))) == $unsigned($signed($unsigned((wire69 - wire66)))));
  always
    @(posedge clk) begin
      reg71 <= $signed((8'hb8));
    end
  assign wire72 = ($signed((-wire70[(1'h0):(1'h0)])) ?
                      wire66 : wire70[(4'hb):(2'h2)]);
  always
    @(posedge clk) begin
      reg73 <= ((~&wire68[(3'h4):(1'h0)]) ?
          (!wire68) : $unsigned(((~|(8'hb1)) ?
              wire72[(3'h6):(1'h1)] : (^(^~(8'hbd))))));
      reg74 <= $signed($unsigned(({$unsigned((8'hb4)),
          $unsigned(reg71)} <<< wire68)));
      reg75 <= (~^(wire70 ^~ wire72[(3'h7):(3'h7)]));
      if ((((~^((wire72 ? reg73 : wire66) ? {(7'h40)} : (^~reg73))) ?
          $signed($unsigned($unsigned((8'hb2)))) : ($signed((wire70 & reg71)) ?
              $unsigned($unsigned(reg75)) : reg73)) && ($signed(reg75[(2'h3):(1'h1)]) ?
          wire67[(2'h2):(1'h0)] : (|(~^(wire69 ? reg75 : reg74))))))
        begin
          if ((((&(+(&(8'ha5)))) * wire68[(2'h3):(2'h3)]) ?
              $signed(($signed((reg75 ?
                  wire66 : reg71)) < wire69)) : ((wire68[(1'h0):(1'h0)] > ({(8'h9f)} ^ $unsigned((7'h44)))) ?
                  $unsigned(wire72) : {$unsigned({wire70, wire67})})))
            begin
              reg76 <= ($signed($unsigned(({wire66} ? (8'ha2) : {reg74}))) ?
                  (!(~$signed(reg73))) : reg73[(4'hf):(3'h7)]);
            end
          else
            begin
              reg76 <= $unsigned((wire70[(3'h7):(2'h3)] ?
                  wire69[(2'h3):(2'h3)] : $signed($signed((wire66 ?
                      reg73 : reg74)))));
            end
          reg77 <= (&reg74[(3'h6):(2'h3)]);
          reg78 <= wire72;
          if ((($signed($unsigned(reg75[(3'h4):(1'h0)])) ?
              wire72[(1'h1):(1'h1)] : $unsigned((wire67 ?
                  (wire66 || reg76) : (reg73 ?
                      (8'ha5) : wire67)))) >= ($unsigned(($unsigned(reg78) ?
                  wire68 : $signed(reg73))) ?
              $unsigned($signed(wire69)) : {(wire68 >> ((8'hb2) ?
                      wire72 : (7'h44))),
                  (((8'hb1) ? reg74 : reg74) ?
                      $unsigned(wire69) : (^~reg74))})))
            begin
              reg79 <= $unsigned(reg74[(1'h1):(1'h0)]);
            end
          else
            begin
              reg79 <= (^wire72);
              reg80 <= reg76;
              reg81 <= (($signed(reg78[(3'h6):(3'h5)]) ^ {$unsigned((~reg71)),
                      (~^(8'hb3))}) ?
                  (^~wire67) : (8'ha9));
              reg82 <= ((^~((^~$signed(reg71)) ?
                      $signed(wire68[(3'h5):(2'h2)]) : $signed(reg74[(3'h6):(3'h4)]))) ?
                  ($unsigned((|$unsigned(reg77))) >> (((~|wire69) ?
                          $unsigned(reg76) : reg71) ?
                      {(^~wire72), wire67} : {(8'hb2),
                          (~^reg75)})) : reg76[(2'h2):(2'h2)]);
              reg83 <= ((($unsigned($signed(reg80)) ? {{wire72}} : wire67) ?
                  ($signed($unsigned(reg75)) ?
                      ($unsigned((8'ha5)) | (wire72 + reg77)) : (&reg77)) : (reg79 ?
                      $signed($signed(reg80)) : wire69[(2'h3):(2'h2)])) > $unsigned((((wire69 <<< wire72) ?
                      reg77[(3'h4):(3'h4)] : wire68[(3'h4):(2'h2)]) ?
                  wire70[(3'h7):(3'h6)] : (reg81[(4'h9):(2'h3)] | $signed(reg73)))));
            end
        end
      else
        begin
          reg76 <= (((&((reg76 > reg81) + reg75)) <<< $signed({(-(8'hac)),
                  reg78})) ?
              reg77[(2'h2):(2'h2)] : wire72);
          reg77 <= (reg78[(1'h1):(1'h0)] ?
              wire67[(3'h5):(3'h5)] : $unsigned((reg80[(1'h1):(1'h0)] > wire70)));
          if (reg82)
            begin
              reg78 <= $unsigned((reg78[(1'h1):(1'h1)] | {(7'h44),
                  reg78[(1'h1):(1'h0)]}));
              reg79 <= (^~reg80[(3'h6):(3'h6)]);
            end
          else
            begin
              reg78 <= ($unsigned(reg74[(3'h5):(3'h5)]) ?
                  reg79 : ((~|((reg82 || reg76) ?
                          (wire72 ? wire69 : wire68) : ((8'haf) | reg71))) ?
                      wire70[(3'h4):(2'h2)] : (~$signed((wire72 ?
                          wire72 : reg77)))));
              reg79 <= (8'hac);
              reg80 <= ($signed((((~(8'ha9)) ?
                          $signed(wire67) : wire70[(4'h8):(3'h6)]) ?
                      ((~|reg80) ?
                          (wire69 ? reg76 : wire67) : (reg82 ?
                              wire66 : wire70)) : (wire72[(3'h6):(3'h4)] <<< (reg74 ?
                          reg77 : reg73)))) ?
                  $unsigned((~&reg77)) : $unsigned((($signed(reg74) ?
                          $unsigned(reg82) : reg81) ?
                      ($signed(reg83) ?
                          reg82[(3'h4):(2'h3)] : $unsigned(reg83)) : (8'hb3))));
              reg81 <= (~$unsigned(($signed((~&reg80)) ?
                  $signed(wire67[(1'h1):(1'h0)]) : ($unsigned(reg79) ?
                      reg79[(1'h1):(1'h0)] : (|reg83)))));
            end
        end
      reg84 <= (~^$unsigned((reg82 ? wire72 : (wire70 ? {reg76} : reg79))));
    end
  assign wire85 = {reg83[(1'h0):(1'h0)]};
  assign wire86 = reg81[(4'ha):(3'h4)];
  assign wire87 = wire69[(3'h5):(1'h0)];
  assign wire88 = $signed(wire66[(1'h0):(1'h0)]);
  assign wire89 = (-reg83[(2'h2):(1'h1)]);
  assign wire90 = reg71[(3'h4):(3'h4)];
  assign wire91 = (!$signed($unsigned($signed(reg75))));
  assign wire92 = reg74[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg93 <= $unsigned((reg75[(1'h0):(1'h0)] == ($signed($signed((8'hb2))) ^ ({wire72} <= (!wire88)))));
    end
  assign wire94 = $signed(((~((&(8'ha4)) < $signed(reg84))) ?
                      $signed(reg73) : (reg84[(1'h0):(1'h0)] ?
                          (~wire89) : ($signed(wire69) ~^ (+reg78)))));
  always
    @(posedge clk) begin
      reg95 <= reg80[(3'h5):(1'h0)];
      reg96 <= ((reg80[(1'h0):(1'h0)] ?
          wire86[(2'h2):(1'h1)] : reg71[(1'h1):(1'h1)]) & wire70[(4'h9):(1'h0)]);
      reg97 <= reg74[(3'h5):(2'h3)];
    end
  assign wire98 = (&($signed($signed($signed(reg71))) != reg82));
  assign wire99 = ($signed(wire87) ?
                      wire91 : (reg96 ?
                          (+((wire66 ?
                              wire70 : (8'hb6)) <<< (reg74 + reg97))) : ((((8'hb0) <= reg80) ?
                              $unsigned(wire92) : reg81[(4'hc):(4'hb)]) != $unsigned(reg80[(3'h6):(2'h3)]))));
  assign wire100 = (reg79[(2'h2):(1'h1)] ?
                       $unsigned({((|(8'hb5)) ?
                               (reg77 >= reg97) : (8'hb1))}) : ((!$unsigned(reg82[(3'h7):(3'h5)])) ?
                           wire69 : reg80));
  assign wire101 = (|((~|wire99[(3'h5):(2'h3)]) ?
                       $unsigned(reg78) : $signed($unsigned(wire90))));
endmodule

module module41
#(parameter param51 = (&((((~^(7'h43)) ? ((7'h44) ? (8'hb2) : (8'hb9)) : ((8'hab) <<< (7'h40))) << (&{(8'hbb)})) | ((~|((8'h9e) ? (8'ha0) : (8'hbd))) ? (((8'hb1) ? (8'ha8) : (8'ha1)) ? ((8'ha7) > (8'ha7)) : ((8'ha4) & (8'hac))) : (&((8'ha3) ? (8'ha2) : (8'hbd)))))), 
parameter param52 = (~|(param51 ? param51 : (8'ha2))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire45;
  input wire [(4'h9):(1'h0)] wire44;
  input wire [(2'h2):(1'h0)] wire43;
  input wire [(2'h3):(1'h0)] wire42;
  wire [(4'hf):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  assign y = {wire50, wire49, wire48, wire47, wire46, (1'h0)};
  assign wire46 = $unsigned((8'hbd));
  assign wire47 = $signed((~$unsigned(wire42[(2'h3):(1'h1)])));
  assign wire48 = ((&wire42[(1'h0):(1'h0)]) << $unsigned(({((8'ha2) & (8'hb2)),
                      (wire44 - wire42)} - {(!wire43)})));
  assign wire49 = {(~^(wire43 ? wire43 : wire48)),
                      (~|(((8'h9c) <= $unsigned(wire48)) ?
                          ($unsigned(wire44) ?
                              (wire42 ?
                                  wire47 : wire42) : (+(8'hb2))) : $unsigned($unsigned(wire42))))};
  assign wire50 = $signed(((wire45 ?
                      (!wire43[(2'h2):(1'h0)]) : wire48) ~^ wire44[(1'h0):(1'h0)]));
endmodule

module module15
#(parameter param34 = ((|((((8'ha7) ? (8'had) : (8'hb7)) ? (~(8'had)) : ((7'h41) <<< (8'hae))) + (-(~(8'hb5))))) ? (!((((8'ha9) << (8'ha2)) < {(8'hb4), (8'ha8)}) ? (((8'hb4) || (8'ha9)) ^ ((8'hb6) && (8'hb1))) : ({(7'h41), (7'h44)} ? ((8'hb2) ? (8'ha6) : (8'hb2)) : {(8'hac)}))) : ((8'hb1) || ((((8'hb1) <= (8'ha5)) + ((8'hb4) ? (8'h9f) : (8'hbb))) ? ({(7'h40), (8'ha0)} > (~|(8'had))) : (^~{(8'hba)})))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(5'h11):(1'h0)] reg21 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= $signed((wire20[(3'h6):(2'h2)] ?
          wire18 : $unsigned((wire17 | (wire20 <= wire17)))));
      reg22 <= {({wire19[(3'h4):(3'h4)]} <<< $unsigned(wire18[(2'h2):(2'h2)])),
          (!reg21[(2'h3):(1'h1)])};
      reg23 <= (((|(((8'h9e) ? (8'haf) : wire16) << (-reg21))) ?
          wire20[(2'h2):(2'h2)] : (wire20[(3'h5):(2'h2)] + (^~(wire17 << wire17)))) ^~ reg21[(1'h1):(1'h1)]);
      reg24 <= wire20;
      reg25 <= $unsigned($unsigned($signed((wire18[(3'h6):(1'h1)] && (!(8'haa))))));
    end
  assign wire26 = ($signed(reg22) ^ ($signed((wire18[(3'h5):(3'h4)] ?
                          {reg23} : reg22)) ?
                      (~($signed((8'ha0)) ?
                          ((8'hb9) ^~ wire19) : (reg25 ?
                              reg23 : (8'hb6)))) : wire16[(1'h1):(1'h1)]));
  assign wire27 = {reg21[(3'h5):(1'h0)]};
  assign wire28 = {wire18[(2'h3):(2'h2)],
                      $signed((~^((~|reg24) & (wire18 < wire27))))};
  assign wire29 = wire26[(4'hc):(2'h2)];
  assign wire30 = {$signed((|($signed((8'ha0)) ?
                          {reg22} : ((8'hb1) ? reg25 : wire18))))};
  assign wire31 = $signed($unsigned(reg25));
  assign wire32 = ((((wire19 >> $signed(wire16)) ?
                      (8'hb9) : {((8'ha8) ? reg24 : (8'h9c)),
                          wire16[(1'h1):(1'h0)]}) && wire30[(4'hd):(3'h5)]) | (8'hba));
  assign wire33 = $unsigned(wire18);
endmodule
